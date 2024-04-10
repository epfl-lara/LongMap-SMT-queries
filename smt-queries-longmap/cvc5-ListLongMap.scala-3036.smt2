; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42590 () Bool)

(assert start!42590)

(declare-fun b_free!12025 () Bool)

(declare-fun b_next!12025 () Bool)

(assert (=> start!42590 (= b_free!12025 (not b_next!12025))))

(declare-fun tp!42115 () Bool)

(declare-fun b_and!20505 () Bool)

(assert (=> start!42590 (= tp!42115 b_and!20505)))

(declare-fun b!475151 () Bool)

(declare-fun e!278973 () Bool)

(declare-fun e!278971 () Bool)

(declare-fun mapRes!21898 () Bool)

(assert (=> b!475151 (= e!278973 (and e!278971 mapRes!21898))))

(declare-fun condMapEmpty!21898 () Bool)

(declare-datatypes ((V!19043 0))(
  ( (V!19044 (val!6771 Int)) )
))
(declare-datatypes ((ValueCell!6383 0))(
  ( (ValueCellFull!6383 (v!9064 V!19043)) (EmptyCell!6383) )
))
(declare-datatypes ((array!30645 0))(
  ( (array!30646 (arr!14740 (Array (_ BitVec 32) ValueCell!6383)) (size!15092 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30645)

(declare-fun mapDefault!21898 () ValueCell!6383)

