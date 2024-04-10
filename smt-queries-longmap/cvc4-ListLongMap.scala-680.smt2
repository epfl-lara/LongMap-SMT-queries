; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16588 () Bool)

(assert start!16588)

(declare-fun b!165378 () Bool)

(declare-fun b_free!3893 () Bool)

(declare-fun b_next!3893 () Bool)

(assert (=> b!165378 (= b_free!3893 (not b_next!3893))))

(declare-fun tp!14280 () Bool)

(declare-fun b_and!10307 () Bool)

(assert (=> b!165378 (= tp!14280 b_and!10307)))

(declare-fun b!165371 () Bool)

(declare-fun e!108479 () Bool)

(declare-fun tp_is_empty!3695 () Bool)

(assert (=> b!165371 (= e!108479 tp_is_empty!3695)))

(declare-fun b!165372 () Bool)

(declare-fun e!108485 () Bool)

(declare-fun e!108481 () Bool)

(assert (=> b!165372 (= e!108485 e!108481)))

(declare-fun res!78453 () Bool)

(assert (=> b!165372 (=> (not res!78453) (not e!108481))))

(declare-datatypes ((SeekEntryResult!435 0))(
  ( (MissingZero!435 (index!3908 (_ BitVec 32))) (Found!435 (index!3909 (_ BitVec 32))) (Intermediate!435 (undefined!1247 Bool) (index!3910 (_ BitVec 32)) (x!18327 (_ BitVec 32))) (Undefined!435) (MissingVacant!435 (index!3911 (_ BitVec 32))) )
))
(declare-fun lt!83059 () SeekEntryResult!435)

(assert (=> b!165372 (= res!78453 (and (not (is-Undefined!435 lt!83059)) (not (is-MissingVacant!435 lt!83059)) (not (is-MissingZero!435 lt!83059)) (is-Found!435 lt!83059)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4573 0))(
  ( (V!4574 (val!1892 Int)) )
))
(declare-datatypes ((ValueCell!1504 0))(
  ( (ValueCellFull!1504 (v!3757 V!4573)) (EmptyCell!1504) )
))
(declare-datatypes ((array!6487 0))(
  ( (array!6488 (arr!3079 (Array (_ BitVec 32) (_ BitVec 64))) (size!3367 (_ BitVec 32))) )
))
(declare-datatypes ((array!6489 0))(
  ( (array!6490 (arr!3080 (Array (_ BitVec 32) ValueCell!1504)) (size!3368 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1916 0))(
  ( (LongMapFixedSize!1917 (defaultEntry!3400 Int) (mask!8109 (_ BitVec 32)) (extraKeys!3141 (_ BitVec 32)) (zeroValue!3243 V!4573) (minValue!3243 V!4573) (_size!1007 (_ BitVec 32)) (_keys!5225 array!6487) (_values!3383 array!6489) (_vacant!1007 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1916)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6487 (_ BitVec 32)) SeekEntryResult!435)

(assert (=> b!165372 (= lt!83059 (seekEntryOrOpen!0 key!828 (_keys!5225 thiss!1248) (mask!8109 thiss!1248)))))

(declare-fun b!165374 () Bool)

(declare-fun res!78450 () Bool)

(assert (=> b!165374 (=> (not res!78450) (not e!108481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165374 (= res!78450 (validMask!0 (mask!8109 thiss!1248)))))

(declare-fun b!165375 () Bool)

(declare-fun res!78448 () Bool)

(assert (=> b!165375 (=> (not res!78448) (not e!108481))))

(assert (=> b!165375 (= res!78448 (and (= (size!3368 (_values!3383 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8109 thiss!1248))) (= (size!3367 (_keys!5225 thiss!1248)) (size!3368 (_values!3383 thiss!1248))) (bvsge (mask!8109 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3141 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3141 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165376 () Bool)

(declare-fun res!78447 () Bool)

(assert (=> b!165376 (=> (not res!78447) (not e!108485))))

(assert (=> b!165376 (= res!78447 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165377 () Bool)

(assert (=> b!165377 (= e!108481 false)))

(declare-fun lt!83058 () Bool)

(declare-datatypes ((List!2049 0))(
  ( (Nil!2046) (Cons!2045 (h!2662 (_ BitVec 64)) (t!6851 List!2049)) )
))
(declare-fun arrayNoDuplicates!0 (array!6487 (_ BitVec 32) List!2049) Bool)

(assert (=> b!165377 (= lt!83058 (arrayNoDuplicates!0 (_keys!5225 thiss!1248) #b00000000000000000000000000000000 Nil!2046))))

(declare-fun e!108480 () Bool)

(declare-fun e!108484 () Bool)

(declare-fun array_inv!1977 (array!6487) Bool)

(declare-fun array_inv!1978 (array!6489) Bool)

(assert (=> b!165378 (= e!108484 (and tp!14280 tp_is_empty!3695 (array_inv!1977 (_keys!5225 thiss!1248)) (array_inv!1978 (_values!3383 thiss!1248)) e!108480))))

(declare-fun res!78452 () Bool)

(assert (=> start!16588 (=> (not res!78452) (not e!108485))))

(declare-fun valid!848 (LongMapFixedSize!1916) Bool)

(assert (=> start!16588 (= res!78452 (valid!848 thiss!1248))))

(assert (=> start!16588 e!108485))

(assert (=> start!16588 e!108484))

(assert (=> start!16588 true))

(declare-fun b!165373 () Bool)

(declare-fun res!78451 () Bool)

(assert (=> b!165373 (=> (not res!78451) (not e!108481))))

(declare-datatypes ((tuple2!3066 0))(
  ( (tuple2!3067 (_1!1544 (_ BitVec 64)) (_2!1544 V!4573)) )
))
(declare-datatypes ((List!2050 0))(
  ( (Nil!2047) (Cons!2046 (h!2663 tuple2!3066) (t!6852 List!2050)) )
))
(declare-datatypes ((ListLongMap!2021 0))(
  ( (ListLongMap!2022 (toList!1026 List!2050)) )
))
(declare-fun contains!1068 (ListLongMap!2021 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!684 (array!6487 array!6489 (_ BitVec 32) (_ BitVec 32) V!4573 V!4573 (_ BitVec 32) Int) ListLongMap!2021)

(assert (=> b!165373 (= res!78451 (not (contains!1068 (getCurrentListMap!684 (_keys!5225 thiss!1248) (_values!3383 thiss!1248) (mask!8109 thiss!1248) (extraKeys!3141 thiss!1248) (zeroValue!3243 thiss!1248) (minValue!3243 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3400 thiss!1248)) key!828)))))

(declare-fun mapNonEmpty!6261 () Bool)

(declare-fun mapRes!6261 () Bool)

(declare-fun tp!14279 () Bool)

(declare-fun e!108483 () Bool)

(assert (=> mapNonEmpty!6261 (= mapRes!6261 (and tp!14279 e!108483))))

(declare-fun mapRest!6261 () (Array (_ BitVec 32) ValueCell!1504))

(declare-fun mapValue!6261 () ValueCell!1504)

(declare-fun mapKey!6261 () (_ BitVec 32))

(assert (=> mapNonEmpty!6261 (= (arr!3080 (_values!3383 thiss!1248)) (store mapRest!6261 mapKey!6261 mapValue!6261))))

(declare-fun b!165379 () Bool)

(assert (=> b!165379 (= e!108480 (and e!108479 mapRes!6261))))

(declare-fun condMapEmpty!6261 () Bool)

(declare-fun mapDefault!6261 () ValueCell!1504)

