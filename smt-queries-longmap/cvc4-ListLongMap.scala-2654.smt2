; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39746 () Bool)

(assert start!39746)

(declare-fun b_free!10013 () Bool)

(declare-fun b_next!10013 () Bool)

(assert (=> start!39746 (= b_free!10013 (not b_next!10013))))

(declare-fun tp!35568 () Bool)

(declare-fun b_and!17685 () Bool)

(assert (=> start!39746 (= tp!35568 b_and!17685)))

(declare-fun mapNonEmpty!18369 () Bool)

(declare-fun mapRes!18369 () Bool)

(declare-fun tp!35567 () Bool)

(declare-fun e!253598 () Bool)

(assert (=> mapNonEmpty!18369 (= mapRes!18369 (and tp!35567 e!253598))))

(declare-datatypes ((V!15991 0))(
  ( (V!15992 (val!5627 Int)) )
))
(declare-datatypes ((ValueCell!5239 0))(
  ( (ValueCellFull!5239 (v!7874 V!15991)) (EmptyCell!5239) )
))
(declare-fun mapValue!18369 () ValueCell!5239)

(declare-datatypes ((array!26167 0))(
  ( (array!26168 (arr!12533 (Array (_ BitVec 32) ValueCell!5239)) (size!12885 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26167)

(declare-fun mapRest!18369 () (Array (_ BitVec 32) ValueCell!5239))

(declare-fun mapKey!18369 () (_ BitVec 32))

(assert (=> mapNonEmpty!18369 (= (arr!12533 _values!549) (store mapRest!18369 mapKey!18369 mapValue!18369))))

(declare-fun res!250986 () Bool)

(declare-fun e!253600 () Bool)

(assert (=> start!39746 (=> (not res!250986) (not e!253600))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26169 0))(
  ( (array!26170 (arr!12534 (Array (_ BitVec 32) (_ BitVec 64))) (size!12886 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26169)

(assert (=> start!39746 (= res!250986 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12886 _keys!709))))))

(assert (=> start!39746 e!253600))

(declare-fun tp_is_empty!11165 () Bool)

(assert (=> start!39746 tp_is_empty!11165))

(assert (=> start!39746 tp!35568))

(assert (=> start!39746 true))

(declare-fun e!253602 () Bool)

(declare-fun array_inv!9136 (array!26167) Bool)

(assert (=> start!39746 (and (array_inv!9136 _values!549) e!253602)))

(declare-fun array_inv!9137 (array!26169) Bool)

(assert (=> start!39746 (array_inv!9137 _keys!709)))

(declare-fun b!427778 () Bool)

(declare-fun res!250991 () Bool)

(assert (=> b!427778 (=> (not res!250991) (not e!253600))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!427778 (= res!250991 (and (= (size!12885 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12886 _keys!709) (size!12885 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427779 () Bool)

(declare-fun res!250981 () Bool)

(declare-fun e!253599 () Bool)

(assert (=> b!427779 (=> (not res!250981) (not e!253599))))

(declare-fun lt!195445 () array!26169)

(declare-datatypes ((List!7413 0))(
  ( (Nil!7410) (Cons!7409 (h!8265 (_ BitVec 64)) (t!12875 List!7413)) )
))
(declare-fun arrayNoDuplicates!0 (array!26169 (_ BitVec 32) List!7413) Bool)

(assert (=> b!427779 (= res!250981 (arrayNoDuplicates!0 lt!195445 #b00000000000000000000000000000000 Nil!7410))))

(declare-fun b!427780 () Bool)

(declare-fun e!253601 () Bool)

(assert (=> b!427780 (= e!253602 (and e!253601 mapRes!18369))))

(declare-fun condMapEmpty!18369 () Bool)

(declare-fun mapDefault!18369 () ValueCell!5239)

