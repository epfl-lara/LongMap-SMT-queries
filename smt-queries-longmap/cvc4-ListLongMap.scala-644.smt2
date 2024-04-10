; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16216 () Bool)

(assert start!16216)

(declare-fun b!161753 () Bool)

(declare-fun b_free!3677 () Bool)

(declare-fun b_next!3677 () Bool)

(assert (=> b!161753 (= b_free!3677 (not b_next!3677))))

(declare-fun tp!13601 () Bool)

(declare-fun b_and!10091 () Bool)

(assert (=> b!161753 (= tp!13601 b_and!10091)))

(declare-fun b!161750 () Bool)

(declare-fun e!105787 () Bool)

(declare-fun tp_is_empty!3479 () Bool)

(assert (=> b!161750 (= e!105787 tp_is_empty!3479)))

(declare-fun b!161751 () Bool)

(declare-fun e!105789 () Bool)

(declare-fun mapRes!5906 () Bool)

(assert (=> b!161751 (= e!105789 (and e!105787 mapRes!5906))))

(declare-fun condMapEmpty!5906 () Bool)

(declare-datatypes ((V!4285 0))(
  ( (V!4286 (val!1784 Int)) )
))
(declare-datatypes ((ValueCell!1396 0))(
  ( (ValueCellFull!1396 (v!3649 V!4285)) (EmptyCell!1396) )
))
(declare-datatypes ((array!6037 0))(
  ( (array!6038 (arr!2863 (Array (_ BitVec 32) (_ BitVec 64))) (size!3147 (_ BitVec 32))) )
))
(declare-datatypes ((array!6039 0))(
  ( (array!6040 (arr!2864 (Array (_ BitVec 32) ValueCell!1396)) (size!3148 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1700 0))(
  ( (LongMapFixedSize!1701 (defaultEntry!3292 Int) (mask!7892 (_ BitVec 32)) (extraKeys!3033 (_ BitVec 32)) (zeroValue!3135 V!4285) (minValue!3135 V!4285) (_size!899 (_ BitVec 32)) (_keys!5093 array!6037) (_values!3275 array!6039) (_vacant!899 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1700)

(declare-fun mapDefault!5906 () ValueCell!1396)

