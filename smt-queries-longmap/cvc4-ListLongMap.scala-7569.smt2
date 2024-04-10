; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95738 () Bool)

(assert start!95738)

(declare-fun b_free!22391 () Bool)

(declare-fun b_next!22391 () Bool)

(assert (=> start!95738 (= b_free!22391 (not b_next!22391))))

(declare-fun tp!79021 () Bool)

(declare-fun b_and!35457 () Bool)

(assert (=> start!95738 (= tp!79021 b_and!35457)))

(declare-fun b!1082641 () Bool)

(declare-fun e!618697 () Bool)

(declare-fun e!618698 () Bool)

(declare-fun mapRes!41344 () Bool)

(assert (=> b!1082641 (= e!618697 (and e!618698 mapRes!41344))))

(declare-fun condMapEmpty!41344 () Bool)

(declare-datatypes ((V!40317 0))(
  ( (V!40318 (val!13253 Int)) )
))
(declare-datatypes ((ValueCell!12487 0))(
  ( (ValueCellFull!12487 (v!15874 V!40317)) (EmptyCell!12487) )
))
(declare-datatypes ((array!69733 0))(
  ( (array!69734 (arr!33540 (Array (_ BitVec 32) ValueCell!12487)) (size!34076 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69733)

(declare-fun mapDefault!41344 () ValueCell!12487)

