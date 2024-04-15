; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24610 () Bool)

(assert start!24610)

(declare-fun b!257383 () Bool)

(declare-fun b_free!6733 () Bool)

(declare-fun b_next!6733 () Bool)

(assert (=> b!257383 (= b_free!6733 (not b_next!6733))))

(declare-fun tp!23507 () Bool)

(declare-fun b_and!13777 () Bool)

(assert (=> b!257383 (= tp!23507 b_and!13777)))

(declare-fun b!257372 () Bool)

(declare-fun e!166824 () Bool)

(declare-fun e!166828 () Bool)

(assert (=> b!257372 (= e!166824 e!166828)))

(declare-fun res!125867 () Bool)

(assert (=> b!257372 (=> (not res!125867) (not e!166828))))

(declare-datatypes ((SeekEntryResult!1167 0))(
  ( (MissingZero!1167 (index!6838 (_ BitVec 32))) (Found!1167 (index!6839 (_ BitVec 32))) (Intermediate!1167 (undefined!1979 Bool) (index!6840 (_ BitVec 32)) (x!25016 (_ BitVec 32))) (Undefined!1167) (MissingVacant!1167 (index!6841 (_ BitVec 32))) )
))
(declare-fun lt!129310 () SeekEntryResult!1167)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!257372 (= res!125867 (or (= lt!129310 (MissingZero!1167 index!297)) (= lt!129310 (MissingVacant!1167 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8441 0))(
  ( (V!8442 (val!3342 Int)) )
))
(declare-datatypes ((ValueCell!2954 0))(
  ( (ValueCellFull!2954 (v!5431 V!8441)) (EmptyCell!2954) )
))
(declare-datatypes ((array!12527 0))(
  ( (array!12528 (arr!5931 (Array (_ BitVec 32) ValueCell!2954)) (size!6279 (_ BitVec 32))) )
))
(declare-datatypes ((array!12529 0))(
  ( (array!12530 (arr!5932 (Array (_ BitVec 32) (_ BitVec 64))) (size!6280 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3808 0))(
  ( (LongMapFixedSize!3809 (defaultEntry!4752 Int) (mask!11041 (_ BitVec 32)) (extraKeys!4489 (_ BitVec 32)) (zeroValue!4593 V!8441) (minValue!4593 V!8441) (_size!1953 (_ BitVec 32)) (_keys!6919 array!12529) (_values!4735 array!12527) (_vacant!1953 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3808)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12529 (_ BitVec 32)) SeekEntryResult!1167)

(assert (=> b!257372 (= lt!129310 (seekEntryOrOpen!0 key!932 (_keys!6919 thiss!1504) (mask!11041 thiss!1504)))))

(declare-fun b!257373 () Bool)

(declare-fun res!125864 () Bool)

(declare-fun e!166837 () Bool)

(assert (=> b!257373 (=> (not res!125864) (not e!166837))))

(declare-fun call!24429 () Bool)

(assert (=> b!257373 (= res!125864 call!24429)))

(declare-fun e!166836 () Bool)

(assert (=> b!257373 (= e!166836 e!166837)))

(declare-fun b!257374 () Bool)

(declare-fun e!166834 () Bool)

(declare-fun e!166835 () Bool)

(assert (=> b!257374 (= e!166834 e!166835)))

(declare-fun res!125865 () Bool)

(assert (=> b!257374 (= res!125865 call!24429)))

(assert (=> b!257374 (=> (not res!125865) (not e!166835))))

(declare-fun b!257375 () Bool)

(get-info :version)

(assert (=> b!257375 (= e!166834 ((_ is Undefined!1167) lt!129310))))

(declare-fun bm!24426 () Bool)

(declare-fun call!24430 () Bool)

(declare-fun arrayContainsKey!0 (array!12529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24426 (= call!24430 (arrayContainsKey!0 (_keys!6919 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257376 () Bool)

(declare-fun c!43558 () Bool)

(assert (=> b!257376 (= c!43558 ((_ is MissingVacant!1167) lt!129310))))

(assert (=> b!257376 (= e!166836 e!166834)))

(declare-fun b!257377 () Bool)

(assert (=> b!257377 (= e!166837 (not call!24430))))

(declare-fun mapNonEmpty!11229 () Bool)

(declare-fun mapRes!11229 () Bool)

(declare-fun tp!23508 () Bool)

(declare-fun e!166832 () Bool)

(assert (=> mapNonEmpty!11229 (= mapRes!11229 (and tp!23508 e!166832))))

(declare-fun mapRest!11229 () (Array (_ BitVec 32) ValueCell!2954))

(declare-fun mapValue!11229 () ValueCell!2954)

(declare-fun mapKey!11229 () (_ BitVec 32))

(assert (=> mapNonEmpty!11229 (= (arr!5931 (_values!4735 thiss!1504)) (store mapRest!11229 mapKey!11229 mapValue!11229))))

(declare-fun b!257379 () Bool)

(declare-fun e!166830 () Bool)

(declare-fun e!166827 () Bool)

(assert (=> b!257379 (= e!166830 (and e!166827 mapRes!11229))))

(declare-fun condMapEmpty!11229 () Bool)

(declare-fun mapDefault!11229 () ValueCell!2954)

(assert (=> b!257379 (= condMapEmpty!11229 (= (arr!5931 (_values!4735 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2954)) mapDefault!11229)))))

(declare-fun b!257380 () Bool)

(declare-datatypes ((Unit!7961 0))(
  ( (Unit!7962) )
))
(declare-fun e!166826 () Unit!7961)

(declare-fun Unit!7963 () Unit!7961)

(assert (=> b!257380 (= e!166826 Unit!7963)))

(declare-fun lt!129306 () Unit!7961)

(declare-fun lemmaArrayContainsKeyThenInListMap!243 (array!12529 array!12527 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 64) (_ BitVec 32) Int) Unit!7961)

(assert (=> b!257380 (= lt!129306 (lemmaArrayContainsKeyThenInListMap!243 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(assert (=> b!257380 false))

(declare-fun b!257381 () Bool)

(declare-fun e!166831 () Bool)

(assert (=> b!257381 (= e!166828 e!166831)))

(declare-fun res!125869 () Bool)

(assert (=> b!257381 (=> (not res!125869) (not e!166831))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257381 (= res!125869 (inRange!0 index!297 (mask!11041 thiss!1504)))))

(declare-fun lt!129305 () Unit!7961)

(declare-fun e!166833 () Unit!7961)

(assert (=> b!257381 (= lt!129305 e!166833)))

(declare-fun c!43555 () Bool)

(declare-datatypes ((tuple2!4874 0))(
  ( (tuple2!4875 (_1!2448 (_ BitVec 64)) (_2!2448 V!8441)) )
))
(declare-datatypes ((List!3774 0))(
  ( (Nil!3771) (Cons!3770 (h!4432 tuple2!4874) (t!8826 List!3774)) )
))
(declare-datatypes ((ListLongMap!3777 0))(
  ( (ListLongMap!3778 (toList!1904 List!3774)) )
))
(declare-fun lt!129301 () ListLongMap!3777)

(declare-fun contains!1852 (ListLongMap!3777 (_ BitVec 64)) Bool)

(assert (=> b!257381 (= c!43555 (contains!1852 lt!129301 key!932))))

(declare-fun getCurrentListMap!1413 (array!12529 array!12527 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 32) Int) ListLongMap!3777)

(assert (=> b!257381 (= lt!129301 (getCurrentListMap!1413 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun b!257382 () Bool)

(declare-fun res!125866 () Bool)

(assert (=> b!257382 (=> (not res!125866) (not e!166837))))

(assert (=> b!257382 (= res!125866 (= (select (arr!5932 (_keys!6919 thiss!1504)) (index!6838 lt!129310)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!11229 () Bool)

(assert (=> mapIsEmpty!11229 mapRes!11229))

(declare-fun tp_is_empty!6595 () Bool)

(declare-fun e!166825 () Bool)

(declare-fun array_inv!3927 (array!12529) Bool)

(declare-fun array_inv!3928 (array!12527) Bool)

(assert (=> b!257383 (= e!166825 (and tp!23507 tp_is_empty!6595 (array_inv!3927 (_keys!6919 thiss!1504)) (array_inv!3928 (_values!4735 thiss!1504)) e!166830))))

(declare-fun b!257384 () Bool)

(assert (=> b!257384 (= e!166835 (not call!24430))))

(declare-fun b!257385 () Bool)

(declare-fun res!125863 () Bool)

(assert (=> b!257385 (= res!125863 (= (select (arr!5932 (_keys!6919 thiss!1504)) (index!6841 lt!129310)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257385 (=> (not res!125863) (not e!166835))))

(declare-fun b!257386 () Bool)

(declare-fun lt!129302 () Unit!7961)

(assert (=> b!257386 (= e!166833 lt!129302)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!431 (array!12529 array!12527 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 64) Int) Unit!7961)

(assert (=> b!257386 (= lt!129302 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!431 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 (defaultEntry!4752 thiss!1504)))))

(declare-fun c!43556 () Bool)

(assert (=> b!257386 (= c!43556 ((_ is MissingZero!1167) lt!129310))))

(assert (=> b!257386 e!166836))

(declare-fun b!257387 () Bool)

(declare-fun Unit!7964 () Unit!7961)

(assert (=> b!257387 (= e!166826 Unit!7964)))

(declare-fun b!257388 () Bool)

(assert (=> b!257388 (= e!166827 tp_is_empty!6595)))

(declare-fun b!257389 () Bool)

(declare-fun Unit!7965 () Unit!7961)

(assert (=> b!257389 (= e!166833 Unit!7965)))

(declare-fun lt!129303 () Unit!7961)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!430 (array!12529 array!12527 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 64) Int) Unit!7961)

(assert (=> b!257389 (= lt!129303 (lemmaInListMapThenSeekEntryOrOpenFindsIt!430 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 (defaultEntry!4752 thiss!1504)))))

(assert (=> b!257389 false))

(declare-fun bm!24427 () Bool)

(assert (=> bm!24427 (= call!24429 (inRange!0 (ite c!43556 (index!6838 lt!129310) (index!6841 lt!129310)) (mask!11041 thiss!1504)))))

(declare-fun b!257378 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!257378 (= e!166831 (not (validMask!0 (mask!11041 thiss!1504))))))

(declare-fun lt!129309 () array!12529)

(declare-fun arrayCountValidKeys!0 (array!12529 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!257378 (= (arrayCountValidKeys!0 lt!129309 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!129308 () Unit!7961)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12529 (_ BitVec 32)) Unit!7961)

(assert (=> b!257378 (= lt!129308 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129309 index!297))))

(assert (=> b!257378 (arrayContainsKey!0 lt!129309 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129300 () Unit!7961)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12529 (_ BitVec 64) (_ BitVec 32)) Unit!7961)

(assert (=> b!257378 (= lt!129300 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129309 key!932 index!297))))

(declare-fun v!346 () V!8441)

(declare-fun +!693 (ListLongMap!3777 tuple2!4874) ListLongMap!3777)

(assert (=> b!257378 (= (+!693 lt!129301 (tuple2!4875 key!932 v!346)) (getCurrentListMap!1413 lt!129309 (array!12528 (store (arr!5931 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6279 (_values!4735 thiss!1504))) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129313 () Unit!7961)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!104 (array!12529 array!12527 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 32) (_ BitVec 64) V!8441 Int) Unit!7961)

(assert (=> b!257378 (= lt!129313 (lemmaAddValidKeyToArrayThenAddPairToListMap!104 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) index!297 key!932 v!346 (defaultEntry!4752 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12529 (_ BitVec 32)) Bool)

(assert (=> b!257378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129309 (mask!11041 thiss!1504))))

(declare-fun lt!129311 () Unit!7961)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12529 (_ BitVec 32) (_ BitVec 32)) Unit!7961)

(assert (=> b!257378 (= lt!129311 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6919 thiss!1504) index!297 (mask!11041 thiss!1504)))))

(assert (=> b!257378 (= (arrayCountValidKeys!0 lt!129309 #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6919 thiss!1504) #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504)))))))

(declare-fun lt!129307 () Unit!7961)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12529 (_ BitVec 32) (_ BitVec 64)) Unit!7961)

(assert (=> b!257378 (= lt!129307 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6919 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3775 0))(
  ( (Nil!3772) (Cons!3771 (h!4433 (_ BitVec 64)) (t!8827 List!3775)) )
))
(declare-fun arrayNoDuplicates!0 (array!12529 (_ BitVec 32) List!3775) Bool)

(assert (=> b!257378 (arrayNoDuplicates!0 lt!129309 #b00000000000000000000000000000000 Nil!3772)))

(assert (=> b!257378 (= lt!129309 (array!12530 (store (arr!5932 (_keys!6919 thiss!1504)) index!297 key!932) (size!6280 (_keys!6919 thiss!1504))))))

(declare-fun lt!129312 () Unit!7961)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12529 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3775) Unit!7961)

(assert (=> b!257378 (= lt!129312 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6919 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3772))))

(declare-fun lt!129304 () Unit!7961)

(assert (=> b!257378 (= lt!129304 e!166826)))

(declare-fun c!43557 () Bool)

(assert (=> b!257378 (= c!43557 (arrayContainsKey!0 (_keys!6919 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!125862 () Bool)

(assert (=> start!24610 (=> (not res!125862) (not e!166824))))

(declare-fun valid!1492 (LongMapFixedSize!3808) Bool)

(assert (=> start!24610 (= res!125862 (valid!1492 thiss!1504))))

(assert (=> start!24610 e!166824))

(assert (=> start!24610 e!166825))

(assert (=> start!24610 true))

(assert (=> start!24610 tp_is_empty!6595))

(declare-fun b!257390 () Bool)

(assert (=> b!257390 (= e!166832 tp_is_empty!6595)))

(declare-fun b!257391 () Bool)

(declare-fun res!125868 () Bool)

(assert (=> b!257391 (=> (not res!125868) (not e!166824))))

(assert (=> b!257391 (= res!125868 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!24610 res!125862) b!257391))

(assert (= (and b!257391 res!125868) b!257372))

(assert (= (and b!257372 res!125867) b!257381))

(assert (= (and b!257381 c!43555) b!257389))

(assert (= (and b!257381 (not c!43555)) b!257386))

(assert (= (and b!257386 c!43556) b!257373))

(assert (= (and b!257386 (not c!43556)) b!257376))

(assert (= (and b!257373 res!125864) b!257382))

(assert (= (and b!257382 res!125866) b!257377))

(assert (= (and b!257376 c!43558) b!257374))

(assert (= (and b!257376 (not c!43558)) b!257375))

(assert (= (and b!257374 res!125865) b!257385))

(assert (= (and b!257385 res!125863) b!257384))

(assert (= (or b!257373 b!257374) bm!24427))

(assert (= (or b!257377 b!257384) bm!24426))

(assert (= (and b!257381 res!125869) b!257378))

(assert (= (and b!257378 c!43557) b!257380))

(assert (= (and b!257378 (not c!43557)) b!257387))

(assert (= (and b!257379 condMapEmpty!11229) mapIsEmpty!11229))

(assert (= (and b!257379 (not condMapEmpty!11229)) mapNonEmpty!11229))

(assert (= (and mapNonEmpty!11229 ((_ is ValueCellFull!2954) mapValue!11229)) b!257390))

(assert (= (and b!257379 ((_ is ValueCellFull!2954) mapDefault!11229)) b!257388))

(assert (= b!257383 b!257379))

(assert (= start!24610 b!257383))

(declare-fun m!272217 () Bool)

(assert (=> b!257380 m!272217))

(declare-fun m!272219 () Bool)

(assert (=> b!257386 m!272219))

(declare-fun m!272221 () Bool)

(assert (=> b!257372 m!272221))

(declare-fun m!272223 () Bool)

(assert (=> b!257378 m!272223))

(declare-fun m!272225 () Bool)

(assert (=> b!257378 m!272225))

(declare-fun m!272227 () Bool)

(assert (=> b!257378 m!272227))

(declare-fun m!272229 () Bool)

(assert (=> b!257378 m!272229))

(declare-fun m!272231 () Bool)

(assert (=> b!257378 m!272231))

(declare-fun m!272233 () Bool)

(assert (=> b!257378 m!272233))

(declare-fun m!272235 () Bool)

(assert (=> b!257378 m!272235))

(declare-fun m!272237 () Bool)

(assert (=> b!257378 m!272237))

(declare-fun m!272239 () Bool)

(assert (=> b!257378 m!272239))

(declare-fun m!272241 () Bool)

(assert (=> b!257378 m!272241))

(declare-fun m!272243 () Bool)

(assert (=> b!257378 m!272243))

(declare-fun m!272245 () Bool)

(assert (=> b!257378 m!272245))

(declare-fun m!272247 () Bool)

(assert (=> b!257378 m!272247))

(declare-fun m!272249 () Bool)

(assert (=> b!257378 m!272249))

(declare-fun m!272251 () Bool)

(assert (=> b!257378 m!272251))

(declare-fun m!272253 () Bool)

(assert (=> b!257378 m!272253))

(declare-fun m!272255 () Bool)

(assert (=> b!257378 m!272255))

(declare-fun m!272257 () Bool)

(assert (=> b!257378 m!272257))

(declare-fun m!272259 () Bool)

(assert (=> b!257382 m!272259))

(declare-fun m!272261 () Bool)

(assert (=> b!257381 m!272261))

(declare-fun m!272263 () Bool)

(assert (=> b!257381 m!272263))

(declare-fun m!272265 () Bool)

(assert (=> b!257381 m!272265))

(declare-fun m!272267 () Bool)

(assert (=> start!24610 m!272267))

(assert (=> bm!24426 m!272223))

(declare-fun m!272269 () Bool)

(assert (=> b!257383 m!272269))

(declare-fun m!272271 () Bool)

(assert (=> b!257383 m!272271))

(declare-fun m!272273 () Bool)

(assert (=> b!257385 m!272273))

(declare-fun m!272275 () Bool)

(assert (=> b!257389 m!272275))

(declare-fun m!272277 () Bool)

(assert (=> mapNonEmpty!11229 m!272277))

(declare-fun m!272279 () Bool)

(assert (=> bm!24427 m!272279))

(check-sat (not b!257372) tp_is_empty!6595 (not b!257381) (not b!257386) (not bm!24426) (not b!257378) (not b_next!6733) (not b!257383) b_and!13777 (not b!257389) (not bm!24427) (not mapNonEmpty!11229) (not start!24610) (not b!257380))
(check-sat b_and!13777 (not b_next!6733))
(get-model)

(declare-fun b!257529 () Bool)

(declare-fun e!166932 () Bool)

(declare-fun call!24447 () Bool)

(assert (=> b!257529 (= e!166932 (not call!24447))))

(declare-fun c!43588 () Bool)

(declare-fun call!24448 () Bool)

(declare-fun lt!129402 () SeekEntryResult!1167)

(declare-fun bm!24444 () Bool)

(assert (=> bm!24444 (= call!24448 (inRange!0 (ite c!43588 (index!6838 lt!129402) (index!6841 lt!129402)) (mask!11041 thiss!1504)))))

(declare-fun b!257530 () Bool)

(declare-fun e!166933 () Bool)

(declare-fun e!166930 () Bool)

(assert (=> b!257530 (= e!166933 e!166930)))

(declare-fun c!43587 () Bool)

(assert (=> b!257530 (= c!43587 ((_ is MissingVacant!1167) lt!129402))))

(declare-fun b!257531 () Bool)

(assert (=> b!257531 (and (bvsge (index!6838 lt!129402) #b00000000000000000000000000000000) (bvslt (index!6838 lt!129402) (size!6280 (_keys!6919 thiss!1504))))))

(declare-fun res!125929 () Bool)

(assert (=> b!257531 (= res!125929 (= (select (arr!5932 (_keys!6919 thiss!1504)) (index!6838 lt!129402)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166931 () Bool)

(assert (=> b!257531 (=> (not res!125929) (not e!166931))))

(declare-fun bm!24445 () Bool)

(assert (=> bm!24445 (= call!24447 (arrayContainsKey!0 (_keys!6919 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257532 () Bool)

(assert (=> b!257532 (= e!166933 e!166931)))

(declare-fun res!125926 () Bool)

(assert (=> b!257532 (= res!125926 call!24448)))

(assert (=> b!257532 (=> (not res!125926) (not e!166931))))

(declare-fun b!257533 () Bool)

(declare-fun res!125927 () Bool)

(assert (=> b!257533 (=> (not res!125927) (not e!166932))))

(assert (=> b!257533 (= res!125927 (= (select (arr!5932 (_keys!6919 thiss!1504)) (index!6841 lt!129402)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257533 (and (bvsge (index!6841 lt!129402) #b00000000000000000000000000000000) (bvslt (index!6841 lt!129402) (size!6280 (_keys!6919 thiss!1504))))))

(declare-fun b!257528 () Bool)

(declare-fun res!125928 () Bool)

(assert (=> b!257528 (=> (not res!125928) (not e!166932))))

(assert (=> b!257528 (= res!125928 call!24448)))

(assert (=> b!257528 (= e!166930 e!166932)))

(declare-fun d!61675 () Bool)

(assert (=> d!61675 e!166933))

(assert (=> d!61675 (= c!43588 ((_ is MissingZero!1167) lt!129402))))

(assert (=> d!61675 (= lt!129402 (seekEntryOrOpen!0 key!932 (_keys!6919 thiss!1504) (mask!11041 thiss!1504)))))

(declare-fun lt!129403 () Unit!7961)

(declare-fun choose!1247 (array!12529 array!12527 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 64) Int) Unit!7961)

(assert (=> d!61675 (= lt!129403 (choose!1247 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 (defaultEntry!4752 thiss!1504)))))

(assert (=> d!61675 (validMask!0 (mask!11041 thiss!1504))))

(assert (=> d!61675 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!431 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 (defaultEntry!4752 thiss!1504)) lt!129403)))

(declare-fun b!257534 () Bool)

(assert (=> b!257534 (= e!166930 ((_ is Undefined!1167) lt!129402))))

(declare-fun b!257535 () Bool)

(assert (=> b!257535 (= e!166931 (not call!24447))))

(assert (= (and d!61675 c!43588) b!257532))

(assert (= (and d!61675 (not c!43588)) b!257530))

(assert (= (and b!257532 res!125926) b!257531))

(assert (= (and b!257531 res!125929) b!257535))

(assert (= (and b!257530 c!43587) b!257528))

(assert (= (and b!257530 (not c!43587)) b!257534))

(assert (= (and b!257528 res!125928) b!257533))

(assert (= (and b!257533 res!125927) b!257529))

(assert (= (or b!257532 b!257528) bm!24444))

(assert (= (or b!257535 b!257529) bm!24445))

(assert (=> d!61675 m!272221))

(declare-fun m!272409 () Bool)

(assert (=> d!61675 m!272409))

(assert (=> d!61675 m!272249))

(declare-fun m!272411 () Bool)

(assert (=> b!257533 m!272411))

(declare-fun m!272413 () Bool)

(assert (=> b!257531 m!272413))

(assert (=> bm!24445 m!272223))

(declare-fun m!272415 () Bool)

(assert (=> bm!24444 m!272415))

(assert (=> b!257386 d!61675))

(declare-fun b!257548 () Bool)

(declare-fun e!166941 () SeekEntryResult!1167)

(declare-fun lt!129410 () SeekEntryResult!1167)

(assert (=> b!257548 (= e!166941 (MissingZero!1167 (index!6840 lt!129410)))))

(declare-fun b!257549 () Bool)

(declare-fun c!43595 () Bool)

(declare-fun lt!129411 () (_ BitVec 64))

(assert (=> b!257549 (= c!43595 (= lt!129411 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166942 () SeekEntryResult!1167)

(assert (=> b!257549 (= e!166942 e!166941)))

(declare-fun b!257550 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12529 (_ BitVec 32)) SeekEntryResult!1167)

(assert (=> b!257550 (= e!166941 (seekKeyOrZeroReturnVacant!0 (x!25016 lt!129410) (index!6840 lt!129410) (index!6840 lt!129410) key!932 (_keys!6919 thiss!1504) (mask!11041 thiss!1504)))))

(declare-fun b!257551 () Bool)

(declare-fun e!166940 () SeekEntryResult!1167)

(assert (=> b!257551 (= e!166940 e!166942)))

(assert (=> b!257551 (= lt!129411 (select (arr!5932 (_keys!6919 thiss!1504)) (index!6840 lt!129410)))))

(declare-fun c!43596 () Bool)

(assert (=> b!257551 (= c!43596 (= lt!129411 key!932))))

(declare-fun d!61677 () Bool)

(declare-fun lt!129412 () SeekEntryResult!1167)

(assert (=> d!61677 (and (or ((_ is Undefined!1167) lt!129412) (not ((_ is Found!1167) lt!129412)) (and (bvsge (index!6839 lt!129412) #b00000000000000000000000000000000) (bvslt (index!6839 lt!129412) (size!6280 (_keys!6919 thiss!1504))))) (or ((_ is Undefined!1167) lt!129412) ((_ is Found!1167) lt!129412) (not ((_ is MissingZero!1167) lt!129412)) (and (bvsge (index!6838 lt!129412) #b00000000000000000000000000000000) (bvslt (index!6838 lt!129412) (size!6280 (_keys!6919 thiss!1504))))) (or ((_ is Undefined!1167) lt!129412) ((_ is Found!1167) lt!129412) ((_ is MissingZero!1167) lt!129412) (not ((_ is MissingVacant!1167) lt!129412)) (and (bvsge (index!6841 lt!129412) #b00000000000000000000000000000000) (bvslt (index!6841 lt!129412) (size!6280 (_keys!6919 thiss!1504))))) (or ((_ is Undefined!1167) lt!129412) (ite ((_ is Found!1167) lt!129412) (= (select (arr!5932 (_keys!6919 thiss!1504)) (index!6839 lt!129412)) key!932) (ite ((_ is MissingZero!1167) lt!129412) (= (select (arr!5932 (_keys!6919 thiss!1504)) (index!6838 lt!129412)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1167) lt!129412) (= (select (arr!5932 (_keys!6919 thiss!1504)) (index!6841 lt!129412)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61677 (= lt!129412 e!166940)))

(declare-fun c!43597 () Bool)

(assert (=> d!61677 (= c!43597 (and ((_ is Intermediate!1167) lt!129410) (undefined!1979 lt!129410)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12529 (_ BitVec 32)) SeekEntryResult!1167)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61677 (= lt!129410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11041 thiss!1504)) key!932 (_keys!6919 thiss!1504) (mask!11041 thiss!1504)))))

(assert (=> d!61677 (validMask!0 (mask!11041 thiss!1504))))

(assert (=> d!61677 (= (seekEntryOrOpen!0 key!932 (_keys!6919 thiss!1504) (mask!11041 thiss!1504)) lt!129412)))

(declare-fun b!257552 () Bool)

(assert (=> b!257552 (= e!166942 (Found!1167 (index!6840 lt!129410)))))

(declare-fun b!257553 () Bool)

(assert (=> b!257553 (= e!166940 Undefined!1167)))

(assert (= (and d!61677 c!43597) b!257553))

(assert (= (and d!61677 (not c!43597)) b!257551))

(assert (= (and b!257551 c!43596) b!257552))

(assert (= (and b!257551 (not c!43596)) b!257549))

(assert (= (and b!257549 c!43595) b!257548))

(assert (= (and b!257549 (not c!43595)) b!257550))

(declare-fun m!272417 () Bool)

(assert (=> b!257550 m!272417))

(declare-fun m!272419 () Bool)

(assert (=> b!257551 m!272419))

(declare-fun m!272421 () Bool)

(assert (=> d!61677 m!272421))

(declare-fun m!272423 () Bool)

(assert (=> d!61677 m!272423))

(declare-fun m!272425 () Bool)

(assert (=> d!61677 m!272425))

(assert (=> d!61677 m!272423))

(declare-fun m!272427 () Bool)

(assert (=> d!61677 m!272427))

(declare-fun m!272429 () Bool)

(assert (=> d!61677 m!272429))

(assert (=> d!61677 m!272249))

(assert (=> b!257372 d!61677))

(declare-fun d!61679 () Bool)

(assert (=> d!61679 (= (inRange!0 index!297 (mask!11041 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11041 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!257381 d!61679))

(declare-fun d!61681 () Bool)

(declare-fun e!166947 () Bool)

(assert (=> d!61681 e!166947))

(declare-fun res!125932 () Bool)

(assert (=> d!61681 (=> res!125932 e!166947)))

(declare-fun lt!129423 () Bool)

(assert (=> d!61681 (= res!125932 (not lt!129423))))

(declare-fun lt!129424 () Bool)

(assert (=> d!61681 (= lt!129423 lt!129424)))

(declare-fun lt!129421 () Unit!7961)

(declare-fun e!166948 () Unit!7961)

(assert (=> d!61681 (= lt!129421 e!166948)))

(declare-fun c!43600 () Bool)

(assert (=> d!61681 (= c!43600 lt!129424)))

(declare-fun containsKey!302 (List!3774 (_ BitVec 64)) Bool)

(assert (=> d!61681 (= lt!129424 (containsKey!302 (toList!1904 lt!129301) key!932))))

(assert (=> d!61681 (= (contains!1852 lt!129301 key!932) lt!129423)))

(declare-fun b!257560 () Bool)

(declare-fun lt!129422 () Unit!7961)

(assert (=> b!257560 (= e!166948 lt!129422)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!251 (List!3774 (_ BitVec 64)) Unit!7961)

(assert (=> b!257560 (= lt!129422 (lemmaContainsKeyImpliesGetValueByKeyDefined!251 (toList!1904 lt!129301) key!932))))

(declare-datatypes ((Option!316 0))(
  ( (Some!315 (v!5436 V!8441)) (None!314) )
))
(declare-fun isDefined!252 (Option!316) Bool)

(declare-fun getValueByKey!310 (List!3774 (_ BitVec 64)) Option!316)

(assert (=> b!257560 (isDefined!252 (getValueByKey!310 (toList!1904 lt!129301) key!932))))

(declare-fun b!257561 () Bool)

(declare-fun Unit!7975 () Unit!7961)

(assert (=> b!257561 (= e!166948 Unit!7975)))

(declare-fun b!257562 () Bool)

(assert (=> b!257562 (= e!166947 (isDefined!252 (getValueByKey!310 (toList!1904 lt!129301) key!932)))))

(assert (= (and d!61681 c!43600) b!257560))

(assert (= (and d!61681 (not c!43600)) b!257561))

(assert (= (and d!61681 (not res!125932)) b!257562))

(declare-fun m!272431 () Bool)

(assert (=> d!61681 m!272431))

(declare-fun m!272433 () Bool)

(assert (=> b!257560 m!272433))

(declare-fun m!272435 () Bool)

(assert (=> b!257560 m!272435))

(assert (=> b!257560 m!272435))

(declare-fun m!272437 () Bool)

(assert (=> b!257560 m!272437))

(assert (=> b!257562 m!272435))

(assert (=> b!257562 m!272435))

(assert (=> b!257562 m!272437))

(assert (=> b!257381 d!61681))

(declare-fun b!257605 () Bool)

(declare-fun e!166985 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!257605 (= e!166985 (validKeyInArray!0 (select (arr!5932 (_keys!6919 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!257606 () Bool)

(declare-fun e!166984 () Bool)

(assert (=> b!257606 (= e!166984 (validKeyInArray!0 (select (arr!5932 (_keys!6919 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!257607 () Bool)

(declare-fun e!166986 () ListLongMap!3777)

(declare-fun call!24464 () ListLongMap!3777)

(assert (=> b!257607 (= e!166986 call!24464)))

(declare-fun b!257608 () Bool)

(declare-fun res!125953 () Bool)

(declare-fun e!166987 () Bool)

(assert (=> b!257608 (=> (not res!125953) (not e!166987))))

(declare-fun e!166979 () Bool)

(assert (=> b!257608 (= res!125953 e!166979)))

(declare-fun c!43617 () Bool)

(assert (=> b!257608 (= c!43617 (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!257609 () Bool)

(declare-fun e!166982 () Bool)

(declare-fun lt!129471 () ListLongMap!3777)

(declare-fun apply!254 (ListLongMap!3777 (_ BitVec 64)) V!8441)

(declare-fun get!3047 (ValueCell!2954 V!8441) V!8441)

(declare-fun dynLambda!588 (Int (_ BitVec 64)) V!8441)

(assert (=> b!257609 (= e!166982 (= (apply!254 lt!129471 (select (arr!5932 (_keys!6919 thiss!1504)) #b00000000000000000000000000000000)) (get!3047 (select (arr!5931 (_values!4735 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!588 (defaultEntry!4752 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!257609 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6279 (_values!4735 thiss!1504))))))

(assert (=> b!257609 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))))))

(declare-fun bm!24460 () Bool)

(declare-fun call!24468 () Bool)

(assert (=> bm!24460 (= call!24468 (contains!1852 lt!129471 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!61683 () Bool)

(assert (=> d!61683 e!166987))

(declare-fun res!125956 () Bool)

(assert (=> d!61683 (=> (not res!125956) (not e!166987))))

(assert (=> d!61683 (= res!125956 (or (bvsge #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))))))))

(declare-fun lt!129473 () ListLongMap!3777)

(assert (=> d!61683 (= lt!129471 lt!129473)))

(declare-fun lt!129477 () Unit!7961)

(declare-fun e!166981 () Unit!7961)

(assert (=> d!61683 (= lt!129477 e!166981)))

(declare-fun c!43618 () Bool)

(assert (=> d!61683 (= c!43618 e!166985)))

(declare-fun res!125951 () Bool)

(assert (=> d!61683 (=> (not res!125951) (not e!166985))))

(assert (=> d!61683 (= res!125951 (bvslt #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))))))

(declare-fun e!166975 () ListLongMap!3777)

(assert (=> d!61683 (= lt!129473 e!166975)))

(declare-fun c!43615 () Bool)

(assert (=> d!61683 (= c!43615 (and (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61683 (validMask!0 (mask!11041 thiss!1504))))

(assert (=> d!61683 (= (getCurrentListMap!1413 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)) lt!129471)))

(declare-fun call!24467 () ListLongMap!3777)

(declare-fun call!24466 () ListLongMap!3777)

(declare-fun bm!24461 () Bool)

(declare-fun call!24469 () ListLongMap!3777)

(declare-fun c!43613 () Bool)

(declare-fun call!24465 () ListLongMap!3777)

(assert (=> bm!24461 (= call!24467 (+!693 (ite c!43615 call!24465 (ite c!43613 call!24469 call!24466)) (ite (or c!43615 c!43613) (tuple2!4875 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4593 thiss!1504)) (tuple2!4875 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4593 thiss!1504)))))))

(declare-fun b!257610 () Bool)

(declare-fun e!166980 () Bool)

(assert (=> b!257610 (= e!166980 (= (apply!254 lt!129471 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4593 thiss!1504)))))

(declare-fun bm!24462 () Bool)

(assert (=> bm!24462 (= call!24464 call!24467)))

(declare-fun b!257611 () Bool)

(declare-fun e!166976 () ListLongMap!3777)

(assert (=> b!257611 (= e!166976 call!24464)))

(declare-fun b!257612 () Bool)

(assert (=> b!257612 (= e!166975 (+!693 call!24467 (tuple2!4875 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4593 thiss!1504))))))

(declare-fun bm!24463 () Bool)

(assert (=> bm!24463 (= call!24466 call!24469)))

(declare-fun b!257613 () Bool)

(declare-fun e!166978 () Bool)

(assert (=> b!257613 (= e!166987 e!166978)))

(declare-fun c!43614 () Bool)

(assert (=> b!257613 (= c!43614 (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257614 () Bool)

(assert (=> b!257614 (= e!166978 e!166980)))

(declare-fun res!125957 () Bool)

(assert (=> b!257614 (= res!125957 call!24468)))

(assert (=> b!257614 (=> (not res!125957) (not e!166980))))

(declare-fun b!257615 () Bool)

(declare-fun lt!129470 () Unit!7961)

(assert (=> b!257615 (= e!166981 lt!129470)))

(declare-fun lt!129469 () ListLongMap!3777)

(declare-fun getCurrentListMapNoExtraKeys!570 (array!12529 array!12527 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 32) Int) ListLongMap!3777)

(assert (=> b!257615 (= lt!129469 (getCurrentListMapNoExtraKeys!570 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129472 () (_ BitVec 64))

(assert (=> b!257615 (= lt!129472 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129482 () (_ BitVec 64))

(assert (=> b!257615 (= lt!129482 (select (arr!5932 (_keys!6919 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129488 () Unit!7961)

(declare-fun addStillContains!230 (ListLongMap!3777 (_ BitVec 64) V!8441 (_ BitVec 64)) Unit!7961)

(assert (=> b!257615 (= lt!129488 (addStillContains!230 lt!129469 lt!129472 (zeroValue!4593 thiss!1504) lt!129482))))

(assert (=> b!257615 (contains!1852 (+!693 lt!129469 (tuple2!4875 lt!129472 (zeroValue!4593 thiss!1504))) lt!129482)))

(declare-fun lt!129489 () Unit!7961)

(assert (=> b!257615 (= lt!129489 lt!129488)))

(declare-fun lt!129484 () ListLongMap!3777)

(assert (=> b!257615 (= lt!129484 (getCurrentListMapNoExtraKeys!570 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129476 () (_ BitVec 64))

(assert (=> b!257615 (= lt!129476 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129486 () (_ BitVec 64))

(assert (=> b!257615 (= lt!129486 (select (arr!5932 (_keys!6919 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129490 () Unit!7961)

(declare-fun addApplyDifferent!230 (ListLongMap!3777 (_ BitVec 64) V!8441 (_ BitVec 64)) Unit!7961)

(assert (=> b!257615 (= lt!129490 (addApplyDifferent!230 lt!129484 lt!129476 (minValue!4593 thiss!1504) lt!129486))))

(assert (=> b!257615 (= (apply!254 (+!693 lt!129484 (tuple2!4875 lt!129476 (minValue!4593 thiss!1504))) lt!129486) (apply!254 lt!129484 lt!129486))))

(declare-fun lt!129487 () Unit!7961)

(assert (=> b!257615 (= lt!129487 lt!129490)))

(declare-fun lt!129485 () ListLongMap!3777)

(assert (=> b!257615 (= lt!129485 (getCurrentListMapNoExtraKeys!570 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129483 () (_ BitVec 64))

(assert (=> b!257615 (= lt!129483 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129481 () (_ BitVec 64))

(assert (=> b!257615 (= lt!129481 (select (arr!5932 (_keys!6919 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129478 () Unit!7961)

(assert (=> b!257615 (= lt!129478 (addApplyDifferent!230 lt!129485 lt!129483 (zeroValue!4593 thiss!1504) lt!129481))))

(assert (=> b!257615 (= (apply!254 (+!693 lt!129485 (tuple2!4875 lt!129483 (zeroValue!4593 thiss!1504))) lt!129481) (apply!254 lt!129485 lt!129481))))

(declare-fun lt!129480 () Unit!7961)

(assert (=> b!257615 (= lt!129480 lt!129478)))

(declare-fun lt!129475 () ListLongMap!3777)

(assert (=> b!257615 (= lt!129475 (getCurrentListMapNoExtraKeys!570 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129479 () (_ BitVec 64))

(assert (=> b!257615 (= lt!129479 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129474 () (_ BitVec 64))

(assert (=> b!257615 (= lt!129474 (select (arr!5932 (_keys!6919 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257615 (= lt!129470 (addApplyDifferent!230 lt!129475 lt!129479 (minValue!4593 thiss!1504) lt!129474))))

(assert (=> b!257615 (= (apply!254 (+!693 lt!129475 (tuple2!4875 lt!129479 (minValue!4593 thiss!1504))) lt!129474) (apply!254 lt!129475 lt!129474))))

(declare-fun b!257616 () Bool)

(declare-fun Unit!7976 () Unit!7961)

(assert (=> b!257616 (= e!166981 Unit!7976)))

(declare-fun b!257617 () Bool)

(declare-fun call!24463 () Bool)

(assert (=> b!257617 (= e!166979 (not call!24463))))

(declare-fun bm!24464 () Bool)

(assert (=> bm!24464 (= call!24463 (contains!1852 lt!129471 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24465 () Bool)

(assert (=> bm!24465 (= call!24469 call!24465)))

(declare-fun b!257618 () Bool)

(declare-fun res!125955 () Bool)

(assert (=> b!257618 (=> (not res!125955) (not e!166987))))

(declare-fun e!166977 () Bool)

(assert (=> b!257618 (= res!125955 e!166977)))

(declare-fun res!125958 () Bool)

(assert (=> b!257618 (=> res!125958 e!166977)))

(assert (=> b!257618 (= res!125958 (not e!166984))))

(declare-fun res!125959 () Bool)

(assert (=> b!257618 (=> (not res!125959) (not e!166984))))

(assert (=> b!257618 (= res!125959 (bvslt #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))))))

(declare-fun b!257619 () Bool)

(assert (=> b!257619 (= e!166977 e!166982)))

(declare-fun res!125952 () Bool)

(assert (=> b!257619 (=> (not res!125952) (not e!166982))))

(assert (=> b!257619 (= res!125952 (contains!1852 lt!129471 (select (arr!5932 (_keys!6919 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!257619 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))))))

(declare-fun b!257620 () Bool)

(assert (=> b!257620 (= e!166978 (not call!24468))))

(declare-fun bm!24466 () Bool)

(assert (=> bm!24466 (= call!24465 (getCurrentListMapNoExtraKeys!570 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun b!257621 () Bool)

(declare-fun e!166983 () Bool)

(assert (=> b!257621 (= e!166979 e!166983)))

(declare-fun res!125954 () Bool)

(assert (=> b!257621 (= res!125954 call!24463)))

(assert (=> b!257621 (=> (not res!125954) (not e!166983))))

(declare-fun b!257622 () Bool)

(assert (=> b!257622 (= e!166975 e!166976)))

(assert (=> b!257622 (= c!43613 (and (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257623 () Bool)

(declare-fun c!43616 () Bool)

(assert (=> b!257623 (= c!43616 (and (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!257623 (= e!166976 e!166986)))

(declare-fun b!257624 () Bool)

(assert (=> b!257624 (= e!166986 call!24466)))

(declare-fun b!257625 () Bool)

(assert (=> b!257625 (= e!166983 (= (apply!254 lt!129471 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4593 thiss!1504)))))

(assert (= (and d!61683 c!43615) b!257612))

(assert (= (and d!61683 (not c!43615)) b!257622))

(assert (= (and b!257622 c!43613) b!257611))

(assert (= (and b!257622 (not c!43613)) b!257623))

(assert (= (and b!257623 c!43616) b!257607))

(assert (= (and b!257623 (not c!43616)) b!257624))

(assert (= (or b!257607 b!257624) bm!24463))

(assert (= (or b!257611 bm!24463) bm!24465))

(assert (= (or b!257611 b!257607) bm!24462))

(assert (= (or b!257612 bm!24465) bm!24466))

(assert (= (or b!257612 bm!24462) bm!24461))

(assert (= (and d!61683 res!125951) b!257605))

(assert (= (and d!61683 c!43618) b!257615))

(assert (= (and d!61683 (not c!43618)) b!257616))

(assert (= (and d!61683 res!125956) b!257618))

(assert (= (and b!257618 res!125959) b!257606))

(assert (= (and b!257618 (not res!125958)) b!257619))

(assert (= (and b!257619 res!125952) b!257609))

(assert (= (and b!257618 res!125955) b!257608))

(assert (= (and b!257608 c!43617) b!257621))

(assert (= (and b!257608 (not c!43617)) b!257617))

(assert (= (and b!257621 res!125954) b!257625))

(assert (= (or b!257621 b!257617) bm!24464))

(assert (= (and b!257608 res!125953) b!257613))

(assert (= (and b!257613 c!43614) b!257614))

(assert (= (and b!257613 (not c!43614)) b!257620))

(assert (= (and b!257614 res!125957) b!257610))

(assert (= (or b!257614 b!257620) bm!24460))

(declare-fun b_lambda!8169 () Bool)

(assert (=> (not b_lambda!8169) (not b!257609)))

(declare-fun t!8832 () Bool)

(declare-fun tb!3013 () Bool)

(assert (=> (and b!257383 (= (defaultEntry!4752 thiss!1504) (defaultEntry!4752 thiss!1504)) t!8832) tb!3013))

(declare-fun result!5377 () Bool)

(assert (=> tb!3013 (= result!5377 tp_is_empty!6595)))

(assert (=> b!257609 t!8832))

(declare-fun b_and!13783 () Bool)

(assert (= b_and!13777 (and (=> t!8832 result!5377) b_and!13783)))

(declare-fun m!272439 () Bool)

(assert (=> bm!24466 m!272439))

(declare-fun m!272441 () Bool)

(assert (=> b!257609 m!272441))

(declare-fun m!272443 () Bool)

(assert (=> b!257609 m!272443))

(declare-fun m!272445 () Bool)

(assert (=> b!257609 m!272445))

(declare-fun m!272447 () Bool)

(assert (=> b!257609 m!272447))

(assert (=> b!257609 m!272441))

(declare-fun m!272449 () Bool)

(assert (=> b!257609 m!272449))

(assert (=> b!257609 m!272443))

(assert (=> b!257609 m!272445))

(declare-fun m!272451 () Bool)

(assert (=> b!257615 m!272451))

(declare-fun m!272453 () Bool)

(assert (=> b!257615 m!272453))

(declare-fun m!272455 () Bool)

(assert (=> b!257615 m!272455))

(assert (=> b!257615 m!272441))

(assert (=> b!257615 m!272439))

(declare-fun m!272457 () Bool)

(assert (=> b!257615 m!272457))

(declare-fun m!272459 () Bool)

(assert (=> b!257615 m!272459))

(declare-fun m!272461 () Bool)

(assert (=> b!257615 m!272461))

(assert (=> b!257615 m!272451))

(declare-fun m!272463 () Bool)

(assert (=> b!257615 m!272463))

(declare-fun m!272465 () Bool)

(assert (=> b!257615 m!272465))

(declare-fun m!272467 () Bool)

(assert (=> b!257615 m!272467))

(assert (=> b!257615 m!272467))

(declare-fun m!272469 () Bool)

(assert (=> b!257615 m!272469))

(declare-fun m!272471 () Bool)

(assert (=> b!257615 m!272471))

(declare-fun m!272473 () Bool)

(assert (=> b!257615 m!272473))

(declare-fun m!272475 () Bool)

(assert (=> b!257615 m!272475))

(declare-fun m!272477 () Bool)

(assert (=> b!257615 m!272477))

(assert (=> b!257615 m!272471))

(assert (=> b!257615 m!272465))

(declare-fun m!272479 () Bool)

(assert (=> b!257615 m!272479))

(assert (=> d!61683 m!272249))

(assert (=> b!257605 m!272441))

(assert (=> b!257605 m!272441))

(declare-fun m!272481 () Bool)

(assert (=> b!257605 m!272481))

(declare-fun m!272483 () Bool)

(assert (=> b!257610 m!272483))

(declare-fun m!272485 () Bool)

(assert (=> bm!24461 m!272485))

(declare-fun m!272487 () Bool)

(assert (=> b!257625 m!272487))

(assert (=> b!257606 m!272441))

(assert (=> b!257606 m!272441))

(assert (=> b!257606 m!272481))

(declare-fun m!272489 () Bool)

(assert (=> b!257612 m!272489))

(assert (=> b!257619 m!272441))

(assert (=> b!257619 m!272441))

(declare-fun m!272491 () Bool)

(assert (=> b!257619 m!272491))

(declare-fun m!272493 () Bool)

(assert (=> bm!24464 m!272493))

(declare-fun m!272495 () Bool)

(assert (=> bm!24460 m!272495))

(assert (=> b!257381 d!61683))

(declare-fun b!257636 () Bool)

(declare-fun e!166993 () (_ BitVec 32))

(assert (=> b!257636 (= e!166993 #b00000000000000000000000000000000)))

(declare-fun b!257637 () Bool)

(declare-fun e!166992 () (_ BitVec 32))

(declare-fun call!24472 () (_ BitVec 32))

(assert (=> b!257637 (= e!166992 call!24472)))

(declare-fun bm!24469 () Bool)

(assert (=> bm!24469 (= call!24472 (arrayCountValidKeys!0 lt!129309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6280 (_keys!6919 thiss!1504))))))

(declare-fun b!257638 () Bool)

(assert (=> b!257638 (= e!166993 e!166992)))

(declare-fun c!43624 () Bool)

(assert (=> b!257638 (= c!43624 (validKeyInArray!0 (select (arr!5932 lt!129309) #b00000000000000000000000000000000)))))

(declare-fun d!61685 () Bool)

(declare-fun lt!129493 () (_ BitVec 32))

(assert (=> d!61685 (and (bvsge lt!129493 #b00000000000000000000000000000000) (bvsle lt!129493 (bvsub (size!6280 lt!129309) #b00000000000000000000000000000000)))))

(assert (=> d!61685 (= lt!129493 e!166993)))

(declare-fun c!43623 () Bool)

(assert (=> d!61685 (= c!43623 (bvsge #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))))))

(assert (=> d!61685 (and (bvsle #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6280 (_keys!6919 thiss!1504)) (size!6280 lt!129309)))))

(assert (=> d!61685 (= (arrayCountValidKeys!0 lt!129309 #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))) lt!129493)))

(declare-fun b!257639 () Bool)

(assert (=> b!257639 (= e!166992 (bvadd #b00000000000000000000000000000001 call!24472))))

(assert (= (and d!61685 c!43623) b!257636))

(assert (= (and d!61685 (not c!43623)) b!257638))

(assert (= (and b!257638 c!43624) b!257639))

(assert (= (and b!257638 (not c!43624)) b!257637))

(assert (= (or b!257639 b!257637) bm!24469))

(declare-fun m!272497 () Bool)

(assert (=> bm!24469 m!272497))

(declare-fun m!272499 () Bool)

(assert (=> b!257638 m!272499))

(assert (=> b!257638 m!272499))

(declare-fun m!272501 () Bool)

(assert (=> b!257638 m!272501))

(assert (=> b!257378 d!61685))

(declare-fun d!61687 () Bool)

(assert (=> d!61687 (= (arrayCountValidKeys!0 lt!129309 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!129496 () Unit!7961)

(declare-fun choose!2 (array!12529 (_ BitVec 32)) Unit!7961)

(assert (=> d!61687 (= lt!129496 (choose!2 lt!129309 index!297))))

(declare-fun e!166996 () Bool)

(assert (=> d!61687 e!166996))

(declare-fun res!125964 () Bool)

(assert (=> d!61687 (=> (not res!125964) (not e!166996))))

(assert (=> d!61687 (= res!125964 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6280 lt!129309))))))

(assert (=> d!61687 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129309 index!297) lt!129496)))

(declare-fun b!257644 () Bool)

(declare-fun res!125965 () Bool)

(assert (=> b!257644 (=> (not res!125965) (not e!166996))))

(assert (=> b!257644 (= res!125965 (validKeyInArray!0 (select (arr!5932 lt!129309) index!297)))))

(declare-fun b!257645 () Bool)

(assert (=> b!257645 (= e!166996 (bvslt (size!6280 lt!129309) #b01111111111111111111111111111111))))

(assert (= (and d!61687 res!125964) b!257644))

(assert (= (and b!257644 res!125965) b!257645))

(declare-fun m!272503 () Bool)

(assert (=> d!61687 m!272503))

(declare-fun m!272505 () Bool)

(assert (=> d!61687 m!272505))

(declare-fun m!272507 () Bool)

(assert (=> b!257644 m!272507))

(assert (=> b!257644 m!272507))

(declare-fun m!272509 () Bool)

(assert (=> b!257644 m!272509))

(assert (=> b!257378 d!61687))

(declare-fun b!257646 () Bool)

(declare-fun e!166998 () (_ BitVec 32))

(assert (=> b!257646 (= e!166998 #b00000000000000000000000000000000)))

(declare-fun b!257647 () Bool)

(declare-fun e!166997 () (_ BitVec 32))

(declare-fun call!24473 () (_ BitVec 32))

(assert (=> b!257647 (= e!166997 call!24473)))

(declare-fun bm!24470 () Bool)

(assert (=> bm!24470 (= call!24473 (arrayCountValidKeys!0 (_keys!6919 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6280 (_keys!6919 thiss!1504))))))

(declare-fun b!257648 () Bool)

(assert (=> b!257648 (= e!166998 e!166997)))

(declare-fun c!43626 () Bool)

(assert (=> b!257648 (= c!43626 (validKeyInArray!0 (select (arr!5932 (_keys!6919 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61689 () Bool)

(declare-fun lt!129497 () (_ BitVec 32))

(assert (=> d!61689 (and (bvsge lt!129497 #b00000000000000000000000000000000) (bvsle lt!129497 (bvsub (size!6280 (_keys!6919 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61689 (= lt!129497 e!166998)))

(declare-fun c!43625 () Bool)

(assert (=> d!61689 (= c!43625 (bvsge #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))))))

(assert (=> d!61689 (and (bvsle #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6280 (_keys!6919 thiss!1504)) (size!6280 (_keys!6919 thiss!1504))))))

(assert (=> d!61689 (= (arrayCountValidKeys!0 (_keys!6919 thiss!1504) #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))) lt!129497)))

(declare-fun b!257649 () Bool)

(assert (=> b!257649 (= e!166997 (bvadd #b00000000000000000000000000000001 call!24473))))

(assert (= (and d!61689 c!43625) b!257646))

(assert (= (and d!61689 (not c!43625)) b!257648))

(assert (= (and b!257648 c!43626) b!257649))

(assert (= (and b!257648 (not c!43626)) b!257647))

(assert (= (or b!257649 b!257647) bm!24470))

(declare-fun m!272511 () Bool)

(assert (=> bm!24470 m!272511))

(assert (=> b!257648 m!272441))

(assert (=> b!257648 m!272441))

(assert (=> b!257648 m!272481))

(assert (=> b!257378 d!61689))

(declare-fun d!61691 () Bool)

(assert (=> d!61691 (= (validMask!0 (mask!11041 thiss!1504)) (and (or (= (mask!11041 thiss!1504) #b00000000000000000000000000000111) (= (mask!11041 thiss!1504) #b00000000000000000000000000001111) (= (mask!11041 thiss!1504) #b00000000000000000000000000011111) (= (mask!11041 thiss!1504) #b00000000000000000000000000111111) (= (mask!11041 thiss!1504) #b00000000000000000000000001111111) (= (mask!11041 thiss!1504) #b00000000000000000000000011111111) (= (mask!11041 thiss!1504) #b00000000000000000000000111111111) (= (mask!11041 thiss!1504) #b00000000000000000000001111111111) (= (mask!11041 thiss!1504) #b00000000000000000000011111111111) (= (mask!11041 thiss!1504) #b00000000000000000000111111111111) (= (mask!11041 thiss!1504) #b00000000000000000001111111111111) (= (mask!11041 thiss!1504) #b00000000000000000011111111111111) (= (mask!11041 thiss!1504) #b00000000000000000111111111111111) (= (mask!11041 thiss!1504) #b00000000000000001111111111111111) (= (mask!11041 thiss!1504) #b00000000000000011111111111111111) (= (mask!11041 thiss!1504) #b00000000000000111111111111111111) (= (mask!11041 thiss!1504) #b00000000000001111111111111111111) (= (mask!11041 thiss!1504) #b00000000000011111111111111111111) (= (mask!11041 thiss!1504) #b00000000000111111111111111111111) (= (mask!11041 thiss!1504) #b00000000001111111111111111111111) (= (mask!11041 thiss!1504) #b00000000011111111111111111111111) (= (mask!11041 thiss!1504) #b00000000111111111111111111111111) (= (mask!11041 thiss!1504) #b00000001111111111111111111111111) (= (mask!11041 thiss!1504) #b00000011111111111111111111111111) (= (mask!11041 thiss!1504) #b00000111111111111111111111111111) (= (mask!11041 thiss!1504) #b00001111111111111111111111111111) (= (mask!11041 thiss!1504) #b00011111111111111111111111111111) (= (mask!11041 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11041 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!257378 d!61691))

(declare-fun d!61693 () Bool)

(declare-fun e!167001 () Bool)

(assert (=> d!61693 e!167001))

(declare-fun res!125968 () Bool)

(assert (=> d!61693 (=> (not res!125968) (not e!167001))))

(assert (=> d!61693 (= res!125968 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6280 (_keys!6919 thiss!1504)))))))

(declare-fun lt!129500 () Unit!7961)

(declare-fun choose!41 (array!12529 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3775) Unit!7961)

(assert (=> d!61693 (= lt!129500 (choose!41 (_keys!6919 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3772))))

(assert (=> d!61693 (bvslt (size!6280 (_keys!6919 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61693 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6919 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3772) lt!129500)))

(declare-fun b!257652 () Bool)

(assert (=> b!257652 (= e!167001 (arrayNoDuplicates!0 (array!12530 (store (arr!5932 (_keys!6919 thiss!1504)) index!297 key!932) (size!6280 (_keys!6919 thiss!1504))) #b00000000000000000000000000000000 Nil!3772))))

(assert (= (and d!61693 res!125968) b!257652))

(declare-fun m!272513 () Bool)

(assert (=> d!61693 m!272513))

(assert (=> b!257652 m!272239))

(declare-fun m!272515 () Bool)

(assert (=> b!257652 m!272515))

(assert (=> b!257378 d!61693))

(declare-fun b!257663 () Bool)

(declare-fun e!167011 () Bool)

(declare-fun e!167012 () Bool)

(assert (=> b!257663 (= e!167011 e!167012)))

(declare-fun res!125976 () Bool)

(assert (=> b!257663 (=> (not res!125976) (not e!167012))))

(declare-fun e!167010 () Bool)

(assert (=> b!257663 (= res!125976 (not e!167010))))

(declare-fun res!125975 () Bool)

(assert (=> b!257663 (=> (not res!125975) (not e!167010))))

(assert (=> b!257663 (= res!125975 (validKeyInArray!0 (select (arr!5932 lt!129309) #b00000000000000000000000000000000)))))

(declare-fun d!61695 () Bool)

(declare-fun res!125977 () Bool)

(assert (=> d!61695 (=> res!125977 e!167011)))

(assert (=> d!61695 (= res!125977 (bvsge #b00000000000000000000000000000000 (size!6280 lt!129309)))))

(assert (=> d!61695 (= (arrayNoDuplicates!0 lt!129309 #b00000000000000000000000000000000 Nil!3772) e!167011)))

(declare-fun b!257664 () Bool)

(declare-fun e!167013 () Bool)

(declare-fun call!24476 () Bool)

(assert (=> b!257664 (= e!167013 call!24476)))

(declare-fun b!257665 () Bool)

(assert (=> b!257665 (= e!167013 call!24476)))

(declare-fun bm!24473 () Bool)

(declare-fun c!43629 () Bool)

(assert (=> bm!24473 (= call!24476 (arrayNoDuplicates!0 lt!129309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43629 (Cons!3771 (select (arr!5932 lt!129309) #b00000000000000000000000000000000) Nil!3772) Nil!3772)))))

(declare-fun b!257666 () Bool)

(assert (=> b!257666 (= e!167012 e!167013)))

(assert (=> b!257666 (= c!43629 (validKeyInArray!0 (select (arr!5932 lt!129309) #b00000000000000000000000000000000)))))

(declare-fun b!257667 () Bool)

(declare-fun contains!1855 (List!3775 (_ BitVec 64)) Bool)

(assert (=> b!257667 (= e!167010 (contains!1855 Nil!3772 (select (arr!5932 lt!129309) #b00000000000000000000000000000000)))))

(assert (= (and d!61695 (not res!125977)) b!257663))

(assert (= (and b!257663 res!125975) b!257667))

(assert (= (and b!257663 res!125976) b!257666))

(assert (= (and b!257666 c!43629) b!257665))

(assert (= (and b!257666 (not c!43629)) b!257664))

(assert (= (or b!257665 b!257664) bm!24473))

(assert (=> b!257663 m!272499))

(assert (=> b!257663 m!272499))

(assert (=> b!257663 m!272501))

(assert (=> bm!24473 m!272499))

(declare-fun m!272517 () Bool)

(assert (=> bm!24473 m!272517))

(assert (=> b!257666 m!272499))

(assert (=> b!257666 m!272499))

(assert (=> b!257666 m!272501))

(assert (=> b!257667 m!272499))

(assert (=> b!257667 m!272499))

(declare-fun m!272519 () Bool)

(assert (=> b!257667 m!272519))

(assert (=> b!257378 d!61695))

(declare-fun b!257678 () Bool)

(declare-fun e!167018 () Bool)

(assert (=> b!257678 (= e!167018 (bvslt (size!6280 (_keys!6919 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!61697 () Bool)

(declare-fun e!167019 () Bool)

(assert (=> d!61697 e!167019))

(declare-fun res!125988 () Bool)

(assert (=> d!61697 (=> (not res!125988) (not e!167019))))

(assert (=> d!61697 (= res!125988 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6280 (_keys!6919 thiss!1504)))))))

(declare-fun lt!129503 () Unit!7961)

(declare-fun choose!1 (array!12529 (_ BitVec 32) (_ BitVec 64)) Unit!7961)

(assert (=> d!61697 (= lt!129503 (choose!1 (_keys!6919 thiss!1504) index!297 key!932))))

(assert (=> d!61697 e!167018))

(declare-fun res!125987 () Bool)

(assert (=> d!61697 (=> (not res!125987) (not e!167018))))

(assert (=> d!61697 (= res!125987 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6280 (_keys!6919 thiss!1504)))))))

(assert (=> d!61697 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6919 thiss!1504) index!297 key!932) lt!129503)))

(declare-fun b!257676 () Bool)

(declare-fun res!125986 () Bool)

(assert (=> b!257676 (=> (not res!125986) (not e!167018))))

(assert (=> b!257676 (= res!125986 (not (validKeyInArray!0 (select (arr!5932 (_keys!6919 thiss!1504)) index!297))))))

(declare-fun b!257677 () Bool)

(declare-fun res!125989 () Bool)

(assert (=> b!257677 (=> (not res!125989) (not e!167018))))

(assert (=> b!257677 (= res!125989 (validKeyInArray!0 key!932))))

(declare-fun b!257679 () Bool)

(assert (=> b!257679 (= e!167019 (= (arrayCountValidKeys!0 (array!12530 (store (arr!5932 (_keys!6919 thiss!1504)) index!297 key!932) (size!6280 (_keys!6919 thiss!1504))) #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6919 thiss!1504) #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))) #b00000000000000000000000000000001)))))

(assert (= (and d!61697 res!125987) b!257676))

(assert (= (and b!257676 res!125986) b!257677))

(assert (= (and b!257677 res!125989) b!257678))

(assert (= (and d!61697 res!125988) b!257679))

(declare-fun m!272521 () Bool)

(assert (=> d!61697 m!272521))

(declare-fun m!272523 () Bool)

(assert (=> b!257676 m!272523))

(assert (=> b!257676 m!272523))

(declare-fun m!272525 () Bool)

(assert (=> b!257676 m!272525))

(declare-fun m!272527 () Bool)

(assert (=> b!257677 m!272527))

(assert (=> b!257679 m!272239))

(declare-fun m!272529 () Bool)

(assert (=> b!257679 m!272529))

(assert (=> b!257679 m!272241))

(assert (=> b!257378 d!61697))

(declare-fun b!257680 () Bool)

(declare-fun e!167030 () Bool)

(assert (=> b!257680 (= e!167030 (validKeyInArray!0 (select (arr!5932 lt!129309) #b00000000000000000000000000000000)))))

(declare-fun b!257681 () Bool)

(declare-fun e!167029 () Bool)

(assert (=> b!257681 (= e!167029 (validKeyInArray!0 (select (arr!5932 lt!129309) #b00000000000000000000000000000000)))))

(declare-fun b!257682 () Bool)

(declare-fun e!167031 () ListLongMap!3777)

(declare-fun call!24478 () ListLongMap!3777)

(assert (=> b!257682 (= e!167031 call!24478)))

(declare-fun b!257683 () Bool)

(declare-fun res!125992 () Bool)

(declare-fun e!167032 () Bool)

(assert (=> b!257683 (=> (not res!125992) (not e!167032))))

(declare-fun e!167024 () Bool)

(assert (=> b!257683 (= res!125992 e!167024)))

(declare-fun c!43634 () Bool)

(assert (=> b!257683 (= c!43634 (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!129506 () ListLongMap!3777)

(declare-fun e!167027 () Bool)

(declare-fun b!257684 () Bool)

(assert (=> b!257684 (= e!167027 (= (apply!254 lt!129506 (select (arr!5932 lt!129309) #b00000000000000000000000000000000)) (get!3047 (select (arr!5931 (array!12528 (store (arr!5931 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6279 (_values!4735 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!588 (defaultEntry!4752 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!257684 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6279 (array!12528 (store (arr!5931 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6279 (_values!4735 thiss!1504))))))))

(assert (=> b!257684 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6280 lt!129309)))))

(declare-fun bm!24474 () Bool)

(declare-fun call!24482 () Bool)

(assert (=> bm!24474 (= call!24482 (contains!1852 lt!129506 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!61699 () Bool)

(assert (=> d!61699 e!167032))

(declare-fun res!125995 () Bool)

(assert (=> d!61699 (=> (not res!125995) (not e!167032))))

(assert (=> d!61699 (= res!125995 (or (bvsge #b00000000000000000000000000000000 (size!6280 lt!129309)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6280 lt!129309)))))))

(declare-fun lt!129508 () ListLongMap!3777)

(assert (=> d!61699 (= lt!129506 lt!129508)))

(declare-fun lt!129512 () Unit!7961)

(declare-fun e!167026 () Unit!7961)

(assert (=> d!61699 (= lt!129512 e!167026)))

(declare-fun c!43635 () Bool)

(assert (=> d!61699 (= c!43635 e!167030)))

(declare-fun res!125990 () Bool)

(assert (=> d!61699 (=> (not res!125990) (not e!167030))))

(assert (=> d!61699 (= res!125990 (bvslt #b00000000000000000000000000000000 (size!6280 lt!129309)))))

(declare-fun e!167020 () ListLongMap!3777)

(assert (=> d!61699 (= lt!129508 e!167020)))

(declare-fun c!43632 () Bool)

(assert (=> d!61699 (= c!43632 (and (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61699 (validMask!0 (mask!11041 thiss!1504))))

(assert (=> d!61699 (= (getCurrentListMap!1413 lt!129309 (array!12528 (store (arr!5931 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6279 (_values!4735 thiss!1504))) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)) lt!129506)))

(declare-fun bm!24475 () Bool)

(declare-fun c!43630 () Bool)

(declare-fun call!24481 () ListLongMap!3777)

(declare-fun call!24480 () ListLongMap!3777)

(declare-fun call!24483 () ListLongMap!3777)

(declare-fun call!24479 () ListLongMap!3777)

(assert (=> bm!24475 (= call!24481 (+!693 (ite c!43632 call!24479 (ite c!43630 call!24483 call!24480)) (ite (or c!43632 c!43630) (tuple2!4875 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4593 thiss!1504)) (tuple2!4875 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4593 thiss!1504)))))))

(declare-fun b!257685 () Bool)

(declare-fun e!167025 () Bool)

(assert (=> b!257685 (= e!167025 (= (apply!254 lt!129506 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4593 thiss!1504)))))

(declare-fun bm!24476 () Bool)

(assert (=> bm!24476 (= call!24478 call!24481)))

(declare-fun b!257686 () Bool)

(declare-fun e!167021 () ListLongMap!3777)

(assert (=> b!257686 (= e!167021 call!24478)))

(declare-fun b!257687 () Bool)

(assert (=> b!257687 (= e!167020 (+!693 call!24481 (tuple2!4875 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4593 thiss!1504))))))

(declare-fun bm!24477 () Bool)

(assert (=> bm!24477 (= call!24480 call!24483)))

(declare-fun b!257688 () Bool)

(declare-fun e!167023 () Bool)

(assert (=> b!257688 (= e!167032 e!167023)))

(declare-fun c!43631 () Bool)

(assert (=> b!257688 (= c!43631 (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257689 () Bool)

(assert (=> b!257689 (= e!167023 e!167025)))

(declare-fun res!125996 () Bool)

(assert (=> b!257689 (= res!125996 call!24482)))

(assert (=> b!257689 (=> (not res!125996) (not e!167025))))

(declare-fun b!257690 () Bool)

(declare-fun lt!129505 () Unit!7961)

(assert (=> b!257690 (= e!167026 lt!129505)))

(declare-fun lt!129504 () ListLongMap!3777)

(assert (=> b!257690 (= lt!129504 (getCurrentListMapNoExtraKeys!570 lt!129309 (array!12528 (store (arr!5931 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6279 (_values!4735 thiss!1504))) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129507 () (_ BitVec 64))

(assert (=> b!257690 (= lt!129507 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129517 () (_ BitVec 64))

(assert (=> b!257690 (= lt!129517 (select (arr!5932 lt!129309) #b00000000000000000000000000000000))))

(declare-fun lt!129523 () Unit!7961)

(assert (=> b!257690 (= lt!129523 (addStillContains!230 lt!129504 lt!129507 (zeroValue!4593 thiss!1504) lt!129517))))

(assert (=> b!257690 (contains!1852 (+!693 lt!129504 (tuple2!4875 lt!129507 (zeroValue!4593 thiss!1504))) lt!129517)))

(declare-fun lt!129524 () Unit!7961)

(assert (=> b!257690 (= lt!129524 lt!129523)))

(declare-fun lt!129519 () ListLongMap!3777)

(assert (=> b!257690 (= lt!129519 (getCurrentListMapNoExtraKeys!570 lt!129309 (array!12528 (store (arr!5931 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6279 (_values!4735 thiss!1504))) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129511 () (_ BitVec 64))

(assert (=> b!257690 (= lt!129511 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129521 () (_ BitVec 64))

(assert (=> b!257690 (= lt!129521 (select (arr!5932 lt!129309) #b00000000000000000000000000000000))))

(declare-fun lt!129525 () Unit!7961)

(assert (=> b!257690 (= lt!129525 (addApplyDifferent!230 lt!129519 lt!129511 (minValue!4593 thiss!1504) lt!129521))))

(assert (=> b!257690 (= (apply!254 (+!693 lt!129519 (tuple2!4875 lt!129511 (minValue!4593 thiss!1504))) lt!129521) (apply!254 lt!129519 lt!129521))))

(declare-fun lt!129522 () Unit!7961)

(assert (=> b!257690 (= lt!129522 lt!129525)))

(declare-fun lt!129520 () ListLongMap!3777)

(assert (=> b!257690 (= lt!129520 (getCurrentListMapNoExtraKeys!570 lt!129309 (array!12528 (store (arr!5931 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6279 (_values!4735 thiss!1504))) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129518 () (_ BitVec 64))

(assert (=> b!257690 (= lt!129518 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129516 () (_ BitVec 64))

(assert (=> b!257690 (= lt!129516 (select (arr!5932 lt!129309) #b00000000000000000000000000000000))))

(declare-fun lt!129513 () Unit!7961)

(assert (=> b!257690 (= lt!129513 (addApplyDifferent!230 lt!129520 lt!129518 (zeroValue!4593 thiss!1504) lt!129516))))

(assert (=> b!257690 (= (apply!254 (+!693 lt!129520 (tuple2!4875 lt!129518 (zeroValue!4593 thiss!1504))) lt!129516) (apply!254 lt!129520 lt!129516))))

(declare-fun lt!129515 () Unit!7961)

(assert (=> b!257690 (= lt!129515 lt!129513)))

(declare-fun lt!129510 () ListLongMap!3777)

(assert (=> b!257690 (= lt!129510 (getCurrentListMapNoExtraKeys!570 lt!129309 (array!12528 (store (arr!5931 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6279 (_values!4735 thiss!1504))) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129514 () (_ BitVec 64))

(assert (=> b!257690 (= lt!129514 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129509 () (_ BitVec 64))

(assert (=> b!257690 (= lt!129509 (select (arr!5932 lt!129309) #b00000000000000000000000000000000))))

(assert (=> b!257690 (= lt!129505 (addApplyDifferent!230 lt!129510 lt!129514 (minValue!4593 thiss!1504) lt!129509))))

(assert (=> b!257690 (= (apply!254 (+!693 lt!129510 (tuple2!4875 lt!129514 (minValue!4593 thiss!1504))) lt!129509) (apply!254 lt!129510 lt!129509))))

(declare-fun b!257691 () Bool)

(declare-fun Unit!7977 () Unit!7961)

(assert (=> b!257691 (= e!167026 Unit!7977)))

(declare-fun b!257692 () Bool)

(declare-fun call!24477 () Bool)

(assert (=> b!257692 (= e!167024 (not call!24477))))

(declare-fun bm!24478 () Bool)

(assert (=> bm!24478 (= call!24477 (contains!1852 lt!129506 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24479 () Bool)

(assert (=> bm!24479 (= call!24483 call!24479)))

(declare-fun b!257693 () Bool)

(declare-fun res!125994 () Bool)

(assert (=> b!257693 (=> (not res!125994) (not e!167032))))

(declare-fun e!167022 () Bool)

(assert (=> b!257693 (= res!125994 e!167022)))

(declare-fun res!125997 () Bool)

(assert (=> b!257693 (=> res!125997 e!167022)))

(assert (=> b!257693 (= res!125997 (not e!167029))))

(declare-fun res!125998 () Bool)

(assert (=> b!257693 (=> (not res!125998) (not e!167029))))

(assert (=> b!257693 (= res!125998 (bvslt #b00000000000000000000000000000000 (size!6280 lt!129309)))))

(declare-fun b!257694 () Bool)

(assert (=> b!257694 (= e!167022 e!167027)))

(declare-fun res!125991 () Bool)

(assert (=> b!257694 (=> (not res!125991) (not e!167027))))

(assert (=> b!257694 (= res!125991 (contains!1852 lt!129506 (select (arr!5932 lt!129309) #b00000000000000000000000000000000)))))

(assert (=> b!257694 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6280 lt!129309)))))

(declare-fun b!257695 () Bool)

(assert (=> b!257695 (= e!167023 (not call!24482))))

(declare-fun bm!24480 () Bool)

(assert (=> bm!24480 (= call!24479 (getCurrentListMapNoExtraKeys!570 lt!129309 (array!12528 (store (arr!5931 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6279 (_values!4735 thiss!1504))) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun b!257696 () Bool)

(declare-fun e!167028 () Bool)

(assert (=> b!257696 (= e!167024 e!167028)))

(declare-fun res!125993 () Bool)

(assert (=> b!257696 (= res!125993 call!24477)))

(assert (=> b!257696 (=> (not res!125993) (not e!167028))))

(declare-fun b!257697 () Bool)

(assert (=> b!257697 (= e!167020 e!167021)))

(assert (=> b!257697 (= c!43630 (and (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257698 () Bool)

(declare-fun c!43633 () Bool)

(assert (=> b!257698 (= c!43633 (and (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!257698 (= e!167021 e!167031)))

(declare-fun b!257699 () Bool)

(assert (=> b!257699 (= e!167031 call!24480)))

(declare-fun b!257700 () Bool)

(assert (=> b!257700 (= e!167028 (= (apply!254 lt!129506 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4593 thiss!1504)))))

(assert (= (and d!61699 c!43632) b!257687))

(assert (= (and d!61699 (not c!43632)) b!257697))

(assert (= (and b!257697 c!43630) b!257686))

(assert (= (and b!257697 (not c!43630)) b!257698))

(assert (= (and b!257698 c!43633) b!257682))

(assert (= (and b!257698 (not c!43633)) b!257699))

(assert (= (or b!257682 b!257699) bm!24477))

(assert (= (or b!257686 bm!24477) bm!24479))

(assert (= (or b!257686 b!257682) bm!24476))

(assert (= (or b!257687 bm!24479) bm!24480))

(assert (= (or b!257687 bm!24476) bm!24475))

(assert (= (and d!61699 res!125990) b!257680))

(assert (= (and d!61699 c!43635) b!257690))

(assert (= (and d!61699 (not c!43635)) b!257691))

(assert (= (and d!61699 res!125995) b!257693))

(assert (= (and b!257693 res!125998) b!257681))

(assert (= (and b!257693 (not res!125997)) b!257694))

(assert (= (and b!257694 res!125991) b!257684))

(assert (= (and b!257693 res!125994) b!257683))

(assert (= (and b!257683 c!43634) b!257696))

(assert (= (and b!257683 (not c!43634)) b!257692))

(assert (= (and b!257696 res!125993) b!257700))

(assert (= (or b!257696 b!257692) bm!24478))

(assert (= (and b!257683 res!125992) b!257688))

(assert (= (and b!257688 c!43631) b!257689))

(assert (= (and b!257688 (not c!43631)) b!257695))

(assert (= (and b!257689 res!125996) b!257685))

(assert (= (or b!257689 b!257695) bm!24474))

(declare-fun b_lambda!8171 () Bool)

(assert (=> (not b_lambda!8171) (not b!257684)))

(assert (=> b!257684 t!8832))

(declare-fun b_and!13785 () Bool)

(assert (= b_and!13783 (and (=> t!8832 result!5377) b_and!13785)))

(declare-fun m!272531 () Bool)

(assert (=> bm!24480 m!272531))

(assert (=> b!257684 m!272499))

(declare-fun m!272533 () Bool)

(assert (=> b!257684 m!272533))

(assert (=> b!257684 m!272445))

(declare-fun m!272535 () Bool)

(assert (=> b!257684 m!272535))

(assert (=> b!257684 m!272499))

(declare-fun m!272537 () Bool)

(assert (=> b!257684 m!272537))

(assert (=> b!257684 m!272533))

(assert (=> b!257684 m!272445))

(declare-fun m!272539 () Bool)

(assert (=> b!257690 m!272539))

(declare-fun m!272541 () Bool)

(assert (=> b!257690 m!272541))

(declare-fun m!272543 () Bool)

(assert (=> b!257690 m!272543))

(assert (=> b!257690 m!272499))

(assert (=> b!257690 m!272531))

(declare-fun m!272545 () Bool)

(assert (=> b!257690 m!272545))

(declare-fun m!272547 () Bool)

(assert (=> b!257690 m!272547))

(declare-fun m!272549 () Bool)

(assert (=> b!257690 m!272549))

(assert (=> b!257690 m!272539))

(declare-fun m!272551 () Bool)

(assert (=> b!257690 m!272551))

(declare-fun m!272553 () Bool)

(assert (=> b!257690 m!272553))

(declare-fun m!272555 () Bool)

(assert (=> b!257690 m!272555))

(assert (=> b!257690 m!272555))

(declare-fun m!272557 () Bool)

(assert (=> b!257690 m!272557))

(declare-fun m!272559 () Bool)

(assert (=> b!257690 m!272559))

(declare-fun m!272561 () Bool)

(assert (=> b!257690 m!272561))

(declare-fun m!272563 () Bool)

(assert (=> b!257690 m!272563))

(declare-fun m!272565 () Bool)

(assert (=> b!257690 m!272565))

(assert (=> b!257690 m!272559))

(assert (=> b!257690 m!272553))

(declare-fun m!272567 () Bool)

(assert (=> b!257690 m!272567))

(assert (=> d!61699 m!272249))

(assert (=> b!257680 m!272499))

(assert (=> b!257680 m!272499))

(assert (=> b!257680 m!272501))

(declare-fun m!272569 () Bool)

(assert (=> b!257685 m!272569))

(declare-fun m!272571 () Bool)

(assert (=> bm!24475 m!272571))

(declare-fun m!272573 () Bool)

(assert (=> b!257700 m!272573))

(assert (=> b!257681 m!272499))

(assert (=> b!257681 m!272499))

(assert (=> b!257681 m!272501))

(declare-fun m!272575 () Bool)

(assert (=> b!257687 m!272575))

(assert (=> b!257694 m!272499))

(assert (=> b!257694 m!272499))

(declare-fun m!272577 () Bool)

(assert (=> b!257694 m!272577))

(declare-fun m!272579 () Bool)

(assert (=> bm!24478 m!272579))

(declare-fun m!272581 () Bool)

(assert (=> bm!24474 m!272581))

(assert (=> b!257378 d!61699))

(declare-fun d!61701 () Bool)

(declare-fun res!126003 () Bool)

(declare-fun e!167037 () Bool)

(assert (=> d!61701 (=> res!126003 e!167037)))

(assert (=> d!61701 (= res!126003 (= (select (arr!5932 (_keys!6919 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61701 (= (arrayContainsKey!0 (_keys!6919 thiss!1504) key!932 #b00000000000000000000000000000000) e!167037)))

(declare-fun b!257705 () Bool)

(declare-fun e!167038 () Bool)

(assert (=> b!257705 (= e!167037 e!167038)))

(declare-fun res!126004 () Bool)

(assert (=> b!257705 (=> (not res!126004) (not e!167038))))

(assert (=> b!257705 (= res!126004 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6280 (_keys!6919 thiss!1504))))))

(declare-fun b!257706 () Bool)

(assert (=> b!257706 (= e!167038 (arrayContainsKey!0 (_keys!6919 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61701 (not res!126003)) b!257705))

(assert (= (and b!257705 res!126004) b!257706))

(assert (=> d!61701 m!272441))

(declare-fun m!272583 () Bool)

(assert (=> b!257706 m!272583))

(assert (=> b!257378 d!61701))

(declare-fun d!61703 () Bool)

(declare-fun e!167041 () Bool)

(assert (=> d!61703 e!167041))

(declare-fun res!126007 () Bool)

(assert (=> d!61703 (=> (not res!126007) (not e!167041))))

(assert (=> d!61703 (= res!126007 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6280 (_keys!6919 thiss!1504)))))))

(declare-fun lt!129528 () Unit!7961)

(declare-fun choose!102 ((_ BitVec 64) array!12529 (_ BitVec 32) (_ BitVec 32)) Unit!7961)

(assert (=> d!61703 (= lt!129528 (choose!102 key!932 (_keys!6919 thiss!1504) index!297 (mask!11041 thiss!1504)))))

(assert (=> d!61703 (validMask!0 (mask!11041 thiss!1504))))

(assert (=> d!61703 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6919 thiss!1504) index!297 (mask!11041 thiss!1504)) lt!129528)))

(declare-fun b!257709 () Bool)

(assert (=> b!257709 (= e!167041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12530 (store (arr!5932 (_keys!6919 thiss!1504)) index!297 key!932) (size!6280 (_keys!6919 thiss!1504))) (mask!11041 thiss!1504)))))

(assert (= (and d!61703 res!126007) b!257709))

(declare-fun m!272585 () Bool)

(assert (=> d!61703 m!272585))

(assert (=> d!61703 m!272249))

(assert (=> b!257709 m!272239))

(declare-fun m!272587 () Bool)

(assert (=> b!257709 m!272587))

(assert (=> b!257378 d!61703))

(declare-fun d!61705 () Bool)

(declare-fun e!167044 () Bool)

(assert (=> d!61705 e!167044))

(declare-fun res!126010 () Bool)

(assert (=> d!61705 (=> (not res!126010) (not e!167044))))

(assert (=> d!61705 (= res!126010 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6280 (_keys!6919 thiss!1504))) (bvslt index!297 (size!6279 (_values!4735 thiss!1504)))))))

(declare-fun lt!129531 () Unit!7961)

(declare-fun choose!1248 (array!12529 array!12527 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 32) (_ BitVec 64) V!8441 Int) Unit!7961)

(assert (=> d!61705 (= lt!129531 (choose!1248 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) index!297 key!932 v!346 (defaultEntry!4752 thiss!1504)))))

(assert (=> d!61705 (validMask!0 (mask!11041 thiss!1504))))

(assert (=> d!61705 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!104 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) index!297 key!932 v!346 (defaultEntry!4752 thiss!1504)) lt!129531)))

(declare-fun b!257712 () Bool)

(assert (=> b!257712 (= e!167044 (= (+!693 (getCurrentListMap!1413 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)) (tuple2!4875 key!932 v!346)) (getCurrentListMap!1413 (array!12530 (store (arr!5932 (_keys!6919 thiss!1504)) index!297 key!932) (size!6280 (_keys!6919 thiss!1504))) (array!12528 (store (arr!5931 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6279 (_values!4735 thiss!1504))) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504))))))

(assert (= (and d!61705 res!126010) b!257712))

(declare-fun m!272589 () Bool)

(assert (=> d!61705 m!272589))

(assert (=> d!61705 m!272249))

(assert (=> b!257712 m!272253))

(assert (=> b!257712 m!272265))

(declare-fun m!272591 () Bool)

(assert (=> b!257712 m!272591))

(declare-fun m!272593 () Bool)

(assert (=> b!257712 m!272593))

(assert (=> b!257712 m!272265))

(assert (=> b!257712 m!272239))

(assert (=> b!257378 d!61705))

(declare-fun d!61707 () Bool)

(declare-fun e!167047 () Bool)

(assert (=> d!61707 e!167047))

(declare-fun res!126015 () Bool)

(assert (=> d!61707 (=> (not res!126015) (not e!167047))))

(declare-fun lt!129543 () ListLongMap!3777)

(assert (=> d!61707 (= res!126015 (contains!1852 lt!129543 (_1!2448 (tuple2!4875 key!932 v!346))))))

(declare-fun lt!129542 () List!3774)

(assert (=> d!61707 (= lt!129543 (ListLongMap!3778 lt!129542))))

(declare-fun lt!129541 () Unit!7961)

(declare-fun lt!129540 () Unit!7961)

(assert (=> d!61707 (= lt!129541 lt!129540)))

(assert (=> d!61707 (= (getValueByKey!310 lt!129542 (_1!2448 (tuple2!4875 key!932 v!346))) (Some!315 (_2!2448 (tuple2!4875 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!169 (List!3774 (_ BitVec 64) V!8441) Unit!7961)

(assert (=> d!61707 (= lt!129540 (lemmaContainsTupThenGetReturnValue!169 lt!129542 (_1!2448 (tuple2!4875 key!932 v!346)) (_2!2448 (tuple2!4875 key!932 v!346))))))

(declare-fun insertStrictlySorted!172 (List!3774 (_ BitVec 64) V!8441) List!3774)

(assert (=> d!61707 (= lt!129542 (insertStrictlySorted!172 (toList!1904 lt!129301) (_1!2448 (tuple2!4875 key!932 v!346)) (_2!2448 (tuple2!4875 key!932 v!346))))))

(assert (=> d!61707 (= (+!693 lt!129301 (tuple2!4875 key!932 v!346)) lt!129543)))

(declare-fun b!257717 () Bool)

(declare-fun res!126016 () Bool)

(assert (=> b!257717 (=> (not res!126016) (not e!167047))))

(assert (=> b!257717 (= res!126016 (= (getValueByKey!310 (toList!1904 lt!129543) (_1!2448 (tuple2!4875 key!932 v!346))) (Some!315 (_2!2448 (tuple2!4875 key!932 v!346)))))))

(declare-fun b!257718 () Bool)

(declare-fun contains!1856 (List!3774 tuple2!4874) Bool)

(assert (=> b!257718 (= e!167047 (contains!1856 (toList!1904 lt!129543) (tuple2!4875 key!932 v!346)))))

(assert (= (and d!61707 res!126015) b!257717))

(assert (= (and b!257717 res!126016) b!257718))

(declare-fun m!272595 () Bool)

(assert (=> d!61707 m!272595))

(declare-fun m!272597 () Bool)

(assert (=> d!61707 m!272597))

(declare-fun m!272599 () Bool)

(assert (=> d!61707 m!272599))

(declare-fun m!272601 () Bool)

(assert (=> d!61707 m!272601))

(declare-fun m!272603 () Bool)

(assert (=> b!257717 m!272603))

(declare-fun m!272605 () Bool)

(assert (=> b!257718 m!272605))

(assert (=> b!257378 d!61707))

(declare-fun b!257719 () Bool)

(declare-fun e!167049 () (_ BitVec 32))

(assert (=> b!257719 (= e!167049 #b00000000000000000000000000000000)))

(declare-fun b!257720 () Bool)

(declare-fun e!167048 () (_ BitVec 32))

(declare-fun call!24484 () (_ BitVec 32))

(assert (=> b!257720 (= e!167048 call!24484)))

(declare-fun bm!24481 () Bool)

(assert (=> bm!24481 (= call!24484 (arrayCountValidKeys!0 lt!129309 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!257721 () Bool)

(assert (=> b!257721 (= e!167049 e!167048)))

(declare-fun c!43637 () Bool)

(assert (=> b!257721 (= c!43637 (validKeyInArray!0 (select (arr!5932 lt!129309) index!297)))))

(declare-fun d!61709 () Bool)

(declare-fun lt!129544 () (_ BitVec 32))

(assert (=> d!61709 (and (bvsge lt!129544 #b00000000000000000000000000000000) (bvsle lt!129544 (bvsub (size!6280 lt!129309) index!297)))))

(assert (=> d!61709 (= lt!129544 e!167049)))

(declare-fun c!43636 () Bool)

(assert (=> d!61709 (= c!43636 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!61709 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6280 lt!129309)))))

(assert (=> d!61709 (= (arrayCountValidKeys!0 lt!129309 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!129544)))

(declare-fun b!257722 () Bool)

(assert (=> b!257722 (= e!167048 (bvadd #b00000000000000000000000000000001 call!24484))))

(assert (= (and d!61709 c!43636) b!257719))

(assert (= (and d!61709 (not c!43636)) b!257721))

(assert (= (and b!257721 c!43637) b!257722))

(assert (= (and b!257721 (not c!43637)) b!257720))

(assert (= (or b!257722 b!257720) bm!24481))

(declare-fun m!272607 () Bool)

(assert (=> bm!24481 m!272607))

(assert (=> b!257721 m!272507))

(assert (=> b!257721 m!272507))

(assert (=> b!257721 m!272509))

(assert (=> b!257378 d!61709))

(declare-fun d!61711 () Bool)

(declare-fun res!126017 () Bool)

(declare-fun e!167050 () Bool)

(assert (=> d!61711 (=> res!126017 e!167050)))

(assert (=> d!61711 (= res!126017 (= (select (arr!5932 lt!129309) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61711 (= (arrayContainsKey!0 lt!129309 key!932 #b00000000000000000000000000000000) e!167050)))

(declare-fun b!257723 () Bool)

(declare-fun e!167051 () Bool)

(assert (=> b!257723 (= e!167050 e!167051)))

(declare-fun res!126018 () Bool)

(assert (=> b!257723 (=> (not res!126018) (not e!167051))))

(assert (=> b!257723 (= res!126018 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6280 lt!129309)))))

(declare-fun b!257724 () Bool)

(assert (=> b!257724 (= e!167051 (arrayContainsKey!0 lt!129309 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61711 (not res!126017)) b!257723))

(assert (= (and b!257723 res!126018) b!257724))

(assert (=> d!61711 m!272499))

(declare-fun m!272609 () Bool)

(assert (=> b!257724 m!272609))

(assert (=> b!257378 d!61711))

(declare-fun d!61713 () Bool)

(assert (=> d!61713 (arrayContainsKey!0 lt!129309 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129547 () Unit!7961)

(declare-fun choose!13 (array!12529 (_ BitVec 64) (_ BitVec 32)) Unit!7961)

(assert (=> d!61713 (= lt!129547 (choose!13 lt!129309 key!932 index!297))))

(assert (=> d!61713 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!61713 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129309 key!932 index!297) lt!129547)))

(declare-fun bs!9060 () Bool)

(assert (= bs!9060 d!61713))

(assert (=> bs!9060 m!272247))

(declare-fun m!272611 () Bool)

(assert (=> bs!9060 m!272611))

(assert (=> b!257378 d!61713))

(declare-fun b!257733 () Bool)

(declare-fun e!167058 () Bool)

(declare-fun e!167059 () Bool)

(assert (=> b!257733 (= e!167058 e!167059)))

(declare-fun lt!129554 () (_ BitVec 64))

(assert (=> b!257733 (= lt!129554 (select (arr!5932 lt!129309) #b00000000000000000000000000000000))))

(declare-fun lt!129555 () Unit!7961)

(assert (=> b!257733 (= lt!129555 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129309 lt!129554 #b00000000000000000000000000000000))))

(assert (=> b!257733 (arrayContainsKey!0 lt!129309 lt!129554 #b00000000000000000000000000000000)))

(declare-fun lt!129556 () Unit!7961)

(assert (=> b!257733 (= lt!129556 lt!129555)))

(declare-fun res!126023 () Bool)

(assert (=> b!257733 (= res!126023 (= (seekEntryOrOpen!0 (select (arr!5932 lt!129309) #b00000000000000000000000000000000) lt!129309 (mask!11041 thiss!1504)) (Found!1167 #b00000000000000000000000000000000)))))

(assert (=> b!257733 (=> (not res!126023) (not e!167059))))

(declare-fun b!257734 () Bool)

(declare-fun call!24487 () Bool)

(assert (=> b!257734 (= e!167059 call!24487)))

(declare-fun bm!24484 () Bool)

(assert (=> bm!24484 (= call!24487 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!129309 (mask!11041 thiss!1504)))))

(declare-fun b!257735 () Bool)

(assert (=> b!257735 (= e!167058 call!24487)))

(declare-fun b!257736 () Bool)

(declare-fun e!167060 () Bool)

(assert (=> b!257736 (= e!167060 e!167058)))

(declare-fun c!43640 () Bool)

(assert (=> b!257736 (= c!43640 (validKeyInArray!0 (select (arr!5932 lt!129309) #b00000000000000000000000000000000)))))

(declare-fun d!61715 () Bool)

(declare-fun res!126024 () Bool)

(assert (=> d!61715 (=> res!126024 e!167060)))

(assert (=> d!61715 (= res!126024 (bvsge #b00000000000000000000000000000000 (size!6280 lt!129309)))))

(assert (=> d!61715 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129309 (mask!11041 thiss!1504)) e!167060)))

(assert (= (and d!61715 (not res!126024)) b!257736))

(assert (= (and b!257736 c!43640) b!257733))

(assert (= (and b!257736 (not c!43640)) b!257735))

(assert (= (and b!257733 res!126023) b!257734))

(assert (= (or b!257734 b!257735) bm!24484))

(assert (=> b!257733 m!272499))

(declare-fun m!272613 () Bool)

(assert (=> b!257733 m!272613))

(declare-fun m!272615 () Bool)

(assert (=> b!257733 m!272615))

(assert (=> b!257733 m!272499))

(declare-fun m!272617 () Bool)

(assert (=> b!257733 m!272617))

(declare-fun m!272619 () Bool)

(assert (=> bm!24484 m!272619))

(assert (=> b!257736 m!272499))

(assert (=> b!257736 m!272499))

(assert (=> b!257736 m!272501))

(assert (=> b!257378 d!61715))

(declare-fun d!61717 () Bool)

(declare-fun res!126031 () Bool)

(declare-fun e!167063 () Bool)

(assert (=> d!61717 (=> (not res!126031) (not e!167063))))

(declare-fun simpleValid!277 (LongMapFixedSize!3808) Bool)

(assert (=> d!61717 (= res!126031 (simpleValid!277 thiss!1504))))

(assert (=> d!61717 (= (valid!1492 thiss!1504) e!167063)))

(declare-fun b!257743 () Bool)

(declare-fun res!126032 () Bool)

(assert (=> b!257743 (=> (not res!126032) (not e!167063))))

(assert (=> b!257743 (= res!126032 (= (arrayCountValidKeys!0 (_keys!6919 thiss!1504) #b00000000000000000000000000000000 (size!6280 (_keys!6919 thiss!1504))) (_size!1953 thiss!1504)))))

(declare-fun b!257744 () Bool)

(declare-fun res!126033 () Bool)

(assert (=> b!257744 (=> (not res!126033) (not e!167063))))

(assert (=> b!257744 (= res!126033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6919 thiss!1504) (mask!11041 thiss!1504)))))

(declare-fun b!257745 () Bool)

(assert (=> b!257745 (= e!167063 (arrayNoDuplicates!0 (_keys!6919 thiss!1504) #b00000000000000000000000000000000 Nil!3772))))

(assert (= (and d!61717 res!126031) b!257743))

(assert (= (and b!257743 res!126032) b!257744))

(assert (= (and b!257744 res!126033) b!257745))

(declare-fun m!272621 () Bool)

(assert (=> d!61717 m!272621))

(assert (=> b!257743 m!272241))

(declare-fun m!272623 () Bool)

(assert (=> b!257744 m!272623))

(declare-fun m!272625 () Bool)

(assert (=> b!257745 m!272625))

(assert (=> start!24610 d!61717))

(declare-fun d!61719 () Bool)

(assert (=> d!61719 (= (array_inv!3927 (_keys!6919 thiss!1504)) (bvsge (size!6280 (_keys!6919 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257383 d!61719))

(declare-fun d!61721 () Bool)

(assert (=> d!61721 (= (array_inv!3928 (_values!4735 thiss!1504)) (bvsge (size!6279 (_values!4735 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257383 d!61721))

(declare-fun d!61723 () Bool)

(assert (=> d!61723 (contains!1852 (getCurrentListMap!1413 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)) key!932)))

(declare-fun lt!129559 () Unit!7961)

(declare-fun choose!1249 (array!12529 array!12527 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 64) (_ BitVec 32) Int) Unit!7961)

(assert (=> d!61723 (= lt!129559 (choose!1249 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(assert (=> d!61723 (validMask!0 (mask!11041 thiss!1504))))

(assert (=> d!61723 (= (lemmaArrayContainsKeyThenInListMap!243 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)) lt!129559)))

(declare-fun bs!9061 () Bool)

(assert (= bs!9061 d!61723))

(assert (=> bs!9061 m!272265))

(assert (=> bs!9061 m!272265))

(declare-fun m!272627 () Bool)

(assert (=> bs!9061 m!272627))

(declare-fun m!272629 () Bool)

(assert (=> bs!9061 m!272629))

(assert (=> bs!9061 m!272249))

(assert (=> b!257380 d!61723))

(declare-fun d!61725 () Bool)

(assert (=> d!61725 (= (inRange!0 (ite c!43556 (index!6838 lt!129310) (index!6841 lt!129310)) (mask!11041 thiss!1504)) (and (bvsge (ite c!43556 (index!6838 lt!129310) (index!6841 lt!129310)) #b00000000000000000000000000000000) (bvslt (ite c!43556 (index!6838 lt!129310) (index!6841 lt!129310)) (bvadd (mask!11041 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24427 d!61725))

(declare-fun d!61727 () Bool)

(declare-fun e!167066 () Bool)

(assert (=> d!61727 e!167066))

(declare-fun res!126038 () Bool)

(assert (=> d!61727 (=> (not res!126038) (not e!167066))))

(declare-fun lt!129564 () SeekEntryResult!1167)

(assert (=> d!61727 (= res!126038 ((_ is Found!1167) lt!129564))))

(assert (=> d!61727 (= lt!129564 (seekEntryOrOpen!0 key!932 (_keys!6919 thiss!1504) (mask!11041 thiss!1504)))))

(declare-fun lt!129565 () Unit!7961)

(declare-fun choose!1250 (array!12529 array!12527 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 64) Int) Unit!7961)

(assert (=> d!61727 (= lt!129565 (choose!1250 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 (defaultEntry!4752 thiss!1504)))))

(assert (=> d!61727 (validMask!0 (mask!11041 thiss!1504))))

(assert (=> d!61727 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!430 (_keys!6919 thiss!1504) (_values!4735 thiss!1504) (mask!11041 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 (defaultEntry!4752 thiss!1504)) lt!129565)))

(declare-fun b!257750 () Bool)

(declare-fun res!126039 () Bool)

(assert (=> b!257750 (=> (not res!126039) (not e!167066))))

(assert (=> b!257750 (= res!126039 (inRange!0 (index!6839 lt!129564) (mask!11041 thiss!1504)))))

(declare-fun b!257751 () Bool)

(assert (=> b!257751 (= e!167066 (= (select (arr!5932 (_keys!6919 thiss!1504)) (index!6839 lt!129564)) key!932))))

(assert (=> b!257751 (and (bvsge (index!6839 lt!129564) #b00000000000000000000000000000000) (bvslt (index!6839 lt!129564) (size!6280 (_keys!6919 thiss!1504))))))

(assert (= (and d!61727 res!126038) b!257750))

(assert (= (and b!257750 res!126039) b!257751))

(assert (=> d!61727 m!272221))

(declare-fun m!272631 () Bool)

(assert (=> d!61727 m!272631))

(assert (=> d!61727 m!272249))

(declare-fun m!272633 () Bool)

(assert (=> b!257750 m!272633))

(declare-fun m!272635 () Bool)

(assert (=> b!257751 m!272635))

(assert (=> b!257389 d!61727))

(assert (=> bm!24426 d!61701))

(declare-fun condMapEmpty!11238 () Bool)

(declare-fun mapDefault!11238 () ValueCell!2954)

(assert (=> mapNonEmpty!11229 (= condMapEmpty!11238 (= mapRest!11229 ((as const (Array (_ BitVec 32) ValueCell!2954)) mapDefault!11238)))))

(declare-fun e!167072 () Bool)

(declare-fun mapRes!11238 () Bool)

(assert (=> mapNonEmpty!11229 (= tp!23508 (and e!167072 mapRes!11238))))

(declare-fun mapNonEmpty!11238 () Bool)

(declare-fun tp!23523 () Bool)

(declare-fun e!167071 () Bool)

(assert (=> mapNonEmpty!11238 (= mapRes!11238 (and tp!23523 e!167071))))

(declare-fun mapKey!11238 () (_ BitVec 32))

(declare-fun mapRest!11238 () (Array (_ BitVec 32) ValueCell!2954))

(declare-fun mapValue!11238 () ValueCell!2954)

(assert (=> mapNonEmpty!11238 (= mapRest!11229 (store mapRest!11238 mapKey!11238 mapValue!11238))))

(declare-fun b!257759 () Bool)

(assert (=> b!257759 (= e!167072 tp_is_empty!6595)))

(declare-fun b!257758 () Bool)

(assert (=> b!257758 (= e!167071 tp_is_empty!6595)))

(declare-fun mapIsEmpty!11238 () Bool)

(assert (=> mapIsEmpty!11238 mapRes!11238))

(assert (= (and mapNonEmpty!11229 condMapEmpty!11238) mapIsEmpty!11238))

(assert (= (and mapNonEmpty!11229 (not condMapEmpty!11238)) mapNonEmpty!11238))

(assert (= (and mapNonEmpty!11238 ((_ is ValueCellFull!2954) mapValue!11238)) b!257758))

(assert (= (and mapNonEmpty!11229 ((_ is ValueCellFull!2954) mapDefault!11238)) b!257759))

(declare-fun m!272637 () Bool)

(assert (=> mapNonEmpty!11238 m!272637))

(declare-fun b_lambda!8173 () Bool)

(assert (= b_lambda!8169 (or (and b!257383 b_free!6733) b_lambda!8173)))

(declare-fun b_lambda!8175 () Bool)

(assert (= b_lambda!8171 (or (and b!257383 b_free!6733) b_lambda!8175)))

(check-sat (not b!257644) (not d!61681) (not d!61723) (not bm!24470) (not bm!24484) (not b!257736) (not b!257666) (not b_lambda!8173) b_and!13785 (not b!257706) (not b!257679) (not b!257638) (not b!257609) (not b!257619) (not b!257612) (not b!257712) (not d!61677) tp_is_empty!6595 (not d!61675) (not b!257718) (not b!257721) (not bm!24460) (not d!61699) (not b!257605) (not b!257680) (not bm!24444) (not b!257685) (not b!257681) (not b_lambda!8175) (not b!257550) (not d!61717) (not b!257677) (not b!257690) (not b!257652) (not d!61727) (not d!61687) (not bm!24445) (not d!61697) (not b!257724) (not b_next!6733) (not b!257663) (not b!257606) (not b!257745) (not d!61707) (not b!257684) (not b!257717) (not b!257625) (not b!257743) (not mapNonEmpty!11238) (not b!257700) (not bm!24473) (not bm!24466) (not bm!24474) (not b!257733) (not bm!24461) (not bm!24481) (not bm!24464) (not b!257610) (not d!61703) (not b!257687) (not bm!24480) (not d!61705) (not b!257648) (not b!257562) (not b!257750) (not b!257744) (not d!61693) (not bm!24478) (not b!257615) (not b!257676) (not d!61713) (not bm!24475) (not b!257709) (not d!61683) (not b!257694) (not b!257667) (not bm!24469) (not b!257560))
(check-sat b_and!13785 (not b_next!6733))
