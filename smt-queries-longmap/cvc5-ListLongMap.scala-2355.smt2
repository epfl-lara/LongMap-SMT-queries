; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37592 () Bool)

(assert start!37592)

(declare-fun b_free!8719 () Bool)

(declare-fun b_next!8719 () Bool)

(assert (=> start!37592 (= b_free!8719 (not b_next!8719))))

(declare-fun tp!30872 () Bool)

(declare-fun b_and!15961 () Bool)

(assert (=> start!37592 (= tp!30872 b_and!15961)))

(declare-fun b!384385 () Bool)

(declare-fun e!233380 () Bool)

(assert (=> b!384385 (= e!233380 true)))

(declare-datatypes ((V!13595 0))(
  ( (V!13596 (val!4728 Int)) )
))
(declare-datatypes ((tuple2!6364 0))(
  ( (tuple2!6365 (_1!3193 (_ BitVec 64)) (_2!3193 V!13595)) )
))
(declare-datatypes ((List!6200 0))(
  ( (Nil!6197) (Cons!6196 (h!7052 tuple2!6364) (t!11350 List!6200)) )
))
(declare-datatypes ((ListLongMap!5277 0))(
  ( (ListLongMap!5278 (toList!2654 List!6200)) )
))
(declare-fun lt!180846 () ListLongMap!5277)

(declare-fun lt!180852 () ListLongMap!5277)

(declare-fun lt!180844 () tuple2!6364)

(declare-fun +!989 (ListLongMap!5277 tuple2!6364) ListLongMap!5277)

(assert (=> b!384385 (= lt!180846 (+!989 lt!180852 lt!180844))))

(declare-fun lt!180849 () ListLongMap!5277)

(declare-fun lt!180845 () ListLongMap!5277)

(assert (=> b!384385 (= lt!180849 lt!180845)))

(declare-fun b!384386 () Bool)

(declare-fun e!233382 () Bool)

(declare-fun e!233378 () Bool)

(declare-fun mapRes!15615 () Bool)

(assert (=> b!384386 (= e!233382 (and e!233378 mapRes!15615))))

(declare-fun condMapEmpty!15615 () Bool)

(declare-datatypes ((ValueCell!4340 0))(
  ( (ValueCellFull!4340 (v!6925 V!13595)) (EmptyCell!4340) )
))
(declare-datatypes ((array!22639 0))(
  ( (array!22640 (arr!10788 (Array (_ BitVec 32) ValueCell!4340)) (size!11140 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22639)

(declare-fun mapDefault!15615 () ValueCell!4340)

