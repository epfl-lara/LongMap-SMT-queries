; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22106 () Bool)

(assert start!22106)

(declare-fun b!229862 () Bool)

(declare-fun b_free!6173 () Bool)

(declare-fun b_next!6173 () Bool)

(assert (=> b!229862 (= b_free!6173 (not b_next!6173))))

(declare-fun tp!21660 () Bool)

(declare-fun b_and!13071 () Bool)

(assert (=> b!229862 (= tp!21660 b_and!13071)))

(declare-fun b!229860 () Bool)

(declare-fun e!149147 () Bool)

(declare-fun call!21354 () Bool)

(assert (=> b!229860 (= e!149147 (not call!21354))))

(declare-fun b!229861 () Bool)

(declare-fun c!38136 () Bool)

(declare-datatypes ((SeekEntryResult!928 0))(
  ( (MissingZero!928 (index!5882 (_ BitVec 32))) (Found!928 (index!5883 (_ BitVec 32))) (Intermediate!928 (undefined!1740 Bool) (index!5884 (_ BitVec 32)) (x!23404 (_ BitVec 32))) (Undefined!928) (MissingVacant!928 (index!5885 (_ BitVec 32))) )
))
(declare-fun lt!115630 () SeekEntryResult!928)

(assert (=> b!229861 (= c!38136 (is-MissingVacant!928 lt!115630))))

(declare-fun e!149141 () Bool)

(declare-fun e!149149 () Bool)

(assert (=> b!229861 (= e!149141 e!149149)))

(declare-fun call!21353 () Bool)

(declare-fun c!38135 () Bool)

