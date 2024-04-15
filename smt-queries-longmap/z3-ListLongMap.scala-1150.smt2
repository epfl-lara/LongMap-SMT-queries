; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24142 () Bool)

(assert start!24142)

(declare-fun b!252252 () Bool)

(declare-fun b_free!6649 () Bool)

(declare-fun b_next!6649 () Bool)

(assert (=> b!252252 (= b_free!6649 (not b_next!6649))))

(declare-fun tp!23226 () Bool)

(declare-fun b_and!13659 () Bool)

(assert (=> b!252252 (= tp!23226 b_and!13659)))

(declare-fun b!252248 () Bool)

(declare-datatypes ((Unit!7788 0))(
  ( (Unit!7789) )
))
(declare-fun e!163572 () Unit!7788)

(declare-fun Unit!7790 () Unit!7788)

(assert (=> b!252248 (= e!163572 Unit!7790)))

(declare-fun lt!126336 () Unit!7788)

(declare-datatypes ((V!8329 0))(
  ( (V!8330 (val!3300 Int)) )
))
(declare-datatypes ((ValueCell!2912 0))(
  ( (ValueCellFull!2912 (v!5365 V!8329)) (EmptyCell!2912) )
))
(declare-datatypes ((array!12339 0))(
  ( (array!12340 (arr!5847 (Array (_ BitVec 32) ValueCell!2912)) (size!6195 (_ BitVec 32))) )
))
(declare-datatypes ((array!12341 0))(
  ( (array!12342 (arr!5848 (Array (_ BitVec 32) (_ BitVec 64))) (size!6196 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3724 0))(
  ( (LongMapFixedSize!3725 (defaultEntry!4663 Int) (mask!10881 (_ BitVec 32)) (extraKeys!4400 (_ BitVec 32)) (zeroValue!4504 V!8329) (minValue!4504 V!8329) (_size!1911 (_ BitVec 32)) (_keys!6810 array!12341) (_values!4646 array!12339) (_vacant!1911 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3724)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!406 (array!12341 array!12339 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 64) Int) Unit!7788)

(assert (=> b!252248 (= lt!126336 (lemmaInListMapThenSeekEntryOrOpenFindsIt!406 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 (defaultEntry!4663 thiss!1504)))))

(assert (=> b!252248 false))

(declare-fun b!252249 () Bool)

(declare-fun e!163579 () Bool)

(declare-fun call!23752 () Bool)

(assert (=> b!252249 (= e!163579 (not call!23752))))

(declare-fun mapIsEmpty!11073 () Bool)

(declare-fun mapRes!11073 () Bool)

(assert (=> mapIsEmpty!11073 mapRes!11073))

(declare-fun b!252250 () Bool)

(declare-fun c!42501 () Bool)

(declare-datatypes ((SeekEntryResult!1131 0))(
  ( (MissingZero!1131 (index!6694 (_ BitVec 32))) (Found!1131 (index!6695 (_ BitVec 32))) (Intermediate!1131 (undefined!1943 Bool) (index!6696 (_ BitVec 32)) (x!24768 (_ BitVec 32))) (Undefined!1131) (MissingVacant!1131 (index!6697 (_ BitVec 32))) )
))
(declare-fun lt!126341 () SeekEntryResult!1131)

(get-info :version)

(assert (=> b!252250 (= c!42501 ((_ is MissingVacant!1131) lt!126341))))

(declare-fun e!163571 () Bool)

(declare-fun e!163570 () Bool)

(assert (=> b!252250 (= e!163571 e!163570)))

(declare-fun b!252251 () Bool)

(declare-fun res!123453 () Bool)

(assert (=> b!252251 (= res!123453 (= (select (arr!5848 (_keys!6810 thiss!1504)) (index!6697 lt!126341)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163578 () Bool)

(assert (=> b!252251 (=> (not res!123453) (not e!163578))))

(declare-fun e!163567 () Bool)

(declare-fun e!163569 () Bool)

(declare-fun tp_is_empty!6511 () Bool)

(declare-fun array_inv!3859 (array!12341) Bool)

(declare-fun array_inv!3860 (array!12339) Bool)

(assert (=> b!252252 (= e!163569 (and tp!23226 tp_is_empty!6511 (array_inv!3859 (_keys!6810 thiss!1504)) (array_inv!3860 (_values!4646 thiss!1504)) e!163567))))

(declare-fun call!23751 () Bool)

(declare-fun c!42503 () Bool)

(declare-fun bm!23748 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23748 (= call!23751 (inRange!0 (ite c!42503 (index!6694 lt!126341) (index!6697 lt!126341)) (mask!10881 thiss!1504)))))

(declare-fun b!252253 () Bool)

(declare-fun e!163580 () Bool)

(declare-fun e!163577 () Bool)

(assert (=> b!252253 (= e!163580 e!163577)))

(declare-fun res!123454 () Bool)

(assert (=> b!252253 (=> (not res!123454) (not e!163577))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!252253 (= res!123454 (inRange!0 index!297 (mask!10881 thiss!1504)))))

(declare-fun lt!126342 () Unit!7788)

(assert (=> b!252253 (= lt!126342 e!163572)))

(declare-fun c!42504 () Bool)

(declare-datatypes ((tuple2!4824 0))(
  ( (tuple2!4825 (_1!2423 (_ BitVec 64)) (_2!2423 V!8329)) )
))
(declare-datatypes ((List!3723 0))(
  ( (Nil!3720) (Cons!3719 (h!4381 tuple2!4824) (t!8755 List!3723)) )
))
(declare-datatypes ((ListLongMap!3727 0))(
  ( (ListLongMap!3728 (toList!1879 List!3723)) )
))
(declare-fun contains!1811 (ListLongMap!3727 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1388 (array!12341 array!12339 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 32) Int) ListLongMap!3727)

(assert (=> b!252253 (= c!42504 (contains!1811 (getCurrentListMap!1388 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)) key!932))))

(declare-fun b!252254 () Bool)

(assert (=> b!252254 (= e!163578 (not call!23752))))

(declare-fun b!252255 () Bool)

(declare-fun res!123458 () Bool)

(declare-fun e!163568 () Bool)

(assert (=> b!252255 (=> res!123458 e!163568)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12341 (_ BitVec 32)) Bool)

(assert (=> b!252255 (= res!123458 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6810 thiss!1504) (mask!10881 thiss!1504))))))

(declare-fun b!252256 () Bool)

(declare-fun res!123452 () Bool)

(assert (=> b!252256 (=> (not res!123452) (not e!163579))))

(assert (=> b!252256 (= res!123452 (= (select (arr!5848 (_keys!6810 thiss!1504)) (index!6694 lt!126341)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252257 () Bool)

(declare-fun e!163575 () Bool)

(assert (=> b!252257 (= e!163575 e!163580)))

(declare-fun res!123460 () Bool)

(assert (=> b!252257 (=> (not res!123460) (not e!163580))))

(assert (=> b!252257 (= res!123460 (or (= lt!126341 (MissingZero!1131 index!297)) (= lt!126341 (MissingVacant!1131 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12341 (_ BitVec 32)) SeekEntryResult!1131)

(assert (=> b!252257 (= lt!126341 (seekEntryOrOpen!0 key!932 (_keys!6810 thiss!1504) (mask!10881 thiss!1504)))))

(declare-fun b!252258 () Bool)

(declare-fun e!163574 () Unit!7788)

(declare-fun Unit!7791 () Unit!7788)

(assert (=> b!252258 (= e!163574 Unit!7791)))

(declare-fun b!252259 () Bool)

(assert (=> b!252259 (= e!163570 ((_ is Undefined!1131) lt!126341))))

(declare-fun b!252260 () Bool)

(declare-fun e!163573 () Bool)

(assert (=> b!252260 (= e!163567 (and e!163573 mapRes!11073))))

(declare-fun condMapEmpty!11073 () Bool)

(declare-fun mapDefault!11073 () ValueCell!2912)

(assert (=> b!252260 (= condMapEmpty!11073 (= (arr!5847 (_values!4646 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2912)) mapDefault!11073)))))

(declare-fun bm!23749 () Bool)

(declare-fun arrayContainsKey!0 (array!12341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23749 (= call!23752 (arrayContainsKey!0 (_keys!6810 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252261 () Bool)

(declare-datatypes ((List!3724 0))(
  ( (Nil!3721) (Cons!3720 (h!4382 (_ BitVec 64)) (t!8756 List!3724)) )
))
(declare-fun arrayNoDuplicates!0 (array!12341 (_ BitVec 32) List!3724) Bool)

(assert (=> b!252261 (= e!163568 (arrayNoDuplicates!0 (_keys!6810 thiss!1504) #b00000000000000000000000000000000 Nil!3721))))

(declare-fun res!123450 () Bool)

(assert (=> start!24142 (=> (not res!123450) (not e!163575))))

(declare-fun valid!1460 (LongMapFixedSize!3724) Bool)

(assert (=> start!24142 (= res!123450 (valid!1460 thiss!1504))))

(assert (=> start!24142 e!163575))

(assert (=> start!24142 e!163569))

(assert (=> start!24142 true))

(declare-fun b!252262 () Bool)

(assert (=> b!252262 (= e!163570 e!163578)))

(declare-fun res!123459 () Bool)

(assert (=> b!252262 (= res!123459 call!23751)))

(assert (=> b!252262 (=> (not res!123459) (not e!163578))))

(declare-fun b!252263 () Bool)

(declare-fun Unit!7792 () Unit!7788)

(assert (=> b!252263 (= e!163574 Unit!7792)))

(declare-fun lt!126337 () Unit!7788)

(declare-fun lemmaArrayContainsKeyThenInListMap!215 (array!12341 array!12339 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 64) (_ BitVec 32) Int) Unit!7788)

(assert (=> b!252263 (= lt!126337 (lemmaArrayContainsKeyThenInListMap!215 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)))))

(assert (=> b!252263 false))

(declare-fun mapNonEmpty!11073 () Bool)

(declare-fun tp!23225 () Bool)

(declare-fun e!163576 () Bool)

(assert (=> mapNonEmpty!11073 (= mapRes!11073 (and tp!23225 e!163576))))

(declare-fun mapValue!11073 () ValueCell!2912)

(declare-fun mapRest!11073 () (Array (_ BitVec 32) ValueCell!2912))

(declare-fun mapKey!11073 () (_ BitVec 32))

(assert (=> mapNonEmpty!11073 (= (arr!5847 (_values!4646 thiss!1504)) (store mapRest!11073 mapKey!11073 mapValue!11073))))

(declare-fun b!252264 () Bool)

(assert (=> b!252264 (= e!163577 (not e!163568))))

(declare-fun res!123451 () Bool)

(assert (=> b!252264 (=> res!123451 e!163568)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!252264 (= res!123451 (not (validMask!0 (mask!10881 thiss!1504))))))

(declare-fun lt!126339 () array!12341)

(assert (=> b!252264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126339 (mask!10881 thiss!1504))))

(declare-fun lt!126335 () Unit!7788)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12341 (_ BitVec 32) (_ BitVec 32)) Unit!7788)

(assert (=> b!252264 (= lt!126335 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6810 thiss!1504) index!297 (mask!10881 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12341 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!252264 (= (arrayCountValidKeys!0 lt!126339 #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6810 thiss!1504) #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504)))))))

(declare-fun lt!126343 () Unit!7788)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12341 (_ BitVec 32) (_ BitVec 64)) Unit!7788)

(assert (=> b!252264 (= lt!126343 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6810 thiss!1504) index!297 key!932))))

(assert (=> b!252264 (arrayNoDuplicates!0 lt!126339 #b00000000000000000000000000000000 Nil!3721)))

(assert (=> b!252264 (= lt!126339 (array!12342 (store (arr!5848 (_keys!6810 thiss!1504)) index!297 key!932) (size!6196 (_keys!6810 thiss!1504))))))

(declare-fun lt!126338 () Unit!7788)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12341 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3724) Unit!7788)

(assert (=> b!252264 (= lt!126338 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6810 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3721))))

(declare-fun lt!126334 () Unit!7788)

(assert (=> b!252264 (= lt!126334 e!163574)))

(declare-fun c!42502 () Bool)

(assert (=> b!252264 (= c!42502 (arrayContainsKey!0 (_keys!6810 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252265 () Bool)

(declare-fun res!123456 () Bool)

(assert (=> b!252265 (=> (not res!123456) (not e!163575))))

(assert (=> b!252265 (= res!123456 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!252266 () Bool)

(declare-fun res!123455 () Bool)

(assert (=> b!252266 (=> (not res!123455) (not e!163579))))

(assert (=> b!252266 (= res!123455 call!23751)))

(assert (=> b!252266 (= e!163571 e!163579)))

(declare-fun b!252267 () Bool)

(declare-fun lt!126340 () Unit!7788)

(assert (=> b!252267 (= e!163572 lt!126340)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!406 (array!12341 array!12339 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 64) Int) Unit!7788)

(assert (=> b!252267 (= lt!126340 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!406 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 (defaultEntry!4663 thiss!1504)))))

(assert (=> b!252267 (= c!42503 ((_ is MissingZero!1131) lt!126341))))

(assert (=> b!252267 e!163571))

(declare-fun b!252268 () Bool)

(assert (=> b!252268 (= e!163576 tp_is_empty!6511)))

(declare-fun b!252269 () Bool)

(declare-fun res!123457 () Bool)

(assert (=> b!252269 (=> res!123457 e!163568)))

(assert (=> b!252269 (= res!123457 (or (not (= (size!6195 (_values!4646 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10881 thiss!1504)))) (not (= (size!6196 (_keys!6810 thiss!1504)) (size!6195 (_values!4646 thiss!1504)))) (bvslt (mask!10881 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4400 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4400 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!252270 () Bool)

(assert (=> b!252270 (= e!163573 tp_is_empty!6511)))

(assert (= (and start!24142 res!123450) b!252265))

(assert (= (and b!252265 res!123456) b!252257))

(assert (= (and b!252257 res!123460) b!252253))

(assert (= (and b!252253 c!42504) b!252248))

(assert (= (and b!252253 (not c!42504)) b!252267))

(assert (= (and b!252267 c!42503) b!252266))

(assert (= (and b!252267 (not c!42503)) b!252250))

(assert (= (and b!252266 res!123455) b!252256))

(assert (= (and b!252256 res!123452) b!252249))

(assert (= (and b!252250 c!42501) b!252262))

(assert (= (and b!252250 (not c!42501)) b!252259))

(assert (= (and b!252262 res!123459) b!252251))

(assert (= (and b!252251 res!123453) b!252254))

(assert (= (or b!252266 b!252262) bm!23748))

(assert (= (or b!252249 b!252254) bm!23749))

(assert (= (and b!252253 res!123454) b!252264))

(assert (= (and b!252264 c!42502) b!252263))

(assert (= (and b!252264 (not c!42502)) b!252258))

(assert (= (and b!252264 (not res!123451)) b!252269))

(assert (= (and b!252269 (not res!123457)) b!252255))

(assert (= (and b!252255 (not res!123458)) b!252261))

(assert (= (and b!252260 condMapEmpty!11073) mapIsEmpty!11073))

(assert (= (and b!252260 (not condMapEmpty!11073)) mapNonEmpty!11073))

(assert (= (and mapNonEmpty!11073 ((_ is ValueCellFull!2912) mapValue!11073)) b!252268))

(assert (= (and b!252260 ((_ is ValueCellFull!2912) mapDefault!11073)) b!252270))

(assert (= b!252252 b!252260))

(assert (= start!24142 b!252252))

(declare-fun m!267913 () Bool)

(assert (=> b!252257 m!267913))

(declare-fun m!267915 () Bool)

(assert (=> b!252264 m!267915))

(declare-fun m!267917 () Bool)

(assert (=> b!252264 m!267917))

(declare-fun m!267919 () Bool)

(assert (=> b!252264 m!267919))

(declare-fun m!267921 () Bool)

(assert (=> b!252264 m!267921))

(declare-fun m!267923 () Bool)

(assert (=> b!252264 m!267923))

(declare-fun m!267925 () Bool)

(assert (=> b!252264 m!267925))

(declare-fun m!267927 () Bool)

(assert (=> b!252264 m!267927))

(declare-fun m!267929 () Bool)

(assert (=> b!252264 m!267929))

(declare-fun m!267931 () Bool)

(assert (=> b!252264 m!267931))

(declare-fun m!267933 () Bool)

(assert (=> b!252264 m!267933))

(assert (=> bm!23749 m!267917))

(declare-fun m!267935 () Bool)

(assert (=> start!24142 m!267935))

(declare-fun m!267937 () Bool)

(assert (=> b!252251 m!267937))

(declare-fun m!267939 () Bool)

(assert (=> bm!23748 m!267939))

(declare-fun m!267941 () Bool)

(assert (=> b!252248 m!267941))

(declare-fun m!267943 () Bool)

(assert (=> mapNonEmpty!11073 m!267943))

(declare-fun m!267945 () Bool)

(assert (=> b!252252 m!267945))

(declare-fun m!267947 () Bool)

(assert (=> b!252252 m!267947))

(declare-fun m!267949 () Bool)

(assert (=> b!252256 m!267949))

(declare-fun m!267951 () Bool)

(assert (=> b!252267 m!267951))

(declare-fun m!267953 () Bool)

(assert (=> b!252255 m!267953))

(declare-fun m!267955 () Bool)

(assert (=> b!252263 m!267955))

(declare-fun m!267957 () Bool)

(assert (=> b!252253 m!267957))

(declare-fun m!267959 () Bool)

(assert (=> b!252253 m!267959))

(assert (=> b!252253 m!267959))

(declare-fun m!267961 () Bool)

(assert (=> b!252253 m!267961))

(declare-fun m!267963 () Bool)

(assert (=> b!252261 m!267963))

(check-sat (not bm!23748) (not b!252252) (not mapNonEmpty!11073) (not start!24142) tp_is_empty!6511 (not b!252248) (not b_next!6649) (not b!252263) (not b!252264) (not b!252261) (not bm!23749) b_and!13659 (not b!252267) (not b!252253) (not b!252255) (not b!252257))
(check-sat b_and!13659 (not b_next!6649))
(get-model)

(declare-fun d!61189 () Bool)

(assert (=> d!61189 (= (inRange!0 index!297 (mask!10881 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10881 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!252253 d!61189))

(declare-fun d!61191 () Bool)

(declare-fun e!163675 () Bool)

(assert (=> d!61191 e!163675))

(declare-fun res!123529 () Bool)

(assert (=> d!61191 (=> res!123529 e!163675)))

(declare-fun lt!126415 () Bool)

(assert (=> d!61191 (= res!123529 (not lt!126415))))

(declare-fun lt!126413 () Bool)

(assert (=> d!61191 (= lt!126415 lt!126413)))

(declare-fun lt!126414 () Unit!7788)

(declare-fun e!163676 () Unit!7788)

(assert (=> d!61191 (= lt!126414 e!163676)))

(declare-fun c!42531 () Bool)

(assert (=> d!61191 (= c!42531 lt!126413)))

(declare-fun containsKey!292 (List!3723 (_ BitVec 64)) Bool)

(assert (=> d!61191 (= lt!126413 (containsKey!292 (toList!1879 (getCurrentListMap!1388 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504))) key!932))))

(assert (=> d!61191 (= (contains!1811 (getCurrentListMap!1388 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)) key!932) lt!126415)))

(declare-fun b!252415 () Bool)

(declare-fun lt!126412 () Unit!7788)

(assert (=> b!252415 (= e!163676 lt!126412)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!241 (List!3723 (_ BitVec 64)) Unit!7788)

(assert (=> b!252415 (= lt!126412 (lemmaContainsKeyImpliesGetValueByKeyDefined!241 (toList!1879 (getCurrentListMap!1388 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504))) key!932))))

(declare-datatypes ((Option!306 0))(
  ( (Some!305 (v!5368 V!8329)) (None!304) )
))
(declare-fun isDefined!242 (Option!306) Bool)

(declare-fun getValueByKey!300 (List!3723 (_ BitVec 64)) Option!306)

(assert (=> b!252415 (isDefined!242 (getValueByKey!300 (toList!1879 (getCurrentListMap!1388 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504))) key!932))))

(declare-fun b!252416 () Bool)

(declare-fun Unit!7799 () Unit!7788)

(assert (=> b!252416 (= e!163676 Unit!7799)))

(declare-fun b!252417 () Bool)

(assert (=> b!252417 (= e!163675 (isDefined!242 (getValueByKey!300 (toList!1879 (getCurrentListMap!1388 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504))) key!932)))))

(assert (= (and d!61191 c!42531) b!252415))

(assert (= (and d!61191 (not c!42531)) b!252416))

(assert (= (and d!61191 (not res!123529)) b!252417))

(declare-fun m!268069 () Bool)

(assert (=> d!61191 m!268069))

(declare-fun m!268071 () Bool)

(assert (=> b!252415 m!268071))

(declare-fun m!268073 () Bool)

(assert (=> b!252415 m!268073))

(assert (=> b!252415 m!268073))

(declare-fun m!268075 () Bool)

(assert (=> b!252415 m!268075))

(assert (=> b!252417 m!268073))

(assert (=> b!252417 m!268073))

(assert (=> b!252417 m!268075))

(assert (=> b!252253 d!61191))

(declare-fun b!252460 () Bool)

(declare-fun e!163713 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!252460 (= e!163713 (validKeyInArray!0 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252461 () Bool)

(declare-fun e!163710 () Bool)

(declare-fun lt!126460 () ListLongMap!3727)

(declare-fun apply!244 (ListLongMap!3727 (_ BitVec 64)) V!8329)

(assert (=> b!252461 (= e!163710 (= (apply!244 lt!126460 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4504 thiss!1504)))))

(declare-fun b!252462 () Bool)

(declare-fun e!163707 () ListLongMap!3727)

(declare-fun e!163708 () ListLongMap!3727)

(assert (=> b!252462 (= e!163707 e!163708)))

(declare-fun c!42544 () Bool)

(assert (=> b!252462 (= c!42544 (and (not (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23776 () Bool)

(declare-fun call!23780 () ListLongMap!3727)

(declare-fun call!23781 () ListLongMap!3727)

(assert (=> bm!23776 (= call!23780 call!23781)))

(declare-fun b!252463 () Bool)

(declare-fun e!163704 () Bool)

(declare-fun e!163706 () Bool)

(assert (=> b!252463 (= e!163704 e!163706)))

(declare-fun res!123551 () Bool)

(declare-fun call!23782 () Bool)

(assert (=> b!252463 (= res!123551 call!23782)))

(assert (=> b!252463 (=> (not res!123551) (not e!163706))))

(declare-fun b!252464 () Bool)

(declare-fun call!23785 () ListLongMap!3727)

(declare-fun +!677 (ListLongMap!3727 tuple2!4824) ListLongMap!3727)

(assert (=> b!252464 (= e!163707 (+!677 call!23785 (tuple2!4825 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4504 thiss!1504))))))

(declare-fun bm!23777 () Bool)

(declare-fun call!23784 () ListLongMap!3727)

(declare-fun getCurrentListMapNoExtraKeys!560 (array!12341 array!12339 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 32) Int) ListLongMap!3727)

(assert (=> bm!23777 (= call!23784 (getCurrentListMapNoExtraKeys!560 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)))))

(declare-fun b!252465 () Bool)

(declare-fun call!23783 () ListLongMap!3727)

(assert (=> b!252465 (= e!163708 call!23783)))

(declare-fun b!252466 () Bool)

(declare-fun e!163703 () Bool)

(declare-fun call!23779 () Bool)

(assert (=> b!252466 (= e!163703 (not call!23779))))

(declare-fun b!252467 () Bool)

(declare-fun e!163715 () ListLongMap!3727)

(assert (=> b!252467 (= e!163715 call!23783)))

(declare-fun c!42545 () Bool)

(declare-fun bm!23778 () Bool)

(assert (=> bm!23778 (= call!23785 (+!677 (ite c!42545 call!23784 (ite c!42544 call!23781 call!23780)) (ite (or c!42545 c!42544) (tuple2!4825 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4504 thiss!1504)) (tuple2!4825 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4504 thiss!1504)))))))

(declare-fun b!252468 () Bool)

(declare-fun e!163709 () Bool)

(assert (=> b!252468 (= e!163709 (validKeyInArray!0 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23779 () Bool)

(assert (=> bm!23779 (= call!23779 (contains!1811 lt!126460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252469 () Bool)

(declare-fun e!163714 () Unit!7788)

(declare-fun lt!126480 () Unit!7788)

(assert (=> b!252469 (= e!163714 lt!126480)))

(declare-fun lt!126476 () ListLongMap!3727)

(assert (=> b!252469 (= lt!126476 (getCurrentListMapNoExtraKeys!560 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)))))

(declare-fun lt!126468 () (_ BitVec 64))

(assert (=> b!252469 (= lt!126468 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126461 () (_ BitVec 64))

(assert (=> b!252469 (= lt!126461 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126463 () Unit!7788)

(declare-fun addStillContains!220 (ListLongMap!3727 (_ BitVec 64) V!8329 (_ BitVec 64)) Unit!7788)

(assert (=> b!252469 (= lt!126463 (addStillContains!220 lt!126476 lt!126468 (zeroValue!4504 thiss!1504) lt!126461))))

(assert (=> b!252469 (contains!1811 (+!677 lt!126476 (tuple2!4825 lt!126468 (zeroValue!4504 thiss!1504))) lt!126461)))

(declare-fun lt!126465 () Unit!7788)

(assert (=> b!252469 (= lt!126465 lt!126463)))

(declare-fun lt!126467 () ListLongMap!3727)

(assert (=> b!252469 (= lt!126467 (getCurrentListMapNoExtraKeys!560 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)))))

(declare-fun lt!126472 () (_ BitVec 64))

(assert (=> b!252469 (= lt!126472 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126462 () (_ BitVec 64))

(assert (=> b!252469 (= lt!126462 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126466 () Unit!7788)

(declare-fun addApplyDifferent!220 (ListLongMap!3727 (_ BitVec 64) V!8329 (_ BitVec 64)) Unit!7788)

(assert (=> b!252469 (= lt!126466 (addApplyDifferent!220 lt!126467 lt!126472 (minValue!4504 thiss!1504) lt!126462))))

(assert (=> b!252469 (= (apply!244 (+!677 lt!126467 (tuple2!4825 lt!126472 (minValue!4504 thiss!1504))) lt!126462) (apply!244 lt!126467 lt!126462))))

(declare-fun lt!126464 () Unit!7788)

(assert (=> b!252469 (= lt!126464 lt!126466)))

(declare-fun lt!126478 () ListLongMap!3727)

(assert (=> b!252469 (= lt!126478 (getCurrentListMapNoExtraKeys!560 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)))))

(declare-fun lt!126470 () (_ BitVec 64))

(assert (=> b!252469 (= lt!126470 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126473 () (_ BitVec 64))

(assert (=> b!252469 (= lt!126473 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126469 () Unit!7788)

(assert (=> b!252469 (= lt!126469 (addApplyDifferent!220 lt!126478 lt!126470 (zeroValue!4504 thiss!1504) lt!126473))))

(assert (=> b!252469 (= (apply!244 (+!677 lt!126478 (tuple2!4825 lt!126470 (zeroValue!4504 thiss!1504))) lt!126473) (apply!244 lt!126478 lt!126473))))

(declare-fun lt!126479 () Unit!7788)

(assert (=> b!252469 (= lt!126479 lt!126469)))

(declare-fun lt!126475 () ListLongMap!3727)

(assert (=> b!252469 (= lt!126475 (getCurrentListMapNoExtraKeys!560 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)))))

(declare-fun lt!126481 () (_ BitVec 64))

(assert (=> b!252469 (= lt!126481 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126471 () (_ BitVec 64))

(assert (=> b!252469 (= lt!126471 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252469 (= lt!126480 (addApplyDifferent!220 lt!126475 lt!126481 (minValue!4504 thiss!1504) lt!126471))))

(assert (=> b!252469 (= (apply!244 (+!677 lt!126475 (tuple2!4825 lt!126481 (minValue!4504 thiss!1504))) lt!126471) (apply!244 lt!126475 lt!126471))))

(declare-fun b!252470 () Bool)

(declare-fun Unit!7800 () Unit!7788)

(assert (=> b!252470 (= e!163714 Unit!7800)))

(declare-fun bm!23780 () Bool)

(assert (=> bm!23780 (= call!23783 call!23785)))

(declare-fun b!252471 () Bool)

(declare-fun c!42546 () Bool)

(assert (=> b!252471 (= c!42546 (and (not (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!252471 (= e!163708 e!163715)))

(declare-fun b!252472 () Bool)

(declare-fun e!163712 () Bool)

(declare-fun e!163711 () Bool)

(assert (=> b!252472 (= e!163712 e!163711)))

(declare-fun res!123556 () Bool)

(assert (=> b!252472 (=> (not res!123556) (not e!163711))))

(assert (=> b!252472 (= res!123556 (contains!1811 lt!126460 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!252472 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))))))

(declare-fun bm!23781 () Bool)

(assert (=> bm!23781 (= call!23781 call!23784)))

(declare-fun b!252473 () Bool)

(assert (=> b!252473 (= e!163703 e!163710)))

(declare-fun res!123555 () Bool)

(assert (=> b!252473 (= res!123555 call!23779)))

(assert (=> b!252473 (=> (not res!123555) (not e!163710))))

(declare-fun b!252474 () Bool)

(declare-fun res!123552 () Bool)

(declare-fun e!163705 () Bool)

(assert (=> b!252474 (=> (not res!123552) (not e!163705))))

(assert (=> b!252474 (= res!123552 e!163712)))

(declare-fun res!123553 () Bool)

(assert (=> b!252474 (=> res!123553 e!163712)))

(assert (=> b!252474 (= res!123553 (not e!163713))))

(declare-fun res!123548 () Bool)

(assert (=> b!252474 (=> (not res!123548) (not e!163713))))

(assert (=> b!252474 (= res!123548 (bvslt #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))))))

(declare-fun bm!23782 () Bool)

(assert (=> bm!23782 (= call!23782 (contains!1811 lt!126460 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252475 () Bool)

(declare-fun res!123550 () Bool)

(assert (=> b!252475 (=> (not res!123550) (not e!163705))))

(assert (=> b!252475 (= res!123550 e!163703)))

(declare-fun c!42549 () Bool)

(assert (=> b!252475 (= c!42549 (not (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!252477 () Bool)

(declare-fun get!3009 (ValueCell!2912 V!8329) V!8329)

(declare-fun dynLambda!578 (Int (_ BitVec 64)) V!8329)

(assert (=> b!252477 (= e!163711 (= (apply!244 lt!126460 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000)) (get!3009 (select (arr!5847 (_values!4646 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!578 (defaultEntry!4663 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!252477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6195 (_values!4646 thiss!1504))))))

(assert (=> b!252477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))))))

(declare-fun b!252476 () Bool)

(assert (=> b!252476 (= e!163704 (not call!23782))))

(declare-fun d!61193 () Bool)

(assert (=> d!61193 e!163705))

(declare-fun res!123554 () Bool)

(assert (=> d!61193 (=> (not res!123554) (not e!163705))))

(assert (=> d!61193 (= res!123554 (or (bvsge #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))))))))

(declare-fun lt!126477 () ListLongMap!3727)

(assert (=> d!61193 (= lt!126460 lt!126477)))

(declare-fun lt!126474 () Unit!7788)

(assert (=> d!61193 (= lt!126474 e!163714)))

(declare-fun c!42547 () Bool)

(assert (=> d!61193 (= c!42547 e!163709)))

(declare-fun res!123549 () Bool)

(assert (=> d!61193 (=> (not res!123549) (not e!163709))))

(assert (=> d!61193 (= res!123549 (bvslt #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))))))

(assert (=> d!61193 (= lt!126477 e!163707)))

(assert (=> d!61193 (= c!42545 (and (not (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61193 (validMask!0 (mask!10881 thiss!1504))))

(assert (=> d!61193 (= (getCurrentListMap!1388 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)) lt!126460)))

(declare-fun b!252478 () Bool)

(assert (=> b!252478 (= e!163705 e!163704)))

(declare-fun c!42548 () Bool)

(assert (=> b!252478 (= c!42548 (not (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!252479 () Bool)

(assert (=> b!252479 (= e!163715 call!23780)))

(declare-fun b!252480 () Bool)

(assert (=> b!252480 (= e!163706 (= (apply!244 lt!126460 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4504 thiss!1504)))))

(assert (= (and d!61193 c!42545) b!252464))

(assert (= (and d!61193 (not c!42545)) b!252462))

(assert (= (and b!252462 c!42544) b!252465))

(assert (= (and b!252462 (not c!42544)) b!252471))

(assert (= (and b!252471 c!42546) b!252467))

(assert (= (and b!252471 (not c!42546)) b!252479))

(assert (= (or b!252467 b!252479) bm!23776))

(assert (= (or b!252465 bm!23776) bm!23781))

(assert (= (or b!252465 b!252467) bm!23780))

(assert (= (or b!252464 bm!23781) bm!23777))

(assert (= (or b!252464 bm!23780) bm!23778))

(assert (= (and d!61193 res!123549) b!252468))

(assert (= (and d!61193 c!42547) b!252469))

(assert (= (and d!61193 (not c!42547)) b!252470))

(assert (= (and d!61193 res!123554) b!252474))

(assert (= (and b!252474 res!123548) b!252460))

(assert (= (and b!252474 (not res!123553)) b!252472))

(assert (= (and b!252472 res!123556) b!252477))

(assert (= (and b!252474 res!123552) b!252475))

(assert (= (and b!252475 c!42549) b!252473))

(assert (= (and b!252475 (not c!42549)) b!252466))

(assert (= (and b!252473 res!123555) b!252461))

(assert (= (or b!252473 b!252466) bm!23779))

(assert (= (and b!252475 res!123550) b!252478))

(assert (= (and b!252478 c!42548) b!252463))

(assert (= (and b!252478 (not c!42548)) b!252476))

(assert (= (and b!252463 res!123551) b!252480))

(assert (= (or b!252463 b!252476) bm!23782))

(declare-fun b_lambda!8101 () Bool)

(assert (=> (not b_lambda!8101) (not b!252477)))

(declare-fun t!8758 () Bool)

(declare-fun tb!2993 () Bool)

(assert (=> (and b!252252 (= (defaultEntry!4663 thiss!1504) (defaultEntry!4663 thiss!1504)) t!8758) tb!2993))

(declare-fun result!5317 () Bool)

(assert (=> tb!2993 (= result!5317 tp_is_empty!6511)))

(assert (=> b!252477 t!8758))

(declare-fun b_and!13665 () Bool)

(assert (= b_and!13659 (and (=> t!8758 result!5317) b_and!13665)))

(assert (=> d!61193 m!267915))

(declare-fun m!268077 () Bool)

(assert (=> b!252477 m!268077))

(declare-fun m!268079 () Bool)

(assert (=> b!252477 m!268079))

(declare-fun m!268081 () Bool)

(assert (=> b!252477 m!268081))

(assert (=> b!252477 m!268081))

(assert (=> b!252477 m!268079))

(declare-fun m!268083 () Bool)

(assert (=> b!252477 m!268083))

(assert (=> b!252477 m!268077))

(declare-fun m!268085 () Bool)

(assert (=> b!252477 m!268085))

(declare-fun m!268087 () Bool)

(assert (=> b!252480 m!268087))

(assert (=> b!252472 m!268077))

(assert (=> b!252472 m!268077))

(declare-fun m!268089 () Bool)

(assert (=> b!252472 m!268089))

(declare-fun m!268091 () Bool)

(assert (=> b!252461 m!268091))

(assert (=> b!252469 m!268077))

(declare-fun m!268093 () Bool)

(assert (=> b!252469 m!268093))

(declare-fun m!268095 () Bool)

(assert (=> b!252469 m!268095))

(declare-fun m!268097 () Bool)

(assert (=> b!252469 m!268097))

(declare-fun m!268099 () Bool)

(assert (=> b!252469 m!268099))

(declare-fun m!268101 () Bool)

(assert (=> b!252469 m!268101))

(declare-fun m!268103 () Bool)

(assert (=> b!252469 m!268103))

(declare-fun m!268105 () Bool)

(assert (=> b!252469 m!268105))

(declare-fun m!268107 () Bool)

(assert (=> b!252469 m!268107))

(assert (=> b!252469 m!268095))

(declare-fun m!268109 () Bool)

(assert (=> b!252469 m!268109))

(declare-fun m!268111 () Bool)

(assert (=> b!252469 m!268111))

(declare-fun m!268113 () Bool)

(assert (=> b!252469 m!268113))

(declare-fun m!268115 () Bool)

(assert (=> b!252469 m!268115))

(declare-fun m!268117 () Bool)

(assert (=> b!252469 m!268117))

(declare-fun m!268119 () Bool)

(assert (=> b!252469 m!268119))

(assert (=> b!252469 m!268113))

(assert (=> b!252469 m!268119))

(declare-fun m!268121 () Bool)

(assert (=> b!252469 m!268121))

(assert (=> b!252469 m!268097))

(declare-fun m!268123 () Bool)

(assert (=> b!252469 m!268123))

(declare-fun m!268125 () Bool)

(assert (=> b!252464 m!268125))

(declare-fun m!268127 () Bool)

(assert (=> bm!23778 m!268127))

(assert (=> b!252468 m!268077))

(assert (=> b!252468 m!268077))

(declare-fun m!268129 () Bool)

(assert (=> b!252468 m!268129))

(declare-fun m!268131 () Bool)

(assert (=> bm!23779 m!268131))

(declare-fun m!268133 () Bool)

(assert (=> bm!23782 m!268133))

(assert (=> b!252460 m!268077))

(assert (=> b!252460 m!268077))

(assert (=> b!252460 m!268129))

(assert (=> bm!23777 m!268093))

(assert (=> b!252253 d!61193))

(declare-fun d!61195 () Bool)

(assert (=> d!61195 (contains!1811 (getCurrentListMap!1388 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)) key!932)))

(declare-fun lt!126484 () Unit!7788)

(declare-fun choose!1210 (array!12341 array!12339 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 64) (_ BitVec 32) Int) Unit!7788)

(assert (=> d!61195 (= lt!126484 (choose!1210 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)))))

(assert (=> d!61195 (validMask!0 (mask!10881 thiss!1504))))

(assert (=> d!61195 (= (lemmaArrayContainsKeyThenInListMap!215 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)) lt!126484)))

(declare-fun bs!9006 () Bool)

(assert (= bs!9006 d!61195))

(assert (=> bs!9006 m!267959))

(assert (=> bs!9006 m!267959))

(assert (=> bs!9006 m!267961))

(declare-fun m!268135 () Bool)

(assert (=> bs!9006 m!268135))

(assert (=> bs!9006 m!267915))

(assert (=> b!252263 d!61195))

(declare-fun b!252493 () Bool)

(declare-fun e!163724 () Bool)

(declare-fun call!23788 () Bool)

(assert (=> b!252493 (= e!163724 call!23788)))

(declare-fun bm!23785 () Bool)

(declare-fun c!42552 () Bool)

(assert (=> bm!23785 (= call!23788 (arrayNoDuplicates!0 (_keys!6810 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42552 (Cons!3720 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000) Nil!3721) Nil!3721)))))

(declare-fun b!252494 () Bool)

(declare-fun e!163727 () Bool)

(assert (=> b!252494 (= e!163727 e!163724)))

(assert (=> b!252494 (= c!42552 (validKeyInArray!0 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61197 () Bool)

(declare-fun res!123565 () Bool)

(declare-fun e!163726 () Bool)

(assert (=> d!61197 (=> res!123565 e!163726)))

(assert (=> d!61197 (= res!123565 (bvsge #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))))))

(assert (=> d!61197 (= (arrayNoDuplicates!0 (_keys!6810 thiss!1504) #b00000000000000000000000000000000 Nil!3721) e!163726)))

(declare-fun b!252495 () Bool)

(assert (=> b!252495 (= e!163724 call!23788)))

(declare-fun b!252496 () Bool)

(assert (=> b!252496 (= e!163726 e!163727)))

(declare-fun res!123563 () Bool)

(assert (=> b!252496 (=> (not res!123563) (not e!163727))))

(declare-fun e!163725 () Bool)

(assert (=> b!252496 (= res!123563 (not e!163725))))

(declare-fun res!123564 () Bool)

(assert (=> b!252496 (=> (not res!123564) (not e!163725))))

(assert (=> b!252496 (= res!123564 (validKeyInArray!0 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252497 () Bool)

(declare-fun contains!1812 (List!3724 (_ BitVec 64)) Bool)

(assert (=> b!252497 (= e!163725 (contains!1812 Nil!3721 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61197 (not res!123565)) b!252496))

(assert (= (and b!252496 res!123564) b!252497))

(assert (= (and b!252496 res!123563) b!252494))

(assert (= (and b!252494 c!42552) b!252495))

(assert (= (and b!252494 (not c!42552)) b!252493))

(assert (= (or b!252495 b!252493) bm!23785))

(assert (=> bm!23785 m!268077))

(declare-fun m!268137 () Bool)

(assert (=> bm!23785 m!268137))

(assert (=> b!252494 m!268077))

(assert (=> b!252494 m!268077))

(assert (=> b!252494 m!268129))

(assert (=> b!252496 m!268077))

(assert (=> b!252496 m!268077))

(assert (=> b!252496 m!268129))

(assert (=> b!252497 m!268077))

(assert (=> b!252497 m!268077))

(declare-fun m!268139 () Bool)

(assert (=> b!252497 m!268139))

(assert (=> b!252261 d!61197))

(declare-fun d!61199 () Bool)

(declare-fun res!123572 () Bool)

(declare-fun e!163730 () Bool)

(assert (=> d!61199 (=> (not res!123572) (not e!163730))))

(declare-fun simpleValid!267 (LongMapFixedSize!3724) Bool)

(assert (=> d!61199 (= res!123572 (simpleValid!267 thiss!1504))))

(assert (=> d!61199 (= (valid!1460 thiss!1504) e!163730)))

(declare-fun b!252504 () Bool)

(declare-fun res!123573 () Bool)

(assert (=> b!252504 (=> (not res!123573) (not e!163730))))

(assert (=> b!252504 (= res!123573 (= (arrayCountValidKeys!0 (_keys!6810 thiss!1504) #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))) (_size!1911 thiss!1504)))))

(declare-fun b!252505 () Bool)

(declare-fun res!123574 () Bool)

(assert (=> b!252505 (=> (not res!123574) (not e!163730))))

(assert (=> b!252505 (= res!123574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6810 thiss!1504) (mask!10881 thiss!1504)))))

(declare-fun b!252506 () Bool)

(assert (=> b!252506 (= e!163730 (arrayNoDuplicates!0 (_keys!6810 thiss!1504) #b00000000000000000000000000000000 Nil!3721))))

(assert (= (and d!61199 res!123572) b!252504))

(assert (= (and b!252504 res!123573) b!252505))

(assert (= (and b!252505 res!123574) b!252506))

(declare-fun m!268141 () Bool)

(assert (=> d!61199 m!268141))

(assert (=> b!252504 m!267931))

(assert (=> b!252505 m!267953))

(assert (=> b!252506 m!267963))

(assert (=> start!24142 d!61199))

(declare-fun d!61201 () Bool)

(assert (=> d!61201 (= (inRange!0 (ite c!42503 (index!6694 lt!126341) (index!6697 lt!126341)) (mask!10881 thiss!1504)) (and (bvsge (ite c!42503 (index!6694 lt!126341) (index!6697 lt!126341)) #b00000000000000000000000000000000) (bvslt (ite c!42503 (index!6694 lt!126341) (index!6697 lt!126341)) (bvadd (mask!10881 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23748 d!61201))

(declare-fun d!61203 () Bool)

(declare-fun res!123579 () Bool)

(declare-fun e!163735 () Bool)

(assert (=> d!61203 (=> res!123579 e!163735)))

(assert (=> d!61203 (= res!123579 (= (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61203 (= (arrayContainsKey!0 (_keys!6810 thiss!1504) key!932 #b00000000000000000000000000000000) e!163735)))

(declare-fun b!252511 () Bool)

(declare-fun e!163736 () Bool)

(assert (=> b!252511 (= e!163735 e!163736)))

(declare-fun res!123580 () Bool)

(assert (=> b!252511 (=> (not res!123580) (not e!163736))))

(assert (=> b!252511 (= res!123580 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6196 (_keys!6810 thiss!1504))))))

(declare-fun b!252512 () Bool)

(assert (=> b!252512 (= e!163736 (arrayContainsKey!0 (_keys!6810 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61203 (not res!123579)) b!252511))

(assert (= (and b!252511 res!123580) b!252512))

(assert (=> d!61203 m!268077))

(declare-fun m!268143 () Bool)

(assert (=> b!252512 m!268143))

(assert (=> bm!23749 d!61203))

(declare-fun d!61205 () Bool)

(assert (=> d!61205 (= (array_inv!3859 (_keys!6810 thiss!1504)) (bvsge (size!6196 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252252 d!61205))

(declare-fun d!61207 () Bool)

(assert (=> d!61207 (= (array_inv!3860 (_values!4646 thiss!1504)) (bvsge (size!6195 (_values!4646 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252252 d!61207))

(declare-fun b!252529 () Bool)

(declare-fun lt!126490 () SeekEntryResult!1131)

(assert (=> b!252529 (and (bvsge (index!6694 lt!126490) #b00000000000000000000000000000000) (bvslt (index!6694 lt!126490) (size!6196 (_keys!6810 thiss!1504))))))

(declare-fun res!123589 () Bool)

(assert (=> b!252529 (= res!123589 (= (select (arr!5848 (_keys!6810 thiss!1504)) (index!6694 lt!126490)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163745 () Bool)

(assert (=> b!252529 (=> (not res!123589) (not e!163745))))

(declare-fun call!23794 () Bool)

(declare-fun c!42558 () Bool)

(declare-fun bm!23790 () Bool)

(assert (=> bm!23790 (= call!23794 (inRange!0 (ite c!42558 (index!6694 lt!126490) (index!6697 lt!126490)) (mask!10881 thiss!1504)))))

(declare-fun b!252530 () Bool)

(declare-fun call!23793 () Bool)

(assert (=> b!252530 (= e!163745 (not call!23793))))

(declare-fun d!61209 () Bool)

(declare-fun e!163747 () Bool)

(assert (=> d!61209 e!163747))

(assert (=> d!61209 (= c!42558 ((_ is MissingZero!1131) lt!126490))))

(assert (=> d!61209 (= lt!126490 (seekEntryOrOpen!0 key!932 (_keys!6810 thiss!1504) (mask!10881 thiss!1504)))))

(declare-fun lt!126489 () Unit!7788)

(declare-fun choose!1211 (array!12341 array!12339 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 64) Int) Unit!7788)

(assert (=> d!61209 (= lt!126489 (choose!1211 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 (defaultEntry!4663 thiss!1504)))))

(assert (=> d!61209 (validMask!0 (mask!10881 thiss!1504))))

(assert (=> d!61209 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!406 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 (defaultEntry!4663 thiss!1504)) lt!126489)))

(declare-fun b!252531 () Bool)

(declare-fun e!163748 () Bool)

(assert (=> b!252531 (= e!163748 (not call!23793))))

(declare-fun bm!23791 () Bool)

(assert (=> bm!23791 (= call!23793 (arrayContainsKey!0 (_keys!6810 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252532 () Bool)

(assert (=> b!252532 (= e!163747 e!163745)))

(declare-fun res!123590 () Bool)

(assert (=> b!252532 (= res!123590 call!23794)))

(assert (=> b!252532 (=> (not res!123590) (not e!163745))))

(declare-fun b!252533 () Bool)

(declare-fun res!123592 () Bool)

(assert (=> b!252533 (=> (not res!123592) (not e!163748))))

(assert (=> b!252533 (= res!123592 call!23794)))

(declare-fun e!163746 () Bool)

(assert (=> b!252533 (= e!163746 e!163748)))

(declare-fun b!252534 () Bool)

(assert (=> b!252534 (= e!163747 e!163746)))

(declare-fun c!42557 () Bool)

(assert (=> b!252534 (= c!42557 ((_ is MissingVacant!1131) lt!126490))))

(declare-fun b!252535 () Bool)

(assert (=> b!252535 (= e!163746 ((_ is Undefined!1131) lt!126490))))

(declare-fun b!252536 () Bool)

(declare-fun res!123591 () Bool)

(assert (=> b!252536 (=> (not res!123591) (not e!163748))))

(assert (=> b!252536 (= res!123591 (= (select (arr!5848 (_keys!6810 thiss!1504)) (index!6697 lt!126490)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252536 (and (bvsge (index!6697 lt!126490) #b00000000000000000000000000000000) (bvslt (index!6697 lt!126490) (size!6196 (_keys!6810 thiss!1504))))))

(assert (= (and d!61209 c!42558) b!252532))

(assert (= (and d!61209 (not c!42558)) b!252534))

(assert (= (and b!252532 res!123590) b!252529))

(assert (= (and b!252529 res!123589) b!252530))

(assert (= (and b!252534 c!42557) b!252533))

(assert (= (and b!252534 (not c!42557)) b!252535))

(assert (= (and b!252533 res!123592) b!252536))

(assert (= (and b!252536 res!123591) b!252531))

(assert (= (or b!252532 b!252533) bm!23790))

(assert (= (or b!252530 b!252531) bm!23791))

(declare-fun m!268145 () Bool)

(assert (=> bm!23790 m!268145))

(assert (=> bm!23791 m!267917))

(declare-fun m!268147 () Bool)

(assert (=> b!252529 m!268147))

(declare-fun m!268149 () Bool)

(assert (=> b!252536 m!268149))

(assert (=> d!61209 m!267913))

(declare-fun m!268151 () Bool)

(assert (=> d!61209 m!268151))

(assert (=> d!61209 m!267915))

(assert (=> b!252267 d!61209))

(declare-fun b!252549 () Bool)

(declare-fun e!163756 () SeekEntryResult!1131)

(declare-fun lt!126499 () SeekEntryResult!1131)

(assert (=> b!252549 (= e!163756 (Found!1131 (index!6696 lt!126499)))))

(declare-fun b!252550 () Bool)

(declare-fun e!163757 () SeekEntryResult!1131)

(assert (=> b!252550 (= e!163757 e!163756)))

(declare-fun lt!126498 () (_ BitVec 64))

(assert (=> b!252550 (= lt!126498 (select (arr!5848 (_keys!6810 thiss!1504)) (index!6696 lt!126499)))))

(declare-fun c!42567 () Bool)

(assert (=> b!252550 (= c!42567 (= lt!126498 key!932))))

(declare-fun b!252551 () Bool)

(declare-fun e!163755 () SeekEntryResult!1131)

(assert (=> b!252551 (= e!163755 (MissingZero!1131 (index!6696 lt!126499)))))

(declare-fun d!61211 () Bool)

(declare-fun lt!126497 () SeekEntryResult!1131)

(assert (=> d!61211 (and (or ((_ is Undefined!1131) lt!126497) (not ((_ is Found!1131) lt!126497)) (and (bvsge (index!6695 lt!126497) #b00000000000000000000000000000000) (bvslt (index!6695 lt!126497) (size!6196 (_keys!6810 thiss!1504))))) (or ((_ is Undefined!1131) lt!126497) ((_ is Found!1131) lt!126497) (not ((_ is MissingZero!1131) lt!126497)) (and (bvsge (index!6694 lt!126497) #b00000000000000000000000000000000) (bvslt (index!6694 lt!126497) (size!6196 (_keys!6810 thiss!1504))))) (or ((_ is Undefined!1131) lt!126497) ((_ is Found!1131) lt!126497) ((_ is MissingZero!1131) lt!126497) (not ((_ is MissingVacant!1131) lt!126497)) (and (bvsge (index!6697 lt!126497) #b00000000000000000000000000000000) (bvslt (index!6697 lt!126497) (size!6196 (_keys!6810 thiss!1504))))) (or ((_ is Undefined!1131) lt!126497) (ite ((_ is Found!1131) lt!126497) (= (select (arr!5848 (_keys!6810 thiss!1504)) (index!6695 lt!126497)) key!932) (ite ((_ is MissingZero!1131) lt!126497) (= (select (arr!5848 (_keys!6810 thiss!1504)) (index!6694 lt!126497)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1131) lt!126497) (= (select (arr!5848 (_keys!6810 thiss!1504)) (index!6697 lt!126497)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61211 (= lt!126497 e!163757)))

(declare-fun c!42566 () Bool)

(assert (=> d!61211 (= c!42566 (and ((_ is Intermediate!1131) lt!126499) (undefined!1943 lt!126499)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12341 (_ BitVec 32)) SeekEntryResult!1131)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61211 (= lt!126499 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10881 thiss!1504)) key!932 (_keys!6810 thiss!1504) (mask!10881 thiss!1504)))))

(assert (=> d!61211 (validMask!0 (mask!10881 thiss!1504))))

(assert (=> d!61211 (= (seekEntryOrOpen!0 key!932 (_keys!6810 thiss!1504) (mask!10881 thiss!1504)) lt!126497)))

(declare-fun b!252552 () Bool)

(assert (=> b!252552 (= e!163757 Undefined!1131)))

(declare-fun b!252553 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12341 (_ BitVec 32)) SeekEntryResult!1131)

(assert (=> b!252553 (= e!163755 (seekKeyOrZeroReturnVacant!0 (x!24768 lt!126499) (index!6696 lt!126499) (index!6696 lt!126499) key!932 (_keys!6810 thiss!1504) (mask!10881 thiss!1504)))))

(declare-fun b!252554 () Bool)

(declare-fun c!42565 () Bool)

(assert (=> b!252554 (= c!42565 (= lt!126498 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252554 (= e!163756 e!163755)))

(assert (= (and d!61211 c!42566) b!252552))

(assert (= (and d!61211 (not c!42566)) b!252550))

(assert (= (and b!252550 c!42567) b!252549))

(assert (= (and b!252550 (not c!42567)) b!252554))

(assert (= (and b!252554 c!42565) b!252551))

(assert (= (and b!252554 (not c!42565)) b!252553))

(declare-fun m!268153 () Bool)

(assert (=> b!252550 m!268153))

(declare-fun m!268155 () Bool)

(assert (=> d!61211 m!268155))

(declare-fun m!268157 () Bool)

(assert (=> d!61211 m!268157))

(declare-fun m!268159 () Bool)

(assert (=> d!61211 m!268159))

(declare-fun m!268161 () Bool)

(assert (=> d!61211 m!268161))

(assert (=> d!61211 m!267915))

(assert (=> d!61211 m!268159))

(declare-fun m!268163 () Bool)

(assert (=> d!61211 m!268163))

(declare-fun m!268165 () Bool)

(assert (=> b!252553 m!268165))

(assert (=> b!252257 d!61211))

(declare-fun d!61213 () Bool)

(declare-fun e!163760 () Bool)

(assert (=> d!61213 e!163760))

(declare-fun res!123597 () Bool)

(assert (=> d!61213 (=> (not res!123597) (not e!163760))))

(declare-fun lt!126504 () SeekEntryResult!1131)

(assert (=> d!61213 (= res!123597 ((_ is Found!1131) lt!126504))))

(assert (=> d!61213 (= lt!126504 (seekEntryOrOpen!0 key!932 (_keys!6810 thiss!1504) (mask!10881 thiss!1504)))))

(declare-fun lt!126505 () Unit!7788)

(declare-fun choose!1212 (array!12341 array!12339 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 64) Int) Unit!7788)

(assert (=> d!61213 (= lt!126505 (choose!1212 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 (defaultEntry!4663 thiss!1504)))))

(assert (=> d!61213 (validMask!0 (mask!10881 thiss!1504))))

(assert (=> d!61213 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!406 (_keys!6810 thiss!1504) (_values!4646 thiss!1504) (mask!10881 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 (defaultEntry!4663 thiss!1504)) lt!126505)))

(declare-fun b!252559 () Bool)

(declare-fun res!123598 () Bool)

(assert (=> b!252559 (=> (not res!123598) (not e!163760))))

(assert (=> b!252559 (= res!123598 (inRange!0 (index!6695 lt!126504) (mask!10881 thiss!1504)))))

(declare-fun b!252560 () Bool)

(assert (=> b!252560 (= e!163760 (= (select (arr!5848 (_keys!6810 thiss!1504)) (index!6695 lt!126504)) key!932))))

(assert (=> b!252560 (and (bvsge (index!6695 lt!126504) #b00000000000000000000000000000000) (bvslt (index!6695 lt!126504) (size!6196 (_keys!6810 thiss!1504))))))

(assert (= (and d!61213 res!123597) b!252559))

(assert (= (and b!252559 res!123598) b!252560))

(assert (=> d!61213 m!267913))

(declare-fun m!268167 () Bool)

(assert (=> d!61213 m!268167))

(assert (=> d!61213 m!267915))

(declare-fun m!268169 () Bool)

(assert (=> b!252559 m!268169))

(declare-fun m!268171 () Bool)

(assert (=> b!252560 m!268171))

(assert (=> b!252248 d!61213))

(declare-fun bm!23794 () Bool)

(declare-fun call!23797 () Bool)

(assert (=> bm!23794 (= call!23797 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!126339 (mask!10881 thiss!1504)))))

(declare-fun d!61215 () Bool)

(declare-fun res!123604 () Bool)

(declare-fun e!163768 () Bool)

(assert (=> d!61215 (=> res!123604 e!163768)))

(assert (=> d!61215 (= res!123604 (bvsge #b00000000000000000000000000000000 (size!6196 lt!126339)))))

(assert (=> d!61215 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126339 (mask!10881 thiss!1504)) e!163768)))

(declare-fun b!252569 () Bool)

(declare-fun e!163767 () Bool)

(assert (=> b!252569 (= e!163768 e!163767)))

(declare-fun c!42570 () Bool)

(assert (=> b!252569 (= c!42570 (validKeyInArray!0 (select (arr!5848 lt!126339) #b00000000000000000000000000000000)))))

(declare-fun b!252570 () Bool)

(declare-fun e!163769 () Bool)

(assert (=> b!252570 (= e!163769 call!23797)))

(declare-fun b!252571 () Bool)

(assert (=> b!252571 (= e!163767 e!163769)))

(declare-fun lt!126514 () (_ BitVec 64))

(assert (=> b!252571 (= lt!126514 (select (arr!5848 lt!126339) #b00000000000000000000000000000000))))

(declare-fun lt!126512 () Unit!7788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12341 (_ BitVec 64) (_ BitVec 32)) Unit!7788)

(assert (=> b!252571 (= lt!126512 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!126339 lt!126514 #b00000000000000000000000000000000))))

(assert (=> b!252571 (arrayContainsKey!0 lt!126339 lt!126514 #b00000000000000000000000000000000)))

(declare-fun lt!126513 () Unit!7788)

(assert (=> b!252571 (= lt!126513 lt!126512)))

(declare-fun res!123603 () Bool)

(assert (=> b!252571 (= res!123603 (= (seekEntryOrOpen!0 (select (arr!5848 lt!126339) #b00000000000000000000000000000000) lt!126339 (mask!10881 thiss!1504)) (Found!1131 #b00000000000000000000000000000000)))))

(assert (=> b!252571 (=> (not res!123603) (not e!163769))))

(declare-fun b!252572 () Bool)

(assert (=> b!252572 (= e!163767 call!23797)))

(assert (= (and d!61215 (not res!123604)) b!252569))

(assert (= (and b!252569 c!42570) b!252571))

(assert (= (and b!252569 (not c!42570)) b!252572))

(assert (= (and b!252571 res!123603) b!252570))

(assert (= (or b!252570 b!252572) bm!23794))

(declare-fun m!268173 () Bool)

(assert (=> bm!23794 m!268173))

(declare-fun m!268175 () Bool)

(assert (=> b!252569 m!268175))

(assert (=> b!252569 m!268175))

(declare-fun m!268177 () Bool)

(assert (=> b!252569 m!268177))

(assert (=> b!252571 m!268175))

(declare-fun m!268179 () Bool)

(assert (=> b!252571 m!268179))

(declare-fun m!268181 () Bool)

(assert (=> b!252571 m!268181))

(assert (=> b!252571 m!268175))

(declare-fun m!268183 () Bool)

(assert (=> b!252571 m!268183))

(assert (=> b!252264 d!61215))

(declare-fun b!252581 () Bool)

(declare-fun res!123614 () Bool)

(declare-fun e!163774 () Bool)

(assert (=> b!252581 (=> (not res!123614) (not e!163774))))

(assert (=> b!252581 (= res!123614 (not (validKeyInArray!0 (select (arr!5848 (_keys!6810 thiss!1504)) index!297))))))

(declare-fun d!61217 () Bool)

(declare-fun e!163775 () Bool)

(assert (=> d!61217 e!163775))

(declare-fun res!123616 () Bool)

(assert (=> d!61217 (=> (not res!123616) (not e!163775))))

(assert (=> d!61217 (= res!123616 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6196 (_keys!6810 thiss!1504)))))))

(declare-fun lt!126517 () Unit!7788)

(declare-fun choose!1 (array!12341 (_ BitVec 32) (_ BitVec 64)) Unit!7788)

(assert (=> d!61217 (= lt!126517 (choose!1 (_keys!6810 thiss!1504) index!297 key!932))))

(assert (=> d!61217 e!163774))

(declare-fun res!123615 () Bool)

(assert (=> d!61217 (=> (not res!123615) (not e!163774))))

(assert (=> d!61217 (= res!123615 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6196 (_keys!6810 thiss!1504)))))))

(assert (=> d!61217 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6810 thiss!1504) index!297 key!932) lt!126517)))

(declare-fun b!252583 () Bool)

(assert (=> b!252583 (= e!163774 (bvslt (size!6196 (_keys!6810 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!252584 () Bool)

(assert (=> b!252584 (= e!163775 (= (arrayCountValidKeys!0 (array!12342 (store (arr!5848 (_keys!6810 thiss!1504)) index!297 key!932) (size!6196 (_keys!6810 thiss!1504))) #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6810 thiss!1504) #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!252582 () Bool)

(declare-fun res!123613 () Bool)

(assert (=> b!252582 (=> (not res!123613) (not e!163774))))

(assert (=> b!252582 (= res!123613 (validKeyInArray!0 key!932))))

(assert (= (and d!61217 res!123615) b!252581))

(assert (= (and b!252581 res!123614) b!252582))

(assert (= (and b!252582 res!123613) b!252583))

(assert (= (and d!61217 res!123616) b!252584))

(declare-fun m!268185 () Bool)

(assert (=> b!252581 m!268185))

(assert (=> b!252581 m!268185))

(declare-fun m!268187 () Bool)

(assert (=> b!252581 m!268187))

(declare-fun m!268189 () Bool)

(assert (=> d!61217 m!268189))

(assert (=> b!252584 m!267929))

(declare-fun m!268191 () Bool)

(assert (=> b!252584 m!268191))

(assert (=> b!252584 m!267931))

(declare-fun m!268193 () Bool)

(assert (=> b!252582 m!268193))

(assert (=> b!252264 d!61217))

(declare-fun bm!23797 () Bool)

(declare-fun call!23800 () (_ BitVec 32))

(assert (=> bm!23797 (= call!23800 (arrayCountValidKeys!0 (_keys!6810 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6196 (_keys!6810 thiss!1504))))))

(declare-fun b!252593 () Bool)

(declare-fun e!163781 () (_ BitVec 32))

(assert (=> b!252593 (= e!163781 call!23800)))

(declare-fun b!252594 () Bool)

(declare-fun e!163780 () (_ BitVec 32))

(assert (=> b!252594 (= e!163780 e!163781)))

(declare-fun c!42576 () Bool)

(assert (=> b!252594 (= c!42576 (validKeyInArray!0 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252595 () Bool)

(assert (=> b!252595 (= e!163781 (bvadd #b00000000000000000000000000000001 call!23800))))

(declare-fun b!252596 () Bool)

(assert (=> b!252596 (= e!163780 #b00000000000000000000000000000000)))

(declare-fun d!61219 () Bool)

(declare-fun lt!126520 () (_ BitVec 32))

(assert (=> d!61219 (and (bvsge lt!126520 #b00000000000000000000000000000000) (bvsle lt!126520 (bvsub (size!6196 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61219 (= lt!126520 e!163780)))

(declare-fun c!42575 () Bool)

(assert (=> d!61219 (= c!42575 (bvsge #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))))))

(assert (=> d!61219 (and (bvsle #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6196 (_keys!6810 thiss!1504)) (size!6196 (_keys!6810 thiss!1504))))))

(assert (=> d!61219 (= (arrayCountValidKeys!0 (_keys!6810 thiss!1504) #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))) lt!126520)))

(assert (= (and d!61219 c!42575) b!252596))

(assert (= (and d!61219 (not c!42575)) b!252594))

(assert (= (and b!252594 c!42576) b!252595))

(assert (= (and b!252594 (not c!42576)) b!252593))

(assert (= (or b!252595 b!252593) bm!23797))

(declare-fun m!268195 () Bool)

(assert (=> bm!23797 m!268195))

(assert (=> b!252594 m!268077))

(assert (=> b!252594 m!268077))

(assert (=> b!252594 m!268129))

(assert (=> b!252264 d!61219))

(declare-fun d!61221 () Bool)

(assert (=> d!61221 (= (validMask!0 (mask!10881 thiss!1504)) (and (or (= (mask!10881 thiss!1504) #b00000000000000000000000000000111) (= (mask!10881 thiss!1504) #b00000000000000000000000000001111) (= (mask!10881 thiss!1504) #b00000000000000000000000000011111) (= (mask!10881 thiss!1504) #b00000000000000000000000000111111) (= (mask!10881 thiss!1504) #b00000000000000000000000001111111) (= (mask!10881 thiss!1504) #b00000000000000000000000011111111) (= (mask!10881 thiss!1504) #b00000000000000000000000111111111) (= (mask!10881 thiss!1504) #b00000000000000000000001111111111) (= (mask!10881 thiss!1504) #b00000000000000000000011111111111) (= (mask!10881 thiss!1504) #b00000000000000000000111111111111) (= (mask!10881 thiss!1504) #b00000000000000000001111111111111) (= (mask!10881 thiss!1504) #b00000000000000000011111111111111) (= (mask!10881 thiss!1504) #b00000000000000000111111111111111) (= (mask!10881 thiss!1504) #b00000000000000001111111111111111) (= (mask!10881 thiss!1504) #b00000000000000011111111111111111) (= (mask!10881 thiss!1504) #b00000000000000111111111111111111) (= (mask!10881 thiss!1504) #b00000000000001111111111111111111) (= (mask!10881 thiss!1504) #b00000000000011111111111111111111) (= (mask!10881 thiss!1504) #b00000000000111111111111111111111) (= (mask!10881 thiss!1504) #b00000000001111111111111111111111) (= (mask!10881 thiss!1504) #b00000000011111111111111111111111) (= (mask!10881 thiss!1504) #b00000000111111111111111111111111) (= (mask!10881 thiss!1504) #b00000001111111111111111111111111) (= (mask!10881 thiss!1504) #b00000011111111111111111111111111) (= (mask!10881 thiss!1504) #b00000111111111111111111111111111) (= (mask!10881 thiss!1504) #b00001111111111111111111111111111) (= (mask!10881 thiss!1504) #b00011111111111111111111111111111) (= (mask!10881 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10881 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!252264 d!61221))

(declare-fun bm!23798 () Bool)

(declare-fun call!23801 () (_ BitVec 32))

(assert (=> bm!23798 (= call!23801 (arrayCountValidKeys!0 lt!126339 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6196 (_keys!6810 thiss!1504))))))

(declare-fun b!252597 () Bool)

(declare-fun e!163783 () (_ BitVec 32))

(assert (=> b!252597 (= e!163783 call!23801)))

(declare-fun b!252598 () Bool)

(declare-fun e!163782 () (_ BitVec 32))

(assert (=> b!252598 (= e!163782 e!163783)))

(declare-fun c!42578 () Bool)

(assert (=> b!252598 (= c!42578 (validKeyInArray!0 (select (arr!5848 lt!126339) #b00000000000000000000000000000000)))))

(declare-fun b!252599 () Bool)

(assert (=> b!252599 (= e!163783 (bvadd #b00000000000000000000000000000001 call!23801))))

(declare-fun b!252600 () Bool)

(assert (=> b!252600 (= e!163782 #b00000000000000000000000000000000)))

(declare-fun d!61223 () Bool)

(declare-fun lt!126521 () (_ BitVec 32))

(assert (=> d!61223 (and (bvsge lt!126521 #b00000000000000000000000000000000) (bvsle lt!126521 (bvsub (size!6196 lt!126339) #b00000000000000000000000000000000)))))

(assert (=> d!61223 (= lt!126521 e!163782)))

(declare-fun c!42577 () Bool)

(assert (=> d!61223 (= c!42577 (bvsge #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))))))

(assert (=> d!61223 (and (bvsle #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6196 (_keys!6810 thiss!1504)) (size!6196 lt!126339)))))

(assert (=> d!61223 (= (arrayCountValidKeys!0 lt!126339 #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))) lt!126521)))

(assert (= (and d!61223 c!42577) b!252600))

(assert (= (and d!61223 (not c!42577)) b!252598))

(assert (= (and b!252598 c!42578) b!252599))

(assert (= (and b!252598 (not c!42578)) b!252597))

(assert (= (or b!252599 b!252597) bm!23798))

(declare-fun m!268197 () Bool)

(assert (=> bm!23798 m!268197))

(assert (=> b!252598 m!268175))

(assert (=> b!252598 m!268175))

(assert (=> b!252598 m!268177))

(assert (=> b!252264 d!61223))

(declare-fun b!252601 () Bool)

(declare-fun e!163784 () Bool)

(declare-fun call!23802 () Bool)

(assert (=> b!252601 (= e!163784 call!23802)))

(declare-fun bm!23799 () Bool)

(declare-fun c!42579 () Bool)

(assert (=> bm!23799 (= call!23802 (arrayNoDuplicates!0 lt!126339 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42579 (Cons!3720 (select (arr!5848 lt!126339) #b00000000000000000000000000000000) Nil!3721) Nil!3721)))))

(declare-fun b!252602 () Bool)

(declare-fun e!163787 () Bool)

(assert (=> b!252602 (= e!163787 e!163784)))

(assert (=> b!252602 (= c!42579 (validKeyInArray!0 (select (arr!5848 lt!126339) #b00000000000000000000000000000000)))))

(declare-fun d!61225 () Bool)

(declare-fun res!123619 () Bool)

(declare-fun e!163786 () Bool)

(assert (=> d!61225 (=> res!123619 e!163786)))

(assert (=> d!61225 (= res!123619 (bvsge #b00000000000000000000000000000000 (size!6196 lt!126339)))))

(assert (=> d!61225 (= (arrayNoDuplicates!0 lt!126339 #b00000000000000000000000000000000 Nil!3721) e!163786)))

(declare-fun b!252603 () Bool)

(assert (=> b!252603 (= e!163784 call!23802)))

(declare-fun b!252604 () Bool)

(assert (=> b!252604 (= e!163786 e!163787)))

(declare-fun res!123617 () Bool)

(assert (=> b!252604 (=> (not res!123617) (not e!163787))))

(declare-fun e!163785 () Bool)

(assert (=> b!252604 (= res!123617 (not e!163785))))

(declare-fun res!123618 () Bool)

(assert (=> b!252604 (=> (not res!123618) (not e!163785))))

(assert (=> b!252604 (= res!123618 (validKeyInArray!0 (select (arr!5848 lt!126339) #b00000000000000000000000000000000)))))

(declare-fun b!252605 () Bool)

(assert (=> b!252605 (= e!163785 (contains!1812 Nil!3721 (select (arr!5848 lt!126339) #b00000000000000000000000000000000)))))

(assert (= (and d!61225 (not res!123619)) b!252604))

(assert (= (and b!252604 res!123618) b!252605))

(assert (= (and b!252604 res!123617) b!252602))

(assert (= (and b!252602 c!42579) b!252603))

(assert (= (and b!252602 (not c!42579)) b!252601))

(assert (= (or b!252603 b!252601) bm!23799))

(assert (=> bm!23799 m!268175))

(declare-fun m!268199 () Bool)

(assert (=> bm!23799 m!268199))

(assert (=> b!252602 m!268175))

(assert (=> b!252602 m!268175))

(assert (=> b!252602 m!268177))

(assert (=> b!252604 m!268175))

(assert (=> b!252604 m!268175))

(assert (=> b!252604 m!268177))

(assert (=> b!252605 m!268175))

(assert (=> b!252605 m!268175))

(declare-fun m!268201 () Bool)

(assert (=> b!252605 m!268201))

(assert (=> b!252264 d!61225))

(declare-fun d!61227 () Bool)

(declare-fun e!163790 () Bool)

(assert (=> d!61227 e!163790))

(declare-fun res!123622 () Bool)

(assert (=> d!61227 (=> (not res!123622) (not e!163790))))

(assert (=> d!61227 (= res!123622 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6196 (_keys!6810 thiss!1504)))))))

(declare-fun lt!126524 () Unit!7788)

(declare-fun choose!41 (array!12341 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3724) Unit!7788)

(assert (=> d!61227 (= lt!126524 (choose!41 (_keys!6810 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3721))))

(assert (=> d!61227 (bvslt (size!6196 (_keys!6810 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61227 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6810 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3721) lt!126524)))

(declare-fun b!252608 () Bool)

(assert (=> b!252608 (= e!163790 (arrayNoDuplicates!0 (array!12342 (store (arr!5848 (_keys!6810 thiss!1504)) index!297 key!932) (size!6196 (_keys!6810 thiss!1504))) #b00000000000000000000000000000000 Nil!3721))))

(assert (= (and d!61227 res!123622) b!252608))

(declare-fun m!268203 () Bool)

(assert (=> d!61227 m!268203))

(assert (=> b!252608 m!267929))

(declare-fun m!268205 () Bool)

(assert (=> b!252608 m!268205))

(assert (=> b!252264 d!61227))

(assert (=> b!252264 d!61203))

(declare-fun d!61229 () Bool)

(declare-fun e!163793 () Bool)

(assert (=> d!61229 e!163793))

(declare-fun res!123625 () Bool)

(assert (=> d!61229 (=> (not res!123625) (not e!163793))))

(assert (=> d!61229 (= res!123625 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6196 (_keys!6810 thiss!1504)))))))

(declare-fun lt!126527 () Unit!7788)

(declare-fun choose!102 ((_ BitVec 64) array!12341 (_ BitVec 32) (_ BitVec 32)) Unit!7788)

(assert (=> d!61229 (= lt!126527 (choose!102 key!932 (_keys!6810 thiss!1504) index!297 (mask!10881 thiss!1504)))))

(assert (=> d!61229 (validMask!0 (mask!10881 thiss!1504))))

(assert (=> d!61229 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6810 thiss!1504) index!297 (mask!10881 thiss!1504)) lt!126527)))

(declare-fun b!252611 () Bool)

(assert (=> b!252611 (= e!163793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12342 (store (arr!5848 (_keys!6810 thiss!1504)) index!297 key!932) (size!6196 (_keys!6810 thiss!1504))) (mask!10881 thiss!1504)))))

(assert (= (and d!61229 res!123625) b!252611))

(declare-fun m!268207 () Bool)

(assert (=> d!61229 m!268207))

(assert (=> d!61229 m!267915))

(assert (=> b!252611 m!267929))

(declare-fun m!268209 () Bool)

(assert (=> b!252611 m!268209))

(assert (=> b!252264 d!61229))

(declare-fun bm!23800 () Bool)

(declare-fun call!23803 () Bool)

(assert (=> bm!23800 (= call!23803 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6810 thiss!1504) (mask!10881 thiss!1504)))))

(declare-fun d!61231 () Bool)

(declare-fun res!123627 () Bool)

(declare-fun e!163795 () Bool)

(assert (=> d!61231 (=> res!123627 e!163795)))

(assert (=> d!61231 (= res!123627 (bvsge #b00000000000000000000000000000000 (size!6196 (_keys!6810 thiss!1504))))))

(assert (=> d!61231 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6810 thiss!1504) (mask!10881 thiss!1504)) e!163795)))

(declare-fun b!252612 () Bool)

(declare-fun e!163794 () Bool)

(assert (=> b!252612 (= e!163795 e!163794)))

(declare-fun c!42580 () Bool)

(assert (=> b!252612 (= c!42580 (validKeyInArray!0 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252613 () Bool)

(declare-fun e!163796 () Bool)

(assert (=> b!252613 (= e!163796 call!23803)))

(declare-fun b!252614 () Bool)

(assert (=> b!252614 (= e!163794 e!163796)))

(declare-fun lt!126530 () (_ BitVec 64))

(assert (=> b!252614 (= lt!126530 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126528 () Unit!7788)

(assert (=> b!252614 (= lt!126528 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6810 thiss!1504) lt!126530 #b00000000000000000000000000000000))))

(assert (=> b!252614 (arrayContainsKey!0 (_keys!6810 thiss!1504) lt!126530 #b00000000000000000000000000000000)))

(declare-fun lt!126529 () Unit!7788)

(assert (=> b!252614 (= lt!126529 lt!126528)))

(declare-fun res!123626 () Bool)

(assert (=> b!252614 (= res!123626 (= (seekEntryOrOpen!0 (select (arr!5848 (_keys!6810 thiss!1504)) #b00000000000000000000000000000000) (_keys!6810 thiss!1504) (mask!10881 thiss!1504)) (Found!1131 #b00000000000000000000000000000000)))))

(assert (=> b!252614 (=> (not res!123626) (not e!163796))))

(declare-fun b!252615 () Bool)

(assert (=> b!252615 (= e!163794 call!23803)))

(assert (= (and d!61231 (not res!123627)) b!252612))

(assert (= (and b!252612 c!42580) b!252614))

(assert (= (and b!252612 (not c!42580)) b!252615))

(assert (= (and b!252614 res!123626) b!252613))

(assert (= (or b!252613 b!252615) bm!23800))

(declare-fun m!268211 () Bool)

(assert (=> bm!23800 m!268211))

(assert (=> b!252612 m!268077))

(assert (=> b!252612 m!268077))

(assert (=> b!252612 m!268129))

(assert (=> b!252614 m!268077))

(declare-fun m!268213 () Bool)

(assert (=> b!252614 m!268213))

(declare-fun m!268215 () Bool)

(assert (=> b!252614 m!268215))

(assert (=> b!252614 m!268077))

(declare-fun m!268217 () Bool)

(assert (=> b!252614 m!268217))

(assert (=> b!252255 d!61231))

(declare-fun mapIsEmpty!11082 () Bool)

(declare-fun mapRes!11082 () Bool)

(assert (=> mapIsEmpty!11082 mapRes!11082))

(declare-fun condMapEmpty!11082 () Bool)

(declare-fun mapDefault!11082 () ValueCell!2912)

(assert (=> mapNonEmpty!11073 (= condMapEmpty!11082 (= mapRest!11073 ((as const (Array (_ BitVec 32) ValueCell!2912)) mapDefault!11082)))))

(declare-fun e!163801 () Bool)

(assert (=> mapNonEmpty!11073 (= tp!23225 (and e!163801 mapRes!11082))))

(declare-fun mapNonEmpty!11082 () Bool)

(declare-fun tp!23241 () Bool)

(declare-fun e!163802 () Bool)

(assert (=> mapNonEmpty!11082 (= mapRes!11082 (and tp!23241 e!163802))))

(declare-fun mapValue!11082 () ValueCell!2912)

(declare-fun mapKey!11082 () (_ BitVec 32))

(declare-fun mapRest!11082 () (Array (_ BitVec 32) ValueCell!2912))

(assert (=> mapNonEmpty!11082 (= mapRest!11073 (store mapRest!11082 mapKey!11082 mapValue!11082))))

(declare-fun b!252622 () Bool)

(assert (=> b!252622 (= e!163802 tp_is_empty!6511)))

(declare-fun b!252623 () Bool)

(assert (=> b!252623 (= e!163801 tp_is_empty!6511)))

(assert (= (and mapNonEmpty!11073 condMapEmpty!11082) mapIsEmpty!11082))

(assert (= (and mapNonEmpty!11073 (not condMapEmpty!11082)) mapNonEmpty!11082))

(assert (= (and mapNonEmpty!11082 ((_ is ValueCellFull!2912) mapValue!11082)) b!252622))

(assert (= (and mapNonEmpty!11073 ((_ is ValueCellFull!2912) mapDefault!11082)) b!252623))

(declare-fun m!268219 () Bool)

(assert (=> mapNonEmpty!11082 m!268219))

(declare-fun b_lambda!8103 () Bool)

(assert (= b_lambda!8101 (or (and b!252252 b_free!6649) b_lambda!8103)))

(check-sat (not b!252497) (not b!252611) (not b!252602) b_and!13665 (not d!61229) (not b!252605) (not bm!23794) (not d!61213) (not b!252582) (not b_lambda!8103) (not b!252505) (not b!252559) (not d!61211) (not b!252598) (not b!252464) (not b!252460) (not bm!23797) (not b!252594) (not d!61191) (not b!252415) tp_is_empty!6511 (not b!252584) (not b_next!6649) (not bm!23782) (not b!252480) (not b!252553) (not b!252468) (not bm!23800) (not b!252581) (not bm!23790) (not bm!23777) (not bm!23791) (not b!252504) (not b!252608) (not b!252604) (not b!252477) (not b!252417) (not bm!23778) (not mapNonEmpty!11082) (not d!61227) (not b!252512) (not b!252469) (not d!61217) (not b!252614) (not bm!23798) (not d!61193) (not b!252496) (not d!61209) (not b!252472) (not b!252461) (not b!252506) (not b!252612) (not bm!23799) (not b!252569) (not bm!23779) (not b!252494) (not b!252571) (not d!61195) (not d!61199) (not bm!23785))
(check-sat b_and!13665 (not b_next!6649))
