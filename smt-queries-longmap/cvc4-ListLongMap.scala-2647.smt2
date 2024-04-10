; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39704 () Bool)

(assert start!39704)

(declare-fun b_free!9971 () Bool)

(declare-fun b_next!9971 () Bool)

(assert (=> start!39704 (= b_free!9971 (not b_next!9971))))

(declare-fun tp!35441 () Bool)

(declare-fun b_and!17627 () Bool)

(assert (=> start!39704 (= tp!35441 b_and!17627)))

(declare-fun b!426719 () Bool)

(declare-fun res!250133 () Bool)

(declare-fun e!253128 () Bool)

(assert (=> b!426719 (=> (not res!250133) (not e!253128))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26085 0))(
  ( (array!26086 (arr!12492 (Array (_ BitVec 32) (_ BitVec 64))) (size!12844 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26085)

(assert (=> b!426719 (= res!250133 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12844 _keys!709))))))

(declare-fun b!426720 () Bool)

(declare-fun e!253127 () Bool)

(declare-fun e!253123 () Bool)

(declare-fun mapRes!18306 () Bool)

(assert (=> b!426720 (= e!253127 (and e!253123 mapRes!18306))))

(declare-fun condMapEmpty!18306 () Bool)

(declare-datatypes ((V!15935 0))(
  ( (V!15936 (val!5606 Int)) )
))
(declare-datatypes ((ValueCell!5218 0))(
  ( (ValueCellFull!5218 (v!7853 V!15935)) (EmptyCell!5218) )
))
(declare-datatypes ((array!26087 0))(
  ( (array!26088 (arr!12493 (Array (_ BitVec 32) ValueCell!5218)) (size!12845 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26087)

(declare-fun mapDefault!18306 () ValueCell!5218)

