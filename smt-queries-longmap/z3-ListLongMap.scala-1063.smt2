; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22064 () Bool)

(assert start!22064)

(declare-fun b!228355 () Bool)

(declare-fun b_free!6127 () Bool)

(declare-fun b_next!6127 () Bool)

(assert (=> b!228355 (= b_free!6127 (not b_next!6127))))

(declare-fun tp!21523 () Bool)

(declare-fun b_and!13039 () Bool)

(assert (=> b!228355 (= tp!21523 b_and!13039)))

(declare-fun b!228344 () Bool)

(declare-fun e!148144 () Bool)

(assert (=> b!228344 (= e!148144 true)))

(declare-fun lt!114921 () Bool)

(declare-datatypes ((V!7633 0))(
  ( (V!7634 (val!3039 Int)) )
))
(declare-datatypes ((ValueCell!2651 0))(
  ( (ValueCellFull!2651 (v!5060 V!7633)) (EmptyCell!2651) )
))
(declare-datatypes ((array!11219 0))(
  ( (array!11220 (arr!5329 (Array (_ BitVec 32) ValueCell!2651)) (size!5662 (_ BitVec 32))) )
))
(declare-datatypes ((array!11221 0))(
  ( (array!11222 (arr!5330 (Array (_ BitVec 32) (_ BitVec 64))) (size!5663 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3202 0))(
  ( (LongMapFixedSize!3203 (defaultEntry!4260 Int) (mask!10130 (_ BitVec 32)) (extraKeys!3997 (_ BitVec 32)) (zeroValue!4101 V!7633) (minValue!4101 V!7633) (_size!1650 (_ BitVec 32)) (_keys!6314 array!11221) (_values!4243 array!11219) (_vacant!1650 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3202)

(declare-datatypes ((List!3324 0))(
  ( (Nil!3321) (Cons!3320 (h!3968 (_ BitVec 64)) (t!8275 List!3324)) )
))
(declare-fun arrayNoDuplicates!0 (array!11221 (_ BitVec 32) List!3324) Bool)

(assert (=> b!228344 (= lt!114921 (arrayNoDuplicates!0 (_keys!6314 thiss!1504) #b00000000000000000000000000000000 Nil!3321))))

(declare-fun b!228345 () Bool)

(declare-fun res!112401 () Bool)

(declare-datatypes ((SeekEntryResult!876 0))(
  ( (MissingZero!876 (index!5674 (_ BitVec 32))) (Found!876 (index!5675 (_ BitVec 32))) (Intermediate!876 (undefined!1688 Bool) (index!5676 (_ BitVec 32)) (x!23296 (_ BitVec 32))) (Undefined!876) (MissingVacant!876 (index!5677 (_ BitVec 32))) )
))
(declare-fun lt!114918 () SeekEntryResult!876)

(assert (=> b!228345 (= res!112401 (= (select (arr!5330 (_keys!6314 thiss!1504)) (index!5677 lt!114918)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!148146 () Bool)

(assert (=> b!228345 (=> (not res!112401) (not e!148146))))

(declare-fun b!228346 () Bool)

(declare-fun e!148147 () Bool)

(get-info :version)

(assert (=> b!228346 (= e!148147 ((_ is Undefined!876) lt!114918))))

(declare-fun b!228347 () Bool)

(declare-datatypes ((Unit!6914 0))(
  ( (Unit!6915) )
))
(declare-fun e!148138 () Unit!6914)

(declare-fun lt!114923 () Unit!6914)

(assert (=> b!228347 (= e!148138 lt!114923)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!265 (array!11221 array!11219 (_ BitVec 32) (_ BitVec 32) V!7633 V!7633 (_ BitVec 64) Int) Unit!6914)

(assert (=> b!228347 (= lt!114923 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!265 (_keys!6314 thiss!1504) (_values!4243 thiss!1504) (mask!10130 thiss!1504) (extraKeys!3997 thiss!1504) (zeroValue!4101 thiss!1504) (minValue!4101 thiss!1504) key!932 (defaultEntry!4260 thiss!1504)))))

(declare-fun c!37871 () Bool)

(assert (=> b!228347 (= c!37871 ((_ is MissingZero!876) lt!114918))))

(declare-fun e!148139 () Bool)

(assert (=> b!228347 e!148139))

(declare-fun b!228348 () Bool)

(declare-fun e!148135 () Bool)

(declare-fun e!148141 () Bool)

(assert (=> b!228348 (= e!148135 e!148141)))

(declare-fun res!112395 () Bool)

(assert (=> b!228348 (=> (not res!112395) (not e!148141))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228348 (= res!112395 (inRange!0 index!297 (mask!10130 thiss!1504)))))

(declare-fun lt!114926 () Unit!6914)

(assert (=> b!228348 (= lt!114926 e!148138)))

(declare-fun c!37872 () Bool)

(declare-datatypes ((tuple2!4410 0))(
  ( (tuple2!4411 (_1!2216 (_ BitVec 64)) (_2!2216 V!7633)) )
))
(declare-datatypes ((List!3325 0))(
  ( (Nil!3322) (Cons!3321 (h!3969 tuple2!4410) (t!8276 List!3325)) )
))
(declare-datatypes ((ListLongMap!3325 0))(
  ( (ListLongMap!3326 (toList!1678 List!3325)) )
))
(declare-fun contains!1567 (ListLongMap!3325 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1210 (array!11221 array!11219 (_ BitVec 32) (_ BitVec 32) V!7633 V!7633 (_ BitVec 32) Int) ListLongMap!3325)

(assert (=> b!228348 (= c!37872 (contains!1567 (getCurrentListMap!1210 (_keys!6314 thiss!1504) (_values!4243 thiss!1504) (mask!10130 thiss!1504) (extraKeys!3997 thiss!1504) (zeroValue!4101 thiss!1504) (minValue!4101 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4260 thiss!1504)) key!932))))

(declare-fun bm!21200 () Bool)

(declare-fun call!21204 () Bool)

(declare-fun arrayContainsKey!0 (array!11221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21200 (= call!21204 (arrayContainsKey!0 (_keys!6314 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228349 () Bool)

(declare-fun res!112394 () Bool)

(declare-fun e!148137 () Bool)

(assert (=> b!228349 (=> (not res!112394) (not e!148137))))

(assert (=> b!228349 (= res!112394 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!228350 () Bool)

(declare-fun e!148136 () Bool)

(declare-fun tp_is_empty!5989 () Bool)

(assert (=> b!228350 (= e!148136 tp_is_empty!5989)))

(declare-fun res!112398 () Bool)

(assert (=> start!22064 (=> (not res!112398) (not e!148137))))

(declare-fun valid!1288 (LongMapFixedSize!3202) Bool)

(assert (=> start!22064 (= res!112398 (valid!1288 thiss!1504))))

(assert (=> start!22064 e!148137))

(declare-fun e!148143 () Bool)

(assert (=> start!22064 e!148143))

(assert (=> start!22064 true))

(declare-fun b!228351 () Bool)

(declare-fun c!37870 () Bool)

(assert (=> b!228351 (= c!37870 ((_ is MissingVacant!876) lt!114918))))

(assert (=> b!228351 (= e!148139 e!148147)))

(declare-fun b!228352 () Bool)

(assert (=> b!228352 (= e!148147 e!148146)))

(declare-fun res!112392 () Bool)

(declare-fun call!21203 () Bool)

(assert (=> b!228352 (= res!112392 call!21203)))

(assert (=> b!228352 (=> (not res!112392) (not e!148146))))

(declare-fun b!228353 () Bool)

(assert (=> b!228353 (= e!148141 (not e!148144))))

(declare-fun res!112399 () Bool)

(assert (=> b!228353 (=> res!112399 e!148144)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228353 (= res!112399 (not (validMask!0 (mask!10130 thiss!1504))))))

(declare-fun lt!114920 () array!11221)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11221 (_ BitVec 32)) Bool)

(assert (=> b!228353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114920 (mask!10130 thiss!1504))))

(declare-fun lt!114924 () Unit!6914)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11221 (_ BitVec 32) (_ BitVec 32)) Unit!6914)

(assert (=> b!228353 (= lt!114924 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6314 thiss!1504) index!297 (mask!10130 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11221 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228353 (= (arrayCountValidKeys!0 lt!114920 #b00000000000000000000000000000000 (size!5663 (_keys!6314 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6314 thiss!1504) #b00000000000000000000000000000000 (size!5663 (_keys!6314 thiss!1504)))))))

(declare-fun lt!114919 () Unit!6914)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11221 (_ BitVec 32) (_ BitVec 64)) Unit!6914)

(assert (=> b!228353 (= lt!114919 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6314 thiss!1504) index!297 key!932))))

(assert (=> b!228353 (arrayNoDuplicates!0 lt!114920 #b00000000000000000000000000000000 Nil!3321)))

(assert (=> b!228353 (= lt!114920 (array!11222 (store (arr!5330 (_keys!6314 thiss!1504)) index!297 key!932) (size!5663 (_keys!6314 thiss!1504))))))

(declare-fun lt!114925 () Unit!6914)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11221 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3324) Unit!6914)

(assert (=> b!228353 (= lt!114925 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6314 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3321))))

(declare-fun lt!114928 () Unit!6914)

(declare-fun e!148134 () Unit!6914)

(assert (=> b!228353 (= lt!114928 e!148134)))

(declare-fun c!37873 () Bool)

(assert (=> b!228353 (= c!37873 (arrayContainsKey!0 (_keys!6314 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228354 () Bool)

(declare-fun e!148145 () Bool)

(declare-fun e!148148 () Bool)

(declare-fun mapRes!10153 () Bool)

(assert (=> b!228354 (= e!148145 (and e!148148 mapRes!10153))))

(declare-fun condMapEmpty!10153 () Bool)

(declare-fun mapDefault!10153 () ValueCell!2651)

(assert (=> b!228354 (= condMapEmpty!10153 (= (arr!5329 (_values!4243 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2651)) mapDefault!10153)))))

(declare-fun array_inv!3499 (array!11221) Bool)

(declare-fun array_inv!3500 (array!11219) Bool)

(assert (=> b!228355 (= e!148143 (and tp!21523 tp_is_empty!5989 (array_inv!3499 (_keys!6314 thiss!1504)) (array_inv!3500 (_values!4243 thiss!1504)) e!148145))))

(declare-fun mapIsEmpty!10153 () Bool)

(assert (=> mapIsEmpty!10153 mapRes!10153))

(declare-fun mapNonEmpty!10153 () Bool)

(declare-fun tp!21522 () Bool)

(assert (=> mapNonEmpty!10153 (= mapRes!10153 (and tp!21522 e!148136))))

(declare-fun mapKey!10153 () (_ BitVec 32))

(declare-fun mapValue!10153 () ValueCell!2651)

(declare-fun mapRest!10153 () (Array (_ BitVec 32) ValueCell!2651))

(assert (=> mapNonEmpty!10153 (= (arr!5329 (_values!4243 thiss!1504)) (store mapRest!10153 mapKey!10153 mapValue!10153))))

(declare-fun b!228356 () Bool)

(assert (=> b!228356 (= e!148137 e!148135)))

(declare-fun res!112400 () Bool)

(assert (=> b!228356 (=> (not res!112400) (not e!148135))))

(assert (=> b!228356 (= res!112400 (or (= lt!114918 (MissingZero!876 index!297)) (= lt!114918 (MissingVacant!876 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11221 (_ BitVec 32)) SeekEntryResult!876)

(assert (=> b!228356 (= lt!114918 (seekEntryOrOpen!0 key!932 (_keys!6314 thiss!1504) (mask!10130 thiss!1504)))))

(declare-fun b!228357 () Bool)

(declare-fun res!112393 () Bool)

(declare-fun e!148140 () Bool)

(assert (=> b!228357 (=> (not res!112393) (not e!148140))))

(assert (=> b!228357 (= res!112393 call!21203)))

(assert (=> b!228357 (= e!148139 e!148140)))

(declare-fun b!228358 () Bool)

(declare-fun res!112396 () Bool)

(assert (=> b!228358 (=> res!112396 e!148144)))

(assert (=> b!228358 (= res!112396 (or (not (= (size!5662 (_values!4243 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10130 thiss!1504)))) (not (= (size!5663 (_keys!6314 thiss!1504)) (size!5662 (_values!4243 thiss!1504)))) (bvslt (mask!10130 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3997 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3997 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun bm!21201 () Bool)

(assert (=> bm!21201 (= call!21203 (inRange!0 (ite c!37871 (index!5674 lt!114918) (index!5677 lt!114918)) (mask!10130 thiss!1504)))))

(declare-fun b!228359 () Bool)

(declare-fun Unit!6916 () Unit!6914)

(assert (=> b!228359 (= e!148138 Unit!6916)))

(declare-fun lt!114927 () Unit!6914)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!271 (array!11221 array!11219 (_ BitVec 32) (_ BitVec 32) V!7633 V!7633 (_ BitVec 64) Int) Unit!6914)

(assert (=> b!228359 (= lt!114927 (lemmaInListMapThenSeekEntryOrOpenFindsIt!271 (_keys!6314 thiss!1504) (_values!4243 thiss!1504) (mask!10130 thiss!1504) (extraKeys!3997 thiss!1504) (zeroValue!4101 thiss!1504) (minValue!4101 thiss!1504) key!932 (defaultEntry!4260 thiss!1504)))))

(assert (=> b!228359 false))

(declare-fun b!228360 () Bool)

(assert (=> b!228360 (= e!148146 (not call!21204))))

(declare-fun b!228361 () Bool)

(declare-fun res!112402 () Bool)

(assert (=> b!228361 (=> (not res!112402) (not e!148140))))

(assert (=> b!228361 (= res!112402 (= (select (arr!5330 (_keys!6314 thiss!1504)) (index!5674 lt!114918)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!228362 () Bool)

(declare-fun Unit!6917 () Unit!6914)

(assert (=> b!228362 (= e!148134 Unit!6917)))

(declare-fun b!228363 () Bool)

(assert (=> b!228363 (= e!148140 (not call!21204))))

(declare-fun b!228364 () Bool)

(declare-fun res!112397 () Bool)

(assert (=> b!228364 (=> res!112397 e!148144)))

(assert (=> b!228364 (= res!112397 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6314 thiss!1504) (mask!10130 thiss!1504))))))

(declare-fun b!228365 () Bool)

(declare-fun Unit!6918 () Unit!6914)

(assert (=> b!228365 (= e!148134 Unit!6918)))

(declare-fun lt!114922 () Unit!6914)

(declare-fun lemmaArrayContainsKeyThenInListMap!111 (array!11221 array!11219 (_ BitVec 32) (_ BitVec 32) V!7633 V!7633 (_ BitVec 64) (_ BitVec 32) Int) Unit!6914)

(assert (=> b!228365 (= lt!114922 (lemmaArrayContainsKeyThenInListMap!111 (_keys!6314 thiss!1504) (_values!4243 thiss!1504) (mask!10130 thiss!1504) (extraKeys!3997 thiss!1504) (zeroValue!4101 thiss!1504) (minValue!4101 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4260 thiss!1504)))))

(assert (=> b!228365 false))

(declare-fun b!228366 () Bool)

(assert (=> b!228366 (= e!148148 tp_is_empty!5989)))

(assert (= (and start!22064 res!112398) b!228349))

(assert (= (and b!228349 res!112394) b!228356))

(assert (= (and b!228356 res!112400) b!228348))

(assert (= (and b!228348 c!37872) b!228359))

(assert (= (and b!228348 (not c!37872)) b!228347))

(assert (= (and b!228347 c!37871) b!228357))

(assert (= (and b!228347 (not c!37871)) b!228351))

(assert (= (and b!228357 res!112393) b!228361))

(assert (= (and b!228361 res!112402) b!228363))

(assert (= (and b!228351 c!37870) b!228352))

(assert (= (and b!228351 (not c!37870)) b!228346))

(assert (= (and b!228352 res!112392) b!228345))

(assert (= (and b!228345 res!112401) b!228360))

(assert (= (or b!228357 b!228352) bm!21201))

(assert (= (or b!228363 b!228360) bm!21200))

(assert (= (and b!228348 res!112395) b!228353))

(assert (= (and b!228353 c!37873) b!228365))

(assert (= (and b!228353 (not c!37873)) b!228362))

(assert (= (and b!228353 (not res!112399)) b!228358))

(assert (= (and b!228358 (not res!112396)) b!228364))

(assert (= (and b!228364 (not res!112397)) b!228344))

(assert (= (and b!228354 condMapEmpty!10153) mapIsEmpty!10153))

(assert (= (and b!228354 (not condMapEmpty!10153)) mapNonEmpty!10153))

(assert (= (and mapNonEmpty!10153 ((_ is ValueCellFull!2651) mapValue!10153)) b!228350))

(assert (= (and b!228354 ((_ is ValueCellFull!2651) mapDefault!10153)) b!228366))

(assert (= b!228355 b!228354))

(assert (= start!22064 b!228355))

(declare-fun m!250273 () Bool)

(assert (=> b!228345 m!250273))

(declare-fun m!250275 () Bool)

(assert (=> b!228355 m!250275))

(declare-fun m!250277 () Bool)

(assert (=> b!228355 m!250277))

(declare-fun m!250279 () Bool)

(assert (=> b!228364 m!250279))

(declare-fun m!250281 () Bool)

(assert (=> b!228361 m!250281))

(declare-fun m!250283 () Bool)

(assert (=> b!228353 m!250283))

(declare-fun m!250285 () Bool)

(assert (=> b!228353 m!250285))

(declare-fun m!250287 () Bool)

(assert (=> b!228353 m!250287))

(declare-fun m!250289 () Bool)

(assert (=> b!228353 m!250289))

(declare-fun m!250291 () Bool)

(assert (=> b!228353 m!250291))

(declare-fun m!250293 () Bool)

(assert (=> b!228353 m!250293))

(declare-fun m!250295 () Bool)

(assert (=> b!228353 m!250295))

(declare-fun m!250297 () Bool)

(assert (=> b!228353 m!250297))

(declare-fun m!250299 () Bool)

(assert (=> b!228353 m!250299))

(declare-fun m!250301 () Bool)

(assert (=> b!228353 m!250301))

(assert (=> bm!21200 m!250285))

(declare-fun m!250303 () Bool)

(assert (=> b!228347 m!250303))

(declare-fun m!250305 () Bool)

(assert (=> mapNonEmpty!10153 m!250305))

(declare-fun m!250307 () Bool)

(assert (=> b!228356 m!250307))

(declare-fun m!250309 () Bool)

(assert (=> b!228359 m!250309))

(declare-fun m!250311 () Bool)

(assert (=> bm!21201 m!250311))

(declare-fun m!250313 () Bool)

(assert (=> b!228344 m!250313))

(declare-fun m!250315 () Bool)

(assert (=> b!228348 m!250315))

(declare-fun m!250317 () Bool)

(assert (=> b!228348 m!250317))

(assert (=> b!228348 m!250317))

(declare-fun m!250319 () Bool)

(assert (=> b!228348 m!250319))

(declare-fun m!250321 () Bool)

(assert (=> start!22064 m!250321))

(declare-fun m!250323 () Bool)

(assert (=> b!228365 m!250323))

(check-sat (not b!228355) (not b_next!6127) (not bm!21201) (not b!228364) (not b!228348) tp_is_empty!5989 (not b!228359) (not mapNonEmpty!10153) (not b!228344) (not b!228356) (not b!228365) (not start!22064) (not bm!21200) (not b!228347) (not b!228353) b_and!13039)
(check-sat b_and!13039 (not b_next!6127))
