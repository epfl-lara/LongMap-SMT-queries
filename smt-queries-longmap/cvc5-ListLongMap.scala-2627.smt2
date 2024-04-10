; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39580 () Bool)

(assert start!39580)

(declare-fun b_free!9847 () Bool)

(declare-fun b_next!9847 () Bool)

(assert (=> start!39580 (= b_free!9847 (not b_next!9847))))

(declare-fun tp!35069 () Bool)

(declare-fun b_and!17503 () Bool)

(assert (=> start!39580 (= tp!35069 b_and!17503)))

(declare-fun b!423804 () Bool)

(declare-fun e!251885 () Bool)

(declare-fun e!251886 () Bool)

(declare-fun mapRes!18120 () Bool)

(assert (=> b!423804 (= e!251885 (and e!251886 mapRes!18120))))

(declare-fun condMapEmpty!18120 () Bool)

(declare-datatypes ((V!15771 0))(
  ( (V!15772 (val!5544 Int)) )
))
(declare-datatypes ((ValueCell!5156 0))(
  ( (ValueCellFull!5156 (v!7791 V!15771)) (EmptyCell!5156) )
))
(declare-datatypes ((array!25841 0))(
  ( (array!25842 (arr!12370 (Array (_ BitVec 32) ValueCell!5156)) (size!12722 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25841)

(declare-fun mapDefault!18120 () ValueCell!5156)

