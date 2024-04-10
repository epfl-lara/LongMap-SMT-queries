; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43332 () Bool)

(assert start!43332)

(declare-fun b_free!12179 () Bool)

(declare-fun b_next!12179 () Bool)

(assert (=> start!43332 (= b_free!12179 (not b_next!12179))))

(declare-fun tp!42810 () Bool)

(declare-fun b_and!20933 () Bool)

(assert (=> start!43332 (= tp!42810 b_and!20933)))

(declare-fun b!480043 () Bool)

(declare-fun e!282467 () Bool)

(declare-fun e!282465 () Bool)

(declare-fun mapRes!22237 () Bool)

(assert (=> b!480043 (= e!282467 (and e!282465 mapRes!22237))))

(declare-fun condMapEmpty!22237 () Bool)

(declare-datatypes ((V!19325 0))(
  ( (V!19326 (val!6893 Int)) )
))
(declare-datatypes ((ValueCell!6484 0))(
  ( (ValueCellFull!6484 (v!9183 V!19325)) (EmptyCell!6484) )
))
(declare-datatypes ((array!31051 0))(
  ( (array!31052 (arr!14931 (Array (_ BitVec 32) ValueCell!6484)) (size!15289 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31051)

(declare-fun mapDefault!22237 () ValueCell!6484)

