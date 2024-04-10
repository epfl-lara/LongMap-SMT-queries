; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39794 () Bool)

(assert start!39794)

(declare-fun b_free!10061 () Bool)

(declare-fun b_next!10061 () Bool)

(assert (=> start!39794 (= b_free!10061 (not b_next!10061))))

(declare-fun tp!35712 () Bool)

(declare-fun b_and!17781 () Bool)

(assert (=> start!39794 (= tp!35712 b_and!17781)))

(declare-fun b!429138 () Bool)

(declare-fun e!254226 () Bool)

(declare-fun tp_is_empty!11213 () Bool)

(assert (=> b!429138 (= e!254226 tp_is_empty!11213)))

(declare-fun b!429139 () Bool)

(declare-fun res!251989 () Bool)

(declare-fun e!254222 () Bool)

(assert (=> b!429139 (=> (not res!251989) (not e!254222))))

(declare-datatypes ((array!26263 0))(
  ( (array!26264 (arr!12581 (Array (_ BitVec 32) (_ BitVec 64))) (size!12933 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26263)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429139 (= res!251989 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!429140 () Bool)

(declare-fun res!251998 () Bool)

(declare-fun e!254218 () Bool)

(assert (=> b!429140 (=> (not res!251998) (not e!254218))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429140 (= res!251998 (bvsle from!863 i!563))))

(declare-fun b!429141 () Bool)

(declare-fun res!251993 () Bool)

(assert (=> b!429141 (=> (not res!251993) (not e!254222))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26263 (_ BitVec 32)) Bool)

(assert (=> b!429141 (= res!251993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429142 () Bool)

(declare-fun res!251997 () Bool)

(assert (=> b!429142 (=> (not res!251997) (not e!254222))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16055 0))(
  ( (V!16056 (val!5651 Int)) )
))
(declare-datatypes ((ValueCell!5263 0))(
  ( (ValueCellFull!5263 (v!7898 V!16055)) (EmptyCell!5263) )
))
(declare-datatypes ((array!26265 0))(
  ( (array!26266 (arr!12582 (Array (_ BitVec 32) ValueCell!5263)) (size!12934 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26265)

(assert (=> b!429142 (= res!251997 (and (= (size!12934 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12933 _keys!709) (size!12934 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429143 () Bool)

(declare-fun e!254224 () Bool)

(declare-fun mapRes!18441 () Bool)

(assert (=> b!429143 (= e!254224 (and e!254226 mapRes!18441))))

(declare-fun condMapEmpty!18441 () Bool)

(declare-fun mapDefault!18441 () ValueCell!5263)

