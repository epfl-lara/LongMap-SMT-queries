; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24382 () Bool)

(assert start!24382)

(declare-fun b!255249 () Bool)

(declare-fun b_free!6703 () Bool)

(declare-fun b_next!6703 () Bool)

(assert (=> b!255249 (= b_free!6703 (not b_next!6703))))

(declare-fun tp!23403 () Bool)

(declare-fun b_and!13727 () Bool)

(assert (=> b!255249 (= tp!23403 b_and!13727)))

(declare-fun res!124895 () Bool)

(declare-fun e!165447 () Bool)

(assert (=> start!24382 (=> (not res!124895) (not e!165447))))

(declare-datatypes ((V!8401 0))(
  ( (V!8402 (val!3327 Int)) )
))
(declare-datatypes ((ValueCell!2939 0))(
  ( (ValueCellFull!2939 (v!5401 V!8401)) (EmptyCell!2939) )
))
(declare-datatypes ((array!12457 0))(
  ( (array!12458 (arr!5901 (Array (_ BitVec 32) ValueCell!2939)) (size!6249 (_ BitVec 32))) )
))
(declare-datatypes ((array!12459 0))(
  ( (array!12460 (arr!5902 (Array (_ BitVec 32) (_ BitVec 64))) (size!6250 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3778 0))(
  ( (LongMapFixedSize!3779 (defaultEntry!4712 Int) (mask!10971 (_ BitVec 32)) (extraKeys!4449 (_ BitVec 32)) (zeroValue!4553 V!8401) (minValue!4553 V!8401) (_size!1938 (_ BitVec 32)) (_keys!6869 array!12459) (_values!4695 array!12457) (_vacant!1938 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3778)

(declare-fun valid!1480 (LongMapFixedSize!3778) Bool)

(assert (=> start!24382 (= res!124895 (valid!1480 thiss!1504))))

(assert (=> start!24382 e!165447))

(declare-fun e!165450 () Bool)

(assert (=> start!24382 e!165450))

(assert (=> start!24382 true))

(declare-fun tp_is_empty!6565 () Bool)

(assert (=> start!24382 tp_is_empty!6565))

(declare-fun e!165457 () Bool)

(declare-fun array_inv!3897 (array!12459) Bool)

(declare-fun array_inv!3898 (array!12457) Bool)

(assert (=> b!255249 (= e!165450 (and tp!23403 tp_is_empty!6565 (array_inv!3897 (_keys!6869 thiss!1504)) (array_inv!3898 (_values!4695 thiss!1504)) e!165457))))

(declare-fun b!255250 () Bool)

(declare-fun e!165453 () Bool)

(assert (=> b!255250 (= e!165453 tp_is_empty!6565)))

(declare-fun b!255251 () Bool)

(declare-fun e!165452 () Bool)

(declare-fun call!24119 () Bool)

(assert (=> b!255251 (= e!165452 (not call!24119))))

(declare-fun b!255252 () Bool)

(declare-fun e!165458 () Bool)

(assert (=> b!255252 (= e!165447 e!165458)))

(declare-fun res!124896 () Bool)

(assert (=> b!255252 (=> (not res!124896) (not e!165458))))

(declare-datatypes ((SeekEntryResult!1154 0))(
  ( (MissingZero!1154 (index!6786 (_ BitVec 32))) (Found!1154 (index!6787 (_ BitVec 32))) (Intermediate!1154 (undefined!1966 Bool) (index!6788 (_ BitVec 32)) (x!24913 (_ BitVec 32))) (Undefined!1154) (MissingVacant!1154 (index!6789 (_ BitVec 32))) )
))
(declare-fun lt!127920 () SeekEntryResult!1154)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!255252 (= res!124896 (or (= lt!127920 (MissingZero!1154 index!297)) (= lt!127920 (MissingVacant!1154 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12459 (_ BitVec 32)) SeekEntryResult!1154)

(assert (=> b!255252 (= lt!127920 (seekEntryOrOpen!0 key!932 (_keys!6869 thiss!1504) (mask!10971 thiss!1504)))))

(declare-fun b!255253 () Bool)

(declare-fun res!124898 () Bool)

(assert (=> b!255253 (=> (not res!124898) (not e!165452))))

(assert (=> b!255253 (= res!124898 (= (select (arr!5902 (_keys!6869 thiss!1504)) (index!6786 lt!127920)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24115 () Bool)

(declare-fun call!24118 () Bool)

(declare-fun c!43093 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24115 (= call!24118 (inRange!0 (ite c!43093 (index!6786 lt!127920) (index!6789 lt!127920)) (mask!10971 thiss!1504)))))

(declare-fun b!255254 () Bool)

(declare-datatypes ((Unit!7884 0))(
  ( (Unit!7885) )
))
(declare-fun e!165454 () Unit!7884)

(declare-fun lt!127921 () Unit!7884)

(assert (=> b!255254 (= e!165454 lt!127921)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!420 (array!12459 array!12457 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 64) Int) Unit!7884)

(assert (=> b!255254 (= lt!127921 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!420 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 (defaultEntry!4712 thiss!1504)))))

(get-info :version)

(assert (=> b!255254 (= c!43093 ((_ is MissingZero!1154) lt!127920))))

(declare-fun e!165446 () Bool)

(assert (=> b!255254 e!165446))

(declare-fun b!255255 () Bool)

(declare-fun e!165451 () Bool)

(assert (=> b!255255 (= e!165451 (not (or (bvslt index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6250 (_keys!6869 thiss!1504))))))))

(declare-fun v!346 () V!8401)

(declare-datatypes ((tuple2!4848 0))(
  ( (tuple2!4849 (_1!2435 (_ BitVec 64)) (_2!2435 V!8401)) )
))
(declare-datatypes ((List!3751 0))(
  ( (Nil!3748) (Cons!3747 (h!4409 tuple2!4848) (t!8793 List!3751)) )
))
(declare-datatypes ((ListLongMap!3751 0))(
  ( (ListLongMap!3752 (toList!1891 List!3751)) )
))
(declare-fun lt!127925 () ListLongMap!3751)

(declare-fun lt!127917 () array!12459)

(declare-fun +!683 (ListLongMap!3751 tuple2!4848) ListLongMap!3751)

(declare-fun getCurrentListMap!1400 (array!12459 array!12457 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 32) Int) ListLongMap!3751)

(assert (=> b!255255 (= (+!683 lt!127925 (tuple2!4849 key!932 v!346)) (getCurrentListMap!1400 lt!127917 (array!12458 (store (arr!5901 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6249 (_values!4695 thiss!1504))) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!127924 () Unit!7884)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!94 (array!12459 array!12457 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 32) (_ BitVec 64) V!8401 Int) Unit!7884)

(assert (=> b!255255 (= lt!127924 (lemmaAddValidKeyToArrayThenAddPairToListMap!94 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) index!297 key!932 v!346 (defaultEntry!4712 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12459 (_ BitVec 32)) Bool)

(assert (=> b!255255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127917 (mask!10971 thiss!1504))))

(declare-fun lt!127918 () Unit!7884)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12459 (_ BitVec 32) (_ BitVec 32)) Unit!7884)

(assert (=> b!255255 (= lt!127918 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6869 thiss!1504) index!297 (mask!10971 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12459 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!255255 (= (arrayCountValidKeys!0 lt!127917 #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6869 thiss!1504) #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504)))))))

(declare-fun lt!127914 () Unit!7884)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12459 (_ BitVec 32) (_ BitVec 64)) Unit!7884)

(assert (=> b!255255 (= lt!127914 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6869 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3752 0))(
  ( (Nil!3749) (Cons!3748 (h!4410 (_ BitVec 64)) (t!8794 List!3752)) )
))
(declare-fun arrayNoDuplicates!0 (array!12459 (_ BitVec 32) List!3752) Bool)

(assert (=> b!255255 (arrayNoDuplicates!0 lt!127917 #b00000000000000000000000000000000 Nil!3749)))

(assert (=> b!255255 (= lt!127917 (array!12460 (store (arr!5902 (_keys!6869 thiss!1504)) index!297 key!932) (size!6250 (_keys!6869 thiss!1504))))))

(declare-fun lt!127923 () Unit!7884)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12459 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3752) Unit!7884)

(assert (=> b!255255 (= lt!127923 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6869 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3749))))

(declare-fun lt!127915 () Unit!7884)

(declare-fun e!165456 () Unit!7884)

(assert (=> b!255255 (= lt!127915 e!165456)))

(declare-fun c!43096 () Bool)

(declare-fun arrayContainsKey!0 (array!12459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!255255 (= c!43096 (arrayContainsKey!0 (_keys!6869 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!24116 () Bool)

(assert (=> bm!24116 (= call!24119 (arrayContainsKey!0 (_keys!6869 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255256 () Bool)

(declare-fun c!43095 () Bool)

(assert (=> b!255256 (= c!43095 ((_ is MissingVacant!1154) lt!127920))))

(declare-fun e!165455 () Bool)

(assert (=> b!255256 (= e!165446 e!165455)))

(declare-fun b!255257 () Bool)

(declare-fun e!165449 () Bool)

(assert (=> b!255257 (= e!165449 (not call!24119))))

(declare-fun mapNonEmpty!11169 () Bool)

(declare-fun mapRes!11169 () Bool)

(declare-fun tp!23402 () Bool)

(declare-fun e!165445 () Bool)

(assert (=> mapNonEmpty!11169 (= mapRes!11169 (and tp!23402 e!165445))))

(declare-fun mapKey!11169 () (_ BitVec 32))

(declare-fun mapValue!11169 () ValueCell!2939)

(declare-fun mapRest!11169 () (Array (_ BitVec 32) ValueCell!2939))

(assert (=> mapNonEmpty!11169 (= (arr!5901 (_values!4695 thiss!1504)) (store mapRest!11169 mapKey!11169 mapValue!11169))))

(declare-fun b!255258 () Bool)

(declare-fun res!124897 () Bool)

(assert (=> b!255258 (=> (not res!124897) (not e!165452))))

(assert (=> b!255258 (= res!124897 call!24118)))

(assert (=> b!255258 (= e!165446 e!165452)))

(declare-fun mapIsEmpty!11169 () Bool)

(assert (=> mapIsEmpty!11169 mapRes!11169))

(declare-fun b!255259 () Bool)

(declare-fun res!124900 () Bool)

(assert (=> b!255259 (= res!124900 (= (select (arr!5902 (_keys!6869 thiss!1504)) (index!6789 lt!127920)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255259 (=> (not res!124900) (not e!165449))))

(declare-fun b!255260 () Bool)

(declare-fun Unit!7886 () Unit!7884)

(assert (=> b!255260 (= e!165456 Unit!7886)))

(declare-fun b!255261 () Bool)

(assert (=> b!255261 (= e!165455 ((_ is Undefined!1154) lt!127920))))

(declare-fun b!255262 () Bool)

(declare-fun res!124899 () Bool)

(assert (=> b!255262 (=> (not res!124899) (not e!165447))))

(assert (=> b!255262 (= res!124899 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!255263 () Bool)

(assert (=> b!255263 (= e!165457 (and e!165453 mapRes!11169))))

(declare-fun condMapEmpty!11169 () Bool)

(declare-fun mapDefault!11169 () ValueCell!2939)

(assert (=> b!255263 (= condMapEmpty!11169 (= (arr!5901 (_values!4695 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2939)) mapDefault!11169)))))

(declare-fun b!255264 () Bool)

(declare-fun Unit!7887 () Unit!7884)

(assert (=> b!255264 (= e!165456 Unit!7887)))

(declare-fun lt!127922 () Unit!7884)

(declare-fun lemmaArrayContainsKeyThenInListMap!231 (array!12459 array!12457 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 64) (_ BitVec 32) Int) Unit!7884)

(assert (=> b!255264 (= lt!127922 (lemmaArrayContainsKeyThenInListMap!231 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(assert (=> b!255264 false))

(declare-fun b!255265 () Bool)

(assert (=> b!255265 (= e!165455 e!165449)))

(declare-fun res!124893 () Bool)

(assert (=> b!255265 (= res!124893 call!24118)))

(assert (=> b!255265 (=> (not res!124893) (not e!165449))))

(declare-fun b!255266 () Bool)

(declare-fun Unit!7888 () Unit!7884)

(assert (=> b!255266 (= e!165454 Unit!7888)))

(declare-fun lt!127916 () Unit!7884)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!421 (array!12459 array!12457 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 64) Int) Unit!7884)

(assert (=> b!255266 (= lt!127916 (lemmaInListMapThenSeekEntryOrOpenFindsIt!421 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 (defaultEntry!4712 thiss!1504)))))

(assert (=> b!255266 false))

(declare-fun b!255267 () Bool)

(assert (=> b!255267 (= e!165445 tp_is_empty!6565)))

(declare-fun b!255268 () Bool)

(assert (=> b!255268 (= e!165458 e!165451)))

(declare-fun res!124894 () Bool)

(assert (=> b!255268 (=> (not res!124894) (not e!165451))))

(assert (=> b!255268 (= res!124894 (inRange!0 index!297 (mask!10971 thiss!1504)))))

(declare-fun lt!127919 () Unit!7884)

(assert (=> b!255268 (= lt!127919 e!165454)))

(declare-fun c!43094 () Bool)

(declare-fun contains!1830 (ListLongMap!3751 (_ BitVec 64)) Bool)

(assert (=> b!255268 (= c!43094 (contains!1830 lt!127925 key!932))))

(assert (=> b!255268 (= lt!127925 (getCurrentListMap!1400 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(assert (= (and start!24382 res!124895) b!255262))

(assert (= (and b!255262 res!124899) b!255252))

(assert (= (and b!255252 res!124896) b!255268))

(assert (= (and b!255268 c!43094) b!255266))

(assert (= (and b!255268 (not c!43094)) b!255254))

(assert (= (and b!255254 c!43093) b!255258))

(assert (= (and b!255254 (not c!43093)) b!255256))

(assert (= (and b!255258 res!124897) b!255253))

(assert (= (and b!255253 res!124898) b!255251))

(assert (= (and b!255256 c!43095) b!255265))

(assert (= (and b!255256 (not c!43095)) b!255261))

(assert (= (and b!255265 res!124893) b!255259))

(assert (= (and b!255259 res!124900) b!255257))

(assert (= (or b!255258 b!255265) bm!24115))

(assert (= (or b!255251 b!255257) bm!24116))

(assert (= (and b!255268 res!124894) b!255255))

(assert (= (and b!255255 c!43096) b!255264))

(assert (= (and b!255255 (not c!43096)) b!255260))

(assert (= (and b!255263 condMapEmpty!11169) mapIsEmpty!11169))

(assert (= (and b!255263 (not condMapEmpty!11169)) mapNonEmpty!11169))

(assert (= (and mapNonEmpty!11169 ((_ is ValueCellFull!2939) mapValue!11169)) b!255267))

(assert (= (and b!255263 ((_ is ValueCellFull!2939) mapDefault!11169)) b!255250))

(assert (= b!255249 b!255263))

(assert (= start!24382 b!255249))

(declare-fun m!270249 () Bool)

(assert (=> start!24382 m!270249))

(declare-fun m!270251 () Bool)

(assert (=> bm!24115 m!270251))

(declare-fun m!270253 () Bool)

(assert (=> b!255259 m!270253))

(declare-fun m!270255 () Bool)

(assert (=> b!255253 m!270255))

(declare-fun m!270257 () Bool)

(assert (=> b!255268 m!270257))

(declare-fun m!270259 () Bool)

(assert (=> b!255268 m!270259))

(declare-fun m!270261 () Bool)

(assert (=> b!255268 m!270261))

(declare-fun m!270263 () Bool)

(assert (=> b!255254 m!270263))

(declare-fun m!270265 () Bool)

(assert (=> b!255249 m!270265))

(declare-fun m!270267 () Bool)

(assert (=> b!255249 m!270267))

(declare-fun m!270269 () Bool)

(assert (=> b!255255 m!270269))

(declare-fun m!270271 () Bool)

(assert (=> b!255255 m!270271))

(declare-fun m!270273 () Bool)

(assert (=> b!255255 m!270273))

(declare-fun m!270275 () Bool)

(assert (=> b!255255 m!270275))

(declare-fun m!270277 () Bool)

(assert (=> b!255255 m!270277))

(declare-fun m!270279 () Bool)

(assert (=> b!255255 m!270279))

(declare-fun m!270281 () Bool)

(assert (=> b!255255 m!270281))

(declare-fun m!270283 () Bool)

(assert (=> b!255255 m!270283))

(declare-fun m!270285 () Bool)

(assert (=> b!255255 m!270285))

(declare-fun m!270287 () Bool)

(assert (=> b!255255 m!270287))

(declare-fun m!270289 () Bool)

(assert (=> b!255255 m!270289))

(declare-fun m!270291 () Bool)

(assert (=> b!255255 m!270291))

(declare-fun m!270293 () Bool)

(assert (=> b!255255 m!270293))

(declare-fun m!270295 () Bool)

(assert (=> b!255264 m!270295))

(declare-fun m!270297 () Bool)

(assert (=> mapNonEmpty!11169 m!270297))

(declare-fun m!270299 () Bool)

(assert (=> b!255252 m!270299))

(declare-fun m!270301 () Bool)

(assert (=> b!255266 m!270301))

(assert (=> bm!24116 m!270269))

(check-sat (not b!255268) (not b!255255) (not b!255254) tp_is_empty!6565 (not b!255266) (not b!255249) (not b_next!6703) (not start!24382) b_and!13727 (not mapNonEmpty!11169) (not b!255264) (not bm!24116) (not bm!24115) (not b!255252))
(check-sat b_and!13727 (not b_next!6703))
(get-model)

(declare-fun d!61429 () Bool)

(assert (=> d!61429 (contains!1830 (getCurrentListMap!1400 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)) key!932)))

(declare-fun lt!128000 () Unit!7884)

(declare-fun choose!1227 (array!12459 array!12457 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 64) (_ BitVec 32) Int) Unit!7884)

(assert (=> d!61429 (= lt!128000 (choose!1227 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61429 (validMask!0 (mask!10971 thiss!1504))))

(assert (=> d!61429 (= (lemmaArrayContainsKeyThenInListMap!231 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)) lt!128000)))

(declare-fun bs!9038 () Bool)

(assert (= bs!9038 d!61429))

(assert (=> bs!9038 m!270261))

(assert (=> bs!9038 m!270261))

(declare-fun m!270411 () Bool)

(assert (=> bs!9038 m!270411))

(declare-fun m!270413 () Bool)

(assert (=> bs!9038 m!270413))

(declare-fun m!270415 () Bool)

(assert (=> bs!9038 m!270415))

(assert (=> b!255264 d!61429))

(declare-fun d!61431 () Bool)

(declare-fun lt!128007 () SeekEntryResult!1154)

(assert (=> d!61431 (and (or ((_ is Undefined!1154) lt!128007) (not ((_ is Found!1154) lt!128007)) (and (bvsge (index!6787 lt!128007) #b00000000000000000000000000000000) (bvslt (index!6787 lt!128007) (size!6250 (_keys!6869 thiss!1504))))) (or ((_ is Undefined!1154) lt!128007) ((_ is Found!1154) lt!128007) (not ((_ is MissingZero!1154) lt!128007)) (and (bvsge (index!6786 lt!128007) #b00000000000000000000000000000000) (bvslt (index!6786 lt!128007) (size!6250 (_keys!6869 thiss!1504))))) (or ((_ is Undefined!1154) lt!128007) ((_ is Found!1154) lt!128007) ((_ is MissingZero!1154) lt!128007) (not ((_ is MissingVacant!1154) lt!128007)) (and (bvsge (index!6789 lt!128007) #b00000000000000000000000000000000) (bvslt (index!6789 lt!128007) (size!6250 (_keys!6869 thiss!1504))))) (or ((_ is Undefined!1154) lt!128007) (ite ((_ is Found!1154) lt!128007) (= (select (arr!5902 (_keys!6869 thiss!1504)) (index!6787 lt!128007)) key!932) (ite ((_ is MissingZero!1154) lt!128007) (= (select (arr!5902 (_keys!6869 thiss!1504)) (index!6786 lt!128007)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1154) lt!128007) (= (select (arr!5902 (_keys!6869 thiss!1504)) (index!6789 lt!128007)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!165551 () SeekEntryResult!1154)

(assert (=> d!61431 (= lt!128007 e!165551)))

(declare-fun c!43128 () Bool)

(declare-fun lt!128009 () SeekEntryResult!1154)

(assert (=> d!61431 (= c!43128 (and ((_ is Intermediate!1154) lt!128009) (undefined!1966 lt!128009)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12459 (_ BitVec 32)) SeekEntryResult!1154)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61431 (= lt!128009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10971 thiss!1504)) key!932 (_keys!6869 thiss!1504) (mask!10971 thiss!1504)))))

(assert (=> d!61431 (validMask!0 (mask!10971 thiss!1504))))

(assert (=> d!61431 (= (seekEntryOrOpen!0 key!932 (_keys!6869 thiss!1504) (mask!10971 thiss!1504)) lt!128007)))

(declare-fun b!255401 () Bool)

(assert (=> b!255401 (= e!165551 Undefined!1154)))

(declare-fun b!255402 () Bool)

(declare-fun e!165550 () SeekEntryResult!1154)

(assert (=> b!255402 (= e!165550 (Found!1154 (index!6788 lt!128009)))))

(declare-fun b!255403 () Bool)

(declare-fun e!165549 () SeekEntryResult!1154)

(assert (=> b!255403 (= e!165549 (MissingZero!1154 (index!6788 lt!128009)))))

(declare-fun b!255404 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12459 (_ BitVec 32)) SeekEntryResult!1154)

(assert (=> b!255404 (= e!165549 (seekKeyOrZeroReturnVacant!0 (x!24913 lt!128009) (index!6788 lt!128009) (index!6788 lt!128009) key!932 (_keys!6869 thiss!1504) (mask!10971 thiss!1504)))))

(declare-fun b!255405 () Bool)

(declare-fun c!43129 () Bool)

(declare-fun lt!128008 () (_ BitVec 64))

(assert (=> b!255405 (= c!43129 (= lt!128008 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255405 (= e!165550 e!165549)))

(declare-fun b!255406 () Bool)

(assert (=> b!255406 (= e!165551 e!165550)))

(assert (=> b!255406 (= lt!128008 (select (arr!5902 (_keys!6869 thiss!1504)) (index!6788 lt!128009)))))

(declare-fun c!43127 () Bool)

(assert (=> b!255406 (= c!43127 (= lt!128008 key!932))))

(assert (= (and d!61431 c!43128) b!255401))

(assert (= (and d!61431 (not c!43128)) b!255406))

(assert (= (and b!255406 c!43127) b!255402))

(assert (= (and b!255406 (not c!43127)) b!255405))

(assert (= (and b!255405 c!43129) b!255403))

(assert (= (and b!255405 (not c!43129)) b!255404))

(declare-fun m!270417 () Bool)

(assert (=> d!61431 m!270417))

(declare-fun m!270419 () Bool)

(assert (=> d!61431 m!270419))

(assert (=> d!61431 m!270415))

(declare-fun m!270421 () Bool)

(assert (=> d!61431 m!270421))

(declare-fun m!270423 () Bool)

(assert (=> d!61431 m!270423))

(assert (=> d!61431 m!270421))

(declare-fun m!270425 () Bool)

(assert (=> d!61431 m!270425))

(declare-fun m!270427 () Bool)

(assert (=> b!255404 m!270427))

(declare-fun m!270429 () Bool)

(assert (=> b!255406 m!270429))

(assert (=> b!255252 d!61431))

(declare-fun d!61433 () Bool)

(declare-fun res!124955 () Bool)

(declare-fun e!165554 () Bool)

(assert (=> d!61433 (=> (not res!124955) (not e!165554))))

(declare-fun simpleValid!272 (LongMapFixedSize!3778) Bool)

(assert (=> d!61433 (= res!124955 (simpleValid!272 thiss!1504))))

(assert (=> d!61433 (= (valid!1480 thiss!1504) e!165554)))

(declare-fun b!255413 () Bool)

(declare-fun res!124956 () Bool)

(assert (=> b!255413 (=> (not res!124956) (not e!165554))))

(assert (=> b!255413 (= res!124956 (= (arrayCountValidKeys!0 (_keys!6869 thiss!1504) #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))) (_size!1938 thiss!1504)))))

(declare-fun b!255414 () Bool)

(declare-fun res!124957 () Bool)

(assert (=> b!255414 (=> (not res!124957) (not e!165554))))

(assert (=> b!255414 (= res!124957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6869 thiss!1504) (mask!10971 thiss!1504)))))

(declare-fun b!255415 () Bool)

(assert (=> b!255415 (= e!165554 (arrayNoDuplicates!0 (_keys!6869 thiss!1504) #b00000000000000000000000000000000 Nil!3749))))

(assert (= (and d!61433 res!124955) b!255413))

(assert (= (and b!255413 res!124956) b!255414))

(assert (= (and b!255414 res!124957) b!255415))

(declare-fun m!270431 () Bool)

(assert (=> d!61433 m!270431))

(assert (=> b!255413 m!270281))

(declare-fun m!270433 () Bool)

(assert (=> b!255414 m!270433))

(declare-fun m!270435 () Bool)

(assert (=> b!255415 m!270435))

(assert (=> start!24382 d!61433))

(declare-fun d!61435 () Bool)

(declare-fun res!124962 () Bool)

(declare-fun e!165559 () Bool)

(assert (=> d!61435 (=> res!124962 e!165559)))

(assert (=> d!61435 (= res!124962 (= (select (arr!5902 (_keys!6869 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61435 (= (arrayContainsKey!0 (_keys!6869 thiss!1504) key!932 #b00000000000000000000000000000000) e!165559)))

(declare-fun b!255420 () Bool)

(declare-fun e!165560 () Bool)

(assert (=> b!255420 (= e!165559 e!165560)))

(declare-fun res!124963 () Bool)

(assert (=> b!255420 (=> (not res!124963) (not e!165560))))

(assert (=> b!255420 (= res!124963 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6250 (_keys!6869 thiss!1504))))))

(declare-fun b!255421 () Bool)

(assert (=> b!255421 (= e!165560 (arrayContainsKey!0 (_keys!6869 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61435 (not res!124962)) b!255420))

(assert (= (and b!255420 res!124963) b!255421))

(declare-fun m!270437 () Bool)

(assert (=> d!61435 m!270437))

(declare-fun m!270439 () Bool)

(assert (=> b!255421 m!270439))

(assert (=> bm!24116 d!61435))

(declare-fun d!61437 () Bool)

(assert (=> d!61437 (= (inRange!0 index!297 (mask!10971 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10971 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!255268 d!61437))

(declare-fun d!61439 () Bool)

(declare-fun e!165565 () Bool)

(assert (=> d!61439 e!165565))

(declare-fun res!124966 () Bool)

(assert (=> d!61439 (=> res!124966 e!165565)))

(declare-fun lt!128018 () Bool)

(assert (=> d!61439 (= res!124966 (not lt!128018))))

(declare-fun lt!128021 () Bool)

(assert (=> d!61439 (= lt!128018 lt!128021)))

(declare-fun lt!128019 () Unit!7884)

(declare-fun e!165566 () Unit!7884)

(assert (=> d!61439 (= lt!128019 e!165566)))

(declare-fun c!43132 () Bool)

(assert (=> d!61439 (= c!43132 lt!128021)))

(declare-fun containsKey!297 (List!3751 (_ BitVec 64)) Bool)

(assert (=> d!61439 (= lt!128021 (containsKey!297 (toList!1891 lt!127925) key!932))))

(assert (=> d!61439 (= (contains!1830 lt!127925 key!932) lt!128018)))

(declare-fun b!255428 () Bool)

(declare-fun lt!128020 () Unit!7884)

(assert (=> b!255428 (= e!165566 lt!128020)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!246 (List!3751 (_ BitVec 64)) Unit!7884)

(assert (=> b!255428 (= lt!128020 (lemmaContainsKeyImpliesGetValueByKeyDefined!246 (toList!1891 lt!127925) key!932))))

(declare-datatypes ((Option!311 0))(
  ( (Some!310 (v!5406 V!8401)) (None!309) )
))
(declare-fun isDefined!247 (Option!311) Bool)

(declare-fun getValueByKey!305 (List!3751 (_ BitVec 64)) Option!311)

(assert (=> b!255428 (isDefined!247 (getValueByKey!305 (toList!1891 lt!127925) key!932))))

(declare-fun b!255429 () Bool)

(declare-fun Unit!7899 () Unit!7884)

(assert (=> b!255429 (= e!165566 Unit!7899)))

(declare-fun b!255430 () Bool)

(assert (=> b!255430 (= e!165565 (isDefined!247 (getValueByKey!305 (toList!1891 lt!127925) key!932)))))

(assert (= (and d!61439 c!43132) b!255428))

(assert (= (and d!61439 (not c!43132)) b!255429))

(assert (= (and d!61439 (not res!124966)) b!255430))

(declare-fun m!270441 () Bool)

(assert (=> d!61439 m!270441))

(declare-fun m!270443 () Bool)

(assert (=> b!255428 m!270443))

(declare-fun m!270445 () Bool)

(assert (=> b!255428 m!270445))

(assert (=> b!255428 m!270445))

(declare-fun m!270447 () Bool)

(assert (=> b!255428 m!270447))

(assert (=> b!255430 m!270445))

(assert (=> b!255430 m!270445))

(assert (=> b!255430 m!270447))

(assert (=> b!255268 d!61439))

(declare-fun b!255473 () Bool)

(declare-fun e!165601 () Bool)

(declare-fun lt!128080 () ListLongMap!3751)

(declare-fun apply!249 (ListLongMap!3751 (_ BitVec 64)) V!8401)

(assert (=> b!255473 (= e!165601 (= (apply!249 lt!128080 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4553 thiss!1504)))))

(declare-fun b!255474 () Bool)

(declare-fun e!165598 () ListLongMap!3751)

(declare-fun call!24146 () ListLongMap!3751)

(assert (=> b!255474 (= e!165598 call!24146)))

(declare-fun bm!24143 () Bool)

(declare-fun call!24150 () ListLongMap!3751)

(assert (=> bm!24143 (= call!24146 call!24150)))

(declare-fun b!255475 () Bool)

(declare-fun e!165603 () Bool)

(declare-fun e!165596 () Bool)

(assert (=> b!255475 (= e!165603 e!165596)))

(declare-fun res!124986 () Bool)

(declare-fun call!24149 () Bool)

(assert (=> b!255475 (= res!124986 call!24149)))

(assert (=> b!255475 (=> (not res!124986) (not e!165596))))

(declare-fun b!255476 () Bool)

(declare-fun e!165594 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!255476 (= e!165594 (validKeyInArray!0 (select (arr!5902 (_keys!6869 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24144 () Bool)

(declare-fun call!24152 () Bool)

(assert (=> bm!24144 (= call!24152 (contains!1830 lt!128080 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255477 () Bool)

(declare-fun e!165599 () Unit!7884)

(declare-fun Unit!7900 () Unit!7884)

(assert (=> b!255477 (= e!165599 Unit!7900)))

(declare-fun b!255478 () Bool)

(declare-fun e!165604 () Bool)

(assert (=> b!255478 (= e!165604 (not call!24152))))

(declare-fun bm!24145 () Bool)

(declare-fun call!24148 () ListLongMap!3751)

(assert (=> bm!24145 (= call!24150 call!24148)))

(declare-fun d!61441 () Bool)

(declare-fun e!165595 () Bool)

(assert (=> d!61441 e!165595))

(declare-fun res!124988 () Bool)

(assert (=> d!61441 (=> (not res!124988) (not e!165595))))

(assert (=> d!61441 (= res!124988 (or (bvsge #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))))))))

(declare-fun lt!128066 () ListLongMap!3751)

(assert (=> d!61441 (= lt!128080 lt!128066)))

(declare-fun lt!128067 () Unit!7884)

(assert (=> d!61441 (= lt!128067 e!165599)))

(declare-fun c!43146 () Bool)

(assert (=> d!61441 (= c!43146 e!165594)))

(declare-fun res!124987 () Bool)

(assert (=> d!61441 (=> (not res!124987) (not e!165594))))

(assert (=> d!61441 (= res!124987 (bvslt #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))))))

(declare-fun e!165602 () ListLongMap!3751)

(assert (=> d!61441 (= lt!128066 e!165602)))

(declare-fun c!43148 () Bool)

(assert (=> d!61441 (= c!43148 (and (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61441 (validMask!0 (mask!10971 thiss!1504))))

(assert (=> d!61441 (= (getCurrentListMap!1400 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)) lt!128080)))

(declare-fun bm!24146 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!565 (array!12459 array!12457 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 32) Int) ListLongMap!3751)

(assert (=> bm!24146 (= call!24148 (getCurrentListMapNoExtraKeys!565 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun b!255479 () Bool)

(declare-fun e!165597 () Bool)

(assert (=> b!255479 (= e!165597 (validKeyInArray!0 (select (arr!5902 (_keys!6869 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!255480 () Bool)

(declare-fun lt!128073 () Unit!7884)

(assert (=> b!255480 (= e!165599 lt!128073)))

(declare-fun lt!128076 () ListLongMap!3751)

(assert (=> b!255480 (= lt!128076 (getCurrentListMapNoExtraKeys!565 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128070 () (_ BitVec 64))

(assert (=> b!255480 (= lt!128070 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128068 () (_ BitVec 64))

(assert (=> b!255480 (= lt!128068 (select (arr!5902 (_keys!6869 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128086 () Unit!7884)

(declare-fun addStillContains!225 (ListLongMap!3751 (_ BitVec 64) V!8401 (_ BitVec 64)) Unit!7884)

(assert (=> b!255480 (= lt!128086 (addStillContains!225 lt!128076 lt!128070 (zeroValue!4553 thiss!1504) lt!128068))))

(assert (=> b!255480 (contains!1830 (+!683 lt!128076 (tuple2!4849 lt!128070 (zeroValue!4553 thiss!1504))) lt!128068)))

(declare-fun lt!128087 () Unit!7884)

(assert (=> b!255480 (= lt!128087 lt!128086)))

(declare-fun lt!128082 () ListLongMap!3751)

(assert (=> b!255480 (= lt!128082 (getCurrentListMapNoExtraKeys!565 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128069 () (_ BitVec 64))

(assert (=> b!255480 (= lt!128069 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128079 () (_ BitVec 64))

(assert (=> b!255480 (= lt!128079 (select (arr!5902 (_keys!6869 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128071 () Unit!7884)

(declare-fun addApplyDifferent!225 (ListLongMap!3751 (_ BitVec 64) V!8401 (_ BitVec 64)) Unit!7884)

(assert (=> b!255480 (= lt!128071 (addApplyDifferent!225 lt!128082 lt!128069 (minValue!4553 thiss!1504) lt!128079))))

(assert (=> b!255480 (= (apply!249 (+!683 lt!128082 (tuple2!4849 lt!128069 (minValue!4553 thiss!1504))) lt!128079) (apply!249 lt!128082 lt!128079))))

(declare-fun lt!128074 () Unit!7884)

(assert (=> b!255480 (= lt!128074 lt!128071)))

(declare-fun lt!128075 () ListLongMap!3751)

(assert (=> b!255480 (= lt!128075 (getCurrentListMapNoExtraKeys!565 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128083 () (_ BitVec 64))

(assert (=> b!255480 (= lt!128083 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128085 () (_ BitVec 64))

(assert (=> b!255480 (= lt!128085 (select (arr!5902 (_keys!6869 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128077 () Unit!7884)

(assert (=> b!255480 (= lt!128077 (addApplyDifferent!225 lt!128075 lt!128083 (zeroValue!4553 thiss!1504) lt!128085))))

(assert (=> b!255480 (= (apply!249 (+!683 lt!128075 (tuple2!4849 lt!128083 (zeroValue!4553 thiss!1504))) lt!128085) (apply!249 lt!128075 lt!128085))))

(declare-fun lt!128084 () Unit!7884)

(assert (=> b!255480 (= lt!128084 lt!128077)))

(declare-fun lt!128081 () ListLongMap!3751)

(assert (=> b!255480 (= lt!128081 (getCurrentListMapNoExtraKeys!565 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128078 () (_ BitVec 64))

(assert (=> b!255480 (= lt!128078 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128072 () (_ BitVec 64))

(assert (=> b!255480 (= lt!128072 (select (arr!5902 (_keys!6869 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255480 (= lt!128073 (addApplyDifferent!225 lt!128081 lt!128078 (minValue!4553 thiss!1504) lt!128072))))

(assert (=> b!255480 (= (apply!249 (+!683 lt!128081 (tuple2!4849 lt!128078 (minValue!4553 thiss!1504))) lt!128072) (apply!249 lt!128081 lt!128072))))

(declare-fun b!255481 () Bool)

(assert (=> b!255481 (= e!165603 (not call!24149))))

(declare-fun call!24147 () ListLongMap!3751)

(declare-fun bm!24147 () Bool)

(declare-fun c!43149 () Bool)

(assert (=> bm!24147 (= call!24147 (+!683 (ite c!43148 call!24148 (ite c!43149 call!24150 call!24146)) (ite (or c!43148 c!43149) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4553 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4553 thiss!1504)))))))

(declare-fun b!255482 () Bool)

(declare-fun c!43150 () Bool)

(assert (=> b!255482 (= c!43150 (and (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!165605 () ListLongMap!3751)

(assert (=> b!255482 (= e!165605 e!165598)))

(declare-fun b!255483 () Bool)

(declare-fun call!24151 () ListLongMap!3751)

(assert (=> b!255483 (= e!165605 call!24151)))

(declare-fun b!255484 () Bool)

(declare-fun res!124985 () Bool)

(assert (=> b!255484 (=> (not res!124985) (not e!165595))))

(assert (=> b!255484 (= res!124985 e!165603)))

(declare-fun c!43147 () Bool)

(assert (=> b!255484 (= c!43147 (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!255485 () Bool)

(assert (=> b!255485 (= e!165598 call!24151)))

(declare-fun b!255486 () Bool)

(assert (=> b!255486 (= e!165602 (+!683 call!24147 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4553 thiss!1504))))))

(declare-fun b!255487 () Bool)

(declare-fun res!124992 () Bool)

(assert (=> b!255487 (=> (not res!124992) (not e!165595))))

(declare-fun e!165593 () Bool)

(assert (=> b!255487 (= res!124992 e!165593)))

(declare-fun res!124991 () Bool)

(assert (=> b!255487 (=> res!124991 e!165593)))

(assert (=> b!255487 (= res!124991 (not e!165597))))

(declare-fun res!124993 () Bool)

(assert (=> b!255487 (=> (not res!124993) (not e!165597))))

(assert (=> b!255487 (= res!124993 (bvslt #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))))))

(declare-fun b!255488 () Bool)

(declare-fun e!165600 () Bool)

(declare-fun get!3032 (ValueCell!2939 V!8401) V!8401)

(declare-fun dynLambda!583 (Int (_ BitVec 64)) V!8401)

(assert (=> b!255488 (= e!165600 (= (apply!249 lt!128080 (select (arr!5902 (_keys!6869 thiss!1504)) #b00000000000000000000000000000000)) (get!3032 (select (arr!5901 (_values!4695 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!583 (defaultEntry!4712 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!255488 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6249 (_values!4695 thiss!1504))))))

(assert (=> b!255488 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))))))

(declare-fun b!255489 () Bool)

(assert (=> b!255489 (= e!165595 e!165604)))

(declare-fun c!43145 () Bool)

(assert (=> b!255489 (= c!43145 (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255490 () Bool)

(assert (=> b!255490 (= e!165596 (= (apply!249 lt!128080 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4553 thiss!1504)))))

(declare-fun bm!24148 () Bool)

(assert (=> bm!24148 (= call!24151 call!24147)))

(declare-fun b!255491 () Bool)

(assert (=> b!255491 (= e!165593 e!165600)))

(declare-fun res!124990 () Bool)

(assert (=> b!255491 (=> (not res!124990) (not e!165600))))

(assert (=> b!255491 (= res!124990 (contains!1830 lt!128080 (select (arr!5902 (_keys!6869 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!255491 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))))))

(declare-fun b!255492 () Bool)

(assert (=> b!255492 (= e!165604 e!165601)))

(declare-fun res!124989 () Bool)

(assert (=> b!255492 (= res!124989 call!24152)))

(assert (=> b!255492 (=> (not res!124989) (not e!165601))))

(declare-fun bm!24149 () Bool)

(assert (=> bm!24149 (= call!24149 (contains!1830 lt!128080 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255493 () Bool)

(assert (=> b!255493 (= e!165602 e!165605)))

(assert (=> b!255493 (= c!43149 (and (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61441 c!43148) b!255486))

(assert (= (and d!61441 (not c!43148)) b!255493))

(assert (= (and b!255493 c!43149) b!255483))

(assert (= (and b!255493 (not c!43149)) b!255482))

(assert (= (and b!255482 c!43150) b!255485))

(assert (= (and b!255482 (not c!43150)) b!255474))

(assert (= (or b!255485 b!255474) bm!24143))

(assert (= (or b!255483 bm!24143) bm!24145))

(assert (= (or b!255483 b!255485) bm!24148))

(assert (= (or b!255486 bm!24145) bm!24146))

(assert (= (or b!255486 bm!24148) bm!24147))

(assert (= (and d!61441 res!124987) b!255476))

(assert (= (and d!61441 c!43146) b!255480))

(assert (= (and d!61441 (not c!43146)) b!255477))

(assert (= (and d!61441 res!124988) b!255487))

(assert (= (and b!255487 res!124993) b!255479))

(assert (= (and b!255487 (not res!124991)) b!255491))

(assert (= (and b!255491 res!124990) b!255488))

(assert (= (and b!255487 res!124992) b!255484))

(assert (= (and b!255484 c!43147) b!255475))

(assert (= (and b!255484 (not c!43147)) b!255481))

(assert (= (and b!255475 res!124986) b!255490))

(assert (= (or b!255475 b!255481) bm!24149))

(assert (= (and b!255484 res!124985) b!255489))

(assert (= (and b!255489 c!43145) b!255492))

(assert (= (and b!255489 (not c!43145)) b!255478))

(assert (= (and b!255492 res!124989) b!255473))

(assert (= (or b!255492 b!255478) bm!24144))

(declare-fun b_lambda!8129 () Bool)

(assert (=> (not b_lambda!8129) (not b!255488)))

(declare-fun t!8800 () Bool)

(declare-fun tb!3003 () Bool)

(assert (=> (and b!255249 (= (defaultEntry!4712 thiss!1504) (defaultEntry!4712 thiss!1504)) t!8800) tb!3003))

(declare-fun result!5347 () Bool)

(assert (=> tb!3003 (= result!5347 tp_is_empty!6565)))

(assert (=> b!255488 t!8800))

(declare-fun b_and!13733 () Bool)

(assert (= b_and!13727 (and (=> t!8800 result!5347) b_and!13733)))

(declare-fun m!270449 () Bool)

(assert (=> bm!24147 m!270449))

(declare-fun m!270451 () Bool)

(assert (=> bm!24146 m!270451))

(declare-fun m!270453 () Bool)

(assert (=> b!255486 m!270453))

(declare-fun m!270455 () Bool)

(assert (=> b!255473 m!270455))

(assert (=> d!61441 m!270415))

(declare-fun m!270457 () Bool)

(assert (=> b!255480 m!270457))

(declare-fun m!270459 () Bool)

(assert (=> b!255480 m!270459))

(assert (=> b!255480 m!270459))

(declare-fun m!270461 () Bool)

(assert (=> b!255480 m!270461))

(declare-fun m!270463 () Bool)

(assert (=> b!255480 m!270463))

(declare-fun m!270465 () Bool)

(assert (=> b!255480 m!270465))

(declare-fun m!270467 () Bool)

(assert (=> b!255480 m!270467))

(declare-fun m!270469 () Bool)

(assert (=> b!255480 m!270469))

(declare-fun m!270471 () Bool)

(assert (=> b!255480 m!270471))

(declare-fun m!270473 () Bool)

(assert (=> b!255480 m!270473))

(declare-fun m!270475 () Bool)

(assert (=> b!255480 m!270475))

(declare-fun m!270477 () Bool)

(assert (=> b!255480 m!270477))

(declare-fun m!270479 () Bool)

(assert (=> b!255480 m!270479))

(assert (=> b!255480 m!270471))

(declare-fun m!270481 () Bool)

(assert (=> b!255480 m!270481))

(assert (=> b!255480 m!270451))

(assert (=> b!255480 m!270475))

(declare-fun m!270483 () Bool)

(assert (=> b!255480 m!270483))

(assert (=> b!255480 m!270437))

(assert (=> b!255480 m!270465))

(declare-fun m!270485 () Bool)

(assert (=> b!255480 m!270485))

(assert (=> b!255491 m!270437))

(assert (=> b!255491 m!270437))

(declare-fun m!270487 () Bool)

(assert (=> b!255491 m!270487))

(assert (=> b!255479 m!270437))

(assert (=> b!255479 m!270437))

(declare-fun m!270489 () Bool)

(assert (=> b!255479 m!270489))

(declare-fun m!270491 () Bool)

(assert (=> b!255490 m!270491))

(assert (=> b!255488 m!270437))

(declare-fun m!270493 () Bool)

(assert (=> b!255488 m!270493))

(declare-fun m!270495 () Bool)

(assert (=> b!255488 m!270495))

(declare-fun m!270497 () Bool)

(assert (=> b!255488 m!270497))

(declare-fun m!270499 () Bool)

(assert (=> b!255488 m!270499))

(assert (=> b!255488 m!270495))

(assert (=> b!255488 m!270437))

(assert (=> b!255488 m!270497))

(declare-fun m!270501 () Bool)

(assert (=> bm!24149 m!270501))

(declare-fun m!270503 () Bool)

(assert (=> bm!24144 m!270503))

(assert (=> b!255476 m!270437))

(assert (=> b!255476 m!270437))

(assert (=> b!255476 m!270489))

(assert (=> b!255268 d!61441))

(declare-fun b!255505 () Bool)

(declare-fun res!125005 () Bool)

(declare-fun e!165611 () Bool)

(assert (=> b!255505 (=> (not res!125005) (not e!165611))))

(assert (=> b!255505 (= res!125005 (validKeyInArray!0 key!932))))

(declare-fun b!255506 () Bool)

(assert (=> b!255506 (= e!165611 (bvslt (size!6250 (_keys!6869 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!61443 () Bool)

(declare-fun e!165610 () Bool)

(assert (=> d!61443 e!165610))

(declare-fun res!125002 () Bool)

(assert (=> d!61443 (=> (not res!125002) (not e!165610))))

(assert (=> d!61443 (= res!125002 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6250 (_keys!6869 thiss!1504)))))))

(declare-fun lt!128090 () Unit!7884)

(declare-fun choose!1 (array!12459 (_ BitVec 32) (_ BitVec 64)) Unit!7884)

(assert (=> d!61443 (= lt!128090 (choose!1 (_keys!6869 thiss!1504) index!297 key!932))))

(assert (=> d!61443 e!165611))

(declare-fun res!125004 () Bool)

(assert (=> d!61443 (=> (not res!125004) (not e!165611))))

(assert (=> d!61443 (= res!125004 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6250 (_keys!6869 thiss!1504)))))))

(assert (=> d!61443 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6869 thiss!1504) index!297 key!932) lt!128090)))

(declare-fun b!255507 () Bool)

(assert (=> b!255507 (= e!165610 (= (arrayCountValidKeys!0 (array!12460 (store (arr!5902 (_keys!6869 thiss!1504)) index!297 key!932) (size!6250 (_keys!6869 thiss!1504))) #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6869 thiss!1504) #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!255504 () Bool)

(declare-fun res!125003 () Bool)

(assert (=> b!255504 (=> (not res!125003) (not e!165611))))

(assert (=> b!255504 (= res!125003 (not (validKeyInArray!0 (select (arr!5902 (_keys!6869 thiss!1504)) index!297))))))

(assert (= (and d!61443 res!125004) b!255504))

(assert (= (and b!255504 res!125003) b!255505))

(assert (= (and b!255505 res!125005) b!255506))

(assert (= (and d!61443 res!125002) b!255507))

(declare-fun m!270505 () Bool)

(assert (=> b!255505 m!270505))

(declare-fun m!270507 () Bool)

(assert (=> d!61443 m!270507))

(assert (=> b!255507 m!270279))

(declare-fun m!270509 () Bool)

(assert (=> b!255507 m!270509))

(assert (=> b!255507 m!270281))

(declare-fun m!270511 () Bool)

(assert (=> b!255504 m!270511))

(assert (=> b!255504 m!270511))

(declare-fun m!270513 () Bool)

(assert (=> b!255504 m!270513))

(assert (=> b!255255 d!61443))

(declare-fun bm!24152 () Bool)

(declare-fun call!24155 () (_ BitVec 32))

(assert (=> bm!24152 (= call!24155 (arrayCountValidKeys!0 (_keys!6869 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6250 (_keys!6869 thiss!1504))))))

(declare-fun d!61445 () Bool)

(declare-fun lt!128093 () (_ BitVec 32))

(assert (=> d!61445 (and (bvsge lt!128093 #b00000000000000000000000000000000) (bvsle lt!128093 (bvsub (size!6250 (_keys!6869 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!165616 () (_ BitVec 32))

(assert (=> d!61445 (= lt!128093 e!165616)))

(declare-fun c!43155 () Bool)

(assert (=> d!61445 (= c!43155 (bvsge #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))))))

(assert (=> d!61445 (and (bvsle #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6250 (_keys!6869 thiss!1504)) (size!6250 (_keys!6869 thiss!1504))))))

(assert (=> d!61445 (= (arrayCountValidKeys!0 (_keys!6869 thiss!1504) #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))) lt!128093)))

(declare-fun b!255516 () Bool)

(declare-fun e!165617 () (_ BitVec 32))

(assert (=> b!255516 (= e!165616 e!165617)))

(declare-fun c!43156 () Bool)

(assert (=> b!255516 (= c!43156 (validKeyInArray!0 (select (arr!5902 (_keys!6869 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!255517 () Bool)

(assert (=> b!255517 (= e!165617 (bvadd #b00000000000000000000000000000001 call!24155))))

(declare-fun b!255518 () Bool)

(assert (=> b!255518 (= e!165616 #b00000000000000000000000000000000)))

(declare-fun b!255519 () Bool)

(assert (=> b!255519 (= e!165617 call!24155)))

(assert (= (and d!61445 c!43155) b!255518))

(assert (= (and d!61445 (not c!43155)) b!255516))

(assert (= (and b!255516 c!43156) b!255517))

(assert (= (and b!255516 (not c!43156)) b!255519))

(assert (= (or b!255517 b!255519) bm!24152))

(declare-fun m!270515 () Bool)

(assert (=> bm!24152 m!270515))

(assert (=> b!255516 m!270437))

(assert (=> b!255516 m!270437))

(assert (=> b!255516 m!270489))

(assert (=> b!255255 d!61445))

(declare-fun d!61447 () Bool)

(declare-fun e!165620 () Bool)

(assert (=> d!61447 e!165620))

(declare-fun res!125008 () Bool)

(assert (=> d!61447 (=> (not res!125008) (not e!165620))))

(assert (=> d!61447 (= res!125008 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6250 (_keys!6869 thiss!1504))) (bvslt index!297 (size!6249 (_values!4695 thiss!1504)))))))

(declare-fun lt!128096 () Unit!7884)

(declare-fun choose!1228 (array!12459 array!12457 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 32) (_ BitVec 64) V!8401 Int) Unit!7884)

(assert (=> d!61447 (= lt!128096 (choose!1228 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) index!297 key!932 v!346 (defaultEntry!4712 thiss!1504)))))

(assert (=> d!61447 (validMask!0 (mask!10971 thiss!1504))))

(assert (=> d!61447 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!94 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) index!297 key!932 v!346 (defaultEntry!4712 thiss!1504)) lt!128096)))

(declare-fun b!255522 () Bool)

(assert (=> b!255522 (= e!165620 (= (+!683 (getCurrentListMap!1400 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)) (tuple2!4849 key!932 v!346)) (getCurrentListMap!1400 (array!12460 (store (arr!5902 (_keys!6869 thiss!1504)) index!297 key!932) (size!6250 (_keys!6869 thiss!1504))) (array!12458 (store (arr!5901 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6249 (_values!4695 thiss!1504))) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504))))))

(assert (= (and d!61447 res!125008) b!255522))

(declare-fun m!270517 () Bool)

(assert (=> d!61447 m!270517))

(assert (=> d!61447 m!270415))

(assert (=> b!255522 m!270279))

(assert (=> b!255522 m!270261))

(assert (=> b!255522 m!270287))

(declare-fun m!270519 () Bool)

(assert (=> b!255522 m!270519))

(assert (=> b!255522 m!270261))

(declare-fun m!270521 () Bool)

(assert (=> b!255522 m!270521))

(assert (=> b!255255 d!61447))

(declare-fun d!61449 () Bool)

(declare-fun e!165623 () Bool)

(assert (=> d!61449 e!165623))

(declare-fun res!125014 () Bool)

(assert (=> d!61449 (=> (not res!125014) (not e!165623))))

(declare-fun lt!128108 () ListLongMap!3751)

(assert (=> d!61449 (= res!125014 (contains!1830 lt!128108 (_1!2435 (tuple2!4849 key!932 v!346))))))

(declare-fun lt!128107 () List!3751)

(assert (=> d!61449 (= lt!128108 (ListLongMap!3752 lt!128107))))

(declare-fun lt!128106 () Unit!7884)

(declare-fun lt!128105 () Unit!7884)

(assert (=> d!61449 (= lt!128106 lt!128105)))

(assert (=> d!61449 (= (getValueByKey!305 lt!128107 (_1!2435 (tuple2!4849 key!932 v!346))) (Some!310 (_2!2435 (tuple2!4849 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!164 (List!3751 (_ BitVec 64) V!8401) Unit!7884)

(assert (=> d!61449 (= lt!128105 (lemmaContainsTupThenGetReturnValue!164 lt!128107 (_1!2435 (tuple2!4849 key!932 v!346)) (_2!2435 (tuple2!4849 key!932 v!346))))))

(declare-fun insertStrictlySorted!167 (List!3751 (_ BitVec 64) V!8401) List!3751)

(assert (=> d!61449 (= lt!128107 (insertStrictlySorted!167 (toList!1891 lt!127925) (_1!2435 (tuple2!4849 key!932 v!346)) (_2!2435 (tuple2!4849 key!932 v!346))))))

(assert (=> d!61449 (= (+!683 lt!127925 (tuple2!4849 key!932 v!346)) lt!128108)))

(declare-fun b!255527 () Bool)

(declare-fun res!125013 () Bool)

(assert (=> b!255527 (=> (not res!125013) (not e!165623))))

(assert (=> b!255527 (= res!125013 (= (getValueByKey!305 (toList!1891 lt!128108) (_1!2435 (tuple2!4849 key!932 v!346))) (Some!310 (_2!2435 (tuple2!4849 key!932 v!346)))))))

(declare-fun b!255528 () Bool)

(declare-fun contains!1833 (List!3751 tuple2!4848) Bool)

(assert (=> b!255528 (= e!165623 (contains!1833 (toList!1891 lt!128108) (tuple2!4849 key!932 v!346)))))

(assert (= (and d!61449 res!125014) b!255527))

(assert (= (and b!255527 res!125013) b!255528))

(declare-fun m!270523 () Bool)

(assert (=> d!61449 m!270523))

(declare-fun m!270525 () Bool)

(assert (=> d!61449 m!270525))

(declare-fun m!270527 () Bool)

(assert (=> d!61449 m!270527))

(declare-fun m!270529 () Bool)

(assert (=> d!61449 m!270529))

(declare-fun m!270531 () Bool)

(assert (=> b!255527 m!270531))

(declare-fun m!270533 () Bool)

(assert (=> b!255528 m!270533))

(assert (=> b!255255 d!61449))

(declare-fun bm!24153 () Bool)

(declare-fun call!24156 () (_ BitVec 32))

(assert (=> bm!24153 (= call!24156 (arrayCountValidKeys!0 lt!127917 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6250 (_keys!6869 thiss!1504))))))

(declare-fun d!61451 () Bool)

(declare-fun lt!128109 () (_ BitVec 32))

(assert (=> d!61451 (and (bvsge lt!128109 #b00000000000000000000000000000000) (bvsle lt!128109 (bvsub (size!6250 lt!127917) #b00000000000000000000000000000000)))))

(declare-fun e!165624 () (_ BitVec 32))

(assert (=> d!61451 (= lt!128109 e!165624)))

(declare-fun c!43157 () Bool)

(assert (=> d!61451 (= c!43157 (bvsge #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))))))

(assert (=> d!61451 (and (bvsle #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6250 (_keys!6869 thiss!1504)) (size!6250 lt!127917)))))

(assert (=> d!61451 (= (arrayCountValidKeys!0 lt!127917 #b00000000000000000000000000000000 (size!6250 (_keys!6869 thiss!1504))) lt!128109)))

(declare-fun b!255529 () Bool)

(declare-fun e!165625 () (_ BitVec 32))

(assert (=> b!255529 (= e!165624 e!165625)))

(declare-fun c!43158 () Bool)

(assert (=> b!255529 (= c!43158 (validKeyInArray!0 (select (arr!5902 lt!127917) #b00000000000000000000000000000000)))))

(declare-fun b!255530 () Bool)

(assert (=> b!255530 (= e!165625 (bvadd #b00000000000000000000000000000001 call!24156))))

(declare-fun b!255531 () Bool)

(assert (=> b!255531 (= e!165624 #b00000000000000000000000000000000)))

(declare-fun b!255532 () Bool)

(assert (=> b!255532 (= e!165625 call!24156)))

(assert (= (and d!61451 c!43157) b!255531))

(assert (= (and d!61451 (not c!43157)) b!255529))

(assert (= (and b!255529 c!43158) b!255530))

(assert (= (and b!255529 (not c!43158)) b!255532))

(assert (= (or b!255530 b!255532) bm!24153))

(declare-fun m!270535 () Bool)

(assert (=> bm!24153 m!270535))

(declare-fun m!270537 () Bool)

(assert (=> b!255529 m!270537))

(assert (=> b!255529 m!270537))

(declare-fun m!270539 () Bool)

(assert (=> b!255529 m!270539))

(assert (=> b!255255 d!61451))

(declare-fun b!255533 () Bool)

(declare-fun e!165634 () Bool)

(declare-fun lt!128124 () ListLongMap!3751)

(assert (=> b!255533 (= e!165634 (= (apply!249 lt!128124 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4553 thiss!1504)))))

(declare-fun b!255534 () Bool)

(declare-fun e!165631 () ListLongMap!3751)

(declare-fun call!24157 () ListLongMap!3751)

(assert (=> b!255534 (= e!165631 call!24157)))

(declare-fun bm!24154 () Bool)

(declare-fun call!24161 () ListLongMap!3751)

(assert (=> bm!24154 (= call!24157 call!24161)))

(declare-fun b!255535 () Bool)

(declare-fun e!165636 () Bool)

(declare-fun e!165629 () Bool)

(assert (=> b!255535 (= e!165636 e!165629)))

(declare-fun res!125016 () Bool)

(declare-fun call!24160 () Bool)

(assert (=> b!255535 (= res!125016 call!24160)))

(assert (=> b!255535 (=> (not res!125016) (not e!165629))))

(declare-fun b!255536 () Bool)

(declare-fun e!165627 () Bool)

(assert (=> b!255536 (= e!165627 (validKeyInArray!0 (select (arr!5902 lt!127917) #b00000000000000000000000000000000)))))

(declare-fun bm!24155 () Bool)

(declare-fun call!24163 () Bool)

(assert (=> bm!24155 (= call!24163 (contains!1830 lt!128124 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255537 () Bool)

(declare-fun e!165632 () Unit!7884)

(declare-fun Unit!7901 () Unit!7884)

(assert (=> b!255537 (= e!165632 Unit!7901)))

(declare-fun b!255538 () Bool)

(declare-fun e!165637 () Bool)

(assert (=> b!255538 (= e!165637 (not call!24163))))

(declare-fun bm!24156 () Bool)

(declare-fun call!24159 () ListLongMap!3751)

(assert (=> bm!24156 (= call!24161 call!24159)))

(declare-fun d!61453 () Bool)

(declare-fun e!165628 () Bool)

(assert (=> d!61453 e!165628))

(declare-fun res!125018 () Bool)

(assert (=> d!61453 (=> (not res!125018) (not e!165628))))

(assert (=> d!61453 (= res!125018 (or (bvsge #b00000000000000000000000000000000 (size!6250 lt!127917)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6250 lt!127917)))))))

(declare-fun lt!128110 () ListLongMap!3751)

(assert (=> d!61453 (= lt!128124 lt!128110)))

(declare-fun lt!128111 () Unit!7884)

(assert (=> d!61453 (= lt!128111 e!165632)))

(declare-fun c!43160 () Bool)

(assert (=> d!61453 (= c!43160 e!165627)))

(declare-fun res!125017 () Bool)

(assert (=> d!61453 (=> (not res!125017) (not e!165627))))

(assert (=> d!61453 (= res!125017 (bvslt #b00000000000000000000000000000000 (size!6250 lt!127917)))))

(declare-fun e!165635 () ListLongMap!3751)

(assert (=> d!61453 (= lt!128110 e!165635)))

(declare-fun c!43162 () Bool)

(assert (=> d!61453 (= c!43162 (and (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61453 (validMask!0 (mask!10971 thiss!1504))))

(assert (=> d!61453 (= (getCurrentListMap!1400 lt!127917 (array!12458 (store (arr!5901 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6249 (_values!4695 thiss!1504))) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)) lt!128124)))

(declare-fun bm!24157 () Bool)

(assert (=> bm!24157 (= call!24159 (getCurrentListMapNoExtraKeys!565 lt!127917 (array!12458 (store (arr!5901 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6249 (_values!4695 thiss!1504))) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun b!255539 () Bool)

(declare-fun e!165630 () Bool)

(assert (=> b!255539 (= e!165630 (validKeyInArray!0 (select (arr!5902 lt!127917) #b00000000000000000000000000000000)))))

(declare-fun b!255540 () Bool)

(declare-fun lt!128117 () Unit!7884)

(assert (=> b!255540 (= e!165632 lt!128117)))

(declare-fun lt!128120 () ListLongMap!3751)

(assert (=> b!255540 (= lt!128120 (getCurrentListMapNoExtraKeys!565 lt!127917 (array!12458 (store (arr!5901 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6249 (_values!4695 thiss!1504))) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128114 () (_ BitVec 64))

(assert (=> b!255540 (= lt!128114 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128112 () (_ BitVec 64))

(assert (=> b!255540 (= lt!128112 (select (arr!5902 lt!127917) #b00000000000000000000000000000000))))

(declare-fun lt!128130 () Unit!7884)

(assert (=> b!255540 (= lt!128130 (addStillContains!225 lt!128120 lt!128114 (zeroValue!4553 thiss!1504) lt!128112))))

(assert (=> b!255540 (contains!1830 (+!683 lt!128120 (tuple2!4849 lt!128114 (zeroValue!4553 thiss!1504))) lt!128112)))

(declare-fun lt!128131 () Unit!7884)

(assert (=> b!255540 (= lt!128131 lt!128130)))

(declare-fun lt!128126 () ListLongMap!3751)

(assert (=> b!255540 (= lt!128126 (getCurrentListMapNoExtraKeys!565 lt!127917 (array!12458 (store (arr!5901 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6249 (_values!4695 thiss!1504))) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128113 () (_ BitVec 64))

(assert (=> b!255540 (= lt!128113 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128123 () (_ BitVec 64))

(assert (=> b!255540 (= lt!128123 (select (arr!5902 lt!127917) #b00000000000000000000000000000000))))

(declare-fun lt!128115 () Unit!7884)

(assert (=> b!255540 (= lt!128115 (addApplyDifferent!225 lt!128126 lt!128113 (minValue!4553 thiss!1504) lt!128123))))

(assert (=> b!255540 (= (apply!249 (+!683 lt!128126 (tuple2!4849 lt!128113 (minValue!4553 thiss!1504))) lt!128123) (apply!249 lt!128126 lt!128123))))

(declare-fun lt!128118 () Unit!7884)

(assert (=> b!255540 (= lt!128118 lt!128115)))

(declare-fun lt!128119 () ListLongMap!3751)

(assert (=> b!255540 (= lt!128119 (getCurrentListMapNoExtraKeys!565 lt!127917 (array!12458 (store (arr!5901 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6249 (_values!4695 thiss!1504))) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128127 () (_ BitVec 64))

(assert (=> b!255540 (= lt!128127 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128129 () (_ BitVec 64))

(assert (=> b!255540 (= lt!128129 (select (arr!5902 lt!127917) #b00000000000000000000000000000000))))

(declare-fun lt!128121 () Unit!7884)

(assert (=> b!255540 (= lt!128121 (addApplyDifferent!225 lt!128119 lt!128127 (zeroValue!4553 thiss!1504) lt!128129))))

(assert (=> b!255540 (= (apply!249 (+!683 lt!128119 (tuple2!4849 lt!128127 (zeroValue!4553 thiss!1504))) lt!128129) (apply!249 lt!128119 lt!128129))))

(declare-fun lt!128128 () Unit!7884)

(assert (=> b!255540 (= lt!128128 lt!128121)))

(declare-fun lt!128125 () ListLongMap!3751)

(assert (=> b!255540 (= lt!128125 (getCurrentListMapNoExtraKeys!565 lt!127917 (array!12458 (store (arr!5901 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6249 (_values!4695 thiss!1504))) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128122 () (_ BitVec 64))

(assert (=> b!255540 (= lt!128122 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128116 () (_ BitVec 64))

(assert (=> b!255540 (= lt!128116 (select (arr!5902 lt!127917) #b00000000000000000000000000000000))))

(assert (=> b!255540 (= lt!128117 (addApplyDifferent!225 lt!128125 lt!128122 (minValue!4553 thiss!1504) lt!128116))))

(assert (=> b!255540 (= (apply!249 (+!683 lt!128125 (tuple2!4849 lt!128122 (minValue!4553 thiss!1504))) lt!128116) (apply!249 lt!128125 lt!128116))))

(declare-fun b!255541 () Bool)

(assert (=> b!255541 (= e!165636 (not call!24160))))

(declare-fun call!24158 () ListLongMap!3751)

(declare-fun bm!24158 () Bool)

(declare-fun c!43163 () Bool)

(assert (=> bm!24158 (= call!24158 (+!683 (ite c!43162 call!24159 (ite c!43163 call!24161 call!24157)) (ite (or c!43162 c!43163) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4553 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4553 thiss!1504)))))))

(declare-fun b!255542 () Bool)

(declare-fun c!43164 () Bool)

(assert (=> b!255542 (= c!43164 (and (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!165638 () ListLongMap!3751)

(assert (=> b!255542 (= e!165638 e!165631)))

(declare-fun b!255543 () Bool)

(declare-fun call!24162 () ListLongMap!3751)

(assert (=> b!255543 (= e!165638 call!24162)))

(declare-fun b!255544 () Bool)

(declare-fun res!125015 () Bool)

(assert (=> b!255544 (=> (not res!125015) (not e!165628))))

(assert (=> b!255544 (= res!125015 e!165636)))

(declare-fun c!43161 () Bool)

(assert (=> b!255544 (= c!43161 (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!255545 () Bool)

(assert (=> b!255545 (= e!165631 call!24162)))

(declare-fun b!255546 () Bool)

(assert (=> b!255546 (= e!165635 (+!683 call!24158 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4553 thiss!1504))))))

(declare-fun b!255547 () Bool)

(declare-fun res!125022 () Bool)

(assert (=> b!255547 (=> (not res!125022) (not e!165628))))

(declare-fun e!165626 () Bool)

(assert (=> b!255547 (= res!125022 e!165626)))

(declare-fun res!125021 () Bool)

(assert (=> b!255547 (=> res!125021 e!165626)))

(assert (=> b!255547 (= res!125021 (not e!165630))))

(declare-fun res!125023 () Bool)

(assert (=> b!255547 (=> (not res!125023) (not e!165630))))

(assert (=> b!255547 (= res!125023 (bvslt #b00000000000000000000000000000000 (size!6250 lt!127917)))))

(declare-fun e!165633 () Bool)

(declare-fun b!255548 () Bool)

(assert (=> b!255548 (= e!165633 (= (apply!249 lt!128124 (select (arr!5902 lt!127917) #b00000000000000000000000000000000)) (get!3032 (select (arr!5901 (array!12458 (store (arr!5901 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6249 (_values!4695 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!583 (defaultEntry!4712 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!255548 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6249 (array!12458 (store (arr!5901 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6249 (_values!4695 thiss!1504))))))))

(assert (=> b!255548 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6250 lt!127917)))))

(declare-fun b!255549 () Bool)

(assert (=> b!255549 (= e!165628 e!165637)))

(declare-fun c!43159 () Bool)

(assert (=> b!255549 (= c!43159 (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255550 () Bool)

(assert (=> b!255550 (= e!165629 (= (apply!249 lt!128124 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4553 thiss!1504)))))

(declare-fun bm!24159 () Bool)

(assert (=> bm!24159 (= call!24162 call!24158)))

(declare-fun b!255551 () Bool)

(assert (=> b!255551 (= e!165626 e!165633)))

(declare-fun res!125020 () Bool)

(assert (=> b!255551 (=> (not res!125020) (not e!165633))))

(assert (=> b!255551 (= res!125020 (contains!1830 lt!128124 (select (arr!5902 lt!127917) #b00000000000000000000000000000000)))))

(assert (=> b!255551 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6250 lt!127917)))))

(declare-fun b!255552 () Bool)

(assert (=> b!255552 (= e!165637 e!165634)))

(declare-fun res!125019 () Bool)

(assert (=> b!255552 (= res!125019 call!24163)))

(assert (=> b!255552 (=> (not res!125019) (not e!165634))))

(declare-fun bm!24160 () Bool)

(assert (=> bm!24160 (= call!24160 (contains!1830 lt!128124 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255553 () Bool)

(assert (=> b!255553 (= e!165635 e!165638)))

(assert (=> b!255553 (= c!43163 (and (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61453 c!43162) b!255546))

(assert (= (and d!61453 (not c!43162)) b!255553))

(assert (= (and b!255553 c!43163) b!255543))

(assert (= (and b!255553 (not c!43163)) b!255542))

(assert (= (and b!255542 c!43164) b!255545))

(assert (= (and b!255542 (not c!43164)) b!255534))

(assert (= (or b!255545 b!255534) bm!24154))

(assert (= (or b!255543 bm!24154) bm!24156))

(assert (= (or b!255543 b!255545) bm!24159))

(assert (= (or b!255546 bm!24156) bm!24157))

(assert (= (or b!255546 bm!24159) bm!24158))

(assert (= (and d!61453 res!125017) b!255536))

(assert (= (and d!61453 c!43160) b!255540))

(assert (= (and d!61453 (not c!43160)) b!255537))

(assert (= (and d!61453 res!125018) b!255547))

(assert (= (and b!255547 res!125023) b!255539))

(assert (= (and b!255547 (not res!125021)) b!255551))

(assert (= (and b!255551 res!125020) b!255548))

(assert (= (and b!255547 res!125022) b!255544))

(assert (= (and b!255544 c!43161) b!255535))

(assert (= (and b!255544 (not c!43161)) b!255541))

(assert (= (and b!255535 res!125016) b!255550))

(assert (= (or b!255535 b!255541) bm!24160))

(assert (= (and b!255544 res!125015) b!255549))

(assert (= (and b!255549 c!43159) b!255552))

(assert (= (and b!255549 (not c!43159)) b!255538))

(assert (= (and b!255552 res!125019) b!255533))

(assert (= (or b!255552 b!255538) bm!24155))

(declare-fun b_lambda!8131 () Bool)

(assert (=> (not b_lambda!8131) (not b!255548)))

(assert (=> b!255548 t!8800))

(declare-fun b_and!13735 () Bool)

(assert (= b_and!13733 (and (=> t!8800 result!5347) b_and!13735)))

(declare-fun m!270541 () Bool)

(assert (=> bm!24158 m!270541))

(declare-fun m!270543 () Bool)

(assert (=> bm!24157 m!270543))

(declare-fun m!270545 () Bool)

(assert (=> b!255546 m!270545))

(declare-fun m!270547 () Bool)

(assert (=> b!255533 m!270547))

(assert (=> d!61453 m!270415))

(declare-fun m!270549 () Bool)

(assert (=> b!255540 m!270549))

(declare-fun m!270551 () Bool)

(assert (=> b!255540 m!270551))

(assert (=> b!255540 m!270551))

(declare-fun m!270553 () Bool)

(assert (=> b!255540 m!270553))

(declare-fun m!270555 () Bool)

(assert (=> b!255540 m!270555))

(declare-fun m!270557 () Bool)

(assert (=> b!255540 m!270557))

(declare-fun m!270559 () Bool)

(assert (=> b!255540 m!270559))

(declare-fun m!270561 () Bool)

(assert (=> b!255540 m!270561))

(declare-fun m!270563 () Bool)

(assert (=> b!255540 m!270563))

(declare-fun m!270565 () Bool)

(assert (=> b!255540 m!270565))

(declare-fun m!270567 () Bool)

(assert (=> b!255540 m!270567))

(declare-fun m!270569 () Bool)

(assert (=> b!255540 m!270569))

(declare-fun m!270571 () Bool)

(assert (=> b!255540 m!270571))

(assert (=> b!255540 m!270563))

(declare-fun m!270573 () Bool)

(assert (=> b!255540 m!270573))

(assert (=> b!255540 m!270543))

(assert (=> b!255540 m!270567))

(declare-fun m!270575 () Bool)

(assert (=> b!255540 m!270575))

(assert (=> b!255540 m!270537))

(assert (=> b!255540 m!270557))

(declare-fun m!270577 () Bool)

(assert (=> b!255540 m!270577))

(assert (=> b!255551 m!270537))

(assert (=> b!255551 m!270537))

(declare-fun m!270579 () Bool)

(assert (=> b!255551 m!270579))

(assert (=> b!255539 m!270537))

(assert (=> b!255539 m!270537))

(assert (=> b!255539 m!270539))

(declare-fun m!270581 () Bool)

(assert (=> b!255550 m!270581))

(assert (=> b!255548 m!270537))

(declare-fun m!270583 () Bool)

(assert (=> b!255548 m!270583))

(declare-fun m!270585 () Bool)

(assert (=> b!255548 m!270585))

(assert (=> b!255548 m!270497))

(declare-fun m!270587 () Bool)

(assert (=> b!255548 m!270587))

(assert (=> b!255548 m!270585))

(assert (=> b!255548 m!270537))

(assert (=> b!255548 m!270497))

(declare-fun m!270589 () Bool)

(assert (=> bm!24160 m!270589))

(declare-fun m!270591 () Bool)

(assert (=> bm!24155 m!270591))

(assert (=> b!255536 m!270537))

(assert (=> b!255536 m!270537))

(assert (=> b!255536 m!270539))

(assert (=> b!255255 d!61453))

(declare-fun d!61455 () Bool)

(declare-fun e!165641 () Bool)

(assert (=> d!61455 e!165641))

(declare-fun res!125026 () Bool)

(assert (=> d!61455 (=> (not res!125026) (not e!165641))))

(assert (=> d!61455 (= res!125026 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6250 (_keys!6869 thiss!1504)))))))

(declare-fun lt!128134 () Unit!7884)

(declare-fun choose!41 (array!12459 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3752) Unit!7884)

(assert (=> d!61455 (= lt!128134 (choose!41 (_keys!6869 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3749))))

(assert (=> d!61455 (bvslt (size!6250 (_keys!6869 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61455 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6869 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3749) lt!128134)))

(declare-fun b!255556 () Bool)

(assert (=> b!255556 (= e!165641 (arrayNoDuplicates!0 (array!12460 (store (arr!5902 (_keys!6869 thiss!1504)) index!297 key!932) (size!6250 (_keys!6869 thiss!1504))) #b00000000000000000000000000000000 Nil!3749))))

(assert (= (and d!61455 res!125026) b!255556))

(declare-fun m!270593 () Bool)

(assert (=> d!61455 m!270593))

(assert (=> b!255556 m!270279))

(declare-fun m!270595 () Bool)

(assert (=> b!255556 m!270595))

(assert (=> b!255255 d!61455))

(assert (=> b!255255 d!61435))

(declare-fun d!61457 () Bool)

(declare-fun e!165644 () Bool)

(assert (=> d!61457 e!165644))

(declare-fun res!125029 () Bool)

(assert (=> d!61457 (=> (not res!125029) (not e!165644))))

(assert (=> d!61457 (= res!125029 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6250 (_keys!6869 thiss!1504)))))))

(declare-fun lt!128137 () Unit!7884)

(declare-fun choose!102 ((_ BitVec 64) array!12459 (_ BitVec 32) (_ BitVec 32)) Unit!7884)

(assert (=> d!61457 (= lt!128137 (choose!102 key!932 (_keys!6869 thiss!1504) index!297 (mask!10971 thiss!1504)))))

(assert (=> d!61457 (validMask!0 (mask!10971 thiss!1504))))

(assert (=> d!61457 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6869 thiss!1504) index!297 (mask!10971 thiss!1504)) lt!128137)))

(declare-fun b!255559 () Bool)

(assert (=> b!255559 (= e!165644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12460 (store (arr!5902 (_keys!6869 thiss!1504)) index!297 key!932) (size!6250 (_keys!6869 thiss!1504))) (mask!10971 thiss!1504)))))

(assert (= (and d!61457 res!125029) b!255559))

(declare-fun m!270597 () Bool)

(assert (=> d!61457 m!270597))

(assert (=> d!61457 m!270415))

(assert (=> b!255559 m!270279))

(declare-fun m!270599 () Bool)

(assert (=> b!255559 m!270599))

(assert (=> b!255255 d!61457))

(declare-fun b!255568 () Bool)

(declare-fun e!165651 () Bool)

(declare-fun call!24166 () Bool)

(assert (=> b!255568 (= e!165651 call!24166)))

(declare-fun b!255569 () Bool)

(declare-fun e!165653 () Bool)

(declare-fun e!165652 () Bool)

(assert (=> b!255569 (= e!165653 e!165652)))

(declare-fun c!43167 () Bool)

(assert (=> b!255569 (= c!43167 (validKeyInArray!0 (select (arr!5902 lt!127917) #b00000000000000000000000000000000)))))

(declare-fun d!61459 () Bool)

(declare-fun res!125034 () Bool)

(assert (=> d!61459 (=> res!125034 e!165653)))

(assert (=> d!61459 (= res!125034 (bvsge #b00000000000000000000000000000000 (size!6250 lt!127917)))))

(assert (=> d!61459 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127917 (mask!10971 thiss!1504)) e!165653)))

(declare-fun bm!24163 () Bool)

(assert (=> bm!24163 (= call!24166 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!127917 (mask!10971 thiss!1504)))))

(declare-fun b!255570 () Bool)

(assert (=> b!255570 (= e!165652 e!165651)))

(declare-fun lt!128145 () (_ BitVec 64))

(assert (=> b!255570 (= lt!128145 (select (arr!5902 lt!127917) #b00000000000000000000000000000000))))

(declare-fun lt!128144 () Unit!7884)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12459 (_ BitVec 64) (_ BitVec 32)) Unit!7884)

(assert (=> b!255570 (= lt!128144 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!127917 lt!128145 #b00000000000000000000000000000000))))

(assert (=> b!255570 (arrayContainsKey!0 lt!127917 lt!128145 #b00000000000000000000000000000000)))

(declare-fun lt!128146 () Unit!7884)

(assert (=> b!255570 (= lt!128146 lt!128144)))

(declare-fun res!125035 () Bool)

(assert (=> b!255570 (= res!125035 (= (seekEntryOrOpen!0 (select (arr!5902 lt!127917) #b00000000000000000000000000000000) lt!127917 (mask!10971 thiss!1504)) (Found!1154 #b00000000000000000000000000000000)))))

(assert (=> b!255570 (=> (not res!125035) (not e!165651))))

(declare-fun b!255571 () Bool)

(assert (=> b!255571 (= e!165652 call!24166)))

(assert (= (and d!61459 (not res!125034)) b!255569))

(assert (= (and b!255569 c!43167) b!255570))

(assert (= (and b!255569 (not c!43167)) b!255571))

(assert (= (and b!255570 res!125035) b!255568))

(assert (= (or b!255568 b!255571) bm!24163))

(assert (=> b!255569 m!270537))

(assert (=> b!255569 m!270537))

(assert (=> b!255569 m!270539))

(declare-fun m!270601 () Bool)

(assert (=> bm!24163 m!270601))

(assert (=> b!255570 m!270537))

(declare-fun m!270603 () Bool)

(assert (=> b!255570 m!270603))

(declare-fun m!270605 () Bool)

(assert (=> b!255570 m!270605))

(assert (=> b!255570 m!270537))

(declare-fun m!270607 () Bool)

(assert (=> b!255570 m!270607))

(assert (=> b!255255 d!61459))

(declare-fun b!255582 () Bool)

(declare-fun e!165664 () Bool)

(declare-fun contains!1834 (List!3752 (_ BitVec 64)) Bool)

(assert (=> b!255582 (= e!165664 (contains!1834 Nil!3749 (select (arr!5902 lt!127917) #b00000000000000000000000000000000)))))

(declare-fun d!61461 () Bool)

(declare-fun res!125044 () Bool)

(declare-fun e!165663 () Bool)

(assert (=> d!61461 (=> res!125044 e!165663)))

(assert (=> d!61461 (= res!125044 (bvsge #b00000000000000000000000000000000 (size!6250 lt!127917)))))

(assert (=> d!61461 (= (arrayNoDuplicates!0 lt!127917 #b00000000000000000000000000000000 Nil!3749) e!165663)))

(declare-fun b!255583 () Bool)

(declare-fun e!165665 () Bool)

(assert (=> b!255583 (= e!165663 e!165665)))

(declare-fun res!125042 () Bool)

(assert (=> b!255583 (=> (not res!125042) (not e!165665))))

(assert (=> b!255583 (= res!125042 (not e!165664))))

(declare-fun res!125043 () Bool)

(assert (=> b!255583 (=> (not res!125043) (not e!165664))))

(assert (=> b!255583 (= res!125043 (validKeyInArray!0 (select (arr!5902 lt!127917) #b00000000000000000000000000000000)))))

(declare-fun bm!24166 () Bool)

(declare-fun call!24169 () Bool)

(declare-fun c!43170 () Bool)

(assert (=> bm!24166 (= call!24169 (arrayNoDuplicates!0 lt!127917 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43170 (Cons!3748 (select (arr!5902 lt!127917) #b00000000000000000000000000000000) Nil!3749) Nil!3749)))))

(declare-fun b!255584 () Bool)

(declare-fun e!165662 () Bool)

(assert (=> b!255584 (= e!165665 e!165662)))

(assert (=> b!255584 (= c!43170 (validKeyInArray!0 (select (arr!5902 lt!127917) #b00000000000000000000000000000000)))))

(declare-fun b!255585 () Bool)

(assert (=> b!255585 (= e!165662 call!24169)))

(declare-fun b!255586 () Bool)

(assert (=> b!255586 (= e!165662 call!24169)))

(assert (= (and d!61461 (not res!125044)) b!255583))

(assert (= (and b!255583 res!125043) b!255582))

(assert (= (and b!255583 res!125042) b!255584))

(assert (= (and b!255584 c!43170) b!255585))

(assert (= (and b!255584 (not c!43170)) b!255586))

(assert (= (or b!255585 b!255586) bm!24166))

(assert (=> b!255582 m!270537))

(assert (=> b!255582 m!270537))

(declare-fun m!270609 () Bool)

(assert (=> b!255582 m!270609))

(assert (=> b!255583 m!270537))

(assert (=> b!255583 m!270537))

(assert (=> b!255583 m!270539))

(assert (=> bm!24166 m!270537))

(declare-fun m!270611 () Bool)

(assert (=> bm!24166 m!270611))

(assert (=> b!255584 m!270537))

(assert (=> b!255584 m!270537))

(assert (=> b!255584 m!270539))

(assert (=> b!255255 d!61461))

(declare-fun b!255603 () Bool)

(declare-fun res!125055 () Bool)

(declare-fun e!165676 () Bool)

(assert (=> b!255603 (=> (not res!125055) (not e!165676))))

(declare-fun call!24174 () Bool)

(assert (=> b!255603 (= res!125055 call!24174)))

(declare-fun e!165677 () Bool)

(assert (=> b!255603 (= e!165677 e!165676)))

(declare-fun b!255604 () Bool)

(declare-fun e!165675 () Bool)

(declare-fun call!24175 () Bool)

(assert (=> b!255604 (= e!165675 (not call!24175))))

(declare-fun bm!24171 () Bool)

(declare-fun c!43176 () Bool)

(declare-fun lt!128151 () SeekEntryResult!1154)

(assert (=> bm!24171 (= call!24174 (inRange!0 (ite c!43176 (index!6786 lt!128151) (index!6789 lt!128151)) (mask!10971 thiss!1504)))))

(declare-fun b!255605 () Bool)

(declare-fun res!125053 () Bool)

(assert (=> b!255605 (=> (not res!125053) (not e!165676))))

(assert (=> b!255605 (= res!125053 (= (select (arr!5902 (_keys!6869 thiss!1504)) (index!6789 lt!128151)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255605 (and (bvsge (index!6789 lt!128151) #b00000000000000000000000000000000) (bvslt (index!6789 lt!128151) (size!6250 (_keys!6869 thiss!1504))))))

(declare-fun b!255606 () Bool)

(declare-fun e!165674 () Bool)

(assert (=> b!255606 (= e!165674 e!165677)))

(declare-fun c!43175 () Bool)

(assert (=> b!255606 (= c!43175 ((_ is MissingVacant!1154) lt!128151))))

(declare-fun bm!24172 () Bool)

(assert (=> bm!24172 (= call!24175 (arrayContainsKey!0 (_keys!6869 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255607 () Bool)

(assert (=> b!255607 (and (bvsge (index!6786 lt!128151) #b00000000000000000000000000000000) (bvslt (index!6786 lt!128151) (size!6250 (_keys!6869 thiss!1504))))))

(declare-fun res!125056 () Bool)

(assert (=> b!255607 (= res!125056 (= (select (arr!5902 (_keys!6869 thiss!1504)) (index!6786 lt!128151)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255607 (=> (not res!125056) (not e!165675))))

(declare-fun b!255608 () Bool)

(assert (=> b!255608 (= e!165674 e!165675)))

(declare-fun res!125054 () Bool)

(assert (=> b!255608 (= res!125054 call!24174)))

(assert (=> b!255608 (=> (not res!125054) (not e!165675))))

(declare-fun d!61463 () Bool)

(assert (=> d!61463 e!165674))

(assert (=> d!61463 (= c!43176 ((_ is MissingZero!1154) lt!128151))))

(assert (=> d!61463 (= lt!128151 (seekEntryOrOpen!0 key!932 (_keys!6869 thiss!1504) (mask!10971 thiss!1504)))))

(declare-fun lt!128152 () Unit!7884)

(declare-fun choose!1229 (array!12459 array!12457 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 64) Int) Unit!7884)

(assert (=> d!61463 (= lt!128152 (choose!1229 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 (defaultEntry!4712 thiss!1504)))))

(assert (=> d!61463 (validMask!0 (mask!10971 thiss!1504))))

(assert (=> d!61463 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!420 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 (defaultEntry!4712 thiss!1504)) lt!128152)))

(declare-fun b!255609 () Bool)

(assert (=> b!255609 (= e!165676 (not call!24175))))

(declare-fun b!255610 () Bool)

(assert (=> b!255610 (= e!165677 ((_ is Undefined!1154) lt!128151))))

(assert (= (and d!61463 c!43176) b!255608))

(assert (= (and d!61463 (not c!43176)) b!255606))

(assert (= (and b!255608 res!125054) b!255607))

(assert (= (and b!255607 res!125056) b!255604))

(assert (= (and b!255606 c!43175) b!255603))

(assert (= (and b!255606 (not c!43175)) b!255610))

(assert (= (and b!255603 res!125055) b!255605))

(assert (= (and b!255605 res!125053) b!255609))

(assert (= (or b!255608 b!255603) bm!24171))

(assert (= (or b!255604 b!255609) bm!24172))

(declare-fun m!270613 () Bool)

(assert (=> b!255607 m!270613))

(assert (=> d!61463 m!270299))

(declare-fun m!270615 () Bool)

(assert (=> d!61463 m!270615))

(assert (=> d!61463 m!270415))

(declare-fun m!270617 () Bool)

(assert (=> bm!24171 m!270617))

(declare-fun m!270619 () Bool)

(assert (=> b!255605 m!270619))

(assert (=> bm!24172 m!270269))

(assert (=> b!255254 d!61463))

(declare-fun d!61465 () Bool)

(declare-fun e!165680 () Bool)

(assert (=> d!61465 e!165680))

(declare-fun res!125062 () Bool)

(assert (=> d!61465 (=> (not res!125062) (not e!165680))))

(declare-fun lt!128157 () SeekEntryResult!1154)

(assert (=> d!61465 (= res!125062 ((_ is Found!1154) lt!128157))))

(assert (=> d!61465 (= lt!128157 (seekEntryOrOpen!0 key!932 (_keys!6869 thiss!1504) (mask!10971 thiss!1504)))))

(declare-fun lt!128158 () Unit!7884)

(declare-fun choose!1230 (array!12459 array!12457 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 64) Int) Unit!7884)

(assert (=> d!61465 (= lt!128158 (choose!1230 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 (defaultEntry!4712 thiss!1504)))))

(assert (=> d!61465 (validMask!0 (mask!10971 thiss!1504))))

(assert (=> d!61465 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!421 (_keys!6869 thiss!1504) (_values!4695 thiss!1504) (mask!10971 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 (defaultEntry!4712 thiss!1504)) lt!128158)))

(declare-fun b!255615 () Bool)

(declare-fun res!125061 () Bool)

(assert (=> b!255615 (=> (not res!125061) (not e!165680))))

(assert (=> b!255615 (= res!125061 (inRange!0 (index!6787 lt!128157) (mask!10971 thiss!1504)))))

(declare-fun b!255616 () Bool)

(assert (=> b!255616 (= e!165680 (= (select (arr!5902 (_keys!6869 thiss!1504)) (index!6787 lt!128157)) key!932))))

(assert (=> b!255616 (and (bvsge (index!6787 lt!128157) #b00000000000000000000000000000000) (bvslt (index!6787 lt!128157) (size!6250 (_keys!6869 thiss!1504))))))

(assert (= (and d!61465 res!125062) b!255615))

(assert (= (and b!255615 res!125061) b!255616))

(assert (=> d!61465 m!270299))

(declare-fun m!270621 () Bool)

(assert (=> d!61465 m!270621))

(assert (=> d!61465 m!270415))

(declare-fun m!270623 () Bool)

(assert (=> b!255615 m!270623))

(declare-fun m!270625 () Bool)

(assert (=> b!255616 m!270625))

(assert (=> b!255266 d!61465))

(declare-fun d!61467 () Bool)

(assert (=> d!61467 (= (inRange!0 (ite c!43093 (index!6786 lt!127920) (index!6789 lt!127920)) (mask!10971 thiss!1504)) (and (bvsge (ite c!43093 (index!6786 lt!127920) (index!6789 lt!127920)) #b00000000000000000000000000000000) (bvslt (ite c!43093 (index!6786 lt!127920) (index!6789 lt!127920)) (bvadd (mask!10971 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24115 d!61467))

(declare-fun d!61469 () Bool)

(assert (=> d!61469 (= (array_inv!3897 (_keys!6869 thiss!1504)) (bvsge (size!6250 (_keys!6869 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255249 d!61469))

(declare-fun d!61471 () Bool)

(assert (=> d!61471 (= (array_inv!3898 (_values!4695 thiss!1504)) (bvsge (size!6249 (_values!4695 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255249 d!61471))

(declare-fun mapNonEmpty!11178 () Bool)

(declare-fun mapRes!11178 () Bool)

(declare-fun tp!23418 () Bool)

(declare-fun e!165685 () Bool)

(assert (=> mapNonEmpty!11178 (= mapRes!11178 (and tp!23418 e!165685))))

(declare-fun mapKey!11178 () (_ BitVec 32))

(declare-fun mapValue!11178 () ValueCell!2939)

(declare-fun mapRest!11178 () (Array (_ BitVec 32) ValueCell!2939))

(assert (=> mapNonEmpty!11178 (= mapRest!11169 (store mapRest!11178 mapKey!11178 mapValue!11178))))

(declare-fun condMapEmpty!11178 () Bool)

(declare-fun mapDefault!11178 () ValueCell!2939)

(assert (=> mapNonEmpty!11169 (= condMapEmpty!11178 (= mapRest!11169 ((as const (Array (_ BitVec 32) ValueCell!2939)) mapDefault!11178)))))

(declare-fun e!165686 () Bool)

(assert (=> mapNonEmpty!11169 (= tp!23402 (and e!165686 mapRes!11178))))

(declare-fun b!255624 () Bool)

(assert (=> b!255624 (= e!165686 tp_is_empty!6565)))

(declare-fun b!255623 () Bool)

(assert (=> b!255623 (= e!165685 tp_is_empty!6565)))

(declare-fun mapIsEmpty!11178 () Bool)

(assert (=> mapIsEmpty!11178 mapRes!11178))

(assert (= (and mapNonEmpty!11169 condMapEmpty!11178) mapIsEmpty!11178))

(assert (= (and mapNonEmpty!11169 (not condMapEmpty!11178)) mapNonEmpty!11178))

(assert (= (and mapNonEmpty!11178 ((_ is ValueCellFull!2939) mapValue!11178)) b!255623))

(assert (= (and mapNonEmpty!11169 ((_ is ValueCellFull!2939) mapDefault!11178)) b!255624))

(declare-fun m!270627 () Bool)

(assert (=> mapNonEmpty!11178 m!270627))

(declare-fun b_lambda!8133 () Bool)

(assert (= b_lambda!8129 (or (and b!255249 b_free!6703) b_lambda!8133)))

(declare-fun b_lambda!8135 () Bool)

(assert (= b_lambda!8131 (or (and b!255249 b_free!6703) b_lambda!8135)))

(check-sat (not bm!24149) (not b!255414) (not d!61439) (not bm!24166) (not b!255570) (not b!255491) (not b!255539) (not b_next!6703) (not bm!24144) (not b!255527) (not bm!24160) (not bm!24147) (not b!255583) (not b_lambda!8133) (not b!255546) (not b!255540) (not b!255413) (not d!61457) (not b!255421) (not d!61429) (not b!255522) (not b!255473) (not b!255533) (not b!255556) (not d!61463) (not bm!24157) (not bm!24153) (not b!255488) (not bm!24158) b_and!13735 (not b!255430) tp_is_empty!6565 (not b!255559) (not d!61433) (not d!61431) (not d!61455) (not d!61449) (not b!255516) (not b!255615) (not b!255582) (not b!255551) (not b_lambda!8135) (not b!255428) (not b!255536) (not b!255490) (not b!255529) (not bm!24163) (not b!255404) (not b!255548) (not b!255550) (not bm!24171) (not d!61443) (not b!255476) (not b!255507) (not b!255486) (not bm!24146) (not d!61465) (not d!61441) (not bm!24152) (not b!255480) (not bm!24172) (not b!255505) (not b!255569) (not b!255415) (not d!61453) (not d!61447) (not b!255504) (not b!255479) (not b!255584) (not mapNonEmpty!11178) (not bm!24155) (not b!255528))
(check-sat b_and!13735 (not b_next!6703))
