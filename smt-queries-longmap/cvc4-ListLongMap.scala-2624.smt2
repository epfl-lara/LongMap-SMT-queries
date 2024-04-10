; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39566 () Bool)

(assert start!39566)

(declare-fun b_free!9833 () Bool)

(declare-fun b_next!9833 () Bool)

(assert (=> start!39566 (= b_free!9833 (not b_next!9833))))

(declare-fun tp!35028 () Bool)

(declare-fun b_and!17489 () Bool)

(assert (=> start!39566 (= tp!35028 b_and!17489)))

(declare-fun b!423489 () Bool)

(declare-fun e!251759 () Bool)

(declare-fun e!251760 () Bool)

(declare-fun mapRes!18099 () Bool)

(assert (=> b!423489 (= e!251759 (and e!251760 mapRes!18099))))

(declare-fun condMapEmpty!18099 () Bool)

(declare-datatypes ((V!15751 0))(
  ( (V!15752 (val!5537 Int)) )
))
(declare-datatypes ((ValueCell!5149 0))(
  ( (ValueCellFull!5149 (v!7784 V!15751)) (EmptyCell!5149) )
))
(declare-datatypes ((array!25815 0))(
  ( (array!25816 (arr!12357 (Array (_ BitVec 32) ValueCell!5149)) (size!12709 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25815)

(declare-fun mapDefault!18099 () ValueCell!5149)

