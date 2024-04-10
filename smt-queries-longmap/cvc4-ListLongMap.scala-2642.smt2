; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39674 () Bool)

(assert start!39674)

(declare-fun b_free!9941 () Bool)

(declare-fun b_next!9941 () Bool)

(assert (=> start!39674 (= b_free!9941 (not b_next!9941))))

(declare-fun tp!35351 () Bool)

(declare-fun b_and!17597 () Bool)

(assert (=> start!39674 (= tp!35351 b_and!17597)))

(declare-fun b!425999 () Bool)

(declare-fun res!249546 () Bool)

(declare-fun e!252809 () Bool)

(assert (=> b!425999 (=> (not res!249546) (not e!252809))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425999 (= res!249546 (bvsle from!863 i!563))))

(declare-fun b!426000 () Bool)

(declare-fun res!249541 () Bool)

(declare-fun e!252813 () Bool)

(assert (=> b!426000 (=> (not res!249541) (not e!252813))))

(declare-datatypes ((array!26025 0))(
  ( (array!26026 (arr!12462 (Array (_ BitVec 32) (_ BitVec 64))) (size!12814 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26025)

(declare-datatypes ((List!7358 0))(
  ( (Nil!7355) (Cons!7354 (h!8210 (_ BitVec 64)) (t!12802 List!7358)) )
))
(declare-fun arrayNoDuplicates!0 (array!26025 (_ BitVec 32) List!7358) Bool)

(assert (=> b!426000 (= res!249541 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7355))))

(declare-fun b!426001 () Bool)

(declare-fun e!252812 () Bool)

(declare-fun e!252808 () Bool)

(declare-fun mapRes!18261 () Bool)

(assert (=> b!426001 (= e!252812 (and e!252808 mapRes!18261))))

(declare-fun condMapEmpty!18261 () Bool)

(declare-datatypes ((V!15895 0))(
  ( (V!15896 (val!5591 Int)) )
))
(declare-datatypes ((ValueCell!5203 0))(
  ( (ValueCellFull!5203 (v!7838 V!15895)) (EmptyCell!5203) )
))
(declare-datatypes ((array!26027 0))(
  ( (array!26028 (arr!12463 (Array (_ BitVec 32) ValueCell!5203)) (size!12815 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26027)

(declare-fun mapDefault!18261 () ValueCell!5203)

