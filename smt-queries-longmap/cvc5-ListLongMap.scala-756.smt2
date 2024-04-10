; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17722 () Bool)

(assert start!17722)

(declare-fun b!177163 () Bool)

(declare-fun b_free!4375 () Bool)

(declare-fun b_next!4375 () Bool)

(assert (=> b!177163 (= b_free!4375 (not b_next!4375))))

(declare-fun tp!15825 () Bool)

(declare-fun b_and!10875 () Bool)

(assert (=> b!177163 (= tp!15825 b_and!10875)))

(declare-fun b!177160 () Bool)

(declare-fun res!83981 () Bool)

(declare-fun e!116827 () Bool)

(assert (=> b!177160 (=> (not res!83981) (not e!116827))))

(declare-datatypes ((V!5177 0))(
  ( (V!5178 (val!2118 Int)) )
))
(declare-datatypes ((ValueCell!1730 0))(
  ( (ValueCellFull!1730 (v!3998 V!5177)) (EmptyCell!1730) )
))
(declare-datatypes ((array!7445 0))(
  ( (array!7446 (arr!3531 (Array (_ BitVec 32) (_ BitVec 64))) (size!3835 (_ BitVec 32))) )
))
(declare-datatypes ((array!7447 0))(
  ( (array!7448 (arr!3532 (Array (_ BitVec 32) ValueCell!1730)) (size!3836 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2368 0))(
  ( (LongMapFixedSize!2369 (defaultEntry!3647 Int) (mask!8581 (_ BitVec 32)) (extraKeys!3384 (_ BitVec 32)) (zeroValue!3488 V!5177) (minValue!3488 V!5177) (_size!1233 (_ BitVec 32)) (_keys!5514 array!7445) (_values!3630 array!7447) (_vacant!1233 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2368)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3298 0))(
  ( (tuple2!3299 (_1!1660 (_ BitVec 64)) (_2!1660 V!5177)) )
))
(declare-datatypes ((List!2250 0))(
  ( (Nil!2247) (Cons!2246 (h!2867 tuple2!3298) (t!7080 List!2250)) )
))
(declare-datatypes ((ListLongMap!2225 0))(
  ( (ListLongMap!2226 (toList!1128 List!2250)) )
))
(declare-fun contains!1194 (ListLongMap!2225 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!780 (array!7445 array!7447 (_ BitVec 32) (_ BitVec 32) V!5177 V!5177 (_ BitVec 32) Int) ListLongMap!2225)

(assert (=> b!177160 (= res!83981 (contains!1194 (getCurrentListMap!780 (_keys!5514 thiss!1248) (_values!3630 thiss!1248) (mask!8581 thiss!1248) (extraKeys!3384 thiss!1248) (zeroValue!3488 thiss!1248) (minValue!3488 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3647 thiss!1248)) key!828))))

(declare-fun b!177161 () Bool)

(declare-fun res!83978 () Bool)

(assert (=> b!177161 (=> (not res!83978) (not e!116827))))

(declare-datatypes ((SeekEntryResult!563 0))(
  ( (MissingZero!563 (index!4420 (_ BitVec 32))) (Found!563 (index!4421 (_ BitVec 32))) (Intermediate!563 (undefined!1375 Bool) (index!4422 (_ BitVec 32)) (x!19435 (_ BitVec 32))) (Undefined!563) (MissingVacant!563 (index!4423 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7445 (_ BitVec 32)) SeekEntryResult!563)

(assert (=> b!177161 (= res!83978 (is-Undefined!563 (seekEntryOrOpen!0 key!828 (_keys!5514 thiss!1248) (mask!8581 thiss!1248))))))

(declare-fun b!177162 () Bool)

(declare-fun res!83979 () Bool)

(assert (=> b!177162 (=> (not res!83979) (not e!116827))))

(assert (=> b!177162 (= res!83979 (not (= key!828 (bvneg key!828))))))

(declare-fun e!116823 () Bool)

(declare-fun tp_is_empty!4147 () Bool)

(declare-fun e!116826 () Bool)

(declare-fun array_inv!2263 (array!7445) Bool)

(declare-fun array_inv!2264 (array!7447) Bool)

(assert (=> b!177163 (= e!116826 (and tp!15825 tp_is_empty!4147 (array_inv!2263 (_keys!5514 thiss!1248)) (array_inv!2264 (_values!3630 thiss!1248)) e!116823))))

(declare-fun mapIsEmpty!7083 () Bool)

(declare-fun mapRes!7083 () Bool)

(assert (=> mapIsEmpty!7083 mapRes!7083))

(declare-fun mapNonEmpty!7083 () Bool)

(declare-fun tp!15824 () Bool)

(declare-fun e!116825 () Bool)

(assert (=> mapNonEmpty!7083 (= mapRes!7083 (and tp!15824 e!116825))))

(declare-fun mapKey!7083 () (_ BitVec 32))

(declare-fun mapValue!7083 () ValueCell!1730)

(declare-fun mapRest!7083 () (Array (_ BitVec 32) ValueCell!1730))

(assert (=> mapNonEmpty!7083 (= (arr!3532 (_values!3630 thiss!1248)) (store mapRest!7083 mapKey!7083 mapValue!7083))))

(declare-fun b!177164 () Bool)

(declare-fun e!116828 () Bool)

(assert (=> b!177164 (= e!116823 (and e!116828 mapRes!7083))))

(declare-fun condMapEmpty!7083 () Bool)

(declare-fun mapDefault!7083 () ValueCell!1730)

