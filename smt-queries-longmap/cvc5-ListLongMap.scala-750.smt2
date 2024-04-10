; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17532 () Bool)

(assert start!17532)

(declare-fun b!175601 () Bool)

(declare-fun b_free!4339 () Bool)

(declare-fun b_next!4339 () Bool)

(assert (=> b!175601 (= b_free!4339 (not b_next!4339))))

(declare-fun tp!15699 () Bool)

(declare-fun b_and!10821 () Bool)

(assert (=> b!175601 (= tp!15699 b_and!10821)))

(declare-fun mapIsEmpty!7012 () Bool)

(declare-fun mapRes!7012 () Bool)

(assert (=> mapIsEmpty!7012 mapRes!7012))

(declare-fun tp_is_empty!4111 () Bool)

(declare-datatypes ((V!5129 0))(
  ( (V!5130 (val!2100 Int)) )
))
(declare-datatypes ((ValueCell!1712 0))(
  ( (ValueCellFull!1712 (v!3975 V!5129)) (EmptyCell!1712) )
))
(declare-datatypes ((array!7363 0))(
  ( (array!7364 (arr!3495 (Array (_ BitVec 32) (_ BitVec 64))) (size!3797 (_ BitVec 32))) )
))
(declare-datatypes ((array!7365 0))(
  ( (array!7366 (arr!3496 (Array (_ BitVec 32) ValueCell!1712)) (size!3798 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2332 0))(
  ( (LongMapFixedSize!2333 (defaultEntry!3622 Int) (mask!8523 (_ BitVec 32)) (extraKeys!3359 (_ BitVec 32)) (zeroValue!3463 V!5129) (minValue!3463 V!5129) (_size!1215 (_ BitVec 32)) (_keys!5475 array!7363) (_values!3605 array!7365) (_vacant!1215 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2332)

(declare-fun e!115901 () Bool)

(declare-fun e!115902 () Bool)

(declare-fun array_inv!2237 (array!7363) Bool)

(declare-fun array_inv!2238 (array!7365) Bool)

(assert (=> b!175601 (= e!115901 (and tp!15699 tp_is_empty!4111 (array_inv!2237 (_keys!5475 thiss!1248)) (array_inv!2238 (_values!3605 thiss!1248)) e!115902))))

(declare-fun res!83241 () Bool)

(declare-fun e!115903 () Bool)

(assert (=> start!17532 (=> (not res!83241) (not e!115903))))

(declare-fun valid!983 (LongMapFixedSize!2332) Bool)

(assert (=> start!17532 (= res!83241 (valid!983 thiss!1248))))

(assert (=> start!17532 e!115903))

(assert (=> start!17532 e!115901))

(assert (=> start!17532 true))

(declare-fun b!175602 () Bool)

(assert (=> b!175602 (= e!115903 (and (= (size!3798 (_values!3605 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8523 thiss!1248))) (= (size!3797 (_keys!5475 thiss!1248)) (size!3798 (_values!3605 thiss!1248))) (bvsge (mask!8523 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3359 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!7012 () Bool)

(declare-fun tp!15700 () Bool)

(declare-fun e!115905 () Bool)

(assert (=> mapNonEmpty!7012 (= mapRes!7012 (and tp!15700 e!115905))))

(declare-fun mapValue!7012 () ValueCell!1712)

(declare-fun mapKey!7012 () (_ BitVec 32))

(declare-fun mapRest!7012 () (Array (_ BitVec 32) ValueCell!1712))

(assert (=> mapNonEmpty!7012 (= (arr!3496 (_values!3605 thiss!1248)) (store mapRest!7012 mapKey!7012 mapValue!7012))))

(declare-fun b!175603 () Bool)

(declare-fun res!83243 () Bool)

(assert (=> b!175603 (=> (not res!83243) (not e!115903))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!551 0))(
  ( (MissingZero!551 (index!4372 (_ BitVec 32))) (Found!551 (index!4373 (_ BitVec 32))) (Intermediate!551 (undefined!1363 Bool) (index!4374 (_ BitVec 32)) (x!19309 (_ BitVec 32))) (Undefined!551) (MissingVacant!551 (index!4375 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7363 (_ BitVec 32)) SeekEntryResult!551)

(assert (=> b!175603 (= res!83243 (is-Undefined!551 (seekEntryOrOpen!0 key!828 (_keys!5475 thiss!1248) (mask!8523 thiss!1248))))))

(declare-fun b!175604 () Bool)

(declare-fun e!115904 () Bool)

(assert (=> b!175604 (= e!115904 tp_is_empty!4111)))

(declare-fun b!175605 () Bool)

(assert (=> b!175605 (= e!115905 tp_is_empty!4111)))

(declare-fun b!175606 () Bool)

(declare-fun res!83244 () Bool)

(assert (=> b!175606 (=> (not res!83244) (not e!115903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!175606 (= res!83244 (validMask!0 (mask!8523 thiss!1248)))))

(declare-fun b!175607 () Bool)

(declare-fun res!83242 () Bool)

(assert (=> b!175607 (=> (not res!83242) (not e!115903))))

(declare-datatypes ((tuple2!3266 0))(
  ( (tuple2!3267 (_1!1644 (_ BitVec 64)) (_2!1644 V!5129)) )
))
(declare-datatypes ((List!2224 0))(
  ( (Nil!2221) (Cons!2220 (h!2839 tuple2!3266) (t!7044 List!2224)) )
))
(declare-datatypes ((ListLongMap!2193 0))(
  ( (ListLongMap!2194 (toList!1112 List!2224)) )
))
(declare-fun contains!1172 (ListLongMap!2193 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!764 (array!7363 array!7365 (_ BitVec 32) (_ BitVec 32) V!5129 V!5129 (_ BitVec 32) Int) ListLongMap!2193)

(assert (=> b!175607 (= res!83242 (contains!1172 (getCurrentListMap!764 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)) key!828))))

(declare-fun b!175608 () Bool)

(declare-fun res!83245 () Bool)

(assert (=> b!175608 (=> (not res!83245) (not e!115903))))

(assert (=> b!175608 (= res!83245 (not (= key!828 (bvneg key!828))))))

(declare-fun b!175609 () Bool)

(assert (=> b!175609 (= e!115902 (and e!115904 mapRes!7012))))

(declare-fun condMapEmpty!7012 () Bool)

(declare-fun mapDefault!7012 () ValueCell!1712)

