; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23526 () Bool)

(assert start!23526)

(declare-fun b!247107 () Bool)

(declare-fun b_free!6579 () Bool)

(declare-fun b_next!6579 () Bool)

(assert (=> b!247107 (= b_free!6579 (not b_next!6579))))

(declare-fun tp!22982 () Bool)

(declare-fun b_and!13579 () Bool)

(assert (=> b!247107 (= tp!22982 b_and!13579)))

(declare-fun b!247094 () Bool)

(declare-fun e!160300 () Bool)

(declare-datatypes ((SeekEntryResult!1098 0))(
  ( (MissingZero!1098 (index!6562 (_ BitVec 32))) (Found!1098 (index!6563 (_ BitVec 32))) (Intermediate!1098 (undefined!1910 Bool) (index!6564 (_ BitVec 32)) (x!24508 (_ BitVec 32))) (Undefined!1098) (MissingVacant!1098 (index!6565 (_ BitVec 32))) )
))
(declare-fun lt!123753 () SeekEntryResult!1098)

(get-info :version)

(assert (=> b!247094 (= e!160300 ((_ is Undefined!1098) lt!123753))))

(declare-fun b!247095 () Bool)

(declare-fun e!160306 () Bool)

(declare-fun e!160301 () Bool)

(assert (=> b!247095 (= e!160306 (not e!160301))))

(declare-fun res!121131 () Bool)

(assert (=> b!247095 (=> res!121131 e!160301)))

