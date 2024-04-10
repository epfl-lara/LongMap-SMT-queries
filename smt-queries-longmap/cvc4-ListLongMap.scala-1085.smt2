; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22196 () Bool)

(assert start!22196)

(declare-fun b!232576 () Bool)

(declare-fun b_free!6263 () Bool)

(declare-fun b_next!6263 () Bool)

(assert (=> b!232576 (= b_free!6263 (not b_next!6263))))

(declare-fun tp!21930 () Bool)

(declare-fun b_and!13161 () Bool)

(assert (=> b!232576 (= tp!21930 b_and!13161)))

(declare-fun b!232560 () Bool)

(declare-fun res!114188 () Bool)

(declare-fun e!151038 () Bool)

(assert (=> b!232560 (=> (not res!114188) (not e!151038))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!232560 (= res!114188 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10357 () Bool)

(declare-fun mapRes!10357 () Bool)

(declare-fun tp!21931 () Bool)

(declare-fun e!151033 () Bool)

(assert (=> mapNonEmpty!10357 (= mapRes!10357 (and tp!21931 e!151033))))

(declare-datatypes ((V!7813 0))(
  ( (V!7814 (val!3107 Int)) )
))
(declare-datatypes ((ValueCell!2719 0))(
  ( (ValueCellFull!2719 (v!5127 V!7813)) (EmptyCell!2719) )
))
(declare-fun mapValue!10357 () ValueCell!2719)

(declare-datatypes ((array!11493 0))(
  ( (array!11494 (arr!5466 (Array (_ BitVec 32) ValueCell!2719)) (size!5799 (_ BitVec 32))) )
))
(declare-datatypes ((array!11495 0))(
  ( (array!11496 (arr!5467 (Array (_ BitVec 32) (_ BitVec 64))) (size!5800 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3338 0))(
  ( (LongMapFixedSize!3339 (defaultEntry!4328 Int) (mask!10242 (_ BitVec 32)) (extraKeys!4065 (_ BitVec 32)) (zeroValue!4169 V!7813) (minValue!4169 V!7813) (_size!1718 (_ BitVec 32)) (_keys!6382 array!11495) (_values!4311 array!11493) (_vacant!1718 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3338)

(declare-fun mapKey!10357 () (_ BitVec 32))

(declare-fun mapRest!10357 () (Array (_ BitVec 32) ValueCell!2719))

(assert (=> mapNonEmpty!10357 (= (arr!5466 (_values!4311 thiss!1504)) (store mapRest!10357 mapKey!10357 mapValue!10357))))

(declare-fun b!232561 () Bool)

(declare-fun e!151030 () Bool)

(assert (=> b!232561 (= e!151038 e!151030)))

(declare-fun res!114189 () Bool)

(assert (=> b!232561 (=> (not res!114189) (not e!151030))))

(declare-datatypes ((SeekEntryResult!966 0))(
  ( (MissingZero!966 (index!6034 (_ BitVec 32))) (Found!966 (index!6035 (_ BitVec 32))) (Intermediate!966 (undefined!1778 Bool) (index!6036 (_ BitVec 32)) (x!23562 (_ BitVec 32))) (Undefined!966) (MissingVacant!966 (index!6037 (_ BitVec 32))) )
))
(declare-fun lt!117503 () SeekEntryResult!966)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!232561 (= res!114189 (or (= lt!117503 (MissingZero!966 index!297)) (= lt!117503 (MissingVacant!966 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11495 (_ BitVec 32)) SeekEntryResult!966)

(assert (=> b!232561 (= lt!117503 (seekEntryOrOpen!0 key!932 (_keys!6382 thiss!1504) (mask!10242 thiss!1504)))))

(declare-fun b!232563 () Bool)

(declare-fun tp_is_empty!6125 () Bool)

(assert (=> b!232563 (= e!151033 tp_is_empty!6125)))

(declare-fun bm!21620 () Bool)

(declare-fun c!38673 () Bool)

(declare-fun call!21623 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21620 (= call!21623 (inRange!0 (ite c!38673 (index!6034 lt!117503) (index!6037 lt!117503)) (mask!10242 thiss!1504)))))

(declare-fun b!232564 () Bool)

(declare-fun e!151034 () Bool)

(declare-fun e!151029 () Bool)

(assert (=> b!232564 (= e!151034 (and e!151029 mapRes!10357))))

(declare-fun condMapEmpty!10357 () Bool)

(declare-fun mapDefault!10357 () ValueCell!2719)

