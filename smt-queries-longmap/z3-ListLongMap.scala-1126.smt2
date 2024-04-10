; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23116 () Bool)

(assert start!23116)

(declare-fun b!242379 () Bool)

(declare-fun b_free!6507 () Bool)

(declare-fun b_next!6507 () Bool)

(assert (=> b!242379 (= b_free!6507 (not b_next!6507))))

(declare-fun tp!22735 () Bool)

(declare-fun b_and!13483 () Bool)

(assert (=> b!242379 (= tp!22735 b_and!13483)))

(declare-fun mapIsEmpty!10795 () Bool)

(declare-fun mapRes!10795 () Bool)

(assert (=> mapIsEmpty!10795 mapRes!10795))

(declare-fun bm!22577 () Bool)

(declare-fun call!22581 () Bool)

(declare-datatypes ((V!8139 0))(
  ( (V!8140 (val!3229 Int)) )
))
(declare-datatypes ((ValueCell!2841 0))(
  ( (ValueCellFull!2841 (v!5270 V!8139)) (EmptyCell!2841) )
))
(declare-datatypes ((array!12023 0))(
  ( (array!12024 (arr!5710 (Array (_ BitVec 32) ValueCell!2841)) (size!6052 (_ BitVec 32))) )
))
(declare-datatypes ((array!12025 0))(
  ( (array!12026 (arr!5711 (Array (_ BitVec 32) (_ BitVec 64))) (size!6053 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3582 0))(
  ( (LongMapFixedSize!3583 (defaultEntry!4492 Int) (mask!10573 (_ BitVec 32)) (extraKeys!4229 (_ BitVec 32)) (zeroValue!4333 V!8139) (minValue!4333 V!8139) (_size!1840 (_ BitVec 32)) (_keys!6600 array!12025) (_values!4475 array!12023) (_vacant!1840 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3582)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22577 (= call!22581 (arrayContainsKey!0 (_keys!6600 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242372 () Bool)

(declare-datatypes ((Unit!7473 0))(
  ( (Unit!7474) )
))
(declare-fun e!157313 () Unit!7473)

(declare-fun lt!121751 () Unit!7473)

(assert (=> b!242372 (= e!157313 lt!121751)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!364 (array!12025 array!12023 (_ BitVec 32) (_ BitVec 32) V!8139 V!8139 (_ BitVec 64) Int) Unit!7473)

(assert (=> b!242372 (= lt!121751 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!364 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) key!932 (defaultEntry!4492 thiss!1504)))))

(declare-fun c!40445 () Bool)

(declare-datatypes ((SeekEntryResult!1064 0))(
  ( (MissingZero!1064 (index!6426 (_ BitVec 32))) (Found!1064 (index!6427 (_ BitVec 32))) (Intermediate!1064 (undefined!1876 Bool) (index!6428 (_ BitVec 32)) (x!24270 (_ BitVec 32))) (Undefined!1064) (MissingVacant!1064 (index!6429 (_ BitVec 32))) )
))
(declare-fun lt!121749 () SeekEntryResult!1064)

(get-info :version)

(assert (=> b!242372 (= c!40445 ((_ is MissingZero!1064) lt!121749))))

(declare-fun e!157308 () Bool)

(assert (=> b!242372 e!157308))

(declare-fun b!242373 () Bool)

(declare-fun e!157304 () Bool)

(declare-datatypes ((List!3634 0))(
  ( (Nil!3631) (Cons!3630 (h!4287 (_ BitVec 64)) (t!8635 List!3634)) )
))
(declare-fun contains!1742 (List!3634 (_ BitVec 64)) Bool)

(assert (=> b!242373 (= e!157304 (contains!1742 Nil!3631 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242374 () Bool)

(declare-fun e!157309 () Bool)

(assert (=> b!242374 (= e!157309 (not call!22581))))

(declare-fun b!242376 () Bool)

(declare-fun e!157311 () Unit!7473)

(declare-fun Unit!7475 () Unit!7473)

(assert (=> b!242376 (= e!157311 Unit!7475)))

(declare-fun b!242377 () Bool)

(declare-fun e!157314 () Bool)

(declare-fun e!157305 () Bool)

(assert (=> b!242377 (= e!157314 e!157305)))

(declare-fun res!118759 () Bool)

(assert (=> b!242377 (=> (not res!118759) (not e!157305))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!242377 (= res!118759 (or (= lt!121749 (MissingZero!1064 index!297)) (= lt!121749 (MissingVacant!1064 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12025 (_ BitVec 32)) SeekEntryResult!1064)

(assert (=> b!242377 (= lt!121749 (seekEntryOrOpen!0 key!932 (_keys!6600 thiss!1504) (mask!10573 thiss!1504)))))

(declare-fun b!242378 () Bool)

(declare-fun e!157315 () Bool)

(assert (=> b!242378 (= e!157315 (not call!22581))))

(declare-fun e!157303 () Bool)

(declare-fun tp_is_empty!6369 () Bool)

(declare-fun e!157307 () Bool)

(declare-fun array_inv!3777 (array!12025) Bool)

(declare-fun array_inv!3778 (array!12023) Bool)

(assert (=> b!242379 (= e!157303 (and tp!22735 tp_is_empty!6369 (array_inv!3777 (_keys!6600 thiss!1504)) (array_inv!3778 (_values!4475 thiss!1504)) e!157307))))

(declare-fun bm!22578 () Bool)

(declare-fun call!22580 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22578 (= call!22580 (inRange!0 (ite c!40445 (index!6426 lt!121749) (index!6429 lt!121749)) (mask!10573 thiss!1504)))))

(declare-fun b!242380 () Bool)

(declare-fun res!118758 () Bool)

(declare-fun e!157306 () Bool)

(assert (=> b!242380 (=> (not res!118758) (not e!157306))))

(declare-fun noDuplicate!89 (List!3634) Bool)

(assert (=> b!242380 (= res!118758 (noDuplicate!89 Nil!3631))))

(declare-fun b!242381 () Bool)

(declare-fun e!157312 () Bool)

(assert (=> b!242381 (= e!157307 (and e!157312 mapRes!10795))))

(declare-fun condMapEmpty!10795 () Bool)

(declare-fun mapDefault!10795 () ValueCell!2841)

(assert (=> b!242381 (= condMapEmpty!10795 (= (arr!5710 (_values!4475 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2841)) mapDefault!10795)))))

(declare-fun b!242382 () Bool)

(declare-fun res!118761 () Bool)

(assert (=> b!242382 (= res!118761 (= (select (arr!5711 (_keys!6600 thiss!1504)) (index!6429 lt!121749)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242382 (=> (not res!118761) (not e!157309))))

(declare-fun b!242383 () Bool)

(declare-fun e!157316 () Bool)

(assert (=> b!242383 (= e!157316 ((_ is Undefined!1064) lt!121749))))

(declare-fun b!242384 () Bool)

(declare-fun Unit!7476 () Unit!7473)

(assert (=> b!242384 (= e!157313 Unit!7476)))

(declare-fun lt!121752 () Unit!7473)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!355 (array!12025 array!12023 (_ BitVec 32) (_ BitVec 32) V!8139 V!8139 (_ BitVec 64) Int) Unit!7473)

(assert (=> b!242384 (= lt!121752 (lemmaInListMapThenSeekEntryOrOpenFindsIt!355 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) key!932 (defaultEntry!4492 thiss!1504)))))

(assert (=> b!242384 false))

(declare-fun b!242375 () Bool)

(declare-fun e!157317 () Bool)

(assert (=> b!242375 (= e!157305 e!157317)))

(declare-fun res!118762 () Bool)

(assert (=> b!242375 (=> (not res!118762) (not e!157317))))

(assert (=> b!242375 (= res!118762 (inRange!0 index!297 (mask!10573 thiss!1504)))))

(declare-fun lt!121754 () Unit!7473)

(assert (=> b!242375 (= lt!121754 e!157313)))

(declare-fun c!40444 () Bool)

(declare-datatypes ((tuple2!4758 0))(
  ( (tuple2!4759 (_1!2390 (_ BitVec 64)) (_2!2390 V!8139)) )
))
(declare-datatypes ((List!3635 0))(
  ( (Nil!3632) (Cons!3631 (h!4288 tuple2!4758) (t!8636 List!3635)) )
))
(declare-datatypes ((ListLongMap!3671 0))(
  ( (ListLongMap!3672 (toList!1851 List!3635)) )
))
(declare-fun contains!1743 (ListLongMap!3671 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1379 (array!12025 array!12023 (_ BitVec 32) (_ BitVec 32) V!8139 V!8139 (_ BitVec 32) Int) ListLongMap!3671)

(assert (=> b!242375 (= c!40444 (contains!1743 (getCurrentListMap!1379 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504)) key!932))))

(declare-fun res!118766 () Bool)

(assert (=> start!23116 (=> (not res!118766) (not e!157314))))

(declare-fun valid!1405 (LongMapFixedSize!3582) Bool)

(assert (=> start!23116 (= res!118766 (valid!1405 thiss!1504))))

(assert (=> start!23116 e!157314))

(assert (=> start!23116 e!157303))

(assert (=> start!23116 true))

(declare-fun b!242385 () Bool)

(declare-fun res!118767 () Bool)

(assert (=> b!242385 (=> (not res!118767) (not e!157314))))

(assert (=> b!242385 (= res!118767 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!242386 () Bool)

(assert (=> b!242386 (= e!157317 e!157306)))

(declare-fun res!118763 () Bool)

(assert (=> b!242386 (=> (not res!118763) (not e!157306))))

(assert (=> b!242386 (= res!118763 (and (bvslt (size!6053 (_keys!6600 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6053 (_keys!6600 thiss!1504)))))))

(declare-fun lt!121753 () Unit!7473)

(assert (=> b!242386 (= lt!121753 e!157311)))

(declare-fun c!40446 () Bool)

(assert (=> b!242386 (= c!40446 (arrayContainsKey!0 (_keys!6600 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242387 () Bool)

(declare-fun res!118764 () Bool)

(assert (=> b!242387 (=> (not res!118764) (not e!157315))))

(assert (=> b!242387 (= res!118764 (= (select (arr!5711 (_keys!6600 thiss!1504)) (index!6426 lt!121749)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242388 () Bool)

(declare-fun res!118757 () Bool)

(assert (=> b!242388 (=> (not res!118757) (not e!157315))))

(assert (=> b!242388 (= res!118757 call!22580)))

(assert (=> b!242388 (= e!157308 e!157315)))

(declare-fun mapNonEmpty!10795 () Bool)

(declare-fun tp!22734 () Bool)

(declare-fun e!157318 () Bool)

(assert (=> mapNonEmpty!10795 (= mapRes!10795 (and tp!22734 e!157318))))

(declare-fun mapValue!10795 () ValueCell!2841)

(declare-fun mapKey!10795 () (_ BitVec 32))

(declare-fun mapRest!10795 () (Array (_ BitVec 32) ValueCell!2841))

(assert (=> mapNonEmpty!10795 (= (arr!5710 (_values!4475 thiss!1504)) (store mapRest!10795 mapKey!10795 mapValue!10795))))

(declare-fun b!242389 () Bool)

(assert (=> b!242389 (= e!157306 e!157304)))

(declare-fun res!118760 () Bool)

(assert (=> b!242389 (=> res!118760 e!157304)))

(assert (=> b!242389 (= res!118760 (contains!1742 Nil!3631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242390 () Bool)

(assert (=> b!242390 (= e!157318 tp_is_empty!6369)))

(declare-fun b!242391 () Bool)

(declare-fun Unit!7477 () Unit!7473)

(assert (=> b!242391 (= e!157311 Unit!7477)))

(declare-fun lt!121750 () Unit!7473)

(declare-fun lemmaArrayContainsKeyThenInListMap!158 (array!12025 array!12023 (_ BitVec 32) (_ BitVec 32) V!8139 V!8139 (_ BitVec 64) (_ BitVec 32) Int) Unit!7473)

(assert (=> b!242391 (= lt!121750 (lemmaArrayContainsKeyThenInListMap!158 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504)))))

(assert (=> b!242391 false))

(declare-fun b!242392 () Bool)

(assert (=> b!242392 (= e!157316 e!157309)))

(declare-fun res!118765 () Bool)

(assert (=> b!242392 (= res!118765 call!22580)))

(assert (=> b!242392 (=> (not res!118765) (not e!157309))))

(declare-fun b!242393 () Bool)

(declare-fun c!40443 () Bool)

(assert (=> b!242393 (= c!40443 ((_ is MissingVacant!1064) lt!121749))))

(assert (=> b!242393 (= e!157308 e!157316)))

(declare-fun b!242394 () Bool)

(assert (=> b!242394 (= e!157312 tp_is_empty!6369)))

(assert (= (and start!23116 res!118766) b!242385))

(assert (= (and b!242385 res!118767) b!242377))

(assert (= (and b!242377 res!118759) b!242375))

(assert (= (and b!242375 c!40444) b!242384))

(assert (= (and b!242375 (not c!40444)) b!242372))

(assert (= (and b!242372 c!40445) b!242388))

(assert (= (and b!242372 (not c!40445)) b!242393))

(assert (= (and b!242388 res!118757) b!242387))

(assert (= (and b!242387 res!118764) b!242378))

(assert (= (and b!242393 c!40443) b!242392))

(assert (= (and b!242393 (not c!40443)) b!242383))

(assert (= (and b!242392 res!118765) b!242382))

(assert (= (and b!242382 res!118761) b!242374))

(assert (= (or b!242388 b!242392) bm!22578))

(assert (= (or b!242378 b!242374) bm!22577))

(assert (= (and b!242375 res!118762) b!242386))

(assert (= (and b!242386 c!40446) b!242391))

(assert (= (and b!242386 (not c!40446)) b!242376))

(assert (= (and b!242386 res!118763) b!242380))

(assert (= (and b!242380 res!118758) b!242389))

(assert (= (and b!242389 (not res!118760)) b!242373))

(assert (= (and b!242381 condMapEmpty!10795) mapIsEmpty!10795))

(assert (= (and b!242381 (not condMapEmpty!10795)) mapNonEmpty!10795))

(assert (= (and mapNonEmpty!10795 ((_ is ValueCellFull!2841) mapValue!10795)) b!242390))

(assert (= (and b!242381 ((_ is ValueCellFull!2841) mapDefault!10795)) b!242394))

(assert (= b!242379 b!242381))

(assert (= start!23116 b!242379))

(declare-fun m!261223 () Bool)

(assert (=> b!242387 m!261223))

(declare-fun m!261225 () Bool)

(assert (=> b!242391 m!261225))

(declare-fun m!261227 () Bool)

(assert (=> b!242379 m!261227))

(declare-fun m!261229 () Bool)

(assert (=> b!242379 m!261229))

(declare-fun m!261231 () Bool)

(assert (=> b!242386 m!261231))

(assert (=> bm!22577 m!261231))

(declare-fun m!261233 () Bool)

(assert (=> start!23116 m!261233))

(declare-fun m!261235 () Bool)

(assert (=> b!242377 m!261235))

(declare-fun m!261237 () Bool)

(assert (=> b!242372 m!261237))

(declare-fun m!261239 () Bool)

(assert (=> b!242382 m!261239))

(declare-fun m!261241 () Bool)

(assert (=> b!242375 m!261241))

(declare-fun m!261243 () Bool)

(assert (=> b!242375 m!261243))

(assert (=> b!242375 m!261243))

(declare-fun m!261245 () Bool)

(assert (=> b!242375 m!261245))

(declare-fun m!261247 () Bool)

(assert (=> mapNonEmpty!10795 m!261247))

(declare-fun m!261249 () Bool)

(assert (=> b!242384 m!261249))

(declare-fun m!261251 () Bool)

(assert (=> b!242373 m!261251))

(declare-fun m!261253 () Bool)

(assert (=> bm!22578 m!261253))

(declare-fun m!261255 () Bool)

(assert (=> b!242380 m!261255))

(declare-fun m!261257 () Bool)

(assert (=> b!242389 m!261257))

(check-sat (not b!242375) (not mapNonEmpty!10795) b_and!13483 tp_is_empty!6369 (not bm!22577) (not bm!22578) (not b_next!6507) (not b!242386) (not b!242389) (not b!242391) (not start!23116) (not b!242380) (not b!242373) (not b!242384) (not b!242377) (not b!242379) (not b!242372))
(check-sat b_and!13483 (not b_next!6507))
(get-model)

(declare-fun d!59967 () Bool)

(assert (=> d!59967 (= (inRange!0 index!297 (mask!10573 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10573 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!242375 d!59967))

(declare-fun d!59969 () Bool)

(declare-fun e!157371 () Bool)

(assert (=> d!59969 e!157371))

(declare-fun res!118803 () Bool)

(assert (=> d!59969 (=> res!118803 e!157371)))

(declare-fun lt!121782 () Bool)

(assert (=> d!59969 (= res!118803 (not lt!121782))))

(declare-fun lt!121781 () Bool)

(assert (=> d!59969 (= lt!121782 lt!121781)))

(declare-fun lt!121783 () Unit!7473)

(declare-fun e!157372 () Unit!7473)

(assert (=> d!59969 (= lt!121783 e!157372)))

(declare-fun c!40461 () Bool)

(assert (=> d!59969 (= c!40461 lt!121781)))

(declare-fun containsKey!274 (List!3635 (_ BitVec 64)) Bool)

(assert (=> d!59969 (= lt!121781 (containsKey!274 (toList!1851 (getCurrentListMap!1379 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504))) key!932))))

(assert (=> d!59969 (= (contains!1743 (getCurrentListMap!1379 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504)) key!932) lt!121782)))

(declare-fun b!242470 () Bool)

(declare-fun lt!121784 () Unit!7473)

(assert (=> b!242470 (= e!157372 lt!121784)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!222 (List!3635 (_ BitVec 64)) Unit!7473)

(assert (=> b!242470 (= lt!121784 (lemmaContainsKeyImpliesGetValueByKeyDefined!222 (toList!1851 (getCurrentListMap!1379 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504))) key!932))))

(declare-datatypes ((Option!288 0))(
  ( (Some!287 (v!5273 V!8139)) (None!286) )
))
(declare-fun isDefined!223 (Option!288) Bool)

(declare-fun getValueByKey!282 (List!3635 (_ BitVec 64)) Option!288)

(assert (=> b!242470 (isDefined!223 (getValueByKey!282 (toList!1851 (getCurrentListMap!1379 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504))) key!932))))

(declare-fun b!242471 () Bool)

(declare-fun Unit!7482 () Unit!7473)

(assert (=> b!242471 (= e!157372 Unit!7482)))

(declare-fun b!242472 () Bool)

(assert (=> b!242472 (= e!157371 (isDefined!223 (getValueByKey!282 (toList!1851 (getCurrentListMap!1379 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504))) key!932)))))

(assert (= (and d!59969 c!40461) b!242470))

(assert (= (and d!59969 (not c!40461)) b!242471))

(assert (= (and d!59969 (not res!118803)) b!242472))

(declare-fun m!261295 () Bool)

(assert (=> d!59969 m!261295))

(declare-fun m!261297 () Bool)

(assert (=> b!242470 m!261297))

(declare-fun m!261299 () Bool)

(assert (=> b!242470 m!261299))

(assert (=> b!242470 m!261299))

(declare-fun m!261301 () Bool)

(assert (=> b!242470 m!261301))

(assert (=> b!242472 m!261299))

(assert (=> b!242472 m!261299))

(assert (=> b!242472 m!261301))

(assert (=> b!242375 d!59969))

(declare-fun bm!22599 () Bool)

(declare-fun call!22608 () Bool)

(declare-fun lt!121837 () ListLongMap!3671)

(assert (=> bm!22599 (= call!22608 (contains!1743 lt!121837 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242515 () Bool)

(declare-fun e!157405 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!242515 (= e!157405 (validKeyInArray!0 (select (arr!5711 (_keys!6600 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!242516 () Bool)

(declare-fun e!157403 () ListLongMap!3671)

(declare-fun e!157411 () ListLongMap!3671)

(assert (=> b!242516 (= e!157403 e!157411)))

(declare-fun c!40476 () Bool)

(assert (=> b!242516 (= c!40476 (and (not (= (bvand (extraKeys!4229 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4229 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!242517 () Bool)

(declare-fun e!157406 () Bool)

(declare-fun e!157409 () Bool)

(assert (=> b!242517 (= e!157406 e!157409)))

(declare-fun c!40475 () Bool)

(assert (=> b!242517 (= c!40475 (not (= (bvand (extraKeys!4229 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22600 () Bool)

(declare-fun call!22605 () ListLongMap!3671)

(declare-fun call!22607 () ListLongMap!3671)

(assert (=> bm!22600 (= call!22605 call!22607)))

(declare-fun b!242518 () Bool)

(declare-fun e!157408 () Bool)

(assert (=> b!242518 (= e!157408 (validKeyInArray!0 (select (arr!5711 (_keys!6600 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22601 () Bool)

(declare-fun call!22602 () ListLongMap!3671)

(declare-fun getCurrentListMapNoExtraKeys!546 (array!12025 array!12023 (_ BitVec 32) (_ BitVec 32) V!8139 V!8139 (_ BitVec 32) Int) ListLongMap!3671)

(assert (=> bm!22601 (= call!22602 (getCurrentListMapNoExtraKeys!546 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504)))))

(declare-fun b!242519 () Bool)

(declare-fun e!157400 () Bool)

(declare-fun e!157410 () Bool)

(assert (=> b!242519 (= e!157400 e!157410)))

(declare-fun res!118826 () Bool)

(assert (=> b!242519 (= res!118826 call!22608)))

(assert (=> b!242519 (=> (not res!118826) (not e!157410))))

(declare-fun c!40474 () Bool)

(declare-fun bm!22602 () Bool)

(declare-fun call!22604 () ListLongMap!3671)

(declare-fun +!651 (ListLongMap!3671 tuple2!4758) ListLongMap!3671)

(assert (=> bm!22602 (= call!22604 (+!651 (ite c!40474 call!22602 (ite c!40476 call!22607 call!22605)) (ite (or c!40474 c!40476) (tuple2!4759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4333 thiss!1504)) (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4333 thiss!1504)))))))

(declare-fun b!242520 () Bool)

(declare-fun e!157407 () Bool)

(declare-fun apply!224 (ListLongMap!3671 (_ BitVec 64)) V!8139)

(assert (=> b!242520 (= e!157407 (= (apply!224 lt!121837 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4333 thiss!1504)))))

(declare-fun b!242521 () Bool)

(assert (=> b!242521 (= e!157403 (+!651 call!22604 (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4333 thiss!1504))))))

(declare-fun b!242522 () Bool)

(declare-fun e!157402 () Bool)

(declare-fun e!157404 () Bool)

(assert (=> b!242522 (= e!157402 e!157404)))

(declare-fun res!118829 () Bool)

(assert (=> b!242522 (=> (not res!118829) (not e!157404))))

(assert (=> b!242522 (= res!118829 (contains!1743 lt!121837 (select (arr!5711 (_keys!6600 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!242522 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6053 (_keys!6600 thiss!1504))))))

(declare-fun b!242523 () Bool)

(declare-fun res!118827 () Bool)

(assert (=> b!242523 (=> (not res!118827) (not e!157406))))

(assert (=> b!242523 (= res!118827 e!157402)))

(declare-fun res!118822 () Bool)

(assert (=> b!242523 (=> res!118822 e!157402)))

(assert (=> b!242523 (= res!118822 (not e!157405))))

(declare-fun res!118824 () Bool)

(assert (=> b!242523 (=> (not res!118824) (not e!157405))))

(assert (=> b!242523 (= res!118824 (bvslt #b00000000000000000000000000000000 (size!6053 (_keys!6600 thiss!1504))))))

(declare-fun b!242524 () Bool)

(declare-fun e!157401 () ListLongMap!3671)

(declare-fun call!22606 () ListLongMap!3671)

(assert (=> b!242524 (= e!157401 call!22606)))

(declare-fun b!242525 () Bool)

(assert (=> b!242525 (= e!157409 e!157407)))

(declare-fun res!118823 () Bool)

(declare-fun call!22603 () Bool)

(assert (=> b!242525 (= res!118823 call!22603)))

(assert (=> b!242525 (=> (not res!118823) (not e!157407))))

(declare-fun b!242526 () Bool)

(assert (=> b!242526 (= e!157410 (= (apply!224 lt!121837 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4333 thiss!1504)))))

(declare-fun b!242527 () Bool)

(declare-fun get!2932 (ValueCell!2841 V!8139) V!8139)

(declare-fun dynLambda!567 (Int (_ BitVec 64)) V!8139)

(assert (=> b!242527 (= e!157404 (= (apply!224 lt!121837 (select (arr!5711 (_keys!6600 thiss!1504)) #b00000000000000000000000000000000)) (get!2932 (select (arr!5710 (_values!4475 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!567 (defaultEntry!4492 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!242527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6052 (_values!4475 thiss!1504))))))

(assert (=> b!242527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6053 (_keys!6600 thiss!1504))))))

(declare-fun bm!22603 () Bool)

(assert (=> bm!22603 (= call!22607 call!22602)))

(declare-fun b!242528 () Bool)

(declare-fun res!118825 () Bool)

(assert (=> b!242528 (=> (not res!118825) (not e!157406))))

(assert (=> b!242528 (= res!118825 e!157400)))

(declare-fun c!40477 () Bool)

(assert (=> b!242528 (= c!40477 (not (= (bvand (extraKeys!4229 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!242529 () Bool)

(declare-fun e!157399 () Unit!7473)

(declare-fun lt!121842 () Unit!7473)

(assert (=> b!242529 (= e!157399 lt!121842)))

(declare-fun lt!121830 () ListLongMap!3671)

(assert (=> b!242529 (= lt!121830 (getCurrentListMapNoExtraKeys!546 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504)))))

(declare-fun lt!121844 () (_ BitVec 64))

(assert (=> b!242529 (= lt!121844 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121848 () (_ BitVec 64))

(assert (=> b!242529 (= lt!121848 (select (arr!5711 (_keys!6600 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121843 () Unit!7473)

(declare-fun addStillContains!200 (ListLongMap!3671 (_ BitVec 64) V!8139 (_ BitVec 64)) Unit!7473)

(assert (=> b!242529 (= lt!121843 (addStillContains!200 lt!121830 lt!121844 (zeroValue!4333 thiss!1504) lt!121848))))

(assert (=> b!242529 (contains!1743 (+!651 lt!121830 (tuple2!4759 lt!121844 (zeroValue!4333 thiss!1504))) lt!121848)))

(declare-fun lt!121840 () Unit!7473)

(assert (=> b!242529 (= lt!121840 lt!121843)))

(declare-fun lt!121834 () ListLongMap!3671)

(assert (=> b!242529 (= lt!121834 (getCurrentListMapNoExtraKeys!546 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504)))))

(declare-fun lt!121835 () (_ BitVec 64))

(assert (=> b!242529 (= lt!121835 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121845 () (_ BitVec 64))

(assert (=> b!242529 (= lt!121845 (select (arr!5711 (_keys!6600 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121833 () Unit!7473)

(declare-fun addApplyDifferent!200 (ListLongMap!3671 (_ BitVec 64) V!8139 (_ BitVec 64)) Unit!7473)

(assert (=> b!242529 (= lt!121833 (addApplyDifferent!200 lt!121834 lt!121835 (minValue!4333 thiss!1504) lt!121845))))

(assert (=> b!242529 (= (apply!224 (+!651 lt!121834 (tuple2!4759 lt!121835 (minValue!4333 thiss!1504))) lt!121845) (apply!224 lt!121834 lt!121845))))

(declare-fun lt!121832 () Unit!7473)

(assert (=> b!242529 (= lt!121832 lt!121833)))

(declare-fun lt!121836 () ListLongMap!3671)

(assert (=> b!242529 (= lt!121836 (getCurrentListMapNoExtraKeys!546 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504)))))

(declare-fun lt!121829 () (_ BitVec 64))

(assert (=> b!242529 (= lt!121829 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121847 () (_ BitVec 64))

(assert (=> b!242529 (= lt!121847 (select (arr!5711 (_keys!6600 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121850 () Unit!7473)

(assert (=> b!242529 (= lt!121850 (addApplyDifferent!200 lt!121836 lt!121829 (zeroValue!4333 thiss!1504) lt!121847))))

(assert (=> b!242529 (= (apply!224 (+!651 lt!121836 (tuple2!4759 lt!121829 (zeroValue!4333 thiss!1504))) lt!121847) (apply!224 lt!121836 lt!121847))))

(declare-fun lt!121841 () Unit!7473)

(assert (=> b!242529 (= lt!121841 lt!121850)))

(declare-fun lt!121838 () ListLongMap!3671)

(assert (=> b!242529 (= lt!121838 (getCurrentListMapNoExtraKeys!546 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504)))))

(declare-fun lt!121849 () (_ BitVec 64))

(assert (=> b!242529 (= lt!121849 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121839 () (_ BitVec 64))

(assert (=> b!242529 (= lt!121839 (select (arr!5711 (_keys!6600 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242529 (= lt!121842 (addApplyDifferent!200 lt!121838 lt!121849 (minValue!4333 thiss!1504) lt!121839))))

(assert (=> b!242529 (= (apply!224 (+!651 lt!121838 (tuple2!4759 lt!121849 (minValue!4333 thiss!1504))) lt!121839) (apply!224 lt!121838 lt!121839))))

(declare-fun b!242530 () Bool)

(assert (=> b!242530 (= e!157411 call!22606)))

(declare-fun bm!22604 () Bool)

(assert (=> bm!22604 (= call!22603 (contains!1743 lt!121837 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242531 () Bool)

(declare-fun c!40478 () Bool)

(assert (=> b!242531 (= c!40478 (and (not (= (bvand (extraKeys!4229 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4229 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!242531 (= e!157411 e!157401)))

(declare-fun d!59971 () Bool)

(assert (=> d!59971 e!157406))

(declare-fun res!118830 () Bool)

(assert (=> d!59971 (=> (not res!118830) (not e!157406))))

(assert (=> d!59971 (= res!118830 (or (bvsge #b00000000000000000000000000000000 (size!6053 (_keys!6600 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6053 (_keys!6600 thiss!1504))))))))

(declare-fun lt!121846 () ListLongMap!3671)

(assert (=> d!59971 (= lt!121837 lt!121846)))

(declare-fun lt!121831 () Unit!7473)

(assert (=> d!59971 (= lt!121831 e!157399)))

(declare-fun c!40479 () Bool)

(assert (=> d!59971 (= c!40479 e!157408)))

(declare-fun res!118828 () Bool)

(assert (=> d!59971 (=> (not res!118828) (not e!157408))))

(assert (=> d!59971 (= res!118828 (bvslt #b00000000000000000000000000000000 (size!6053 (_keys!6600 thiss!1504))))))

(assert (=> d!59971 (= lt!121846 e!157403)))

(assert (=> d!59971 (= c!40474 (and (not (= (bvand (extraKeys!4229 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4229 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59971 (validMask!0 (mask!10573 thiss!1504))))

(assert (=> d!59971 (= (getCurrentListMap!1379 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504)) lt!121837)))

(declare-fun b!242532 () Bool)

(assert (=> b!242532 (= e!157409 (not call!22603))))

(declare-fun b!242533 () Bool)

(assert (=> b!242533 (= e!157401 call!22605)))

(declare-fun bm!22605 () Bool)

(assert (=> bm!22605 (= call!22606 call!22604)))

(declare-fun b!242534 () Bool)

(assert (=> b!242534 (= e!157400 (not call!22608))))

(declare-fun b!242535 () Bool)

(declare-fun Unit!7483 () Unit!7473)

(assert (=> b!242535 (= e!157399 Unit!7483)))

(assert (= (and d!59971 c!40474) b!242521))

(assert (= (and d!59971 (not c!40474)) b!242516))

(assert (= (and b!242516 c!40476) b!242530))

(assert (= (and b!242516 (not c!40476)) b!242531))

(assert (= (and b!242531 c!40478) b!242524))

(assert (= (and b!242531 (not c!40478)) b!242533))

(assert (= (or b!242524 b!242533) bm!22600))

(assert (= (or b!242530 bm!22600) bm!22603))

(assert (= (or b!242530 b!242524) bm!22605))

(assert (= (or b!242521 bm!22603) bm!22601))

(assert (= (or b!242521 bm!22605) bm!22602))

(assert (= (and d!59971 res!118828) b!242518))

(assert (= (and d!59971 c!40479) b!242529))

(assert (= (and d!59971 (not c!40479)) b!242535))

(assert (= (and d!59971 res!118830) b!242523))

(assert (= (and b!242523 res!118824) b!242515))

(assert (= (and b!242523 (not res!118822)) b!242522))

(assert (= (and b!242522 res!118829) b!242527))

(assert (= (and b!242523 res!118827) b!242528))

(assert (= (and b!242528 c!40477) b!242519))

(assert (= (and b!242528 (not c!40477)) b!242534))

(assert (= (and b!242519 res!118826) b!242526))

(assert (= (or b!242519 b!242534) bm!22599))

(assert (= (and b!242528 res!118825) b!242517))

(assert (= (and b!242517 c!40475) b!242525))

(assert (= (and b!242517 (not c!40475)) b!242532))

(assert (= (and b!242525 res!118823) b!242520))

(assert (= (or b!242525 b!242532) bm!22604))

(declare-fun b_lambda!7999 () Bool)

(assert (=> (not b_lambda!7999) (not b!242527)))

(declare-fun t!8639 () Bool)

(declare-fun tb!2961 () Bool)

(assert (=> (and b!242379 (= (defaultEntry!4492 thiss!1504) (defaultEntry!4492 thiss!1504)) t!8639) tb!2961))

(declare-fun result!5205 () Bool)

(assert (=> tb!2961 (= result!5205 tp_is_empty!6369)))

(assert (=> b!242527 t!8639))

(declare-fun b_and!13487 () Bool)

(assert (= b_and!13483 (and (=> t!8639 result!5205) b_and!13487)))

(declare-fun m!261303 () Bool)

(assert (=> b!242527 m!261303))

(declare-fun m!261305 () Bool)

(assert (=> b!242527 m!261305))

(declare-fun m!261307 () Bool)

(assert (=> b!242527 m!261307))

(declare-fun m!261309 () Bool)

(assert (=> b!242527 m!261309))

(assert (=> b!242527 m!261303))

(assert (=> b!242527 m!261307))

(assert (=> b!242527 m!261309))

(declare-fun m!261311 () Bool)

(assert (=> b!242527 m!261311))

(declare-fun m!261313 () Bool)

(assert (=> b!242529 m!261313))

(declare-fun m!261315 () Bool)

(assert (=> b!242529 m!261315))

(declare-fun m!261317 () Bool)

(assert (=> b!242529 m!261317))

(declare-fun m!261319 () Bool)

(assert (=> b!242529 m!261319))

(declare-fun m!261321 () Bool)

(assert (=> b!242529 m!261321))

(declare-fun m!261323 () Bool)

(assert (=> b!242529 m!261323))

(declare-fun m!261325 () Bool)

(assert (=> b!242529 m!261325))

(declare-fun m!261327 () Bool)

(assert (=> b!242529 m!261327))

(declare-fun m!261329 () Bool)

(assert (=> b!242529 m!261329))

(declare-fun m!261331 () Bool)

(assert (=> b!242529 m!261331))

(declare-fun m!261333 () Bool)

(assert (=> b!242529 m!261333))

(declare-fun m!261335 () Bool)

(assert (=> b!242529 m!261335))

(assert (=> b!242529 m!261329))

(assert (=> b!242529 m!261321))

(assert (=> b!242529 m!261313))

(declare-fun m!261337 () Bool)

(assert (=> b!242529 m!261337))

(declare-fun m!261339 () Bool)

(assert (=> b!242529 m!261339))

(assert (=> b!242529 m!261325))

(declare-fun m!261341 () Bool)

(assert (=> b!242529 m!261341))

(declare-fun m!261343 () Bool)

(assert (=> b!242529 m!261343))

(assert (=> b!242529 m!261303))

(declare-fun m!261345 () Bool)

(assert (=> b!242521 m!261345))

(declare-fun m!261347 () Bool)

(assert (=> d!59971 m!261347))

(declare-fun m!261349 () Bool)

(assert (=> bm!22602 m!261349))

(declare-fun m!261351 () Bool)

(assert (=> bm!22604 m!261351))

(declare-fun m!261353 () Bool)

(assert (=> bm!22599 m!261353))

(declare-fun m!261355 () Bool)

(assert (=> b!242526 m!261355))

(assert (=> b!242515 m!261303))

(assert (=> b!242515 m!261303))

(declare-fun m!261357 () Bool)

(assert (=> b!242515 m!261357))

(assert (=> b!242518 m!261303))

(assert (=> b!242518 m!261303))

(assert (=> b!242518 m!261357))

(assert (=> b!242522 m!261303))

(assert (=> b!242522 m!261303))

(declare-fun m!261359 () Bool)

(assert (=> b!242522 m!261359))

(assert (=> bm!22601 m!261333))

(declare-fun m!261361 () Bool)

(assert (=> b!242520 m!261361))

(assert (=> b!242375 d!59971))

(declare-fun d!59973 () Bool)

(declare-fun e!157414 () Bool)

(assert (=> d!59973 e!157414))

(declare-fun res!118836 () Bool)

(assert (=> d!59973 (=> (not res!118836) (not e!157414))))

(declare-fun lt!121855 () SeekEntryResult!1064)

(assert (=> d!59973 (= res!118836 ((_ is Found!1064) lt!121855))))

(assert (=> d!59973 (= lt!121855 (seekEntryOrOpen!0 key!932 (_keys!6600 thiss!1504) (mask!10573 thiss!1504)))))

(declare-fun lt!121856 () Unit!7473)

(declare-fun choose!1128 (array!12025 array!12023 (_ BitVec 32) (_ BitVec 32) V!8139 V!8139 (_ BitVec 64) Int) Unit!7473)

(assert (=> d!59973 (= lt!121856 (choose!1128 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) key!932 (defaultEntry!4492 thiss!1504)))))

(assert (=> d!59973 (validMask!0 (mask!10573 thiss!1504))))

(assert (=> d!59973 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!355 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) key!932 (defaultEntry!4492 thiss!1504)) lt!121856)))

(declare-fun b!242542 () Bool)

(declare-fun res!118835 () Bool)

(assert (=> b!242542 (=> (not res!118835) (not e!157414))))

(assert (=> b!242542 (= res!118835 (inRange!0 (index!6427 lt!121855) (mask!10573 thiss!1504)))))

(declare-fun b!242543 () Bool)

(assert (=> b!242543 (= e!157414 (= (select (arr!5711 (_keys!6600 thiss!1504)) (index!6427 lt!121855)) key!932))))

(assert (=> b!242543 (and (bvsge (index!6427 lt!121855) #b00000000000000000000000000000000) (bvslt (index!6427 lt!121855) (size!6053 (_keys!6600 thiss!1504))))))

(assert (= (and d!59973 res!118836) b!242542))

(assert (= (and b!242542 res!118835) b!242543))

(assert (=> d!59973 m!261235))

(declare-fun m!261363 () Bool)

(assert (=> d!59973 m!261363))

(assert (=> d!59973 m!261347))

(declare-fun m!261365 () Bool)

(assert (=> b!242542 m!261365))

(declare-fun m!261367 () Bool)

(assert (=> b!242543 m!261367))

(assert (=> b!242384 d!59973))

(declare-fun d!59975 () Bool)

(declare-fun res!118843 () Bool)

(declare-fun e!157417 () Bool)

(assert (=> d!59975 (=> (not res!118843) (not e!157417))))

(declare-fun simpleValid!247 (LongMapFixedSize!3582) Bool)

(assert (=> d!59975 (= res!118843 (simpleValid!247 thiss!1504))))

(assert (=> d!59975 (= (valid!1405 thiss!1504) e!157417)))

(declare-fun b!242550 () Bool)

(declare-fun res!118844 () Bool)

(assert (=> b!242550 (=> (not res!118844) (not e!157417))))

(declare-fun arrayCountValidKeys!0 (array!12025 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!242550 (= res!118844 (= (arrayCountValidKeys!0 (_keys!6600 thiss!1504) #b00000000000000000000000000000000 (size!6053 (_keys!6600 thiss!1504))) (_size!1840 thiss!1504)))))

(declare-fun b!242551 () Bool)

(declare-fun res!118845 () Bool)

(assert (=> b!242551 (=> (not res!118845) (not e!157417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12025 (_ BitVec 32)) Bool)

(assert (=> b!242551 (= res!118845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6600 thiss!1504) (mask!10573 thiss!1504)))))

(declare-fun b!242552 () Bool)

(declare-fun arrayNoDuplicates!0 (array!12025 (_ BitVec 32) List!3634) Bool)

(assert (=> b!242552 (= e!157417 (arrayNoDuplicates!0 (_keys!6600 thiss!1504) #b00000000000000000000000000000000 Nil!3631))))

(assert (= (and d!59975 res!118843) b!242550))

(assert (= (and b!242550 res!118844) b!242551))

(assert (= (and b!242551 res!118845) b!242552))

(declare-fun m!261369 () Bool)

(assert (=> d!59975 m!261369))

(declare-fun m!261371 () Bool)

(assert (=> b!242550 m!261371))

(declare-fun m!261373 () Bool)

(assert (=> b!242551 m!261373))

(declare-fun m!261375 () Bool)

(assert (=> b!242552 m!261375))

(assert (=> start!23116 d!59975))

(declare-fun d!59977 () Bool)

(declare-fun lt!121859 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!158 (List!3634) (InoxSet (_ BitVec 64)))

(assert (=> d!59977 (= lt!121859 (select (content!158 Nil!3631) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157422 () Bool)

(assert (=> d!59977 (= lt!121859 e!157422)))

(declare-fun res!118850 () Bool)

(assert (=> d!59977 (=> (not res!118850) (not e!157422))))

(assert (=> d!59977 (= res!118850 ((_ is Cons!3630) Nil!3631))))

(assert (=> d!59977 (= (contains!1742 Nil!3631 #b1000000000000000000000000000000000000000000000000000000000000000) lt!121859)))

(declare-fun b!242557 () Bool)

(declare-fun e!157423 () Bool)

(assert (=> b!242557 (= e!157422 e!157423)))

(declare-fun res!118851 () Bool)

(assert (=> b!242557 (=> res!118851 e!157423)))

(assert (=> b!242557 (= res!118851 (= (h!4287 Nil!3631) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242558 () Bool)

(assert (=> b!242558 (= e!157423 (contains!1742 (t!8635 Nil!3631) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59977 res!118850) b!242557))

(assert (= (and b!242557 (not res!118851)) b!242558))

(declare-fun m!261377 () Bool)

(assert (=> d!59977 m!261377))

(declare-fun m!261379 () Bool)

(assert (=> d!59977 m!261379))

(declare-fun m!261381 () Bool)

(assert (=> b!242558 m!261381))

(assert (=> b!242373 d!59977))

(declare-fun d!59979 () Bool)

(assert (=> d!59979 (contains!1743 (getCurrentListMap!1379 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504)) key!932)))

(declare-fun lt!121862 () Unit!7473)

(declare-fun choose!1129 (array!12025 array!12023 (_ BitVec 32) (_ BitVec 32) V!8139 V!8139 (_ BitVec 64) (_ BitVec 32) Int) Unit!7473)

(assert (=> d!59979 (= lt!121862 (choose!1129 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504)))))

(assert (=> d!59979 (validMask!0 (mask!10573 thiss!1504))))

(assert (=> d!59979 (= (lemmaArrayContainsKeyThenInListMap!158 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4492 thiss!1504)) lt!121862)))

(declare-fun bs!8861 () Bool)

(assert (= bs!8861 d!59979))

(assert (=> bs!8861 m!261243))

(assert (=> bs!8861 m!261243))

(assert (=> bs!8861 m!261245))

(declare-fun m!261383 () Bool)

(assert (=> bs!8861 m!261383))

(assert (=> bs!8861 m!261347))

(assert (=> b!242391 d!59979))

(declare-fun b!242575 () Bool)

(declare-fun e!157433 () Bool)

(declare-fun e!157432 () Bool)

(assert (=> b!242575 (= e!157433 e!157432)))

(declare-fun c!40485 () Bool)

(declare-fun lt!121867 () SeekEntryResult!1064)

(assert (=> b!242575 (= c!40485 ((_ is MissingVacant!1064) lt!121867))))

(declare-fun b!242576 () Bool)

(assert (=> b!242576 (and (bvsge (index!6426 lt!121867) #b00000000000000000000000000000000) (bvslt (index!6426 lt!121867) (size!6053 (_keys!6600 thiss!1504))))))

(declare-fun res!118862 () Bool)

(assert (=> b!242576 (= res!118862 (= (select (arr!5711 (_keys!6600 thiss!1504)) (index!6426 lt!121867)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157435 () Bool)

(assert (=> b!242576 (=> (not res!118862) (not e!157435))))

(declare-fun c!40484 () Bool)

(declare-fun bm!22610 () Bool)

(declare-fun call!22614 () Bool)

(assert (=> bm!22610 (= call!22614 (inRange!0 (ite c!40484 (index!6426 lt!121867) (index!6429 lt!121867)) (mask!10573 thiss!1504)))))

(declare-fun b!242577 () Bool)

(declare-fun call!22613 () Bool)

(assert (=> b!242577 (= e!157435 (not call!22613))))

(declare-fun b!242578 () Bool)

(assert (=> b!242578 (= e!157432 ((_ is Undefined!1064) lt!121867))))

(declare-fun b!242579 () Bool)

(declare-fun res!118863 () Bool)

(declare-fun e!157434 () Bool)

(assert (=> b!242579 (=> (not res!118863) (not e!157434))))

(assert (=> b!242579 (= res!118863 call!22614)))

(assert (=> b!242579 (= e!157432 e!157434)))

(declare-fun b!242580 () Bool)

(assert (=> b!242580 (= e!157433 e!157435)))

(declare-fun res!118861 () Bool)

(assert (=> b!242580 (= res!118861 call!22614)))

(assert (=> b!242580 (=> (not res!118861) (not e!157435))))

(declare-fun d!59981 () Bool)

(assert (=> d!59981 e!157433))

(assert (=> d!59981 (= c!40484 ((_ is MissingZero!1064) lt!121867))))

(assert (=> d!59981 (= lt!121867 (seekEntryOrOpen!0 key!932 (_keys!6600 thiss!1504) (mask!10573 thiss!1504)))))

(declare-fun lt!121868 () Unit!7473)

(declare-fun choose!1130 (array!12025 array!12023 (_ BitVec 32) (_ BitVec 32) V!8139 V!8139 (_ BitVec 64) Int) Unit!7473)

(assert (=> d!59981 (= lt!121868 (choose!1130 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) key!932 (defaultEntry!4492 thiss!1504)))))

(assert (=> d!59981 (validMask!0 (mask!10573 thiss!1504))))

(assert (=> d!59981 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!364 (_keys!6600 thiss!1504) (_values!4475 thiss!1504) (mask!10573 thiss!1504) (extraKeys!4229 thiss!1504) (zeroValue!4333 thiss!1504) (minValue!4333 thiss!1504) key!932 (defaultEntry!4492 thiss!1504)) lt!121868)))

(declare-fun b!242581 () Bool)

(assert (=> b!242581 (= e!157434 (not call!22613))))

(declare-fun b!242582 () Bool)

(declare-fun res!118860 () Bool)

(assert (=> b!242582 (=> (not res!118860) (not e!157434))))

(assert (=> b!242582 (= res!118860 (= (select (arr!5711 (_keys!6600 thiss!1504)) (index!6429 lt!121867)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242582 (and (bvsge (index!6429 lt!121867) #b00000000000000000000000000000000) (bvslt (index!6429 lt!121867) (size!6053 (_keys!6600 thiss!1504))))))

(declare-fun bm!22611 () Bool)

(assert (=> bm!22611 (= call!22613 (arrayContainsKey!0 (_keys!6600 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and d!59981 c!40484) b!242580))

(assert (= (and d!59981 (not c!40484)) b!242575))

(assert (= (and b!242580 res!118861) b!242576))

(assert (= (and b!242576 res!118862) b!242577))

(assert (= (and b!242575 c!40485) b!242579))

(assert (= (and b!242575 (not c!40485)) b!242578))

(assert (= (and b!242579 res!118863) b!242582))

(assert (= (and b!242582 res!118860) b!242581))

(assert (= (or b!242580 b!242579) bm!22610))

(assert (= (or b!242577 b!242581) bm!22611))

(declare-fun m!261385 () Bool)

(assert (=> bm!22610 m!261385))

(assert (=> bm!22611 m!261231))

(declare-fun m!261387 () Bool)

(assert (=> b!242582 m!261387))

(declare-fun m!261389 () Bool)

(assert (=> b!242576 m!261389))

(assert (=> d!59981 m!261235))

(declare-fun m!261391 () Bool)

(assert (=> d!59981 m!261391))

(assert (=> d!59981 m!261347))

(assert (=> b!242372 d!59981))

(declare-fun d!59983 () Bool)

(declare-fun res!118868 () Bool)

(declare-fun e!157440 () Bool)

(assert (=> d!59983 (=> res!118868 e!157440)))

(assert (=> d!59983 (= res!118868 (= (select (arr!5711 (_keys!6600 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!59983 (= (arrayContainsKey!0 (_keys!6600 thiss!1504) key!932 #b00000000000000000000000000000000) e!157440)))

(declare-fun b!242587 () Bool)

(declare-fun e!157441 () Bool)

(assert (=> b!242587 (= e!157440 e!157441)))

(declare-fun res!118869 () Bool)

(assert (=> b!242587 (=> (not res!118869) (not e!157441))))

(assert (=> b!242587 (= res!118869 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6053 (_keys!6600 thiss!1504))))))

(declare-fun b!242588 () Bool)

(assert (=> b!242588 (= e!157441 (arrayContainsKey!0 (_keys!6600 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!59983 (not res!118868)) b!242587))

(assert (= (and b!242587 res!118869) b!242588))

(assert (=> d!59983 m!261303))

(declare-fun m!261393 () Bool)

(assert (=> b!242588 m!261393))

(assert (=> bm!22577 d!59983))

(declare-fun d!59985 () Bool)

(declare-fun res!118874 () Bool)

(declare-fun e!157446 () Bool)

(assert (=> d!59985 (=> res!118874 e!157446)))

(assert (=> d!59985 (= res!118874 ((_ is Nil!3631) Nil!3631))))

(assert (=> d!59985 (= (noDuplicate!89 Nil!3631) e!157446)))

(declare-fun b!242593 () Bool)

(declare-fun e!157447 () Bool)

(assert (=> b!242593 (= e!157446 e!157447)))

(declare-fun res!118875 () Bool)

(assert (=> b!242593 (=> (not res!118875) (not e!157447))))

(assert (=> b!242593 (= res!118875 (not (contains!1742 (t!8635 Nil!3631) (h!4287 Nil!3631))))))

(declare-fun b!242594 () Bool)

(assert (=> b!242594 (= e!157447 (noDuplicate!89 (t!8635 Nil!3631)))))

(assert (= (and d!59985 (not res!118874)) b!242593))

(assert (= (and b!242593 res!118875) b!242594))

(declare-fun m!261395 () Bool)

(assert (=> b!242593 m!261395))

(declare-fun m!261397 () Bool)

(assert (=> b!242594 m!261397))

(assert (=> b!242380 d!59985))

(declare-fun d!59987 () Bool)

(declare-fun lt!121869 () Bool)

(assert (=> d!59987 (= lt!121869 (select (content!158 Nil!3631) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157448 () Bool)

(assert (=> d!59987 (= lt!121869 e!157448)))

(declare-fun res!118876 () Bool)

(assert (=> d!59987 (=> (not res!118876) (not e!157448))))

(assert (=> d!59987 (= res!118876 ((_ is Cons!3630) Nil!3631))))

(assert (=> d!59987 (= (contains!1742 Nil!3631 #b0000000000000000000000000000000000000000000000000000000000000000) lt!121869)))

(declare-fun b!242595 () Bool)

(declare-fun e!157449 () Bool)

(assert (=> b!242595 (= e!157448 e!157449)))

(declare-fun res!118877 () Bool)

(assert (=> b!242595 (=> res!118877 e!157449)))

(assert (=> b!242595 (= res!118877 (= (h!4287 Nil!3631) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242596 () Bool)

(assert (=> b!242596 (= e!157449 (contains!1742 (t!8635 Nil!3631) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59987 res!118876) b!242595))

(assert (= (and b!242595 (not res!118877)) b!242596))

(assert (=> d!59987 m!261377))

(declare-fun m!261399 () Bool)

(assert (=> d!59987 m!261399))

(declare-fun m!261401 () Bool)

(assert (=> b!242596 m!261401))

(assert (=> b!242389 d!59987))

(declare-fun d!59989 () Bool)

(assert (=> d!59989 (= (inRange!0 (ite c!40445 (index!6426 lt!121749) (index!6429 lt!121749)) (mask!10573 thiss!1504)) (and (bvsge (ite c!40445 (index!6426 lt!121749) (index!6429 lt!121749)) #b00000000000000000000000000000000) (bvslt (ite c!40445 (index!6426 lt!121749) (index!6429 lt!121749)) (bvadd (mask!10573 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22578 d!59989))

(declare-fun d!59991 () Bool)

(assert (=> d!59991 (= (array_inv!3777 (_keys!6600 thiss!1504)) (bvsge (size!6053 (_keys!6600 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242379 d!59991))

(declare-fun d!59993 () Bool)

(assert (=> d!59993 (= (array_inv!3778 (_values!4475 thiss!1504)) (bvsge (size!6052 (_values!4475 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242379 d!59993))

(declare-fun b!242609 () Bool)

(declare-fun e!157456 () SeekEntryResult!1064)

(declare-fun e!157457 () SeekEntryResult!1064)

(assert (=> b!242609 (= e!157456 e!157457)))

(declare-fun lt!121877 () (_ BitVec 64))

(declare-fun lt!121878 () SeekEntryResult!1064)

(assert (=> b!242609 (= lt!121877 (select (arr!5711 (_keys!6600 thiss!1504)) (index!6428 lt!121878)))))

(declare-fun c!40493 () Bool)

(assert (=> b!242609 (= c!40493 (= lt!121877 key!932))))

(declare-fun b!242610 () Bool)

(declare-fun e!157458 () SeekEntryResult!1064)

(assert (=> b!242610 (= e!157458 (MissingZero!1064 (index!6428 lt!121878)))))

(declare-fun b!242611 () Bool)

(declare-fun c!40492 () Bool)

(assert (=> b!242611 (= c!40492 (= lt!121877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242611 (= e!157457 e!157458)))

(declare-fun b!242612 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12025 (_ BitVec 32)) SeekEntryResult!1064)

(assert (=> b!242612 (= e!157458 (seekKeyOrZeroReturnVacant!0 (x!24270 lt!121878) (index!6428 lt!121878) (index!6428 lt!121878) key!932 (_keys!6600 thiss!1504) (mask!10573 thiss!1504)))))

(declare-fun b!242614 () Bool)

(assert (=> b!242614 (= e!157456 Undefined!1064)))

(declare-fun d!59995 () Bool)

(declare-fun lt!121876 () SeekEntryResult!1064)

(assert (=> d!59995 (and (or ((_ is Undefined!1064) lt!121876) (not ((_ is Found!1064) lt!121876)) (and (bvsge (index!6427 lt!121876) #b00000000000000000000000000000000) (bvslt (index!6427 lt!121876) (size!6053 (_keys!6600 thiss!1504))))) (or ((_ is Undefined!1064) lt!121876) ((_ is Found!1064) lt!121876) (not ((_ is MissingZero!1064) lt!121876)) (and (bvsge (index!6426 lt!121876) #b00000000000000000000000000000000) (bvslt (index!6426 lt!121876) (size!6053 (_keys!6600 thiss!1504))))) (or ((_ is Undefined!1064) lt!121876) ((_ is Found!1064) lt!121876) ((_ is MissingZero!1064) lt!121876) (not ((_ is MissingVacant!1064) lt!121876)) (and (bvsge (index!6429 lt!121876) #b00000000000000000000000000000000) (bvslt (index!6429 lt!121876) (size!6053 (_keys!6600 thiss!1504))))) (or ((_ is Undefined!1064) lt!121876) (ite ((_ is Found!1064) lt!121876) (= (select (arr!5711 (_keys!6600 thiss!1504)) (index!6427 lt!121876)) key!932) (ite ((_ is MissingZero!1064) lt!121876) (= (select (arr!5711 (_keys!6600 thiss!1504)) (index!6426 lt!121876)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1064) lt!121876) (= (select (arr!5711 (_keys!6600 thiss!1504)) (index!6429 lt!121876)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59995 (= lt!121876 e!157456)))

(declare-fun c!40494 () Bool)

(assert (=> d!59995 (= c!40494 (and ((_ is Intermediate!1064) lt!121878) (undefined!1876 lt!121878)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12025 (_ BitVec 32)) SeekEntryResult!1064)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59995 (= lt!121878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10573 thiss!1504)) key!932 (_keys!6600 thiss!1504) (mask!10573 thiss!1504)))))

(assert (=> d!59995 (validMask!0 (mask!10573 thiss!1504))))

(assert (=> d!59995 (= (seekEntryOrOpen!0 key!932 (_keys!6600 thiss!1504) (mask!10573 thiss!1504)) lt!121876)))

(declare-fun b!242613 () Bool)

(assert (=> b!242613 (= e!157457 (Found!1064 (index!6428 lt!121878)))))

(assert (= (and d!59995 c!40494) b!242614))

(assert (= (and d!59995 (not c!40494)) b!242609))

(assert (= (and b!242609 c!40493) b!242613))

(assert (= (and b!242609 (not c!40493)) b!242611))

(assert (= (and b!242611 c!40492) b!242610))

(assert (= (and b!242611 (not c!40492)) b!242612))

(declare-fun m!261403 () Bool)

(assert (=> b!242609 m!261403))

(declare-fun m!261405 () Bool)

(assert (=> b!242612 m!261405))

(declare-fun m!261407 () Bool)

(assert (=> d!59995 m!261407))

(assert (=> d!59995 m!261347))

(declare-fun m!261409 () Bool)

(assert (=> d!59995 m!261409))

(declare-fun m!261411 () Bool)

(assert (=> d!59995 m!261411))

(declare-fun m!261413 () Bool)

(assert (=> d!59995 m!261413))

(declare-fun m!261415 () Bool)

(assert (=> d!59995 m!261415))

(assert (=> d!59995 m!261413))

(assert (=> b!242377 d!59995))

(assert (=> b!242386 d!59983))

(declare-fun mapNonEmpty!10801 () Bool)

(declare-fun mapRes!10801 () Bool)

(declare-fun tp!22744 () Bool)

(declare-fun e!157463 () Bool)

(assert (=> mapNonEmpty!10801 (= mapRes!10801 (and tp!22744 e!157463))))

(declare-fun mapRest!10801 () (Array (_ BitVec 32) ValueCell!2841))

(declare-fun mapValue!10801 () ValueCell!2841)

(declare-fun mapKey!10801 () (_ BitVec 32))

(assert (=> mapNonEmpty!10801 (= mapRest!10795 (store mapRest!10801 mapKey!10801 mapValue!10801))))

(declare-fun b!242621 () Bool)

(assert (=> b!242621 (= e!157463 tp_is_empty!6369)))

(declare-fun condMapEmpty!10801 () Bool)

(declare-fun mapDefault!10801 () ValueCell!2841)

(assert (=> mapNonEmpty!10795 (= condMapEmpty!10801 (= mapRest!10795 ((as const (Array (_ BitVec 32) ValueCell!2841)) mapDefault!10801)))))

(declare-fun e!157464 () Bool)

(assert (=> mapNonEmpty!10795 (= tp!22734 (and e!157464 mapRes!10801))))

(declare-fun b!242622 () Bool)

(assert (=> b!242622 (= e!157464 tp_is_empty!6369)))

(declare-fun mapIsEmpty!10801 () Bool)

(assert (=> mapIsEmpty!10801 mapRes!10801))

(assert (= (and mapNonEmpty!10795 condMapEmpty!10801) mapIsEmpty!10801))

(assert (= (and mapNonEmpty!10795 (not condMapEmpty!10801)) mapNonEmpty!10801))

(assert (= (and mapNonEmpty!10801 ((_ is ValueCellFull!2841) mapValue!10801)) b!242621))

(assert (= (and mapNonEmpty!10795 ((_ is ValueCellFull!2841) mapDefault!10801)) b!242622))

(declare-fun m!261417 () Bool)

(assert (=> mapNonEmpty!10801 m!261417))

(declare-fun b_lambda!8001 () Bool)

(assert (= b_lambda!7999 (or (and b!242379 b_free!6507) b_lambda!8001)))

(check-sat (not d!59969) (not d!59979) (not b!242588) (not bm!22611) (not b!242612) (not b!242593) (not b!242526) (not b!242550) (not b!242529) (not bm!22602) (not b!242472) (not d!59975) (not b!242470) (not b!242542) (not bm!22604) (not d!59973) (not b!242558) (not d!59995) (not b!242596) (not b!242552) (not bm!22601) (not d!59987) (not d!59971) (not b!242520) tp_is_empty!6369 (not b!242515) (not b_lambda!8001) (not b!242522) (not mapNonEmpty!10801) (not bm!22610) b_and!13487 (not b_next!6507) (not b!242521) (not b!242551) (not b!242527) (not b!242594) (not d!59981) (not b!242518) (not bm!22599) (not d!59977))
(check-sat b_and!13487 (not b_next!6507))
