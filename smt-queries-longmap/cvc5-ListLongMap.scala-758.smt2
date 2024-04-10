; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17748 () Bool)

(assert start!17748)

(declare-fun b!177420 () Bool)

(declare-fun b_free!4387 () Bool)

(declare-fun b_next!4387 () Bool)

(assert (=> b!177420 (= b_free!4387 (not b_next!4387))))

(declare-fun tp!15863 () Bool)

(declare-fun b_and!10889 () Bool)

(assert (=> b!177420 (= tp!15863 b_and!10889)))

(declare-fun b!177415 () Bool)

(declare-fun res!84095 () Bool)

(declare-fun e!116997 () Bool)

(assert (=> b!177415 (=> (not res!84095) (not e!116997))))

(declare-datatypes ((V!5193 0))(
  ( (V!5194 (val!2124 Int)) )
))
(declare-datatypes ((ValueCell!1736 0))(
  ( (ValueCellFull!1736 (v!4005 V!5193)) (EmptyCell!1736) )
))
(declare-datatypes ((array!7471 0))(
  ( (array!7472 (arr!3543 (Array (_ BitVec 32) (_ BitVec 64))) (size!3847 (_ BitVec 32))) )
))
(declare-datatypes ((array!7473 0))(
  ( (array!7474 (arr!3544 (Array (_ BitVec 32) ValueCell!1736)) (size!3848 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2380 0))(
  ( (LongMapFixedSize!2381 (defaultEntry!3654 Int) (mask!8594 (_ BitVec 32)) (extraKeys!3391 (_ BitVec 32)) (zeroValue!3495 V!5193) (minValue!3495 V!5193) (_size!1239 (_ BitVec 32)) (_keys!5522 array!7471) (_values!3637 array!7473) (_vacant!1239 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2380)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!177415 (= res!84095 (validMask!0 (mask!8594 thiss!1248)))))

(declare-fun b!177416 () Bool)

(declare-fun res!84092 () Bool)

(assert (=> b!177416 (=> (not res!84092) (not e!116997))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!177416 (= res!84092 (not (= key!828 (bvneg key!828))))))

(declare-fun b!177417 () Bool)

(declare-fun res!84094 () Bool)

(assert (=> b!177417 (=> (not res!84094) (not e!116997))))

(declare-datatypes ((tuple2!3306 0))(
  ( (tuple2!3307 (_1!1664 (_ BitVec 64)) (_2!1664 V!5193)) )
))
(declare-datatypes ((List!2255 0))(
  ( (Nil!2252) (Cons!2251 (h!2872 tuple2!3306) (t!7087 List!2255)) )
))
(declare-datatypes ((ListLongMap!2233 0))(
  ( (ListLongMap!2234 (toList!1132 List!2255)) )
))
(declare-fun contains!1198 (ListLongMap!2233 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!784 (array!7471 array!7473 (_ BitVec 32) (_ BitVec 32) V!5193 V!5193 (_ BitVec 32) Int) ListLongMap!2233)

(assert (=> b!177417 (= res!84094 (not (contains!1198 (getCurrentListMap!784 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)) key!828)))))

(declare-fun b!177418 () Bool)

(declare-fun e!116996 () Bool)

(declare-fun tp_is_empty!4159 () Bool)

(assert (=> b!177418 (= e!116996 tp_is_empty!4159)))

(declare-fun mapIsEmpty!7104 () Bool)

(declare-fun mapRes!7104 () Bool)

(assert (=> mapIsEmpty!7104 mapRes!7104))

(declare-fun b!177419 () Bool)

(declare-fun res!84093 () Bool)

(assert (=> b!177419 (=> (not res!84093) (not e!116997))))

(declare-datatypes ((SeekEntryResult!567 0))(
  ( (MissingZero!567 (index!4436 (_ BitVec 32))) (Found!567 (index!4437 (_ BitVec 32))) (Intermediate!567 (undefined!1379 Bool) (index!4438 (_ BitVec 32)) (x!19465 (_ BitVec 32))) (Undefined!567) (MissingVacant!567 (index!4439 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7471 (_ BitVec 32)) SeekEntryResult!567)

(assert (=> b!177419 (= res!84093 (is-Undefined!567 (seekEntryOrOpen!0 key!828 (_keys!5522 thiss!1248) (mask!8594 thiss!1248))))))

(declare-fun e!116999 () Bool)

(declare-fun e!116995 () Bool)

(declare-fun array_inv!2273 (array!7471) Bool)

(declare-fun array_inv!2274 (array!7473) Bool)

(assert (=> b!177420 (= e!116999 (and tp!15863 tp_is_empty!4159 (array_inv!2273 (_keys!5522 thiss!1248)) (array_inv!2274 (_values!3637 thiss!1248)) e!116995))))

(declare-fun b!177421 () Bool)

(assert (=> b!177421 (= e!116995 (and e!116996 mapRes!7104))))

(declare-fun condMapEmpty!7104 () Bool)

(declare-fun mapDefault!7104 () ValueCell!1736)

