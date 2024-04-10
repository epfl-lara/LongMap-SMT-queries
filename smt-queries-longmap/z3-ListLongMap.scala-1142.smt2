; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23620 () Bool)

(assert start!23620)

(declare-fun b!248304 () Bool)

(declare-fun b_free!6603 () Bool)

(declare-fun b_next!6603 () Bool)

(assert (=> b!248304 (= b_free!6603 (not b_next!6603))))

(declare-fun tp!23059 () Bool)

(declare-fun b_and!13607 () Bool)

(assert (=> b!248304 (= tp!23059 b_and!13607)))

(declare-fun e!161066 () Bool)

(declare-fun tp_is_empty!6465 () Bool)

(declare-datatypes ((V!8267 0))(
  ( (V!8268 (val!3277 Int)) )
))
(declare-datatypes ((ValueCell!2889 0))(
  ( (ValueCellFull!2889 (v!5336 V!8267)) (EmptyCell!2889) )
))
(declare-datatypes ((array!12239 0))(
  ( (array!12240 (arr!5806 (Array (_ BitVec 32) ValueCell!2889)) (size!6149 (_ BitVec 32))) )
))
(declare-datatypes ((array!12241 0))(
  ( (array!12242 (arr!5807 (Array (_ BitVec 32) (_ BitVec 64))) (size!6150 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3678 0))(
  ( (LongMapFixedSize!3679 (defaultEntry!4592 Int) (mask!10740 (_ BitVec 32)) (extraKeys!4329 (_ BitVec 32)) (zeroValue!4433 V!8267) (minValue!4433 V!8267) (_size!1888 (_ BitVec 32)) (_keys!6716 array!12241) (_values!4575 array!12239) (_vacant!1888 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3678)

(declare-fun e!161065 () Bool)

(declare-fun array_inv!3833 (array!12241) Bool)

(declare-fun array_inv!3834 (array!12239) Bool)

(assert (=> b!248304 (= e!161066 (and tp!23059 tp_is_empty!6465 (array_inv!3833 (_keys!6716 thiss!1504)) (array_inv!3834 (_values!4575 thiss!1504)) e!161065))))

(declare-fun res!121694 () Bool)

(declare-fun e!161074 () Bool)

(assert (=> start!23620 (=> (not res!121694) (not e!161074))))

(declare-fun valid!1439 (LongMapFixedSize!3678) Bool)

(assert (=> start!23620 (= res!121694 (valid!1439 thiss!1504))))

(assert (=> start!23620 e!161074))

(assert (=> start!23620 e!161066))

(assert (=> start!23620 true))

(declare-fun b!248305 () Bool)

(declare-fun e!161064 () Bool)

(declare-fun e!161069 () Bool)

(assert (=> b!248305 (= e!161064 e!161069)))

(declare-fun res!121701 () Bool)

(declare-fun call!23268 () Bool)

(assert (=> b!248305 (= res!121701 call!23268)))

(assert (=> b!248305 (=> (not res!121701) (not e!161069))))

(declare-fun b!248306 () Bool)

(declare-fun e!161061 () Bool)

(declare-fun call!23267 () Bool)

(assert (=> b!248306 (= e!161061 (not call!23267))))

(declare-fun b!248307 () Bool)

(declare-fun e!161075 () Bool)

(assert (=> b!248307 (= e!161074 e!161075)))

(declare-fun res!121699 () Bool)

(assert (=> b!248307 (=> (not res!121699) (not e!161075))))

(declare-datatypes ((SeekEntryResult!1110 0))(
  ( (MissingZero!1110 (index!6610 (_ BitVec 32))) (Found!1110 (index!6611 (_ BitVec 32))) (Intermediate!1110 (undefined!1922 Bool) (index!6612 (_ BitVec 32)) (x!24572 (_ BitVec 32))) (Undefined!1110) (MissingVacant!1110 (index!6613 (_ BitVec 32))) )
))
(declare-fun lt!124337 () SeekEntryResult!1110)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!248307 (= res!121699 (or (= lt!124337 (MissingZero!1110 index!297)) (= lt!124337 (MissingVacant!1110 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12241 (_ BitVec 32)) SeekEntryResult!1110)

(assert (=> b!248307 (= lt!124337 (seekEntryOrOpen!0 key!932 (_keys!6716 thiss!1504) (mask!10740 thiss!1504)))))

(declare-fun b!248308 () Bool)

(declare-fun res!121692 () Bool)

(assert (=> b!248308 (= res!121692 (= (select (arr!5807 (_keys!6716 thiss!1504)) (index!6613 lt!124337)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248308 (=> (not res!121692) (not e!161069))))

(declare-fun b!248309 () Bool)

(declare-datatypes ((Unit!7686 0))(
  ( (Unit!7687) )
))
(declare-fun e!161070 () Unit!7686)

(declare-fun Unit!7688 () Unit!7686)

(assert (=> b!248309 (= e!161070 Unit!7688)))

(declare-fun lt!124334 () Unit!7686)

(declare-fun lemmaArrayContainsKeyThenInListMap!192 (array!12241 array!12239 (_ BitVec 32) (_ BitVec 32) V!8267 V!8267 (_ BitVec 64) (_ BitVec 32) Int) Unit!7686)

(assert (=> b!248309 (= lt!124334 (lemmaArrayContainsKeyThenInListMap!192 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504)))))

(assert (=> b!248309 false))

(declare-fun b!248310 () Bool)

(declare-fun e!161063 () Bool)

(declare-fun e!161073 () Bool)

(assert (=> b!248310 (= e!161063 (not e!161073))))

(declare-fun res!121695 () Bool)

(assert (=> b!248310 (=> res!121695 e!161073)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!248310 (= res!121695 (not (validMask!0 (mask!10740 thiss!1504))))))

(declare-fun lt!124335 () array!12241)

(declare-fun arrayCountValidKeys!0 (array!12241 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!248310 (= (arrayCountValidKeys!0 lt!124335 #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6716 thiss!1504) #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504)))))))

(declare-fun lt!124336 () Unit!7686)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12241 (_ BitVec 32) (_ BitVec 64)) Unit!7686)

(assert (=> b!248310 (= lt!124336 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6716 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3703 0))(
  ( (Nil!3700) (Cons!3699 (h!4357 (_ BitVec 64)) (t!8728 List!3703)) )
))
(declare-fun arrayNoDuplicates!0 (array!12241 (_ BitVec 32) List!3703) Bool)

(assert (=> b!248310 (arrayNoDuplicates!0 lt!124335 #b00000000000000000000000000000000 Nil!3700)))

(assert (=> b!248310 (= lt!124335 (array!12242 (store (arr!5807 (_keys!6716 thiss!1504)) index!297 key!932) (size!6150 (_keys!6716 thiss!1504))))))

(declare-fun lt!124333 () Unit!7686)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12241 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3703) Unit!7686)

(assert (=> b!248310 (= lt!124333 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6716 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3700))))

(declare-fun lt!124342 () Unit!7686)

(assert (=> b!248310 (= lt!124342 e!161070)))

(declare-fun c!41593 () Bool)

(declare-fun lt!124339 () Bool)

(assert (=> b!248310 (= c!41593 lt!124339)))

(declare-fun arrayContainsKey!0 (array!12241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!248310 (= lt!124339 (arrayContainsKey!0 (_keys!6716 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248311 () Bool)

(declare-fun res!121693 () Bool)

(assert (=> b!248311 (=> res!121693 e!161073)))

(assert (=> b!248311 (= res!121693 (or (not (= (size!6150 (_keys!6716 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10740 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6150 (_keys!6716 thiss!1504)))))))

(declare-fun b!248312 () Bool)

(declare-fun res!121696 () Bool)

(assert (=> b!248312 (=> (not res!121696) (not e!161074))))

(assert (=> b!248312 (= res!121696 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!248313 () Bool)

(declare-fun e!161072 () Unit!7686)

(declare-fun lt!124341 () Unit!7686)

(assert (=> b!248313 (= e!161072 lt!124341)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!392 (array!12241 array!12239 (_ BitVec 32) (_ BitVec 32) V!8267 V!8267 (_ BitVec 64) Int) Unit!7686)

(assert (=> b!248313 (= lt!124341 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!392 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) key!932 (defaultEntry!4592 thiss!1504)))))

(declare-fun c!41595 () Bool)

(get-info :version)

(assert (=> b!248313 (= c!41595 ((_ is MissingZero!1110) lt!124337))))

(declare-fun e!161071 () Bool)

(assert (=> b!248313 e!161071))

(declare-fun mapIsEmpty!10976 () Bool)

(declare-fun mapRes!10976 () Bool)

(assert (=> mapIsEmpty!10976 mapRes!10976))

(declare-fun b!248314 () Bool)

(declare-fun Unit!7689 () Unit!7686)

(assert (=> b!248314 (= e!161072 Unit!7689)))

(declare-fun lt!124338 () Unit!7686)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!388 (array!12241 array!12239 (_ BitVec 32) (_ BitVec 32) V!8267 V!8267 (_ BitVec 64) Int) Unit!7686)

(assert (=> b!248314 (= lt!124338 (lemmaInListMapThenSeekEntryOrOpenFindsIt!388 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) key!932 (defaultEntry!4592 thiss!1504)))))

(assert (=> b!248314 false))

(declare-fun b!248315 () Bool)

(declare-fun res!121691 () Bool)

(assert (=> b!248315 (=> res!121691 e!161073)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!248315 (= res!121691 (not (validKeyInArray!0 key!932)))))

(declare-fun b!248316 () Bool)

(declare-fun e!161062 () Bool)

(assert (=> b!248316 (= e!161062 tp_is_empty!6465)))

(declare-fun bm!23264 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23264 (= call!23268 (inRange!0 (ite c!41595 (index!6610 lt!124337) (index!6613 lt!124337)) (mask!10740 thiss!1504)))))

(declare-fun b!248317 () Bool)

(declare-fun res!121697 () Bool)

(assert (=> b!248317 (=> (not res!121697) (not e!161061))))

(assert (=> b!248317 (= res!121697 call!23268)))

(assert (=> b!248317 (= e!161071 e!161061)))

(declare-fun b!248318 () Bool)

(assert (=> b!248318 (= e!161075 e!161063)))

(declare-fun res!121690 () Bool)

(assert (=> b!248318 (=> (not res!121690) (not e!161063))))

(assert (=> b!248318 (= res!121690 (inRange!0 index!297 (mask!10740 thiss!1504)))))

(declare-fun lt!124340 () Unit!7686)

(assert (=> b!248318 (= lt!124340 e!161072)))

(declare-fun c!41596 () Bool)

(declare-datatypes ((tuple2!4822 0))(
  ( (tuple2!4823 (_1!2422 (_ BitVec 64)) (_2!2422 V!8267)) )
))
(declare-datatypes ((List!3704 0))(
  ( (Nil!3701) (Cons!3700 (h!4358 tuple2!4822) (t!8729 List!3704)) )
))
(declare-datatypes ((ListLongMap!3735 0))(
  ( (ListLongMap!3736 (toList!1883 List!3704)) )
))
(declare-fun contains!1798 (ListLongMap!3735 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1411 (array!12241 array!12239 (_ BitVec 32) (_ BitVec 32) V!8267 V!8267 (_ BitVec 32) Int) ListLongMap!3735)

(assert (=> b!248318 (= c!41596 (contains!1798 (getCurrentListMap!1411 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504)) key!932))))

(declare-fun b!248319 () Bool)

(declare-fun res!121702 () Bool)

(assert (=> b!248319 (=> res!121702 e!161073)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12241 (_ BitVec 32)) Bool)

(assert (=> b!248319 (= res!121702 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6716 thiss!1504) (mask!10740 thiss!1504))))))

(declare-fun b!248320 () Bool)

(declare-fun res!121698 () Bool)

(assert (=> b!248320 (=> (not res!121698) (not e!161061))))

(assert (=> b!248320 (= res!121698 (= (select (arr!5807 (_keys!6716 thiss!1504)) (index!6610 lt!124337)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248321 () Bool)

(assert (=> b!248321 (= e!161073 (arrayNoDuplicates!0 (_keys!6716 thiss!1504) #b00000000000000000000000000000000 Nil!3700))))

(declare-fun b!248322 () Bool)

(declare-fun e!161068 () Bool)

(assert (=> b!248322 (= e!161065 (and e!161068 mapRes!10976))))

(declare-fun condMapEmpty!10976 () Bool)

(declare-fun mapDefault!10976 () ValueCell!2889)

(assert (=> b!248322 (= condMapEmpty!10976 (= (arr!5806 (_values!4575 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2889)) mapDefault!10976)))))

(declare-fun b!248323 () Bool)

(assert (=> b!248323 (= e!161069 (not call!23267))))

(declare-fun b!248324 () Bool)

(declare-fun c!41594 () Bool)

(assert (=> b!248324 (= c!41594 ((_ is MissingVacant!1110) lt!124337))))

(assert (=> b!248324 (= e!161071 e!161064)))

(declare-fun b!248325 () Bool)

(assert (=> b!248325 (= e!161064 ((_ is Undefined!1110) lt!124337))))

(declare-fun b!248326 () Bool)

(declare-fun Unit!7690 () Unit!7686)

(assert (=> b!248326 (= e!161070 Unit!7690)))

(declare-fun b!248327 () Bool)

(declare-fun res!121700 () Bool)

(assert (=> b!248327 (=> res!121700 e!161073)))

(assert (=> b!248327 (= res!121700 lt!124339)))

(declare-fun b!248328 () Bool)

(assert (=> b!248328 (= e!161068 tp_is_empty!6465)))

(declare-fun bm!23265 () Bool)

(assert (=> bm!23265 (= call!23267 (arrayContainsKey!0 (_keys!6716 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10976 () Bool)

(declare-fun tp!23060 () Bool)

(assert (=> mapNonEmpty!10976 (= mapRes!10976 (and tp!23060 e!161062))))

(declare-fun mapKey!10976 () (_ BitVec 32))

(declare-fun mapRest!10976 () (Array (_ BitVec 32) ValueCell!2889))

(declare-fun mapValue!10976 () ValueCell!2889)

(assert (=> mapNonEmpty!10976 (= (arr!5806 (_values!4575 thiss!1504)) (store mapRest!10976 mapKey!10976 mapValue!10976))))

(assert (= (and start!23620 res!121694) b!248312))

(assert (= (and b!248312 res!121696) b!248307))

(assert (= (and b!248307 res!121699) b!248318))

(assert (= (and b!248318 c!41596) b!248314))

(assert (= (and b!248318 (not c!41596)) b!248313))

(assert (= (and b!248313 c!41595) b!248317))

(assert (= (and b!248313 (not c!41595)) b!248324))

(assert (= (and b!248317 res!121697) b!248320))

(assert (= (and b!248320 res!121698) b!248306))

(assert (= (and b!248324 c!41594) b!248305))

(assert (= (and b!248324 (not c!41594)) b!248325))

(assert (= (and b!248305 res!121701) b!248308))

(assert (= (and b!248308 res!121692) b!248323))

(assert (= (or b!248317 b!248305) bm!23264))

(assert (= (or b!248306 b!248323) bm!23265))

(assert (= (and b!248318 res!121690) b!248310))

(assert (= (and b!248310 c!41593) b!248309))

(assert (= (and b!248310 (not c!41593)) b!248326))

(assert (= (and b!248310 (not res!121695)) b!248311))

(assert (= (and b!248311 (not res!121693)) b!248315))

(assert (= (and b!248315 (not res!121691)) b!248327))

(assert (= (and b!248327 (not res!121700)) b!248319))

(assert (= (and b!248319 (not res!121702)) b!248321))

(assert (= (and b!248322 condMapEmpty!10976) mapIsEmpty!10976))

(assert (= (and b!248322 (not condMapEmpty!10976)) mapNonEmpty!10976))

(assert (= (and mapNonEmpty!10976 ((_ is ValueCellFull!2889) mapValue!10976)) b!248316))

(assert (= (and b!248322 ((_ is ValueCellFull!2889) mapDefault!10976)) b!248328))

(assert (= b!248304 b!248322))

(assert (= start!23620 b!248304))

(declare-fun m!265087 () Bool)

(assert (=> b!248308 m!265087))

(declare-fun m!265089 () Bool)

(assert (=> b!248321 m!265089))

(declare-fun m!265091 () Bool)

(assert (=> bm!23264 m!265091))

(declare-fun m!265093 () Bool)

(assert (=> b!248307 m!265093))

(declare-fun m!265095 () Bool)

(assert (=> b!248319 m!265095))

(declare-fun m!265097 () Bool)

(assert (=> b!248309 m!265097))

(declare-fun m!265099 () Bool)

(assert (=> b!248310 m!265099))

(declare-fun m!265101 () Bool)

(assert (=> b!248310 m!265101))

(declare-fun m!265103 () Bool)

(assert (=> b!248310 m!265103))

(declare-fun m!265105 () Bool)

(assert (=> b!248310 m!265105))

(declare-fun m!265107 () Bool)

(assert (=> b!248310 m!265107))

(declare-fun m!265109 () Bool)

(assert (=> b!248310 m!265109))

(declare-fun m!265111 () Bool)

(assert (=> b!248310 m!265111))

(declare-fun m!265113 () Bool)

(assert (=> b!248310 m!265113))

(declare-fun m!265115 () Bool)

(assert (=> b!248318 m!265115))

(declare-fun m!265117 () Bool)

(assert (=> b!248318 m!265117))

(assert (=> b!248318 m!265117))

(declare-fun m!265119 () Bool)

(assert (=> b!248318 m!265119))

(declare-fun m!265121 () Bool)

(assert (=> start!23620 m!265121))

(declare-fun m!265123 () Bool)

(assert (=> b!248320 m!265123))

(declare-fun m!265125 () Bool)

(assert (=> b!248313 m!265125))

(declare-fun m!265127 () Bool)

(assert (=> b!248304 m!265127))

(declare-fun m!265129 () Bool)

(assert (=> b!248304 m!265129))

(declare-fun m!265131 () Bool)

(assert (=> mapNonEmpty!10976 m!265131))

(declare-fun m!265133 () Bool)

(assert (=> b!248315 m!265133))

(declare-fun m!265135 () Bool)

(assert (=> b!248314 m!265135))

(assert (=> bm!23265 m!265101))

(check-sat b_and!13607 (not b!248313) (not mapNonEmpty!10976) (not b!248309) (not bm!23265) (not b!248321) (not b!248310) (not bm!23264) tp_is_empty!6465 (not b!248318) (not start!23620) (not b!248319) (not b!248315) (not b!248307) (not b!248314) (not b!248304) (not b_next!6603))
(check-sat b_and!13607 (not b_next!6603))
(get-model)

(declare-fun d!60525 () Bool)

(declare-fun e!161123 () Bool)

(assert (=> d!60525 e!161123))

(declare-fun res!121747 () Bool)

(assert (=> d!60525 (=> (not res!121747) (not e!161123))))

(declare-fun lt!124377 () SeekEntryResult!1110)

(assert (=> d!60525 (= res!121747 ((_ is Found!1110) lt!124377))))

(assert (=> d!60525 (= lt!124377 (seekEntryOrOpen!0 key!932 (_keys!6716 thiss!1504) (mask!10740 thiss!1504)))))

(declare-fun lt!124378 () Unit!7686)

(declare-fun choose!1167 (array!12241 array!12239 (_ BitVec 32) (_ BitVec 32) V!8267 V!8267 (_ BitVec 64) Int) Unit!7686)

(assert (=> d!60525 (= lt!124378 (choose!1167 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) key!932 (defaultEntry!4592 thiss!1504)))))

(assert (=> d!60525 (validMask!0 (mask!10740 thiss!1504))))

(assert (=> d!60525 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!388 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) key!932 (defaultEntry!4592 thiss!1504)) lt!124378)))

(declare-fun b!248408 () Bool)

(declare-fun res!121746 () Bool)

(assert (=> b!248408 (=> (not res!121746) (not e!161123))))

(assert (=> b!248408 (= res!121746 (inRange!0 (index!6611 lt!124377) (mask!10740 thiss!1504)))))

(declare-fun b!248409 () Bool)

(assert (=> b!248409 (= e!161123 (= (select (arr!5807 (_keys!6716 thiss!1504)) (index!6611 lt!124377)) key!932))))

(assert (=> b!248409 (and (bvsge (index!6611 lt!124377) #b00000000000000000000000000000000) (bvslt (index!6611 lt!124377) (size!6150 (_keys!6716 thiss!1504))))))

(assert (= (and d!60525 res!121747) b!248408))

(assert (= (and b!248408 res!121746) b!248409))

(assert (=> d!60525 m!265093))

(declare-fun m!265187 () Bool)

(assert (=> d!60525 m!265187))

(assert (=> d!60525 m!265099))

(declare-fun m!265189 () Bool)

(assert (=> b!248408 m!265189))

(declare-fun m!265191 () Bool)

(assert (=> b!248409 m!265191))

(assert (=> b!248314 d!60525))

(declare-fun d!60527 () Bool)

(assert (=> d!60527 (= (array_inv!3833 (_keys!6716 thiss!1504)) (bvsge (size!6150 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248304 d!60527))

(declare-fun d!60529 () Bool)

(assert (=> d!60529 (= (array_inv!3834 (_values!4575 thiss!1504)) (bvsge (size!6149 (_values!4575 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248304 d!60529))

(declare-fun d!60531 () Bool)

(assert (=> d!60531 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!248315 d!60531))

(declare-fun e!161132 () SeekEntryResult!1110)

(declare-fun lt!124387 () SeekEntryResult!1110)

(declare-fun b!248422 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12241 (_ BitVec 32)) SeekEntryResult!1110)

(assert (=> b!248422 (= e!161132 (seekKeyOrZeroReturnVacant!0 (x!24572 lt!124387) (index!6612 lt!124387) (index!6612 lt!124387) key!932 (_keys!6716 thiss!1504) (mask!10740 thiss!1504)))))

(declare-fun b!248423 () Bool)

(assert (=> b!248423 (= e!161132 (MissingZero!1110 (index!6612 lt!124387)))))

(declare-fun b!248424 () Bool)

(declare-fun c!41616 () Bool)

(declare-fun lt!124385 () (_ BitVec 64))

(assert (=> b!248424 (= c!41616 (= lt!124385 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161131 () SeekEntryResult!1110)

(assert (=> b!248424 (= e!161131 e!161132)))

(declare-fun d!60533 () Bool)

(declare-fun lt!124386 () SeekEntryResult!1110)

(assert (=> d!60533 (and (or ((_ is Undefined!1110) lt!124386) (not ((_ is Found!1110) lt!124386)) (and (bvsge (index!6611 lt!124386) #b00000000000000000000000000000000) (bvslt (index!6611 lt!124386) (size!6150 (_keys!6716 thiss!1504))))) (or ((_ is Undefined!1110) lt!124386) ((_ is Found!1110) lt!124386) (not ((_ is MissingZero!1110) lt!124386)) (and (bvsge (index!6610 lt!124386) #b00000000000000000000000000000000) (bvslt (index!6610 lt!124386) (size!6150 (_keys!6716 thiss!1504))))) (or ((_ is Undefined!1110) lt!124386) ((_ is Found!1110) lt!124386) ((_ is MissingZero!1110) lt!124386) (not ((_ is MissingVacant!1110) lt!124386)) (and (bvsge (index!6613 lt!124386) #b00000000000000000000000000000000) (bvslt (index!6613 lt!124386) (size!6150 (_keys!6716 thiss!1504))))) (or ((_ is Undefined!1110) lt!124386) (ite ((_ is Found!1110) lt!124386) (= (select (arr!5807 (_keys!6716 thiss!1504)) (index!6611 lt!124386)) key!932) (ite ((_ is MissingZero!1110) lt!124386) (= (select (arr!5807 (_keys!6716 thiss!1504)) (index!6610 lt!124386)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1110) lt!124386) (= (select (arr!5807 (_keys!6716 thiss!1504)) (index!6613 lt!124386)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!161130 () SeekEntryResult!1110)

(assert (=> d!60533 (= lt!124386 e!161130)))

(declare-fun c!41617 () Bool)

(assert (=> d!60533 (= c!41617 (and ((_ is Intermediate!1110) lt!124387) (undefined!1922 lt!124387)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12241 (_ BitVec 32)) SeekEntryResult!1110)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60533 (= lt!124387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10740 thiss!1504)) key!932 (_keys!6716 thiss!1504) (mask!10740 thiss!1504)))))

(assert (=> d!60533 (validMask!0 (mask!10740 thiss!1504))))

(assert (=> d!60533 (= (seekEntryOrOpen!0 key!932 (_keys!6716 thiss!1504) (mask!10740 thiss!1504)) lt!124386)))

(declare-fun b!248425 () Bool)

(assert (=> b!248425 (= e!161131 (Found!1110 (index!6612 lt!124387)))))

(declare-fun b!248426 () Bool)

(assert (=> b!248426 (= e!161130 e!161131)))

(assert (=> b!248426 (= lt!124385 (select (arr!5807 (_keys!6716 thiss!1504)) (index!6612 lt!124387)))))

(declare-fun c!41615 () Bool)

(assert (=> b!248426 (= c!41615 (= lt!124385 key!932))))

(declare-fun b!248427 () Bool)

(assert (=> b!248427 (= e!161130 Undefined!1110)))

(assert (= (and d!60533 c!41617) b!248427))

(assert (= (and d!60533 (not c!41617)) b!248426))

(assert (= (and b!248426 c!41615) b!248425))

(assert (= (and b!248426 (not c!41615)) b!248424))

(assert (= (and b!248424 c!41616) b!248423))

(assert (= (and b!248424 (not c!41616)) b!248422))

(declare-fun m!265193 () Bool)

(assert (=> b!248422 m!265193))

(declare-fun m!265195 () Bool)

(assert (=> d!60533 m!265195))

(declare-fun m!265197 () Bool)

(assert (=> d!60533 m!265197))

(assert (=> d!60533 m!265099))

(declare-fun m!265199 () Bool)

(assert (=> d!60533 m!265199))

(assert (=> d!60533 m!265195))

(declare-fun m!265201 () Bool)

(assert (=> d!60533 m!265201))

(declare-fun m!265203 () Bool)

(assert (=> d!60533 m!265203))

(declare-fun m!265205 () Bool)

(assert (=> b!248426 m!265205))

(assert (=> b!248307 d!60533))

(declare-fun d!60535 () Bool)

(assert (=> d!60535 (= (inRange!0 (ite c!41595 (index!6610 lt!124337) (index!6613 lt!124337)) (mask!10740 thiss!1504)) (and (bvsge (ite c!41595 (index!6610 lt!124337) (index!6613 lt!124337)) #b00000000000000000000000000000000) (bvslt (ite c!41595 (index!6610 lt!124337) (index!6613 lt!124337)) (bvadd (mask!10740 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23264 d!60535))

(declare-fun d!60537 () Bool)

(assert (=> d!60537 (contains!1798 (getCurrentListMap!1411 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504)) key!932)))

(declare-fun lt!124390 () Unit!7686)

(declare-fun choose!1168 (array!12241 array!12239 (_ BitVec 32) (_ BitVec 32) V!8267 V!8267 (_ BitVec 64) (_ BitVec 32) Int) Unit!7686)

(assert (=> d!60537 (= lt!124390 (choose!1168 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504)))))

(assert (=> d!60537 (validMask!0 (mask!10740 thiss!1504))))

(assert (=> d!60537 (= (lemmaArrayContainsKeyThenInListMap!192 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504)) lt!124390)))

(declare-fun bs!8935 () Bool)

(assert (= bs!8935 d!60537))

(assert (=> bs!8935 m!265117))

(assert (=> bs!8935 m!265117))

(assert (=> bs!8935 m!265119))

(declare-fun m!265207 () Bool)

(assert (=> bs!8935 m!265207))

(assert (=> bs!8935 m!265099))

(assert (=> b!248309 d!60537))

(declare-fun d!60539 () Bool)

(declare-fun res!121752 () Bool)

(declare-fun e!161137 () Bool)

(assert (=> d!60539 (=> res!121752 e!161137)))

(assert (=> d!60539 (= res!121752 (= (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60539 (= (arrayContainsKey!0 (_keys!6716 thiss!1504) key!932 #b00000000000000000000000000000000) e!161137)))

(declare-fun b!248432 () Bool)

(declare-fun e!161138 () Bool)

(assert (=> b!248432 (= e!161137 e!161138)))

(declare-fun res!121753 () Bool)

(assert (=> b!248432 (=> (not res!121753) (not e!161138))))

(assert (=> b!248432 (= res!121753 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6150 (_keys!6716 thiss!1504))))))

(declare-fun b!248433 () Bool)

(assert (=> b!248433 (= e!161138 (arrayContainsKey!0 (_keys!6716 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60539 (not res!121752)) b!248432))

(assert (= (and b!248432 res!121753) b!248433))

(declare-fun m!265209 () Bool)

(assert (=> d!60539 m!265209))

(declare-fun m!265211 () Bool)

(assert (=> b!248433 m!265211))

(assert (=> bm!23265 d!60539))

(declare-fun d!60541 () Bool)

(assert (=> d!60541 (= (inRange!0 index!297 (mask!10740 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10740 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!248318 d!60541))

(declare-fun d!60543 () Bool)

(declare-fun e!161144 () Bool)

(assert (=> d!60543 e!161144))

(declare-fun res!121756 () Bool)

(assert (=> d!60543 (=> res!121756 e!161144)))

(declare-fun lt!124402 () Bool)

(assert (=> d!60543 (= res!121756 (not lt!124402))))

(declare-fun lt!124400 () Bool)

(assert (=> d!60543 (= lt!124402 lt!124400)))

(declare-fun lt!124401 () Unit!7686)

(declare-fun e!161143 () Unit!7686)

(assert (=> d!60543 (= lt!124401 e!161143)))

(declare-fun c!41620 () Bool)

(assert (=> d!60543 (= c!41620 lt!124400)))

(declare-fun containsKey!286 (List!3704 (_ BitVec 64)) Bool)

(assert (=> d!60543 (= lt!124400 (containsKey!286 (toList!1883 (getCurrentListMap!1411 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504))) key!932))))

(assert (=> d!60543 (= (contains!1798 (getCurrentListMap!1411 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504)) key!932) lt!124402)))

(declare-fun b!248440 () Bool)

(declare-fun lt!124399 () Unit!7686)

(assert (=> b!248440 (= e!161143 lt!124399)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!234 (List!3704 (_ BitVec 64)) Unit!7686)

(assert (=> b!248440 (= lt!124399 (lemmaContainsKeyImpliesGetValueByKeyDefined!234 (toList!1883 (getCurrentListMap!1411 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504))) key!932))))

(declare-datatypes ((Option!300 0))(
  ( (Some!299 (v!5338 V!8267)) (None!298) )
))
(declare-fun isDefined!235 (Option!300) Bool)

(declare-fun getValueByKey!294 (List!3704 (_ BitVec 64)) Option!300)

(assert (=> b!248440 (isDefined!235 (getValueByKey!294 (toList!1883 (getCurrentListMap!1411 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504))) key!932))))

(declare-fun b!248441 () Bool)

(declare-fun Unit!7696 () Unit!7686)

(assert (=> b!248441 (= e!161143 Unit!7696)))

(declare-fun b!248442 () Bool)

(assert (=> b!248442 (= e!161144 (isDefined!235 (getValueByKey!294 (toList!1883 (getCurrentListMap!1411 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504))) key!932)))))

(assert (= (and d!60543 c!41620) b!248440))

(assert (= (and d!60543 (not c!41620)) b!248441))

(assert (= (and d!60543 (not res!121756)) b!248442))

(declare-fun m!265213 () Bool)

(assert (=> d!60543 m!265213))

(declare-fun m!265215 () Bool)

(assert (=> b!248440 m!265215))

(declare-fun m!265217 () Bool)

(assert (=> b!248440 m!265217))

(assert (=> b!248440 m!265217))

(declare-fun m!265219 () Bool)

(assert (=> b!248440 m!265219))

(assert (=> b!248442 m!265217))

(assert (=> b!248442 m!265217))

(assert (=> b!248442 m!265219))

(assert (=> b!248318 d!60543))

(declare-fun b!248485 () Bool)

(declare-fun c!41635 () Bool)

(assert (=> b!248485 (= c!41635 (and (not (= (bvand (extraKeys!4329 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4329 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!161172 () ListLongMap!3735)

(declare-fun e!161174 () ListLongMap!3735)

(assert (=> b!248485 (= e!161172 e!161174)))

(declare-fun d!60545 () Bool)

(declare-fun e!161182 () Bool)

(assert (=> d!60545 e!161182))

(declare-fun res!121781 () Bool)

(assert (=> d!60545 (=> (not res!121781) (not e!161182))))

(assert (=> d!60545 (= res!121781 (or (bvsge #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))))))))

(declare-fun lt!124462 () ListLongMap!3735)

(declare-fun lt!124451 () ListLongMap!3735)

(assert (=> d!60545 (= lt!124462 lt!124451)))

(declare-fun lt!124455 () Unit!7686)

(declare-fun e!161171 () Unit!7686)

(assert (=> d!60545 (= lt!124455 e!161171)))

(declare-fun c!41633 () Bool)

(declare-fun e!161183 () Bool)

(assert (=> d!60545 (= c!41633 e!161183)))

(declare-fun res!121779 () Bool)

(assert (=> d!60545 (=> (not res!121779) (not e!161183))))

(assert (=> d!60545 (= res!121779 (bvslt #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))))))

(declare-fun e!161179 () ListLongMap!3735)

(assert (=> d!60545 (= lt!124451 e!161179)))

(declare-fun c!41634 () Bool)

(assert (=> d!60545 (= c!41634 (and (not (= (bvand (extraKeys!4329 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4329 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60545 (validMask!0 (mask!10740 thiss!1504))))

(assert (=> d!60545 (= (getCurrentListMap!1411 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504)) lt!124462)))

(declare-fun bm!23286 () Bool)

(declare-fun call!23293 () ListLongMap!3735)

(declare-fun getCurrentListMapNoExtraKeys!558 (array!12241 array!12239 (_ BitVec 32) (_ BitVec 32) V!8267 V!8267 (_ BitVec 32) Int) ListLongMap!3735)

(assert (=> bm!23286 (= call!23293 (getCurrentListMapNoExtraKeys!558 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504)))))

(declare-fun bm!23287 () Bool)

(declare-fun call!23290 () Bool)

(assert (=> bm!23287 (= call!23290 (contains!1798 lt!124462 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248486 () Bool)

(declare-fun lt!124459 () Unit!7686)

(assert (=> b!248486 (= e!161171 lt!124459)))

(declare-fun lt!124468 () ListLongMap!3735)

(assert (=> b!248486 (= lt!124468 (getCurrentListMapNoExtraKeys!558 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504)))))

(declare-fun lt!124464 () (_ BitVec 64))

(assert (=> b!248486 (= lt!124464 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124454 () (_ BitVec 64))

(assert (=> b!248486 (= lt!124454 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124452 () Unit!7686)

(declare-fun addStillContains!212 (ListLongMap!3735 (_ BitVec 64) V!8267 (_ BitVec 64)) Unit!7686)

(assert (=> b!248486 (= lt!124452 (addStillContains!212 lt!124468 lt!124464 (zeroValue!4433 thiss!1504) lt!124454))))

(declare-fun +!663 (ListLongMap!3735 tuple2!4822) ListLongMap!3735)

(assert (=> b!248486 (contains!1798 (+!663 lt!124468 (tuple2!4823 lt!124464 (zeroValue!4433 thiss!1504))) lt!124454)))

(declare-fun lt!124467 () Unit!7686)

(assert (=> b!248486 (= lt!124467 lt!124452)))

(declare-fun lt!124449 () ListLongMap!3735)

(assert (=> b!248486 (= lt!124449 (getCurrentListMapNoExtraKeys!558 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504)))))

(declare-fun lt!124465 () (_ BitVec 64))

(assert (=> b!248486 (= lt!124465 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124456 () (_ BitVec 64))

(assert (=> b!248486 (= lt!124456 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124448 () Unit!7686)

(declare-fun addApplyDifferent!212 (ListLongMap!3735 (_ BitVec 64) V!8267 (_ BitVec 64)) Unit!7686)

(assert (=> b!248486 (= lt!124448 (addApplyDifferent!212 lt!124449 lt!124465 (minValue!4433 thiss!1504) lt!124456))))

(declare-fun apply!236 (ListLongMap!3735 (_ BitVec 64)) V!8267)

(assert (=> b!248486 (= (apply!236 (+!663 lt!124449 (tuple2!4823 lt!124465 (minValue!4433 thiss!1504))) lt!124456) (apply!236 lt!124449 lt!124456))))

(declare-fun lt!124460 () Unit!7686)

(assert (=> b!248486 (= lt!124460 lt!124448)))

(declare-fun lt!124461 () ListLongMap!3735)

(assert (=> b!248486 (= lt!124461 (getCurrentListMapNoExtraKeys!558 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504)))))

(declare-fun lt!124466 () (_ BitVec 64))

(assert (=> b!248486 (= lt!124466 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124463 () (_ BitVec 64))

(assert (=> b!248486 (= lt!124463 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124457 () Unit!7686)

(assert (=> b!248486 (= lt!124457 (addApplyDifferent!212 lt!124461 lt!124466 (zeroValue!4433 thiss!1504) lt!124463))))

(assert (=> b!248486 (= (apply!236 (+!663 lt!124461 (tuple2!4823 lt!124466 (zeroValue!4433 thiss!1504))) lt!124463) (apply!236 lt!124461 lt!124463))))

(declare-fun lt!124458 () Unit!7686)

(assert (=> b!248486 (= lt!124458 lt!124457)))

(declare-fun lt!124447 () ListLongMap!3735)

(assert (=> b!248486 (= lt!124447 (getCurrentListMapNoExtraKeys!558 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4592 thiss!1504)))))

(declare-fun lt!124450 () (_ BitVec 64))

(assert (=> b!248486 (= lt!124450 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124453 () (_ BitVec 64))

(assert (=> b!248486 (= lt!124453 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248486 (= lt!124459 (addApplyDifferent!212 lt!124447 lt!124450 (minValue!4433 thiss!1504) lt!124453))))

(assert (=> b!248486 (= (apply!236 (+!663 lt!124447 (tuple2!4823 lt!124450 (minValue!4433 thiss!1504))) lt!124453) (apply!236 lt!124447 lt!124453))))

(declare-fun b!248487 () Bool)

(declare-fun e!161178 () Bool)

(assert (=> b!248487 (= e!161182 e!161178)))

(declare-fun c!41638 () Bool)

(assert (=> b!248487 (= c!41638 (not (= (bvand (extraKeys!4329 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23288 () Bool)

(declare-fun call!23294 () ListLongMap!3735)

(assert (=> bm!23288 (= call!23294 call!23293)))

(declare-fun b!248488 () Bool)

(declare-fun call!23291 () ListLongMap!3735)

(assert (=> b!248488 (= e!161172 call!23291)))

(declare-fun b!248489 () Bool)

(assert (=> b!248489 (= e!161178 (not call!23290))))

(declare-fun call!23292 () ListLongMap!3735)

(declare-fun c!41636 () Bool)

(declare-fun bm!23289 () Bool)

(declare-fun call!23295 () ListLongMap!3735)

(assert (=> bm!23289 (= call!23292 (+!663 (ite c!41634 call!23293 (ite c!41636 call!23294 call!23295)) (ite (or c!41634 c!41636) (tuple2!4823 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4433 thiss!1504)) (tuple2!4823 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4433 thiss!1504)))))))

(declare-fun b!248490 () Bool)

(assert (=> b!248490 (= e!161179 (+!663 call!23292 (tuple2!4823 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4433 thiss!1504))))))

(declare-fun b!248491 () Bool)

(declare-fun e!161175 () Bool)

(assert (=> b!248491 (= e!161175 (= (apply!236 lt!124462 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4433 thiss!1504)))))

(declare-fun b!248492 () Bool)

(declare-fun e!161181 () Bool)

(declare-fun e!161176 () Bool)

(assert (=> b!248492 (= e!161181 e!161176)))

(declare-fun res!121777 () Bool)

(declare-fun call!23289 () Bool)

(assert (=> b!248492 (= res!121777 call!23289)))

(assert (=> b!248492 (=> (not res!121777) (not e!161176))))

(declare-fun b!248493 () Bool)

(declare-fun e!161177 () Bool)

(declare-fun e!161180 () Bool)

(assert (=> b!248493 (= e!161177 e!161180)))

(declare-fun res!121778 () Bool)

(assert (=> b!248493 (=> (not res!121778) (not e!161180))))

(assert (=> b!248493 (= res!121778 (contains!1798 lt!124462 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!248493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))))))

(declare-fun b!248494 () Bool)

(declare-fun res!121780 () Bool)

(assert (=> b!248494 (=> (not res!121780) (not e!161182))))

(assert (=> b!248494 (= res!121780 e!161181)))

(declare-fun c!41637 () Bool)

(assert (=> b!248494 (= c!41637 (not (= (bvand (extraKeys!4329 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!248495 () Bool)

(assert (=> b!248495 (= e!161183 (validKeyInArray!0 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248496 () Bool)

(declare-fun get!2979 (ValueCell!2889 V!8267) V!8267)

(declare-fun dynLambda!579 (Int (_ BitVec 64)) V!8267)

(assert (=> b!248496 (= e!161180 (= (apply!236 lt!124462 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000)) (get!2979 (select (arr!5806 (_values!4575 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!579 (defaultEntry!4592 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!248496 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6149 (_values!4575 thiss!1504))))))

(assert (=> b!248496 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))))))

(declare-fun bm!23290 () Bool)

(assert (=> bm!23290 (= call!23289 (contains!1798 lt!124462 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248497 () Bool)

(declare-fun e!161173 () Bool)

(assert (=> b!248497 (= e!161173 (validKeyInArray!0 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23291 () Bool)

(assert (=> bm!23291 (= call!23291 call!23292)))

(declare-fun bm!23292 () Bool)

(assert (=> bm!23292 (= call!23295 call!23294)))

(declare-fun b!248498 () Bool)

(assert (=> b!248498 (= e!161176 (= (apply!236 lt!124462 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4433 thiss!1504)))))

(declare-fun b!248499 () Bool)

(assert (=> b!248499 (= e!161178 e!161175)))

(declare-fun res!121782 () Bool)

(assert (=> b!248499 (= res!121782 call!23290)))

(assert (=> b!248499 (=> (not res!121782) (not e!161175))))

(declare-fun b!248500 () Bool)

(declare-fun res!121776 () Bool)

(assert (=> b!248500 (=> (not res!121776) (not e!161182))))

(assert (=> b!248500 (= res!121776 e!161177)))

(declare-fun res!121775 () Bool)

(assert (=> b!248500 (=> res!121775 e!161177)))

(assert (=> b!248500 (= res!121775 (not e!161173))))

(declare-fun res!121783 () Bool)

(assert (=> b!248500 (=> (not res!121783) (not e!161173))))

(assert (=> b!248500 (= res!121783 (bvslt #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))))))

(declare-fun b!248501 () Bool)

(assert (=> b!248501 (= e!161174 call!23291)))

(declare-fun b!248502 () Bool)

(declare-fun Unit!7697 () Unit!7686)

(assert (=> b!248502 (= e!161171 Unit!7697)))

(declare-fun b!248503 () Bool)

(assert (=> b!248503 (= e!161174 call!23295)))

(declare-fun b!248504 () Bool)

(assert (=> b!248504 (= e!161181 (not call!23289))))

(declare-fun b!248505 () Bool)

(assert (=> b!248505 (= e!161179 e!161172)))

(assert (=> b!248505 (= c!41636 (and (not (= (bvand (extraKeys!4329 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4329 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!60545 c!41634) b!248490))

(assert (= (and d!60545 (not c!41634)) b!248505))

(assert (= (and b!248505 c!41636) b!248488))

(assert (= (and b!248505 (not c!41636)) b!248485))

(assert (= (and b!248485 c!41635) b!248501))

(assert (= (and b!248485 (not c!41635)) b!248503))

(assert (= (or b!248501 b!248503) bm!23292))

(assert (= (or b!248488 bm!23292) bm!23288))

(assert (= (or b!248488 b!248501) bm!23291))

(assert (= (or b!248490 bm!23288) bm!23286))

(assert (= (or b!248490 bm!23291) bm!23289))

(assert (= (and d!60545 res!121779) b!248495))

(assert (= (and d!60545 c!41633) b!248486))

(assert (= (and d!60545 (not c!41633)) b!248502))

(assert (= (and d!60545 res!121781) b!248500))

(assert (= (and b!248500 res!121783) b!248497))

(assert (= (and b!248500 (not res!121775)) b!248493))

(assert (= (and b!248493 res!121778) b!248496))

(assert (= (and b!248500 res!121776) b!248494))

(assert (= (and b!248494 c!41637) b!248492))

(assert (= (and b!248494 (not c!41637)) b!248504))

(assert (= (and b!248492 res!121777) b!248498))

(assert (= (or b!248492 b!248504) bm!23290))

(assert (= (and b!248494 res!121780) b!248487))

(assert (= (and b!248487 c!41638) b!248499))

(assert (= (and b!248487 (not c!41638)) b!248489))

(assert (= (and b!248499 res!121782) b!248491))

(assert (= (or b!248499 b!248489) bm!23287))

(declare-fun b_lambda!8055 () Bool)

(assert (=> (not b_lambda!8055) (not b!248496)))

(declare-fun t!8733 () Bool)

(declare-fun tb!2985 () Bool)

(assert (=> (and b!248304 (= (defaultEntry!4592 thiss!1504) (defaultEntry!4592 thiss!1504)) t!8733) tb!2985))

(declare-fun result!5277 () Bool)

(assert (=> tb!2985 (= result!5277 tp_is_empty!6465)))

(assert (=> b!248496 t!8733))

(declare-fun b_and!13611 () Bool)

(assert (= b_and!13607 (and (=> t!8733 result!5277) b_and!13611)))

(declare-fun m!265221 () Bool)

(assert (=> b!248491 m!265221))

(declare-fun m!265223 () Bool)

(assert (=> bm!23290 m!265223))

(assert (=> b!248493 m!265209))

(assert (=> b!248493 m!265209))

(declare-fun m!265225 () Bool)

(assert (=> b!248493 m!265225))

(declare-fun m!265227 () Bool)

(assert (=> bm!23289 m!265227))

(declare-fun m!265229 () Bool)

(assert (=> bm!23286 m!265229))

(declare-fun m!265231 () Bool)

(assert (=> b!248486 m!265231))

(declare-fun m!265233 () Bool)

(assert (=> b!248486 m!265233))

(assert (=> b!248486 m!265231))

(declare-fun m!265235 () Bool)

(assert (=> b!248486 m!265235))

(declare-fun m!265237 () Bool)

(assert (=> b!248486 m!265237))

(declare-fun m!265239 () Bool)

(assert (=> b!248486 m!265239))

(assert (=> b!248486 m!265233))

(declare-fun m!265241 () Bool)

(assert (=> b!248486 m!265241))

(declare-fun m!265243 () Bool)

(assert (=> b!248486 m!265243))

(assert (=> b!248486 m!265239))

(declare-fun m!265245 () Bool)

(assert (=> b!248486 m!265245))

(assert (=> b!248486 m!265229))

(declare-fun m!265247 () Bool)

(assert (=> b!248486 m!265247))

(assert (=> b!248486 m!265237))

(declare-fun m!265249 () Bool)

(assert (=> b!248486 m!265249))

(declare-fun m!265251 () Bool)

(assert (=> b!248486 m!265251))

(declare-fun m!265253 () Bool)

(assert (=> b!248486 m!265253))

(assert (=> b!248486 m!265209))

(declare-fun m!265255 () Bool)

(assert (=> b!248486 m!265255))

(declare-fun m!265257 () Bool)

(assert (=> b!248486 m!265257))

(declare-fun m!265259 () Bool)

(assert (=> b!248486 m!265259))

(declare-fun m!265261 () Bool)

(assert (=> b!248490 m!265261))

(assert (=> b!248497 m!265209))

(assert (=> b!248497 m!265209))

(declare-fun m!265263 () Bool)

(assert (=> b!248497 m!265263))

(declare-fun m!265265 () Bool)

(assert (=> bm!23287 m!265265))

(assert (=> b!248495 m!265209))

(assert (=> b!248495 m!265209))

(assert (=> b!248495 m!265263))

(assert (=> b!248496 m!265209))

(declare-fun m!265267 () Bool)

(assert (=> b!248496 m!265267))

(assert (=> b!248496 m!265209))

(declare-fun m!265269 () Bool)

(assert (=> b!248496 m!265269))

(declare-fun m!265271 () Bool)

(assert (=> b!248496 m!265271))

(assert (=> b!248496 m!265267))

(assert (=> b!248496 m!265271))

(declare-fun m!265273 () Bool)

(assert (=> b!248496 m!265273))

(assert (=> d!60545 m!265099))

(declare-fun m!265275 () Bool)

(assert (=> b!248498 m!265275))

(assert (=> b!248318 d!60545))

(declare-fun b!248516 () Bool)

(declare-fun e!161190 () Bool)

(declare-fun call!23298 () Bool)

(assert (=> b!248516 (= e!161190 call!23298)))

(declare-fun bm!23295 () Bool)

(assert (=> bm!23295 (= call!23298 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6716 thiss!1504) (mask!10740 thiss!1504)))))

(declare-fun b!248517 () Bool)

(declare-fun e!161192 () Bool)

(assert (=> b!248517 (= e!161192 e!161190)))

(declare-fun lt!124476 () (_ BitVec 64))

(assert (=> b!248517 (= lt!124476 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124477 () Unit!7686)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12241 (_ BitVec 64) (_ BitVec 32)) Unit!7686)

(assert (=> b!248517 (= lt!124477 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6716 thiss!1504) lt!124476 #b00000000000000000000000000000000))))

(assert (=> b!248517 (arrayContainsKey!0 (_keys!6716 thiss!1504) lt!124476 #b00000000000000000000000000000000)))

(declare-fun lt!124475 () Unit!7686)

(assert (=> b!248517 (= lt!124475 lt!124477)))

(declare-fun res!121788 () Bool)

(assert (=> b!248517 (= res!121788 (= (seekEntryOrOpen!0 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000) (_keys!6716 thiss!1504) (mask!10740 thiss!1504)) (Found!1110 #b00000000000000000000000000000000)))))

(assert (=> b!248517 (=> (not res!121788) (not e!161190))))

(declare-fun b!248518 () Bool)

(assert (=> b!248518 (= e!161192 call!23298)))

(declare-fun b!248519 () Bool)

(declare-fun e!161191 () Bool)

(assert (=> b!248519 (= e!161191 e!161192)))

(declare-fun c!41641 () Bool)

(assert (=> b!248519 (= c!41641 (validKeyInArray!0 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60547 () Bool)

(declare-fun res!121789 () Bool)

(assert (=> d!60547 (=> res!121789 e!161191)))

(assert (=> d!60547 (= res!121789 (bvsge #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))))))

(assert (=> d!60547 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6716 thiss!1504) (mask!10740 thiss!1504)) e!161191)))

(assert (= (and d!60547 (not res!121789)) b!248519))

(assert (= (and b!248519 c!41641) b!248517))

(assert (= (and b!248519 (not c!41641)) b!248518))

(assert (= (and b!248517 res!121788) b!248516))

(assert (= (or b!248516 b!248518) bm!23295))

(declare-fun m!265277 () Bool)

(assert (=> bm!23295 m!265277))

(assert (=> b!248517 m!265209))

(declare-fun m!265279 () Bool)

(assert (=> b!248517 m!265279))

(declare-fun m!265281 () Bool)

(assert (=> b!248517 m!265281))

(assert (=> b!248517 m!265209))

(declare-fun m!265283 () Bool)

(assert (=> b!248517 m!265283))

(assert (=> b!248519 m!265209))

(assert (=> b!248519 m!265209))

(assert (=> b!248519 m!265263))

(assert (=> b!248319 d!60547))

(declare-fun bm!23298 () Bool)

(declare-fun call!23301 () (_ BitVec 32))

(assert (=> bm!23298 (= call!23301 (arrayCountValidKeys!0 lt!124335 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6150 (_keys!6716 thiss!1504))))))

(declare-fun d!60549 () Bool)

(declare-fun lt!124480 () (_ BitVec 32))

(assert (=> d!60549 (and (bvsge lt!124480 #b00000000000000000000000000000000) (bvsle lt!124480 (bvsub (size!6150 lt!124335) #b00000000000000000000000000000000)))))

(declare-fun e!161197 () (_ BitVec 32))

(assert (=> d!60549 (= lt!124480 e!161197)))

(declare-fun c!41647 () Bool)

(assert (=> d!60549 (= c!41647 (bvsge #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))))))

(assert (=> d!60549 (and (bvsle #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6150 (_keys!6716 thiss!1504)) (size!6150 lt!124335)))))

(assert (=> d!60549 (= (arrayCountValidKeys!0 lt!124335 #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))) lt!124480)))

(declare-fun b!248528 () Bool)

(declare-fun e!161198 () (_ BitVec 32))

(assert (=> b!248528 (= e!161198 call!23301)))

(declare-fun b!248529 () Bool)

(assert (=> b!248529 (= e!161197 #b00000000000000000000000000000000)))

(declare-fun b!248530 () Bool)

(assert (=> b!248530 (= e!161197 e!161198)))

(declare-fun c!41646 () Bool)

(assert (=> b!248530 (= c!41646 (validKeyInArray!0 (select (arr!5807 lt!124335) #b00000000000000000000000000000000)))))

(declare-fun b!248531 () Bool)

(assert (=> b!248531 (= e!161198 (bvadd #b00000000000000000000000000000001 call!23301))))

(assert (= (and d!60549 c!41647) b!248529))

(assert (= (and d!60549 (not c!41647)) b!248530))

(assert (= (and b!248530 c!41646) b!248531))

(assert (= (and b!248530 (not c!41646)) b!248528))

(assert (= (or b!248531 b!248528) bm!23298))

(declare-fun m!265285 () Bool)

(assert (=> bm!23298 m!265285))

(declare-fun m!265287 () Bool)

(assert (=> b!248530 m!265287))

(assert (=> b!248530 m!265287))

(declare-fun m!265289 () Bool)

(assert (=> b!248530 m!265289))

(assert (=> b!248310 d!60549))

(declare-fun b!248540 () Bool)

(declare-fun res!121800 () Bool)

(declare-fun e!161204 () Bool)

(assert (=> b!248540 (=> (not res!121800) (not e!161204))))

(assert (=> b!248540 (= res!121800 (not (validKeyInArray!0 (select (arr!5807 (_keys!6716 thiss!1504)) index!297))))))

(declare-fun b!248542 () Bool)

(assert (=> b!248542 (= e!161204 (bvslt (size!6150 (_keys!6716 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!248543 () Bool)

(declare-fun e!161203 () Bool)

(assert (=> b!248543 (= e!161203 (= (arrayCountValidKeys!0 (array!12242 (store (arr!5807 (_keys!6716 thiss!1504)) index!297 key!932) (size!6150 (_keys!6716 thiss!1504))) #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6716 thiss!1504) #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!248541 () Bool)

(declare-fun res!121798 () Bool)

(assert (=> b!248541 (=> (not res!121798) (not e!161204))))

(assert (=> b!248541 (= res!121798 (validKeyInArray!0 key!932))))

(declare-fun d!60551 () Bool)

(assert (=> d!60551 e!161203))

(declare-fun res!121799 () Bool)

(assert (=> d!60551 (=> (not res!121799) (not e!161203))))

(assert (=> d!60551 (= res!121799 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6150 (_keys!6716 thiss!1504)))))))

(declare-fun lt!124483 () Unit!7686)

(declare-fun choose!1 (array!12241 (_ BitVec 32) (_ BitVec 64)) Unit!7686)

(assert (=> d!60551 (= lt!124483 (choose!1 (_keys!6716 thiss!1504) index!297 key!932))))

(assert (=> d!60551 e!161204))

(declare-fun res!121801 () Bool)

(assert (=> d!60551 (=> (not res!121801) (not e!161204))))

(assert (=> d!60551 (= res!121801 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6150 (_keys!6716 thiss!1504)))))))

(assert (=> d!60551 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6716 thiss!1504) index!297 key!932) lt!124483)))

(assert (= (and d!60551 res!121801) b!248540))

(assert (= (and b!248540 res!121800) b!248541))

(assert (= (and b!248541 res!121798) b!248542))

(assert (= (and d!60551 res!121799) b!248543))

(declare-fun m!265291 () Bool)

(assert (=> b!248540 m!265291))

(assert (=> b!248540 m!265291))

(declare-fun m!265293 () Bool)

(assert (=> b!248540 m!265293))

(assert (=> b!248543 m!265109))

(declare-fun m!265295 () Bool)

(assert (=> b!248543 m!265295))

(assert (=> b!248543 m!265111))

(assert (=> b!248541 m!265133))

(declare-fun m!265297 () Bool)

(assert (=> d!60551 m!265297))

(assert (=> b!248310 d!60551))

(assert (=> b!248310 d!60539))

(declare-fun b!248554 () Bool)

(declare-fun e!161213 () Bool)

(declare-fun e!161215 () Bool)

(assert (=> b!248554 (= e!161213 e!161215)))

(declare-fun res!121808 () Bool)

(assert (=> b!248554 (=> (not res!121808) (not e!161215))))

(declare-fun e!161216 () Bool)

(assert (=> b!248554 (= res!121808 (not e!161216))))

(declare-fun res!121809 () Bool)

(assert (=> b!248554 (=> (not res!121809) (not e!161216))))

(assert (=> b!248554 (= res!121809 (validKeyInArray!0 (select (arr!5807 lt!124335) #b00000000000000000000000000000000)))))

(declare-fun b!248555 () Bool)

(declare-fun e!161214 () Bool)

(declare-fun call!23304 () Bool)

(assert (=> b!248555 (= e!161214 call!23304)))

(declare-fun d!60553 () Bool)

(declare-fun res!121810 () Bool)

(assert (=> d!60553 (=> res!121810 e!161213)))

(assert (=> d!60553 (= res!121810 (bvsge #b00000000000000000000000000000000 (size!6150 lt!124335)))))

(assert (=> d!60553 (= (arrayNoDuplicates!0 lt!124335 #b00000000000000000000000000000000 Nil!3700) e!161213)))

(declare-fun b!248556 () Bool)

(assert (=> b!248556 (= e!161214 call!23304)))

(declare-fun b!248557 () Bool)

(declare-fun contains!1800 (List!3703 (_ BitVec 64)) Bool)

(assert (=> b!248557 (= e!161216 (contains!1800 Nil!3700 (select (arr!5807 lt!124335) #b00000000000000000000000000000000)))))

(declare-fun b!248558 () Bool)

(assert (=> b!248558 (= e!161215 e!161214)))

(declare-fun c!41650 () Bool)

(assert (=> b!248558 (= c!41650 (validKeyInArray!0 (select (arr!5807 lt!124335) #b00000000000000000000000000000000)))))

(declare-fun bm!23301 () Bool)

(assert (=> bm!23301 (= call!23304 (arrayNoDuplicates!0 lt!124335 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41650 (Cons!3699 (select (arr!5807 lt!124335) #b00000000000000000000000000000000) Nil!3700) Nil!3700)))))

(assert (= (and d!60553 (not res!121810)) b!248554))

(assert (= (and b!248554 res!121809) b!248557))

(assert (= (and b!248554 res!121808) b!248558))

(assert (= (and b!248558 c!41650) b!248555))

(assert (= (and b!248558 (not c!41650)) b!248556))

(assert (= (or b!248555 b!248556) bm!23301))

(assert (=> b!248554 m!265287))

(assert (=> b!248554 m!265287))

(assert (=> b!248554 m!265289))

(assert (=> b!248557 m!265287))

(assert (=> b!248557 m!265287))

(declare-fun m!265299 () Bool)

(assert (=> b!248557 m!265299))

(assert (=> b!248558 m!265287))

(assert (=> b!248558 m!265287))

(assert (=> b!248558 m!265289))

(assert (=> bm!23301 m!265287))

(declare-fun m!265301 () Bool)

(assert (=> bm!23301 m!265301))

(assert (=> b!248310 d!60553))

(declare-fun bm!23302 () Bool)

(declare-fun call!23305 () (_ BitVec 32))

(assert (=> bm!23302 (= call!23305 (arrayCountValidKeys!0 (_keys!6716 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6150 (_keys!6716 thiss!1504))))))

(declare-fun d!60555 () Bool)

(declare-fun lt!124484 () (_ BitVec 32))

(assert (=> d!60555 (and (bvsge lt!124484 #b00000000000000000000000000000000) (bvsle lt!124484 (bvsub (size!6150 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!161217 () (_ BitVec 32))

(assert (=> d!60555 (= lt!124484 e!161217)))

(declare-fun c!41652 () Bool)

(assert (=> d!60555 (= c!41652 (bvsge #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))))))

(assert (=> d!60555 (and (bvsle #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6150 (_keys!6716 thiss!1504)) (size!6150 (_keys!6716 thiss!1504))))))

(assert (=> d!60555 (= (arrayCountValidKeys!0 (_keys!6716 thiss!1504) #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))) lt!124484)))

(declare-fun b!248559 () Bool)

(declare-fun e!161218 () (_ BitVec 32))

(assert (=> b!248559 (= e!161218 call!23305)))

(declare-fun b!248560 () Bool)

(assert (=> b!248560 (= e!161217 #b00000000000000000000000000000000)))

(declare-fun b!248561 () Bool)

(assert (=> b!248561 (= e!161217 e!161218)))

(declare-fun c!41651 () Bool)

(assert (=> b!248561 (= c!41651 (validKeyInArray!0 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248562 () Bool)

(assert (=> b!248562 (= e!161218 (bvadd #b00000000000000000000000000000001 call!23305))))

(assert (= (and d!60555 c!41652) b!248560))

(assert (= (and d!60555 (not c!41652)) b!248561))

(assert (= (and b!248561 c!41651) b!248562))

(assert (= (and b!248561 (not c!41651)) b!248559))

(assert (= (or b!248562 b!248559) bm!23302))

(declare-fun m!265303 () Bool)

(assert (=> bm!23302 m!265303))

(assert (=> b!248561 m!265209))

(assert (=> b!248561 m!265209))

(assert (=> b!248561 m!265263))

(assert (=> b!248310 d!60555))

(declare-fun d!60557 () Bool)

(assert (=> d!60557 (= (validMask!0 (mask!10740 thiss!1504)) (and (or (= (mask!10740 thiss!1504) #b00000000000000000000000000000111) (= (mask!10740 thiss!1504) #b00000000000000000000000000001111) (= (mask!10740 thiss!1504) #b00000000000000000000000000011111) (= (mask!10740 thiss!1504) #b00000000000000000000000000111111) (= (mask!10740 thiss!1504) #b00000000000000000000000001111111) (= (mask!10740 thiss!1504) #b00000000000000000000000011111111) (= (mask!10740 thiss!1504) #b00000000000000000000000111111111) (= (mask!10740 thiss!1504) #b00000000000000000000001111111111) (= (mask!10740 thiss!1504) #b00000000000000000000011111111111) (= (mask!10740 thiss!1504) #b00000000000000000000111111111111) (= (mask!10740 thiss!1504) #b00000000000000000001111111111111) (= (mask!10740 thiss!1504) #b00000000000000000011111111111111) (= (mask!10740 thiss!1504) #b00000000000000000111111111111111) (= (mask!10740 thiss!1504) #b00000000000000001111111111111111) (= (mask!10740 thiss!1504) #b00000000000000011111111111111111) (= (mask!10740 thiss!1504) #b00000000000000111111111111111111) (= (mask!10740 thiss!1504) #b00000000000001111111111111111111) (= (mask!10740 thiss!1504) #b00000000000011111111111111111111) (= (mask!10740 thiss!1504) #b00000000000111111111111111111111) (= (mask!10740 thiss!1504) #b00000000001111111111111111111111) (= (mask!10740 thiss!1504) #b00000000011111111111111111111111) (= (mask!10740 thiss!1504) #b00000000111111111111111111111111) (= (mask!10740 thiss!1504) #b00000001111111111111111111111111) (= (mask!10740 thiss!1504) #b00000011111111111111111111111111) (= (mask!10740 thiss!1504) #b00000111111111111111111111111111) (= (mask!10740 thiss!1504) #b00001111111111111111111111111111) (= (mask!10740 thiss!1504) #b00011111111111111111111111111111) (= (mask!10740 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10740 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!248310 d!60557))

(declare-fun d!60559 () Bool)

(declare-fun e!161221 () Bool)

(assert (=> d!60559 e!161221))

(declare-fun res!121813 () Bool)

(assert (=> d!60559 (=> (not res!121813) (not e!161221))))

(assert (=> d!60559 (= res!121813 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6150 (_keys!6716 thiss!1504)))))))

(declare-fun lt!124487 () Unit!7686)

(declare-fun choose!41 (array!12241 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3703) Unit!7686)

(assert (=> d!60559 (= lt!124487 (choose!41 (_keys!6716 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3700))))

(assert (=> d!60559 (bvslt (size!6150 (_keys!6716 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60559 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6716 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3700) lt!124487)))

(declare-fun b!248565 () Bool)

(assert (=> b!248565 (= e!161221 (arrayNoDuplicates!0 (array!12242 (store (arr!5807 (_keys!6716 thiss!1504)) index!297 key!932) (size!6150 (_keys!6716 thiss!1504))) #b00000000000000000000000000000000 Nil!3700))))

(assert (= (and d!60559 res!121813) b!248565))

(declare-fun m!265305 () Bool)

(assert (=> d!60559 m!265305))

(assert (=> b!248565 m!265109))

(declare-fun m!265307 () Bool)

(assert (=> b!248565 m!265307))

(assert (=> b!248310 d!60559))

(declare-fun d!60561 () Bool)

(declare-fun res!121820 () Bool)

(declare-fun e!161224 () Bool)

(assert (=> d!60561 (=> (not res!121820) (not e!161224))))

(declare-fun simpleValid!259 (LongMapFixedSize!3678) Bool)

(assert (=> d!60561 (= res!121820 (simpleValid!259 thiss!1504))))

(assert (=> d!60561 (= (valid!1439 thiss!1504) e!161224)))

(declare-fun b!248572 () Bool)

(declare-fun res!121821 () Bool)

(assert (=> b!248572 (=> (not res!121821) (not e!161224))))

(assert (=> b!248572 (= res!121821 (= (arrayCountValidKeys!0 (_keys!6716 thiss!1504) #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))) (_size!1888 thiss!1504)))))

(declare-fun b!248573 () Bool)

(declare-fun res!121822 () Bool)

(assert (=> b!248573 (=> (not res!121822) (not e!161224))))

(assert (=> b!248573 (= res!121822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6716 thiss!1504) (mask!10740 thiss!1504)))))

(declare-fun b!248574 () Bool)

(assert (=> b!248574 (= e!161224 (arrayNoDuplicates!0 (_keys!6716 thiss!1504) #b00000000000000000000000000000000 Nil!3700))))

(assert (= (and d!60561 res!121820) b!248572))

(assert (= (and b!248572 res!121821) b!248573))

(assert (= (and b!248573 res!121822) b!248574))

(declare-fun m!265309 () Bool)

(assert (=> d!60561 m!265309))

(assert (=> b!248572 m!265111))

(assert (=> b!248573 m!265095))

(assert (=> b!248574 m!265089))

(assert (=> start!23620 d!60561))

(declare-fun b!248575 () Bool)

(declare-fun e!161225 () Bool)

(declare-fun e!161227 () Bool)

(assert (=> b!248575 (= e!161225 e!161227)))

(declare-fun res!121823 () Bool)

(assert (=> b!248575 (=> (not res!121823) (not e!161227))))

(declare-fun e!161228 () Bool)

(assert (=> b!248575 (= res!121823 (not e!161228))))

(declare-fun res!121824 () Bool)

(assert (=> b!248575 (=> (not res!121824) (not e!161228))))

(assert (=> b!248575 (= res!121824 (validKeyInArray!0 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248576 () Bool)

(declare-fun e!161226 () Bool)

(declare-fun call!23306 () Bool)

(assert (=> b!248576 (= e!161226 call!23306)))

(declare-fun d!60563 () Bool)

(declare-fun res!121825 () Bool)

(assert (=> d!60563 (=> res!121825 e!161225)))

(assert (=> d!60563 (= res!121825 (bvsge #b00000000000000000000000000000000 (size!6150 (_keys!6716 thiss!1504))))))

(assert (=> d!60563 (= (arrayNoDuplicates!0 (_keys!6716 thiss!1504) #b00000000000000000000000000000000 Nil!3700) e!161225)))

(declare-fun b!248577 () Bool)

(assert (=> b!248577 (= e!161226 call!23306)))

(declare-fun b!248578 () Bool)

(assert (=> b!248578 (= e!161228 (contains!1800 Nil!3700 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248579 () Bool)

(assert (=> b!248579 (= e!161227 e!161226)))

(declare-fun c!41653 () Bool)

(assert (=> b!248579 (= c!41653 (validKeyInArray!0 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23303 () Bool)

(assert (=> bm!23303 (= call!23306 (arrayNoDuplicates!0 (_keys!6716 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41653 (Cons!3699 (select (arr!5807 (_keys!6716 thiss!1504)) #b00000000000000000000000000000000) Nil!3700) Nil!3700)))))

(assert (= (and d!60563 (not res!121825)) b!248575))

(assert (= (and b!248575 res!121824) b!248578))

(assert (= (and b!248575 res!121823) b!248579))

(assert (= (and b!248579 c!41653) b!248576))

(assert (= (and b!248579 (not c!41653)) b!248577))

(assert (= (or b!248576 b!248577) bm!23303))

(assert (=> b!248575 m!265209))

(assert (=> b!248575 m!265209))

(assert (=> b!248575 m!265263))

(assert (=> b!248578 m!265209))

(assert (=> b!248578 m!265209))

(declare-fun m!265311 () Bool)

(assert (=> b!248578 m!265311))

(assert (=> b!248579 m!265209))

(assert (=> b!248579 m!265209))

(assert (=> b!248579 m!265263))

(assert (=> bm!23303 m!265209))

(declare-fun m!265313 () Bool)

(assert (=> bm!23303 m!265313))

(assert (=> b!248321 d!60563))

(declare-fun b!248597 () Bool)

(declare-fun e!161239 () Bool)

(declare-fun call!23312 () Bool)

(assert (=> b!248597 (= e!161239 (not call!23312))))

(declare-fun b!248598 () Bool)

(declare-fun res!121837 () Bool)

(declare-fun e!161238 () Bool)

(assert (=> b!248598 (=> (not res!121837) (not e!161238))))

(declare-fun lt!124493 () SeekEntryResult!1110)

(assert (=> b!248598 (= res!121837 (= (select (arr!5807 (_keys!6716 thiss!1504)) (index!6613 lt!124493)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248598 (and (bvsge (index!6613 lt!124493) #b00000000000000000000000000000000) (bvslt (index!6613 lt!124493) (size!6150 (_keys!6716 thiss!1504))))))

(declare-fun b!248599 () Bool)

(declare-fun e!161237 () Bool)

(assert (=> b!248599 (= e!161237 e!161239)))

(declare-fun res!121836 () Bool)

(declare-fun call!23311 () Bool)

(assert (=> b!248599 (= res!121836 call!23311)))

(assert (=> b!248599 (=> (not res!121836) (not e!161239))))

(declare-fun bm!23308 () Bool)

(declare-fun c!41659 () Bool)

(assert (=> bm!23308 (= call!23311 (inRange!0 (ite c!41659 (index!6610 lt!124493) (index!6613 lt!124493)) (mask!10740 thiss!1504)))))

(declare-fun b!248600 () Bool)

(declare-fun e!161240 () Bool)

(assert (=> b!248600 (= e!161237 e!161240)))

(declare-fun c!41658 () Bool)

(assert (=> b!248600 (= c!41658 ((_ is MissingVacant!1110) lt!124493))))

(declare-fun d!60565 () Bool)

(assert (=> d!60565 e!161237))

(assert (=> d!60565 (= c!41659 ((_ is MissingZero!1110) lt!124493))))

(assert (=> d!60565 (= lt!124493 (seekEntryOrOpen!0 key!932 (_keys!6716 thiss!1504) (mask!10740 thiss!1504)))))

(declare-fun lt!124492 () Unit!7686)

(declare-fun choose!1169 (array!12241 array!12239 (_ BitVec 32) (_ BitVec 32) V!8267 V!8267 (_ BitVec 64) Int) Unit!7686)

(assert (=> d!60565 (= lt!124492 (choose!1169 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) key!932 (defaultEntry!4592 thiss!1504)))))

(assert (=> d!60565 (validMask!0 (mask!10740 thiss!1504))))

(assert (=> d!60565 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!392 (_keys!6716 thiss!1504) (_values!4575 thiss!1504) (mask!10740 thiss!1504) (extraKeys!4329 thiss!1504) (zeroValue!4433 thiss!1504) (minValue!4433 thiss!1504) key!932 (defaultEntry!4592 thiss!1504)) lt!124492)))

(declare-fun b!248596 () Bool)

(assert (=> b!248596 (= e!161238 (not call!23312))))

(declare-fun bm!23309 () Bool)

(assert (=> bm!23309 (= call!23312 (arrayContainsKey!0 (_keys!6716 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248601 () Bool)

(assert (=> b!248601 (and (bvsge (index!6610 lt!124493) #b00000000000000000000000000000000) (bvslt (index!6610 lt!124493) (size!6150 (_keys!6716 thiss!1504))))))

(declare-fun res!121835 () Bool)

(assert (=> b!248601 (= res!121835 (= (select (arr!5807 (_keys!6716 thiss!1504)) (index!6610 lt!124493)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248601 (=> (not res!121835) (not e!161239))))

(declare-fun b!248602 () Bool)

(declare-fun res!121834 () Bool)

(assert (=> b!248602 (=> (not res!121834) (not e!161238))))

(assert (=> b!248602 (= res!121834 call!23311)))

(assert (=> b!248602 (= e!161240 e!161238)))

(declare-fun b!248603 () Bool)

(assert (=> b!248603 (= e!161240 ((_ is Undefined!1110) lt!124493))))

(assert (= (and d!60565 c!41659) b!248599))

(assert (= (and d!60565 (not c!41659)) b!248600))

(assert (= (and b!248599 res!121836) b!248601))

(assert (= (and b!248601 res!121835) b!248597))

(assert (= (and b!248600 c!41658) b!248602))

(assert (= (and b!248600 (not c!41658)) b!248603))

(assert (= (and b!248602 res!121834) b!248598))

(assert (= (and b!248598 res!121837) b!248596))

(assert (= (or b!248599 b!248602) bm!23308))

(assert (= (or b!248597 b!248596) bm!23309))

(declare-fun m!265315 () Bool)

(assert (=> bm!23308 m!265315))

(declare-fun m!265317 () Bool)

(assert (=> b!248598 m!265317))

(assert (=> bm!23309 m!265101))

(assert (=> d!60565 m!265093))

(declare-fun m!265319 () Bool)

(assert (=> d!60565 m!265319))

(assert (=> d!60565 m!265099))

(declare-fun m!265321 () Bool)

(assert (=> b!248601 m!265321))

(assert (=> b!248313 d!60565))

(declare-fun mapIsEmpty!10982 () Bool)

(declare-fun mapRes!10982 () Bool)

(assert (=> mapIsEmpty!10982 mapRes!10982))

(declare-fun b!248610 () Bool)

(declare-fun e!161246 () Bool)

(assert (=> b!248610 (= e!161246 tp_is_empty!6465)))

(declare-fun mapNonEmpty!10982 () Bool)

(declare-fun tp!23069 () Bool)

(assert (=> mapNonEmpty!10982 (= mapRes!10982 (and tp!23069 e!161246))))

(declare-fun mapRest!10982 () (Array (_ BitVec 32) ValueCell!2889))

(declare-fun mapValue!10982 () ValueCell!2889)

(declare-fun mapKey!10982 () (_ BitVec 32))

(assert (=> mapNonEmpty!10982 (= mapRest!10976 (store mapRest!10982 mapKey!10982 mapValue!10982))))

(declare-fun b!248611 () Bool)

(declare-fun e!161245 () Bool)

(assert (=> b!248611 (= e!161245 tp_is_empty!6465)))

(declare-fun condMapEmpty!10982 () Bool)

(declare-fun mapDefault!10982 () ValueCell!2889)

(assert (=> mapNonEmpty!10976 (= condMapEmpty!10982 (= mapRest!10976 ((as const (Array (_ BitVec 32) ValueCell!2889)) mapDefault!10982)))))

(assert (=> mapNonEmpty!10976 (= tp!23060 (and e!161245 mapRes!10982))))

(assert (= (and mapNonEmpty!10976 condMapEmpty!10982) mapIsEmpty!10982))

(assert (= (and mapNonEmpty!10976 (not condMapEmpty!10982)) mapNonEmpty!10982))

(assert (= (and mapNonEmpty!10982 ((_ is ValueCellFull!2889) mapValue!10982)) b!248610))

(assert (= (and mapNonEmpty!10976 ((_ is ValueCellFull!2889) mapDefault!10982)) b!248611))

(declare-fun m!265323 () Bool)

(assert (=> mapNonEmpty!10982 m!265323))

(declare-fun b_lambda!8057 () Bool)

(assert (= b_lambda!8055 (or (and b!248304 b_free!6603) b_lambda!8057)))

(check-sat (not b!248558) (not b!248493) (not d!60543) (not b!248519) (not b!248498) (not b!248517) (not bm!23289) (not b!248486) (not bm!23298) (not b!248575) (not b!248574) (not b!248565) (not bm!23309) (not bm!23303) (not b!248440) (not d!60533) (not d!60561) (not b!248554) (not b!248422) (not d!60565) (not d!60525) (not b!248572) (not d!60551) (not b_lambda!8057) (not b!248561) (not b!248408) (not bm!23308) (not b!248543) (not bm!23301) (not bm!23290) (not b!248442) (not mapNonEmpty!10982) (not b!248496) (not bm!23295) (not b!248557) (not b!248491) (not b!248573) (not d!60537) (not b_next!6603) (not b!248497) (not d!60559) (not b!248578) (not b!248541) tp_is_empty!6465 (not bm!23287) (not b!248433) (not bm!23286) (not b!248579) b_and!13611 (not b!248495) (not bm!23302) (not b!248490) (not d!60545) (not b!248530) (not b!248540))
(check-sat b_and!13611 (not b_next!6603))
