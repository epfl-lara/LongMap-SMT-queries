; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94834 () Bool)

(assert start!94834)

(declare-fun b_free!22063 () Bool)

(declare-fun b_next!22063 () Bool)

(assert (=> start!94834 (= b_free!22063 (not b_next!22063))))

(declare-fun tp!77651 () Bool)

(declare-fun b_and!34905 () Bool)

(assert (=> start!94834 (= tp!77651 b_and!34905)))

(declare-fun b!1072347 () Bool)

(declare-fun res!715311 () Bool)

(declare-fun e!612478 () Bool)

(assert (=> b!1072347 (=> (not res!715311) (not e!612478))))

(declare-datatypes ((array!68715 0))(
  ( (array!68716 (arr!33052 (Array (_ BitVec 32) (_ BitVec 64))) (size!33588 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68715)

(declare-datatypes ((List!23075 0))(
  ( (Nil!23072) (Cons!23071 (h!24280 (_ BitVec 64)) (t!32410 List!23075)) )
))
(declare-fun arrayNoDuplicates!0 (array!68715 (_ BitVec 32) List!23075) Bool)

(assert (=> b!1072347 (= res!715311 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23072))))

(declare-fun b!1072348 () Bool)

(declare-fun e!612474 () Bool)

(declare-fun e!612479 () Bool)

(declare-fun mapRes!40519 () Bool)

(assert (=> b!1072348 (= e!612474 (and e!612479 mapRes!40519))))

(declare-fun condMapEmpty!40519 () Bool)

(declare-datatypes ((V!39633 0))(
  ( (V!39634 (val!12987 Int)) )
))
(declare-datatypes ((ValueCell!12233 0))(
  ( (ValueCellFull!12233 (v!15604 V!39633)) (EmptyCell!12233) )
))
(declare-datatypes ((array!68717 0))(
  ( (array!68718 (arr!33053 (Array (_ BitVec 32) ValueCell!12233)) (size!33589 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68717)

(declare-fun mapDefault!40519 () ValueCell!12233)

