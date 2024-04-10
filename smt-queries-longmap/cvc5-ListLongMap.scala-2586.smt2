; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39334 () Bool)

(assert start!39334)

(declare-fun b_free!9601 () Bool)

(declare-fun b_next!9601 () Bool)

(assert (=> start!39334 (= b_free!9601 (not b_next!9601))))

(declare-fun tp!34331 () Bool)

(declare-fun b_and!17077 () Bool)

(assert (=> start!39334 (= tp!34331 b_and!17077)))

(declare-fun b!417017 () Bool)

(declare-fun e!248868 () Bool)

(declare-fun e!248870 () Bool)

(declare-fun mapRes!17751 () Bool)

(assert (=> b!417017 (= e!248868 (and e!248870 mapRes!17751))))

(declare-fun condMapEmpty!17751 () Bool)

(declare-datatypes ((V!15443 0))(
  ( (V!15444 (val!5421 Int)) )
))
(declare-datatypes ((ValueCell!5033 0))(
  ( (ValueCellFull!5033 (v!7668 V!15443)) (EmptyCell!5033) )
))
(declare-datatypes ((array!25361 0))(
  ( (array!25362 (arr!12130 (Array (_ BitVec 32) ValueCell!5033)) (size!12482 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25361)

(declare-fun mapDefault!17751 () ValueCell!5033)