(declare-datatypes ((V!8235 0))(
  ( (V!8236 (val!3265 Int)) )
))
(declare-datatypes ((ValueCell!2877 0))(
  ( (ValueCellFull!2877 (v!5322 V!8235)) (EmptyCell!2877) )
))
(declare-datatypes ((array!12187 0))(
  ( (array!12188 (arr!5782 (Array (_ BitVec 32) ValueCell!2877)) (size!6125 (_ BitVec 32))) )
))
(declare-datatypes ((array!12189 0))(
  ( (array!12190 (arr!5783 (Array (_ BitVec 32) (_ BitVec 64))) (size!6126 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3654 0))(
  ( (LongMapFixedSize!3655 (defaultEntry!4572 Int) (mask!10705 (_ BitVec 32)) (extraKeys!4309 (_ BitVec 32)) (zeroValue!4413 V!8235) (minValue!4413 V!8235) (_size!1876 (_ BitVec 32)) (_keys!6693 array!12189) (_values!4555 array!12187) (_vacant!1876 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3654)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!247095 (= res!121131 (not (validMask!0 (mask!10705 thiss!1504))))))

(declare-fun lt!123761 () array!12189)

(declare-fun arrayCountValidKeys!0 (array!12189 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247095 (= (arrayCountValidKeys!0 lt!123761 #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6693 thiss!1504) #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504)))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!7631 0))(
  ( (Unit!7632) )
))
(declare-fun lt!123760 () Unit!7631)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12189 (_ BitVec 32) (_ BitVec 64)) Unit!7631)

(assert (=> b!247095 (= lt!123760 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6693 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3685 0))(
  ( (Nil!3682) (Cons!3681 (h!4339 (_ BitVec 64)) (t!8706 List!3685)) )
))
(declare-fun arrayNoDuplicates!0 (array!12189 (_ BitVec 32) List!3685) Bool)

(assert (=> b!247095 (arrayNoDuplicates!0 lt!123761 #b00000000000000000000000000000000 Nil!3682)))

(assert (=> b!247095 (= lt!123761 (array!12190 (store (arr!5783 (_keys!6693 thiss!1504)) index!297 key!932) (size!6126 (_keys!6693 thiss!1504))))))

(declare-fun lt!123756 () Unit!7631)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12189 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3685) Unit!7631)

(assert (=> b!247095 (= lt!123756 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6693 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3682))))

(declare-fun lt!123754 () Unit!7631)

(declare-fun e!160303 () Unit!7631)

(assert (=> b!247095 (= lt!123754 e!160303)))

(declare-fun c!41352 () Bool)

(declare-fun arrayContainsKey!0 (array!12189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!247095 (= c!41352 (arrayContainsKey!0 (_keys!6693 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247096 () Bool)

(declare-fun e!160295 () Unit!7631)

(declare-fun Unit!7633 () Unit!7631)

(assert (=> b!247096 (= e!160295 Unit!7633)))

(declare-fun lt!123759 () Unit!7631)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!379 (array!12189 array!12187 (_ BitVec 32) (_ BitVec 32) V!8235 V!8235 (_ BitVec 64) Int) Unit!7631)

(assert (=> b!247096 (= lt!123759 (lemmaInListMapThenSeekEntryOrOpenFindsIt!379 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) key!932 (defaultEntry!4572 thiss!1504)))))

(assert (=> b!247096 false))

(declare-fun b!247097 () Bool)

(declare-fun e!160309 () Bool)

(declare-fun call!23124 () Bool)

(assert (=> b!247097 (= e!160309 (not call!23124))))

(declare-fun res!121135 () Bool)

(declare-fun e!160307 () Bool)

(assert (=> start!23526 (=> (not res!121135) (not e!160307))))

(declare-fun valid!1429 (LongMapFixedSize!3654) Bool)

(assert (=> start!23526 (= res!121135 (valid!1429 thiss!1504))))

(assert (=> start!23526 e!160307))

(declare-fun e!160305 () Bool)

(assert (=> start!23526 e!160305))

(assert (=> start!23526 true))

(declare-fun b!247098 () Bool)

(declare-fun c!41353 () Bool)

(assert (=> b!247098 (= c!41353 ((_ is MissingVacant!1098) lt!123753))))

(declare-fun e!160298 () Bool)

(assert (=> b!247098 (= e!160298 e!160300)))

(declare-fun b!247099 () Bool)

(declare-fun e!160308 () Bool)

(declare-fun tp_is_empty!6441 () Bool)

(assert (=> b!247099 (= e!160308 tp_is_empty!6441)))

(declare-fun b!247100 () Bool)

(declare-fun e!160297 () Bool)

(assert (=> b!247100 (= e!160297 tp_is_empty!6441)))

(declare-fun b!247101 () Bool)

(declare-fun e!160296 () Bool)

(assert (=> b!247101 (= e!160296 e!160306)))

(declare-fun res!121134 () Bool)

(assert (=> b!247101 (=> (not res!121134) (not e!160306))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247101 (= res!121134 (inRange!0 index!297 (mask!10705 thiss!1504)))))

(declare-fun lt!123758 () Unit!7631)

(assert (=> b!247101 (= lt!123758 e!160295)))

(declare-fun c!41355 () Bool)

(declare-datatypes ((tuple2!4804 0))(
  ( (tuple2!4805 (_1!2413 (_ BitVec 64)) (_2!2413 V!8235)) )
))
(declare-datatypes ((List!3686 0))(
  ( (Nil!3683) (Cons!3682 (h!4340 tuple2!4804) (t!8707 List!3686)) )
))
(declare-datatypes ((ListLongMap!3717 0))(
  ( (ListLongMap!3718 (toList!1874 List!3686)) )
))
(declare-fun contains!1787 (ListLongMap!3717 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1402 (array!12189 array!12187 (_ BitVec 32) (_ BitVec 32) V!8235 V!8235 (_ BitVec 32) Int) ListLongMap!3717)

(assert (=> b!247101 (= c!41355 (contains!1787 (getCurrentListMap!1402 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504)) key!932))))

(declare-fun b!247102 () Bool)

(declare-fun res!121132 () Bool)

(assert (=> b!247102 (=> (not res!121132) (not e!160309))))

(assert (=> b!247102 (= res!121132 (= (select (arr!5783 (_keys!6693 thiss!1504)) (index!6562 lt!123753)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247103 () Bool)

(declare-fun e!160299 () Bool)

(assert (=> b!247103 (= e!160300 e!160299)))

(declare-fun res!121127 () Bool)

(declare-fun call!23125 () Bool)

(assert (=> b!247103 (= res!121127 call!23125)))

(assert (=> b!247103 (=> (not res!121127) (not e!160299))))

(declare-fun b!247104 () Bool)

(assert (=> b!247104 (= e!160299 (not call!23124))))

(declare-fun b!247105 () Bool)

(declare-fun Unit!7634 () Unit!7631)

(assert (=> b!247105 (= e!160303 Unit!7634)))

(declare-fun lt!123755 () Unit!7631)

(declare-fun lemmaArrayContainsKeyThenInListMap!183 (array!12189 array!12187 (_ BitVec 32) (_ BitVec 32) V!8235 V!8235 (_ BitVec 64) (_ BitVec 32) Int) Unit!7631)

(assert (=> b!247105 (= lt!123755 (lemmaArrayContainsKeyThenInListMap!183 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504)))))

(assert (=> b!247105 false))

(declare-fun b!247106 () Bool)

(declare-fun res!121133 () Bool)

(assert (=> b!247106 (= res!121133 (= (select (arr!5783 (_keys!6693 thiss!1504)) (index!6565 lt!123753)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247106 (=> (not res!121133) (not e!160299))))

(declare-fun mapNonEmpty!10934 () Bool)

(declare-fun mapRes!10934 () Bool)

(declare-fun tp!22981 () Bool)

(assert (=> mapNonEmpty!10934 (= mapRes!10934 (and tp!22981 e!160308))))

(declare-fun mapKey!10934 () (_ BitVec 32))

(declare-fun mapRest!10934 () (Array (_ BitVec 32) ValueCell!2877))

(declare-fun mapValue!10934 () ValueCell!2877)

(assert (=> mapNonEmpty!10934 (= (arr!5782 (_values!4555 thiss!1504)) (store mapRest!10934 mapKey!10934 mapValue!10934))))

(declare-fun e!160302 () Bool)

(declare-fun array_inv!3819 (array!12189) Bool)

(declare-fun array_inv!3820 (array!12187) Bool)

(assert (=> b!247107 (= e!160305 (and tp!22982 tp_is_empty!6441 (array_inv!3819 (_keys!6693 thiss!1504)) (array_inv!3820 (_values!4555 thiss!1504)) e!160302))))

(declare-fun mapIsEmpty!10934 () Bool)

(assert (=> mapIsEmpty!10934 mapRes!10934))

(declare-fun b!247108 () Bool)

(declare-fun lt!123757 () Unit!7631)

(assert (=> b!247108 (= e!160295 lt!123757)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!384 (array!12189 array!12187 (_ BitVec 32) (_ BitVec 32) V!8235 V!8235 (_ BitVec 64) Int) Unit!7631)

(assert (=> b!247108 (= lt!123757 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!384 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) key!932 (defaultEntry!4572 thiss!1504)))))

(declare-fun c!41354 () Bool)

(assert (=> b!247108 (= c!41354 ((_ is MissingZero!1098) lt!123753))))

(assert (=> b!247108 e!160298))

(declare-fun b!247109 () Bool)

(assert (=> b!247109 (= e!160302 (and e!160297 mapRes!10934))))

(declare-fun condMapEmpty!10934 () Bool)

(declare-fun mapDefault!10934 () ValueCell!2877)

(assert (=> b!247109 (= condMapEmpty!10934 (= (arr!5782 (_values!4555 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2877)) mapDefault!10934)))))

(declare-fun b!247110 () Bool)

(declare-fun res!121130 () Bool)

(assert (=> b!247110 (=> res!121130 e!160301)))

(assert (=> b!247110 (= res!121130 (or (not (= (size!6126 (_keys!6693 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10705 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6126 (_keys!6693 thiss!1504)))))))

(declare-fun b!247111 () Bool)

(declare-fun res!121129 () Bool)

(assert (=> b!247111 (=> (not res!121129) (not e!160309))))

(assert (=> b!247111 (= res!121129 call!23125)))

(assert (=> b!247111 (= e!160298 e!160309)))

(declare-fun bm!23121 () Bool)

(assert (=> bm!23121 (= call!23124 (arrayContainsKey!0 (_keys!6693 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247112 () Bool)

(assert (=> b!247112 (= e!160307 e!160296)))

(declare-fun res!121126 () Bool)

(assert (=> b!247112 (=> (not res!121126) (not e!160296))))

(assert (=> b!247112 (= res!121126 (or (= lt!123753 (MissingZero!1098 index!297)) (= lt!123753 (MissingVacant!1098 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12189 (_ BitVec 32)) SeekEntryResult!1098)

(assert (=> b!247112 (= lt!123753 (seekEntryOrOpen!0 key!932 (_keys!6693 thiss!1504) (mask!10705 thiss!1504)))))

(declare-fun b!247113 () Bool)

(declare-fun Unit!7635 () Unit!7631)

(assert (=> b!247113 (= e!160303 Unit!7635)))

(declare-fun b!247114 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!247114 (= e!160301 (validKeyInArray!0 key!932))))

(declare-fun b!247115 () Bool)

(declare-fun res!121128 () Bool)

(assert (=> b!247115 (=> (not res!121128) (not e!160307))))

(assert (=> b!247115 (= res!121128 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!23122 () Bool)

(assert (=> bm!23122 (= call!23125 (inRange!0 (ite c!41354 (index!6562 lt!123753) (index!6565 lt!123753)) (mask!10705 thiss!1504)))))

(assert (= (and start!23526 res!121135) b!247115))

(assert (= (and b!247115 res!121128) b!247112))

(assert (= (and b!247112 res!121126) b!247101))

(assert (= (and b!247101 c!41355) b!247096))

(assert (= (and b!247101 (not c!41355)) b!247108))

(assert (= (and b!247108 c!41354) b!247111))

(assert (= (and b!247108 (not c!41354)) b!247098))

(assert (= (and b!247111 res!121129) b!247102))

(assert (= (and b!247102 res!121132) b!247097))

(assert (= (and b!247098 c!41353) b!247103))

(assert (= (and b!247098 (not c!41353)) b!247094))

(assert (= (and b!247103 res!121127) b!247106))

(assert (= (and b!247106 res!121133) b!247104))

(assert (= (or b!247111 b!247103) bm!23122))

(assert (= (or b!247097 b!247104) bm!23121))

(assert (= (and b!247101 res!121134) b!247095))

(assert (= (and b!247095 c!41352) b!247105))

(assert (= (and b!247095 (not c!41352)) b!247113))

(assert (= (and b!247095 (not res!121131)) b!247110))

(assert (= (and b!247110 (not res!121130)) b!247114))

(assert (= (and b!247109 condMapEmpty!10934) mapIsEmpty!10934))

(assert (= (and b!247109 (not condMapEmpty!10934)) mapNonEmpty!10934))

(assert (= (and mapNonEmpty!10934 ((_ is ValueCellFull!2877) mapValue!10934)) b!247099))

(assert (= (and b!247109 ((_ is ValueCellFull!2877) mapDefault!10934)) b!247100))

(assert (= b!247107 b!247109))

(assert (= start!23526 b!247107))

(declare-fun m!264271 () Bool)

(assert (=> bm!23122 m!264271))

(declare-fun m!264273 () Bool)

(assert (=> mapNonEmpty!10934 m!264273))

(declare-fun m!264275 () Bool)

(assert (=> b!247096 m!264275))

(declare-fun m!264277 () Bool)

(assert (=> b!247102 m!264277))

(declare-fun m!264279 () Bool)

(assert (=> b!247108 m!264279))

(declare-fun m!264281 () Bool)

(assert (=> b!247101 m!264281))

(declare-fun m!264283 () Bool)

(assert (=> b!247101 m!264283))

(assert (=> b!247101 m!264283))

(declare-fun m!264285 () Bool)

(assert (=> b!247101 m!264285))

(declare-fun m!264287 () Bool)

(assert (=> b!247107 m!264287))

(declare-fun m!264289 () Bool)

(assert (=> b!247107 m!264289))

(declare-fun m!264291 () Bool)

(assert (=> b!247095 m!264291))

(declare-fun m!264293 () Bool)

(assert (=> b!247095 m!264293))

(declare-fun m!264295 () Bool)

(assert (=> b!247095 m!264295))

(declare-fun m!264297 () Bool)

(assert (=> b!247095 m!264297))

(declare-fun m!264299 () Bool)

(assert (=> b!247095 m!264299))

(declare-fun m!264301 () Bool)

(assert (=> b!247095 m!264301))

(declare-fun m!264303 () Bool)

(assert (=> b!247095 m!264303))

(declare-fun m!264305 () Bool)

(assert (=> b!247095 m!264305))

(declare-fun m!264307 () Bool)

(assert (=> b!247112 m!264307))

(declare-fun m!264309 () Bool)

(assert (=> b!247114 m!264309))

(declare-fun m!264311 () Bool)

(assert (=> start!23526 m!264311))

(declare-fun m!264313 () Bool)

(assert (=> b!247106 m!264313))

(declare-fun m!264315 () Bool)

(assert (=> b!247105 m!264315))

(assert (=> bm!23121 m!264293))

(check-sat (not b!247107) (not mapNonEmpty!10934) (not bm!23121) (not b!247105) (not b!247095) (not bm!23122) (not b!247101) (not b!247108) b_and!13579 (not b!247096) (not b_next!6579) (not b!247112) tp_is_empty!6441 (not b!247114) (not start!23526))
(check-sat b_and!13579 (not b_next!6579))
(get-model)

(declare-fun d!60439 () Bool)

(declare-fun res!121170 () Bool)

(declare-fun e!160359 () Bool)

(assert (=> d!60439 (=> res!121170 e!160359)))

(assert (=> d!60439 (= res!121170 (= (select (arr!5783 (_keys!6693 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60439 (= (arrayContainsKey!0 (_keys!6693 thiss!1504) key!932 #b00000000000000000000000000000000) e!160359)))

(declare-fun b!247186 () Bool)

(declare-fun e!160360 () Bool)

(assert (=> b!247186 (= e!160359 e!160360)))

(declare-fun res!121171 () Bool)

(assert (=> b!247186 (=> (not res!121171) (not e!160360))))

(assert (=> b!247186 (= res!121171 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6126 (_keys!6693 thiss!1504))))))

(declare-fun b!247187 () Bool)

(assert (=> b!247187 (= e!160360 (arrayContainsKey!0 (_keys!6693 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60439 (not res!121170)) b!247186))

(assert (= (and b!247186 res!121171) b!247187))

(declare-fun m!264363 () Bool)

(assert (=> d!60439 m!264363))

(declare-fun m!264365 () Bool)

(assert (=> b!247187 m!264365))

(assert (=> bm!23121 d!60439))

(declare-fun d!60441 () Bool)

(assert (=> d!60441 (= (inRange!0 (ite c!41354 (index!6562 lt!123753) (index!6565 lt!123753)) (mask!10705 thiss!1504)) (and (bvsge (ite c!41354 (index!6562 lt!123753) (index!6565 lt!123753)) #b00000000000000000000000000000000) (bvslt (ite c!41354 (index!6562 lt!123753) (index!6565 lt!123753)) (bvadd (mask!10705 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23122 d!60441))

(declare-fun d!60443 () Bool)

(declare-fun res!121178 () Bool)

(declare-fun e!160363 () Bool)

(assert (=> d!60443 (=> (not res!121178) (not e!160363))))

(declare-fun simpleValid!257 (LongMapFixedSize!3654) Bool)

(assert (=> d!60443 (= res!121178 (simpleValid!257 thiss!1504))))

(assert (=> d!60443 (= (valid!1429 thiss!1504) e!160363)))

(declare-fun b!247194 () Bool)

(declare-fun res!121179 () Bool)

(assert (=> b!247194 (=> (not res!121179) (not e!160363))))

(assert (=> b!247194 (= res!121179 (= (arrayCountValidKeys!0 (_keys!6693 thiss!1504) #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))) (_size!1876 thiss!1504)))))

(declare-fun b!247195 () Bool)

(declare-fun res!121180 () Bool)

(assert (=> b!247195 (=> (not res!121180) (not e!160363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12189 (_ BitVec 32)) Bool)

(assert (=> b!247195 (= res!121180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6693 thiss!1504) (mask!10705 thiss!1504)))))

(declare-fun b!247196 () Bool)

(assert (=> b!247196 (= e!160363 (arrayNoDuplicates!0 (_keys!6693 thiss!1504) #b00000000000000000000000000000000 Nil!3682))))

(assert (= (and d!60443 res!121178) b!247194))

(assert (= (and b!247194 res!121179) b!247195))

(assert (= (and b!247195 res!121180) b!247196))

(declare-fun m!264367 () Bool)

(assert (=> d!60443 m!264367))

(assert (=> b!247194 m!264303))

(declare-fun m!264369 () Bool)

(assert (=> b!247195 m!264369))

(declare-fun m!264371 () Bool)

(assert (=> b!247196 m!264371))

(assert (=> start!23526 d!60443))

(declare-fun d!60445 () Bool)

(assert (=> d!60445 (= (array_inv!3819 (_keys!6693 thiss!1504)) (bvsge (size!6126 (_keys!6693 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!247107 d!60445))

(declare-fun d!60447 () Bool)

(assert (=> d!60447 (= (array_inv!3820 (_values!4555 thiss!1504)) (bvsge (size!6125 (_values!4555 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!247107 d!60447))

(declare-fun d!60449 () Bool)

(declare-fun e!160366 () Bool)

(assert (=> d!60449 e!160366))

(declare-fun res!121185 () Bool)

(assert (=> d!60449 (=> (not res!121185) (not e!160366))))

(declare-fun lt!123793 () SeekEntryResult!1098)

(assert (=> d!60449 (= res!121185 ((_ is Found!1098) lt!123793))))

(assert (=> d!60449 (= lt!123793 (seekEntryOrOpen!0 key!932 (_keys!6693 thiss!1504) (mask!10705 thiss!1504)))))

(declare-fun lt!123794 () Unit!7631)

(declare-fun choose!1161 (array!12189 array!12187 (_ BitVec 32) (_ BitVec 32) V!8235 V!8235 (_ BitVec 64) Int) Unit!7631)

(assert (=> d!60449 (= lt!123794 (choose!1161 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) key!932 (defaultEntry!4572 thiss!1504)))))

(assert (=> d!60449 (validMask!0 (mask!10705 thiss!1504))))

(assert (=> d!60449 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!379 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) key!932 (defaultEntry!4572 thiss!1504)) lt!123794)))

(declare-fun b!247201 () Bool)

(declare-fun res!121186 () Bool)

(assert (=> b!247201 (=> (not res!121186) (not e!160366))))

(assert (=> b!247201 (= res!121186 (inRange!0 (index!6563 lt!123793) (mask!10705 thiss!1504)))))

(declare-fun b!247202 () Bool)

(assert (=> b!247202 (= e!160366 (= (select (arr!5783 (_keys!6693 thiss!1504)) (index!6563 lt!123793)) key!932))))

(assert (=> b!247202 (and (bvsge (index!6563 lt!123793) #b00000000000000000000000000000000) (bvslt (index!6563 lt!123793) (size!6126 (_keys!6693 thiss!1504))))))

(assert (= (and d!60449 res!121185) b!247201))

(assert (= (and b!247201 res!121186) b!247202))

(assert (=> d!60449 m!264307))

(declare-fun m!264373 () Bool)

(assert (=> d!60449 m!264373))

(assert (=> d!60449 m!264291))

(declare-fun m!264375 () Bool)

(assert (=> b!247201 m!264375))

(declare-fun m!264377 () Bool)

(assert (=> b!247202 m!264377))

(assert (=> b!247096 d!60449))

(declare-fun d!60451 () Bool)

(assert (=> d!60451 (= (inRange!0 index!297 (mask!10705 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10705 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!247101 d!60451))

(declare-fun d!60453 () Bool)

(declare-fun e!160371 () Bool)

(assert (=> d!60453 e!160371))

(declare-fun res!121189 () Bool)

(assert (=> d!60453 (=> res!121189 e!160371)))

(declare-fun lt!123805 () Bool)

(assert (=> d!60453 (= res!121189 (not lt!123805))))

(declare-fun lt!123806 () Bool)

(assert (=> d!60453 (= lt!123805 lt!123806)))

(declare-fun lt!123803 () Unit!7631)

(declare-fun e!160372 () Unit!7631)

(assert (=> d!60453 (= lt!123803 e!160372)))

(declare-fun c!41370 () Bool)

(assert (=> d!60453 (= c!41370 lt!123806)))

(declare-fun containsKey!284 (List!3686 (_ BitVec 64)) Bool)

(assert (=> d!60453 (= lt!123806 (containsKey!284 (toList!1874 (getCurrentListMap!1402 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504))) key!932))))

(assert (=> d!60453 (= (contains!1787 (getCurrentListMap!1402 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504)) key!932) lt!123805)))

(declare-fun b!247209 () Bool)

(declare-fun lt!123804 () Unit!7631)

(assert (=> b!247209 (= e!160372 lt!123804)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!232 (List!3686 (_ BitVec 64)) Unit!7631)

(assert (=> b!247209 (= lt!123804 (lemmaContainsKeyImpliesGetValueByKeyDefined!232 (toList!1874 (getCurrentListMap!1402 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504))) key!932))))

(declare-datatypes ((Option!298 0))(
  ( (Some!297 (v!5324 V!8235)) (None!296) )
))
(declare-fun isDefined!233 (Option!298) Bool)

(declare-fun getValueByKey!292 (List!3686 (_ BitVec 64)) Option!298)

(assert (=> b!247209 (isDefined!233 (getValueByKey!292 (toList!1874 (getCurrentListMap!1402 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504))) key!932))))

(declare-fun b!247210 () Bool)

(declare-fun Unit!7640 () Unit!7631)

(assert (=> b!247210 (= e!160372 Unit!7640)))

(declare-fun b!247211 () Bool)

(assert (=> b!247211 (= e!160371 (isDefined!233 (getValueByKey!292 (toList!1874 (getCurrentListMap!1402 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504))) key!932)))))

(assert (= (and d!60453 c!41370) b!247209))

(assert (= (and d!60453 (not c!41370)) b!247210))

(assert (= (and d!60453 (not res!121189)) b!247211))

(declare-fun m!264379 () Bool)

(assert (=> d!60453 m!264379))

(declare-fun m!264381 () Bool)

(assert (=> b!247209 m!264381))

(declare-fun m!264383 () Bool)

(assert (=> b!247209 m!264383))

(assert (=> b!247209 m!264383))

(declare-fun m!264385 () Bool)

(assert (=> b!247209 m!264385))

(assert (=> b!247211 m!264383))

(assert (=> b!247211 m!264383))

(assert (=> b!247211 m!264385))

(assert (=> b!247101 d!60453))

(declare-fun b!247254 () Bool)

(declare-fun e!160399 () ListLongMap!3717)

(declare-fun call!23146 () ListLongMap!3717)

(declare-fun +!661 (ListLongMap!3717 tuple2!4804) ListLongMap!3717)

(assert (=> b!247254 (= e!160399 (+!661 call!23146 (tuple2!4805 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4413 thiss!1504))))))

(declare-fun b!247255 () Bool)

(declare-fun e!160402 () Bool)

(declare-fun call!23148 () Bool)

(assert (=> b!247255 (= e!160402 (not call!23148))))

(declare-fun b!247256 () Bool)

(declare-fun e!160403 () Bool)

(assert (=> b!247256 (= e!160402 e!160403)))

(declare-fun res!121211 () Bool)

(assert (=> b!247256 (= res!121211 call!23148)))

(assert (=> b!247256 (=> (not res!121211) (not e!160403))))

(declare-fun bm!23143 () Bool)

(declare-fun call!23152 () ListLongMap!3717)

(declare-fun getCurrentListMapNoExtraKeys!556 (array!12189 array!12187 (_ BitVec 32) (_ BitVec 32) V!8235 V!8235 (_ BitVec 32) Int) ListLongMap!3717)

(assert (=> bm!23143 (= call!23152 (getCurrentListMapNoExtraKeys!556 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504)))))

(declare-fun b!247257 () Bool)

(declare-fun e!160400 () ListLongMap!3717)

(declare-fun call!23149 () ListLongMap!3717)

(assert (=> b!247257 (= e!160400 call!23149)))

(declare-fun bm!23144 () Bool)

(declare-fun call!23150 () ListLongMap!3717)

(assert (=> bm!23144 (= call!23150 call!23146)))

(declare-fun b!247258 () Bool)

(declare-fun e!160409 () Unit!7631)

(declare-fun Unit!7641 () Unit!7631)

(assert (=> b!247258 (= e!160409 Unit!7641)))

(declare-fun b!247259 () Bool)

(declare-fun e!160406 () ListLongMap!3717)

(assert (=> b!247259 (= e!160406 call!23150)))

(declare-fun b!247260 () Bool)

(declare-fun e!160407 () Bool)

(declare-fun lt!123872 () ListLongMap!3717)

(declare-fun apply!234 (ListLongMap!3717 (_ BitVec 64)) V!8235)

(declare-fun get!2969 (ValueCell!2877 V!8235) V!8235)

(declare-fun dynLambda!577 (Int (_ BitVec 64)) V!8235)

(assert (=> b!247260 (= e!160407 (= (apply!234 lt!123872 (select (arr!5783 (_keys!6693 thiss!1504)) #b00000000000000000000000000000000)) (get!2969 (select (arr!5782 (_values!4555 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!577 (defaultEntry!4572 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!247260 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6125 (_values!4555 thiss!1504))))))

(assert (=> b!247260 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))))))

(declare-fun b!247261 () Bool)

(assert (=> b!247261 (= e!160403 (= (apply!234 lt!123872 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4413 thiss!1504)))))

(declare-fun bm!23145 () Bool)

(declare-fun call!23151 () ListLongMap!3717)

(assert (=> bm!23145 (= call!23149 call!23151)))

(declare-fun d!60455 () Bool)

(declare-fun e!160408 () Bool)

(assert (=> d!60455 e!160408))

(declare-fun res!121209 () Bool)

(assert (=> d!60455 (=> (not res!121209) (not e!160408))))

(assert (=> d!60455 (= res!121209 (or (bvsge #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))))))))

(declare-fun lt!123856 () ListLongMap!3717)

(assert (=> d!60455 (= lt!123872 lt!123856)))

(declare-fun lt!123861 () Unit!7631)

(assert (=> d!60455 (= lt!123861 e!160409)))

(declare-fun c!41384 () Bool)

(declare-fun e!160411 () Bool)

(assert (=> d!60455 (= c!41384 e!160411)))

(declare-fun res!121210 () Bool)

(assert (=> d!60455 (=> (not res!121210) (not e!160411))))

(assert (=> d!60455 (= res!121210 (bvslt #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))))))

(assert (=> d!60455 (= lt!123856 e!160399)))

(declare-fun c!41386 () Bool)

(assert (=> d!60455 (= c!41386 (and (not (= (bvand (extraKeys!4309 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4309 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60455 (validMask!0 (mask!10705 thiss!1504))))

(assert (=> d!60455 (= (getCurrentListMap!1402 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504)) lt!123872)))

(declare-fun b!247262 () Bool)

(assert (=> b!247262 (= e!160400 call!23150)))

(declare-fun c!41383 () Bool)

(declare-fun bm!23146 () Bool)

(assert (=> bm!23146 (= call!23146 (+!661 (ite c!41386 call!23152 (ite c!41383 call!23151 call!23149)) (ite (or c!41386 c!41383) (tuple2!4805 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4413 thiss!1504)) (tuple2!4805 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4413 thiss!1504)))))))

(declare-fun b!247263 () Bool)

(assert (=> b!247263 (= e!160411 (validKeyInArray!0 (select (arr!5783 (_keys!6693 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!247264 () Bool)

(declare-fun res!121216 () Bool)

(assert (=> b!247264 (=> (not res!121216) (not e!160408))))

(declare-fun e!160410 () Bool)

(assert (=> b!247264 (= res!121216 e!160410)))

(declare-fun c!41385 () Bool)

(assert (=> b!247264 (= c!41385 (not (= (bvand (extraKeys!4309 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!247265 () Bool)

(assert (=> b!247265 (= e!160408 e!160402)))

(declare-fun c!41387 () Bool)

(assert (=> b!247265 (= c!41387 (not (= (bvand (extraKeys!4309 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!247266 () Bool)

(declare-fun call!23147 () Bool)

(assert (=> b!247266 (= e!160410 (not call!23147))))

(declare-fun b!247267 () Bool)

(declare-fun e!160404 () Bool)

(assert (=> b!247267 (= e!160410 e!160404)))

(declare-fun res!121208 () Bool)

(assert (=> b!247267 (= res!121208 call!23147)))

(assert (=> b!247267 (=> (not res!121208) (not e!160404))))

(declare-fun b!247268 () Bool)

(assert (=> b!247268 (= e!160399 e!160406)))

(assert (=> b!247268 (= c!41383 (and (not (= (bvand (extraKeys!4309 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4309 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23147 () Bool)

(assert (=> bm!23147 (= call!23151 call!23152)))

(declare-fun bm!23148 () Bool)

(assert (=> bm!23148 (= call!23147 (contains!1787 lt!123872 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247269 () Bool)

(assert (=> b!247269 (= e!160404 (= (apply!234 lt!123872 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4413 thiss!1504)))))

(declare-fun b!247270 () Bool)

(declare-fun c!41388 () Bool)

(assert (=> b!247270 (= c!41388 (and (not (= (bvand (extraKeys!4309 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4309 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!247270 (= e!160406 e!160400)))

(declare-fun b!247271 () Bool)

(declare-fun res!121213 () Bool)

(assert (=> b!247271 (=> (not res!121213) (not e!160408))))

(declare-fun e!160405 () Bool)

(assert (=> b!247271 (= res!121213 e!160405)))

(declare-fun res!121212 () Bool)

(assert (=> b!247271 (=> res!121212 e!160405)))

(declare-fun e!160401 () Bool)

(assert (=> b!247271 (= res!121212 (not e!160401))))

(declare-fun res!121214 () Bool)

(assert (=> b!247271 (=> (not res!121214) (not e!160401))))

(assert (=> b!247271 (= res!121214 (bvslt #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))))))

(declare-fun b!247272 () Bool)

(assert (=> b!247272 (= e!160401 (validKeyInArray!0 (select (arr!5783 (_keys!6693 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!247273 () Bool)

(assert (=> b!247273 (= e!160405 e!160407)))

(declare-fun res!121215 () Bool)

(assert (=> b!247273 (=> (not res!121215) (not e!160407))))

(assert (=> b!247273 (= res!121215 (contains!1787 lt!123872 (select (arr!5783 (_keys!6693 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!247273 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))))))

(declare-fun bm!23149 () Bool)

(assert (=> bm!23149 (= call!23148 (contains!1787 lt!123872 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247274 () Bool)

(declare-fun lt!123859 () Unit!7631)

(assert (=> b!247274 (= e!160409 lt!123859)))

(declare-fun lt!123853 () ListLongMap!3717)

(assert (=> b!247274 (= lt!123853 (getCurrentListMapNoExtraKeys!556 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504)))))

(declare-fun lt!123863 () (_ BitVec 64))

(assert (=> b!247274 (= lt!123863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123862 () (_ BitVec 64))

(assert (=> b!247274 (= lt!123862 (select (arr!5783 (_keys!6693 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123865 () Unit!7631)

(declare-fun addStillContains!210 (ListLongMap!3717 (_ BitVec 64) V!8235 (_ BitVec 64)) Unit!7631)

(assert (=> b!247274 (= lt!123865 (addStillContains!210 lt!123853 lt!123863 (zeroValue!4413 thiss!1504) lt!123862))))

(assert (=> b!247274 (contains!1787 (+!661 lt!123853 (tuple2!4805 lt!123863 (zeroValue!4413 thiss!1504))) lt!123862)))

(declare-fun lt!123864 () Unit!7631)

(assert (=> b!247274 (= lt!123864 lt!123865)))

(declare-fun lt!123855 () ListLongMap!3717)

(assert (=> b!247274 (= lt!123855 (getCurrentListMapNoExtraKeys!556 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504)))))

(declare-fun lt!123852 () (_ BitVec 64))

(assert (=> b!247274 (= lt!123852 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123866 () (_ BitVec 64))

(assert (=> b!247274 (= lt!123866 (select (arr!5783 (_keys!6693 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123854 () Unit!7631)

(declare-fun addApplyDifferent!210 (ListLongMap!3717 (_ BitVec 64) V!8235 (_ BitVec 64)) Unit!7631)

(assert (=> b!247274 (= lt!123854 (addApplyDifferent!210 lt!123855 lt!123852 (minValue!4413 thiss!1504) lt!123866))))

(assert (=> b!247274 (= (apply!234 (+!661 lt!123855 (tuple2!4805 lt!123852 (minValue!4413 thiss!1504))) lt!123866) (apply!234 lt!123855 lt!123866))))

(declare-fun lt!123868 () Unit!7631)

(assert (=> b!247274 (= lt!123868 lt!123854)))

(declare-fun lt!123860 () ListLongMap!3717)

(assert (=> b!247274 (= lt!123860 (getCurrentListMapNoExtraKeys!556 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504)))))

(declare-fun lt!123851 () (_ BitVec 64))

(assert (=> b!247274 (= lt!123851 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123857 () (_ BitVec 64))

(assert (=> b!247274 (= lt!123857 (select (arr!5783 (_keys!6693 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123867 () Unit!7631)

(assert (=> b!247274 (= lt!123867 (addApplyDifferent!210 lt!123860 lt!123851 (zeroValue!4413 thiss!1504) lt!123857))))

(assert (=> b!247274 (= (apply!234 (+!661 lt!123860 (tuple2!4805 lt!123851 (zeroValue!4413 thiss!1504))) lt!123857) (apply!234 lt!123860 lt!123857))))

(declare-fun lt!123869 () Unit!7631)

(assert (=> b!247274 (= lt!123869 lt!123867)))

(declare-fun lt!123858 () ListLongMap!3717)

(assert (=> b!247274 (= lt!123858 (getCurrentListMapNoExtraKeys!556 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504)))))

(declare-fun lt!123871 () (_ BitVec 64))

(assert (=> b!247274 (= lt!123871 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123870 () (_ BitVec 64))

(assert (=> b!247274 (= lt!123870 (select (arr!5783 (_keys!6693 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!247274 (= lt!123859 (addApplyDifferent!210 lt!123858 lt!123871 (minValue!4413 thiss!1504) lt!123870))))

(assert (=> b!247274 (= (apply!234 (+!661 lt!123858 (tuple2!4805 lt!123871 (minValue!4413 thiss!1504))) lt!123870) (apply!234 lt!123858 lt!123870))))

(assert (= (and d!60455 c!41386) b!247254))

(assert (= (and d!60455 (not c!41386)) b!247268))

(assert (= (and b!247268 c!41383) b!247259))

(assert (= (and b!247268 (not c!41383)) b!247270))

(assert (= (and b!247270 c!41388) b!247262))

(assert (= (and b!247270 (not c!41388)) b!247257))

(assert (= (or b!247262 b!247257) bm!23145))

(assert (= (or b!247259 bm!23145) bm!23147))

(assert (= (or b!247259 b!247262) bm!23144))

(assert (= (or b!247254 bm!23147) bm!23143))

(assert (= (or b!247254 bm!23144) bm!23146))

(assert (= (and d!60455 res!121210) b!247263))

(assert (= (and d!60455 c!41384) b!247274))

(assert (= (and d!60455 (not c!41384)) b!247258))

(assert (= (and d!60455 res!121209) b!247271))

(assert (= (and b!247271 res!121214) b!247272))

(assert (= (and b!247271 (not res!121212)) b!247273))

(assert (= (and b!247273 res!121215) b!247260))

(assert (= (and b!247271 res!121213) b!247264))

(assert (= (and b!247264 c!41385) b!247267))

(assert (= (and b!247264 (not c!41385)) b!247266))

(assert (= (and b!247267 res!121208) b!247269))

(assert (= (or b!247267 b!247266) bm!23148))

(assert (= (and b!247264 res!121216) b!247265))

(assert (= (and b!247265 c!41387) b!247256))

(assert (= (and b!247265 (not c!41387)) b!247255))

(assert (= (and b!247256 res!121211) b!247261))

(assert (= (or b!247256 b!247255) bm!23149))

(declare-fun b_lambda!8047 () Bool)

(assert (=> (not b_lambda!8047) (not b!247260)))

(declare-fun t!8711 () Bool)

(declare-fun tb!2981 () Bool)

(assert (=> (and b!247107 (= (defaultEntry!4572 thiss!1504) (defaultEntry!4572 thiss!1504)) t!8711) tb!2981))

(declare-fun result!5265 () Bool)

(assert (=> tb!2981 (= result!5265 tp_is_empty!6441)))

(assert (=> b!247260 t!8711))

(declare-fun b_and!13583 () Bool)

(assert (= b_and!13579 (and (=> t!8711 result!5265) b_and!13583)))

(assert (=> b!247263 m!264363))

(assert (=> b!247263 m!264363))

(declare-fun m!264387 () Bool)

(assert (=> b!247263 m!264387))

(assert (=> d!60455 m!264291))

(assert (=> b!247260 m!264363))

(declare-fun m!264389 () Bool)

(assert (=> b!247260 m!264389))

(declare-fun m!264391 () Bool)

(assert (=> b!247260 m!264391))

(declare-fun m!264393 () Bool)

(assert (=> b!247260 m!264393))

(declare-fun m!264395 () Bool)

(assert (=> b!247260 m!264395))

(assert (=> b!247260 m!264363))

(assert (=> b!247260 m!264391))

(assert (=> b!247260 m!264393))

(declare-fun m!264397 () Bool)

(assert (=> b!247261 m!264397))

(declare-fun m!264399 () Bool)

(assert (=> b!247254 m!264399))

(declare-fun m!264401 () Bool)

(assert (=> bm!23143 m!264401))

(declare-fun m!264403 () Bool)

(assert (=> b!247274 m!264403))

(declare-fun m!264405 () Bool)

(assert (=> b!247274 m!264405))

(declare-fun m!264407 () Bool)

(assert (=> b!247274 m!264407))

(declare-fun m!264409 () Bool)

(assert (=> b!247274 m!264409))

(declare-fun m!264411 () Bool)

(assert (=> b!247274 m!264411))

(assert (=> b!247274 m!264403))

(declare-fun m!264413 () Bool)

(assert (=> b!247274 m!264413))

(assert (=> b!247274 m!264363))

(declare-fun m!264415 () Bool)

(assert (=> b!247274 m!264415))

(declare-fun m!264417 () Bool)

(assert (=> b!247274 m!264417))

(declare-fun m!264419 () Bool)

(assert (=> b!247274 m!264419))

(declare-fun m!264421 () Bool)

(assert (=> b!247274 m!264421))

(declare-fun m!264423 () Bool)

(assert (=> b!247274 m!264423))

(declare-fun m!264425 () Bool)

(assert (=> b!247274 m!264425))

(declare-fun m!264427 () Bool)

(assert (=> b!247274 m!264427))

(declare-fun m!264429 () Bool)

(assert (=> b!247274 m!264429))

(assert (=> b!247274 m!264401))

(assert (=> b!247274 m!264417))

(assert (=> b!247274 m!264427))

(declare-fun m!264431 () Bool)

(assert (=> b!247274 m!264431))

(assert (=> b!247274 m!264405))

(declare-fun m!264433 () Bool)

(assert (=> bm!23148 m!264433))

(assert (=> b!247272 m!264363))

(assert (=> b!247272 m!264363))

(assert (=> b!247272 m!264387))

(assert (=> b!247273 m!264363))

(assert (=> b!247273 m!264363))

(declare-fun m!264435 () Bool)

(assert (=> b!247273 m!264435))

(declare-fun m!264437 () Bool)

(assert (=> bm!23146 m!264437))

(declare-fun m!264439 () Bool)

(assert (=> b!247269 m!264439))

(declare-fun m!264441 () Bool)

(assert (=> bm!23149 m!264441))

(assert (=> b!247101 d!60455))

(declare-fun d!60457 () Bool)

(assert (=> d!60457 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!247114 d!60457))

(declare-fun b!247285 () Bool)

(declare-fun e!160417 () (_ BitVec 32))

(declare-fun call!23155 () (_ BitVec 32))

(assert (=> b!247285 (= e!160417 (bvadd #b00000000000000000000000000000001 call!23155))))

(declare-fun d!60459 () Bool)

(declare-fun lt!123875 () (_ BitVec 32))

(assert (=> d!60459 (and (bvsge lt!123875 #b00000000000000000000000000000000) (bvsle lt!123875 (bvsub (size!6126 lt!123761) #b00000000000000000000000000000000)))))

(declare-fun e!160416 () (_ BitVec 32))

(assert (=> d!60459 (= lt!123875 e!160416)))

(declare-fun c!41393 () Bool)

(assert (=> d!60459 (= c!41393 (bvsge #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))))))

(assert (=> d!60459 (and (bvsle #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6126 (_keys!6693 thiss!1504)) (size!6126 lt!123761)))))

(assert (=> d!60459 (= (arrayCountValidKeys!0 lt!123761 #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))) lt!123875)))

(declare-fun b!247286 () Bool)

(assert (=> b!247286 (= e!160416 #b00000000000000000000000000000000)))

(declare-fun b!247287 () Bool)

(assert (=> b!247287 (= e!160417 call!23155)))

(declare-fun bm!23152 () Bool)

(assert (=> bm!23152 (= call!23155 (arrayCountValidKeys!0 lt!123761 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6126 (_keys!6693 thiss!1504))))))

(declare-fun b!247288 () Bool)

(assert (=> b!247288 (= e!160416 e!160417)))

(declare-fun c!41394 () Bool)

(assert (=> b!247288 (= c!41394 (validKeyInArray!0 (select (arr!5783 lt!123761) #b00000000000000000000000000000000)))))

(assert (= (and d!60459 c!41393) b!247286))

(assert (= (and d!60459 (not c!41393)) b!247288))

(assert (= (and b!247288 c!41394) b!247285))

(assert (= (and b!247288 (not c!41394)) b!247287))

(assert (= (or b!247285 b!247287) bm!23152))

(declare-fun m!264443 () Bool)

(assert (=> bm!23152 m!264443))

(declare-fun m!264445 () Bool)

(assert (=> b!247288 m!264445))

(assert (=> b!247288 m!264445))

(declare-fun m!264447 () Bool)

(assert (=> b!247288 m!264447))

(assert (=> b!247095 d!60459))

(declare-fun d!60461 () Bool)

(declare-fun e!160423 () Bool)

(assert (=> d!60461 e!160423))

(declare-fun res!121226 () Bool)

(assert (=> d!60461 (=> (not res!121226) (not e!160423))))

(assert (=> d!60461 (= res!121226 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6126 (_keys!6693 thiss!1504)))))))

(declare-fun lt!123878 () Unit!7631)

(declare-fun choose!1 (array!12189 (_ BitVec 32) (_ BitVec 64)) Unit!7631)

(assert (=> d!60461 (= lt!123878 (choose!1 (_keys!6693 thiss!1504) index!297 key!932))))

(declare-fun e!160422 () Bool)

(assert (=> d!60461 e!160422))

(declare-fun res!121225 () Bool)

(assert (=> d!60461 (=> (not res!121225) (not e!160422))))

(assert (=> d!60461 (= res!121225 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6126 (_keys!6693 thiss!1504)))))))

(assert (=> d!60461 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6693 thiss!1504) index!297 key!932) lt!123878)))

(declare-fun b!247299 () Bool)

(assert (=> b!247299 (= e!160422 (bvslt (size!6126 (_keys!6693 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!247297 () Bool)

(declare-fun res!121227 () Bool)

(assert (=> b!247297 (=> (not res!121227) (not e!160422))))

(assert (=> b!247297 (= res!121227 (not (validKeyInArray!0 (select (arr!5783 (_keys!6693 thiss!1504)) index!297))))))

(declare-fun b!247300 () Bool)

(assert (=> b!247300 (= e!160423 (= (arrayCountValidKeys!0 (array!12190 (store (arr!5783 (_keys!6693 thiss!1504)) index!297 key!932) (size!6126 (_keys!6693 thiss!1504))) #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6693 thiss!1504) #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!247298 () Bool)

(declare-fun res!121228 () Bool)

(assert (=> b!247298 (=> (not res!121228) (not e!160422))))

(assert (=> b!247298 (= res!121228 (validKeyInArray!0 key!932))))

(assert (= (and d!60461 res!121225) b!247297))

(assert (= (and b!247297 res!121227) b!247298))

(assert (= (and b!247298 res!121228) b!247299))

(assert (= (and d!60461 res!121226) b!247300))

(declare-fun m!264449 () Bool)

(assert (=> d!60461 m!264449))

(declare-fun m!264451 () Bool)

(assert (=> b!247297 m!264451))

(assert (=> b!247297 m!264451))

(declare-fun m!264453 () Bool)

(assert (=> b!247297 m!264453))

(assert (=> b!247300 m!264301))

(declare-fun m!264455 () Bool)

(assert (=> b!247300 m!264455))

(assert (=> b!247300 m!264303))

(assert (=> b!247298 m!264309))

(assert (=> b!247095 d!60461))

(assert (=> b!247095 d!60439))

(declare-fun b!247301 () Bool)

(declare-fun e!160425 () (_ BitVec 32))

(declare-fun call!23156 () (_ BitVec 32))

(assert (=> b!247301 (= e!160425 (bvadd #b00000000000000000000000000000001 call!23156))))

(declare-fun d!60463 () Bool)

(declare-fun lt!123879 () (_ BitVec 32))

(assert (=> d!60463 (and (bvsge lt!123879 #b00000000000000000000000000000000) (bvsle lt!123879 (bvsub (size!6126 (_keys!6693 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!160424 () (_ BitVec 32))

(assert (=> d!60463 (= lt!123879 e!160424)))

(declare-fun c!41395 () Bool)

(assert (=> d!60463 (= c!41395 (bvsge #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))))))

(assert (=> d!60463 (and (bvsle #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6126 (_keys!6693 thiss!1504)) (size!6126 (_keys!6693 thiss!1504))))))

(assert (=> d!60463 (= (arrayCountValidKeys!0 (_keys!6693 thiss!1504) #b00000000000000000000000000000000 (size!6126 (_keys!6693 thiss!1504))) lt!123879)))

(declare-fun b!247302 () Bool)

(assert (=> b!247302 (= e!160424 #b00000000000000000000000000000000)))

(declare-fun b!247303 () Bool)

(assert (=> b!247303 (= e!160425 call!23156)))

(declare-fun bm!23153 () Bool)

(assert (=> bm!23153 (= call!23156 (arrayCountValidKeys!0 (_keys!6693 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6126 (_keys!6693 thiss!1504))))))

(declare-fun b!247304 () Bool)

(assert (=> b!247304 (= e!160424 e!160425)))

(declare-fun c!41396 () Bool)

(assert (=> b!247304 (= c!41396 (validKeyInArray!0 (select (arr!5783 (_keys!6693 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60463 c!41395) b!247302))

(assert (= (and d!60463 (not c!41395)) b!247304))

(assert (= (and b!247304 c!41396) b!247301))

(assert (= (and b!247304 (not c!41396)) b!247303))

(assert (= (or b!247301 b!247303) bm!23153))

(declare-fun m!264457 () Bool)

(assert (=> bm!23153 m!264457))

(assert (=> b!247304 m!264363))

(assert (=> b!247304 m!264363))

(assert (=> b!247304 m!264387))

(assert (=> b!247095 d!60463))

(declare-fun d!60465 () Bool)

(assert (=> d!60465 (= (validMask!0 (mask!10705 thiss!1504)) (and (or (= (mask!10705 thiss!1504) #b00000000000000000000000000000111) (= (mask!10705 thiss!1504) #b00000000000000000000000000001111) (= (mask!10705 thiss!1504) #b00000000000000000000000000011111) (= (mask!10705 thiss!1504) #b00000000000000000000000000111111) (= (mask!10705 thiss!1504) #b00000000000000000000000001111111) (= (mask!10705 thiss!1504) #b00000000000000000000000011111111) (= (mask!10705 thiss!1504) #b00000000000000000000000111111111) (= (mask!10705 thiss!1504) #b00000000000000000000001111111111) (= (mask!10705 thiss!1504) #b00000000000000000000011111111111) (= (mask!10705 thiss!1504) #b00000000000000000000111111111111) (= (mask!10705 thiss!1504) #b00000000000000000001111111111111) (= (mask!10705 thiss!1504) #b00000000000000000011111111111111) (= (mask!10705 thiss!1504) #b00000000000000000111111111111111) (= (mask!10705 thiss!1504) #b00000000000000001111111111111111) (= (mask!10705 thiss!1504) #b00000000000000011111111111111111) (= (mask!10705 thiss!1504) #b00000000000000111111111111111111) (= (mask!10705 thiss!1504) #b00000000000001111111111111111111) (= (mask!10705 thiss!1504) #b00000000000011111111111111111111) (= (mask!10705 thiss!1504) #b00000000000111111111111111111111) (= (mask!10705 thiss!1504) #b00000000001111111111111111111111) (= (mask!10705 thiss!1504) #b00000000011111111111111111111111) (= (mask!10705 thiss!1504) #b00000000111111111111111111111111) (= (mask!10705 thiss!1504) #b00000001111111111111111111111111) (= (mask!10705 thiss!1504) #b00000011111111111111111111111111) (= (mask!10705 thiss!1504) #b00000111111111111111111111111111) (= (mask!10705 thiss!1504) #b00001111111111111111111111111111) (= (mask!10705 thiss!1504) #b00011111111111111111111111111111) (= (mask!10705 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10705 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!247095 d!60465))

(declare-fun b!247315 () Bool)

(declare-fun e!160436 () Bool)

(declare-fun contains!1789 (List!3685 (_ BitVec 64)) Bool)

(assert (=> b!247315 (= e!160436 (contains!1789 Nil!3682 (select (arr!5783 lt!123761) #b00000000000000000000000000000000)))))

(declare-fun b!247316 () Bool)

(declare-fun e!160434 () Bool)

(declare-fun e!160437 () Bool)

(assert (=> b!247316 (= e!160434 e!160437)))

(declare-fun c!41399 () Bool)

(assert (=> b!247316 (= c!41399 (validKeyInArray!0 (select (arr!5783 lt!123761) #b00000000000000000000000000000000)))))

(declare-fun b!247317 () Bool)

(declare-fun e!160435 () Bool)

(assert (=> b!247317 (= e!160435 e!160434)))

(declare-fun res!121236 () Bool)

(assert (=> b!247317 (=> (not res!121236) (not e!160434))))

(assert (=> b!247317 (= res!121236 (not e!160436))))

(declare-fun res!121235 () Bool)

(assert (=> b!247317 (=> (not res!121235) (not e!160436))))

(assert (=> b!247317 (= res!121235 (validKeyInArray!0 (select (arr!5783 lt!123761) #b00000000000000000000000000000000)))))

(declare-fun b!247318 () Bool)

(declare-fun call!23159 () Bool)

(assert (=> b!247318 (= e!160437 call!23159)))

(declare-fun d!60467 () Bool)

(declare-fun res!121237 () Bool)

(assert (=> d!60467 (=> res!121237 e!160435)))

(assert (=> d!60467 (= res!121237 (bvsge #b00000000000000000000000000000000 (size!6126 lt!123761)))))

(assert (=> d!60467 (= (arrayNoDuplicates!0 lt!123761 #b00000000000000000000000000000000 Nil!3682) e!160435)))

(declare-fun bm!23156 () Bool)

(assert (=> bm!23156 (= call!23159 (arrayNoDuplicates!0 lt!123761 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41399 (Cons!3681 (select (arr!5783 lt!123761) #b00000000000000000000000000000000) Nil!3682) Nil!3682)))))

(declare-fun b!247319 () Bool)

(assert (=> b!247319 (= e!160437 call!23159)))

(assert (= (and d!60467 (not res!121237)) b!247317))

(assert (= (and b!247317 res!121235) b!247315))

(assert (= (and b!247317 res!121236) b!247316))

(assert (= (and b!247316 c!41399) b!247319))

(assert (= (and b!247316 (not c!41399)) b!247318))

(assert (= (or b!247319 b!247318) bm!23156))

(assert (=> b!247315 m!264445))

(assert (=> b!247315 m!264445))

(declare-fun m!264459 () Bool)

(assert (=> b!247315 m!264459))

(assert (=> b!247316 m!264445))

(assert (=> b!247316 m!264445))

(assert (=> b!247316 m!264447))

(assert (=> b!247317 m!264445))

(assert (=> b!247317 m!264445))

(assert (=> b!247317 m!264447))

(assert (=> bm!23156 m!264445))

(declare-fun m!264461 () Bool)

(assert (=> bm!23156 m!264461))

(assert (=> b!247095 d!60467))

(declare-fun d!60469 () Bool)

(declare-fun e!160440 () Bool)

(assert (=> d!60469 e!160440))

(declare-fun res!121240 () Bool)

(assert (=> d!60469 (=> (not res!121240) (not e!160440))))

(assert (=> d!60469 (= res!121240 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6126 (_keys!6693 thiss!1504)))))))

(declare-fun lt!123882 () Unit!7631)

(declare-fun choose!41 (array!12189 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3685) Unit!7631)

(assert (=> d!60469 (= lt!123882 (choose!41 (_keys!6693 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3682))))

(assert (=> d!60469 (bvslt (size!6126 (_keys!6693 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60469 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6693 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3682) lt!123882)))

(declare-fun b!247322 () Bool)

(assert (=> b!247322 (= e!160440 (arrayNoDuplicates!0 (array!12190 (store (arr!5783 (_keys!6693 thiss!1504)) index!297 key!932) (size!6126 (_keys!6693 thiss!1504))) #b00000000000000000000000000000000 Nil!3682))))

(assert (= (and d!60469 res!121240) b!247322))

(declare-fun m!264463 () Bool)

(assert (=> d!60469 m!264463))

(assert (=> b!247322 m!264301))

(declare-fun m!264465 () Bool)

(assert (=> b!247322 m!264465))

(assert (=> b!247095 d!60469))

(declare-fun d!60471 () Bool)

(assert (=> d!60471 (contains!1787 (getCurrentListMap!1402 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504)) key!932)))

(declare-fun lt!123885 () Unit!7631)

(declare-fun choose!1162 (array!12189 array!12187 (_ BitVec 32) (_ BitVec 32) V!8235 V!8235 (_ BitVec 64) (_ BitVec 32) Int) Unit!7631)

(assert (=> d!60471 (= lt!123885 (choose!1162 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504)))))

(assert (=> d!60471 (validMask!0 (mask!10705 thiss!1504))))

(assert (=> d!60471 (= (lemmaArrayContainsKeyThenInListMap!183 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4572 thiss!1504)) lt!123885)))

(declare-fun bs!8921 () Bool)

(assert (= bs!8921 d!60471))

(assert (=> bs!8921 m!264283))

(assert (=> bs!8921 m!264283))

(assert (=> bs!8921 m!264285))

(declare-fun m!264467 () Bool)

(assert (=> bs!8921 m!264467))

(assert (=> bs!8921 m!264291))

(assert (=> b!247105 d!60471))

(declare-fun bm!23161 () Bool)

(declare-fun call!23164 () Bool)

(assert (=> bm!23161 (= call!23164 (arrayContainsKey!0 (_keys!6693 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247339 () Bool)

(declare-fun res!121250 () Bool)

(declare-fun e!160451 () Bool)

(assert (=> b!247339 (=> (not res!121250) (not e!160451))))

(declare-fun call!23165 () Bool)

(assert (=> b!247339 (= res!121250 call!23165)))

(declare-fun e!160450 () Bool)

(assert (=> b!247339 (= e!160450 e!160451)))

(declare-fun b!247341 () Bool)

(declare-fun e!160452 () Bool)

(declare-fun e!160449 () Bool)

(assert (=> b!247341 (= e!160452 e!160449)))

(declare-fun res!121249 () Bool)

(assert (=> b!247341 (= res!121249 call!23165)))

(assert (=> b!247341 (=> (not res!121249) (not e!160449))))

(declare-fun b!247342 () Bool)

(declare-fun res!121251 () Bool)

(assert (=> b!247342 (=> (not res!121251) (not e!160451))))

(declare-fun lt!123890 () SeekEntryResult!1098)

(assert (=> b!247342 (= res!121251 (= (select (arr!5783 (_keys!6693 thiss!1504)) (index!6565 lt!123890)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247342 (and (bvsge (index!6565 lt!123890) #b00000000000000000000000000000000) (bvslt (index!6565 lt!123890) (size!6126 (_keys!6693 thiss!1504))))))

(declare-fun b!247343 () Bool)

(assert (=> b!247343 (and (bvsge (index!6562 lt!123890) #b00000000000000000000000000000000) (bvslt (index!6562 lt!123890) (size!6126 (_keys!6693 thiss!1504))))))

(declare-fun res!121252 () Bool)

(assert (=> b!247343 (= res!121252 (= (select (arr!5783 (_keys!6693 thiss!1504)) (index!6562 lt!123890)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247343 (=> (not res!121252) (not e!160449))))

(declare-fun b!247344 () Bool)

(assert (=> b!247344 (= e!160450 ((_ is Undefined!1098) lt!123890))))

(declare-fun b!247345 () Bool)

(assert (=> b!247345 (= e!160451 (not call!23164))))

(declare-fun d!60473 () Bool)

(assert (=> d!60473 e!160452))

(declare-fun c!41404 () Bool)

(assert (=> d!60473 (= c!41404 ((_ is MissingZero!1098) lt!123890))))

(assert (=> d!60473 (= lt!123890 (seekEntryOrOpen!0 key!932 (_keys!6693 thiss!1504) (mask!10705 thiss!1504)))))

(declare-fun lt!123891 () Unit!7631)

(declare-fun choose!1163 (array!12189 array!12187 (_ BitVec 32) (_ BitVec 32) V!8235 V!8235 (_ BitVec 64) Int) Unit!7631)

(assert (=> d!60473 (= lt!123891 (choose!1163 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) key!932 (defaultEntry!4572 thiss!1504)))))

(assert (=> d!60473 (validMask!0 (mask!10705 thiss!1504))))

(assert (=> d!60473 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!384 (_keys!6693 thiss!1504) (_values!4555 thiss!1504) (mask!10705 thiss!1504) (extraKeys!4309 thiss!1504) (zeroValue!4413 thiss!1504) (minValue!4413 thiss!1504) key!932 (defaultEntry!4572 thiss!1504)) lt!123891)))

(declare-fun b!247340 () Bool)

(assert (=> b!247340 (= e!160452 e!160450)))

(declare-fun c!41405 () Bool)

(assert (=> b!247340 (= c!41405 ((_ is MissingVacant!1098) lt!123890))))

(declare-fun bm!23162 () Bool)

(assert (=> bm!23162 (= call!23165 (inRange!0 (ite c!41404 (index!6562 lt!123890) (index!6565 lt!123890)) (mask!10705 thiss!1504)))))

(declare-fun b!247346 () Bool)

(assert (=> b!247346 (= e!160449 (not call!23164))))

(assert (= (and d!60473 c!41404) b!247341))

(assert (= (and d!60473 (not c!41404)) b!247340))

(assert (= (and b!247341 res!121249) b!247343))

(assert (= (and b!247343 res!121252) b!247346))

(assert (= (and b!247340 c!41405) b!247339))

(assert (= (and b!247340 (not c!41405)) b!247344))

(assert (= (and b!247339 res!121250) b!247342))

(assert (= (and b!247342 res!121251) b!247345))

(assert (= (or b!247341 b!247339) bm!23162))

(assert (= (or b!247346 b!247345) bm!23161))

(declare-fun m!264469 () Bool)

(assert (=> bm!23162 m!264469))

(declare-fun m!264471 () Bool)

(assert (=> b!247343 m!264471))

(assert (=> d!60473 m!264307))

(declare-fun m!264473 () Bool)

(assert (=> d!60473 m!264473))

(assert (=> d!60473 m!264291))

(declare-fun m!264475 () Bool)

(assert (=> b!247342 m!264475))

(assert (=> bm!23161 m!264293))

(assert (=> b!247108 d!60473))

(declare-fun b!247359 () Bool)

(declare-fun e!160459 () SeekEntryResult!1098)

(declare-fun lt!123900 () SeekEntryResult!1098)

(assert (=> b!247359 (= e!160459 (Found!1098 (index!6564 lt!123900)))))

(declare-fun b!247360 () Bool)

(declare-fun e!160460 () SeekEntryResult!1098)

(assert (=> b!247360 (= e!160460 (MissingZero!1098 (index!6564 lt!123900)))))

(declare-fun b!247361 () Bool)

(declare-fun e!160461 () SeekEntryResult!1098)

(assert (=> b!247361 (= e!160461 Undefined!1098)))

(declare-fun b!247362 () Bool)

(assert (=> b!247362 (= e!160461 e!160459)))

(declare-fun lt!123899 () (_ BitVec 64))

(assert (=> b!247362 (= lt!123899 (select (arr!5783 (_keys!6693 thiss!1504)) (index!6564 lt!123900)))))

(declare-fun c!41414 () Bool)

(assert (=> b!247362 (= c!41414 (= lt!123899 key!932))))

(declare-fun b!247363 () Bool)

(declare-fun c!41413 () Bool)

(assert (=> b!247363 (= c!41413 (= lt!123899 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247363 (= e!160459 e!160460)))

(declare-fun d!60475 () Bool)

(declare-fun lt!123898 () SeekEntryResult!1098)

(assert (=> d!60475 (and (or ((_ is Undefined!1098) lt!123898) (not ((_ is Found!1098) lt!123898)) (and (bvsge (index!6563 lt!123898) #b00000000000000000000000000000000) (bvslt (index!6563 lt!123898) (size!6126 (_keys!6693 thiss!1504))))) (or ((_ is Undefined!1098) lt!123898) ((_ is Found!1098) lt!123898) (not ((_ is MissingZero!1098) lt!123898)) (and (bvsge (index!6562 lt!123898) #b00000000000000000000000000000000) (bvslt (index!6562 lt!123898) (size!6126 (_keys!6693 thiss!1504))))) (or ((_ is Undefined!1098) lt!123898) ((_ is Found!1098) lt!123898) ((_ is MissingZero!1098) lt!123898) (not ((_ is MissingVacant!1098) lt!123898)) (and (bvsge (index!6565 lt!123898) #b00000000000000000000000000000000) (bvslt (index!6565 lt!123898) (size!6126 (_keys!6693 thiss!1504))))) (or ((_ is Undefined!1098) lt!123898) (ite ((_ is Found!1098) lt!123898) (= (select (arr!5783 (_keys!6693 thiss!1504)) (index!6563 lt!123898)) key!932) (ite ((_ is MissingZero!1098) lt!123898) (= (select (arr!5783 (_keys!6693 thiss!1504)) (index!6562 lt!123898)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1098) lt!123898) (= (select (arr!5783 (_keys!6693 thiss!1504)) (index!6565 lt!123898)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60475 (= lt!123898 e!160461)))

(declare-fun c!41412 () Bool)

(assert (=> d!60475 (= c!41412 (and ((_ is Intermediate!1098) lt!123900) (undefined!1910 lt!123900)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12189 (_ BitVec 32)) SeekEntryResult!1098)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60475 (= lt!123900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10705 thiss!1504)) key!932 (_keys!6693 thiss!1504) (mask!10705 thiss!1504)))))

(assert (=> d!60475 (validMask!0 (mask!10705 thiss!1504))))

(assert (=> d!60475 (= (seekEntryOrOpen!0 key!932 (_keys!6693 thiss!1504) (mask!10705 thiss!1504)) lt!123898)))

(declare-fun b!247364 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12189 (_ BitVec 32)) SeekEntryResult!1098)

(assert (=> b!247364 (= e!160460 (seekKeyOrZeroReturnVacant!0 (x!24508 lt!123900) (index!6564 lt!123900) (index!6564 lt!123900) key!932 (_keys!6693 thiss!1504) (mask!10705 thiss!1504)))))

(assert (= (and d!60475 c!41412) b!247361))

(assert (= (and d!60475 (not c!41412)) b!247362))

(assert (= (and b!247362 c!41414) b!247359))

(assert (= (and b!247362 (not c!41414)) b!247363))

(assert (= (and b!247363 c!41413) b!247360))

(assert (= (and b!247363 (not c!41413)) b!247364))

(declare-fun m!264477 () Bool)

(assert (=> b!247362 m!264477))

(assert (=> d!60475 m!264291))

(declare-fun m!264479 () Bool)

(assert (=> d!60475 m!264479))

(assert (=> d!60475 m!264479))

(declare-fun m!264481 () Bool)

(assert (=> d!60475 m!264481))

(declare-fun m!264483 () Bool)

(assert (=> d!60475 m!264483))

(declare-fun m!264485 () Bool)

(assert (=> d!60475 m!264485))

(declare-fun m!264487 () Bool)

(assert (=> d!60475 m!264487))

(declare-fun m!264489 () Bool)

(assert (=> b!247364 m!264489))

(assert (=> b!247112 d!60475))

(declare-fun mapNonEmpty!10940 () Bool)

(declare-fun mapRes!10940 () Bool)

(declare-fun tp!22991 () Bool)

(declare-fun e!160466 () Bool)

(assert (=> mapNonEmpty!10940 (= mapRes!10940 (and tp!22991 e!160466))))

(declare-fun mapKey!10940 () (_ BitVec 32))

(declare-fun mapRest!10940 () (Array (_ BitVec 32) ValueCell!2877))

(declare-fun mapValue!10940 () ValueCell!2877)

(assert (=> mapNonEmpty!10940 (= mapRest!10934 (store mapRest!10940 mapKey!10940 mapValue!10940))))

(declare-fun b!247371 () Bool)

(assert (=> b!247371 (= e!160466 tp_is_empty!6441)))

(declare-fun condMapEmpty!10940 () Bool)

(declare-fun mapDefault!10940 () ValueCell!2877)

(assert (=> mapNonEmpty!10934 (= condMapEmpty!10940 (= mapRest!10934 ((as const (Array (_ BitVec 32) ValueCell!2877)) mapDefault!10940)))))

(declare-fun e!160467 () Bool)

(assert (=> mapNonEmpty!10934 (= tp!22981 (and e!160467 mapRes!10940))))

(declare-fun b!247372 () Bool)

(assert (=> b!247372 (= e!160467 tp_is_empty!6441)))

(declare-fun mapIsEmpty!10940 () Bool)

(assert (=> mapIsEmpty!10940 mapRes!10940))

(assert (= (and mapNonEmpty!10934 condMapEmpty!10940) mapIsEmpty!10940))

(assert (= (and mapNonEmpty!10934 (not condMapEmpty!10940)) mapNonEmpty!10940))

(assert (= (and mapNonEmpty!10940 ((_ is ValueCellFull!2877) mapValue!10940)) b!247371))

(assert (= (and mapNonEmpty!10934 ((_ is ValueCellFull!2877) mapDefault!10940)) b!247372))

(declare-fun m!264491 () Bool)

(assert (=> mapNonEmpty!10940 m!264491))

(declare-fun b_lambda!8049 () Bool)

(assert (= b_lambda!8047 (or (and b!247107 b_free!6579) b_lambda!8049)))

(check-sat (not bm!23148) (not b!247298) (not d!60449) (not b!247304) (not b!247297) (not b!247260) (not b!247288) (not b!247211) (not b!247194) (not d!60461) (not bm!23149) (not b!247316) (not d!60455) (not b!247315) b_and!13583 (not b!247274) (not bm!23143) (not bm!23156) (not b!247261) (not d!60469) (not b_next!6579) (not d!60443) (not b!247317) (not d!60453) (not bm!23146) (not b!247195) (not b!247201) (not b!247269) (not mapNonEmpty!10940) (not d!60475) (not b!247273) (not b!247272) (not b!247364) (not b!247322) (not b_lambda!8049) (not bm!23153) (not b!247300) (not b!247254) (not bm!23162) (not bm!23161) (not b!247196) (not b!247187) (not b!247263) (not d!60473) (not d!60471) tp_is_empty!6441 (not bm!23152) (not b!247209))
(check-sat b_and!13583 (not b_next!6579))
