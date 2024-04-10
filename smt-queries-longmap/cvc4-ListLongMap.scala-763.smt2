; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17996 () Bool)

(assert start!17996)

(declare-fun b!179215 () Bool)

(declare-fun b_free!4421 () Bool)

(declare-fun b_next!4421 () Bool)

(assert (=> b!179215 (= b_free!4421 (not b_next!4421))))

(declare-fun tp!15984 () Bool)

(declare-fun b_and!10949 () Bool)

(assert (=> b!179215 (= tp!15984 b_and!10949)))

(declare-fun mapIsEmpty!7174 () Bool)

(declare-fun mapRes!7174 () Bool)

(assert (=> mapIsEmpty!7174 mapRes!7174))

(declare-fun b!179212 () Bool)

(declare-fun e!118083 () Bool)

(declare-datatypes ((V!5237 0))(
  ( (V!5238 (val!2141 Int)) )
))
(declare-datatypes ((ValueCell!1753 0))(
  ( (ValueCellFull!1753 (v!4027 V!5237)) (EmptyCell!1753) )
))
(declare-datatypes ((array!7549 0))(
  ( (array!7550 (arr!3577 (Array (_ BitVec 32) (_ BitVec 64))) (size!3885 (_ BitVec 32))) )
))
(declare-datatypes ((array!7551 0))(
  ( (array!7552 (arr!3578 (Array (_ BitVec 32) ValueCell!1753)) (size!3886 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2414 0))(
  ( (LongMapFixedSize!2415 (defaultEntry!3680 Int) (mask!8656 (_ BitVec 32)) (extraKeys!3417 (_ BitVec 32)) (zeroValue!3521 V!5237) (minValue!3521 V!5237) (_size!1256 (_ BitVec 32)) (_keys!5565 array!7549) (_values!3663 array!7551) (_vacant!1256 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2414)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7549 (_ BitVec 32)) Bool)

(assert (=> b!179212 (= e!118083 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5565 thiss!1248) (mask!8656 thiss!1248))))))

(declare-fun b!179213 () Bool)

(declare-fun res!84884 () Bool)

(assert (=> b!179213 (=> (not res!84884) (not e!118083))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3328 0))(
  ( (tuple2!3329 (_1!1675 (_ BitVec 64)) (_2!1675 V!5237)) )
))
(declare-datatypes ((List!2271 0))(
  ( (Nil!2268) (Cons!2267 (h!2892 tuple2!3328) (t!7113 List!2271)) )
))
(declare-datatypes ((ListLongMap!2255 0))(
  ( (ListLongMap!2256 (toList!1143 List!2271)) )
))
(declare-fun contains!1217 (ListLongMap!2255 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!795 (array!7549 array!7551 (_ BitVec 32) (_ BitVec 32) V!5237 V!5237 (_ BitVec 32) Int) ListLongMap!2255)

(assert (=> b!179213 (= res!84884 (not (contains!1217 (getCurrentListMap!795 (_keys!5565 thiss!1248) (_values!3663 thiss!1248) (mask!8656 thiss!1248) (extraKeys!3417 thiss!1248) (zeroValue!3521 thiss!1248) (minValue!3521 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3680 thiss!1248)) key!828)))))

(declare-fun b!179214 () Bool)

(declare-fun e!118080 () Bool)

(declare-fun tp_is_empty!4193 () Bool)

(assert (=> b!179214 (= e!118080 tp_is_empty!4193)))

(declare-fun e!118081 () Bool)

(declare-fun e!118084 () Bool)

(declare-fun array_inv!2303 (array!7549) Bool)

(declare-fun array_inv!2304 (array!7551) Bool)

(assert (=> b!179215 (= e!118084 (and tp!15984 tp_is_empty!4193 (array_inv!2303 (_keys!5565 thiss!1248)) (array_inv!2304 (_values!3663 thiss!1248)) e!118081))))

(declare-fun b!179216 () Bool)

(declare-fun res!84883 () Bool)

(assert (=> b!179216 (=> (not res!84883) (not e!118083))))

(assert (=> b!179216 (= res!84883 (not (= key!828 (bvneg key!828))))))

(declare-fun b!179217 () Bool)

(declare-fun e!118079 () Bool)

(assert (=> b!179217 (= e!118079 tp_is_empty!4193)))

(declare-fun mapNonEmpty!7174 () Bool)

(declare-fun tp!15985 () Bool)

(assert (=> mapNonEmpty!7174 (= mapRes!7174 (and tp!15985 e!118080))))

(declare-fun mapKey!7174 () (_ BitVec 32))

(declare-fun mapValue!7174 () ValueCell!1753)

(declare-fun mapRest!7174 () (Array (_ BitVec 32) ValueCell!1753))

(assert (=> mapNonEmpty!7174 (= (arr!3578 (_values!3663 thiss!1248)) (store mapRest!7174 mapKey!7174 mapValue!7174))))

(declare-fun b!179218 () Bool)

(assert (=> b!179218 (= e!118081 (and e!118079 mapRes!7174))))

(declare-fun condMapEmpty!7174 () Bool)

(declare-fun mapDefault!7174 () ValueCell!1753)

