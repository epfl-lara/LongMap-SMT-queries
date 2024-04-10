; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21242 () Bool)

(assert start!21242)

(declare-fun b!214043 () Bool)

(declare-fun b_free!5653 () Bool)

(declare-fun b_next!5653 () Bool)

(assert (=> b!214043 (= b_free!5653 (not b_next!5653))))

(declare-fun tp!20036 () Bool)

(declare-fun b_and!12543 () Bool)

(assert (=> b!214043 (= tp!20036 b_and!12543)))

(declare-fun b!214041 () Bool)

(declare-fun e!139175 () Bool)

(declare-datatypes ((V!7001 0))(
  ( (V!7002 (val!2802 Int)) )
))
(declare-datatypes ((ValueCell!2414 0))(
  ( (ValueCellFull!2414 (v!4820 V!7001)) (EmptyCell!2414) )
))
(declare-datatypes ((array!10235 0))(
  ( (array!10236 (arr!4856 (Array (_ BitVec 32) ValueCell!2414)) (size!5181 (_ BitVec 32))) )
))
(declare-datatypes ((array!10237 0))(
  ( (array!10238 (arr!4857 (Array (_ BitVec 32) (_ BitVec 64))) (size!5182 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2728 0))(
  ( (LongMapFixedSize!2729 (defaultEntry!4014 Int) (mask!9662 (_ BitVec 32)) (extraKeys!3751 (_ BitVec 32)) (zeroValue!3855 V!7001) (minValue!3855 V!7001) (_size!1413 (_ BitVec 32)) (_keys!6030 array!10237) (_values!3997 array!10235) (_vacant!1413 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2728)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214041 (= e!139175 (not (validMask!0 (mask!9662 thiss!1504))))))

(declare-fun b!214042 () Bool)

(declare-fun res!104793 () Bool)

(assert (=> b!214042 (=> (not res!104793) (not e!139175))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214042 (= res!104793 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!104794 () Bool)

(assert (=> start!21242 (=> (not res!104794) (not e!139175))))

(declare-fun valid!1118 (LongMapFixedSize!2728) Bool)

(assert (=> start!21242 (= res!104794 (valid!1118 thiss!1504))))

(assert (=> start!21242 e!139175))

(declare-fun e!139171 () Bool)

(assert (=> start!21242 e!139171))

(assert (=> start!21242 true))

(declare-fun mapNonEmpty!9377 () Bool)

(declare-fun mapRes!9377 () Bool)

(declare-fun tp!20035 () Bool)

(declare-fun e!139172 () Bool)

(assert (=> mapNonEmpty!9377 (= mapRes!9377 (and tp!20035 e!139172))))

(declare-fun mapRest!9377 () (Array (_ BitVec 32) ValueCell!2414))

(declare-fun mapKey!9377 () (_ BitVec 32))

(declare-fun mapValue!9377 () ValueCell!2414)

(assert (=> mapNonEmpty!9377 (= (arr!4856 (_values!3997 thiss!1504)) (store mapRest!9377 mapKey!9377 mapValue!9377))))

(declare-fun e!139173 () Bool)

(declare-fun tp_is_empty!5515 () Bool)

(declare-fun array_inv!3211 (array!10237) Bool)

(declare-fun array_inv!3212 (array!10235) Bool)

(assert (=> b!214043 (= e!139171 (and tp!20036 tp_is_empty!5515 (array_inv!3211 (_keys!6030 thiss!1504)) (array_inv!3212 (_values!3997 thiss!1504)) e!139173))))

(declare-fun b!214044 () Bool)

(declare-fun e!139170 () Bool)

(assert (=> b!214044 (= e!139173 (and e!139170 mapRes!9377))))

(declare-fun condMapEmpty!9377 () Bool)

(declare-fun mapDefault!9377 () ValueCell!2414)

