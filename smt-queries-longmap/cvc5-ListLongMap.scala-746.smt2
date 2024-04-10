; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17380 () Bool)

(assert start!17380)

(declare-fun b!174462 () Bool)

(declare-fun b_free!4315 () Bool)

(declare-fun b_next!4315 () Bool)

(assert (=> b!174462 (= b_free!4315 (not b_next!4315))))

(declare-fun tp!15613 () Bool)

(declare-fun b_and!10781 () Bool)

(assert (=> b!174462 (= tp!15613 b_and!10781)))

(declare-fun b!174456 () Bool)

(declare-fun e!115205 () Bool)

(declare-datatypes ((V!5097 0))(
  ( (V!5098 (val!2088 Int)) )
))
(declare-datatypes ((ValueCell!1700 0))(
  ( (ValueCellFull!1700 (v!3959 V!5097)) (EmptyCell!1700) )
))
(declare-datatypes ((array!7307 0))(
  ( (array!7308 (arr!3471 (Array (_ BitVec 32) (_ BitVec 64))) (size!3771 (_ BitVec 32))) )
))
(declare-datatypes ((array!7309 0))(
  ( (array!7310 (arr!3472 (Array (_ BitVec 32) ValueCell!1700)) (size!3772 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2308 0))(
  ( (LongMapFixedSize!2309 (defaultEntry!3604 Int) (mask!8481 (_ BitVec 32)) (extraKeys!3341 (_ BitVec 32)) (zeroValue!3445 V!5097) (minValue!3445 V!5097) (_size!1203 (_ BitVec 32)) (_keys!5447 array!7307) (_values!3587 array!7309) (_vacant!1203 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2308)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!174456 (= e!115205 (not (validMask!0 (mask!8481 thiss!1248))))))

(declare-fun b!174457 () Bool)

(declare-fun e!115203 () Bool)

(declare-fun tp_is_empty!4087 () Bool)

(assert (=> b!174457 (= e!115203 tp_is_empty!4087)))

(declare-fun b!174458 () Bool)

(declare-fun res!82749 () Bool)

(assert (=> b!174458 (=> (not res!82749) (not e!115205))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!543 0))(
  ( (MissingZero!543 (index!4340 (_ BitVec 32))) (Found!543 (index!4341 (_ BitVec 32))) (Intermediate!543 (undefined!1355 Bool) (index!4342 (_ BitVec 32)) (x!19213 (_ BitVec 32))) (Undefined!543) (MissingVacant!543 (index!4343 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7307 (_ BitVec 32)) SeekEntryResult!543)

(assert (=> b!174458 (= res!82749 (is-Undefined!543 (seekEntryOrOpen!0 key!828 (_keys!5447 thiss!1248) (mask!8481 thiss!1248))))))

(declare-fun b!174459 () Bool)

(declare-fun res!82746 () Bool)

(assert (=> b!174459 (=> (not res!82746) (not e!115205))))

(declare-datatypes ((tuple2!3244 0))(
  ( (tuple2!3245 (_1!1633 (_ BitVec 64)) (_2!1633 V!5097)) )
))
(declare-datatypes ((List!2209 0))(
  ( (Nil!2206) (Cons!2205 (h!2822 tuple2!3244) (t!7021 List!2209)) )
))
(declare-datatypes ((ListLongMap!2171 0))(
  ( (ListLongMap!2172 (toList!1101 List!2209)) )
))
(declare-fun contains!1157 (ListLongMap!2171 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!753 (array!7307 array!7309 (_ BitVec 32) (_ BitVec 32) V!5097 V!5097 (_ BitVec 32) Int) ListLongMap!2171)

(assert (=> b!174459 (= res!82746 (contains!1157 (getCurrentListMap!753 (_keys!5447 thiss!1248) (_values!3587 thiss!1248) (mask!8481 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)) key!828))))

(declare-fun b!174460 () Bool)

(declare-fun res!82748 () Bool)

(assert (=> b!174460 (=> (not res!82748) (not e!115205))))

(assert (=> b!174460 (= res!82748 (not (= key!828 (bvneg key!828))))))

(declare-fun b!174461 () Bool)

(declare-fun e!115204 () Bool)

(assert (=> b!174461 (= e!115204 tp_is_empty!4087)))

(declare-fun res!82747 () Bool)

(assert (=> start!17380 (=> (not res!82747) (not e!115205))))

(declare-fun valid!975 (LongMapFixedSize!2308) Bool)

(assert (=> start!17380 (= res!82747 (valid!975 thiss!1248))))

(assert (=> start!17380 e!115205))

(declare-fun e!115206 () Bool)

(assert (=> start!17380 e!115206))

(assert (=> start!17380 true))

(declare-fun e!115201 () Bool)

(declare-fun array_inv!2221 (array!7307) Bool)

(declare-fun array_inv!2222 (array!7309) Bool)

(assert (=> b!174462 (= e!115206 (and tp!15613 tp_is_empty!4087 (array_inv!2221 (_keys!5447 thiss!1248)) (array_inv!2222 (_values!3587 thiss!1248)) e!115201))))

(declare-fun mapIsEmpty!6962 () Bool)

(declare-fun mapRes!6962 () Bool)

(assert (=> mapIsEmpty!6962 mapRes!6962))

(declare-fun mapNonEmpty!6962 () Bool)

(declare-fun tp!15614 () Bool)

(assert (=> mapNonEmpty!6962 (= mapRes!6962 (and tp!15614 e!115203))))

(declare-fun mapValue!6962 () ValueCell!1700)

(declare-fun mapRest!6962 () (Array (_ BitVec 32) ValueCell!1700))

(declare-fun mapKey!6962 () (_ BitVec 32))

(assert (=> mapNonEmpty!6962 (= (arr!3472 (_values!3587 thiss!1248)) (store mapRest!6962 mapKey!6962 mapValue!6962))))

(declare-fun b!174463 () Bool)

(assert (=> b!174463 (= e!115201 (and e!115204 mapRes!6962))))

(declare-fun condMapEmpty!6962 () Bool)

(declare-fun mapDefault!6962 () ValueCell!1700)

