; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18042 () Bool)

(assert start!18042)

(declare-fun b!179460 () Bool)

(declare-fun b_free!4429 () Bool)

(declare-fun b_next!4429 () Bool)

(assert (=> b!179460 (= b_free!4429 (not b_next!4429))))

(declare-fun tp!16014 () Bool)

(declare-fun b_and!10935 () Bool)

(assert (=> b!179460 (= tp!16014 b_and!10935)))

(declare-fun b!179454 () Bool)

(declare-fun res!84973 () Bool)

(declare-fun e!118211 () Bool)

(assert (=> b!179454 (=> (not res!84973) (not e!118211))))

(declare-datatypes ((V!5249 0))(
  ( (V!5250 (val!2145 Int)) )
))
(declare-datatypes ((ValueCell!1757 0))(
  ( (ValueCellFull!1757 (v!4027 V!5249)) (EmptyCell!1757) )
))
(declare-datatypes ((array!7549 0))(
  ( (array!7550 (arr!3574 (Array (_ BitVec 32) (_ BitVec 64))) (size!3883 (_ BitVec 32))) )
))
(declare-datatypes ((array!7551 0))(
  ( (array!7552 (arr!3575 (Array (_ BitVec 32) ValueCell!1757)) (size!3884 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2422 0))(
  ( (LongMapFixedSize!2423 (defaultEntry!3686 Int) (mask!8671 (_ BitVec 32)) (extraKeys!3423 (_ BitVec 32)) (zeroValue!3527 V!5249) (minValue!3527 V!5249) (_size!1260 (_ BitVec 32)) (_keys!5574 array!7549) (_values!3669 array!7551) (_vacant!1260 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2422)

(declare-datatypes ((List!2275 0))(
  ( (Nil!2272) (Cons!2271 (h!2896 (_ BitVec 64)) (t!7112 List!2275)) )
))
(declare-fun arrayNoDuplicates!0 (array!7549 (_ BitVec 32) List!2275) Bool)

(assert (=> b!179454 (= res!84973 (arrayNoDuplicates!0 (_keys!5574 thiss!1248) #b00000000000000000000000000000000 Nil!2272))))

(declare-fun b!179455 () Bool)

(declare-fun e!118210 () Bool)

(declare-fun e!118206 () Bool)

(declare-fun mapRes!7192 () Bool)

(assert (=> b!179455 (= e!118210 (and e!118206 mapRes!7192))))

(declare-fun condMapEmpty!7192 () Bool)

(declare-fun mapDefault!7192 () ValueCell!1757)

(assert (=> b!179455 (= condMapEmpty!7192 (= (arr!3575 (_values!3669 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1757)) mapDefault!7192)))))

(declare-fun b!179456 () Bool)

(declare-fun res!84971 () Bool)

(assert (=> b!179456 (=> (not res!84971) (not e!118211))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!179456 (= res!84971 (not (= key!828 (bvneg key!828))))))

(declare-fun b!179457 () Bool)

(declare-fun res!84970 () Bool)

(assert (=> b!179457 (=> (not res!84970) (not e!118211))))

(declare-datatypes ((tuple2!3312 0))(
  ( (tuple2!3313 (_1!1667 (_ BitVec 64)) (_2!1667 V!5249)) )
))
(declare-datatypes ((List!2276 0))(
  ( (Nil!2273) (Cons!2272 (h!2897 tuple2!3312) (t!7113 List!2276)) )
))
(declare-datatypes ((ListLongMap!2231 0))(
  ( (ListLongMap!2232 (toList!1131 List!2276)) )
))
(declare-fun contains!1211 (ListLongMap!2231 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!767 (array!7549 array!7551 (_ BitVec 32) (_ BitVec 32) V!5249 V!5249 (_ BitVec 32) Int) ListLongMap!2231)

(assert (=> b!179457 (= res!84970 (not (contains!1211 (getCurrentListMap!767 (_keys!5574 thiss!1248) (_values!3669 thiss!1248) (mask!8671 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)) key!828)))))

(declare-fun b!179458 () Bool)

(declare-fun res!84975 () Bool)

(assert (=> b!179458 (=> (not res!84975) (not e!118211))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!592 0))(
  ( (MissingZero!592 (index!4536 (_ BitVec 32))) (Found!592 (index!4537 (_ BitVec 32))) (Intermediate!592 (undefined!1404 Bool) (index!4538 (_ BitVec 32)) (x!19647 (_ BitVec 32))) (Undefined!592) (MissingVacant!592 (index!4539 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7549 (_ BitVec 32)) SeekEntryResult!592)

(assert (=> b!179458 (= res!84975 ((_ is Undefined!592) (seekEntryOrOpen!0 key!828 (_keys!5574 thiss!1248) (mask!8671 thiss!1248))))))

(declare-fun b!179459 () Bool)

(declare-fun res!84974 () Bool)

(assert (=> b!179459 (=> (not res!84974) (not e!118211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179459 (= res!84974 (validMask!0 (mask!8671 thiss!1248)))))

(declare-fun tp_is_empty!4201 () Bool)

(declare-fun e!118208 () Bool)

(declare-fun array_inv!2313 (array!7549) Bool)

(declare-fun array_inv!2314 (array!7551) Bool)

(assert (=> b!179460 (= e!118208 (and tp!16014 tp_is_empty!4201 (array_inv!2313 (_keys!5574 thiss!1248)) (array_inv!2314 (_values!3669 thiss!1248)) e!118210))))

(declare-fun res!84972 () Bool)

(assert (=> start!18042 (=> (not res!84972) (not e!118211))))

(declare-fun valid!1028 (LongMapFixedSize!2422) Bool)

(assert (=> start!18042 (= res!84972 (valid!1028 thiss!1248))))

(assert (=> start!18042 e!118211))

(assert (=> start!18042 e!118208))

(assert (=> start!18042 true))

(declare-fun b!179461 () Bool)

(assert (=> b!179461 (= e!118206 tp_is_empty!4201)))

(declare-fun mapNonEmpty!7192 () Bool)

(declare-fun tp!16015 () Bool)

(declare-fun e!118207 () Bool)

(assert (=> mapNonEmpty!7192 (= mapRes!7192 (and tp!16015 e!118207))))

(declare-fun mapKey!7192 () (_ BitVec 32))

(declare-fun mapRest!7192 () (Array (_ BitVec 32) ValueCell!1757))

(declare-fun mapValue!7192 () ValueCell!1757)

(assert (=> mapNonEmpty!7192 (= (arr!3575 (_values!3669 thiss!1248)) (store mapRest!7192 mapKey!7192 mapValue!7192))))

(declare-fun b!179462 () Bool)

(declare-fun res!84977 () Bool)

(assert (=> b!179462 (=> (not res!84977) (not e!118211))))

(assert (=> b!179462 (= res!84977 (and (= (size!3884 (_values!3669 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8671 thiss!1248))) (= (size!3883 (_keys!5574 thiss!1248)) (size!3884 (_values!3669 thiss!1248))) (bvsge (mask!8671 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3423 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3423 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!179463 () Bool)

(declare-fun res!84976 () Bool)

(assert (=> b!179463 (=> (not res!84976) (not e!118211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7549 (_ BitVec 32)) Bool)

(assert (=> b!179463 (= res!84976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5574 thiss!1248) (mask!8671 thiss!1248)))))

(declare-fun mapIsEmpty!7192 () Bool)

(assert (=> mapIsEmpty!7192 mapRes!7192))

(declare-fun b!179464 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!179464 (= e!118211 (not (validKeyInArray!0 key!828)))))

(declare-fun b!179465 () Bool)

(assert (=> b!179465 (= e!118207 tp_is_empty!4201)))

(assert (= (and start!18042 res!84972) b!179456))

(assert (= (and b!179456 res!84971) b!179458))

(assert (= (and b!179458 res!84975) b!179457))

(assert (= (and b!179457 res!84970) b!179459))

(assert (= (and b!179459 res!84974) b!179462))

(assert (= (and b!179462 res!84977) b!179463))

(assert (= (and b!179463 res!84976) b!179454))

(assert (= (and b!179454 res!84973) b!179464))

(assert (= (and b!179455 condMapEmpty!7192) mapIsEmpty!7192))

(assert (= (and b!179455 (not condMapEmpty!7192)) mapNonEmpty!7192))

(assert (= (and mapNonEmpty!7192 ((_ is ValueCellFull!1757) mapValue!7192)) b!179465))

(assert (= (and b!179455 ((_ is ValueCellFull!1757) mapDefault!7192)) b!179461))

(assert (= b!179460 b!179455))

(assert (= start!18042 b!179460))

(declare-fun m!207181 () Bool)

(assert (=> b!179459 m!207181))

(declare-fun m!207183 () Bool)

(assert (=> start!18042 m!207183))

(declare-fun m!207185 () Bool)

(assert (=> b!179464 m!207185))

(declare-fun m!207187 () Bool)

(assert (=> b!179457 m!207187))

(assert (=> b!179457 m!207187))

(declare-fun m!207189 () Bool)

(assert (=> b!179457 m!207189))

(declare-fun m!207191 () Bool)

(assert (=> b!179463 m!207191))

(declare-fun m!207193 () Bool)

(assert (=> b!179458 m!207193))

(declare-fun m!207195 () Bool)

(assert (=> b!179460 m!207195))

(declare-fun m!207197 () Bool)

(assert (=> b!179460 m!207197))

(declare-fun m!207199 () Bool)

(assert (=> b!179454 m!207199))

(declare-fun m!207201 () Bool)

(assert (=> mapNonEmpty!7192 m!207201))

(check-sat (not start!18042) (not mapNonEmpty!7192) tp_is_empty!4201 (not b!179454) (not b!179463) (not b!179458) (not b!179457) (not b!179459) (not b!179464) (not b_next!4429) b_and!10935 (not b!179460))
(check-sat b_and!10935 (not b_next!4429))
(get-model)

(declare-fun d!54015 () Bool)

(declare-fun e!118252 () Bool)

(assert (=> d!54015 e!118252))

(declare-fun res!85028 () Bool)

(assert (=> d!54015 (=> res!85028 e!118252)))

(declare-fun lt!88570 () Bool)

(assert (=> d!54015 (= res!85028 (not lt!88570))))

(declare-fun lt!88569 () Bool)

(assert (=> d!54015 (= lt!88570 lt!88569)))

(declare-datatypes ((Unit!5441 0))(
  ( (Unit!5442) )
))
(declare-fun lt!88568 () Unit!5441)

(declare-fun e!118253 () Unit!5441)

(assert (=> d!54015 (= lt!88568 e!118253)))

(declare-fun c!32178 () Bool)

(assert (=> d!54015 (= c!32178 lt!88569)))

(declare-fun containsKey!205 (List!2276 (_ BitVec 64)) Bool)

(assert (=> d!54015 (= lt!88569 (containsKey!205 (toList!1131 (getCurrentListMap!767 (_keys!5574 thiss!1248) (_values!3669 thiss!1248) (mask!8671 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248))) key!828))))

(assert (=> d!54015 (= (contains!1211 (getCurrentListMap!767 (_keys!5574 thiss!1248) (_values!3669 thiss!1248) (mask!8671 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)) key!828) lt!88570)))

(declare-fun b!179544 () Bool)

(declare-fun lt!88567 () Unit!5441)

(assert (=> b!179544 (= e!118253 lt!88567)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!154 (List!2276 (_ BitVec 64)) Unit!5441)

(assert (=> b!179544 (= lt!88567 (lemmaContainsKeyImpliesGetValueByKeyDefined!154 (toList!1131 (getCurrentListMap!767 (_keys!5574 thiss!1248) (_values!3669 thiss!1248) (mask!8671 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248))) key!828))))

(declare-datatypes ((Option!207 0))(
  ( (Some!206 (v!4030 V!5249)) (None!205) )
))
(declare-fun isDefined!155 (Option!207) Bool)

(declare-fun getValueByKey!201 (List!2276 (_ BitVec 64)) Option!207)

(assert (=> b!179544 (isDefined!155 (getValueByKey!201 (toList!1131 (getCurrentListMap!767 (_keys!5574 thiss!1248) (_values!3669 thiss!1248) (mask!8671 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248))) key!828))))

(declare-fun b!179545 () Bool)

(declare-fun Unit!5443 () Unit!5441)

(assert (=> b!179545 (= e!118253 Unit!5443)))

(declare-fun b!179546 () Bool)

(assert (=> b!179546 (= e!118252 (isDefined!155 (getValueByKey!201 (toList!1131 (getCurrentListMap!767 (_keys!5574 thiss!1248) (_values!3669 thiss!1248) (mask!8671 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248))) key!828)))))

(assert (= (and d!54015 c!32178) b!179544))

(assert (= (and d!54015 (not c!32178)) b!179545))

(assert (= (and d!54015 (not res!85028)) b!179546))

(declare-fun m!207247 () Bool)

(assert (=> d!54015 m!207247))

(declare-fun m!207249 () Bool)

(assert (=> b!179544 m!207249))

(declare-fun m!207251 () Bool)

(assert (=> b!179544 m!207251))

(assert (=> b!179544 m!207251))

(declare-fun m!207253 () Bool)

(assert (=> b!179544 m!207253))

(assert (=> b!179546 m!207251))

(assert (=> b!179546 m!207251))

(assert (=> b!179546 m!207253))

(assert (=> b!179457 d!54015))

(declare-fun b!179589 () Bool)

(declare-fun e!118288 () Bool)

(declare-fun e!118289 () Bool)

(assert (=> b!179589 (= e!118288 e!118289)))

(declare-fun res!85049 () Bool)

(declare-fun call!18140 () Bool)

(assert (=> b!179589 (= res!85049 call!18140)))

(assert (=> b!179589 (=> (not res!85049) (not e!118289))))

(declare-fun bm!18136 () Bool)

(declare-fun call!18145 () ListLongMap!2231)

(declare-fun call!18142 () ListLongMap!2231)

(assert (=> bm!18136 (= call!18145 call!18142)))

(declare-fun b!179590 () Bool)

(declare-fun e!118286 () ListLongMap!2231)

(declare-fun call!18144 () ListLongMap!2231)

(declare-fun +!260 (ListLongMap!2231 tuple2!3312) ListLongMap!2231)

(assert (=> b!179590 (= e!118286 (+!260 call!18144 (tuple2!3313 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3527 thiss!1248))))))

(declare-fun b!179591 () Bool)

(declare-fun e!118285 () Bool)

(assert (=> b!179591 (= e!118285 (validKeyInArray!0 (select (arr!3574 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18137 () Bool)

(declare-fun call!18139 () ListLongMap!2231)

(assert (=> bm!18137 (= call!18142 call!18139)))

(declare-fun b!179592 () Bool)

(declare-fun e!118280 () Unit!5441)

(declare-fun lt!88617 () Unit!5441)

(assert (=> b!179592 (= e!118280 lt!88617)))

(declare-fun lt!88621 () ListLongMap!2231)

(declare-fun getCurrentListMapNoExtraKeys!169 (array!7549 array!7551 (_ BitVec 32) (_ BitVec 32) V!5249 V!5249 (_ BitVec 32) Int) ListLongMap!2231)

(assert (=> b!179592 (= lt!88621 (getCurrentListMapNoExtraKeys!169 (_keys!5574 thiss!1248) (_values!3669 thiss!1248) (mask!8671 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)))))

(declare-fun lt!88615 () (_ BitVec 64))

(assert (=> b!179592 (= lt!88615 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88618 () (_ BitVec 64))

(assert (=> b!179592 (= lt!88618 (select (arr!3574 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88622 () Unit!5441)

(declare-fun addStillContains!124 (ListLongMap!2231 (_ BitVec 64) V!5249 (_ BitVec 64)) Unit!5441)

(assert (=> b!179592 (= lt!88622 (addStillContains!124 lt!88621 lt!88615 (zeroValue!3527 thiss!1248) lt!88618))))

(assert (=> b!179592 (contains!1211 (+!260 lt!88621 (tuple2!3313 lt!88615 (zeroValue!3527 thiss!1248))) lt!88618)))

(declare-fun lt!88629 () Unit!5441)

(assert (=> b!179592 (= lt!88629 lt!88622)))

(declare-fun lt!88631 () ListLongMap!2231)

(assert (=> b!179592 (= lt!88631 (getCurrentListMapNoExtraKeys!169 (_keys!5574 thiss!1248) (_values!3669 thiss!1248) (mask!8671 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)))))

(declare-fun lt!88633 () (_ BitVec 64))

(assert (=> b!179592 (= lt!88633 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88625 () (_ BitVec 64))

(assert (=> b!179592 (= lt!88625 (select (arr!3574 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88636 () Unit!5441)

(declare-fun addApplyDifferent!124 (ListLongMap!2231 (_ BitVec 64) V!5249 (_ BitVec 64)) Unit!5441)

(assert (=> b!179592 (= lt!88636 (addApplyDifferent!124 lt!88631 lt!88633 (minValue!3527 thiss!1248) lt!88625))))

(declare-fun apply!148 (ListLongMap!2231 (_ BitVec 64)) V!5249)

(assert (=> b!179592 (= (apply!148 (+!260 lt!88631 (tuple2!3313 lt!88633 (minValue!3527 thiss!1248))) lt!88625) (apply!148 lt!88631 lt!88625))))

(declare-fun lt!88624 () Unit!5441)

(assert (=> b!179592 (= lt!88624 lt!88636)))

(declare-fun lt!88627 () ListLongMap!2231)

(assert (=> b!179592 (= lt!88627 (getCurrentListMapNoExtraKeys!169 (_keys!5574 thiss!1248) (_values!3669 thiss!1248) (mask!8671 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)))))

(declare-fun lt!88626 () (_ BitVec 64))

(assert (=> b!179592 (= lt!88626 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88619 () (_ BitVec 64))

(assert (=> b!179592 (= lt!88619 (select (arr!3574 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88634 () Unit!5441)

(assert (=> b!179592 (= lt!88634 (addApplyDifferent!124 lt!88627 lt!88626 (zeroValue!3527 thiss!1248) lt!88619))))

(assert (=> b!179592 (= (apply!148 (+!260 lt!88627 (tuple2!3313 lt!88626 (zeroValue!3527 thiss!1248))) lt!88619) (apply!148 lt!88627 lt!88619))))

(declare-fun lt!88628 () Unit!5441)

(assert (=> b!179592 (= lt!88628 lt!88634)))

(declare-fun lt!88616 () ListLongMap!2231)

(assert (=> b!179592 (= lt!88616 (getCurrentListMapNoExtraKeys!169 (_keys!5574 thiss!1248) (_values!3669 thiss!1248) (mask!8671 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)))))

(declare-fun lt!88620 () (_ BitVec 64))

(assert (=> b!179592 (= lt!88620 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88630 () (_ BitVec 64))

(assert (=> b!179592 (= lt!88630 (select (arr!3574 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179592 (= lt!88617 (addApplyDifferent!124 lt!88616 lt!88620 (minValue!3527 thiss!1248) lt!88630))))

(assert (=> b!179592 (= (apply!148 (+!260 lt!88616 (tuple2!3313 lt!88620 (minValue!3527 thiss!1248))) lt!88630) (apply!148 lt!88616 lt!88630))))

(declare-fun b!179593 () Bool)

(declare-fun e!118290 () Bool)

(assert (=> b!179593 (= e!118290 (validKeyInArray!0 (select (arr!3574 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18138 () Bool)

(declare-fun call!18141 () Bool)

(declare-fun lt!88623 () ListLongMap!2231)

(assert (=> bm!18138 (= call!18141 (contains!1211 lt!88623 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179594 () Bool)

(declare-fun e!118282 () ListLongMap!2231)

(assert (=> b!179594 (= e!118282 call!18145)))

(declare-fun b!179595 () Bool)

(declare-fun e!118291 () Bool)

(assert (=> b!179595 (= e!118291 (not call!18141))))

(declare-fun b!179596 () Bool)

(declare-fun e!118284 () Bool)

(declare-fun e!118287 () Bool)

(assert (=> b!179596 (= e!118284 e!118287)))

(declare-fun res!85051 () Bool)

(assert (=> b!179596 (=> (not res!85051) (not e!118287))))

(assert (=> b!179596 (= res!85051 (contains!1211 lt!88623 (select (arr!3574 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!179596 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3883 (_keys!5574 thiss!1248))))))

(declare-fun b!179597 () Bool)

(declare-fun res!85048 () Bool)

(declare-fun e!118281 () Bool)

(assert (=> b!179597 (=> (not res!85048) (not e!118281))))

(assert (=> b!179597 (= res!85048 e!118288)))

(declare-fun c!32192 () Bool)

(assert (=> b!179597 (= c!32192 (not (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!179598 () Bool)

(declare-fun e!118292 () ListLongMap!2231)

(assert (=> b!179598 (= e!118286 e!118292)))

(declare-fun c!32193 () Bool)

(assert (=> b!179598 (= c!32193 (and (not (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!179599 () Bool)

(declare-fun call!18143 () ListLongMap!2231)

(assert (=> b!179599 (= e!118292 call!18143)))

(declare-fun b!179600 () Bool)

(declare-fun get!2047 (ValueCell!1757 V!5249) V!5249)

(declare-fun dynLambda!482 (Int (_ BitVec 64)) V!5249)

(assert (=> b!179600 (= e!118287 (= (apply!148 lt!88623 (select (arr!3574 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000)) (get!2047 (select (arr!3575 (_values!3669 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!482 (defaultEntry!3686 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!179600 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3884 (_values!3669 thiss!1248))))))

(assert (=> b!179600 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3883 (_keys!5574 thiss!1248))))))

(declare-fun b!179601 () Bool)

(declare-fun e!118283 () Bool)

(assert (=> b!179601 (= e!118283 (= (apply!148 lt!88623 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3527 thiss!1248)))))

(declare-fun b!179602 () Bool)

(assert (=> b!179602 (= e!118288 (not call!18140))))

(declare-fun b!179603 () Bool)

(declare-fun res!85050 () Bool)

(assert (=> b!179603 (=> (not res!85050) (not e!118281))))

(assert (=> b!179603 (= res!85050 e!118284)))

(declare-fun res!85052 () Bool)

(assert (=> b!179603 (=> res!85052 e!118284)))

(assert (=> b!179603 (= res!85052 (not e!118290))))

(declare-fun res!85053 () Bool)

(assert (=> b!179603 (=> (not res!85053) (not e!118290))))

(assert (=> b!179603 (= res!85053 (bvslt #b00000000000000000000000000000000 (size!3883 (_keys!5574 thiss!1248))))))

(declare-fun b!179604 () Bool)

(assert (=> b!179604 (= e!118282 call!18143)))

(declare-fun b!179605 () Bool)

(declare-fun c!32191 () Bool)

(assert (=> b!179605 (= c!32191 (and (not (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!179605 (= e!118292 e!118282)))

(declare-fun b!179606 () Bool)

(assert (=> b!179606 (= e!118289 (= (apply!148 lt!88623 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3527 thiss!1248)))))

(declare-fun b!179607 () Bool)

(assert (=> b!179607 (= e!118281 e!118291)))

(declare-fun c!32196 () Bool)

(assert (=> b!179607 (= c!32196 (not (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18139 () Bool)

(assert (=> bm!18139 (= call!18143 call!18144)))

(declare-fun bm!18140 () Bool)

(assert (=> bm!18140 (= call!18139 (getCurrentListMapNoExtraKeys!169 (_keys!5574 thiss!1248) (_values!3669 thiss!1248) (mask!8671 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)))))

(declare-fun b!179608 () Bool)

(declare-fun Unit!5444 () Unit!5441)

(assert (=> b!179608 (= e!118280 Unit!5444)))

(declare-fun d!54017 () Bool)

(assert (=> d!54017 e!118281))

(declare-fun res!85055 () Bool)

(assert (=> d!54017 (=> (not res!85055) (not e!118281))))

(assert (=> d!54017 (= res!85055 (or (bvsge #b00000000000000000000000000000000 (size!3883 (_keys!5574 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3883 (_keys!5574 thiss!1248))))))))

(declare-fun lt!88632 () ListLongMap!2231)

(assert (=> d!54017 (= lt!88623 lt!88632)))

(declare-fun lt!88635 () Unit!5441)

(assert (=> d!54017 (= lt!88635 e!118280)))

(declare-fun c!32195 () Bool)

(assert (=> d!54017 (= c!32195 e!118285)))

(declare-fun res!85047 () Bool)

(assert (=> d!54017 (=> (not res!85047) (not e!118285))))

(assert (=> d!54017 (= res!85047 (bvslt #b00000000000000000000000000000000 (size!3883 (_keys!5574 thiss!1248))))))

(assert (=> d!54017 (= lt!88632 e!118286)))

(declare-fun c!32194 () Bool)

(assert (=> d!54017 (= c!32194 (and (not (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54017 (validMask!0 (mask!8671 thiss!1248))))

(assert (=> d!54017 (= (getCurrentListMap!767 (_keys!5574 thiss!1248) (_values!3669 thiss!1248) (mask!8671 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)) lt!88623)))

(declare-fun bm!18141 () Bool)

(assert (=> bm!18141 (= call!18144 (+!260 (ite c!32194 call!18139 (ite c!32193 call!18142 call!18145)) (ite (or c!32194 c!32193) (tuple2!3313 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3527 thiss!1248)) (tuple2!3313 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3527 thiss!1248)))))))

(declare-fun bm!18142 () Bool)

(assert (=> bm!18142 (= call!18140 (contains!1211 lt!88623 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179609 () Bool)

(assert (=> b!179609 (= e!118291 e!118283)))

(declare-fun res!85054 () Bool)

(assert (=> b!179609 (= res!85054 call!18141)))

(assert (=> b!179609 (=> (not res!85054) (not e!118283))))

(assert (= (and d!54017 c!32194) b!179590))

(assert (= (and d!54017 (not c!32194)) b!179598))

(assert (= (and b!179598 c!32193) b!179599))

(assert (= (and b!179598 (not c!32193)) b!179605))

(assert (= (and b!179605 c!32191) b!179604))

(assert (= (and b!179605 (not c!32191)) b!179594))

(assert (= (or b!179604 b!179594) bm!18136))

(assert (= (or b!179599 bm!18136) bm!18137))

(assert (= (or b!179599 b!179604) bm!18139))

(assert (= (or b!179590 bm!18137) bm!18140))

(assert (= (or b!179590 bm!18139) bm!18141))

(assert (= (and d!54017 res!85047) b!179591))

(assert (= (and d!54017 c!32195) b!179592))

(assert (= (and d!54017 (not c!32195)) b!179608))

(assert (= (and d!54017 res!85055) b!179603))

(assert (= (and b!179603 res!85053) b!179593))

(assert (= (and b!179603 (not res!85052)) b!179596))

(assert (= (and b!179596 res!85051) b!179600))

(assert (= (and b!179603 res!85050) b!179597))

(assert (= (and b!179597 c!32192) b!179589))

(assert (= (and b!179597 (not c!32192)) b!179602))

(assert (= (and b!179589 res!85049) b!179606))

(assert (= (or b!179589 b!179602) bm!18142))

(assert (= (and b!179597 res!85048) b!179607))

(assert (= (and b!179607 c!32196) b!179609))

(assert (= (and b!179607 (not c!32196)) b!179595))

(assert (= (and b!179609 res!85054) b!179601))

(assert (= (or b!179609 b!179595) bm!18138))

(declare-fun b_lambda!7097 () Bool)

(assert (=> (not b_lambda!7097) (not b!179600)))

(declare-fun t!7117 () Bool)

(declare-fun tb!2799 () Bool)

(assert (=> (and b!179460 (= (defaultEntry!3686 thiss!1248) (defaultEntry!3686 thiss!1248)) t!7117) tb!2799))

(declare-fun result!4687 () Bool)

(assert (=> tb!2799 (= result!4687 tp_is_empty!4201)))

(assert (=> b!179600 t!7117))

(declare-fun b_and!10941 () Bool)

(assert (= b_and!10935 (and (=> t!7117 result!4687) b_and!10941)))

(declare-fun m!207255 () Bool)

(assert (=> bm!18138 m!207255))

(declare-fun m!207257 () Bool)

(assert (=> bm!18140 m!207257))

(declare-fun m!207259 () Bool)

(assert (=> b!179593 m!207259))

(assert (=> b!179593 m!207259))

(declare-fun m!207261 () Bool)

(assert (=> b!179593 m!207261))

(declare-fun m!207263 () Bool)

(assert (=> bm!18142 m!207263))

(assert (=> d!54017 m!207181))

(declare-fun m!207265 () Bool)

(assert (=> bm!18141 m!207265))

(declare-fun m!207267 () Bool)

(assert (=> b!179590 m!207267))

(assert (=> b!179591 m!207259))

(assert (=> b!179591 m!207259))

(assert (=> b!179591 m!207261))

(declare-fun m!207269 () Bool)

(assert (=> b!179592 m!207269))

(declare-fun m!207271 () Bool)

(assert (=> b!179592 m!207271))

(declare-fun m!207273 () Bool)

(assert (=> b!179592 m!207273))

(declare-fun m!207275 () Bool)

(assert (=> b!179592 m!207275))

(declare-fun m!207277 () Bool)

(assert (=> b!179592 m!207277))

(assert (=> b!179592 m!207275))

(declare-fun m!207279 () Bool)

(assert (=> b!179592 m!207279))

(declare-fun m!207281 () Bool)

(assert (=> b!179592 m!207281))

(assert (=> b!179592 m!207259))

(declare-fun m!207283 () Bool)

(assert (=> b!179592 m!207283))

(declare-fun m!207285 () Bool)

(assert (=> b!179592 m!207285))

(declare-fun m!207287 () Bool)

(assert (=> b!179592 m!207287))

(declare-fun m!207289 () Bool)

(assert (=> b!179592 m!207289))

(assert (=> b!179592 m!207281))

(declare-fun m!207291 () Bool)

(assert (=> b!179592 m!207291))

(declare-fun m!207293 () Bool)

(assert (=> b!179592 m!207293))

(declare-fun m!207295 () Bool)

(assert (=> b!179592 m!207295))

(assert (=> b!179592 m!207273))

(declare-fun m!207297 () Bool)

(assert (=> b!179592 m!207297))

(assert (=> b!179592 m!207285))

(assert (=> b!179592 m!207257))

(assert (=> b!179596 m!207259))

(assert (=> b!179596 m!207259))

(declare-fun m!207299 () Bool)

(assert (=> b!179596 m!207299))

(declare-fun m!207301 () Bool)

(assert (=> b!179601 m!207301))

(declare-fun m!207303 () Bool)

(assert (=> b!179606 m!207303))

(declare-fun m!207305 () Bool)

(assert (=> b!179600 m!207305))

(assert (=> b!179600 m!207259))

(declare-fun m!207307 () Bool)

(assert (=> b!179600 m!207307))

(assert (=> b!179600 m!207259))

(declare-fun m!207309 () Bool)

(assert (=> b!179600 m!207309))

(assert (=> b!179600 m!207305))

(declare-fun m!207311 () Bool)

(assert (=> b!179600 m!207311))

(assert (=> b!179600 m!207309))

(assert (=> b!179457 d!54017))

(declare-fun d!54019 () Bool)

(assert (=> d!54019 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!179464 d!54019))

(declare-fun d!54021 () Bool)

(assert (=> d!54021 (= (array_inv!2313 (_keys!5574 thiss!1248)) (bvsge (size!3883 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179460 d!54021))

(declare-fun d!54023 () Bool)

(assert (=> d!54023 (= (array_inv!2314 (_values!3669 thiss!1248)) (bvsge (size!3884 (_values!3669 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179460 d!54023))

(declare-fun d!54025 () Bool)

(declare-fun res!85064 () Bool)

(declare-fun e!118301 () Bool)

(assert (=> d!54025 (=> res!85064 e!118301)))

(assert (=> d!54025 (= res!85064 (bvsge #b00000000000000000000000000000000 (size!3883 (_keys!5574 thiss!1248))))))

(assert (=> d!54025 (= (arrayNoDuplicates!0 (_keys!5574 thiss!1248) #b00000000000000000000000000000000 Nil!2272) e!118301)))

(declare-fun b!179622 () Bool)

(declare-fun e!118303 () Bool)

(declare-fun e!118304 () Bool)

(assert (=> b!179622 (= e!118303 e!118304)))

(declare-fun c!32199 () Bool)

(assert (=> b!179622 (= c!32199 (validKeyInArray!0 (select (arr!3574 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179623 () Bool)

(assert (=> b!179623 (= e!118301 e!118303)))

(declare-fun res!85063 () Bool)

(assert (=> b!179623 (=> (not res!85063) (not e!118303))))

(declare-fun e!118302 () Bool)

(assert (=> b!179623 (= res!85063 (not e!118302))))

(declare-fun res!85062 () Bool)

(assert (=> b!179623 (=> (not res!85062) (not e!118302))))

(assert (=> b!179623 (= res!85062 (validKeyInArray!0 (select (arr!3574 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179624 () Bool)

(declare-fun contains!1213 (List!2275 (_ BitVec 64)) Bool)

(assert (=> b!179624 (= e!118302 (contains!1213 Nil!2272 (select (arr!3574 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18145 () Bool)

(declare-fun call!18148 () Bool)

(assert (=> bm!18145 (= call!18148 (arrayNoDuplicates!0 (_keys!5574 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32199 (Cons!2271 (select (arr!3574 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000) Nil!2272) Nil!2272)))))

(declare-fun b!179625 () Bool)

(assert (=> b!179625 (= e!118304 call!18148)))

(declare-fun b!179626 () Bool)

(assert (=> b!179626 (= e!118304 call!18148)))

(assert (= (and d!54025 (not res!85064)) b!179623))

(assert (= (and b!179623 res!85062) b!179624))

(assert (= (and b!179623 res!85063) b!179622))

(assert (= (and b!179622 c!32199) b!179626))

(assert (= (and b!179622 (not c!32199)) b!179625))

(assert (= (or b!179626 b!179625) bm!18145))

(assert (=> b!179622 m!207259))

(assert (=> b!179622 m!207259))

(assert (=> b!179622 m!207261))

(assert (=> b!179623 m!207259))

(assert (=> b!179623 m!207259))

(assert (=> b!179623 m!207261))

(assert (=> b!179624 m!207259))

(assert (=> b!179624 m!207259))

(declare-fun m!207313 () Bool)

(assert (=> b!179624 m!207313))

(assert (=> bm!18145 m!207259))

(declare-fun m!207315 () Bool)

(assert (=> bm!18145 m!207315))

(assert (=> b!179454 d!54025))

(declare-fun d!54027 () Bool)

(assert (=> d!54027 (= (validMask!0 (mask!8671 thiss!1248)) (and (or (= (mask!8671 thiss!1248) #b00000000000000000000000000000111) (= (mask!8671 thiss!1248) #b00000000000000000000000000001111) (= (mask!8671 thiss!1248) #b00000000000000000000000000011111) (= (mask!8671 thiss!1248) #b00000000000000000000000000111111) (= (mask!8671 thiss!1248) #b00000000000000000000000001111111) (= (mask!8671 thiss!1248) #b00000000000000000000000011111111) (= (mask!8671 thiss!1248) #b00000000000000000000000111111111) (= (mask!8671 thiss!1248) #b00000000000000000000001111111111) (= (mask!8671 thiss!1248) #b00000000000000000000011111111111) (= (mask!8671 thiss!1248) #b00000000000000000000111111111111) (= (mask!8671 thiss!1248) #b00000000000000000001111111111111) (= (mask!8671 thiss!1248) #b00000000000000000011111111111111) (= (mask!8671 thiss!1248) #b00000000000000000111111111111111) (= (mask!8671 thiss!1248) #b00000000000000001111111111111111) (= (mask!8671 thiss!1248) #b00000000000000011111111111111111) (= (mask!8671 thiss!1248) #b00000000000000111111111111111111) (= (mask!8671 thiss!1248) #b00000000000001111111111111111111) (= (mask!8671 thiss!1248) #b00000000000011111111111111111111) (= (mask!8671 thiss!1248) #b00000000000111111111111111111111) (= (mask!8671 thiss!1248) #b00000000001111111111111111111111) (= (mask!8671 thiss!1248) #b00000000011111111111111111111111) (= (mask!8671 thiss!1248) #b00000000111111111111111111111111) (= (mask!8671 thiss!1248) #b00000001111111111111111111111111) (= (mask!8671 thiss!1248) #b00000011111111111111111111111111) (= (mask!8671 thiss!1248) #b00000111111111111111111111111111) (= (mask!8671 thiss!1248) #b00001111111111111111111111111111) (= (mask!8671 thiss!1248) #b00011111111111111111111111111111) (= (mask!8671 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8671 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!179459 d!54027))

(declare-fun d!54029 () Bool)

(declare-fun res!85069 () Bool)

(declare-fun e!118312 () Bool)

(assert (=> d!54029 (=> res!85069 e!118312)))

(assert (=> d!54029 (= res!85069 (bvsge #b00000000000000000000000000000000 (size!3883 (_keys!5574 thiss!1248))))))

(assert (=> d!54029 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5574 thiss!1248) (mask!8671 thiss!1248)) e!118312)))

(declare-fun b!179635 () Bool)

(declare-fun e!118313 () Bool)

(assert (=> b!179635 (= e!118312 e!118313)))

(declare-fun c!32202 () Bool)

(assert (=> b!179635 (= c!32202 (validKeyInArray!0 (select (arr!3574 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179636 () Bool)

(declare-fun e!118311 () Bool)

(declare-fun call!18151 () Bool)

(assert (=> b!179636 (= e!118311 call!18151)))

(declare-fun bm!18148 () Bool)

(assert (=> bm!18148 (= call!18151 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5574 thiss!1248) (mask!8671 thiss!1248)))))

(declare-fun b!179637 () Bool)

(assert (=> b!179637 (= e!118313 call!18151)))

(declare-fun b!179638 () Bool)

(assert (=> b!179638 (= e!118313 e!118311)))

(declare-fun lt!88645 () (_ BitVec 64))

(assert (=> b!179638 (= lt!88645 (select (arr!3574 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88644 () Unit!5441)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7549 (_ BitVec 64) (_ BitVec 32)) Unit!5441)

(assert (=> b!179638 (= lt!88644 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5574 thiss!1248) lt!88645 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!179638 (arrayContainsKey!0 (_keys!5574 thiss!1248) lt!88645 #b00000000000000000000000000000000)))

(declare-fun lt!88643 () Unit!5441)

(assert (=> b!179638 (= lt!88643 lt!88644)))

(declare-fun res!85070 () Bool)

(assert (=> b!179638 (= res!85070 (= (seekEntryOrOpen!0 (select (arr!3574 (_keys!5574 thiss!1248)) #b00000000000000000000000000000000) (_keys!5574 thiss!1248) (mask!8671 thiss!1248)) (Found!592 #b00000000000000000000000000000000)))))

(assert (=> b!179638 (=> (not res!85070) (not e!118311))))

(assert (= (and d!54029 (not res!85069)) b!179635))

(assert (= (and b!179635 c!32202) b!179638))

(assert (= (and b!179635 (not c!32202)) b!179637))

(assert (= (and b!179638 res!85070) b!179636))

(assert (= (or b!179636 b!179637) bm!18148))

(assert (=> b!179635 m!207259))

(assert (=> b!179635 m!207259))

(assert (=> b!179635 m!207261))

(declare-fun m!207317 () Bool)

(assert (=> bm!18148 m!207317))

(assert (=> b!179638 m!207259))

(declare-fun m!207319 () Bool)

(assert (=> b!179638 m!207319))

(declare-fun m!207321 () Bool)

(assert (=> b!179638 m!207321))

(assert (=> b!179638 m!207259))

(declare-fun m!207323 () Bool)

(assert (=> b!179638 m!207323))

(assert (=> b!179463 d!54029))

(declare-fun d!54031 () Bool)

(declare-fun res!85077 () Bool)

(declare-fun e!118316 () Bool)

(assert (=> d!54031 (=> (not res!85077) (not e!118316))))

(declare-fun simpleValid!162 (LongMapFixedSize!2422) Bool)

(assert (=> d!54031 (= res!85077 (simpleValid!162 thiss!1248))))

(assert (=> d!54031 (= (valid!1028 thiss!1248) e!118316)))

(declare-fun b!179645 () Bool)

(declare-fun res!85078 () Bool)

(assert (=> b!179645 (=> (not res!85078) (not e!118316))))

(declare-fun arrayCountValidKeys!0 (array!7549 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!179645 (= res!85078 (= (arrayCountValidKeys!0 (_keys!5574 thiss!1248) #b00000000000000000000000000000000 (size!3883 (_keys!5574 thiss!1248))) (_size!1260 thiss!1248)))))

(declare-fun b!179646 () Bool)

(declare-fun res!85079 () Bool)

(assert (=> b!179646 (=> (not res!85079) (not e!118316))))

(assert (=> b!179646 (= res!85079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5574 thiss!1248) (mask!8671 thiss!1248)))))

(declare-fun b!179647 () Bool)

(assert (=> b!179647 (= e!118316 (arrayNoDuplicates!0 (_keys!5574 thiss!1248) #b00000000000000000000000000000000 Nil!2272))))

(assert (= (and d!54031 res!85077) b!179645))

(assert (= (and b!179645 res!85078) b!179646))

(assert (= (and b!179646 res!85079) b!179647))

(declare-fun m!207325 () Bool)

(assert (=> d!54031 m!207325))

(declare-fun m!207327 () Bool)

(assert (=> b!179645 m!207327))

(assert (=> b!179646 m!207191))

(assert (=> b!179647 m!207199))

(assert (=> start!18042 d!54031))

(declare-fun d!54033 () Bool)

(declare-fun lt!88652 () SeekEntryResult!592)

(assert (=> d!54033 (and (or ((_ is Undefined!592) lt!88652) (not ((_ is Found!592) lt!88652)) (and (bvsge (index!4537 lt!88652) #b00000000000000000000000000000000) (bvslt (index!4537 lt!88652) (size!3883 (_keys!5574 thiss!1248))))) (or ((_ is Undefined!592) lt!88652) ((_ is Found!592) lt!88652) (not ((_ is MissingZero!592) lt!88652)) (and (bvsge (index!4536 lt!88652) #b00000000000000000000000000000000) (bvslt (index!4536 lt!88652) (size!3883 (_keys!5574 thiss!1248))))) (or ((_ is Undefined!592) lt!88652) ((_ is Found!592) lt!88652) ((_ is MissingZero!592) lt!88652) (not ((_ is MissingVacant!592) lt!88652)) (and (bvsge (index!4539 lt!88652) #b00000000000000000000000000000000) (bvslt (index!4539 lt!88652) (size!3883 (_keys!5574 thiss!1248))))) (or ((_ is Undefined!592) lt!88652) (ite ((_ is Found!592) lt!88652) (= (select (arr!3574 (_keys!5574 thiss!1248)) (index!4537 lt!88652)) key!828) (ite ((_ is MissingZero!592) lt!88652) (= (select (arr!3574 (_keys!5574 thiss!1248)) (index!4536 lt!88652)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!592) lt!88652) (= (select (arr!3574 (_keys!5574 thiss!1248)) (index!4539 lt!88652)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!118325 () SeekEntryResult!592)

(assert (=> d!54033 (= lt!88652 e!118325)))

(declare-fun c!32209 () Bool)

(declare-fun lt!88653 () SeekEntryResult!592)

(assert (=> d!54033 (= c!32209 (and ((_ is Intermediate!592) lt!88653) (undefined!1404 lt!88653)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7549 (_ BitVec 32)) SeekEntryResult!592)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54033 (= lt!88653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8671 thiss!1248)) key!828 (_keys!5574 thiss!1248) (mask!8671 thiss!1248)))))

(assert (=> d!54033 (validMask!0 (mask!8671 thiss!1248))))

(assert (=> d!54033 (= (seekEntryOrOpen!0 key!828 (_keys!5574 thiss!1248) (mask!8671 thiss!1248)) lt!88652)))

(declare-fun b!179660 () Bool)

(declare-fun e!118323 () SeekEntryResult!592)

(assert (=> b!179660 (= e!118325 e!118323)))

(declare-fun lt!88654 () (_ BitVec 64))

(assert (=> b!179660 (= lt!88654 (select (arr!3574 (_keys!5574 thiss!1248)) (index!4538 lt!88653)))))

(declare-fun c!32211 () Bool)

(assert (=> b!179660 (= c!32211 (= lt!88654 key!828))))

(declare-fun b!179661 () Bool)

(declare-fun c!32210 () Bool)

(assert (=> b!179661 (= c!32210 (= lt!88654 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118324 () SeekEntryResult!592)

(assert (=> b!179661 (= e!118323 e!118324)))

(declare-fun b!179662 () Bool)

(assert (=> b!179662 (= e!118323 (Found!592 (index!4538 lt!88653)))))

(declare-fun b!179663 () Bool)

(assert (=> b!179663 (= e!118325 Undefined!592)))

(declare-fun b!179664 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7549 (_ BitVec 32)) SeekEntryResult!592)

(assert (=> b!179664 (= e!118324 (seekKeyOrZeroReturnVacant!0 (x!19647 lt!88653) (index!4538 lt!88653) (index!4538 lt!88653) key!828 (_keys!5574 thiss!1248) (mask!8671 thiss!1248)))))

(declare-fun b!179665 () Bool)

(assert (=> b!179665 (= e!118324 (MissingZero!592 (index!4538 lt!88653)))))

(assert (= (and d!54033 c!32209) b!179663))

(assert (= (and d!54033 (not c!32209)) b!179660))

(assert (= (and b!179660 c!32211) b!179662))

(assert (= (and b!179660 (not c!32211)) b!179661))

(assert (= (and b!179661 c!32210) b!179665))

(assert (= (and b!179661 (not c!32210)) b!179664))

(declare-fun m!207329 () Bool)

(assert (=> d!54033 m!207329))

(declare-fun m!207331 () Bool)

(assert (=> d!54033 m!207331))

(declare-fun m!207333 () Bool)

(assert (=> d!54033 m!207333))

(declare-fun m!207335 () Bool)

(assert (=> d!54033 m!207335))

(assert (=> d!54033 m!207331))

(declare-fun m!207337 () Bool)

(assert (=> d!54033 m!207337))

(assert (=> d!54033 m!207181))

(declare-fun m!207339 () Bool)

(assert (=> b!179660 m!207339))

(declare-fun m!207341 () Bool)

(assert (=> b!179664 m!207341))

(assert (=> b!179458 d!54033))

(declare-fun b!179673 () Bool)

(declare-fun e!118331 () Bool)

(assert (=> b!179673 (= e!118331 tp_is_empty!4201)))

(declare-fun b!179672 () Bool)

(declare-fun e!118330 () Bool)

(assert (=> b!179672 (= e!118330 tp_is_empty!4201)))

(declare-fun mapIsEmpty!7201 () Bool)

(declare-fun mapRes!7201 () Bool)

(assert (=> mapIsEmpty!7201 mapRes!7201))

(declare-fun mapNonEmpty!7201 () Bool)

(declare-fun tp!16030 () Bool)

(assert (=> mapNonEmpty!7201 (= mapRes!7201 (and tp!16030 e!118330))))

(declare-fun mapValue!7201 () ValueCell!1757)

(declare-fun mapRest!7201 () (Array (_ BitVec 32) ValueCell!1757))

(declare-fun mapKey!7201 () (_ BitVec 32))

(assert (=> mapNonEmpty!7201 (= mapRest!7192 (store mapRest!7201 mapKey!7201 mapValue!7201))))

(declare-fun condMapEmpty!7201 () Bool)

(declare-fun mapDefault!7201 () ValueCell!1757)

(assert (=> mapNonEmpty!7192 (= condMapEmpty!7201 (= mapRest!7192 ((as const (Array (_ BitVec 32) ValueCell!1757)) mapDefault!7201)))))

(assert (=> mapNonEmpty!7192 (= tp!16015 (and e!118331 mapRes!7201))))

(assert (= (and mapNonEmpty!7192 condMapEmpty!7201) mapIsEmpty!7201))

(assert (= (and mapNonEmpty!7192 (not condMapEmpty!7201)) mapNonEmpty!7201))

(assert (= (and mapNonEmpty!7201 ((_ is ValueCellFull!1757) mapValue!7201)) b!179672))

(assert (= (and mapNonEmpty!7192 ((_ is ValueCellFull!1757) mapDefault!7201)) b!179673))

(declare-fun m!207343 () Bool)

(assert (=> mapNonEmpty!7201 m!207343))

(declare-fun b_lambda!7099 () Bool)

(assert (= b_lambda!7097 (or (and b!179460 b_free!4429) b_lambda!7099)))

(check-sat (not b!179623) (not b!179600) (not bm!18141) (not b!179596) (not d!54017) (not bm!18145) (not d!54031) (not b!179624) (not bm!18140) (not b!179646) (not b!179606) (not b!179664) tp_is_empty!4201 (not bm!18142) (not b!179591) (not b!179593) (not b_lambda!7099) (not b!179590) b_and!10941 (not b!179638) (not d!54015) (not d!54033) (not b!179635) (not b!179544) (not mapNonEmpty!7201) (not bm!18138) (not b!179592) (not bm!18148) (not b!179647) (not b!179546) (not b!179622) (not b!179645) (not b_next!4429) (not b!179601))
(check-sat b_and!10941 (not b_next!4429))
