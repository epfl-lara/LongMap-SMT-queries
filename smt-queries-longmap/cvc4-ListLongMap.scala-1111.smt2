; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22916 () Bool)

(assert start!22916)

(declare-fun b!238943 () Bool)

(declare-fun b_free!6419 () Bool)

(declare-fun b_next!6419 () Bool)

(assert (=> b!238943 (= b_free!6419 (not b_next!6419))))

(declare-fun tp!22460 () Bool)

(declare-fun b_and!13385 () Bool)

(assert (=> b!238943 (= tp!22460 b_and!13385)))

(declare-fun b!238941 () Bool)

(declare-fun res!117103 () Bool)

(declare-fun e!155141 () Bool)

(assert (=> b!238941 (=> (not res!117103) (not e!155141))))

(declare-datatypes ((V!8021 0))(
  ( (V!8022 (val!3185 Int)) )
))
(declare-datatypes ((ValueCell!2797 0))(
  ( (ValueCellFull!2797 (v!5223 V!8021)) (EmptyCell!2797) )
))
(declare-datatypes ((array!11841 0))(
  ( (array!11842 (arr!5622 (Array (_ BitVec 32) ValueCell!2797)) (size!5963 (_ BitVec 32))) )
))
(declare-datatypes ((array!11843 0))(
  ( (array!11844 (arr!5623 (Array (_ BitVec 32) (_ BitVec 64))) (size!5964 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3494 0))(
  ( (LongMapFixedSize!3495 (defaultEntry!4432 Int) (mask!10472 (_ BitVec 32)) (extraKeys!4169 (_ BitVec 32)) (zeroValue!4273 V!8021) (minValue!4273 V!8021) (_size!1796 (_ BitVec 32)) (_keys!6534 array!11843) (_values!4415 array!11841) (_vacant!1796 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3494)

(declare-datatypes ((SeekEntryResult!1025 0))(
  ( (MissingZero!1025 (index!6270 (_ BitVec 32))) (Found!1025 (index!6271 (_ BitVec 32))) (Intermediate!1025 (undefined!1837 Bool) (index!6272 (_ BitVec 32)) (x!24073 (_ BitVec 32))) (Undefined!1025) (MissingVacant!1025 (index!6273 (_ BitVec 32))) )
))
(declare-fun lt!120692 () SeekEntryResult!1025)

(assert (=> b!238941 (= res!117103 (= (select (arr!5623 (_keys!6534 thiss!1504)) (index!6270 lt!120692)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22214 () Bool)

(declare-fun call!22218 () Bool)

(declare-fun c!39839 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22214 (= call!22218 (inRange!0 (ite c!39839 (index!6270 lt!120692) (index!6273 lt!120692)) (mask!10472 thiss!1504)))))

(declare-fun b!238942 () Bool)

(declare-fun e!155146 () Bool)

(declare-fun call!22217 () Bool)

(assert (=> b!238942 (= e!155146 (not call!22217))))

(declare-fun e!155143 () Bool)

(declare-fun e!155148 () Bool)

(declare-fun tp_is_empty!6281 () Bool)

(declare-fun array_inv!3717 (array!11843) Bool)

(declare-fun array_inv!3718 (array!11841) Bool)

(assert (=> b!238943 (= e!155143 (and tp!22460 tp_is_empty!6281 (array_inv!3717 (_keys!6534 thiss!1504)) (array_inv!3718 (_values!4415 thiss!1504)) e!155148))))

(declare-fun mapIsEmpty!10653 () Bool)

(declare-fun mapRes!10653 () Bool)

(assert (=> mapIsEmpty!10653 mapRes!10653))

(declare-fun b!238944 () Bool)

(declare-datatypes ((Unit!7331 0))(
  ( (Unit!7332) )
))
(declare-fun e!155138 () Unit!7331)

(declare-fun lt!120691 () Unit!7331)

(assert (=> b!238944 (= e!155138 lt!120691)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!336 (array!11843 array!11841 (_ BitVec 32) (_ BitVec 32) V!8021 V!8021 (_ BitVec 64) Int) Unit!7331)

(assert (=> b!238944 (= lt!120691 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!336 (_keys!6534 thiss!1504) (_values!4415 thiss!1504) (mask!10472 thiss!1504) (extraKeys!4169 thiss!1504) (zeroValue!4273 thiss!1504) (minValue!4273 thiss!1504) key!932 (defaultEntry!4432 thiss!1504)))))

(assert (=> b!238944 (= c!39839 (is-MissingZero!1025 lt!120692))))

(declare-fun e!155142 () Bool)

(assert (=> b!238944 e!155142))

(declare-fun b!238945 () Bool)

(declare-fun e!155145 () Bool)

(assert (=> b!238945 (= e!155145 tp_is_empty!6281)))

(declare-fun b!238946 () Bool)

(declare-fun res!117102 () Bool)

(declare-fun e!155140 () Bool)

(assert (=> b!238946 (=> (not res!117102) (not e!155140))))

(declare-fun arrayContainsKey!0 (array!11843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!238946 (= res!117102 (arrayContainsKey!0 (_keys!6534 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!238947 () Bool)

(assert (=> b!238947 (= e!155140 (not (= (size!5963 (_values!4415 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10472 thiss!1504)))))))

(declare-fun bm!22215 () Bool)

(assert (=> bm!22215 (= call!22217 (arrayContainsKey!0 (_keys!6534 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!117099 () Bool)

(declare-fun e!155136 () Bool)

(assert (=> start!22916 (=> (not res!117099) (not e!155136))))

(declare-fun valid!1378 (LongMapFixedSize!3494) Bool)

(assert (=> start!22916 (= res!117099 (valid!1378 thiss!1504))))

(assert (=> start!22916 e!155136))

(assert (=> start!22916 e!155143))

(assert (=> start!22916 true))

(declare-fun b!238940 () Bool)

(declare-fun res!117106 () Bool)

(assert (=> b!238940 (=> (not res!117106) (not e!155140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238940 (= res!117106 (validMask!0 (mask!10472 thiss!1504)))))

(declare-fun b!238948 () Bool)

(assert (=> b!238948 (= e!155141 (not call!22217))))

(declare-fun mapNonEmpty!10653 () Bool)

(declare-fun tp!22461 () Bool)

(assert (=> mapNonEmpty!10653 (= mapRes!10653 (and tp!22461 e!155145))))

(declare-fun mapValue!10653 () ValueCell!2797)

(declare-fun mapRest!10653 () (Array (_ BitVec 32) ValueCell!2797))

(declare-fun mapKey!10653 () (_ BitVec 32))

(assert (=> mapNonEmpty!10653 (= (arr!5622 (_values!4415 thiss!1504)) (store mapRest!10653 mapKey!10653 mapValue!10653))))

(declare-fun b!238949 () Bool)

(declare-fun e!155137 () Bool)

(assert (=> b!238949 (= e!155148 (and e!155137 mapRes!10653))))

(declare-fun condMapEmpty!10653 () Bool)

(declare-fun mapDefault!10653 () ValueCell!2797)

