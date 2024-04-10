; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21618 () Bool)

(assert start!21618)

(declare-fun b!216674 () Bool)

(declare-fun b_free!5767 () Bool)

(declare-fun b_next!5767 () Bool)

(assert (=> b!216674 (= b_free!5767 (not b_next!5767))))

(declare-fun tp!20435 () Bool)

(declare-fun b_and!12657 () Bool)

(assert (=> b!216674 (= tp!20435 b_and!12657)))

(declare-fun b!216667 () Bool)

(declare-fun e!140964 () Bool)

(assert (=> b!216667 (= e!140964 false)))

(declare-fun lt!111207 () Bool)

(declare-datatypes ((V!7153 0))(
  ( (V!7154 (val!2859 Int)) )
))
(declare-datatypes ((ValueCell!2471 0))(
  ( (ValueCellFull!2471 (v!4877 V!7153)) (EmptyCell!2471) )
))
(declare-datatypes ((array!10497 0))(
  ( (array!10498 (arr!4970 (Array (_ BitVec 32) ValueCell!2471)) (size!5302 (_ BitVec 32))) )
))
(declare-datatypes ((array!10499 0))(
  ( (array!10500 (arr!4971 (Array (_ BitVec 32) (_ BitVec 64))) (size!5303 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2842 0))(
  ( (LongMapFixedSize!2843 (defaultEntry!4071 Int) (mask!9812 (_ BitVec 32)) (extraKeys!3808 (_ BitVec 32)) (zeroValue!3912 V!7153) (minValue!3912 V!7153) (_size!1470 (_ BitVec 32)) (_keys!6120 array!10499) (_values!4054 array!10497) (_vacant!1470 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2842)

(declare-datatypes ((List!3157 0))(
  ( (Nil!3154) (Cons!3153 (h!3800 (_ BitVec 64)) (t!8112 List!3157)) )
))
(declare-fun arrayNoDuplicates!0 (array!10499 (_ BitVec 32) List!3157) Bool)

(assert (=> b!216667 (= lt!111207 (arrayNoDuplicates!0 (_keys!6120 thiss!1504) #b00000000000000000000000000000000 Nil!3154))))

(declare-fun b!216668 () Bool)

(declare-fun res!105983 () Bool)

(assert (=> b!216668 (=> (not res!105983) (not e!140964))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4252 0))(
  ( (tuple2!4253 (_1!2137 (_ BitVec 64)) (_2!2137 V!7153)) )
))
(declare-datatypes ((List!3158 0))(
  ( (Nil!3155) (Cons!3154 (h!3801 tuple2!4252) (t!8113 List!3158)) )
))
(declare-datatypes ((ListLongMap!3165 0))(
  ( (ListLongMap!3166 (toList!1598 List!3158)) )
))
(declare-fun contains!1439 (ListLongMap!3165 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1126 (array!10499 array!10497 (_ BitVec 32) (_ BitVec 32) V!7153 V!7153 (_ BitVec 32) Int) ListLongMap!3165)

(assert (=> b!216668 (= res!105983 (contains!1439 (getCurrentListMap!1126 (_keys!6120 thiss!1504) (_values!4054 thiss!1504) (mask!9812 thiss!1504) (extraKeys!3808 thiss!1504) (zeroValue!3912 thiss!1504) (minValue!3912 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4071 thiss!1504)) key!932))))

(declare-fun b!216669 () Bool)

(declare-fun e!140967 () Bool)

(declare-fun tp_is_empty!5629 () Bool)

(assert (=> b!216669 (= e!140967 tp_is_empty!5629)))

(declare-fun res!105981 () Bool)

(declare-fun e!140965 () Bool)

(assert (=> start!21618 (=> (not res!105981) (not e!140965))))

(declare-fun valid!1155 (LongMapFixedSize!2842) Bool)

(assert (=> start!21618 (= res!105981 (valid!1155 thiss!1504))))

(assert (=> start!21618 e!140965))

(declare-fun e!140962 () Bool)

(assert (=> start!21618 e!140962))

(assert (=> start!21618 true))

(declare-fun b!216670 () Bool)

(declare-fun res!105980 () Bool)

(assert (=> b!216670 (=> (not res!105980) (not e!140964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216670 (= res!105980 (validMask!0 (mask!9812 thiss!1504)))))

(declare-fun b!216671 () Bool)

(declare-fun e!140968 () Bool)

(declare-fun mapRes!9606 () Bool)

(assert (=> b!216671 (= e!140968 (and e!140967 mapRes!9606))))

(declare-fun condMapEmpty!9606 () Bool)

(declare-fun mapDefault!9606 () ValueCell!2471)

