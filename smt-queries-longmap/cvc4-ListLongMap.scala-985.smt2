; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21268 () Bool)

(assert start!21268)

(declare-fun b!214215 () Bool)

(declare-fun b_free!5663 () Bool)

(declare-fun b_next!5663 () Bool)

(assert (=> b!214215 (= b_free!5663 (not b_next!5663))))

(declare-fun tp!20070 () Bool)

(declare-fun b_and!12553 () Bool)

(assert (=> b!214215 (= tp!20070 b_and!12553)))

(declare-fun b!214209 () Bool)

(declare-fun e!139305 () Bool)

(declare-fun tp_is_empty!5525 () Bool)

(assert (=> b!214209 (= e!139305 tp_is_empty!5525)))

(declare-fun res!104869 () Bool)

(declare-fun e!139301 () Bool)

(assert (=> start!21268 (=> (not res!104869) (not e!139301))))

(declare-datatypes ((V!7013 0))(
  ( (V!7014 (val!2807 Int)) )
))
(declare-datatypes ((ValueCell!2419 0))(
  ( (ValueCellFull!2419 (v!4825 V!7013)) (EmptyCell!2419) )
))
(declare-datatypes ((array!10257 0))(
  ( (array!10258 (arr!4866 (Array (_ BitVec 32) ValueCell!2419)) (size!5192 (_ BitVec 32))) )
))
(declare-datatypes ((array!10259 0))(
  ( (array!10260 (arr!4867 (Array (_ BitVec 32) (_ BitVec 64))) (size!5193 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2738 0))(
  ( (LongMapFixedSize!2739 (defaultEntry!4019 Int) (mask!9671 (_ BitVec 32)) (extraKeys!3756 (_ BitVec 32)) (zeroValue!3860 V!7013) (minValue!3860 V!7013) (_size!1418 (_ BitVec 32)) (_keys!6036 array!10259) (_values!4002 array!10257) (_vacant!1418 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2738)

(declare-fun valid!1122 (LongMapFixedSize!2738) Bool)

(assert (=> start!21268 (= res!104869 (valid!1122 thiss!1504))))

(assert (=> start!21268 e!139301))

(declare-fun e!139302 () Bool)

(assert (=> start!21268 e!139302))

(assert (=> start!21268 true))

(declare-fun b!214210 () Bool)

(declare-fun e!139306 () Bool)

(declare-fun mapRes!9396 () Bool)

(assert (=> b!214210 (= e!139306 (and e!139305 mapRes!9396))))

(declare-fun condMapEmpty!9396 () Bool)

(declare-fun mapDefault!9396 () ValueCell!2419)

