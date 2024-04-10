; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37442 () Bool)

(assert start!37442)

(declare-fun b_free!8569 () Bool)

(declare-fun b_next!8569 () Bool)

(assert (=> start!37442 (= b_free!8569 (not b_next!8569))))

(declare-fun tp!30423 () Bool)

(declare-fun b_and!15811 () Bool)

(assert (=> start!37442 (= tp!30423 b_and!15811)))

(declare-fun b!381226 () Bool)

(declare-fun e!231800 () Bool)

(assert (=> b!381226 (= e!231800 true)))

(declare-datatypes ((V!13395 0))(
  ( (V!13396 (val!4653 Int)) )
))
(declare-datatypes ((tuple2!6246 0))(
  ( (tuple2!6247 (_1!3134 (_ BitVec 64)) (_2!3134 V!13395)) )
))
(declare-datatypes ((List!6080 0))(
  ( (Nil!6077) (Cons!6076 (h!6932 tuple2!6246) (t!11230 List!6080)) )
))
(declare-datatypes ((ListLongMap!5159 0))(
  ( (ListLongMap!5160 (toList!2595 List!6080)) )
))
(declare-fun lt!178648 () ListLongMap!5159)

(declare-fun lt!178644 () ListLongMap!5159)

(assert (=> b!381226 (= lt!178648 lt!178644)))

(declare-fun b!381227 () Bool)

(declare-fun e!231796 () Bool)

(declare-fun e!231797 () Bool)

(declare-fun mapRes!15390 () Bool)

(assert (=> b!381227 (= e!231796 (and e!231797 mapRes!15390))))

(declare-fun condMapEmpty!15390 () Bool)

(declare-datatypes ((ValueCell!4265 0))(
  ( (ValueCellFull!4265 (v!6850 V!13395)) (EmptyCell!4265) )
))
(declare-datatypes ((array!22351 0))(
  ( (array!22352 (arr!10644 (Array (_ BitVec 32) ValueCell!4265)) (size!10996 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22351)

(declare-fun mapDefault!15390 () ValueCell!4265)

