; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37430 () Bool)

(assert start!37430)

(declare-fun b_free!8557 () Bool)

(declare-fun b_next!8557 () Bool)

(assert (=> start!37430 (= b_free!8557 (not b_next!8557))))

(declare-fun tp!30387 () Bool)

(declare-fun b_and!15799 () Bool)

(assert (=> start!37430 (= tp!30387 b_and!15799)))

(declare-fun b!380974 () Bool)

(declare-fun e!231670 () Bool)

(assert (=> b!380974 (= e!231670 true)))

(declare-datatypes ((V!13379 0))(
  ( (V!13380 (val!4647 Int)) )
))
(declare-datatypes ((tuple2!6236 0))(
  ( (tuple2!6237 (_1!3129 (_ BitVec 64)) (_2!3129 V!13379)) )
))
(declare-datatypes ((List!6070 0))(
  ( (Nil!6067) (Cons!6066 (h!6922 tuple2!6236) (t!11220 List!6070)) )
))
(declare-datatypes ((ListLongMap!5149 0))(
  ( (ListLongMap!5150 (toList!2590 List!6070)) )
))
(declare-fun lt!178484 () ListLongMap!5149)

(declare-fun lt!178481 () ListLongMap!5149)

(assert (=> b!380974 (= lt!178484 lt!178481)))

(declare-fun b!380975 () Bool)

(declare-fun e!231671 () Bool)

(declare-fun e!231669 () Bool)

(declare-fun mapRes!15372 () Bool)

(assert (=> b!380975 (= e!231671 (and e!231669 mapRes!15372))))

(declare-fun condMapEmpty!15372 () Bool)

(declare-datatypes ((ValueCell!4259 0))(
  ( (ValueCellFull!4259 (v!6844 V!13379)) (EmptyCell!4259) )
))
(declare-datatypes ((array!22329 0))(
  ( (array!22330 (arr!10633 (Array (_ BitVec 32) ValueCell!4259)) (size!10985 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22329)

(declare-fun mapDefault!15372 () ValueCell!4259)

