; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16120 () Bool)

(assert start!16120)

(declare-fun b!160386 () Bool)

(declare-fun b_free!3581 () Bool)

(declare-fun b_next!3581 () Bool)

(assert (=> b!160386 (= b_free!3581 (not b_next!3581))))

(declare-fun tp!13312 () Bool)

(declare-fun b_and!9995 () Bool)

(assert (=> b!160386 (= tp!13312 b_and!9995)))

(declare-fun mapIsEmpty!5762 () Bool)

(declare-fun mapRes!5762 () Bool)

(assert (=> mapIsEmpty!5762 mapRes!5762))

(declare-fun tp_is_empty!3383 () Bool)

(declare-fun e!104878 () Bool)

(declare-datatypes ((V!4157 0))(
  ( (V!4158 (val!1736 Int)) )
))
(declare-datatypes ((ValueCell!1348 0))(
  ( (ValueCellFull!1348 (v!3601 V!4157)) (EmptyCell!1348) )
))
(declare-datatypes ((array!5845 0))(
  ( (array!5846 (arr!2767 (Array (_ BitVec 32) (_ BitVec 64))) (size!3051 (_ BitVec 32))) )
))
(declare-datatypes ((array!5847 0))(
  ( (array!5848 (arr!2768 (Array (_ BitVec 32) ValueCell!1348)) (size!3052 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1604 0))(
  ( (LongMapFixedSize!1605 (defaultEntry!3244 Int) (mask!7812 (_ BitVec 32)) (extraKeys!2985 (_ BitVec 32)) (zeroValue!3087 V!4157) (minValue!3087 V!4157) (_size!851 (_ BitVec 32)) (_keys!5045 array!5845) (_values!3227 array!5847) (_vacant!851 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1604)

(declare-fun e!104880 () Bool)

(declare-fun array_inv!1763 (array!5845) Bool)

(declare-fun array_inv!1764 (array!5847) Bool)

(assert (=> b!160386 (= e!104880 (and tp!13312 tp_is_empty!3383 (array_inv!1763 (_keys!5045 thiss!1248)) (array_inv!1764 (_values!3227 thiss!1248)) e!104878))))

(declare-fun b!160387 () Bool)

(declare-fun res!75934 () Bool)

(declare-fun e!104879 () Bool)

(assert (=> b!160387 (=> (not res!75934) (not e!104879))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2916 0))(
  ( (tuple2!2917 (_1!1469 (_ BitVec 64)) (_2!1469 V!4157)) )
))
(declare-datatypes ((List!1940 0))(
  ( (Nil!1937) (Cons!1936 (h!2549 tuple2!2916) (t!6742 List!1940)) )
))
(declare-datatypes ((ListLongMap!1903 0))(
  ( (ListLongMap!1904 (toList!967 List!1940)) )
))
(declare-fun contains!1003 (ListLongMap!1903 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!631 (array!5845 array!5847 (_ BitVec 32) (_ BitVec 32) V!4157 V!4157 (_ BitVec 32) Int) ListLongMap!1903)

(assert (=> b!160387 (= res!75934 (not (contains!1003 (getCurrentListMap!631 (_keys!5045 thiss!1248) (_values!3227 thiss!1248) (mask!7812 thiss!1248) (extraKeys!2985 thiss!1248) (zeroValue!3087 thiss!1248) (minValue!3087 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3244 thiss!1248)) key!828)))))

(declare-fun b!160388 () Bool)

(declare-fun res!75933 () Bool)

(assert (=> b!160388 (=> (not res!75933) (not e!104879))))

(assert (=> b!160388 (= res!75933 (and (= (size!3052 (_values!3227 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7812 thiss!1248))) (= (size!3051 (_keys!5045 thiss!1248)) (size!3052 (_values!3227 thiss!1248))) (bvsge (mask!7812 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2985 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2985 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160389 () Bool)

(declare-fun res!75935 () Bool)

(assert (=> b!160389 (=> (not res!75935) (not e!104879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160389 (= res!75935 (validMask!0 (mask!7812 thiss!1248)))))

(declare-fun b!160390 () Bool)

(declare-fun res!75936 () Bool)

(assert (=> b!160390 (=> (not res!75936) (not e!104879))))

(assert (=> b!160390 (= res!75936 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160391 () Bool)

(declare-fun res!75938 () Bool)

(assert (=> b!160391 (=> (not res!75938) (not e!104879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5845 (_ BitVec 32)) Bool)

(assert (=> b!160391 (= res!75938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5045 thiss!1248) (mask!7812 thiss!1248)))))

(declare-fun res!75932 () Bool)

(assert (=> start!16120 (=> (not res!75932) (not e!104879))))

(declare-fun valid!743 (LongMapFixedSize!1604) Bool)

(assert (=> start!16120 (= res!75932 (valid!743 thiss!1248))))

(assert (=> start!16120 e!104879))

(assert (=> start!16120 e!104880))

(assert (=> start!16120 true))

(declare-fun mapNonEmpty!5762 () Bool)

(declare-fun tp!13313 () Bool)

(declare-fun e!104875 () Bool)

(assert (=> mapNonEmpty!5762 (= mapRes!5762 (and tp!13313 e!104875))))

(declare-fun mapKey!5762 () (_ BitVec 32))

(declare-fun mapValue!5762 () ValueCell!1348)

(declare-fun mapRest!5762 () (Array (_ BitVec 32) ValueCell!1348))

(assert (=> mapNonEmpty!5762 (= (arr!2768 (_values!3227 thiss!1248)) (store mapRest!5762 mapKey!5762 mapValue!5762))))

(declare-fun b!160392 () Bool)

(assert (=> b!160392 (= e!104875 tp_is_empty!3383)))

(declare-fun b!160393 () Bool)

(declare-fun res!75937 () Bool)

(assert (=> b!160393 (=> (not res!75937) (not e!104879))))

(declare-datatypes ((SeekEntryResult!330 0))(
  ( (MissingZero!330 (index!3488 (_ BitVec 32))) (Found!330 (index!3489 (_ BitVec 32))) (Intermediate!330 (undefined!1142 Bool) (index!3490 (_ BitVec 32)) (x!17698 (_ BitVec 32))) (Undefined!330) (MissingVacant!330 (index!3491 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5845 (_ BitVec 32)) SeekEntryResult!330)

(assert (=> b!160393 (= res!75937 (is-Undefined!330 (seekEntryOrOpen!0 key!828 (_keys!5045 thiss!1248) (mask!7812 thiss!1248))))))

(declare-fun b!160394 () Bool)

(declare-fun e!104876 () Bool)

(assert (=> b!160394 (= e!104876 tp_is_empty!3383)))

(declare-fun b!160395 () Bool)

(assert (=> b!160395 (= e!104878 (and e!104876 mapRes!5762))))

(declare-fun condMapEmpty!5762 () Bool)

(declare-fun mapDefault!5762 () ValueCell!1348)

