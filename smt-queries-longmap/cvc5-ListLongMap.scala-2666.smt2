; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39814 () Bool)

(assert start!39814)

(declare-fun b_free!10081 () Bool)

(declare-fun b_next!10081 () Bool)

(assert (=> start!39814 (= b_free!10081 (not b_next!10081))))

(declare-fun tp!35772 () Bool)

(declare-fun b_and!17821 () Bool)

(assert (=> start!39814 (= tp!35772 b_and!17821)))

(declare-fun b!429728 () Bool)

(declare-fun res!252411 () Bool)

(declare-fun e!254490 () Bool)

(assert (=> b!429728 (=> (not res!252411) (not e!254490))))

(declare-datatypes ((array!26301 0))(
  ( (array!26302 (arr!12600 (Array (_ BitVec 32) (_ BitVec 64))) (size!12952 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26301)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26301 (_ BitVec 32)) Bool)

(assert (=> b!429728 (= res!252411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429729 () Bool)

(declare-fun e!254489 () Bool)

(declare-fun e!254496 () Bool)

(declare-fun mapRes!18471 () Bool)

(assert (=> b!429729 (= e!254489 (and e!254496 mapRes!18471))))

(declare-fun condMapEmpty!18471 () Bool)

(declare-datatypes ((V!16083 0))(
  ( (V!16084 (val!5661 Int)) )
))
(declare-datatypes ((ValueCell!5273 0))(
  ( (ValueCellFull!5273 (v!7908 V!16083)) (EmptyCell!5273) )
))
(declare-datatypes ((array!26303 0))(
  ( (array!26304 (arr!12601 (Array (_ BitVec 32) ValueCell!5273)) (size!12953 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26303)

(declare-fun mapDefault!18471 () ValueCell!5273)

