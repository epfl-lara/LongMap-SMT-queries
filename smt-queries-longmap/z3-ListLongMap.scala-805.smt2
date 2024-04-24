; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19400 () Bool)

(assert start!19400)

(declare-fun b!190696 () Bool)

(declare-fun b_free!4669 () Bool)

(declare-fun b_next!4669 () Bool)

(assert (=> b!190696 (= b_free!4669 (not b_next!4669))))

(declare-fun tp!16849 () Bool)

(declare-fun b_and!11341 () Bool)

(assert (=> b!190696 (= tp!16849 b_and!11341)))

(declare-fun mapIsEmpty!7667 () Bool)

(declare-fun mapRes!7667 () Bool)

(assert (=> mapIsEmpty!7667 mapRes!7667))

(declare-fun b!190692 () Bool)

(declare-fun e!125487 () Bool)

(declare-fun tp_is_empty!4441 () Bool)

(assert (=> b!190692 (= e!125487 tp_is_empty!4441)))

(declare-fun b!190693 () Bool)

(declare-fun e!125481 () Bool)

(declare-fun e!125488 () Bool)

(assert (=> b!190693 (= e!125481 (not e!125488))))

(declare-fun res!90144 () Bool)

(assert (=> b!190693 (=> res!90144 e!125488)))

