; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22236 () Bool)

(assert start!22236)

(declare-fun b!233311 () Bool)

(declare-fun b_free!6289 () Bool)

(declare-fun b_next!6289 () Bool)

(assert (=> b!233311 (= b_free!6289 (not b_next!6289))))

(declare-fun tp!22012 () Bool)

(declare-fun b_and!13189 () Bool)

(assert (=> b!233311 (= tp!22012 b_and!13189)))

(declare-fun b!233310 () Bool)

(declare-fun e!151564 () Bool)

(declare-fun tp_is_empty!6151 () Bool)

(assert (=> b!233310 (= e!151564 tp_is_empty!6151)))

(declare-fun res!114508 () Bool)

(declare-fun e!151560 () Bool)

(assert (=> start!22236 (=> (not res!114508) (not e!151560))))

(declare-datatypes ((V!7849 0))(
  ( (V!7850 (val!3120 Int)) )
))
(declare-datatypes ((ValueCell!2732 0))(
  ( (ValueCellFull!2732 (v!5141 V!7849)) (EmptyCell!2732) )
))
(declare-datatypes ((array!11547 0))(
  ( (array!11548 (arr!5492 (Array (_ BitVec 32) ValueCell!2732)) (size!5825 (_ BitVec 32))) )
))
(declare-datatypes ((array!11549 0))(
  ( (array!11550 (arr!5493 (Array (_ BitVec 32) (_ BitVec 64))) (size!5826 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3364 0))(
  ( (LongMapFixedSize!3365 (defaultEntry!4342 Int) (mask!10268 (_ BitVec 32)) (extraKeys!4079 (_ BitVec 32)) (zeroValue!4183 V!7849) (minValue!4183 V!7849) (_size!1731 (_ BitVec 32)) (_keys!6397 array!11549) (_values!4325 array!11547) (_vacant!1731 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3364)

(declare-fun valid!1328 (LongMapFixedSize!3364) Bool)

(assert (=> start!22236 (= res!114508 (valid!1328 thiss!1504))))

(assert (=> start!22236 e!151560))

(declare-fun e!151562 () Bool)

(assert (=> start!22236 e!151562))

(assert (=> start!22236 true))

(declare-fun e!151559 () Bool)

(declare-fun array_inv!3617 (array!11549) Bool)

(declare-fun array_inv!3618 (array!11547) Bool)

(assert (=> b!233311 (= e!151562 (and tp!22012 tp_is_empty!6151 (array_inv!3617 (_keys!6397 thiss!1504)) (array_inv!3618 (_values!4325 thiss!1504)) e!151559))))

(declare-fun mapIsEmpty!10399 () Bool)

(declare-fun mapRes!10399 () Bool)

(assert (=> mapIsEmpty!10399 mapRes!10399))

(declare-fun mapNonEmpty!10399 () Bool)

(declare-fun tp!22011 () Bool)

(assert (=> mapNonEmpty!10399 (= mapRes!10399 (and tp!22011 e!151564))))

(declare-fun mapValue!10399 () ValueCell!2732)

(declare-fun mapKey!10399 () (_ BitVec 32))

(declare-fun mapRest!10399 () (Array (_ BitVec 32) ValueCell!2732))

(assert (=> mapNonEmpty!10399 (= (arr!5492 (_values!4325 thiss!1504)) (store mapRest!10399 mapKey!10399 mapValue!10399))))

(declare-fun b!233312 () Bool)

(declare-fun e!151563 () Bool)

(assert (=> b!233312 (= e!151560 e!151563)))

(declare-fun res!114504 () Bool)

(assert (=> b!233312 (=> (not res!114504) (not e!151563))))

(declare-datatypes ((SeekEntryResult!975 0))(
  ( (MissingZero!975 (index!6070 (_ BitVec 32))) (Found!975 (index!6071 (_ BitVec 32))) (Intermediate!975 (undefined!1787 Bool) (index!6072 (_ BitVec 32)) (x!23621 (_ BitVec 32))) (Undefined!975) (MissingVacant!975 (index!6073 (_ BitVec 32))) )
))
(declare-fun lt!118004 () SeekEntryResult!975)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!233312 (= res!114504 (or (= lt!118004 (MissingZero!975 index!297)) (= lt!118004 (MissingVacant!975 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11549 (_ BitVec 32)) SeekEntryResult!975)

(assert (=> b!233312 (= lt!118004 (seekEntryOrOpen!0 key!932 (_keys!6397 thiss!1504) (mask!10268 thiss!1504)))))

(declare-fun b!233313 () Bool)

(declare-fun res!114506 () Bool)

(assert (=> b!233313 (=> (not res!114506) (not e!151563))))

(declare-datatypes ((tuple2!4602 0))(
  ( (tuple2!4603 (_1!2312 (_ BitVec 64)) (_2!2312 V!7849)) )
))
(declare-datatypes ((List!3515 0))(
  ( (Nil!3512) (Cons!3511 (h!4159 tuple2!4602) (t!8476 List!3515)) )
))
(declare-datatypes ((ListLongMap!3515 0))(
  ( (ListLongMap!3516 (toList!1773 List!3515)) )
))
(declare-fun contains!1641 (ListLongMap!3515 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1301 (array!11549 array!11547 (_ BitVec 32) (_ BitVec 32) V!7849 V!7849 (_ BitVec 32) Int) ListLongMap!3515)

(assert (=> b!233313 (= res!114506 (contains!1641 (getCurrentListMap!1301 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)) key!932))))

(declare-fun b!233314 () Bool)

(declare-fun e!151565 () Bool)

(assert (=> b!233314 (= e!151559 (and e!151565 mapRes!10399))))

(declare-fun condMapEmpty!10399 () Bool)

(declare-fun mapDefault!10399 () ValueCell!2732)