(declare-datatypes ((V!7693 0))(
  ( (V!7694 (val!3062 Int)) )
))
(declare-datatypes ((ValueCell!2674 0))(
  ( (ValueCellFull!2674 (v!5082 V!7693)) (EmptyCell!2674) )
))
(declare-datatypes ((array!11313 0))(
  ( (array!11314 (arr!5376 (Array (_ BitVec 32) ValueCell!2674)) (size!5709 (_ BitVec 32))) )
))
(declare-datatypes ((array!11315 0))(
  ( (array!11316 (arr!5377 (Array (_ BitVec 32) (_ BitVec 64))) (size!5710 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3248 0))(
  ( (LongMapFixedSize!3249 (defaultEntry!4283 Int) (mask!10167 (_ BitVec 32)) (extraKeys!4020 (_ BitVec 32)) (zeroValue!4124 V!7693) (minValue!4124 V!7693) (_size!1673 (_ BitVec 32)) (_keys!6337 array!11315) (_values!4266 array!11313) (_vacant!1673 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3248)

(declare-fun bm!21350 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21350 (= call!21353 (inRange!0 (ite c!38135 (index!5882 lt!115630) (index!5885 lt!115630)) (mask!10167 thiss!1504)))))

(declare-fun e!149143 () Bool)

(declare-fun e!149150 () Bool)

(declare-fun tp_is_empty!6035 () Bool)

(declare-fun array_inv!3547 (array!11315) Bool)

(declare-fun array_inv!3548 (array!11313) Bool)

(assert (=> b!229862 (= e!149150 (and tp!21660 tp_is_empty!6035 (array_inv!3547 (_keys!6337 thiss!1504)) (array_inv!3548 (_values!4266 thiss!1504)) e!149143))))

(declare-fun b!229863 () Bool)

(declare-fun e!149148 () Bool)

(assert (=> b!229863 (= e!149148 (not true))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun v!346 () V!7693)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4516 0))(
  ( (tuple2!4517 (_1!2269 (_ BitVec 64)) (_2!2269 V!7693)) )
))
(declare-datatypes ((List!3440 0))(
  ( (Nil!3437) (Cons!3436 (h!4084 tuple2!4516) (t!8399 List!3440)) )
))
(declare-datatypes ((ListLongMap!3429 0))(
  ( (ListLongMap!3430 (toList!1730 List!3440)) )
))
(declare-fun lt!115629 () ListLongMap!3429)

(declare-fun lt!115628 () array!11315)

(declare-fun +!599 (ListLongMap!3429 tuple2!4516) ListLongMap!3429)

(declare-fun getCurrentListMap!1258 (array!11315 array!11313 (_ BitVec 32) (_ BitVec 32) V!7693 V!7693 (_ BitVec 32) Int) ListLongMap!3429)

(assert (=> b!229863 (= (+!599 lt!115629 (tuple2!4517 key!932 v!346)) (getCurrentListMap!1258 lt!115628 (array!11314 (store (arr!5376 (_values!4266 thiss!1504)) index!297 (ValueCellFull!2674 v!346)) (size!5709 (_values!4266 thiss!1504))) (mask!10167 thiss!1504) (extraKeys!4020 thiss!1504) (zeroValue!4124 thiss!1504) (minValue!4124 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4283 thiss!1504)))))

(declare-datatypes ((Unit!7021 0))(
  ( (Unit!7022) )
))
(declare-fun lt!115637 () Unit!7021)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!53 (array!11315 array!11313 (_ BitVec 32) (_ BitVec 32) V!7693 V!7693 (_ BitVec 32) (_ BitVec 64) V!7693 Int) Unit!7021)

(assert (=> b!229863 (= lt!115637 (lemmaAddValidKeyToArrayThenAddPairToListMap!53 (_keys!6337 thiss!1504) (_values!4266 thiss!1504) (mask!10167 thiss!1504) (extraKeys!4020 thiss!1504) (zeroValue!4124 thiss!1504) (minValue!4124 thiss!1504) index!297 key!932 v!346 (defaultEntry!4283 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11315 (_ BitVec 32)) Bool)

(assert (=> b!229863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115628 (mask!10167 thiss!1504))))

(declare-fun lt!115635 () Unit!7021)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11315 (_ BitVec 32) (_ BitVec 32)) Unit!7021)

(assert (=> b!229863 (= lt!115635 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6337 thiss!1504) index!297 (mask!10167 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11315 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229863 (= (arrayCountValidKeys!0 lt!115628 #b00000000000000000000000000000000 (size!5710 (_keys!6337 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6337 thiss!1504) #b00000000000000000000000000000000 (size!5710 (_keys!6337 thiss!1504)))))))

(declare-fun lt!115631 () Unit!7021)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11315 (_ BitVec 32) (_ BitVec 64)) Unit!7021)

(assert (=> b!229863 (= lt!115631 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6337 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3441 0))(
  ( (Nil!3438) (Cons!3437 (h!4085 (_ BitVec 64)) (t!8400 List!3441)) )
))
(declare-fun arrayNoDuplicates!0 (array!11315 (_ BitVec 32) List!3441) Bool)

(assert (=> b!229863 (arrayNoDuplicates!0 lt!115628 #b00000000000000000000000000000000 Nil!3438)))

(assert (=> b!229863 (= lt!115628 (array!11316 (store (arr!5377 (_keys!6337 thiss!1504)) index!297 key!932) (size!5710 (_keys!6337 thiss!1504))))))

(declare-fun lt!115626 () Unit!7021)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11315 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3441) Unit!7021)

(assert (=> b!229863 (= lt!115626 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6337 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3438))))

(declare-fun lt!115636 () Unit!7021)

(declare-fun e!149142 () Unit!7021)

(assert (=> b!229863 (= lt!115636 e!149142)))

(declare-fun c!38134 () Bool)

(declare-fun arrayContainsKey!0 (array!11315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229863 (= c!38134 (arrayContainsKey!0 (_keys!6337 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229864 () Bool)

(declare-fun e!149137 () Bool)

(assert (=> b!229864 (= e!149137 (not call!21354))))

(declare-fun mapIsEmpty!10222 () Bool)

(declare-fun mapRes!10222 () Bool)

(assert (=> mapIsEmpty!10222 mapRes!10222))

(declare-fun b!229865 () Bool)

(declare-fun e!149146 () Bool)

(assert (=> b!229865 (= e!149146 tp_is_empty!6035)))

(declare-fun b!229866 () Bool)

(declare-fun e!149140 () Bool)

(assert (=> b!229866 (= e!149143 (and e!149140 mapRes!10222))))

(declare-fun condMapEmpty!10222 () Bool)

(declare-fun mapDefault!10222 () ValueCell!2674)

