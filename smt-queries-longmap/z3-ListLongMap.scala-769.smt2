; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18102 () Bool)

(assert start!18102)

(declare-fun b!180277 () Bool)

(declare-fun b_free!4453 () Bool)

(declare-fun b_next!4453 () Bool)

(assert (=> b!180277 (= b_free!4453 (not b_next!4453))))

(declare-fun tp!16092 () Bool)

(declare-fun b_and!11001 () Bool)

(assert (=> b!180277 (= tp!16092 b_and!11001)))

(declare-fun b!180273 () Bool)

(declare-fun e!118738 () Bool)

(declare-datatypes ((V!5281 0))(
  ( (V!5282 (val!2157 Int)) )
))
(declare-datatypes ((tuple2!3308 0))(
  ( (tuple2!3309 (_1!1665 (_ BitVec 64)) (_2!1665 V!5281)) )
))
(declare-datatypes ((List!2262 0))(
  ( (Nil!2259) (Cons!2258 (h!2883 tuple2!3308) (t!7102 List!2262)) )
))
(declare-datatypes ((ListLongMap!2235 0))(
  ( (ListLongMap!2236 (toList!1133 List!2262)) )
))
(declare-fun call!18198 () ListLongMap!2235)

(declare-fun call!18199 () ListLongMap!2235)

(assert (=> b!180273 (= e!118738 (not (= call!18198 call!18199)))))

(declare-fun b!180274 () Bool)

(declare-fun e!118742 () Bool)

(declare-fun e!118741 () Bool)

(assert (=> b!180274 (= e!118742 e!118741)))

(declare-fun res!85391 () Bool)

(assert (=> b!180274 (=> (not res!85391) (not e!118741))))

(declare-datatypes ((SeekEntryResult!585 0))(
  ( (MissingZero!585 (index!4509 (_ BitVec 32))) (Found!585 (index!4510 (_ BitVec 32))) (Intermediate!585 (undefined!1397 Bool) (index!4511 (_ BitVec 32)) (x!19697 (_ BitVec 32))) (Undefined!585) (MissingVacant!585 (index!4512 (_ BitVec 32))) )
))
(declare-fun lt!89089 () SeekEntryResult!585)

(get-info :version)

