; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39484 () Bool)

(assert start!39484)

(declare-fun b_free!9751 () Bool)

(declare-fun b_next!9751 () Bool)

(assert (=> start!39484 (= b_free!9751 (not b_next!9751))))

(declare-fun tp!34781 () Bool)

(declare-fun b_and!17377 () Bool)

(assert (=> start!39484 (= tp!34781 b_and!17377)))

(declare-fun b!421442 () Bool)

(declare-fun e!250896 () Bool)

(declare-fun e!250895 () Bool)

(declare-fun mapRes!17976 () Bool)

(assert (=> b!421442 (= e!250896 (and e!250895 mapRes!17976))))

(declare-fun condMapEmpty!17976 () Bool)

(declare-datatypes ((V!15643 0))(
  ( (V!15644 (val!5496 Int)) )
))
(declare-datatypes ((ValueCell!5108 0))(
  ( (ValueCellFull!5108 (v!7743 V!15643)) (EmptyCell!5108) )
))
(declare-datatypes ((array!25655 0))(
  ( (array!25656 (arr!12277 (Array (_ BitVec 32) ValueCell!5108)) (size!12629 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25655)

(declare-fun mapDefault!17976 () ValueCell!5108)

