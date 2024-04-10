; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22568 () Bool)

(assert start!22568)

(declare-fun b!235975 () Bool)

(declare-fun b_free!6353 () Bool)

(declare-fun b_next!6353 () Bool)

(assert (=> b!235975 (= b_free!6353 (not b_next!6353))))

(declare-fun tp!22232 () Bool)

(declare-fun b_and!13285 () Bool)

(assert (=> b!235975 (= tp!22232 b_and!13285)))

(declare-fun b!235969 () Bool)

(declare-fun e!153259 () Bool)

(declare-fun e!153261 () Bool)

(assert (=> b!235969 (= e!153259 e!153261)))

(declare-fun res!115738 () Bool)

(assert (=> b!235969 (=> (not res!115738) (not e!153261))))

(declare-datatypes ((SeekEntryResult!999 0))(
  ( (MissingZero!999 (index!6166 (_ BitVec 32))) (Found!999 (index!6167 (_ BitVec 32))) (Intermediate!999 (undefined!1811 Bool) (index!6168 (_ BitVec 32)) (x!23837 (_ BitVec 32))) (Undefined!999) (MissingVacant!999 (index!6169 (_ BitVec 32))) )
))
(declare-fun lt!119281 () SeekEntryResult!999)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235969 (= res!115738 (or (= lt!119281 (MissingZero!999 index!297)) (= lt!119281 (MissingVacant!999 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7933 0))(
  ( (V!7934 (val!3152 Int)) )
))
(declare-datatypes ((ValueCell!2764 0))(
  ( (ValueCellFull!2764 (v!5181 V!7933)) (EmptyCell!2764) )
))
(declare-datatypes ((array!11691 0))(
  ( (array!11692 (arr!5556 (Array (_ BitVec 32) ValueCell!2764)) (size!5893 (_ BitVec 32))) )
))
(declare-datatypes ((array!11693 0))(
  ( (array!11694 (arr!5557 (Array (_ BitVec 32) (_ BitVec 64))) (size!5894 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3428 0))(
  ( (LongMapFixedSize!3429 (defaultEntry!4386 Int) (mask!10367 (_ BitVec 32)) (extraKeys!4123 (_ BitVec 32)) (zeroValue!4227 V!7933) (minValue!4227 V!7933) (_size!1763 (_ BitVec 32)) (_keys!6464 array!11693) (_values!4369 array!11691) (_vacant!1763 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3428)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11693 (_ BitVec 32)) SeekEntryResult!999)

(assert (=> b!235969 (= lt!119281 (seekEntryOrOpen!0 key!932 (_keys!6464 thiss!1504) (mask!10367 thiss!1504)))))

(declare-fun b!235970 () Bool)

(declare-fun e!153263 () Bool)

(declare-fun tp_is_empty!6215 () Bool)

(assert (=> b!235970 (= e!153263 tp_is_empty!6215)))

(declare-fun mapNonEmpty!10523 () Bool)

(declare-fun mapRes!10523 () Bool)

(declare-fun tp!22231 () Bool)

(declare-fun e!153262 () Bool)

(assert (=> mapNonEmpty!10523 (= mapRes!10523 (and tp!22231 e!153262))))

(declare-fun mapValue!10523 () ValueCell!2764)

(declare-fun mapKey!10523 () (_ BitVec 32))

(declare-fun mapRest!10523 () (Array (_ BitVec 32) ValueCell!2764))

(assert (=> mapNonEmpty!10523 (= (arr!5556 (_values!4369 thiss!1504)) (store mapRest!10523 mapKey!10523 mapValue!10523))))

(declare-fun b!235971 () Bool)

(declare-fun res!115737 () Bool)

(assert (=> b!235971 (=> (not res!115737) (not e!153261))))

(declare-datatypes ((tuple2!4646 0))(
  ( (tuple2!4647 (_1!2334 (_ BitVec 64)) (_2!2334 V!7933)) )
))
(declare-datatypes ((List!3551 0))(
  ( (Nil!3548) (Cons!3547 (h!4199 tuple2!4646) (t!8528 List!3551)) )
))
(declare-datatypes ((ListLongMap!3559 0))(
  ( (ListLongMap!3560 (toList!1795 List!3551)) )
))
(declare-fun contains!1673 (ListLongMap!3559 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1323 (array!11693 array!11691 (_ BitVec 32) (_ BitVec 32) V!7933 V!7933 (_ BitVec 32) Int) ListLongMap!3559)

(assert (=> b!235971 (= res!115737 (not (contains!1673 (getCurrentListMap!1323 (_keys!6464 thiss!1504) (_values!4369 thiss!1504) (mask!10367 thiss!1504) (extraKeys!4123 thiss!1504) (zeroValue!4227 thiss!1504) (minValue!4227 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4386 thiss!1504)) key!932)))))

(declare-fun b!235972 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235972 (= e!153261 (not (validMask!0 (mask!10367 thiss!1504))))))

(declare-fun b!235973 () Bool)

(declare-fun e!153265 () Bool)

(assert (=> b!235973 (= e!153265 (and e!153263 mapRes!10523))))

(declare-fun condMapEmpty!10523 () Bool)

(declare-fun mapDefault!10523 () ValueCell!2764)

