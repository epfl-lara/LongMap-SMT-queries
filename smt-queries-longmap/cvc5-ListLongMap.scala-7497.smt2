; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94966 () Bool)

(assert start!94966)

(declare-fun b_free!22159 () Bool)

(declare-fun b_next!22159 () Bool)

(assert (=> start!94966 (= b_free!22159 (not b_next!22159))))

(declare-fun tp!77944 () Bool)

(declare-fun b_and!35021 () Bool)

(assert (=> start!94966 (= tp!77944 b_and!35021)))

(declare-fun mapIsEmpty!40669 () Bool)

(declare-fun mapRes!40669 () Bool)

(assert (=> mapIsEmpty!40669 mapRes!40669))

(declare-fun b!1073702 () Bool)

(declare-fun e!613442 () Bool)

(declare-fun e!613445 () Bool)

(assert (=> b!1073702 (= e!613442 (and e!613445 mapRes!40669))))

(declare-fun condMapEmpty!40669 () Bool)

(declare-datatypes ((V!39761 0))(
  ( (V!39762 (val!13035 Int)) )
))
(declare-datatypes ((ValueCell!12281 0))(
  ( (ValueCellFull!12281 (v!15653 V!39761)) (EmptyCell!12281) )
))
(declare-datatypes ((array!68901 0))(
  ( (array!68902 (arr!33143 (Array (_ BitVec 32) ValueCell!12281)) (size!33679 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68901)

(declare-fun mapDefault!40669 () ValueCell!12281)

