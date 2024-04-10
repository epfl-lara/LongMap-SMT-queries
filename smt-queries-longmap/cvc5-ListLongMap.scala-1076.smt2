; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22138 () Bool)

(assert start!22138)

(declare-fun b!230833 () Bool)

(declare-fun b_free!6205 () Bool)

(declare-fun b_next!6205 () Bool)

(assert (=> b!230833 (= b_free!6205 (not b_next!6205))))

(declare-fun tp!21756 () Bool)

(declare-fun b_and!13103 () Bool)

(assert (=> b!230833 (= tp!21756 b_and!13103)))

(declare-fun mapIsEmpty!10270 () Bool)

(declare-fun mapRes!10270 () Bool)

(assert (=> mapIsEmpty!10270 mapRes!10270))

(declare-fun b!230820 () Bool)

(declare-fun e!149822 () Bool)

(declare-datatypes ((SeekEntryResult!942 0))(
  ( (MissingZero!942 (index!5938 (_ BitVec 32))) (Found!942 (index!5939 (_ BitVec 32))) (Intermediate!942 (undefined!1754 Bool) (index!5940 (_ BitVec 32)) (x!23466 (_ BitVec 32))) (Undefined!942) (MissingVacant!942 (index!5941 (_ BitVec 32))) )
))
(declare-fun lt!116246 () SeekEntryResult!942)

(assert (=> b!230820 (= e!149822 (is-Undefined!942 lt!116246))))

(declare-fun b!230821 () Bool)

(declare-fun res!113490 () Bool)

(declare-fun e!149821 () Bool)

(assert (=> b!230821 (=> (not res!113490) (not e!149821))))

(declare-fun call!21450 () Bool)

(assert (=> b!230821 (= res!113490 call!21450)))

(declare-fun e!149818 () Bool)

(assert (=> b!230821 (= e!149818 e!149821)))

(declare-fun bm!21446 () Bool)

(declare-fun call!21449 () Bool)

