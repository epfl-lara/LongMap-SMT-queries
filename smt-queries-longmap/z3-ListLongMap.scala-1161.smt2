; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24470 () Bool)

(assert start!24470)

(declare-fun b!256099 () Bool)

(declare-fun b_free!6715 () Bool)

(declare-fun b_next!6715 () Bool)

(assert (=> b!256099 (= b_free!6715 (not b_next!6715))))

(declare-fun tp!23445 () Bool)

(declare-fun b_and!13747 () Bool)

(assert (=> b!256099 (= tp!23445 b_and!13747)))

(declare-fun b!256083 () Bool)

(declare-fun e!165987 () Bool)

(declare-fun e!165988 () Bool)

(assert (=> b!256083 (= e!165987 (not e!165988))))

(declare-fun res!125275 () Bool)

(assert (=> b!256083 (=> res!125275 e!165988)))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8417 0))(
  ( (V!8418 (val!3333 Int)) )
))
(declare-datatypes ((ValueCell!2945 0))(
  ( (ValueCellFull!2945 (v!5413 V!8417)) (EmptyCell!2945) )
))
(declare-datatypes ((array!12485 0))(
  ( (array!12486 (arr!5913 (Array (_ BitVec 32) ValueCell!2945)) (size!6261 (_ BitVec 32))) )
))
(declare-datatypes ((array!12487 0))(
  ( (array!12488 (arr!5914 (Array (_ BitVec 32) (_ BitVec 64))) (size!6262 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3790 0))(
  ( (LongMapFixedSize!3791 (defaultEntry!4728 Int) (mask!10999 (_ BitVec 32)) (extraKeys!4465 (_ BitVec 32)) (zeroValue!4569 V!8417) (minValue!4569 V!8417) (_size!1944 (_ BitVec 32)) (_keys!6889 array!12487) (_values!4711 array!12485) (_vacant!1944 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3790)

(assert (=> b!256083 (= res!125275 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6262 (_keys!6889 thiss!1504))) (bvsge (size!6262 (_keys!6889 thiss!1504)) #b01111111111111111111111111111111)))))

(declare-datatypes ((tuple2!4858 0))(
  ( (tuple2!4859 (_1!2440 (_ BitVec 64)) (_2!2440 V!8417)) )
))
(declare-datatypes ((List!3761 0))(
  ( (Nil!3758) (Cons!3757 (h!4419 tuple2!4858) (t!8807 List!3761)) )
))
(declare-datatypes ((ListLongMap!3761 0))(
  ( (ListLongMap!3762 (toList!1896 List!3761)) )
))
(declare-fun lt!128456 () ListLongMap!3761)

(declare-fun v!346 () V!8417)

(declare-fun lt!128459 () array!12487)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun +!688 (ListLongMap!3761 tuple2!4858) ListLongMap!3761)

(declare-fun getCurrentListMap!1405 (array!12487 array!12485 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 32) Int) ListLongMap!3761)

(assert (=> b!256083 (= (+!688 lt!128456 (tuple2!4859 key!932 v!346)) (getCurrentListMap!1405 lt!128459 (array!12486 (store (arr!5913 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6261 (_values!4711 thiss!1504))) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-datatypes ((Unit!7915 0))(
  ( (Unit!7916) )
))
(declare-fun lt!128461 () Unit!7915)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!99 (array!12487 array!12485 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 32) (_ BitVec 64) V!8417 Int) Unit!7915)

(assert (=> b!256083 (= lt!128461 (lemmaAddValidKeyToArrayThenAddPairToListMap!99 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) index!297 key!932 v!346 (defaultEntry!4728 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12487 (_ BitVec 32)) Bool)

(assert (=> b!256083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128459 (mask!10999 thiss!1504))))

(declare-fun lt!128458 () Unit!7915)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12487 (_ BitVec 32) (_ BitVec 32)) Unit!7915)

(assert (=> b!256083 (= lt!128458 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6889 thiss!1504) index!297 (mask!10999 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12487 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!256083 (= (arrayCountValidKeys!0 lt!128459 #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6889 thiss!1504) #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504)))))))

(declare-fun lt!128463 () Unit!7915)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12487 (_ BitVec 32) (_ BitVec 64)) Unit!7915)

(assert (=> b!256083 (= lt!128463 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6889 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3762 0))(
  ( (Nil!3759) (Cons!3758 (h!4420 (_ BitVec 64)) (t!8808 List!3762)) )
))
(declare-fun arrayNoDuplicates!0 (array!12487 (_ BitVec 32) List!3762) Bool)

(assert (=> b!256083 (arrayNoDuplicates!0 lt!128459 #b00000000000000000000000000000000 Nil!3759)))

(assert (=> b!256083 (= lt!128459 (array!12488 (store (arr!5914 (_keys!6889 thiss!1504)) index!297 key!932) (size!6262 (_keys!6889 thiss!1504))))))

(declare-fun lt!128457 () Unit!7915)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12487 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3762) Unit!7915)

(assert (=> b!256083 (= lt!128457 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6889 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3759))))

(declare-fun lt!128462 () Unit!7915)

(declare-fun e!165993 () Unit!7915)

(assert (=> b!256083 (= lt!128462 e!165993)))

(declare-fun c!43279 () Bool)

(declare-fun arrayContainsKey!0 (array!12487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!256083 (= c!43279 (arrayContainsKey!0 (_keys!6889 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256084 () Bool)

(declare-fun e!165996 () Bool)

(declare-fun e!165990 () Bool)

(declare-fun mapRes!11193 () Bool)

(assert (=> b!256084 (= e!165996 (and e!165990 mapRes!11193))))

(declare-fun condMapEmpty!11193 () Bool)

(declare-fun mapDefault!11193 () ValueCell!2945)

(assert (=> b!256084 (= condMapEmpty!11193 (= (arr!5913 (_values!4711 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2945)) mapDefault!11193)))))

(declare-fun b!256085 () Bool)

(declare-fun Unit!7917 () Unit!7915)

(assert (=> b!256085 (= e!165993 Unit!7917)))

(declare-fun b!256086 () Bool)

(declare-fun c!43278 () Bool)

(declare-datatypes ((SeekEntryResult!1159 0))(
  ( (MissingZero!1159 (index!6806 (_ BitVec 32))) (Found!1159 (index!6807 (_ BitVec 32))) (Intermediate!1159 (undefined!1971 Bool) (index!6808 (_ BitVec 32)) (x!24954 (_ BitVec 32))) (Undefined!1159) (MissingVacant!1159 (index!6809 (_ BitVec 32))) )
))
(declare-fun lt!128460 () SeekEntryResult!1159)

(get-info :version)

(assert (=> b!256086 (= c!43278 ((_ is MissingVacant!1159) lt!128460))))

(declare-fun e!166001 () Bool)

(declare-fun e!165989 () Bool)

(assert (=> b!256086 (= e!166001 e!165989)))

(declare-fun b!256087 () Bool)

(declare-fun res!125271 () Bool)

(declare-fun e!165998 () Bool)

(assert (=> b!256087 (=> (not res!125271) (not e!165998))))

(declare-fun call!24243 () Bool)

(assert (=> b!256087 (= res!125271 call!24243)))

(assert (=> b!256087 (= e!166001 e!165998)))

(declare-fun bm!24239 () Bool)

(declare-fun call!24242 () Bool)

(assert (=> bm!24239 (= call!24242 (arrayContainsKey!0 (_keys!6889 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256088 () Bool)

(declare-fun tp_is_empty!6577 () Bool)

(assert (=> b!256088 (= e!165990 tp_is_empty!6577)))

(declare-fun b!256089 () Bool)

(declare-fun e!165991 () Bool)

(assert (=> b!256089 (= e!165989 e!165991)))

(declare-fun res!125269 () Bool)

(assert (=> b!256089 (= res!125269 call!24243)))

(assert (=> b!256089 (=> (not res!125269) (not e!165991))))

(declare-fun res!125270 () Bool)

(declare-fun e!166000 () Bool)

(assert (=> start!24470 (=> (not res!125270) (not e!166000))))

(declare-fun valid!1485 (LongMapFixedSize!3790) Bool)

(assert (=> start!24470 (= res!125270 (valid!1485 thiss!1504))))

(assert (=> start!24470 e!166000))

(declare-fun e!165999 () Bool)

(assert (=> start!24470 e!165999))

(assert (=> start!24470 true))

(assert (=> start!24470 tp_is_empty!6577))

(declare-fun mapIsEmpty!11193 () Bool)

(assert (=> mapIsEmpty!11193 mapRes!11193))

(declare-fun b!256090 () Bool)

(declare-fun e!165997 () Bool)

(assert (=> b!256090 (= e!166000 e!165997)))

(declare-fun res!125268 () Bool)

(assert (=> b!256090 (=> (not res!125268) (not e!165997))))

(assert (=> b!256090 (= res!125268 (or (= lt!128460 (MissingZero!1159 index!297)) (= lt!128460 (MissingVacant!1159 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12487 (_ BitVec 32)) SeekEntryResult!1159)

(assert (=> b!256090 (= lt!128460 (seekEntryOrOpen!0 key!932 (_keys!6889 thiss!1504) (mask!10999 thiss!1504)))))

(declare-fun b!256091 () Bool)

(assert (=> b!256091 (= e!165989 ((_ is Undefined!1159) lt!128460))))

(declare-fun b!256092 () Bool)

(assert (=> b!256092 (= e!165998 (not call!24242))))

(declare-fun bm!24240 () Bool)

(declare-fun c!43280 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24240 (= call!24243 (inRange!0 (ite c!43280 (index!6806 lt!128460) (index!6809 lt!128460)) (mask!10999 thiss!1504)))))

(declare-fun b!256093 () Bool)

(declare-fun res!125273 () Bool)

(assert (=> b!256093 (= res!125273 (= (select (arr!5914 (_keys!6889 thiss!1504)) (index!6809 lt!128460)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256093 (=> (not res!125273) (not e!165991))))

(declare-fun b!256094 () Bool)

(declare-fun res!125267 () Bool)

(assert (=> b!256094 (=> (not res!125267) (not e!165998))))

(assert (=> b!256094 (= res!125267 (= (select (arr!5914 (_keys!6889 thiss!1504)) (index!6806 lt!128460)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256095 () Bool)

(assert (=> b!256095 (= e!165997 e!165987)))

(declare-fun res!125274 () Bool)

(assert (=> b!256095 (=> (not res!125274) (not e!165987))))

(assert (=> b!256095 (= res!125274 (inRange!0 index!297 (mask!10999 thiss!1504)))))

(declare-fun lt!128455 () Unit!7915)

(declare-fun e!165992 () Unit!7915)

(assert (=> b!256095 (= lt!128455 e!165992)))

(declare-fun c!43277 () Bool)

(declare-fun contains!1838 (ListLongMap!3761 (_ BitVec 64)) Bool)

(assert (=> b!256095 (= c!43277 (contains!1838 lt!128456 key!932))))

(assert (=> b!256095 (= lt!128456 (getCurrentListMap!1405 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun b!256096 () Bool)

(assert (=> b!256096 (= e!165988 (arrayContainsKey!0 lt!128459 key!932 index!297))))

(declare-fun b!256097 () Bool)

(declare-fun lt!128452 () Unit!7915)

(assert (=> b!256097 (= e!165992 lt!128452)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!425 (array!12487 array!12485 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 64) Int) Unit!7915)

(assert (=> b!256097 (= lt!128452 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!425 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 (defaultEntry!4728 thiss!1504)))))

(assert (=> b!256097 (= c!43280 ((_ is MissingZero!1159) lt!128460))))

(assert (=> b!256097 e!166001))

(declare-fun b!256098 () Bool)

(assert (=> b!256098 (= e!165991 (not call!24242))))

(declare-fun array_inv!3909 (array!12487) Bool)

(declare-fun array_inv!3910 (array!12485) Bool)

(assert (=> b!256099 (= e!165999 (and tp!23445 tp_is_empty!6577 (array_inv!3909 (_keys!6889 thiss!1504)) (array_inv!3910 (_values!4711 thiss!1504)) e!165996))))

(declare-fun mapNonEmpty!11193 () Bool)

(declare-fun tp!23444 () Bool)

(declare-fun e!165995 () Bool)

(assert (=> mapNonEmpty!11193 (= mapRes!11193 (and tp!23444 e!165995))))

(declare-fun mapRest!11193 () (Array (_ BitVec 32) ValueCell!2945))

(declare-fun mapValue!11193 () ValueCell!2945)

(declare-fun mapKey!11193 () (_ BitVec 32))

(assert (=> mapNonEmpty!11193 (= (arr!5913 (_values!4711 thiss!1504)) (store mapRest!11193 mapKey!11193 mapValue!11193))))

(declare-fun b!256100 () Bool)

(declare-fun res!125272 () Bool)

(assert (=> b!256100 (=> (not res!125272) (not e!166000))))

(assert (=> b!256100 (= res!125272 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!256101 () Bool)

(assert (=> b!256101 (= e!165995 tp_is_empty!6577)))

(declare-fun b!256102 () Bool)

(declare-fun Unit!7918 () Unit!7915)

(assert (=> b!256102 (= e!165992 Unit!7918)))

(declare-fun lt!128454 () Unit!7915)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!426 (array!12487 array!12485 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 64) Int) Unit!7915)

(assert (=> b!256102 (= lt!128454 (lemmaInListMapThenSeekEntryOrOpenFindsIt!426 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 (defaultEntry!4728 thiss!1504)))))

(assert (=> b!256102 false))

(declare-fun b!256103 () Bool)

(declare-fun Unit!7919 () Unit!7915)

(assert (=> b!256103 (= e!165993 Unit!7919)))

(declare-fun lt!128453 () Unit!7915)

(declare-fun lemmaArrayContainsKeyThenInListMap!236 (array!12487 array!12485 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 64) (_ BitVec 32) Int) Unit!7915)

(assert (=> b!256103 (= lt!128453 (lemmaArrayContainsKeyThenInListMap!236 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(assert (=> b!256103 false))

(assert (= (and start!24470 res!125270) b!256100))

(assert (= (and b!256100 res!125272) b!256090))

(assert (= (and b!256090 res!125268) b!256095))

(assert (= (and b!256095 c!43277) b!256102))

(assert (= (and b!256095 (not c!43277)) b!256097))

(assert (= (and b!256097 c!43280) b!256087))

(assert (= (and b!256097 (not c!43280)) b!256086))

(assert (= (and b!256087 res!125271) b!256094))

(assert (= (and b!256094 res!125267) b!256092))

(assert (= (and b!256086 c!43278) b!256089))

(assert (= (and b!256086 (not c!43278)) b!256091))

(assert (= (and b!256089 res!125269) b!256093))

(assert (= (and b!256093 res!125273) b!256098))

(assert (= (or b!256087 b!256089) bm!24240))

(assert (= (or b!256092 b!256098) bm!24239))

(assert (= (and b!256095 res!125274) b!256083))

(assert (= (and b!256083 c!43279) b!256103))

(assert (= (and b!256083 (not c!43279)) b!256085))

(assert (= (and b!256083 (not res!125275)) b!256096))

(assert (= (and b!256084 condMapEmpty!11193) mapIsEmpty!11193))

(assert (= (and b!256084 (not condMapEmpty!11193)) mapNonEmpty!11193))

(assert (= (and mapNonEmpty!11193 ((_ is ValueCellFull!2945) mapValue!11193)) b!256101))

(assert (= (and b!256084 ((_ is ValueCellFull!2945) mapDefault!11193)) b!256088))

(assert (= b!256099 b!256084))

(assert (= start!24470 b!256099))

(declare-fun m!271009 () Bool)

(assert (=> b!256093 m!271009))

(declare-fun m!271011 () Bool)

(assert (=> b!256095 m!271011))

(declare-fun m!271013 () Bool)

(assert (=> b!256095 m!271013))

(declare-fun m!271015 () Bool)

(assert (=> b!256095 m!271015))

(declare-fun m!271017 () Bool)

(assert (=> b!256094 m!271017))

(declare-fun m!271019 () Bool)

(assert (=> b!256102 m!271019))

(declare-fun m!271021 () Bool)

(assert (=> b!256083 m!271021))

(declare-fun m!271023 () Bool)

(assert (=> b!256083 m!271023))

(declare-fun m!271025 () Bool)

(assert (=> b!256083 m!271025))

(declare-fun m!271027 () Bool)

(assert (=> b!256083 m!271027))

(declare-fun m!271029 () Bool)

(assert (=> b!256083 m!271029))

(declare-fun m!271031 () Bool)

(assert (=> b!256083 m!271031))

(declare-fun m!271033 () Bool)

(assert (=> b!256083 m!271033))

(declare-fun m!271035 () Bool)

(assert (=> b!256083 m!271035))

(declare-fun m!271037 () Bool)

(assert (=> b!256083 m!271037))

(declare-fun m!271039 () Bool)

(assert (=> b!256083 m!271039))

(declare-fun m!271041 () Bool)

(assert (=> b!256083 m!271041))

(declare-fun m!271043 () Bool)

(assert (=> b!256083 m!271043))

(declare-fun m!271045 () Bool)

(assert (=> b!256083 m!271045))

(declare-fun m!271047 () Bool)

(assert (=> start!24470 m!271047))

(declare-fun m!271049 () Bool)

(assert (=> b!256103 m!271049))

(declare-fun m!271051 () Bool)

(assert (=> bm!24240 m!271051))

(declare-fun m!271053 () Bool)

(assert (=> b!256099 m!271053))

(declare-fun m!271055 () Bool)

(assert (=> b!256099 m!271055))

(declare-fun m!271057 () Bool)

(assert (=> mapNonEmpty!11193 m!271057))

(declare-fun m!271059 () Bool)

(assert (=> b!256097 m!271059))

(assert (=> bm!24239 m!271021))

(declare-fun m!271061 () Bool)

(assert (=> b!256090 m!271061))

(declare-fun m!271063 () Bool)

(assert (=> b!256096 m!271063))

(check-sat (not b!256102) (not bm!24239) (not b!256103) (not b_next!6715) (not bm!24240) b_and!13747 (not b!256095) (not start!24470) (not b!256090) (not b!256097) (not b!256083) (not b!256096) (not b!256099) (not mapNonEmpty!11193) tp_is_empty!6577)
(check-sat b_and!13747 (not b_next!6715))
(get-model)

(declare-fun d!61521 () Bool)

(declare-fun res!125334 () Bool)

(declare-fun e!166096 () Bool)

(assert (=> d!61521 (=> res!125334 e!166096)))

(assert (=> d!61521 (= res!125334 (= (select (arr!5914 lt!128459) index!297) key!932))))

(assert (=> d!61521 (= (arrayContainsKey!0 lt!128459 key!932 index!297) e!166096)))

(declare-fun b!256234 () Bool)

(declare-fun e!166097 () Bool)

(assert (=> b!256234 (= e!166096 e!166097)))

(declare-fun res!125335 () Bool)

(assert (=> b!256234 (=> (not res!125335) (not e!166097))))

(assert (=> b!256234 (= res!125335 (bvslt (bvadd index!297 #b00000000000000000000000000000001) (size!6262 lt!128459)))))

(declare-fun b!256235 () Bool)

(assert (=> b!256235 (= e!166097 (arrayContainsKey!0 lt!128459 key!932 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (= (and d!61521 (not res!125334)) b!256234))

(assert (= (and b!256234 res!125335) b!256235))

(declare-fun m!271177 () Bool)

(assert (=> d!61521 m!271177))

(declare-fun m!271179 () Bool)

(assert (=> b!256235 m!271179))

(assert (=> b!256096 d!61521))

(declare-fun b!256245 () Bool)

(declare-fun res!125344 () Bool)

(declare-fun e!166102 () Bool)

(assert (=> b!256245 (=> (not res!125344) (not e!166102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!256245 (= res!125344 (validKeyInArray!0 key!932))))

(declare-fun b!256244 () Bool)

(declare-fun res!125346 () Bool)

(assert (=> b!256244 (=> (not res!125346) (not e!166102))))

(assert (=> b!256244 (= res!125346 (not (validKeyInArray!0 (select (arr!5914 (_keys!6889 thiss!1504)) index!297))))))

(declare-fun b!256246 () Bool)

(assert (=> b!256246 (= e!166102 (bvslt (size!6262 (_keys!6889 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!256247 () Bool)

(declare-fun e!166103 () Bool)

(assert (=> b!256247 (= e!166103 (= (arrayCountValidKeys!0 (array!12488 (store (arr!5914 (_keys!6889 thiss!1504)) index!297 key!932) (size!6262 (_keys!6889 thiss!1504))) #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6889 thiss!1504) #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!61523 () Bool)

(assert (=> d!61523 e!166103))

(declare-fun res!125347 () Bool)

(assert (=> d!61523 (=> (not res!125347) (not e!166103))))

(assert (=> d!61523 (= res!125347 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6262 (_keys!6889 thiss!1504)))))))

(declare-fun lt!128538 () Unit!7915)

(declare-fun choose!1 (array!12487 (_ BitVec 32) (_ BitVec 64)) Unit!7915)

(assert (=> d!61523 (= lt!128538 (choose!1 (_keys!6889 thiss!1504) index!297 key!932))))

(assert (=> d!61523 e!166102))

(declare-fun res!125345 () Bool)

(assert (=> d!61523 (=> (not res!125345) (not e!166102))))

(assert (=> d!61523 (= res!125345 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6262 (_keys!6889 thiss!1504)))))))

(assert (=> d!61523 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6889 thiss!1504) index!297 key!932) lt!128538)))

(assert (= (and d!61523 res!125345) b!256244))

(assert (= (and b!256244 res!125346) b!256245))

(assert (= (and b!256245 res!125344) b!256246))

(assert (= (and d!61523 res!125347) b!256247))

(declare-fun m!271181 () Bool)

(assert (=> b!256245 m!271181))

(declare-fun m!271183 () Bool)

(assert (=> b!256244 m!271183))

(assert (=> b!256244 m!271183))

(declare-fun m!271185 () Bool)

(assert (=> b!256244 m!271185))

(assert (=> b!256247 m!271033))

(declare-fun m!271187 () Bool)

(assert (=> b!256247 m!271187))

(assert (=> b!256247 m!271035))

(declare-fun m!271189 () Bool)

(assert (=> d!61523 m!271189))

(assert (=> b!256083 d!61523))

(declare-fun b!256256 () Bool)

(declare-fun e!166108 () (_ BitVec 32))

(declare-fun call!24258 () (_ BitVec 32))

(assert (=> b!256256 (= e!166108 call!24258)))

(declare-fun bm!24255 () Bool)

(assert (=> bm!24255 (= call!24258 (arrayCountValidKeys!0 (_keys!6889 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6262 (_keys!6889 thiss!1504))))))

(declare-fun b!256257 () Bool)

(declare-fun e!166109 () (_ BitVec 32))

(assert (=> b!256257 (= e!166109 #b00000000000000000000000000000000)))

(declare-fun b!256258 () Bool)

(assert (=> b!256258 (= e!166109 e!166108)))

(declare-fun c!43310 () Bool)

(assert (=> b!256258 (= c!43310 (validKeyInArray!0 (select (arr!5914 (_keys!6889 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61525 () Bool)

(declare-fun lt!128541 () (_ BitVec 32))

(assert (=> d!61525 (and (bvsge lt!128541 #b00000000000000000000000000000000) (bvsle lt!128541 (bvsub (size!6262 (_keys!6889 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61525 (= lt!128541 e!166109)))

(declare-fun c!43309 () Bool)

(assert (=> d!61525 (= c!43309 (bvsge #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))))))

(assert (=> d!61525 (and (bvsle #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6262 (_keys!6889 thiss!1504)) (size!6262 (_keys!6889 thiss!1504))))))

(assert (=> d!61525 (= (arrayCountValidKeys!0 (_keys!6889 thiss!1504) #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))) lt!128541)))

(declare-fun b!256259 () Bool)

(assert (=> b!256259 (= e!166108 (bvadd #b00000000000000000000000000000001 call!24258))))

(assert (= (and d!61525 c!43309) b!256257))

(assert (= (and d!61525 (not c!43309)) b!256258))

(assert (= (and b!256258 c!43310) b!256259))

(assert (= (and b!256258 (not c!43310)) b!256256))

(assert (= (or b!256259 b!256256) bm!24255))

(declare-fun m!271191 () Bool)

(assert (=> bm!24255 m!271191))

(declare-fun m!271193 () Bool)

(assert (=> b!256258 m!271193))

(assert (=> b!256258 m!271193))

(declare-fun m!271195 () Bool)

(assert (=> b!256258 m!271195))

(assert (=> b!256083 d!61525))

(declare-fun d!61527 () Bool)

(declare-fun e!166112 () Bool)

(assert (=> d!61527 e!166112))

(declare-fun res!125350 () Bool)

(assert (=> d!61527 (=> (not res!125350) (not e!166112))))

(assert (=> d!61527 (= res!125350 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6262 (_keys!6889 thiss!1504))) (bvslt index!297 (size!6261 (_values!4711 thiss!1504)))))))

(declare-fun lt!128544 () Unit!7915)

(declare-fun choose!1235 (array!12487 array!12485 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 32) (_ BitVec 64) V!8417 Int) Unit!7915)

(assert (=> d!61527 (= lt!128544 (choose!1235 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) index!297 key!932 v!346 (defaultEntry!4728 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61527 (validMask!0 (mask!10999 thiss!1504))))

(assert (=> d!61527 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!99 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) index!297 key!932 v!346 (defaultEntry!4728 thiss!1504)) lt!128544)))

(declare-fun b!256262 () Bool)

(assert (=> b!256262 (= e!166112 (= (+!688 (getCurrentListMap!1405 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)) (tuple2!4859 key!932 v!346)) (getCurrentListMap!1405 (array!12488 (store (arr!5914 (_keys!6889 thiss!1504)) index!297 key!932) (size!6262 (_keys!6889 thiss!1504))) (array!12486 (store (arr!5913 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6261 (_values!4711 thiss!1504))) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504))))))

(assert (= (and d!61527 res!125350) b!256262))

(declare-fun m!271197 () Bool)

(assert (=> d!61527 m!271197))

(declare-fun m!271199 () Bool)

(assert (=> d!61527 m!271199))

(assert (=> b!256262 m!271033))

(assert (=> b!256262 m!271015))

(declare-fun m!271201 () Bool)

(assert (=> b!256262 m!271201))

(assert (=> b!256262 m!271015))

(assert (=> b!256262 m!271045))

(declare-fun m!271203 () Bool)

(assert (=> b!256262 m!271203))

(assert (=> b!256083 d!61527))

(declare-fun d!61529 () Bool)

(declare-fun e!166115 () Bool)

(assert (=> d!61529 e!166115))

(declare-fun res!125355 () Bool)

(assert (=> d!61529 (=> (not res!125355) (not e!166115))))

(declare-fun lt!128554 () ListLongMap!3761)

(assert (=> d!61529 (= res!125355 (contains!1838 lt!128554 (_1!2440 (tuple2!4859 key!932 v!346))))))

(declare-fun lt!128555 () List!3761)

(assert (=> d!61529 (= lt!128554 (ListLongMap!3762 lt!128555))))

(declare-fun lt!128553 () Unit!7915)

(declare-fun lt!128556 () Unit!7915)

(assert (=> d!61529 (= lt!128553 lt!128556)))

(declare-datatypes ((Option!313 0))(
  ( (Some!312 (v!5418 V!8417)) (None!311) )
))
(declare-fun getValueByKey!307 (List!3761 (_ BitVec 64)) Option!313)

(assert (=> d!61529 (= (getValueByKey!307 lt!128555 (_1!2440 (tuple2!4859 key!932 v!346))) (Some!312 (_2!2440 (tuple2!4859 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!166 (List!3761 (_ BitVec 64) V!8417) Unit!7915)

(assert (=> d!61529 (= lt!128556 (lemmaContainsTupThenGetReturnValue!166 lt!128555 (_1!2440 (tuple2!4859 key!932 v!346)) (_2!2440 (tuple2!4859 key!932 v!346))))))

(declare-fun insertStrictlySorted!169 (List!3761 (_ BitVec 64) V!8417) List!3761)

(assert (=> d!61529 (= lt!128555 (insertStrictlySorted!169 (toList!1896 lt!128456) (_1!2440 (tuple2!4859 key!932 v!346)) (_2!2440 (tuple2!4859 key!932 v!346))))))

(assert (=> d!61529 (= (+!688 lt!128456 (tuple2!4859 key!932 v!346)) lt!128554)))

(declare-fun b!256267 () Bool)

(declare-fun res!125356 () Bool)

(assert (=> b!256267 (=> (not res!125356) (not e!166115))))

(assert (=> b!256267 (= res!125356 (= (getValueByKey!307 (toList!1896 lt!128554) (_1!2440 (tuple2!4859 key!932 v!346))) (Some!312 (_2!2440 (tuple2!4859 key!932 v!346)))))))

(declare-fun b!256268 () Bool)

(declare-fun contains!1841 (List!3761 tuple2!4858) Bool)

(assert (=> b!256268 (= e!166115 (contains!1841 (toList!1896 lt!128554) (tuple2!4859 key!932 v!346)))))

(assert (= (and d!61529 res!125355) b!256267))

(assert (= (and b!256267 res!125356) b!256268))

(declare-fun m!271205 () Bool)

(assert (=> d!61529 m!271205))

(declare-fun m!271207 () Bool)

(assert (=> d!61529 m!271207))

(declare-fun m!271209 () Bool)

(assert (=> d!61529 m!271209))

(declare-fun m!271211 () Bool)

(assert (=> d!61529 m!271211))

(declare-fun m!271213 () Bool)

(assert (=> b!256267 m!271213))

(declare-fun m!271215 () Bool)

(assert (=> b!256268 m!271215))

(assert (=> b!256083 d!61529))

(declare-fun b!256277 () Bool)

(declare-fun e!166123 () Bool)

(declare-fun call!24261 () Bool)

(assert (=> b!256277 (= e!166123 call!24261)))

(declare-fun d!61531 () Bool)

(declare-fun res!125361 () Bool)

(declare-fun e!166124 () Bool)

(assert (=> d!61531 (=> res!125361 e!166124)))

(assert (=> d!61531 (= res!125361 (bvsge #b00000000000000000000000000000000 (size!6262 lt!128459)))))

(assert (=> d!61531 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128459 (mask!10999 thiss!1504)) e!166124)))

(declare-fun b!256278 () Bool)

(declare-fun e!166122 () Bool)

(assert (=> b!256278 (= e!166123 e!166122)))

(declare-fun lt!128565 () (_ BitVec 64))

(assert (=> b!256278 (= lt!128565 (select (arr!5914 lt!128459) #b00000000000000000000000000000000))))

(declare-fun lt!128563 () Unit!7915)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12487 (_ BitVec 64) (_ BitVec 32)) Unit!7915)

(assert (=> b!256278 (= lt!128563 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128459 lt!128565 #b00000000000000000000000000000000))))

(assert (=> b!256278 (arrayContainsKey!0 lt!128459 lt!128565 #b00000000000000000000000000000000)))

(declare-fun lt!128564 () Unit!7915)

(assert (=> b!256278 (= lt!128564 lt!128563)))

(declare-fun res!125362 () Bool)

(assert (=> b!256278 (= res!125362 (= (seekEntryOrOpen!0 (select (arr!5914 lt!128459) #b00000000000000000000000000000000) lt!128459 (mask!10999 thiss!1504)) (Found!1159 #b00000000000000000000000000000000)))))

(assert (=> b!256278 (=> (not res!125362) (not e!166122))))

(declare-fun b!256279 () Bool)

(assert (=> b!256279 (= e!166122 call!24261)))

(declare-fun bm!24258 () Bool)

(assert (=> bm!24258 (= call!24261 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!128459 (mask!10999 thiss!1504)))))

(declare-fun b!256280 () Bool)

(assert (=> b!256280 (= e!166124 e!166123)))

(declare-fun c!43313 () Bool)

(assert (=> b!256280 (= c!43313 (validKeyInArray!0 (select (arr!5914 lt!128459) #b00000000000000000000000000000000)))))

(assert (= (and d!61531 (not res!125361)) b!256280))

(assert (= (and b!256280 c!43313) b!256278))

(assert (= (and b!256280 (not c!43313)) b!256277))

(assert (= (and b!256278 res!125362) b!256279))

(assert (= (or b!256279 b!256277) bm!24258))

(declare-fun m!271217 () Bool)

(assert (=> b!256278 m!271217))

(declare-fun m!271219 () Bool)

(assert (=> b!256278 m!271219))

(declare-fun m!271221 () Bool)

(assert (=> b!256278 m!271221))

(assert (=> b!256278 m!271217))

(declare-fun m!271223 () Bool)

(assert (=> b!256278 m!271223))

(declare-fun m!271225 () Bool)

(assert (=> bm!24258 m!271225))

(assert (=> b!256280 m!271217))

(assert (=> b!256280 m!271217))

(declare-fun m!271227 () Bool)

(assert (=> b!256280 m!271227))

(assert (=> b!256083 d!61531))

(declare-fun b!256291 () Bool)

(declare-fun e!166134 () Bool)

(declare-fun e!166136 () Bool)

(assert (=> b!256291 (= e!166134 e!166136)))

(declare-fun c!43316 () Bool)

(assert (=> b!256291 (= c!43316 (validKeyInArray!0 (select (arr!5914 lt!128459) #b00000000000000000000000000000000)))))

(declare-fun bm!24261 () Bool)

(declare-fun call!24264 () Bool)

(assert (=> bm!24261 (= call!24264 (arrayNoDuplicates!0 lt!128459 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43316 (Cons!3758 (select (arr!5914 lt!128459) #b00000000000000000000000000000000) Nil!3759) Nil!3759)))))

(declare-fun b!256292 () Bool)

(declare-fun e!166135 () Bool)

(assert (=> b!256292 (= e!166135 e!166134)))

(declare-fun res!125370 () Bool)

(assert (=> b!256292 (=> (not res!125370) (not e!166134))))

(declare-fun e!166133 () Bool)

(assert (=> b!256292 (= res!125370 (not e!166133))))

(declare-fun res!125371 () Bool)

(assert (=> b!256292 (=> (not res!125371) (not e!166133))))

(assert (=> b!256292 (= res!125371 (validKeyInArray!0 (select (arr!5914 lt!128459) #b00000000000000000000000000000000)))))

(declare-fun b!256294 () Bool)

(assert (=> b!256294 (= e!166136 call!24264)))

(declare-fun b!256295 () Bool)

(assert (=> b!256295 (= e!166136 call!24264)))

(declare-fun d!61533 () Bool)

(declare-fun res!125369 () Bool)

(assert (=> d!61533 (=> res!125369 e!166135)))

(assert (=> d!61533 (= res!125369 (bvsge #b00000000000000000000000000000000 (size!6262 lt!128459)))))

(assert (=> d!61533 (= (arrayNoDuplicates!0 lt!128459 #b00000000000000000000000000000000 Nil!3759) e!166135)))

(declare-fun b!256293 () Bool)

(declare-fun contains!1842 (List!3762 (_ BitVec 64)) Bool)

(assert (=> b!256293 (= e!166133 (contains!1842 Nil!3759 (select (arr!5914 lt!128459) #b00000000000000000000000000000000)))))

(assert (= (and d!61533 (not res!125369)) b!256292))

(assert (= (and b!256292 res!125371) b!256293))

(assert (= (and b!256292 res!125370) b!256291))

(assert (= (and b!256291 c!43316) b!256295))

(assert (= (and b!256291 (not c!43316)) b!256294))

(assert (= (or b!256295 b!256294) bm!24261))

(assert (=> b!256291 m!271217))

(assert (=> b!256291 m!271217))

(assert (=> b!256291 m!271227))

(assert (=> bm!24261 m!271217))

(declare-fun m!271229 () Bool)

(assert (=> bm!24261 m!271229))

(assert (=> b!256292 m!271217))

(assert (=> b!256292 m!271217))

(assert (=> b!256292 m!271227))

(assert (=> b!256293 m!271217))

(assert (=> b!256293 m!271217))

(declare-fun m!271231 () Bool)

(assert (=> b!256293 m!271231))

(assert (=> b!256083 d!61533))

(declare-fun b!256338 () Bool)

(declare-fun e!166175 () Bool)

(declare-fun call!24282 () Bool)

(assert (=> b!256338 (= e!166175 (not call!24282))))

(declare-fun b!256339 () Bool)

(declare-fun e!166173 () Unit!7915)

(declare-fun Unit!7926 () Unit!7915)

(assert (=> b!256339 (= e!166173 Unit!7926)))

(declare-fun b!256340 () Bool)

(declare-fun e!166168 () ListLongMap!3761)

(declare-fun call!24280 () ListLongMap!3761)

(assert (=> b!256340 (= e!166168 (+!688 call!24280 (tuple2!4859 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4569 thiss!1504))))))

(declare-fun b!256341 () Bool)

(declare-fun e!166174 () Bool)

(declare-fun call!24285 () Bool)

(assert (=> b!256341 (= e!166174 (not call!24285))))

(declare-fun b!256342 () Bool)

(declare-fun e!166166 () ListLongMap!3761)

(declare-fun call!24283 () ListLongMap!3761)

(assert (=> b!256342 (= e!166166 call!24283)))

(declare-fun e!166167 () Bool)

(declare-fun b!256343 () Bool)

(declare-fun lt!128629 () ListLongMap!3761)

(declare-fun apply!251 (ListLongMap!3761 (_ BitVec 64)) V!8417)

(declare-fun get!3038 (ValueCell!2945 V!8417) V!8417)

(declare-fun dynLambda!585 (Int (_ BitVec 64)) V!8417)

(assert (=> b!256343 (= e!166167 (= (apply!251 lt!128629 (select (arr!5914 lt!128459) #b00000000000000000000000000000000)) (get!3038 (select (arr!5913 (array!12486 (store (arr!5913 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6261 (_values!4711 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4728 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256343 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6261 (array!12486 (store (arr!5913 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6261 (_values!4711 thiss!1504))))))))

(assert (=> b!256343 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6262 lt!128459)))))

(declare-fun b!256344 () Bool)

(declare-fun call!24284 () ListLongMap!3761)

(assert (=> b!256344 (= e!166166 call!24284)))

(declare-fun bm!24276 () Bool)

(assert (=> bm!24276 (= call!24285 (contains!1838 lt!128629 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256345 () Bool)

(declare-fun e!166172 () ListLongMap!3761)

(assert (=> b!256345 (= e!166172 call!24284)))

(declare-fun d!61535 () Bool)

(declare-fun e!166171 () Bool)

(assert (=> d!61535 e!166171))

(declare-fun res!125395 () Bool)

(assert (=> d!61535 (=> (not res!125395) (not e!166171))))

(assert (=> d!61535 (= res!125395 (or (bvsge #b00000000000000000000000000000000 (size!6262 lt!128459)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6262 lt!128459)))))))

(declare-fun lt!128620 () ListLongMap!3761)

(assert (=> d!61535 (= lt!128629 lt!128620)))

(declare-fun lt!128610 () Unit!7915)

(assert (=> d!61535 (= lt!128610 e!166173)))

(declare-fun c!43332 () Bool)

(declare-fun e!166163 () Bool)

(assert (=> d!61535 (= c!43332 e!166163)))

(declare-fun res!125393 () Bool)

(assert (=> d!61535 (=> (not res!125393) (not e!166163))))

(assert (=> d!61535 (= res!125393 (bvslt #b00000000000000000000000000000000 (size!6262 lt!128459)))))

(assert (=> d!61535 (= lt!128620 e!166168)))

(declare-fun c!43329 () Bool)

(assert (=> d!61535 (= c!43329 (and (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61535 (validMask!0 (mask!10999 thiss!1504))))

(assert (=> d!61535 (= (getCurrentListMap!1405 lt!128459 (array!12486 (store (arr!5913 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6261 (_values!4711 thiss!1504))) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)) lt!128629)))

(declare-fun bm!24277 () Bool)

(declare-fun call!24279 () ListLongMap!3761)

(declare-fun call!24281 () ListLongMap!3761)

(assert (=> bm!24277 (= call!24279 call!24281)))

(declare-fun b!256346 () Bool)

(assert (=> b!256346 (= e!166168 e!166172)))

(declare-fun c!43333 () Bool)

(assert (=> b!256346 (= c!43333 (and (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24278 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!567 (array!12487 array!12485 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 32) Int) ListLongMap!3761)

(assert (=> bm!24278 (= call!24281 (getCurrentListMapNoExtraKeys!567 lt!128459 (array!12486 (store (arr!5913 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6261 (_values!4711 thiss!1504))) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun b!256347 () Bool)

(assert (=> b!256347 (= e!166163 (validKeyInArray!0 (select (arr!5914 lt!128459) #b00000000000000000000000000000000)))))

(declare-fun bm!24279 () Bool)

(assert (=> bm!24279 (= call!24283 call!24279)))

(declare-fun b!256348 () Bool)

(declare-fun c!43334 () Bool)

(assert (=> b!256348 (= c!43334 (and (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!256348 (= e!166172 e!166166)))

(declare-fun b!256349 () Bool)

(declare-fun e!166164 () Bool)

(assert (=> b!256349 (= e!166164 e!166167)))

(declare-fun res!125390 () Bool)

(assert (=> b!256349 (=> (not res!125390) (not e!166167))))

(assert (=> b!256349 (= res!125390 (contains!1838 lt!128629 (select (arr!5914 lt!128459) #b00000000000000000000000000000000)))))

(assert (=> b!256349 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6262 lt!128459)))))

(declare-fun b!256350 () Bool)

(declare-fun e!166170 () Bool)

(assert (=> b!256350 (= e!166170 (validKeyInArray!0 (select (arr!5914 lt!128459) #b00000000000000000000000000000000)))))

(declare-fun b!256351 () Bool)

(declare-fun e!166165 () Bool)

(assert (=> b!256351 (= e!166165 (= (apply!251 lt!128629 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4569 thiss!1504)))))

(declare-fun b!256352 () Bool)

(declare-fun lt!128618 () Unit!7915)

(assert (=> b!256352 (= e!166173 lt!128618)))

(declare-fun lt!128612 () ListLongMap!3761)

(assert (=> b!256352 (= lt!128612 (getCurrentListMapNoExtraKeys!567 lt!128459 (array!12486 (store (arr!5913 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6261 (_values!4711 thiss!1504))) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128622 () (_ BitVec 64))

(assert (=> b!256352 (= lt!128622 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128630 () (_ BitVec 64))

(assert (=> b!256352 (= lt!128630 (select (arr!5914 lt!128459) #b00000000000000000000000000000000))))

(declare-fun lt!128611 () Unit!7915)

(declare-fun addStillContains!227 (ListLongMap!3761 (_ BitVec 64) V!8417 (_ BitVec 64)) Unit!7915)

(assert (=> b!256352 (= lt!128611 (addStillContains!227 lt!128612 lt!128622 (zeroValue!4569 thiss!1504) lt!128630))))

(assert (=> b!256352 (contains!1838 (+!688 lt!128612 (tuple2!4859 lt!128622 (zeroValue!4569 thiss!1504))) lt!128630)))

(declare-fun lt!128614 () Unit!7915)

(assert (=> b!256352 (= lt!128614 lt!128611)))

(declare-fun lt!128621 () ListLongMap!3761)

(assert (=> b!256352 (= lt!128621 (getCurrentListMapNoExtraKeys!567 lt!128459 (array!12486 (store (arr!5913 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6261 (_values!4711 thiss!1504))) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128626 () (_ BitVec 64))

(assert (=> b!256352 (= lt!128626 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128619 () (_ BitVec 64))

(assert (=> b!256352 (= lt!128619 (select (arr!5914 lt!128459) #b00000000000000000000000000000000))))

(declare-fun lt!128613 () Unit!7915)

(declare-fun addApplyDifferent!227 (ListLongMap!3761 (_ BitVec 64) V!8417 (_ BitVec 64)) Unit!7915)

(assert (=> b!256352 (= lt!128613 (addApplyDifferent!227 lt!128621 lt!128626 (minValue!4569 thiss!1504) lt!128619))))

(assert (=> b!256352 (= (apply!251 (+!688 lt!128621 (tuple2!4859 lt!128626 (minValue!4569 thiss!1504))) lt!128619) (apply!251 lt!128621 lt!128619))))

(declare-fun lt!128628 () Unit!7915)

(assert (=> b!256352 (= lt!128628 lt!128613)))

(declare-fun lt!128615 () ListLongMap!3761)

(assert (=> b!256352 (= lt!128615 (getCurrentListMapNoExtraKeys!567 lt!128459 (array!12486 (store (arr!5913 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6261 (_values!4711 thiss!1504))) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128624 () (_ BitVec 64))

(assert (=> b!256352 (= lt!128624 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128617 () (_ BitVec 64))

(assert (=> b!256352 (= lt!128617 (select (arr!5914 lt!128459) #b00000000000000000000000000000000))))

(declare-fun lt!128625 () Unit!7915)

(assert (=> b!256352 (= lt!128625 (addApplyDifferent!227 lt!128615 lt!128624 (zeroValue!4569 thiss!1504) lt!128617))))

(assert (=> b!256352 (= (apply!251 (+!688 lt!128615 (tuple2!4859 lt!128624 (zeroValue!4569 thiss!1504))) lt!128617) (apply!251 lt!128615 lt!128617))))

(declare-fun lt!128616 () Unit!7915)

(assert (=> b!256352 (= lt!128616 lt!128625)))

(declare-fun lt!128631 () ListLongMap!3761)

(assert (=> b!256352 (= lt!128631 (getCurrentListMapNoExtraKeys!567 lt!128459 (array!12486 (store (arr!5913 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6261 (_values!4711 thiss!1504))) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128627 () (_ BitVec 64))

(assert (=> b!256352 (= lt!128627 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128623 () (_ BitVec 64))

(assert (=> b!256352 (= lt!128623 (select (arr!5914 lt!128459) #b00000000000000000000000000000000))))

(assert (=> b!256352 (= lt!128618 (addApplyDifferent!227 lt!128631 lt!128627 (minValue!4569 thiss!1504) lt!128623))))

(assert (=> b!256352 (= (apply!251 (+!688 lt!128631 (tuple2!4859 lt!128627 (minValue!4569 thiss!1504))) lt!128623) (apply!251 lt!128631 lt!128623))))

(declare-fun bm!24280 () Bool)

(assert (=> bm!24280 (= call!24284 call!24280)))

(declare-fun b!256353 () Bool)

(declare-fun res!125392 () Bool)

(assert (=> b!256353 (=> (not res!125392) (not e!166171))))

(assert (=> b!256353 (= res!125392 e!166175)))

(declare-fun c!43330 () Bool)

(assert (=> b!256353 (= c!43330 (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24281 () Bool)

(assert (=> bm!24281 (= call!24280 (+!688 (ite c!43329 call!24281 (ite c!43333 call!24279 call!24283)) (ite (or c!43329 c!43333) (tuple2!4859 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4569 thiss!1504)) (tuple2!4859 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4569 thiss!1504)))))))

(declare-fun b!256354 () Bool)

(assert (=> b!256354 (= e!166174 e!166165)))

(declare-fun res!125391 () Bool)

(assert (=> b!256354 (= res!125391 call!24285)))

(assert (=> b!256354 (=> (not res!125391) (not e!166165))))

(declare-fun b!256355 () Bool)

(declare-fun e!166169 () Bool)

(assert (=> b!256355 (= e!166175 e!166169)))

(declare-fun res!125398 () Bool)

(assert (=> b!256355 (= res!125398 call!24282)))

(assert (=> b!256355 (=> (not res!125398) (not e!166169))))

(declare-fun b!256356 () Bool)

(declare-fun res!125394 () Bool)

(assert (=> b!256356 (=> (not res!125394) (not e!166171))))

(assert (=> b!256356 (= res!125394 e!166164)))

(declare-fun res!125397 () Bool)

(assert (=> b!256356 (=> res!125397 e!166164)))

(assert (=> b!256356 (= res!125397 (not e!166170))))

(declare-fun res!125396 () Bool)

(assert (=> b!256356 (=> (not res!125396) (not e!166170))))

(assert (=> b!256356 (= res!125396 (bvslt #b00000000000000000000000000000000 (size!6262 lt!128459)))))

(declare-fun b!256357 () Bool)

(assert (=> b!256357 (= e!166169 (= (apply!251 lt!128629 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4569 thiss!1504)))))

(declare-fun bm!24282 () Bool)

(assert (=> bm!24282 (= call!24282 (contains!1838 lt!128629 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256358 () Bool)

(assert (=> b!256358 (= e!166171 e!166174)))

(declare-fun c!43331 () Bool)

(assert (=> b!256358 (= c!43331 (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61535 c!43329) b!256340))

(assert (= (and d!61535 (not c!43329)) b!256346))

(assert (= (and b!256346 c!43333) b!256345))

(assert (= (and b!256346 (not c!43333)) b!256348))

(assert (= (and b!256348 c!43334) b!256344))

(assert (= (and b!256348 (not c!43334)) b!256342))

(assert (= (or b!256344 b!256342) bm!24279))

(assert (= (or b!256345 bm!24279) bm!24277))

(assert (= (or b!256345 b!256344) bm!24280))

(assert (= (or b!256340 bm!24277) bm!24278))

(assert (= (or b!256340 bm!24280) bm!24281))

(assert (= (and d!61535 res!125393) b!256347))

(assert (= (and d!61535 c!43332) b!256352))

(assert (= (and d!61535 (not c!43332)) b!256339))

(assert (= (and d!61535 res!125395) b!256356))

(assert (= (and b!256356 res!125396) b!256350))

(assert (= (and b!256356 (not res!125397)) b!256349))

(assert (= (and b!256349 res!125390) b!256343))

(assert (= (and b!256356 res!125394) b!256353))

(assert (= (and b!256353 c!43330) b!256355))

(assert (= (and b!256353 (not c!43330)) b!256338))

(assert (= (and b!256355 res!125398) b!256357))

(assert (= (or b!256355 b!256338) bm!24282))

(assert (= (and b!256353 res!125392) b!256358))

(assert (= (and b!256358 c!43331) b!256354))

(assert (= (and b!256358 (not c!43331)) b!256341))

(assert (= (and b!256354 res!125391) b!256351))

(assert (= (or b!256354 b!256341) bm!24276))

(declare-fun b_lambda!8145 () Bool)

(assert (=> (not b_lambda!8145) (not b!256343)))

(declare-fun t!8812 () Bool)

(declare-fun tb!3007 () Bool)

(assert (=> (and b!256099 (= (defaultEntry!4728 thiss!1504) (defaultEntry!4728 thiss!1504)) t!8812) tb!3007))

(declare-fun result!5359 () Bool)

(assert (=> tb!3007 (= result!5359 tp_is_empty!6577)))

(assert (=> b!256343 t!8812))

(declare-fun b_and!13753 () Bool)

(assert (= b_and!13747 (and (=> t!8812 result!5359) b_and!13753)))

(declare-fun m!271233 () Bool)

(assert (=> bm!24276 m!271233))

(assert (=> b!256349 m!271217))

(assert (=> b!256349 m!271217))

(declare-fun m!271235 () Bool)

(assert (=> b!256349 m!271235))

(declare-fun m!271237 () Bool)

(assert (=> b!256351 m!271237))

(declare-fun m!271239 () Bool)

(assert (=> b!256340 m!271239))

(declare-fun m!271241 () Bool)

(assert (=> bm!24278 m!271241))

(declare-fun m!271243 () Bool)

(assert (=> b!256357 m!271243))

(declare-fun m!271245 () Bool)

(assert (=> bm!24281 m!271245))

(declare-fun m!271247 () Bool)

(assert (=> b!256343 m!271247))

(declare-fun m!271249 () Bool)

(assert (=> b!256343 m!271249))

(assert (=> b!256343 m!271217))

(assert (=> b!256343 m!271217))

(declare-fun m!271251 () Bool)

(assert (=> b!256343 m!271251))

(assert (=> b!256343 m!271247))

(assert (=> b!256343 m!271249))

(declare-fun m!271253 () Bool)

(assert (=> b!256343 m!271253))

(assert (=> b!256350 m!271217))

(assert (=> b!256350 m!271217))

(assert (=> b!256350 m!271227))

(declare-fun m!271255 () Bool)

(assert (=> b!256352 m!271255))

(declare-fun m!271257 () Bool)

(assert (=> b!256352 m!271257))

(declare-fun m!271259 () Bool)

(assert (=> b!256352 m!271259))

(declare-fun m!271261 () Bool)

(assert (=> b!256352 m!271261))

(assert (=> b!256352 m!271241))

(declare-fun m!271263 () Bool)

(assert (=> b!256352 m!271263))

(declare-fun m!271265 () Bool)

(assert (=> b!256352 m!271265))

(declare-fun m!271267 () Bool)

(assert (=> b!256352 m!271267))

(declare-fun m!271269 () Bool)

(assert (=> b!256352 m!271269))

(declare-fun m!271271 () Bool)

(assert (=> b!256352 m!271271))

(assert (=> b!256352 m!271257))

(declare-fun m!271273 () Bool)

(assert (=> b!256352 m!271273))

(declare-fun m!271275 () Bool)

(assert (=> b!256352 m!271275))

(declare-fun m!271277 () Bool)

(assert (=> b!256352 m!271277))

(assert (=> b!256352 m!271271))

(declare-fun m!271279 () Bool)

(assert (=> b!256352 m!271279))

(assert (=> b!256352 m!271275))

(declare-fun m!271281 () Bool)

(assert (=> b!256352 m!271281))

(assert (=> b!256352 m!271217))

(assert (=> b!256352 m!271263))

(declare-fun m!271283 () Bool)

(assert (=> b!256352 m!271283))

(declare-fun m!271285 () Bool)

(assert (=> bm!24282 m!271285))

(assert (=> b!256347 m!271217))

(assert (=> b!256347 m!271217))

(assert (=> b!256347 m!271227))

(assert (=> d!61535 m!271199))

(assert (=> b!256083 d!61535))

(declare-fun d!61537 () Bool)

(declare-fun e!166178 () Bool)

(assert (=> d!61537 e!166178))

(declare-fun res!125401 () Bool)

(assert (=> d!61537 (=> (not res!125401) (not e!166178))))

(assert (=> d!61537 (= res!125401 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6262 (_keys!6889 thiss!1504)))))))

(declare-fun lt!128634 () Unit!7915)

(declare-fun choose!41 (array!12487 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3762) Unit!7915)

(assert (=> d!61537 (= lt!128634 (choose!41 (_keys!6889 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3759))))

(assert (=> d!61537 (bvslt (size!6262 (_keys!6889 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61537 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6889 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3759) lt!128634)))

(declare-fun b!256363 () Bool)

(assert (=> b!256363 (= e!166178 (arrayNoDuplicates!0 (array!12488 (store (arr!5914 (_keys!6889 thiss!1504)) index!297 key!932) (size!6262 (_keys!6889 thiss!1504))) #b00000000000000000000000000000000 Nil!3759))))

(assert (= (and d!61537 res!125401) b!256363))

(declare-fun m!271287 () Bool)

(assert (=> d!61537 m!271287))

(assert (=> b!256363 m!271033))

(declare-fun m!271289 () Bool)

(assert (=> b!256363 m!271289))

(assert (=> b!256083 d!61537))

(declare-fun b!256364 () Bool)

(declare-fun e!166179 () (_ BitVec 32))

(declare-fun call!24286 () (_ BitVec 32))

(assert (=> b!256364 (= e!166179 call!24286)))

(declare-fun bm!24283 () Bool)

(assert (=> bm!24283 (= call!24286 (arrayCountValidKeys!0 lt!128459 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6262 (_keys!6889 thiss!1504))))))

(declare-fun b!256365 () Bool)

(declare-fun e!166180 () (_ BitVec 32))

(assert (=> b!256365 (= e!166180 #b00000000000000000000000000000000)))

(declare-fun b!256366 () Bool)

(assert (=> b!256366 (= e!166180 e!166179)))

(declare-fun c!43336 () Bool)

(assert (=> b!256366 (= c!43336 (validKeyInArray!0 (select (arr!5914 lt!128459) #b00000000000000000000000000000000)))))

(declare-fun d!61539 () Bool)

(declare-fun lt!128635 () (_ BitVec 32))

(assert (=> d!61539 (and (bvsge lt!128635 #b00000000000000000000000000000000) (bvsle lt!128635 (bvsub (size!6262 lt!128459) #b00000000000000000000000000000000)))))

(assert (=> d!61539 (= lt!128635 e!166180)))

(declare-fun c!43335 () Bool)

(assert (=> d!61539 (= c!43335 (bvsge #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))))))

(assert (=> d!61539 (and (bvsle #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6262 (_keys!6889 thiss!1504)) (size!6262 lt!128459)))))

(assert (=> d!61539 (= (arrayCountValidKeys!0 lt!128459 #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))) lt!128635)))

(declare-fun b!256367 () Bool)

(assert (=> b!256367 (= e!166179 (bvadd #b00000000000000000000000000000001 call!24286))))

(assert (= (and d!61539 c!43335) b!256365))

(assert (= (and d!61539 (not c!43335)) b!256366))

(assert (= (and b!256366 c!43336) b!256367))

(assert (= (and b!256366 (not c!43336)) b!256364))

(assert (= (or b!256367 b!256364) bm!24283))

(declare-fun m!271291 () Bool)

(assert (=> bm!24283 m!271291))

(assert (=> b!256366 m!271217))

(assert (=> b!256366 m!271217))

(assert (=> b!256366 m!271227))

(assert (=> b!256083 d!61539))

(declare-fun d!61541 () Bool)

(declare-fun res!125402 () Bool)

(declare-fun e!166181 () Bool)

(assert (=> d!61541 (=> res!125402 e!166181)))

(assert (=> d!61541 (= res!125402 (= (select (arr!5914 (_keys!6889 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61541 (= (arrayContainsKey!0 (_keys!6889 thiss!1504) key!932 #b00000000000000000000000000000000) e!166181)))

(declare-fun b!256368 () Bool)

(declare-fun e!166182 () Bool)

(assert (=> b!256368 (= e!166181 e!166182)))

(declare-fun res!125403 () Bool)

(assert (=> b!256368 (=> (not res!125403) (not e!166182))))

(assert (=> b!256368 (= res!125403 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6262 (_keys!6889 thiss!1504))))))

(declare-fun b!256369 () Bool)

(assert (=> b!256369 (= e!166182 (arrayContainsKey!0 (_keys!6889 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61541 (not res!125402)) b!256368))

(assert (= (and b!256368 res!125403) b!256369))

(assert (=> d!61541 m!271193))

(declare-fun m!271293 () Bool)

(assert (=> b!256369 m!271293))

(assert (=> b!256083 d!61541))

(declare-fun d!61543 () Bool)

(declare-fun e!166185 () Bool)

(assert (=> d!61543 e!166185))

(declare-fun res!125406 () Bool)

(assert (=> d!61543 (=> (not res!125406) (not e!166185))))

(assert (=> d!61543 (= res!125406 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6262 (_keys!6889 thiss!1504)))))))

(declare-fun lt!128638 () Unit!7915)

(declare-fun choose!102 ((_ BitVec 64) array!12487 (_ BitVec 32) (_ BitVec 32)) Unit!7915)

(assert (=> d!61543 (= lt!128638 (choose!102 key!932 (_keys!6889 thiss!1504) index!297 (mask!10999 thiss!1504)))))

(assert (=> d!61543 (validMask!0 (mask!10999 thiss!1504))))

(assert (=> d!61543 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6889 thiss!1504) index!297 (mask!10999 thiss!1504)) lt!128638)))

(declare-fun b!256372 () Bool)

(assert (=> b!256372 (= e!166185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12488 (store (arr!5914 (_keys!6889 thiss!1504)) index!297 key!932) (size!6262 (_keys!6889 thiss!1504))) (mask!10999 thiss!1504)))))

(assert (= (and d!61543 res!125406) b!256372))

(declare-fun m!271295 () Bool)

(assert (=> d!61543 m!271295))

(assert (=> d!61543 m!271199))

(assert (=> b!256372 m!271033))

(declare-fun m!271297 () Bool)

(assert (=> b!256372 m!271297))

(assert (=> b!256083 d!61543))

(declare-fun b!256389 () Bool)

(declare-fun res!125417 () Bool)

(declare-fun e!166195 () Bool)

(assert (=> b!256389 (=> (not res!125417) (not e!166195))))

(declare-fun call!24292 () Bool)

(assert (=> b!256389 (= res!125417 call!24292)))

(declare-fun e!166196 () Bool)

(assert (=> b!256389 (= e!166196 e!166195)))

(declare-fun bm!24288 () Bool)

(declare-fun call!24291 () Bool)

(assert (=> bm!24288 (= call!24291 (arrayContainsKey!0 (_keys!6889 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256390 () Bool)

(declare-fun lt!128643 () SeekEntryResult!1159)

(assert (=> b!256390 (= e!166196 ((_ is Undefined!1159) lt!128643))))

(declare-fun b!256391 () Bool)

(declare-fun e!166194 () Bool)

(declare-fun e!166197 () Bool)

(assert (=> b!256391 (= e!166194 e!166197)))

(declare-fun res!125416 () Bool)

(assert (=> b!256391 (= res!125416 call!24292)))

(assert (=> b!256391 (=> (not res!125416) (not e!166197))))

(declare-fun d!61545 () Bool)

(assert (=> d!61545 e!166194))

(declare-fun c!43341 () Bool)

(assert (=> d!61545 (= c!43341 ((_ is MissingZero!1159) lt!128643))))

(assert (=> d!61545 (= lt!128643 (seekEntryOrOpen!0 key!932 (_keys!6889 thiss!1504) (mask!10999 thiss!1504)))))

(declare-fun lt!128644 () Unit!7915)

(declare-fun choose!1236 (array!12487 array!12485 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 64) Int) Unit!7915)

(assert (=> d!61545 (= lt!128644 (choose!1236 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 (defaultEntry!4728 thiss!1504)))))

(assert (=> d!61545 (validMask!0 (mask!10999 thiss!1504))))

(assert (=> d!61545 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!425 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 (defaultEntry!4728 thiss!1504)) lt!128644)))

(declare-fun b!256392 () Bool)

(assert (=> b!256392 (and (bvsge (index!6806 lt!128643) #b00000000000000000000000000000000) (bvslt (index!6806 lt!128643) (size!6262 (_keys!6889 thiss!1504))))))

(declare-fun res!125418 () Bool)

(assert (=> b!256392 (= res!125418 (= (select (arr!5914 (_keys!6889 thiss!1504)) (index!6806 lt!128643)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256392 (=> (not res!125418) (not e!166197))))

(declare-fun bm!24289 () Bool)

(assert (=> bm!24289 (= call!24292 (inRange!0 (ite c!43341 (index!6806 lt!128643) (index!6809 lt!128643)) (mask!10999 thiss!1504)))))

(declare-fun b!256393 () Bool)

(declare-fun res!125415 () Bool)

(assert (=> b!256393 (=> (not res!125415) (not e!166195))))

(assert (=> b!256393 (= res!125415 (= (select (arr!5914 (_keys!6889 thiss!1504)) (index!6809 lt!128643)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256393 (and (bvsge (index!6809 lt!128643) #b00000000000000000000000000000000) (bvslt (index!6809 lt!128643) (size!6262 (_keys!6889 thiss!1504))))))

(declare-fun b!256394 () Bool)

(assert (=> b!256394 (= e!166197 (not call!24291))))

(declare-fun b!256395 () Bool)

(assert (=> b!256395 (= e!166195 (not call!24291))))

(declare-fun b!256396 () Bool)

(assert (=> b!256396 (= e!166194 e!166196)))

(declare-fun c!43342 () Bool)

(assert (=> b!256396 (= c!43342 ((_ is MissingVacant!1159) lt!128643))))

(assert (= (and d!61545 c!43341) b!256391))

(assert (= (and d!61545 (not c!43341)) b!256396))

(assert (= (and b!256391 res!125416) b!256392))

(assert (= (and b!256392 res!125418) b!256394))

(assert (= (and b!256396 c!43342) b!256389))

(assert (= (and b!256396 (not c!43342)) b!256390))

(assert (= (and b!256389 res!125417) b!256393))

(assert (= (and b!256393 res!125415) b!256395))

(assert (= (or b!256391 b!256389) bm!24289))

(assert (= (or b!256394 b!256395) bm!24288))

(assert (=> bm!24288 m!271021))

(declare-fun m!271299 () Bool)

(assert (=> bm!24289 m!271299))

(declare-fun m!271301 () Bool)

(assert (=> b!256393 m!271301))

(declare-fun m!271303 () Bool)

(assert (=> b!256392 m!271303))

(assert (=> d!61545 m!271061))

(declare-fun m!271305 () Bool)

(assert (=> d!61545 m!271305))

(assert (=> d!61545 m!271199))

(assert (=> b!256097 d!61545))

(declare-fun d!61547 () Bool)

(declare-fun e!166200 () Bool)

(assert (=> d!61547 e!166200))

(declare-fun res!125424 () Bool)

(assert (=> d!61547 (=> (not res!125424) (not e!166200))))

(declare-fun lt!128649 () SeekEntryResult!1159)

(assert (=> d!61547 (= res!125424 ((_ is Found!1159) lt!128649))))

(assert (=> d!61547 (= lt!128649 (seekEntryOrOpen!0 key!932 (_keys!6889 thiss!1504) (mask!10999 thiss!1504)))))

(declare-fun lt!128650 () Unit!7915)

(declare-fun choose!1237 (array!12487 array!12485 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 64) Int) Unit!7915)

(assert (=> d!61547 (= lt!128650 (choose!1237 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 (defaultEntry!4728 thiss!1504)))))

(assert (=> d!61547 (validMask!0 (mask!10999 thiss!1504))))

(assert (=> d!61547 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!426 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 (defaultEntry!4728 thiss!1504)) lt!128650)))

(declare-fun b!256401 () Bool)

(declare-fun res!125423 () Bool)

(assert (=> b!256401 (=> (not res!125423) (not e!166200))))

(assert (=> b!256401 (= res!125423 (inRange!0 (index!6807 lt!128649) (mask!10999 thiss!1504)))))

(declare-fun b!256402 () Bool)

(assert (=> b!256402 (= e!166200 (= (select (arr!5914 (_keys!6889 thiss!1504)) (index!6807 lt!128649)) key!932))))

(assert (=> b!256402 (and (bvsge (index!6807 lt!128649) #b00000000000000000000000000000000) (bvslt (index!6807 lt!128649) (size!6262 (_keys!6889 thiss!1504))))))

(assert (= (and d!61547 res!125424) b!256401))

(assert (= (and b!256401 res!125423) b!256402))

(assert (=> d!61547 m!271061))

(declare-fun m!271307 () Bool)

(assert (=> d!61547 m!271307))

(assert (=> d!61547 m!271199))

(declare-fun m!271309 () Bool)

(assert (=> b!256401 m!271309))

(declare-fun m!271311 () Bool)

(assert (=> b!256402 m!271311))

(assert (=> b!256102 d!61547))

(declare-fun d!61549 () Bool)

(assert (=> d!61549 (= (inRange!0 (ite c!43280 (index!6806 lt!128460) (index!6809 lt!128460)) (mask!10999 thiss!1504)) (and (bvsge (ite c!43280 (index!6806 lt!128460) (index!6809 lt!128460)) #b00000000000000000000000000000000) (bvslt (ite c!43280 (index!6806 lt!128460) (index!6809 lt!128460)) (bvadd (mask!10999 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24240 d!61549))

(declare-fun d!61551 () Bool)

(assert (=> d!61551 (= (array_inv!3909 (_keys!6889 thiss!1504)) (bvsge (size!6262 (_keys!6889 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256099 d!61551))

(declare-fun d!61553 () Bool)

(assert (=> d!61553 (= (array_inv!3910 (_values!4711 thiss!1504)) (bvsge (size!6261 (_values!4711 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256099 d!61553))

(declare-fun d!61555 () Bool)

(assert (=> d!61555 (contains!1838 (getCurrentListMap!1405 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)) key!932)))

(declare-fun lt!128653 () Unit!7915)

(declare-fun choose!1238 (array!12487 array!12485 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 64) (_ BitVec 32) Int) Unit!7915)

(assert (=> d!61555 (= lt!128653 (choose!1238 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(assert (=> d!61555 (validMask!0 (mask!10999 thiss!1504))))

(assert (=> d!61555 (= (lemmaArrayContainsKeyThenInListMap!236 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)) lt!128653)))

(declare-fun bs!9046 () Bool)

(assert (= bs!9046 d!61555))

(assert (=> bs!9046 m!271015))

(assert (=> bs!9046 m!271015))

(declare-fun m!271313 () Bool)

(assert (=> bs!9046 m!271313))

(declare-fun m!271315 () Bool)

(assert (=> bs!9046 m!271315))

(assert (=> bs!9046 m!271199))

(assert (=> b!256103 d!61555))

(declare-fun b!256415 () Bool)

(declare-fun c!43349 () Bool)

(declare-fun lt!128662 () (_ BitVec 64))

(assert (=> b!256415 (= c!43349 (= lt!128662 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166208 () SeekEntryResult!1159)

(declare-fun e!166207 () SeekEntryResult!1159)

(assert (=> b!256415 (= e!166208 e!166207)))

(declare-fun lt!128661 () SeekEntryResult!1159)

(declare-fun b!256416 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12487 (_ BitVec 32)) SeekEntryResult!1159)

(assert (=> b!256416 (= e!166207 (seekKeyOrZeroReturnVacant!0 (x!24954 lt!128661) (index!6808 lt!128661) (index!6808 lt!128661) key!932 (_keys!6889 thiss!1504) (mask!10999 thiss!1504)))))

(declare-fun b!256417 () Bool)

(assert (=> b!256417 (= e!166208 (Found!1159 (index!6808 lt!128661)))))

(declare-fun b!256418 () Bool)

(declare-fun e!166209 () SeekEntryResult!1159)

(assert (=> b!256418 (= e!166209 Undefined!1159)))

(declare-fun b!256419 () Bool)

(assert (=> b!256419 (= e!166207 (MissingZero!1159 (index!6808 lt!128661)))))

(declare-fun d!61557 () Bool)

(declare-fun lt!128660 () SeekEntryResult!1159)

(assert (=> d!61557 (and (or ((_ is Undefined!1159) lt!128660) (not ((_ is Found!1159) lt!128660)) (and (bvsge (index!6807 lt!128660) #b00000000000000000000000000000000) (bvslt (index!6807 lt!128660) (size!6262 (_keys!6889 thiss!1504))))) (or ((_ is Undefined!1159) lt!128660) ((_ is Found!1159) lt!128660) (not ((_ is MissingZero!1159) lt!128660)) (and (bvsge (index!6806 lt!128660) #b00000000000000000000000000000000) (bvslt (index!6806 lt!128660) (size!6262 (_keys!6889 thiss!1504))))) (or ((_ is Undefined!1159) lt!128660) ((_ is Found!1159) lt!128660) ((_ is MissingZero!1159) lt!128660) (not ((_ is MissingVacant!1159) lt!128660)) (and (bvsge (index!6809 lt!128660) #b00000000000000000000000000000000) (bvslt (index!6809 lt!128660) (size!6262 (_keys!6889 thiss!1504))))) (or ((_ is Undefined!1159) lt!128660) (ite ((_ is Found!1159) lt!128660) (= (select (arr!5914 (_keys!6889 thiss!1504)) (index!6807 lt!128660)) key!932) (ite ((_ is MissingZero!1159) lt!128660) (= (select (arr!5914 (_keys!6889 thiss!1504)) (index!6806 lt!128660)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1159) lt!128660) (= (select (arr!5914 (_keys!6889 thiss!1504)) (index!6809 lt!128660)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61557 (= lt!128660 e!166209)))

(declare-fun c!43351 () Bool)

(assert (=> d!61557 (= c!43351 (and ((_ is Intermediate!1159) lt!128661) (undefined!1971 lt!128661)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12487 (_ BitVec 32)) SeekEntryResult!1159)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61557 (= lt!128661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10999 thiss!1504)) key!932 (_keys!6889 thiss!1504) (mask!10999 thiss!1504)))))

(assert (=> d!61557 (validMask!0 (mask!10999 thiss!1504))))

(assert (=> d!61557 (= (seekEntryOrOpen!0 key!932 (_keys!6889 thiss!1504) (mask!10999 thiss!1504)) lt!128660)))

(declare-fun b!256420 () Bool)

(assert (=> b!256420 (= e!166209 e!166208)))

(assert (=> b!256420 (= lt!128662 (select (arr!5914 (_keys!6889 thiss!1504)) (index!6808 lt!128661)))))

(declare-fun c!43350 () Bool)

(assert (=> b!256420 (= c!43350 (= lt!128662 key!932))))

(assert (= (and d!61557 c!43351) b!256418))

(assert (= (and d!61557 (not c!43351)) b!256420))

(assert (= (and b!256420 c!43350) b!256417))

(assert (= (and b!256420 (not c!43350)) b!256415))

(assert (= (and b!256415 c!43349) b!256419))

(assert (= (and b!256415 (not c!43349)) b!256416))

(declare-fun m!271317 () Bool)

(assert (=> b!256416 m!271317))

(declare-fun m!271319 () Bool)

(assert (=> d!61557 m!271319))

(declare-fun m!271321 () Bool)

(assert (=> d!61557 m!271321))

(declare-fun m!271323 () Bool)

(assert (=> d!61557 m!271323))

(declare-fun m!271325 () Bool)

(assert (=> d!61557 m!271325))

(declare-fun m!271327 () Bool)

(assert (=> d!61557 m!271327))

(assert (=> d!61557 m!271199))

(assert (=> d!61557 m!271323))

(declare-fun m!271329 () Bool)

(assert (=> b!256420 m!271329))

(assert (=> b!256090 d!61557))

(declare-fun d!61559 () Bool)

(assert (=> d!61559 (= (inRange!0 index!297 (mask!10999 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10999 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!256095 d!61559))

(declare-fun d!61561 () Bool)

(declare-fun e!166214 () Bool)

(assert (=> d!61561 e!166214))

(declare-fun res!125427 () Bool)

(assert (=> d!61561 (=> res!125427 e!166214)))

(declare-fun lt!128673 () Bool)

(assert (=> d!61561 (= res!125427 (not lt!128673))))

(declare-fun lt!128671 () Bool)

(assert (=> d!61561 (= lt!128673 lt!128671)))

(declare-fun lt!128674 () Unit!7915)

(declare-fun e!166215 () Unit!7915)

(assert (=> d!61561 (= lt!128674 e!166215)))

(declare-fun c!43354 () Bool)

(assert (=> d!61561 (= c!43354 lt!128671)))

(declare-fun containsKey!299 (List!3761 (_ BitVec 64)) Bool)

(assert (=> d!61561 (= lt!128671 (containsKey!299 (toList!1896 lt!128456) key!932))))

(assert (=> d!61561 (= (contains!1838 lt!128456 key!932) lt!128673)))

(declare-fun b!256427 () Bool)

(declare-fun lt!128672 () Unit!7915)

(assert (=> b!256427 (= e!166215 lt!128672)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!248 (List!3761 (_ BitVec 64)) Unit!7915)

(assert (=> b!256427 (= lt!128672 (lemmaContainsKeyImpliesGetValueByKeyDefined!248 (toList!1896 lt!128456) key!932))))

(declare-fun isDefined!249 (Option!313) Bool)

(assert (=> b!256427 (isDefined!249 (getValueByKey!307 (toList!1896 lt!128456) key!932))))

(declare-fun b!256428 () Bool)

(declare-fun Unit!7927 () Unit!7915)

(assert (=> b!256428 (= e!166215 Unit!7927)))

(declare-fun b!256429 () Bool)

(assert (=> b!256429 (= e!166214 (isDefined!249 (getValueByKey!307 (toList!1896 lt!128456) key!932)))))

(assert (= (and d!61561 c!43354) b!256427))

(assert (= (and d!61561 (not c!43354)) b!256428))

(assert (= (and d!61561 (not res!125427)) b!256429))

(declare-fun m!271331 () Bool)

(assert (=> d!61561 m!271331))

(declare-fun m!271333 () Bool)

(assert (=> b!256427 m!271333))

(declare-fun m!271335 () Bool)

(assert (=> b!256427 m!271335))

(assert (=> b!256427 m!271335))

(declare-fun m!271337 () Bool)

(assert (=> b!256427 m!271337))

(assert (=> b!256429 m!271335))

(assert (=> b!256429 m!271335))

(assert (=> b!256429 m!271337))

(assert (=> b!256095 d!61561))

(declare-fun b!256430 () Bool)

(declare-fun e!166228 () Bool)

(declare-fun call!24296 () Bool)

(assert (=> b!256430 (= e!166228 (not call!24296))))

(declare-fun b!256431 () Bool)

(declare-fun e!166226 () Unit!7915)

(declare-fun Unit!7928 () Unit!7915)

(assert (=> b!256431 (= e!166226 Unit!7928)))

(declare-fun b!256432 () Bool)

(declare-fun e!166221 () ListLongMap!3761)

(declare-fun call!24294 () ListLongMap!3761)

(assert (=> b!256432 (= e!166221 (+!688 call!24294 (tuple2!4859 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4569 thiss!1504))))))

(declare-fun b!256433 () Bool)

(declare-fun e!166227 () Bool)

(declare-fun call!24299 () Bool)

(assert (=> b!256433 (= e!166227 (not call!24299))))

(declare-fun b!256434 () Bool)

(declare-fun e!166219 () ListLongMap!3761)

(declare-fun call!24297 () ListLongMap!3761)

(assert (=> b!256434 (= e!166219 call!24297)))

(declare-fun b!256435 () Bool)

(declare-fun e!166220 () Bool)

(declare-fun lt!128694 () ListLongMap!3761)

(assert (=> b!256435 (= e!166220 (= (apply!251 lt!128694 (select (arr!5914 (_keys!6889 thiss!1504)) #b00000000000000000000000000000000)) (get!3038 (select (arr!5913 (_values!4711 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4728 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256435 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6261 (_values!4711 thiss!1504))))))

(assert (=> b!256435 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))))))

(declare-fun b!256436 () Bool)

(declare-fun call!24298 () ListLongMap!3761)

(assert (=> b!256436 (= e!166219 call!24298)))

(declare-fun bm!24290 () Bool)

(assert (=> bm!24290 (= call!24299 (contains!1838 lt!128694 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256437 () Bool)

(declare-fun e!166225 () ListLongMap!3761)

(assert (=> b!256437 (= e!166225 call!24298)))

(declare-fun d!61563 () Bool)

(declare-fun e!166224 () Bool)

(assert (=> d!61563 e!166224))

(declare-fun res!125433 () Bool)

(assert (=> d!61563 (=> (not res!125433) (not e!166224))))

(assert (=> d!61563 (= res!125433 (or (bvsge #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))))))))

(declare-fun lt!128685 () ListLongMap!3761)

(assert (=> d!61563 (= lt!128694 lt!128685)))

(declare-fun lt!128675 () Unit!7915)

(assert (=> d!61563 (= lt!128675 e!166226)))

(declare-fun c!43358 () Bool)

(declare-fun e!166216 () Bool)

(assert (=> d!61563 (= c!43358 e!166216)))

(declare-fun res!125431 () Bool)

(assert (=> d!61563 (=> (not res!125431) (not e!166216))))

(assert (=> d!61563 (= res!125431 (bvslt #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))))))

(assert (=> d!61563 (= lt!128685 e!166221)))

(declare-fun c!43355 () Bool)

(assert (=> d!61563 (= c!43355 (and (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61563 (validMask!0 (mask!10999 thiss!1504))))

(assert (=> d!61563 (= (getCurrentListMap!1405 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)) lt!128694)))

(declare-fun bm!24291 () Bool)

(declare-fun call!24293 () ListLongMap!3761)

(declare-fun call!24295 () ListLongMap!3761)

(assert (=> bm!24291 (= call!24293 call!24295)))

(declare-fun b!256438 () Bool)

(assert (=> b!256438 (= e!166221 e!166225)))

(declare-fun c!43359 () Bool)

(assert (=> b!256438 (= c!43359 (and (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24292 () Bool)

(assert (=> bm!24292 (= call!24295 (getCurrentListMapNoExtraKeys!567 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun b!256439 () Bool)

(assert (=> b!256439 (= e!166216 (validKeyInArray!0 (select (arr!5914 (_keys!6889 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24293 () Bool)

(assert (=> bm!24293 (= call!24297 call!24293)))

(declare-fun b!256440 () Bool)

(declare-fun c!43360 () Bool)

(assert (=> b!256440 (= c!43360 (and (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!256440 (= e!166225 e!166219)))

(declare-fun b!256441 () Bool)

(declare-fun e!166217 () Bool)

(assert (=> b!256441 (= e!166217 e!166220)))

(declare-fun res!125428 () Bool)

(assert (=> b!256441 (=> (not res!125428) (not e!166220))))

(assert (=> b!256441 (= res!125428 (contains!1838 lt!128694 (select (arr!5914 (_keys!6889 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!256441 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))))))

(declare-fun b!256442 () Bool)

(declare-fun e!166223 () Bool)

(assert (=> b!256442 (= e!166223 (validKeyInArray!0 (select (arr!5914 (_keys!6889 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!256443 () Bool)

(declare-fun e!166218 () Bool)

(assert (=> b!256443 (= e!166218 (= (apply!251 lt!128694 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4569 thiss!1504)))))

(declare-fun b!256444 () Bool)

(declare-fun lt!128683 () Unit!7915)

(assert (=> b!256444 (= e!166226 lt!128683)))

(declare-fun lt!128677 () ListLongMap!3761)

(assert (=> b!256444 (= lt!128677 (getCurrentListMapNoExtraKeys!567 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128687 () (_ BitVec 64))

(assert (=> b!256444 (= lt!128687 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128695 () (_ BitVec 64))

(assert (=> b!256444 (= lt!128695 (select (arr!5914 (_keys!6889 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128676 () Unit!7915)

(assert (=> b!256444 (= lt!128676 (addStillContains!227 lt!128677 lt!128687 (zeroValue!4569 thiss!1504) lt!128695))))

(assert (=> b!256444 (contains!1838 (+!688 lt!128677 (tuple2!4859 lt!128687 (zeroValue!4569 thiss!1504))) lt!128695)))

(declare-fun lt!128679 () Unit!7915)

(assert (=> b!256444 (= lt!128679 lt!128676)))

(declare-fun lt!128686 () ListLongMap!3761)

(assert (=> b!256444 (= lt!128686 (getCurrentListMapNoExtraKeys!567 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128691 () (_ BitVec 64))

(assert (=> b!256444 (= lt!128691 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128684 () (_ BitVec 64))

(assert (=> b!256444 (= lt!128684 (select (arr!5914 (_keys!6889 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128678 () Unit!7915)

(assert (=> b!256444 (= lt!128678 (addApplyDifferent!227 lt!128686 lt!128691 (minValue!4569 thiss!1504) lt!128684))))

(assert (=> b!256444 (= (apply!251 (+!688 lt!128686 (tuple2!4859 lt!128691 (minValue!4569 thiss!1504))) lt!128684) (apply!251 lt!128686 lt!128684))))

(declare-fun lt!128693 () Unit!7915)

(assert (=> b!256444 (= lt!128693 lt!128678)))

(declare-fun lt!128680 () ListLongMap!3761)

(assert (=> b!256444 (= lt!128680 (getCurrentListMapNoExtraKeys!567 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128689 () (_ BitVec 64))

(assert (=> b!256444 (= lt!128689 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128682 () (_ BitVec 64))

(assert (=> b!256444 (= lt!128682 (select (arr!5914 (_keys!6889 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128690 () Unit!7915)

(assert (=> b!256444 (= lt!128690 (addApplyDifferent!227 lt!128680 lt!128689 (zeroValue!4569 thiss!1504) lt!128682))))

(assert (=> b!256444 (= (apply!251 (+!688 lt!128680 (tuple2!4859 lt!128689 (zeroValue!4569 thiss!1504))) lt!128682) (apply!251 lt!128680 lt!128682))))

(declare-fun lt!128681 () Unit!7915)

(assert (=> b!256444 (= lt!128681 lt!128690)))

(declare-fun lt!128696 () ListLongMap!3761)

(assert (=> b!256444 (= lt!128696 (getCurrentListMapNoExtraKeys!567 (_keys!6889 thiss!1504) (_values!4711 thiss!1504) (mask!10999 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128692 () (_ BitVec 64))

(assert (=> b!256444 (= lt!128692 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128688 () (_ BitVec 64))

(assert (=> b!256444 (= lt!128688 (select (arr!5914 (_keys!6889 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256444 (= lt!128683 (addApplyDifferent!227 lt!128696 lt!128692 (minValue!4569 thiss!1504) lt!128688))))

(assert (=> b!256444 (= (apply!251 (+!688 lt!128696 (tuple2!4859 lt!128692 (minValue!4569 thiss!1504))) lt!128688) (apply!251 lt!128696 lt!128688))))

(declare-fun bm!24294 () Bool)

(assert (=> bm!24294 (= call!24298 call!24294)))

(declare-fun b!256445 () Bool)

(declare-fun res!125430 () Bool)

(assert (=> b!256445 (=> (not res!125430) (not e!166224))))

(assert (=> b!256445 (= res!125430 e!166228)))

(declare-fun c!43356 () Bool)

(assert (=> b!256445 (= c!43356 (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24295 () Bool)

(assert (=> bm!24295 (= call!24294 (+!688 (ite c!43355 call!24295 (ite c!43359 call!24293 call!24297)) (ite (or c!43355 c!43359) (tuple2!4859 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4569 thiss!1504)) (tuple2!4859 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4569 thiss!1504)))))))

(declare-fun b!256446 () Bool)

(assert (=> b!256446 (= e!166227 e!166218)))

(declare-fun res!125429 () Bool)

(assert (=> b!256446 (= res!125429 call!24299)))

(assert (=> b!256446 (=> (not res!125429) (not e!166218))))

(declare-fun b!256447 () Bool)

(declare-fun e!166222 () Bool)

(assert (=> b!256447 (= e!166228 e!166222)))

(declare-fun res!125436 () Bool)

(assert (=> b!256447 (= res!125436 call!24296)))

(assert (=> b!256447 (=> (not res!125436) (not e!166222))))

(declare-fun b!256448 () Bool)

(declare-fun res!125432 () Bool)

(assert (=> b!256448 (=> (not res!125432) (not e!166224))))

(assert (=> b!256448 (= res!125432 e!166217)))

(declare-fun res!125435 () Bool)

(assert (=> b!256448 (=> res!125435 e!166217)))

(assert (=> b!256448 (= res!125435 (not e!166223))))

(declare-fun res!125434 () Bool)

(assert (=> b!256448 (=> (not res!125434) (not e!166223))))

(assert (=> b!256448 (= res!125434 (bvslt #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))))))

(declare-fun b!256449 () Bool)

(assert (=> b!256449 (= e!166222 (= (apply!251 lt!128694 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4569 thiss!1504)))))

(declare-fun bm!24296 () Bool)

(assert (=> bm!24296 (= call!24296 (contains!1838 lt!128694 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256450 () Bool)

(assert (=> b!256450 (= e!166224 e!166227)))

(declare-fun c!43357 () Bool)

(assert (=> b!256450 (= c!43357 (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61563 c!43355) b!256432))

(assert (= (and d!61563 (not c!43355)) b!256438))

(assert (= (and b!256438 c!43359) b!256437))

(assert (= (and b!256438 (not c!43359)) b!256440))

(assert (= (and b!256440 c!43360) b!256436))

(assert (= (and b!256440 (not c!43360)) b!256434))

(assert (= (or b!256436 b!256434) bm!24293))

(assert (= (or b!256437 bm!24293) bm!24291))

(assert (= (or b!256437 b!256436) bm!24294))

(assert (= (or b!256432 bm!24291) bm!24292))

(assert (= (or b!256432 bm!24294) bm!24295))

(assert (= (and d!61563 res!125431) b!256439))

(assert (= (and d!61563 c!43358) b!256444))

(assert (= (and d!61563 (not c!43358)) b!256431))

(assert (= (and d!61563 res!125433) b!256448))

(assert (= (and b!256448 res!125434) b!256442))

(assert (= (and b!256448 (not res!125435)) b!256441))

(assert (= (and b!256441 res!125428) b!256435))

(assert (= (and b!256448 res!125432) b!256445))

(assert (= (and b!256445 c!43356) b!256447))

(assert (= (and b!256445 (not c!43356)) b!256430))

(assert (= (and b!256447 res!125436) b!256449))

(assert (= (or b!256447 b!256430) bm!24296))

(assert (= (and b!256445 res!125430) b!256450))

(assert (= (and b!256450 c!43357) b!256446))

(assert (= (and b!256450 (not c!43357)) b!256433))

(assert (= (and b!256446 res!125429) b!256443))

(assert (= (or b!256446 b!256433) bm!24290))

(declare-fun b_lambda!8147 () Bool)

(assert (=> (not b_lambda!8147) (not b!256435)))

(assert (=> b!256435 t!8812))

(declare-fun b_and!13755 () Bool)

(assert (= b_and!13753 (and (=> t!8812 result!5359) b_and!13755)))

(declare-fun m!271339 () Bool)

(assert (=> bm!24290 m!271339))

(assert (=> b!256441 m!271193))

(assert (=> b!256441 m!271193))

(declare-fun m!271341 () Bool)

(assert (=> b!256441 m!271341))

(declare-fun m!271343 () Bool)

(assert (=> b!256443 m!271343))

(declare-fun m!271345 () Bool)

(assert (=> b!256432 m!271345))

(declare-fun m!271347 () Bool)

(assert (=> bm!24292 m!271347))

(declare-fun m!271349 () Bool)

(assert (=> b!256449 m!271349))

(declare-fun m!271351 () Bool)

(assert (=> bm!24295 m!271351))

(declare-fun m!271353 () Bool)

(assert (=> b!256435 m!271353))

(assert (=> b!256435 m!271249))

(assert (=> b!256435 m!271193))

(assert (=> b!256435 m!271193))

(declare-fun m!271355 () Bool)

(assert (=> b!256435 m!271355))

(assert (=> b!256435 m!271353))

(assert (=> b!256435 m!271249))

(declare-fun m!271357 () Bool)

(assert (=> b!256435 m!271357))

(assert (=> b!256442 m!271193))

(assert (=> b!256442 m!271193))

(assert (=> b!256442 m!271195))

(declare-fun m!271359 () Bool)

(assert (=> b!256444 m!271359))

(declare-fun m!271361 () Bool)

(assert (=> b!256444 m!271361))

(declare-fun m!271363 () Bool)

(assert (=> b!256444 m!271363))

(declare-fun m!271365 () Bool)

(assert (=> b!256444 m!271365))

(assert (=> b!256444 m!271347))

(declare-fun m!271367 () Bool)

(assert (=> b!256444 m!271367))

(declare-fun m!271369 () Bool)

(assert (=> b!256444 m!271369))

(declare-fun m!271371 () Bool)

(assert (=> b!256444 m!271371))

(declare-fun m!271373 () Bool)

(assert (=> b!256444 m!271373))

(declare-fun m!271375 () Bool)

(assert (=> b!256444 m!271375))

(assert (=> b!256444 m!271361))

(declare-fun m!271377 () Bool)

(assert (=> b!256444 m!271377))

(declare-fun m!271379 () Bool)

(assert (=> b!256444 m!271379))

(declare-fun m!271381 () Bool)

(assert (=> b!256444 m!271381))

(assert (=> b!256444 m!271375))

(declare-fun m!271383 () Bool)

(assert (=> b!256444 m!271383))

(assert (=> b!256444 m!271379))

(declare-fun m!271385 () Bool)

(assert (=> b!256444 m!271385))

(assert (=> b!256444 m!271193))

(assert (=> b!256444 m!271367))

(declare-fun m!271387 () Bool)

(assert (=> b!256444 m!271387))

(declare-fun m!271389 () Bool)

(assert (=> bm!24296 m!271389))

(assert (=> b!256439 m!271193))

(assert (=> b!256439 m!271193))

(assert (=> b!256439 m!271195))

(assert (=> d!61563 m!271199))

(assert (=> b!256095 d!61563))

(assert (=> bm!24239 d!61541))

(declare-fun d!61565 () Bool)

(declare-fun res!125443 () Bool)

(declare-fun e!166231 () Bool)

(assert (=> d!61565 (=> (not res!125443) (not e!166231))))

(declare-fun simpleValid!274 (LongMapFixedSize!3790) Bool)

(assert (=> d!61565 (= res!125443 (simpleValid!274 thiss!1504))))

(assert (=> d!61565 (= (valid!1485 thiss!1504) e!166231)))

(declare-fun b!256457 () Bool)

(declare-fun res!125444 () Bool)

(assert (=> b!256457 (=> (not res!125444) (not e!166231))))

(assert (=> b!256457 (= res!125444 (= (arrayCountValidKeys!0 (_keys!6889 thiss!1504) #b00000000000000000000000000000000 (size!6262 (_keys!6889 thiss!1504))) (_size!1944 thiss!1504)))))

(declare-fun b!256458 () Bool)

(declare-fun res!125445 () Bool)

(assert (=> b!256458 (=> (not res!125445) (not e!166231))))

(assert (=> b!256458 (= res!125445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6889 thiss!1504) (mask!10999 thiss!1504)))))

(declare-fun b!256459 () Bool)

(assert (=> b!256459 (= e!166231 (arrayNoDuplicates!0 (_keys!6889 thiss!1504) #b00000000000000000000000000000000 Nil!3759))))

(assert (= (and d!61565 res!125443) b!256457))

(assert (= (and b!256457 res!125444) b!256458))

(assert (= (and b!256458 res!125445) b!256459))

(declare-fun m!271391 () Bool)

(assert (=> d!61565 m!271391))

(assert (=> b!256457 m!271035))

(declare-fun m!271393 () Bool)

(assert (=> b!256458 m!271393))

(declare-fun m!271395 () Bool)

(assert (=> b!256459 m!271395))

(assert (=> start!24470 d!61565))

(declare-fun mapIsEmpty!11202 () Bool)

(declare-fun mapRes!11202 () Bool)

(assert (=> mapIsEmpty!11202 mapRes!11202))

(declare-fun condMapEmpty!11202 () Bool)

(declare-fun mapDefault!11202 () ValueCell!2945)

(assert (=> mapNonEmpty!11193 (= condMapEmpty!11202 (= mapRest!11193 ((as const (Array (_ BitVec 32) ValueCell!2945)) mapDefault!11202)))))

(declare-fun e!166236 () Bool)

(assert (=> mapNonEmpty!11193 (= tp!23444 (and e!166236 mapRes!11202))))

(declare-fun b!256467 () Bool)

(assert (=> b!256467 (= e!166236 tp_is_empty!6577)))

(declare-fun b!256466 () Bool)

(declare-fun e!166237 () Bool)

(assert (=> b!256466 (= e!166237 tp_is_empty!6577)))

(declare-fun mapNonEmpty!11202 () Bool)

(declare-fun tp!23460 () Bool)

(assert (=> mapNonEmpty!11202 (= mapRes!11202 (and tp!23460 e!166237))))

(declare-fun mapValue!11202 () ValueCell!2945)

(declare-fun mapKey!11202 () (_ BitVec 32))

(declare-fun mapRest!11202 () (Array (_ BitVec 32) ValueCell!2945))

(assert (=> mapNonEmpty!11202 (= mapRest!11193 (store mapRest!11202 mapKey!11202 mapValue!11202))))

(assert (= (and mapNonEmpty!11193 condMapEmpty!11202) mapIsEmpty!11202))

(assert (= (and mapNonEmpty!11193 (not condMapEmpty!11202)) mapNonEmpty!11202))

(assert (= (and mapNonEmpty!11202 ((_ is ValueCellFull!2945) mapValue!11202)) b!256466))

(assert (= (and mapNonEmpty!11193 ((_ is ValueCellFull!2945) mapDefault!11202)) b!256467))

(declare-fun m!271397 () Bool)

(assert (=> mapNonEmpty!11202 m!271397))

(declare-fun b_lambda!8149 () Bool)

(assert (= b_lambda!8147 (or (and b!256099 b_free!6715) b_lambda!8149)))

(declare-fun b_lambda!8151 () Bool)

(assert (= b_lambda!8145 (or (and b!256099 b_free!6715) b_lambda!8151)))

(check-sat (not bm!24295) (not b!256444) (not d!61543) (not b!256459) (not b!256291) (not bm!24289) (not b!256432) b_and!13755 (not d!61523) (not b!256351) (not mapNonEmpty!11202) (not b_lambda!8149) (not bm!24278) (not b!256357) (not b!256366) (not b!256441) (not b!256435) (not b!256280) (not d!61563) (not d!61547) (not b!256347) (not d!61535) (not b!256350) (not d!61565) (not b!256416) (not b!256278) (not b!256369) (not bm!24255) (not bm!24292) (not b!256245) (not bm!24282) (not d!61555) (not b!256439) (not bm!24288) (not bm!24296) (not b!256244) (not b!256457) (not bm!24261) (not b!256401) (not b!256429) (not b!256247) (not b!256352) (not b_lambda!8151) (not b!256349) (not d!61557) (not b!256262) (not b!256427) (not bm!24290) (not b_next!6715) (not b!256268) (not b!256292) (not b!256267) (not b!256235) (not d!61527) (not b!256343) (not b!256258) (not bm!24258) (not b!256442) (not d!61537) (not b!256340) (not b!256443) (not b!256372) (not b!256458) (not bm!24283) (not b!256449) tp_is_empty!6577 (not b!256293) (not b!256363) (not bm!24276) (not d!61561) (not d!61545) (not d!61529) (not bm!24281))
(check-sat b_and!13755 (not b_next!6715))
