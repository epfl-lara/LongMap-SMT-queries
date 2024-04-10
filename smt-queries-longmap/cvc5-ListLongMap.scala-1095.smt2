; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22480 () Bool)

(assert start!22480)

(declare-fun b!235050 () Bool)

(declare-fun b_free!6319 () Bool)

(declare-fun b_next!6319 () Bool)

(assert (=> b!235050 (= b_free!6319 (not b_next!6319))))

(declare-fun tp!22120 () Bool)

(declare-fun b_and!13245 () Bool)

(assert (=> b!235050 (= tp!22120 b_and!13245)))

(declare-fun b!235046 () Bool)

(declare-fun res!115262 () Bool)

(declare-fun e!152657 () Bool)

(assert (=> b!235046 (=> (not res!115262) (not e!152657))))

(declare-datatypes ((V!7889 0))(
  ( (V!7890 (val!3135 Int)) )
))
(declare-datatypes ((ValueCell!2747 0))(
  ( (ValueCellFull!2747 (v!5161 V!7889)) (EmptyCell!2747) )
))
(declare-datatypes ((array!11617 0))(
  ( (array!11618 (arr!5522 (Array (_ BitVec 32) ValueCell!2747)) (size!5859 (_ BitVec 32))) )
))
(declare-datatypes ((array!11619 0))(
  ( (array!11620 (arr!5523 (Array (_ BitVec 32) (_ BitVec 64))) (size!5860 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3394 0))(
  ( (LongMapFixedSize!3395 (defaultEntry!4366 Int) (mask!10328 (_ BitVec 32)) (extraKeys!4103 (_ BitVec 32)) (zeroValue!4207 V!7889) (minValue!4207 V!7889) (_size!1746 (_ BitVec 32)) (_keys!6438 array!11619) (_values!4349 array!11617) (_vacant!1746 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3394)

(assert (=> b!235046 (= res!115262 (and (= (size!5859 (_values!4349 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10328 thiss!1504))) (= (size!5860 (_keys!6438 thiss!1504)) (size!5859 (_values!4349 thiss!1504))) (bvsge (mask!10328 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4103 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4103 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!235047 () Bool)

(declare-fun e!152654 () Bool)

(declare-fun tp_is_empty!6181 () Bool)

(assert (=> b!235047 (= e!152654 tp_is_empty!6181)))

(declare-fun mapNonEmpty!10463 () Bool)

(declare-fun mapRes!10463 () Bool)

(declare-fun tp!22121 () Bool)

(assert (=> mapNonEmpty!10463 (= mapRes!10463 (and tp!22121 e!152654))))

(declare-fun mapKey!10463 () (_ BitVec 32))

(declare-fun mapValue!10463 () ValueCell!2747)

(declare-fun mapRest!10463 () (Array (_ BitVec 32) ValueCell!2747))

(assert (=> mapNonEmpty!10463 (= (arr!5522 (_values!4349 thiss!1504)) (store mapRest!10463 mapKey!10463 mapValue!10463))))

(declare-fun b!235049 () Bool)

(declare-fun e!152658 () Bool)

(assert (=> b!235049 (= e!152658 e!152657)))

(declare-fun res!115260 () Bool)

(assert (=> b!235049 (=> (not res!115260) (not e!152657))))

(declare-datatypes ((SeekEntryResult!983 0))(
  ( (MissingZero!983 (index!6102 (_ BitVec 32))) (Found!983 (index!6103 (_ BitVec 32))) (Intermediate!983 (undefined!1795 Bool) (index!6104 (_ BitVec 32)) (x!23751 (_ BitVec 32))) (Undefined!983) (MissingVacant!983 (index!6105 (_ BitVec 32))) )
))
(declare-fun lt!118924 () SeekEntryResult!983)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235049 (= res!115260 (or (= lt!118924 (MissingZero!983 index!297)) (= lt!118924 (MissingVacant!983 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11619 (_ BitVec 32)) SeekEntryResult!983)

(assert (=> b!235049 (= lt!118924 (seekEntryOrOpen!0 key!932 (_keys!6438 thiss!1504) (mask!10328 thiss!1504)))))

(declare-fun e!152659 () Bool)

(declare-fun e!152653 () Bool)

(declare-fun array_inv!3639 (array!11619) Bool)

(declare-fun array_inv!3640 (array!11617) Bool)

(assert (=> b!235050 (= e!152653 (and tp!22120 tp_is_empty!6181 (array_inv!3639 (_keys!6438 thiss!1504)) (array_inv!3640 (_values!4349 thiss!1504)) e!152659))))

(declare-fun mapIsEmpty!10463 () Bool)

(assert (=> mapIsEmpty!10463 mapRes!10463))

(declare-fun b!235048 () Bool)

(declare-fun res!115258 () Bool)

(assert (=> b!235048 (=> (not res!115258) (not e!152658))))

(assert (=> b!235048 (= res!115258 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!115263 () Bool)

(assert (=> start!22480 (=> (not res!115263) (not e!152658))))

(declare-fun valid!1339 (LongMapFixedSize!3394) Bool)

(assert (=> start!22480 (= res!115263 (valid!1339 thiss!1504))))

(assert (=> start!22480 e!152658))

(assert (=> start!22480 e!152653))

(assert (=> start!22480 true))

(declare-fun b!235051 () Bool)

(declare-fun res!115259 () Bool)

(assert (=> b!235051 (=> (not res!115259) (not e!152657))))

(declare-datatypes ((tuple2!4620 0))(
  ( (tuple2!4621 (_1!2321 (_ BitVec 64)) (_2!2321 V!7889)) )
))
(declare-datatypes ((List!3529 0))(
  ( (Nil!3526) (Cons!3525 (h!4177 tuple2!4620) (t!8500 List!3529)) )
))
(declare-datatypes ((ListLongMap!3533 0))(
  ( (ListLongMap!3534 (toList!1782 List!3529)) )
))
(declare-fun contains!1658 (ListLongMap!3533 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1310 (array!11619 array!11617 (_ BitVec 32) (_ BitVec 32) V!7889 V!7889 (_ BitVec 32) Int) ListLongMap!3533)

(assert (=> b!235051 (= res!115259 (contains!1658 (getCurrentListMap!1310 (_keys!6438 thiss!1504) (_values!4349 thiss!1504) (mask!10328 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)) key!932))))

(declare-fun b!235052 () Bool)

(declare-fun e!152655 () Bool)

(assert (=> b!235052 (= e!152655 tp_is_empty!6181)))

(declare-fun b!235053 () Bool)

(assert (=> b!235053 (= e!152659 (and e!152655 mapRes!10463))))

(declare-fun condMapEmpty!10463 () Bool)

(declare-fun mapDefault!10463 () ValueCell!2747)