(assert (=> b!180274 (= res!85391 (and (not ((_ is Undefined!585) lt!89089)) (not ((_ is MissingVacant!585) lt!89089)) ((_ is MissingZero!585) lt!89089)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((ValueCell!1769 0))(
  ( (ValueCellFull!1769 (v!4049 V!5281)) (EmptyCell!1769) )
))
(declare-datatypes ((array!7607 0))(
  ( (array!7608 (arr!3602 (Array (_ BitVec 32) (_ BitVec 64))) (size!3910 (_ BitVec 32))) )
))
(declare-datatypes ((array!7609 0))(
  ( (array!7610 (arr!3603 (Array (_ BitVec 32) ValueCell!1769)) (size!3911 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2446 0))(
  ( (LongMapFixedSize!2447 (defaultEntry!3699 Int) (mask!8697 (_ BitVec 32)) (extraKeys!3436 (_ BitVec 32)) (zeroValue!3540 V!5281) (minValue!3540 V!5281) (_size!1272 (_ BitVec 32)) (_keys!5591 array!7607) (_values!3682 array!7609) (_vacant!1272 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2446)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7607 (_ BitVec 32)) SeekEntryResult!585)

(assert (=> b!180274 (= lt!89089 (seekEntryOrOpen!0 key!828 (_keys!5591 thiss!1248) (mask!8697 thiss!1248)))))

(declare-fun b!180275 () Bool)

(declare-fun e!118745 () Bool)

(declare-fun tp_is_empty!4225 () Bool)

(assert (=> b!180275 (= e!118745 tp_is_empty!4225)))

(declare-fun b!180276 () Bool)

(declare-fun e!118740 () Bool)

(assert (=> b!180276 (= e!118740 e!118738)))

(declare-fun c!32295 () Bool)

(declare-datatypes ((tuple2!3310 0))(
  ( (tuple2!3311 (_1!1666 Bool) (_2!1666 LongMapFixedSize!2446)) )
))
(declare-fun lt!89087 () tuple2!3310)

(assert (=> b!180276 (= c!32295 (_1!1666 lt!89087))))

(declare-fun e!118743 () Bool)

(declare-fun e!118744 () Bool)

(declare-fun array_inv!2323 (array!7607) Bool)

(declare-fun array_inv!2324 (array!7609) Bool)

(assert (=> b!180277 (= e!118743 (and tp!16092 tp_is_empty!4225 (array_inv!2323 (_keys!5591 thiss!1248)) (array_inv!2324 (_values!3682 thiss!1248)) e!118744))))

(declare-fun mapNonEmpty!7234 () Bool)

(declare-fun mapRes!7234 () Bool)

(declare-fun tp!16093 () Bool)

(declare-fun e!118736 () Bool)

(assert (=> mapNonEmpty!7234 (= mapRes!7234 (and tp!16093 e!118736))))

(declare-fun mapKey!7234 () (_ BitVec 32))

(declare-fun mapValue!7234 () ValueCell!1769)

(declare-fun mapRest!7234 () (Array (_ BitVec 32) ValueCell!1769))

(assert (=> mapNonEmpty!7234 (= (arr!3603 (_values!3682 thiss!1248)) (store mapRest!7234 mapKey!7234 mapValue!7234))))

(declare-fun b!180278 () Bool)

(declare-fun res!85390 () Bool)

(assert (=> b!180278 (=> (not res!85390) (not e!118742))))

(assert (=> b!180278 (= res!85390 (not (= key!828 (bvneg key!828))))))

(declare-fun res!85392 () Bool)

(assert (=> start!18102 (=> (not res!85392) (not e!118742))))

(declare-fun valid!1042 (LongMapFixedSize!2446) Bool)

(assert (=> start!18102 (= res!85392 (valid!1042 thiss!1248))))

(assert (=> start!18102 e!118742))

(assert (=> start!18102 e!118743))

(assert (=> start!18102 true))

(assert (=> start!18102 tp_is_empty!4225))

(declare-fun b!180279 () Bool)

(declare-fun e!118737 () Bool)

(declare-fun lt!89088 () ListLongMap!2235)

(declare-fun v!309 () V!5281)

(declare-fun +!268 (ListLongMap!2235 tuple2!3308) ListLongMap!2235)

(assert (=> b!180279 (= e!118737 (not (= lt!89088 (+!268 call!18199 (tuple2!3309 key!828 v!309)))))))

(declare-fun bm!18195 () Bool)

(declare-fun map!1928 (LongMapFixedSize!2446) ListLongMap!2235)

(assert (=> bm!18195 (= call!18198 (map!1928 (_2!1666 lt!89087)))))

(declare-fun bm!18196 () Bool)

(assert (=> bm!18196 (= call!18199 (map!1928 thiss!1248))))

(declare-fun b!180280 () Bool)

(assert (=> b!180280 (= e!118741 e!118740)))

(declare-fun res!85393 () Bool)

(assert (=> b!180280 (=> res!85393 e!118740)))

(assert (=> b!180280 (= res!85393 (not (valid!1042 (_2!1666 lt!89087))))))

(declare-fun updateHelperNewKey!93 (LongMapFixedSize!2446 (_ BitVec 64) V!5281 (_ BitVec 32)) tuple2!3310)

(assert (=> b!180280 (= lt!89087 (updateHelperNewKey!93 thiss!1248 key!828 v!309 (index!4509 lt!89089)))))

(declare-fun b!180281 () Bool)

(assert (=> b!180281 (= e!118736 tp_is_empty!4225)))

(declare-fun b!180282 () Bool)

(assert (=> b!180282 (= e!118738 e!118737)))

(assert (=> b!180282 (= lt!89088 call!18198)))

(declare-fun res!85389 () Bool)

(declare-fun contains!1221 (ListLongMap!2235 (_ BitVec 64)) Bool)

(assert (=> b!180282 (= res!85389 (not (contains!1221 lt!89088 key!828)))))

(assert (=> b!180282 (=> res!85389 e!118737)))

(declare-fun mapIsEmpty!7234 () Bool)

(assert (=> mapIsEmpty!7234 mapRes!7234))

(declare-fun b!180283 () Bool)

(assert (=> b!180283 (= e!118744 (and e!118745 mapRes!7234))))

(declare-fun condMapEmpty!7234 () Bool)

(declare-fun mapDefault!7234 () ValueCell!1769)

(assert (=> b!180283 (= condMapEmpty!7234 (= (arr!3603 (_values!3682 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1769)) mapDefault!7234)))))

(assert (= (and start!18102 res!85392) b!180278))

(assert (= (and b!180278 res!85390) b!180274))

(assert (= (and b!180274 res!85391) b!180280))

(assert (= (and b!180280 (not res!85393)) b!180276))

(assert (= (and b!180276 c!32295) b!180282))

(assert (= (and b!180276 (not c!32295)) b!180273))

(assert (= (and b!180282 (not res!85389)) b!180279))

(assert (= (or b!180279 b!180273) bm!18196))

(assert (= (or b!180282 b!180273) bm!18195))

(assert (= (and b!180283 condMapEmpty!7234) mapIsEmpty!7234))

(assert (= (and b!180283 (not condMapEmpty!7234)) mapNonEmpty!7234))

(assert (= (and mapNonEmpty!7234 ((_ is ValueCellFull!1769) mapValue!7234)) b!180281))

(assert (= (and b!180283 ((_ is ValueCellFull!1769) mapDefault!7234)) b!180275))

(assert (= b!180277 b!180283))

(assert (= start!18102 b!180277))

(declare-fun m!208455 () Bool)

(assert (=> b!180280 m!208455))

(declare-fun m!208457 () Bool)

(assert (=> b!180280 m!208457))

(declare-fun m!208459 () Bool)

(assert (=> b!180282 m!208459))

(declare-fun m!208461 () Bool)

(assert (=> bm!18195 m!208461))

(declare-fun m!208463 () Bool)

(assert (=> bm!18196 m!208463))

(declare-fun m!208465 () Bool)

(assert (=> start!18102 m!208465))

(declare-fun m!208467 () Bool)

(assert (=> mapNonEmpty!7234 m!208467))

(declare-fun m!208469 () Bool)

(assert (=> b!180277 m!208469))

(declare-fun m!208471 () Bool)

(assert (=> b!180277 m!208471))

(declare-fun m!208473 () Bool)

(assert (=> b!180279 m!208473))

(declare-fun m!208475 () Bool)

(assert (=> b!180274 m!208475))

(check-sat (not b_next!4453) (not b!180274) (not b!180277) (not b!180279) (not bm!18195) (not b!180280) (not mapNonEmpty!7234) tp_is_empty!4225 (not bm!18196) (not b!180282) b_and!11001 (not start!18102))
(check-sat b_and!11001 (not b_next!4453))
(get-model)

(declare-fun d!54285 () Bool)

(declare-fun res!85430 () Bool)

(declare-fun e!118808 () Bool)

(assert (=> d!54285 (=> (not res!85430) (not e!118808))))

(declare-fun simpleValid!164 (LongMapFixedSize!2446) Bool)

(assert (=> d!54285 (= res!85430 (simpleValid!164 (_2!1666 lt!89087)))))

(assert (=> d!54285 (= (valid!1042 (_2!1666 lt!89087)) e!118808)))

(declare-fun b!180356 () Bool)

(declare-fun res!85431 () Bool)

(assert (=> b!180356 (=> (not res!85431) (not e!118808))))

(declare-fun arrayCountValidKeys!0 (array!7607 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!180356 (= res!85431 (= (arrayCountValidKeys!0 (_keys!5591 (_2!1666 lt!89087)) #b00000000000000000000000000000000 (size!3910 (_keys!5591 (_2!1666 lt!89087)))) (_size!1272 (_2!1666 lt!89087))))))

(declare-fun b!180357 () Bool)

(declare-fun res!85432 () Bool)

(assert (=> b!180357 (=> (not res!85432) (not e!118808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7607 (_ BitVec 32)) Bool)

(assert (=> b!180357 (= res!85432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5591 (_2!1666 lt!89087)) (mask!8697 (_2!1666 lt!89087))))))

(declare-fun b!180358 () Bool)

(declare-datatypes ((List!2265 0))(
  ( (Nil!2262) (Cons!2261 (h!2886 (_ BitVec 64)) (t!7105 List!2265)) )
))
(declare-fun arrayNoDuplicates!0 (array!7607 (_ BitVec 32) List!2265) Bool)

(assert (=> b!180358 (= e!118808 (arrayNoDuplicates!0 (_keys!5591 (_2!1666 lt!89087)) #b00000000000000000000000000000000 Nil!2262))))

(assert (= (and d!54285 res!85430) b!180356))

(assert (= (and b!180356 res!85431) b!180357))

(assert (= (and b!180357 res!85432) b!180358))

(declare-fun m!208521 () Bool)

(assert (=> d!54285 m!208521))

(declare-fun m!208523 () Bool)

(assert (=> b!180356 m!208523))

(declare-fun m!208525 () Bool)

(assert (=> b!180357 m!208525))

(declare-fun m!208527 () Bool)

(assert (=> b!180358 m!208527))

(assert (=> b!180280 d!54285))

(declare-fun b!180393 () Bool)

(declare-fun lt!89178 () SeekEntryResult!585)

(declare-fun e!118826 () Bool)

(assert (=> b!180393 (= e!118826 (= (select (arr!3602 (_keys!5591 thiss!1248)) (index!4510 lt!89178)) key!828))))

(declare-fun b!180395 () Bool)

(declare-fun res!85454 () Bool)

(declare-fun e!118828 () Bool)

(assert (=> b!180395 (=> (not res!85454) (not e!118828))))

(declare-fun call!18223 () Bool)

(assert (=> b!180395 (= res!85454 call!18223)))

(declare-fun e!118832 () Bool)

(assert (=> b!180395 (= e!118832 e!118828)))

(declare-fun b!180396 () Bool)

(declare-datatypes ((Unit!5486 0))(
  ( (Unit!5487) )
))
(declare-fun e!118829 () Unit!5486)

(declare-fun Unit!5488 () Unit!5486)

(assert (=> b!180396 (= e!118829 Unit!5488)))

(declare-fun lt!89175 () Unit!5486)

(declare-fun lemmaArrayContainsKeyThenInListMap!51 (array!7607 array!7609 (_ BitVec 32) (_ BitVec 32) V!5281 V!5281 (_ BitVec 64) (_ BitVec 32) Int) Unit!5486)

(assert (=> b!180396 (= lt!89175 (lemmaArrayContainsKeyThenInListMap!51 (_keys!5591 thiss!1248) (_values!3682 thiss!1248) (mask!8697 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) key!828 #b00000000000000000000000000000000 (defaultEntry!3699 thiss!1248)))))

(declare-fun getCurrentListMap!787 (array!7607 array!7609 (_ BitVec 32) (_ BitVec 32) V!5281 V!5281 (_ BitVec 32) Int) ListLongMap!2235)

(assert (=> b!180396 (contains!1221 (getCurrentListMap!787 (_keys!5591 thiss!1248) (_values!3682 thiss!1248) (mask!8697 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3699 thiss!1248)) key!828)))

(declare-fun lt!89196 () Unit!5486)

(assert (=> b!180396 (= lt!89196 lt!89175)))

(assert (=> b!180396 false))

(declare-fun b!180397 () Bool)

(declare-fun res!85459 () Bool)

(declare-fun e!118831 () Bool)

(assert (=> b!180397 (=> (not res!85459) (not e!118831))))

(declare-fun lt!89177 () tuple2!3310)

(assert (=> b!180397 (= res!85459 (valid!1042 (_2!1666 lt!89177)))))

(declare-fun lt!89189 () SeekEntryResult!585)

(declare-fun bm!18217 () Bool)

(declare-fun c!32310 () Bool)

(declare-fun c!32311 () Bool)

(declare-fun call!18220 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!18217 (= call!18220 (inRange!0 (ite c!32311 (index!4510 lt!89178) (ite c!32310 (index!4509 lt!89189) (index!4512 lt!89189))) (mask!8697 thiss!1248)))))

(declare-fun bm!18218 () Bool)

(assert (=> bm!18218 (= call!18223 call!18220)))

(declare-fun b!180398 () Bool)

(declare-fun e!118825 () Bool)

(declare-fun e!118827 () Bool)

(assert (=> b!180398 (= e!118825 e!118827)))

(declare-fun res!85455 () Bool)

(assert (=> b!180398 (= res!85455 call!18223)))

(assert (=> b!180398 (=> (not res!85455) (not e!118827))))

(declare-fun b!180399 () Bool)

(declare-fun c!32313 () Bool)

(assert (=> b!180399 (= c!32313 ((_ is MissingVacant!585) lt!89189))))

(assert (=> b!180399 (= e!118832 e!118825)))

(declare-fun b!180400 () Bool)

(declare-fun res!85458 () Bool)

(assert (=> b!180400 (= res!85458 call!18220)))

(assert (=> b!180400 (=> (not res!85458) (not e!118826))))

(declare-fun b!180401 () Bool)

(declare-fun res!85451 () Bool)

(assert (=> b!180401 (=> (not res!85451) (not e!118831))))

(assert (=> b!180401 (= res!85451 (contains!1221 (map!1928 (_2!1666 lt!89177)) key!828))))

(declare-fun b!180402 () Bool)

(declare-fun res!85457 () Bool)

(assert (=> b!180402 (= res!85457 (= (select (arr!3602 (_keys!5591 thiss!1248)) (index!4512 lt!89189)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180402 (=> (not res!85457) (not e!118827))))

(declare-fun bm!18219 () Bool)

(declare-fun call!18222 () SeekEntryResult!585)

(assert (=> bm!18219 (= call!18222 (seekEntryOrOpen!0 key!828 (_keys!5591 thiss!1248) (mask!8697 thiss!1248)))))

(declare-fun b!180403 () Bool)

(declare-fun res!85452 () Bool)

(assert (=> b!180403 (=> (not res!85452) (not e!118828))))

(assert (=> b!180403 (= res!85452 (= (select (arr!3602 (_keys!5591 thiss!1248)) (index!4509 lt!89189)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180394 () Bool)

(declare-fun e!118830 () Unit!5486)

(declare-fun lt!89197 () Unit!5486)

(assert (=> b!180394 (= e!118830 lt!89197)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!133 (array!7607 array!7609 (_ BitVec 32) (_ BitVec 32) V!5281 V!5281 (_ BitVec 64) Int) Unit!5486)

(assert (=> b!180394 (= lt!89197 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!133 (_keys!5591 thiss!1248) (_values!3682 thiss!1248) (mask!8697 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) key!828 (defaultEntry!3699 thiss!1248)))))

(assert (=> b!180394 (= lt!89189 call!18222)))

(assert (=> b!180394 (= c!32310 ((_ is MissingZero!585) lt!89189))))

(assert (=> b!180394 e!118832))

(declare-fun d!54287 () Bool)

(assert (=> d!54287 e!118831))

(declare-fun res!85453 () Bool)

(assert (=> d!54287 (=> (not res!85453) (not e!118831))))

(assert (=> d!54287 (= res!85453 (_1!1666 lt!89177))))

(assert (=> d!54287 (= lt!89177 (tuple2!3311 true (LongMapFixedSize!2447 (defaultEntry!3699 thiss!1248) (mask!8697 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) (bvadd (_size!1272 thiss!1248) #b00000000000000000000000000000001) (array!7608 (store (arr!3602 (_keys!5591 thiss!1248)) (index!4509 lt!89089) key!828) (size!3910 (_keys!5591 thiss!1248))) (array!7610 (store (arr!3603 (_values!3682 thiss!1248)) (index!4509 lt!89089) (ValueCellFull!1769 v!309)) (size!3911 (_values!3682 thiss!1248))) (_vacant!1272 thiss!1248))))))

(declare-fun lt!89183 () Unit!5486)

(declare-fun lt!89193 () Unit!5486)

(assert (=> d!54287 (= lt!89183 lt!89193)))

(declare-fun lt!89186 () array!7609)

(declare-fun lt!89194 () array!7607)

(assert (=> d!54287 (contains!1221 (getCurrentListMap!787 lt!89194 lt!89186 (mask!8697 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3699 thiss!1248)) (select (store (arr!3602 (_keys!5591 thiss!1248)) (index!4509 lt!89089) key!828) (index!4509 lt!89089)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!142 (array!7607 array!7609 (_ BitVec 32) (_ BitVec 32) V!5281 V!5281 (_ BitVec 32) Int) Unit!5486)

(assert (=> d!54287 (= lt!89193 (lemmaValidKeyInArrayIsInListMap!142 lt!89194 lt!89186 (mask!8697 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) (index!4509 lt!89089) (defaultEntry!3699 thiss!1248)))))

(assert (=> d!54287 (= lt!89186 (array!7610 (store (arr!3603 (_values!3682 thiss!1248)) (index!4509 lt!89089) (ValueCellFull!1769 v!309)) (size!3911 (_values!3682 thiss!1248))))))

(assert (=> d!54287 (= lt!89194 (array!7608 (store (arr!3602 (_keys!5591 thiss!1248)) (index!4509 lt!89089) key!828) (size!3910 (_keys!5591 thiss!1248))))))

(declare-fun lt!89172 () Unit!5486)

(declare-fun lt!89184 () Unit!5486)

(assert (=> d!54287 (= lt!89172 lt!89184)))

(declare-fun lt!89182 () array!7607)

(assert (=> d!54287 (= (arrayCountValidKeys!0 lt!89182 (index!4509 lt!89089) (bvadd (index!4509 lt!89089) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!7607 (_ BitVec 32)) Unit!5486)

(assert (=> d!54287 (= lt!89184 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!89182 (index!4509 lt!89089)))))

(assert (=> d!54287 (= lt!89182 (array!7608 (store (arr!3602 (_keys!5591 thiss!1248)) (index!4509 lt!89089) key!828) (size!3910 (_keys!5591 thiss!1248))))))

(declare-fun lt!89190 () Unit!5486)

(declare-fun lt!89174 () Unit!5486)

(assert (=> d!54287 (= lt!89190 lt!89174)))

(declare-fun lt!89179 () array!7607)

(declare-fun arrayContainsKey!0 (array!7607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> d!54287 (arrayContainsKey!0 lt!89179 key!828 #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7607 (_ BitVec 64) (_ BitVec 32)) Unit!5486)

(assert (=> d!54287 (= lt!89174 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!89179 key!828 (index!4509 lt!89089)))))

(assert (=> d!54287 (= lt!89179 (array!7608 (store (arr!3602 (_keys!5591 thiss!1248)) (index!4509 lt!89089) key!828) (size!3910 (_keys!5591 thiss!1248))))))

(declare-fun lt!89181 () Unit!5486)

(declare-fun lt!89171 () Unit!5486)

(assert (=> d!54287 (= lt!89181 lt!89171)))

(assert (=> d!54287 (= (+!268 (getCurrentListMap!787 (_keys!5591 thiss!1248) (_values!3682 thiss!1248) (mask!8697 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3699 thiss!1248)) (tuple2!3309 key!828 v!309)) (getCurrentListMap!787 (array!7608 (store (arr!3602 (_keys!5591 thiss!1248)) (index!4509 lt!89089) key!828) (size!3910 (_keys!5591 thiss!1248))) (array!7610 (store (arr!3603 (_values!3682 thiss!1248)) (index!4509 lt!89089) (ValueCellFull!1769 v!309)) (size!3911 (_values!3682 thiss!1248))) (mask!8697 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3699 thiss!1248)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!51 (array!7607 array!7609 (_ BitVec 32) (_ BitVec 32) V!5281 V!5281 (_ BitVec 32) (_ BitVec 64) V!5281 Int) Unit!5486)

(assert (=> d!54287 (= lt!89171 (lemmaAddValidKeyToArrayThenAddPairToListMap!51 (_keys!5591 thiss!1248) (_values!3682 thiss!1248) (mask!8697 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) (index!4509 lt!89089) key!828 v!309 (defaultEntry!3699 thiss!1248)))))

(declare-fun lt!89170 () Unit!5486)

(declare-fun lt!89192 () Unit!5486)

(assert (=> d!54287 (= lt!89170 lt!89192)))

(assert (=> d!54287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!7608 (store (arr!3602 (_keys!5591 thiss!1248)) (index!4509 lt!89089) key!828) (size!3910 (_keys!5591 thiss!1248))) (mask!8697 thiss!1248))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!7607 (_ BitVec 32) (_ BitVec 32)) Unit!5486)

(assert (=> d!54287 (= lt!89192 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!828 (_keys!5591 thiss!1248) (index!4509 lt!89089) (mask!8697 thiss!1248)))))

(declare-fun lt!89187 () Unit!5486)

(declare-fun lt!89168 () Unit!5486)

(assert (=> d!54287 (= lt!89187 lt!89168)))

(assert (=> d!54287 (= (arrayCountValidKeys!0 (array!7608 (store (arr!3602 (_keys!5591 thiss!1248)) (index!4509 lt!89089) key!828) (size!3910 (_keys!5591 thiss!1248))) #b00000000000000000000000000000000 (size!3910 (_keys!5591 thiss!1248))) (bvadd (arrayCountValidKeys!0 (_keys!5591 thiss!1248) #b00000000000000000000000000000000 (size!3910 (_keys!5591 thiss!1248))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!7607 (_ BitVec 32) (_ BitVec 64)) Unit!5486)

(assert (=> d!54287 (= lt!89168 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!5591 thiss!1248) (index!4509 lt!89089) key!828))))

(declare-fun lt!89180 () Unit!5486)

(declare-fun lt!89173 () Unit!5486)

(assert (=> d!54287 (= lt!89180 lt!89173)))

(declare-fun lt!89195 () (_ BitVec 32))

(declare-fun lt!89169 () List!2265)

(assert (=> d!54287 (arrayNoDuplicates!0 (array!7608 (store (arr!3602 (_keys!5591 thiss!1248)) (index!4509 lt!89089) key!828) (size!3910 (_keys!5591 thiss!1248))) lt!89195 lt!89169)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!7607 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!2265) Unit!5486)

(assert (=> d!54287 (= lt!89173 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!5591 thiss!1248) key!828 (index!4509 lt!89089) lt!89195 lt!89169))))

(assert (=> d!54287 (= lt!89169 Nil!2262)))

(assert (=> d!54287 (= lt!89195 #b00000000000000000000000000000000)))

(declare-fun lt!89191 () Unit!5486)

(assert (=> d!54287 (= lt!89191 e!118829)))

(declare-fun c!32312 () Bool)

(assert (=> d!54287 (= c!32312 (arrayContainsKey!0 (_keys!5591 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun lt!89176 () Unit!5486)

(assert (=> d!54287 (= lt!89176 e!118830)))

(assert (=> d!54287 (= c!32311 (contains!1221 (getCurrentListMap!787 (_keys!5591 thiss!1248) (_values!3682 thiss!1248) (mask!8697 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3699 thiss!1248)) key!828))))

(assert (=> d!54287 (valid!1042 thiss!1248)))

(assert (=> d!54287 (= (updateHelperNewKey!93 thiss!1248 key!828 v!309 (index!4509 lt!89089)) lt!89177)))

(declare-fun bm!18220 () Bool)

(declare-fun call!18221 () Bool)

(assert (=> bm!18220 (= call!18221 (arrayContainsKey!0 (_keys!5591 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!180404 () Bool)

(declare-fun Unit!5489 () Unit!5486)

(assert (=> b!180404 (= e!118829 Unit!5489)))

(declare-fun b!180405 () Bool)

(assert (=> b!180405 (= e!118828 (not call!18221))))

(declare-fun b!180406 () Bool)

(assert (=> b!180406 (= e!118827 (not call!18221))))

(declare-fun b!180407 () Bool)

(assert (=> b!180407 (= e!118825 ((_ is Undefined!585) lt!89189))))

(declare-fun b!180408 () Bool)

(declare-fun Unit!5490 () Unit!5486)

(assert (=> b!180408 (= e!118830 Unit!5490)))

(declare-fun lt!89185 () Unit!5486)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!144 (array!7607 array!7609 (_ BitVec 32) (_ BitVec 32) V!5281 V!5281 (_ BitVec 64) Int) Unit!5486)

(assert (=> b!180408 (= lt!89185 (lemmaInListMapThenSeekEntryOrOpenFindsIt!144 (_keys!5591 thiss!1248) (_values!3682 thiss!1248) (mask!8697 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) key!828 (defaultEntry!3699 thiss!1248)))))

(assert (=> b!180408 (= lt!89178 call!18222)))

(declare-fun res!85456 () Bool)

(assert (=> b!180408 (= res!85456 ((_ is Found!585) lt!89178))))

(assert (=> b!180408 (=> (not res!85456) (not e!118826))))

(assert (=> b!180408 e!118826))

(declare-fun lt!89188 () Unit!5486)

(assert (=> b!180408 (= lt!89188 lt!89185)))

(assert (=> b!180408 false))

(declare-fun b!180409 () Bool)

(assert (=> b!180409 (= e!118831 (= (map!1928 (_2!1666 lt!89177)) (+!268 (map!1928 thiss!1248) (tuple2!3309 key!828 v!309))))))

(assert (= (and d!54287 c!32311) b!180408))

(assert (= (and d!54287 (not c!32311)) b!180394))

(assert (= (and b!180408 res!85456) b!180400))

(assert (= (and b!180400 res!85458) b!180393))

(assert (= (and b!180394 c!32310) b!180395))

(assert (= (and b!180394 (not c!32310)) b!180399))

(assert (= (and b!180395 res!85454) b!180403))

(assert (= (and b!180403 res!85452) b!180405))

(assert (= (and b!180399 c!32313) b!180398))

(assert (= (and b!180399 (not c!32313)) b!180407))

(assert (= (and b!180398 res!85455) b!180402))

(assert (= (and b!180402 res!85457) b!180406))

(assert (= (or b!180395 b!180398) bm!18218))

(assert (= (or b!180405 b!180406) bm!18220))

(assert (= (or b!180400 bm!18218) bm!18217))

(assert (= (or b!180408 b!180394) bm!18219))

(assert (= (and d!54287 c!32312) b!180396))

(assert (= (and d!54287 (not c!32312)) b!180404))

(assert (= (and d!54287 res!85453) b!180397))

(assert (= (and b!180397 res!85459) b!180401))

(assert (= (and b!180401 res!85451) b!180409))

(declare-fun m!208529 () Bool)

(assert (=> bm!18220 m!208529))

(declare-fun m!208531 () Bool)

(assert (=> b!180393 m!208531))

(declare-fun m!208533 () Bool)

(assert (=> bm!18217 m!208533))

(declare-fun m!208535 () Bool)

(assert (=> b!180394 m!208535))

(declare-fun m!208537 () Bool)

(assert (=> b!180397 m!208537))

(declare-fun m!208539 () Bool)

(assert (=> b!180396 m!208539))

(declare-fun m!208541 () Bool)

(assert (=> b!180396 m!208541))

(assert (=> b!180396 m!208541))

(declare-fun m!208543 () Bool)

(assert (=> b!180396 m!208543))

(declare-fun m!208545 () Bool)

(assert (=> b!180402 m!208545))

(declare-fun m!208547 () Bool)

(assert (=> b!180401 m!208547))

(assert (=> b!180401 m!208547))

(declare-fun m!208549 () Bool)

(assert (=> b!180401 m!208549))

(assert (=> bm!18219 m!208475))

(declare-fun m!208551 () Bool)

(assert (=> b!180408 m!208551))

(declare-fun m!208553 () Bool)

(assert (=> b!180403 m!208553))

(assert (=> d!54287 m!208465))

(declare-fun m!208555 () Bool)

(assert (=> d!54287 m!208555))

(declare-fun m!208557 () Bool)

(assert (=> d!54287 m!208557))

(assert (=> d!54287 m!208529))

(declare-fun m!208559 () Bool)

(assert (=> d!54287 m!208559))

(declare-fun m!208561 () Bool)

(assert (=> d!54287 m!208561))

(declare-fun m!208563 () Bool)

(assert (=> d!54287 m!208563))

(declare-fun m!208565 () Bool)

(assert (=> d!54287 m!208565))

(declare-fun m!208567 () Bool)

(assert (=> d!54287 m!208567))

(declare-fun m!208569 () Bool)

(assert (=> d!54287 m!208569))

(declare-fun m!208571 () Bool)

(assert (=> d!54287 m!208571))

(declare-fun m!208573 () Bool)

(assert (=> d!54287 m!208573))

(declare-fun m!208575 () Bool)

(assert (=> d!54287 m!208575))

(declare-fun m!208577 () Bool)

(assert (=> d!54287 m!208577))

(assert (=> d!54287 m!208563))

(declare-fun m!208579 () Bool)

(assert (=> d!54287 m!208579))

(declare-fun m!208581 () Bool)

(assert (=> d!54287 m!208581))

(assert (=> d!54287 m!208541))

(declare-fun m!208583 () Bool)

(assert (=> d!54287 m!208583))

(assert (=> d!54287 m!208541))

(declare-fun m!208585 () Bool)

(assert (=> d!54287 m!208585))

(declare-fun m!208587 () Bool)

(assert (=> d!54287 m!208587))

(declare-fun m!208589 () Bool)

(assert (=> d!54287 m!208589))

(assert (=> d!54287 m!208577))

(declare-fun m!208591 () Bool)

(assert (=> d!54287 m!208591))

(declare-fun m!208593 () Bool)

(assert (=> d!54287 m!208593))

(assert (=> d!54287 m!208541))

(assert (=> d!54287 m!208543))

(assert (=> b!180409 m!208547))

(assert (=> b!180409 m!208463))

(assert (=> b!180409 m!208463))

(declare-fun m!208595 () Bool)

(assert (=> b!180409 m!208595))

(assert (=> b!180280 d!54287))

(declare-fun d!54289 () Bool)

(assert (=> d!54289 (= (map!1928 thiss!1248) (getCurrentListMap!787 (_keys!5591 thiss!1248) (_values!3682 thiss!1248) (mask!8697 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3699 thiss!1248)))))

(declare-fun bs!7391 () Bool)

(assert (= bs!7391 d!54289))

(assert (=> bs!7391 m!208541))

(assert (=> bm!18196 d!54289))

(declare-fun d!54291 () Bool)

(assert (=> d!54291 (= (array_inv!2323 (_keys!5591 thiss!1248)) (bvsge (size!3910 (_keys!5591 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180277 d!54291))

(declare-fun d!54293 () Bool)

(assert (=> d!54293 (= (array_inv!2324 (_values!3682 thiss!1248)) (bvsge (size!3911 (_values!3682 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180277 d!54293))

(declare-fun d!54295 () Bool)

(declare-fun e!118835 () Bool)

(assert (=> d!54295 e!118835))

(declare-fun res!85465 () Bool)

(assert (=> d!54295 (=> (not res!85465) (not e!118835))))

(declare-fun lt!89207 () ListLongMap!2235)

(assert (=> d!54295 (= res!85465 (contains!1221 lt!89207 (_1!1665 (tuple2!3309 key!828 v!309))))))

(declare-fun lt!89208 () List!2262)

(assert (=> d!54295 (= lt!89207 (ListLongMap!2236 lt!89208))))

(declare-fun lt!89206 () Unit!5486)

(declare-fun lt!89209 () Unit!5486)

(assert (=> d!54295 (= lt!89206 lt!89209)))

(declare-datatypes ((Option!212 0))(
  ( (Some!211 (v!4053 V!5281)) (None!210) )
))
(declare-fun getValueByKey!206 (List!2262 (_ BitVec 64)) Option!212)

(assert (=> d!54295 (= (getValueByKey!206 lt!89208 (_1!1665 (tuple2!3309 key!828 v!309))) (Some!211 (_2!1665 (tuple2!3309 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!109 (List!2262 (_ BitVec 64) V!5281) Unit!5486)

(assert (=> d!54295 (= lt!89209 (lemmaContainsTupThenGetReturnValue!109 lt!89208 (_1!1665 (tuple2!3309 key!828 v!309)) (_2!1665 (tuple2!3309 key!828 v!309))))))

(declare-fun insertStrictlySorted!112 (List!2262 (_ BitVec 64) V!5281) List!2262)

(assert (=> d!54295 (= lt!89208 (insertStrictlySorted!112 (toList!1133 call!18199) (_1!1665 (tuple2!3309 key!828 v!309)) (_2!1665 (tuple2!3309 key!828 v!309))))))

(assert (=> d!54295 (= (+!268 call!18199 (tuple2!3309 key!828 v!309)) lt!89207)))

(declare-fun b!180414 () Bool)

(declare-fun res!85464 () Bool)

(assert (=> b!180414 (=> (not res!85464) (not e!118835))))

(assert (=> b!180414 (= res!85464 (= (getValueByKey!206 (toList!1133 lt!89207) (_1!1665 (tuple2!3309 key!828 v!309))) (Some!211 (_2!1665 (tuple2!3309 key!828 v!309)))))))

(declare-fun b!180415 () Bool)

(declare-fun contains!1223 (List!2262 tuple2!3308) Bool)

(assert (=> b!180415 (= e!118835 (contains!1223 (toList!1133 lt!89207) (tuple2!3309 key!828 v!309)))))

(assert (= (and d!54295 res!85465) b!180414))

(assert (= (and b!180414 res!85464) b!180415))

(declare-fun m!208597 () Bool)

(assert (=> d!54295 m!208597))

(declare-fun m!208599 () Bool)

(assert (=> d!54295 m!208599))

(declare-fun m!208601 () Bool)

(assert (=> d!54295 m!208601))

(declare-fun m!208603 () Bool)

(assert (=> d!54295 m!208603))

(declare-fun m!208605 () Bool)

(assert (=> b!180414 m!208605))

(declare-fun m!208607 () Bool)

(assert (=> b!180415 m!208607))

(assert (=> b!180279 d!54295))

(declare-fun d!54297 () Bool)

(declare-fun lt!89217 () SeekEntryResult!585)

(assert (=> d!54297 (and (or ((_ is Undefined!585) lt!89217) (not ((_ is Found!585) lt!89217)) (and (bvsge (index!4510 lt!89217) #b00000000000000000000000000000000) (bvslt (index!4510 lt!89217) (size!3910 (_keys!5591 thiss!1248))))) (or ((_ is Undefined!585) lt!89217) ((_ is Found!585) lt!89217) (not ((_ is MissingZero!585) lt!89217)) (and (bvsge (index!4509 lt!89217) #b00000000000000000000000000000000) (bvslt (index!4509 lt!89217) (size!3910 (_keys!5591 thiss!1248))))) (or ((_ is Undefined!585) lt!89217) ((_ is Found!585) lt!89217) ((_ is MissingZero!585) lt!89217) (not ((_ is MissingVacant!585) lt!89217)) (and (bvsge (index!4512 lt!89217) #b00000000000000000000000000000000) (bvslt (index!4512 lt!89217) (size!3910 (_keys!5591 thiss!1248))))) (or ((_ is Undefined!585) lt!89217) (ite ((_ is Found!585) lt!89217) (= (select (arr!3602 (_keys!5591 thiss!1248)) (index!4510 lt!89217)) key!828) (ite ((_ is MissingZero!585) lt!89217) (= (select (arr!3602 (_keys!5591 thiss!1248)) (index!4509 lt!89217)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!585) lt!89217) (= (select (arr!3602 (_keys!5591 thiss!1248)) (index!4512 lt!89217)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!118842 () SeekEntryResult!585)

(assert (=> d!54297 (= lt!89217 e!118842)))

(declare-fun c!32321 () Bool)

(declare-fun lt!89216 () SeekEntryResult!585)

(assert (=> d!54297 (= c!32321 (and ((_ is Intermediate!585) lt!89216) (undefined!1397 lt!89216)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7607 (_ BitVec 32)) SeekEntryResult!585)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54297 (= lt!89216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8697 thiss!1248)) key!828 (_keys!5591 thiss!1248) (mask!8697 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!54297 (validMask!0 (mask!8697 thiss!1248))))

(assert (=> d!54297 (= (seekEntryOrOpen!0 key!828 (_keys!5591 thiss!1248) (mask!8697 thiss!1248)) lt!89217)))

(declare-fun b!180428 () Bool)

(declare-fun e!118843 () SeekEntryResult!585)

(assert (=> b!180428 (= e!118843 (Found!585 (index!4511 lt!89216)))))

(declare-fun b!180429 () Bool)

(assert (=> b!180429 (= e!118842 Undefined!585)))

(declare-fun b!180430 () Bool)

(assert (=> b!180430 (= e!118842 e!118843)))

(declare-fun lt!89218 () (_ BitVec 64))

(assert (=> b!180430 (= lt!89218 (select (arr!3602 (_keys!5591 thiss!1248)) (index!4511 lt!89216)))))

(declare-fun c!32322 () Bool)

(assert (=> b!180430 (= c!32322 (= lt!89218 key!828))))

(declare-fun b!180431 () Bool)

(declare-fun c!32320 () Bool)

(assert (=> b!180431 (= c!32320 (= lt!89218 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118844 () SeekEntryResult!585)

(assert (=> b!180431 (= e!118843 e!118844)))

(declare-fun b!180432 () Bool)

(assert (=> b!180432 (= e!118844 (MissingZero!585 (index!4511 lt!89216)))))

(declare-fun b!180433 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7607 (_ BitVec 32)) SeekEntryResult!585)

(assert (=> b!180433 (= e!118844 (seekKeyOrZeroReturnVacant!0 (x!19697 lt!89216) (index!4511 lt!89216) (index!4511 lt!89216) key!828 (_keys!5591 thiss!1248) (mask!8697 thiss!1248)))))

(assert (= (and d!54297 c!32321) b!180429))

(assert (= (and d!54297 (not c!32321)) b!180430))

(assert (= (and b!180430 c!32322) b!180428))

(assert (= (and b!180430 (not c!32322)) b!180431))

(assert (= (and b!180431 c!32320) b!180432))

(assert (= (and b!180431 (not c!32320)) b!180433))

(declare-fun m!208609 () Bool)

(assert (=> d!54297 m!208609))

(declare-fun m!208611 () Bool)

(assert (=> d!54297 m!208611))

(declare-fun m!208613 () Bool)

(assert (=> d!54297 m!208613))

(declare-fun m!208615 () Bool)

(assert (=> d!54297 m!208615))

(declare-fun m!208617 () Bool)

(assert (=> d!54297 m!208617))

(declare-fun m!208619 () Bool)

(assert (=> d!54297 m!208619))

(assert (=> d!54297 m!208613))

(declare-fun m!208621 () Bool)

(assert (=> b!180430 m!208621))

(declare-fun m!208623 () Bool)

(assert (=> b!180433 m!208623))

(assert (=> b!180274 d!54297))

(declare-fun d!54299 () Bool)

(declare-fun e!118849 () Bool)

(assert (=> d!54299 e!118849))

(declare-fun res!85468 () Bool)

(assert (=> d!54299 (=> res!85468 e!118849)))

(declare-fun lt!89229 () Bool)

(assert (=> d!54299 (= res!85468 (not lt!89229))))

(declare-fun lt!89227 () Bool)

(assert (=> d!54299 (= lt!89229 lt!89227)))

(declare-fun lt!89228 () Unit!5486)

(declare-fun e!118850 () Unit!5486)

(assert (=> d!54299 (= lt!89228 e!118850)))

(declare-fun c!32325 () Bool)

(assert (=> d!54299 (= c!32325 lt!89227)))

(declare-fun containsKey!209 (List!2262 (_ BitVec 64)) Bool)

(assert (=> d!54299 (= lt!89227 (containsKey!209 (toList!1133 lt!89088) key!828))))

(assert (=> d!54299 (= (contains!1221 lt!89088 key!828) lt!89229)))

(declare-fun b!180440 () Bool)

(declare-fun lt!89230 () Unit!5486)

(assert (=> b!180440 (= e!118850 lt!89230)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!157 (List!2262 (_ BitVec 64)) Unit!5486)

(assert (=> b!180440 (= lt!89230 (lemmaContainsKeyImpliesGetValueByKeyDefined!157 (toList!1133 lt!89088) key!828))))

(declare-fun isDefined!158 (Option!212) Bool)

(assert (=> b!180440 (isDefined!158 (getValueByKey!206 (toList!1133 lt!89088) key!828))))

(declare-fun b!180441 () Bool)

(declare-fun Unit!5491 () Unit!5486)

(assert (=> b!180441 (= e!118850 Unit!5491)))

(declare-fun b!180442 () Bool)

(assert (=> b!180442 (= e!118849 (isDefined!158 (getValueByKey!206 (toList!1133 lt!89088) key!828)))))

(assert (= (and d!54299 c!32325) b!180440))

(assert (= (and d!54299 (not c!32325)) b!180441))

(assert (= (and d!54299 (not res!85468)) b!180442))

(declare-fun m!208625 () Bool)

(assert (=> d!54299 m!208625))

(declare-fun m!208627 () Bool)

(assert (=> b!180440 m!208627))

(declare-fun m!208629 () Bool)

(assert (=> b!180440 m!208629))

(assert (=> b!180440 m!208629))

(declare-fun m!208631 () Bool)

(assert (=> b!180440 m!208631))

(assert (=> b!180442 m!208629))

(assert (=> b!180442 m!208629))

(assert (=> b!180442 m!208631))

(assert (=> b!180282 d!54299))

(declare-fun d!54301 () Bool)

(assert (=> d!54301 (= (map!1928 (_2!1666 lt!89087)) (getCurrentListMap!787 (_keys!5591 (_2!1666 lt!89087)) (_values!3682 (_2!1666 lt!89087)) (mask!8697 (_2!1666 lt!89087)) (extraKeys!3436 (_2!1666 lt!89087)) (zeroValue!3540 (_2!1666 lt!89087)) (minValue!3540 (_2!1666 lt!89087)) #b00000000000000000000000000000000 (defaultEntry!3699 (_2!1666 lt!89087))))))

(declare-fun bs!7392 () Bool)

(assert (= bs!7392 d!54301))

(declare-fun m!208633 () Bool)

(assert (=> bs!7392 m!208633))

(assert (=> bm!18195 d!54301))

(declare-fun d!54303 () Bool)

(declare-fun res!85469 () Bool)

(declare-fun e!118851 () Bool)

(assert (=> d!54303 (=> (not res!85469) (not e!118851))))

(assert (=> d!54303 (= res!85469 (simpleValid!164 thiss!1248))))

(assert (=> d!54303 (= (valid!1042 thiss!1248) e!118851)))

(declare-fun b!180443 () Bool)

(declare-fun res!85470 () Bool)

(assert (=> b!180443 (=> (not res!85470) (not e!118851))))

(assert (=> b!180443 (= res!85470 (= (arrayCountValidKeys!0 (_keys!5591 thiss!1248) #b00000000000000000000000000000000 (size!3910 (_keys!5591 thiss!1248))) (_size!1272 thiss!1248)))))

(declare-fun b!180444 () Bool)

(declare-fun res!85471 () Bool)

(assert (=> b!180444 (=> (not res!85471) (not e!118851))))

(assert (=> b!180444 (= res!85471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5591 thiss!1248) (mask!8697 thiss!1248)))))

(declare-fun b!180445 () Bool)

(assert (=> b!180445 (= e!118851 (arrayNoDuplicates!0 (_keys!5591 thiss!1248) #b00000000000000000000000000000000 Nil!2262))))

(assert (= (and d!54303 res!85469) b!180443))

(assert (= (and b!180443 res!85470) b!180444))

(assert (= (and b!180444 res!85471) b!180445))

(declare-fun m!208635 () Bool)

(assert (=> d!54303 m!208635))

(assert (=> b!180443 m!208581))

(declare-fun m!208637 () Bool)

(assert (=> b!180444 m!208637))

(declare-fun m!208639 () Bool)

(assert (=> b!180445 m!208639))

(assert (=> start!18102 d!54303))

(declare-fun b!180452 () Bool)

(declare-fun e!118856 () Bool)

(assert (=> b!180452 (= e!118856 tp_is_empty!4225)))

(declare-fun mapIsEmpty!7243 () Bool)

(declare-fun mapRes!7243 () Bool)

(assert (=> mapIsEmpty!7243 mapRes!7243))

(declare-fun b!180453 () Bool)

(declare-fun e!118857 () Bool)

(assert (=> b!180453 (= e!118857 tp_is_empty!4225)))

(declare-fun mapNonEmpty!7243 () Bool)

(declare-fun tp!16108 () Bool)

(assert (=> mapNonEmpty!7243 (= mapRes!7243 (and tp!16108 e!118856))))

(declare-fun mapKey!7243 () (_ BitVec 32))

(declare-fun mapRest!7243 () (Array (_ BitVec 32) ValueCell!1769))

(declare-fun mapValue!7243 () ValueCell!1769)

(assert (=> mapNonEmpty!7243 (= mapRest!7234 (store mapRest!7243 mapKey!7243 mapValue!7243))))

(declare-fun condMapEmpty!7243 () Bool)

(declare-fun mapDefault!7243 () ValueCell!1769)

(assert (=> mapNonEmpty!7234 (= condMapEmpty!7243 (= mapRest!7234 ((as const (Array (_ BitVec 32) ValueCell!1769)) mapDefault!7243)))))

(assert (=> mapNonEmpty!7234 (= tp!16093 (and e!118857 mapRes!7243))))

(assert (= (and mapNonEmpty!7234 condMapEmpty!7243) mapIsEmpty!7243))

(assert (= (and mapNonEmpty!7234 (not condMapEmpty!7243)) mapNonEmpty!7243))

(assert (= (and mapNonEmpty!7243 ((_ is ValueCellFull!1769) mapValue!7243)) b!180452))

(assert (= (and mapNonEmpty!7234 ((_ is ValueCellFull!1769) mapDefault!7243)) b!180453))

(declare-fun m!208641 () Bool)

(assert (=> mapNonEmpty!7243 m!208641))

(check-sat (not b!180414) (not b!180408) (not b!180356) (not b!180444) (not b!180394) (not d!54285) (not b!180433) (not b!180415) (not d!54289) b_and!11001 (not b!180357) (not b_next!4453) (not bm!18220) (not b!180396) (not bm!18217) (not d!54299) (not d!54297) (not b!180409) (not b!180442) (not d!54301) (not d!54295) (not b!180443) (not b!180401) (not d!54303) (not b!180397) tp_is_empty!4225 (not d!54287) (not b!180358) (not b!180440) (not bm!18219) (not b!180445) (not mapNonEmpty!7243))
(check-sat b_and!11001 (not b_next!4453))
