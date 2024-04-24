; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24470 () Bool)

(assert start!24470)

(declare-fun b!256283 () Bool)

(declare-fun b_free!6715 () Bool)

(declare-fun b_next!6715 () Bool)

(assert (=> b!256283 (= b_free!6715 (not b_next!6715))))

(declare-fun tp!23445 () Bool)

(declare-fun b_and!13787 () Bool)

(assert (=> b!256283 (= tp!23445 b_and!13787)))

(declare-fun b!256277 () Bool)

(declare-datatypes ((Unit!7922 0))(
  ( (Unit!7923) )
))
(declare-fun e!166115 () Unit!7922)

(declare-fun Unit!7924 () Unit!7922)

(assert (=> b!256277 (= e!166115 Unit!7924)))

(declare-fun b!256278 () Bool)

(declare-fun e!166123 () Bool)

(declare-datatypes ((SeekEntryResult!1129 0))(
  ( (MissingZero!1129 (index!6686 (_ BitVec 32))) (Found!1129 (index!6687 (_ BitVec 32))) (Intermediate!1129 (undefined!1941 Bool) (index!6688 (_ BitVec 32)) (x!24925 (_ BitVec 32))) (Undefined!1129) (MissingVacant!1129 (index!6689 (_ BitVec 32))) )
))
(declare-fun lt!128703 () SeekEntryResult!1129)

(get-info :version)

(assert (=> b!256278 (= e!166123 ((_ is Undefined!1129) lt!128703))))

(declare-fun b!256279 () Bool)

(declare-fun e!166112 () Bool)

(declare-fun e!166116 () Bool)

(assert (=> b!256279 (= e!166112 (not e!166116))))

(declare-fun res!125387 () Bool)

