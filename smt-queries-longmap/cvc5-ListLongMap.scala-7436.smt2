; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94466 () Bool)

(assert start!94466)

(declare-fun b_free!21793 () Bool)

(declare-fun b_next!21793 () Bool)

(assert (=> start!94466 (= b_free!21793 (not b_next!21793))))

(declare-fun tp!76825 () Bool)

(declare-fun b_and!34585 () Bool)

(assert (=> start!94466 (= tp!76825 b_and!34585)))

(declare-fun b!1068206 () Bool)

(declare-fun e!609414 () Bool)

(declare-fun e!609412 () Bool)

(declare-fun mapRes!40099 () Bool)

(assert (=> b!1068206 (= e!609414 (and e!609412 mapRes!40099))))

(declare-fun condMapEmpty!40099 () Bool)

(declare-datatypes ((V!39273 0))(
  ( (V!39274 (val!12852 Int)) )
))
(declare-datatypes ((ValueCell!12098 0))(
  ( (ValueCellFull!12098 (v!15466 V!39273)) (EmptyCell!12098) )
))
(declare-datatypes ((array!68189 0))(
  ( (array!68190 (arr!32794 (Array (_ BitVec 32) ValueCell!12098)) (size!33330 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68189)

(declare-fun mapDefault!40099 () ValueCell!12098)

