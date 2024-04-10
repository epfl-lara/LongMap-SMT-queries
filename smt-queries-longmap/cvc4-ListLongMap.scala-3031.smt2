; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42564 () Bool)

(assert start!42564)

(declare-fun b_free!11999 () Bool)

(declare-fun b_next!11999 () Bool)

(assert (=> start!42564 (= b_free!11999 (not b_next!11999))))

(declare-fun tp!42036 () Bool)

(declare-fun b_and!20479 () Bool)

(assert (=> start!42564 (= tp!42036 b_and!20479)))

(declare-fun b!474878 () Bool)

(declare-fun e!278778 () Bool)

(declare-fun e!278776 () Bool)

(declare-fun mapRes!21859 () Bool)

(assert (=> b!474878 (= e!278778 (and e!278776 mapRes!21859))))

(declare-fun condMapEmpty!21859 () Bool)

(declare-datatypes ((V!19007 0))(
  ( (V!19008 (val!6758 Int)) )
))
(declare-datatypes ((ValueCell!6370 0))(
  ( (ValueCellFull!6370 (v!9051 V!19007)) (EmptyCell!6370) )
))
(declare-datatypes ((array!30599 0))(
  ( (array!30600 (arr!14717 (Array (_ BitVec 32) ValueCell!6370)) (size!15069 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30599)

(declare-fun mapDefault!21859 () ValueCell!6370)

