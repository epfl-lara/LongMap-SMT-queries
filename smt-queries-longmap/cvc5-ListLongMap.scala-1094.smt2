; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22424 () Bool)

(assert start!22424)

(declare-fun b!234665 () Bool)

(declare-fun b_free!6313 () Bool)

(declare-fun b_next!6313 () Bool)

(assert (=> b!234665 (= b_free!6313 (not b_next!6313))))

(declare-fun tp!22099 () Bool)

(declare-fun b_and!13233 () Bool)

(assert (=> b!234665 (= tp!22099 b_and!13233)))

(declare-fun b!234658 () Bool)

(declare-fun e!152413 () Bool)

(declare-fun e!152417 () Bool)

(assert (=> b!234658 (= e!152413 e!152417)))

(declare-fun res!115089 () Bool)

(assert (=> b!234658 (=> (not res!115089) (not e!152417))))

(declare-datatypes ((SeekEntryResult!981 0))(
  ( (MissingZero!981 (index!6094 (_ BitVec 32))) (Found!981 (index!6095 (_ BitVec 32))) (Intermediate!981 (undefined!1793 Bool) (index!6096 (_ BitVec 32)) (x!23723 (_ BitVec 32))) (Undefined!981) (MissingVacant!981 (index!6097 (_ BitVec 32))) )
))
(declare-fun lt!118718 () SeekEntryResult!981)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!234658 (= res!115089 (or (= lt!118718 (MissingZero!981 index!297)) (= lt!118718 (MissingVacant!981 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7881 0))(
  ( (V!7882 (val!3132 Int)) )
))
(declare-datatypes ((ValueCell!2744 0))(
  ( (ValueCellFull!2744 (v!5157 V!7881)) (EmptyCell!2744) )
))
(declare-datatypes ((array!11603 0))(
  ( (array!11604 (arr!5516 (Array (_ BitVec 32) ValueCell!2744)) (size!5852 (_ BitVec 32))) )
))
(declare-datatypes ((array!11605 0))(
  ( (array!11606 (arr!5517 (Array (_ BitVec 32) (_ BitVec 64))) (size!5853 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3388 0))(
  ( (LongMapFixedSize!3389 (defaultEntry!4361 Int) (mask!10315 (_ BitVec 32)) (extraKeys!4098 (_ BitVec 32)) (zeroValue!4202 V!7881) (minValue!4202 V!7881) (_size!1743 (_ BitVec 32)) (_keys!6429 array!11605) (_values!4344 array!11603) (_vacant!1743 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3388)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11605 (_ BitVec 32)) SeekEntryResult!981)

(assert (=> b!234658 (= lt!118718 (seekEntryOrOpen!0 key!932 (_keys!6429 thiss!1504) (mask!10315 thiss!1504)))))

(declare-fun b!234659 () Bool)

(declare-fun e!152412 () Bool)

(declare-fun tp_is_empty!6175 () Bool)

(assert (=> b!234659 (= e!152412 tp_is_empty!6175)))

(declare-fun b!234660 () Bool)

(assert (=> b!234660 (= e!152417 (and (= (size!5852 (_values!4344 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10315 thiss!1504))) (= (size!5853 (_keys!6429 thiss!1504)) (size!5852 (_values!4344 thiss!1504))) (bvsge (mask!10315 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4098 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4098 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!115092 () Bool)

(assert (=> start!22424 (=> (not res!115092) (not e!152413))))

(declare-fun valid!1337 (LongMapFixedSize!3388) Bool)

(assert (=> start!22424 (= res!115092 (valid!1337 thiss!1504))))

(assert (=> start!22424 e!152413))

(declare-fun e!152416 () Bool)

(assert (=> start!22424 e!152416))

(assert (=> start!22424 true))

(declare-fun b!234661 () Bool)

(declare-fun e!152414 () Bool)

(assert (=> b!234661 (= e!152414 tp_is_empty!6175)))

(declare-fun b!234662 () Bool)

(declare-fun res!115091 () Bool)

(assert (=> b!234662 (=> (not res!115091) (not e!152417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!234662 (= res!115091 (validMask!0 (mask!10315 thiss!1504)))))

(declare-fun b!234663 () Bool)

(declare-fun res!115090 () Bool)

(assert (=> b!234663 (=> (not res!115090) (not e!152417))))

(declare-datatypes ((tuple2!4616 0))(
  ( (tuple2!4617 (_1!2319 (_ BitVec 64)) (_2!2319 V!7881)) )
))
(declare-datatypes ((List!3526 0))(
  ( (Nil!3523) (Cons!3522 (h!4173 tuple2!4616) (t!8495 List!3526)) )
))
(declare-datatypes ((ListLongMap!3529 0))(
  ( (ListLongMap!3530 (toList!1780 List!3526)) )
))
(declare-fun contains!1654 (ListLongMap!3529 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1308 (array!11605 array!11603 (_ BitVec 32) (_ BitVec 32) V!7881 V!7881 (_ BitVec 32) Int) ListLongMap!3529)

(assert (=> b!234663 (= res!115090 (contains!1654 (getCurrentListMap!1308 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)) key!932))))

(declare-fun b!234664 () Bool)

(declare-fun res!115093 () Bool)

(assert (=> b!234664 (=> (not res!115093) (not e!152413))))

(assert (=> b!234664 (= res!115093 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!152415 () Bool)

(declare-fun array_inv!3635 (array!11605) Bool)

(declare-fun array_inv!3636 (array!11603) Bool)

(assert (=> b!234665 (= e!152416 (and tp!22099 tp_is_empty!6175 (array_inv!3635 (_keys!6429 thiss!1504)) (array_inv!3636 (_values!4344 thiss!1504)) e!152415))))

(declare-fun mapNonEmpty!10450 () Bool)

(declare-fun mapRes!10450 () Bool)

(declare-fun tp!22098 () Bool)

(assert (=> mapNonEmpty!10450 (= mapRes!10450 (and tp!22098 e!152414))))

(declare-fun mapKey!10450 () (_ BitVec 32))

(declare-fun mapRest!10450 () (Array (_ BitVec 32) ValueCell!2744))

(declare-fun mapValue!10450 () ValueCell!2744)

(assert (=> mapNonEmpty!10450 (= (arr!5516 (_values!4344 thiss!1504)) (store mapRest!10450 mapKey!10450 mapValue!10450))))

(declare-fun mapIsEmpty!10450 () Bool)

(assert (=> mapIsEmpty!10450 mapRes!10450))

(declare-fun b!234666 () Bool)

(assert (=> b!234666 (= e!152415 (and e!152412 mapRes!10450))))

(declare-fun condMapEmpty!10450 () Bool)

(declare-fun mapDefault!10450 () ValueCell!2744)

