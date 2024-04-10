; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18484 () Bool)

(assert start!18484)

(declare-fun b!183343 () Bool)

(declare-fun b_free!4527 () Bool)

(declare-fun b_next!4527 () Bool)

(assert (=> b!183343 (= b_free!4527 (not b_next!4527))))

(declare-fun tp!16352 () Bool)

(declare-fun b_and!11097 () Bool)

(assert (=> b!183343 (= tp!16352 b_and!11097)))

(declare-fun b!183337 () Bool)

(declare-fun e!120711 () Bool)

(declare-datatypes ((V!5379 0))(
  ( (V!5380 (val!2194 Int)) )
))
(declare-datatypes ((ValueCell!1806 0))(
  ( (ValueCellFull!1806 (v!4097 V!5379)) (EmptyCell!1806) )
))
(declare-datatypes ((array!7791 0))(
  ( (array!7792 (arr!3683 (Array (_ BitVec 32) (_ BitVec 64))) (size!3995 (_ BitVec 32))) )
))
(declare-datatypes ((array!7793 0))(
  ( (array!7794 (arr!3684 (Array (_ BitVec 32) ValueCell!1806)) (size!3996 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2520 0))(
  ( (LongMapFixedSize!2521 (defaultEntry!3750 Int) (mask!8812 (_ BitVec 32)) (extraKeys!3487 (_ BitVec 32)) (zeroValue!3591 V!5379) (minValue!3591 V!5379) (_size!1309 (_ BitVec 32)) (_keys!5668 array!7791) (_values!3733 array!7793) (_vacant!1309 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2520)

(assert (=> b!183337 (= e!120711 (not (= (size!3996 (_values!3733 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8812 thiss!1248)))))))

(declare-fun b!183338 () Bool)

(declare-fun e!120709 () Bool)

(declare-fun e!120713 () Bool)

(declare-fun mapRes!7382 () Bool)

(assert (=> b!183338 (= e!120709 (and e!120713 mapRes!7382))))

(declare-fun condMapEmpty!7382 () Bool)

(declare-fun mapDefault!7382 () ValueCell!1806)

(assert (=> b!183338 (= condMapEmpty!7382 (= (arr!3684 (_values!3733 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1806)) mapDefault!7382)))))

(declare-fun b!183339 () Bool)

(declare-fun e!120708 () Bool)

(assert (=> b!183339 (= e!120708 e!120711)))

(declare-fun res!86784 () Bool)

(assert (=> b!183339 (=> (not res!86784) (not e!120711))))

(declare-datatypes ((SeekEntryResult!620 0))(
  ( (MissingZero!620 (index!4650 (_ BitVec 32))) (Found!620 (index!4651 (_ BitVec 32))) (Intermediate!620 (undefined!1432 Bool) (index!4652 (_ BitVec 32)) (x!19974 (_ BitVec 32))) (Undefined!620) (MissingVacant!620 (index!4653 (_ BitVec 32))) )
))
(declare-fun lt!90622 () SeekEntryResult!620)

(get-info :version)

(assert (=> b!183339 (= res!86784 (and (not ((_ is Undefined!620) lt!90622)) (not ((_ is MissingVacant!620) lt!90622)) (not ((_ is MissingZero!620) lt!90622)) ((_ is Found!620) lt!90622)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7791 (_ BitVec 32)) SeekEntryResult!620)

(assert (=> b!183339 (= lt!90622 (seekEntryOrOpen!0 key!828 (_keys!5668 thiss!1248) (mask!8812 thiss!1248)))))

(declare-fun b!183340 () Bool)

(declare-fun res!86786 () Bool)

(assert (=> b!183340 (=> (not res!86786) (not e!120708))))

(assert (=> b!183340 (= res!86786 (not (= key!828 (bvneg key!828))))))

(declare-fun b!183341 () Bool)

(declare-fun res!86785 () Bool)

(assert (=> b!183341 (=> (not res!86785) (not e!120711))))

(declare-datatypes ((tuple2!3420 0))(
  ( (tuple2!3421 (_1!1721 (_ BitVec 64)) (_2!1721 V!5379)) )
))
(declare-datatypes ((List!2337 0))(
  ( (Nil!2334) (Cons!2333 (h!2962 tuple2!3420) (t!7205 List!2337)) )
))
(declare-datatypes ((ListLongMap!2337 0))(
  ( (ListLongMap!2338 (toList!1184 List!2337)) )
))
(declare-fun contains!1270 (ListLongMap!2337 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!832 (array!7791 array!7793 (_ BitVec 32) (_ BitVec 32) V!5379 V!5379 (_ BitVec 32) Int) ListLongMap!2337)

(assert (=> b!183341 (= res!86785 (not (contains!1270 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)) key!828)))))

(declare-fun b!183342 () Bool)

(declare-fun e!120707 () Bool)

(declare-fun tp_is_empty!4299 () Bool)

(assert (=> b!183342 (= e!120707 tp_is_empty!4299)))

(declare-fun e!120712 () Bool)

(declare-fun array_inv!2381 (array!7791) Bool)

(declare-fun array_inv!2382 (array!7793) Bool)

(assert (=> b!183343 (= e!120712 (and tp!16352 tp_is_empty!4299 (array_inv!2381 (_keys!5668 thiss!1248)) (array_inv!2382 (_values!3733 thiss!1248)) e!120709))))

(declare-fun mapIsEmpty!7382 () Bool)

(assert (=> mapIsEmpty!7382 mapRes!7382))

(declare-fun res!86783 () Bool)

(assert (=> start!18484 (=> (not res!86783) (not e!120708))))

(declare-fun valid!1042 (LongMapFixedSize!2520) Bool)

(assert (=> start!18484 (= res!86783 (valid!1042 thiss!1248))))

(assert (=> start!18484 e!120708))

(assert (=> start!18484 e!120712))

(assert (=> start!18484 true))

(declare-fun mapNonEmpty!7382 () Bool)

(declare-fun tp!16351 () Bool)

(assert (=> mapNonEmpty!7382 (= mapRes!7382 (and tp!16351 e!120707))))

(declare-fun mapRest!7382 () (Array (_ BitVec 32) ValueCell!1806))

(declare-fun mapValue!7382 () ValueCell!1806)

(declare-fun mapKey!7382 () (_ BitVec 32))

(assert (=> mapNonEmpty!7382 (= (arr!3684 (_values!3733 thiss!1248)) (store mapRest!7382 mapKey!7382 mapValue!7382))))

(declare-fun b!183344 () Bool)

(assert (=> b!183344 (= e!120713 tp_is_empty!4299)))

(declare-fun b!183345 () Bool)

(declare-fun res!86787 () Bool)

(assert (=> b!183345 (=> (not res!86787) (not e!120711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!183345 (= res!86787 (validMask!0 (mask!8812 thiss!1248)))))

(assert (= (and start!18484 res!86783) b!183340))

(assert (= (and b!183340 res!86786) b!183339))

(assert (= (and b!183339 res!86784) b!183341))

(assert (= (and b!183341 res!86785) b!183345))

(assert (= (and b!183345 res!86787) b!183337))

(assert (= (and b!183338 condMapEmpty!7382) mapIsEmpty!7382))

(assert (= (and b!183338 (not condMapEmpty!7382)) mapNonEmpty!7382))

(assert (= (and mapNonEmpty!7382 ((_ is ValueCellFull!1806) mapValue!7382)) b!183342))

(assert (= (and b!183338 ((_ is ValueCellFull!1806) mapDefault!7382)) b!183344))

(assert (= b!183343 b!183338))

(assert (= start!18484 b!183343))

(declare-fun m!210847 () Bool)

(assert (=> start!18484 m!210847))

(declare-fun m!210849 () Bool)

(assert (=> b!183345 m!210849))

(declare-fun m!210851 () Bool)

(assert (=> b!183343 m!210851))

(declare-fun m!210853 () Bool)

(assert (=> b!183343 m!210853))

(declare-fun m!210855 () Bool)

(assert (=> mapNonEmpty!7382 m!210855))

(declare-fun m!210857 () Bool)

(assert (=> b!183339 m!210857))

(declare-fun m!210859 () Bool)

(assert (=> b!183341 m!210859))

(assert (=> b!183341 m!210859))

(declare-fun m!210861 () Bool)

(assert (=> b!183341 m!210861))

(check-sat b_and!11097 (not b_next!4527) tp_is_empty!4299 (not b!183345) (not start!18484) (not mapNonEmpty!7382) (not b!183343) (not b!183341) (not b!183339))
(check-sat b_and!11097 (not b_next!4527))
(get-model)

(declare-fun d!54703 () Bool)

(assert (=> d!54703 (= (validMask!0 (mask!8812 thiss!1248)) (and (or (= (mask!8812 thiss!1248) #b00000000000000000000000000000111) (= (mask!8812 thiss!1248) #b00000000000000000000000000001111) (= (mask!8812 thiss!1248) #b00000000000000000000000000011111) (= (mask!8812 thiss!1248) #b00000000000000000000000000111111) (= (mask!8812 thiss!1248) #b00000000000000000000000001111111) (= (mask!8812 thiss!1248) #b00000000000000000000000011111111) (= (mask!8812 thiss!1248) #b00000000000000000000000111111111) (= (mask!8812 thiss!1248) #b00000000000000000000001111111111) (= (mask!8812 thiss!1248) #b00000000000000000000011111111111) (= (mask!8812 thiss!1248) #b00000000000000000000111111111111) (= (mask!8812 thiss!1248) #b00000000000000000001111111111111) (= (mask!8812 thiss!1248) #b00000000000000000011111111111111) (= (mask!8812 thiss!1248) #b00000000000000000111111111111111) (= (mask!8812 thiss!1248) #b00000000000000001111111111111111) (= (mask!8812 thiss!1248) #b00000000000000011111111111111111) (= (mask!8812 thiss!1248) #b00000000000000111111111111111111) (= (mask!8812 thiss!1248) #b00000000000001111111111111111111) (= (mask!8812 thiss!1248) #b00000000000011111111111111111111) (= (mask!8812 thiss!1248) #b00000000000111111111111111111111) (= (mask!8812 thiss!1248) #b00000000001111111111111111111111) (= (mask!8812 thiss!1248) #b00000000011111111111111111111111) (= (mask!8812 thiss!1248) #b00000000111111111111111111111111) (= (mask!8812 thiss!1248) #b00000001111111111111111111111111) (= (mask!8812 thiss!1248) #b00000011111111111111111111111111) (= (mask!8812 thiss!1248) #b00000111111111111111111111111111) (= (mask!8812 thiss!1248) #b00001111111111111111111111111111) (= (mask!8812 thiss!1248) #b00011111111111111111111111111111) (= (mask!8812 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8812 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!183345 d!54703))

(declare-fun d!54705 () Bool)

(declare-fun e!120739 () Bool)

(assert (=> d!54705 e!120739))

(declare-fun res!86805 () Bool)

(assert (=> d!54705 (=> res!86805 e!120739)))

(declare-fun lt!90635 () Bool)

(assert (=> d!54705 (= res!86805 (not lt!90635))))

(declare-fun lt!90637 () Bool)

(assert (=> d!54705 (= lt!90635 lt!90637)))

(declare-datatypes ((Unit!5548 0))(
  ( (Unit!5549) )
))
(declare-fun lt!90634 () Unit!5548)

(declare-fun e!120740 () Unit!5548)

(assert (=> d!54705 (= lt!90634 e!120740)))

(declare-fun c!32850 () Bool)

(assert (=> d!54705 (= c!32850 lt!90637)))

(declare-fun containsKey!220 (List!2337 (_ BitVec 64)) Bool)

(assert (=> d!54705 (= lt!90637 (containsKey!220 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))) key!828))))

(assert (=> d!54705 (= (contains!1270 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)) key!828) lt!90635)))

(declare-fun b!183379 () Bool)

(declare-fun lt!90636 () Unit!5548)

(assert (=> b!183379 (= e!120740 lt!90636)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!168 (List!2337 (_ BitVec 64)) Unit!5548)

(assert (=> b!183379 (= lt!90636 (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))) key!828))))

(declare-datatypes ((Option!222 0))(
  ( (Some!221 (v!4099 V!5379)) (None!220) )
))
(declare-fun isDefined!169 (Option!222) Bool)

(declare-fun getValueByKey!216 (List!2337 (_ BitVec 64)) Option!222)

(assert (=> b!183379 (isDefined!169 (getValueByKey!216 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))) key!828))))

(declare-fun b!183380 () Bool)

(declare-fun Unit!5550 () Unit!5548)

(assert (=> b!183380 (= e!120740 Unit!5550)))

(declare-fun b!183381 () Bool)

(assert (=> b!183381 (= e!120739 (isDefined!169 (getValueByKey!216 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))) key!828)))))

(assert (= (and d!54705 c!32850) b!183379))

(assert (= (and d!54705 (not c!32850)) b!183380))

(assert (= (and d!54705 (not res!86805)) b!183381))

(declare-fun m!210879 () Bool)

(assert (=> d!54705 m!210879))

(declare-fun m!210881 () Bool)

(assert (=> b!183379 m!210881))

(declare-fun m!210883 () Bool)

(assert (=> b!183379 m!210883))

(assert (=> b!183379 m!210883))

(declare-fun m!210885 () Bool)

(assert (=> b!183379 m!210885))

(assert (=> b!183381 m!210883))

(assert (=> b!183381 m!210883))

(assert (=> b!183381 m!210885))

(assert (=> b!183341 d!54705))

(declare-fun b!183425 () Bool)

(declare-fun res!86828 () Bool)

(declare-fun e!120770 () Bool)

(assert (=> b!183425 (=> (not res!86828) (not e!120770))))

(declare-fun e!120769 () Bool)

(assert (=> b!183425 (= res!86828 e!120769)))

(declare-fun c!32868 () Bool)

(assert (=> b!183425 (= c!32868 (not (= (bvand (extraKeys!3487 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!18520 () Bool)

(declare-fun call!18523 () ListLongMap!2337)

(declare-fun getCurrentListMapNoExtraKeys!192 (array!7791 array!7793 (_ BitVec 32) (_ BitVec 32) V!5379 V!5379 (_ BitVec 32) Int) ListLongMap!2337)

(assert (=> bm!18520 (= call!18523 (getCurrentListMapNoExtraKeys!192 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)))))

(declare-fun b!183426 () Bool)

(declare-fun e!120776 () ListLongMap!2337)

(declare-fun call!18526 () ListLongMap!2337)

(declare-fun +!279 (ListLongMap!2337 tuple2!3420) ListLongMap!2337)

(assert (=> b!183426 (= e!120776 (+!279 call!18526 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248))))))

(declare-fun b!183427 () Bool)

(declare-fun e!120768 () Bool)

(declare-fun call!18524 () Bool)

(assert (=> b!183427 (= e!120768 (not call!18524))))

(declare-fun b!183428 () Bool)

(declare-fun c!32864 () Bool)

(assert (=> b!183428 (= c!32864 (and (not (= (bvand (extraKeys!3487 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3487 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!120774 () ListLongMap!2337)

(declare-fun e!120767 () ListLongMap!2337)

(assert (=> b!183428 (= e!120774 e!120767)))

(declare-fun b!183429 () Bool)

(declare-fun e!120772 () Bool)

(declare-fun lt!90694 () ListLongMap!2337)

(declare-fun apply!159 (ListLongMap!2337 (_ BitVec 64)) V!5379)

(declare-fun get!2108 (ValueCell!1806 V!5379) V!5379)

(declare-fun dynLambda!502 (Int (_ BitVec 64)) V!5379)

(assert (=> b!183429 (= e!120772 (= (apply!159 lt!90694 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)) (get!2108 (select (arr!3684 (_values!3733 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3750 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183429 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3996 (_values!3733 thiss!1248))))))

(assert (=> b!183429 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))))))

(declare-fun bm!18521 () Bool)

(declare-fun call!18528 () ListLongMap!2337)

(assert (=> bm!18521 (= call!18528 call!18523)))

(declare-fun bm!18522 () Bool)

(declare-fun c!32865 () Bool)

(declare-fun call!18525 () ListLongMap!2337)

(declare-fun c!32866 () Bool)

(assert (=> bm!18522 (= call!18526 (+!279 (ite c!32866 call!18523 (ite c!32865 call!18528 call!18525)) (ite (or c!32866 c!32865) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3591 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248)))))))

(declare-fun b!183430 () Bool)

(declare-fun e!120771 () Bool)

(assert (=> b!183430 (= e!120769 e!120771)))

(declare-fun res!86827 () Bool)

(declare-fun call!18527 () Bool)

(assert (=> b!183430 (= res!86827 call!18527)))

(assert (=> b!183430 (=> (not res!86827) (not e!120771))))

(declare-fun b!183431 () Bool)

(assert (=> b!183431 (= e!120767 call!18525)))

(declare-fun b!183432 () Bool)

(declare-fun e!120779 () Bool)

(assert (=> b!183432 (= e!120779 (= (apply!159 lt!90694 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3591 thiss!1248)))))

(declare-fun b!183433 () Bool)

(declare-fun call!18529 () ListLongMap!2337)

(assert (=> b!183433 (= e!120767 call!18529)))

(declare-fun b!183434 () Bool)

(declare-fun e!120775 () Unit!5548)

(declare-fun lt!90690 () Unit!5548)

(assert (=> b!183434 (= e!120775 lt!90690)))

(declare-fun lt!90686 () ListLongMap!2337)

(assert (=> b!183434 (= lt!90686 (getCurrentListMapNoExtraKeys!192 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)))))

(declare-fun lt!90696 () (_ BitVec 64))

(assert (=> b!183434 (= lt!90696 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90691 () (_ BitVec 64))

(assert (=> b!183434 (= lt!90691 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90684 () Unit!5548)

(declare-fun addStillContains!135 (ListLongMap!2337 (_ BitVec 64) V!5379 (_ BitVec 64)) Unit!5548)

(assert (=> b!183434 (= lt!90684 (addStillContains!135 lt!90686 lt!90696 (zeroValue!3591 thiss!1248) lt!90691))))

(assert (=> b!183434 (contains!1270 (+!279 lt!90686 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248))) lt!90691)))

(declare-fun lt!90683 () Unit!5548)

(assert (=> b!183434 (= lt!90683 lt!90684)))

(declare-fun lt!90687 () ListLongMap!2337)

(assert (=> b!183434 (= lt!90687 (getCurrentListMapNoExtraKeys!192 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)))))

(declare-fun lt!90693 () (_ BitVec 64))

(assert (=> b!183434 (= lt!90693 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90682 () (_ BitVec 64))

(assert (=> b!183434 (= lt!90682 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90688 () Unit!5548)

(declare-fun addApplyDifferent!135 (ListLongMap!2337 (_ BitVec 64) V!5379 (_ BitVec 64)) Unit!5548)

(assert (=> b!183434 (= lt!90688 (addApplyDifferent!135 lt!90687 lt!90693 (minValue!3591 thiss!1248) lt!90682))))

(assert (=> b!183434 (= (apply!159 (+!279 lt!90687 (tuple2!3421 lt!90693 (minValue!3591 thiss!1248))) lt!90682) (apply!159 lt!90687 lt!90682))))

(declare-fun lt!90689 () Unit!5548)

(assert (=> b!183434 (= lt!90689 lt!90688)))

(declare-fun lt!90692 () ListLongMap!2337)

(assert (=> b!183434 (= lt!90692 (getCurrentListMapNoExtraKeys!192 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)))))

(declare-fun lt!90698 () (_ BitVec 64))

(assert (=> b!183434 (= lt!90698 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90699 () (_ BitVec 64))

(assert (=> b!183434 (= lt!90699 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90695 () Unit!5548)

(assert (=> b!183434 (= lt!90695 (addApplyDifferent!135 lt!90692 lt!90698 (zeroValue!3591 thiss!1248) lt!90699))))

(assert (=> b!183434 (= (apply!159 (+!279 lt!90692 (tuple2!3421 lt!90698 (zeroValue!3591 thiss!1248))) lt!90699) (apply!159 lt!90692 lt!90699))))

(declare-fun lt!90702 () Unit!5548)

(assert (=> b!183434 (= lt!90702 lt!90695)))

(declare-fun lt!90701 () ListLongMap!2337)

(assert (=> b!183434 (= lt!90701 (getCurrentListMapNoExtraKeys!192 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)))))

(declare-fun lt!90700 () (_ BitVec 64))

(assert (=> b!183434 (= lt!90700 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90685 () (_ BitVec 64))

(assert (=> b!183434 (= lt!90685 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183434 (= lt!90690 (addApplyDifferent!135 lt!90701 lt!90700 (minValue!3591 thiss!1248) lt!90685))))

(assert (=> b!183434 (= (apply!159 (+!279 lt!90701 (tuple2!3421 lt!90700 (minValue!3591 thiss!1248))) lt!90685) (apply!159 lt!90701 lt!90685))))

(declare-fun bm!18523 () Bool)

(assert (=> bm!18523 (= call!18527 (contains!1270 lt!90694 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183424 () Bool)

(assert (=> b!183424 (= e!120776 e!120774)))

(assert (=> b!183424 (= c!32865 (and (not (= (bvand (extraKeys!3487 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3487 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!54707 () Bool)

(assert (=> d!54707 e!120770))

(declare-fun res!86826 () Bool)

(assert (=> d!54707 (=> (not res!86826) (not e!120770))))

(assert (=> d!54707 (= res!86826 (or (bvsge #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))))))))

(declare-fun lt!90703 () ListLongMap!2337)

(assert (=> d!54707 (= lt!90694 lt!90703)))

(declare-fun lt!90697 () Unit!5548)

(assert (=> d!54707 (= lt!90697 e!120775)))

(declare-fun c!32863 () Bool)

(declare-fun e!120777 () Bool)

(assert (=> d!54707 (= c!32863 e!120777)))

(declare-fun res!86824 () Bool)

(assert (=> d!54707 (=> (not res!86824) (not e!120777))))

(assert (=> d!54707 (= res!86824 (bvslt #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))))))

(assert (=> d!54707 (= lt!90703 e!120776)))

(assert (=> d!54707 (= c!32866 (and (not (= (bvand (extraKeys!3487 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3487 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54707 (validMask!0 (mask!8812 thiss!1248))))

(assert (=> d!54707 (= (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)) lt!90694)))

(declare-fun b!183435 () Bool)

(declare-fun e!120778 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!183435 (= e!120778 (validKeyInArray!0 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183436 () Bool)

(assert (=> b!183436 (= e!120771 (= (apply!159 lt!90694 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3591 thiss!1248)))))

(declare-fun b!183437 () Bool)

(assert (=> b!183437 (= e!120769 (not call!18527))))

(declare-fun b!183438 () Bool)

(declare-fun res!86831 () Bool)

(assert (=> b!183438 (=> (not res!86831) (not e!120770))))

(declare-fun e!120773 () Bool)

(assert (=> b!183438 (= res!86831 e!120773)))

(declare-fun res!86830 () Bool)

(assert (=> b!183438 (=> res!86830 e!120773)))

(assert (=> b!183438 (= res!86830 (not e!120778))))

(declare-fun res!86832 () Bool)

(assert (=> b!183438 (=> (not res!86832) (not e!120778))))

(assert (=> b!183438 (= res!86832 (bvslt #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))))))

(declare-fun bm!18524 () Bool)

(assert (=> bm!18524 (= call!18529 call!18526)))

(declare-fun bm!18525 () Bool)

(assert (=> bm!18525 (= call!18524 (contains!1270 lt!90694 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183439 () Bool)

(assert (=> b!183439 (= e!120774 call!18529)))

(declare-fun b!183440 () Bool)

(assert (=> b!183440 (= e!120770 e!120768)))

(declare-fun c!32867 () Bool)

(assert (=> b!183440 (= c!32867 (not (= (bvand (extraKeys!3487 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!183441 () Bool)

(assert (=> b!183441 (= e!120773 e!120772)))

(declare-fun res!86829 () Bool)

(assert (=> b!183441 (=> (not res!86829) (not e!120772))))

(assert (=> b!183441 (= res!86829 (contains!1270 lt!90694 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183441 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))))))

(declare-fun b!183442 () Bool)

(assert (=> b!183442 (= e!120768 e!120779)))

(declare-fun res!86825 () Bool)

(assert (=> b!183442 (= res!86825 call!18524)))

(assert (=> b!183442 (=> (not res!86825) (not e!120779))))

(declare-fun bm!18526 () Bool)

(assert (=> bm!18526 (= call!18525 call!18528)))

(declare-fun b!183443 () Bool)

(declare-fun Unit!5551 () Unit!5548)

(assert (=> b!183443 (= e!120775 Unit!5551)))

(declare-fun b!183444 () Bool)

(assert (=> b!183444 (= e!120777 (validKeyInArray!0 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54707 c!32866) b!183426))

(assert (= (and d!54707 (not c!32866)) b!183424))

(assert (= (and b!183424 c!32865) b!183439))

(assert (= (and b!183424 (not c!32865)) b!183428))

(assert (= (and b!183428 c!32864) b!183433))

(assert (= (and b!183428 (not c!32864)) b!183431))

(assert (= (or b!183433 b!183431) bm!18526))

(assert (= (or b!183439 bm!18526) bm!18521))

(assert (= (or b!183439 b!183433) bm!18524))

(assert (= (or b!183426 bm!18521) bm!18520))

(assert (= (or b!183426 bm!18524) bm!18522))

(assert (= (and d!54707 res!86824) b!183444))

(assert (= (and d!54707 c!32863) b!183434))

(assert (= (and d!54707 (not c!32863)) b!183443))

(assert (= (and d!54707 res!86826) b!183438))

(assert (= (and b!183438 res!86832) b!183435))

(assert (= (and b!183438 (not res!86830)) b!183441))

(assert (= (and b!183441 res!86829) b!183429))

(assert (= (and b!183438 res!86831) b!183425))

(assert (= (and b!183425 c!32868) b!183430))

(assert (= (and b!183425 (not c!32868)) b!183437))

(assert (= (and b!183430 res!86827) b!183436))

(assert (= (or b!183430 b!183437) bm!18523))

(assert (= (and b!183425 res!86828) b!183440))

(assert (= (and b!183440 c!32867) b!183442))

(assert (= (and b!183440 (not c!32867)) b!183427))

(assert (= (and b!183442 res!86825) b!183432))

(assert (= (or b!183442 b!183427) bm!18525))

(declare-fun b_lambda!7191 () Bool)

(assert (=> (not b_lambda!7191) (not b!183429)))

(declare-fun t!7208 () Bool)

(declare-fun tb!2829 () Bool)

(assert (=> (and b!183343 (= (defaultEntry!3750 thiss!1248) (defaultEntry!3750 thiss!1248)) t!7208) tb!2829))

(declare-fun result!4765 () Bool)

(assert (=> tb!2829 (= result!4765 tp_is_empty!4299)))

(assert (=> b!183429 t!7208))

(declare-fun b_and!11101 () Bool)

(assert (= b_and!11097 (and (=> t!7208 result!4765) b_and!11101)))

(declare-fun m!210887 () Bool)

(assert (=> b!183441 m!210887))

(assert (=> b!183441 m!210887))

(declare-fun m!210889 () Bool)

(assert (=> b!183441 m!210889))

(assert (=> b!183444 m!210887))

(assert (=> b!183444 m!210887))

(declare-fun m!210891 () Bool)

(assert (=> b!183444 m!210891))

(assert (=> d!54707 m!210849))

(declare-fun m!210893 () Bool)

(assert (=> bm!18525 m!210893))

(declare-fun m!210895 () Bool)

(assert (=> b!183426 m!210895))

(declare-fun m!210897 () Bool)

(assert (=> b!183429 m!210897))

(assert (=> b!183429 m!210887))

(assert (=> b!183429 m!210887))

(declare-fun m!210899 () Bool)

(assert (=> b!183429 m!210899))

(declare-fun m!210901 () Bool)

(assert (=> b!183429 m!210901))

(assert (=> b!183429 m!210897))

(declare-fun m!210903 () Bool)

(assert (=> b!183429 m!210903))

(assert (=> b!183429 m!210901))

(declare-fun m!210905 () Bool)

(assert (=> b!183432 m!210905))

(declare-fun m!210907 () Bool)

(assert (=> bm!18522 m!210907))

(assert (=> b!183435 m!210887))

(assert (=> b!183435 m!210887))

(assert (=> b!183435 m!210891))

(declare-fun m!210909 () Bool)

(assert (=> b!183434 m!210909))

(declare-fun m!210911 () Bool)

(assert (=> b!183434 m!210911))

(assert (=> b!183434 m!210887))

(declare-fun m!210913 () Bool)

(assert (=> b!183434 m!210913))

(declare-fun m!210915 () Bool)

(assert (=> b!183434 m!210915))

(declare-fun m!210917 () Bool)

(assert (=> b!183434 m!210917))

(declare-fun m!210919 () Bool)

(assert (=> b!183434 m!210919))

(declare-fun m!210921 () Bool)

(assert (=> b!183434 m!210921))

(declare-fun m!210923 () Bool)

(assert (=> b!183434 m!210923))

(declare-fun m!210925 () Bool)

(assert (=> b!183434 m!210925))

(declare-fun m!210927 () Bool)

(assert (=> b!183434 m!210927))

(declare-fun m!210929 () Bool)

(assert (=> b!183434 m!210929))

(assert (=> b!183434 m!210909))

(assert (=> b!183434 m!210915))

(declare-fun m!210931 () Bool)

(assert (=> b!183434 m!210931))

(assert (=> b!183434 m!210925))

(declare-fun m!210933 () Bool)

(assert (=> b!183434 m!210933))

(assert (=> b!183434 m!210921))

(declare-fun m!210935 () Bool)

(assert (=> b!183434 m!210935))

(declare-fun m!210937 () Bool)

(assert (=> b!183434 m!210937))

(declare-fun m!210939 () Bool)

(assert (=> b!183434 m!210939))

(declare-fun m!210941 () Bool)

(assert (=> b!183436 m!210941))

(assert (=> bm!18520 m!210939))

(declare-fun m!210943 () Bool)

(assert (=> bm!18523 m!210943))

(assert (=> b!183341 d!54707))

(declare-fun d!54709 () Bool)

(assert (=> d!54709 (= (array_inv!2381 (_keys!5668 thiss!1248)) (bvsge (size!3995 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183343 d!54709))

(declare-fun d!54711 () Bool)

(assert (=> d!54711 (= (array_inv!2382 (_values!3733 thiss!1248)) (bvsge (size!3996 (_values!3733 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183343 d!54711))

(declare-fun b!183459 () Bool)

(declare-fun e!120786 () SeekEntryResult!620)

(declare-fun lt!90711 () SeekEntryResult!620)

(assert (=> b!183459 (= e!120786 (Found!620 (index!4652 lt!90711)))))

(declare-fun b!183460 () Bool)

(declare-fun e!120788 () SeekEntryResult!620)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7791 (_ BitVec 32)) SeekEntryResult!620)

(assert (=> b!183460 (= e!120788 (seekKeyOrZeroReturnVacant!0 (x!19974 lt!90711) (index!4652 lt!90711) (index!4652 lt!90711) key!828 (_keys!5668 thiss!1248) (mask!8812 thiss!1248)))))

(declare-fun b!183461 () Bool)

(declare-fun e!120787 () SeekEntryResult!620)

(assert (=> b!183461 (= e!120787 Undefined!620)))

(declare-fun b!183462 () Bool)

(assert (=> b!183462 (= e!120787 e!120786)))

(declare-fun lt!90712 () (_ BitVec 64))

(assert (=> b!183462 (= lt!90712 (select (arr!3683 (_keys!5668 thiss!1248)) (index!4652 lt!90711)))))

(declare-fun c!32877 () Bool)

(assert (=> b!183462 (= c!32877 (= lt!90712 key!828))))

(declare-fun b!183463 () Bool)

(declare-fun c!32875 () Bool)

(assert (=> b!183463 (= c!32875 (= lt!90712 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183463 (= e!120786 e!120788)))

(declare-fun b!183464 () Bool)

(assert (=> b!183464 (= e!120788 (MissingZero!620 (index!4652 lt!90711)))))

(declare-fun d!54713 () Bool)

(declare-fun lt!90710 () SeekEntryResult!620)

(assert (=> d!54713 (and (or ((_ is Undefined!620) lt!90710) (not ((_ is Found!620) lt!90710)) (and (bvsge (index!4651 lt!90710) #b00000000000000000000000000000000) (bvslt (index!4651 lt!90710) (size!3995 (_keys!5668 thiss!1248))))) (or ((_ is Undefined!620) lt!90710) ((_ is Found!620) lt!90710) (not ((_ is MissingZero!620) lt!90710)) (and (bvsge (index!4650 lt!90710) #b00000000000000000000000000000000) (bvslt (index!4650 lt!90710) (size!3995 (_keys!5668 thiss!1248))))) (or ((_ is Undefined!620) lt!90710) ((_ is Found!620) lt!90710) ((_ is MissingZero!620) lt!90710) (not ((_ is MissingVacant!620) lt!90710)) (and (bvsge (index!4653 lt!90710) #b00000000000000000000000000000000) (bvslt (index!4653 lt!90710) (size!3995 (_keys!5668 thiss!1248))))) (or ((_ is Undefined!620) lt!90710) (ite ((_ is Found!620) lt!90710) (= (select (arr!3683 (_keys!5668 thiss!1248)) (index!4651 lt!90710)) key!828) (ite ((_ is MissingZero!620) lt!90710) (= (select (arr!3683 (_keys!5668 thiss!1248)) (index!4650 lt!90710)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!620) lt!90710) (= (select (arr!3683 (_keys!5668 thiss!1248)) (index!4653 lt!90710)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54713 (= lt!90710 e!120787)))

(declare-fun c!32876 () Bool)

(assert (=> d!54713 (= c!32876 (and ((_ is Intermediate!620) lt!90711) (undefined!1432 lt!90711)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7791 (_ BitVec 32)) SeekEntryResult!620)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54713 (= lt!90711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8812 thiss!1248)) key!828 (_keys!5668 thiss!1248) (mask!8812 thiss!1248)))))

(assert (=> d!54713 (validMask!0 (mask!8812 thiss!1248))))

(assert (=> d!54713 (= (seekEntryOrOpen!0 key!828 (_keys!5668 thiss!1248) (mask!8812 thiss!1248)) lt!90710)))

(assert (= (and d!54713 c!32876) b!183461))

(assert (= (and d!54713 (not c!32876)) b!183462))

(assert (= (and b!183462 c!32877) b!183459))

(assert (= (and b!183462 (not c!32877)) b!183463))

(assert (= (and b!183463 c!32875) b!183464))

(assert (= (and b!183463 (not c!32875)) b!183460))

(declare-fun m!210945 () Bool)

(assert (=> b!183460 m!210945))

(declare-fun m!210947 () Bool)

(assert (=> b!183462 m!210947))

(declare-fun m!210949 () Bool)

(assert (=> d!54713 m!210949))

(declare-fun m!210951 () Bool)

(assert (=> d!54713 m!210951))

(declare-fun m!210953 () Bool)

(assert (=> d!54713 m!210953))

(declare-fun m!210955 () Bool)

(assert (=> d!54713 m!210955))

(assert (=> d!54713 m!210949))

(declare-fun m!210957 () Bool)

(assert (=> d!54713 m!210957))

(assert (=> d!54713 m!210849))

(assert (=> b!183339 d!54713))

(declare-fun d!54715 () Bool)

(declare-fun res!86839 () Bool)

(declare-fun e!120791 () Bool)

(assert (=> d!54715 (=> (not res!86839) (not e!120791))))

(declare-fun simpleValid!175 (LongMapFixedSize!2520) Bool)

(assert (=> d!54715 (= res!86839 (simpleValid!175 thiss!1248))))

(assert (=> d!54715 (= (valid!1042 thiss!1248) e!120791)))

(declare-fun b!183471 () Bool)

(declare-fun res!86840 () Bool)

(assert (=> b!183471 (=> (not res!86840) (not e!120791))))

(declare-fun arrayCountValidKeys!0 (array!7791 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183471 (= res!86840 (= (arrayCountValidKeys!0 (_keys!5668 thiss!1248) #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))) (_size!1309 thiss!1248)))))

(declare-fun b!183472 () Bool)

(declare-fun res!86841 () Bool)

(assert (=> b!183472 (=> (not res!86841) (not e!120791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7791 (_ BitVec 32)) Bool)

(assert (=> b!183472 (= res!86841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5668 thiss!1248) (mask!8812 thiss!1248)))))

(declare-fun b!183473 () Bool)

(declare-datatypes ((List!2339 0))(
  ( (Nil!2336) (Cons!2335 (h!2964 (_ BitVec 64)) (t!7209 List!2339)) )
))
(declare-fun arrayNoDuplicates!0 (array!7791 (_ BitVec 32) List!2339) Bool)

(assert (=> b!183473 (= e!120791 (arrayNoDuplicates!0 (_keys!5668 thiss!1248) #b00000000000000000000000000000000 Nil!2336))))

(assert (= (and d!54715 res!86839) b!183471))

(assert (= (and b!183471 res!86840) b!183472))

(assert (= (and b!183472 res!86841) b!183473))

(declare-fun m!210959 () Bool)

(assert (=> d!54715 m!210959))

(declare-fun m!210961 () Bool)

(assert (=> b!183471 m!210961))

(declare-fun m!210963 () Bool)

(assert (=> b!183472 m!210963))

(declare-fun m!210965 () Bool)

(assert (=> b!183473 m!210965))

(assert (=> start!18484 d!54715))

(declare-fun mapNonEmpty!7388 () Bool)

(declare-fun mapRes!7388 () Bool)

(declare-fun tp!16361 () Bool)

(declare-fun e!120796 () Bool)

(assert (=> mapNonEmpty!7388 (= mapRes!7388 (and tp!16361 e!120796))))

(declare-fun mapRest!7388 () (Array (_ BitVec 32) ValueCell!1806))

(declare-fun mapValue!7388 () ValueCell!1806)

(declare-fun mapKey!7388 () (_ BitVec 32))

(assert (=> mapNonEmpty!7388 (= mapRest!7382 (store mapRest!7388 mapKey!7388 mapValue!7388))))

(declare-fun condMapEmpty!7388 () Bool)

(declare-fun mapDefault!7388 () ValueCell!1806)

(assert (=> mapNonEmpty!7382 (= condMapEmpty!7388 (= mapRest!7382 ((as const (Array (_ BitVec 32) ValueCell!1806)) mapDefault!7388)))))

(declare-fun e!120797 () Bool)

(assert (=> mapNonEmpty!7382 (= tp!16351 (and e!120797 mapRes!7388))))

(declare-fun b!183480 () Bool)

(assert (=> b!183480 (= e!120796 tp_is_empty!4299)))

(declare-fun mapIsEmpty!7388 () Bool)

(assert (=> mapIsEmpty!7388 mapRes!7388))

(declare-fun b!183481 () Bool)

(assert (=> b!183481 (= e!120797 tp_is_empty!4299)))

(assert (= (and mapNonEmpty!7382 condMapEmpty!7388) mapIsEmpty!7388))

(assert (= (and mapNonEmpty!7382 (not condMapEmpty!7388)) mapNonEmpty!7388))

(assert (= (and mapNonEmpty!7388 ((_ is ValueCellFull!1806) mapValue!7388)) b!183480))

(assert (= (and mapNonEmpty!7382 ((_ is ValueCellFull!1806) mapDefault!7388)) b!183481))

(declare-fun m!210967 () Bool)

(assert (=> mapNonEmpty!7388 m!210967))

(declare-fun b_lambda!7193 () Bool)

(assert (= b_lambda!7191 (or (and b!183343 b_free!4527) b_lambda!7193)))

(check-sat (not b!183473) (not b!183434) (not b_next!4527) tp_is_empty!4299 (not bm!18522) (not b!183381) (not d!54705) (not d!54715) (not b!183432) (not b!183379) (not bm!18525) (not d!54713) (not bm!18520) (not b!183441) (not b!183435) (not b!183460) (not b!183429) (not b!183444) (not bm!18523) (not mapNonEmpty!7388) (not b!183471) (not d!54707) (not b!183436) (not b_lambda!7193) b_and!11101 (not b!183426) (not b!183472))
(check-sat b_and!11101 (not b_next!4527))
(get-model)

(declare-fun d!54717 () Bool)

(assert (=> d!54717 (= (validKeyInArray!0 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183435 d!54717))

(declare-fun b!183492 () Bool)

(declare-fun e!120806 () Bool)

(declare-fun e!120808 () Bool)

(assert (=> b!183492 (= e!120806 e!120808)))

(declare-fun res!86848 () Bool)

(assert (=> b!183492 (=> (not res!86848) (not e!120808))))

(declare-fun e!120807 () Bool)

(assert (=> b!183492 (= res!86848 (not e!120807))))

(declare-fun res!86850 () Bool)

(assert (=> b!183492 (=> (not res!86850) (not e!120807))))

(assert (=> b!183492 (= res!86850 (validKeyInArray!0 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183493 () Bool)

(declare-fun contains!1272 (List!2339 (_ BitVec 64)) Bool)

(assert (=> b!183493 (= e!120807 (contains!1272 Nil!2336 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18529 () Bool)

(declare-fun call!18532 () Bool)

(declare-fun c!32880 () Bool)

(assert (=> bm!18529 (= call!18532 (arrayNoDuplicates!0 (_keys!5668 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32880 (Cons!2335 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000) Nil!2336) Nil!2336)))))

(declare-fun b!183494 () Bool)

(declare-fun e!120809 () Bool)

(assert (=> b!183494 (= e!120809 call!18532)))

(declare-fun b!183496 () Bool)

(assert (=> b!183496 (= e!120808 e!120809)))

(assert (=> b!183496 (= c!32880 (validKeyInArray!0 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54719 () Bool)

(declare-fun res!86849 () Bool)

(assert (=> d!54719 (=> res!86849 e!120806)))

(assert (=> d!54719 (= res!86849 (bvsge #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))))))

(assert (=> d!54719 (= (arrayNoDuplicates!0 (_keys!5668 thiss!1248) #b00000000000000000000000000000000 Nil!2336) e!120806)))

(declare-fun b!183495 () Bool)

(assert (=> b!183495 (= e!120809 call!18532)))

(assert (= (and d!54719 (not res!86849)) b!183492))

(assert (= (and b!183492 res!86850) b!183493))

(assert (= (and b!183492 res!86848) b!183496))

(assert (= (and b!183496 c!32880) b!183495))

(assert (= (and b!183496 (not c!32880)) b!183494))

(assert (= (or b!183495 b!183494) bm!18529))

(assert (=> b!183492 m!210887))

(assert (=> b!183492 m!210887))

(assert (=> b!183492 m!210891))

(assert (=> b!183493 m!210887))

(assert (=> b!183493 m!210887))

(declare-fun m!210969 () Bool)

(assert (=> b!183493 m!210969))

(assert (=> bm!18529 m!210887))

(declare-fun m!210971 () Bool)

(assert (=> bm!18529 m!210971))

(assert (=> b!183496 m!210887))

(assert (=> b!183496 m!210887))

(assert (=> b!183496 m!210891))

(assert (=> b!183473 d!54719))

(declare-fun d!54721 () Bool)

(declare-fun e!120810 () Bool)

(assert (=> d!54721 e!120810))

(declare-fun res!86851 () Bool)

(assert (=> d!54721 (=> res!86851 e!120810)))

(declare-fun lt!90714 () Bool)

(assert (=> d!54721 (= res!86851 (not lt!90714))))

(declare-fun lt!90716 () Bool)

(assert (=> d!54721 (= lt!90714 lt!90716)))

(declare-fun lt!90713 () Unit!5548)

(declare-fun e!120811 () Unit!5548)

(assert (=> d!54721 (= lt!90713 e!120811)))

(declare-fun c!32881 () Bool)

(assert (=> d!54721 (= c!32881 lt!90716)))

(assert (=> d!54721 (= lt!90716 (containsKey!220 (toList!1184 lt!90694) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54721 (= (contains!1270 lt!90694 #b0000000000000000000000000000000000000000000000000000000000000000) lt!90714)))

(declare-fun b!183497 () Bool)

(declare-fun lt!90715 () Unit!5548)

(assert (=> b!183497 (= e!120811 lt!90715)))

(assert (=> b!183497 (= lt!90715 (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1184 lt!90694) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183497 (isDefined!169 (getValueByKey!216 (toList!1184 lt!90694) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183498 () Bool)

(declare-fun Unit!5552 () Unit!5548)

(assert (=> b!183498 (= e!120811 Unit!5552)))

(declare-fun b!183499 () Bool)

(assert (=> b!183499 (= e!120810 (isDefined!169 (getValueByKey!216 (toList!1184 lt!90694) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54721 c!32881) b!183497))

(assert (= (and d!54721 (not c!32881)) b!183498))

(assert (= (and d!54721 (not res!86851)) b!183499))

(declare-fun m!210973 () Bool)

(assert (=> d!54721 m!210973))

(declare-fun m!210975 () Bool)

(assert (=> b!183497 m!210975))

(declare-fun m!210977 () Bool)

(assert (=> b!183497 m!210977))

(assert (=> b!183497 m!210977))

(declare-fun m!210979 () Bool)

(assert (=> b!183497 m!210979))

(assert (=> b!183499 m!210977))

(assert (=> b!183499 m!210977))

(assert (=> b!183499 m!210979))

(assert (=> bm!18523 d!54721))

(declare-fun d!54723 () Bool)

(declare-fun e!120814 () Bool)

(assert (=> d!54723 e!120814))

(declare-fun res!86856 () Bool)

(assert (=> d!54723 (=> (not res!86856) (not e!120814))))

(declare-fun lt!90726 () ListLongMap!2337)

(assert (=> d!54723 (= res!86856 (contains!1270 lt!90726 (_1!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248)))))))

(declare-fun lt!90728 () List!2337)

(assert (=> d!54723 (= lt!90726 (ListLongMap!2338 lt!90728))))

(declare-fun lt!90727 () Unit!5548)

(declare-fun lt!90725 () Unit!5548)

(assert (=> d!54723 (= lt!90727 lt!90725)))

(assert (=> d!54723 (= (getValueByKey!216 lt!90728 (_1!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248)))) (Some!221 (_2!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!113 (List!2337 (_ BitVec 64) V!5379) Unit!5548)

(assert (=> d!54723 (= lt!90725 (lemmaContainsTupThenGetReturnValue!113 lt!90728 (_1!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248))) (_2!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248)))))))

(declare-fun insertStrictlySorted!116 (List!2337 (_ BitVec 64) V!5379) List!2337)

(assert (=> d!54723 (= lt!90728 (insertStrictlySorted!116 (toList!1184 call!18526) (_1!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248))) (_2!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248)))))))

(assert (=> d!54723 (= (+!279 call!18526 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248))) lt!90726)))

(declare-fun b!183504 () Bool)

(declare-fun res!86857 () Bool)

(assert (=> b!183504 (=> (not res!86857) (not e!120814))))

(assert (=> b!183504 (= res!86857 (= (getValueByKey!216 (toList!1184 lt!90726) (_1!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248)))) (Some!221 (_2!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248))))))))

(declare-fun b!183505 () Bool)

(declare-fun contains!1273 (List!2337 tuple2!3420) Bool)

(assert (=> b!183505 (= e!120814 (contains!1273 (toList!1184 lt!90726) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248))))))

(assert (= (and d!54723 res!86856) b!183504))

(assert (= (and b!183504 res!86857) b!183505))

(declare-fun m!210981 () Bool)

(assert (=> d!54723 m!210981))

(declare-fun m!210983 () Bool)

(assert (=> d!54723 m!210983))

(declare-fun m!210985 () Bool)

(assert (=> d!54723 m!210985))

(declare-fun m!210987 () Bool)

(assert (=> d!54723 m!210987))

(declare-fun m!210989 () Bool)

(assert (=> b!183504 m!210989))

(declare-fun m!210991 () Bool)

(assert (=> b!183505 m!210991))

(assert (=> b!183426 d!54723))

(declare-fun b!183514 () Bool)

(declare-fun e!120821 () Bool)

(declare-fun call!18535 () Bool)

(assert (=> b!183514 (= e!120821 call!18535)))

(declare-fun b!183516 () Bool)

(declare-fun e!120823 () Bool)

(assert (=> b!183516 (= e!120823 e!120821)))

(declare-fun lt!90736 () (_ BitVec 64))

(assert (=> b!183516 (= lt!90736 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90735 () Unit!5548)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7791 (_ BitVec 64) (_ BitVec 32)) Unit!5548)

(assert (=> b!183516 (= lt!90735 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5668 thiss!1248) lt!90736 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!183516 (arrayContainsKey!0 (_keys!5668 thiss!1248) lt!90736 #b00000000000000000000000000000000)))

(declare-fun lt!90737 () Unit!5548)

(assert (=> b!183516 (= lt!90737 lt!90735)))

(declare-fun res!86863 () Bool)

(assert (=> b!183516 (= res!86863 (= (seekEntryOrOpen!0 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000) (_keys!5668 thiss!1248) (mask!8812 thiss!1248)) (Found!620 #b00000000000000000000000000000000)))))

(assert (=> b!183516 (=> (not res!86863) (not e!120821))))

(declare-fun d!54725 () Bool)

(declare-fun res!86862 () Bool)

(declare-fun e!120822 () Bool)

(assert (=> d!54725 (=> res!86862 e!120822)))

(assert (=> d!54725 (= res!86862 (bvsge #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))))))

(assert (=> d!54725 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5668 thiss!1248) (mask!8812 thiss!1248)) e!120822)))

(declare-fun b!183515 () Bool)

(assert (=> b!183515 (= e!120823 call!18535)))

(declare-fun b!183517 () Bool)

(assert (=> b!183517 (= e!120822 e!120823)))

(declare-fun c!32884 () Bool)

(assert (=> b!183517 (= c!32884 (validKeyInArray!0 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18532 () Bool)

(assert (=> bm!18532 (= call!18535 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5668 thiss!1248) (mask!8812 thiss!1248)))))

(assert (= (and d!54725 (not res!86862)) b!183517))

(assert (= (and b!183517 c!32884) b!183516))

(assert (= (and b!183517 (not c!32884)) b!183515))

(assert (= (and b!183516 res!86863) b!183514))

(assert (= (or b!183514 b!183515) bm!18532))

(assert (=> b!183516 m!210887))

(declare-fun m!210993 () Bool)

(assert (=> b!183516 m!210993))

(declare-fun m!210995 () Bool)

(assert (=> b!183516 m!210995))

(assert (=> b!183516 m!210887))

(declare-fun m!210997 () Bool)

(assert (=> b!183516 m!210997))

(assert (=> b!183517 m!210887))

(assert (=> b!183517 m!210887))

(assert (=> b!183517 m!210891))

(declare-fun m!210999 () Bool)

(assert (=> bm!18532 m!210999))

(assert (=> b!183472 d!54725))

(declare-fun d!54727 () Bool)

(declare-fun e!120824 () Bool)

(assert (=> d!54727 e!120824))

(declare-fun res!86864 () Bool)

(assert (=> d!54727 (=> (not res!86864) (not e!120824))))

(declare-fun lt!90739 () ListLongMap!2337)

(assert (=> d!54727 (= res!86864 (contains!1270 lt!90739 (_1!1721 (tuple2!3421 lt!90700 (minValue!3591 thiss!1248)))))))

(declare-fun lt!90741 () List!2337)

(assert (=> d!54727 (= lt!90739 (ListLongMap!2338 lt!90741))))

(declare-fun lt!90740 () Unit!5548)

(declare-fun lt!90738 () Unit!5548)

(assert (=> d!54727 (= lt!90740 lt!90738)))

(assert (=> d!54727 (= (getValueByKey!216 lt!90741 (_1!1721 (tuple2!3421 lt!90700 (minValue!3591 thiss!1248)))) (Some!221 (_2!1721 (tuple2!3421 lt!90700 (minValue!3591 thiss!1248)))))))

(assert (=> d!54727 (= lt!90738 (lemmaContainsTupThenGetReturnValue!113 lt!90741 (_1!1721 (tuple2!3421 lt!90700 (minValue!3591 thiss!1248))) (_2!1721 (tuple2!3421 lt!90700 (minValue!3591 thiss!1248)))))))

(assert (=> d!54727 (= lt!90741 (insertStrictlySorted!116 (toList!1184 lt!90701) (_1!1721 (tuple2!3421 lt!90700 (minValue!3591 thiss!1248))) (_2!1721 (tuple2!3421 lt!90700 (minValue!3591 thiss!1248)))))))

(assert (=> d!54727 (= (+!279 lt!90701 (tuple2!3421 lt!90700 (minValue!3591 thiss!1248))) lt!90739)))

(declare-fun b!183518 () Bool)

(declare-fun res!86865 () Bool)

(assert (=> b!183518 (=> (not res!86865) (not e!120824))))

(assert (=> b!183518 (= res!86865 (= (getValueByKey!216 (toList!1184 lt!90739) (_1!1721 (tuple2!3421 lt!90700 (minValue!3591 thiss!1248)))) (Some!221 (_2!1721 (tuple2!3421 lt!90700 (minValue!3591 thiss!1248))))))))

(declare-fun b!183519 () Bool)

(assert (=> b!183519 (= e!120824 (contains!1273 (toList!1184 lt!90739) (tuple2!3421 lt!90700 (minValue!3591 thiss!1248))))))

(assert (= (and d!54727 res!86864) b!183518))

(assert (= (and b!183518 res!86865) b!183519))

(declare-fun m!211001 () Bool)

(assert (=> d!54727 m!211001))

(declare-fun m!211003 () Bool)

(assert (=> d!54727 m!211003))

(declare-fun m!211005 () Bool)

(assert (=> d!54727 m!211005))

(declare-fun m!211007 () Bool)

(assert (=> d!54727 m!211007))

(declare-fun m!211009 () Bool)

(assert (=> b!183518 m!211009))

(declare-fun m!211011 () Bool)

(assert (=> b!183519 m!211011))

(assert (=> b!183434 d!54727))

(declare-fun d!54729 () Bool)

(declare-fun get!2109 (Option!222) V!5379)

(assert (=> d!54729 (= (apply!159 (+!279 lt!90701 (tuple2!3421 lt!90700 (minValue!3591 thiss!1248))) lt!90685) (get!2109 (getValueByKey!216 (toList!1184 (+!279 lt!90701 (tuple2!3421 lt!90700 (minValue!3591 thiss!1248)))) lt!90685)))))

(declare-fun bs!7454 () Bool)

(assert (= bs!7454 d!54729))

(declare-fun m!211013 () Bool)

(assert (=> bs!7454 m!211013))

(assert (=> bs!7454 m!211013))

(declare-fun m!211015 () Bool)

(assert (=> bs!7454 m!211015))

(assert (=> b!183434 d!54729))

(declare-fun b!183544 () Bool)

(declare-fun e!120839 () ListLongMap!2337)

(declare-fun call!18538 () ListLongMap!2337)

(assert (=> b!183544 (= e!120839 call!18538)))

(declare-fun b!183545 () Bool)

(declare-fun lt!90756 () Unit!5548)

(declare-fun lt!90761 () Unit!5548)

(assert (=> b!183545 (= lt!90756 lt!90761)))

(declare-fun lt!90757 () V!5379)

(declare-fun lt!90762 () (_ BitVec 64))

(declare-fun lt!90760 () ListLongMap!2337)

(declare-fun lt!90758 () (_ BitVec 64))

(assert (=> b!183545 (not (contains!1270 (+!279 lt!90760 (tuple2!3421 lt!90762 lt!90757)) lt!90758))))

(declare-fun addStillNotContains!85 (ListLongMap!2337 (_ BitVec 64) V!5379 (_ BitVec 64)) Unit!5548)

(assert (=> b!183545 (= lt!90761 (addStillNotContains!85 lt!90760 lt!90762 lt!90757 lt!90758))))

(assert (=> b!183545 (= lt!90758 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!183545 (= lt!90757 (get!2108 (select (arr!3684 (_values!3733 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3750 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183545 (= lt!90762 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183545 (= lt!90760 call!18538)))

(assert (=> b!183545 (= e!120839 (+!279 call!18538 (tuple2!3421 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000) (get!2108 (select (arr!3684 (_values!3733 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3750 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!183546 () Bool)

(declare-fun res!86876 () Bool)

(declare-fun e!120840 () Bool)

(assert (=> b!183546 (=> (not res!86876) (not e!120840))))

(declare-fun lt!90759 () ListLongMap!2337)

(assert (=> b!183546 (= res!86876 (not (contains!1270 lt!90759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183547 () Bool)

(declare-fun e!120844 () Bool)

(declare-fun e!120845 () Bool)

(assert (=> b!183547 (= e!120844 e!120845)))

(declare-fun c!32895 () Bool)

(assert (=> b!183547 (= c!32895 (bvslt #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))))))

(declare-fun b!183548 () Bool)

(declare-fun isEmpty!463 (ListLongMap!2337) Bool)

(assert (=> b!183548 (= e!120845 (isEmpty!463 lt!90759))))

(declare-fun b!183549 () Bool)

(assert (=> b!183549 (= e!120840 e!120844)))

(declare-fun c!32893 () Bool)

(declare-fun e!120841 () Bool)

(assert (=> b!183549 (= c!32893 e!120841)))

(declare-fun res!86877 () Bool)

(assert (=> b!183549 (=> (not res!86877) (not e!120841))))

(assert (=> b!183549 (= res!86877 (bvslt #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))))))

(declare-fun b!183550 () Bool)

(declare-fun e!120843 () ListLongMap!2337)

(assert (=> b!183550 (= e!120843 e!120839)))

(declare-fun c!32894 () Bool)

(assert (=> b!183550 (= c!32894 (validKeyInArray!0 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183551 () Bool)

(assert (=> b!183551 (= e!120843 (ListLongMap!2338 Nil!2334))))

(declare-fun b!183552 () Bool)

(assert (=> b!183552 (= e!120841 (validKeyInArray!0 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183552 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!54731 () Bool)

(assert (=> d!54731 e!120840))

(declare-fun res!86874 () Bool)

(assert (=> d!54731 (=> (not res!86874) (not e!120840))))

(assert (=> d!54731 (= res!86874 (not (contains!1270 lt!90759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54731 (= lt!90759 e!120843)))

(declare-fun c!32896 () Bool)

(assert (=> d!54731 (= c!32896 (bvsge #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))))))

(assert (=> d!54731 (validMask!0 (mask!8812 thiss!1248))))

(assert (=> d!54731 (= (getCurrentListMapNoExtraKeys!192 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)) lt!90759)))

(declare-fun b!183553 () Bool)

(declare-fun e!120842 () Bool)

(assert (=> b!183553 (= e!120844 e!120842)))

(assert (=> b!183553 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))))))

(declare-fun res!86875 () Bool)

(assert (=> b!183553 (= res!86875 (contains!1270 lt!90759 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183553 (=> (not res!86875) (not e!120842))))

(declare-fun b!183554 () Bool)

(assert (=> b!183554 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))))))

(assert (=> b!183554 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3996 (_values!3733 thiss!1248))))))

(assert (=> b!183554 (= e!120842 (= (apply!159 lt!90759 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)) (get!2108 (select (arr!3684 (_values!3733 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3750 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!183555 () Bool)

(assert (=> b!183555 (= e!120845 (= lt!90759 (getCurrentListMapNoExtraKeys!192 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3750 thiss!1248))))))

(declare-fun bm!18535 () Bool)

(assert (=> bm!18535 (= call!18538 (getCurrentListMapNoExtraKeys!192 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3750 thiss!1248)))))

(assert (= (and d!54731 c!32896) b!183551))

(assert (= (and d!54731 (not c!32896)) b!183550))

(assert (= (and b!183550 c!32894) b!183545))

(assert (= (and b!183550 (not c!32894)) b!183544))

(assert (= (or b!183545 b!183544) bm!18535))

(assert (= (and d!54731 res!86874) b!183546))

(assert (= (and b!183546 res!86876) b!183549))

(assert (= (and b!183549 res!86877) b!183552))

(assert (= (and b!183549 c!32893) b!183553))

(assert (= (and b!183549 (not c!32893)) b!183547))

(assert (= (and b!183553 res!86875) b!183554))

(assert (= (and b!183547 c!32895) b!183555))

(assert (= (and b!183547 (not c!32895)) b!183548))

(declare-fun b_lambda!7195 () Bool)

(assert (=> (not b_lambda!7195) (not b!183545)))

(assert (=> b!183545 t!7208))

(declare-fun b_and!11103 () Bool)

(assert (= b_and!11101 (and (=> t!7208 result!4765) b_and!11103)))

(declare-fun b_lambda!7197 () Bool)

(assert (=> (not b_lambda!7197) (not b!183554)))

(assert (=> b!183554 t!7208))

(declare-fun b_and!11105 () Bool)

(assert (= b_and!11103 (and (=> t!7208 result!4765) b_and!11105)))

(declare-fun m!211017 () Bool)

(assert (=> bm!18535 m!211017))

(assert (=> b!183555 m!211017))

(declare-fun m!211019 () Bool)

(assert (=> d!54731 m!211019))

(assert (=> d!54731 m!210849))

(assert (=> b!183553 m!210887))

(assert (=> b!183553 m!210887))

(declare-fun m!211021 () Bool)

(assert (=> b!183553 m!211021))

(declare-fun m!211023 () Bool)

(assert (=> b!183545 m!211023))

(declare-fun m!211025 () Bool)

(assert (=> b!183545 m!211025))

(assert (=> b!183545 m!210887))

(assert (=> b!183545 m!210901))

(assert (=> b!183545 m!210897))

(assert (=> b!183545 m!210903))

(declare-fun m!211027 () Bool)

(assert (=> b!183545 m!211027))

(assert (=> b!183545 m!210897))

(assert (=> b!183545 m!210901))

(assert (=> b!183545 m!211023))

(declare-fun m!211029 () Bool)

(assert (=> b!183545 m!211029))

(assert (=> b!183552 m!210887))

(assert (=> b!183552 m!210887))

(assert (=> b!183552 m!210891))

(assert (=> b!183554 m!210887))

(declare-fun m!211031 () Bool)

(assert (=> b!183554 m!211031))

(assert (=> b!183554 m!210887))

(assert (=> b!183554 m!210901))

(assert (=> b!183554 m!210897))

(assert (=> b!183554 m!210903))

(assert (=> b!183554 m!210897))

(assert (=> b!183554 m!210901))

(declare-fun m!211033 () Bool)

(assert (=> b!183548 m!211033))

(declare-fun m!211035 () Bool)

(assert (=> b!183546 m!211035))

(assert (=> b!183550 m!210887))

(assert (=> b!183550 m!210887))

(assert (=> b!183550 m!210891))

(assert (=> b!183434 d!54731))

(declare-fun d!54733 () Bool)

(assert (=> d!54733 (= (apply!159 lt!90687 lt!90682) (get!2109 (getValueByKey!216 (toList!1184 lt!90687) lt!90682)))))

(declare-fun bs!7455 () Bool)

(assert (= bs!7455 d!54733))

(declare-fun m!211037 () Bool)

(assert (=> bs!7455 m!211037))

(assert (=> bs!7455 m!211037))

(declare-fun m!211039 () Bool)

(assert (=> bs!7455 m!211039))

(assert (=> b!183434 d!54733))

(declare-fun d!54735 () Bool)

(assert (=> d!54735 (= (apply!159 (+!279 lt!90701 (tuple2!3421 lt!90700 (minValue!3591 thiss!1248))) lt!90685) (apply!159 lt!90701 lt!90685))))

(declare-fun lt!90765 () Unit!5548)

(declare-fun choose!970 (ListLongMap!2337 (_ BitVec 64) V!5379 (_ BitVec 64)) Unit!5548)

(assert (=> d!54735 (= lt!90765 (choose!970 lt!90701 lt!90700 (minValue!3591 thiss!1248) lt!90685))))

(declare-fun e!120848 () Bool)

(assert (=> d!54735 e!120848))

(declare-fun res!86880 () Bool)

(assert (=> d!54735 (=> (not res!86880) (not e!120848))))

(assert (=> d!54735 (= res!86880 (contains!1270 lt!90701 lt!90685))))

(assert (=> d!54735 (= (addApplyDifferent!135 lt!90701 lt!90700 (minValue!3591 thiss!1248) lt!90685) lt!90765)))

(declare-fun b!183559 () Bool)

(assert (=> b!183559 (= e!120848 (not (= lt!90685 lt!90700)))))

(assert (= (and d!54735 res!86880) b!183559))

(declare-fun m!211041 () Bool)

(assert (=> d!54735 m!211041))

(assert (=> d!54735 m!210925))

(assert (=> d!54735 m!210933))

(assert (=> d!54735 m!210925))

(assert (=> d!54735 m!210917))

(declare-fun m!211043 () Bool)

(assert (=> d!54735 m!211043))

(assert (=> b!183434 d!54735))

(declare-fun d!54737 () Bool)

(declare-fun e!120849 () Bool)

(assert (=> d!54737 e!120849))

(declare-fun res!86881 () Bool)

(assert (=> d!54737 (=> (not res!86881) (not e!120849))))

(declare-fun lt!90767 () ListLongMap!2337)

(assert (=> d!54737 (= res!86881 (contains!1270 lt!90767 (_1!1721 (tuple2!3421 lt!90698 (zeroValue!3591 thiss!1248)))))))

(declare-fun lt!90769 () List!2337)

(assert (=> d!54737 (= lt!90767 (ListLongMap!2338 lt!90769))))

(declare-fun lt!90768 () Unit!5548)

(declare-fun lt!90766 () Unit!5548)

(assert (=> d!54737 (= lt!90768 lt!90766)))

(assert (=> d!54737 (= (getValueByKey!216 lt!90769 (_1!1721 (tuple2!3421 lt!90698 (zeroValue!3591 thiss!1248)))) (Some!221 (_2!1721 (tuple2!3421 lt!90698 (zeroValue!3591 thiss!1248)))))))

(assert (=> d!54737 (= lt!90766 (lemmaContainsTupThenGetReturnValue!113 lt!90769 (_1!1721 (tuple2!3421 lt!90698 (zeroValue!3591 thiss!1248))) (_2!1721 (tuple2!3421 lt!90698 (zeroValue!3591 thiss!1248)))))))

(assert (=> d!54737 (= lt!90769 (insertStrictlySorted!116 (toList!1184 lt!90692) (_1!1721 (tuple2!3421 lt!90698 (zeroValue!3591 thiss!1248))) (_2!1721 (tuple2!3421 lt!90698 (zeroValue!3591 thiss!1248)))))))

(assert (=> d!54737 (= (+!279 lt!90692 (tuple2!3421 lt!90698 (zeroValue!3591 thiss!1248))) lt!90767)))

(declare-fun b!183560 () Bool)

(declare-fun res!86882 () Bool)

(assert (=> b!183560 (=> (not res!86882) (not e!120849))))

(assert (=> b!183560 (= res!86882 (= (getValueByKey!216 (toList!1184 lt!90767) (_1!1721 (tuple2!3421 lt!90698 (zeroValue!3591 thiss!1248)))) (Some!221 (_2!1721 (tuple2!3421 lt!90698 (zeroValue!3591 thiss!1248))))))))

(declare-fun b!183561 () Bool)

(assert (=> b!183561 (= e!120849 (contains!1273 (toList!1184 lt!90767) (tuple2!3421 lt!90698 (zeroValue!3591 thiss!1248))))))

(assert (= (and d!54737 res!86881) b!183560))

(assert (= (and b!183560 res!86882) b!183561))

(declare-fun m!211045 () Bool)

(assert (=> d!54737 m!211045))

(declare-fun m!211047 () Bool)

(assert (=> d!54737 m!211047))

(declare-fun m!211049 () Bool)

(assert (=> d!54737 m!211049))

(declare-fun m!211051 () Bool)

(assert (=> d!54737 m!211051))

(declare-fun m!211053 () Bool)

(assert (=> b!183560 m!211053))

(declare-fun m!211055 () Bool)

(assert (=> b!183561 m!211055))

(assert (=> b!183434 d!54737))

(declare-fun d!54739 () Bool)

(declare-fun e!120850 () Bool)

(assert (=> d!54739 e!120850))

(declare-fun res!86883 () Bool)

(assert (=> d!54739 (=> (not res!86883) (not e!120850))))

(declare-fun lt!90771 () ListLongMap!2337)

(assert (=> d!54739 (= res!86883 (contains!1270 lt!90771 (_1!1721 (tuple2!3421 lt!90693 (minValue!3591 thiss!1248)))))))

(declare-fun lt!90773 () List!2337)

(assert (=> d!54739 (= lt!90771 (ListLongMap!2338 lt!90773))))

(declare-fun lt!90772 () Unit!5548)

(declare-fun lt!90770 () Unit!5548)

(assert (=> d!54739 (= lt!90772 lt!90770)))

(assert (=> d!54739 (= (getValueByKey!216 lt!90773 (_1!1721 (tuple2!3421 lt!90693 (minValue!3591 thiss!1248)))) (Some!221 (_2!1721 (tuple2!3421 lt!90693 (minValue!3591 thiss!1248)))))))

(assert (=> d!54739 (= lt!90770 (lemmaContainsTupThenGetReturnValue!113 lt!90773 (_1!1721 (tuple2!3421 lt!90693 (minValue!3591 thiss!1248))) (_2!1721 (tuple2!3421 lt!90693 (minValue!3591 thiss!1248)))))))

(assert (=> d!54739 (= lt!90773 (insertStrictlySorted!116 (toList!1184 lt!90687) (_1!1721 (tuple2!3421 lt!90693 (minValue!3591 thiss!1248))) (_2!1721 (tuple2!3421 lt!90693 (minValue!3591 thiss!1248)))))))

(assert (=> d!54739 (= (+!279 lt!90687 (tuple2!3421 lt!90693 (minValue!3591 thiss!1248))) lt!90771)))

(declare-fun b!183562 () Bool)

(declare-fun res!86884 () Bool)

(assert (=> b!183562 (=> (not res!86884) (not e!120850))))

(assert (=> b!183562 (= res!86884 (= (getValueByKey!216 (toList!1184 lt!90771) (_1!1721 (tuple2!3421 lt!90693 (minValue!3591 thiss!1248)))) (Some!221 (_2!1721 (tuple2!3421 lt!90693 (minValue!3591 thiss!1248))))))))

(declare-fun b!183563 () Bool)

(assert (=> b!183563 (= e!120850 (contains!1273 (toList!1184 lt!90771) (tuple2!3421 lt!90693 (minValue!3591 thiss!1248))))))

(assert (= (and d!54739 res!86883) b!183562))

(assert (= (and b!183562 res!86884) b!183563))

(declare-fun m!211057 () Bool)

(assert (=> d!54739 m!211057))

(declare-fun m!211059 () Bool)

(assert (=> d!54739 m!211059))

(declare-fun m!211061 () Bool)

(assert (=> d!54739 m!211061))

(declare-fun m!211063 () Bool)

(assert (=> d!54739 m!211063))

(declare-fun m!211065 () Bool)

(assert (=> b!183562 m!211065))

(declare-fun m!211067 () Bool)

(assert (=> b!183563 m!211067))

(assert (=> b!183434 d!54739))

(declare-fun d!54741 () Bool)

(assert (=> d!54741 (= (apply!159 (+!279 lt!90692 (tuple2!3421 lt!90698 (zeroValue!3591 thiss!1248))) lt!90699) (get!2109 (getValueByKey!216 (toList!1184 (+!279 lt!90692 (tuple2!3421 lt!90698 (zeroValue!3591 thiss!1248)))) lt!90699)))))

(declare-fun bs!7456 () Bool)

(assert (= bs!7456 d!54741))

(declare-fun m!211069 () Bool)

(assert (=> bs!7456 m!211069))

(assert (=> bs!7456 m!211069))

(declare-fun m!211071 () Bool)

(assert (=> bs!7456 m!211071))

(assert (=> b!183434 d!54741))

(declare-fun d!54743 () Bool)

(assert (=> d!54743 (contains!1270 (+!279 lt!90686 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248))) lt!90691)))

(declare-fun lt!90776 () Unit!5548)

(declare-fun choose!971 (ListLongMap!2337 (_ BitVec 64) V!5379 (_ BitVec 64)) Unit!5548)

(assert (=> d!54743 (= lt!90776 (choose!971 lt!90686 lt!90696 (zeroValue!3591 thiss!1248) lt!90691))))

(assert (=> d!54743 (contains!1270 lt!90686 lt!90691)))

(assert (=> d!54743 (= (addStillContains!135 lt!90686 lt!90696 (zeroValue!3591 thiss!1248) lt!90691) lt!90776)))

(declare-fun bs!7457 () Bool)

(assert (= bs!7457 d!54743))

(assert (=> bs!7457 m!210921))

(assert (=> bs!7457 m!210921))

(assert (=> bs!7457 m!210923))

(declare-fun m!211073 () Bool)

(assert (=> bs!7457 m!211073))

(declare-fun m!211075 () Bool)

(assert (=> bs!7457 m!211075))

(assert (=> b!183434 d!54743))

(declare-fun d!54745 () Bool)

(assert (=> d!54745 (= (apply!159 lt!90692 lt!90699) (get!2109 (getValueByKey!216 (toList!1184 lt!90692) lt!90699)))))

(declare-fun bs!7458 () Bool)

(assert (= bs!7458 d!54745))

(declare-fun m!211077 () Bool)

(assert (=> bs!7458 m!211077))

(assert (=> bs!7458 m!211077))

(declare-fun m!211079 () Bool)

(assert (=> bs!7458 m!211079))

(assert (=> b!183434 d!54745))

(declare-fun d!54747 () Bool)

(assert (=> d!54747 (= (apply!159 lt!90701 lt!90685) (get!2109 (getValueByKey!216 (toList!1184 lt!90701) lt!90685)))))

(declare-fun bs!7459 () Bool)

(assert (= bs!7459 d!54747))

(declare-fun m!211081 () Bool)

(assert (=> bs!7459 m!211081))

(assert (=> bs!7459 m!211081))

(declare-fun m!211083 () Bool)

(assert (=> bs!7459 m!211083))

(assert (=> b!183434 d!54747))

(declare-fun d!54749 () Bool)

(assert (=> d!54749 (= (apply!159 (+!279 lt!90687 (tuple2!3421 lt!90693 (minValue!3591 thiss!1248))) lt!90682) (apply!159 lt!90687 lt!90682))))

(declare-fun lt!90777 () Unit!5548)

(assert (=> d!54749 (= lt!90777 (choose!970 lt!90687 lt!90693 (minValue!3591 thiss!1248) lt!90682))))

(declare-fun e!120851 () Bool)

(assert (=> d!54749 e!120851))

(declare-fun res!86885 () Bool)

(assert (=> d!54749 (=> (not res!86885) (not e!120851))))

(assert (=> d!54749 (= res!86885 (contains!1270 lt!90687 lt!90682))))

(assert (=> d!54749 (= (addApplyDifferent!135 lt!90687 lt!90693 (minValue!3591 thiss!1248) lt!90682) lt!90777)))

(declare-fun b!183565 () Bool)

(assert (=> b!183565 (= e!120851 (not (= lt!90682 lt!90693)))))

(assert (= (and d!54749 res!86885) b!183565))

(declare-fun m!211085 () Bool)

(assert (=> d!54749 m!211085))

(assert (=> d!54749 m!210909))

(assert (=> d!54749 m!210911))

(assert (=> d!54749 m!210909))

(assert (=> d!54749 m!210937))

(declare-fun m!211087 () Bool)

(assert (=> d!54749 m!211087))

(assert (=> b!183434 d!54749))

(declare-fun d!54751 () Bool)

(declare-fun e!120852 () Bool)

(assert (=> d!54751 e!120852))

(declare-fun res!86886 () Bool)

(assert (=> d!54751 (=> (not res!86886) (not e!120852))))

(declare-fun lt!90779 () ListLongMap!2337)

(assert (=> d!54751 (= res!86886 (contains!1270 lt!90779 (_1!1721 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248)))))))

(declare-fun lt!90781 () List!2337)

(assert (=> d!54751 (= lt!90779 (ListLongMap!2338 lt!90781))))

(declare-fun lt!90780 () Unit!5548)

(declare-fun lt!90778 () Unit!5548)

(assert (=> d!54751 (= lt!90780 lt!90778)))

(assert (=> d!54751 (= (getValueByKey!216 lt!90781 (_1!1721 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248)))) (Some!221 (_2!1721 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248)))))))

(assert (=> d!54751 (= lt!90778 (lemmaContainsTupThenGetReturnValue!113 lt!90781 (_1!1721 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248))) (_2!1721 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248)))))))

(assert (=> d!54751 (= lt!90781 (insertStrictlySorted!116 (toList!1184 lt!90686) (_1!1721 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248))) (_2!1721 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248)))))))

(assert (=> d!54751 (= (+!279 lt!90686 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248))) lt!90779)))

(declare-fun b!183566 () Bool)

(declare-fun res!86887 () Bool)

(assert (=> b!183566 (=> (not res!86887) (not e!120852))))

(assert (=> b!183566 (= res!86887 (= (getValueByKey!216 (toList!1184 lt!90779) (_1!1721 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248)))) (Some!221 (_2!1721 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248))))))))

(declare-fun b!183567 () Bool)

(assert (=> b!183567 (= e!120852 (contains!1273 (toList!1184 lt!90779) (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248))))))

(assert (= (and d!54751 res!86886) b!183566))

(assert (= (and b!183566 res!86887) b!183567))

(declare-fun m!211089 () Bool)

(assert (=> d!54751 m!211089))

(declare-fun m!211091 () Bool)

(assert (=> d!54751 m!211091))

(declare-fun m!211093 () Bool)

(assert (=> d!54751 m!211093))

(declare-fun m!211095 () Bool)

(assert (=> d!54751 m!211095))

(declare-fun m!211097 () Bool)

(assert (=> b!183566 m!211097))

(declare-fun m!211099 () Bool)

(assert (=> b!183567 m!211099))

(assert (=> b!183434 d!54751))

(declare-fun d!54753 () Bool)

(declare-fun e!120853 () Bool)

(assert (=> d!54753 e!120853))

(declare-fun res!86888 () Bool)

(assert (=> d!54753 (=> res!86888 e!120853)))

(declare-fun lt!90783 () Bool)

(assert (=> d!54753 (= res!86888 (not lt!90783))))

(declare-fun lt!90785 () Bool)

(assert (=> d!54753 (= lt!90783 lt!90785)))

(declare-fun lt!90782 () Unit!5548)

(declare-fun e!120854 () Unit!5548)

(assert (=> d!54753 (= lt!90782 e!120854)))

(declare-fun c!32897 () Bool)

(assert (=> d!54753 (= c!32897 lt!90785)))

(assert (=> d!54753 (= lt!90785 (containsKey!220 (toList!1184 (+!279 lt!90686 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248)))) lt!90691))))

(assert (=> d!54753 (= (contains!1270 (+!279 lt!90686 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248))) lt!90691) lt!90783)))

(declare-fun b!183568 () Bool)

(declare-fun lt!90784 () Unit!5548)

(assert (=> b!183568 (= e!120854 lt!90784)))

(assert (=> b!183568 (= lt!90784 (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1184 (+!279 lt!90686 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248)))) lt!90691))))

(assert (=> b!183568 (isDefined!169 (getValueByKey!216 (toList!1184 (+!279 lt!90686 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248)))) lt!90691))))

(declare-fun b!183569 () Bool)

(declare-fun Unit!5553 () Unit!5548)

(assert (=> b!183569 (= e!120854 Unit!5553)))

(declare-fun b!183570 () Bool)

(assert (=> b!183570 (= e!120853 (isDefined!169 (getValueByKey!216 (toList!1184 (+!279 lt!90686 (tuple2!3421 lt!90696 (zeroValue!3591 thiss!1248)))) lt!90691)))))

(assert (= (and d!54753 c!32897) b!183568))

(assert (= (and d!54753 (not c!32897)) b!183569))

(assert (= (and d!54753 (not res!86888)) b!183570))

(declare-fun m!211101 () Bool)

(assert (=> d!54753 m!211101))

(declare-fun m!211103 () Bool)

(assert (=> b!183568 m!211103))

(declare-fun m!211105 () Bool)

(assert (=> b!183568 m!211105))

(assert (=> b!183568 m!211105))

(declare-fun m!211107 () Bool)

(assert (=> b!183568 m!211107))

(assert (=> b!183570 m!211105))

(assert (=> b!183570 m!211105))

(assert (=> b!183570 m!211107))

(assert (=> b!183434 d!54753))

(declare-fun d!54755 () Bool)

(assert (=> d!54755 (= (apply!159 (+!279 lt!90687 (tuple2!3421 lt!90693 (minValue!3591 thiss!1248))) lt!90682) (get!2109 (getValueByKey!216 (toList!1184 (+!279 lt!90687 (tuple2!3421 lt!90693 (minValue!3591 thiss!1248)))) lt!90682)))))

(declare-fun bs!7460 () Bool)

(assert (= bs!7460 d!54755))

(declare-fun m!211109 () Bool)

(assert (=> bs!7460 m!211109))

(assert (=> bs!7460 m!211109))

(declare-fun m!211111 () Bool)

(assert (=> bs!7460 m!211111))

(assert (=> b!183434 d!54755))

(declare-fun d!54757 () Bool)

(assert (=> d!54757 (= (apply!159 (+!279 lt!90692 (tuple2!3421 lt!90698 (zeroValue!3591 thiss!1248))) lt!90699) (apply!159 lt!90692 lt!90699))))

(declare-fun lt!90786 () Unit!5548)

(assert (=> d!54757 (= lt!90786 (choose!970 lt!90692 lt!90698 (zeroValue!3591 thiss!1248) lt!90699))))

(declare-fun e!120855 () Bool)

(assert (=> d!54757 e!120855))

(declare-fun res!86889 () Bool)

(assert (=> d!54757 (=> (not res!86889) (not e!120855))))

(assert (=> d!54757 (= res!86889 (contains!1270 lt!90692 lt!90699))))

(assert (=> d!54757 (= (addApplyDifferent!135 lt!90692 lt!90698 (zeroValue!3591 thiss!1248) lt!90699) lt!90786)))

(declare-fun b!183571 () Bool)

(assert (=> b!183571 (= e!120855 (not (= lt!90699 lt!90698)))))

(assert (= (and d!54757 res!86889) b!183571))

(declare-fun m!211113 () Bool)

(assert (=> d!54757 m!211113))

(assert (=> d!54757 m!210915))

(assert (=> d!54757 m!210931))

(assert (=> d!54757 m!210915))

(assert (=> d!54757 m!210919))

(declare-fun m!211115 () Bool)

(assert (=> d!54757 m!211115))

(assert (=> b!183434 d!54757))

(declare-fun d!54759 () Bool)

(declare-fun lt!90791 () SeekEntryResult!620)

(assert (=> d!54759 (and (or ((_ is Undefined!620) lt!90791) (not ((_ is Found!620) lt!90791)) (and (bvsge (index!4651 lt!90791) #b00000000000000000000000000000000) (bvslt (index!4651 lt!90791) (size!3995 (_keys!5668 thiss!1248))))) (or ((_ is Undefined!620) lt!90791) ((_ is Found!620) lt!90791) (not ((_ is MissingVacant!620) lt!90791)) (not (= (index!4653 lt!90791) (index!4652 lt!90711))) (and (bvsge (index!4653 lt!90791) #b00000000000000000000000000000000) (bvslt (index!4653 lt!90791) (size!3995 (_keys!5668 thiss!1248))))) (or ((_ is Undefined!620) lt!90791) (ite ((_ is Found!620) lt!90791) (= (select (arr!3683 (_keys!5668 thiss!1248)) (index!4651 lt!90791)) key!828) (and ((_ is MissingVacant!620) lt!90791) (= (index!4653 lt!90791) (index!4652 lt!90711)) (= (select (arr!3683 (_keys!5668 thiss!1248)) (index!4653 lt!90791)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!120862 () SeekEntryResult!620)

(assert (=> d!54759 (= lt!90791 e!120862)))

(declare-fun c!32904 () Bool)

(assert (=> d!54759 (= c!32904 (bvsge (x!19974 lt!90711) #b01111111111111111111111111111110))))

(declare-fun lt!90792 () (_ BitVec 64))

(assert (=> d!54759 (= lt!90792 (select (arr!3683 (_keys!5668 thiss!1248)) (index!4652 lt!90711)))))

(assert (=> d!54759 (validMask!0 (mask!8812 thiss!1248))))

(assert (=> d!54759 (= (seekKeyOrZeroReturnVacant!0 (x!19974 lt!90711) (index!4652 lt!90711) (index!4652 lt!90711) key!828 (_keys!5668 thiss!1248) (mask!8812 thiss!1248)) lt!90791)))

(declare-fun b!183584 () Bool)

(declare-fun c!32906 () Bool)

(assert (=> b!183584 (= c!32906 (= lt!90792 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!120863 () SeekEntryResult!620)

(declare-fun e!120864 () SeekEntryResult!620)

(assert (=> b!183584 (= e!120863 e!120864)))

(declare-fun b!183585 () Bool)

(assert (=> b!183585 (= e!120863 (Found!620 (index!4652 lt!90711)))))

(declare-fun b!183586 () Bool)

(assert (=> b!183586 (= e!120864 (MissingVacant!620 (index!4652 lt!90711)))))

(declare-fun b!183587 () Bool)

(assert (=> b!183587 (= e!120862 e!120863)))

(declare-fun c!32905 () Bool)

(assert (=> b!183587 (= c!32905 (= lt!90792 key!828))))

(declare-fun b!183588 () Bool)

(assert (=> b!183588 (= e!120862 Undefined!620)))

(declare-fun b!183589 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183589 (= e!120864 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19974 lt!90711) #b00000000000000000000000000000001) (nextIndex!0 (index!4652 lt!90711) (x!19974 lt!90711) (mask!8812 thiss!1248)) (index!4652 lt!90711) key!828 (_keys!5668 thiss!1248) (mask!8812 thiss!1248)))))

(assert (= (and d!54759 c!32904) b!183588))

(assert (= (and d!54759 (not c!32904)) b!183587))

(assert (= (and b!183587 c!32905) b!183585))

(assert (= (and b!183587 (not c!32905)) b!183584))

(assert (= (and b!183584 c!32906) b!183586))

(assert (= (and b!183584 (not c!32906)) b!183589))

(declare-fun m!211117 () Bool)

(assert (=> d!54759 m!211117))

(declare-fun m!211119 () Bool)

(assert (=> d!54759 m!211119))

(assert (=> d!54759 m!210947))

(assert (=> d!54759 m!210849))

(declare-fun m!211121 () Bool)

(assert (=> b!183589 m!211121))

(assert (=> b!183589 m!211121))

(declare-fun m!211123 () Bool)

(assert (=> b!183589 m!211123))

(assert (=> b!183460 d!54759))

(assert (=> bm!18520 d!54731))

(declare-fun d!54761 () Bool)

(declare-fun e!120865 () Bool)

(assert (=> d!54761 e!120865))

(declare-fun res!86890 () Bool)

(assert (=> d!54761 (=> res!86890 e!120865)))

(declare-fun lt!90794 () Bool)

(assert (=> d!54761 (= res!86890 (not lt!90794))))

(declare-fun lt!90796 () Bool)

(assert (=> d!54761 (= lt!90794 lt!90796)))

(declare-fun lt!90793 () Unit!5548)

(declare-fun e!120866 () Unit!5548)

(assert (=> d!54761 (= lt!90793 e!120866)))

(declare-fun c!32907 () Bool)

(assert (=> d!54761 (= c!32907 lt!90796)))

(assert (=> d!54761 (= lt!90796 (containsKey!220 (toList!1184 lt!90694) (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54761 (= (contains!1270 lt!90694 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)) lt!90794)))

(declare-fun b!183590 () Bool)

(declare-fun lt!90795 () Unit!5548)

(assert (=> b!183590 (= e!120866 lt!90795)))

(assert (=> b!183590 (= lt!90795 (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1184 lt!90694) (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183590 (isDefined!169 (getValueByKey!216 (toList!1184 lt!90694) (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183591 () Bool)

(declare-fun Unit!5554 () Unit!5548)

(assert (=> b!183591 (= e!120866 Unit!5554)))

(declare-fun b!183592 () Bool)

(assert (=> b!183592 (= e!120865 (isDefined!169 (getValueByKey!216 (toList!1184 lt!90694) (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54761 c!32907) b!183590))

(assert (= (and d!54761 (not c!32907)) b!183591))

(assert (= (and d!54761 (not res!86890)) b!183592))

(assert (=> d!54761 m!210887))

(declare-fun m!211125 () Bool)

(assert (=> d!54761 m!211125))

(assert (=> b!183590 m!210887))

(declare-fun m!211127 () Bool)

(assert (=> b!183590 m!211127))

(assert (=> b!183590 m!210887))

(declare-fun m!211129 () Bool)

(assert (=> b!183590 m!211129))

(assert (=> b!183590 m!211129))

(declare-fun m!211131 () Bool)

(assert (=> b!183590 m!211131))

(assert (=> b!183592 m!210887))

(assert (=> b!183592 m!211129))

(assert (=> b!183592 m!211129))

(assert (=> b!183592 m!211131))

(assert (=> b!183441 d!54761))

(declare-fun b!183601 () Bool)

(declare-fun e!120872 () (_ BitVec 32))

(assert (=> b!183601 (= e!120872 #b00000000000000000000000000000000)))

(declare-fun d!54763 () Bool)

(declare-fun lt!90799 () (_ BitVec 32))

(assert (=> d!54763 (and (bvsge lt!90799 #b00000000000000000000000000000000) (bvsle lt!90799 (bvsub (size!3995 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54763 (= lt!90799 e!120872)))

(declare-fun c!32912 () Bool)

(assert (=> d!54763 (= c!32912 (bvsge #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))))))

(assert (=> d!54763 (and (bvsle #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3995 (_keys!5668 thiss!1248)) (size!3995 (_keys!5668 thiss!1248))))))

(assert (=> d!54763 (= (arrayCountValidKeys!0 (_keys!5668 thiss!1248) #b00000000000000000000000000000000 (size!3995 (_keys!5668 thiss!1248))) lt!90799)))

(declare-fun bm!18538 () Bool)

(declare-fun call!18541 () (_ BitVec 32))

(assert (=> bm!18538 (= call!18541 (arrayCountValidKeys!0 (_keys!5668 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3995 (_keys!5668 thiss!1248))))))

(declare-fun b!183602 () Bool)

(declare-fun e!120871 () (_ BitVec 32))

(assert (=> b!183602 (= e!120871 (bvadd #b00000000000000000000000000000001 call!18541))))

(declare-fun b!183603 () Bool)

(assert (=> b!183603 (= e!120872 e!120871)))

(declare-fun c!32913 () Bool)

(assert (=> b!183603 (= c!32913 (validKeyInArray!0 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183604 () Bool)

(assert (=> b!183604 (= e!120871 call!18541)))

(assert (= (and d!54763 c!32912) b!183601))

(assert (= (and d!54763 (not c!32912)) b!183603))

(assert (= (and b!183603 c!32913) b!183602))

(assert (= (and b!183603 (not c!32913)) b!183604))

(assert (= (or b!183602 b!183604) bm!18538))

(declare-fun m!211133 () Bool)

(assert (=> bm!18538 m!211133))

(assert (=> b!183603 m!210887))

(assert (=> b!183603 m!210887))

(assert (=> b!183603 m!210891))

(assert (=> b!183471 d!54763))

(declare-fun b!183616 () Bool)

(declare-fun e!120875 () Bool)

(assert (=> b!183616 (= e!120875 (and (bvsge (extraKeys!3487 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3487 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1309 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!183613 () Bool)

(declare-fun res!86901 () Bool)

(assert (=> b!183613 (=> (not res!86901) (not e!120875))))

(assert (=> b!183613 (= res!86901 (and (= (size!3996 (_values!3733 thiss!1248)) (bvadd (mask!8812 thiss!1248) #b00000000000000000000000000000001)) (= (size!3995 (_keys!5668 thiss!1248)) (size!3996 (_values!3733 thiss!1248))) (bvsge (_size!1309 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1309 thiss!1248) (bvadd (mask!8812 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!54765 () Bool)

(declare-fun res!86902 () Bool)

(assert (=> d!54765 (=> (not res!86902) (not e!120875))))

(assert (=> d!54765 (= res!86902 (validMask!0 (mask!8812 thiss!1248)))))

(assert (=> d!54765 (= (simpleValid!175 thiss!1248) e!120875)))

(declare-fun b!183614 () Bool)

(declare-fun res!86899 () Bool)

(assert (=> b!183614 (=> (not res!86899) (not e!120875))))

(declare-fun size!3999 (LongMapFixedSize!2520) (_ BitVec 32))

(assert (=> b!183614 (= res!86899 (bvsge (size!3999 thiss!1248) (_size!1309 thiss!1248)))))

(declare-fun b!183615 () Bool)

(declare-fun res!86900 () Bool)

(assert (=> b!183615 (=> (not res!86900) (not e!120875))))

(assert (=> b!183615 (= res!86900 (= (size!3999 thiss!1248) (bvadd (_size!1309 thiss!1248) (bvsdiv (bvadd (extraKeys!3487 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!54765 res!86902) b!183613))

(assert (= (and b!183613 res!86901) b!183614))

(assert (= (and b!183614 res!86899) b!183615))

(assert (= (and b!183615 res!86900) b!183616))

(assert (=> d!54765 m!210849))

(declare-fun m!211135 () Bool)

(assert (=> b!183614 m!211135))

(assert (=> b!183615 m!211135))

(assert (=> d!54715 d!54765))

(declare-fun d!54767 () Bool)

(assert (=> d!54767 (= (apply!159 lt!90694 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2109 (getValueByKey!216 (toList!1184 lt!90694) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7461 () Bool)

(assert (= bs!7461 d!54767))

(declare-fun m!211137 () Bool)

(assert (=> bs!7461 m!211137))

(assert (=> bs!7461 m!211137))

(declare-fun m!211139 () Bool)

(assert (=> bs!7461 m!211139))

(assert (=> b!183432 d!54767))

(declare-fun d!54769 () Bool)

(declare-fun e!120876 () Bool)

(assert (=> d!54769 e!120876))

(declare-fun res!86903 () Bool)

(assert (=> d!54769 (=> res!86903 e!120876)))

(declare-fun lt!90801 () Bool)

(assert (=> d!54769 (= res!86903 (not lt!90801))))

(declare-fun lt!90803 () Bool)

(assert (=> d!54769 (= lt!90801 lt!90803)))

(declare-fun lt!90800 () Unit!5548)

(declare-fun e!120877 () Unit!5548)

(assert (=> d!54769 (= lt!90800 e!120877)))

(declare-fun c!32914 () Bool)

(assert (=> d!54769 (= c!32914 lt!90803)))

(assert (=> d!54769 (= lt!90803 (containsKey!220 (toList!1184 lt!90694) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54769 (= (contains!1270 lt!90694 #b1000000000000000000000000000000000000000000000000000000000000000) lt!90801)))

(declare-fun b!183617 () Bool)

(declare-fun lt!90802 () Unit!5548)

(assert (=> b!183617 (= e!120877 lt!90802)))

(assert (=> b!183617 (= lt!90802 (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1184 lt!90694) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183617 (isDefined!169 (getValueByKey!216 (toList!1184 lt!90694) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183618 () Bool)

(declare-fun Unit!5555 () Unit!5548)

(assert (=> b!183618 (= e!120877 Unit!5555)))

(declare-fun b!183619 () Bool)

(assert (=> b!183619 (= e!120876 (isDefined!169 (getValueByKey!216 (toList!1184 lt!90694) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54769 c!32914) b!183617))

(assert (= (and d!54769 (not c!32914)) b!183618))

(assert (= (and d!54769 (not res!86903)) b!183619))

(declare-fun m!211141 () Bool)

(assert (=> d!54769 m!211141))

(declare-fun m!211143 () Bool)

(assert (=> b!183617 m!211143))

(assert (=> b!183617 m!211137))

(assert (=> b!183617 m!211137))

(declare-fun m!211145 () Bool)

(assert (=> b!183617 m!211145))

(assert (=> b!183619 m!211137))

(assert (=> b!183619 m!211137))

(assert (=> b!183619 m!211145))

(assert (=> bm!18525 d!54769))

(declare-fun d!54771 () Bool)

(declare-fun e!120878 () Bool)

(assert (=> d!54771 e!120878))

(declare-fun res!86904 () Bool)

(assert (=> d!54771 (=> (not res!86904) (not e!120878))))

(declare-fun lt!90805 () ListLongMap!2337)

(assert (=> d!54771 (= res!86904 (contains!1270 lt!90805 (_1!1721 (ite (or c!32866 c!32865) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3591 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248))))))))

(declare-fun lt!90807 () List!2337)

(assert (=> d!54771 (= lt!90805 (ListLongMap!2338 lt!90807))))

(declare-fun lt!90806 () Unit!5548)

(declare-fun lt!90804 () Unit!5548)

(assert (=> d!54771 (= lt!90806 lt!90804)))

(assert (=> d!54771 (= (getValueByKey!216 lt!90807 (_1!1721 (ite (or c!32866 c!32865) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3591 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248))))) (Some!221 (_2!1721 (ite (or c!32866 c!32865) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3591 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248))))))))

(assert (=> d!54771 (= lt!90804 (lemmaContainsTupThenGetReturnValue!113 lt!90807 (_1!1721 (ite (or c!32866 c!32865) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3591 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248)))) (_2!1721 (ite (or c!32866 c!32865) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3591 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248))))))))

(assert (=> d!54771 (= lt!90807 (insertStrictlySorted!116 (toList!1184 (ite c!32866 call!18523 (ite c!32865 call!18528 call!18525))) (_1!1721 (ite (or c!32866 c!32865) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3591 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248)))) (_2!1721 (ite (or c!32866 c!32865) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3591 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248))))))))

(assert (=> d!54771 (= (+!279 (ite c!32866 call!18523 (ite c!32865 call!18528 call!18525)) (ite (or c!32866 c!32865) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3591 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248)))) lt!90805)))

(declare-fun b!183620 () Bool)

(declare-fun res!86905 () Bool)

(assert (=> b!183620 (=> (not res!86905) (not e!120878))))

(assert (=> b!183620 (= res!86905 (= (getValueByKey!216 (toList!1184 lt!90805) (_1!1721 (ite (or c!32866 c!32865) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3591 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248))))) (Some!221 (_2!1721 (ite (or c!32866 c!32865) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3591 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248)))))))))

(declare-fun b!183621 () Bool)

(assert (=> b!183621 (= e!120878 (contains!1273 (toList!1184 lt!90805) (ite (or c!32866 c!32865) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3591 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3591 thiss!1248)))))))

(assert (= (and d!54771 res!86904) b!183620))

(assert (= (and b!183620 res!86905) b!183621))

(declare-fun m!211147 () Bool)

(assert (=> d!54771 m!211147))

(declare-fun m!211149 () Bool)

(assert (=> d!54771 m!211149))

(declare-fun m!211151 () Bool)

(assert (=> d!54771 m!211151))

(declare-fun m!211153 () Bool)

(assert (=> d!54771 m!211153))

(declare-fun m!211155 () Bool)

(assert (=> b!183620 m!211155))

(declare-fun m!211157 () Bool)

(assert (=> b!183621 m!211157))

(assert (=> bm!18522 d!54771))

(declare-fun d!54773 () Bool)

(declare-fun isEmpty!464 (Option!222) Bool)

(assert (=> d!54773 (= (isDefined!169 (getValueByKey!216 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))) key!828)) (not (isEmpty!464 (getValueByKey!216 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))) key!828))))))

(declare-fun bs!7462 () Bool)

(assert (= bs!7462 d!54773))

(assert (=> bs!7462 m!210883))

(declare-fun m!211159 () Bool)

(assert (=> bs!7462 m!211159))

(assert (=> b!183381 d!54773))

(declare-fun b!183633 () Bool)

(declare-fun e!120884 () Option!222)

(assert (=> b!183633 (= e!120884 None!220)))

(declare-fun b!183630 () Bool)

(declare-fun e!120883 () Option!222)

(assert (=> b!183630 (= e!120883 (Some!221 (_2!1721 (h!2962 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)))))))))

(declare-fun b!183631 () Bool)

(assert (=> b!183631 (= e!120883 e!120884)))

(declare-fun c!32920 () Bool)

(assert (=> b!183631 (= c!32920 (and ((_ is Cons!2333) (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)))) (not (= (_1!1721 (h!2962 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))))) key!828))))))

(declare-fun b!183632 () Bool)

(assert (=> b!183632 (= e!120884 (getValueByKey!216 (t!7205 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)))) key!828))))

(declare-fun d!54775 () Bool)

(declare-fun c!32919 () Bool)

(assert (=> d!54775 (= c!32919 (and ((_ is Cons!2333) (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)))) (= (_1!1721 (h!2962 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))))) key!828)))))

(assert (=> d!54775 (= (getValueByKey!216 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))) key!828) e!120883)))

(assert (= (and d!54775 c!32919) b!183630))

(assert (= (and d!54775 (not c!32919)) b!183631))

(assert (= (and b!183631 c!32920) b!183632))

(assert (= (and b!183631 (not c!32920)) b!183633))

(declare-fun m!211161 () Bool)

(assert (=> b!183632 m!211161))

(assert (=> b!183381 d!54775))

(assert (=> d!54707 d!54703))

(declare-fun d!54777 () Bool)

(declare-fun res!86910 () Bool)

(declare-fun e!120889 () Bool)

(assert (=> d!54777 (=> res!86910 e!120889)))

(assert (=> d!54777 (= res!86910 (and ((_ is Cons!2333) (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)))) (= (_1!1721 (h!2962 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))))) key!828)))))

(assert (=> d!54777 (= (containsKey!220 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))) key!828) e!120889)))

(declare-fun b!183638 () Bool)

(declare-fun e!120890 () Bool)

(assert (=> b!183638 (= e!120889 e!120890)))

(declare-fun res!86911 () Bool)

(assert (=> b!183638 (=> (not res!86911) (not e!120890))))

(assert (=> b!183638 (= res!86911 (and (or (not ((_ is Cons!2333) (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))))) (bvsle (_1!1721 (h!2962 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))))) key!828)) ((_ is Cons!2333) (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)))) (bvslt (_1!1721 (h!2962 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))))) key!828)))))

(declare-fun b!183639 () Bool)

(assert (=> b!183639 (= e!120890 (containsKey!220 (t!7205 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)))) key!828))))

(assert (= (and d!54777 (not res!86910)) b!183638))

(assert (= (and b!183638 res!86911) b!183639))

(declare-fun m!211163 () Bool)

(assert (=> b!183639 m!211163))

(assert (=> d!54705 d!54777))

(declare-fun b!183658 () Bool)

(declare-fun lt!90812 () SeekEntryResult!620)

(assert (=> b!183658 (and (bvsge (index!4652 lt!90812) #b00000000000000000000000000000000) (bvslt (index!4652 lt!90812) (size!3995 (_keys!5668 thiss!1248))))))

(declare-fun res!86918 () Bool)

(assert (=> b!183658 (= res!86918 (= (select (arr!3683 (_keys!5668 thiss!1248)) (index!4652 lt!90812)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!120901 () Bool)

(assert (=> b!183658 (=> res!86918 e!120901)))

(declare-fun b!183659 () Bool)

(declare-fun e!120903 () Bool)

(assert (=> b!183659 (= e!120903 (bvsge (x!19974 lt!90812) #b01111111111111111111111111111110))))

(declare-fun b!183660 () Bool)

(declare-fun e!120902 () Bool)

(assert (=> b!183660 (= e!120903 e!120902)))

(declare-fun res!86920 () Bool)

(assert (=> b!183660 (= res!86920 (and ((_ is Intermediate!620) lt!90812) (not (undefined!1432 lt!90812)) (bvslt (x!19974 lt!90812) #b01111111111111111111111111111110) (bvsge (x!19974 lt!90812) #b00000000000000000000000000000000) (bvsge (x!19974 lt!90812) #b00000000000000000000000000000000)))))

(assert (=> b!183660 (=> (not res!86920) (not e!120902))))

(declare-fun b!183661 () Bool)

(declare-fun e!120905 () SeekEntryResult!620)

(declare-fun e!120904 () SeekEntryResult!620)

(assert (=> b!183661 (= e!120905 e!120904)))

(declare-fun c!32927 () Bool)

(declare-fun lt!90813 () (_ BitVec 64))

(assert (=> b!183661 (= c!32927 (or (= lt!90813 key!828) (= (bvadd lt!90813 lt!90813) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183662 () Bool)

(assert (=> b!183662 (= e!120905 (Intermediate!620 true (toIndex!0 key!828 (mask!8812 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!183663 () Bool)

(assert (=> b!183663 (= e!120904 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8812 thiss!1248)) #b00000000000000000000000000000000 (mask!8812 thiss!1248)) key!828 (_keys!5668 thiss!1248) (mask!8812 thiss!1248)))))

(declare-fun b!183665 () Bool)

(assert (=> b!183665 (and (bvsge (index!4652 lt!90812) #b00000000000000000000000000000000) (bvslt (index!4652 lt!90812) (size!3995 (_keys!5668 thiss!1248))))))

(declare-fun res!86919 () Bool)

(assert (=> b!183665 (= res!86919 (= (select (arr!3683 (_keys!5668 thiss!1248)) (index!4652 lt!90812)) key!828))))

(assert (=> b!183665 (=> res!86919 e!120901)))

(assert (=> b!183665 (= e!120902 e!120901)))

(declare-fun b!183666 () Bool)

(assert (=> b!183666 (= e!120904 (Intermediate!620 false (toIndex!0 key!828 (mask!8812 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!183664 () Bool)

(assert (=> b!183664 (and (bvsge (index!4652 lt!90812) #b00000000000000000000000000000000) (bvslt (index!4652 lt!90812) (size!3995 (_keys!5668 thiss!1248))))))

(assert (=> b!183664 (= e!120901 (= (select (arr!3683 (_keys!5668 thiss!1248)) (index!4652 lt!90812)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!54779 () Bool)

(assert (=> d!54779 e!120903))

(declare-fun c!32929 () Bool)

(assert (=> d!54779 (= c!32929 (and ((_ is Intermediate!620) lt!90812) (undefined!1432 lt!90812)))))

(assert (=> d!54779 (= lt!90812 e!120905)))

(declare-fun c!32928 () Bool)

(assert (=> d!54779 (= c!32928 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!54779 (= lt!90813 (select (arr!3683 (_keys!5668 thiss!1248)) (toIndex!0 key!828 (mask!8812 thiss!1248))))))

(assert (=> d!54779 (validMask!0 (mask!8812 thiss!1248))))

(assert (=> d!54779 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8812 thiss!1248)) key!828 (_keys!5668 thiss!1248) (mask!8812 thiss!1248)) lt!90812)))

(assert (= (and d!54779 c!32928) b!183662))

(assert (= (and d!54779 (not c!32928)) b!183661))

(assert (= (and b!183661 c!32927) b!183666))

(assert (= (and b!183661 (not c!32927)) b!183663))

(assert (= (and d!54779 c!32929) b!183659))

(assert (= (and d!54779 (not c!32929)) b!183660))

(assert (= (and b!183660 res!86920) b!183665))

(assert (= (and b!183665 (not res!86919)) b!183658))

(assert (= (and b!183658 (not res!86918)) b!183664))

(declare-fun m!211165 () Bool)

(assert (=> b!183658 m!211165))

(assert (=> d!54779 m!210949))

(declare-fun m!211167 () Bool)

(assert (=> d!54779 m!211167))

(assert (=> d!54779 m!210849))

(assert (=> b!183664 m!211165))

(assert (=> b!183665 m!211165))

(assert (=> b!183663 m!210949))

(declare-fun m!211169 () Bool)

(assert (=> b!183663 m!211169))

(assert (=> b!183663 m!211169))

(declare-fun m!211171 () Bool)

(assert (=> b!183663 m!211171))

(assert (=> d!54713 d!54779))

(declare-fun d!54781 () Bool)

(declare-fun lt!90819 () (_ BitVec 32))

(declare-fun lt!90818 () (_ BitVec 32))

(assert (=> d!54781 (= lt!90819 (bvmul (bvxor lt!90818 (bvlshr lt!90818 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54781 (= lt!90818 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54781 (and (bvsge (mask!8812 thiss!1248) #b00000000000000000000000000000000) (let ((res!86921 (let ((h!2965 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19993 (bvmul (bvxor h!2965 (bvlshr h!2965 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19993 (bvlshr x!19993 #b00000000000000000000000000001101)) (mask!8812 thiss!1248)))))) (and (bvslt res!86921 (bvadd (mask!8812 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!86921 #b00000000000000000000000000000000))))))

(assert (=> d!54781 (= (toIndex!0 key!828 (mask!8812 thiss!1248)) (bvand (bvxor lt!90819 (bvlshr lt!90819 #b00000000000000000000000000001101)) (mask!8812 thiss!1248)))))

(assert (=> d!54713 d!54781))

(assert (=> d!54713 d!54703))

(declare-fun d!54783 () Bool)

(assert (=> d!54783 (= (apply!159 lt!90694 (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000)) (get!2109 (getValueByKey!216 (toList!1184 lt!90694) (select (arr!3683 (_keys!5668 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7463 () Bool)

(assert (= bs!7463 d!54783))

(assert (=> bs!7463 m!210887))

(assert (=> bs!7463 m!211129))

(assert (=> bs!7463 m!211129))

(declare-fun m!211173 () Bool)

(assert (=> bs!7463 m!211173))

(assert (=> b!183429 d!54783))

(declare-fun d!54785 () Bool)

(declare-fun c!32932 () Bool)

(assert (=> d!54785 (= c!32932 ((_ is ValueCellFull!1806) (select (arr!3684 (_values!3733 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!120908 () V!5379)

(assert (=> d!54785 (= (get!2108 (select (arr!3684 (_values!3733 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3750 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!120908)))

(declare-fun b!183671 () Bool)

(declare-fun get!2110 (ValueCell!1806 V!5379) V!5379)

(assert (=> b!183671 (= e!120908 (get!2110 (select (arr!3684 (_values!3733 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3750 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183672 () Bool)

(declare-fun get!2111 (ValueCell!1806 V!5379) V!5379)

(assert (=> b!183672 (= e!120908 (get!2111 (select (arr!3684 (_values!3733 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3750 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54785 c!32932) b!183671))

(assert (= (and d!54785 (not c!32932)) b!183672))

(assert (=> b!183671 m!210901))

(assert (=> b!183671 m!210897))

(declare-fun m!211175 () Bool)

(assert (=> b!183671 m!211175))

(assert (=> b!183672 m!210901))

(assert (=> b!183672 m!210897))

(declare-fun m!211177 () Bool)

(assert (=> b!183672 m!211177))

(assert (=> b!183429 d!54785))

(declare-fun d!54787 () Bool)

(assert (=> d!54787 (isDefined!169 (getValueByKey!216 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))) key!828))))

(declare-fun lt!90822 () Unit!5548)

(declare-fun choose!972 (List!2337 (_ BitVec 64)) Unit!5548)

(assert (=> d!54787 (= lt!90822 (choose!972 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))) key!828))))

(declare-fun e!120911 () Bool)

(assert (=> d!54787 e!120911))

(declare-fun res!86924 () Bool)

(assert (=> d!54787 (=> (not res!86924) (not e!120911))))

(declare-fun isStrictlySorted!345 (List!2337) Bool)

(assert (=> d!54787 (= res!86924 (isStrictlySorted!345 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248)))))))

(assert (=> d!54787 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))) key!828) lt!90822)))

(declare-fun b!183675 () Bool)

(assert (=> b!183675 (= e!120911 (containsKey!220 (toList!1184 (getCurrentListMap!832 (_keys!5668 thiss!1248) (_values!3733 thiss!1248) (mask!8812 thiss!1248) (extraKeys!3487 thiss!1248) (zeroValue!3591 thiss!1248) (minValue!3591 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3750 thiss!1248))) key!828))))

(assert (= (and d!54787 res!86924) b!183675))

(assert (=> d!54787 m!210883))

(assert (=> d!54787 m!210883))

(assert (=> d!54787 m!210885))

(declare-fun m!211179 () Bool)

(assert (=> d!54787 m!211179))

(declare-fun m!211181 () Bool)

(assert (=> d!54787 m!211181))

(assert (=> b!183675 m!210879))

(assert (=> b!183379 d!54787))

(assert (=> b!183379 d!54773))

(assert (=> b!183379 d!54775))

(assert (=> b!183444 d!54717))

(declare-fun d!54789 () Bool)

(assert (=> d!54789 (= (apply!159 lt!90694 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2109 (getValueByKey!216 (toList!1184 lt!90694) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7464 () Bool)

(assert (= bs!7464 d!54789))

(assert (=> bs!7464 m!210977))

(assert (=> bs!7464 m!210977))

(declare-fun m!211183 () Bool)

(assert (=> bs!7464 m!211183))

(assert (=> b!183436 d!54789))

(declare-fun mapNonEmpty!7389 () Bool)

(declare-fun mapRes!7389 () Bool)

(declare-fun tp!16362 () Bool)

(declare-fun e!120912 () Bool)

(assert (=> mapNonEmpty!7389 (= mapRes!7389 (and tp!16362 e!120912))))

(declare-fun mapKey!7389 () (_ BitVec 32))

(declare-fun mapRest!7389 () (Array (_ BitVec 32) ValueCell!1806))

(declare-fun mapValue!7389 () ValueCell!1806)

(assert (=> mapNonEmpty!7389 (= mapRest!7388 (store mapRest!7389 mapKey!7389 mapValue!7389))))

(declare-fun condMapEmpty!7389 () Bool)

(declare-fun mapDefault!7389 () ValueCell!1806)

(assert (=> mapNonEmpty!7388 (= condMapEmpty!7389 (= mapRest!7388 ((as const (Array (_ BitVec 32) ValueCell!1806)) mapDefault!7389)))))

(declare-fun e!120913 () Bool)

(assert (=> mapNonEmpty!7388 (= tp!16361 (and e!120913 mapRes!7389))))

(declare-fun b!183676 () Bool)

(assert (=> b!183676 (= e!120912 tp_is_empty!4299)))

(declare-fun mapIsEmpty!7389 () Bool)

(assert (=> mapIsEmpty!7389 mapRes!7389))

(declare-fun b!183677 () Bool)

(assert (=> b!183677 (= e!120913 tp_is_empty!4299)))

(assert (= (and mapNonEmpty!7388 condMapEmpty!7389) mapIsEmpty!7389))

(assert (= (and mapNonEmpty!7388 (not condMapEmpty!7389)) mapNonEmpty!7389))

(assert (= (and mapNonEmpty!7389 ((_ is ValueCellFull!1806) mapValue!7389)) b!183676))

(assert (= (and mapNonEmpty!7388 ((_ is ValueCellFull!1806) mapDefault!7389)) b!183677))

(declare-fun m!211185 () Bool)

(assert (=> mapNonEmpty!7389 m!211185))

(declare-fun b_lambda!7199 () Bool)

(assert (= b_lambda!7197 (or (and b!183343 b_free!4527) b_lambda!7199)))

(declare-fun b_lambda!7201 () Bool)

(assert (= b_lambda!7195 (or (and b!183343 b_free!4527) b_lambda!7201)))

(check-sat (not b!183671) (not b!183615) (not d!54773) (not b!183568) (not b!183672) (not d!54755) (not b!183560) (not b!183632) (not b!183563) (not b!183493) (not b_lambda!7201) (not d!54787) (not b!183497) (not b!183590) (not b!183496) (not b!183518) (not b!183553) (not b!183517) (not b_next!4527) (not d!54749) (not b!183492) (not d!54743) tp_is_empty!4299 (not b!183555) (not d!54737) (not d!54731) (not d!54757) (not d!54747) (not b!183567) (not d!54765) (not b!183566) (not b!183499) (not d!54783) (not b!183546) (not d!54751) (not b!183589) (not d!54771) (not d!54739) (not b!183570) (not d!54767) (not bm!18532) (not d!54761) (not b!183621) (not d!54733) (not d!54741) (not d!54729) (not b!183550) (not b!183663) (not b!183620) (not b!183545) (not b!183554) (not bm!18529) (not b!183561) (not b!183639) (not bm!18535) (not d!54735) (not d!54727) (not d!54759) (not d!54779) (not d!54789) (not d!54769) (not d!54753) (not b!183592) (not b!183548) (not b!183619) (not b!183519) (not d!54745) (not b!183505) (not bm!18538) (not b_lambda!7193) (not d!54723) (not b!183617) (not b!183516) (not b!183552) (not b!183603) (not b_lambda!7199) (not b!183562) (not b!183675) (not b!183504) (not d!54721) (not mapNonEmpty!7389) (not b!183614) b_and!11105)
(check-sat b_and!11105 (not b_next!4527))
