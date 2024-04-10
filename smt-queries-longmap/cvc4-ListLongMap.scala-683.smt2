; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16606 () Bool)

(assert start!16606)

(declare-fun b!165673 () Bool)

(declare-fun b_free!3911 () Bool)

(declare-fun b_next!3911 () Bool)

(assert (=> b!165673 (= b_free!3911 (not b_next!3911))))

(declare-fun tp!14334 () Bool)

(declare-fun b_and!10325 () Bool)

(assert (=> b!165673 (= tp!14334 b_and!10325)))

(declare-fun b!165668 () Bool)

(declare-fun e!108673 () Bool)

(declare-fun e!108669 () Bool)

(assert (=> b!165668 (= e!108673 e!108669)))

(declare-fun res!78638 () Bool)

(assert (=> b!165668 (=> (not res!78638) (not e!108669))))

(declare-datatypes ((SeekEntryResult!441 0))(
  ( (MissingZero!441 (index!3932 (_ BitVec 32))) (Found!441 (index!3933 (_ BitVec 32))) (Intermediate!441 (undefined!1253 Bool) (index!3934 (_ BitVec 32)) (x!18357 (_ BitVec 32))) (Undefined!441) (MissingVacant!441 (index!3935 (_ BitVec 32))) )
))
(declare-fun lt!83113 () SeekEntryResult!441)

(assert (=> b!165668 (= res!78638 (and (not (is-Undefined!441 lt!83113)) (not (is-MissingVacant!441 lt!83113)) (not (is-MissingZero!441 lt!83113)) (is-Found!441 lt!83113)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4597 0))(
  ( (V!4598 (val!1901 Int)) )
))
(declare-datatypes ((ValueCell!1513 0))(
  ( (ValueCellFull!1513 (v!3766 V!4597)) (EmptyCell!1513) )
))
(declare-datatypes ((array!6523 0))(
  ( (array!6524 (arr!3097 (Array (_ BitVec 32) (_ BitVec 64))) (size!3385 (_ BitVec 32))) )
))
(declare-datatypes ((array!6525 0))(
  ( (array!6526 (arr!3098 (Array (_ BitVec 32) ValueCell!1513)) (size!3386 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1934 0))(
  ( (LongMapFixedSize!1935 (defaultEntry!3409 Int) (mask!8124 (_ BitVec 32)) (extraKeys!3150 (_ BitVec 32)) (zeroValue!3252 V!4597) (minValue!3252 V!4597) (_size!1016 (_ BitVec 32)) (_keys!5234 array!6523) (_values!3392 array!6525) (_vacant!1016 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1934)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6523 (_ BitVec 32)) SeekEntryResult!441)

(assert (=> b!165668 (= lt!83113 (seekEntryOrOpen!0 key!828 (_keys!5234 thiss!1248) (mask!8124 thiss!1248)))))

(declare-fun b!165669 () Bool)

(declare-fun res!78641 () Bool)

(assert (=> b!165669 (=> (not res!78641) (not e!108669))))

(declare-datatypes ((tuple2!3078 0))(
  ( (tuple2!3079 (_1!1550 (_ BitVec 64)) (_2!1550 V!4597)) )
))
(declare-datatypes ((List!2063 0))(
  ( (Nil!2060) (Cons!2059 (h!2676 tuple2!3078) (t!6865 List!2063)) )
))
(declare-datatypes ((ListLongMap!2033 0))(
  ( (ListLongMap!2034 (toList!1032 List!2063)) )
))
(declare-fun contains!1074 (ListLongMap!2033 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!690 (array!6523 array!6525 (_ BitVec 32) (_ BitVec 32) V!4597 V!4597 (_ BitVec 32) Int) ListLongMap!2033)

(assert (=> b!165669 (= res!78641 (not (contains!1074 (getCurrentListMap!690 (_keys!5234 thiss!1248) (_values!3392 thiss!1248) (mask!8124 thiss!1248) (extraKeys!3150 thiss!1248) (zeroValue!3252 thiss!1248) (minValue!3252 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3409 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!6288 () Bool)

(declare-fun mapRes!6288 () Bool)

(assert (=> mapIsEmpty!6288 mapRes!6288))

(declare-fun b!165670 () Bool)

(declare-fun e!108674 () Bool)

(declare-fun e!108668 () Bool)

(assert (=> b!165670 (= e!108674 (and e!108668 mapRes!6288))))

(declare-fun condMapEmpty!6288 () Bool)

(declare-fun mapDefault!6288 () ValueCell!1513)

