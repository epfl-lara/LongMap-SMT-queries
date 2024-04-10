; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94826 () Bool)

(assert start!94826)

(declare-fun b_free!22055 () Bool)

(declare-fun b_next!22055 () Bool)

(assert (=> start!94826 (= b_free!22055 (not b_next!22055))))

(declare-fun tp!77627 () Bool)

(declare-fun b_and!34897 () Bool)

(assert (=> start!94826 (= tp!77627 b_and!34897)))

(declare-fun b!1072239 () Bool)

(declare-fun e!612395 () Bool)

(declare-fun tp_is_empty!25865 () Bool)

(assert (=> b!1072239 (= e!612395 tp_is_empty!25865)))

(declare-fun b!1072240 () Bool)

(declare-fun e!612390 () Bool)

(declare-fun mapRes!40507 () Bool)

(assert (=> b!1072240 (= e!612390 (and e!612395 mapRes!40507))))

(declare-fun condMapEmpty!40507 () Bool)

(declare-datatypes ((V!39621 0))(
  ( (V!39622 (val!12983 Int)) )
))
(declare-datatypes ((ValueCell!12229 0))(
  ( (ValueCellFull!12229 (v!15600 V!39621)) (EmptyCell!12229) )
))
(declare-datatypes ((array!68701 0))(
  ( (array!68702 (arr!33045 (Array (_ BitVec 32) ValueCell!12229)) (size!33581 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68701)

(declare-fun mapDefault!40507 () ValueCell!12229)

