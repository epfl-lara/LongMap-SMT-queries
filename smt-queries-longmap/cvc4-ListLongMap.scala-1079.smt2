; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22160 () Bool)

(assert start!22160)

(declare-fun b!231497 () Bool)

(declare-fun b_free!6227 () Bool)

(declare-fun b_next!6227 () Bool)

(assert (=> b!231497 (= b_free!6227 (not b_next!6227))))

(declare-fun tp!21822 () Bool)

(declare-fun b_and!13125 () Bool)

(assert (=> b!231497 (= tp!21822 b_and!13125)))

(declare-fun b!231480 () Bool)

(declare-fun e!150274 () Bool)

(assert (=> b!231480 (= e!150274 (not true))))

(declare-datatypes ((array!11421 0))(
  ( (array!11422 (arr!5430 (Array (_ BitVec 32) (_ BitVec 64))) (size!5763 (_ BitVec 32))) )
))
(declare-fun lt!116696 () array!11421)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!11421 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231480 (= (arrayCountValidKeys!0 lt!116696 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-datatypes ((Unit!7124 0))(
  ( (Unit!7125) )
))
(declare-fun lt!116697 () Unit!7124)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11421 (_ BitVec 32)) Unit!7124)

(assert (=> b!231480 (= lt!116697 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116696 index!297))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231480 (arrayContainsKey!0 lt!116696 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116702 () Unit!7124)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11421 (_ BitVec 64) (_ BitVec 32)) Unit!7124)

(assert (=> b!231480 (= lt!116702 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116696 key!932 index!297))))

(declare-datatypes ((V!7765 0))(
  ( (V!7766 (val!3089 Int)) )
))
(declare-datatypes ((ValueCell!2701 0))(
  ( (ValueCellFull!2701 (v!5109 V!7765)) (EmptyCell!2701) )
))
(declare-datatypes ((array!11423 0))(
  ( (array!11424 (arr!5431 (Array (_ BitVec 32) ValueCell!2701)) (size!5764 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3302 0))(
  ( (LongMapFixedSize!3303 (defaultEntry!4310 Int) (mask!10212 (_ BitVec 32)) (extraKeys!4047 (_ BitVec 32)) (zeroValue!4151 V!7765) (minValue!4151 V!7765) (_size!1700 (_ BitVec 32)) (_keys!6364 array!11421) (_values!4293 array!11423) (_vacant!1700 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3302)

(declare-fun v!346 () V!7765)

(declare-datatypes ((tuple2!4560 0))(
  ( (tuple2!4561 (_1!2291 (_ BitVec 64)) (_2!2291 V!7765)) )
))
(declare-datatypes ((List!3479 0))(
  ( (Nil!3476) (Cons!3475 (h!4123 tuple2!4560) (t!8438 List!3479)) )
))
(declare-datatypes ((ListLongMap!3473 0))(
  ( (ListLongMap!3474 (toList!1752 List!3479)) )
))
(declare-fun lt!116705 () ListLongMap!3473)

(declare-fun +!616 (ListLongMap!3473 tuple2!4560) ListLongMap!3473)

(declare-fun getCurrentListMap!1280 (array!11421 array!11423 (_ BitVec 32) (_ BitVec 32) V!7765 V!7765 (_ BitVec 32) Int) ListLongMap!3473)

(assert (=> b!231480 (= (+!616 lt!116705 (tuple2!4561 key!932 v!346)) (getCurrentListMap!1280 lt!116696 (array!11424 (store (arr!5431 (_values!4293 thiss!1504)) index!297 (ValueCellFull!2701 v!346)) (size!5764 (_values!4293 thiss!1504))) (mask!10212 thiss!1504) (extraKeys!4047 thiss!1504) (zeroValue!4151 thiss!1504) (minValue!4151 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4310 thiss!1504)))))

(declare-fun lt!116708 () Unit!7124)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!70 (array!11421 array!11423 (_ BitVec 32) (_ BitVec 32) V!7765 V!7765 (_ BitVec 32) (_ BitVec 64) V!7765 Int) Unit!7124)

(assert (=> b!231480 (= lt!116708 (lemmaAddValidKeyToArrayThenAddPairToListMap!70 (_keys!6364 thiss!1504) (_values!4293 thiss!1504) (mask!10212 thiss!1504) (extraKeys!4047 thiss!1504) (zeroValue!4151 thiss!1504) (minValue!4151 thiss!1504) index!297 key!932 v!346 (defaultEntry!4310 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11421 (_ BitVec 32)) Bool)

(assert (=> b!231480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116696 (mask!10212 thiss!1504))))

(declare-fun lt!116695 () Unit!7124)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11421 (_ BitVec 32) (_ BitVec 32)) Unit!7124)

(assert (=> b!231480 (= lt!116695 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6364 thiss!1504) index!297 (mask!10212 thiss!1504)))))

(assert (=> b!231480 (= (arrayCountValidKeys!0 lt!116696 #b00000000000000000000000000000000 (size!5763 (_keys!6364 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6364 thiss!1504) #b00000000000000000000000000000000 (size!5763 (_keys!6364 thiss!1504)))))))

(declare-fun lt!116698 () Unit!7124)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11421 (_ BitVec 32) (_ BitVec 64)) Unit!7124)

(assert (=> b!231480 (= lt!116698 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6364 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3480 0))(
  ( (Nil!3477) (Cons!3476 (h!4124 (_ BitVec 64)) (t!8439 List!3480)) )
))
(declare-fun arrayNoDuplicates!0 (array!11421 (_ BitVec 32) List!3480) Bool)

(assert (=> b!231480 (arrayNoDuplicates!0 lt!116696 #b00000000000000000000000000000000 Nil!3477)))

(assert (=> b!231480 (= lt!116696 (array!11422 (store (arr!5430 (_keys!6364 thiss!1504)) index!297 key!932) (size!5763 (_keys!6364 thiss!1504))))))

(declare-fun lt!116706 () Unit!7124)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11421 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3480) Unit!7124)

(assert (=> b!231480 (= lt!116706 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6364 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3477))))

(declare-fun lt!116699 () Unit!7124)

(declare-fun e!150272 () Unit!7124)

(assert (=> b!231480 (= lt!116699 e!150272)))

(declare-fun c!38460 () Bool)

(assert (=> b!231480 (= c!38460 (arrayContainsKey!0 (_keys!6364 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231481 () Bool)

(declare-fun e!150283 () Bool)

(declare-fun call!21515 () Bool)

(assert (=> b!231481 (= e!150283 (not call!21515))))

(declare-fun b!231482 () Bool)

(declare-fun e!150282 () Bool)

(declare-fun e!150275 () Bool)

(declare-fun mapRes!10303 () Bool)

(assert (=> b!231482 (= e!150282 (and e!150275 mapRes!10303))))

(declare-fun condMapEmpty!10303 () Bool)

(declare-fun mapDefault!10303 () ValueCell!2701)

