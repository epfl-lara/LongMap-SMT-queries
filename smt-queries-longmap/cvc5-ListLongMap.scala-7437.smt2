; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94472 () Bool)

(assert start!94472)

(declare-fun b_free!21799 () Bool)

(declare-fun b_next!21799 () Bool)

(assert (=> start!94472 (= b_free!21799 (not b_next!21799))))

(declare-fun tp!76844 () Bool)

(declare-fun b_and!34591 () Bool)

(assert (=> start!94472 (= tp!76844 b_and!34591)))

(declare-fun b!1068287 () Bool)

(declare-fun e!609477 () Bool)

(declare-fun e!609472 () Bool)

(declare-fun mapRes!40108 () Bool)

(assert (=> b!1068287 (= e!609477 (and e!609472 mapRes!40108))))

(declare-fun condMapEmpty!40108 () Bool)

(declare-datatypes ((V!39281 0))(
  ( (V!39282 (val!12855 Int)) )
))
(declare-datatypes ((ValueCell!12101 0))(
  ( (ValueCellFull!12101 (v!15469 V!39281)) (EmptyCell!12101) )
))
(declare-datatypes ((array!68199 0))(
  ( (array!68200 (arr!32799 (Array (_ BitVec 32) ValueCell!12101)) (size!33335 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68199)

(declare-fun mapDefault!40108 () ValueCell!12101)