(declare-datatypes ((V!5569 0))(
  ( (V!5570 (val!2265 Int)) )
))
(declare-datatypes ((ValueCell!1877 0))(
  ( (ValueCellFull!1877 (v!4198 V!5569)) (EmptyCell!1877) )
))
(declare-datatypes ((array!8103 0))(
  ( (array!8104 (arr!3818 (Array (_ BitVec 32) (_ BitVec 64))) (size!4139 (_ BitVec 32))) )
))
(declare-datatypes ((array!8105 0))(
  ( (array!8106 (arr!3819 (Array (_ BitVec 32) ValueCell!1877)) (size!4140 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2662 0))(
  ( (LongMapFixedSize!2663 (defaultEntry!3891 Int) (mask!9098 (_ BitVec 32)) (extraKeys!3628 (_ BitVec 32)) (zeroValue!3732 V!5569) (minValue!3732 V!5569) (_size!1380 (_ BitVec 32)) (_keys!5864 array!8103) (_values!3874 array!8105) (_vacant!1380 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2662)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!190693 (= res!90144 (not (validMask!0 (mask!9098 thiss!1248))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3468 0))(
  ( (tuple2!3469 (_1!1745 (_ BitVec 64)) (_2!1745 V!5569)) )
))
(declare-datatypes ((List!2381 0))(
  ( (Nil!2378) (Cons!2377 (h!3015 tuple2!3468) (t!7283 List!2381)) )
))
(declare-datatypes ((ListLongMap!2389 0))(
  ( (ListLongMap!2390 (toList!1210 List!2381)) )
))
(declare-fun lt!94596 () ListLongMap!2389)

(declare-fun v!309 () V!5569)

(declare-datatypes ((SeekEntryResult!663 0))(
  ( (MissingZero!663 (index!4822 (_ BitVec 32))) (Found!663 (index!4823 (_ BitVec 32))) (Intermediate!663 (undefined!1475 Bool) (index!4824 (_ BitVec 32)) (x!20491 (_ BitVec 32))) (Undefined!663) (MissingVacant!663 (index!4825 (_ BitVec 32))) )
))
(declare-fun lt!94594 () SeekEntryResult!663)

(declare-fun +!303 (ListLongMap!2389 tuple2!3468) ListLongMap!2389)

(declare-fun getCurrentListMap!862 (array!8103 array!8105 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 32) Int) ListLongMap!2389)

(assert (=> b!190693 (= (+!303 lt!94596 (tuple2!3469 key!828 v!309)) (getCurrentListMap!862 (_keys!5864 thiss!1248) (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248))) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-datatypes ((Unit!5753 0))(
  ( (Unit!5754) )
))
(declare-fun lt!94592 () Unit!5753)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!107 (array!8103 array!8105 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 32) (_ BitVec 64) V!5569 Int) Unit!5753)

(assert (=> b!190693 (= lt!94592 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!107 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (index!4823 lt!94594) key!828 v!309 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94591 () Unit!5753)

(declare-fun e!125489 () Unit!5753)

(assert (=> b!190693 (= lt!94591 e!125489)))

(declare-fun c!34302 () Bool)

(declare-fun contains!1333 (ListLongMap!2389 (_ BitVec 64)) Bool)

(assert (=> b!190693 (= c!34302 (contains!1333 lt!94596 key!828))))

(assert (=> b!190693 (= lt!94596 (getCurrentListMap!862 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun b!190694 () Bool)

(assert (=> b!190694 (= e!125488 (or (not (= (size!4140 (_values!3874 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9098 thiss!1248)))) (= (size!4139 (_keys!5864 thiss!1248)) (size!4140 (_values!3874 thiss!1248)))))))

(declare-fun b!190695 () Bool)

(declare-fun lt!94593 () Unit!5753)

(assert (=> b!190695 (= e!125489 lt!94593)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!171 (array!8103 array!8105 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 64) Int) Unit!5753)

(assert (=> b!190695 (= lt!94593 (lemmaInListMapThenSeekEntryOrOpenFindsIt!171 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)))))

(declare-fun res!90141 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!190695 (= res!90141 (inRange!0 (index!4823 lt!94594) (mask!9098 thiss!1248)))))

(declare-fun e!125486 () Bool)

(assert (=> b!190695 (=> (not res!90141) (not e!125486))))

(assert (=> b!190695 e!125486))

(declare-fun mapNonEmpty!7667 () Bool)

(declare-fun tp!16850 () Bool)

(assert (=> mapNonEmpty!7667 (= mapRes!7667 (and tp!16850 e!125487))))

(declare-fun mapRest!7667 () (Array (_ BitVec 32) ValueCell!1877))

(declare-fun mapKey!7667 () (_ BitVec 32))

(declare-fun mapValue!7667 () ValueCell!1877)

(assert (=> mapNonEmpty!7667 (= (arr!3819 (_values!3874 thiss!1248)) (store mapRest!7667 mapKey!7667 mapValue!7667))))

(declare-fun e!125485 () Bool)

(declare-fun e!125480 () Bool)

(declare-fun array_inv!2461 (array!8103) Bool)

(declare-fun array_inv!2462 (array!8105) Bool)

(assert (=> b!190696 (= e!125480 (and tp!16849 tp_is_empty!4441 (array_inv!2461 (_keys!5864 thiss!1248)) (array_inv!2462 (_values!3874 thiss!1248)) e!125485))))

(declare-fun b!190697 () Bool)

(declare-fun e!125482 () Bool)

(assert (=> b!190697 (= e!125482 tp_is_empty!4441)))

(declare-fun b!190699 () Bool)

(declare-fun e!125483 () Bool)

(assert (=> b!190699 (= e!125483 e!125481)))

(declare-fun res!90143 () Bool)

(assert (=> b!190699 (=> (not res!90143) (not e!125481))))

(get-info :version)

(assert (=> b!190699 (= res!90143 (and (not ((_ is Undefined!663) lt!94594)) (not ((_ is MissingVacant!663) lt!94594)) (not ((_ is MissingZero!663) lt!94594)) ((_ is Found!663) lt!94594)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8103 (_ BitVec 32)) SeekEntryResult!663)

(assert (=> b!190699 (= lt!94594 (seekEntryOrOpen!0 key!828 (_keys!5864 thiss!1248) (mask!9098 thiss!1248)))))

(declare-fun b!190698 () Bool)

(declare-fun Unit!5755 () Unit!5753)

(assert (=> b!190698 (= e!125489 Unit!5755)))

(declare-fun lt!94595 () Unit!5753)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!166 (array!8103 array!8105 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 64) Int) Unit!5753)

(assert (=> b!190698 (= lt!94595 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!166 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)))))

(assert (=> b!190698 false))

(declare-fun res!90142 () Bool)

(assert (=> start!19400 (=> (not res!90142) (not e!125483))))

(declare-fun valid!1118 (LongMapFixedSize!2662) Bool)

(assert (=> start!19400 (= res!90142 (valid!1118 thiss!1248))))

(assert (=> start!19400 e!125483))

(assert (=> start!19400 e!125480))

(assert (=> start!19400 true))

(assert (=> start!19400 tp_is_empty!4441))

(declare-fun b!190700 () Bool)

(declare-fun res!90145 () Bool)

(assert (=> b!190700 (=> (not res!90145) (not e!125483))))

(assert (=> b!190700 (= res!90145 (not (= key!828 (bvneg key!828))))))

(declare-fun b!190701 () Bool)

(assert (=> b!190701 (= e!125486 (= (select (arr!3818 (_keys!5864 thiss!1248)) (index!4823 lt!94594)) key!828))))

(declare-fun b!190702 () Bool)

(assert (=> b!190702 (= e!125485 (and e!125482 mapRes!7667))))

(declare-fun condMapEmpty!7667 () Bool)

(declare-fun mapDefault!7667 () ValueCell!1877)

(assert (=> b!190702 (= condMapEmpty!7667 (= (arr!3819 (_values!3874 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1877)) mapDefault!7667)))))

(assert (= (and start!19400 res!90142) b!190700))

(assert (= (and b!190700 res!90145) b!190699))

(assert (= (and b!190699 res!90143) b!190693))

(assert (= (and b!190693 c!34302) b!190695))

(assert (= (and b!190693 (not c!34302)) b!190698))

(assert (= (and b!190695 res!90141) b!190701))

(assert (= (and b!190693 (not res!90144)) b!190694))

(assert (= (and b!190702 condMapEmpty!7667) mapIsEmpty!7667))

(assert (= (and b!190702 (not condMapEmpty!7667)) mapNonEmpty!7667))

(assert (= (and mapNonEmpty!7667 ((_ is ValueCellFull!1877) mapValue!7667)) b!190692))

(assert (= (and b!190702 ((_ is ValueCellFull!1877) mapDefault!7667)) b!190697))

(assert (= b!190696 b!190702))

(assert (= start!19400 b!190696))

(declare-fun m!217279 () Bool)

(assert (=> b!190699 m!217279))

(declare-fun m!217281 () Bool)

(assert (=> start!19400 m!217281))

(declare-fun m!217283 () Bool)

(assert (=> b!190695 m!217283))

(declare-fun m!217285 () Bool)

(assert (=> b!190695 m!217285))

(declare-fun m!217287 () Bool)

(assert (=> b!190698 m!217287))

(declare-fun m!217289 () Bool)

(assert (=> b!190696 m!217289))

(declare-fun m!217291 () Bool)

(assert (=> b!190696 m!217291))

(declare-fun m!217293 () Bool)

(assert (=> mapNonEmpty!7667 m!217293))

(declare-fun m!217295 () Bool)

(assert (=> b!190701 m!217295))

(declare-fun m!217297 () Bool)

(assert (=> b!190693 m!217297))

(declare-fun m!217299 () Bool)

(assert (=> b!190693 m!217299))

(declare-fun m!217301 () Bool)

(assert (=> b!190693 m!217301))

(declare-fun m!217303 () Bool)

(assert (=> b!190693 m!217303))

(declare-fun m!217305 () Bool)

(assert (=> b!190693 m!217305))

(declare-fun m!217307 () Bool)

(assert (=> b!190693 m!217307))

(declare-fun m!217309 () Bool)

(assert (=> b!190693 m!217309))

(check-sat (not start!19400) (not mapNonEmpty!7667) tp_is_empty!4441 (not b!190696) (not b!190698) (not b_next!4669) (not b!190695) b_and!11341 (not b!190699) (not b!190693))
(check-sat b_and!11341 (not b_next!4669))
(get-model)

(declare-fun bm!19222 () Bool)

(declare-fun call!19226 () Bool)

(declare-fun arrayContainsKey!0 (array!8103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19222 (= call!19226 (arrayContainsKey!0 (_keys!5864 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun d!56023 () Bool)

(declare-fun e!125560 () Bool)

(assert (=> d!56023 e!125560))

(declare-fun c!34314 () Bool)

(declare-fun lt!94637 () SeekEntryResult!663)

(assert (=> d!56023 (= c!34314 ((_ is MissingZero!663) lt!94637))))

(assert (=> d!56023 (= lt!94637 (seekEntryOrOpen!0 key!828 (_keys!5864 thiss!1248) (mask!9098 thiss!1248)))))

(declare-fun lt!94638 () Unit!5753)

(declare-fun choose!1034 (array!8103 array!8105 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 64) Int) Unit!5753)

(assert (=> d!56023 (= lt!94638 (choose!1034 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)))))

(assert (=> d!56023 (validMask!0 (mask!9098 thiss!1248))))

(assert (=> d!56023 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!166 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)) lt!94638)))

(declare-fun b!190785 () Bool)

(declare-fun e!125559 () Bool)

(assert (=> b!190785 (= e!125559 ((_ is Undefined!663) lt!94637))))

(declare-fun b!190786 () Bool)

(assert (=> b!190786 (= e!125560 e!125559)))

(declare-fun c!34313 () Bool)

(assert (=> b!190786 (= c!34313 ((_ is MissingVacant!663) lt!94637))))

(declare-fun b!190787 () Bool)

(declare-fun res!90186 () Bool)

(declare-fun e!125558 () Bool)

(assert (=> b!190787 (=> (not res!90186) (not e!125558))))

(declare-fun call!19225 () Bool)

(assert (=> b!190787 (= res!90186 call!19225)))

(assert (=> b!190787 (= e!125559 e!125558)))

(declare-fun b!190788 () Bool)

(assert (=> b!190788 (= e!125558 (not call!19226))))

(declare-fun b!190789 () Bool)

(declare-fun e!125561 () Bool)

(assert (=> b!190789 (= e!125560 e!125561)))

(declare-fun res!90184 () Bool)

(assert (=> b!190789 (= res!90184 call!19225)))

(assert (=> b!190789 (=> (not res!90184) (not e!125561))))

(declare-fun b!190790 () Bool)

(assert (=> b!190790 (and (bvsge (index!4822 lt!94637) #b00000000000000000000000000000000) (bvslt (index!4822 lt!94637) (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun res!90187 () Bool)

(assert (=> b!190790 (= res!90187 (= (select (arr!3818 (_keys!5864 thiss!1248)) (index!4822 lt!94637)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190790 (=> (not res!90187) (not e!125561))))

(declare-fun b!190791 () Bool)

(declare-fun res!90185 () Bool)

(assert (=> b!190791 (=> (not res!90185) (not e!125558))))

(assert (=> b!190791 (= res!90185 (= (select (arr!3818 (_keys!5864 thiss!1248)) (index!4825 lt!94637)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190791 (and (bvsge (index!4825 lt!94637) #b00000000000000000000000000000000) (bvslt (index!4825 lt!94637) (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun bm!19223 () Bool)

(assert (=> bm!19223 (= call!19225 (inRange!0 (ite c!34314 (index!4822 lt!94637) (index!4825 lt!94637)) (mask!9098 thiss!1248)))))

(declare-fun b!190792 () Bool)

(assert (=> b!190792 (= e!125561 (not call!19226))))

(assert (= (and d!56023 c!34314) b!190789))

(assert (= (and d!56023 (not c!34314)) b!190786))

(assert (= (and b!190789 res!90184) b!190790))

(assert (= (and b!190790 res!90187) b!190792))

(assert (= (and b!190786 c!34313) b!190787))

(assert (= (and b!190786 (not c!34313)) b!190785))

(assert (= (and b!190787 res!90186) b!190791))

(assert (= (and b!190791 res!90185) b!190788))

(assert (= (or b!190789 b!190787) bm!19223))

(assert (= (or b!190792 b!190788) bm!19222))

(declare-fun m!217375 () Bool)

(assert (=> b!190791 m!217375))

(declare-fun m!217377 () Bool)

(assert (=> bm!19223 m!217377))

(declare-fun m!217379 () Bool)

(assert (=> b!190790 m!217379))

(declare-fun m!217381 () Bool)

(assert (=> bm!19222 m!217381))

(assert (=> d!56023 m!217279))

(declare-fun m!217383 () Bool)

(assert (=> d!56023 m!217383))

(assert (=> d!56023 m!217307))

(assert (=> b!190698 d!56023))

(declare-fun d!56025 () Bool)

(declare-fun e!125564 () Bool)

(assert (=> d!56025 e!125564))

(declare-fun res!90193 () Bool)

(assert (=> d!56025 (=> (not res!90193) (not e!125564))))

(declare-fun lt!94650 () ListLongMap!2389)

(assert (=> d!56025 (= res!90193 (contains!1333 lt!94650 (_1!1745 (tuple2!3469 key!828 v!309))))))

(declare-fun lt!94648 () List!2381)

(assert (=> d!56025 (= lt!94650 (ListLongMap!2390 lt!94648))))

(declare-fun lt!94649 () Unit!5753)

(declare-fun lt!94647 () Unit!5753)

(assert (=> d!56025 (= lt!94649 lt!94647)))

(declare-datatypes ((Option!244 0))(
  ( (Some!243 (v!4203 V!5569)) (None!242) )
))
(declare-fun getValueByKey!238 (List!2381 (_ BitVec 64)) Option!244)

(assert (=> d!56025 (= (getValueByKey!238 lt!94648 (_1!1745 (tuple2!3469 key!828 v!309))) (Some!243 (_2!1745 (tuple2!3469 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!125 (List!2381 (_ BitVec 64) V!5569) Unit!5753)

(assert (=> d!56025 (= lt!94647 (lemmaContainsTupThenGetReturnValue!125 lt!94648 (_1!1745 (tuple2!3469 key!828 v!309)) (_2!1745 (tuple2!3469 key!828 v!309))))))

(declare-fun insertStrictlySorted!128 (List!2381 (_ BitVec 64) V!5569) List!2381)

(assert (=> d!56025 (= lt!94648 (insertStrictlySorted!128 (toList!1210 lt!94596) (_1!1745 (tuple2!3469 key!828 v!309)) (_2!1745 (tuple2!3469 key!828 v!309))))))

(assert (=> d!56025 (= (+!303 lt!94596 (tuple2!3469 key!828 v!309)) lt!94650)))

(declare-fun b!190797 () Bool)

(declare-fun res!90192 () Bool)

(assert (=> b!190797 (=> (not res!90192) (not e!125564))))

(assert (=> b!190797 (= res!90192 (= (getValueByKey!238 (toList!1210 lt!94650) (_1!1745 (tuple2!3469 key!828 v!309))) (Some!243 (_2!1745 (tuple2!3469 key!828 v!309)))))))

(declare-fun b!190798 () Bool)

(declare-fun contains!1336 (List!2381 tuple2!3468) Bool)

(assert (=> b!190798 (= e!125564 (contains!1336 (toList!1210 lt!94650) (tuple2!3469 key!828 v!309)))))

(assert (= (and d!56025 res!90193) b!190797))

(assert (= (and b!190797 res!90192) b!190798))

(declare-fun m!217385 () Bool)

(assert (=> d!56025 m!217385))

(declare-fun m!217387 () Bool)

(assert (=> d!56025 m!217387))

(declare-fun m!217389 () Bool)

(assert (=> d!56025 m!217389))

(declare-fun m!217391 () Bool)

(assert (=> d!56025 m!217391))

(declare-fun m!217393 () Bool)

(assert (=> b!190797 m!217393))

(declare-fun m!217395 () Bool)

(assert (=> b!190798 m!217395))

(assert (=> b!190693 d!56025))

(declare-fun d!56027 () Bool)

(declare-fun e!125567 () Bool)

(assert (=> d!56027 e!125567))

(declare-fun res!90196 () Bool)

(assert (=> d!56027 (=> (not res!90196) (not e!125567))))

(assert (=> d!56027 (= res!90196 (and (bvsge (index!4823 lt!94594) #b00000000000000000000000000000000) (bvslt (index!4823 lt!94594) (size!4140 (_values!3874 thiss!1248)))))))

(declare-fun lt!94653 () Unit!5753)

(declare-fun choose!1035 (array!8103 array!8105 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 32) (_ BitVec 64) V!5569 Int) Unit!5753)

(assert (=> d!56027 (= lt!94653 (choose!1035 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (index!4823 lt!94594) key!828 v!309 (defaultEntry!3891 thiss!1248)))))

(assert (=> d!56027 (validMask!0 (mask!9098 thiss!1248))))

(assert (=> d!56027 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!107 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (index!4823 lt!94594) key!828 v!309 (defaultEntry!3891 thiss!1248)) lt!94653)))

(declare-fun b!190801 () Bool)

(assert (=> b!190801 (= e!125567 (= (+!303 (getCurrentListMap!862 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)) (tuple2!3469 key!828 v!309)) (getCurrentListMap!862 (_keys!5864 thiss!1248) (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248))) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248))))))

(assert (= (and d!56027 res!90196) b!190801))

(declare-fun m!217397 () Bool)

(assert (=> d!56027 m!217397))

(assert (=> d!56027 m!217307))

(assert (=> b!190801 m!217297))

(assert (=> b!190801 m!217297))

(declare-fun m!217399 () Bool)

(assert (=> b!190801 m!217399))

(assert (=> b!190801 m!217309))

(assert (=> b!190801 m!217301))

(assert (=> b!190693 d!56027))

(declare-fun d!56029 () Bool)

(assert (=> d!56029 (= (validMask!0 (mask!9098 thiss!1248)) (and (or (= (mask!9098 thiss!1248) #b00000000000000000000000000000111) (= (mask!9098 thiss!1248) #b00000000000000000000000000001111) (= (mask!9098 thiss!1248) #b00000000000000000000000000011111) (= (mask!9098 thiss!1248) #b00000000000000000000000000111111) (= (mask!9098 thiss!1248) #b00000000000000000000000001111111) (= (mask!9098 thiss!1248) #b00000000000000000000000011111111) (= (mask!9098 thiss!1248) #b00000000000000000000000111111111) (= (mask!9098 thiss!1248) #b00000000000000000000001111111111) (= (mask!9098 thiss!1248) #b00000000000000000000011111111111) (= (mask!9098 thiss!1248) #b00000000000000000000111111111111) (= (mask!9098 thiss!1248) #b00000000000000000001111111111111) (= (mask!9098 thiss!1248) #b00000000000000000011111111111111) (= (mask!9098 thiss!1248) #b00000000000000000111111111111111) (= (mask!9098 thiss!1248) #b00000000000000001111111111111111) (= (mask!9098 thiss!1248) #b00000000000000011111111111111111) (= (mask!9098 thiss!1248) #b00000000000000111111111111111111) (= (mask!9098 thiss!1248) #b00000000000001111111111111111111) (= (mask!9098 thiss!1248) #b00000000000011111111111111111111) (= (mask!9098 thiss!1248) #b00000000000111111111111111111111) (= (mask!9098 thiss!1248) #b00000000001111111111111111111111) (= (mask!9098 thiss!1248) #b00000000011111111111111111111111) (= (mask!9098 thiss!1248) #b00000000111111111111111111111111) (= (mask!9098 thiss!1248) #b00000001111111111111111111111111) (= (mask!9098 thiss!1248) #b00000011111111111111111111111111) (= (mask!9098 thiss!1248) #b00000111111111111111111111111111) (= (mask!9098 thiss!1248) #b00001111111111111111111111111111) (= (mask!9098 thiss!1248) #b00011111111111111111111111111111) (= (mask!9098 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9098 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!190693 d!56029))

(declare-fun d!56031 () Bool)

(declare-fun e!125573 () Bool)

(assert (=> d!56031 e!125573))

(declare-fun res!90199 () Bool)

(assert (=> d!56031 (=> res!90199 e!125573)))

(declare-fun lt!94665 () Bool)

(assert (=> d!56031 (= res!90199 (not lt!94665))))

(declare-fun lt!94664 () Bool)

(assert (=> d!56031 (= lt!94665 lt!94664)))

(declare-fun lt!94662 () Unit!5753)

(declare-fun e!125572 () Unit!5753)

(assert (=> d!56031 (= lt!94662 e!125572)))

(declare-fun c!34317 () Bool)

(assert (=> d!56031 (= c!34317 lt!94664)))

(declare-fun containsKey!241 (List!2381 (_ BitVec 64)) Bool)

(assert (=> d!56031 (= lt!94664 (containsKey!241 (toList!1210 lt!94596) key!828))))

(assert (=> d!56031 (= (contains!1333 lt!94596 key!828) lt!94665)))

(declare-fun b!190808 () Bool)

(declare-fun lt!94663 () Unit!5753)

(assert (=> b!190808 (= e!125572 lt!94663)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!189 (List!2381 (_ BitVec 64)) Unit!5753)

(assert (=> b!190808 (= lt!94663 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1210 lt!94596) key!828))))

(declare-fun isDefined!190 (Option!244) Bool)

(assert (=> b!190808 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94596) key!828))))

(declare-fun b!190809 () Bool)

(declare-fun Unit!5761 () Unit!5753)

(assert (=> b!190809 (= e!125572 Unit!5761)))

(declare-fun b!190810 () Bool)

(assert (=> b!190810 (= e!125573 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94596) key!828)))))

(assert (= (and d!56031 c!34317) b!190808))

(assert (= (and d!56031 (not c!34317)) b!190809))

(assert (= (and d!56031 (not res!90199)) b!190810))

(declare-fun m!217401 () Bool)

(assert (=> d!56031 m!217401))

(declare-fun m!217403 () Bool)

(assert (=> b!190808 m!217403))

(declare-fun m!217405 () Bool)

(assert (=> b!190808 m!217405))

(assert (=> b!190808 m!217405))

(declare-fun m!217407 () Bool)

(assert (=> b!190808 m!217407))

(assert (=> b!190810 m!217405))

(assert (=> b!190810 m!217405))

(assert (=> b!190810 m!217407))

(assert (=> b!190693 d!56031))

(declare-fun call!19243 () ListLongMap!2389)

(declare-fun call!19246 () ListLongMap!2389)

(declare-fun call!19247 () ListLongMap!2389)

(declare-fun call!19244 () ListLongMap!2389)

(declare-fun c!34330 () Bool)

(declare-fun bm!19238 () Bool)

(declare-fun c!34332 () Bool)

(assert (=> bm!19238 (= call!19244 (+!303 (ite c!34332 call!19246 (ite c!34330 call!19243 call!19247)) (ite (or c!34332 c!34330) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(declare-fun b!190853 () Bool)

(declare-fun e!125607 () ListLongMap!2389)

(declare-fun call!19241 () ListLongMap!2389)

(assert (=> b!190853 (= e!125607 call!19241)))

(declare-fun b!190854 () Bool)

(declare-fun e!125611 () Bool)

(declare-fun lt!94722 () ListLongMap!2389)

(declare-fun apply!180 (ListLongMap!2389 (_ BitVec 64)) V!5569)

(assert (=> b!190854 (= e!125611 (= (apply!180 lt!94722 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3732 thiss!1248)))))

(declare-fun b!190855 () Bool)

(declare-fun e!125601 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!190855 (= e!125601 (validKeyInArray!0 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19239 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!211 (array!8103 array!8105 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 32) Int) ListLongMap!2389)

(assert (=> bm!19239 (= call!19246 (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248))) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun bm!19240 () Bool)

(declare-fun call!19245 () Bool)

(assert (=> bm!19240 (= call!19245 (contains!1333 lt!94722 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190857 () Bool)

(declare-fun e!125600 () Bool)

(assert (=> b!190857 (= e!125600 e!125611)))

(declare-fun res!90224 () Bool)

(assert (=> b!190857 (= res!90224 call!19245)))

(assert (=> b!190857 (=> (not res!90224) (not e!125611))))

(declare-fun b!190858 () Bool)

(declare-fun e!125610 () ListLongMap!2389)

(assert (=> b!190858 (= e!125610 call!19241)))

(declare-fun b!190859 () Bool)

(declare-fun res!90225 () Bool)

(declare-fun e!125612 () Bool)

(assert (=> b!190859 (=> (not res!90225) (not e!125612))))

(declare-fun e!125606 () Bool)

(assert (=> b!190859 (= res!90225 e!125606)))

(declare-fun res!90222 () Bool)

(assert (=> b!190859 (=> res!90222 e!125606)))

(declare-fun e!125609 () Bool)

(assert (=> b!190859 (= res!90222 (not e!125609))))

(declare-fun res!90223 () Bool)

(assert (=> b!190859 (=> (not res!90223) (not e!125609))))

(assert (=> b!190859 (= res!90223 (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun b!190860 () Bool)

(declare-fun e!125608 () Bool)

(assert (=> b!190860 (= e!125608 (= (apply!180 lt!94722 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3732 thiss!1248)))))

(declare-fun b!190861 () Bool)

(declare-fun e!125603 () Bool)

(assert (=> b!190861 (= e!125606 e!125603)))

(declare-fun res!90219 () Bool)

(assert (=> b!190861 (=> (not res!90219) (not e!125603))))

(assert (=> b!190861 (= res!90219 (contains!1333 lt!94722 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190861 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun b!190862 () Bool)

(declare-fun e!125604 () Bool)

(declare-fun call!19242 () Bool)

(assert (=> b!190862 (= e!125604 (not call!19242))))

(declare-fun b!190863 () Bool)

(declare-fun e!125602 () ListLongMap!2389)

(assert (=> b!190863 (= e!125602 (+!303 call!19244 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))

(declare-fun b!190864 () Bool)

(declare-fun e!125605 () Unit!5753)

(declare-fun lt!94712 () Unit!5753)

(assert (=> b!190864 (= e!125605 lt!94712)))

(declare-fun lt!94714 () ListLongMap!2389)

(assert (=> b!190864 (= lt!94714 (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248))) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94710 () (_ BitVec 64))

(assert (=> b!190864 (= lt!94710 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94719 () (_ BitVec 64))

(assert (=> b!190864 (= lt!94719 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94725 () Unit!5753)

(declare-fun addStillContains!156 (ListLongMap!2389 (_ BitVec 64) V!5569 (_ BitVec 64)) Unit!5753)

(assert (=> b!190864 (= lt!94725 (addStillContains!156 lt!94714 lt!94710 (zeroValue!3732 thiss!1248) lt!94719))))

(assert (=> b!190864 (contains!1333 (+!303 lt!94714 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248))) lt!94719)))

(declare-fun lt!94724 () Unit!5753)

(assert (=> b!190864 (= lt!94724 lt!94725)))

(declare-fun lt!94721 () ListLongMap!2389)

(assert (=> b!190864 (= lt!94721 (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248))) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94716 () (_ BitVec 64))

(assert (=> b!190864 (= lt!94716 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94723 () (_ BitVec 64))

(assert (=> b!190864 (= lt!94723 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94715 () Unit!5753)

(declare-fun addApplyDifferent!156 (ListLongMap!2389 (_ BitVec 64) V!5569 (_ BitVec 64)) Unit!5753)

(assert (=> b!190864 (= lt!94715 (addApplyDifferent!156 lt!94721 lt!94716 (minValue!3732 thiss!1248) lt!94723))))

(assert (=> b!190864 (= (apply!180 (+!303 lt!94721 (tuple2!3469 lt!94716 (minValue!3732 thiss!1248))) lt!94723) (apply!180 lt!94721 lt!94723))))

(declare-fun lt!94717 () Unit!5753)

(assert (=> b!190864 (= lt!94717 lt!94715)))

(declare-fun lt!94728 () ListLongMap!2389)

(assert (=> b!190864 (= lt!94728 (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248))) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94730 () (_ BitVec 64))

(assert (=> b!190864 (= lt!94730 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94729 () (_ BitVec 64))

(assert (=> b!190864 (= lt!94729 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94731 () Unit!5753)

(assert (=> b!190864 (= lt!94731 (addApplyDifferent!156 lt!94728 lt!94730 (zeroValue!3732 thiss!1248) lt!94729))))

(assert (=> b!190864 (= (apply!180 (+!303 lt!94728 (tuple2!3469 lt!94730 (zeroValue!3732 thiss!1248))) lt!94729) (apply!180 lt!94728 lt!94729))))

(declare-fun lt!94711 () Unit!5753)

(assert (=> b!190864 (= lt!94711 lt!94731)))

(declare-fun lt!94727 () ListLongMap!2389)

(assert (=> b!190864 (= lt!94727 (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248))) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94713 () (_ BitVec 64))

(assert (=> b!190864 (= lt!94713 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94720 () (_ BitVec 64))

(assert (=> b!190864 (= lt!94720 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190864 (= lt!94712 (addApplyDifferent!156 lt!94727 lt!94713 (minValue!3732 thiss!1248) lt!94720))))

(assert (=> b!190864 (= (apply!180 (+!303 lt!94727 (tuple2!3469 lt!94713 (minValue!3732 thiss!1248))) lt!94720) (apply!180 lt!94727 lt!94720))))

(declare-fun b!190865 () Bool)

(assert (=> b!190865 (= e!125604 e!125608)))

(declare-fun res!90220 () Bool)

(assert (=> b!190865 (= res!90220 call!19242)))

(assert (=> b!190865 (=> (not res!90220) (not e!125608))))

(declare-fun bm!19241 () Bool)

(assert (=> bm!19241 (= call!19247 call!19243)))

(declare-fun b!190866 () Bool)

(declare-fun res!90226 () Bool)

(assert (=> b!190866 (=> (not res!90226) (not e!125612))))

(assert (=> b!190866 (= res!90226 e!125600)))

(declare-fun c!34333 () Bool)

(assert (=> b!190866 (= c!34333 (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!190867 () Bool)

(assert (=> b!190867 (= e!125600 (not call!19245))))

(declare-fun b!190868 () Bool)

(assert (=> b!190868 (= e!125612 e!125604)))

(declare-fun c!34335 () Bool)

(assert (=> b!190868 (= c!34335 (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190856 () Bool)

(declare-fun get!2210 (ValueCell!1877 V!5569) V!5569)

(declare-fun dynLambda!523 (Int (_ BitVec 64)) V!5569)

(assert (=> b!190856 (= e!125603 (= (apply!180 lt!94722 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)) (get!2210 (select (arr!3819 (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190856 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4140 (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248))))))))

(assert (=> b!190856 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun d!56033 () Bool)

(assert (=> d!56033 e!125612))

(declare-fun res!90218 () Bool)

(assert (=> d!56033 (=> (not res!90218) (not e!125612))))

(assert (=> d!56033 (= res!90218 (or (bvsge #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))))

(declare-fun lt!94726 () ListLongMap!2389)

(assert (=> d!56033 (= lt!94722 lt!94726)))

(declare-fun lt!94718 () Unit!5753)

(assert (=> d!56033 (= lt!94718 e!125605)))

(declare-fun c!34334 () Bool)

(assert (=> d!56033 (= c!34334 e!125601)))

(declare-fun res!90221 () Bool)

(assert (=> d!56033 (=> (not res!90221) (not e!125601))))

(assert (=> d!56033 (= res!90221 (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(assert (=> d!56033 (= lt!94726 e!125602)))

(assert (=> d!56033 (= c!34332 (and (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56033 (validMask!0 (mask!9098 thiss!1248))))

(assert (=> d!56033 (= (getCurrentListMap!862 (_keys!5864 thiss!1248) (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248))) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)) lt!94722)))

(declare-fun b!190869 () Bool)

(assert (=> b!190869 (= e!125609 (validKeyInArray!0 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190870 () Bool)

(assert (=> b!190870 (= e!125602 e!125610)))

(assert (=> b!190870 (= c!34330 (and (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190871 () Bool)

(declare-fun Unit!5762 () Unit!5753)

(assert (=> b!190871 (= e!125605 Unit!5762)))

(declare-fun b!190872 () Bool)

(assert (=> b!190872 (= e!125607 call!19247)))

(declare-fun bm!19242 () Bool)

(assert (=> bm!19242 (= call!19241 call!19244)))

(declare-fun bm!19243 () Bool)

(assert (=> bm!19243 (= call!19242 (contains!1333 lt!94722 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190873 () Bool)

(declare-fun c!34331 () Bool)

(assert (=> b!190873 (= c!34331 (and (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!190873 (= e!125610 e!125607)))

(declare-fun bm!19244 () Bool)

(assert (=> bm!19244 (= call!19243 call!19246)))

(assert (= (and d!56033 c!34332) b!190863))

(assert (= (and d!56033 (not c!34332)) b!190870))

(assert (= (and b!190870 c!34330) b!190858))

(assert (= (and b!190870 (not c!34330)) b!190873))

(assert (= (and b!190873 c!34331) b!190853))

(assert (= (and b!190873 (not c!34331)) b!190872))

(assert (= (or b!190853 b!190872) bm!19241))

(assert (= (or b!190858 bm!19241) bm!19244))

(assert (= (or b!190858 b!190853) bm!19242))

(assert (= (or b!190863 bm!19244) bm!19239))

(assert (= (or b!190863 bm!19242) bm!19238))

(assert (= (and d!56033 res!90221) b!190855))

(assert (= (and d!56033 c!34334) b!190864))

(assert (= (and d!56033 (not c!34334)) b!190871))

(assert (= (and d!56033 res!90218) b!190859))

(assert (= (and b!190859 res!90223) b!190869))

(assert (= (and b!190859 (not res!90222)) b!190861))

(assert (= (and b!190861 res!90219) b!190856))

(assert (= (and b!190859 res!90225) b!190866))

(assert (= (and b!190866 c!34333) b!190857))

(assert (= (and b!190866 (not c!34333)) b!190867))

(assert (= (and b!190857 res!90224) b!190854))

(assert (= (or b!190857 b!190867) bm!19240))

(assert (= (and b!190866 res!90226) b!190868))

(assert (= (and b!190868 c!34335) b!190865))

(assert (= (and b!190868 (not c!34335)) b!190862))

(assert (= (and b!190865 res!90220) b!190860))

(assert (= (or b!190865 b!190862) bm!19243))

(declare-fun b_lambda!7389 () Bool)

(assert (=> (not b_lambda!7389) (not b!190856)))

(declare-fun t!7287 () Bool)

(declare-fun tb!2863 () Bool)

(assert (=> (and b!190696 (= (defaultEntry!3891 thiss!1248) (defaultEntry!3891 thiss!1248)) t!7287) tb!2863))

(declare-fun result!4883 () Bool)

(assert (=> tb!2863 (= result!4883 tp_is_empty!4441)))

(assert (=> b!190856 t!7287))

(declare-fun b_and!11347 () Bool)

(assert (= b_and!11341 (and (=> t!7287 result!4883) b_and!11347)))

(declare-fun m!217409 () Bool)

(assert (=> bm!19243 m!217409))

(declare-fun m!217411 () Bool)

(assert (=> bm!19240 m!217411))

(declare-fun m!217413 () Bool)

(assert (=> b!190869 m!217413))

(assert (=> b!190869 m!217413))

(declare-fun m!217415 () Bool)

(assert (=> b!190869 m!217415))

(declare-fun m!217417 () Bool)

(assert (=> bm!19238 m!217417))

(assert (=> b!190855 m!217413))

(assert (=> b!190855 m!217413))

(assert (=> b!190855 m!217415))

(declare-fun m!217419 () Bool)

(assert (=> bm!19239 m!217419))

(declare-fun m!217421 () Bool)

(assert (=> b!190864 m!217421))

(declare-fun m!217423 () Bool)

(assert (=> b!190864 m!217423))

(declare-fun m!217425 () Bool)

(assert (=> b!190864 m!217425))

(declare-fun m!217427 () Bool)

(assert (=> b!190864 m!217427))

(declare-fun m!217429 () Bool)

(assert (=> b!190864 m!217429))

(declare-fun m!217431 () Bool)

(assert (=> b!190864 m!217431))

(declare-fun m!217433 () Bool)

(assert (=> b!190864 m!217433))

(declare-fun m!217435 () Bool)

(assert (=> b!190864 m!217435))

(assert (=> b!190864 m!217425))

(declare-fun m!217437 () Bool)

(assert (=> b!190864 m!217437))

(assert (=> b!190864 m!217421))

(declare-fun m!217439 () Bool)

(assert (=> b!190864 m!217439))

(assert (=> b!190864 m!217427))

(assert (=> b!190864 m!217433))

(declare-fun m!217441 () Bool)

(assert (=> b!190864 m!217441))

(assert (=> b!190864 m!217413))

(assert (=> b!190864 m!217419))

(declare-fun m!217443 () Bool)

(assert (=> b!190864 m!217443))

(declare-fun m!217445 () Bool)

(assert (=> b!190864 m!217445))

(declare-fun m!217447 () Bool)

(assert (=> b!190864 m!217447))

(declare-fun m!217449 () Bool)

(assert (=> b!190864 m!217449))

(declare-fun m!217451 () Bool)

(assert (=> b!190854 m!217451))

(declare-fun m!217453 () Bool)

(assert (=> b!190860 m!217453))

(declare-fun m!217455 () Bool)

(assert (=> b!190856 m!217455))

(assert (=> b!190856 m!217413))

(declare-fun m!217457 () Bool)

(assert (=> b!190856 m!217457))

(assert (=> b!190856 m!217455))

(declare-fun m!217459 () Bool)

(assert (=> b!190856 m!217459))

(assert (=> b!190856 m!217413))

(declare-fun m!217461 () Bool)

(assert (=> b!190856 m!217461))

(assert (=> b!190856 m!217457))

(assert (=> b!190861 m!217413))

(assert (=> b!190861 m!217413))

(declare-fun m!217463 () Bool)

(assert (=> b!190861 m!217463))

(assert (=> d!56033 m!217307))

(declare-fun m!217465 () Bool)

(assert (=> b!190863 m!217465))

(assert (=> b!190693 d!56033))

(declare-fun c!34336 () Bool)

(declare-fun call!19251 () ListLongMap!2389)

(declare-fun call!19253 () ListLongMap!2389)

(declare-fun bm!19245 () Bool)

(declare-fun c!34338 () Bool)

(declare-fun call!19250 () ListLongMap!2389)

(declare-fun call!19254 () ListLongMap!2389)

(assert (=> bm!19245 (= call!19251 (+!303 (ite c!34338 call!19253 (ite c!34336 call!19250 call!19254)) (ite (or c!34338 c!34336) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(declare-fun b!190876 () Bool)

(declare-fun e!125620 () ListLongMap!2389)

(declare-fun call!19248 () ListLongMap!2389)

(assert (=> b!190876 (= e!125620 call!19248)))

(declare-fun b!190877 () Bool)

(declare-fun e!125624 () Bool)

(declare-fun lt!94744 () ListLongMap!2389)

(assert (=> b!190877 (= e!125624 (= (apply!180 lt!94744 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3732 thiss!1248)))))

(declare-fun b!190878 () Bool)

(declare-fun e!125614 () Bool)

(assert (=> b!190878 (= e!125614 (validKeyInArray!0 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19246 () Bool)

(assert (=> bm!19246 (= call!19253 (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun bm!19247 () Bool)

(declare-fun call!19252 () Bool)

(assert (=> bm!19247 (= call!19252 (contains!1333 lt!94744 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190880 () Bool)

(declare-fun e!125613 () Bool)

(assert (=> b!190880 (= e!125613 e!125624)))

(declare-fun res!90233 () Bool)

(assert (=> b!190880 (= res!90233 call!19252)))

(assert (=> b!190880 (=> (not res!90233) (not e!125624))))

(declare-fun b!190881 () Bool)

(declare-fun e!125623 () ListLongMap!2389)

(assert (=> b!190881 (= e!125623 call!19248)))

(declare-fun b!190882 () Bool)

(declare-fun res!90234 () Bool)

(declare-fun e!125625 () Bool)

(assert (=> b!190882 (=> (not res!90234) (not e!125625))))

(declare-fun e!125619 () Bool)

(assert (=> b!190882 (= res!90234 e!125619)))

(declare-fun res!90231 () Bool)

(assert (=> b!190882 (=> res!90231 e!125619)))

(declare-fun e!125622 () Bool)

(assert (=> b!190882 (= res!90231 (not e!125622))))

(declare-fun res!90232 () Bool)

(assert (=> b!190882 (=> (not res!90232) (not e!125622))))

(assert (=> b!190882 (= res!90232 (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun b!190883 () Bool)

(declare-fun e!125621 () Bool)

(assert (=> b!190883 (= e!125621 (= (apply!180 lt!94744 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3732 thiss!1248)))))

(declare-fun b!190884 () Bool)

(declare-fun e!125616 () Bool)

(assert (=> b!190884 (= e!125619 e!125616)))

(declare-fun res!90228 () Bool)

(assert (=> b!190884 (=> (not res!90228) (not e!125616))))

(assert (=> b!190884 (= res!90228 (contains!1333 lt!94744 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190884 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun b!190885 () Bool)

(declare-fun e!125617 () Bool)

(declare-fun call!19249 () Bool)

(assert (=> b!190885 (= e!125617 (not call!19249))))

(declare-fun b!190886 () Bool)

(declare-fun e!125615 () ListLongMap!2389)

(assert (=> b!190886 (= e!125615 (+!303 call!19251 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))

(declare-fun b!190887 () Bool)

(declare-fun e!125618 () Unit!5753)

(declare-fun lt!94734 () Unit!5753)

(assert (=> b!190887 (= e!125618 lt!94734)))

(declare-fun lt!94736 () ListLongMap!2389)

(assert (=> b!190887 (= lt!94736 (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94732 () (_ BitVec 64))

(assert (=> b!190887 (= lt!94732 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94741 () (_ BitVec 64))

(assert (=> b!190887 (= lt!94741 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94747 () Unit!5753)

(assert (=> b!190887 (= lt!94747 (addStillContains!156 lt!94736 lt!94732 (zeroValue!3732 thiss!1248) lt!94741))))

(assert (=> b!190887 (contains!1333 (+!303 lt!94736 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248))) lt!94741)))

(declare-fun lt!94746 () Unit!5753)

(assert (=> b!190887 (= lt!94746 lt!94747)))

(declare-fun lt!94743 () ListLongMap!2389)

(assert (=> b!190887 (= lt!94743 (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94738 () (_ BitVec 64))

(assert (=> b!190887 (= lt!94738 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94745 () (_ BitVec 64))

(assert (=> b!190887 (= lt!94745 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94737 () Unit!5753)

(assert (=> b!190887 (= lt!94737 (addApplyDifferent!156 lt!94743 lt!94738 (minValue!3732 thiss!1248) lt!94745))))

(assert (=> b!190887 (= (apply!180 (+!303 lt!94743 (tuple2!3469 lt!94738 (minValue!3732 thiss!1248))) lt!94745) (apply!180 lt!94743 lt!94745))))

(declare-fun lt!94739 () Unit!5753)

(assert (=> b!190887 (= lt!94739 lt!94737)))

(declare-fun lt!94750 () ListLongMap!2389)

(assert (=> b!190887 (= lt!94750 (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94752 () (_ BitVec 64))

(assert (=> b!190887 (= lt!94752 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94751 () (_ BitVec 64))

(assert (=> b!190887 (= lt!94751 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94753 () Unit!5753)

(assert (=> b!190887 (= lt!94753 (addApplyDifferent!156 lt!94750 lt!94752 (zeroValue!3732 thiss!1248) lt!94751))))

(assert (=> b!190887 (= (apply!180 (+!303 lt!94750 (tuple2!3469 lt!94752 (zeroValue!3732 thiss!1248))) lt!94751) (apply!180 lt!94750 lt!94751))))

(declare-fun lt!94733 () Unit!5753)

(assert (=> b!190887 (= lt!94733 lt!94753)))

(declare-fun lt!94749 () ListLongMap!2389)

(assert (=> b!190887 (= lt!94749 (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94735 () (_ BitVec 64))

(assert (=> b!190887 (= lt!94735 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94742 () (_ BitVec 64))

(assert (=> b!190887 (= lt!94742 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190887 (= lt!94734 (addApplyDifferent!156 lt!94749 lt!94735 (minValue!3732 thiss!1248) lt!94742))))

(assert (=> b!190887 (= (apply!180 (+!303 lt!94749 (tuple2!3469 lt!94735 (minValue!3732 thiss!1248))) lt!94742) (apply!180 lt!94749 lt!94742))))

(declare-fun b!190888 () Bool)

(assert (=> b!190888 (= e!125617 e!125621)))

(declare-fun res!90229 () Bool)

(assert (=> b!190888 (= res!90229 call!19249)))

(assert (=> b!190888 (=> (not res!90229) (not e!125621))))

(declare-fun bm!19248 () Bool)

(assert (=> bm!19248 (= call!19254 call!19250)))

(declare-fun b!190889 () Bool)

(declare-fun res!90235 () Bool)

(assert (=> b!190889 (=> (not res!90235) (not e!125625))))

(assert (=> b!190889 (= res!90235 e!125613)))

(declare-fun c!34339 () Bool)

(assert (=> b!190889 (= c!34339 (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!190890 () Bool)

(assert (=> b!190890 (= e!125613 (not call!19252))))

(declare-fun b!190891 () Bool)

(assert (=> b!190891 (= e!125625 e!125617)))

(declare-fun c!34341 () Bool)

(assert (=> b!190891 (= c!34341 (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190879 () Bool)

(assert (=> b!190879 (= e!125616 (= (apply!180 lt!94744 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)) (get!2210 (select (arr!3819 (_values!3874 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4140 (_values!3874 thiss!1248))))))

(assert (=> b!190879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun d!56035 () Bool)

(assert (=> d!56035 e!125625))

(declare-fun res!90227 () Bool)

(assert (=> d!56035 (=> (not res!90227) (not e!125625))))

(assert (=> d!56035 (= res!90227 (or (bvsge #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))))

(declare-fun lt!94748 () ListLongMap!2389)

(assert (=> d!56035 (= lt!94744 lt!94748)))

(declare-fun lt!94740 () Unit!5753)

(assert (=> d!56035 (= lt!94740 e!125618)))

(declare-fun c!34340 () Bool)

(assert (=> d!56035 (= c!34340 e!125614)))

(declare-fun res!90230 () Bool)

(assert (=> d!56035 (=> (not res!90230) (not e!125614))))

(assert (=> d!56035 (= res!90230 (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(assert (=> d!56035 (= lt!94748 e!125615)))

(assert (=> d!56035 (= c!34338 (and (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56035 (validMask!0 (mask!9098 thiss!1248))))

(assert (=> d!56035 (= (getCurrentListMap!862 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)) lt!94744)))

(declare-fun b!190892 () Bool)

(assert (=> b!190892 (= e!125622 (validKeyInArray!0 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190893 () Bool)

(assert (=> b!190893 (= e!125615 e!125623)))

(assert (=> b!190893 (= c!34336 (and (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190894 () Bool)

(declare-fun Unit!5763 () Unit!5753)

(assert (=> b!190894 (= e!125618 Unit!5763)))

(declare-fun b!190895 () Bool)

(assert (=> b!190895 (= e!125620 call!19254)))

(declare-fun bm!19249 () Bool)

(assert (=> bm!19249 (= call!19248 call!19251)))

(declare-fun bm!19250 () Bool)

(assert (=> bm!19250 (= call!19249 (contains!1333 lt!94744 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190896 () Bool)

(declare-fun c!34337 () Bool)

(assert (=> b!190896 (= c!34337 (and (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!190896 (= e!125623 e!125620)))

(declare-fun bm!19251 () Bool)

(assert (=> bm!19251 (= call!19250 call!19253)))

(assert (= (and d!56035 c!34338) b!190886))

(assert (= (and d!56035 (not c!34338)) b!190893))

(assert (= (and b!190893 c!34336) b!190881))

(assert (= (and b!190893 (not c!34336)) b!190896))

(assert (= (and b!190896 c!34337) b!190876))

(assert (= (and b!190896 (not c!34337)) b!190895))

(assert (= (or b!190876 b!190895) bm!19248))

(assert (= (or b!190881 bm!19248) bm!19251))

(assert (= (or b!190881 b!190876) bm!19249))

(assert (= (or b!190886 bm!19251) bm!19246))

(assert (= (or b!190886 bm!19249) bm!19245))

(assert (= (and d!56035 res!90230) b!190878))

(assert (= (and d!56035 c!34340) b!190887))

(assert (= (and d!56035 (not c!34340)) b!190894))

(assert (= (and d!56035 res!90227) b!190882))

(assert (= (and b!190882 res!90232) b!190892))

(assert (= (and b!190882 (not res!90231)) b!190884))

(assert (= (and b!190884 res!90228) b!190879))

(assert (= (and b!190882 res!90234) b!190889))

(assert (= (and b!190889 c!34339) b!190880))

(assert (= (and b!190889 (not c!34339)) b!190890))

(assert (= (and b!190880 res!90233) b!190877))

(assert (= (or b!190880 b!190890) bm!19247))

(assert (= (and b!190889 res!90235) b!190891))

(assert (= (and b!190891 c!34341) b!190888))

(assert (= (and b!190891 (not c!34341)) b!190885))

(assert (= (and b!190888 res!90229) b!190883))

(assert (= (or b!190888 b!190885) bm!19250))

(declare-fun b_lambda!7391 () Bool)

(assert (=> (not b_lambda!7391) (not b!190879)))

(assert (=> b!190879 t!7287))

(declare-fun b_and!11349 () Bool)

(assert (= b_and!11347 (and (=> t!7287 result!4883) b_and!11349)))

(declare-fun m!217467 () Bool)

(assert (=> bm!19250 m!217467))

(declare-fun m!217469 () Bool)

(assert (=> bm!19247 m!217469))

(assert (=> b!190892 m!217413))

(assert (=> b!190892 m!217413))

(assert (=> b!190892 m!217415))

(declare-fun m!217471 () Bool)

(assert (=> bm!19245 m!217471))

(assert (=> b!190878 m!217413))

(assert (=> b!190878 m!217413))

(assert (=> b!190878 m!217415))

(declare-fun m!217473 () Bool)

(assert (=> bm!19246 m!217473))

(declare-fun m!217475 () Bool)

(assert (=> b!190887 m!217475))

(declare-fun m!217477 () Bool)

(assert (=> b!190887 m!217477))

(declare-fun m!217479 () Bool)

(assert (=> b!190887 m!217479))

(declare-fun m!217481 () Bool)

(assert (=> b!190887 m!217481))

(declare-fun m!217483 () Bool)

(assert (=> b!190887 m!217483))

(declare-fun m!217485 () Bool)

(assert (=> b!190887 m!217485))

(declare-fun m!217487 () Bool)

(assert (=> b!190887 m!217487))

(declare-fun m!217489 () Bool)

(assert (=> b!190887 m!217489))

(assert (=> b!190887 m!217479))

(declare-fun m!217491 () Bool)

(assert (=> b!190887 m!217491))

(assert (=> b!190887 m!217475))

(declare-fun m!217493 () Bool)

(assert (=> b!190887 m!217493))

(assert (=> b!190887 m!217481))

(assert (=> b!190887 m!217487))

(declare-fun m!217495 () Bool)

(assert (=> b!190887 m!217495))

(assert (=> b!190887 m!217413))

(assert (=> b!190887 m!217473))

(declare-fun m!217497 () Bool)

(assert (=> b!190887 m!217497))

(declare-fun m!217499 () Bool)

(assert (=> b!190887 m!217499))

(declare-fun m!217501 () Bool)

(assert (=> b!190887 m!217501))

(declare-fun m!217503 () Bool)

(assert (=> b!190887 m!217503))

(declare-fun m!217505 () Bool)

(assert (=> b!190877 m!217505))

(declare-fun m!217507 () Bool)

(assert (=> b!190883 m!217507))

(assert (=> b!190879 m!217455))

(assert (=> b!190879 m!217413))

(declare-fun m!217509 () Bool)

(assert (=> b!190879 m!217509))

(assert (=> b!190879 m!217455))

(declare-fun m!217511 () Bool)

(assert (=> b!190879 m!217511))

(assert (=> b!190879 m!217413))

(declare-fun m!217513 () Bool)

(assert (=> b!190879 m!217513))

(assert (=> b!190879 m!217509))

(assert (=> b!190884 m!217413))

(assert (=> b!190884 m!217413))

(declare-fun m!217515 () Bool)

(assert (=> b!190884 m!217515))

(assert (=> d!56035 m!217307))

(declare-fun m!217517 () Bool)

(assert (=> b!190886 m!217517))

(assert (=> b!190693 d!56035))

(declare-fun d!56037 () Bool)

(assert (=> d!56037 (= (array_inv!2461 (_keys!5864 thiss!1248)) (bvsge (size!4139 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190696 d!56037))

(declare-fun d!56039 () Bool)

(assert (=> d!56039 (= (array_inv!2462 (_values!3874 thiss!1248)) (bvsge (size!4140 (_values!3874 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190696 d!56039))

(declare-fun d!56041 () Bool)

(declare-fun e!125628 () Bool)

(assert (=> d!56041 e!125628))

(declare-fun res!90240 () Bool)

(assert (=> d!56041 (=> (not res!90240) (not e!125628))))

(declare-fun lt!94758 () SeekEntryResult!663)

(assert (=> d!56041 (= res!90240 ((_ is Found!663) lt!94758))))

(assert (=> d!56041 (= lt!94758 (seekEntryOrOpen!0 key!828 (_keys!5864 thiss!1248) (mask!9098 thiss!1248)))))

(declare-fun lt!94759 () Unit!5753)

(declare-fun choose!1036 (array!8103 array!8105 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 64) Int) Unit!5753)

(assert (=> d!56041 (= lt!94759 (choose!1036 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)))))

(assert (=> d!56041 (validMask!0 (mask!9098 thiss!1248))))

(assert (=> d!56041 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!171 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)) lt!94759)))

(declare-fun b!190901 () Bool)

(declare-fun res!90241 () Bool)

(assert (=> b!190901 (=> (not res!90241) (not e!125628))))

(assert (=> b!190901 (= res!90241 (inRange!0 (index!4823 lt!94758) (mask!9098 thiss!1248)))))

(declare-fun b!190902 () Bool)

(assert (=> b!190902 (= e!125628 (= (select (arr!3818 (_keys!5864 thiss!1248)) (index!4823 lt!94758)) key!828))))

(assert (=> b!190902 (and (bvsge (index!4823 lt!94758) #b00000000000000000000000000000000) (bvslt (index!4823 lt!94758) (size!4139 (_keys!5864 thiss!1248))))))

(assert (= (and d!56041 res!90240) b!190901))

(assert (= (and b!190901 res!90241) b!190902))

(assert (=> d!56041 m!217279))

(declare-fun m!217519 () Bool)

(assert (=> d!56041 m!217519))

(assert (=> d!56041 m!217307))

(declare-fun m!217521 () Bool)

(assert (=> b!190901 m!217521))

(declare-fun m!217523 () Bool)

(assert (=> b!190902 m!217523))

(assert (=> b!190695 d!56041))

(declare-fun d!56043 () Bool)

(assert (=> d!56043 (= (inRange!0 (index!4823 lt!94594) (mask!9098 thiss!1248)) (and (bvsge (index!4823 lt!94594) #b00000000000000000000000000000000) (bvslt (index!4823 lt!94594) (bvadd (mask!9098 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!190695 d!56043))

(declare-fun lt!94767 () SeekEntryResult!663)

(declare-fun b!190915 () Bool)

(declare-fun e!125636 () SeekEntryResult!663)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8103 (_ BitVec 32)) SeekEntryResult!663)

(assert (=> b!190915 (= e!125636 (seekKeyOrZeroReturnVacant!0 (x!20491 lt!94767) (index!4824 lt!94767) (index!4824 lt!94767) key!828 (_keys!5864 thiss!1248) (mask!9098 thiss!1248)))))

(declare-fun b!190916 () Bool)

(declare-fun e!125637 () SeekEntryResult!663)

(declare-fun e!125635 () SeekEntryResult!663)

(assert (=> b!190916 (= e!125637 e!125635)))

(declare-fun lt!94768 () (_ BitVec 64))

(assert (=> b!190916 (= lt!94768 (select (arr!3818 (_keys!5864 thiss!1248)) (index!4824 lt!94767)))))

(declare-fun c!34349 () Bool)

(assert (=> b!190916 (= c!34349 (= lt!94768 key!828))))

(declare-fun b!190917 () Bool)

(assert (=> b!190917 (= e!125636 (MissingZero!663 (index!4824 lt!94767)))))

(declare-fun b!190918 () Bool)

(assert (=> b!190918 (= e!125635 (Found!663 (index!4824 lt!94767)))))

(declare-fun d!56045 () Bool)

(declare-fun lt!94766 () SeekEntryResult!663)

(assert (=> d!56045 (and (or ((_ is Undefined!663) lt!94766) (not ((_ is Found!663) lt!94766)) (and (bvsge (index!4823 lt!94766) #b00000000000000000000000000000000) (bvslt (index!4823 lt!94766) (size!4139 (_keys!5864 thiss!1248))))) (or ((_ is Undefined!663) lt!94766) ((_ is Found!663) lt!94766) (not ((_ is MissingZero!663) lt!94766)) (and (bvsge (index!4822 lt!94766) #b00000000000000000000000000000000) (bvslt (index!4822 lt!94766) (size!4139 (_keys!5864 thiss!1248))))) (or ((_ is Undefined!663) lt!94766) ((_ is Found!663) lt!94766) ((_ is MissingZero!663) lt!94766) (not ((_ is MissingVacant!663) lt!94766)) (and (bvsge (index!4825 lt!94766) #b00000000000000000000000000000000) (bvslt (index!4825 lt!94766) (size!4139 (_keys!5864 thiss!1248))))) (or ((_ is Undefined!663) lt!94766) (ite ((_ is Found!663) lt!94766) (= (select (arr!3818 (_keys!5864 thiss!1248)) (index!4823 lt!94766)) key!828) (ite ((_ is MissingZero!663) lt!94766) (= (select (arr!3818 (_keys!5864 thiss!1248)) (index!4822 lt!94766)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!663) lt!94766) (= (select (arr!3818 (_keys!5864 thiss!1248)) (index!4825 lt!94766)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56045 (= lt!94766 e!125637)))

(declare-fun c!34350 () Bool)

(assert (=> d!56045 (= c!34350 (and ((_ is Intermediate!663) lt!94767) (undefined!1475 lt!94767)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8103 (_ BitVec 32)) SeekEntryResult!663)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56045 (= lt!94767 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9098 thiss!1248)) key!828 (_keys!5864 thiss!1248) (mask!9098 thiss!1248)))))

(assert (=> d!56045 (validMask!0 (mask!9098 thiss!1248))))

(assert (=> d!56045 (= (seekEntryOrOpen!0 key!828 (_keys!5864 thiss!1248) (mask!9098 thiss!1248)) lt!94766)))

(declare-fun b!190919 () Bool)

(assert (=> b!190919 (= e!125637 Undefined!663)))

(declare-fun b!190920 () Bool)

(declare-fun c!34348 () Bool)

(assert (=> b!190920 (= c!34348 (= lt!94768 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190920 (= e!125635 e!125636)))

(assert (= (and d!56045 c!34350) b!190919))

(assert (= (and d!56045 (not c!34350)) b!190916))

(assert (= (and b!190916 c!34349) b!190918))

(assert (= (and b!190916 (not c!34349)) b!190920))

(assert (= (and b!190920 c!34348) b!190917))

(assert (= (and b!190920 (not c!34348)) b!190915))

(declare-fun m!217525 () Bool)

(assert (=> b!190915 m!217525))

(declare-fun m!217527 () Bool)

(assert (=> b!190916 m!217527))

(declare-fun m!217529 () Bool)

(assert (=> d!56045 m!217529))

(declare-fun m!217531 () Bool)

(assert (=> d!56045 m!217531))

(assert (=> d!56045 m!217529))

(declare-fun m!217533 () Bool)

(assert (=> d!56045 m!217533))

(assert (=> d!56045 m!217307))

(declare-fun m!217535 () Bool)

(assert (=> d!56045 m!217535))

(declare-fun m!217537 () Bool)

(assert (=> d!56045 m!217537))

(assert (=> b!190699 d!56045))

(declare-fun d!56047 () Bool)

(declare-fun res!90248 () Bool)

(declare-fun e!125640 () Bool)

(assert (=> d!56047 (=> (not res!90248) (not e!125640))))

(declare-fun simpleValid!196 (LongMapFixedSize!2662) Bool)

(assert (=> d!56047 (= res!90248 (simpleValid!196 thiss!1248))))

(assert (=> d!56047 (= (valid!1118 thiss!1248) e!125640)))

(declare-fun b!190927 () Bool)

(declare-fun res!90249 () Bool)

(assert (=> b!190927 (=> (not res!90249) (not e!125640))))

(declare-fun arrayCountValidKeys!0 (array!8103 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!190927 (= res!90249 (= (arrayCountValidKeys!0 (_keys!5864 thiss!1248) #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))) (_size!1380 thiss!1248)))))

(declare-fun b!190928 () Bool)

(declare-fun res!90250 () Bool)

(assert (=> b!190928 (=> (not res!90250) (not e!125640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8103 (_ BitVec 32)) Bool)

(assert (=> b!190928 (= res!90250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5864 thiss!1248) (mask!9098 thiss!1248)))))

(declare-fun b!190929 () Bool)

(declare-datatypes ((List!2384 0))(
  ( (Nil!2381) (Cons!2380 (h!3018 (_ BitVec 64)) (t!7288 List!2384)) )
))
(declare-fun arrayNoDuplicates!0 (array!8103 (_ BitVec 32) List!2384) Bool)

(assert (=> b!190929 (= e!125640 (arrayNoDuplicates!0 (_keys!5864 thiss!1248) #b00000000000000000000000000000000 Nil!2381))))

(assert (= (and d!56047 res!90248) b!190927))

(assert (= (and b!190927 res!90249) b!190928))

(assert (= (and b!190928 res!90250) b!190929))

(declare-fun m!217539 () Bool)

(assert (=> d!56047 m!217539))

(declare-fun m!217541 () Bool)

(assert (=> b!190927 m!217541))

(declare-fun m!217543 () Bool)

(assert (=> b!190928 m!217543))

(declare-fun m!217545 () Bool)

(assert (=> b!190929 m!217545))

(assert (=> start!19400 d!56047))

(declare-fun b!190936 () Bool)

(declare-fun e!125645 () Bool)

(assert (=> b!190936 (= e!125645 tp_is_empty!4441)))

(declare-fun mapIsEmpty!7676 () Bool)

(declare-fun mapRes!7676 () Bool)

(assert (=> mapIsEmpty!7676 mapRes!7676))

(declare-fun b!190937 () Bool)

(declare-fun e!125646 () Bool)

(assert (=> b!190937 (= e!125646 tp_is_empty!4441)))

(declare-fun mapNonEmpty!7676 () Bool)

(declare-fun tp!16865 () Bool)

(assert (=> mapNonEmpty!7676 (= mapRes!7676 (and tp!16865 e!125645))))

(declare-fun mapValue!7676 () ValueCell!1877)

(declare-fun mapKey!7676 () (_ BitVec 32))

(declare-fun mapRest!7676 () (Array (_ BitVec 32) ValueCell!1877))

(assert (=> mapNonEmpty!7676 (= mapRest!7667 (store mapRest!7676 mapKey!7676 mapValue!7676))))

(declare-fun condMapEmpty!7676 () Bool)

(declare-fun mapDefault!7676 () ValueCell!1877)

(assert (=> mapNonEmpty!7667 (= condMapEmpty!7676 (= mapRest!7667 ((as const (Array (_ BitVec 32) ValueCell!1877)) mapDefault!7676)))))

(assert (=> mapNonEmpty!7667 (= tp!16850 (and e!125646 mapRes!7676))))

(assert (= (and mapNonEmpty!7667 condMapEmpty!7676) mapIsEmpty!7676))

(assert (= (and mapNonEmpty!7667 (not condMapEmpty!7676)) mapNonEmpty!7676))

(assert (= (and mapNonEmpty!7676 ((_ is ValueCellFull!1877) mapValue!7676)) b!190936))

(assert (= (and mapNonEmpty!7667 ((_ is ValueCellFull!1877) mapDefault!7676)) b!190937))

(declare-fun m!217547 () Bool)

(assert (=> mapNonEmpty!7676 m!217547))

(declare-fun b_lambda!7393 () Bool)

(assert (= b_lambda!7389 (or (and b!190696 b_free!4669) b_lambda!7393)))

(declare-fun b_lambda!7395 () Bool)

(assert (= b_lambda!7391 (or (and b!190696 b_free!4669) b_lambda!7395)))

(check-sat (not bm!19243) tp_is_empty!4441 (not b!190879) (not bm!19222) (not d!56041) b_and!11349 (not b!190861) (not b!190877) (not b_next!4669) (not b!190887) (not d!56045) (not bm!19247) (not b!190927) (not d!56031) (not b!190901) (not b_lambda!7393) (not bm!19240) (not d!56035) (not b!190801) (not b!190915) (not b!190884) (not b_lambda!7395) (not b!190886) (not d!56033) (not b!190883) (not b!190863) (not b!190798) (not b!190869) (not b!190810) (not b!190855) (not mapNonEmpty!7676) (not b!190808) (not b!190856) (not b!190860) (not d!56027) (not d!56023) (not d!56047) (not b!190892) (not bm!19246) (not bm!19239) (not b!190929) (not b!190864) (not b!190928) (not bm!19245) (not bm!19238) (not b!190854) (not bm!19250) (not d!56025) (not b!190797) (not b!190878) (not bm!19223))
(check-sat b_and!11349 (not b_next!4669))
(get-model)

(declare-fun d!56049 () Bool)

(assert (=> d!56049 (= (validKeyInArray!0 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190855 d!56049))

(declare-fun d!56051 () Bool)

(declare-fun e!125647 () Bool)

(assert (=> d!56051 e!125647))

(declare-fun res!90252 () Bool)

(assert (=> d!56051 (=> (not res!90252) (not e!125647))))

(declare-fun lt!94772 () ListLongMap!2389)

(assert (=> d!56051 (= res!90252 (contains!1333 lt!94772 (_1!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(declare-fun lt!94770 () List!2381)

(assert (=> d!56051 (= lt!94772 (ListLongMap!2390 lt!94770))))

(declare-fun lt!94771 () Unit!5753)

(declare-fun lt!94769 () Unit!5753)

(assert (=> d!56051 (= lt!94771 lt!94769)))

(assert (=> d!56051 (= (getValueByKey!238 lt!94770 (_1!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (=> d!56051 (= lt!94769 (lemmaContainsTupThenGetReturnValue!125 lt!94770 (_1!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (=> d!56051 (= lt!94770 (insertStrictlySorted!128 (toList!1210 call!19251) (_1!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (=> d!56051 (= (+!303 call!19251 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))) lt!94772)))

(declare-fun b!190938 () Bool)

(declare-fun res!90251 () Bool)

(assert (=> b!190938 (=> (not res!90251) (not e!125647))))

(assert (=> b!190938 (= res!90251 (= (getValueByKey!238 (toList!1210 lt!94772) (_1!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(declare-fun b!190939 () Bool)

(assert (=> b!190939 (= e!125647 (contains!1336 (toList!1210 lt!94772) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))

(assert (= (and d!56051 res!90252) b!190938))

(assert (= (and b!190938 res!90251) b!190939))

(declare-fun m!217549 () Bool)

(assert (=> d!56051 m!217549))

(declare-fun m!217551 () Bool)

(assert (=> d!56051 m!217551))

(declare-fun m!217553 () Bool)

(assert (=> d!56051 m!217553))

(declare-fun m!217555 () Bool)

(assert (=> d!56051 m!217555))

(declare-fun m!217557 () Bool)

(assert (=> b!190938 m!217557))

(declare-fun m!217559 () Bool)

(assert (=> b!190939 m!217559))

(assert (=> b!190886 d!56051))

(declare-fun b!190958 () Bool)

(declare-fun e!125660 () Bool)

(declare-fun lt!94778 () SeekEntryResult!663)

(assert (=> b!190958 (= e!125660 (bvsge (x!20491 lt!94778) #b01111111111111111111111111111110))))

(declare-fun b!190959 () Bool)

(assert (=> b!190959 (and (bvsge (index!4824 lt!94778) #b00000000000000000000000000000000) (bvslt (index!4824 lt!94778) (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun e!125658 () Bool)

(assert (=> b!190959 (= e!125658 (= (select (arr!3818 (_keys!5864 thiss!1248)) (index!4824 lt!94778)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190960 () Bool)

(assert (=> b!190960 (and (bvsge (index!4824 lt!94778) #b00000000000000000000000000000000) (bvslt (index!4824 lt!94778) (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun res!90261 () Bool)

(assert (=> b!190960 (= res!90261 (= (select (arr!3818 (_keys!5864 thiss!1248)) (index!4824 lt!94778)) key!828))))

(assert (=> b!190960 (=> res!90261 e!125658)))

(declare-fun e!125661 () Bool)

(assert (=> b!190960 (= e!125661 e!125658)))

(declare-fun d!56053 () Bool)

(assert (=> d!56053 e!125660))

(declare-fun c!34357 () Bool)

(assert (=> d!56053 (= c!34357 (and ((_ is Intermediate!663) lt!94778) (undefined!1475 lt!94778)))))

(declare-fun e!125659 () SeekEntryResult!663)

(assert (=> d!56053 (= lt!94778 e!125659)))

(declare-fun c!34359 () Bool)

(assert (=> d!56053 (= c!34359 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!94777 () (_ BitVec 64))

(assert (=> d!56053 (= lt!94777 (select (arr!3818 (_keys!5864 thiss!1248)) (toIndex!0 key!828 (mask!9098 thiss!1248))))))

(assert (=> d!56053 (validMask!0 (mask!9098 thiss!1248))))

(assert (=> d!56053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9098 thiss!1248)) key!828 (_keys!5864 thiss!1248) (mask!9098 thiss!1248)) lt!94778)))

(declare-fun b!190961 () Bool)

(declare-fun e!125662 () SeekEntryResult!663)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!190961 (= e!125662 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9098 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9098 thiss!1248)) key!828 (_keys!5864 thiss!1248) (mask!9098 thiss!1248)))))

(declare-fun b!190962 () Bool)

(assert (=> b!190962 (= e!125660 e!125661)))

(declare-fun res!90259 () Bool)

(assert (=> b!190962 (= res!90259 (and ((_ is Intermediate!663) lt!94778) (not (undefined!1475 lt!94778)) (bvslt (x!20491 lt!94778) #b01111111111111111111111111111110) (bvsge (x!20491 lt!94778) #b00000000000000000000000000000000) (bvsge (x!20491 lt!94778) #b00000000000000000000000000000000)))))

(assert (=> b!190962 (=> (not res!90259) (not e!125661))))

(declare-fun b!190963 () Bool)

(assert (=> b!190963 (= e!125662 (Intermediate!663 false (toIndex!0 key!828 (mask!9098 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!190964 () Bool)

(assert (=> b!190964 (= e!125659 (Intermediate!663 true (toIndex!0 key!828 (mask!9098 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!190965 () Bool)

(assert (=> b!190965 (and (bvsge (index!4824 lt!94778) #b00000000000000000000000000000000) (bvslt (index!4824 lt!94778) (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun res!90260 () Bool)

(assert (=> b!190965 (= res!90260 (= (select (arr!3818 (_keys!5864 thiss!1248)) (index!4824 lt!94778)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190965 (=> res!90260 e!125658)))

(declare-fun b!190966 () Bool)

(assert (=> b!190966 (= e!125659 e!125662)))

(declare-fun c!34358 () Bool)

(assert (=> b!190966 (= c!34358 (or (= lt!94777 key!828) (= (bvadd lt!94777 lt!94777) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56053 c!34359) b!190964))

(assert (= (and d!56053 (not c!34359)) b!190966))

(assert (= (and b!190966 c!34358) b!190963))

(assert (= (and b!190966 (not c!34358)) b!190961))

(assert (= (and d!56053 c!34357) b!190958))

(assert (= (and d!56053 (not c!34357)) b!190962))

(assert (= (and b!190962 res!90259) b!190960))

(assert (= (and b!190960 (not res!90261)) b!190965))

(assert (= (and b!190965 (not res!90260)) b!190959))

(declare-fun m!217561 () Bool)

(assert (=> b!190959 m!217561))

(assert (=> b!190960 m!217561))

(assert (=> b!190965 m!217561))

(assert (=> d!56053 m!217529))

(declare-fun m!217563 () Bool)

(assert (=> d!56053 m!217563))

(assert (=> d!56053 m!217307))

(assert (=> b!190961 m!217529))

(declare-fun m!217565 () Bool)

(assert (=> b!190961 m!217565))

(assert (=> b!190961 m!217565))

(declare-fun m!217567 () Bool)

(assert (=> b!190961 m!217567))

(assert (=> d!56045 d!56053))

(declare-fun d!56055 () Bool)

(declare-fun lt!94784 () (_ BitVec 32))

(declare-fun lt!94783 () (_ BitVec 32))

(assert (=> d!56055 (= lt!94784 (bvmul (bvxor lt!94783 (bvlshr lt!94783 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!56055 (= lt!94783 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!56055 (and (bvsge (mask!9098 thiss!1248) #b00000000000000000000000000000000) (let ((res!90262 (let ((h!3019 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20509 (bvmul (bvxor h!3019 (bvlshr h!3019 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20509 (bvlshr x!20509 #b00000000000000000000000000001101)) (mask!9098 thiss!1248)))))) (and (bvslt res!90262 (bvadd (mask!9098 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!90262 #b00000000000000000000000000000000))))))

(assert (=> d!56055 (= (toIndex!0 key!828 (mask!9098 thiss!1248)) (bvand (bvxor lt!94784 (bvlshr lt!94784 #b00000000000000000000000000001101)) (mask!9098 thiss!1248)))))

(assert (=> d!56045 d!56055))

(assert (=> d!56045 d!56029))

(declare-fun d!56057 () Bool)

(declare-fun e!125663 () Bool)

(assert (=> d!56057 e!125663))

(declare-fun res!90264 () Bool)

(assert (=> d!56057 (=> (not res!90264) (not e!125663))))

(declare-fun lt!94788 () ListLongMap!2389)

(assert (=> d!56057 (= res!90264 (contains!1333 lt!94788 (_1!1745 (tuple2!3469 key!828 v!309))))))

(declare-fun lt!94786 () List!2381)

(assert (=> d!56057 (= lt!94788 (ListLongMap!2390 lt!94786))))

(declare-fun lt!94787 () Unit!5753)

(declare-fun lt!94785 () Unit!5753)

(assert (=> d!56057 (= lt!94787 lt!94785)))

(assert (=> d!56057 (= (getValueByKey!238 lt!94786 (_1!1745 (tuple2!3469 key!828 v!309))) (Some!243 (_2!1745 (tuple2!3469 key!828 v!309))))))

(assert (=> d!56057 (= lt!94785 (lemmaContainsTupThenGetReturnValue!125 lt!94786 (_1!1745 (tuple2!3469 key!828 v!309)) (_2!1745 (tuple2!3469 key!828 v!309))))))

(assert (=> d!56057 (= lt!94786 (insertStrictlySorted!128 (toList!1210 (getCurrentListMap!862 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248))) (_1!1745 (tuple2!3469 key!828 v!309)) (_2!1745 (tuple2!3469 key!828 v!309))))))

(assert (=> d!56057 (= (+!303 (getCurrentListMap!862 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)) (tuple2!3469 key!828 v!309)) lt!94788)))

(declare-fun b!190967 () Bool)

(declare-fun res!90263 () Bool)

(assert (=> b!190967 (=> (not res!90263) (not e!125663))))

(assert (=> b!190967 (= res!90263 (= (getValueByKey!238 (toList!1210 lt!94788) (_1!1745 (tuple2!3469 key!828 v!309))) (Some!243 (_2!1745 (tuple2!3469 key!828 v!309)))))))

(declare-fun b!190968 () Bool)

(assert (=> b!190968 (= e!125663 (contains!1336 (toList!1210 lt!94788) (tuple2!3469 key!828 v!309)))))

(assert (= (and d!56057 res!90264) b!190967))

(assert (= (and b!190967 res!90263) b!190968))

(declare-fun m!217569 () Bool)

(assert (=> d!56057 m!217569))

(declare-fun m!217571 () Bool)

(assert (=> d!56057 m!217571))

(declare-fun m!217573 () Bool)

(assert (=> d!56057 m!217573))

(declare-fun m!217575 () Bool)

(assert (=> d!56057 m!217575))

(declare-fun m!217577 () Bool)

(assert (=> b!190967 m!217577))

(declare-fun m!217579 () Bool)

(assert (=> b!190968 m!217579))

(assert (=> b!190801 d!56057))

(assert (=> b!190801 d!56035))

(assert (=> b!190801 d!56033))

(declare-fun d!56059 () Bool)

(declare-fun get!2211 (Option!244) V!5569)

(assert (=> d!56059 (= (apply!180 lt!94722 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2211 (getValueByKey!238 (toList!1210 lt!94722) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7655 () Bool)

(assert (= bs!7655 d!56059))

(declare-fun m!217581 () Bool)

(assert (=> bs!7655 m!217581))

(assert (=> bs!7655 m!217581))

(declare-fun m!217583 () Bool)

(assert (=> bs!7655 m!217583))

(assert (=> b!190854 d!56059))

(declare-fun d!56061 () Bool)

(declare-fun e!125665 () Bool)

(assert (=> d!56061 e!125665))

(declare-fun res!90265 () Bool)

(assert (=> d!56061 (=> res!90265 e!125665)))

(declare-fun lt!94792 () Bool)

(assert (=> d!56061 (= res!90265 (not lt!94792))))

(declare-fun lt!94791 () Bool)

(assert (=> d!56061 (= lt!94792 lt!94791)))

(declare-fun lt!94789 () Unit!5753)

(declare-fun e!125664 () Unit!5753)

(assert (=> d!56061 (= lt!94789 e!125664)))

(declare-fun c!34360 () Bool)

(assert (=> d!56061 (= c!34360 lt!94791)))

(assert (=> d!56061 (= lt!94791 (containsKey!241 (toList!1210 lt!94744) (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56061 (= (contains!1333 lt!94744 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)) lt!94792)))

(declare-fun b!190969 () Bool)

(declare-fun lt!94790 () Unit!5753)

(assert (=> b!190969 (= e!125664 lt!94790)))

(assert (=> b!190969 (= lt!94790 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1210 lt!94744) (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190969 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94744) (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190970 () Bool)

(declare-fun Unit!5764 () Unit!5753)

(assert (=> b!190970 (= e!125664 Unit!5764)))

(declare-fun b!190971 () Bool)

(assert (=> b!190971 (= e!125665 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94744) (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56061 c!34360) b!190969))

(assert (= (and d!56061 (not c!34360)) b!190970))

(assert (= (and d!56061 (not res!90265)) b!190971))

(assert (=> d!56061 m!217413))

(declare-fun m!217585 () Bool)

(assert (=> d!56061 m!217585))

(assert (=> b!190969 m!217413))

(declare-fun m!217587 () Bool)

(assert (=> b!190969 m!217587))

(assert (=> b!190969 m!217413))

(declare-fun m!217589 () Bool)

(assert (=> b!190969 m!217589))

(assert (=> b!190969 m!217589))

(declare-fun m!217591 () Bool)

(assert (=> b!190969 m!217591))

(assert (=> b!190971 m!217413))

(assert (=> b!190971 m!217589))

(assert (=> b!190971 m!217589))

(assert (=> b!190971 m!217591))

(assert (=> b!190884 d!56061))

(declare-fun d!56063 () Bool)

(declare-fun e!125667 () Bool)

(assert (=> d!56063 e!125667))

(declare-fun res!90266 () Bool)

(assert (=> d!56063 (=> res!90266 e!125667)))

(declare-fun lt!94796 () Bool)

(assert (=> d!56063 (= res!90266 (not lt!94796))))

(declare-fun lt!94795 () Bool)

(assert (=> d!56063 (= lt!94796 lt!94795)))

(declare-fun lt!94793 () Unit!5753)

(declare-fun e!125666 () Unit!5753)

(assert (=> d!56063 (= lt!94793 e!125666)))

(declare-fun c!34361 () Bool)

(assert (=> d!56063 (= c!34361 lt!94795)))

(assert (=> d!56063 (= lt!94795 (containsKey!241 (toList!1210 lt!94722) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56063 (= (contains!1333 lt!94722 #b0000000000000000000000000000000000000000000000000000000000000000) lt!94796)))

(declare-fun b!190972 () Bool)

(declare-fun lt!94794 () Unit!5753)

(assert (=> b!190972 (= e!125666 lt!94794)))

(assert (=> b!190972 (= lt!94794 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1210 lt!94722) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190972 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94722) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190973 () Bool)

(declare-fun Unit!5765 () Unit!5753)

(assert (=> b!190973 (= e!125666 Unit!5765)))

(declare-fun b!190974 () Bool)

(assert (=> b!190974 (= e!125667 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94722) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56063 c!34361) b!190972))

(assert (= (and d!56063 (not c!34361)) b!190973))

(assert (= (and d!56063 (not res!90266)) b!190974))

(declare-fun m!217593 () Bool)

(assert (=> d!56063 m!217593))

(declare-fun m!217595 () Bool)

(assert (=> b!190972 m!217595))

(assert (=> b!190972 m!217581))

(assert (=> b!190972 m!217581))

(declare-fun m!217597 () Bool)

(assert (=> b!190972 m!217597))

(assert (=> b!190974 m!217581))

(assert (=> b!190974 m!217581))

(assert (=> b!190974 m!217597))

(assert (=> bm!19240 d!56063))

(declare-fun d!56065 () Bool)

(assert (=> d!56065 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94596) key!828))))

(declare-fun lt!94799 () Unit!5753)

(declare-fun choose!1037 (List!2381 (_ BitVec 64)) Unit!5753)

(assert (=> d!56065 (= lt!94799 (choose!1037 (toList!1210 lt!94596) key!828))))

(declare-fun e!125670 () Bool)

(assert (=> d!56065 e!125670))

(declare-fun res!90269 () Bool)

(assert (=> d!56065 (=> (not res!90269) (not e!125670))))

(declare-fun isStrictlySorted!341 (List!2381) Bool)

(assert (=> d!56065 (= res!90269 (isStrictlySorted!341 (toList!1210 lt!94596)))))

(assert (=> d!56065 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1210 lt!94596) key!828) lt!94799)))

(declare-fun b!190977 () Bool)

(assert (=> b!190977 (= e!125670 (containsKey!241 (toList!1210 lt!94596) key!828))))

(assert (= (and d!56065 res!90269) b!190977))

(assert (=> d!56065 m!217405))

(assert (=> d!56065 m!217405))

(assert (=> d!56065 m!217407))

(declare-fun m!217599 () Bool)

(assert (=> d!56065 m!217599))

(declare-fun m!217601 () Bool)

(assert (=> d!56065 m!217601))

(assert (=> b!190977 m!217401))

(assert (=> b!190808 d!56065))

(declare-fun d!56067 () Bool)

(declare-fun isEmpty!487 (Option!244) Bool)

(assert (=> d!56067 (= (isDefined!190 (getValueByKey!238 (toList!1210 lt!94596) key!828)) (not (isEmpty!487 (getValueByKey!238 (toList!1210 lt!94596) key!828))))))

(declare-fun bs!7656 () Bool)

(assert (= bs!7656 d!56067))

(assert (=> bs!7656 m!217405))

(declare-fun m!217603 () Bool)

(assert (=> bs!7656 m!217603))

(assert (=> b!190808 d!56067))

(declare-fun d!56069 () Bool)

(declare-fun c!34366 () Bool)

(assert (=> d!56069 (= c!34366 (and ((_ is Cons!2377) (toList!1210 lt!94596)) (= (_1!1745 (h!3015 (toList!1210 lt!94596))) key!828)))))

(declare-fun e!125675 () Option!244)

(assert (=> d!56069 (= (getValueByKey!238 (toList!1210 lt!94596) key!828) e!125675)))

(declare-fun b!190988 () Bool)

(declare-fun e!125676 () Option!244)

(assert (=> b!190988 (= e!125676 (getValueByKey!238 (t!7283 (toList!1210 lt!94596)) key!828))))

(declare-fun b!190987 () Bool)

(assert (=> b!190987 (= e!125675 e!125676)))

(declare-fun c!34367 () Bool)

(assert (=> b!190987 (= c!34367 (and ((_ is Cons!2377) (toList!1210 lt!94596)) (not (= (_1!1745 (h!3015 (toList!1210 lt!94596))) key!828))))))

(declare-fun b!190986 () Bool)

(assert (=> b!190986 (= e!125675 (Some!243 (_2!1745 (h!3015 (toList!1210 lt!94596)))))))

(declare-fun b!190989 () Bool)

(assert (=> b!190989 (= e!125676 None!242)))

(assert (= (and d!56069 c!34366) b!190986))

(assert (= (and d!56069 (not c!34366)) b!190987))

(assert (= (and b!190987 c!34367) b!190988))

(assert (= (and b!190987 (not c!34367)) b!190989))

(declare-fun m!217605 () Bool)

(assert (=> b!190988 m!217605))

(assert (=> b!190808 d!56069))

(declare-fun d!56071 () Bool)

(assert (=> d!56071 (= (apply!180 lt!94722 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)) (get!2211 (getValueByKey!238 (toList!1210 lt!94722) (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7657 () Bool)

(assert (= bs!7657 d!56071))

(assert (=> bs!7657 m!217413))

(declare-fun m!217607 () Bool)

(assert (=> bs!7657 m!217607))

(assert (=> bs!7657 m!217607))

(declare-fun m!217609 () Bool)

(assert (=> bs!7657 m!217609))

(assert (=> b!190856 d!56071))

(declare-fun c!34370 () Bool)

(declare-fun d!56073 () Bool)

(assert (=> d!56073 (= c!34370 ((_ is ValueCellFull!1877) (select (arr!3819 (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000)))))

(declare-fun e!125679 () V!5569)

(assert (=> d!56073 (= (get!2210 (select (arr!3819 (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!125679)))

(declare-fun b!190994 () Bool)

(declare-fun get!2212 (ValueCell!1877 V!5569) V!5569)

(assert (=> b!190994 (= e!125679 (get!2212 (select (arr!3819 (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190995 () Bool)

(declare-fun get!2213 (ValueCell!1877 V!5569) V!5569)

(assert (=> b!190995 (= e!125679 (get!2213 (select (arr!3819 (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56073 c!34370) b!190994))

(assert (= (and d!56073 (not c!34370)) b!190995))

(assert (=> b!190994 m!217457))

(assert (=> b!190994 m!217455))

(declare-fun m!217611 () Bool)

(assert (=> b!190994 m!217611))

(assert (=> b!190995 m!217457))

(assert (=> b!190995 m!217455))

(declare-fun m!217613 () Bool)

(assert (=> b!190995 m!217613))

(assert (=> b!190856 d!56073))

(declare-fun d!56075 () Bool)

(assert (=> d!56075 (= (inRange!0 (ite c!34314 (index!4822 lt!94637) (index!4825 lt!94637)) (mask!9098 thiss!1248)) (and (bvsge (ite c!34314 (index!4822 lt!94637) (index!4825 lt!94637)) #b00000000000000000000000000000000) (bvslt (ite c!34314 (index!4822 lt!94637) (index!4825 lt!94637)) (bvadd (mask!9098 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19223 d!56075))

(declare-fun c!34371 () Bool)

(declare-fun d!56077 () Bool)

(assert (=> d!56077 (= c!34371 (and ((_ is Cons!2377) (toList!1210 lt!94650)) (= (_1!1745 (h!3015 (toList!1210 lt!94650))) (_1!1745 (tuple2!3469 key!828 v!309)))))))

(declare-fun e!125680 () Option!244)

(assert (=> d!56077 (= (getValueByKey!238 (toList!1210 lt!94650) (_1!1745 (tuple2!3469 key!828 v!309))) e!125680)))

(declare-fun b!190998 () Bool)

(declare-fun e!125681 () Option!244)

(assert (=> b!190998 (= e!125681 (getValueByKey!238 (t!7283 (toList!1210 lt!94650)) (_1!1745 (tuple2!3469 key!828 v!309))))))

(declare-fun b!190997 () Bool)

(assert (=> b!190997 (= e!125680 e!125681)))

(declare-fun c!34372 () Bool)

(assert (=> b!190997 (= c!34372 (and ((_ is Cons!2377) (toList!1210 lt!94650)) (not (= (_1!1745 (h!3015 (toList!1210 lt!94650))) (_1!1745 (tuple2!3469 key!828 v!309))))))))

(declare-fun b!190996 () Bool)

(assert (=> b!190996 (= e!125680 (Some!243 (_2!1745 (h!3015 (toList!1210 lt!94650)))))))

(declare-fun b!190999 () Bool)

(assert (=> b!190999 (= e!125681 None!242)))

(assert (= (and d!56077 c!34371) b!190996))

(assert (= (and d!56077 (not c!34371)) b!190997))

(assert (= (and b!190997 c!34372) b!190998))

(assert (= (and b!190997 (not c!34372)) b!190999))

(declare-fun m!217615 () Bool)

(assert (=> b!190998 m!217615))

(assert (=> b!190797 d!56077))

(declare-fun d!56079 () Bool)

(assert (=> d!56079 (= (apply!180 lt!94743 lt!94745) (get!2211 (getValueByKey!238 (toList!1210 lt!94743) lt!94745)))))

(declare-fun bs!7658 () Bool)

(assert (= bs!7658 d!56079))

(declare-fun m!217617 () Bool)

(assert (=> bs!7658 m!217617))

(assert (=> bs!7658 m!217617))

(declare-fun m!217619 () Bool)

(assert (=> bs!7658 m!217619))

(assert (=> b!190887 d!56079))

(declare-fun b!191024 () Bool)

(declare-fun e!125700 () Bool)

(declare-fun lt!94816 () ListLongMap!2389)

(assert (=> b!191024 (= e!125700 (= lt!94816 (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3891 thiss!1248))))))

(declare-fun b!191025 () Bool)

(assert (=> b!191025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(assert (=> b!191025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4140 (_values!3874 thiss!1248))))))

(declare-fun e!125698 () Bool)

(assert (=> b!191025 (= e!125698 (= (apply!180 lt!94816 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)) (get!2210 (select (arr!3819 (_values!3874 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!56081 () Bool)

(declare-fun e!125701 () Bool)

(assert (=> d!56081 e!125701))

(declare-fun res!90279 () Bool)

(assert (=> d!56081 (=> (not res!90279) (not e!125701))))

(assert (=> d!56081 (= res!90279 (not (contains!1333 lt!94816 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!125697 () ListLongMap!2389)

(assert (=> d!56081 (= lt!94816 e!125697)))

(declare-fun c!34384 () Bool)

(assert (=> d!56081 (= c!34384 (bvsge #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(assert (=> d!56081 (validMask!0 (mask!9098 thiss!1248))))

(assert (=> d!56081 (= (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)) lt!94816)))

(declare-fun b!191026 () Bool)

(declare-fun e!125696 () Bool)

(assert (=> b!191026 (= e!125696 e!125698)))

(assert (=> b!191026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun res!90278 () Bool)

(assert (=> b!191026 (= res!90278 (contains!1333 lt!94816 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191026 (=> (not res!90278) (not e!125698))))

(declare-fun bm!19254 () Bool)

(declare-fun call!19257 () ListLongMap!2389)

(assert (=> bm!19254 (= call!19257 (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3891 thiss!1248)))))

(declare-fun b!191027 () Bool)

(declare-fun e!125699 () ListLongMap!2389)

(assert (=> b!191027 (= e!125699 call!19257)))

(declare-fun b!191028 () Bool)

(assert (=> b!191028 (= e!125701 e!125696)))

(declare-fun c!34381 () Bool)

(declare-fun e!125702 () Bool)

(assert (=> b!191028 (= c!34381 e!125702)))

(declare-fun res!90280 () Bool)

(assert (=> b!191028 (=> (not res!90280) (not e!125702))))

(assert (=> b!191028 (= res!90280 (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun b!191029 () Bool)

(declare-fun lt!94819 () Unit!5753)

(declare-fun lt!94818 () Unit!5753)

(assert (=> b!191029 (= lt!94819 lt!94818)))

(declare-fun lt!94820 () (_ BitVec 64))

(declare-fun lt!94814 () ListLongMap!2389)

(declare-fun lt!94815 () V!5569)

(declare-fun lt!94817 () (_ BitVec 64))

(assert (=> b!191029 (not (contains!1333 (+!303 lt!94814 (tuple2!3469 lt!94820 lt!94815)) lt!94817))))

(declare-fun addStillNotContains!96 (ListLongMap!2389 (_ BitVec 64) V!5569 (_ BitVec 64)) Unit!5753)

(assert (=> b!191029 (= lt!94818 (addStillNotContains!96 lt!94814 lt!94820 lt!94815 lt!94817))))

(assert (=> b!191029 (= lt!94817 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!191029 (= lt!94815 (get!2210 (select (arr!3819 (_values!3874 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191029 (= lt!94820 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191029 (= lt!94814 call!19257)))

(assert (=> b!191029 (= e!125699 (+!303 call!19257 (tuple2!3469 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000) (get!2210 (select (arr!3819 (_values!3874 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!191030 () Bool)

(declare-fun res!90281 () Bool)

(assert (=> b!191030 (=> (not res!90281) (not e!125701))))

(assert (=> b!191030 (= res!90281 (not (contains!1333 lt!94816 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!191031 () Bool)

(assert (=> b!191031 (= e!125697 e!125699)))

(declare-fun c!34383 () Bool)

(assert (=> b!191031 (= c!34383 (validKeyInArray!0 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191032 () Bool)

(assert (=> b!191032 (= e!125697 (ListLongMap!2390 Nil!2378))))

(declare-fun b!191033 () Bool)

(assert (=> b!191033 (= e!125696 e!125700)))

(declare-fun c!34382 () Bool)

(assert (=> b!191033 (= c!34382 (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun b!191034 () Bool)

(assert (=> b!191034 (= e!125702 (validKeyInArray!0 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191034 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!191035 () Bool)

(declare-fun isEmpty!488 (ListLongMap!2389) Bool)

(assert (=> b!191035 (= e!125700 (isEmpty!488 lt!94816))))

(assert (= (and d!56081 c!34384) b!191032))

(assert (= (and d!56081 (not c!34384)) b!191031))

(assert (= (and b!191031 c!34383) b!191029))

(assert (= (and b!191031 (not c!34383)) b!191027))

(assert (= (or b!191029 b!191027) bm!19254))

(assert (= (and d!56081 res!90279) b!191030))

(assert (= (and b!191030 res!90281) b!191028))

(assert (= (and b!191028 res!90280) b!191034))

(assert (= (and b!191028 c!34381) b!191026))

(assert (= (and b!191028 (not c!34381)) b!191033))

(assert (= (and b!191026 res!90278) b!191025))

(assert (= (and b!191033 c!34382) b!191024))

(assert (= (and b!191033 (not c!34382)) b!191035))

(declare-fun b_lambda!7397 () Bool)

(assert (=> (not b_lambda!7397) (not b!191025)))

(assert (=> b!191025 t!7287))

(declare-fun b_and!11351 () Bool)

(assert (= b_and!11349 (and (=> t!7287 result!4883) b_and!11351)))

(declare-fun b_lambda!7399 () Bool)

(assert (=> (not b_lambda!7399) (not b!191029)))

(assert (=> b!191029 t!7287))

(declare-fun b_and!11353 () Bool)

(assert (= b_and!11351 (and (=> t!7287 result!4883) b_and!11353)))

(assert (=> b!191031 m!217413))

(assert (=> b!191031 m!217413))

(assert (=> b!191031 m!217415))

(declare-fun m!217621 () Bool)

(assert (=> d!56081 m!217621))

(assert (=> d!56081 m!217307))

(declare-fun m!217623 () Bool)

(assert (=> b!191035 m!217623))

(declare-fun m!217625 () Bool)

(assert (=> b!191024 m!217625))

(assert (=> b!191025 m!217413))

(assert (=> b!191025 m!217509))

(assert (=> b!191025 m!217413))

(declare-fun m!217627 () Bool)

(assert (=> b!191025 m!217627))

(assert (=> b!191025 m!217455))

(assert (=> b!191025 m!217509))

(assert (=> b!191025 m!217455))

(assert (=> b!191025 m!217511))

(assert (=> bm!19254 m!217625))

(declare-fun m!217629 () Bool)

(assert (=> b!191030 m!217629))

(assert (=> b!191026 m!217413))

(assert (=> b!191026 m!217413))

(declare-fun m!217631 () Bool)

(assert (=> b!191026 m!217631))

(assert (=> b!191029 m!217413))

(assert (=> b!191029 m!217509))

(declare-fun m!217633 () Bool)

(assert (=> b!191029 m!217633))

(assert (=> b!191029 m!217455))

(declare-fun m!217635 () Bool)

(assert (=> b!191029 m!217635))

(assert (=> b!191029 m!217509))

(assert (=> b!191029 m!217455))

(assert (=> b!191029 m!217511))

(declare-fun m!217637 () Bool)

(assert (=> b!191029 m!217637))

(assert (=> b!191029 m!217635))

(declare-fun m!217639 () Bool)

(assert (=> b!191029 m!217639))

(assert (=> b!191034 m!217413))

(assert (=> b!191034 m!217413))

(assert (=> b!191034 m!217415))

(assert (=> b!190887 d!56081))

(declare-fun d!56083 () Bool)

(assert (=> d!56083 (contains!1333 (+!303 lt!94736 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248))) lt!94741)))

(declare-fun lt!94823 () Unit!5753)

(declare-fun choose!1038 (ListLongMap!2389 (_ BitVec 64) V!5569 (_ BitVec 64)) Unit!5753)

(assert (=> d!56083 (= lt!94823 (choose!1038 lt!94736 lt!94732 (zeroValue!3732 thiss!1248) lt!94741))))

(assert (=> d!56083 (contains!1333 lt!94736 lt!94741)))

(assert (=> d!56083 (= (addStillContains!156 lt!94736 lt!94732 (zeroValue!3732 thiss!1248) lt!94741) lt!94823)))

(declare-fun bs!7659 () Bool)

(assert (= bs!7659 d!56083))

(assert (=> bs!7659 m!217479))

(assert (=> bs!7659 m!217479))

(assert (=> bs!7659 m!217491))

(declare-fun m!217641 () Bool)

(assert (=> bs!7659 m!217641))

(declare-fun m!217643 () Bool)

(assert (=> bs!7659 m!217643))

(assert (=> b!190887 d!56083))

(declare-fun d!56085 () Bool)

(declare-fun e!125703 () Bool)

(assert (=> d!56085 e!125703))

(declare-fun res!90283 () Bool)

(assert (=> d!56085 (=> (not res!90283) (not e!125703))))

(declare-fun lt!94827 () ListLongMap!2389)

(assert (=> d!56085 (= res!90283 (contains!1333 lt!94827 (_1!1745 (tuple2!3469 lt!94738 (minValue!3732 thiss!1248)))))))

(declare-fun lt!94825 () List!2381)

(assert (=> d!56085 (= lt!94827 (ListLongMap!2390 lt!94825))))

(declare-fun lt!94826 () Unit!5753)

(declare-fun lt!94824 () Unit!5753)

(assert (=> d!56085 (= lt!94826 lt!94824)))

(assert (=> d!56085 (= (getValueByKey!238 lt!94825 (_1!1745 (tuple2!3469 lt!94738 (minValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94738 (minValue!3732 thiss!1248)))))))

(assert (=> d!56085 (= lt!94824 (lemmaContainsTupThenGetReturnValue!125 lt!94825 (_1!1745 (tuple2!3469 lt!94738 (minValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94738 (minValue!3732 thiss!1248)))))))

(assert (=> d!56085 (= lt!94825 (insertStrictlySorted!128 (toList!1210 lt!94743) (_1!1745 (tuple2!3469 lt!94738 (minValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94738 (minValue!3732 thiss!1248)))))))

(assert (=> d!56085 (= (+!303 lt!94743 (tuple2!3469 lt!94738 (minValue!3732 thiss!1248))) lt!94827)))

(declare-fun b!191037 () Bool)

(declare-fun res!90282 () Bool)

(assert (=> b!191037 (=> (not res!90282) (not e!125703))))

(assert (=> b!191037 (= res!90282 (= (getValueByKey!238 (toList!1210 lt!94827) (_1!1745 (tuple2!3469 lt!94738 (minValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94738 (minValue!3732 thiss!1248))))))))

(declare-fun b!191038 () Bool)

(assert (=> b!191038 (= e!125703 (contains!1336 (toList!1210 lt!94827) (tuple2!3469 lt!94738 (minValue!3732 thiss!1248))))))

(assert (= (and d!56085 res!90283) b!191037))

(assert (= (and b!191037 res!90282) b!191038))

(declare-fun m!217645 () Bool)

(assert (=> d!56085 m!217645))

(declare-fun m!217647 () Bool)

(assert (=> d!56085 m!217647))

(declare-fun m!217649 () Bool)

(assert (=> d!56085 m!217649))

(declare-fun m!217651 () Bool)

(assert (=> d!56085 m!217651))

(declare-fun m!217653 () Bool)

(assert (=> b!191037 m!217653))

(declare-fun m!217655 () Bool)

(assert (=> b!191038 m!217655))

(assert (=> b!190887 d!56085))

(declare-fun d!56087 () Bool)

(assert (=> d!56087 (= (apply!180 (+!303 lt!94743 (tuple2!3469 lt!94738 (minValue!3732 thiss!1248))) lt!94745) (get!2211 (getValueByKey!238 (toList!1210 (+!303 lt!94743 (tuple2!3469 lt!94738 (minValue!3732 thiss!1248)))) lt!94745)))))

(declare-fun bs!7660 () Bool)

(assert (= bs!7660 d!56087))

(declare-fun m!217657 () Bool)

(assert (=> bs!7660 m!217657))

(assert (=> bs!7660 m!217657))

(declare-fun m!217659 () Bool)

(assert (=> bs!7660 m!217659))

(assert (=> b!190887 d!56087))

(declare-fun d!56089 () Bool)

(declare-fun e!125705 () Bool)

(assert (=> d!56089 e!125705))

(declare-fun res!90284 () Bool)

(assert (=> d!56089 (=> res!90284 e!125705)))

(declare-fun lt!94831 () Bool)

(assert (=> d!56089 (= res!90284 (not lt!94831))))

(declare-fun lt!94830 () Bool)

(assert (=> d!56089 (= lt!94831 lt!94830)))

(declare-fun lt!94828 () Unit!5753)

(declare-fun e!125704 () Unit!5753)

(assert (=> d!56089 (= lt!94828 e!125704)))

(declare-fun c!34385 () Bool)

(assert (=> d!56089 (= c!34385 lt!94830)))

(assert (=> d!56089 (= lt!94830 (containsKey!241 (toList!1210 (+!303 lt!94736 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248)))) lt!94741))))

(assert (=> d!56089 (= (contains!1333 (+!303 lt!94736 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248))) lt!94741) lt!94831)))

(declare-fun b!191039 () Bool)

(declare-fun lt!94829 () Unit!5753)

(assert (=> b!191039 (= e!125704 lt!94829)))

(assert (=> b!191039 (= lt!94829 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1210 (+!303 lt!94736 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248)))) lt!94741))))

(assert (=> b!191039 (isDefined!190 (getValueByKey!238 (toList!1210 (+!303 lt!94736 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248)))) lt!94741))))

(declare-fun b!191040 () Bool)

(declare-fun Unit!5766 () Unit!5753)

(assert (=> b!191040 (= e!125704 Unit!5766)))

(declare-fun b!191041 () Bool)

(assert (=> b!191041 (= e!125705 (isDefined!190 (getValueByKey!238 (toList!1210 (+!303 lt!94736 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248)))) lt!94741)))))

(assert (= (and d!56089 c!34385) b!191039))

(assert (= (and d!56089 (not c!34385)) b!191040))

(assert (= (and d!56089 (not res!90284)) b!191041))

(declare-fun m!217661 () Bool)

(assert (=> d!56089 m!217661))

(declare-fun m!217663 () Bool)

(assert (=> b!191039 m!217663))

(declare-fun m!217665 () Bool)

(assert (=> b!191039 m!217665))

(assert (=> b!191039 m!217665))

(declare-fun m!217667 () Bool)

(assert (=> b!191039 m!217667))

(assert (=> b!191041 m!217665))

(assert (=> b!191041 m!217665))

(assert (=> b!191041 m!217667))

(assert (=> b!190887 d!56089))

(declare-fun d!56091 () Bool)

(declare-fun e!125706 () Bool)

(assert (=> d!56091 e!125706))

(declare-fun res!90286 () Bool)

(assert (=> d!56091 (=> (not res!90286) (not e!125706))))

(declare-fun lt!94835 () ListLongMap!2389)

(assert (=> d!56091 (= res!90286 (contains!1333 lt!94835 (_1!1745 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248)))))))

(declare-fun lt!94833 () List!2381)

(assert (=> d!56091 (= lt!94835 (ListLongMap!2390 lt!94833))))

(declare-fun lt!94834 () Unit!5753)

(declare-fun lt!94832 () Unit!5753)

(assert (=> d!56091 (= lt!94834 lt!94832)))

(assert (=> d!56091 (= (getValueByKey!238 lt!94833 (_1!1745 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!56091 (= lt!94832 (lemmaContainsTupThenGetReturnValue!125 lt!94833 (_1!1745 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!56091 (= lt!94833 (insertStrictlySorted!128 (toList!1210 lt!94736) (_1!1745 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!56091 (= (+!303 lt!94736 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248))) lt!94835)))

(declare-fun b!191042 () Bool)

(declare-fun res!90285 () Bool)

(assert (=> b!191042 (=> (not res!90285) (not e!125706))))

(assert (=> b!191042 (= res!90285 (= (getValueByKey!238 (toList!1210 lt!94835) (_1!1745 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248))))))))

(declare-fun b!191043 () Bool)

(assert (=> b!191043 (= e!125706 (contains!1336 (toList!1210 lt!94835) (tuple2!3469 lt!94732 (zeroValue!3732 thiss!1248))))))

(assert (= (and d!56091 res!90286) b!191042))

(assert (= (and b!191042 res!90285) b!191043))

(declare-fun m!217669 () Bool)

(assert (=> d!56091 m!217669))

(declare-fun m!217671 () Bool)

(assert (=> d!56091 m!217671))

(declare-fun m!217673 () Bool)

(assert (=> d!56091 m!217673))

(declare-fun m!217675 () Bool)

(assert (=> d!56091 m!217675))

(declare-fun m!217677 () Bool)

(assert (=> b!191042 m!217677))

(declare-fun m!217679 () Bool)

(assert (=> b!191043 m!217679))

(assert (=> b!190887 d!56091))

(declare-fun d!56093 () Bool)

(assert (=> d!56093 (= (apply!180 (+!303 lt!94750 (tuple2!3469 lt!94752 (zeroValue!3732 thiss!1248))) lt!94751) (apply!180 lt!94750 lt!94751))))

(declare-fun lt!94838 () Unit!5753)

(declare-fun choose!1039 (ListLongMap!2389 (_ BitVec 64) V!5569 (_ BitVec 64)) Unit!5753)

(assert (=> d!56093 (= lt!94838 (choose!1039 lt!94750 lt!94752 (zeroValue!3732 thiss!1248) lt!94751))))

(declare-fun e!125709 () Bool)

(assert (=> d!56093 e!125709))

(declare-fun res!90289 () Bool)

(assert (=> d!56093 (=> (not res!90289) (not e!125709))))

(assert (=> d!56093 (= res!90289 (contains!1333 lt!94750 lt!94751))))

(assert (=> d!56093 (= (addApplyDifferent!156 lt!94750 lt!94752 (zeroValue!3732 thiss!1248) lt!94751) lt!94838)))

(declare-fun b!191047 () Bool)

(assert (=> b!191047 (= e!125709 (not (= lt!94751 lt!94752)))))

(assert (= (and d!56093 res!90289) b!191047))

(declare-fun m!217681 () Bool)

(assert (=> d!56093 m!217681))

(assert (=> d!56093 m!217481))

(assert (=> d!56093 m!217483))

(declare-fun m!217683 () Bool)

(assert (=> d!56093 m!217683))

(assert (=> d!56093 m!217481))

(assert (=> d!56093 m!217495))

(assert (=> b!190887 d!56093))

(declare-fun d!56095 () Bool)

(assert (=> d!56095 (= (apply!180 lt!94750 lt!94751) (get!2211 (getValueByKey!238 (toList!1210 lt!94750) lt!94751)))))

(declare-fun bs!7661 () Bool)

(assert (= bs!7661 d!56095))

(declare-fun m!217685 () Bool)

(assert (=> bs!7661 m!217685))

(assert (=> bs!7661 m!217685))

(declare-fun m!217687 () Bool)

(assert (=> bs!7661 m!217687))

(assert (=> b!190887 d!56095))

(declare-fun d!56097 () Bool)

(assert (=> d!56097 (= (apply!180 (+!303 lt!94750 (tuple2!3469 lt!94752 (zeroValue!3732 thiss!1248))) lt!94751) (get!2211 (getValueByKey!238 (toList!1210 (+!303 lt!94750 (tuple2!3469 lt!94752 (zeroValue!3732 thiss!1248)))) lt!94751)))))

(declare-fun bs!7662 () Bool)

(assert (= bs!7662 d!56097))

(declare-fun m!217689 () Bool)

(assert (=> bs!7662 m!217689))

(assert (=> bs!7662 m!217689))

(declare-fun m!217691 () Bool)

(assert (=> bs!7662 m!217691))

(assert (=> b!190887 d!56097))

(declare-fun d!56099 () Bool)

(assert (=> d!56099 (= (apply!180 (+!303 lt!94749 (tuple2!3469 lt!94735 (minValue!3732 thiss!1248))) lt!94742) (apply!180 lt!94749 lt!94742))))

(declare-fun lt!94839 () Unit!5753)

(assert (=> d!56099 (= lt!94839 (choose!1039 lt!94749 lt!94735 (minValue!3732 thiss!1248) lt!94742))))

(declare-fun e!125710 () Bool)

(assert (=> d!56099 e!125710))

(declare-fun res!90290 () Bool)

(assert (=> d!56099 (=> (not res!90290) (not e!125710))))

(assert (=> d!56099 (= res!90290 (contains!1333 lt!94749 lt!94742))))

(assert (=> d!56099 (= (addApplyDifferent!156 lt!94749 lt!94735 (minValue!3732 thiss!1248) lt!94742) lt!94839)))

(declare-fun b!191048 () Bool)

(assert (=> b!191048 (= e!125710 (not (= lt!94742 lt!94735)))))

(assert (= (and d!56099 res!90290) b!191048))

(declare-fun m!217693 () Bool)

(assert (=> d!56099 m!217693))

(assert (=> d!56099 m!217475))

(assert (=> d!56099 m!217477))

(declare-fun m!217695 () Bool)

(assert (=> d!56099 m!217695))

(assert (=> d!56099 m!217475))

(assert (=> d!56099 m!217503))

(assert (=> b!190887 d!56099))

(declare-fun d!56101 () Bool)

(assert (=> d!56101 (= (apply!180 lt!94749 lt!94742) (get!2211 (getValueByKey!238 (toList!1210 lt!94749) lt!94742)))))

(declare-fun bs!7663 () Bool)

(assert (= bs!7663 d!56101))

(declare-fun m!217697 () Bool)

(assert (=> bs!7663 m!217697))

(assert (=> bs!7663 m!217697))

(declare-fun m!217699 () Bool)

(assert (=> bs!7663 m!217699))

(assert (=> b!190887 d!56101))

(declare-fun d!56103 () Bool)

(assert (=> d!56103 (= (apply!180 (+!303 lt!94743 (tuple2!3469 lt!94738 (minValue!3732 thiss!1248))) lt!94745) (apply!180 lt!94743 lt!94745))))

(declare-fun lt!94840 () Unit!5753)

(assert (=> d!56103 (= lt!94840 (choose!1039 lt!94743 lt!94738 (minValue!3732 thiss!1248) lt!94745))))

(declare-fun e!125711 () Bool)

(assert (=> d!56103 e!125711))

(declare-fun res!90291 () Bool)

(assert (=> d!56103 (=> (not res!90291) (not e!125711))))

(assert (=> d!56103 (= res!90291 (contains!1333 lt!94743 lt!94745))))

(assert (=> d!56103 (= (addApplyDifferent!156 lt!94743 lt!94738 (minValue!3732 thiss!1248) lt!94745) lt!94840)))

(declare-fun b!191049 () Bool)

(assert (=> b!191049 (= e!125711 (not (= lt!94745 lt!94738)))))

(assert (= (and d!56103 res!90291) b!191049))

(declare-fun m!217701 () Bool)

(assert (=> d!56103 m!217701))

(assert (=> d!56103 m!217487))

(assert (=> d!56103 m!217489))

(declare-fun m!217703 () Bool)

(assert (=> d!56103 m!217703))

(assert (=> d!56103 m!217487))

(assert (=> d!56103 m!217493))

(assert (=> b!190887 d!56103))

(declare-fun d!56105 () Bool)

(declare-fun e!125712 () Bool)

(assert (=> d!56105 e!125712))

(declare-fun res!90293 () Bool)

(assert (=> d!56105 (=> (not res!90293) (not e!125712))))

(declare-fun lt!94844 () ListLongMap!2389)

(assert (=> d!56105 (= res!90293 (contains!1333 lt!94844 (_1!1745 (tuple2!3469 lt!94752 (zeroValue!3732 thiss!1248)))))))

(declare-fun lt!94842 () List!2381)

(assert (=> d!56105 (= lt!94844 (ListLongMap!2390 lt!94842))))

(declare-fun lt!94843 () Unit!5753)

(declare-fun lt!94841 () Unit!5753)

(assert (=> d!56105 (= lt!94843 lt!94841)))

(assert (=> d!56105 (= (getValueByKey!238 lt!94842 (_1!1745 (tuple2!3469 lt!94752 (zeroValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94752 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!56105 (= lt!94841 (lemmaContainsTupThenGetReturnValue!125 lt!94842 (_1!1745 (tuple2!3469 lt!94752 (zeroValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94752 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!56105 (= lt!94842 (insertStrictlySorted!128 (toList!1210 lt!94750) (_1!1745 (tuple2!3469 lt!94752 (zeroValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94752 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!56105 (= (+!303 lt!94750 (tuple2!3469 lt!94752 (zeroValue!3732 thiss!1248))) lt!94844)))

(declare-fun b!191050 () Bool)

(declare-fun res!90292 () Bool)

(assert (=> b!191050 (=> (not res!90292) (not e!125712))))

(assert (=> b!191050 (= res!90292 (= (getValueByKey!238 (toList!1210 lt!94844) (_1!1745 (tuple2!3469 lt!94752 (zeroValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94752 (zeroValue!3732 thiss!1248))))))))

(declare-fun b!191051 () Bool)

(assert (=> b!191051 (= e!125712 (contains!1336 (toList!1210 lt!94844) (tuple2!3469 lt!94752 (zeroValue!3732 thiss!1248))))))

(assert (= (and d!56105 res!90293) b!191050))

(assert (= (and b!191050 res!90292) b!191051))

(declare-fun m!217705 () Bool)

(assert (=> d!56105 m!217705))

(declare-fun m!217707 () Bool)

(assert (=> d!56105 m!217707))

(declare-fun m!217709 () Bool)

(assert (=> d!56105 m!217709))

(declare-fun m!217711 () Bool)

(assert (=> d!56105 m!217711))

(declare-fun m!217713 () Bool)

(assert (=> b!191050 m!217713))

(declare-fun m!217715 () Bool)

(assert (=> b!191051 m!217715))

(assert (=> b!190887 d!56105))

(declare-fun d!56107 () Bool)

(declare-fun e!125713 () Bool)

(assert (=> d!56107 e!125713))

(declare-fun res!90295 () Bool)

(assert (=> d!56107 (=> (not res!90295) (not e!125713))))

(declare-fun lt!94848 () ListLongMap!2389)

(assert (=> d!56107 (= res!90295 (contains!1333 lt!94848 (_1!1745 (tuple2!3469 lt!94735 (minValue!3732 thiss!1248)))))))

(declare-fun lt!94846 () List!2381)

(assert (=> d!56107 (= lt!94848 (ListLongMap!2390 lt!94846))))

(declare-fun lt!94847 () Unit!5753)

(declare-fun lt!94845 () Unit!5753)

(assert (=> d!56107 (= lt!94847 lt!94845)))

(assert (=> d!56107 (= (getValueByKey!238 lt!94846 (_1!1745 (tuple2!3469 lt!94735 (minValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94735 (minValue!3732 thiss!1248)))))))

(assert (=> d!56107 (= lt!94845 (lemmaContainsTupThenGetReturnValue!125 lt!94846 (_1!1745 (tuple2!3469 lt!94735 (minValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94735 (minValue!3732 thiss!1248)))))))

(assert (=> d!56107 (= lt!94846 (insertStrictlySorted!128 (toList!1210 lt!94749) (_1!1745 (tuple2!3469 lt!94735 (minValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94735 (minValue!3732 thiss!1248)))))))

(assert (=> d!56107 (= (+!303 lt!94749 (tuple2!3469 lt!94735 (minValue!3732 thiss!1248))) lt!94848)))

(declare-fun b!191052 () Bool)

(declare-fun res!90294 () Bool)

(assert (=> b!191052 (=> (not res!90294) (not e!125713))))

(assert (=> b!191052 (= res!90294 (= (getValueByKey!238 (toList!1210 lt!94848) (_1!1745 (tuple2!3469 lt!94735 (minValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94735 (minValue!3732 thiss!1248))))))))

(declare-fun b!191053 () Bool)

(assert (=> b!191053 (= e!125713 (contains!1336 (toList!1210 lt!94848) (tuple2!3469 lt!94735 (minValue!3732 thiss!1248))))))

(assert (= (and d!56107 res!90295) b!191052))

(assert (= (and b!191052 res!90294) b!191053))

(declare-fun m!217717 () Bool)

(assert (=> d!56107 m!217717))

(declare-fun m!217719 () Bool)

(assert (=> d!56107 m!217719))

(declare-fun m!217721 () Bool)

(assert (=> d!56107 m!217721))

(declare-fun m!217723 () Bool)

(assert (=> d!56107 m!217723))

(declare-fun m!217725 () Bool)

(assert (=> b!191052 m!217725))

(declare-fun m!217727 () Bool)

(assert (=> b!191053 m!217727))

(assert (=> b!190887 d!56107))

(declare-fun d!56109 () Bool)

(assert (=> d!56109 (= (apply!180 (+!303 lt!94749 (tuple2!3469 lt!94735 (minValue!3732 thiss!1248))) lt!94742) (get!2211 (getValueByKey!238 (toList!1210 (+!303 lt!94749 (tuple2!3469 lt!94735 (minValue!3732 thiss!1248)))) lt!94742)))))

(declare-fun bs!7664 () Bool)

(assert (= bs!7664 d!56109))

(declare-fun m!217729 () Bool)

(assert (=> bs!7664 m!217729))

(assert (=> bs!7664 m!217729))

(declare-fun m!217731 () Bool)

(assert (=> bs!7664 m!217731))

(assert (=> b!190887 d!56109))

(declare-fun d!56111 () Bool)

(declare-fun e!125715 () Bool)

(assert (=> d!56111 e!125715))

(declare-fun res!90296 () Bool)

(assert (=> d!56111 (=> res!90296 e!125715)))

(declare-fun lt!94852 () Bool)

(assert (=> d!56111 (= res!90296 (not lt!94852))))

(declare-fun lt!94851 () Bool)

(assert (=> d!56111 (= lt!94852 lt!94851)))

(declare-fun lt!94849 () Unit!5753)

(declare-fun e!125714 () Unit!5753)

(assert (=> d!56111 (= lt!94849 e!125714)))

(declare-fun c!34386 () Bool)

(assert (=> d!56111 (= c!34386 lt!94851)))

(assert (=> d!56111 (= lt!94851 (containsKey!241 (toList!1210 lt!94722) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56111 (= (contains!1333 lt!94722 #b1000000000000000000000000000000000000000000000000000000000000000) lt!94852)))

(declare-fun b!191054 () Bool)

(declare-fun lt!94850 () Unit!5753)

(assert (=> b!191054 (= e!125714 lt!94850)))

(assert (=> b!191054 (= lt!94850 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1210 lt!94722) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191054 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94722) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191055 () Bool)

(declare-fun Unit!5767 () Unit!5753)

(assert (=> b!191055 (= e!125714 Unit!5767)))

(declare-fun b!191056 () Bool)

(assert (=> b!191056 (= e!125715 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56111 c!34386) b!191054))

(assert (= (and d!56111 (not c!34386)) b!191055))

(assert (= (and d!56111 (not res!90296)) b!191056))

(declare-fun m!217733 () Bool)

(assert (=> d!56111 m!217733))

(declare-fun m!217735 () Bool)

(assert (=> b!191054 m!217735))

(declare-fun m!217737 () Bool)

(assert (=> b!191054 m!217737))

(assert (=> b!191054 m!217737))

(declare-fun m!217739 () Bool)

(assert (=> b!191054 m!217739))

(assert (=> b!191056 m!217737))

(assert (=> b!191056 m!217737))

(assert (=> b!191056 m!217739))

(assert (=> bm!19243 d!56111))

(declare-fun lt!94855 () ListLongMap!2389)

(declare-fun e!125720 () Bool)

(declare-fun b!191057 () Bool)

(assert (=> b!191057 (= e!125720 (= lt!94855 (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248))) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3891 thiss!1248))))))

(declare-fun b!191058 () Bool)

(assert (=> b!191058 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(assert (=> b!191058 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4140 (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248))))))))

(declare-fun e!125718 () Bool)

(assert (=> b!191058 (= e!125718 (= (apply!180 lt!94855 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)) (get!2210 (select (arr!3819 (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!56113 () Bool)

(declare-fun e!125721 () Bool)

(assert (=> d!56113 e!125721))

(declare-fun res!90298 () Bool)

(assert (=> d!56113 (=> (not res!90298) (not e!125721))))

(assert (=> d!56113 (= res!90298 (not (contains!1333 lt!94855 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!125717 () ListLongMap!2389)

(assert (=> d!56113 (= lt!94855 e!125717)))

(declare-fun c!34390 () Bool)

(assert (=> d!56113 (= c!34390 (bvsge #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(assert (=> d!56113 (validMask!0 (mask!9098 thiss!1248))))

(assert (=> d!56113 (= (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248))) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)) lt!94855)))

(declare-fun b!191059 () Bool)

(declare-fun e!125716 () Bool)

(assert (=> b!191059 (= e!125716 e!125718)))

(assert (=> b!191059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun res!90297 () Bool)

(assert (=> b!191059 (= res!90297 (contains!1333 lt!94855 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191059 (=> (not res!90297) (not e!125718))))

(declare-fun bm!19255 () Bool)

(declare-fun call!19258 () ListLongMap!2389)

(assert (=> bm!19255 (= call!19258 (getCurrentListMapNoExtraKeys!211 (_keys!5864 thiss!1248) (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248))) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3891 thiss!1248)))))

(declare-fun b!191060 () Bool)

(declare-fun e!125719 () ListLongMap!2389)

(assert (=> b!191060 (= e!125719 call!19258)))

(declare-fun b!191061 () Bool)

(assert (=> b!191061 (= e!125721 e!125716)))

(declare-fun c!34387 () Bool)

(declare-fun e!125722 () Bool)

(assert (=> b!191061 (= c!34387 e!125722)))

(declare-fun res!90299 () Bool)

(assert (=> b!191061 (=> (not res!90299) (not e!125722))))

(assert (=> b!191061 (= res!90299 (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun b!191062 () Bool)

(declare-fun lt!94858 () Unit!5753)

(declare-fun lt!94857 () Unit!5753)

(assert (=> b!191062 (= lt!94858 lt!94857)))

(declare-fun lt!94853 () ListLongMap!2389)

(declare-fun lt!94856 () (_ BitVec 64))

(declare-fun lt!94854 () V!5569)

(declare-fun lt!94859 () (_ BitVec 64))

(assert (=> b!191062 (not (contains!1333 (+!303 lt!94853 (tuple2!3469 lt!94859 lt!94854)) lt!94856))))

(assert (=> b!191062 (= lt!94857 (addStillNotContains!96 lt!94853 lt!94859 lt!94854 lt!94856))))

(assert (=> b!191062 (= lt!94856 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!191062 (= lt!94854 (get!2210 (select (arr!3819 (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191062 (= lt!94859 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191062 (= lt!94853 call!19258)))

(assert (=> b!191062 (= e!125719 (+!303 call!19258 (tuple2!3469 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000) (get!2210 (select (arr!3819 (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!191063 () Bool)

(declare-fun res!90300 () Bool)

(assert (=> b!191063 (=> (not res!90300) (not e!125721))))

(assert (=> b!191063 (= res!90300 (not (contains!1333 lt!94855 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!191064 () Bool)

(assert (=> b!191064 (= e!125717 e!125719)))

(declare-fun c!34389 () Bool)

(assert (=> b!191064 (= c!34389 (validKeyInArray!0 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191065 () Bool)

(assert (=> b!191065 (= e!125717 (ListLongMap!2390 Nil!2378))))

(declare-fun b!191066 () Bool)

(assert (=> b!191066 (= e!125716 e!125720)))

(declare-fun c!34388 () Bool)

(assert (=> b!191066 (= c!34388 (bvslt #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun b!191067 () Bool)

(assert (=> b!191067 (= e!125722 (validKeyInArray!0 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191067 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!191068 () Bool)

(assert (=> b!191068 (= e!125720 (isEmpty!488 lt!94855))))

(assert (= (and d!56113 c!34390) b!191065))

(assert (= (and d!56113 (not c!34390)) b!191064))

(assert (= (and b!191064 c!34389) b!191062))

(assert (= (and b!191064 (not c!34389)) b!191060))

(assert (= (or b!191062 b!191060) bm!19255))

(assert (= (and d!56113 res!90298) b!191063))

(assert (= (and b!191063 res!90300) b!191061))

(assert (= (and b!191061 res!90299) b!191067))

(assert (= (and b!191061 c!34387) b!191059))

(assert (= (and b!191061 (not c!34387)) b!191066))

(assert (= (and b!191059 res!90297) b!191058))

(assert (= (and b!191066 c!34388) b!191057))

(assert (= (and b!191066 (not c!34388)) b!191068))

(declare-fun b_lambda!7401 () Bool)

(assert (=> (not b_lambda!7401) (not b!191058)))

(assert (=> b!191058 t!7287))

(declare-fun b_and!11355 () Bool)

(assert (= b_and!11353 (and (=> t!7287 result!4883) b_and!11355)))

(declare-fun b_lambda!7403 () Bool)

(assert (=> (not b_lambda!7403) (not b!191062)))

(assert (=> b!191062 t!7287))

(declare-fun b_and!11357 () Bool)

(assert (= b_and!11355 (and (=> t!7287 result!4883) b_and!11357)))

(assert (=> b!191064 m!217413))

(assert (=> b!191064 m!217413))

(assert (=> b!191064 m!217415))

(declare-fun m!217741 () Bool)

(assert (=> d!56113 m!217741))

(assert (=> d!56113 m!217307))

(declare-fun m!217743 () Bool)

(assert (=> b!191068 m!217743))

(declare-fun m!217745 () Bool)

(assert (=> b!191057 m!217745))

(assert (=> b!191058 m!217413))

(assert (=> b!191058 m!217457))

(assert (=> b!191058 m!217413))

(declare-fun m!217747 () Bool)

(assert (=> b!191058 m!217747))

(assert (=> b!191058 m!217455))

(assert (=> b!191058 m!217457))

(assert (=> b!191058 m!217455))

(assert (=> b!191058 m!217459))

(assert (=> bm!19255 m!217745))

(declare-fun m!217749 () Bool)

(assert (=> b!191063 m!217749))

(assert (=> b!191059 m!217413))

(assert (=> b!191059 m!217413))

(declare-fun m!217751 () Bool)

(assert (=> b!191059 m!217751))

(assert (=> b!191062 m!217413))

(assert (=> b!191062 m!217457))

(declare-fun m!217753 () Bool)

(assert (=> b!191062 m!217753))

(assert (=> b!191062 m!217455))

(declare-fun m!217755 () Bool)

(assert (=> b!191062 m!217755))

(assert (=> b!191062 m!217457))

(assert (=> b!191062 m!217455))

(assert (=> b!191062 m!217459))

(declare-fun m!217757 () Bool)

(assert (=> b!191062 m!217757))

(assert (=> b!191062 m!217755))

(declare-fun m!217759 () Bool)

(assert (=> b!191062 m!217759))

(assert (=> b!191067 m!217413))

(assert (=> b!191067 m!217413))

(assert (=> b!191067 m!217415))

(assert (=> bm!19239 d!56113))

(declare-fun d!56115 () Bool)

(declare-fun res!90305 () Bool)

(declare-fun e!125727 () Bool)

(assert (=> d!56115 (=> res!90305 e!125727)))

(assert (=> d!56115 (= res!90305 (= (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!56115 (= (arrayContainsKey!0 (_keys!5864 thiss!1248) key!828 #b00000000000000000000000000000000) e!125727)))

(declare-fun b!191073 () Bool)

(declare-fun e!125728 () Bool)

(assert (=> b!191073 (= e!125727 e!125728)))

(declare-fun res!90306 () Bool)

(assert (=> b!191073 (=> (not res!90306) (not e!125728))))

(assert (=> b!191073 (= res!90306 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun b!191074 () Bool)

(assert (=> b!191074 (= e!125728 (arrayContainsKey!0 (_keys!5864 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!56115 (not res!90305)) b!191073))

(assert (= (and b!191073 res!90306) b!191074))

(assert (=> d!56115 m!217413))

(declare-fun m!217761 () Bool)

(assert (=> b!191074 m!217761))

(assert (=> bm!19222 d!56115))

(assert (=> d!56035 d!56029))

(declare-fun d!56117 () Bool)

(declare-fun e!125730 () Bool)

(assert (=> d!56117 e!125730))

(declare-fun res!90307 () Bool)

(assert (=> d!56117 (=> res!90307 e!125730)))

(declare-fun lt!94863 () Bool)

(assert (=> d!56117 (= res!90307 (not lt!94863))))

(declare-fun lt!94862 () Bool)

(assert (=> d!56117 (= lt!94863 lt!94862)))

(declare-fun lt!94860 () Unit!5753)

(declare-fun e!125729 () Unit!5753)

(assert (=> d!56117 (= lt!94860 e!125729)))

(declare-fun c!34391 () Bool)

(assert (=> d!56117 (= c!34391 lt!94862)))

(assert (=> d!56117 (= lt!94862 (containsKey!241 (toList!1210 lt!94744) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56117 (= (contains!1333 lt!94744 #b0000000000000000000000000000000000000000000000000000000000000000) lt!94863)))

(declare-fun b!191075 () Bool)

(declare-fun lt!94861 () Unit!5753)

(assert (=> b!191075 (= e!125729 lt!94861)))

(assert (=> b!191075 (= lt!94861 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1210 lt!94744) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191075 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94744) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191076 () Bool)

(declare-fun Unit!5768 () Unit!5753)

(assert (=> b!191076 (= e!125729 Unit!5768)))

(declare-fun b!191077 () Bool)

(assert (=> b!191077 (= e!125730 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94744) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56117 c!34391) b!191075))

(assert (= (and d!56117 (not c!34391)) b!191076))

(assert (= (and d!56117 (not res!90307)) b!191077))

(declare-fun m!217763 () Bool)

(assert (=> d!56117 m!217763))

(declare-fun m!217765 () Bool)

(assert (=> b!191075 m!217765))

(declare-fun m!217767 () Bool)

(assert (=> b!191075 m!217767))

(assert (=> b!191075 m!217767))

(declare-fun m!217769 () Bool)

(assert (=> b!191075 m!217769))

(assert (=> b!191077 m!217767))

(assert (=> b!191077 m!217767))

(assert (=> b!191077 m!217769))

(assert (=> bm!19247 d!56117))

(assert (=> d!56033 d!56029))

(declare-fun d!56119 () Bool)

(declare-fun e!125732 () Bool)

(assert (=> d!56119 e!125732))

(declare-fun res!90308 () Bool)

(assert (=> d!56119 (=> res!90308 e!125732)))

(declare-fun lt!94867 () Bool)

(assert (=> d!56119 (= res!90308 (not lt!94867))))

(declare-fun lt!94866 () Bool)

(assert (=> d!56119 (= lt!94867 lt!94866)))

(declare-fun lt!94864 () Unit!5753)

(declare-fun e!125731 () Unit!5753)

(assert (=> d!56119 (= lt!94864 e!125731)))

(declare-fun c!34392 () Bool)

(assert (=> d!56119 (= c!34392 lt!94866)))

(assert (=> d!56119 (= lt!94866 (containsKey!241 (toList!1210 lt!94650) (_1!1745 (tuple2!3469 key!828 v!309))))))

(assert (=> d!56119 (= (contains!1333 lt!94650 (_1!1745 (tuple2!3469 key!828 v!309))) lt!94867)))

(declare-fun b!191078 () Bool)

(declare-fun lt!94865 () Unit!5753)

(assert (=> b!191078 (= e!125731 lt!94865)))

(assert (=> b!191078 (= lt!94865 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1210 lt!94650) (_1!1745 (tuple2!3469 key!828 v!309))))))

(assert (=> b!191078 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94650) (_1!1745 (tuple2!3469 key!828 v!309))))))

(declare-fun b!191079 () Bool)

(declare-fun Unit!5769 () Unit!5753)

(assert (=> b!191079 (= e!125731 Unit!5769)))

(declare-fun b!191080 () Bool)

(assert (=> b!191080 (= e!125732 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94650) (_1!1745 (tuple2!3469 key!828 v!309)))))))

(assert (= (and d!56119 c!34392) b!191078))

(assert (= (and d!56119 (not c!34392)) b!191079))

(assert (= (and d!56119 (not res!90308)) b!191080))

(declare-fun m!217771 () Bool)

(assert (=> d!56119 m!217771))

(declare-fun m!217773 () Bool)

(assert (=> b!191078 m!217773))

(assert (=> b!191078 m!217393))

(assert (=> b!191078 m!217393))

(declare-fun m!217775 () Bool)

(assert (=> b!191078 m!217775))

(assert (=> b!191080 m!217393))

(assert (=> b!191080 m!217393))

(assert (=> b!191080 m!217775))

(assert (=> d!56025 d!56119))

(declare-fun c!34393 () Bool)

(declare-fun d!56121 () Bool)

(assert (=> d!56121 (= c!34393 (and ((_ is Cons!2377) lt!94648) (= (_1!1745 (h!3015 lt!94648)) (_1!1745 (tuple2!3469 key!828 v!309)))))))

(declare-fun e!125733 () Option!244)

(assert (=> d!56121 (= (getValueByKey!238 lt!94648 (_1!1745 (tuple2!3469 key!828 v!309))) e!125733)))

(declare-fun e!125734 () Option!244)

(declare-fun b!191083 () Bool)

(assert (=> b!191083 (= e!125734 (getValueByKey!238 (t!7283 lt!94648) (_1!1745 (tuple2!3469 key!828 v!309))))))

(declare-fun b!191082 () Bool)

(assert (=> b!191082 (= e!125733 e!125734)))

(declare-fun c!34394 () Bool)

(assert (=> b!191082 (= c!34394 (and ((_ is Cons!2377) lt!94648) (not (= (_1!1745 (h!3015 lt!94648)) (_1!1745 (tuple2!3469 key!828 v!309))))))))

(declare-fun b!191081 () Bool)

(assert (=> b!191081 (= e!125733 (Some!243 (_2!1745 (h!3015 lt!94648))))))

(declare-fun b!191084 () Bool)

(assert (=> b!191084 (= e!125734 None!242)))

(assert (= (and d!56121 c!34393) b!191081))

(assert (= (and d!56121 (not c!34393)) b!191082))

(assert (= (and b!191082 c!34394) b!191083))

(assert (= (and b!191082 (not c!34394)) b!191084))

(declare-fun m!217777 () Bool)

(assert (=> b!191083 m!217777))

(assert (=> d!56025 d!56121))

(declare-fun d!56123 () Bool)

(assert (=> d!56123 (= (getValueByKey!238 lt!94648 (_1!1745 (tuple2!3469 key!828 v!309))) (Some!243 (_2!1745 (tuple2!3469 key!828 v!309))))))

(declare-fun lt!94870 () Unit!5753)

(declare-fun choose!1040 (List!2381 (_ BitVec 64) V!5569) Unit!5753)

(assert (=> d!56123 (= lt!94870 (choose!1040 lt!94648 (_1!1745 (tuple2!3469 key!828 v!309)) (_2!1745 (tuple2!3469 key!828 v!309))))))

(declare-fun e!125737 () Bool)

(assert (=> d!56123 e!125737))

(declare-fun res!90313 () Bool)

(assert (=> d!56123 (=> (not res!90313) (not e!125737))))

(assert (=> d!56123 (= res!90313 (isStrictlySorted!341 lt!94648))))

(assert (=> d!56123 (= (lemmaContainsTupThenGetReturnValue!125 lt!94648 (_1!1745 (tuple2!3469 key!828 v!309)) (_2!1745 (tuple2!3469 key!828 v!309))) lt!94870)))

(declare-fun b!191089 () Bool)

(declare-fun res!90314 () Bool)

(assert (=> b!191089 (=> (not res!90314) (not e!125737))))

(assert (=> b!191089 (= res!90314 (containsKey!241 lt!94648 (_1!1745 (tuple2!3469 key!828 v!309))))))

(declare-fun b!191090 () Bool)

(assert (=> b!191090 (= e!125737 (contains!1336 lt!94648 (tuple2!3469 (_1!1745 (tuple2!3469 key!828 v!309)) (_2!1745 (tuple2!3469 key!828 v!309)))))))

(assert (= (and d!56123 res!90313) b!191089))

(assert (= (and b!191089 res!90314) b!191090))

(assert (=> d!56123 m!217387))

(declare-fun m!217779 () Bool)

(assert (=> d!56123 m!217779))

(declare-fun m!217781 () Bool)

(assert (=> d!56123 m!217781))

(declare-fun m!217783 () Bool)

(assert (=> b!191089 m!217783))

(declare-fun m!217785 () Bool)

(assert (=> b!191090 m!217785))

(assert (=> d!56025 d!56123))

(declare-fun bm!19262 () Bool)

(declare-fun call!19266 () List!2381)

(declare-fun call!19267 () List!2381)

(assert (=> bm!19262 (= call!19266 call!19267)))

(declare-fun b!191111 () Bool)

(declare-fun e!125751 () List!2381)

(assert (=> b!191111 (= e!125751 call!19267)))

(declare-fun bm!19263 () Bool)

(declare-fun call!19265 () List!2381)

(assert (=> bm!19263 (= call!19265 call!19266)))

(declare-fun e!125750 () Bool)

(declare-fun lt!94873 () List!2381)

(declare-fun b!191113 () Bool)

(assert (=> b!191113 (= e!125750 (contains!1336 lt!94873 (tuple2!3469 (_1!1745 (tuple2!3469 key!828 v!309)) (_2!1745 (tuple2!3469 key!828 v!309)))))))

(declare-fun b!191114 () Bool)

(declare-fun e!125749 () List!2381)

(assert (=> b!191114 (= e!125749 call!19266)))

(declare-fun b!191115 () Bool)

(declare-fun e!125752 () List!2381)

(assert (=> b!191115 (= e!125752 call!19265)))

(declare-fun e!125748 () List!2381)

(declare-fun b!191116 () Bool)

(assert (=> b!191116 (= e!125748 (insertStrictlySorted!128 (t!7283 (toList!1210 lt!94596)) (_1!1745 (tuple2!3469 key!828 v!309)) (_2!1745 (tuple2!3469 key!828 v!309))))))

(declare-fun d!56125 () Bool)

(assert (=> d!56125 e!125750))

(declare-fun res!90320 () Bool)

(assert (=> d!56125 (=> (not res!90320) (not e!125750))))

(assert (=> d!56125 (= res!90320 (isStrictlySorted!341 lt!94873))))

(assert (=> d!56125 (= lt!94873 e!125751)))

(declare-fun c!34404 () Bool)

(assert (=> d!56125 (= c!34404 (and ((_ is Cons!2377) (toList!1210 lt!94596)) (bvslt (_1!1745 (h!3015 (toList!1210 lt!94596))) (_1!1745 (tuple2!3469 key!828 v!309)))))))

(assert (=> d!56125 (isStrictlySorted!341 (toList!1210 lt!94596))))

(assert (=> d!56125 (= (insertStrictlySorted!128 (toList!1210 lt!94596) (_1!1745 (tuple2!3469 key!828 v!309)) (_2!1745 (tuple2!3469 key!828 v!309))) lt!94873)))

(declare-fun b!191112 () Bool)

(assert (=> b!191112 (= e!125751 e!125749)))

(declare-fun c!34405 () Bool)

(assert (=> b!191112 (= c!34405 (and ((_ is Cons!2377) (toList!1210 lt!94596)) (= (_1!1745 (h!3015 (toList!1210 lt!94596))) (_1!1745 (tuple2!3469 key!828 v!309)))))))

(declare-fun b!191117 () Bool)

(declare-fun c!34403 () Bool)

(assert (=> b!191117 (= e!125748 (ite c!34405 (t!7283 (toList!1210 lt!94596)) (ite c!34403 (Cons!2377 (h!3015 (toList!1210 lt!94596)) (t!7283 (toList!1210 lt!94596))) Nil!2378)))))

(declare-fun bm!19264 () Bool)

(declare-fun $colon$colon!99 (List!2381 tuple2!3468) List!2381)

(assert (=> bm!19264 (= call!19267 ($colon$colon!99 e!125748 (ite c!34404 (h!3015 (toList!1210 lt!94596)) (tuple2!3469 (_1!1745 (tuple2!3469 key!828 v!309)) (_2!1745 (tuple2!3469 key!828 v!309))))))))

(declare-fun c!34406 () Bool)

(assert (=> bm!19264 (= c!34406 c!34404)))

(declare-fun b!191118 () Bool)

(declare-fun res!90319 () Bool)

(assert (=> b!191118 (=> (not res!90319) (not e!125750))))

(assert (=> b!191118 (= res!90319 (containsKey!241 lt!94873 (_1!1745 (tuple2!3469 key!828 v!309))))))

(declare-fun b!191119 () Bool)

(assert (=> b!191119 (= e!125752 call!19265)))

(declare-fun b!191120 () Bool)

(assert (=> b!191120 (= c!34403 (and ((_ is Cons!2377) (toList!1210 lt!94596)) (bvsgt (_1!1745 (h!3015 (toList!1210 lt!94596))) (_1!1745 (tuple2!3469 key!828 v!309)))))))

(assert (=> b!191120 (= e!125749 e!125752)))

(assert (= (and d!56125 c!34404) b!191111))

(assert (= (and d!56125 (not c!34404)) b!191112))

(assert (= (and b!191112 c!34405) b!191114))

(assert (= (and b!191112 (not c!34405)) b!191120))

(assert (= (and b!191120 c!34403) b!191119))

(assert (= (and b!191120 (not c!34403)) b!191115))

(assert (= (or b!191119 b!191115) bm!19263))

(assert (= (or b!191114 bm!19263) bm!19262))

(assert (= (or b!191111 bm!19262) bm!19264))

(assert (= (and bm!19264 c!34406) b!191116))

(assert (= (and bm!19264 (not c!34406)) b!191117))

(assert (= (and d!56125 res!90320) b!191118))

(assert (= (and b!191118 res!90319) b!191113))

(declare-fun m!217787 () Bool)

(assert (=> d!56125 m!217787))

(assert (=> d!56125 m!217601))

(declare-fun m!217789 () Bool)

(assert (=> b!191113 m!217789))

(declare-fun m!217791 () Bool)

(assert (=> bm!19264 m!217791))

(declare-fun m!217793 () Bool)

(assert (=> b!191118 m!217793))

(declare-fun m!217795 () Bool)

(assert (=> b!191116 m!217795))

(assert (=> d!56025 d!56125))

(declare-fun d!56127 () Bool)

(assert (=> d!56127 (= (apply!180 lt!94744 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2211 (getValueByKey!238 (toList!1210 lt!94744) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7665 () Bool)

(assert (= bs!7665 d!56127))

(declare-fun m!217797 () Bool)

(assert (=> bs!7665 m!217797))

(assert (=> bs!7665 m!217797))

(declare-fun m!217799 () Bool)

(assert (=> bs!7665 m!217799))

(assert (=> b!190883 d!56127))

(assert (=> d!56041 d!56045))

(declare-fun d!56129 () Bool)

(declare-fun e!125755 () Bool)

(assert (=> d!56129 e!125755))

(declare-fun res!90325 () Bool)

(assert (=> d!56129 (=> (not res!90325) (not e!125755))))

(declare-fun lt!94876 () SeekEntryResult!663)

(assert (=> d!56129 (= res!90325 ((_ is Found!663) lt!94876))))

(assert (=> d!56129 (= lt!94876 (seekEntryOrOpen!0 key!828 (_keys!5864 thiss!1248) (mask!9098 thiss!1248)))))

(assert (=> d!56129 true))

(declare-fun _$33!141 () Unit!5753)

(assert (=> d!56129 (= (choose!1036 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)) _$33!141)))

(declare-fun b!191125 () Bool)

(declare-fun res!90326 () Bool)

(assert (=> b!191125 (=> (not res!90326) (not e!125755))))

(assert (=> b!191125 (= res!90326 (inRange!0 (index!4823 lt!94876) (mask!9098 thiss!1248)))))

(declare-fun b!191126 () Bool)

(assert (=> b!191126 (= e!125755 (= (select (arr!3818 (_keys!5864 thiss!1248)) (index!4823 lt!94876)) key!828))))

(assert (= (and d!56129 res!90325) b!191125))

(assert (= (and b!191125 res!90326) b!191126))

(assert (=> d!56129 m!217279))

(declare-fun m!217801 () Bool)

(assert (=> b!191125 m!217801))

(declare-fun m!217803 () Bool)

(assert (=> b!191126 m!217803))

(assert (=> d!56041 d!56129))

(assert (=> d!56041 d!56029))

(declare-fun d!56131 () Bool)

(declare-fun e!125756 () Bool)

(assert (=> d!56131 e!125756))

(declare-fun res!90328 () Bool)

(assert (=> d!56131 (=> (not res!90328) (not e!125756))))

(declare-fun lt!94880 () ListLongMap!2389)

(assert (=> d!56131 (= res!90328 (contains!1333 lt!94880 (_1!1745 (ite (or c!34332 c!34330) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(declare-fun lt!94878 () List!2381)

(assert (=> d!56131 (= lt!94880 (ListLongMap!2390 lt!94878))))

(declare-fun lt!94879 () Unit!5753)

(declare-fun lt!94877 () Unit!5753)

(assert (=> d!56131 (= lt!94879 lt!94877)))

(assert (=> d!56131 (= (getValueByKey!238 lt!94878 (_1!1745 (ite (or c!34332 c!34330) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))) (Some!243 (_2!1745 (ite (or c!34332 c!34330) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(assert (=> d!56131 (= lt!94877 (lemmaContainsTupThenGetReturnValue!125 lt!94878 (_1!1745 (ite (or c!34332 c!34330) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (_2!1745 (ite (or c!34332 c!34330) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(assert (=> d!56131 (= lt!94878 (insertStrictlySorted!128 (toList!1210 (ite c!34332 call!19246 (ite c!34330 call!19243 call!19247))) (_1!1745 (ite (or c!34332 c!34330) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (_2!1745 (ite (or c!34332 c!34330) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(assert (=> d!56131 (= (+!303 (ite c!34332 call!19246 (ite c!34330 call!19243 call!19247)) (ite (or c!34332 c!34330) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) lt!94880)))

(declare-fun b!191127 () Bool)

(declare-fun res!90327 () Bool)

(assert (=> b!191127 (=> (not res!90327) (not e!125756))))

(assert (=> b!191127 (= res!90327 (= (getValueByKey!238 (toList!1210 lt!94880) (_1!1745 (ite (or c!34332 c!34330) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))) (Some!243 (_2!1745 (ite (or c!34332 c!34330) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))))

(declare-fun b!191128 () Bool)

(assert (=> b!191128 (= e!125756 (contains!1336 (toList!1210 lt!94880) (ite (or c!34332 c!34330) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (= (and d!56131 res!90328) b!191127))

(assert (= (and b!191127 res!90327) b!191128))

(declare-fun m!217805 () Bool)

(assert (=> d!56131 m!217805))

(declare-fun m!217807 () Bool)

(assert (=> d!56131 m!217807))

(declare-fun m!217809 () Bool)

(assert (=> d!56131 m!217809))

(declare-fun m!217811 () Bool)

(assert (=> d!56131 m!217811))

(declare-fun m!217813 () Bool)

(assert (=> b!191127 m!217813))

(declare-fun m!217815 () Bool)

(assert (=> b!191128 m!217815))

(assert (=> bm!19238 d!56131))

(declare-fun d!56133 () Bool)

(assert (=> d!56133 (= (+!303 (getCurrentListMap!862 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)) (tuple2!3469 key!828 v!309)) (getCurrentListMap!862 (_keys!5864 thiss!1248) (array!8106 (store (arr!3819 (_values!3874 thiss!1248)) (index!4823 lt!94594) (ValueCellFull!1877 v!309)) (size!4140 (_values!3874 thiss!1248))) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(assert (=> d!56133 true))

(declare-fun _$5!149 () Unit!5753)

(assert (=> d!56133 (= (choose!1035 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (index!4823 lt!94594) key!828 v!309 (defaultEntry!3891 thiss!1248)) _$5!149)))

(declare-fun bs!7666 () Bool)

(assert (= bs!7666 d!56133))

(assert (=> bs!7666 m!217297))

(assert (=> bs!7666 m!217297))

(assert (=> bs!7666 m!217399))

(assert (=> bs!7666 m!217309))

(assert (=> bs!7666 m!217301))

(assert (=> d!56027 d!56133))

(assert (=> d!56027 d!56029))

(assert (=> b!190869 d!56049))

(declare-fun d!56135 () Bool)

(assert (=> d!56135 (= (apply!180 lt!94744 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2211 (getValueByKey!238 (toList!1210 lt!94744) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7667 () Bool)

(assert (= bs!7667 d!56135))

(assert (=> bs!7667 m!217767))

(assert (=> bs!7667 m!217767))

(declare-fun m!217817 () Bool)

(assert (=> bs!7667 m!217817))

(assert (=> b!190877 d!56135))

(declare-fun d!56137 () Bool)

(declare-fun res!90333 () Bool)

(declare-fun e!125761 () Bool)

(assert (=> d!56137 (=> res!90333 e!125761)))

(assert (=> d!56137 (= res!90333 (and ((_ is Cons!2377) (toList!1210 lt!94596)) (= (_1!1745 (h!3015 (toList!1210 lt!94596))) key!828)))))

(assert (=> d!56137 (= (containsKey!241 (toList!1210 lt!94596) key!828) e!125761)))

(declare-fun b!191133 () Bool)

(declare-fun e!125762 () Bool)

(assert (=> b!191133 (= e!125761 e!125762)))

(declare-fun res!90334 () Bool)

(assert (=> b!191133 (=> (not res!90334) (not e!125762))))

(assert (=> b!191133 (= res!90334 (and (or (not ((_ is Cons!2377) (toList!1210 lt!94596))) (bvsle (_1!1745 (h!3015 (toList!1210 lt!94596))) key!828)) ((_ is Cons!2377) (toList!1210 lt!94596)) (bvslt (_1!1745 (h!3015 (toList!1210 lt!94596))) key!828)))))

(declare-fun b!191134 () Bool)

(assert (=> b!191134 (= e!125762 (containsKey!241 (t!7283 (toList!1210 lt!94596)) key!828))))

(assert (= (and d!56137 (not res!90333)) b!191133))

(assert (= (and b!191133 res!90334) b!191134))

(declare-fun m!217819 () Bool)

(assert (=> b!191134 m!217819))

(assert (=> d!56031 d!56137))

(declare-fun d!56139 () Bool)

(declare-fun e!125763 () Bool)

(assert (=> d!56139 e!125763))

(declare-fun res!90336 () Bool)

(assert (=> d!56139 (=> (not res!90336) (not e!125763))))

(declare-fun lt!94884 () ListLongMap!2389)

(assert (=> d!56139 (= res!90336 (contains!1333 lt!94884 (_1!1745 (tuple2!3469 lt!94716 (minValue!3732 thiss!1248)))))))

(declare-fun lt!94882 () List!2381)

(assert (=> d!56139 (= lt!94884 (ListLongMap!2390 lt!94882))))

(declare-fun lt!94883 () Unit!5753)

(declare-fun lt!94881 () Unit!5753)

(assert (=> d!56139 (= lt!94883 lt!94881)))

(assert (=> d!56139 (= (getValueByKey!238 lt!94882 (_1!1745 (tuple2!3469 lt!94716 (minValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94716 (minValue!3732 thiss!1248)))))))

(assert (=> d!56139 (= lt!94881 (lemmaContainsTupThenGetReturnValue!125 lt!94882 (_1!1745 (tuple2!3469 lt!94716 (minValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94716 (minValue!3732 thiss!1248)))))))

(assert (=> d!56139 (= lt!94882 (insertStrictlySorted!128 (toList!1210 lt!94721) (_1!1745 (tuple2!3469 lt!94716 (minValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94716 (minValue!3732 thiss!1248)))))))

(assert (=> d!56139 (= (+!303 lt!94721 (tuple2!3469 lt!94716 (minValue!3732 thiss!1248))) lt!94884)))

(declare-fun b!191135 () Bool)

(declare-fun res!90335 () Bool)

(assert (=> b!191135 (=> (not res!90335) (not e!125763))))

(assert (=> b!191135 (= res!90335 (= (getValueByKey!238 (toList!1210 lt!94884) (_1!1745 (tuple2!3469 lt!94716 (minValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94716 (minValue!3732 thiss!1248))))))))

(declare-fun b!191136 () Bool)

(assert (=> b!191136 (= e!125763 (contains!1336 (toList!1210 lt!94884) (tuple2!3469 lt!94716 (minValue!3732 thiss!1248))))))

(assert (= (and d!56139 res!90336) b!191135))

(assert (= (and b!191135 res!90335) b!191136))

(declare-fun m!217821 () Bool)

(assert (=> d!56139 m!217821))

(declare-fun m!217823 () Bool)

(assert (=> d!56139 m!217823))

(declare-fun m!217825 () Bool)

(assert (=> d!56139 m!217825))

(declare-fun m!217827 () Bool)

(assert (=> d!56139 m!217827))

(declare-fun m!217829 () Bool)

(assert (=> b!191135 m!217829))

(declare-fun m!217831 () Bool)

(assert (=> b!191136 m!217831))

(assert (=> b!190864 d!56139))

(declare-fun d!56141 () Bool)

(assert (=> d!56141 (= (apply!180 (+!303 lt!94721 (tuple2!3469 lt!94716 (minValue!3732 thiss!1248))) lt!94723) (apply!180 lt!94721 lt!94723))))

(declare-fun lt!94885 () Unit!5753)

(assert (=> d!56141 (= lt!94885 (choose!1039 lt!94721 lt!94716 (minValue!3732 thiss!1248) lt!94723))))

(declare-fun e!125764 () Bool)

(assert (=> d!56141 e!125764))

(declare-fun res!90337 () Bool)

(assert (=> d!56141 (=> (not res!90337) (not e!125764))))

(assert (=> d!56141 (= res!90337 (contains!1333 lt!94721 lt!94723))))

(assert (=> d!56141 (= (addApplyDifferent!156 lt!94721 lt!94716 (minValue!3732 thiss!1248) lt!94723) lt!94885)))

(declare-fun b!191137 () Bool)

(assert (=> b!191137 (= e!125764 (not (= lt!94723 lt!94716)))))

(assert (= (and d!56141 res!90337) b!191137))

(declare-fun m!217833 () Bool)

(assert (=> d!56141 m!217833))

(assert (=> d!56141 m!217433))

(assert (=> d!56141 m!217435))

(declare-fun m!217835 () Bool)

(assert (=> d!56141 m!217835))

(assert (=> d!56141 m!217433))

(assert (=> d!56141 m!217439))

(assert (=> b!190864 d!56141))

(declare-fun d!56143 () Bool)

(declare-fun e!125766 () Bool)

(assert (=> d!56143 e!125766))

(declare-fun res!90338 () Bool)

(assert (=> d!56143 (=> res!90338 e!125766)))

(declare-fun lt!94889 () Bool)

(assert (=> d!56143 (= res!90338 (not lt!94889))))

(declare-fun lt!94888 () Bool)

(assert (=> d!56143 (= lt!94889 lt!94888)))

(declare-fun lt!94886 () Unit!5753)

(declare-fun e!125765 () Unit!5753)

(assert (=> d!56143 (= lt!94886 e!125765)))

(declare-fun c!34407 () Bool)

(assert (=> d!56143 (= c!34407 lt!94888)))

(assert (=> d!56143 (= lt!94888 (containsKey!241 (toList!1210 (+!303 lt!94714 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248)))) lt!94719))))

(assert (=> d!56143 (= (contains!1333 (+!303 lt!94714 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248))) lt!94719) lt!94889)))

(declare-fun b!191138 () Bool)

(declare-fun lt!94887 () Unit!5753)

(assert (=> b!191138 (= e!125765 lt!94887)))

(assert (=> b!191138 (= lt!94887 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1210 (+!303 lt!94714 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248)))) lt!94719))))

(assert (=> b!191138 (isDefined!190 (getValueByKey!238 (toList!1210 (+!303 lt!94714 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248)))) lt!94719))))

(declare-fun b!191139 () Bool)

(declare-fun Unit!5770 () Unit!5753)

(assert (=> b!191139 (= e!125765 Unit!5770)))

(declare-fun b!191140 () Bool)

(assert (=> b!191140 (= e!125766 (isDefined!190 (getValueByKey!238 (toList!1210 (+!303 lt!94714 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248)))) lt!94719)))))

(assert (= (and d!56143 c!34407) b!191138))

(assert (= (and d!56143 (not c!34407)) b!191139))

(assert (= (and d!56143 (not res!90338)) b!191140))

(declare-fun m!217837 () Bool)

(assert (=> d!56143 m!217837))

(declare-fun m!217839 () Bool)

(assert (=> b!191138 m!217839))

(declare-fun m!217841 () Bool)

(assert (=> b!191138 m!217841))

(assert (=> b!191138 m!217841))

(declare-fun m!217843 () Bool)

(assert (=> b!191138 m!217843))

(assert (=> b!191140 m!217841))

(assert (=> b!191140 m!217841))

(assert (=> b!191140 m!217843))

(assert (=> b!190864 d!56143))

(declare-fun d!56145 () Bool)

(declare-fun e!125767 () Bool)

(assert (=> d!56145 e!125767))

(declare-fun res!90340 () Bool)

(assert (=> d!56145 (=> (not res!90340) (not e!125767))))

(declare-fun lt!94893 () ListLongMap!2389)

(assert (=> d!56145 (= res!90340 (contains!1333 lt!94893 (_1!1745 (tuple2!3469 lt!94713 (minValue!3732 thiss!1248)))))))

(declare-fun lt!94891 () List!2381)

(assert (=> d!56145 (= lt!94893 (ListLongMap!2390 lt!94891))))

(declare-fun lt!94892 () Unit!5753)

(declare-fun lt!94890 () Unit!5753)

(assert (=> d!56145 (= lt!94892 lt!94890)))

(assert (=> d!56145 (= (getValueByKey!238 lt!94891 (_1!1745 (tuple2!3469 lt!94713 (minValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94713 (minValue!3732 thiss!1248)))))))

(assert (=> d!56145 (= lt!94890 (lemmaContainsTupThenGetReturnValue!125 lt!94891 (_1!1745 (tuple2!3469 lt!94713 (minValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94713 (minValue!3732 thiss!1248)))))))

(assert (=> d!56145 (= lt!94891 (insertStrictlySorted!128 (toList!1210 lt!94727) (_1!1745 (tuple2!3469 lt!94713 (minValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94713 (minValue!3732 thiss!1248)))))))

(assert (=> d!56145 (= (+!303 lt!94727 (tuple2!3469 lt!94713 (minValue!3732 thiss!1248))) lt!94893)))

(declare-fun b!191141 () Bool)

(declare-fun res!90339 () Bool)

(assert (=> b!191141 (=> (not res!90339) (not e!125767))))

(assert (=> b!191141 (= res!90339 (= (getValueByKey!238 (toList!1210 lt!94893) (_1!1745 (tuple2!3469 lt!94713 (minValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94713 (minValue!3732 thiss!1248))))))))

(declare-fun b!191142 () Bool)

(assert (=> b!191142 (= e!125767 (contains!1336 (toList!1210 lt!94893) (tuple2!3469 lt!94713 (minValue!3732 thiss!1248))))))

(assert (= (and d!56145 res!90340) b!191141))

(assert (= (and b!191141 res!90339) b!191142))

(declare-fun m!217845 () Bool)

(assert (=> d!56145 m!217845))

(declare-fun m!217847 () Bool)

(assert (=> d!56145 m!217847))

(declare-fun m!217849 () Bool)

(assert (=> d!56145 m!217849))

(declare-fun m!217851 () Bool)

(assert (=> d!56145 m!217851))

(declare-fun m!217853 () Bool)

(assert (=> b!191141 m!217853))

(declare-fun m!217855 () Bool)

(assert (=> b!191142 m!217855))

(assert (=> b!190864 d!56145))

(declare-fun d!56147 () Bool)

(assert (=> d!56147 (= (apply!180 lt!94721 lt!94723) (get!2211 (getValueByKey!238 (toList!1210 lt!94721) lt!94723)))))

(declare-fun bs!7668 () Bool)

(assert (= bs!7668 d!56147))

(declare-fun m!217857 () Bool)

(assert (=> bs!7668 m!217857))

(assert (=> bs!7668 m!217857))

(declare-fun m!217859 () Bool)

(assert (=> bs!7668 m!217859))

(assert (=> b!190864 d!56147))

(declare-fun d!56149 () Bool)

(assert (=> d!56149 (= (apply!180 lt!94727 lt!94720) (get!2211 (getValueByKey!238 (toList!1210 lt!94727) lt!94720)))))

(declare-fun bs!7669 () Bool)

(assert (= bs!7669 d!56149))

(declare-fun m!217861 () Bool)

(assert (=> bs!7669 m!217861))

(assert (=> bs!7669 m!217861))

(declare-fun m!217863 () Bool)

(assert (=> bs!7669 m!217863))

(assert (=> b!190864 d!56149))

(declare-fun d!56151 () Bool)

(assert (=> d!56151 (= (apply!180 (+!303 lt!94727 (tuple2!3469 lt!94713 (minValue!3732 thiss!1248))) lt!94720) (get!2211 (getValueByKey!238 (toList!1210 (+!303 lt!94727 (tuple2!3469 lt!94713 (minValue!3732 thiss!1248)))) lt!94720)))))

(declare-fun bs!7670 () Bool)

(assert (= bs!7670 d!56151))

(declare-fun m!217865 () Bool)

(assert (=> bs!7670 m!217865))

(assert (=> bs!7670 m!217865))

(declare-fun m!217867 () Bool)

(assert (=> bs!7670 m!217867))

(assert (=> b!190864 d!56151))

(assert (=> b!190864 d!56113))

(declare-fun d!56153 () Bool)

(assert (=> d!56153 (= (apply!180 (+!303 lt!94721 (tuple2!3469 lt!94716 (minValue!3732 thiss!1248))) lt!94723) (get!2211 (getValueByKey!238 (toList!1210 (+!303 lt!94721 (tuple2!3469 lt!94716 (minValue!3732 thiss!1248)))) lt!94723)))))

(declare-fun bs!7671 () Bool)

(assert (= bs!7671 d!56153))

(declare-fun m!217869 () Bool)

(assert (=> bs!7671 m!217869))

(assert (=> bs!7671 m!217869))

(declare-fun m!217871 () Bool)

(assert (=> bs!7671 m!217871))

(assert (=> b!190864 d!56153))

(declare-fun d!56155 () Bool)

(declare-fun e!125768 () Bool)

(assert (=> d!56155 e!125768))

(declare-fun res!90342 () Bool)

(assert (=> d!56155 (=> (not res!90342) (not e!125768))))

(declare-fun lt!94897 () ListLongMap!2389)

(assert (=> d!56155 (= res!90342 (contains!1333 lt!94897 (_1!1745 (tuple2!3469 lt!94730 (zeroValue!3732 thiss!1248)))))))

(declare-fun lt!94895 () List!2381)

(assert (=> d!56155 (= lt!94897 (ListLongMap!2390 lt!94895))))

(declare-fun lt!94896 () Unit!5753)

(declare-fun lt!94894 () Unit!5753)

(assert (=> d!56155 (= lt!94896 lt!94894)))

(assert (=> d!56155 (= (getValueByKey!238 lt!94895 (_1!1745 (tuple2!3469 lt!94730 (zeroValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94730 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!56155 (= lt!94894 (lemmaContainsTupThenGetReturnValue!125 lt!94895 (_1!1745 (tuple2!3469 lt!94730 (zeroValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94730 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!56155 (= lt!94895 (insertStrictlySorted!128 (toList!1210 lt!94728) (_1!1745 (tuple2!3469 lt!94730 (zeroValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94730 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!56155 (= (+!303 lt!94728 (tuple2!3469 lt!94730 (zeroValue!3732 thiss!1248))) lt!94897)))

(declare-fun b!191143 () Bool)

(declare-fun res!90341 () Bool)

(assert (=> b!191143 (=> (not res!90341) (not e!125768))))

(assert (=> b!191143 (= res!90341 (= (getValueByKey!238 (toList!1210 lt!94897) (_1!1745 (tuple2!3469 lt!94730 (zeroValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94730 (zeroValue!3732 thiss!1248))))))))

(declare-fun b!191144 () Bool)

(assert (=> b!191144 (= e!125768 (contains!1336 (toList!1210 lt!94897) (tuple2!3469 lt!94730 (zeroValue!3732 thiss!1248))))))

(assert (= (and d!56155 res!90342) b!191143))

(assert (= (and b!191143 res!90341) b!191144))

(declare-fun m!217873 () Bool)

(assert (=> d!56155 m!217873))

(declare-fun m!217875 () Bool)

(assert (=> d!56155 m!217875))

(declare-fun m!217877 () Bool)

(assert (=> d!56155 m!217877))

(declare-fun m!217879 () Bool)

(assert (=> d!56155 m!217879))

(declare-fun m!217881 () Bool)

(assert (=> b!191143 m!217881))

(declare-fun m!217883 () Bool)

(assert (=> b!191144 m!217883))

(assert (=> b!190864 d!56155))

(declare-fun d!56157 () Bool)

(assert (=> d!56157 (= (apply!180 lt!94728 lt!94729) (get!2211 (getValueByKey!238 (toList!1210 lt!94728) lt!94729)))))

(declare-fun bs!7672 () Bool)

(assert (= bs!7672 d!56157))

(declare-fun m!217885 () Bool)

(assert (=> bs!7672 m!217885))

(assert (=> bs!7672 m!217885))

(declare-fun m!217887 () Bool)

(assert (=> bs!7672 m!217887))

(assert (=> b!190864 d!56157))

(declare-fun d!56159 () Bool)

(assert (=> d!56159 (= (apply!180 (+!303 lt!94727 (tuple2!3469 lt!94713 (minValue!3732 thiss!1248))) lt!94720) (apply!180 lt!94727 lt!94720))))

(declare-fun lt!94898 () Unit!5753)

(assert (=> d!56159 (= lt!94898 (choose!1039 lt!94727 lt!94713 (minValue!3732 thiss!1248) lt!94720))))

(declare-fun e!125769 () Bool)

(assert (=> d!56159 e!125769))

(declare-fun res!90343 () Bool)

(assert (=> d!56159 (=> (not res!90343) (not e!125769))))

(assert (=> d!56159 (= res!90343 (contains!1333 lt!94727 lt!94720))))

(assert (=> d!56159 (= (addApplyDifferent!156 lt!94727 lt!94713 (minValue!3732 thiss!1248) lt!94720) lt!94898)))

(declare-fun b!191145 () Bool)

(assert (=> b!191145 (= e!125769 (not (= lt!94720 lt!94713)))))

(assert (= (and d!56159 res!90343) b!191145))

(declare-fun m!217889 () Bool)

(assert (=> d!56159 m!217889))

(assert (=> d!56159 m!217421))

(assert (=> d!56159 m!217423))

(declare-fun m!217891 () Bool)

(assert (=> d!56159 m!217891))

(assert (=> d!56159 m!217421))

(assert (=> d!56159 m!217449))

(assert (=> b!190864 d!56159))

(declare-fun d!56161 () Bool)

(assert (=> d!56161 (contains!1333 (+!303 lt!94714 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248))) lt!94719)))

(declare-fun lt!94899 () Unit!5753)

(assert (=> d!56161 (= lt!94899 (choose!1038 lt!94714 lt!94710 (zeroValue!3732 thiss!1248) lt!94719))))

(assert (=> d!56161 (contains!1333 lt!94714 lt!94719)))

(assert (=> d!56161 (= (addStillContains!156 lt!94714 lt!94710 (zeroValue!3732 thiss!1248) lt!94719) lt!94899)))

(declare-fun bs!7673 () Bool)

(assert (= bs!7673 d!56161))

(assert (=> bs!7673 m!217425))

(assert (=> bs!7673 m!217425))

(assert (=> bs!7673 m!217437))

(declare-fun m!217893 () Bool)

(assert (=> bs!7673 m!217893))

(declare-fun m!217895 () Bool)

(assert (=> bs!7673 m!217895))

(assert (=> b!190864 d!56161))

(declare-fun d!56163 () Bool)

(assert (=> d!56163 (= (apply!180 (+!303 lt!94728 (tuple2!3469 lt!94730 (zeroValue!3732 thiss!1248))) lt!94729) (get!2211 (getValueByKey!238 (toList!1210 (+!303 lt!94728 (tuple2!3469 lt!94730 (zeroValue!3732 thiss!1248)))) lt!94729)))))

(declare-fun bs!7674 () Bool)

(assert (= bs!7674 d!56163))

(declare-fun m!217897 () Bool)

(assert (=> bs!7674 m!217897))

(assert (=> bs!7674 m!217897))

(declare-fun m!217899 () Bool)

(assert (=> bs!7674 m!217899))

(assert (=> b!190864 d!56163))

(declare-fun d!56165 () Bool)

(assert (=> d!56165 (= (apply!180 (+!303 lt!94728 (tuple2!3469 lt!94730 (zeroValue!3732 thiss!1248))) lt!94729) (apply!180 lt!94728 lt!94729))))

(declare-fun lt!94900 () Unit!5753)

(assert (=> d!56165 (= lt!94900 (choose!1039 lt!94728 lt!94730 (zeroValue!3732 thiss!1248) lt!94729))))

(declare-fun e!125770 () Bool)

(assert (=> d!56165 e!125770))

(declare-fun res!90344 () Bool)

(assert (=> d!56165 (=> (not res!90344) (not e!125770))))

(assert (=> d!56165 (= res!90344 (contains!1333 lt!94728 lt!94729))))

(assert (=> d!56165 (= (addApplyDifferent!156 lt!94728 lt!94730 (zeroValue!3732 thiss!1248) lt!94729) lt!94900)))

(declare-fun b!191146 () Bool)

(assert (=> b!191146 (= e!125770 (not (= lt!94729 lt!94730)))))

(assert (= (and d!56165 res!90344) b!191146))

(declare-fun m!217901 () Bool)

(assert (=> d!56165 m!217901))

(assert (=> d!56165 m!217427))

(assert (=> d!56165 m!217429))

(declare-fun m!217903 () Bool)

(assert (=> d!56165 m!217903))

(assert (=> d!56165 m!217427))

(assert (=> d!56165 m!217441))

(assert (=> b!190864 d!56165))

(declare-fun d!56167 () Bool)

(declare-fun e!125771 () Bool)

(assert (=> d!56167 e!125771))

(declare-fun res!90346 () Bool)

(assert (=> d!56167 (=> (not res!90346) (not e!125771))))

(declare-fun lt!94904 () ListLongMap!2389)

(assert (=> d!56167 (= res!90346 (contains!1333 lt!94904 (_1!1745 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248)))))))

(declare-fun lt!94902 () List!2381)

(assert (=> d!56167 (= lt!94904 (ListLongMap!2390 lt!94902))))

(declare-fun lt!94903 () Unit!5753)

(declare-fun lt!94901 () Unit!5753)

(assert (=> d!56167 (= lt!94903 lt!94901)))

(assert (=> d!56167 (= (getValueByKey!238 lt!94902 (_1!1745 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!56167 (= lt!94901 (lemmaContainsTupThenGetReturnValue!125 lt!94902 (_1!1745 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!56167 (= lt!94902 (insertStrictlySorted!128 (toList!1210 lt!94714) (_1!1745 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!56167 (= (+!303 lt!94714 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248))) lt!94904)))

(declare-fun b!191147 () Bool)

(declare-fun res!90345 () Bool)

(assert (=> b!191147 (=> (not res!90345) (not e!125771))))

(assert (=> b!191147 (= res!90345 (= (getValueByKey!238 (toList!1210 lt!94904) (_1!1745 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248))))))))

(declare-fun b!191148 () Bool)

(assert (=> b!191148 (= e!125771 (contains!1336 (toList!1210 lt!94904) (tuple2!3469 lt!94710 (zeroValue!3732 thiss!1248))))))

(assert (= (and d!56167 res!90346) b!191147))

(assert (= (and b!191147 res!90345) b!191148))

(declare-fun m!217905 () Bool)

(assert (=> d!56167 m!217905))

(declare-fun m!217907 () Bool)

(assert (=> d!56167 m!217907))

(declare-fun m!217909 () Bool)

(assert (=> d!56167 m!217909))

(declare-fun m!217911 () Bool)

(assert (=> d!56167 m!217911))

(declare-fun m!217913 () Bool)

(assert (=> b!191147 m!217913))

(declare-fun m!217915 () Bool)

(assert (=> b!191148 m!217915))

(assert (=> b!190864 d!56167))

(declare-fun d!56169 () Bool)

(declare-fun e!125772 () Bool)

(assert (=> d!56169 e!125772))

(declare-fun res!90348 () Bool)

(assert (=> d!56169 (=> (not res!90348) (not e!125772))))

(declare-fun lt!94908 () ListLongMap!2389)

(assert (=> d!56169 (= res!90348 (contains!1333 lt!94908 (_1!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(declare-fun lt!94906 () List!2381)

(assert (=> d!56169 (= lt!94908 (ListLongMap!2390 lt!94906))))

(declare-fun lt!94907 () Unit!5753)

(declare-fun lt!94905 () Unit!5753)

(assert (=> d!56169 (= lt!94907 lt!94905)))

(assert (=> d!56169 (= (getValueByKey!238 lt!94906 (_1!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (=> d!56169 (= lt!94905 (lemmaContainsTupThenGetReturnValue!125 lt!94906 (_1!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (=> d!56169 (= lt!94906 (insertStrictlySorted!128 (toList!1210 call!19244) (_1!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))) (_2!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (=> d!56169 (= (+!303 call!19244 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))) lt!94908)))

(declare-fun b!191149 () Bool)

(declare-fun res!90347 () Bool)

(assert (=> b!191149 (=> (not res!90347) (not e!125772))))

(assert (=> b!191149 (= res!90347 (= (getValueByKey!238 (toList!1210 lt!94908) (_1!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (Some!243 (_2!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(declare-fun b!191150 () Bool)

(assert (=> b!191150 (= e!125772 (contains!1336 (toList!1210 lt!94908) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))

(assert (= (and d!56169 res!90348) b!191149))

(assert (= (and b!191149 res!90347) b!191150))

(declare-fun m!217917 () Bool)

(assert (=> d!56169 m!217917))

(declare-fun m!217919 () Bool)

(assert (=> d!56169 m!217919))

(declare-fun m!217921 () Bool)

(assert (=> d!56169 m!217921))

(declare-fun m!217923 () Bool)

(assert (=> d!56169 m!217923))

(declare-fun m!217925 () Bool)

(assert (=> b!191149 m!217925))

(declare-fun m!217927 () Bool)

(assert (=> b!191150 m!217927))

(assert (=> b!190863 d!56169))

(declare-fun d!56171 () Bool)

(declare-fun e!125773 () Bool)

(assert (=> d!56171 e!125773))

(declare-fun res!90350 () Bool)

(assert (=> d!56171 (=> (not res!90350) (not e!125773))))

(declare-fun lt!94912 () ListLongMap!2389)

(assert (=> d!56171 (= res!90350 (contains!1333 lt!94912 (_1!1745 (ite (or c!34338 c!34336) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(declare-fun lt!94910 () List!2381)

(assert (=> d!56171 (= lt!94912 (ListLongMap!2390 lt!94910))))

(declare-fun lt!94911 () Unit!5753)

(declare-fun lt!94909 () Unit!5753)

(assert (=> d!56171 (= lt!94911 lt!94909)))

(assert (=> d!56171 (= (getValueByKey!238 lt!94910 (_1!1745 (ite (or c!34338 c!34336) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))) (Some!243 (_2!1745 (ite (or c!34338 c!34336) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(assert (=> d!56171 (= lt!94909 (lemmaContainsTupThenGetReturnValue!125 lt!94910 (_1!1745 (ite (or c!34338 c!34336) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (_2!1745 (ite (or c!34338 c!34336) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(assert (=> d!56171 (= lt!94910 (insertStrictlySorted!128 (toList!1210 (ite c!34338 call!19253 (ite c!34336 call!19250 call!19254))) (_1!1745 (ite (or c!34338 c!34336) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (_2!1745 (ite (or c!34338 c!34336) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(assert (=> d!56171 (= (+!303 (ite c!34338 call!19253 (ite c!34336 call!19250 call!19254)) (ite (or c!34338 c!34336) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) lt!94912)))

(declare-fun b!191151 () Bool)

(declare-fun res!90349 () Bool)

(assert (=> b!191151 (=> (not res!90349) (not e!125773))))

(assert (=> b!191151 (= res!90349 (= (getValueByKey!238 (toList!1210 lt!94912) (_1!1745 (ite (or c!34338 c!34336) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))) (Some!243 (_2!1745 (ite (or c!34338 c!34336) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))))

(declare-fun b!191152 () Bool)

(assert (=> b!191152 (= e!125773 (contains!1336 (toList!1210 lt!94912) (ite (or c!34338 c!34336) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (= (and d!56171 res!90350) b!191151))

(assert (= (and b!191151 res!90349) b!191152))

(declare-fun m!217929 () Bool)

(assert (=> d!56171 m!217929))

(declare-fun m!217931 () Bool)

(assert (=> d!56171 m!217931))

(declare-fun m!217933 () Bool)

(assert (=> d!56171 m!217933))

(declare-fun m!217935 () Bool)

(assert (=> d!56171 m!217935))

(declare-fun m!217937 () Bool)

(assert (=> b!191151 m!217937))

(declare-fun m!217939 () Bool)

(assert (=> b!191152 m!217939))

(assert (=> bm!19245 d!56171))

(declare-fun d!56173 () Bool)

(assert (=> d!56173 (= (apply!180 lt!94744 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)) (get!2211 (getValueByKey!238 (toList!1210 lt!94744) (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7675 () Bool)

(assert (= bs!7675 d!56173))

(assert (=> bs!7675 m!217413))

(assert (=> bs!7675 m!217589))

(assert (=> bs!7675 m!217589))

(declare-fun m!217941 () Bool)

(assert (=> bs!7675 m!217941))

(assert (=> b!190879 d!56173))

(declare-fun d!56175 () Bool)

(declare-fun c!34408 () Bool)

(assert (=> d!56175 (= c!34408 ((_ is ValueCellFull!1877) (select (arr!3819 (_values!3874 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!125774 () V!5569)

(assert (=> d!56175 (= (get!2210 (select (arr!3819 (_values!3874 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!125774)))

(declare-fun b!191153 () Bool)

(assert (=> b!191153 (= e!125774 (get!2212 (select (arr!3819 (_values!3874 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!191154 () Bool)

(assert (=> b!191154 (= e!125774 (get!2213 (select (arr!3819 (_values!3874 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56175 c!34408) b!191153))

(assert (= (and d!56175 (not c!34408)) b!191154))

(assert (=> b!191153 m!217509))

(assert (=> b!191153 m!217455))

(declare-fun m!217943 () Bool)

(assert (=> b!191153 m!217943))

(assert (=> b!191154 m!217509))

(assert (=> b!191154 m!217455))

(declare-fun m!217945 () Bool)

(assert (=> b!191154 m!217945))

(assert (=> b!190879 d!56175))

(assert (=> bm!19246 d!56081))

(declare-fun d!56177 () Bool)

(declare-fun e!125776 () Bool)

(assert (=> d!56177 e!125776))

(declare-fun res!90351 () Bool)

(assert (=> d!56177 (=> res!90351 e!125776)))

(declare-fun lt!94916 () Bool)

(assert (=> d!56177 (= res!90351 (not lt!94916))))

(declare-fun lt!94915 () Bool)

(assert (=> d!56177 (= lt!94916 lt!94915)))

(declare-fun lt!94913 () Unit!5753)

(declare-fun e!125775 () Unit!5753)

(assert (=> d!56177 (= lt!94913 e!125775)))

(declare-fun c!34409 () Bool)

(assert (=> d!56177 (= c!34409 lt!94915)))

(assert (=> d!56177 (= lt!94915 (containsKey!241 (toList!1210 lt!94744) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56177 (= (contains!1333 lt!94744 #b1000000000000000000000000000000000000000000000000000000000000000) lt!94916)))

(declare-fun b!191155 () Bool)

(declare-fun lt!94914 () Unit!5753)

(assert (=> b!191155 (= e!125775 lt!94914)))

(assert (=> b!191155 (= lt!94914 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1210 lt!94744) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191155 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94744) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191156 () Bool)

(declare-fun Unit!5771 () Unit!5753)

(assert (=> b!191156 (= e!125775 Unit!5771)))

(declare-fun b!191157 () Bool)

(assert (=> b!191157 (= e!125776 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94744) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56177 c!34409) b!191155))

(assert (= (and d!56177 (not c!34409)) b!191156))

(assert (= (and d!56177 (not res!90351)) b!191157))

(declare-fun m!217947 () Bool)

(assert (=> d!56177 m!217947))

(declare-fun m!217949 () Bool)

(assert (=> b!191155 m!217949))

(assert (=> b!191155 m!217797))

(assert (=> b!191155 m!217797))

(declare-fun m!217951 () Bool)

(assert (=> b!191155 m!217951))

(assert (=> b!191157 m!217797))

(assert (=> b!191157 m!217797))

(assert (=> b!191157 m!217951))

(assert (=> bm!19250 d!56177))

(assert (=> b!190878 d!56049))

(declare-fun d!56179 () Bool)

(assert (=> d!56179 (= (inRange!0 (index!4823 lt!94758) (mask!9098 thiss!1248)) (and (bvsge (index!4823 lt!94758) #b00000000000000000000000000000000) (bvslt (index!4823 lt!94758) (bvadd (mask!9098 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!190901 d!56179))

(declare-fun e!125784 () SeekEntryResult!663)

(declare-fun b!191170 () Bool)

(assert (=> b!191170 (= e!125784 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20491 lt!94767) #b00000000000000000000000000000001) (nextIndex!0 (index!4824 lt!94767) (bvadd (x!20491 lt!94767) #b00000000000000000000000000000001) (mask!9098 thiss!1248)) (index!4824 lt!94767) key!828 (_keys!5864 thiss!1248) (mask!9098 thiss!1248)))))

(declare-fun b!191171 () Bool)

(declare-fun e!125783 () SeekEntryResult!663)

(declare-fun e!125785 () SeekEntryResult!663)

(assert (=> b!191171 (= e!125783 e!125785)))

(declare-fun c!34418 () Bool)

(declare-fun lt!94922 () (_ BitVec 64))

(assert (=> b!191171 (= c!34418 (= lt!94922 key!828))))

(declare-fun b!191172 () Bool)

(assert (=> b!191172 (= e!125785 (Found!663 (index!4824 lt!94767)))))

(declare-fun b!191173 () Bool)

(assert (=> b!191173 (= e!125783 Undefined!663)))

(declare-fun b!191174 () Bool)

(declare-fun c!34416 () Bool)

(assert (=> b!191174 (= c!34416 (= lt!94922 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191174 (= e!125785 e!125784)))

(declare-fun b!191175 () Bool)

(assert (=> b!191175 (= e!125784 (MissingVacant!663 (index!4824 lt!94767)))))

(declare-fun d!56181 () Bool)

(declare-fun lt!94921 () SeekEntryResult!663)

(assert (=> d!56181 (and (or ((_ is Undefined!663) lt!94921) (not ((_ is Found!663) lt!94921)) (and (bvsge (index!4823 lt!94921) #b00000000000000000000000000000000) (bvslt (index!4823 lt!94921) (size!4139 (_keys!5864 thiss!1248))))) (or ((_ is Undefined!663) lt!94921) ((_ is Found!663) lt!94921) (not ((_ is MissingVacant!663) lt!94921)) (not (= (index!4825 lt!94921) (index!4824 lt!94767))) (and (bvsge (index!4825 lt!94921) #b00000000000000000000000000000000) (bvslt (index!4825 lt!94921) (size!4139 (_keys!5864 thiss!1248))))) (or ((_ is Undefined!663) lt!94921) (ite ((_ is Found!663) lt!94921) (= (select (arr!3818 (_keys!5864 thiss!1248)) (index!4823 lt!94921)) key!828) (and ((_ is MissingVacant!663) lt!94921) (= (index!4825 lt!94921) (index!4824 lt!94767)) (= (select (arr!3818 (_keys!5864 thiss!1248)) (index!4825 lt!94921)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!56181 (= lt!94921 e!125783)))

(declare-fun c!34417 () Bool)

(assert (=> d!56181 (= c!34417 (bvsge (x!20491 lt!94767) #b01111111111111111111111111111110))))

(assert (=> d!56181 (= lt!94922 (select (arr!3818 (_keys!5864 thiss!1248)) (index!4824 lt!94767)))))

(assert (=> d!56181 (validMask!0 (mask!9098 thiss!1248))))

(assert (=> d!56181 (= (seekKeyOrZeroReturnVacant!0 (x!20491 lt!94767) (index!4824 lt!94767) (index!4824 lt!94767) key!828 (_keys!5864 thiss!1248) (mask!9098 thiss!1248)) lt!94921)))

(assert (= (and d!56181 c!34417) b!191173))

(assert (= (and d!56181 (not c!34417)) b!191171))

(assert (= (and b!191171 c!34418) b!191172))

(assert (= (and b!191171 (not c!34418)) b!191174))

(assert (= (and b!191174 c!34416) b!191175))

(assert (= (and b!191174 (not c!34416)) b!191170))

(declare-fun m!217953 () Bool)

(assert (=> b!191170 m!217953))

(assert (=> b!191170 m!217953))

(declare-fun m!217955 () Bool)

(assert (=> b!191170 m!217955))

(declare-fun m!217957 () Bool)

(assert (=> d!56181 m!217957))

(declare-fun m!217959 () Bool)

(assert (=> d!56181 m!217959))

(assert (=> d!56181 m!217527))

(assert (=> d!56181 m!217307))

(assert (=> b!190915 d!56181))

(declare-fun d!56183 () Bool)

(declare-fun lt!94925 () (_ BitVec 32))

(assert (=> d!56183 (and (bvsge lt!94925 #b00000000000000000000000000000000) (bvsle lt!94925 (bvsub (size!4139 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!125790 () (_ BitVec 32))

(assert (=> d!56183 (= lt!94925 e!125790)))

(declare-fun c!34423 () Bool)

(assert (=> d!56183 (= c!34423 (bvsge #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(assert (=> d!56183 (and (bvsle #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4139 (_keys!5864 thiss!1248)) (size!4139 (_keys!5864 thiss!1248))))))

(assert (=> d!56183 (= (arrayCountValidKeys!0 (_keys!5864 thiss!1248) #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))) lt!94925)))

(declare-fun b!191184 () Bool)

(declare-fun e!125791 () (_ BitVec 32))

(declare-fun call!19270 () (_ BitVec 32))

(assert (=> b!191184 (= e!125791 call!19270)))

(declare-fun bm!19267 () Bool)

(assert (=> bm!19267 (= call!19270 (arrayCountValidKeys!0 (_keys!5864 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4139 (_keys!5864 thiss!1248))))))

(declare-fun b!191185 () Bool)

(assert (=> b!191185 (= e!125791 (bvadd #b00000000000000000000000000000001 call!19270))))

(declare-fun b!191186 () Bool)

(assert (=> b!191186 (= e!125790 e!125791)))

(declare-fun c!34424 () Bool)

(assert (=> b!191186 (= c!34424 (validKeyInArray!0 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191187 () Bool)

(assert (=> b!191187 (= e!125790 #b00000000000000000000000000000000)))

(assert (= (and d!56183 c!34423) b!191187))

(assert (= (and d!56183 (not c!34423)) b!191186))

(assert (= (and b!191186 c!34424) b!191185))

(assert (= (and b!191186 (not c!34424)) b!191184))

(assert (= (or b!191185 b!191184) bm!19267))

(declare-fun m!217961 () Bool)

(assert (=> bm!19267 m!217961))

(assert (=> b!191186 m!217413))

(assert (=> b!191186 m!217413))

(assert (=> b!191186 m!217415))

(assert (=> b!190927 d!56183))

(assert (=> b!190810 d!56067))

(assert (=> b!190810 d!56069))

(declare-fun b!191198 () Bool)

(declare-fun res!90362 () Bool)

(declare-fun e!125794 () Bool)

(assert (=> b!191198 (=> (not res!90362) (not e!125794))))

(declare-fun size!4145 (LongMapFixedSize!2662) (_ BitVec 32))

(assert (=> b!191198 (= res!90362 (= (size!4145 thiss!1248) (bvadd (_size!1380 thiss!1248) (bvsdiv (bvadd (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!56185 () Bool)

(declare-fun res!90363 () Bool)

(assert (=> d!56185 (=> (not res!90363) (not e!125794))))

(assert (=> d!56185 (= res!90363 (validMask!0 (mask!9098 thiss!1248)))))

(assert (=> d!56185 (= (simpleValid!196 thiss!1248) e!125794)))

(declare-fun b!191196 () Bool)

(declare-fun res!90360 () Bool)

(assert (=> b!191196 (=> (not res!90360) (not e!125794))))

(assert (=> b!191196 (= res!90360 (and (= (size!4140 (_values!3874 thiss!1248)) (bvadd (mask!9098 thiss!1248) #b00000000000000000000000000000001)) (= (size!4139 (_keys!5864 thiss!1248)) (size!4140 (_values!3874 thiss!1248))) (bvsge (_size!1380 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1380 thiss!1248) (bvadd (mask!9098 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!191199 () Bool)

(assert (=> b!191199 (= e!125794 (and (bvsge (extraKeys!3628 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3628 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1380 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!191197 () Bool)

(declare-fun res!90361 () Bool)

(assert (=> b!191197 (=> (not res!90361) (not e!125794))))

(assert (=> b!191197 (= res!90361 (bvsge (size!4145 thiss!1248) (_size!1380 thiss!1248)))))

(assert (= (and d!56185 res!90363) b!191196))

(assert (= (and b!191196 res!90360) b!191197))

(assert (= (and b!191197 res!90361) b!191198))

(assert (= (and b!191198 res!90362) b!191199))

(declare-fun m!217963 () Bool)

(assert (=> b!191198 m!217963))

(assert (=> d!56185 m!217307))

(assert (=> b!191197 m!217963))

(assert (=> d!56047 d!56185))

(declare-fun lt!94928 () Bool)

(declare-fun d!56187 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!153 (List!2381) (InoxSet tuple2!3468))

(assert (=> d!56187 (= lt!94928 (select (content!153 (toList!1210 lt!94650)) (tuple2!3469 key!828 v!309)))))

(declare-fun e!125799 () Bool)

(assert (=> d!56187 (= lt!94928 e!125799)))

(declare-fun res!90369 () Bool)

(assert (=> d!56187 (=> (not res!90369) (not e!125799))))

(assert (=> d!56187 (= res!90369 ((_ is Cons!2377) (toList!1210 lt!94650)))))

(assert (=> d!56187 (= (contains!1336 (toList!1210 lt!94650) (tuple2!3469 key!828 v!309)) lt!94928)))

(declare-fun b!191204 () Bool)

(declare-fun e!125800 () Bool)

(assert (=> b!191204 (= e!125799 e!125800)))

(declare-fun res!90368 () Bool)

(assert (=> b!191204 (=> res!90368 e!125800)))

(assert (=> b!191204 (= res!90368 (= (h!3015 (toList!1210 lt!94650)) (tuple2!3469 key!828 v!309)))))

(declare-fun b!191205 () Bool)

(assert (=> b!191205 (= e!125800 (contains!1336 (t!7283 (toList!1210 lt!94650)) (tuple2!3469 key!828 v!309)))))

(assert (= (and d!56187 res!90369) b!191204))

(assert (= (and b!191204 (not res!90368)) b!191205))

(declare-fun m!217965 () Bool)

(assert (=> d!56187 m!217965))

(declare-fun m!217967 () Bool)

(assert (=> d!56187 m!217967))

(declare-fun m!217969 () Bool)

(assert (=> b!191205 m!217969))

(assert (=> b!190798 d!56187))

(declare-fun d!56189 () Bool)

(declare-fun e!125802 () Bool)

(assert (=> d!56189 e!125802))

(declare-fun res!90370 () Bool)

(assert (=> d!56189 (=> res!90370 e!125802)))

(declare-fun lt!94932 () Bool)

(assert (=> d!56189 (= res!90370 (not lt!94932))))

(declare-fun lt!94931 () Bool)

(assert (=> d!56189 (= lt!94932 lt!94931)))

(declare-fun lt!94929 () Unit!5753)

(declare-fun e!125801 () Unit!5753)

(assert (=> d!56189 (= lt!94929 e!125801)))

(declare-fun c!34425 () Bool)

(assert (=> d!56189 (= c!34425 lt!94931)))

(assert (=> d!56189 (= lt!94931 (containsKey!241 (toList!1210 lt!94722) (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56189 (= (contains!1333 lt!94722 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)) lt!94932)))

(declare-fun b!191206 () Bool)

(declare-fun lt!94930 () Unit!5753)

(assert (=> b!191206 (= e!125801 lt!94930)))

(assert (=> b!191206 (= lt!94930 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1210 lt!94722) (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191206 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94722) (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191207 () Bool)

(declare-fun Unit!5772 () Unit!5753)

(assert (=> b!191207 (= e!125801 Unit!5772)))

(declare-fun b!191208 () Bool)

(assert (=> b!191208 (= e!125802 (isDefined!190 (getValueByKey!238 (toList!1210 lt!94722) (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56189 c!34425) b!191206))

(assert (= (and d!56189 (not c!34425)) b!191207))

(assert (= (and d!56189 (not res!90370)) b!191208))

(assert (=> d!56189 m!217413))

(declare-fun m!217971 () Bool)

(assert (=> d!56189 m!217971))

(assert (=> b!191206 m!217413))

(declare-fun m!217973 () Bool)

(assert (=> b!191206 m!217973))

(assert (=> b!191206 m!217413))

(assert (=> b!191206 m!217607))

(assert (=> b!191206 m!217607))

(declare-fun m!217975 () Bool)

(assert (=> b!191206 m!217975))

(assert (=> b!191208 m!217413))

(assert (=> b!191208 m!217607))

(assert (=> b!191208 m!217607))

(assert (=> b!191208 m!217975))

(assert (=> b!190861 d!56189))

(assert (=> b!190892 d!56049))

(declare-fun d!56191 () Bool)

(declare-fun res!90379 () Bool)

(declare-fun e!125812 () Bool)

(assert (=> d!56191 (=> res!90379 e!125812)))

(assert (=> d!56191 (= res!90379 (bvsge #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(assert (=> d!56191 (= (arrayNoDuplicates!0 (_keys!5864 thiss!1248) #b00000000000000000000000000000000 Nil!2381) e!125812)))

(declare-fun b!191219 () Bool)

(declare-fun e!125813 () Bool)

(declare-fun call!19273 () Bool)

(assert (=> b!191219 (= e!125813 call!19273)))

(declare-fun b!191220 () Bool)

(declare-fun e!125811 () Bool)

(declare-fun contains!1337 (List!2384 (_ BitVec 64)) Bool)

(assert (=> b!191220 (= e!125811 (contains!1337 Nil!2381 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19270 () Bool)

(declare-fun c!34428 () Bool)

(assert (=> bm!19270 (= call!19273 (arrayNoDuplicates!0 (_keys!5864 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34428 (Cons!2380 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000) Nil!2381) Nil!2381)))))

(declare-fun b!191221 () Bool)

(declare-fun e!125814 () Bool)

(assert (=> b!191221 (= e!125812 e!125814)))

(declare-fun res!90378 () Bool)

(assert (=> b!191221 (=> (not res!90378) (not e!125814))))

(assert (=> b!191221 (= res!90378 (not e!125811))))

(declare-fun res!90377 () Bool)

(assert (=> b!191221 (=> (not res!90377) (not e!125811))))

(assert (=> b!191221 (= res!90377 (validKeyInArray!0 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191222 () Bool)

(assert (=> b!191222 (= e!125814 e!125813)))

(assert (=> b!191222 (= c!34428 (validKeyInArray!0 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191223 () Bool)

(assert (=> b!191223 (= e!125813 call!19273)))

(assert (= (and d!56191 (not res!90379)) b!191221))

(assert (= (and b!191221 res!90377) b!191220))

(assert (= (and b!191221 res!90378) b!191222))

(assert (= (and b!191222 c!34428) b!191223))

(assert (= (and b!191222 (not c!34428)) b!191219))

(assert (= (or b!191223 b!191219) bm!19270))

(assert (=> b!191220 m!217413))

(assert (=> b!191220 m!217413))

(declare-fun m!217977 () Bool)

(assert (=> b!191220 m!217977))

(assert (=> bm!19270 m!217413))

(declare-fun m!217979 () Bool)

(assert (=> bm!19270 m!217979))

(assert (=> b!191221 m!217413))

(assert (=> b!191221 m!217413))

(assert (=> b!191221 m!217415))

(assert (=> b!191222 m!217413))

(assert (=> b!191222 m!217413))

(assert (=> b!191222 m!217415))

(assert (=> b!190929 d!56191))

(declare-fun d!56193 () Bool)

(assert (=> d!56193 (= (apply!180 lt!94722 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2211 (getValueByKey!238 (toList!1210 lt!94722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7676 () Bool)

(assert (= bs!7676 d!56193))

(assert (=> bs!7676 m!217737))

(assert (=> bs!7676 m!217737))

(declare-fun m!217981 () Bool)

(assert (=> bs!7676 m!217981))

(assert (=> b!190860 d!56193))

(assert (=> d!56023 d!56045))

(declare-fun call!19278 () Bool)

(declare-fun c!34434 () Bool)

(declare-fun bm!19275 () Bool)

(declare-fun lt!94935 () SeekEntryResult!663)

(assert (=> bm!19275 (= call!19278 (inRange!0 (ite c!34434 (index!4822 lt!94935) (index!4825 lt!94935)) (mask!9098 thiss!1248)))))

(declare-fun b!191240 () Bool)

(declare-fun e!125824 () Bool)

(declare-fun e!125825 () Bool)

(assert (=> b!191240 (= e!125824 e!125825)))

(declare-fun c!34433 () Bool)

(assert (=> b!191240 (= c!34433 ((_ is MissingVacant!663) lt!94935))))

(declare-fun b!191241 () Bool)

(declare-fun e!125826 () Bool)

(declare-fun call!19279 () Bool)

(assert (=> b!191241 (= e!125826 (not call!19279))))

(declare-fun b!191242 () Bool)

(declare-fun res!90390 () Bool)

(assert (=> b!191242 (=> (not res!90390) (not e!125826))))

(assert (=> b!191242 (= res!90390 call!19278)))

(assert (=> b!191242 (= e!125825 e!125826)))

(declare-fun b!191243 () Bool)

(declare-fun e!125823 () Bool)

(assert (=> b!191243 (= e!125823 (not call!19279))))

(declare-fun d!56195 () Bool)

(assert (=> d!56195 e!125824))

(assert (=> d!56195 (= c!34434 ((_ is MissingZero!663) lt!94935))))

(assert (=> d!56195 (= lt!94935 (seekEntryOrOpen!0 key!828 (_keys!5864 thiss!1248) (mask!9098 thiss!1248)))))

(assert (=> d!56195 true))

(declare-fun _$34!1078 () Unit!5753)

(assert (=> d!56195 (= (choose!1034 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)) _$34!1078)))

(declare-fun b!191244 () Bool)

(assert (=> b!191244 (= e!125825 ((_ is Undefined!663) lt!94935))))

(declare-fun b!191245 () Bool)

(declare-fun res!90388 () Bool)

(assert (=> b!191245 (= res!90388 (= (select (arr!3818 (_keys!5864 thiss!1248)) (index!4822 lt!94935)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191245 (=> (not res!90388) (not e!125823))))

(declare-fun b!191246 () Bool)

(declare-fun res!90391 () Bool)

(assert (=> b!191246 (=> (not res!90391) (not e!125826))))

(assert (=> b!191246 (= res!90391 (= (select (arr!3818 (_keys!5864 thiss!1248)) (index!4825 lt!94935)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19276 () Bool)

(assert (=> bm!19276 (= call!19279 (arrayContainsKey!0 (_keys!5864 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!191247 () Bool)

(assert (=> b!191247 (= e!125824 e!125823)))

(declare-fun res!90389 () Bool)

(assert (=> b!191247 (= res!90389 call!19278)))

(assert (=> b!191247 (=> (not res!90389) (not e!125823))))

(assert (= (and d!56195 c!34434) b!191247))

(assert (= (and d!56195 (not c!34434)) b!191240))

(assert (= (and b!191247 res!90389) b!191245))

(assert (= (and b!191245 res!90388) b!191243))

(assert (= (and b!191240 c!34433) b!191242))

(assert (= (and b!191240 (not c!34433)) b!191244))

(assert (= (and b!191242 res!90390) b!191246))

(assert (= (and b!191246 res!90391) b!191241))

(assert (= (or b!191247 b!191242) bm!19275))

(assert (= (or b!191243 b!191241) bm!19276))

(assert (=> d!56195 m!217279))

(declare-fun m!217983 () Bool)

(assert (=> b!191246 m!217983))

(declare-fun m!217985 () Bool)

(assert (=> b!191245 m!217985))

(declare-fun m!217987 () Bool)

(assert (=> bm!19275 m!217987))

(assert (=> bm!19276 m!217381))

(assert (=> d!56023 d!56195))

(assert (=> d!56023 d!56029))

(declare-fun b!191256 () Bool)

(declare-fun e!125833 () Bool)

(declare-fun call!19282 () Bool)

(assert (=> b!191256 (= e!125833 call!19282)))

(declare-fun bm!19279 () Bool)

(assert (=> bm!19279 (= call!19282 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5864 thiss!1248) (mask!9098 thiss!1248)))))

(declare-fun b!191257 () Bool)

(declare-fun e!125834 () Bool)

(assert (=> b!191257 (= e!125834 call!19282)))

(declare-fun d!56197 () Bool)

(declare-fun res!90396 () Bool)

(declare-fun e!125835 () Bool)

(assert (=> d!56197 (=> res!90396 e!125835)))

(assert (=> d!56197 (= res!90396 (bvsge #b00000000000000000000000000000000 (size!4139 (_keys!5864 thiss!1248))))))

(assert (=> d!56197 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5864 thiss!1248) (mask!9098 thiss!1248)) e!125835)))

(declare-fun b!191258 () Bool)

(assert (=> b!191258 (= e!125835 e!125833)))

(declare-fun c!34437 () Bool)

(assert (=> b!191258 (= c!34437 (validKeyInArray!0 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191259 () Bool)

(assert (=> b!191259 (= e!125833 e!125834)))

(declare-fun lt!94944 () (_ BitVec 64))

(assert (=> b!191259 (= lt!94944 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94942 () Unit!5753)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8103 (_ BitVec 64) (_ BitVec 32)) Unit!5753)

(assert (=> b!191259 (= lt!94942 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5864 thiss!1248) lt!94944 #b00000000000000000000000000000000))))

(assert (=> b!191259 (arrayContainsKey!0 (_keys!5864 thiss!1248) lt!94944 #b00000000000000000000000000000000)))

(declare-fun lt!94943 () Unit!5753)

(assert (=> b!191259 (= lt!94943 lt!94942)))

(declare-fun res!90397 () Bool)

(assert (=> b!191259 (= res!90397 (= (seekEntryOrOpen!0 (select (arr!3818 (_keys!5864 thiss!1248)) #b00000000000000000000000000000000) (_keys!5864 thiss!1248) (mask!9098 thiss!1248)) (Found!663 #b00000000000000000000000000000000)))))

(assert (=> b!191259 (=> (not res!90397) (not e!125834))))

(assert (= (and d!56197 (not res!90396)) b!191258))

(assert (= (and b!191258 c!34437) b!191259))

(assert (= (and b!191258 (not c!34437)) b!191256))

(assert (= (and b!191259 res!90397) b!191257))

(assert (= (or b!191257 b!191256) bm!19279))

(declare-fun m!217989 () Bool)

(assert (=> bm!19279 m!217989))

(assert (=> b!191258 m!217413))

(assert (=> b!191258 m!217413))

(assert (=> b!191258 m!217415))

(assert (=> b!191259 m!217413))

(declare-fun m!217991 () Bool)

(assert (=> b!191259 m!217991))

(declare-fun m!217993 () Bool)

(assert (=> b!191259 m!217993))

(assert (=> b!191259 m!217413))

(declare-fun m!217995 () Bool)

(assert (=> b!191259 m!217995))

(assert (=> b!190928 d!56197))

(declare-fun b!191260 () Bool)

(declare-fun e!125836 () Bool)

(assert (=> b!191260 (= e!125836 tp_is_empty!4441)))

(declare-fun mapIsEmpty!7677 () Bool)

(declare-fun mapRes!7677 () Bool)

(assert (=> mapIsEmpty!7677 mapRes!7677))

(declare-fun b!191261 () Bool)

(declare-fun e!125837 () Bool)

(assert (=> b!191261 (= e!125837 tp_is_empty!4441)))

(declare-fun mapNonEmpty!7677 () Bool)

(declare-fun tp!16866 () Bool)

(assert (=> mapNonEmpty!7677 (= mapRes!7677 (and tp!16866 e!125836))))

(declare-fun mapValue!7677 () ValueCell!1877)

(declare-fun mapKey!7677 () (_ BitVec 32))

(declare-fun mapRest!7677 () (Array (_ BitVec 32) ValueCell!1877))

(assert (=> mapNonEmpty!7677 (= mapRest!7676 (store mapRest!7677 mapKey!7677 mapValue!7677))))

(declare-fun condMapEmpty!7677 () Bool)

(declare-fun mapDefault!7677 () ValueCell!1877)

(assert (=> mapNonEmpty!7676 (= condMapEmpty!7677 (= mapRest!7676 ((as const (Array (_ BitVec 32) ValueCell!1877)) mapDefault!7677)))))

(assert (=> mapNonEmpty!7676 (= tp!16865 (and e!125837 mapRes!7677))))

(assert (= (and mapNonEmpty!7676 condMapEmpty!7677) mapIsEmpty!7677))

(assert (= (and mapNonEmpty!7676 (not condMapEmpty!7677)) mapNonEmpty!7677))

(assert (= (and mapNonEmpty!7677 ((_ is ValueCellFull!1877) mapValue!7677)) b!191260))

(assert (= (and mapNonEmpty!7676 ((_ is ValueCellFull!1877) mapDefault!7677)) b!191261))

(declare-fun m!217997 () Bool)

(assert (=> mapNonEmpty!7677 m!217997))

(declare-fun b_lambda!7405 () Bool)

(assert (= b_lambda!7401 (or (and b!190696 b_free!4669) b_lambda!7405)))

(declare-fun b_lambda!7407 () Bool)

(assert (= b_lambda!7403 (or (and b!190696 b_free!4669) b_lambda!7407)))

(declare-fun b_lambda!7409 () Bool)

(assert (= b_lambda!7397 (or (and b!190696 b_free!4669) b_lambda!7409)))

(declare-fun b_lambda!7411 () Bool)

(assert (= b_lambda!7399 (or (and b!190696 b_free!4669) b_lambda!7411)))

(check-sat (not b!191089) (not d!56169) (not d!56107) (not b!191206) (not b!191125) (not b_next!4669) (not d!56193) (not b!191038) (not d!56099) (not b!191220) (not d!56125) (not b!191042) (not d!56135) (not d!56105) (not d!56185) (not d!56113) (not b!191062) (not d!56051) (not bm!19276) (not b!190998) (not b!191030) (not d!56187) (not bm!19270) (not d!56085) (not d!56103) (not b!191208) (not b!191258) (not b_lambda!7393) (not b!191147) (not d!56139) (not b_lambda!7411) (not d!56181) (not d!56111) (not b!191142) (not d!56133) b_and!11357 (not b!191135) (not b!191221) (not b!191157) (not b!191155) (not b!191052) (not b!191024) (not b!191068) (not b_lambda!7409) (not b!191025) (not d!56057) (not b!191063) (not b_lambda!7395) (not b!191134) (not d!56081) (not d!56157) (not b!191083) (not d!56065) (not b!191138) (not d!56147) (not b!191128) (not d!56189) (not b!191053) (not d!56149) (not b!191143) (not d!56119) (not bm!19255) tp_is_empty!4441 (not d!56127) (not d!56171) (not b!191141) (not b!190972) (not d!56061) (not b!191043) (not d!56109) (not b!191259) (not d!56123) (not b_lambda!7407) (not b!191153) (not d!56071) (not b!191075) (not b!191058) (not b!191150) (not mapNonEmpty!7677) (not bm!19267) (not b!191205) (not b!191034) (not b!191148) (not b!191064) (not b!191067) (not d!56059) (not b!190971) (not b!191059) (not b!191140) (not b!191031) (not d!56063) (not d!56067) (not b!190967) (not d!56145) (not b!191054) (not b!191050) (not b!191039) (not b!191090) (not d!56195) (not b!191051) (not b!191080) (not b!190939) (not b!191078) (not b!191037) (not d!56097) (not b!191151) (not b!190988) (not b!190994) (not d!56141) (not b!191127) (not d!56101) (not b!190969) (not b!191041) (not b!191026) (not b!191222) (not d!56163) (not b!191154) (not b!191198) (not b!190995) (not b!191056) (not d!56079) (not d!56153) (not b!191035) (not b!191152) (not d!56083) (not d!56159) (not d!56173) (not d!56151) (not b!190938) (not b!191113) (not b!191170) (not bm!19264) (not d!56089) (not d!56117) (not d!56129) (not b!191074) (not b!190968) (not d!56167) (not bm!19254) (not d!56093) (not b!190961) (not d!56155) (not d!56091) (not b!191029) (not b!191057) (not d!56131) (not d!56161) (not d!56087) (not d!56165) (not b!191077) (not b!190974) (not bm!19275) (not d!56095) (not b!190977) (not b_lambda!7405) (not b!191118) (not d!56177) (not b!191144) (not b!191186) (not d!56053) (not b!191136) (not b!191197) (not d!56143) (not b!191149) (not bm!19279) (not b!191116))
(check-sat b_and!11357 (not b_next!4669))
