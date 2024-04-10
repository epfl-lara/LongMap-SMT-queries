; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24468 () Bool)

(assert start!24468)

(declare-fun b!256306 () Bool)

(declare-fun b_free!6717 () Bool)

(declare-fun b_next!6717 () Bool)

(assert (=> b!256306 (= b_free!6717 (not b_next!6717))))

(declare-fun tp!23451 () Bool)

(declare-fun b_and!13775 () Bool)

(assert (=> b!256306 (= tp!23451 b_and!13775)))

(declare-fun b!256293 () Bool)

(declare-fun e!166144 () Bool)

(declare-fun e!166147 () Bool)

(assert (=> b!256293 (= e!166144 (not e!166147))))

(declare-fun res!125391 () Bool)

(assert (=> b!256293 (=> res!125391 e!166147)))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8419 0))(
  ( (V!8420 (val!3334 Int)) )
))
(declare-datatypes ((ValueCell!2946 0))(
  ( (ValueCellFull!2946 (v!5420 V!8419)) (EmptyCell!2946) )
))
(declare-datatypes ((array!12497 0))(
  ( (array!12498 (arr!5920 (Array (_ BitVec 32) ValueCell!2946)) (size!6267 (_ BitVec 32))) )
))
(declare-datatypes ((array!12499 0))(
  ( (array!12500 (arr!5921 (Array (_ BitVec 32) (_ BitVec 64))) (size!6268 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3792 0))(
  ( (LongMapFixedSize!3793 (defaultEntry!4729 Int) (mask!11001 (_ BitVec 32)) (extraKeys!4466 (_ BitVec 32)) (zeroValue!4570 V!8419) (minValue!4570 V!8419) (_size!1945 (_ BitVec 32)) (_keys!6891 array!12499) (_values!4712 array!12497) (_vacant!1945 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3792)

(assert (=> b!256293 (= res!125391 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6268 (_keys!6891 thiss!1504))) (bvsge (size!6268 (_keys!6891 thiss!1504)) #b01111111111111111111111111111111)))))

(declare-fun lt!128672 () array!12499)

(declare-datatypes ((tuple2!4908 0))(
  ( (tuple2!4909 (_1!2465 (_ BitVec 64)) (_2!2465 V!8419)) )
))
(declare-datatypes ((List!3788 0))(
  ( (Nil!3785) (Cons!3784 (h!4446 tuple2!4908) (t!8843 List!3788)) )
))
(declare-datatypes ((ListLongMap!3821 0))(
  ( (ListLongMap!3822 (toList!1926 List!3788)) )
))
(declare-fun lt!128669 () ListLongMap!3821)

(declare-fun v!346 () V!8419)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun +!681 (ListLongMap!3821 tuple2!4908) ListLongMap!3821)

(declare-fun getCurrentListMap!1454 (array!12499 array!12497 (_ BitVec 32) (_ BitVec 32) V!8419 V!8419 (_ BitVec 32) Int) ListLongMap!3821)

(assert (=> b!256293 (= (+!681 lt!128669 (tuple2!4909 key!932 v!346)) (getCurrentListMap!1454 lt!128672 (array!12498 (store (arr!5920 (_values!4712 thiss!1504)) index!297 (ValueCellFull!2946 v!346)) (size!6267 (_values!4712 thiss!1504))) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)))))

(declare-datatypes ((Unit!7952 0))(
  ( (Unit!7953) )
))
(declare-fun lt!128679 () Unit!7952)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!91 (array!12499 array!12497 (_ BitVec 32) (_ BitVec 32) V!8419 V!8419 (_ BitVec 32) (_ BitVec 64) V!8419 Int) Unit!7952)

(assert (=> b!256293 (= lt!128679 (lemmaAddValidKeyToArrayThenAddPairToListMap!91 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) index!297 key!932 v!346 (defaultEntry!4729 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12499 (_ BitVec 32)) Bool)

(assert (=> b!256293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128672 (mask!11001 thiss!1504))))

(declare-fun lt!128675 () Unit!7952)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12499 (_ BitVec 32) (_ BitVec 32)) Unit!7952)

(assert (=> b!256293 (= lt!128675 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6891 thiss!1504) index!297 (mask!11001 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12499 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!256293 (= (arrayCountValidKeys!0 lt!128672 #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6891 thiss!1504) #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504)))))))

(declare-fun lt!128678 () Unit!7952)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12499 (_ BitVec 32) (_ BitVec 64)) Unit!7952)

(assert (=> b!256293 (= lt!128678 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6891 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3789 0))(
  ( (Nil!3786) (Cons!3785 (h!4447 (_ BitVec 64)) (t!8844 List!3789)) )
))
(declare-fun arrayNoDuplicates!0 (array!12499 (_ BitVec 32) List!3789) Bool)

(assert (=> b!256293 (arrayNoDuplicates!0 lt!128672 #b00000000000000000000000000000000 Nil!3786)))

(assert (=> b!256293 (= lt!128672 (array!12500 (store (arr!5921 (_keys!6891 thiss!1504)) index!297 key!932) (size!6268 (_keys!6891 thiss!1504))))))

(declare-fun lt!128674 () Unit!7952)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12499 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3789) Unit!7952)

(assert (=> b!256293 (= lt!128674 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6891 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3786))))

(declare-fun lt!128673 () Unit!7952)

(declare-fun e!166135 () Unit!7952)

(assert (=> b!256293 (= lt!128673 e!166135)))

(declare-fun c!43318 () Bool)

(declare-fun arrayContainsKey!0 (array!12499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!256293 (= c!43318 (arrayContainsKey!0 (_keys!6891 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!11196 () Bool)

(declare-fun mapRes!11196 () Bool)

(assert (=> mapIsEmpty!11196 mapRes!11196))

(declare-fun mapNonEmpty!11196 () Bool)

(declare-fun tp!23450 () Bool)

(declare-fun e!166146 () Bool)

(assert (=> mapNonEmpty!11196 (= mapRes!11196 (and tp!23450 e!166146))))

(declare-fun mapRest!11196 () (Array (_ BitVec 32) ValueCell!2946))

(declare-fun mapKey!11196 () (_ BitVec 32))

(declare-fun mapValue!11196 () ValueCell!2946)

(assert (=> mapNonEmpty!11196 (= (arr!5920 (_values!4712 thiss!1504)) (store mapRest!11196 mapKey!11196 mapValue!11196))))

(declare-fun b!256294 () Bool)

(declare-fun e!166137 () Unit!7952)

(declare-fun Unit!7954 () Unit!7952)

(assert (=> b!256294 (= e!166137 Unit!7954)))

(declare-fun lt!128671 () Unit!7952)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!427 (array!12499 array!12497 (_ BitVec 32) (_ BitVec 32) V!8419 V!8419 (_ BitVec 64) Int) Unit!7952)

(assert (=> b!256294 (= lt!128671 (lemmaInListMapThenSeekEntryOrOpenFindsIt!427 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) key!932 (defaultEntry!4729 thiss!1504)))))

(assert (=> b!256294 false))

(declare-fun b!256295 () Bool)

(declare-fun e!166133 () Bool)

(declare-fun call!24272 () Bool)

(assert (=> b!256295 (= e!166133 (not call!24272))))

(declare-fun b!256296 () Bool)

(declare-fun e!166138 () Bool)

(assert (=> b!256296 (= e!166138 e!166133)))

(declare-fun res!125395 () Bool)

(declare-fun call!24273 () Bool)

(assert (=> b!256296 (= res!125395 call!24273)))

(assert (=> b!256296 (=> (not res!125395) (not e!166133))))

(declare-fun b!256297 () Bool)

(declare-fun res!125394 () Bool)

(declare-fun e!166143 () Bool)

(assert (=> b!256297 (=> (not res!125394) (not e!166143))))

(declare-datatypes ((SeekEntryResult!1162 0))(
  ( (MissingZero!1162 (index!6818 (_ BitVec 32))) (Found!1162 (index!6819 (_ BitVec 32))) (Intermediate!1162 (undefined!1974 Bool) (index!6820 (_ BitVec 32)) (x!24958 (_ BitVec 32))) (Undefined!1162) (MissingVacant!1162 (index!6821 (_ BitVec 32))) )
))
(declare-fun lt!128670 () SeekEntryResult!1162)

(assert (=> b!256297 (= res!125394 (= (select (arr!5921 (_keys!6891 thiss!1504)) (index!6818 lt!128670)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256299 () Bool)

(declare-fun lt!128677 () Unit!7952)

(assert (=> b!256299 (= e!166137 lt!128677)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!430 (array!12499 array!12497 (_ BitVec 32) (_ BitVec 32) V!8419 V!8419 (_ BitVec 64) Int) Unit!7952)

(assert (=> b!256299 (= lt!128677 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!430 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) key!932 (defaultEntry!4729 thiss!1504)))))

(declare-fun c!43315 () Bool)

(get-info :version)

(assert (=> b!256299 (= c!43315 ((_ is MissingZero!1162) lt!128670))))

(declare-fun e!166136 () Bool)

(assert (=> b!256299 e!166136))

(declare-fun b!256300 () Bool)

(declare-fun tp_is_empty!6579 () Bool)

(assert (=> b!256300 (= e!166146 tp_is_empty!6579)))

(declare-fun b!256301 () Bool)

(declare-fun c!43317 () Bool)

(assert (=> b!256301 (= c!43317 ((_ is MissingVacant!1162) lt!128670))))

(assert (=> b!256301 (= e!166136 e!166138)))

(declare-fun b!256302 () Bool)

(declare-fun e!166140 () Bool)

(assert (=> b!256302 (= e!166140 e!166144)))

(declare-fun res!125397 () Bool)

(assert (=> b!256302 (=> (not res!125397) (not e!166144))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256302 (= res!125397 (inRange!0 index!297 (mask!11001 thiss!1504)))))

(declare-fun lt!128680 () Unit!7952)

(assert (=> b!256302 (= lt!128680 e!166137)))

(declare-fun c!43316 () Bool)

(declare-fun contains!1864 (ListLongMap!3821 (_ BitVec 64)) Bool)

(assert (=> b!256302 (= c!43316 (contains!1864 lt!128669 key!932))))

(assert (=> b!256302 (= lt!128669 (getCurrentListMap!1454 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)))))

(declare-fun b!256303 () Bool)

(declare-fun res!125389 () Bool)

(assert (=> b!256303 (= res!125389 (= (select (arr!5921 (_keys!6891 thiss!1504)) (index!6821 lt!128670)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256303 (=> (not res!125389) (not e!166133))))

(declare-fun bm!24269 () Bool)

(assert (=> bm!24269 (= call!24273 (inRange!0 (ite c!43315 (index!6818 lt!128670) (index!6821 lt!128670)) (mask!11001 thiss!1504)))))

(declare-fun b!256304 () Bool)

(assert (=> b!256304 (= e!166147 (arrayContainsKey!0 lt!128672 key!932 index!297))))

(declare-fun b!256305 () Bool)

(declare-fun e!166139 () Bool)

(assert (=> b!256305 (= e!166139 e!166140)))

(declare-fun res!125396 () Bool)

(assert (=> b!256305 (=> (not res!125396) (not e!166140))))

(assert (=> b!256305 (= res!125396 (or (= lt!128670 (MissingZero!1162 index!297)) (= lt!128670 (MissingVacant!1162 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12499 (_ BitVec 32)) SeekEntryResult!1162)

(assert (=> b!256305 (= lt!128670 (seekEntryOrOpen!0 key!932 (_keys!6891 thiss!1504) (mask!11001 thiss!1504)))))

(declare-fun e!166142 () Bool)

(declare-fun e!166134 () Bool)

(declare-fun array_inv!3913 (array!12499) Bool)

(declare-fun array_inv!3914 (array!12497) Bool)

(assert (=> b!256306 (= e!166134 (and tp!23451 tp_is_empty!6579 (array_inv!3913 (_keys!6891 thiss!1504)) (array_inv!3914 (_values!4712 thiss!1504)) e!166142))))

(declare-fun b!256307 () Bool)

(declare-fun Unit!7955 () Unit!7952)

(assert (=> b!256307 (= e!166135 Unit!7955)))

(declare-fun lt!128676 () Unit!7952)

(declare-fun lemmaArrayContainsKeyThenInListMap!233 (array!12499 array!12497 (_ BitVec 32) (_ BitVec 32) V!8419 V!8419 (_ BitVec 64) (_ BitVec 32) Int) Unit!7952)

(assert (=> b!256307 (= lt!128676 (lemmaArrayContainsKeyThenInListMap!233 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)))))

(assert (=> b!256307 false))

(declare-fun b!256308 () Bool)

(declare-fun Unit!7956 () Unit!7952)

(assert (=> b!256308 (= e!166135 Unit!7956)))

(declare-fun b!256309 () Bool)

(declare-fun e!166145 () Bool)

(assert (=> b!256309 (= e!166142 (and e!166145 mapRes!11196))))

(declare-fun condMapEmpty!11196 () Bool)

(declare-fun mapDefault!11196 () ValueCell!2946)

(assert (=> b!256309 (= condMapEmpty!11196 (= (arr!5920 (_values!4712 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2946)) mapDefault!11196)))))

(declare-fun b!256310 () Bool)

(assert (=> b!256310 (= e!166145 tp_is_empty!6579)))

(declare-fun bm!24270 () Bool)

(assert (=> bm!24270 (= call!24272 (arrayContainsKey!0 (_keys!6891 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256311 () Bool)

(assert (=> b!256311 (= e!166138 ((_ is Undefined!1162) lt!128670))))

(declare-fun b!256312 () Bool)

(assert (=> b!256312 (= e!166143 (not call!24272))))

(declare-fun b!256313 () Bool)

(declare-fun res!125390 () Bool)

(assert (=> b!256313 (=> (not res!125390) (not e!166139))))

(assert (=> b!256313 (= res!125390 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!256298 () Bool)

(declare-fun res!125393 () Bool)

(assert (=> b!256298 (=> (not res!125393) (not e!166143))))

(assert (=> b!256298 (= res!125393 call!24273)))

(assert (=> b!256298 (= e!166136 e!166143)))

(declare-fun res!125392 () Bool)

(assert (=> start!24468 (=> (not res!125392) (not e!166139))))

(declare-fun valid!1482 (LongMapFixedSize!3792) Bool)

(assert (=> start!24468 (= res!125392 (valid!1482 thiss!1504))))

(assert (=> start!24468 e!166139))

(assert (=> start!24468 e!166134))

(assert (=> start!24468 true))

(assert (=> start!24468 tp_is_empty!6579))

(assert (= (and start!24468 res!125392) b!256313))

(assert (= (and b!256313 res!125390) b!256305))

(assert (= (and b!256305 res!125396) b!256302))

(assert (= (and b!256302 c!43316) b!256294))

(assert (= (and b!256302 (not c!43316)) b!256299))

(assert (= (and b!256299 c!43315) b!256298))

(assert (= (and b!256299 (not c!43315)) b!256301))

(assert (= (and b!256298 res!125393) b!256297))

(assert (= (and b!256297 res!125394) b!256312))

(assert (= (and b!256301 c!43317) b!256296))

(assert (= (and b!256301 (not c!43317)) b!256311))

(assert (= (and b!256296 res!125395) b!256303))

(assert (= (and b!256303 res!125389) b!256295))

(assert (= (or b!256298 b!256296) bm!24269))

(assert (= (or b!256312 b!256295) bm!24270))

(assert (= (and b!256302 res!125397) b!256293))

(assert (= (and b!256293 c!43318) b!256307))

(assert (= (and b!256293 (not c!43318)) b!256308))

(assert (= (and b!256293 (not res!125391)) b!256304))

(assert (= (and b!256309 condMapEmpty!11196) mapIsEmpty!11196))

(assert (= (and b!256309 (not condMapEmpty!11196)) mapNonEmpty!11196))

(assert (= (and mapNonEmpty!11196 ((_ is ValueCellFull!2946) mapValue!11196)) b!256300))

(assert (= (and b!256309 ((_ is ValueCellFull!2946) mapDefault!11196)) b!256310))

(assert (= b!256306 b!256309))

(assert (= start!24468 b!256306))

(declare-fun m!271681 () Bool)

(assert (=> b!256306 m!271681))

(declare-fun m!271683 () Bool)

(assert (=> b!256306 m!271683))

(declare-fun m!271685 () Bool)

(assert (=> b!256303 m!271685))

(declare-fun m!271687 () Bool)

(assert (=> b!256294 m!271687))

(declare-fun m!271689 () Bool)

(assert (=> start!24468 m!271689))

(declare-fun m!271691 () Bool)

(assert (=> b!256302 m!271691))

(declare-fun m!271693 () Bool)

(assert (=> b!256302 m!271693))

(declare-fun m!271695 () Bool)

(assert (=> b!256302 m!271695))

(declare-fun m!271697 () Bool)

(assert (=> b!256297 m!271697))

(declare-fun m!271699 () Bool)

(assert (=> b!256299 m!271699))

(declare-fun m!271701 () Bool)

(assert (=> b!256305 m!271701))

(declare-fun m!271703 () Bool)

(assert (=> bm!24269 m!271703))

(declare-fun m!271705 () Bool)

(assert (=> mapNonEmpty!11196 m!271705))

(declare-fun m!271707 () Bool)

(assert (=> b!256304 m!271707))

(declare-fun m!271709 () Bool)

(assert (=> bm!24270 m!271709))

(assert (=> b!256293 m!271709))

(declare-fun m!271711 () Bool)

(assert (=> b!256293 m!271711))

(declare-fun m!271713 () Bool)

(assert (=> b!256293 m!271713))

(declare-fun m!271715 () Bool)

(assert (=> b!256293 m!271715))

(declare-fun m!271717 () Bool)

(assert (=> b!256293 m!271717))

(declare-fun m!271719 () Bool)

(assert (=> b!256293 m!271719))

(declare-fun m!271721 () Bool)

(assert (=> b!256293 m!271721))

(declare-fun m!271723 () Bool)

(assert (=> b!256293 m!271723))

(declare-fun m!271725 () Bool)

(assert (=> b!256293 m!271725))

(declare-fun m!271727 () Bool)

(assert (=> b!256293 m!271727))

(declare-fun m!271729 () Bool)

(assert (=> b!256293 m!271729))

(declare-fun m!271731 () Bool)

(assert (=> b!256293 m!271731))

(declare-fun m!271733 () Bool)

(assert (=> b!256293 m!271733))

(declare-fun m!271735 () Bool)

(assert (=> b!256307 m!271735))

(check-sat (not b!256302) (not b!256299) (not mapNonEmpty!11196) (not bm!24270) (not start!24468) tp_is_empty!6579 (not b!256307) (not b_next!6717) (not b!256306) (not b!256305) (not b!256304) (not b!256293) (not bm!24269) (not b!256294) b_and!13775)
(check-sat b_and!13775 (not b_next!6717))
(get-model)

(declare-fun d!61669 () Bool)

(declare-fun res!125429 () Bool)

(declare-fun e!166197 () Bool)

(assert (=> d!61669 (=> res!125429 e!166197)))

(assert (=> d!61669 (= res!125429 (= (select (arr!5921 lt!128672) index!297) key!932))))

(assert (=> d!61669 (= (arrayContainsKey!0 lt!128672 key!932 index!297) e!166197)))

(declare-fun b!256381 () Bool)

(declare-fun e!166198 () Bool)

(assert (=> b!256381 (= e!166197 e!166198)))

(declare-fun res!125430 () Bool)

(assert (=> b!256381 (=> (not res!125430) (not e!166198))))

(assert (=> b!256381 (= res!125430 (bvslt (bvadd index!297 #b00000000000000000000000000000001) (size!6268 lt!128672)))))

(declare-fun b!256382 () Bool)

(assert (=> b!256382 (= e!166198 (arrayContainsKey!0 lt!128672 key!932 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (= (and d!61669 (not res!125429)) b!256381))

(assert (= (and b!256381 res!125430) b!256382))

(declare-fun m!271793 () Bool)

(assert (=> d!61669 m!271793))

(declare-fun m!271795 () Bool)

(assert (=> b!256382 m!271795))

(assert (=> b!256304 d!61669))

(declare-fun d!61671 () Bool)

(declare-fun e!166201 () Bool)

(assert (=> d!61671 e!166201))

(declare-fun res!125436 () Bool)

(assert (=> d!61671 (=> (not res!125436) (not e!166201))))

(declare-fun lt!128722 () SeekEntryResult!1162)

(assert (=> d!61671 (= res!125436 ((_ is Found!1162) lt!128722))))

(assert (=> d!61671 (= lt!128722 (seekEntryOrOpen!0 key!932 (_keys!6891 thiss!1504) (mask!11001 thiss!1504)))))

(declare-fun lt!128721 () Unit!7952)

(declare-fun choose!1228 (array!12499 array!12497 (_ BitVec 32) (_ BitVec 32) V!8419 V!8419 (_ BitVec 64) Int) Unit!7952)

(assert (=> d!61671 (= lt!128721 (choose!1228 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) key!932 (defaultEntry!4729 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61671 (validMask!0 (mask!11001 thiss!1504))))

(assert (=> d!61671 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!427 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) key!932 (defaultEntry!4729 thiss!1504)) lt!128721)))

(declare-fun b!256387 () Bool)

(declare-fun res!125435 () Bool)

(assert (=> b!256387 (=> (not res!125435) (not e!166201))))

(assert (=> b!256387 (= res!125435 (inRange!0 (index!6819 lt!128722) (mask!11001 thiss!1504)))))

(declare-fun b!256388 () Bool)

(assert (=> b!256388 (= e!166201 (= (select (arr!5921 (_keys!6891 thiss!1504)) (index!6819 lt!128722)) key!932))))

(assert (=> b!256388 (and (bvsge (index!6819 lt!128722) #b00000000000000000000000000000000) (bvslt (index!6819 lt!128722) (size!6268 (_keys!6891 thiss!1504))))))

(assert (= (and d!61671 res!125436) b!256387))

(assert (= (and b!256387 res!125435) b!256388))

(assert (=> d!61671 m!271701))

(declare-fun m!271797 () Bool)

(assert (=> d!61671 m!271797))

(declare-fun m!271799 () Bool)

(assert (=> d!61671 m!271799))

(declare-fun m!271801 () Bool)

(assert (=> b!256387 m!271801))

(declare-fun m!271803 () Bool)

(assert (=> b!256388 m!271803))

(assert (=> b!256294 d!61671))

(declare-fun b!256405 () Bool)

(declare-fun lt!128727 () SeekEntryResult!1162)

(assert (=> b!256405 (and (bvsge (index!6818 lt!128727) #b00000000000000000000000000000000) (bvslt (index!6818 lt!128727) (size!6268 (_keys!6891 thiss!1504))))))

(declare-fun res!125446 () Bool)

(assert (=> b!256405 (= res!125446 (= (select (arr!5921 (_keys!6891 thiss!1504)) (index!6818 lt!128727)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166213 () Bool)

(assert (=> b!256405 (=> (not res!125446) (not e!166213))))

(declare-fun b!256406 () Bool)

(declare-fun call!24285 () Bool)

(assert (=> b!256406 (= e!166213 (not call!24285))))

(declare-fun b!256408 () Bool)

(declare-fun res!125447 () Bool)

(declare-fun e!166211 () Bool)

(assert (=> b!256408 (=> (not res!125447) (not e!166211))))

(assert (=> b!256408 (= res!125447 (= (select (arr!5921 (_keys!6891 thiss!1504)) (index!6821 lt!128727)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256408 (and (bvsge (index!6821 lt!128727) #b00000000000000000000000000000000) (bvslt (index!6821 lt!128727) (size!6268 (_keys!6891 thiss!1504))))))

(declare-fun b!256409 () Bool)

(declare-fun e!166210 () Bool)

(declare-fun e!166212 () Bool)

(assert (=> b!256409 (= e!166210 e!166212)))

(declare-fun c!43335 () Bool)

(assert (=> b!256409 (= c!43335 ((_ is MissingVacant!1162) lt!128727))))

(declare-fun b!256410 () Bool)

(assert (=> b!256410 (= e!166211 (not call!24285))))

(declare-fun b!256411 () Bool)

(assert (=> b!256411 (= e!166210 e!166213)))

(declare-fun res!125448 () Bool)

(declare-fun call!24284 () Bool)

(assert (=> b!256411 (= res!125448 call!24284)))

(assert (=> b!256411 (=> (not res!125448) (not e!166213))))

(declare-fun bm!24281 () Bool)

(declare-fun c!43336 () Bool)

(assert (=> bm!24281 (= call!24284 (inRange!0 (ite c!43336 (index!6818 lt!128727) (index!6821 lt!128727)) (mask!11001 thiss!1504)))))

(declare-fun b!256412 () Bool)

(declare-fun res!125445 () Bool)

(assert (=> b!256412 (=> (not res!125445) (not e!166211))))

(assert (=> b!256412 (= res!125445 call!24284)))

(assert (=> b!256412 (= e!166212 e!166211)))

(declare-fun bm!24282 () Bool)

(assert (=> bm!24282 (= call!24285 (arrayContainsKey!0 (_keys!6891 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256407 () Bool)

(assert (=> b!256407 (= e!166212 ((_ is Undefined!1162) lt!128727))))

(declare-fun d!61673 () Bool)

(assert (=> d!61673 e!166210))

(assert (=> d!61673 (= c!43336 ((_ is MissingZero!1162) lt!128727))))

(assert (=> d!61673 (= lt!128727 (seekEntryOrOpen!0 key!932 (_keys!6891 thiss!1504) (mask!11001 thiss!1504)))))

(declare-fun lt!128728 () Unit!7952)

(declare-fun choose!1229 (array!12499 array!12497 (_ BitVec 32) (_ BitVec 32) V!8419 V!8419 (_ BitVec 64) Int) Unit!7952)

(assert (=> d!61673 (= lt!128728 (choose!1229 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) key!932 (defaultEntry!4729 thiss!1504)))))

(assert (=> d!61673 (validMask!0 (mask!11001 thiss!1504))))

(assert (=> d!61673 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!430 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) key!932 (defaultEntry!4729 thiss!1504)) lt!128728)))

(assert (= (and d!61673 c!43336) b!256411))

(assert (= (and d!61673 (not c!43336)) b!256409))

(assert (= (and b!256411 res!125448) b!256405))

(assert (= (and b!256405 res!125446) b!256406))

(assert (= (and b!256409 c!43335) b!256412))

(assert (= (and b!256409 (not c!43335)) b!256407))

(assert (= (and b!256412 res!125445) b!256408))

(assert (= (and b!256408 res!125447) b!256410))

(assert (= (or b!256411 b!256412) bm!24281))

(assert (= (or b!256406 b!256410) bm!24282))

(assert (=> bm!24282 m!271709))

(declare-fun m!271805 () Bool)

(assert (=> b!256405 m!271805))

(declare-fun m!271807 () Bool)

(assert (=> b!256408 m!271807))

(assert (=> d!61673 m!271701))

(declare-fun m!271809 () Bool)

(assert (=> d!61673 m!271809))

(assert (=> d!61673 m!271799))

(declare-fun m!271811 () Bool)

(assert (=> bm!24281 m!271811))

(assert (=> b!256299 d!61673))

(declare-fun d!61675 () Bool)

(assert (=> d!61675 (= (inRange!0 (ite c!43315 (index!6818 lt!128670) (index!6821 lt!128670)) (mask!11001 thiss!1504)) (and (bvsge (ite c!43315 (index!6818 lt!128670) (index!6821 lt!128670)) #b00000000000000000000000000000000) (bvslt (ite c!43315 (index!6818 lt!128670) (index!6821 lt!128670)) (bvadd (mask!11001 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24269 d!61675))

(declare-fun d!61677 () Bool)

(assert (=> d!61677 (contains!1864 (getCurrentListMap!1454 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)) key!932)))

(declare-fun lt!128731 () Unit!7952)

(declare-fun choose!1230 (array!12499 array!12497 (_ BitVec 32) (_ BitVec 32) V!8419 V!8419 (_ BitVec 64) (_ BitVec 32) Int) Unit!7952)

(assert (=> d!61677 (= lt!128731 (choose!1230 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)))))

(assert (=> d!61677 (validMask!0 (mask!11001 thiss!1504))))

(assert (=> d!61677 (= (lemmaArrayContainsKeyThenInListMap!233 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)) lt!128731)))

(declare-fun bs!9071 () Bool)

(assert (= bs!9071 d!61677))

(assert (=> bs!9071 m!271695))

(assert (=> bs!9071 m!271695))

(declare-fun m!271813 () Bool)

(assert (=> bs!9071 m!271813))

(declare-fun m!271815 () Bool)

(assert (=> bs!9071 m!271815))

(assert (=> bs!9071 m!271799))

(assert (=> b!256307 d!61677))

(declare-fun d!61679 () Bool)

(assert (=> d!61679 (= (inRange!0 index!297 (mask!11001 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11001 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!256302 d!61679))

(declare-fun d!61681 () Bool)

(declare-fun e!166218 () Bool)

(assert (=> d!61681 e!166218))

(declare-fun res!125451 () Bool)

(assert (=> d!61681 (=> res!125451 e!166218)))

(declare-fun lt!128743 () Bool)

(assert (=> d!61681 (= res!125451 (not lt!128743))))

(declare-fun lt!128740 () Bool)

(assert (=> d!61681 (= lt!128743 lt!128740)))

(declare-fun lt!128741 () Unit!7952)

(declare-fun e!166219 () Unit!7952)

(assert (=> d!61681 (= lt!128741 e!166219)))

(declare-fun c!43339 () Bool)

(assert (=> d!61681 (= c!43339 lt!128740)))

(declare-fun containsKey!301 (List!3788 (_ BitVec 64)) Bool)

(assert (=> d!61681 (= lt!128740 (containsKey!301 (toList!1926 lt!128669) key!932))))

(assert (=> d!61681 (= (contains!1864 lt!128669 key!932) lt!128743)))

(declare-fun b!256419 () Bool)

(declare-fun lt!128742 () Unit!7952)

(assert (=> b!256419 (= e!166219 lt!128742)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!249 (List!3788 (_ BitVec 64)) Unit!7952)

(assert (=> b!256419 (= lt!128742 (lemmaContainsKeyImpliesGetValueByKeyDefined!249 (toList!1926 lt!128669) key!932))))

(declare-datatypes ((Option!315 0))(
  ( (Some!314 (v!5424 V!8419)) (None!313) )
))
(declare-fun isDefined!250 (Option!315) Bool)

(declare-fun getValueByKey!309 (List!3788 (_ BitVec 64)) Option!315)

(assert (=> b!256419 (isDefined!250 (getValueByKey!309 (toList!1926 lt!128669) key!932))))

(declare-fun b!256420 () Bool)

(declare-fun Unit!7962 () Unit!7952)

(assert (=> b!256420 (= e!166219 Unit!7962)))

(declare-fun b!256421 () Bool)

(assert (=> b!256421 (= e!166218 (isDefined!250 (getValueByKey!309 (toList!1926 lt!128669) key!932)))))

(assert (= (and d!61681 c!43339) b!256419))

(assert (= (and d!61681 (not c!43339)) b!256420))

(assert (= (and d!61681 (not res!125451)) b!256421))

(declare-fun m!271817 () Bool)

(assert (=> d!61681 m!271817))

(declare-fun m!271819 () Bool)

(assert (=> b!256419 m!271819))

(declare-fun m!271821 () Bool)

(assert (=> b!256419 m!271821))

(assert (=> b!256419 m!271821))

(declare-fun m!271823 () Bool)

(assert (=> b!256419 m!271823))

(assert (=> b!256421 m!271821))

(assert (=> b!256421 m!271821))

(assert (=> b!256421 m!271823))

(assert (=> b!256302 d!61681))

(declare-fun b!256464 () Bool)

(declare-fun e!166247 () Bool)

(declare-fun call!24301 () Bool)

(assert (=> b!256464 (= e!166247 (not call!24301))))

(declare-fun bm!24297 () Bool)

(declare-fun call!24305 () ListLongMap!3821)

(declare-fun call!24306 () ListLongMap!3821)

(assert (=> bm!24297 (= call!24305 call!24306)))

(declare-fun b!256465 () Bool)

(declare-fun e!166255 () Bool)

(declare-fun e!166258 () Bool)

(assert (=> b!256465 (= e!166255 e!166258)))

(declare-fun res!125471 () Bool)

(declare-fun call!24300 () Bool)

(assert (=> b!256465 (= res!125471 call!24300)))

(assert (=> b!256465 (=> (not res!125471) (not e!166258))))

(declare-fun b!256466 () Bool)

(declare-fun e!166250 () Unit!7952)

(declare-fun Unit!7963 () Unit!7952)

(assert (=> b!256466 (= e!166250 Unit!7963)))

(declare-fun b!256467 () Bool)

(declare-fun e!166256 () Bool)

(declare-fun e!166257 () Bool)

(assert (=> b!256467 (= e!166256 e!166257)))

(declare-fun res!125470 () Bool)

(assert (=> b!256467 (=> (not res!125470) (not e!166257))))

(declare-fun lt!128792 () ListLongMap!3821)

(assert (=> b!256467 (= res!125470 (contains!1864 lt!128792 (select (arr!5921 (_keys!6891 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!256467 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))))))

(declare-fun b!256468 () Bool)

(declare-fun e!166246 () ListLongMap!3821)

(assert (=> b!256468 (= e!166246 call!24305)))

(declare-fun bm!24298 () Bool)

(declare-fun call!24302 () ListLongMap!3821)

(declare-fun getCurrentListMapNoExtraKeys!573 (array!12499 array!12497 (_ BitVec 32) (_ BitVec 32) V!8419 V!8419 (_ BitVec 32) Int) ListLongMap!3821)

(assert (=> bm!24298 (= call!24302 (getCurrentListMapNoExtraKeys!573 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)))))

(declare-fun b!256469 () Bool)

(declare-fun call!24303 () ListLongMap!3821)

(assert (=> b!256469 (= e!166246 call!24303)))

(declare-fun b!256470 () Bool)

(declare-fun e!166248 () Bool)

(assert (=> b!256470 (= e!166248 e!166247)))

(declare-fun c!43357 () Bool)

(assert (=> b!256470 (= c!43357 (not (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256471 () Bool)

(declare-fun e!166251 () Bool)

(assert (=> b!256471 (= e!166247 e!166251)))

(declare-fun res!125476 () Bool)

(assert (=> b!256471 (= res!125476 call!24301)))

(assert (=> b!256471 (=> (not res!125476) (not e!166251))))

(declare-fun bm!24299 () Bool)

(assert (=> bm!24299 (= call!24300 (contains!1864 lt!128792 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256472 () Bool)

(assert (=> b!256472 (= e!166255 (not call!24300))))

(declare-fun b!256473 () Bool)

(declare-fun c!43356 () Bool)

(assert (=> b!256473 (= c!43356 (and (not (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!166249 () ListLongMap!3821)

(assert (=> b!256473 (= e!166249 e!166246)))

(declare-fun b!256474 () Bool)

(declare-fun e!166254 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!256474 (= e!166254 (validKeyInArray!0 (select (arr!5921 (_keys!6891 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!256475 () Bool)

(declare-fun apply!251 (ListLongMap!3821 (_ BitVec 64)) V!8419)

(assert (=> b!256475 (= e!166251 (= (apply!251 lt!128792 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4570 thiss!1504)))))

(declare-fun d!61683 () Bool)

(assert (=> d!61683 e!166248))

(declare-fun res!125478 () Bool)

(assert (=> d!61683 (=> (not res!125478) (not e!166248))))

(assert (=> d!61683 (= res!125478 (or (bvsge #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))))))))

(declare-fun lt!128809 () ListLongMap!3821)

(assert (=> d!61683 (= lt!128792 lt!128809)))

(declare-fun lt!128800 () Unit!7952)

(assert (=> d!61683 (= lt!128800 e!166250)))

(declare-fun c!43352 () Bool)

(assert (=> d!61683 (= c!43352 e!166254)))

(declare-fun res!125475 () Bool)

(assert (=> d!61683 (=> (not res!125475) (not e!166254))))

(assert (=> d!61683 (= res!125475 (bvslt #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))))))

(declare-fun e!166252 () ListLongMap!3821)

(assert (=> d!61683 (= lt!128809 e!166252)))

(declare-fun c!43353 () Bool)

(assert (=> d!61683 (= c!43353 (and (not (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61683 (validMask!0 (mask!11001 thiss!1504))))

(assert (=> d!61683 (= (getCurrentListMap!1454 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)) lt!128792)))

(declare-fun b!256476 () Bool)

(assert (=> b!256476 (= e!166252 e!166249)))

(declare-fun c!43354 () Bool)

(assert (=> b!256476 (= c!43354 (and (not (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256477 () Bool)

(declare-fun e!166253 () Bool)

(assert (=> b!256477 (= e!166253 (validKeyInArray!0 (select (arr!5921 (_keys!6891 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!256478 () Bool)

(assert (=> b!256478 (= e!166258 (= (apply!251 lt!128792 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4570 thiss!1504)))))

(declare-fun b!256479 () Bool)

(assert (=> b!256479 (= e!166252 (+!681 call!24306 (tuple2!4909 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4570 thiss!1504))))))

(declare-fun b!256480 () Bool)

(declare-fun res!125474 () Bool)

(assert (=> b!256480 (=> (not res!125474) (not e!166248))))

(assert (=> b!256480 (= res!125474 e!166255)))

(declare-fun c!43355 () Bool)

(assert (=> b!256480 (= c!43355 (not (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24300 () Bool)

(declare-fun call!24304 () ListLongMap!3821)

(assert (=> bm!24300 (= call!24303 call!24304)))

(declare-fun b!256481 () Bool)

(declare-fun res!125473 () Bool)

(assert (=> b!256481 (=> (not res!125473) (not e!166248))))

(assert (=> b!256481 (= res!125473 e!166256)))

(declare-fun res!125472 () Bool)

(assert (=> b!256481 (=> res!125472 e!166256)))

(assert (=> b!256481 (= res!125472 (not e!166253))))

(declare-fun res!125477 () Bool)

(assert (=> b!256481 (=> (not res!125477) (not e!166253))))

(assert (=> b!256481 (= res!125477 (bvslt #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))))))

(declare-fun b!256482 () Bool)

(assert (=> b!256482 (= e!166249 call!24305)))

(declare-fun b!256483 () Bool)

(declare-fun lt!128790 () Unit!7952)

(assert (=> b!256483 (= e!166250 lt!128790)))

(declare-fun lt!128807 () ListLongMap!3821)

(assert (=> b!256483 (= lt!128807 (getCurrentListMapNoExtraKeys!573 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)))))

(declare-fun lt!128795 () (_ BitVec 64))

(assert (=> b!256483 (= lt!128795 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128806 () (_ BitVec 64))

(assert (=> b!256483 (= lt!128806 (select (arr!5921 (_keys!6891 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128803 () Unit!7952)

(declare-fun addStillContains!227 (ListLongMap!3821 (_ BitVec 64) V!8419 (_ BitVec 64)) Unit!7952)

(assert (=> b!256483 (= lt!128803 (addStillContains!227 lt!128807 lt!128795 (zeroValue!4570 thiss!1504) lt!128806))))

(assert (=> b!256483 (contains!1864 (+!681 lt!128807 (tuple2!4909 lt!128795 (zeroValue!4570 thiss!1504))) lt!128806)))

(declare-fun lt!128793 () Unit!7952)

(assert (=> b!256483 (= lt!128793 lt!128803)))

(declare-fun lt!128791 () ListLongMap!3821)

(assert (=> b!256483 (= lt!128791 (getCurrentListMapNoExtraKeys!573 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)))))

(declare-fun lt!128805 () (_ BitVec 64))

(assert (=> b!256483 (= lt!128805 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128788 () (_ BitVec 64))

(assert (=> b!256483 (= lt!128788 (select (arr!5921 (_keys!6891 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128808 () Unit!7952)

(declare-fun addApplyDifferent!227 (ListLongMap!3821 (_ BitVec 64) V!8419 (_ BitVec 64)) Unit!7952)

(assert (=> b!256483 (= lt!128808 (addApplyDifferent!227 lt!128791 lt!128805 (minValue!4570 thiss!1504) lt!128788))))

(assert (=> b!256483 (= (apply!251 (+!681 lt!128791 (tuple2!4909 lt!128805 (minValue!4570 thiss!1504))) lt!128788) (apply!251 lt!128791 lt!128788))))

(declare-fun lt!128804 () Unit!7952)

(assert (=> b!256483 (= lt!128804 lt!128808)))

(declare-fun lt!128797 () ListLongMap!3821)

(assert (=> b!256483 (= lt!128797 (getCurrentListMapNoExtraKeys!573 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)))))

(declare-fun lt!128794 () (_ BitVec 64))

(assert (=> b!256483 (= lt!128794 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128789 () (_ BitVec 64))

(assert (=> b!256483 (= lt!128789 (select (arr!5921 (_keys!6891 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128799 () Unit!7952)

(assert (=> b!256483 (= lt!128799 (addApplyDifferent!227 lt!128797 lt!128794 (zeroValue!4570 thiss!1504) lt!128789))))

(assert (=> b!256483 (= (apply!251 (+!681 lt!128797 (tuple2!4909 lt!128794 (zeroValue!4570 thiss!1504))) lt!128789) (apply!251 lt!128797 lt!128789))))

(declare-fun lt!128796 () Unit!7952)

(assert (=> b!256483 (= lt!128796 lt!128799)))

(declare-fun lt!128798 () ListLongMap!3821)

(assert (=> b!256483 (= lt!128798 (getCurrentListMapNoExtraKeys!573 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)))))

(declare-fun lt!128801 () (_ BitVec 64))

(assert (=> b!256483 (= lt!128801 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128802 () (_ BitVec 64))

(assert (=> b!256483 (= lt!128802 (select (arr!5921 (_keys!6891 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256483 (= lt!128790 (addApplyDifferent!227 lt!128798 lt!128801 (minValue!4570 thiss!1504) lt!128802))))

(assert (=> b!256483 (= (apply!251 (+!681 lt!128798 (tuple2!4909 lt!128801 (minValue!4570 thiss!1504))) lt!128802) (apply!251 lt!128798 lt!128802))))

(declare-fun b!256484 () Bool)

(declare-fun get!3044 (ValueCell!2946 V!8419) V!8419)

(declare-fun dynLambda!594 (Int (_ BitVec 64)) V!8419)

(assert (=> b!256484 (= e!166257 (= (apply!251 lt!128792 (select (arr!5921 (_keys!6891 thiss!1504)) #b00000000000000000000000000000000)) (get!3044 (select (arr!5920 (_values!4712 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!594 (defaultEntry!4729 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256484 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6267 (_values!4712 thiss!1504))))))

(assert (=> b!256484 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))))))

(declare-fun bm!24301 () Bool)

(assert (=> bm!24301 (= call!24301 (contains!1864 lt!128792 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24302 () Bool)

(assert (=> bm!24302 (= call!24304 call!24302)))

(declare-fun bm!24303 () Bool)

(assert (=> bm!24303 (= call!24306 (+!681 (ite c!43353 call!24302 (ite c!43354 call!24304 call!24303)) (ite (or c!43353 c!43354) (tuple2!4909 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4570 thiss!1504)) (tuple2!4909 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4570 thiss!1504)))))))

(assert (= (and d!61683 c!43353) b!256479))

(assert (= (and d!61683 (not c!43353)) b!256476))

(assert (= (and b!256476 c!43354) b!256482))

(assert (= (and b!256476 (not c!43354)) b!256473))

(assert (= (and b!256473 c!43356) b!256468))

(assert (= (and b!256473 (not c!43356)) b!256469))

(assert (= (or b!256468 b!256469) bm!24300))

(assert (= (or b!256482 bm!24300) bm!24302))

(assert (= (or b!256482 b!256468) bm!24297))

(assert (= (or b!256479 bm!24302) bm!24298))

(assert (= (or b!256479 bm!24297) bm!24303))

(assert (= (and d!61683 res!125475) b!256474))

(assert (= (and d!61683 c!43352) b!256483))

(assert (= (and d!61683 (not c!43352)) b!256466))

(assert (= (and d!61683 res!125478) b!256481))

(assert (= (and b!256481 res!125477) b!256477))

(assert (= (and b!256481 (not res!125472)) b!256467))

(assert (= (and b!256467 res!125470) b!256484))

(assert (= (and b!256481 res!125473) b!256480))

(assert (= (and b!256480 c!43355) b!256465))

(assert (= (and b!256480 (not c!43355)) b!256472))

(assert (= (and b!256465 res!125471) b!256478))

(assert (= (or b!256465 b!256472) bm!24299))

(assert (= (and b!256480 res!125474) b!256470))

(assert (= (and b!256470 c!43357) b!256471))

(assert (= (and b!256470 (not c!43357)) b!256464))

(assert (= (and b!256471 res!125476) b!256475))

(assert (= (or b!256471 b!256464) bm!24301))

(declare-fun b_lambda!8163 () Bool)

(assert (=> (not b_lambda!8163) (not b!256484)))

(declare-fun t!8848 () Bool)

(declare-fun tb!3015 () Bool)

(assert (=> (and b!256306 (= (defaultEntry!4729 thiss!1504) (defaultEntry!4729 thiss!1504)) t!8848) tb!3015))

(declare-fun result!5367 () Bool)

(assert (=> tb!3015 (= result!5367 tp_is_empty!6579)))

(assert (=> b!256484 t!8848))

(declare-fun b_and!13779 () Bool)

(assert (= b_and!13775 (and (=> t!8848 result!5367) b_and!13779)))

(declare-fun m!271825 () Bool)

(assert (=> b!256479 m!271825))

(declare-fun m!271827 () Bool)

(assert (=> b!256467 m!271827))

(assert (=> b!256467 m!271827))

(declare-fun m!271829 () Bool)

(assert (=> b!256467 m!271829))

(declare-fun m!271831 () Bool)

(assert (=> bm!24298 m!271831))

(declare-fun m!271833 () Bool)

(assert (=> bm!24299 m!271833))

(assert (=> b!256477 m!271827))

(assert (=> b!256477 m!271827))

(declare-fun m!271835 () Bool)

(assert (=> b!256477 m!271835))

(declare-fun m!271837 () Bool)

(assert (=> bm!24301 m!271837))

(declare-fun m!271839 () Bool)

(assert (=> b!256475 m!271839))

(assert (=> b!256483 m!271831))

(declare-fun m!271841 () Bool)

(assert (=> b!256483 m!271841))

(declare-fun m!271843 () Bool)

(assert (=> b!256483 m!271843))

(declare-fun m!271845 () Bool)

(assert (=> b!256483 m!271845))

(declare-fun m!271847 () Bool)

(assert (=> b!256483 m!271847))

(declare-fun m!271849 () Bool)

(assert (=> b!256483 m!271849))

(declare-fun m!271851 () Bool)

(assert (=> b!256483 m!271851))

(declare-fun m!271853 () Bool)

(assert (=> b!256483 m!271853))

(declare-fun m!271855 () Bool)

(assert (=> b!256483 m!271855))

(declare-fun m!271857 () Bool)

(assert (=> b!256483 m!271857))

(assert (=> b!256483 m!271827))

(declare-fun m!271859 () Bool)

(assert (=> b!256483 m!271859))

(assert (=> b!256483 m!271855))

(declare-fun m!271861 () Bool)

(assert (=> b!256483 m!271861))

(assert (=> b!256483 m!271843))

(declare-fun m!271863 () Bool)

(assert (=> b!256483 m!271863))

(declare-fun m!271865 () Bool)

(assert (=> b!256483 m!271865))

(declare-fun m!271867 () Bool)

(assert (=> b!256483 m!271867))

(assert (=> b!256483 m!271851))

(assert (=> b!256483 m!271865))

(declare-fun m!271869 () Bool)

(assert (=> b!256483 m!271869))

(declare-fun m!271871 () Bool)

(assert (=> bm!24303 m!271871))

(declare-fun m!271873 () Bool)

(assert (=> b!256484 m!271873))

(declare-fun m!271875 () Bool)

(assert (=> b!256484 m!271875))

(declare-fun m!271877 () Bool)

(assert (=> b!256484 m!271877))

(assert (=> b!256484 m!271827))

(declare-fun m!271879 () Bool)

(assert (=> b!256484 m!271879))

(assert (=> b!256484 m!271875))

(assert (=> b!256484 m!271827))

(assert (=> b!256484 m!271873))

(declare-fun m!271881 () Bool)

(assert (=> b!256478 m!271881))

(assert (=> b!256474 m!271827))

(assert (=> b!256474 m!271827))

(assert (=> b!256474 m!271835))

(assert (=> d!61683 m!271799))

(assert (=> b!256302 d!61683))

(declare-fun d!61685 () Bool)

(assert (=> d!61685 (= (array_inv!3913 (_keys!6891 thiss!1504)) (bvsge (size!6268 (_keys!6891 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256306 d!61685))

(declare-fun d!61687 () Bool)

(assert (=> d!61687 (= (array_inv!3914 (_values!4712 thiss!1504)) (bvsge (size!6267 (_values!4712 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256306 d!61687))

(declare-fun b!256496 () Bool)

(declare-fun res!125490 () Bool)

(declare-fun e!166264 () Bool)

(assert (=> b!256496 (=> (not res!125490) (not e!166264))))

(assert (=> b!256496 (= res!125490 (validKeyInArray!0 key!932))))

(declare-fun b!256498 () Bool)

(declare-fun e!166263 () Bool)

(assert (=> b!256498 (= e!166263 (= (arrayCountValidKeys!0 (array!12500 (store (arr!5921 (_keys!6891 thiss!1504)) index!297 key!932) (size!6268 (_keys!6891 thiss!1504))) #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6891 thiss!1504) #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!61689 () Bool)

(assert (=> d!61689 e!166263))

(declare-fun res!125489 () Bool)

(assert (=> d!61689 (=> (not res!125489) (not e!166263))))

(assert (=> d!61689 (= res!125489 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6268 (_keys!6891 thiss!1504)))))))

(declare-fun lt!128812 () Unit!7952)

(declare-fun choose!1 (array!12499 (_ BitVec 32) (_ BitVec 64)) Unit!7952)

(assert (=> d!61689 (= lt!128812 (choose!1 (_keys!6891 thiss!1504) index!297 key!932))))

(assert (=> d!61689 e!166264))

(declare-fun res!125487 () Bool)

(assert (=> d!61689 (=> (not res!125487) (not e!166264))))

(assert (=> d!61689 (= res!125487 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6268 (_keys!6891 thiss!1504)))))))

(assert (=> d!61689 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6891 thiss!1504) index!297 key!932) lt!128812)))

(declare-fun b!256497 () Bool)

(assert (=> b!256497 (= e!166264 (bvslt (size!6268 (_keys!6891 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!256495 () Bool)

(declare-fun res!125488 () Bool)

(assert (=> b!256495 (=> (not res!125488) (not e!166264))))

(assert (=> b!256495 (= res!125488 (not (validKeyInArray!0 (select (arr!5921 (_keys!6891 thiss!1504)) index!297))))))

(assert (= (and d!61689 res!125487) b!256495))

(assert (= (and b!256495 res!125488) b!256496))

(assert (= (and b!256496 res!125490) b!256497))

(assert (= (and d!61689 res!125489) b!256498))

(declare-fun m!271883 () Bool)

(assert (=> b!256496 m!271883))

(assert (=> b!256498 m!271727))

(declare-fun m!271885 () Bool)

(assert (=> b!256498 m!271885))

(assert (=> b!256498 m!271729))

(declare-fun m!271887 () Bool)

(assert (=> d!61689 m!271887))

(declare-fun m!271889 () Bool)

(assert (=> b!256495 m!271889))

(assert (=> b!256495 m!271889))

(declare-fun m!271891 () Bool)

(assert (=> b!256495 m!271891))

(assert (=> b!256293 d!61689))

(declare-fun b!256499 () Bool)

(declare-fun e!166266 () Bool)

(declare-fun call!24308 () Bool)

(assert (=> b!256499 (= e!166266 (not call!24308))))

(declare-fun bm!24304 () Bool)

(declare-fun call!24312 () ListLongMap!3821)

(declare-fun call!24313 () ListLongMap!3821)

(assert (=> bm!24304 (= call!24312 call!24313)))

(declare-fun b!256500 () Bool)

(declare-fun e!166274 () Bool)

(declare-fun e!166277 () Bool)

(assert (=> b!256500 (= e!166274 e!166277)))

(declare-fun res!125492 () Bool)

(declare-fun call!24307 () Bool)

(assert (=> b!256500 (= res!125492 call!24307)))

(assert (=> b!256500 (=> (not res!125492) (not e!166277))))

(declare-fun b!256501 () Bool)

(declare-fun e!166269 () Unit!7952)

(declare-fun Unit!7964 () Unit!7952)

(assert (=> b!256501 (= e!166269 Unit!7964)))

(declare-fun b!256502 () Bool)

(declare-fun e!166275 () Bool)

(declare-fun e!166276 () Bool)

(assert (=> b!256502 (= e!166275 e!166276)))

(declare-fun res!125491 () Bool)

(assert (=> b!256502 (=> (not res!125491) (not e!166276))))

(declare-fun lt!128817 () ListLongMap!3821)

(assert (=> b!256502 (= res!125491 (contains!1864 lt!128817 (select (arr!5921 lt!128672) #b00000000000000000000000000000000)))))

(assert (=> b!256502 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6268 lt!128672)))))

(declare-fun b!256503 () Bool)

(declare-fun e!166265 () ListLongMap!3821)

(assert (=> b!256503 (= e!166265 call!24312)))

(declare-fun call!24309 () ListLongMap!3821)

(declare-fun bm!24305 () Bool)

(assert (=> bm!24305 (= call!24309 (getCurrentListMapNoExtraKeys!573 lt!128672 (array!12498 (store (arr!5920 (_values!4712 thiss!1504)) index!297 (ValueCellFull!2946 v!346)) (size!6267 (_values!4712 thiss!1504))) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)))))

(declare-fun b!256504 () Bool)

(declare-fun call!24310 () ListLongMap!3821)

(assert (=> b!256504 (= e!166265 call!24310)))

(declare-fun b!256505 () Bool)

(declare-fun e!166267 () Bool)

(assert (=> b!256505 (= e!166267 e!166266)))

(declare-fun c!43363 () Bool)

(assert (=> b!256505 (= c!43363 (not (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256506 () Bool)

(declare-fun e!166270 () Bool)

(assert (=> b!256506 (= e!166266 e!166270)))

(declare-fun res!125497 () Bool)

(assert (=> b!256506 (= res!125497 call!24308)))

(assert (=> b!256506 (=> (not res!125497) (not e!166270))))

(declare-fun bm!24306 () Bool)

(assert (=> bm!24306 (= call!24307 (contains!1864 lt!128817 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256507 () Bool)

(assert (=> b!256507 (= e!166274 (not call!24307))))

(declare-fun b!256508 () Bool)

(declare-fun c!43362 () Bool)

(assert (=> b!256508 (= c!43362 (and (not (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!166268 () ListLongMap!3821)

(assert (=> b!256508 (= e!166268 e!166265)))

(declare-fun b!256509 () Bool)

(declare-fun e!166273 () Bool)

(assert (=> b!256509 (= e!166273 (validKeyInArray!0 (select (arr!5921 lt!128672) #b00000000000000000000000000000000)))))

(declare-fun b!256510 () Bool)

(assert (=> b!256510 (= e!166270 (= (apply!251 lt!128817 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4570 thiss!1504)))))

(declare-fun d!61691 () Bool)

(assert (=> d!61691 e!166267))

(declare-fun res!125499 () Bool)

(assert (=> d!61691 (=> (not res!125499) (not e!166267))))

(assert (=> d!61691 (= res!125499 (or (bvsge #b00000000000000000000000000000000 (size!6268 lt!128672)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6268 lt!128672)))))))

(declare-fun lt!128834 () ListLongMap!3821)

(assert (=> d!61691 (= lt!128817 lt!128834)))

(declare-fun lt!128825 () Unit!7952)

(assert (=> d!61691 (= lt!128825 e!166269)))

(declare-fun c!43358 () Bool)

(assert (=> d!61691 (= c!43358 e!166273)))

(declare-fun res!125496 () Bool)

(assert (=> d!61691 (=> (not res!125496) (not e!166273))))

(assert (=> d!61691 (= res!125496 (bvslt #b00000000000000000000000000000000 (size!6268 lt!128672)))))

(declare-fun e!166271 () ListLongMap!3821)

(assert (=> d!61691 (= lt!128834 e!166271)))

(declare-fun c!43359 () Bool)

(assert (=> d!61691 (= c!43359 (and (not (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61691 (validMask!0 (mask!11001 thiss!1504))))

(assert (=> d!61691 (= (getCurrentListMap!1454 lt!128672 (array!12498 (store (arr!5920 (_values!4712 thiss!1504)) index!297 (ValueCellFull!2946 v!346)) (size!6267 (_values!4712 thiss!1504))) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)) lt!128817)))

(declare-fun b!256511 () Bool)

(assert (=> b!256511 (= e!166271 e!166268)))

(declare-fun c!43360 () Bool)

(assert (=> b!256511 (= c!43360 (and (not (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256512 () Bool)

(declare-fun e!166272 () Bool)

(assert (=> b!256512 (= e!166272 (validKeyInArray!0 (select (arr!5921 lt!128672) #b00000000000000000000000000000000)))))

(declare-fun b!256513 () Bool)

(assert (=> b!256513 (= e!166277 (= (apply!251 lt!128817 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4570 thiss!1504)))))

(declare-fun b!256514 () Bool)

(assert (=> b!256514 (= e!166271 (+!681 call!24313 (tuple2!4909 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4570 thiss!1504))))))

(declare-fun b!256515 () Bool)

(declare-fun res!125495 () Bool)

(assert (=> b!256515 (=> (not res!125495) (not e!166267))))

(assert (=> b!256515 (= res!125495 e!166274)))

(declare-fun c!43361 () Bool)

(assert (=> b!256515 (= c!43361 (not (= (bvand (extraKeys!4466 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24307 () Bool)

(declare-fun call!24311 () ListLongMap!3821)

(assert (=> bm!24307 (= call!24310 call!24311)))

(declare-fun b!256516 () Bool)

(declare-fun res!125494 () Bool)

(assert (=> b!256516 (=> (not res!125494) (not e!166267))))

(assert (=> b!256516 (= res!125494 e!166275)))

(declare-fun res!125493 () Bool)

(assert (=> b!256516 (=> res!125493 e!166275)))

(assert (=> b!256516 (= res!125493 (not e!166272))))

(declare-fun res!125498 () Bool)

(assert (=> b!256516 (=> (not res!125498) (not e!166272))))

(assert (=> b!256516 (= res!125498 (bvslt #b00000000000000000000000000000000 (size!6268 lt!128672)))))

(declare-fun b!256517 () Bool)

(assert (=> b!256517 (= e!166268 call!24312)))

(declare-fun b!256518 () Bool)

(declare-fun lt!128815 () Unit!7952)

(assert (=> b!256518 (= e!166269 lt!128815)))

(declare-fun lt!128832 () ListLongMap!3821)

(assert (=> b!256518 (= lt!128832 (getCurrentListMapNoExtraKeys!573 lt!128672 (array!12498 (store (arr!5920 (_values!4712 thiss!1504)) index!297 (ValueCellFull!2946 v!346)) (size!6267 (_values!4712 thiss!1504))) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)))))

(declare-fun lt!128820 () (_ BitVec 64))

(assert (=> b!256518 (= lt!128820 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128831 () (_ BitVec 64))

(assert (=> b!256518 (= lt!128831 (select (arr!5921 lt!128672) #b00000000000000000000000000000000))))

(declare-fun lt!128828 () Unit!7952)

(assert (=> b!256518 (= lt!128828 (addStillContains!227 lt!128832 lt!128820 (zeroValue!4570 thiss!1504) lt!128831))))

(assert (=> b!256518 (contains!1864 (+!681 lt!128832 (tuple2!4909 lt!128820 (zeroValue!4570 thiss!1504))) lt!128831)))

(declare-fun lt!128818 () Unit!7952)

(assert (=> b!256518 (= lt!128818 lt!128828)))

(declare-fun lt!128816 () ListLongMap!3821)

(assert (=> b!256518 (= lt!128816 (getCurrentListMapNoExtraKeys!573 lt!128672 (array!12498 (store (arr!5920 (_values!4712 thiss!1504)) index!297 (ValueCellFull!2946 v!346)) (size!6267 (_values!4712 thiss!1504))) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)))))

(declare-fun lt!128830 () (_ BitVec 64))

(assert (=> b!256518 (= lt!128830 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128813 () (_ BitVec 64))

(assert (=> b!256518 (= lt!128813 (select (arr!5921 lt!128672) #b00000000000000000000000000000000))))

(declare-fun lt!128833 () Unit!7952)

(assert (=> b!256518 (= lt!128833 (addApplyDifferent!227 lt!128816 lt!128830 (minValue!4570 thiss!1504) lt!128813))))

(assert (=> b!256518 (= (apply!251 (+!681 lt!128816 (tuple2!4909 lt!128830 (minValue!4570 thiss!1504))) lt!128813) (apply!251 lt!128816 lt!128813))))

(declare-fun lt!128829 () Unit!7952)

(assert (=> b!256518 (= lt!128829 lt!128833)))

(declare-fun lt!128822 () ListLongMap!3821)

(assert (=> b!256518 (= lt!128822 (getCurrentListMapNoExtraKeys!573 lt!128672 (array!12498 (store (arr!5920 (_values!4712 thiss!1504)) index!297 (ValueCellFull!2946 v!346)) (size!6267 (_values!4712 thiss!1504))) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)))))

(declare-fun lt!128819 () (_ BitVec 64))

(assert (=> b!256518 (= lt!128819 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128814 () (_ BitVec 64))

(assert (=> b!256518 (= lt!128814 (select (arr!5921 lt!128672) #b00000000000000000000000000000000))))

(declare-fun lt!128824 () Unit!7952)

(assert (=> b!256518 (= lt!128824 (addApplyDifferent!227 lt!128822 lt!128819 (zeroValue!4570 thiss!1504) lt!128814))))

(assert (=> b!256518 (= (apply!251 (+!681 lt!128822 (tuple2!4909 lt!128819 (zeroValue!4570 thiss!1504))) lt!128814) (apply!251 lt!128822 lt!128814))))

(declare-fun lt!128821 () Unit!7952)

(assert (=> b!256518 (= lt!128821 lt!128824)))

(declare-fun lt!128823 () ListLongMap!3821)

(assert (=> b!256518 (= lt!128823 (getCurrentListMapNoExtraKeys!573 lt!128672 (array!12498 (store (arr!5920 (_values!4712 thiss!1504)) index!297 (ValueCellFull!2946 v!346)) (size!6267 (_values!4712 thiss!1504))) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)))))

(declare-fun lt!128826 () (_ BitVec 64))

(assert (=> b!256518 (= lt!128826 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128827 () (_ BitVec 64))

(assert (=> b!256518 (= lt!128827 (select (arr!5921 lt!128672) #b00000000000000000000000000000000))))

(assert (=> b!256518 (= lt!128815 (addApplyDifferent!227 lt!128823 lt!128826 (minValue!4570 thiss!1504) lt!128827))))

(assert (=> b!256518 (= (apply!251 (+!681 lt!128823 (tuple2!4909 lt!128826 (minValue!4570 thiss!1504))) lt!128827) (apply!251 lt!128823 lt!128827))))

(declare-fun b!256519 () Bool)

(assert (=> b!256519 (= e!166276 (= (apply!251 lt!128817 (select (arr!5921 lt!128672) #b00000000000000000000000000000000)) (get!3044 (select (arr!5920 (array!12498 (store (arr!5920 (_values!4712 thiss!1504)) index!297 (ValueCellFull!2946 v!346)) (size!6267 (_values!4712 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!594 (defaultEntry!4729 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256519 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6267 (array!12498 (store (arr!5920 (_values!4712 thiss!1504)) index!297 (ValueCellFull!2946 v!346)) (size!6267 (_values!4712 thiss!1504))))))))

(assert (=> b!256519 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6268 lt!128672)))))

(declare-fun bm!24308 () Bool)

(assert (=> bm!24308 (= call!24308 (contains!1864 lt!128817 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24309 () Bool)

(assert (=> bm!24309 (= call!24311 call!24309)))

(declare-fun bm!24310 () Bool)

(assert (=> bm!24310 (= call!24313 (+!681 (ite c!43359 call!24309 (ite c!43360 call!24311 call!24310)) (ite (or c!43359 c!43360) (tuple2!4909 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4570 thiss!1504)) (tuple2!4909 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4570 thiss!1504)))))))

(assert (= (and d!61691 c!43359) b!256514))

(assert (= (and d!61691 (not c!43359)) b!256511))

(assert (= (and b!256511 c!43360) b!256517))

(assert (= (and b!256511 (not c!43360)) b!256508))

(assert (= (and b!256508 c!43362) b!256503))

(assert (= (and b!256508 (not c!43362)) b!256504))

(assert (= (or b!256503 b!256504) bm!24307))

(assert (= (or b!256517 bm!24307) bm!24309))

(assert (= (or b!256517 b!256503) bm!24304))

(assert (= (or b!256514 bm!24309) bm!24305))

(assert (= (or b!256514 bm!24304) bm!24310))

(assert (= (and d!61691 res!125496) b!256509))

(assert (= (and d!61691 c!43358) b!256518))

(assert (= (and d!61691 (not c!43358)) b!256501))

(assert (= (and d!61691 res!125499) b!256516))

(assert (= (and b!256516 res!125498) b!256512))

(assert (= (and b!256516 (not res!125493)) b!256502))

(assert (= (and b!256502 res!125491) b!256519))

(assert (= (and b!256516 res!125494) b!256515))

(assert (= (and b!256515 c!43361) b!256500))

(assert (= (and b!256515 (not c!43361)) b!256507))

(assert (= (and b!256500 res!125492) b!256513))

(assert (= (or b!256500 b!256507) bm!24306))

(assert (= (and b!256515 res!125495) b!256505))

(assert (= (and b!256505 c!43363) b!256506))

(assert (= (and b!256505 (not c!43363)) b!256499))

(assert (= (and b!256506 res!125497) b!256510))

(assert (= (or b!256506 b!256499) bm!24308))

(declare-fun b_lambda!8165 () Bool)

(assert (=> (not b_lambda!8165) (not b!256519)))

(assert (=> b!256519 t!8848))

(declare-fun b_and!13781 () Bool)

(assert (= b_and!13779 (and (=> t!8848 result!5367) b_and!13781)))

(declare-fun m!271893 () Bool)

(assert (=> b!256514 m!271893))

(declare-fun m!271895 () Bool)

(assert (=> b!256502 m!271895))

(assert (=> b!256502 m!271895))

(declare-fun m!271897 () Bool)

(assert (=> b!256502 m!271897))

(declare-fun m!271899 () Bool)

(assert (=> bm!24305 m!271899))

(declare-fun m!271901 () Bool)

(assert (=> bm!24306 m!271901))

(assert (=> b!256512 m!271895))

(assert (=> b!256512 m!271895))

(declare-fun m!271903 () Bool)

(assert (=> b!256512 m!271903))

(declare-fun m!271905 () Bool)

(assert (=> bm!24308 m!271905))

(declare-fun m!271907 () Bool)

(assert (=> b!256510 m!271907))

(assert (=> b!256518 m!271899))

(declare-fun m!271909 () Bool)

(assert (=> b!256518 m!271909))

(declare-fun m!271911 () Bool)

(assert (=> b!256518 m!271911))

(declare-fun m!271913 () Bool)

(assert (=> b!256518 m!271913))

(declare-fun m!271915 () Bool)

(assert (=> b!256518 m!271915))

(declare-fun m!271917 () Bool)

(assert (=> b!256518 m!271917))

(declare-fun m!271919 () Bool)

(assert (=> b!256518 m!271919))

(declare-fun m!271921 () Bool)

(assert (=> b!256518 m!271921))

(declare-fun m!271923 () Bool)

(assert (=> b!256518 m!271923))

(declare-fun m!271925 () Bool)

(assert (=> b!256518 m!271925))

(assert (=> b!256518 m!271895))

(declare-fun m!271927 () Bool)

(assert (=> b!256518 m!271927))

(assert (=> b!256518 m!271923))

(declare-fun m!271929 () Bool)

(assert (=> b!256518 m!271929))

(assert (=> b!256518 m!271911))

(declare-fun m!271931 () Bool)

(assert (=> b!256518 m!271931))

(declare-fun m!271933 () Bool)

(assert (=> b!256518 m!271933))

(declare-fun m!271935 () Bool)

(assert (=> b!256518 m!271935))

(assert (=> b!256518 m!271919))

(assert (=> b!256518 m!271933))

(declare-fun m!271937 () Bool)

(assert (=> b!256518 m!271937))

(declare-fun m!271939 () Bool)

(assert (=> bm!24310 m!271939))

(declare-fun m!271941 () Bool)

(assert (=> b!256519 m!271941))

(assert (=> b!256519 m!271875))

(declare-fun m!271943 () Bool)

(assert (=> b!256519 m!271943))

(assert (=> b!256519 m!271895))

(declare-fun m!271945 () Bool)

(assert (=> b!256519 m!271945))

(assert (=> b!256519 m!271875))

(assert (=> b!256519 m!271895))

(assert (=> b!256519 m!271941))

(declare-fun m!271947 () Bool)

(assert (=> b!256513 m!271947))

(assert (=> b!256509 m!271895))

(assert (=> b!256509 m!271895))

(assert (=> b!256509 m!271903))

(assert (=> d!61691 m!271799))

(assert (=> b!256293 d!61691))

(declare-fun b!256528 () Bool)

(declare-fun e!166283 () (_ BitVec 32))

(declare-fun e!166282 () (_ BitVec 32))

(assert (=> b!256528 (= e!166283 e!166282)))

(declare-fun c!43368 () Bool)

(assert (=> b!256528 (= c!43368 (validKeyInArray!0 (select (arr!5921 (_keys!6891 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24313 () Bool)

(declare-fun call!24316 () (_ BitVec 32))

(assert (=> bm!24313 (= call!24316 (arrayCountValidKeys!0 (_keys!6891 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6268 (_keys!6891 thiss!1504))))))

(declare-fun b!256529 () Bool)

(assert (=> b!256529 (= e!166283 #b00000000000000000000000000000000)))

(declare-fun d!61693 () Bool)

(declare-fun lt!128837 () (_ BitVec 32))

(assert (=> d!61693 (and (bvsge lt!128837 #b00000000000000000000000000000000) (bvsle lt!128837 (bvsub (size!6268 (_keys!6891 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61693 (= lt!128837 e!166283)))

(declare-fun c!43369 () Bool)

(assert (=> d!61693 (= c!43369 (bvsge #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))))))

(assert (=> d!61693 (and (bvsle #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6268 (_keys!6891 thiss!1504)) (size!6268 (_keys!6891 thiss!1504))))))

(assert (=> d!61693 (= (arrayCountValidKeys!0 (_keys!6891 thiss!1504) #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))) lt!128837)))

(declare-fun b!256530 () Bool)

(assert (=> b!256530 (= e!166282 call!24316)))

(declare-fun b!256531 () Bool)

(assert (=> b!256531 (= e!166282 (bvadd #b00000000000000000000000000000001 call!24316))))

(assert (= (and d!61693 c!43369) b!256529))

(assert (= (and d!61693 (not c!43369)) b!256528))

(assert (= (and b!256528 c!43368) b!256531))

(assert (= (and b!256528 (not c!43368)) b!256530))

(assert (= (or b!256531 b!256530) bm!24313))

(assert (=> b!256528 m!271827))

(assert (=> b!256528 m!271827))

(assert (=> b!256528 m!271835))

(declare-fun m!271949 () Bool)

(assert (=> bm!24313 m!271949))

(assert (=> b!256293 d!61693))

(declare-fun d!61695 () Bool)

(declare-fun e!166286 () Bool)

(assert (=> d!61695 e!166286))

(declare-fun res!125502 () Bool)

(assert (=> d!61695 (=> (not res!125502) (not e!166286))))

(assert (=> d!61695 (= res!125502 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6268 (_keys!6891 thiss!1504))) (bvslt index!297 (size!6267 (_values!4712 thiss!1504)))))))

(declare-fun lt!128840 () Unit!7952)

(declare-fun choose!1231 (array!12499 array!12497 (_ BitVec 32) (_ BitVec 32) V!8419 V!8419 (_ BitVec 32) (_ BitVec 64) V!8419 Int) Unit!7952)

(assert (=> d!61695 (= lt!128840 (choose!1231 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) index!297 key!932 v!346 (defaultEntry!4729 thiss!1504)))))

(assert (=> d!61695 (validMask!0 (mask!11001 thiss!1504))))

(assert (=> d!61695 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!91 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) index!297 key!932 v!346 (defaultEntry!4729 thiss!1504)) lt!128840)))

(declare-fun b!256534 () Bool)

(assert (=> b!256534 (= e!166286 (= (+!681 (getCurrentListMap!1454 (_keys!6891 thiss!1504) (_values!4712 thiss!1504) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504)) (tuple2!4909 key!932 v!346)) (getCurrentListMap!1454 (array!12500 (store (arr!5921 (_keys!6891 thiss!1504)) index!297 key!932) (size!6268 (_keys!6891 thiss!1504))) (array!12498 (store (arr!5920 (_values!4712 thiss!1504)) index!297 (ValueCellFull!2946 v!346)) (size!6267 (_values!4712 thiss!1504))) (mask!11001 thiss!1504) (extraKeys!4466 thiss!1504) (zeroValue!4570 thiss!1504) (minValue!4570 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4729 thiss!1504))))))

(assert (= (and d!61695 res!125502) b!256534))

(declare-fun m!271951 () Bool)

(assert (=> d!61695 m!271951))

(assert (=> d!61695 m!271799))

(declare-fun m!271953 () Bool)

(assert (=> b!256534 m!271953))

(assert (=> b!256534 m!271695))

(declare-fun m!271955 () Bool)

(assert (=> b!256534 m!271955))

(assert (=> b!256534 m!271713))

(assert (=> b!256534 m!271727))

(assert (=> b!256534 m!271695))

(assert (=> b!256293 d!61695))

(declare-fun d!61697 () Bool)

(declare-fun e!166289 () Bool)

(assert (=> d!61697 e!166289))

(declare-fun res!125507 () Bool)

(assert (=> d!61697 (=> (not res!125507) (not e!166289))))

(declare-fun lt!128851 () ListLongMap!3821)

(assert (=> d!61697 (= res!125507 (contains!1864 lt!128851 (_1!2465 (tuple2!4909 key!932 v!346))))))

(declare-fun lt!128849 () List!3788)

(assert (=> d!61697 (= lt!128851 (ListLongMap!3822 lt!128849))))

(declare-fun lt!128850 () Unit!7952)

(declare-fun lt!128852 () Unit!7952)

(assert (=> d!61697 (= lt!128850 lt!128852)))

(assert (=> d!61697 (= (getValueByKey!309 lt!128849 (_1!2465 (tuple2!4909 key!932 v!346))) (Some!314 (_2!2465 (tuple2!4909 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!165 (List!3788 (_ BitVec 64) V!8419) Unit!7952)

(assert (=> d!61697 (= lt!128852 (lemmaContainsTupThenGetReturnValue!165 lt!128849 (_1!2465 (tuple2!4909 key!932 v!346)) (_2!2465 (tuple2!4909 key!932 v!346))))))

(declare-fun insertStrictlySorted!168 (List!3788 (_ BitVec 64) V!8419) List!3788)

(assert (=> d!61697 (= lt!128849 (insertStrictlySorted!168 (toList!1926 lt!128669) (_1!2465 (tuple2!4909 key!932 v!346)) (_2!2465 (tuple2!4909 key!932 v!346))))))

(assert (=> d!61697 (= (+!681 lt!128669 (tuple2!4909 key!932 v!346)) lt!128851)))

(declare-fun b!256539 () Bool)

(declare-fun res!125508 () Bool)

(assert (=> b!256539 (=> (not res!125508) (not e!166289))))

(assert (=> b!256539 (= res!125508 (= (getValueByKey!309 (toList!1926 lt!128851) (_1!2465 (tuple2!4909 key!932 v!346))) (Some!314 (_2!2465 (tuple2!4909 key!932 v!346)))))))

(declare-fun b!256540 () Bool)

(declare-fun contains!1865 (List!3788 tuple2!4908) Bool)

(assert (=> b!256540 (= e!166289 (contains!1865 (toList!1926 lt!128851) (tuple2!4909 key!932 v!346)))))

(assert (= (and d!61697 res!125507) b!256539))

(assert (= (and b!256539 res!125508) b!256540))

(declare-fun m!271957 () Bool)

(assert (=> d!61697 m!271957))

(declare-fun m!271959 () Bool)

(assert (=> d!61697 m!271959))

(declare-fun m!271961 () Bool)

(assert (=> d!61697 m!271961))

(declare-fun m!271963 () Bool)

(assert (=> d!61697 m!271963))

(declare-fun m!271965 () Bool)

(assert (=> b!256539 m!271965))

(declare-fun m!271967 () Bool)

(assert (=> b!256540 m!271967))

(assert (=> b!256293 d!61697))

(declare-fun d!61699 () Bool)

(declare-fun res!125515 () Bool)

(declare-fun e!166301 () Bool)

(assert (=> d!61699 (=> res!125515 e!166301)))

(assert (=> d!61699 (= res!125515 (bvsge #b00000000000000000000000000000000 (size!6268 lt!128672)))))

(assert (=> d!61699 (= (arrayNoDuplicates!0 lt!128672 #b00000000000000000000000000000000 Nil!3786) e!166301)))

(declare-fun b!256551 () Bool)

(declare-fun e!166299 () Bool)

(declare-fun e!166298 () Bool)

(assert (=> b!256551 (= e!166299 e!166298)))

(declare-fun c!43372 () Bool)

(assert (=> b!256551 (= c!43372 (validKeyInArray!0 (select (arr!5921 lt!128672) #b00000000000000000000000000000000)))))

(declare-fun b!256552 () Bool)

(declare-fun call!24319 () Bool)

(assert (=> b!256552 (= e!166298 call!24319)))

(declare-fun bm!24316 () Bool)

(assert (=> bm!24316 (= call!24319 (arrayNoDuplicates!0 lt!128672 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43372 (Cons!3785 (select (arr!5921 lt!128672) #b00000000000000000000000000000000) Nil!3786) Nil!3786)))))

(declare-fun b!256553 () Bool)

(declare-fun e!166300 () Bool)

(declare-fun contains!1866 (List!3789 (_ BitVec 64)) Bool)

(assert (=> b!256553 (= e!166300 (contains!1866 Nil!3786 (select (arr!5921 lt!128672) #b00000000000000000000000000000000)))))

(declare-fun b!256554 () Bool)

(assert (=> b!256554 (= e!166298 call!24319)))

(declare-fun b!256555 () Bool)

(assert (=> b!256555 (= e!166301 e!166299)))

(declare-fun res!125517 () Bool)

(assert (=> b!256555 (=> (not res!125517) (not e!166299))))

(assert (=> b!256555 (= res!125517 (not e!166300))))

(declare-fun res!125516 () Bool)

(assert (=> b!256555 (=> (not res!125516) (not e!166300))))

(assert (=> b!256555 (= res!125516 (validKeyInArray!0 (select (arr!5921 lt!128672) #b00000000000000000000000000000000)))))

(assert (= (and d!61699 (not res!125515)) b!256555))

(assert (= (and b!256555 res!125516) b!256553))

(assert (= (and b!256555 res!125517) b!256551))

(assert (= (and b!256551 c!43372) b!256554))

(assert (= (and b!256551 (not c!43372)) b!256552))

(assert (= (or b!256554 b!256552) bm!24316))

(assert (=> b!256551 m!271895))

(assert (=> b!256551 m!271895))

(assert (=> b!256551 m!271903))

(assert (=> bm!24316 m!271895))

(declare-fun m!271969 () Bool)

(assert (=> bm!24316 m!271969))

(assert (=> b!256553 m!271895))

(assert (=> b!256553 m!271895))

(declare-fun m!271971 () Bool)

(assert (=> b!256553 m!271971))

(assert (=> b!256555 m!271895))

(assert (=> b!256555 m!271895))

(assert (=> b!256555 m!271903))

(assert (=> b!256293 d!61699))

(declare-fun d!61701 () Bool)

(declare-fun e!166304 () Bool)

(assert (=> d!61701 e!166304))

(declare-fun res!125520 () Bool)

(assert (=> d!61701 (=> (not res!125520) (not e!166304))))

(assert (=> d!61701 (= res!125520 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6268 (_keys!6891 thiss!1504)))))))

(declare-fun lt!128855 () Unit!7952)

(declare-fun choose!41 (array!12499 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3789) Unit!7952)

(assert (=> d!61701 (= lt!128855 (choose!41 (_keys!6891 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3786))))

(assert (=> d!61701 (bvslt (size!6268 (_keys!6891 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61701 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6891 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3786) lt!128855)))

(declare-fun b!256558 () Bool)

(assert (=> b!256558 (= e!166304 (arrayNoDuplicates!0 (array!12500 (store (arr!5921 (_keys!6891 thiss!1504)) index!297 key!932) (size!6268 (_keys!6891 thiss!1504))) #b00000000000000000000000000000000 Nil!3786))))

(assert (= (and d!61701 res!125520) b!256558))

(declare-fun m!271973 () Bool)

(assert (=> d!61701 m!271973))

(assert (=> b!256558 m!271727))

(declare-fun m!271975 () Bool)

(assert (=> b!256558 m!271975))

(assert (=> b!256293 d!61701))

(declare-fun b!256567 () Bool)

(declare-fun e!166311 () Bool)

(declare-fun call!24322 () Bool)

(assert (=> b!256567 (= e!166311 call!24322)))

(declare-fun b!256568 () Bool)

(declare-fun e!166312 () Bool)

(assert (=> b!256568 (= e!166312 call!24322)))

(declare-fun bm!24319 () Bool)

(assert (=> bm!24319 (= call!24322 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!128672 (mask!11001 thiss!1504)))))

(declare-fun b!256569 () Bool)

(declare-fun e!166313 () Bool)

(assert (=> b!256569 (= e!166313 e!166311)))

(declare-fun c!43375 () Bool)

(assert (=> b!256569 (= c!43375 (validKeyInArray!0 (select (arr!5921 lt!128672) #b00000000000000000000000000000000)))))

(declare-fun b!256570 () Bool)

(assert (=> b!256570 (= e!166311 e!166312)))

(declare-fun lt!128863 () (_ BitVec 64))

(assert (=> b!256570 (= lt!128863 (select (arr!5921 lt!128672) #b00000000000000000000000000000000))))

(declare-fun lt!128864 () Unit!7952)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12499 (_ BitVec 64) (_ BitVec 32)) Unit!7952)

(assert (=> b!256570 (= lt!128864 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128672 lt!128863 #b00000000000000000000000000000000))))

(assert (=> b!256570 (arrayContainsKey!0 lt!128672 lt!128863 #b00000000000000000000000000000000)))

(declare-fun lt!128862 () Unit!7952)

(assert (=> b!256570 (= lt!128862 lt!128864)))

(declare-fun res!125525 () Bool)

(assert (=> b!256570 (= res!125525 (= (seekEntryOrOpen!0 (select (arr!5921 lt!128672) #b00000000000000000000000000000000) lt!128672 (mask!11001 thiss!1504)) (Found!1162 #b00000000000000000000000000000000)))))

(assert (=> b!256570 (=> (not res!125525) (not e!166312))))

(declare-fun d!61703 () Bool)

(declare-fun res!125526 () Bool)

(assert (=> d!61703 (=> res!125526 e!166313)))

(assert (=> d!61703 (= res!125526 (bvsge #b00000000000000000000000000000000 (size!6268 lt!128672)))))

(assert (=> d!61703 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128672 (mask!11001 thiss!1504)) e!166313)))

(assert (= (and d!61703 (not res!125526)) b!256569))

(assert (= (and b!256569 c!43375) b!256570))

(assert (= (and b!256569 (not c!43375)) b!256567))

(assert (= (and b!256570 res!125525) b!256568))

(assert (= (or b!256568 b!256567) bm!24319))

(declare-fun m!271977 () Bool)

(assert (=> bm!24319 m!271977))

(assert (=> b!256569 m!271895))

(assert (=> b!256569 m!271895))

(assert (=> b!256569 m!271903))

(assert (=> b!256570 m!271895))

(declare-fun m!271979 () Bool)

(assert (=> b!256570 m!271979))

(declare-fun m!271981 () Bool)

(assert (=> b!256570 m!271981))

(assert (=> b!256570 m!271895))

(declare-fun m!271983 () Bool)

(assert (=> b!256570 m!271983))

(assert (=> b!256293 d!61703))

(declare-fun b!256571 () Bool)

(declare-fun e!166315 () (_ BitVec 32))

(declare-fun e!166314 () (_ BitVec 32))

(assert (=> b!256571 (= e!166315 e!166314)))

(declare-fun c!43376 () Bool)

(assert (=> b!256571 (= c!43376 (validKeyInArray!0 (select (arr!5921 lt!128672) #b00000000000000000000000000000000)))))

(declare-fun bm!24320 () Bool)

(declare-fun call!24323 () (_ BitVec 32))

(assert (=> bm!24320 (= call!24323 (arrayCountValidKeys!0 lt!128672 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6268 (_keys!6891 thiss!1504))))))

(declare-fun b!256572 () Bool)

(assert (=> b!256572 (= e!166315 #b00000000000000000000000000000000)))

(declare-fun d!61705 () Bool)

(declare-fun lt!128865 () (_ BitVec 32))

(assert (=> d!61705 (and (bvsge lt!128865 #b00000000000000000000000000000000) (bvsle lt!128865 (bvsub (size!6268 lt!128672) #b00000000000000000000000000000000)))))

(assert (=> d!61705 (= lt!128865 e!166315)))

(declare-fun c!43377 () Bool)

(assert (=> d!61705 (= c!43377 (bvsge #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))))))

(assert (=> d!61705 (and (bvsle #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6268 (_keys!6891 thiss!1504)) (size!6268 lt!128672)))))

(assert (=> d!61705 (= (arrayCountValidKeys!0 lt!128672 #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))) lt!128865)))

(declare-fun b!256573 () Bool)

(assert (=> b!256573 (= e!166314 call!24323)))

(declare-fun b!256574 () Bool)

(assert (=> b!256574 (= e!166314 (bvadd #b00000000000000000000000000000001 call!24323))))

(assert (= (and d!61705 c!43377) b!256572))

(assert (= (and d!61705 (not c!43377)) b!256571))

(assert (= (and b!256571 c!43376) b!256574))

(assert (= (and b!256571 (not c!43376)) b!256573))

(assert (= (or b!256574 b!256573) bm!24320))

(assert (=> b!256571 m!271895))

(assert (=> b!256571 m!271895))

(assert (=> b!256571 m!271903))

(declare-fun m!271985 () Bool)

(assert (=> bm!24320 m!271985))

(assert (=> b!256293 d!61705))

(declare-fun d!61707 () Bool)

(declare-fun res!125527 () Bool)

(declare-fun e!166316 () Bool)

(assert (=> d!61707 (=> res!125527 e!166316)))

(assert (=> d!61707 (= res!125527 (= (select (arr!5921 (_keys!6891 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61707 (= (arrayContainsKey!0 (_keys!6891 thiss!1504) key!932 #b00000000000000000000000000000000) e!166316)))

(declare-fun b!256575 () Bool)

(declare-fun e!166317 () Bool)

(assert (=> b!256575 (= e!166316 e!166317)))

(declare-fun res!125528 () Bool)

(assert (=> b!256575 (=> (not res!125528) (not e!166317))))

(assert (=> b!256575 (= res!125528 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6268 (_keys!6891 thiss!1504))))))

(declare-fun b!256576 () Bool)

(assert (=> b!256576 (= e!166317 (arrayContainsKey!0 (_keys!6891 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61707 (not res!125527)) b!256575))

(assert (= (and b!256575 res!125528) b!256576))

(assert (=> d!61707 m!271827))

(declare-fun m!271987 () Bool)

(assert (=> b!256576 m!271987))

(assert (=> b!256293 d!61707))

(declare-fun d!61709 () Bool)

(declare-fun e!166320 () Bool)

(assert (=> d!61709 e!166320))

(declare-fun res!125531 () Bool)

(assert (=> d!61709 (=> (not res!125531) (not e!166320))))

(assert (=> d!61709 (= res!125531 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6268 (_keys!6891 thiss!1504)))))))

(declare-fun lt!128868 () Unit!7952)

(declare-fun choose!102 ((_ BitVec 64) array!12499 (_ BitVec 32) (_ BitVec 32)) Unit!7952)

(assert (=> d!61709 (= lt!128868 (choose!102 key!932 (_keys!6891 thiss!1504) index!297 (mask!11001 thiss!1504)))))

(assert (=> d!61709 (validMask!0 (mask!11001 thiss!1504))))

(assert (=> d!61709 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6891 thiss!1504) index!297 (mask!11001 thiss!1504)) lt!128868)))

(declare-fun b!256579 () Bool)

(assert (=> b!256579 (= e!166320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12500 (store (arr!5921 (_keys!6891 thiss!1504)) index!297 key!932) (size!6268 (_keys!6891 thiss!1504))) (mask!11001 thiss!1504)))))

(assert (= (and d!61709 res!125531) b!256579))

(declare-fun m!271989 () Bool)

(assert (=> d!61709 m!271989))

(assert (=> d!61709 m!271799))

(assert (=> b!256579 m!271727))

(declare-fun m!271991 () Bool)

(assert (=> b!256579 m!271991))

(assert (=> b!256293 d!61709))

(assert (=> bm!24270 d!61707))

(declare-fun d!61711 () Bool)

(declare-fun res!125538 () Bool)

(declare-fun e!166323 () Bool)

(assert (=> d!61711 (=> (not res!125538) (not e!166323))))

(declare-fun simpleValid!274 (LongMapFixedSize!3792) Bool)

(assert (=> d!61711 (= res!125538 (simpleValid!274 thiss!1504))))

(assert (=> d!61711 (= (valid!1482 thiss!1504) e!166323)))

(declare-fun b!256586 () Bool)

(declare-fun res!125539 () Bool)

(assert (=> b!256586 (=> (not res!125539) (not e!166323))))

(assert (=> b!256586 (= res!125539 (= (arrayCountValidKeys!0 (_keys!6891 thiss!1504) #b00000000000000000000000000000000 (size!6268 (_keys!6891 thiss!1504))) (_size!1945 thiss!1504)))))

(declare-fun b!256587 () Bool)

(declare-fun res!125540 () Bool)

(assert (=> b!256587 (=> (not res!125540) (not e!166323))))

(assert (=> b!256587 (= res!125540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6891 thiss!1504) (mask!11001 thiss!1504)))))

(declare-fun b!256588 () Bool)

(assert (=> b!256588 (= e!166323 (arrayNoDuplicates!0 (_keys!6891 thiss!1504) #b00000000000000000000000000000000 Nil!3786))))

(assert (= (and d!61711 res!125538) b!256586))

(assert (= (and b!256586 res!125539) b!256587))

(assert (= (and b!256587 res!125540) b!256588))

(declare-fun m!271993 () Bool)

(assert (=> d!61711 m!271993))

(assert (=> b!256586 m!271729))

(declare-fun m!271995 () Bool)

(assert (=> b!256587 m!271995))

(declare-fun m!271997 () Bool)

(assert (=> b!256588 m!271997))

(assert (=> start!24468 d!61711))

(declare-fun b!256601 () Bool)

(declare-fun e!166332 () SeekEntryResult!1162)

(declare-fun lt!128877 () SeekEntryResult!1162)

(assert (=> b!256601 (= e!166332 (MissingZero!1162 (index!6820 lt!128877)))))

(declare-fun d!61713 () Bool)

(declare-fun lt!128875 () SeekEntryResult!1162)

(assert (=> d!61713 (and (or ((_ is Undefined!1162) lt!128875) (not ((_ is Found!1162) lt!128875)) (and (bvsge (index!6819 lt!128875) #b00000000000000000000000000000000) (bvslt (index!6819 lt!128875) (size!6268 (_keys!6891 thiss!1504))))) (or ((_ is Undefined!1162) lt!128875) ((_ is Found!1162) lt!128875) (not ((_ is MissingZero!1162) lt!128875)) (and (bvsge (index!6818 lt!128875) #b00000000000000000000000000000000) (bvslt (index!6818 lt!128875) (size!6268 (_keys!6891 thiss!1504))))) (or ((_ is Undefined!1162) lt!128875) ((_ is Found!1162) lt!128875) ((_ is MissingZero!1162) lt!128875) (not ((_ is MissingVacant!1162) lt!128875)) (and (bvsge (index!6821 lt!128875) #b00000000000000000000000000000000) (bvslt (index!6821 lt!128875) (size!6268 (_keys!6891 thiss!1504))))) (or ((_ is Undefined!1162) lt!128875) (ite ((_ is Found!1162) lt!128875) (= (select (arr!5921 (_keys!6891 thiss!1504)) (index!6819 lt!128875)) key!932) (ite ((_ is MissingZero!1162) lt!128875) (= (select (arr!5921 (_keys!6891 thiss!1504)) (index!6818 lt!128875)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1162) lt!128875) (= (select (arr!5921 (_keys!6891 thiss!1504)) (index!6821 lt!128875)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!166330 () SeekEntryResult!1162)

(assert (=> d!61713 (= lt!128875 e!166330)))

(declare-fun c!43386 () Bool)

(assert (=> d!61713 (= c!43386 (and ((_ is Intermediate!1162) lt!128877) (undefined!1974 lt!128877)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12499 (_ BitVec 32)) SeekEntryResult!1162)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61713 (= lt!128877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11001 thiss!1504)) key!932 (_keys!6891 thiss!1504) (mask!11001 thiss!1504)))))

(assert (=> d!61713 (validMask!0 (mask!11001 thiss!1504))))

(assert (=> d!61713 (= (seekEntryOrOpen!0 key!932 (_keys!6891 thiss!1504) (mask!11001 thiss!1504)) lt!128875)))

(declare-fun b!256602 () Bool)

(declare-fun e!166331 () SeekEntryResult!1162)

(assert (=> b!256602 (= e!166330 e!166331)))

(declare-fun lt!128876 () (_ BitVec 64))

(assert (=> b!256602 (= lt!128876 (select (arr!5921 (_keys!6891 thiss!1504)) (index!6820 lt!128877)))))

(declare-fun c!43385 () Bool)

(assert (=> b!256602 (= c!43385 (= lt!128876 key!932))))

(declare-fun b!256603 () Bool)

(assert (=> b!256603 (= e!166330 Undefined!1162)))

(declare-fun b!256604 () Bool)

(declare-fun c!43384 () Bool)

(assert (=> b!256604 (= c!43384 (= lt!128876 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256604 (= e!166331 e!166332)))

(declare-fun b!256605 () Bool)

(assert (=> b!256605 (= e!166331 (Found!1162 (index!6820 lt!128877)))))

(declare-fun b!256606 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12499 (_ BitVec 32)) SeekEntryResult!1162)

(assert (=> b!256606 (= e!166332 (seekKeyOrZeroReturnVacant!0 (x!24958 lt!128877) (index!6820 lt!128877) (index!6820 lt!128877) key!932 (_keys!6891 thiss!1504) (mask!11001 thiss!1504)))))

(assert (= (and d!61713 c!43386) b!256603))

(assert (= (and d!61713 (not c!43386)) b!256602))

(assert (= (and b!256602 c!43385) b!256605))

(assert (= (and b!256602 (not c!43385)) b!256604))

(assert (= (and b!256604 c!43384) b!256601))

(assert (= (and b!256604 (not c!43384)) b!256606))

(declare-fun m!271999 () Bool)

(assert (=> d!61713 m!271999))

(declare-fun m!272001 () Bool)

(assert (=> d!61713 m!272001))

(declare-fun m!272003 () Bool)

(assert (=> d!61713 m!272003))

(declare-fun m!272005 () Bool)

(assert (=> d!61713 m!272005))

(declare-fun m!272007 () Bool)

(assert (=> d!61713 m!272007))

(assert (=> d!61713 m!272003))

(assert (=> d!61713 m!271799))

(declare-fun m!272009 () Bool)

(assert (=> b!256602 m!272009))

(declare-fun m!272011 () Bool)

(assert (=> b!256606 m!272011))

(assert (=> b!256305 d!61713))

(declare-fun b!256613 () Bool)

(declare-fun e!166338 () Bool)

(assert (=> b!256613 (= e!166338 tp_is_empty!6579)))

(declare-fun mapIsEmpty!11202 () Bool)

(declare-fun mapRes!11202 () Bool)

(assert (=> mapIsEmpty!11202 mapRes!11202))

(declare-fun mapNonEmpty!11202 () Bool)

(declare-fun tp!23460 () Bool)

(assert (=> mapNonEmpty!11202 (= mapRes!11202 (and tp!23460 e!166338))))

(declare-fun mapValue!11202 () ValueCell!2946)

(declare-fun mapRest!11202 () (Array (_ BitVec 32) ValueCell!2946))

(declare-fun mapKey!11202 () (_ BitVec 32))

(assert (=> mapNonEmpty!11202 (= mapRest!11196 (store mapRest!11202 mapKey!11202 mapValue!11202))))

(declare-fun b!256614 () Bool)

(declare-fun e!166337 () Bool)

(assert (=> b!256614 (= e!166337 tp_is_empty!6579)))

(declare-fun condMapEmpty!11202 () Bool)

(declare-fun mapDefault!11202 () ValueCell!2946)

(assert (=> mapNonEmpty!11196 (= condMapEmpty!11202 (= mapRest!11196 ((as const (Array (_ BitVec 32) ValueCell!2946)) mapDefault!11202)))))

(assert (=> mapNonEmpty!11196 (= tp!23450 (and e!166337 mapRes!11202))))

(assert (= (and mapNonEmpty!11196 condMapEmpty!11202) mapIsEmpty!11202))

(assert (= (and mapNonEmpty!11196 (not condMapEmpty!11202)) mapNonEmpty!11202))

(assert (= (and mapNonEmpty!11202 ((_ is ValueCellFull!2946) mapValue!11202)) b!256613))

(assert (= (and mapNonEmpty!11196 ((_ is ValueCellFull!2946) mapDefault!11202)) b!256614))

(declare-fun m!272013 () Bool)

(assert (=> mapNonEmpty!11202 m!272013))

(declare-fun b_lambda!8167 () Bool)

(assert (= b_lambda!8163 (or (and b!256306 b_free!6717) b_lambda!8167)))

(declare-fun b_lambda!8169 () Bool)

(assert (= b_lambda!8165 (or (and b!256306 b_free!6717) b_lambda!8169)))

(check-sat (not b!256569) (not b!256479) (not bm!24282) (not bm!24303) (not d!61697) (not bm!24316) (not d!61673) (not bm!24310) (not b!256518) (not b!256570) (not b!256483) (not b!256553) (not b!256510) (not d!61711) (not bm!24281) (not b!256475) (not b!256512) (not b!256419) (not b!256539) (not b!256519) (not d!61681) (not b!256534) (not b_lambda!8169) (not d!61713) (not b!256474) (not b!256606) (not b!256387) (not b!256555) (not b!256502) (not b!256513) (not bm!24319) (not b!256540) (not b!256477) (not bm!24298) (not d!61689) (not mapNonEmpty!11202) (not b!256421) (not b!256571) (not b!256579) (not b!256514) (not b_lambda!8167) (not d!61709) (not b!256558) (not d!61671) (not b!256496) (not b!256467) (not d!61695) tp_is_empty!6579 (not bm!24313) (not b!256586) (not b!256382) (not bm!24299) (not b!256509) (not d!61701) (not bm!24301) (not d!61683) (not bm!24305) (not d!61691) b_and!13781 (not bm!24308) (not b_next!6717) (not b!256551) (not d!61677) (not b!256576) (not b!256484) (not b!256528) (not bm!24320) (not bm!24306) (not b!256478) (not b!256495) (not b!256587) (not b!256588) (not b!256498))
(check-sat b_and!13781 (not b_next!6717))
