; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39590 () Bool)

(assert start!39590)

(declare-fun b_free!9857 () Bool)

(declare-fun b_next!9857 () Bool)

(assert (=> start!39590 (= b_free!9857 (not b_next!9857))))

(declare-fun tp!35100 () Bool)

(declare-fun b_and!17513 () Bool)

(assert (=> start!39590 (= tp!35100 b_and!17513)))

(declare-fun mapNonEmpty!18135 () Bool)

(declare-fun mapRes!18135 () Bool)

(declare-fun tp!35099 () Bool)

(declare-fun e!251972 () Bool)

(assert (=> mapNonEmpty!18135 (= mapRes!18135 (and tp!35099 e!251972))))

(declare-datatypes ((V!15783 0))(
  ( (V!15784 (val!5549 Int)) )
))
(declare-datatypes ((ValueCell!5161 0))(
  ( (ValueCellFull!5161 (v!7796 V!15783)) (EmptyCell!5161) )
))
(declare-fun mapRest!18135 () (Array (_ BitVec 32) ValueCell!5161))

(declare-fun mapKey!18135 () (_ BitVec 32))

(declare-fun mapValue!18135 () ValueCell!5161)

(declare-datatypes ((array!25859 0))(
  ( (array!25860 (arr!12379 (Array (_ BitVec 32) ValueCell!5161)) (size!12731 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25859)

(assert (=> mapNonEmpty!18135 (= (arr!12379 _values!549) (store mapRest!18135 mapKey!18135 mapValue!18135))))

(declare-fun b!424029 () Bool)

(declare-fun res!247950 () Bool)

(declare-fun e!251971 () Bool)

(assert (=> b!424029 (=> (not res!247950) (not e!251971))))

(declare-datatypes ((array!25861 0))(
  ( (array!25862 (arr!12380 (Array (_ BitVec 32) (_ BitVec 64))) (size!12732 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25861)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424029 (= res!247950 (or (= (select (arr!12380 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12380 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424030 () Bool)

(declare-fun e!251976 () Bool)

(assert (=> b!424030 (= e!251971 e!251976)))

(declare-fun res!247949 () Bool)

(assert (=> b!424030 (=> (not res!247949) (not e!251976))))

(declare-fun lt!194288 () array!25861)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25861 (_ BitVec 32)) Bool)

(assert (=> b!424030 (= res!247949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194288 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!424030 (= lt!194288 (array!25862 (store (arr!12380 _keys!709) i!563 k!794) (size!12732 _keys!709)))))

(declare-fun b!424031 () Bool)

(declare-fun e!251975 () Bool)

(declare-fun e!251973 () Bool)

(assert (=> b!424031 (= e!251975 (and e!251973 mapRes!18135))))

(declare-fun condMapEmpty!18135 () Bool)

(declare-fun mapDefault!18135 () ValueCell!5161)

