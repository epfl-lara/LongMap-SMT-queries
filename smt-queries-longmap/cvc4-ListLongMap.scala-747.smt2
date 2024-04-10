; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17404 () Bool)

(assert start!17404)

(declare-fun b!174696 () Bool)

(declare-fun b_free!4325 () Bool)

(declare-fun b_next!4325 () Bool)

(assert (=> b!174696 (= b_free!4325 (not b_next!4325))))

(declare-fun tp!15646 () Bool)

(declare-fun b_and!10793 () Bool)

(assert (=> b!174696 (= tp!15646 b_and!10793)))

(declare-fun b!174693 () Bool)

(declare-fun e!115354 () Bool)

(declare-fun tp_is_empty!4097 () Bool)

(assert (=> b!174693 (= e!115354 tp_is_empty!4097)))

(declare-fun b!174694 () Bool)

(declare-fun e!115356 () Bool)

(assert (=> b!174694 (= e!115356 tp_is_empty!4097)))

(declare-fun b!174695 () Bool)

(declare-fun res!82854 () Bool)

(declare-fun e!115358 () Bool)

(assert (=> b!174695 (=> (not res!82854) (not e!115358))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!174695 (= res!82854 (not (= key!828 (bvneg key!828))))))

(declare-fun res!82853 () Bool)

(assert (=> start!17404 (=> (not res!82853) (not e!115358))))

(declare-datatypes ((V!5109 0))(
  ( (V!5110 (val!2093 Int)) )
))
(declare-datatypes ((ValueCell!1705 0))(
  ( (ValueCellFull!1705 (v!3965 V!5109)) (EmptyCell!1705) )
))
(declare-datatypes ((array!7329 0))(
  ( (array!7330 (arr!3481 (Array (_ BitVec 32) (_ BitVec 64))) (size!3781 (_ BitVec 32))) )
))
(declare-datatypes ((array!7331 0))(
  ( (array!7332 (arr!3482 (Array (_ BitVec 32) ValueCell!1705)) (size!3782 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2318 0))(
  ( (LongMapFixedSize!2319 (defaultEntry!3610 Int) (mask!8491 (_ BitVec 32)) (extraKeys!3347 (_ BitVec 32)) (zeroValue!3451 V!5109) (minValue!3451 V!5109) (_size!1208 (_ BitVec 32)) (_keys!5454 array!7329) (_values!3593 array!7331) (_vacant!1208 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2318)

(declare-fun valid!979 (LongMapFixedSize!2318) Bool)

(assert (=> start!17404 (= res!82853 (valid!979 thiss!1248))))

(assert (=> start!17404 e!115358))

(declare-fun e!115357 () Bool)

(assert (=> start!17404 e!115357))

(assert (=> start!17404 true))

(declare-fun mapNonEmpty!6980 () Bool)

(declare-fun mapRes!6980 () Bool)

(declare-fun tp!15647 () Bool)

(assert (=> mapNonEmpty!6980 (= mapRes!6980 (and tp!15647 e!115354))))

(declare-fun mapKey!6980 () (_ BitVec 32))

(declare-fun mapRest!6980 () (Array (_ BitVec 32) ValueCell!1705))

(declare-fun mapValue!6980 () ValueCell!1705)

(assert (=> mapNonEmpty!6980 (= (arr!3482 (_values!3593 thiss!1248)) (store mapRest!6980 mapKey!6980 mapValue!6980))))

(declare-fun e!115359 () Bool)

(declare-fun array_inv!2229 (array!7329) Bool)

(declare-fun array_inv!2230 (array!7331) Bool)

(assert (=> b!174696 (= e!115357 (and tp!15646 tp_is_empty!4097 (array_inv!2229 (_keys!5454 thiss!1248)) (array_inv!2230 (_values!3593 thiss!1248)) e!115359))))

(declare-fun mapIsEmpty!6980 () Bool)

(assert (=> mapIsEmpty!6980 mapRes!6980))

(declare-fun b!174697 () Bool)

(assert (=> b!174697 (= e!115358 (not (= (size!3782 (_values!3593 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8491 thiss!1248)))))))

(declare-fun b!174698 () Bool)

(declare-fun res!82856 () Bool)

(assert (=> b!174698 (=> (not res!82856) (not e!115358))))

(declare-datatypes ((tuple2!3254 0))(
  ( (tuple2!3255 (_1!1638 (_ BitVec 64)) (_2!1638 V!5109)) )
))
(declare-datatypes ((List!2215 0))(
  ( (Nil!2212) (Cons!2211 (h!2828 tuple2!3254) (t!7029 List!2215)) )
))
(declare-datatypes ((ListLongMap!2181 0))(
  ( (ListLongMap!2182 (toList!1106 List!2215)) )
))
(declare-fun contains!1162 (ListLongMap!2181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!758 (array!7329 array!7331 (_ BitVec 32) (_ BitVec 32) V!5109 V!5109 (_ BitVec 32) Int) ListLongMap!2181)

(assert (=> b!174698 (= res!82856 (contains!1162 (getCurrentListMap!758 (_keys!5454 thiss!1248) (_values!3593 thiss!1248) (mask!8491 thiss!1248) (extraKeys!3347 thiss!1248) (zeroValue!3451 thiss!1248) (minValue!3451 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3610 thiss!1248)) key!828))))

(declare-fun b!174699 () Bool)

(declare-fun res!82855 () Bool)

(assert (=> b!174699 (=> (not res!82855) (not e!115358))))

(declare-datatypes ((SeekEntryResult!547 0))(
  ( (MissingZero!547 (index!4356 (_ BitVec 32))) (Found!547 (index!4357 (_ BitVec 32))) (Intermediate!547 (undefined!1359 Bool) (index!4358 (_ BitVec 32)) (x!19235 (_ BitVec 32))) (Undefined!547) (MissingVacant!547 (index!4359 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7329 (_ BitVec 32)) SeekEntryResult!547)

(assert (=> b!174699 (= res!82855 (is-Undefined!547 (seekEntryOrOpen!0 key!828 (_keys!5454 thiss!1248) (mask!8491 thiss!1248))))))

(declare-fun b!174700 () Bool)

(declare-fun res!82857 () Bool)

(assert (=> b!174700 (=> (not res!82857) (not e!115358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!174700 (= res!82857 (validMask!0 (mask!8491 thiss!1248)))))

(declare-fun b!174701 () Bool)

(assert (=> b!174701 (= e!115359 (and e!115356 mapRes!6980))))

(declare-fun condMapEmpty!6980 () Bool)

(declare-fun mapDefault!6980 () ValueCell!1705)

