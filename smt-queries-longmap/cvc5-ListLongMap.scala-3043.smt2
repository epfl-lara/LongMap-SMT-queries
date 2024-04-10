; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42700 () Bool)

(assert start!42700)

(declare-fun b_free!12067 () Bool)

(declare-fun b_next!12067 () Bool)

(assert (=> start!42700 (= b_free!12067 (not b_next!12067))))

(declare-fun tp!42252 () Bool)

(declare-fun b_and!20591 () Bool)

(assert (=> start!42700 (= tp!42252 b_and!20591)))

(declare-fun b!476246 () Bool)

(declare-fun e!279715 () Bool)

(declare-fun e!279712 () Bool)

(declare-fun mapRes!21973 () Bool)

(assert (=> b!476246 (= e!279715 (and e!279712 mapRes!21973))))

(declare-fun condMapEmpty!21973 () Bool)

(declare-datatypes ((V!19099 0))(
  ( (V!19100 (val!6792 Int)) )
))
(declare-datatypes ((ValueCell!6404 0))(
  ( (ValueCellFull!6404 (v!9088 V!19099)) (EmptyCell!6404) )
))
(declare-datatypes ((array!30733 0))(
  ( (array!30734 (arr!14780 (Array (_ BitVec 32) ValueCell!6404)) (size!15132 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30733)

(declare-fun mapDefault!21973 () ValueCell!6404)

