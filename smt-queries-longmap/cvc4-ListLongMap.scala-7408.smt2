; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94244 () Bool)

(assert start!94244)

(declare-fun b_free!21629 () Bool)

(declare-fun b_next!21629 () Bool)

(assert (=> start!94244 (= b_free!21629 (not b_next!21629))))

(declare-fun tp!76324 () Bool)

(declare-fun b_and!34389 () Bool)

(assert (=> start!94244 (= tp!76324 b_and!34389)))

(declare-fun b!1065801 () Bool)

(declare-fun e!607657 () Bool)

(declare-fun tp_is_empty!25439 () Bool)

(assert (=> b!1065801 (= e!607657 tp_is_empty!25439)))

(declare-fun b!1065802 () Bool)

(declare-fun e!607658 () Bool)

(assert (=> b!1065802 (= e!607658 tp_is_empty!25439)))

(declare-fun b!1065803 () Bool)

(declare-fun e!607659 () Bool)

(declare-fun mapRes!39844 () Bool)

(assert (=> b!1065803 (= e!607659 (and e!607657 mapRes!39844))))

(declare-fun condMapEmpty!39844 () Bool)

(declare-datatypes ((V!39053 0))(
  ( (V!39054 (val!12770 Int)) )
))
(declare-datatypes ((ValueCell!12016 0))(
  ( (ValueCellFull!12016 (v!15382 V!39053)) (EmptyCell!12016) )
))
(declare-datatypes ((array!67863 0))(
  ( (array!67864 (arr!32634 (Array (_ BitVec 32) ValueCell!12016)) (size!33170 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67863)

(declare-fun mapDefault!39844 () ValueCell!12016)