(declare-datatypes ((V!7737 0))(
  ( (V!7738 (val!3078 Int)) )
))
(declare-datatypes ((ValueCell!2690 0))(
  ( (ValueCellFull!2690 (v!5098 V!7737)) (EmptyCell!2690) )
))
(declare-datatypes ((array!11377 0))(
  ( (array!11378 (arr!5408 (Array (_ BitVec 32) ValueCell!2690)) (size!5741 (_ BitVec 32))) )
))
(declare-datatypes ((array!11379 0))(
  ( (array!11380 (arr!5409 (Array (_ BitVec 32) (_ BitVec 64))) (size!5742 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3280 0))(
  ( (LongMapFixedSize!3281 (defaultEntry!4299 Int) (mask!10195 (_ BitVec 32)) (extraKeys!4036 (_ BitVec 32)) (zeroValue!4140 V!7737) (minValue!4140 V!7737) (_size!1689 (_ BitVec 32)) (_keys!6353 array!11379) (_values!4282 array!11377) (_vacant!1689 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3280)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21446 (= call!21449 (arrayContainsKey!0 (_keys!6353 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230822 () Bool)

(declare-fun res!113495 () Bool)

(assert (=> b!230822 (=> (not res!113495) (not e!149821))))

(assert (=> b!230822 (= res!113495 (= (select (arr!5409 (_keys!6353 thiss!1504)) (index!5938 lt!116246)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!230823 () Bool)

(assert (=> b!230823 (= e!149821 (not call!21449))))

(declare-fun b!230824 () Bool)

(declare-datatypes ((Unit!7076 0))(
  ( (Unit!7077) )
))
(declare-fun e!149813 () Unit!7076)

(declare-fun Unit!7078 () Unit!7076)

(assert (=> b!230824 (= e!149813 Unit!7078)))

(declare-fun lt!116241 () Unit!7076)

(declare-fun lemmaArrayContainsKeyThenInListMap!128 (array!11379 array!11377 (_ BitVec 32) (_ BitVec 32) V!7737 V!7737 (_ BitVec 64) (_ BitVec 32) Int) Unit!7076)

(assert (=> b!230824 (= lt!116241 (lemmaArrayContainsKeyThenInListMap!128 (_keys!6353 thiss!1504) (_values!4282 thiss!1504) (mask!10195 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4299 thiss!1504)))))

(assert (=> b!230824 false))

(declare-fun b!230825 () Bool)

(declare-fun Unit!7079 () Unit!7076)

(assert (=> b!230825 (= e!149813 Unit!7079)))

(declare-fun b!230826 () Bool)

(declare-fun e!149815 () Unit!7076)

(declare-fun lt!116243 () Unit!7076)

(assert (=> b!230826 (= e!149815 lt!116243)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!311 (array!11379 array!11377 (_ BitVec 32) (_ BitVec 32) V!7737 V!7737 (_ BitVec 64) Int) Unit!7076)

(assert (=> b!230826 (= lt!116243 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!311 (_keys!6353 thiss!1504) (_values!4282 thiss!1504) (mask!10195 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) key!932 (defaultEntry!4299 thiss!1504)))))

(declare-fun c!38327 () Bool)

(assert (=> b!230826 (= c!38327 (is-MissingZero!942 lt!116246))))

(assert (=> b!230826 e!149818))

(declare-fun b!230827 () Bool)

(declare-fun Unit!7080 () Unit!7076)

(assert (=> b!230827 (= e!149815 Unit!7080)))

(declare-fun lt!116244 () Unit!7076)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!293 (array!11379 array!11377 (_ BitVec 32) (_ BitVec 32) V!7737 V!7737 (_ BitVec 64) Int) Unit!7076)

(assert (=> b!230827 (= lt!116244 (lemmaInListMapThenSeekEntryOrOpenFindsIt!293 (_keys!6353 thiss!1504) (_values!4282 thiss!1504) (mask!10195 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) key!932 (defaultEntry!4299 thiss!1504)))))

(assert (=> b!230827 false))

(declare-fun b!230828 () Bool)

(declare-fun e!149814 () Bool)

(declare-fun e!149809 () Bool)

(assert (=> b!230828 (= e!149814 e!149809)))

(declare-fun res!113493 () Bool)

(assert (=> b!230828 (=> (not res!113493) (not e!149809))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!230828 (= res!113493 (or (= lt!116246 (MissingZero!942 index!297)) (= lt!116246 (MissingVacant!942 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11379 (_ BitVec 32)) SeekEntryResult!942)

(assert (=> b!230828 (= lt!116246 (seekEntryOrOpen!0 key!932 (_keys!6353 thiss!1504) (mask!10195 thiss!1504)))))

(declare-fun b!230829 () Bool)

(declare-fun e!149810 () Bool)

(assert (=> b!230829 (= e!149809 e!149810)))

(declare-fun res!113497 () Bool)

(assert (=> b!230829 (=> (not res!113497) (not e!149810))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230829 (= res!113497 (inRange!0 index!297 (mask!10195 thiss!1504)))))

(declare-fun lt!116239 () Unit!7076)

(assert (=> b!230829 (= lt!116239 e!149815)))

(declare-fun c!38326 () Bool)

(declare-datatypes ((tuple2!4540 0))(
  ( (tuple2!4541 (_1!2281 (_ BitVec 64)) (_2!2281 V!7737)) )
))
(declare-datatypes ((List!3462 0))(
  ( (Nil!3459) (Cons!3458 (h!4106 tuple2!4540) (t!8421 List!3462)) )
))
(declare-datatypes ((ListLongMap!3453 0))(
  ( (ListLongMap!3454 (toList!1742 List!3462)) )
))
(declare-fun lt!116236 () ListLongMap!3453)

(declare-fun contains!1614 (ListLongMap!3453 (_ BitVec 64)) Bool)

(assert (=> b!230829 (= c!38326 (contains!1614 lt!116236 key!932))))

(declare-fun getCurrentListMap!1270 (array!11379 array!11377 (_ BitVec 32) (_ BitVec 32) V!7737 V!7737 (_ BitVec 32) Int) ListLongMap!3453)

(assert (=> b!230829 (= lt!116236 (getCurrentListMap!1270 (_keys!6353 thiss!1504) (_values!4282 thiss!1504) (mask!10195 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4299 thiss!1504)))))

(declare-fun b!230830 () Bool)

(declare-fun e!149820 () Bool)

(assert (=> b!230830 (= e!149822 e!149820)))

(declare-fun res!113494 () Bool)

(assert (=> b!230830 (= res!113494 call!21450)))

(assert (=> b!230830 (=> (not res!113494) (not e!149820))))

(declare-fun b!230831 () Bool)

(declare-fun res!113492 () Bool)

(assert (=> b!230831 (= res!113492 (= (select (arr!5409 (_keys!6353 thiss!1504)) (index!5941 lt!116246)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!230831 (=> (not res!113492) (not e!149820))))

(declare-fun b!230832 () Bool)

(declare-fun c!38328 () Bool)

(assert (=> b!230832 (= c!38328 (is-MissingVacant!942 lt!116246))))

(assert (=> b!230832 (= e!149818 e!149822)))

(declare-fun bm!21447 () Bool)

(assert (=> bm!21447 (= call!21450 (inRange!0 (ite c!38327 (index!5938 lt!116246) (index!5941 lt!116246)) (mask!10195 thiss!1504)))))

(declare-fun b!230834 () Bool)

(assert (=> b!230834 (= e!149820 (not call!21449))))

(declare-fun b!230835 () Bool)

(declare-fun e!149817 () Bool)

(declare-fun e!149812 () Bool)

(assert (=> b!230835 (= e!149817 (and e!149812 mapRes!10270))))

(declare-fun condMapEmpty!10270 () Bool)

(declare-fun mapDefault!10270 () ValueCell!2690)

