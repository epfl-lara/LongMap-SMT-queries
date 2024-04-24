; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22124 () Bool)

(assert start!22124)

(declare-fun b!230327 () Bool)

(declare-fun b_free!6187 () Bool)

(declare-fun b_next!6187 () Bool)

(assert (=> b!230327 (= b_free!6187 (not b_next!6187))))

(declare-fun tp!21702 () Bool)

(declare-fun b_and!13099 () Bool)

(assert (=> b!230327 (= tp!21702 b_and!13099)))

(declare-fun e!149468 () Bool)

(declare-datatypes ((V!7713 0))(
  ( (V!7714 (val!3069 Int)) )
))
(declare-datatypes ((ValueCell!2681 0))(
  ( (ValueCellFull!2681 (v!5090 V!7713)) (EmptyCell!2681) )
))
(declare-datatypes ((array!11339 0))(
  ( (array!11340 (arr!5389 (Array (_ BitVec 32) ValueCell!2681)) (size!5722 (_ BitVec 32))) )
))
(declare-datatypes ((array!11341 0))(
  ( (array!11342 (arr!5390 (Array (_ BitVec 32) (_ BitVec 64))) (size!5723 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3262 0))(
  ( (LongMapFixedSize!3263 (defaultEntry!4290 Int) (mask!10180 (_ BitVec 32)) (extraKeys!4027 (_ BitVec 32)) (zeroValue!4131 V!7713) (minValue!4131 V!7713) (_size!1680 (_ BitVec 32)) (_keys!6344 array!11341) (_values!4273 array!11339) (_vacant!1680 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3262)

(declare-fun e!149462 () Bool)

(declare-fun tp_is_empty!6049 () Bool)

(declare-fun array_inv!3541 (array!11341) Bool)

(declare-fun array_inv!3542 (array!11339) Bool)

(assert (=> b!230327 (= e!149468 (and tp!21702 tp_is_empty!6049 (array_inv!3541 (_keys!6344 thiss!1504)) (array_inv!3542 (_values!4273 thiss!1504)) e!149462))))

(declare-fun b!230328 () Bool)

(declare-fun e!149463 () Bool)

(assert (=> b!230328 (= e!149463 tp_is_empty!6049)))

(declare-fun mapNonEmpty!10243 () Bool)

(declare-fun mapRes!10243 () Bool)

(declare-fun tp!21703 () Bool)

(assert (=> mapNonEmpty!10243 (= mapRes!10243 (and tp!21703 e!149463))))

(declare-fun mapValue!10243 () ValueCell!2681)

(declare-fun mapKey!10243 () (_ BitVec 32))

(declare-fun mapRest!10243 () (Array (_ BitVec 32) ValueCell!2681))

(assert (=> mapNonEmpty!10243 (= (arr!5389 (_values!4273 thiss!1504)) (store mapRest!10243 mapKey!10243 mapValue!10243))))

(declare-fun b!230330 () Bool)

(declare-fun res!113295 () Bool)

(declare-datatypes ((SeekEntryResult!901 0))(
  ( (MissingZero!901 (index!5774 (_ BitVec 32))) (Found!901 (index!5775 (_ BitVec 32))) (Intermediate!901 (undefined!1713 Bool) (index!5776 (_ BitVec 32)) (x!23401 (_ BitVec 32))) (Undefined!901) (MissingVacant!901 (index!5777 (_ BitVec 32))) )
))
(declare-fun lt!115937 () SeekEntryResult!901)

(assert (=> b!230330 (= res!113295 (= (select (arr!5390 (_keys!6344 thiss!1504)) (index!5777 lt!115937)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!149457 () Bool)

(assert (=> b!230330 (=> (not res!113295) (not e!149457))))

(declare-fun bm!21380 () Bool)

(declare-fun call!21383 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21380 (= call!21383 (arrayContainsKey!0 (_keys!6344 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230331 () Bool)

(declare-fun e!149461 () Bool)

(assert (=> b!230331 (= e!149461 tp_is_empty!6049)))

(declare-fun b!230332 () Bool)

(declare-fun res!113296 () Bool)

(declare-fun e!149456 () Bool)

(assert (=> b!230332 (=> (not res!113296) (not e!149456))))

(assert (=> b!230332 (= res!113296 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230333 () Bool)

(declare-datatypes ((Unit!7031 0))(
  ( (Unit!7032) )
))
(declare-fun e!149466 () Unit!7031)

(declare-fun Unit!7033 () Unit!7031)

(assert (=> b!230333 (= e!149466 Unit!7033)))

(declare-fun lt!115940 () Unit!7031)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!293 (array!11341 array!11339 (_ BitVec 32) (_ BitVec 32) V!7713 V!7713 (_ BitVec 64) Int) Unit!7031)

(assert (=> b!230333 (= lt!115940 (lemmaInListMapThenSeekEntryOrOpenFindsIt!293 (_keys!6344 thiss!1504) (_values!4273 thiss!1504) (mask!10180 thiss!1504) (extraKeys!4027 thiss!1504) (zeroValue!4131 thiss!1504) (minValue!4131 thiss!1504) key!932 (defaultEntry!4290 thiss!1504)))))

(assert (=> b!230333 false))

(declare-fun b!230334 () Bool)

(assert (=> b!230334 (= e!149457 (not call!21383))))

(declare-fun b!230335 () Bool)

(declare-fun e!149465 () Bool)

(assert (=> b!230335 (= e!149456 e!149465)))

(declare-fun res!113302 () Bool)

(assert (=> b!230335 (=> (not res!113302) (not e!149465))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!230335 (= res!113302 (or (= lt!115937 (MissingZero!901 index!297)) (= lt!115937 (MissingVacant!901 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11341 (_ BitVec 32)) SeekEntryResult!901)

(assert (=> b!230335 (= lt!115937 (seekEntryOrOpen!0 key!932 (_keys!6344 thiss!1504) (mask!10180 thiss!1504)))))

(declare-fun b!230336 () Bool)

(declare-fun e!149460 () Bool)

(assert (=> b!230336 (= e!149460 (not call!21383))))

(declare-fun b!230337 () Bool)

(declare-fun e!149458 () Unit!7031)

(declare-fun Unit!7034 () Unit!7031)

(assert (=> b!230337 (= e!149458 Unit!7034)))

(declare-fun b!230338 () Bool)

(declare-fun Unit!7035 () Unit!7031)

(assert (=> b!230338 (= e!149458 Unit!7035)))

(declare-fun lt!115938 () Unit!7031)

(declare-fun lemmaArrayContainsKeyThenInListMap!129 (array!11341 array!11339 (_ BitVec 32) (_ BitVec 32) V!7713 V!7713 (_ BitVec 64) (_ BitVec 32) Int) Unit!7031)

(assert (=> b!230338 (= lt!115938 (lemmaArrayContainsKeyThenInListMap!129 (_keys!6344 thiss!1504) (_values!4273 thiss!1504) (mask!10180 thiss!1504) (extraKeys!4027 thiss!1504) (zeroValue!4131 thiss!1504) (minValue!4131 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4290 thiss!1504)))))

(assert (=> b!230338 false))

(declare-fun b!230339 () Bool)

(declare-fun e!149464 () Bool)

(get-info :version)

(assert (=> b!230339 (= e!149464 ((_ is Undefined!901) lt!115937))))

(declare-fun b!230340 () Bool)

(declare-fun res!113298 () Bool)

(assert (=> b!230340 (=> (not res!113298) (not e!149460))))

(assert (=> b!230340 (= res!113298 (= (select (arr!5390 (_keys!6344 thiss!1504)) (index!5774 lt!115937)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!10243 () Bool)

(assert (=> mapIsEmpty!10243 mapRes!10243))

(declare-fun b!230341 () Bool)

(declare-fun e!149455 () Bool)

(assert (=> b!230341 (= e!149465 e!149455)))

(declare-fun res!113299 () Bool)

(assert (=> b!230341 (=> (not res!113299) (not e!149455))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230341 (= res!113299 (inRange!0 index!297 (mask!10180 thiss!1504)))))

(declare-fun lt!115944 () Unit!7031)

(assert (=> b!230341 (= lt!115944 e!149466)))

(declare-fun c!38230 () Bool)

(declare-datatypes ((tuple2!4456 0))(
  ( (tuple2!4457 (_1!2239 (_ BitVec 64)) (_2!2239 V!7713)) )
))
(declare-datatypes ((List!3370 0))(
  ( (Nil!3367) (Cons!3366 (h!4014 tuple2!4456) (t!8321 List!3370)) )
))
(declare-datatypes ((ListLongMap!3371 0))(
  ( (ListLongMap!3372 (toList!1701 List!3370)) )
))
(declare-fun lt!115946 () ListLongMap!3371)

(declare-fun contains!1590 (ListLongMap!3371 (_ BitVec 64)) Bool)

(assert (=> b!230341 (= c!38230 (contains!1590 lt!115946 key!932))))

(declare-fun getCurrentListMap!1233 (array!11341 array!11339 (_ BitVec 32) (_ BitVec 32) V!7713 V!7713 (_ BitVec 32) Int) ListLongMap!3371)

(assert (=> b!230341 (= lt!115946 (getCurrentListMap!1233 (_keys!6344 thiss!1504) (_values!4273 thiss!1504) (mask!10180 thiss!1504) (extraKeys!4027 thiss!1504) (zeroValue!4131 thiss!1504) (minValue!4131 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4290 thiss!1504)))))

(declare-fun b!230329 () Bool)

(declare-fun c!38231 () Bool)

(assert (=> b!230329 (= c!38231 ((_ is MissingVacant!901) lt!115937))))

(declare-fun e!149459 () Bool)

(assert (=> b!230329 (= e!149459 e!149464)))

(declare-fun res!113300 () Bool)

(assert (=> start!22124 (=> (not res!113300) (not e!149456))))

(declare-fun valid!1311 (LongMapFixedSize!3262) Bool)

(assert (=> start!22124 (= res!113300 (valid!1311 thiss!1504))))

(assert (=> start!22124 e!149456))

(assert (=> start!22124 e!149468))

(assert (=> start!22124 true))

(assert (=> start!22124 tp_is_empty!6049))

(declare-fun b!230342 () Bool)

(assert (=> b!230342 (= e!149462 (and e!149461 mapRes!10243))))

(declare-fun condMapEmpty!10243 () Bool)

(declare-fun mapDefault!10243 () ValueCell!2681)

(assert (=> b!230342 (= condMapEmpty!10243 (= (arr!5389 (_values!4273 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2681)) mapDefault!10243)))))

(declare-fun b!230343 () Bool)

(assert (=> b!230343 (= e!149455 (not true))))

(declare-fun v!346 () V!7713)

(declare-fun lt!115945 () array!11341)

(declare-fun +!601 (ListLongMap!3371 tuple2!4456) ListLongMap!3371)

(assert (=> b!230343 (= (+!601 lt!115946 (tuple2!4457 key!932 v!346)) (getCurrentListMap!1233 lt!115945 (array!11340 (store (arr!5389 (_values!4273 thiss!1504)) index!297 (ValueCellFull!2681 v!346)) (size!5722 (_values!4273 thiss!1504))) (mask!10180 thiss!1504) (extraKeys!4027 thiss!1504) (zeroValue!4131 thiss!1504) (minValue!4131 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4290 thiss!1504)))))

(declare-fun lt!115942 () Unit!7031)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!60 (array!11341 array!11339 (_ BitVec 32) (_ BitVec 32) V!7713 V!7713 (_ BitVec 32) (_ BitVec 64) V!7713 Int) Unit!7031)

(assert (=> b!230343 (= lt!115942 (lemmaAddValidKeyToArrayThenAddPairToListMap!60 (_keys!6344 thiss!1504) (_values!4273 thiss!1504) (mask!10180 thiss!1504) (extraKeys!4027 thiss!1504) (zeroValue!4131 thiss!1504) (minValue!4131 thiss!1504) index!297 key!932 v!346 (defaultEntry!4290 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11341 (_ BitVec 32)) Bool)

(assert (=> b!230343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115945 (mask!10180 thiss!1504))))

(declare-fun lt!115943 () Unit!7031)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11341 (_ BitVec 32) (_ BitVec 32)) Unit!7031)

(assert (=> b!230343 (= lt!115943 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6344 thiss!1504) index!297 (mask!10180 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11341 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230343 (= (arrayCountValidKeys!0 lt!115945 #b00000000000000000000000000000000 (size!5723 (_keys!6344 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6344 thiss!1504) #b00000000000000000000000000000000 (size!5723 (_keys!6344 thiss!1504)))))))

(declare-fun lt!115947 () Unit!7031)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11341 (_ BitVec 32) (_ BitVec 64)) Unit!7031)

(assert (=> b!230343 (= lt!115947 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6344 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3371 0))(
  ( (Nil!3368) (Cons!3367 (h!4015 (_ BitVec 64)) (t!8322 List!3371)) )
))
(declare-fun arrayNoDuplicates!0 (array!11341 (_ BitVec 32) List!3371) Bool)

(assert (=> b!230343 (arrayNoDuplicates!0 lt!115945 #b00000000000000000000000000000000 Nil!3368)))

(assert (=> b!230343 (= lt!115945 (array!11342 (store (arr!5390 (_keys!6344 thiss!1504)) index!297 key!932) (size!5723 (_keys!6344 thiss!1504))))))

(declare-fun lt!115948 () Unit!7031)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11341 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3371) Unit!7031)

(assert (=> b!230343 (= lt!115948 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6344 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3368))))

(declare-fun lt!115939 () Unit!7031)

(assert (=> b!230343 (= lt!115939 e!149458)))

(declare-fun c!38232 () Bool)

(assert (=> b!230343 (= c!38232 (arrayContainsKey!0 (_keys!6344 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!21381 () Bool)

(declare-fun c!38233 () Bool)

(declare-fun call!21384 () Bool)

(assert (=> bm!21381 (= call!21384 (inRange!0 (ite c!38233 (index!5774 lt!115937) (index!5777 lt!115937)) (mask!10180 thiss!1504)))))

(declare-fun b!230344 () Bool)

(declare-fun lt!115941 () Unit!7031)

(assert (=> b!230344 (= e!149466 lt!115941)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!285 (array!11341 array!11339 (_ BitVec 32) (_ BitVec 32) V!7713 V!7713 (_ BitVec 64) Int) Unit!7031)

(assert (=> b!230344 (= lt!115941 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!285 (_keys!6344 thiss!1504) (_values!4273 thiss!1504) (mask!10180 thiss!1504) (extraKeys!4027 thiss!1504) (zeroValue!4131 thiss!1504) (minValue!4131 thiss!1504) key!932 (defaultEntry!4290 thiss!1504)))))

(assert (=> b!230344 (= c!38233 ((_ is MissingZero!901) lt!115937))))

(assert (=> b!230344 e!149459))

(declare-fun b!230345 () Bool)

(assert (=> b!230345 (= e!149464 e!149457)))

(declare-fun res!113297 () Bool)

(assert (=> b!230345 (= res!113297 call!21384)))

(assert (=> b!230345 (=> (not res!113297) (not e!149457))))

(declare-fun b!230346 () Bool)

(declare-fun res!113301 () Bool)

(assert (=> b!230346 (=> (not res!113301) (not e!149460))))

(assert (=> b!230346 (= res!113301 call!21384)))

(assert (=> b!230346 (= e!149459 e!149460)))

(assert (= (and start!22124 res!113300) b!230332))

(assert (= (and b!230332 res!113296) b!230335))

(assert (= (and b!230335 res!113302) b!230341))

(assert (= (and b!230341 c!38230) b!230333))

(assert (= (and b!230341 (not c!38230)) b!230344))

(assert (= (and b!230344 c!38233) b!230346))

(assert (= (and b!230344 (not c!38233)) b!230329))

(assert (= (and b!230346 res!113301) b!230340))

(assert (= (and b!230340 res!113298) b!230336))

(assert (= (and b!230329 c!38231) b!230345))

(assert (= (and b!230329 (not c!38231)) b!230339))

(assert (= (and b!230345 res!113297) b!230330))

(assert (= (and b!230330 res!113295) b!230334))

(assert (= (or b!230346 b!230345) bm!21381))

(assert (= (or b!230336 b!230334) bm!21380))

(assert (= (and b!230341 res!113299) b!230343))

(assert (= (and b!230343 c!38232) b!230338))

(assert (= (and b!230343 (not c!38232)) b!230337))

(assert (= (and b!230342 condMapEmpty!10243) mapIsEmpty!10243))

(assert (= (and b!230342 (not condMapEmpty!10243)) mapNonEmpty!10243))

(assert (= (and mapNonEmpty!10243 ((_ is ValueCellFull!2681) mapValue!10243)) b!230328))

(assert (= (and b!230342 ((_ is ValueCellFull!2681) mapDefault!10243)) b!230331))

(assert (= b!230327 b!230342))

(assert (= start!22124 b!230327))

(declare-fun m!251851 () Bool)

(assert (=> bm!21380 m!251851))

(declare-fun m!251853 () Bool)

(assert (=> b!230335 m!251853))

(declare-fun m!251855 () Bool)

(assert (=> b!230338 m!251855))

(declare-fun m!251857 () Bool)

(assert (=> b!230341 m!251857))

(declare-fun m!251859 () Bool)

(assert (=> b!230341 m!251859))

(declare-fun m!251861 () Bool)

(assert (=> b!230341 m!251861))

(declare-fun m!251863 () Bool)

(assert (=> bm!21381 m!251863))

(declare-fun m!251865 () Bool)

(assert (=> b!230344 m!251865))

(declare-fun m!251867 () Bool)

(assert (=> b!230330 m!251867))

(declare-fun m!251869 () Bool)

(assert (=> b!230333 m!251869))

(declare-fun m!251871 () Bool)

(assert (=> b!230327 m!251871))

(declare-fun m!251873 () Bool)

(assert (=> b!230327 m!251873))

(declare-fun m!251875 () Bool)

(assert (=> mapNonEmpty!10243 m!251875))

(declare-fun m!251877 () Bool)

(assert (=> start!22124 m!251877))

(assert (=> b!230343 m!251851))

(declare-fun m!251879 () Bool)

(assert (=> b!230343 m!251879))

(declare-fun m!251881 () Bool)

(assert (=> b!230343 m!251881))

(declare-fun m!251883 () Bool)

(assert (=> b!230343 m!251883))

(declare-fun m!251885 () Bool)

(assert (=> b!230343 m!251885))

(declare-fun m!251887 () Bool)

(assert (=> b!230343 m!251887))

(declare-fun m!251889 () Bool)

(assert (=> b!230343 m!251889))

(declare-fun m!251891 () Bool)

(assert (=> b!230343 m!251891))

(declare-fun m!251893 () Bool)

(assert (=> b!230343 m!251893))

(declare-fun m!251895 () Bool)

(assert (=> b!230343 m!251895))

(declare-fun m!251897 () Bool)

(assert (=> b!230343 m!251897))

(declare-fun m!251899 () Bool)

(assert (=> b!230343 m!251899))

(declare-fun m!251901 () Bool)

(assert (=> b!230343 m!251901))

(declare-fun m!251903 () Bool)

(assert (=> b!230340 m!251903))

(check-sat b_and!13099 (not b!230343) (not start!22124) (not b!230333) (not bm!21381) (not b!230335) (not b!230338) (not bm!21380) tp_is_empty!6049 (not b_next!6187) (not b!230327) (not b!230341) (not mapNonEmpty!10243) (not b!230344))
(check-sat b_and!13099 (not b_next!6187))
