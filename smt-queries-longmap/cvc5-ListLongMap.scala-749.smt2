; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17512 () Bool)

(assert start!17512)

(declare-fun b!175419 () Bool)

(declare-fun b_free!4333 () Bool)

(declare-fun b_next!4333 () Bool)

(assert (=> b!175419 (= b_free!4333 (not b_next!4333))))

(declare-fun tp!15679 () Bool)

(declare-fun b_and!10813 () Bool)

(assert (=> b!175419 (= tp!15679 b_and!10813)))

(declare-fun mapIsEmpty!7000 () Bool)

(declare-fun mapRes!7000 () Bool)

(assert (=> mapIsEmpty!7000 mapRes!7000))

(declare-fun b!175411 () Bool)

(declare-fun e!115785 () Bool)

(declare-fun tp_is_empty!4105 () Bool)

(assert (=> b!175411 (= e!115785 tp_is_empty!4105)))

(declare-fun b!175412 () Bool)

(declare-fun res!83157 () Bool)

(declare-fun e!115789 () Bool)

(assert (=> b!175412 (=> (not res!83157) (not e!115789))))

(declare-datatypes ((V!5121 0))(
  ( (V!5122 (val!2097 Int)) )
))
(declare-datatypes ((ValueCell!1709 0))(
  ( (ValueCellFull!1709 (v!3971 V!5121)) (EmptyCell!1709) )
))
(declare-datatypes ((array!7349 0))(
  ( (array!7350 (arr!3489 (Array (_ BitVec 32) (_ BitVec 64))) (size!3791 (_ BitVec 32))) )
))
(declare-datatypes ((array!7351 0))(
  ( (array!7352 (arr!3490 (Array (_ BitVec 32) ValueCell!1709)) (size!3792 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2326 0))(
  ( (LongMapFixedSize!2327 (defaultEntry!3618 Int) (mask!8515 (_ BitVec 32)) (extraKeys!3355 (_ BitVec 32)) (zeroValue!3459 V!5121) (minValue!3459 V!5121) (_size!1212 (_ BitVec 32)) (_keys!5470 array!7349) (_values!3601 array!7351) (_vacant!1212 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2326)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3260 0))(
  ( (tuple2!3261 (_1!1641 (_ BitVec 64)) (_2!1641 V!5121)) )
))
(declare-datatypes ((List!2220 0))(
  ( (Nil!2217) (Cons!2216 (h!2835 tuple2!3260) (t!7038 List!2220)) )
))
(declare-datatypes ((ListLongMap!2187 0))(
  ( (ListLongMap!2188 (toList!1109 List!2220)) )
))
(declare-fun contains!1169 (ListLongMap!2187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!761 (array!7349 array!7351 (_ BitVec 32) (_ BitVec 32) V!5121 V!5121 (_ BitVec 32) Int) ListLongMap!2187)

(assert (=> b!175412 (= res!83157 (contains!1169 (getCurrentListMap!761 (_keys!5470 thiss!1248) (_values!3601 thiss!1248) (mask!8515 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)) key!828))))

(declare-fun res!83159 () Bool)

(assert (=> start!17512 (=> (not res!83159) (not e!115789))))

(declare-fun valid!981 (LongMapFixedSize!2326) Bool)

(assert (=> start!17512 (= res!83159 (valid!981 thiss!1248))))

(assert (=> start!17512 e!115789))

(declare-fun e!115786 () Bool)

(assert (=> start!17512 e!115786))

(assert (=> start!17512 true))

(declare-fun b!175413 () Bool)

(declare-fun e!115784 () Bool)

(assert (=> b!175413 (= e!115784 tp_is_empty!4105)))

(declare-fun b!175414 () Bool)

(declare-fun e!115788 () Bool)

(assert (=> b!175414 (= e!115788 (and e!115784 mapRes!7000))))

(declare-fun condMapEmpty!7000 () Bool)

(declare-fun mapDefault!7000 () ValueCell!1709)

