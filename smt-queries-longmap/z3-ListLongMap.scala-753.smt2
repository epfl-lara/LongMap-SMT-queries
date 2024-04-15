; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17670 () Bool)

(assert start!17670)

(declare-fun b!176450 () Bool)

(declare-fun b_free!4357 () Bool)

(declare-fun b_next!4357 () Bool)

(assert (=> b!176450 (= b_free!4357 (not b_next!4357))))

(declare-fun tp!15765 () Bool)

(declare-fun b_and!10827 () Bool)

(assert (=> b!176450 (= tp!15765 b_and!10827)))

(declare-fun b!176441 () Bool)

(declare-fun res!83587 () Bool)

(declare-fun e!116395 () Bool)

(assert (=> b!176441 (=> (not res!83587) (not e!116395))))

(declare-datatypes ((V!5153 0))(
  ( (V!5154 (val!2109 Int)) )
))
(declare-datatypes ((ValueCell!1721 0))(
  ( (ValueCellFull!1721 (v!3981 V!5153)) (EmptyCell!1721) )
))
(declare-datatypes ((array!7385 0))(
  ( (array!7386 (arr!3502 (Array (_ BitVec 32) (_ BitVec 64))) (size!3807 (_ BitVec 32))) )
))
(declare-datatypes ((array!7387 0))(
  ( (array!7388 (arr!3503 (Array (_ BitVec 32) ValueCell!1721)) (size!3808 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2350 0))(
  ( (LongMapFixedSize!2351 (defaultEntry!3636 Int) (mask!8557 (_ BitVec 32)) (extraKeys!3373 (_ BitVec 32)) (zeroValue!3477 V!5153) (minValue!3477 V!5153) (_size!1224 (_ BitVec 32)) (_keys!5498 array!7385) (_values!3619 array!7387) (_vacant!1224 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2350)

(assert (=> b!176441 (= res!83587 (and (= (size!3808 (_values!3619 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8557 thiss!1248))) (= (size!3807 (_keys!5498 thiss!1248)) (size!3808 (_values!3619 thiss!1248))) (bvsge (mask!8557 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3373 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3373 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!176442 () Bool)

(declare-fun e!116397 () Bool)

(declare-fun tp_is_empty!4129 () Bool)

(assert (=> b!176442 (= e!116397 tp_is_empty!4129)))

(declare-fun b!176443 () Bool)

(declare-fun res!83584 () Bool)

(assert (=> b!176443 (=> (not res!83584) (not e!116395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7385 (_ BitVec 32)) Bool)

(assert (=> b!176443 (= res!83584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5498 thiss!1248) (mask!8557 thiss!1248)))))

(declare-fun mapNonEmpty!7050 () Bool)

(declare-fun mapRes!7050 () Bool)

(declare-fun tp!15764 () Bool)

(assert (=> mapNonEmpty!7050 (= mapRes!7050 (and tp!15764 e!116397))))

(declare-fun mapValue!7050 () ValueCell!1721)

(declare-fun mapKey!7050 () (_ BitVec 32))

(declare-fun mapRest!7050 () (Array (_ BitVec 32) ValueCell!1721))

(assert (=> mapNonEmpty!7050 (= (arr!3503 (_values!3619 thiss!1248)) (store mapRest!7050 mapKey!7050 mapValue!7050))))

(declare-fun b!176444 () Bool)

(declare-fun e!116393 () Bool)

(assert (=> b!176444 (= e!116393 tp_is_empty!4129)))

(declare-fun b!176445 () Bool)

(declare-fun res!83586 () Bool)

(assert (=> b!176445 (=> (not res!83586) (not e!116395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176445 (= res!83586 (validMask!0 (mask!8557 thiss!1248)))))

(declare-fun b!176447 () Bool)

(declare-fun e!116392 () Bool)

(assert (=> b!176447 (= e!116392 (and e!116393 mapRes!7050))))

(declare-fun condMapEmpty!7050 () Bool)

(declare-fun mapDefault!7050 () ValueCell!1721)

(assert (=> b!176447 (= condMapEmpty!7050 (= (arr!3503 (_values!3619 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1721)) mapDefault!7050)))))

(declare-fun mapIsEmpty!7050 () Bool)

(assert (=> mapIsEmpty!7050 mapRes!7050))

(declare-fun b!176448 () Bool)

(declare-datatypes ((List!2240 0))(
  ( (Nil!2237) (Cons!2236 (h!2857 (_ BitVec 64)) (t!7057 List!2240)) )
))
(declare-fun arrayNoDuplicates!0 (array!7385 (_ BitVec 32) List!2240) Bool)

(assert (=> b!176448 (= e!116395 (not (arrayNoDuplicates!0 (_keys!5498 thiss!1248) #b00000000000000000000000000000000 Nil!2237)))))

(declare-fun b!176449 () Bool)

(declare-fun res!83585 () Bool)

(assert (=> b!176449 (=> (not res!83585) (not e!116395))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!568 0))(
  ( (MissingZero!568 (index!4440 (_ BitVec 32))) (Found!568 (index!4441 (_ BitVec 32))) (Intermediate!568 (undefined!1380 Bool) (index!4442 (_ BitVec 32)) (x!19395 (_ BitVec 32))) (Undefined!568) (MissingVacant!568 (index!4443 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7385 (_ BitVec 32)) SeekEntryResult!568)

(assert (=> b!176449 (= res!83585 ((_ is Undefined!568) (seekEntryOrOpen!0 key!828 (_keys!5498 thiss!1248) (mask!8557 thiss!1248))))))

(declare-fun e!116394 () Bool)

(declare-fun array_inv!2259 (array!7385) Bool)

(declare-fun array_inv!2260 (array!7387) Bool)

(assert (=> b!176450 (= e!116394 (and tp!15765 tp_is_empty!4129 (array_inv!2259 (_keys!5498 thiss!1248)) (array_inv!2260 (_values!3619 thiss!1248)) e!116392))))

(declare-fun b!176451 () Bool)

(declare-fun res!83588 () Bool)

(assert (=> b!176451 (=> (not res!83588) (not e!116395))))

(declare-datatypes ((tuple2!3272 0))(
  ( (tuple2!3273 (_1!1647 (_ BitVec 64)) (_2!1647 V!5153)) )
))
(declare-datatypes ((List!2241 0))(
  ( (Nil!2238) (Cons!2237 (h!2858 tuple2!3272) (t!7058 List!2241)) )
))
(declare-datatypes ((ListLongMap!2191 0))(
  ( (ListLongMap!2192 (toList!1111 List!2241)) )
))
(declare-fun contains!1180 (ListLongMap!2191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!747 (array!7385 array!7387 (_ BitVec 32) (_ BitVec 32) V!5153 V!5153 (_ BitVec 32) Int) ListLongMap!2191)

(assert (=> b!176451 (= res!83588 (contains!1180 (getCurrentListMap!747 (_keys!5498 thiss!1248) (_values!3619 thiss!1248) (mask!8557 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)) key!828))))

(declare-fun res!83583 () Bool)

(assert (=> start!17670 (=> (not res!83583) (not e!116395))))

(declare-fun valid!1006 (LongMapFixedSize!2350) Bool)

(assert (=> start!17670 (= res!83583 (valid!1006 thiss!1248))))

(assert (=> start!17670 e!116395))

(assert (=> start!17670 e!116394))

(assert (=> start!17670 true))

(declare-fun b!176446 () Bool)

(declare-fun res!83589 () Bool)

(assert (=> b!176446 (=> (not res!83589) (not e!116395))))

(assert (=> b!176446 (= res!83589 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!17670 res!83583) b!176446))

(assert (= (and b!176446 res!83589) b!176449))

(assert (= (and b!176449 res!83585) b!176451))

(assert (= (and b!176451 res!83588) b!176445))

(assert (= (and b!176445 res!83586) b!176441))

(assert (= (and b!176441 res!83587) b!176443))

(assert (= (and b!176443 res!83584) b!176448))

(assert (= (and b!176447 condMapEmpty!7050) mapIsEmpty!7050))

(assert (= (and b!176447 (not condMapEmpty!7050)) mapNonEmpty!7050))

(assert (= (and mapNonEmpty!7050 ((_ is ValueCellFull!1721) mapValue!7050)) b!176442))

(assert (= (and b!176447 ((_ is ValueCellFull!1721) mapDefault!7050)) b!176444))

(assert (= b!176450 b!176447))

(assert (= start!17670 b!176450))

(declare-fun m!204743 () Bool)

(assert (=> b!176445 m!204743))

(declare-fun m!204745 () Bool)

(assert (=> b!176443 m!204745))

(declare-fun m!204747 () Bool)

(assert (=> b!176451 m!204747))

(assert (=> b!176451 m!204747))

(declare-fun m!204749 () Bool)

(assert (=> b!176451 m!204749))

(declare-fun m!204751 () Bool)

(assert (=> start!17670 m!204751))

(declare-fun m!204753 () Bool)

(assert (=> b!176448 m!204753))

(declare-fun m!204755 () Bool)

(assert (=> mapNonEmpty!7050 m!204755))

(declare-fun m!204757 () Bool)

(assert (=> b!176449 m!204757))

(declare-fun m!204759 () Bool)

(assert (=> b!176450 m!204759))

(declare-fun m!204761 () Bool)

(assert (=> b!176450 m!204761))

(check-sat (not b!176450) (not mapNonEmpty!7050) (not start!17670) (not b!176443) (not b!176448) (not b!176449) (not b!176445) (not b!176451) tp_is_empty!4129 b_and!10827 (not b_next!4357))
(check-sat b_and!10827 (not b_next!4357))
(get-model)

(declare-fun b!176528 () Bool)

(declare-fun e!116445 () Bool)

(declare-fun call!17848 () Bool)

(assert (=> b!176528 (= e!116445 call!17848)))

(declare-fun b!176529 () Bool)

(declare-fun e!116444 () Bool)

(assert (=> b!176529 (= e!116444 e!116445)))

(declare-fun c!31637 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!176529 (= c!31637 (validKeyInArray!0 (select (arr!3502 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176530 () Bool)

(declare-fun e!116442 () Bool)

(declare-fun contains!1182 (List!2240 (_ BitVec 64)) Bool)

(assert (=> b!176530 (= e!116442 (contains!1182 Nil!2237 (select (arr!3502 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176531 () Bool)

(declare-fun e!116443 () Bool)

(assert (=> b!176531 (= e!116443 e!116444)))

(declare-fun res!83639 () Bool)

(assert (=> b!176531 (=> (not res!83639) (not e!116444))))

(assert (=> b!176531 (= res!83639 (not e!116442))))

(declare-fun res!83640 () Bool)

(assert (=> b!176531 (=> (not res!83640) (not e!116442))))

(assert (=> b!176531 (= res!83640 (validKeyInArray!0 (select (arr!3502 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53539 () Bool)

(declare-fun res!83638 () Bool)

(assert (=> d!53539 (=> res!83638 e!116443)))

(assert (=> d!53539 (= res!83638 (bvsge #b00000000000000000000000000000000 (size!3807 (_keys!5498 thiss!1248))))))

(assert (=> d!53539 (= (arrayNoDuplicates!0 (_keys!5498 thiss!1248) #b00000000000000000000000000000000 Nil!2237) e!116443)))

(declare-fun b!176532 () Bool)

(assert (=> b!176532 (= e!116445 call!17848)))

(declare-fun bm!17845 () Bool)

(assert (=> bm!17845 (= call!17848 (arrayNoDuplicates!0 (_keys!5498 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31637 (Cons!2236 (select (arr!3502 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000) Nil!2237) Nil!2237)))))

(assert (= (and d!53539 (not res!83638)) b!176531))

(assert (= (and b!176531 res!83640) b!176530))

(assert (= (and b!176531 res!83639) b!176529))

(assert (= (and b!176529 c!31637) b!176532))

(assert (= (and b!176529 (not c!31637)) b!176528))

(assert (= (or b!176532 b!176528) bm!17845))

(declare-fun m!204803 () Bool)

(assert (=> b!176529 m!204803))

(assert (=> b!176529 m!204803))

(declare-fun m!204805 () Bool)

(assert (=> b!176529 m!204805))

(assert (=> b!176530 m!204803))

(assert (=> b!176530 m!204803))

(declare-fun m!204807 () Bool)

(assert (=> b!176530 m!204807))

(assert (=> b!176531 m!204803))

(assert (=> b!176531 m!204803))

(assert (=> b!176531 m!204805))

(assert (=> bm!17845 m!204803))

(declare-fun m!204809 () Bool)

(assert (=> bm!17845 m!204809))

(assert (=> b!176448 d!53539))

(declare-fun d!53541 () Bool)

(declare-fun res!83647 () Bool)

(declare-fun e!116448 () Bool)

(assert (=> d!53541 (=> (not res!83647) (not e!116448))))

(declare-fun simpleValid!152 (LongMapFixedSize!2350) Bool)

(assert (=> d!53541 (= res!83647 (simpleValid!152 thiss!1248))))

(assert (=> d!53541 (= (valid!1006 thiss!1248) e!116448)))

(declare-fun b!176539 () Bool)

(declare-fun res!83648 () Bool)

(assert (=> b!176539 (=> (not res!83648) (not e!116448))))

(declare-fun arrayCountValidKeys!0 (array!7385 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!176539 (= res!83648 (= (arrayCountValidKeys!0 (_keys!5498 thiss!1248) #b00000000000000000000000000000000 (size!3807 (_keys!5498 thiss!1248))) (_size!1224 thiss!1248)))))

(declare-fun b!176540 () Bool)

(declare-fun res!83649 () Bool)

(assert (=> b!176540 (=> (not res!83649) (not e!116448))))

(assert (=> b!176540 (= res!83649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5498 thiss!1248) (mask!8557 thiss!1248)))))

(declare-fun b!176541 () Bool)

(assert (=> b!176541 (= e!116448 (arrayNoDuplicates!0 (_keys!5498 thiss!1248) #b00000000000000000000000000000000 Nil!2237))))

(assert (= (and d!53541 res!83647) b!176539))

(assert (= (and b!176539 res!83648) b!176540))

(assert (= (and b!176540 res!83649) b!176541))

(declare-fun m!204811 () Bool)

(assert (=> d!53541 m!204811))

(declare-fun m!204813 () Bool)

(assert (=> b!176539 m!204813))

(assert (=> b!176540 m!204745))

(assert (=> b!176541 m!204753))

(assert (=> start!17670 d!53541))

(declare-fun b!176554 () Bool)

(declare-fun c!31644 () Bool)

(declare-fun lt!87203 () (_ BitVec 64))

(assert (=> b!176554 (= c!31644 (= lt!87203 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!116457 () SeekEntryResult!568)

(declare-fun e!116455 () SeekEntryResult!568)

(assert (=> b!176554 (= e!116457 e!116455)))

(declare-fun lt!87201 () SeekEntryResult!568)

(declare-fun b!176556 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7385 (_ BitVec 32)) SeekEntryResult!568)

(assert (=> b!176556 (= e!116455 (seekKeyOrZeroReturnVacant!0 (x!19395 lt!87201) (index!4442 lt!87201) (index!4442 lt!87201) key!828 (_keys!5498 thiss!1248) (mask!8557 thiss!1248)))))

(declare-fun b!176557 () Bool)

(declare-fun e!116456 () SeekEntryResult!568)

(assert (=> b!176557 (= e!116456 Undefined!568)))

(declare-fun b!176558 () Bool)

(assert (=> b!176558 (= e!116457 (Found!568 (index!4442 lt!87201)))))

(declare-fun b!176559 () Bool)

(assert (=> b!176559 (= e!116455 (MissingZero!568 (index!4442 lt!87201)))))

(declare-fun d!53543 () Bool)

(declare-fun lt!87202 () SeekEntryResult!568)

(assert (=> d!53543 (and (or ((_ is Undefined!568) lt!87202) (not ((_ is Found!568) lt!87202)) (and (bvsge (index!4441 lt!87202) #b00000000000000000000000000000000) (bvslt (index!4441 lt!87202) (size!3807 (_keys!5498 thiss!1248))))) (or ((_ is Undefined!568) lt!87202) ((_ is Found!568) lt!87202) (not ((_ is MissingZero!568) lt!87202)) (and (bvsge (index!4440 lt!87202) #b00000000000000000000000000000000) (bvslt (index!4440 lt!87202) (size!3807 (_keys!5498 thiss!1248))))) (or ((_ is Undefined!568) lt!87202) ((_ is Found!568) lt!87202) ((_ is MissingZero!568) lt!87202) (not ((_ is MissingVacant!568) lt!87202)) (and (bvsge (index!4443 lt!87202) #b00000000000000000000000000000000) (bvslt (index!4443 lt!87202) (size!3807 (_keys!5498 thiss!1248))))) (or ((_ is Undefined!568) lt!87202) (ite ((_ is Found!568) lt!87202) (= (select (arr!3502 (_keys!5498 thiss!1248)) (index!4441 lt!87202)) key!828) (ite ((_ is MissingZero!568) lt!87202) (= (select (arr!3502 (_keys!5498 thiss!1248)) (index!4440 lt!87202)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!568) lt!87202) (= (select (arr!3502 (_keys!5498 thiss!1248)) (index!4443 lt!87202)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53543 (= lt!87202 e!116456)))

(declare-fun c!31646 () Bool)

(assert (=> d!53543 (= c!31646 (and ((_ is Intermediate!568) lt!87201) (undefined!1380 lt!87201)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7385 (_ BitVec 32)) SeekEntryResult!568)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53543 (= lt!87201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8557 thiss!1248)) key!828 (_keys!5498 thiss!1248) (mask!8557 thiss!1248)))))

(assert (=> d!53543 (validMask!0 (mask!8557 thiss!1248))))

(assert (=> d!53543 (= (seekEntryOrOpen!0 key!828 (_keys!5498 thiss!1248) (mask!8557 thiss!1248)) lt!87202)))

(declare-fun b!176555 () Bool)

(assert (=> b!176555 (= e!116456 e!116457)))

(assert (=> b!176555 (= lt!87203 (select (arr!3502 (_keys!5498 thiss!1248)) (index!4442 lt!87201)))))

(declare-fun c!31645 () Bool)

(assert (=> b!176555 (= c!31645 (= lt!87203 key!828))))

(assert (= (and d!53543 c!31646) b!176557))

(assert (= (and d!53543 (not c!31646)) b!176555))

(assert (= (and b!176555 c!31645) b!176558))

(assert (= (and b!176555 (not c!31645)) b!176554))

(assert (= (and b!176554 c!31644) b!176559))

(assert (= (and b!176554 (not c!31644)) b!176556))

(declare-fun m!204815 () Bool)

(assert (=> b!176556 m!204815))

(declare-fun m!204817 () Bool)

(assert (=> d!53543 m!204817))

(declare-fun m!204819 () Bool)

(assert (=> d!53543 m!204819))

(assert (=> d!53543 m!204743))

(declare-fun m!204821 () Bool)

(assert (=> d!53543 m!204821))

(assert (=> d!53543 m!204817))

(declare-fun m!204823 () Bool)

(assert (=> d!53543 m!204823))

(declare-fun m!204825 () Bool)

(assert (=> d!53543 m!204825))

(declare-fun m!204827 () Bool)

(assert (=> b!176555 m!204827))

(assert (=> b!176449 d!53543))

(declare-fun d!53545 () Bool)

(assert (=> d!53545 (= (validMask!0 (mask!8557 thiss!1248)) (and (or (= (mask!8557 thiss!1248) #b00000000000000000000000000000111) (= (mask!8557 thiss!1248) #b00000000000000000000000000001111) (= (mask!8557 thiss!1248) #b00000000000000000000000000011111) (= (mask!8557 thiss!1248) #b00000000000000000000000000111111) (= (mask!8557 thiss!1248) #b00000000000000000000000001111111) (= (mask!8557 thiss!1248) #b00000000000000000000000011111111) (= (mask!8557 thiss!1248) #b00000000000000000000000111111111) (= (mask!8557 thiss!1248) #b00000000000000000000001111111111) (= (mask!8557 thiss!1248) #b00000000000000000000011111111111) (= (mask!8557 thiss!1248) #b00000000000000000000111111111111) (= (mask!8557 thiss!1248) #b00000000000000000001111111111111) (= (mask!8557 thiss!1248) #b00000000000000000011111111111111) (= (mask!8557 thiss!1248) #b00000000000000000111111111111111) (= (mask!8557 thiss!1248) #b00000000000000001111111111111111) (= (mask!8557 thiss!1248) #b00000000000000011111111111111111) (= (mask!8557 thiss!1248) #b00000000000000111111111111111111) (= (mask!8557 thiss!1248) #b00000000000001111111111111111111) (= (mask!8557 thiss!1248) #b00000000000011111111111111111111) (= (mask!8557 thiss!1248) #b00000000000111111111111111111111) (= (mask!8557 thiss!1248) #b00000000001111111111111111111111) (= (mask!8557 thiss!1248) #b00000000011111111111111111111111) (= (mask!8557 thiss!1248) #b00000000111111111111111111111111) (= (mask!8557 thiss!1248) #b00000001111111111111111111111111) (= (mask!8557 thiss!1248) #b00000011111111111111111111111111) (= (mask!8557 thiss!1248) #b00000111111111111111111111111111) (= (mask!8557 thiss!1248) #b00001111111111111111111111111111) (= (mask!8557 thiss!1248) #b00011111111111111111111111111111) (= (mask!8557 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8557 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!176445 d!53545))

(declare-fun d!53547 () Bool)

(assert (=> d!53547 (= (array_inv!2259 (_keys!5498 thiss!1248)) (bvsge (size!3807 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176450 d!53547))

(declare-fun d!53549 () Bool)

(assert (=> d!53549 (= (array_inv!2260 (_values!3619 thiss!1248)) (bvsge (size!3808 (_values!3619 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176450 d!53549))

(declare-fun d!53551 () Bool)

(declare-fun e!116462 () Bool)

(assert (=> d!53551 e!116462))

(declare-fun res!83652 () Bool)

(assert (=> d!53551 (=> res!83652 e!116462)))

(declare-fun lt!87214 () Bool)

(assert (=> d!53551 (= res!83652 (not lt!87214))))

(declare-fun lt!87213 () Bool)

(assert (=> d!53551 (= lt!87214 lt!87213)))

(declare-datatypes ((Unit!5383 0))(
  ( (Unit!5384) )
))
(declare-fun lt!87212 () Unit!5383)

(declare-fun e!116463 () Unit!5383)

(assert (=> d!53551 (= lt!87212 e!116463)))

(declare-fun c!31649 () Bool)

(assert (=> d!53551 (= c!31649 lt!87213)))

(declare-fun containsKey!195 (List!2241 (_ BitVec 64)) Bool)

(assert (=> d!53551 (= lt!87213 (containsKey!195 (toList!1111 (getCurrentListMap!747 (_keys!5498 thiss!1248) (_values!3619 thiss!1248) (mask!8557 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248))) key!828))))

(assert (=> d!53551 (= (contains!1180 (getCurrentListMap!747 (_keys!5498 thiss!1248) (_values!3619 thiss!1248) (mask!8557 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)) key!828) lt!87214)))

(declare-fun b!176566 () Bool)

(declare-fun lt!87215 () Unit!5383)

(assert (=> b!176566 (= e!116463 lt!87215)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!144 (List!2241 (_ BitVec 64)) Unit!5383)

(assert (=> b!176566 (= lt!87215 (lemmaContainsKeyImpliesGetValueByKeyDefined!144 (toList!1111 (getCurrentListMap!747 (_keys!5498 thiss!1248) (_values!3619 thiss!1248) (mask!8557 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248))) key!828))))

(declare-datatypes ((Option!197 0))(
  ( (Some!196 (v!3984 V!5153)) (None!195) )
))
(declare-fun isDefined!145 (Option!197) Bool)

(declare-fun getValueByKey!191 (List!2241 (_ BitVec 64)) Option!197)

(assert (=> b!176566 (isDefined!145 (getValueByKey!191 (toList!1111 (getCurrentListMap!747 (_keys!5498 thiss!1248) (_values!3619 thiss!1248) (mask!8557 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248))) key!828))))

(declare-fun b!176567 () Bool)

(declare-fun Unit!5385 () Unit!5383)

(assert (=> b!176567 (= e!116463 Unit!5385)))

(declare-fun b!176568 () Bool)

(assert (=> b!176568 (= e!116462 (isDefined!145 (getValueByKey!191 (toList!1111 (getCurrentListMap!747 (_keys!5498 thiss!1248) (_values!3619 thiss!1248) (mask!8557 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248))) key!828)))))

(assert (= (and d!53551 c!31649) b!176566))

(assert (= (and d!53551 (not c!31649)) b!176567))

(assert (= (and d!53551 (not res!83652)) b!176568))

(declare-fun m!204829 () Bool)

(assert (=> d!53551 m!204829))

(declare-fun m!204831 () Bool)

(assert (=> b!176566 m!204831))

(declare-fun m!204833 () Bool)

(assert (=> b!176566 m!204833))

(assert (=> b!176566 m!204833))

(declare-fun m!204835 () Bool)

(assert (=> b!176566 m!204835))

(assert (=> b!176568 m!204833))

(assert (=> b!176568 m!204833))

(assert (=> b!176568 m!204835))

(assert (=> b!176451 d!53551))

(declare-fun bm!17860 () Bool)

(declare-fun call!17868 () ListLongMap!2191)

(declare-fun getCurrentListMapNoExtraKeys!159 (array!7385 array!7387 (_ BitVec 32) (_ BitVec 32) V!5153 V!5153 (_ BitVec 32) Int) ListLongMap!2191)

(assert (=> bm!17860 (= call!17868 (getCurrentListMapNoExtraKeys!159 (_keys!5498 thiss!1248) (_values!3619 thiss!1248) (mask!8557 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)))))

(declare-fun b!176611 () Bool)

(declare-fun e!116502 () Unit!5383)

(declare-fun Unit!5386 () Unit!5383)

(assert (=> b!176611 (= e!116502 Unit!5386)))

(declare-fun bm!17861 () Bool)

(declare-fun call!17869 () ListLongMap!2191)

(declare-fun call!17866 () ListLongMap!2191)

(assert (=> bm!17861 (= call!17869 call!17866)))

(declare-fun b!176612 () Bool)

(declare-fun e!116497 () Bool)

(declare-fun lt!87276 () ListLongMap!2191)

(declare-fun apply!138 (ListLongMap!2191 (_ BitVec 64)) V!5153)

(assert (=> b!176612 (= e!116497 (= (apply!138 lt!87276 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3477 thiss!1248)))))

(declare-fun b!176613 () Bool)

(declare-fun c!31665 () Bool)

(assert (=> b!176613 (= c!31665 (and (not (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!116498 () ListLongMap!2191)

(declare-fun e!116494 () ListLongMap!2191)

(assert (=> b!176613 (= e!116498 e!116494)))

(declare-fun b!176614 () Bool)

(declare-fun call!17865 () ListLongMap!2191)

(assert (=> b!176614 (= e!116494 call!17865)))

(declare-fun b!176615 () Bool)

(declare-fun e!116493 () Bool)

(declare-fun e!116500 () Bool)

(assert (=> b!176615 (= e!116493 e!116500)))

(declare-fun c!31662 () Bool)

(assert (=> b!176615 (= c!31662 (not (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17863 () Bool)

(declare-fun call!17864 () Bool)

(assert (=> bm!17863 (= call!17864 (contains!1180 lt!87276 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176616 () Bool)

(declare-fun e!116496 () Bool)

(assert (=> b!176616 (= e!116496 (= (apply!138 lt!87276 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3477 thiss!1248)))))

(declare-fun bm!17864 () Bool)

(declare-fun call!17863 () Bool)

(assert (=> bm!17864 (= call!17863 (contains!1180 lt!87276 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176617 () Bool)

(declare-fun e!116501 () Bool)

(assert (=> b!176617 (= e!116501 (not call!17864))))

(declare-fun b!176618 () Bool)

(declare-fun e!116491 () Bool)

(declare-fun get!2001 (ValueCell!1721 V!5153) V!5153)

(declare-fun dynLambda!472 (Int (_ BitVec 64)) V!5153)

(assert (=> b!176618 (= e!116491 (= (apply!138 lt!87276 (select (arr!3502 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000)) (get!2001 (select (arr!3503 (_values!3619 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3636 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!176618 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3808 (_values!3619 thiss!1248))))))

(assert (=> b!176618 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3807 (_keys!5498 thiss!1248))))))

(declare-fun b!176619 () Bool)

(declare-fun res!83676 () Bool)

(assert (=> b!176619 (=> (not res!83676) (not e!116493))))

(declare-fun e!116492 () Bool)

(assert (=> b!176619 (= res!83676 e!116492)))

(declare-fun res!83679 () Bool)

(assert (=> b!176619 (=> res!83679 e!116492)))

(declare-fun e!116490 () Bool)

(assert (=> b!176619 (= res!83679 (not e!116490))))

(declare-fun res!83675 () Bool)

(assert (=> b!176619 (=> (not res!83675) (not e!116490))))

(assert (=> b!176619 (= res!83675 (bvslt #b00000000000000000000000000000000 (size!3807 (_keys!5498 thiss!1248))))))

(declare-fun b!176620 () Bool)

(assert (=> b!176620 (= e!116494 call!17869)))

(declare-fun b!176621 () Bool)

(declare-fun e!116495 () ListLongMap!2191)

(declare-fun +!250 (ListLongMap!2191 tuple2!3272) ListLongMap!2191)

(assert (=> b!176621 (= e!116495 (+!250 call!17866 (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3477 thiss!1248))))))

(declare-fun b!176622 () Bool)

(declare-fun e!116499 () Bool)

(assert (=> b!176622 (= e!116499 (validKeyInArray!0 (select (arr!3502 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176623 () Bool)

(declare-fun lt!87265 () Unit!5383)

(assert (=> b!176623 (= e!116502 lt!87265)))

(declare-fun lt!87272 () ListLongMap!2191)

(assert (=> b!176623 (= lt!87272 (getCurrentListMapNoExtraKeys!159 (_keys!5498 thiss!1248) (_values!3619 thiss!1248) (mask!8557 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)))))

(declare-fun lt!87261 () (_ BitVec 64))

(assert (=> b!176623 (= lt!87261 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87279 () (_ BitVec 64))

(assert (=> b!176623 (= lt!87279 (select (arr!3502 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87264 () Unit!5383)

(declare-fun addStillContains!114 (ListLongMap!2191 (_ BitVec 64) V!5153 (_ BitVec 64)) Unit!5383)

(assert (=> b!176623 (= lt!87264 (addStillContains!114 lt!87272 lt!87261 (zeroValue!3477 thiss!1248) lt!87279))))

(assert (=> b!176623 (contains!1180 (+!250 lt!87272 (tuple2!3273 lt!87261 (zeroValue!3477 thiss!1248))) lt!87279)))

(declare-fun lt!87273 () Unit!5383)

(assert (=> b!176623 (= lt!87273 lt!87264)))

(declare-fun lt!87267 () ListLongMap!2191)

(assert (=> b!176623 (= lt!87267 (getCurrentListMapNoExtraKeys!159 (_keys!5498 thiss!1248) (_values!3619 thiss!1248) (mask!8557 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)))))

(declare-fun lt!87263 () (_ BitVec 64))

(assert (=> b!176623 (= lt!87263 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87270 () (_ BitVec 64))

(assert (=> b!176623 (= lt!87270 (select (arr!3502 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87260 () Unit!5383)

(declare-fun addApplyDifferent!114 (ListLongMap!2191 (_ BitVec 64) V!5153 (_ BitVec 64)) Unit!5383)

(assert (=> b!176623 (= lt!87260 (addApplyDifferent!114 lt!87267 lt!87263 (minValue!3477 thiss!1248) lt!87270))))

(assert (=> b!176623 (= (apply!138 (+!250 lt!87267 (tuple2!3273 lt!87263 (minValue!3477 thiss!1248))) lt!87270) (apply!138 lt!87267 lt!87270))))

(declare-fun lt!87266 () Unit!5383)

(assert (=> b!176623 (= lt!87266 lt!87260)))

(declare-fun lt!87271 () ListLongMap!2191)

(assert (=> b!176623 (= lt!87271 (getCurrentListMapNoExtraKeys!159 (_keys!5498 thiss!1248) (_values!3619 thiss!1248) (mask!8557 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)))))

(declare-fun lt!87277 () (_ BitVec 64))

(assert (=> b!176623 (= lt!87277 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87269 () (_ BitVec 64))

(assert (=> b!176623 (= lt!87269 (select (arr!3502 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87268 () Unit!5383)

(assert (=> b!176623 (= lt!87268 (addApplyDifferent!114 lt!87271 lt!87277 (zeroValue!3477 thiss!1248) lt!87269))))

(assert (=> b!176623 (= (apply!138 (+!250 lt!87271 (tuple2!3273 lt!87277 (zeroValue!3477 thiss!1248))) lt!87269) (apply!138 lt!87271 lt!87269))))

(declare-fun lt!87280 () Unit!5383)

(assert (=> b!176623 (= lt!87280 lt!87268)))

(declare-fun lt!87274 () ListLongMap!2191)

(assert (=> b!176623 (= lt!87274 (getCurrentListMapNoExtraKeys!159 (_keys!5498 thiss!1248) (_values!3619 thiss!1248) (mask!8557 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)))))

(declare-fun lt!87281 () (_ BitVec 64))

(assert (=> b!176623 (= lt!87281 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87278 () (_ BitVec 64))

(assert (=> b!176623 (= lt!87278 (select (arr!3502 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176623 (= lt!87265 (addApplyDifferent!114 lt!87274 lt!87281 (minValue!3477 thiss!1248) lt!87278))))

(assert (=> b!176623 (= (apply!138 (+!250 lt!87274 (tuple2!3273 lt!87281 (minValue!3477 thiss!1248))) lt!87278) (apply!138 lt!87274 lt!87278))))

(declare-fun b!176624 () Bool)

(assert (=> b!176624 (= e!116500 e!116496)))

(declare-fun res!83673 () Bool)

(assert (=> b!176624 (= res!83673 call!17863)))

(assert (=> b!176624 (=> (not res!83673) (not e!116496))))

(declare-fun d!53553 () Bool)

(assert (=> d!53553 e!116493))

(declare-fun res!83678 () Bool)

(assert (=> d!53553 (=> (not res!83678) (not e!116493))))

(assert (=> d!53553 (= res!83678 (or (bvsge #b00000000000000000000000000000000 (size!3807 (_keys!5498 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3807 (_keys!5498 thiss!1248))))))))

(declare-fun lt!87275 () ListLongMap!2191)

(assert (=> d!53553 (= lt!87276 lt!87275)))

(declare-fun lt!87262 () Unit!5383)

(assert (=> d!53553 (= lt!87262 e!116502)))

(declare-fun c!31664 () Bool)

(assert (=> d!53553 (= c!31664 e!116499)))

(declare-fun res!83677 () Bool)

(assert (=> d!53553 (=> (not res!83677) (not e!116499))))

(assert (=> d!53553 (= res!83677 (bvslt #b00000000000000000000000000000000 (size!3807 (_keys!5498 thiss!1248))))))

(assert (=> d!53553 (= lt!87275 e!116495)))

(declare-fun c!31666 () Bool)

(assert (=> d!53553 (= c!31666 (and (not (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53553 (validMask!0 (mask!8557 thiss!1248))))

(assert (=> d!53553 (= (getCurrentListMap!747 (_keys!5498 thiss!1248) (_values!3619 thiss!1248) (mask!8557 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)) lt!87276)))

(declare-fun bm!17862 () Bool)

(declare-fun call!17867 () ListLongMap!2191)

(assert (=> bm!17862 (= call!17865 call!17867)))

(declare-fun c!31663 () Bool)

(declare-fun bm!17865 () Bool)

(assert (=> bm!17865 (= call!17866 (+!250 (ite c!31666 call!17868 (ite c!31663 call!17867 call!17865)) (ite (or c!31666 c!31663) (tuple2!3273 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3477 thiss!1248)) (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3477 thiss!1248)))))))

(declare-fun b!176625 () Bool)

(assert (=> b!176625 (= e!116498 call!17869)))

(declare-fun b!176626 () Bool)

(declare-fun res!83671 () Bool)

(assert (=> b!176626 (=> (not res!83671) (not e!116493))))

(assert (=> b!176626 (= res!83671 e!116501)))

(declare-fun c!31667 () Bool)

(assert (=> b!176626 (= c!31667 (not (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!176627 () Bool)

(assert (=> b!176627 (= e!116490 (validKeyInArray!0 (select (arr!3502 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176628 () Bool)

(assert (=> b!176628 (= e!116500 (not call!17863))))

(declare-fun bm!17866 () Bool)

(assert (=> bm!17866 (= call!17867 call!17868)))

(declare-fun b!176629 () Bool)

(assert (=> b!176629 (= e!116492 e!116491)))

(declare-fun res!83674 () Bool)

(assert (=> b!176629 (=> (not res!83674) (not e!116491))))

(assert (=> b!176629 (= res!83674 (contains!1180 lt!87276 (select (arr!3502 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176629 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3807 (_keys!5498 thiss!1248))))))

(declare-fun b!176630 () Bool)

(assert (=> b!176630 (= e!116501 e!116497)))

(declare-fun res!83672 () Bool)

(assert (=> b!176630 (= res!83672 call!17864)))

(assert (=> b!176630 (=> (not res!83672) (not e!116497))))

(declare-fun b!176631 () Bool)

(assert (=> b!176631 (= e!116495 e!116498)))

(assert (=> b!176631 (= c!31663 (and (not (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!53553 c!31666) b!176621))

(assert (= (and d!53553 (not c!31666)) b!176631))

(assert (= (and b!176631 c!31663) b!176625))

(assert (= (and b!176631 (not c!31663)) b!176613))

(assert (= (and b!176613 c!31665) b!176620))

(assert (= (and b!176613 (not c!31665)) b!176614))

(assert (= (or b!176620 b!176614) bm!17862))

(assert (= (or b!176625 bm!17862) bm!17866))

(assert (= (or b!176625 b!176620) bm!17861))

(assert (= (or b!176621 bm!17866) bm!17860))

(assert (= (or b!176621 bm!17861) bm!17865))

(assert (= (and d!53553 res!83677) b!176622))

(assert (= (and d!53553 c!31664) b!176623))

(assert (= (and d!53553 (not c!31664)) b!176611))

(assert (= (and d!53553 res!83678) b!176619))

(assert (= (and b!176619 res!83675) b!176627))

(assert (= (and b!176619 (not res!83679)) b!176629))

(assert (= (and b!176629 res!83674) b!176618))

(assert (= (and b!176619 res!83676) b!176626))

(assert (= (and b!176626 c!31667) b!176630))

(assert (= (and b!176626 (not c!31667)) b!176617))

(assert (= (and b!176630 res!83672) b!176612))

(assert (= (or b!176630 b!176617) bm!17863))

(assert (= (and b!176626 res!83671) b!176615))

(assert (= (and b!176615 c!31662) b!176624))

(assert (= (and b!176615 (not c!31662)) b!176628))

(assert (= (and b!176624 res!83673) b!176616))

(assert (= (or b!176624 b!176628) bm!17864))

(declare-fun b_lambda!7025 () Bool)

(assert (=> (not b_lambda!7025) (not b!176618)))

(declare-fun t!7063 () Bool)

(declare-fun tb!2779 () Bool)

(assert (=> (and b!176450 (= (defaultEntry!3636 thiss!1248) (defaultEntry!3636 thiss!1248)) t!7063) tb!2779))

(declare-fun result!4627 () Bool)

(assert (=> tb!2779 (= result!4627 tp_is_empty!4129)))

(assert (=> b!176618 t!7063))

(declare-fun b_and!10833 () Bool)

(assert (= b_and!10827 (and (=> t!7063 result!4627) b_and!10833)))

(declare-fun m!204837 () Bool)

(assert (=> b!176623 m!204837))

(declare-fun m!204839 () Bool)

(assert (=> b!176623 m!204839))

(declare-fun m!204841 () Bool)

(assert (=> b!176623 m!204841))

(declare-fun m!204843 () Bool)

(assert (=> b!176623 m!204843))

(declare-fun m!204845 () Bool)

(assert (=> b!176623 m!204845))

(declare-fun m!204847 () Bool)

(assert (=> b!176623 m!204847))

(declare-fun m!204849 () Bool)

(assert (=> b!176623 m!204849))

(declare-fun m!204851 () Bool)

(assert (=> b!176623 m!204851))

(declare-fun m!204853 () Bool)

(assert (=> b!176623 m!204853))

(assert (=> b!176623 m!204841))

(declare-fun m!204855 () Bool)

(assert (=> b!176623 m!204855))

(assert (=> b!176623 m!204803))

(declare-fun m!204857 () Bool)

(assert (=> b!176623 m!204857))

(assert (=> b!176623 m!204847))

(declare-fun m!204859 () Bool)

(assert (=> b!176623 m!204859))

(assert (=> b!176623 m!204843))

(declare-fun m!204861 () Bool)

(assert (=> b!176623 m!204861))

(declare-fun m!204863 () Bool)

(assert (=> b!176623 m!204863))

(declare-fun m!204865 () Bool)

(assert (=> b!176623 m!204865))

(assert (=> b!176623 m!204837))

(declare-fun m!204867 () Bool)

(assert (=> b!176623 m!204867))

(assert (=> b!176622 m!204803))

(assert (=> b!176622 m!204803))

(assert (=> b!176622 m!204805))

(declare-fun m!204869 () Bool)

(assert (=> b!176616 m!204869))

(assert (=> b!176627 m!204803))

(assert (=> b!176627 m!204803))

(assert (=> b!176627 m!204805))

(assert (=> d!53553 m!204743))

(declare-fun m!204871 () Bool)

(assert (=> b!176621 m!204871))

(declare-fun m!204873 () Bool)

(assert (=> bm!17865 m!204873))

(declare-fun m!204875 () Bool)

(assert (=> bm!17863 m!204875))

(assert (=> b!176629 m!204803))

(assert (=> b!176629 m!204803))

(declare-fun m!204877 () Bool)

(assert (=> b!176629 m!204877))

(declare-fun m!204879 () Bool)

(assert (=> b!176612 m!204879))

(declare-fun m!204881 () Bool)

(assert (=> bm!17864 m!204881))

(declare-fun m!204883 () Bool)

(assert (=> b!176618 m!204883))

(assert (=> b!176618 m!204803))

(declare-fun m!204885 () Bool)

(assert (=> b!176618 m!204885))

(declare-fun m!204887 () Bool)

(assert (=> b!176618 m!204887))

(assert (=> b!176618 m!204883))

(declare-fun m!204889 () Bool)

(assert (=> b!176618 m!204889))

(assert (=> b!176618 m!204887))

(assert (=> b!176618 m!204803))

(assert (=> bm!17860 m!204863))

(assert (=> b!176451 d!53553))

(declare-fun b!176642 () Bool)

(declare-fun e!116511 () Bool)

(declare-fun call!17872 () Bool)

(assert (=> b!176642 (= e!116511 call!17872)))

(declare-fun d!53555 () Bool)

(declare-fun res!83684 () Bool)

(declare-fun e!116509 () Bool)

(assert (=> d!53555 (=> res!83684 e!116509)))

(assert (=> d!53555 (= res!83684 (bvsge #b00000000000000000000000000000000 (size!3807 (_keys!5498 thiss!1248))))))

(assert (=> d!53555 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5498 thiss!1248) (mask!8557 thiss!1248)) e!116509)))

(declare-fun b!176643 () Bool)

(declare-fun e!116510 () Bool)

(assert (=> b!176643 (= e!116511 e!116510)))

(declare-fun lt!87289 () (_ BitVec 64))

(assert (=> b!176643 (= lt!87289 (select (arr!3502 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87290 () Unit!5383)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7385 (_ BitVec 64) (_ BitVec 32)) Unit!5383)

(assert (=> b!176643 (= lt!87290 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5498 thiss!1248) lt!87289 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!176643 (arrayContainsKey!0 (_keys!5498 thiss!1248) lt!87289 #b00000000000000000000000000000000)))

(declare-fun lt!87288 () Unit!5383)

(assert (=> b!176643 (= lt!87288 lt!87290)))

(declare-fun res!83685 () Bool)

(assert (=> b!176643 (= res!83685 (= (seekEntryOrOpen!0 (select (arr!3502 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000) (_keys!5498 thiss!1248) (mask!8557 thiss!1248)) (Found!568 #b00000000000000000000000000000000)))))

(assert (=> b!176643 (=> (not res!83685) (not e!116510))))

(declare-fun b!176644 () Bool)

(assert (=> b!176644 (= e!116510 call!17872)))

(declare-fun b!176645 () Bool)

(assert (=> b!176645 (= e!116509 e!116511)))

(declare-fun c!31670 () Bool)

(assert (=> b!176645 (= c!31670 (validKeyInArray!0 (select (arr!3502 (_keys!5498 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17869 () Bool)

(assert (=> bm!17869 (= call!17872 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5498 thiss!1248) (mask!8557 thiss!1248)))))

(assert (= (and d!53555 (not res!83684)) b!176645))

(assert (= (and b!176645 c!31670) b!176643))

(assert (= (and b!176645 (not c!31670)) b!176642))

(assert (= (and b!176643 res!83685) b!176644))

(assert (= (or b!176644 b!176642) bm!17869))

(assert (=> b!176643 m!204803))

(declare-fun m!204891 () Bool)

(assert (=> b!176643 m!204891))

(declare-fun m!204893 () Bool)

(assert (=> b!176643 m!204893))

(assert (=> b!176643 m!204803))

(declare-fun m!204895 () Bool)

(assert (=> b!176643 m!204895))

(assert (=> b!176645 m!204803))

(assert (=> b!176645 m!204803))

(assert (=> b!176645 m!204805))

(declare-fun m!204897 () Bool)

(assert (=> bm!17869 m!204897))

(assert (=> b!176443 d!53555))

(declare-fun mapNonEmpty!7059 () Bool)

(declare-fun mapRes!7059 () Bool)

(declare-fun tp!15780 () Bool)

(declare-fun e!116517 () Bool)

(assert (=> mapNonEmpty!7059 (= mapRes!7059 (and tp!15780 e!116517))))

(declare-fun mapRest!7059 () (Array (_ BitVec 32) ValueCell!1721))

(declare-fun mapValue!7059 () ValueCell!1721)

(declare-fun mapKey!7059 () (_ BitVec 32))

(assert (=> mapNonEmpty!7059 (= mapRest!7050 (store mapRest!7059 mapKey!7059 mapValue!7059))))

(declare-fun b!176652 () Bool)

(assert (=> b!176652 (= e!116517 tp_is_empty!4129)))

(declare-fun mapIsEmpty!7059 () Bool)

(assert (=> mapIsEmpty!7059 mapRes!7059))

(declare-fun condMapEmpty!7059 () Bool)

(declare-fun mapDefault!7059 () ValueCell!1721)

(assert (=> mapNonEmpty!7050 (= condMapEmpty!7059 (= mapRest!7050 ((as const (Array (_ BitVec 32) ValueCell!1721)) mapDefault!7059)))))

(declare-fun e!116516 () Bool)

(assert (=> mapNonEmpty!7050 (= tp!15764 (and e!116516 mapRes!7059))))

(declare-fun b!176653 () Bool)

(assert (=> b!176653 (= e!116516 tp_is_empty!4129)))

(assert (= (and mapNonEmpty!7050 condMapEmpty!7059) mapIsEmpty!7059))

(assert (= (and mapNonEmpty!7050 (not condMapEmpty!7059)) mapNonEmpty!7059))

(assert (= (and mapNonEmpty!7059 ((_ is ValueCellFull!1721) mapValue!7059)) b!176652))

(assert (= (and mapNonEmpty!7050 ((_ is ValueCellFull!1721) mapDefault!7059)) b!176653))

(declare-fun m!204899 () Bool)

(assert (=> mapNonEmpty!7059 m!204899))

(declare-fun b_lambda!7027 () Bool)

(assert (= b_lambda!7025 (or (and b!176450 b_free!4357) b_lambda!7027)))

(check-sat (not b!176531) (not b!176566) (not d!53541) (not b!176627) (not d!53553) (not mapNonEmpty!7059) (not b!176645) (not b!176541) (not b_next!4357) (not b!176556) (not b!176618) (not b_lambda!7027) (not d!53543) (not bm!17865) (not d!53551) b_and!10833 (not bm!17864) (not b!176612) (not b!176540) (not b!176621) (not b!176530) (not b!176623) (not b!176616) (not bm!17860) (not bm!17863) (not b!176529) (not b!176643) (not b!176622) (not b!176629) (not b!176539) (not bm!17869) (not b!176568) (not bm!17845) tp_is_empty!4129)
(check-sat b_and!10833 (not b_next!4357))
