; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22038 () Bool)

(assert start!22038)

(declare-fun b!227550 () Bool)

(declare-fun b_free!6105 () Bool)

(declare-fun b_next!6105 () Bool)

(assert (=> b!227550 (= b_free!6105 (not b_next!6105))))

(declare-fun tp!21457 () Bool)

(declare-fun b_and!13003 () Bool)

(assert (=> b!227550 (= tp!21457 b_and!13003)))

(declare-fun b!227538 () Bool)

(declare-fun e!147628 () Bool)

(declare-fun e!147629 () Bool)

(declare-fun mapRes!10120 () Bool)

(assert (=> b!227538 (= e!147628 (and e!147629 mapRes!10120))))

(declare-fun condMapEmpty!10120 () Bool)

(declare-datatypes ((V!7603 0))(
  ( (V!7604 (val!3028 Int)) )
))
(declare-datatypes ((ValueCell!2640 0))(
  ( (ValueCellFull!2640 (v!5048 V!7603)) (EmptyCell!2640) )
))
(declare-datatypes ((array!11177 0))(
  ( (array!11178 (arr!5308 (Array (_ BitVec 32) ValueCell!2640)) (size!5641 (_ BitVec 32))) )
))
(declare-datatypes ((array!11179 0))(
  ( (array!11180 (arr!5309 (Array (_ BitVec 32) (_ BitVec 64))) (size!5642 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3180 0))(
  ( (LongMapFixedSize!3181 (defaultEntry!4249 Int) (mask!10111 (_ BitVec 32)) (extraKeys!3986 (_ BitVec 32)) (zeroValue!4090 V!7603) (minValue!4090 V!7603) (_size!1639 (_ BitVec 32)) (_keys!6303 array!11179) (_values!4232 array!11177) (_vacant!1639 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3180)

(declare-fun mapDefault!10120 () ValueCell!2640)

(assert (=> b!227538 (= condMapEmpty!10120 (= (arr!5308 (_values!4232 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2640)) mapDefault!10120)))))

(declare-fun mapNonEmpty!10120 () Bool)

(declare-fun tp!21456 () Bool)

(declare-fun e!147624 () Bool)

(assert (=> mapNonEmpty!10120 (= mapRes!10120 (and tp!21456 e!147624))))

(declare-fun mapRest!10120 () (Array (_ BitVec 32) ValueCell!2640))

(declare-fun mapKey!10120 () (_ BitVec 32))

(declare-fun mapValue!10120 () ValueCell!2640)

(assert (=> mapNonEmpty!10120 (= (arr!5308 (_values!4232 thiss!1504)) (store mapRest!10120 mapKey!10120 mapValue!10120))))

(declare-fun b!227539 () Bool)

(declare-fun res!112018 () Bool)

(declare-fun e!147621 () Bool)

(assert (=> b!227539 (=> (not res!112018) (not e!147621))))

(declare-datatypes ((SeekEntryResult!896 0))(
  ( (MissingZero!896 (index!5754 (_ BitVec 32))) (Found!896 (index!5755 (_ BitVec 32))) (Intermediate!896 (undefined!1708 Bool) (index!5756 (_ BitVec 32)) (x!23284 (_ BitVec 32))) (Undefined!896) (MissingVacant!896 (index!5757 (_ BitVec 32))) )
))
(declare-fun lt!114503 () SeekEntryResult!896)

(assert (=> b!227539 (= res!112018 (= (select (arr!5309 (_keys!6303 thiss!1504)) (index!5754 lt!114503)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!227540 () Bool)

(declare-fun e!147618 () Bool)

(declare-fun call!21149 () Bool)

(assert (=> b!227540 (= e!147618 (not call!21149))))

(declare-fun b!227541 () Bool)

(declare-datatypes ((Unit!6902 0))(
  ( (Unit!6903) )
))
(declare-fun e!147619 () Unit!6902)

(declare-fun Unit!6904 () Unit!6902)

(assert (=> b!227541 (= e!147619 Unit!6904)))

(declare-fun b!227542 () Bool)

(declare-fun res!112010 () Bool)

(assert (=> b!227542 (= res!112010 (= (select (arr!5309 (_keys!6303 thiss!1504)) (index!5757 lt!114503)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!227542 (=> (not res!112010) (not e!147618))))

(declare-fun b!227543 () Bool)

(declare-fun res!112008 () Bool)

(declare-fun e!147625 () Bool)

(assert (=> b!227543 (=> res!112008 e!147625)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11179 (_ BitVec 32)) Bool)

(assert (=> b!227543 (= res!112008 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6303 thiss!1504) (mask!10111 thiss!1504))))))

(declare-fun b!227544 () Bool)

(declare-fun res!112009 () Bool)

(declare-fun e!147617 () Bool)

(assert (=> b!227544 (=> (not res!112009) (not e!147617))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!227544 (= res!112009 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!227545 () Bool)

(declare-fun e!147623 () Bool)

(assert (=> b!227545 (= e!147623 e!147618)))

(declare-fun res!112014 () Bool)

(declare-fun call!21150 () Bool)

(assert (=> b!227545 (= res!112014 call!21150)))

(assert (=> b!227545 (=> (not res!112014) (not e!147618))))

(declare-fun b!227546 () Bool)

(declare-fun e!147622 () Unit!6902)

(declare-fun lt!114499 () Unit!6902)

(assert (=> b!227546 (= e!147622 lt!114499)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!280 (array!11179 array!11177 (_ BitVec 32) (_ BitVec 32) V!7603 V!7603 (_ BitVec 64) Int) Unit!6902)

(assert (=> b!227546 (= lt!114499 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!280 (_keys!6303 thiss!1504) (_values!4232 thiss!1504) (mask!10111 thiss!1504) (extraKeys!3986 thiss!1504) (zeroValue!4090 thiss!1504) (minValue!4090 thiss!1504) key!932 (defaultEntry!4249 thiss!1504)))))

(declare-fun c!37727 () Bool)

(get-info :version)

(assert (=> b!227546 (= c!37727 ((_ is MissingZero!896) lt!114503))))

(declare-fun e!147616 () Bool)

(assert (=> b!227546 e!147616))

(declare-fun b!227547 () Bool)

(declare-fun Unit!6905 () Unit!6902)

(assert (=> b!227547 (= e!147622 Unit!6905)))

(declare-fun lt!114501 () Unit!6902)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!265 (array!11179 array!11177 (_ BitVec 32) (_ BitVec 32) V!7603 V!7603 (_ BitVec 64) Int) Unit!6902)

(assert (=> b!227547 (= lt!114501 (lemmaInListMapThenSeekEntryOrOpenFindsIt!265 (_keys!6303 thiss!1504) (_values!4232 thiss!1504) (mask!10111 thiss!1504) (extraKeys!3986 thiss!1504) (zeroValue!4090 thiss!1504) (minValue!4090 thiss!1504) key!932 (defaultEntry!4249 thiss!1504)))))

(assert (=> b!227547 false))

(declare-fun b!227548 () Bool)

(declare-fun res!112016 () Bool)

(assert (=> b!227548 (=> res!112016 e!147625)))

(assert (=> b!227548 (= res!112016 (or (not (= (size!5641 (_values!4232 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10111 thiss!1504)))) (not (= (size!5642 (_keys!6303 thiss!1504)) (size!5641 (_values!4232 thiss!1504)))) (bvslt (mask!10111 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3986 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3986 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!10120 () Bool)

(assert (=> mapIsEmpty!10120 mapRes!10120))

(declare-fun b!227549 () Bool)

(assert (=> b!227549 (= e!147625 true)))

(declare-fun lt!114498 () Bool)

(declare-datatypes ((List!3394 0))(
  ( (Nil!3391) (Cons!3390 (h!4038 (_ BitVec 64)) (t!8353 List!3394)) )
))
(declare-fun arrayNoDuplicates!0 (array!11179 (_ BitVec 32) List!3394) Bool)

(assert (=> b!227549 (= lt!114498 (arrayNoDuplicates!0 (_keys!6303 thiss!1504) #b00000000000000000000000000000000 Nil!3391))))

(declare-fun tp_is_empty!5967 () Bool)

(declare-fun e!147615 () Bool)

(declare-fun array_inv!3509 (array!11179) Bool)

(declare-fun array_inv!3510 (array!11177) Bool)

(assert (=> b!227550 (= e!147615 (and tp!21457 tp_is_empty!5967 (array_inv!3509 (_keys!6303 thiss!1504)) (array_inv!3510 (_values!4232 thiss!1504)) e!147628))))

(declare-fun b!227551 () Bool)

(declare-fun Unit!6906 () Unit!6902)

(assert (=> b!227551 (= e!147619 Unit!6906)))

(declare-fun lt!114504 () Unit!6902)

(declare-fun lemmaArrayContainsKeyThenInListMap!103 (array!11179 array!11177 (_ BitVec 32) (_ BitVec 32) V!7603 V!7603 (_ BitVec 64) (_ BitVec 32) Int) Unit!6902)

(assert (=> b!227551 (= lt!114504 (lemmaArrayContainsKeyThenInListMap!103 (_keys!6303 thiss!1504) (_values!4232 thiss!1504) (mask!10111 thiss!1504) (extraKeys!3986 thiss!1504) (zeroValue!4090 thiss!1504) (minValue!4090 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4249 thiss!1504)))))

(assert (=> b!227551 false))

(declare-fun b!227552 () Bool)

(assert (=> b!227552 (= e!147623 ((_ is Undefined!896) lt!114503))))

(declare-fun res!112013 () Bool)

(assert (=> start!22038 (=> (not res!112013) (not e!147617))))

(declare-fun valid!1276 (LongMapFixedSize!3180) Bool)

(assert (=> start!22038 (= res!112013 (valid!1276 thiss!1504))))

(assert (=> start!22038 e!147617))

(assert (=> start!22038 e!147615))

(assert (=> start!22038 true))

(declare-fun b!227553 () Bool)

(declare-fun e!147626 () Bool)

(assert (=> b!227553 (= e!147617 e!147626)))

(declare-fun res!112011 () Bool)

(assert (=> b!227553 (=> (not res!112011) (not e!147626))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!227553 (= res!112011 (or (= lt!114503 (MissingZero!896 index!297)) (= lt!114503 (MissingVacant!896 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11179 (_ BitVec 32)) SeekEntryResult!896)

(assert (=> b!227553 (= lt!114503 (seekEntryOrOpen!0 key!932 (_keys!6303 thiss!1504) (mask!10111 thiss!1504)))))

(declare-fun b!227554 () Bool)

(declare-fun e!147627 () Bool)

(assert (=> b!227554 (= e!147627 (not e!147625))))

(declare-fun res!112015 () Bool)

(assert (=> b!227554 (=> res!112015 e!147625)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227554 (= res!112015 (not (validMask!0 (mask!10111 thiss!1504))))))

(declare-fun lt!114496 () array!11179)

(assert (=> b!227554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114496 (mask!10111 thiss!1504))))

(declare-fun lt!114500 () Unit!6902)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11179 (_ BitVec 32) (_ BitVec 32)) Unit!6902)

(assert (=> b!227554 (= lt!114500 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6303 thiss!1504) index!297 (mask!10111 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11179 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227554 (= (arrayCountValidKeys!0 lt!114496 #b00000000000000000000000000000000 (size!5642 (_keys!6303 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6303 thiss!1504) #b00000000000000000000000000000000 (size!5642 (_keys!6303 thiss!1504)))))))

(declare-fun lt!114497 () Unit!6902)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11179 (_ BitVec 32) (_ BitVec 64)) Unit!6902)

(assert (=> b!227554 (= lt!114497 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6303 thiss!1504) index!297 key!932))))

(assert (=> b!227554 (arrayNoDuplicates!0 lt!114496 #b00000000000000000000000000000000 Nil!3391)))

(assert (=> b!227554 (= lt!114496 (array!11180 (store (arr!5309 (_keys!6303 thiss!1504)) index!297 key!932) (size!5642 (_keys!6303 thiss!1504))))))

(declare-fun lt!114502 () Unit!6902)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11179 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3394) Unit!6902)

(assert (=> b!227554 (= lt!114502 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6303 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3391))))

(declare-fun lt!114505 () Unit!6902)

(assert (=> b!227554 (= lt!114505 e!147619)))

(declare-fun c!37728 () Bool)

(declare-fun arrayContainsKey!0 (array!11179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227554 (= c!37728 (arrayContainsKey!0 (_keys!6303 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!21146 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21146 (= call!21150 (inRange!0 (ite c!37727 (index!5754 lt!114503) (index!5757 lt!114503)) (mask!10111 thiss!1504)))))

(declare-fun b!227555 () Bool)

(assert (=> b!227555 (= e!147629 tp_is_empty!5967)))

(declare-fun b!227556 () Bool)

(declare-fun res!112012 () Bool)

(assert (=> b!227556 (=> (not res!112012) (not e!147621))))

(assert (=> b!227556 (= res!112012 call!21150)))

(assert (=> b!227556 (= e!147616 e!147621)))

(declare-fun b!227557 () Bool)

(assert (=> b!227557 (= e!147621 (not call!21149))))

(declare-fun bm!21147 () Bool)

(assert (=> bm!21147 (= call!21149 (arrayContainsKey!0 (_keys!6303 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227558 () Bool)

(assert (=> b!227558 (= e!147626 e!147627)))

(declare-fun res!112017 () Bool)

(assert (=> b!227558 (=> (not res!112017) (not e!147627))))

(assert (=> b!227558 (= res!112017 (inRange!0 index!297 (mask!10111 thiss!1504)))))

(declare-fun lt!114506 () Unit!6902)

(assert (=> b!227558 (= lt!114506 e!147622)))

(declare-fun c!37725 () Bool)

(declare-datatypes ((tuple2!4474 0))(
  ( (tuple2!4475 (_1!2248 (_ BitVec 64)) (_2!2248 V!7603)) )
))
(declare-datatypes ((List!3395 0))(
  ( (Nil!3392) (Cons!3391 (h!4039 tuple2!4474) (t!8354 List!3395)) )
))
(declare-datatypes ((ListLongMap!3387 0))(
  ( (ListLongMap!3388 (toList!1709 List!3395)) )
))
(declare-fun contains!1583 (ListLongMap!3387 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1237 (array!11179 array!11177 (_ BitVec 32) (_ BitVec 32) V!7603 V!7603 (_ BitVec 32) Int) ListLongMap!3387)

(assert (=> b!227558 (= c!37725 (contains!1583 (getCurrentListMap!1237 (_keys!6303 thiss!1504) (_values!4232 thiss!1504) (mask!10111 thiss!1504) (extraKeys!3986 thiss!1504) (zeroValue!4090 thiss!1504) (minValue!4090 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4249 thiss!1504)) key!932))))

(declare-fun b!227559 () Bool)

(declare-fun c!37726 () Bool)

(assert (=> b!227559 (= c!37726 ((_ is MissingVacant!896) lt!114503))))

(assert (=> b!227559 (= e!147616 e!147623)))

(declare-fun b!227560 () Bool)

(assert (=> b!227560 (= e!147624 tp_is_empty!5967)))

(assert (= (and start!22038 res!112013) b!227544))

(assert (= (and b!227544 res!112009) b!227553))

(assert (= (and b!227553 res!112011) b!227558))

(assert (= (and b!227558 c!37725) b!227547))

(assert (= (and b!227558 (not c!37725)) b!227546))

(assert (= (and b!227546 c!37727) b!227556))

(assert (= (and b!227546 (not c!37727)) b!227559))

(assert (= (and b!227556 res!112012) b!227539))

(assert (= (and b!227539 res!112018) b!227557))

(assert (= (and b!227559 c!37726) b!227545))

(assert (= (and b!227559 (not c!37726)) b!227552))

(assert (= (and b!227545 res!112014) b!227542))

(assert (= (and b!227542 res!112010) b!227540))

(assert (= (or b!227556 b!227545) bm!21146))

(assert (= (or b!227557 b!227540) bm!21147))

(assert (= (and b!227558 res!112017) b!227554))

(assert (= (and b!227554 c!37728) b!227551))

(assert (= (and b!227554 (not c!37728)) b!227541))

(assert (= (and b!227554 (not res!112015)) b!227548))

(assert (= (and b!227548 (not res!112016)) b!227543))

(assert (= (and b!227543 (not res!112008)) b!227549))

(assert (= (and b!227538 condMapEmpty!10120) mapIsEmpty!10120))

(assert (= (and b!227538 (not condMapEmpty!10120)) mapNonEmpty!10120))

(assert (= (and mapNonEmpty!10120 ((_ is ValueCellFull!2640) mapValue!10120)) b!227560))

(assert (= (and b!227538 ((_ is ValueCellFull!2640) mapDefault!10120)) b!227555))

(assert (= b!227550 b!227538))

(assert (= start!22038 b!227550))

(declare-fun m!249519 () Bool)

(assert (=> b!227553 m!249519))

(declare-fun m!249521 () Bool)

(assert (=> b!227539 m!249521))

(declare-fun m!249523 () Bool)

(assert (=> b!227558 m!249523))

(declare-fun m!249525 () Bool)

(assert (=> b!227558 m!249525))

(assert (=> b!227558 m!249525))

(declare-fun m!249527 () Bool)

(assert (=> b!227558 m!249527))

(declare-fun m!249529 () Bool)

(assert (=> b!227547 m!249529))

(declare-fun m!249531 () Bool)

(assert (=> b!227546 m!249531))

(declare-fun m!249533 () Bool)

(assert (=> b!227551 m!249533))

(declare-fun m!249535 () Bool)

(assert (=> b!227543 m!249535))

(declare-fun m!249537 () Bool)

(assert (=> b!227542 m!249537))

(declare-fun m!249539 () Bool)

(assert (=> bm!21146 m!249539))

(declare-fun m!249541 () Bool)

(assert (=> b!227550 m!249541))

(declare-fun m!249543 () Bool)

(assert (=> b!227550 m!249543))

(declare-fun m!249545 () Bool)

(assert (=> b!227549 m!249545))

(declare-fun m!249547 () Bool)

(assert (=> bm!21147 m!249547))

(declare-fun m!249549 () Bool)

(assert (=> b!227554 m!249549))

(assert (=> b!227554 m!249547))

(declare-fun m!249551 () Bool)

(assert (=> b!227554 m!249551))

(declare-fun m!249553 () Bool)

(assert (=> b!227554 m!249553))

(declare-fun m!249555 () Bool)

(assert (=> b!227554 m!249555))

(declare-fun m!249557 () Bool)

(assert (=> b!227554 m!249557))

(declare-fun m!249559 () Bool)

(assert (=> b!227554 m!249559))

(declare-fun m!249561 () Bool)

(assert (=> b!227554 m!249561))

(declare-fun m!249563 () Bool)

(assert (=> b!227554 m!249563))

(declare-fun m!249565 () Bool)

(assert (=> b!227554 m!249565))

(declare-fun m!249567 () Bool)

(assert (=> mapNonEmpty!10120 m!249567))

(declare-fun m!249569 () Bool)

(assert (=> start!22038 m!249569))

(check-sat (not b!227547) (not b!227551) (not b!227550) b_and!13003 tp_is_empty!5967 (not mapNonEmpty!10120) (not b!227543) (not b_next!6105) (not b!227549) (not b!227553) (not b!227554) (not bm!21146) (not bm!21147) (not b!227546) (not b!227558) (not start!22038))
(check-sat b_and!13003 (not b_next!6105))
