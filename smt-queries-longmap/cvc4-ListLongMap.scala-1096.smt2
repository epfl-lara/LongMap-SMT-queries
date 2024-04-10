; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22506 () Bool)

(assert start!22506)

(declare-fun b!235329 () Bool)

(declare-fun b_free!6329 () Bool)

(declare-fun b_next!6329 () Bool)

(assert (=> b!235329 (= b_free!6329 (not b_next!6329))))

(declare-fun tp!22154 () Bool)

(declare-fun b_and!13257 () Bool)

(assert (=> b!235329 (= tp!22154 b_and!13257)))

(declare-fun b!235325 () Bool)

(declare-fun e!152831 () Bool)

(declare-fun tp_is_empty!6191 () Bool)

(assert (=> b!235325 (= e!152831 tp_is_empty!6191)))

(declare-fun b!235326 () Bool)

(declare-fun res!115403 () Bool)

(declare-fun e!152832 () Bool)

(assert (=> b!235326 (=> (not res!115403) (not e!152832))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!235326 (= res!115403 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235327 () Bool)

(declare-fun res!115407 () Bool)

(declare-fun e!152836 () Bool)

(assert (=> b!235327 (=> (not res!115407) (not e!152836))))

(declare-datatypes ((V!7901 0))(
  ( (V!7902 (val!3140 Int)) )
))
(declare-datatypes ((ValueCell!2752 0))(
  ( (ValueCellFull!2752 (v!5167 V!7901)) (EmptyCell!2752) )
))
(declare-datatypes ((array!11639 0))(
  ( (array!11640 (arr!5532 (Array (_ BitVec 32) ValueCell!2752)) (size!5869 (_ BitVec 32))) )
))
(declare-datatypes ((array!11641 0))(
  ( (array!11642 (arr!5533 (Array (_ BitVec 32) (_ BitVec 64))) (size!5870 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3404 0))(
  ( (LongMapFixedSize!3405 (defaultEntry!4372 Int) (mask!10339 (_ BitVec 32)) (extraKeys!4109 (_ BitVec 32)) (zeroValue!4213 V!7901) (minValue!4213 V!7901) (_size!1751 (_ BitVec 32)) (_keys!6446 array!11641) (_values!4355 array!11639) (_vacant!1751 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3404)

(declare-datatypes ((tuple2!4628 0))(
  ( (tuple2!4629 (_1!2325 (_ BitVec 64)) (_2!2325 V!7901)) )
))
(declare-datatypes ((List!3536 0))(
  ( (Nil!3533) (Cons!3532 (h!4184 tuple2!4628) (t!8509 List!3536)) )
))
(declare-datatypes ((ListLongMap!3541 0))(
  ( (ListLongMap!3542 (toList!1786 List!3536)) )
))
(declare-fun contains!1662 (ListLongMap!3541 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1314 (array!11641 array!11639 (_ BitVec 32) (_ BitVec 32) V!7901 V!7901 (_ BitVec 32) Int) ListLongMap!3541)

(assert (=> b!235327 (= res!115407 (contains!1662 (getCurrentListMap!1314 (_keys!6446 thiss!1504) (_values!4355 thiss!1504) (mask!10339 thiss!1504) (extraKeys!4109 thiss!1504) (zeroValue!4213 thiss!1504) (minValue!4213 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4372 thiss!1504)) key!932))))

(declare-fun b!235328 () Bool)

(assert (=> b!235328 (= e!152832 e!152836)))

(declare-fun res!115405 () Bool)

(assert (=> b!235328 (=> (not res!115405) (not e!152836))))

(declare-datatypes ((SeekEntryResult!988 0))(
  ( (MissingZero!988 (index!6122 (_ BitVec 32))) (Found!988 (index!6123 (_ BitVec 32))) (Intermediate!988 (undefined!1800 Bool) (index!6124 (_ BitVec 32)) (x!23774 (_ BitVec 32))) (Undefined!988) (MissingVacant!988 (index!6125 (_ BitVec 32))) )
))
(declare-fun lt!119035 () SeekEntryResult!988)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235328 (= res!115405 (or (= lt!119035 (MissingZero!988 index!297)) (= lt!119035 (MissingVacant!988 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11641 (_ BitVec 32)) SeekEntryResult!988)

(assert (=> b!235328 (= lt!119035 (seekEntryOrOpen!0 key!932 (_keys!6446 thiss!1504) (mask!10339 thiss!1504)))))

(declare-fun mapIsEmpty!10481 () Bool)

(declare-fun mapRes!10481 () Bool)

(assert (=> mapIsEmpty!10481 mapRes!10481))

(declare-fun mapNonEmpty!10481 () Bool)

(declare-fun tp!22153 () Bool)

(declare-fun e!152830 () Bool)

(assert (=> mapNonEmpty!10481 (= mapRes!10481 (and tp!22153 e!152830))))

(declare-fun mapValue!10481 () ValueCell!2752)

(declare-fun mapKey!10481 () (_ BitVec 32))

(declare-fun mapRest!10481 () (Array (_ BitVec 32) ValueCell!2752))

(assert (=> mapNonEmpty!10481 (= (arr!5532 (_values!4355 thiss!1504)) (store mapRest!10481 mapKey!10481 mapValue!10481))))

(declare-fun res!115402 () Bool)

(assert (=> start!22506 (=> (not res!115402) (not e!152832))))

(declare-fun valid!1344 (LongMapFixedSize!3404) Bool)

(assert (=> start!22506 (= res!115402 (valid!1344 thiss!1504))))

(assert (=> start!22506 e!152832))

(declare-fun e!152835 () Bool)

(assert (=> start!22506 e!152835))

(assert (=> start!22506 true))

(declare-fun e!152834 () Bool)

(declare-fun array_inv!3649 (array!11641) Bool)

(declare-fun array_inv!3650 (array!11639) Bool)

(assert (=> b!235329 (= e!152835 (and tp!22154 tp_is_empty!6191 (array_inv!3649 (_keys!6446 thiss!1504)) (array_inv!3650 (_values!4355 thiss!1504)) e!152834))))

(declare-fun b!235330 () Bool)

(assert (=> b!235330 (= e!152830 tp_is_empty!6191)))

(declare-fun b!235331 () Bool)

(declare-fun res!115401 () Bool)

(assert (=> b!235331 (=> (not res!115401) (not e!152836))))

(assert (=> b!235331 (= res!115401 (and (= (size!5869 (_values!4355 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10339 thiss!1504))) (= (size!5870 (_keys!6446 thiss!1504)) (size!5869 (_values!4355 thiss!1504))) (bvsge (mask!10339 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4109 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4109 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!235332 () Bool)

(declare-datatypes ((List!3537 0))(
  ( (Nil!3534) (Cons!3533 (h!4185 (_ BitVec 64)) (t!8510 List!3537)) )
))
(declare-fun arrayNoDuplicates!0 (array!11641 (_ BitVec 32) List!3537) Bool)

(assert (=> b!235332 (= e!152836 (not (arrayNoDuplicates!0 (_keys!6446 thiss!1504) #b00000000000000000000000000000000 Nil!3534)))))

(declare-fun b!235333 () Bool)

(declare-fun res!115404 () Bool)

(assert (=> b!235333 (=> (not res!115404) (not e!152836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11641 (_ BitVec 32)) Bool)

(assert (=> b!235333 (= res!115404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6446 thiss!1504) (mask!10339 thiss!1504)))))

(declare-fun b!235334 () Bool)

(assert (=> b!235334 (= e!152834 (and e!152831 mapRes!10481))))

(declare-fun condMapEmpty!10481 () Bool)

(declare-fun mapDefault!10481 () ValueCell!2752)

