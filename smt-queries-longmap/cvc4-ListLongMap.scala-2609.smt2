; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39476 () Bool)

(assert start!39476)

(declare-fun b_free!9743 () Bool)

(declare-fun b_next!9743 () Bool)

(assert (=> start!39476 (= b_free!9743 (not b_next!9743))))

(declare-fun tp!34757 () Bool)

(declare-fun b_and!17361 () Bool)

(assert (=> start!39476 (= tp!34757 b_and!17361)))

(declare-fun b!421206 () Bool)

(declare-fun e!250782 () Bool)

(declare-fun tp_is_empty!10895 () Bool)

(assert (=> b!421206 (= e!250782 tp_is_empty!10895)))

(declare-fun b!421207 () Bool)

(declare-fun res!245797 () Bool)

(declare-fun e!250783 () Bool)

(assert (=> b!421207 (=> (not res!245797) (not e!250783))))

(declare-datatypes ((array!25639 0))(
  ( (array!25640 (arr!12269 (Array (_ BitVec 32) (_ BitVec 64))) (size!12621 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25639)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15631 0))(
  ( (V!15632 (val!5492 Int)) )
))
(declare-datatypes ((ValueCell!5104 0))(
  ( (ValueCellFull!5104 (v!7739 V!15631)) (EmptyCell!5104) )
))
(declare-datatypes ((array!25641 0))(
  ( (array!25642 (arr!12270 (Array (_ BitVec 32) ValueCell!5104)) (size!12622 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25641)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!421207 (= res!245797 (and (= (size!12622 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12621 _keys!709) (size!12622 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421208 () Bool)

(declare-fun e!250781 () Bool)

(declare-fun mapRes!17964 () Bool)

(assert (=> b!421208 (= e!250781 (and e!250782 mapRes!17964))))

(declare-fun condMapEmpty!17964 () Bool)

(declare-fun mapDefault!17964 () ValueCell!5104)