(assert (=> b!256279 (=> res!125387 e!166116)))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8417 0))(
  ( (V!8418 (val!3333 Int)) )
))
(declare-datatypes ((ValueCell!2945 0))(
  ( (ValueCellFull!2945 (v!5420 V!8417)) (EmptyCell!2945) )
))
(declare-datatypes ((array!12491 0))(
  ( (array!12492 (arr!5917 (Array (_ BitVec 32) ValueCell!2945)) (size!6264 (_ BitVec 32))) )
))
(declare-datatypes ((array!12493 0))(
  ( (array!12494 (arr!5918 (Array (_ BitVec 32) (_ BitVec 64))) (size!6265 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3790 0))(
  ( (LongMapFixedSize!3791 (defaultEntry!4728 Int) (mask!11000 (_ BitVec 32)) (extraKeys!4465 (_ BitVec 32)) (zeroValue!4569 V!8417) (minValue!4569 V!8417) (_size!1944 (_ BitVec 32)) (_keys!6890 array!12493) (_values!4711 array!12491) (_vacant!1944 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3790)

(assert (=> b!256279 (= res!125387 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6265 (_keys!6890 thiss!1504))) (bvsge (size!6265 (_keys!6890 thiss!1504)) #b01111111111111111111111111111111)))))

(declare-fun lt!128692 () array!12493)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun v!346 () V!8417)

(declare-datatypes ((tuple2!4822 0))(
  ( (tuple2!4823 (_1!2422 (_ BitVec 64)) (_2!2422 V!8417)) )
))
(declare-datatypes ((List!3701 0))(
  ( (Nil!3698) (Cons!3697 (h!4359 tuple2!4822) (t!8748 List!3701)) )
))
(declare-datatypes ((ListLongMap!3737 0))(
  ( (ListLongMap!3738 (toList!1884 List!3701)) )
))
(declare-fun lt!128693 () ListLongMap!3737)

(declare-fun +!682 (ListLongMap!3737 tuple2!4822) ListLongMap!3737)

(declare-fun getCurrentListMap!1416 (array!12493 array!12491 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 32) Int) ListLongMap!3737)

(assert (=> b!256279 (= (+!682 lt!128693 (tuple2!4823 key!932 v!346)) (getCurrentListMap!1416 lt!128692 (array!12492 (store (arr!5917 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6264 (_values!4711 thiss!1504))) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128696 () Unit!7922)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!97 (array!12493 array!12491 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 32) (_ BitVec 64) V!8417 Int) Unit!7922)

(assert (=> b!256279 (= lt!128696 (lemmaAddValidKeyToArrayThenAddPairToListMap!97 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) index!297 key!932 v!346 (defaultEntry!4728 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12493 (_ BitVec 32)) Bool)

(assert (=> b!256279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128692 (mask!11000 thiss!1504))))

(declare-fun lt!128694 () Unit!7922)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12493 (_ BitVec 32) (_ BitVec 32)) Unit!7922)

(assert (=> b!256279 (= lt!128694 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6890 thiss!1504) index!297 (mask!11000 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12493 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!256279 (= (arrayCountValidKeys!0 lt!128692 #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6890 thiss!1504) #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504)))))))

(declare-fun lt!128697 () Unit!7922)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12493 (_ BitVec 32) (_ BitVec 64)) Unit!7922)

(assert (=> b!256279 (= lt!128697 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6890 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3702 0))(
  ( (Nil!3699) (Cons!3698 (h!4360 (_ BitVec 64)) (t!8749 List!3702)) )
))
(declare-fun arrayNoDuplicates!0 (array!12493 (_ BitVec 32) List!3702) Bool)

(assert (=> b!256279 (arrayNoDuplicates!0 lt!128692 #b00000000000000000000000000000000 Nil!3699)))

(assert (=> b!256279 (= lt!128692 (array!12494 (store (arr!5918 (_keys!6890 thiss!1504)) index!297 key!932) (size!6265 (_keys!6890 thiss!1504))))))

(declare-fun lt!128699 () Unit!7922)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12493 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3702) Unit!7922)

(assert (=> b!256279 (= lt!128699 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6890 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3699))))

(declare-fun lt!128698 () Unit!7922)

(assert (=> b!256279 (= lt!128698 e!166115)))

(declare-fun c!43318 () Bool)

(declare-fun arrayContainsKey!0 (array!12493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!256279 (= c!43318 (arrayContainsKey!0 (_keys!6890 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256280 () Bool)

(declare-fun e!166118 () Bool)

(declare-fun tp_is_empty!6577 () Bool)

(assert (=> b!256280 (= e!166118 tp_is_empty!6577)))

(declare-fun b!256281 () Bool)

(declare-fun e!166122 () Bool)

(declare-fun e!166119 () Bool)

(assert (=> b!256281 (= e!166122 e!166119)))

(declare-fun res!125383 () Bool)

(assert (=> b!256281 (=> (not res!125383) (not e!166119))))

(assert (=> b!256281 (= res!125383 (or (= lt!128703 (MissingZero!1129 index!297)) (= lt!128703 (MissingVacant!1129 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12493 (_ BitVec 32)) SeekEntryResult!1129)

(assert (=> b!256281 (= lt!128703 (seekEntryOrOpen!0 key!932 (_keys!6890 thiss!1504) (mask!11000 thiss!1504)))))

(declare-fun b!256282 () Bool)

(declare-fun Unit!7925 () Unit!7922)

(assert (=> b!256282 (= e!166115 Unit!7925)))

(declare-fun lt!128695 () Unit!7922)

(declare-fun lemmaArrayContainsKeyThenInListMap!239 (array!12493 array!12491 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 64) (_ BitVec 32) Int) Unit!7922)

(assert (=> b!256282 (= lt!128695 (lemmaArrayContainsKeyThenInListMap!239 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(assert (=> b!256282 false))

(declare-fun e!166124 () Bool)

(declare-fun e!166125 () Bool)

(declare-fun array_inv!3893 (array!12493) Bool)

(declare-fun array_inv!3894 (array!12491) Bool)

(assert (=> b!256283 (= e!166124 (and tp!23445 tp_is_empty!6577 (array_inv!3893 (_keys!6890 thiss!1504)) (array_inv!3894 (_values!4711 thiss!1504)) e!166125))))

(declare-fun b!256284 () Bool)

(declare-fun res!125384 () Bool)

(declare-fun e!166121 () Bool)

(assert (=> b!256284 (=> (not res!125384) (not e!166121))))

(declare-fun call!24255 () Bool)

(assert (=> b!256284 (= res!125384 call!24255)))

(declare-fun e!166117 () Bool)

(assert (=> b!256284 (= e!166117 e!166121)))

(declare-fun b!256285 () Bool)

(declare-fun e!166114 () Bool)

(assert (=> b!256285 (= e!166114 tp_is_empty!6577)))

(declare-fun mapIsEmpty!11193 () Bool)

(declare-fun mapRes!11193 () Bool)

(assert (=> mapIsEmpty!11193 mapRes!11193))

(declare-fun b!256286 () Bool)

(assert (=> b!256286 (= e!166125 (and e!166114 mapRes!11193))))

(declare-fun condMapEmpty!11193 () Bool)

(declare-fun mapDefault!11193 () ValueCell!2945)

(assert (=> b!256286 (= condMapEmpty!11193 (= (arr!5917 (_values!4711 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2945)) mapDefault!11193)))))

(declare-fun b!256287 () Bool)

(declare-fun res!125390 () Bool)

(assert (=> b!256287 (=> (not res!125390) (not e!166122))))

(assert (=> b!256287 (= res!125390 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!256288 () Bool)

(declare-fun call!24254 () Bool)

(assert (=> b!256288 (= e!166121 (not call!24254))))

(declare-fun b!256289 () Bool)

(declare-fun res!125388 () Bool)

(assert (=> b!256289 (=> (not res!125388) (not e!166121))))

(assert (=> b!256289 (= res!125388 (= (select (arr!5918 (_keys!6890 thiss!1504)) (index!6686 lt!128703)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256290 () Bool)

(declare-fun e!166126 () Unit!7922)

(declare-fun Unit!7926 () Unit!7922)

(assert (=> b!256290 (= e!166126 Unit!7926)))

(declare-fun lt!128702 () Unit!7922)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!422 (array!12493 array!12491 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 64) Int) Unit!7922)

(assert (=> b!256290 (= lt!128702 (lemmaInListMapThenSeekEntryOrOpenFindsIt!422 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 (defaultEntry!4728 thiss!1504)))))

(assert (=> b!256290 false))

(declare-fun b!256291 () Bool)

(declare-fun e!166120 () Bool)

(assert (=> b!256291 (= e!166120 (not call!24254))))

(declare-fun b!256292 () Bool)

(declare-fun res!125389 () Bool)

(assert (=> b!256292 (= res!125389 (= (select (arr!5918 (_keys!6890 thiss!1504)) (index!6689 lt!128703)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256292 (=> (not res!125389) (not e!166120))))

(declare-fun b!256293 () Bool)

(declare-fun lt!128701 () Unit!7922)

(assert (=> b!256293 (= e!166126 lt!128701)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!416 (array!12493 array!12491 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 64) Int) Unit!7922)

(assert (=> b!256293 (= lt!128701 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!416 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 (defaultEntry!4728 thiss!1504)))))

(declare-fun c!43319 () Bool)

(assert (=> b!256293 (= c!43319 ((_ is MissingZero!1129) lt!128703))))

(assert (=> b!256293 e!166117))

(declare-fun b!256294 () Bool)

(assert (=> b!256294 (= e!166116 (arrayContainsKey!0 lt!128692 key!932 index!297))))

(declare-fun b!256295 () Bool)

(assert (=> b!256295 (= e!166123 e!166120)))

(declare-fun res!125391 () Bool)

(assert (=> b!256295 (= res!125391 call!24255)))

(assert (=> b!256295 (=> (not res!125391) (not e!166120))))

(declare-fun res!125385 () Bool)

(assert (=> start!24470 (=> (not res!125385) (not e!166122))))

(declare-fun valid!1488 (LongMapFixedSize!3790) Bool)

(assert (=> start!24470 (= res!125385 (valid!1488 thiss!1504))))

(assert (=> start!24470 e!166122))

(assert (=> start!24470 e!166124))

(assert (=> start!24470 true))

(assert (=> start!24470 tp_is_empty!6577))

(declare-fun mapNonEmpty!11193 () Bool)

(declare-fun tp!23444 () Bool)

(assert (=> mapNonEmpty!11193 (= mapRes!11193 (and tp!23444 e!166118))))

(declare-fun mapKey!11193 () (_ BitVec 32))

(declare-fun mapValue!11193 () ValueCell!2945)

(declare-fun mapRest!11193 () (Array (_ BitVec 32) ValueCell!2945))

(assert (=> mapNonEmpty!11193 (= (arr!5917 (_values!4711 thiss!1504)) (store mapRest!11193 mapKey!11193 mapValue!11193))))

(declare-fun bm!24251 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24251 (= call!24255 (inRange!0 (ite c!43319 (index!6686 lt!128703) (index!6689 lt!128703)) (mask!11000 thiss!1504)))))

(declare-fun bm!24252 () Bool)

(assert (=> bm!24252 (= call!24254 (arrayContainsKey!0 (_keys!6890 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256296 () Bool)

(assert (=> b!256296 (= e!166119 e!166112)))

(declare-fun res!125386 () Bool)

(assert (=> b!256296 (=> (not res!125386) (not e!166112))))

(assert (=> b!256296 (= res!125386 (inRange!0 index!297 (mask!11000 thiss!1504)))))

(declare-fun lt!128700 () Unit!7922)

(assert (=> b!256296 (= lt!128700 e!166126)))

(declare-fun c!43316 () Bool)

(declare-fun contains!1837 (ListLongMap!3737 (_ BitVec 64)) Bool)

(assert (=> b!256296 (= c!43316 (contains!1837 lt!128693 key!932))))

(assert (=> b!256296 (= lt!128693 (getCurrentListMap!1416 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun b!256297 () Bool)

(declare-fun c!43317 () Bool)

(assert (=> b!256297 (= c!43317 ((_ is MissingVacant!1129) lt!128703))))

(assert (=> b!256297 (= e!166117 e!166123)))

(assert (= (and start!24470 res!125385) b!256287))

(assert (= (and b!256287 res!125390) b!256281))

(assert (= (and b!256281 res!125383) b!256296))

(assert (= (and b!256296 c!43316) b!256290))

(assert (= (and b!256296 (not c!43316)) b!256293))

(assert (= (and b!256293 c!43319) b!256284))

(assert (= (and b!256293 (not c!43319)) b!256297))

(assert (= (and b!256284 res!125384) b!256289))

(assert (= (and b!256289 res!125388) b!256288))

(assert (= (and b!256297 c!43317) b!256295))

(assert (= (and b!256297 (not c!43317)) b!256278))

(assert (= (and b!256295 res!125391) b!256292))

(assert (= (and b!256292 res!125389) b!256291))

(assert (= (or b!256284 b!256295) bm!24251))

(assert (= (or b!256288 b!256291) bm!24252))

(assert (= (and b!256296 res!125386) b!256279))

(assert (= (and b!256279 c!43318) b!256282))

(assert (= (and b!256279 (not c!43318)) b!256277))

(assert (= (and b!256279 (not res!125387)) b!256294))

(assert (= (and b!256286 condMapEmpty!11193) mapIsEmpty!11193))

(assert (= (and b!256286 (not condMapEmpty!11193)) mapNonEmpty!11193))

(assert (= (and mapNonEmpty!11193 ((_ is ValueCellFull!2945) mapValue!11193)) b!256280))

(assert (= (and b!256286 ((_ is ValueCellFull!2945) mapDefault!11193)) b!256285))

(assert (= b!256283 b!256286))

(assert (= start!24470 b!256283))

(declare-fun m!271807 () Bool)

(assert (=> b!256296 m!271807))

(declare-fun m!271809 () Bool)

(assert (=> b!256296 m!271809))

(declare-fun m!271811 () Bool)

(assert (=> b!256296 m!271811))

(declare-fun m!271813 () Bool)

(assert (=> mapNonEmpty!11193 m!271813))

(declare-fun m!271815 () Bool)

(assert (=> start!24470 m!271815))

(declare-fun m!271817 () Bool)

(assert (=> b!256283 m!271817))

(declare-fun m!271819 () Bool)

(assert (=> b!256283 m!271819))

(declare-fun m!271821 () Bool)

(assert (=> b!256279 m!271821))

(declare-fun m!271823 () Bool)

(assert (=> b!256279 m!271823))

(declare-fun m!271825 () Bool)

(assert (=> b!256279 m!271825))

(declare-fun m!271827 () Bool)

(assert (=> b!256279 m!271827))

(declare-fun m!271829 () Bool)

(assert (=> b!256279 m!271829))

(declare-fun m!271831 () Bool)

(assert (=> b!256279 m!271831))

(declare-fun m!271833 () Bool)

(assert (=> b!256279 m!271833))

(declare-fun m!271835 () Bool)

(assert (=> b!256279 m!271835))

(declare-fun m!271837 () Bool)

(assert (=> b!256279 m!271837))

(declare-fun m!271839 () Bool)

(assert (=> b!256279 m!271839))

(declare-fun m!271841 () Bool)

(assert (=> b!256279 m!271841))

(declare-fun m!271843 () Bool)

(assert (=> b!256279 m!271843))

(declare-fun m!271845 () Bool)

(assert (=> b!256279 m!271845))

(declare-fun m!271847 () Bool)

(assert (=> b!256293 m!271847))

(declare-fun m!271849 () Bool)

(assert (=> b!256281 m!271849))

(declare-fun m!271851 () Bool)

(assert (=> b!256292 m!271851))

(assert (=> bm!24252 m!271821))

(declare-fun m!271853 () Bool)

(assert (=> bm!24251 m!271853))

(declare-fun m!271855 () Bool)

(assert (=> b!256289 m!271855))

(declare-fun m!271857 () Bool)

(assert (=> b!256294 m!271857))

(declare-fun m!271859 () Bool)

(assert (=> b!256282 m!271859))

(declare-fun m!271861 () Bool)

(assert (=> b!256290 m!271861))

(check-sat (not start!24470) b_and!13787 (not bm!24251) (not b!256294) (not bm!24252) (not b!256279) (not b!256296) (not b!256290) (not b!256293) (not b!256283) tp_is_empty!6577 (not b!256281) (not mapNonEmpty!11193) (not b!256282) (not b_next!6715))
(check-sat b_and!13787 (not b_next!6715))
(get-model)

(declare-fun b!256440 () Bool)

(declare-fun e!166225 () Bool)

(declare-fun call!24273 () Bool)

(assert (=> b!256440 (= e!166225 (not call!24273))))

(declare-fun b!256441 () Bool)

(declare-fun lt!128781 () SeekEntryResult!1129)

(assert (=> b!256441 (and (bvsge (index!6686 lt!128781) #b00000000000000000000000000000000) (bvslt (index!6686 lt!128781) (size!6265 (_keys!6890 thiss!1504))))))

(declare-fun res!125454 () Bool)

(assert (=> b!256441 (= res!125454 (= (select (arr!5918 (_keys!6890 thiss!1504)) (index!6686 lt!128781)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166228 () Bool)

(assert (=> b!256441 (=> (not res!125454) (not e!166228))))

(declare-fun d!61743 () Bool)

(declare-fun e!166226 () Bool)

(assert (=> d!61743 e!166226))

(declare-fun c!43349 () Bool)

(assert (=> d!61743 (= c!43349 ((_ is MissingZero!1129) lt!128781))))

(assert (=> d!61743 (= lt!128781 (seekEntryOrOpen!0 key!932 (_keys!6890 thiss!1504) (mask!11000 thiss!1504)))))

(declare-fun lt!128780 () Unit!7922)

(declare-fun choose!1235 (array!12493 array!12491 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 64) Int) Unit!7922)

(assert (=> d!61743 (= lt!128780 (choose!1235 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 (defaultEntry!4728 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61743 (validMask!0 (mask!11000 thiss!1504))))

(assert (=> d!61743 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!416 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 (defaultEntry!4728 thiss!1504)) lt!128780)))

(declare-fun bm!24269 () Bool)

(declare-fun call!24272 () Bool)

(assert (=> bm!24269 (= call!24272 (inRange!0 (ite c!43349 (index!6686 lt!128781) (index!6689 lt!128781)) (mask!11000 thiss!1504)))))

(declare-fun b!256442 () Bool)

(declare-fun e!166227 () Bool)

(assert (=> b!256442 (= e!166226 e!166227)))

(declare-fun c!43348 () Bool)

(assert (=> b!256442 (= c!43348 ((_ is MissingVacant!1129) lt!128781))))

(declare-fun b!256443 () Bool)

(assert (=> b!256443 (= e!166228 (not call!24273))))

(declare-fun b!256444 () Bool)

(assert (=> b!256444 (= e!166227 ((_ is Undefined!1129) lt!128781))))

(declare-fun b!256445 () Bool)

(assert (=> b!256445 (= e!166226 e!166228)))

(declare-fun res!125457 () Bool)

(assert (=> b!256445 (= res!125457 call!24272)))

(assert (=> b!256445 (=> (not res!125457) (not e!166228))))

(declare-fun bm!24270 () Bool)

(assert (=> bm!24270 (= call!24273 (arrayContainsKey!0 (_keys!6890 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256446 () Bool)

(declare-fun res!125456 () Bool)

(assert (=> b!256446 (=> (not res!125456) (not e!166225))))

(assert (=> b!256446 (= res!125456 (= (select (arr!5918 (_keys!6890 thiss!1504)) (index!6689 lt!128781)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256446 (and (bvsge (index!6689 lt!128781) #b00000000000000000000000000000000) (bvslt (index!6689 lt!128781) (size!6265 (_keys!6890 thiss!1504))))))

(declare-fun b!256447 () Bool)

(declare-fun res!125455 () Bool)

(assert (=> b!256447 (=> (not res!125455) (not e!166225))))

(assert (=> b!256447 (= res!125455 call!24272)))

(assert (=> b!256447 (= e!166227 e!166225)))

(assert (= (and d!61743 c!43349) b!256445))

(assert (= (and d!61743 (not c!43349)) b!256442))

(assert (= (and b!256445 res!125457) b!256441))

(assert (= (and b!256441 res!125454) b!256443))

(assert (= (and b!256442 c!43348) b!256447))

(assert (= (and b!256442 (not c!43348)) b!256444))

(assert (= (and b!256447 res!125455) b!256446))

(assert (= (and b!256446 res!125456) b!256440))

(assert (= (or b!256445 b!256447) bm!24269))

(assert (= (or b!256443 b!256440) bm!24270))

(declare-fun m!271975 () Bool)

(assert (=> b!256441 m!271975))

(declare-fun m!271977 () Bool)

(assert (=> bm!24269 m!271977))

(assert (=> bm!24270 m!271821))

(assert (=> d!61743 m!271849))

(declare-fun m!271979 () Bool)

(assert (=> d!61743 m!271979))

(declare-fun m!271981 () Bool)

(assert (=> d!61743 m!271981))

(declare-fun m!271983 () Bool)

(assert (=> b!256446 m!271983))

(assert (=> b!256293 d!61743))

(declare-fun b!256458 () Bool)

(declare-fun e!166234 () Bool)

(assert (=> b!256458 (= e!166234 (bvslt (size!6265 (_keys!6890 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!61745 () Bool)

(declare-fun e!166233 () Bool)

(assert (=> d!61745 e!166233))

(declare-fun res!125468 () Bool)

(assert (=> d!61745 (=> (not res!125468) (not e!166233))))

(assert (=> d!61745 (= res!125468 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6265 (_keys!6890 thiss!1504)))))))

(declare-fun lt!128784 () Unit!7922)

(declare-fun choose!1 (array!12493 (_ BitVec 32) (_ BitVec 64)) Unit!7922)

(assert (=> d!61745 (= lt!128784 (choose!1 (_keys!6890 thiss!1504) index!297 key!932))))

(assert (=> d!61745 e!166234))

(declare-fun res!125467 () Bool)

(assert (=> d!61745 (=> (not res!125467) (not e!166234))))

(assert (=> d!61745 (= res!125467 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6265 (_keys!6890 thiss!1504)))))))

(assert (=> d!61745 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6890 thiss!1504) index!297 key!932) lt!128784)))

(declare-fun b!256459 () Bool)

(assert (=> b!256459 (= e!166233 (= (arrayCountValidKeys!0 (array!12494 (store (arr!5918 (_keys!6890 thiss!1504)) index!297 key!932) (size!6265 (_keys!6890 thiss!1504))) #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6890 thiss!1504) #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!256457 () Bool)

(declare-fun res!125469 () Bool)

(assert (=> b!256457 (=> (not res!125469) (not e!166234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!256457 (= res!125469 (validKeyInArray!0 key!932))))

(declare-fun b!256456 () Bool)

(declare-fun res!125466 () Bool)

(assert (=> b!256456 (=> (not res!125466) (not e!166234))))

(assert (=> b!256456 (= res!125466 (not (validKeyInArray!0 (select (arr!5918 (_keys!6890 thiss!1504)) index!297))))))

(assert (= (and d!61745 res!125467) b!256456))

(assert (= (and b!256456 res!125466) b!256457))

(assert (= (and b!256457 res!125469) b!256458))

(assert (= (and d!61745 res!125468) b!256459))

(declare-fun m!271985 () Bool)

(assert (=> d!61745 m!271985))

(assert (=> b!256459 m!271835))

(declare-fun m!271987 () Bool)

(assert (=> b!256459 m!271987))

(assert (=> b!256459 m!271843))

(declare-fun m!271989 () Bool)

(assert (=> b!256457 m!271989))

(declare-fun m!271991 () Bool)

(assert (=> b!256456 m!271991))

(assert (=> b!256456 m!271991))

(declare-fun m!271993 () Bool)

(assert (=> b!256456 m!271993))

(assert (=> b!256279 d!61745))

(declare-fun d!61747 () Bool)

(declare-fun lt!128787 () (_ BitVec 32))

(assert (=> d!61747 (and (bvsge lt!128787 #b00000000000000000000000000000000) (bvsle lt!128787 (bvsub (size!6265 lt!128692) #b00000000000000000000000000000000)))))

(declare-fun e!166240 () (_ BitVec 32))

(assert (=> d!61747 (= lt!128787 e!166240)))

(declare-fun c!43355 () Bool)

(assert (=> d!61747 (= c!43355 (bvsge #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))))))

(assert (=> d!61747 (and (bvsle #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6265 (_keys!6890 thiss!1504)) (size!6265 lt!128692)))))

(assert (=> d!61747 (= (arrayCountValidKeys!0 lt!128692 #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))) lt!128787)))

(declare-fun b!256468 () Bool)

(declare-fun e!166239 () (_ BitVec 32))

(assert (=> b!256468 (= e!166240 e!166239)))

(declare-fun c!43354 () Bool)

(assert (=> b!256468 (= c!43354 (validKeyInArray!0 (select (arr!5918 lt!128692) #b00000000000000000000000000000000)))))

(declare-fun b!256469 () Bool)

(declare-fun call!24276 () (_ BitVec 32))

(assert (=> b!256469 (= e!166239 (bvadd #b00000000000000000000000000000001 call!24276))))

(declare-fun bm!24273 () Bool)

(assert (=> bm!24273 (= call!24276 (arrayCountValidKeys!0 lt!128692 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6265 (_keys!6890 thiss!1504))))))

(declare-fun b!256470 () Bool)

(assert (=> b!256470 (= e!166239 call!24276)))

(declare-fun b!256471 () Bool)

(assert (=> b!256471 (= e!166240 #b00000000000000000000000000000000)))

(assert (= (and d!61747 c!43355) b!256471))

(assert (= (and d!61747 (not c!43355)) b!256468))

(assert (= (and b!256468 c!43354) b!256469))

(assert (= (and b!256468 (not c!43354)) b!256470))

(assert (= (or b!256469 b!256470) bm!24273))

(declare-fun m!271995 () Bool)

(assert (=> b!256468 m!271995))

(assert (=> b!256468 m!271995))

(declare-fun m!271997 () Bool)

(assert (=> b!256468 m!271997))

(declare-fun m!271999 () Bool)

(assert (=> bm!24273 m!271999))

(assert (=> b!256279 d!61747))

(declare-fun d!61749 () Bool)

(declare-fun lt!128788 () (_ BitVec 32))

(assert (=> d!61749 (and (bvsge lt!128788 #b00000000000000000000000000000000) (bvsle lt!128788 (bvsub (size!6265 (_keys!6890 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!166242 () (_ BitVec 32))

(assert (=> d!61749 (= lt!128788 e!166242)))

(declare-fun c!43357 () Bool)

(assert (=> d!61749 (= c!43357 (bvsge #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))))))

(assert (=> d!61749 (and (bvsle #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6265 (_keys!6890 thiss!1504)) (size!6265 (_keys!6890 thiss!1504))))))

(assert (=> d!61749 (= (arrayCountValidKeys!0 (_keys!6890 thiss!1504) #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))) lt!128788)))

(declare-fun b!256472 () Bool)

(declare-fun e!166241 () (_ BitVec 32))

(assert (=> b!256472 (= e!166242 e!166241)))

(declare-fun c!43356 () Bool)

(assert (=> b!256472 (= c!43356 (validKeyInArray!0 (select (arr!5918 (_keys!6890 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!256473 () Bool)

(declare-fun call!24277 () (_ BitVec 32))

(assert (=> b!256473 (= e!166241 (bvadd #b00000000000000000000000000000001 call!24277))))

(declare-fun bm!24274 () Bool)

(assert (=> bm!24274 (= call!24277 (arrayCountValidKeys!0 (_keys!6890 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6265 (_keys!6890 thiss!1504))))))

(declare-fun b!256474 () Bool)

(assert (=> b!256474 (= e!166241 call!24277)))

(declare-fun b!256475 () Bool)

(assert (=> b!256475 (= e!166242 #b00000000000000000000000000000000)))

(assert (= (and d!61749 c!43357) b!256475))

(assert (= (and d!61749 (not c!43357)) b!256472))

(assert (= (and b!256472 c!43356) b!256473))

(assert (= (and b!256472 (not c!43356)) b!256474))

(assert (= (or b!256473 b!256474) bm!24274))

(declare-fun m!272001 () Bool)

(assert (=> b!256472 m!272001))

(assert (=> b!256472 m!272001))

(declare-fun m!272003 () Bool)

(assert (=> b!256472 m!272003))

(declare-fun m!272005 () Bool)

(assert (=> bm!24274 m!272005))

(assert (=> b!256279 d!61749))

(declare-fun b!256484 () Bool)

(declare-fun e!166251 () Bool)

(declare-fun call!24280 () Bool)

(assert (=> b!256484 (= e!166251 call!24280)))

(declare-fun b!256485 () Bool)

(declare-fun e!166250 () Bool)

(assert (=> b!256485 (= e!166250 call!24280)))

(declare-fun bm!24277 () Bool)

(assert (=> bm!24277 (= call!24280 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!128692 (mask!11000 thiss!1504)))))

(declare-fun d!61751 () Bool)

(declare-fun res!125475 () Bool)

(declare-fun e!166249 () Bool)

(assert (=> d!61751 (=> res!125475 e!166249)))

(assert (=> d!61751 (= res!125475 (bvsge #b00000000000000000000000000000000 (size!6265 lt!128692)))))

(assert (=> d!61751 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128692 (mask!11000 thiss!1504)) e!166249)))

(declare-fun b!256486 () Bool)

(assert (=> b!256486 (= e!166250 e!166251)))

(declare-fun lt!128796 () (_ BitVec 64))

(assert (=> b!256486 (= lt!128796 (select (arr!5918 lt!128692) #b00000000000000000000000000000000))))

(declare-fun lt!128795 () Unit!7922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12493 (_ BitVec 64) (_ BitVec 32)) Unit!7922)

(assert (=> b!256486 (= lt!128795 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128692 lt!128796 #b00000000000000000000000000000000))))

(assert (=> b!256486 (arrayContainsKey!0 lt!128692 lt!128796 #b00000000000000000000000000000000)))

(declare-fun lt!128797 () Unit!7922)

(assert (=> b!256486 (= lt!128797 lt!128795)))

(declare-fun res!125474 () Bool)

(assert (=> b!256486 (= res!125474 (= (seekEntryOrOpen!0 (select (arr!5918 lt!128692) #b00000000000000000000000000000000) lt!128692 (mask!11000 thiss!1504)) (Found!1129 #b00000000000000000000000000000000)))))

(assert (=> b!256486 (=> (not res!125474) (not e!166251))))

(declare-fun b!256487 () Bool)

(assert (=> b!256487 (= e!166249 e!166250)))

(declare-fun c!43360 () Bool)

(assert (=> b!256487 (= c!43360 (validKeyInArray!0 (select (arr!5918 lt!128692) #b00000000000000000000000000000000)))))

(assert (= (and d!61751 (not res!125475)) b!256487))

(assert (= (and b!256487 c!43360) b!256486))

(assert (= (and b!256487 (not c!43360)) b!256485))

(assert (= (and b!256486 res!125474) b!256484))

(assert (= (or b!256484 b!256485) bm!24277))

(declare-fun m!272007 () Bool)

(assert (=> bm!24277 m!272007))

(assert (=> b!256486 m!271995))

(declare-fun m!272009 () Bool)

(assert (=> b!256486 m!272009))

(declare-fun m!272011 () Bool)

(assert (=> b!256486 m!272011))

(assert (=> b!256486 m!271995))

(declare-fun m!272013 () Bool)

(assert (=> b!256486 m!272013))

(assert (=> b!256487 m!271995))

(assert (=> b!256487 m!271995))

(assert (=> b!256487 m!271997))

(assert (=> b!256279 d!61751))

(declare-fun bm!24292 () Bool)

(declare-fun call!24298 () Bool)

(declare-fun lt!128854 () ListLongMap!3737)

(assert (=> bm!24292 (= call!24298 (contains!1837 lt!128854 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256530 () Bool)

(declare-fun e!166280 () Bool)

(declare-fun apply!251 (ListLongMap!3737 (_ BitVec 64)) V!8417)

(declare-fun get!3050 (ValueCell!2945 V!8417) V!8417)

(declare-fun dynLambda!594 (Int (_ BitVec 64)) V!8417)

(assert (=> b!256530 (= e!166280 (= (apply!251 lt!128854 (select (arr!5918 lt!128692) #b00000000000000000000000000000000)) (get!3050 (select (arr!5917 (array!12492 (store (arr!5917 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6264 (_values!4711 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!594 (defaultEntry!4728 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256530 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6264 (array!12492 (store (arr!5917 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6264 (_values!4711 thiss!1504))))))))

(assert (=> b!256530 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6265 lt!128692)))))

(declare-fun b!256531 () Bool)

(declare-fun e!166290 () ListLongMap!3737)

(declare-fun call!24297 () ListLongMap!3737)

(assert (=> b!256531 (= e!166290 call!24297)))

(declare-fun b!256532 () Bool)

(declare-fun e!166281 () Bool)

(assert (=> b!256532 (= e!166281 (= (apply!251 lt!128854 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4569 thiss!1504)))))

(declare-fun bm!24293 () Bool)

(declare-fun call!24296 () ListLongMap!3737)

(declare-fun call!24295 () ListLongMap!3737)

(assert (=> bm!24293 (= call!24296 call!24295)))

(declare-fun d!61753 () Bool)

(declare-fun e!166284 () Bool)

(assert (=> d!61753 e!166284))

(declare-fun res!125497 () Bool)

(assert (=> d!61753 (=> (not res!125497) (not e!166284))))

(assert (=> d!61753 (= res!125497 (or (bvsge #b00000000000000000000000000000000 (size!6265 lt!128692)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6265 lt!128692)))))))

(declare-fun lt!128842 () ListLongMap!3737)

(assert (=> d!61753 (= lt!128854 lt!128842)))

(declare-fun lt!128847 () Unit!7922)

(declare-fun e!166289 () Unit!7922)

(assert (=> d!61753 (= lt!128847 e!166289)))

(declare-fun c!43375 () Bool)

(declare-fun e!166282 () Bool)

(assert (=> d!61753 (= c!43375 e!166282)))

(declare-fun res!125501 () Bool)

(assert (=> d!61753 (=> (not res!125501) (not e!166282))))

(assert (=> d!61753 (= res!125501 (bvslt #b00000000000000000000000000000000 (size!6265 lt!128692)))))

(declare-fun e!166286 () ListLongMap!3737)

(assert (=> d!61753 (= lt!128842 e!166286)))

(declare-fun c!43373 () Bool)

(assert (=> d!61753 (= c!43373 (and (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61753 (validMask!0 (mask!11000 thiss!1504))))

(assert (=> d!61753 (= (getCurrentListMap!1416 lt!128692 (array!12492 (store (arr!5917 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6264 (_values!4711 thiss!1504))) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)) lt!128854)))

(declare-fun b!256533 () Bool)

(declare-fun e!166285 () Bool)

(assert (=> b!256533 (= e!166284 e!166285)))

(declare-fun c!43377 () Bool)

(assert (=> b!256533 (= c!43377 (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256534 () Bool)

(declare-fun e!166283 () Bool)

(assert (=> b!256534 (= e!166283 (not call!24298))))

(declare-fun b!256535 () Bool)

(declare-fun call!24299 () Bool)

(assert (=> b!256535 (= e!166285 (not call!24299))))

(declare-fun bm!24294 () Bool)

(declare-fun call!24301 () ListLongMap!3737)

(declare-fun getCurrentListMapNoExtraKeys!567 (array!12493 array!12491 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 32) Int) ListLongMap!3737)

(assert (=> bm!24294 (= call!24301 (getCurrentListMapNoExtraKeys!567 lt!128692 (array!12492 (store (arr!5917 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6264 (_values!4711 thiss!1504))) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun b!256536 () Bool)

(declare-fun e!166288 () Bool)

(assert (=> b!256536 (= e!166288 (= (apply!251 lt!128854 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4569 thiss!1504)))))

(declare-fun b!256537 () Bool)

(declare-fun e!166279 () Bool)

(assert (=> b!256537 (= e!166279 e!166280)))

(declare-fun res!125496 () Bool)

(assert (=> b!256537 (=> (not res!125496) (not e!166280))))

(assert (=> b!256537 (= res!125496 (contains!1837 lt!128854 (select (arr!5918 lt!128692) #b00000000000000000000000000000000)))))

(assert (=> b!256537 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6265 lt!128692)))))

(declare-fun bm!24295 () Bool)

(declare-fun c!43378 () Bool)

(declare-fun call!24300 () ListLongMap!3737)

(assert (=> bm!24295 (= call!24300 (+!682 (ite c!43373 call!24301 (ite c!43378 call!24295 call!24296)) (ite (or c!43373 c!43378) (tuple2!4823 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4569 thiss!1504)) (tuple2!4823 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4569 thiss!1504)))))))

(declare-fun b!256538 () Bool)

(declare-fun res!125494 () Bool)

(assert (=> b!256538 (=> (not res!125494) (not e!166284))))

(assert (=> b!256538 (= res!125494 e!166283)))

(declare-fun c!43374 () Bool)

(assert (=> b!256538 (= c!43374 (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!256539 () Bool)

(assert (=> b!256539 (= e!166286 e!166290)))

(assert (=> b!256539 (= c!43378 (and (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256540 () Bool)

(declare-fun e!166287 () ListLongMap!3737)

(assert (=> b!256540 (= e!166287 call!24297)))

(declare-fun bm!24296 () Bool)

(assert (=> bm!24296 (= call!24299 (contains!1837 lt!128854 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256541 () Bool)

(assert (=> b!256541 (= e!166283 e!166288)))

(declare-fun res!125498 () Bool)

(assert (=> b!256541 (= res!125498 call!24298)))

(assert (=> b!256541 (=> (not res!125498) (not e!166288))))

(declare-fun b!256542 () Bool)

(declare-fun res!125499 () Bool)

(assert (=> b!256542 (=> (not res!125499) (not e!166284))))

(assert (=> b!256542 (= res!125499 e!166279)))

(declare-fun res!125495 () Bool)

(assert (=> b!256542 (=> res!125495 e!166279)))

(declare-fun e!166278 () Bool)

(assert (=> b!256542 (= res!125495 (not e!166278))))

(declare-fun res!125502 () Bool)

(assert (=> b!256542 (=> (not res!125502) (not e!166278))))

(assert (=> b!256542 (= res!125502 (bvslt #b00000000000000000000000000000000 (size!6265 lt!128692)))))

(declare-fun b!256543 () Bool)

(assert (=> b!256543 (= e!166286 (+!682 call!24300 (tuple2!4823 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4569 thiss!1504))))))

(declare-fun b!256544 () Bool)

(declare-fun Unit!7934 () Unit!7922)

(assert (=> b!256544 (= e!166289 Unit!7934)))

(declare-fun b!256545 () Bool)

(declare-fun c!43376 () Bool)

(assert (=> b!256545 (= c!43376 (and (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!256545 (= e!166290 e!166287)))

(declare-fun b!256546 () Bool)

(assert (=> b!256546 (= e!166282 (validKeyInArray!0 (select (arr!5918 lt!128692) #b00000000000000000000000000000000)))))

(declare-fun b!256547 () Bool)

(assert (=> b!256547 (= e!166278 (validKeyInArray!0 (select (arr!5918 lt!128692) #b00000000000000000000000000000000)))))

(declare-fun b!256548 () Bool)

(declare-fun lt!128843 () Unit!7922)

(assert (=> b!256548 (= e!166289 lt!128843)))

(declare-fun lt!128848 () ListLongMap!3737)

(assert (=> b!256548 (= lt!128848 (getCurrentListMapNoExtraKeys!567 lt!128692 (array!12492 (store (arr!5917 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6264 (_values!4711 thiss!1504))) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128862 () (_ BitVec 64))

(assert (=> b!256548 (= lt!128862 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128853 () (_ BitVec 64))

(assert (=> b!256548 (= lt!128853 (select (arr!5918 lt!128692) #b00000000000000000000000000000000))))

(declare-fun lt!128861 () Unit!7922)

(declare-fun addStillContains!227 (ListLongMap!3737 (_ BitVec 64) V!8417 (_ BitVec 64)) Unit!7922)

(assert (=> b!256548 (= lt!128861 (addStillContains!227 lt!128848 lt!128862 (zeroValue!4569 thiss!1504) lt!128853))))

(assert (=> b!256548 (contains!1837 (+!682 lt!128848 (tuple2!4823 lt!128862 (zeroValue!4569 thiss!1504))) lt!128853)))

(declare-fun lt!128844 () Unit!7922)

(assert (=> b!256548 (= lt!128844 lt!128861)))

(declare-fun lt!128850 () ListLongMap!3737)

(assert (=> b!256548 (= lt!128850 (getCurrentListMapNoExtraKeys!567 lt!128692 (array!12492 (store (arr!5917 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6264 (_values!4711 thiss!1504))) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128849 () (_ BitVec 64))

(assert (=> b!256548 (= lt!128849 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128855 () (_ BitVec 64))

(assert (=> b!256548 (= lt!128855 (select (arr!5918 lt!128692) #b00000000000000000000000000000000))))

(declare-fun lt!128856 () Unit!7922)

(declare-fun addApplyDifferent!227 (ListLongMap!3737 (_ BitVec 64) V!8417 (_ BitVec 64)) Unit!7922)

(assert (=> b!256548 (= lt!128856 (addApplyDifferent!227 lt!128850 lt!128849 (minValue!4569 thiss!1504) lt!128855))))

(assert (=> b!256548 (= (apply!251 (+!682 lt!128850 (tuple2!4823 lt!128849 (minValue!4569 thiss!1504))) lt!128855) (apply!251 lt!128850 lt!128855))))

(declare-fun lt!128857 () Unit!7922)

(assert (=> b!256548 (= lt!128857 lt!128856)))

(declare-fun lt!128863 () ListLongMap!3737)

(assert (=> b!256548 (= lt!128863 (getCurrentListMapNoExtraKeys!567 lt!128692 (array!12492 (store (arr!5917 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6264 (_values!4711 thiss!1504))) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128845 () (_ BitVec 64))

(assert (=> b!256548 (= lt!128845 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128859 () (_ BitVec 64))

(assert (=> b!256548 (= lt!128859 (select (arr!5918 lt!128692) #b00000000000000000000000000000000))))

(declare-fun lt!128851 () Unit!7922)

(assert (=> b!256548 (= lt!128851 (addApplyDifferent!227 lt!128863 lt!128845 (zeroValue!4569 thiss!1504) lt!128859))))

(assert (=> b!256548 (= (apply!251 (+!682 lt!128863 (tuple2!4823 lt!128845 (zeroValue!4569 thiss!1504))) lt!128859) (apply!251 lt!128863 lt!128859))))

(declare-fun lt!128860 () Unit!7922)

(assert (=> b!256548 (= lt!128860 lt!128851)))

(declare-fun lt!128846 () ListLongMap!3737)

(assert (=> b!256548 (= lt!128846 (getCurrentListMapNoExtraKeys!567 lt!128692 (array!12492 (store (arr!5917 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6264 (_values!4711 thiss!1504))) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128858 () (_ BitVec 64))

(assert (=> b!256548 (= lt!128858 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128852 () (_ BitVec 64))

(assert (=> b!256548 (= lt!128852 (select (arr!5918 lt!128692) #b00000000000000000000000000000000))))

(assert (=> b!256548 (= lt!128843 (addApplyDifferent!227 lt!128846 lt!128858 (minValue!4569 thiss!1504) lt!128852))))

(assert (=> b!256548 (= (apply!251 (+!682 lt!128846 (tuple2!4823 lt!128858 (minValue!4569 thiss!1504))) lt!128852) (apply!251 lt!128846 lt!128852))))

(declare-fun b!256549 () Bool)

(assert (=> b!256549 (= e!166285 e!166281)))

(declare-fun res!125500 () Bool)

(assert (=> b!256549 (= res!125500 call!24299)))

(assert (=> b!256549 (=> (not res!125500) (not e!166281))))

(declare-fun b!256550 () Bool)

(assert (=> b!256550 (= e!166287 call!24296)))

(declare-fun bm!24297 () Bool)

(assert (=> bm!24297 (= call!24295 call!24301)))

(declare-fun bm!24298 () Bool)

(assert (=> bm!24298 (= call!24297 call!24300)))

(assert (= (and d!61753 c!43373) b!256543))

(assert (= (and d!61753 (not c!43373)) b!256539))

(assert (= (and b!256539 c!43378) b!256531))

(assert (= (and b!256539 (not c!43378)) b!256545))

(assert (= (and b!256545 c!43376) b!256540))

(assert (= (and b!256545 (not c!43376)) b!256550))

(assert (= (or b!256540 b!256550) bm!24293))

(assert (= (or b!256531 bm!24293) bm!24297))

(assert (= (or b!256531 b!256540) bm!24298))

(assert (= (or b!256543 bm!24297) bm!24294))

(assert (= (or b!256543 bm!24298) bm!24295))

(assert (= (and d!61753 res!125501) b!256546))

(assert (= (and d!61753 c!43375) b!256548))

(assert (= (and d!61753 (not c!43375)) b!256544))

(assert (= (and d!61753 res!125497) b!256542))

(assert (= (and b!256542 res!125502) b!256547))

(assert (= (and b!256542 (not res!125495)) b!256537))

(assert (= (and b!256537 res!125496) b!256530))

(assert (= (and b!256542 res!125499) b!256538))

(assert (= (and b!256538 c!43374) b!256541))

(assert (= (and b!256538 (not c!43374)) b!256534))

(assert (= (and b!256541 res!125498) b!256536))

(assert (= (or b!256541 b!256534) bm!24292))

(assert (= (and b!256538 res!125494) b!256533))

(assert (= (and b!256533 c!43377) b!256549))

(assert (= (and b!256533 (not c!43377)) b!256535))

(assert (= (and b!256549 res!125500) b!256532))

(assert (= (or b!256549 b!256535) bm!24296))

(declare-fun b_lambda!8185 () Bool)

(assert (=> (not b_lambda!8185) (not b!256530)))

(declare-fun t!8754 () Bool)

(declare-fun tb!3007 () Bool)

(assert (=> (and b!256283 (= (defaultEntry!4728 thiss!1504) (defaultEntry!4728 thiss!1504)) t!8754) tb!3007))

(declare-fun result!5359 () Bool)

(assert (=> tb!3007 (= result!5359 tp_is_empty!6577)))

(assert (=> b!256530 t!8754))

(declare-fun b_and!13793 () Bool)

(assert (= b_and!13787 (and (=> t!8754 result!5359) b_and!13793)))

(assert (=> b!256537 m!271995))

(assert (=> b!256537 m!271995))

(declare-fun m!272015 () Bool)

(assert (=> b!256537 m!272015))

(declare-fun m!272017 () Bool)

(assert (=> bm!24292 m!272017))

(declare-fun m!272019 () Bool)

(assert (=> b!256530 m!272019))

(declare-fun m!272021 () Bool)

(assert (=> b!256530 m!272021))

(declare-fun m!272023 () Bool)

(assert (=> b!256530 m!272023))

(assert (=> b!256530 m!272021))

(assert (=> b!256530 m!272019))

(assert (=> b!256530 m!271995))

(assert (=> b!256530 m!271995))

(declare-fun m!272025 () Bool)

(assert (=> b!256530 m!272025))

(assert (=> b!256547 m!271995))

(assert (=> b!256547 m!271995))

(assert (=> b!256547 m!271997))

(declare-fun m!272027 () Bool)

(assert (=> bm!24296 m!272027))

(declare-fun m!272029 () Bool)

(assert (=> b!256548 m!272029))

(declare-fun m!272031 () Bool)

(assert (=> b!256548 m!272031))

(declare-fun m!272033 () Bool)

(assert (=> b!256548 m!272033))

(declare-fun m!272035 () Bool)

(assert (=> b!256548 m!272035))

(declare-fun m!272037 () Bool)

(assert (=> b!256548 m!272037))

(declare-fun m!272039 () Bool)

(assert (=> b!256548 m!272039))

(declare-fun m!272041 () Bool)

(assert (=> b!256548 m!272041))

(assert (=> b!256548 m!272029))

(declare-fun m!272043 () Bool)

(assert (=> b!256548 m!272043))

(declare-fun m!272045 () Bool)

(assert (=> b!256548 m!272045))

(declare-fun m!272047 () Bool)

(assert (=> b!256548 m!272047))

(assert (=> b!256548 m!271995))

(declare-fun m!272049 () Bool)

(assert (=> b!256548 m!272049))

(assert (=> b!256548 m!272043))

(declare-fun m!272051 () Bool)

(assert (=> b!256548 m!272051))

(declare-fun m!272053 () Bool)

(assert (=> b!256548 m!272053))

(declare-fun m!272055 () Bool)

(assert (=> b!256548 m!272055))

(assert (=> b!256548 m!272037))

(declare-fun m!272057 () Bool)

(assert (=> b!256548 m!272057))

(assert (=> b!256548 m!272053))

(declare-fun m!272059 () Bool)

(assert (=> b!256548 m!272059))

(assert (=> bm!24294 m!272033))

(declare-fun m!272061 () Bool)

(assert (=> b!256536 m!272061))

(assert (=> b!256546 m!271995))

(assert (=> b!256546 m!271995))

(assert (=> b!256546 m!271997))

(declare-fun m!272063 () Bool)

(assert (=> b!256532 m!272063))

(declare-fun m!272065 () Bool)

(assert (=> b!256543 m!272065))

(declare-fun m!272067 () Bool)

(assert (=> bm!24295 m!272067))

(assert (=> d!61753 m!271981))

(assert (=> b!256279 d!61753))

(declare-fun b!256563 () Bool)

(declare-fun e!166301 () Bool)

(declare-fun e!166300 () Bool)

(assert (=> b!256563 (= e!166301 e!166300)))

(declare-fun res!125510 () Bool)

(assert (=> b!256563 (=> (not res!125510) (not e!166300))))

(declare-fun e!166299 () Bool)

(assert (=> b!256563 (= res!125510 (not e!166299))))

(declare-fun res!125509 () Bool)

(assert (=> b!256563 (=> (not res!125509) (not e!166299))))

(assert (=> b!256563 (= res!125509 (validKeyInArray!0 (select (arr!5918 lt!128692) #b00000000000000000000000000000000)))))

(declare-fun b!256564 () Bool)

(declare-fun contains!1840 (List!3702 (_ BitVec 64)) Bool)

(assert (=> b!256564 (= e!166299 (contains!1840 Nil!3699 (select (arr!5918 lt!128692) #b00000000000000000000000000000000)))))

(declare-fun b!256565 () Bool)

(declare-fun e!166302 () Bool)

(assert (=> b!256565 (= e!166300 e!166302)))

(declare-fun c!43381 () Bool)

(assert (=> b!256565 (= c!43381 (validKeyInArray!0 (select (arr!5918 lt!128692) #b00000000000000000000000000000000)))))

(declare-fun b!256566 () Bool)

(declare-fun call!24304 () Bool)

(assert (=> b!256566 (= e!166302 call!24304)))

(declare-fun bm!24301 () Bool)

(assert (=> bm!24301 (= call!24304 (arrayNoDuplicates!0 lt!128692 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43381 (Cons!3698 (select (arr!5918 lt!128692) #b00000000000000000000000000000000) Nil!3699) Nil!3699)))))

(declare-fun d!61755 () Bool)

(declare-fun res!125511 () Bool)

(assert (=> d!61755 (=> res!125511 e!166301)))

(assert (=> d!61755 (= res!125511 (bvsge #b00000000000000000000000000000000 (size!6265 lt!128692)))))

(assert (=> d!61755 (= (arrayNoDuplicates!0 lt!128692 #b00000000000000000000000000000000 Nil!3699) e!166301)))

(declare-fun b!256567 () Bool)

(assert (=> b!256567 (= e!166302 call!24304)))

(assert (= (and d!61755 (not res!125511)) b!256563))

(assert (= (and b!256563 res!125509) b!256564))

(assert (= (and b!256563 res!125510) b!256565))

(assert (= (and b!256565 c!43381) b!256566))

(assert (= (and b!256565 (not c!43381)) b!256567))

(assert (= (or b!256566 b!256567) bm!24301))

(assert (=> b!256563 m!271995))

(assert (=> b!256563 m!271995))

(assert (=> b!256563 m!271997))

(assert (=> b!256564 m!271995))

(assert (=> b!256564 m!271995))

(declare-fun m!272069 () Bool)

(assert (=> b!256564 m!272069))

(assert (=> b!256565 m!271995))

(assert (=> b!256565 m!271995))

(assert (=> b!256565 m!271997))

(assert (=> bm!24301 m!271995))

(declare-fun m!272071 () Bool)

(assert (=> bm!24301 m!272071))

(assert (=> b!256279 d!61755))

(declare-fun d!61757 () Bool)

(declare-fun e!166305 () Bool)

(assert (=> d!61757 e!166305))

(declare-fun res!125514 () Bool)

(assert (=> d!61757 (=> (not res!125514) (not e!166305))))

(assert (=> d!61757 (= res!125514 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6265 (_keys!6890 thiss!1504)))))))

(declare-fun lt!128866 () Unit!7922)

(declare-fun choose!41 (array!12493 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3702) Unit!7922)

(assert (=> d!61757 (= lt!128866 (choose!41 (_keys!6890 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3699))))

(assert (=> d!61757 (bvslt (size!6265 (_keys!6890 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61757 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6890 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3699) lt!128866)))

(declare-fun b!256570 () Bool)

(assert (=> b!256570 (= e!166305 (arrayNoDuplicates!0 (array!12494 (store (arr!5918 (_keys!6890 thiss!1504)) index!297 key!932) (size!6265 (_keys!6890 thiss!1504))) #b00000000000000000000000000000000 Nil!3699))))

(assert (= (and d!61757 res!125514) b!256570))

(declare-fun m!272073 () Bool)

(assert (=> d!61757 m!272073))

(assert (=> b!256570 m!271835))

(declare-fun m!272075 () Bool)

(assert (=> b!256570 m!272075))

(assert (=> b!256279 d!61757))

(declare-fun d!61759 () Bool)

(declare-fun res!125519 () Bool)

(declare-fun e!166310 () Bool)

(assert (=> d!61759 (=> res!125519 e!166310)))

(assert (=> d!61759 (= res!125519 (= (select (arr!5918 (_keys!6890 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61759 (= (arrayContainsKey!0 (_keys!6890 thiss!1504) key!932 #b00000000000000000000000000000000) e!166310)))

(declare-fun b!256575 () Bool)

(declare-fun e!166311 () Bool)

(assert (=> b!256575 (= e!166310 e!166311)))

(declare-fun res!125520 () Bool)

(assert (=> b!256575 (=> (not res!125520) (not e!166311))))

(assert (=> b!256575 (= res!125520 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6265 (_keys!6890 thiss!1504))))))

(declare-fun b!256576 () Bool)

(assert (=> b!256576 (= e!166311 (arrayContainsKey!0 (_keys!6890 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61759 (not res!125519)) b!256575))

(assert (= (and b!256575 res!125520) b!256576))

(assert (=> d!61759 m!272001))

(declare-fun m!272077 () Bool)

(assert (=> b!256576 m!272077))

(assert (=> b!256279 d!61759))

(declare-fun d!61761 () Bool)

(declare-fun e!166314 () Bool)

(assert (=> d!61761 e!166314))

(declare-fun res!125523 () Bool)

(assert (=> d!61761 (=> (not res!125523) (not e!166314))))

(assert (=> d!61761 (= res!125523 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6265 (_keys!6890 thiss!1504)))))))

(declare-fun lt!128869 () Unit!7922)

(declare-fun choose!102 ((_ BitVec 64) array!12493 (_ BitVec 32) (_ BitVec 32)) Unit!7922)

(assert (=> d!61761 (= lt!128869 (choose!102 key!932 (_keys!6890 thiss!1504) index!297 (mask!11000 thiss!1504)))))

(assert (=> d!61761 (validMask!0 (mask!11000 thiss!1504))))

(assert (=> d!61761 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6890 thiss!1504) index!297 (mask!11000 thiss!1504)) lt!128869)))

(declare-fun b!256579 () Bool)

(assert (=> b!256579 (= e!166314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12494 (store (arr!5918 (_keys!6890 thiss!1504)) index!297 key!932) (size!6265 (_keys!6890 thiss!1504))) (mask!11000 thiss!1504)))))

(assert (= (and d!61761 res!125523) b!256579))

(declare-fun m!272079 () Bool)

(assert (=> d!61761 m!272079))

(assert (=> d!61761 m!271981))

(assert (=> b!256579 m!271835))

(declare-fun m!272081 () Bool)

(assert (=> b!256579 m!272081))

(assert (=> b!256279 d!61761))

(declare-fun d!61763 () Bool)

(declare-fun e!166317 () Bool)

(assert (=> d!61763 e!166317))

(declare-fun res!125526 () Bool)

(assert (=> d!61763 (=> (not res!125526) (not e!166317))))

(assert (=> d!61763 (= res!125526 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6265 (_keys!6890 thiss!1504))) (bvslt index!297 (size!6264 (_values!4711 thiss!1504)))))))

(declare-fun lt!128872 () Unit!7922)

(declare-fun choose!1236 (array!12493 array!12491 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 32) (_ BitVec 64) V!8417 Int) Unit!7922)

(assert (=> d!61763 (= lt!128872 (choose!1236 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) index!297 key!932 v!346 (defaultEntry!4728 thiss!1504)))))

(assert (=> d!61763 (validMask!0 (mask!11000 thiss!1504))))

(assert (=> d!61763 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!97 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) index!297 key!932 v!346 (defaultEntry!4728 thiss!1504)) lt!128872)))

(declare-fun b!256582 () Bool)

(assert (=> b!256582 (= e!166317 (= (+!682 (getCurrentListMap!1416 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)) (tuple2!4823 key!932 v!346)) (getCurrentListMap!1416 (array!12494 (store (arr!5918 (_keys!6890 thiss!1504)) index!297 key!932) (size!6265 (_keys!6890 thiss!1504))) (array!12492 (store (arr!5917 (_values!4711 thiss!1504)) index!297 (ValueCellFull!2945 v!346)) (size!6264 (_values!4711 thiss!1504))) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504))))))

(assert (= (and d!61763 res!125526) b!256582))

(declare-fun m!272083 () Bool)

(assert (=> d!61763 m!272083))

(assert (=> d!61763 m!271981))

(assert (=> b!256582 m!271811))

(assert (=> b!256582 m!271835))

(assert (=> b!256582 m!271827))

(assert (=> b!256582 m!271811))

(declare-fun m!272085 () Bool)

(assert (=> b!256582 m!272085))

(declare-fun m!272087 () Bool)

(assert (=> b!256582 m!272087))

(assert (=> b!256279 d!61763))

(declare-fun d!61765 () Bool)

(declare-fun e!166320 () Bool)

(assert (=> d!61765 e!166320))

(declare-fun res!125532 () Bool)

(assert (=> d!61765 (=> (not res!125532) (not e!166320))))

(declare-fun lt!128883 () ListLongMap!3737)

(assert (=> d!61765 (= res!125532 (contains!1837 lt!128883 (_1!2422 (tuple2!4823 key!932 v!346))))))

(declare-fun lt!128884 () List!3701)

(assert (=> d!61765 (= lt!128883 (ListLongMap!3738 lt!128884))))

(declare-fun lt!128882 () Unit!7922)

(declare-fun lt!128881 () Unit!7922)

(assert (=> d!61765 (= lt!128882 lt!128881)))

(declare-datatypes ((Option!316 0))(
  ( (Some!315 (v!5425 V!8417)) (None!314) )
))
(declare-fun getValueByKey!310 (List!3701 (_ BitVec 64)) Option!316)

(assert (=> d!61765 (= (getValueByKey!310 lt!128884 (_1!2422 (tuple2!4823 key!932 v!346))) (Some!315 (_2!2422 (tuple2!4823 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!166 (List!3701 (_ BitVec 64) V!8417) Unit!7922)

(assert (=> d!61765 (= lt!128881 (lemmaContainsTupThenGetReturnValue!166 lt!128884 (_1!2422 (tuple2!4823 key!932 v!346)) (_2!2422 (tuple2!4823 key!932 v!346))))))

(declare-fun insertStrictlySorted!169 (List!3701 (_ BitVec 64) V!8417) List!3701)

(assert (=> d!61765 (= lt!128884 (insertStrictlySorted!169 (toList!1884 lt!128693) (_1!2422 (tuple2!4823 key!932 v!346)) (_2!2422 (tuple2!4823 key!932 v!346))))))

(assert (=> d!61765 (= (+!682 lt!128693 (tuple2!4823 key!932 v!346)) lt!128883)))

(declare-fun b!256587 () Bool)

(declare-fun res!125531 () Bool)

(assert (=> b!256587 (=> (not res!125531) (not e!166320))))

(assert (=> b!256587 (= res!125531 (= (getValueByKey!310 (toList!1884 lt!128883) (_1!2422 (tuple2!4823 key!932 v!346))) (Some!315 (_2!2422 (tuple2!4823 key!932 v!346)))))))

(declare-fun b!256588 () Bool)

(declare-fun contains!1841 (List!3701 tuple2!4822) Bool)

(assert (=> b!256588 (= e!166320 (contains!1841 (toList!1884 lt!128883) (tuple2!4823 key!932 v!346)))))

(assert (= (and d!61765 res!125532) b!256587))

(assert (= (and b!256587 res!125531) b!256588))

(declare-fun m!272089 () Bool)

(assert (=> d!61765 m!272089))

(declare-fun m!272091 () Bool)

(assert (=> d!61765 m!272091))

(declare-fun m!272093 () Bool)

(assert (=> d!61765 m!272093))

(declare-fun m!272095 () Bool)

(assert (=> d!61765 m!272095))

(declare-fun m!272097 () Bool)

(assert (=> b!256587 m!272097))

(declare-fun m!272099 () Bool)

(assert (=> b!256588 m!272099))

(assert (=> b!256279 d!61765))

(declare-fun d!61767 () Bool)

(declare-fun res!125533 () Bool)

(declare-fun e!166321 () Bool)

(assert (=> d!61767 (=> res!125533 e!166321)))

(assert (=> d!61767 (= res!125533 (= (select (arr!5918 lt!128692) index!297) key!932))))

(assert (=> d!61767 (= (arrayContainsKey!0 lt!128692 key!932 index!297) e!166321)))

(declare-fun b!256589 () Bool)

(declare-fun e!166322 () Bool)

(assert (=> b!256589 (= e!166321 e!166322)))

(declare-fun res!125534 () Bool)

(assert (=> b!256589 (=> (not res!125534) (not e!166322))))

(assert (=> b!256589 (= res!125534 (bvslt (bvadd index!297 #b00000000000000000000000000000001) (size!6265 lt!128692)))))

(declare-fun b!256590 () Bool)

(assert (=> b!256590 (= e!166322 (arrayContainsKey!0 lt!128692 key!932 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (= (and d!61767 (not res!125533)) b!256589))

(assert (= (and b!256589 res!125534) b!256590))

(declare-fun m!272101 () Bool)

(assert (=> d!61767 m!272101))

(declare-fun m!272103 () Bool)

(assert (=> b!256590 m!272103))

(assert (=> b!256294 d!61767))

(declare-fun b!256603 () Bool)

(declare-fun c!43388 () Bool)

(declare-fun lt!128891 () (_ BitVec 64))

(assert (=> b!256603 (= c!43388 (= lt!128891 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166329 () SeekEntryResult!1129)

(declare-fun e!166331 () SeekEntryResult!1129)

(assert (=> b!256603 (= e!166329 e!166331)))

(declare-fun b!256604 () Bool)

(declare-fun e!166330 () SeekEntryResult!1129)

(assert (=> b!256604 (= e!166330 e!166329)))

(declare-fun lt!128892 () SeekEntryResult!1129)

(assert (=> b!256604 (= lt!128891 (select (arr!5918 (_keys!6890 thiss!1504)) (index!6688 lt!128892)))))

(declare-fun c!43389 () Bool)

(assert (=> b!256604 (= c!43389 (= lt!128891 key!932))))

(declare-fun b!256605 () Bool)

(assert (=> b!256605 (= e!166331 (MissingZero!1129 (index!6688 lt!128892)))))

(declare-fun b!256606 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12493 (_ BitVec 32)) SeekEntryResult!1129)

(assert (=> b!256606 (= e!166331 (seekKeyOrZeroReturnVacant!0 (x!24925 lt!128892) (index!6688 lt!128892) (index!6688 lt!128892) key!932 (_keys!6890 thiss!1504) (mask!11000 thiss!1504)))))

(declare-fun d!61769 () Bool)

(declare-fun lt!128893 () SeekEntryResult!1129)

(assert (=> d!61769 (and (or ((_ is Undefined!1129) lt!128893) (not ((_ is Found!1129) lt!128893)) (and (bvsge (index!6687 lt!128893) #b00000000000000000000000000000000) (bvslt (index!6687 lt!128893) (size!6265 (_keys!6890 thiss!1504))))) (or ((_ is Undefined!1129) lt!128893) ((_ is Found!1129) lt!128893) (not ((_ is MissingZero!1129) lt!128893)) (and (bvsge (index!6686 lt!128893) #b00000000000000000000000000000000) (bvslt (index!6686 lt!128893) (size!6265 (_keys!6890 thiss!1504))))) (or ((_ is Undefined!1129) lt!128893) ((_ is Found!1129) lt!128893) ((_ is MissingZero!1129) lt!128893) (not ((_ is MissingVacant!1129) lt!128893)) (and (bvsge (index!6689 lt!128893) #b00000000000000000000000000000000) (bvslt (index!6689 lt!128893) (size!6265 (_keys!6890 thiss!1504))))) (or ((_ is Undefined!1129) lt!128893) (ite ((_ is Found!1129) lt!128893) (= (select (arr!5918 (_keys!6890 thiss!1504)) (index!6687 lt!128893)) key!932) (ite ((_ is MissingZero!1129) lt!128893) (= (select (arr!5918 (_keys!6890 thiss!1504)) (index!6686 lt!128893)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1129) lt!128893) (= (select (arr!5918 (_keys!6890 thiss!1504)) (index!6689 lt!128893)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61769 (= lt!128893 e!166330)))

(declare-fun c!43390 () Bool)

(assert (=> d!61769 (= c!43390 (and ((_ is Intermediate!1129) lt!128892) (undefined!1941 lt!128892)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12493 (_ BitVec 32)) SeekEntryResult!1129)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61769 (= lt!128892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11000 thiss!1504)) key!932 (_keys!6890 thiss!1504) (mask!11000 thiss!1504)))))

(assert (=> d!61769 (validMask!0 (mask!11000 thiss!1504))))

(assert (=> d!61769 (= (seekEntryOrOpen!0 key!932 (_keys!6890 thiss!1504) (mask!11000 thiss!1504)) lt!128893)))

(declare-fun b!256607 () Bool)

(assert (=> b!256607 (= e!166330 Undefined!1129)))

(declare-fun b!256608 () Bool)

(assert (=> b!256608 (= e!166329 (Found!1129 (index!6688 lt!128892)))))

(assert (= (and d!61769 c!43390) b!256607))

(assert (= (and d!61769 (not c!43390)) b!256604))

(assert (= (and b!256604 c!43389) b!256608))

(assert (= (and b!256604 (not c!43389)) b!256603))

(assert (= (and b!256603 c!43388) b!256605))

(assert (= (and b!256603 (not c!43388)) b!256606))

(declare-fun m!272105 () Bool)

(assert (=> b!256604 m!272105))

(declare-fun m!272107 () Bool)

(assert (=> b!256606 m!272107))

(declare-fun m!272109 () Bool)

(assert (=> d!61769 m!272109))

(declare-fun m!272111 () Bool)

(assert (=> d!61769 m!272111))

(assert (=> d!61769 m!271981))

(declare-fun m!272113 () Bool)

(assert (=> d!61769 m!272113))

(declare-fun m!272115 () Bool)

(assert (=> d!61769 m!272115))

(assert (=> d!61769 m!272115))

(declare-fun m!272117 () Bool)

(assert (=> d!61769 m!272117))

(assert (=> b!256281 d!61769))

(declare-fun d!61771 () Bool)

(declare-fun e!166334 () Bool)

(assert (=> d!61771 e!166334))

(declare-fun res!125539 () Bool)

(assert (=> d!61771 (=> (not res!125539) (not e!166334))))

(declare-fun lt!128898 () SeekEntryResult!1129)

(assert (=> d!61771 (= res!125539 ((_ is Found!1129) lt!128898))))

(assert (=> d!61771 (= lt!128898 (seekEntryOrOpen!0 key!932 (_keys!6890 thiss!1504) (mask!11000 thiss!1504)))))

(declare-fun lt!128899 () Unit!7922)

(declare-fun choose!1237 (array!12493 array!12491 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 64) Int) Unit!7922)

(assert (=> d!61771 (= lt!128899 (choose!1237 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 (defaultEntry!4728 thiss!1504)))))

(assert (=> d!61771 (validMask!0 (mask!11000 thiss!1504))))

(assert (=> d!61771 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!422 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 (defaultEntry!4728 thiss!1504)) lt!128899)))

(declare-fun b!256613 () Bool)

(declare-fun res!125540 () Bool)

(assert (=> b!256613 (=> (not res!125540) (not e!166334))))

(assert (=> b!256613 (= res!125540 (inRange!0 (index!6687 lt!128898) (mask!11000 thiss!1504)))))

(declare-fun b!256614 () Bool)

(assert (=> b!256614 (= e!166334 (= (select (arr!5918 (_keys!6890 thiss!1504)) (index!6687 lt!128898)) key!932))))

(assert (=> b!256614 (and (bvsge (index!6687 lt!128898) #b00000000000000000000000000000000) (bvslt (index!6687 lt!128898) (size!6265 (_keys!6890 thiss!1504))))))

(assert (= (and d!61771 res!125539) b!256613))

(assert (= (and b!256613 res!125540) b!256614))

(assert (=> d!61771 m!271849))

(declare-fun m!272119 () Bool)

(assert (=> d!61771 m!272119))

(assert (=> d!61771 m!271981))

(declare-fun m!272121 () Bool)

(assert (=> b!256613 m!272121))

(declare-fun m!272123 () Bool)

(assert (=> b!256614 m!272123))

(assert (=> b!256290 d!61771))

(declare-fun d!61773 () Bool)

(assert (=> d!61773 (= (inRange!0 (ite c!43319 (index!6686 lt!128703) (index!6689 lt!128703)) (mask!11000 thiss!1504)) (and (bvsge (ite c!43319 (index!6686 lt!128703) (index!6689 lt!128703)) #b00000000000000000000000000000000) (bvslt (ite c!43319 (index!6686 lt!128703) (index!6689 lt!128703)) (bvadd (mask!11000 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24251 d!61773))

(declare-fun d!61775 () Bool)

(assert (=> d!61775 (contains!1837 (getCurrentListMap!1416 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)) key!932)))

(declare-fun lt!128902 () Unit!7922)

(declare-fun choose!1238 (array!12493 array!12491 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 64) (_ BitVec 32) Int) Unit!7922)

(assert (=> d!61775 (= lt!128902 (choose!1238 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(assert (=> d!61775 (validMask!0 (mask!11000 thiss!1504))))

(assert (=> d!61775 (= (lemmaArrayContainsKeyThenInListMap!239 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)) lt!128902)))

(declare-fun bs!9090 () Bool)

(assert (= bs!9090 d!61775))

(assert (=> bs!9090 m!271811))

(assert (=> bs!9090 m!271811))

(declare-fun m!272125 () Bool)

(assert (=> bs!9090 m!272125))

(declare-fun m!272127 () Bool)

(assert (=> bs!9090 m!272127))

(assert (=> bs!9090 m!271981))

(assert (=> b!256282 d!61775))

(declare-fun d!61777 () Bool)

(declare-fun res!125547 () Bool)

(declare-fun e!166337 () Bool)

(assert (=> d!61777 (=> (not res!125547) (not e!166337))))

(declare-fun simpleValid!274 (LongMapFixedSize!3790) Bool)

(assert (=> d!61777 (= res!125547 (simpleValid!274 thiss!1504))))

(assert (=> d!61777 (= (valid!1488 thiss!1504) e!166337)))

(declare-fun b!256621 () Bool)

(declare-fun res!125548 () Bool)

(assert (=> b!256621 (=> (not res!125548) (not e!166337))))

(assert (=> b!256621 (= res!125548 (= (arrayCountValidKeys!0 (_keys!6890 thiss!1504) #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))) (_size!1944 thiss!1504)))))

(declare-fun b!256622 () Bool)

(declare-fun res!125549 () Bool)

(assert (=> b!256622 (=> (not res!125549) (not e!166337))))

(assert (=> b!256622 (= res!125549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6890 thiss!1504) (mask!11000 thiss!1504)))))

(declare-fun b!256623 () Bool)

(assert (=> b!256623 (= e!166337 (arrayNoDuplicates!0 (_keys!6890 thiss!1504) #b00000000000000000000000000000000 Nil!3699))))

(assert (= (and d!61777 res!125547) b!256621))

(assert (= (and b!256621 res!125548) b!256622))

(assert (= (and b!256622 res!125549) b!256623))

(declare-fun m!272129 () Bool)

(assert (=> d!61777 m!272129))

(assert (=> b!256621 m!271843))

(declare-fun m!272131 () Bool)

(assert (=> b!256622 m!272131))

(declare-fun m!272133 () Bool)

(assert (=> b!256623 m!272133))

(assert (=> start!24470 d!61777))

(assert (=> bm!24252 d!61759))

(declare-fun d!61779 () Bool)

(assert (=> d!61779 (= (array_inv!3893 (_keys!6890 thiss!1504)) (bvsge (size!6265 (_keys!6890 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256283 d!61779))

(declare-fun d!61781 () Bool)

(assert (=> d!61781 (= (array_inv!3894 (_values!4711 thiss!1504)) (bvsge (size!6264 (_values!4711 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256283 d!61781))

(declare-fun d!61783 () Bool)

(assert (=> d!61783 (= (inRange!0 index!297 (mask!11000 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11000 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!256296 d!61783))

(declare-fun d!61785 () Bool)

(declare-fun e!166342 () Bool)

(assert (=> d!61785 e!166342))

(declare-fun res!125552 () Bool)

(assert (=> d!61785 (=> res!125552 e!166342)))

(declare-fun lt!128914 () Bool)

(assert (=> d!61785 (= res!125552 (not lt!128914))))

(declare-fun lt!128911 () Bool)

(assert (=> d!61785 (= lt!128914 lt!128911)))

(declare-fun lt!128913 () Unit!7922)

(declare-fun e!166343 () Unit!7922)

(assert (=> d!61785 (= lt!128913 e!166343)))

(declare-fun c!43393 () Bool)

(assert (=> d!61785 (= c!43393 lt!128911)))

(declare-fun containsKey!301 (List!3701 (_ BitVec 64)) Bool)

(assert (=> d!61785 (= lt!128911 (containsKey!301 (toList!1884 lt!128693) key!932))))

(assert (=> d!61785 (= (contains!1837 lt!128693 key!932) lt!128914)))

(declare-fun b!256630 () Bool)

(declare-fun lt!128912 () Unit!7922)

(assert (=> b!256630 (= e!166343 lt!128912)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!249 (List!3701 (_ BitVec 64)) Unit!7922)

(assert (=> b!256630 (= lt!128912 (lemmaContainsKeyImpliesGetValueByKeyDefined!249 (toList!1884 lt!128693) key!932))))

(declare-fun isDefined!250 (Option!316) Bool)

(assert (=> b!256630 (isDefined!250 (getValueByKey!310 (toList!1884 lt!128693) key!932))))

(declare-fun b!256631 () Bool)

(declare-fun Unit!7935 () Unit!7922)

(assert (=> b!256631 (= e!166343 Unit!7935)))

(declare-fun b!256632 () Bool)

(assert (=> b!256632 (= e!166342 (isDefined!250 (getValueByKey!310 (toList!1884 lt!128693) key!932)))))

(assert (= (and d!61785 c!43393) b!256630))

(assert (= (and d!61785 (not c!43393)) b!256631))

(assert (= (and d!61785 (not res!125552)) b!256632))

(declare-fun m!272135 () Bool)

(assert (=> d!61785 m!272135))

(declare-fun m!272137 () Bool)

(assert (=> b!256630 m!272137))

(declare-fun m!272139 () Bool)

(assert (=> b!256630 m!272139))

(assert (=> b!256630 m!272139))

(declare-fun m!272141 () Bool)

(assert (=> b!256630 m!272141))

(assert (=> b!256632 m!272139))

(assert (=> b!256632 m!272139))

(assert (=> b!256632 m!272141))

(assert (=> b!256296 d!61785))

(declare-fun bm!24302 () Bool)

(declare-fun call!24308 () Bool)

(declare-fun lt!128927 () ListLongMap!3737)

(assert (=> bm!24302 (= call!24308 (contains!1837 lt!128927 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256633 () Bool)

(declare-fun e!166346 () Bool)

(assert (=> b!256633 (= e!166346 (= (apply!251 lt!128927 (select (arr!5918 (_keys!6890 thiss!1504)) #b00000000000000000000000000000000)) (get!3050 (select (arr!5917 (_values!4711 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!594 (defaultEntry!4728 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256633 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6264 (_values!4711 thiss!1504))))))

(assert (=> b!256633 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))))))

(declare-fun b!256634 () Bool)

(declare-fun e!166356 () ListLongMap!3737)

(declare-fun call!24307 () ListLongMap!3737)

(assert (=> b!256634 (= e!166356 call!24307)))

(declare-fun b!256635 () Bool)

(declare-fun e!166347 () Bool)

(assert (=> b!256635 (= e!166347 (= (apply!251 lt!128927 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4569 thiss!1504)))))

(declare-fun bm!24303 () Bool)

(declare-fun call!24306 () ListLongMap!3737)

(declare-fun call!24305 () ListLongMap!3737)

(assert (=> bm!24303 (= call!24306 call!24305)))

(declare-fun d!61787 () Bool)

(declare-fun e!166350 () Bool)

(assert (=> d!61787 e!166350))

(declare-fun res!125556 () Bool)

(assert (=> d!61787 (=> (not res!125556) (not e!166350))))

(assert (=> d!61787 (= res!125556 (or (bvsge #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))))))))

(declare-fun lt!128915 () ListLongMap!3737)

(assert (=> d!61787 (= lt!128927 lt!128915)))

(declare-fun lt!128920 () Unit!7922)

(declare-fun e!166355 () Unit!7922)

(assert (=> d!61787 (= lt!128920 e!166355)))

(declare-fun c!43396 () Bool)

(declare-fun e!166348 () Bool)

(assert (=> d!61787 (= c!43396 e!166348)))

(declare-fun res!125560 () Bool)

(assert (=> d!61787 (=> (not res!125560) (not e!166348))))

(assert (=> d!61787 (= res!125560 (bvslt #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))))))

(declare-fun e!166352 () ListLongMap!3737)

(assert (=> d!61787 (= lt!128915 e!166352)))

(declare-fun c!43394 () Bool)

(assert (=> d!61787 (= c!43394 (and (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61787 (validMask!0 (mask!11000 thiss!1504))))

(assert (=> d!61787 (= (getCurrentListMap!1416 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)) lt!128927)))

(declare-fun b!256636 () Bool)

(declare-fun e!166351 () Bool)

(assert (=> b!256636 (= e!166350 e!166351)))

(declare-fun c!43398 () Bool)

(assert (=> b!256636 (= c!43398 (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256637 () Bool)

(declare-fun e!166349 () Bool)

(assert (=> b!256637 (= e!166349 (not call!24308))))

(declare-fun b!256638 () Bool)

(declare-fun call!24309 () Bool)

(assert (=> b!256638 (= e!166351 (not call!24309))))

(declare-fun bm!24304 () Bool)

(declare-fun call!24311 () ListLongMap!3737)

(assert (=> bm!24304 (= call!24311 (getCurrentListMapNoExtraKeys!567 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun b!256639 () Bool)

(declare-fun e!166354 () Bool)

(assert (=> b!256639 (= e!166354 (= (apply!251 lt!128927 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4569 thiss!1504)))))

(declare-fun b!256640 () Bool)

(declare-fun e!166345 () Bool)

(assert (=> b!256640 (= e!166345 e!166346)))

(declare-fun res!125555 () Bool)

(assert (=> b!256640 (=> (not res!125555) (not e!166346))))

(assert (=> b!256640 (= res!125555 (contains!1837 lt!128927 (select (arr!5918 (_keys!6890 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!256640 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))))))

(declare-fun c!43399 () Bool)

(declare-fun call!24310 () ListLongMap!3737)

(declare-fun bm!24305 () Bool)

(assert (=> bm!24305 (= call!24310 (+!682 (ite c!43394 call!24311 (ite c!43399 call!24305 call!24306)) (ite (or c!43394 c!43399) (tuple2!4823 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4569 thiss!1504)) (tuple2!4823 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4569 thiss!1504)))))))

(declare-fun b!256641 () Bool)

(declare-fun res!125553 () Bool)

(assert (=> b!256641 (=> (not res!125553) (not e!166350))))

(assert (=> b!256641 (= res!125553 e!166349)))

(declare-fun c!43395 () Bool)

(assert (=> b!256641 (= c!43395 (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!256642 () Bool)

(assert (=> b!256642 (= e!166352 e!166356)))

(assert (=> b!256642 (= c!43399 (and (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256643 () Bool)

(declare-fun e!166353 () ListLongMap!3737)

(assert (=> b!256643 (= e!166353 call!24307)))

(declare-fun bm!24306 () Bool)

(assert (=> bm!24306 (= call!24309 (contains!1837 lt!128927 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256644 () Bool)

(assert (=> b!256644 (= e!166349 e!166354)))

(declare-fun res!125557 () Bool)

(assert (=> b!256644 (= res!125557 call!24308)))

(assert (=> b!256644 (=> (not res!125557) (not e!166354))))

(declare-fun b!256645 () Bool)

(declare-fun res!125558 () Bool)

(assert (=> b!256645 (=> (not res!125558) (not e!166350))))

(assert (=> b!256645 (= res!125558 e!166345)))

(declare-fun res!125554 () Bool)

(assert (=> b!256645 (=> res!125554 e!166345)))

(declare-fun e!166344 () Bool)

(assert (=> b!256645 (= res!125554 (not e!166344))))

(declare-fun res!125561 () Bool)

(assert (=> b!256645 (=> (not res!125561) (not e!166344))))

(assert (=> b!256645 (= res!125561 (bvslt #b00000000000000000000000000000000 (size!6265 (_keys!6890 thiss!1504))))))

(declare-fun b!256646 () Bool)

(assert (=> b!256646 (= e!166352 (+!682 call!24310 (tuple2!4823 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4569 thiss!1504))))))

(declare-fun b!256647 () Bool)

(declare-fun Unit!7936 () Unit!7922)

(assert (=> b!256647 (= e!166355 Unit!7936)))

(declare-fun b!256648 () Bool)

(declare-fun c!43397 () Bool)

(assert (=> b!256648 (= c!43397 (and (not (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4465 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!256648 (= e!166356 e!166353)))

(declare-fun b!256649 () Bool)

(assert (=> b!256649 (= e!166348 (validKeyInArray!0 (select (arr!5918 (_keys!6890 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!256650 () Bool)

(assert (=> b!256650 (= e!166344 (validKeyInArray!0 (select (arr!5918 (_keys!6890 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!256651 () Bool)

(declare-fun lt!128916 () Unit!7922)

(assert (=> b!256651 (= e!166355 lt!128916)))

(declare-fun lt!128921 () ListLongMap!3737)

(assert (=> b!256651 (= lt!128921 (getCurrentListMapNoExtraKeys!567 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128935 () (_ BitVec 64))

(assert (=> b!256651 (= lt!128935 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128926 () (_ BitVec 64))

(assert (=> b!256651 (= lt!128926 (select (arr!5918 (_keys!6890 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128934 () Unit!7922)

(assert (=> b!256651 (= lt!128934 (addStillContains!227 lt!128921 lt!128935 (zeroValue!4569 thiss!1504) lt!128926))))

(assert (=> b!256651 (contains!1837 (+!682 lt!128921 (tuple2!4823 lt!128935 (zeroValue!4569 thiss!1504))) lt!128926)))

(declare-fun lt!128917 () Unit!7922)

(assert (=> b!256651 (= lt!128917 lt!128934)))

(declare-fun lt!128923 () ListLongMap!3737)

(assert (=> b!256651 (= lt!128923 (getCurrentListMapNoExtraKeys!567 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128922 () (_ BitVec 64))

(assert (=> b!256651 (= lt!128922 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128928 () (_ BitVec 64))

(assert (=> b!256651 (= lt!128928 (select (arr!5918 (_keys!6890 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128929 () Unit!7922)

(assert (=> b!256651 (= lt!128929 (addApplyDifferent!227 lt!128923 lt!128922 (minValue!4569 thiss!1504) lt!128928))))

(assert (=> b!256651 (= (apply!251 (+!682 lt!128923 (tuple2!4823 lt!128922 (minValue!4569 thiss!1504))) lt!128928) (apply!251 lt!128923 lt!128928))))

(declare-fun lt!128930 () Unit!7922)

(assert (=> b!256651 (= lt!128930 lt!128929)))

(declare-fun lt!128936 () ListLongMap!3737)

(assert (=> b!256651 (= lt!128936 (getCurrentListMapNoExtraKeys!567 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128918 () (_ BitVec 64))

(assert (=> b!256651 (= lt!128918 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128932 () (_ BitVec 64))

(assert (=> b!256651 (= lt!128932 (select (arr!5918 (_keys!6890 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128924 () Unit!7922)

(assert (=> b!256651 (= lt!128924 (addApplyDifferent!227 lt!128936 lt!128918 (zeroValue!4569 thiss!1504) lt!128932))))

(assert (=> b!256651 (= (apply!251 (+!682 lt!128936 (tuple2!4823 lt!128918 (zeroValue!4569 thiss!1504))) lt!128932) (apply!251 lt!128936 lt!128932))))

(declare-fun lt!128933 () Unit!7922)

(assert (=> b!256651 (= lt!128933 lt!128924)))

(declare-fun lt!128919 () ListLongMap!3737)

(assert (=> b!256651 (= lt!128919 (getCurrentListMapNoExtraKeys!567 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4728 thiss!1504)))))

(declare-fun lt!128931 () (_ BitVec 64))

(assert (=> b!256651 (= lt!128931 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128925 () (_ BitVec 64))

(assert (=> b!256651 (= lt!128925 (select (arr!5918 (_keys!6890 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256651 (= lt!128916 (addApplyDifferent!227 lt!128919 lt!128931 (minValue!4569 thiss!1504) lt!128925))))

(assert (=> b!256651 (= (apply!251 (+!682 lt!128919 (tuple2!4823 lt!128931 (minValue!4569 thiss!1504))) lt!128925) (apply!251 lt!128919 lt!128925))))

(declare-fun b!256652 () Bool)

(assert (=> b!256652 (= e!166351 e!166347)))

(declare-fun res!125559 () Bool)

(assert (=> b!256652 (= res!125559 call!24309)))

(assert (=> b!256652 (=> (not res!125559) (not e!166347))))

(declare-fun b!256653 () Bool)

(assert (=> b!256653 (= e!166353 call!24306)))

(declare-fun bm!24307 () Bool)

(assert (=> bm!24307 (= call!24305 call!24311)))

(declare-fun bm!24308 () Bool)

(assert (=> bm!24308 (= call!24307 call!24310)))

(assert (= (and d!61787 c!43394) b!256646))

(assert (= (and d!61787 (not c!43394)) b!256642))

(assert (= (and b!256642 c!43399) b!256634))

(assert (= (and b!256642 (not c!43399)) b!256648))

(assert (= (and b!256648 c!43397) b!256643))

(assert (= (and b!256648 (not c!43397)) b!256653))

(assert (= (or b!256643 b!256653) bm!24303))

(assert (= (or b!256634 bm!24303) bm!24307))

(assert (= (or b!256634 b!256643) bm!24308))

(assert (= (or b!256646 bm!24307) bm!24304))

(assert (= (or b!256646 bm!24308) bm!24305))

(assert (= (and d!61787 res!125560) b!256649))

(assert (= (and d!61787 c!43396) b!256651))

(assert (= (and d!61787 (not c!43396)) b!256647))

(assert (= (and d!61787 res!125556) b!256645))

(assert (= (and b!256645 res!125561) b!256650))

(assert (= (and b!256645 (not res!125554)) b!256640))

(assert (= (and b!256640 res!125555) b!256633))

(assert (= (and b!256645 res!125558) b!256641))

(assert (= (and b!256641 c!43395) b!256644))

(assert (= (and b!256641 (not c!43395)) b!256637))

(assert (= (and b!256644 res!125557) b!256639))

(assert (= (or b!256644 b!256637) bm!24302))

(assert (= (and b!256641 res!125553) b!256636))

(assert (= (and b!256636 c!43398) b!256652))

(assert (= (and b!256636 (not c!43398)) b!256638))

(assert (= (and b!256652 res!125559) b!256635))

(assert (= (or b!256652 b!256638) bm!24306))

(declare-fun b_lambda!8187 () Bool)

(assert (=> (not b_lambda!8187) (not b!256633)))

(assert (=> b!256633 t!8754))

(declare-fun b_and!13795 () Bool)

(assert (= b_and!13793 (and (=> t!8754 result!5359) b_and!13795)))

(assert (=> b!256640 m!272001))

(assert (=> b!256640 m!272001))

(declare-fun m!272143 () Bool)

(assert (=> b!256640 m!272143))

(declare-fun m!272145 () Bool)

(assert (=> bm!24302 m!272145))

(declare-fun m!272147 () Bool)

(assert (=> b!256633 m!272147))

(assert (=> b!256633 m!272021))

(declare-fun m!272149 () Bool)

(assert (=> b!256633 m!272149))

(assert (=> b!256633 m!272021))

(assert (=> b!256633 m!272147))

(assert (=> b!256633 m!272001))

(assert (=> b!256633 m!272001))

(declare-fun m!272151 () Bool)

(assert (=> b!256633 m!272151))

(assert (=> b!256650 m!272001))

(assert (=> b!256650 m!272001))

(assert (=> b!256650 m!272003))

(declare-fun m!272153 () Bool)

(assert (=> bm!24306 m!272153))

(declare-fun m!272155 () Bool)

(assert (=> b!256651 m!272155))

(declare-fun m!272157 () Bool)

(assert (=> b!256651 m!272157))

(declare-fun m!272159 () Bool)

(assert (=> b!256651 m!272159))

(declare-fun m!272161 () Bool)

(assert (=> b!256651 m!272161))

(declare-fun m!272163 () Bool)

(assert (=> b!256651 m!272163))

(declare-fun m!272165 () Bool)

(assert (=> b!256651 m!272165))

(declare-fun m!272167 () Bool)

(assert (=> b!256651 m!272167))

(assert (=> b!256651 m!272155))

(declare-fun m!272169 () Bool)

(assert (=> b!256651 m!272169))

(declare-fun m!272171 () Bool)

(assert (=> b!256651 m!272171))

(declare-fun m!272173 () Bool)

(assert (=> b!256651 m!272173))

(assert (=> b!256651 m!272001))

(declare-fun m!272175 () Bool)

(assert (=> b!256651 m!272175))

(assert (=> b!256651 m!272169))

(declare-fun m!272177 () Bool)

(assert (=> b!256651 m!272177))

(declare-fun m!272179 () Bool)

(assert (=> b!256651 m!272179))

(declare-fun m!272181 () Bool)

(assert (=> b!256651 m!272181))

(assert (=> b!256651 m!272163))

(declare-fun m!272183 () Bool)

(assert (=> b!256651 m!272183))

(assert (=> b!256651 m!272179))

(declare-fun m!272185 () Bool)

(assert (=> b!256651 m!272185))

(assert (=> bm!24304 m!272159))

(declare-fun m!272187 () Bool)

(assert (=> b!256639 m!272187))

(assert (=> b!256649 m!272001))

(assert (=> b!256649 m!272001))

(assert (=> b!256649 m!272003))

(declare-fun m!272189 () Bool)

(assert (=> b!256635 m!272189))

(declare-fun m!272191 () Bool)

(assert (=> b!256646 m!272191))

(declare-fun m!272193 () Bool)

(assert (=> bm!24305 m!272193))

(assert (=> d!61787 m!271981))

(assert (=> b!256296 d!61787))

(declare-fun b!256660 () Bool)

(declare-fun e!166361 () Bool)

(assert (=> b!256660 (= e!166361 tp_is_empty!6577)))

(declare-fun condMapEmpty!11202 () Bool)

(declare-fun mapDefault!11202 () ValueCell!2945)

(assert (=> mapNonEmpty!11193 (= condMapEmpty!11202 (= mapRest!11193 ((as const (Array (_ BitVec 32) ValueCell!2945)) mapDefault!11202)))))

(declare-fun e!166362 () Bool)

(declare-fun mapRes!11202 () Bool)

(assert (=> mapNonEmpty!11193 (= tp!23444 (and e!166362 mapRes!11202))))

(declare-fun mapIsEmpty!11202 () Bool)

(assert (=> mapIsEmpty!11202 mapRes!11202))

(declare-fun mapNonEmpty!11202 () Bool)

(declare-fun tp!23460 () Bool)

(assert (=> mapNonEmpty!11202 (= mapRes!11202 (and tp!23460 e!166361))))

(declare-fun mapKey!11202 () (_ BitVec 32))

(declare-fun mapValue!11202 () ValueCell!2945)

(declare-fun mapRest!11202 () (Array (_ BitVec 32) ValueCell!2945))

(assert (=> mapNonEmpty!11202 (= mapRest!11193 (store mapRest!11202 mapKey!11202 mapValue!11202))))

(declare-fun b!256661 () Bool)

(assert (=> b!256661 (= e!166362 tp_is_empty!6577)))

(assert (= (and mapNonEmpty!11193 condMapEmpty!11202) mapIsEmpty!11202))

(assert (= (and mapNonEmpty!11193 (not condMapEmpty!11202)) mapNonEmpty!11202))

(assert (= (and mapNonEmpty!11202 ((_ is ValueCellFull!2945) mapValue!11202)) b!256660))

(assert (= (and mapNonEmpty!11193 ((_ is ValueCellFull!2945) mapDefault!11202)) b!256661))

(declare-fun m!272195 () Bool)

(assert (=> mapNonEmpty!11202 m!272195))

(declare-fun b_lambda!8189 () Bool)

(assert (= b_lambda!8187 (or (and b!256283 b_free!6715) b_lambda!8189)))

(declare-fun b_lambda!8191 () Bool)

(assert (= b_lambda!8185 (or (and b!256283 b_free!6715) b_lambda!8191)))

(check-sat (not mapNonEmpty!11202) (not b!256472) (not b!256650) (not b!256639) (not b!256563) (not b!256635) (not b!256606) (not b!256613) (not b!256623) (not bm!24274) (not d!61785) (not b!256530) (not bm!24302) (not b!256456) (not bm!24295) tp_is_empty!6577 (not b!256576) (not b!256633) (not b!256582) (not b_lambda!8191) (not bm!24294) (not b!256459) (not d!61743) (not b!256546) (not d!61753) (not b!256621) (not d!61787) (not b!256646) (not b!256588) (not b!256649) b_and!13795 (not b!256579) (not b!256548) (not b!256565) (not d!61769) (not bm!24277) (not d!61761) (not d!61771) (not d!61775) (not b!256487) (not bm!24270) (not b!256640) (not b!256486) (not b!256564) (not b!256537) (not b!256570) (not bm!24301) (not b!256630) (not d!61757) (not b!256547) (not bm!24269) (not b_next!6715) (not b!256543) (not d!61765) (not bm!24292) (not b!256468) (not b!256587) (not d!61763) (not b!256457) (not b!256651) (not b!256622) (not b_lambda!8189) (not b!256632) (not bm!24273) (not d!61777) (not b!256536) (not b!256590) (not bm!24304) (not bm!24296) (not b!256532) (not d!61745) (not bm!24306) (not bm!24305))
(check-sat b_and!13795 (not b_next!6715))
