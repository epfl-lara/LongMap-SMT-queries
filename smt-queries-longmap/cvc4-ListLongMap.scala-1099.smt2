; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22562 () Bool)

(assert start!22562)

(declare-fun b!235900 () Bool)

(declare-fun b_free!6347 () Bool)

(declare-fun b_next!6347 () Bool)

(assert (=> b!235900 (= b_free!6347 (not b_next!6347))))

(declare-fun tp!22213 () Bool)

(declare-fun b_and!13279 () Bool)

(assert (=> b!235900 (= tp!22213 b_and!13279)))

(declare-fun b!235895 () Bool)

(declare-fun e!153202 () Bool)

(assert (=> b!235895 (= e!153202 (not false))))

(declare-fun e!153196 () Bool)

(assert (=> b!235895 e!153196))

(declare-fun res!115704 () Bool)

(assert (=> b!235895 (=> (not res!115704) (not e!153196))))

(declare-datatypes ((SeekEntryResult!996 0))(
  ( (MissingZero!996 (index!6154 (_ BitVec 32))) (Found!996 (index!6155 (_ BitVec 32))) (Intermediate!996 (undefined!1808 Bool) (index!6156 (_ BitVec 32)) (x!23826 (_ BitVec 32))) (Undefined!996) (MissingVacant!996 (index!6157 (_ BitVec 32))) )
))
(declare-fun lt!119272 () SeekEntryResult!996)

(assert (=> b!235895 (= res!115704 (is-Found!996 lt!119272))))

(declare-datatypes ((Unit!7266 0))(
  ( (Unit!7267) )
))
(declare-fun lt!119271 () Unit!7266)

(declare-datatypes ((V!7925 0))(
  ( (V!7926 (val!3149 Int)) )
))
(declare-datatypes ((ValueCell!2761 0))(
  ( (ValueCellFull!2761 (v!5178 V!7925)) (EmptyCell!2761) )
))
(declare-datatypes ((array!11679 0))(
  ( (array!11680 (arr!5550 (Array (_ BitVec 32) ValueCell!2761)) (size!5887 (_ BitVec 32))) )
))
(declare-datatypes ((array!11681 0))(
  ( (array!11682 (arr!5551 (Array (_ BitVec 32) (_ BitVec 64))) (size!5888 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3422 0))(
  ( (LongMapFixedSize!3423 (defaultEntry!4383 Int) (mask!10362 (_ BitVec 32)) (extraKeys!4120 (_ BitVec 32)) (zeroValue!4224 V!7925) (minValue!4224 V!7925) (_size!1760 (_ BitVec 32)) (_keys!6461 array!11681) (_values!4366 array!11679) (_vacant!1760 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3422)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!317 (array!11681 array!11679 (_ BitVec 32) (_ BitVec 32) V!7925 V!7925 (_ BitVec 64) Int) Unit!7266)

(assert (=> b!235895 (= lt!119271 (lemmaInListMapThenSeekEntryOrOpenFindsIt!317 (_keys!6461 thiss!1504) (_values!4366 thiss!1504) (mask!10362 thiss!1504) (extraKeys!4120 thiss!1504) (zeroValue!4224 thiss!1504) (minValue!4224 thiss!1504) key!932 (defaultEntry!4383 thiss!1504)))))

(declare-fun mapNonEmpty!10514 () Bool)

(declare-fun mapRes!10514 () Bool)

(declare-fun tp!22214 () Bool)

(declare-fun e!153197 () Bool)

(assert (=> mapNonEmpty!10514 (= mapRes!10514 (and tp!22214 e!153197))))

(declare-fun mapValue!10514 () ValueCell!2761)

(declare-fun mapKey!10514 () (_ BitVec 32))

(declare-fun mapRest!10514 () (Array (_ BitVec 32) ValueCell!2761))

(assert (=> mapNonEmpty!10514 (= (arr!5550 (_values!4366 thiss!1504)) (store mapRest!10514 mapKey!10514 mapValue!10514))))

(declare-fun b!235896 () Bool)

(declare-fun res!115700 () Bool)

(declare-fun e!153200 () Bool)

(assert (=> b!235896 (=> (not res!115700) (not e!153200))))

(assert (=> b!235896 (= res!115700 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235897 () Bool)

(declare-fun res!115703 () Bool)

(assert (=> b!235897 (=> (not res!115703) (not e!153202))))

(declare-datatypes ((tuple2!4640 0))(
  ( (tuple2!4641 (_1!2331 (_ BitVec 64)) (_2!2331 V!7925)) )
))
(declare-datatypes ((List!3548 0))(
  ( (Nil!3545) (Cons!3544 (h!4196 tuple2!4640) (t!8525 List!3548)) )
))
(declare-datatypes ((ListLongMap!3553 0))(
  ( (ListLongMap!3554 (toList!1792 List!3548)) )
))
(declare-fun contains!1670 (ListLongMap!3553 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1320 (array!11681 array!11679 (_ BitVec 32) (_ BitVec 32) V!7925 V!7925 (_ BitVec 32) Int) ListLongMap!3553)

(assert (=> b!235897 (= res!115703 (contains!1670 (getCurrentListMap!1320 (_keys!6461 thiss!1504) (_values!4366 thiss!1504) (mask!10362 thiss!1504) (extraKeys!4120 thiss!1504) (zeroValue!4224 thiss!1504) (minValue!4224 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4383 thiss!1504)) key!932))))

(declare-fun b!235898 () Bool)

(assert (=> b!235898 (= e!153196 (= (select (arr!5551 (_keys!6461 thiss!1504)) (index!6155 lt!119272)) key!932))))

(declare-fun b!235899 () Bool)

(declare-fun e!153198 () Bool)

(declare-fun e!153199 () Bool)

(assert (=> b!235899 (= e!153198 (and e!153199 mapRes!10514))))

(declare-fun condMapEmpty!10514 () Bool)

(declare-fun mapDefault!10514 () ValueCell!2761)

