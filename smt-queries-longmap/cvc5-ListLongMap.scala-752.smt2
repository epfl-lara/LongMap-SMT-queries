; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17644 () Bool)

(assert start!17644)

(declare-fun b!176376 () Bool)

(declare-fun b_free!4351 () Bool)

(declare-fun b_next!4351 () Bool)

(assert (=> b!176376 (= b_free!4351 (not b_next!4351))))

(declare-fun tp!15743 () Bool)

(declare-fun b_and!10845 () Bool)

(assert (=> b!176376 (= tp!15743 b_and!10845)))

(declare-fun b!176375 () Bool)

(declare-fun res!83578 () Bool)

(declare-fun e!116370 () Bool)

(assert (=> b!176375 (=> (not res!83578) (not e!116370))))

(declare-datatypes ((V!5145 0))(
  ( (V!5146 (val!2106 Int)) )
))
(declare-datatypes ((ValueCell!1718 0))(
  ( (ValueCellFull!1718 (v!3983 V!5145)) (EmptyCell!1718) )
))
(declare-datatypes ((array!7391 0))(
  ( (array!7392 (arr!3507 (Array (_ BitVec 32) (_ BitVec 64))) (size!3811 (_ BitVec 32))) )
))
(declare-datatypes ((array!7393 0))(
  ( (array!7394 (arr!3508 (Array (_ BitVec 32) ValueCell!1718)) (size!3812 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2344 0))(
  ( (LongMapFixedSize!2345 (defaultEntry!3632 Int) (mask!8549 (_ BitVec 32)) (extraKeys!3369 (_ BitVec 32)) (zeroValue!3473 V!5145) (minValue!3473 V!5145) (_size!1221 (_ BitVec 32)) (_keys!5493 array!7391) (_values!3615 array!7393) (_vacant!1221 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2344)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176375 (= res!83578 (validMask!0 (mask!8549 thiss!1248)))))

(declare-fun tp_is_empty!4123 () Bool)

(declare-fun e!116369 () Bool)

(declare-fun e!116371 () Bool)

(declare-fun array_inv!2245 (array!7391) Bool)

(declare-fun array_inv!2246 (array!7393) Bool)

(assert (=> b!176376 (= e!116369 (and tp!15743 tp_is_empty!4123 (array_inv!2245 (_keys!5493 thiss!1248)) (array_inv!2246 (_values!3615 thiss!1248)) e!116371))))

(declare-fun mapNonEmpty!7038 () Bool)

(declare-fun mapRes!7038 () Bool)

(declare-fun tp!15744 () Bool)

(declare-fun e!116372 () Bool)

(assert (=> mapNonEmpty!7038 (= mapRes!7038 (and tp!15744 e!116372))))

(declare-fun mapRest!7038 () (Array (_ BitVec 32) ValueCell!1718))

(declare-fun mapKey!7038 () (_ BitVec 32))

(declare-fun mapValue!7038 () ValueCell!1718)

(assert (=> mapNonEmpty!7038 (= (arr!3508 (_values!3615 thiss!1248)) (store mapRest!7038 mapKey!7038 mapValue!7038))))

(declare-fun b!176378 () Bool)

(declare-fun res!83577 () Bool)

(assert (=> b!176378 (=> (not res!83577) (not e!116370))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3276 0))(
  ( (tuple2!3277 (_1!1649 (_ BitVec 64)) (_2!1649 V!5145)) )
))
(declare-datatypes ((List!2231 0))(
  ( (Nil!2228) (Cons!2227 (h!2848 tuple2!3276) (t!7055 List!2231)) )
))
(declare-datatypes ((ListLongMap!2203 0))(
  ( (ListLongMap!2204 (toList!1117 List!2231)) )
))
(declare-fun contains!1181 (ListLongMap!2203 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!769 (array!7391 array!7393 (_ BitVec 32) (_ BitVec 32) V!5145 V!5145 (_ BitVec 32) Int) ListLongMap!2203)

(assert (=> b!176378 (= res!83577 (contains!1181 (getCurrentListMap!769 (_keys!5493 thiss!1248) (_values!3615 thiss!1248) (mask!8549 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)) key!828))))

(declare-fun b!176379 () Bool)

(declare-fun e!116368 () Bool)

(assert (=> b!176379 (= e!116368 tp_is_empty!4123)))

(declare-fun b!176380 () Bool)

(assert (=> b!176380 (= e!116371 (and e!116368 mapRes!7038))))

(declare-fun condMapEmpty!7038 () Bool)

(declare-fun mapDefault!7038 () ValueCell!1718)

