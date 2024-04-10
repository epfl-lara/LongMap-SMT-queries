; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95954 () Bool)

(assert start!95954)

(declare-fun b_free!22607 () Bool)

(declare-fun b_next!22607 () Bool)

(assert (=> start!95954 (= b_free!22607 (not b_next!22607))))

(declare-fun tp!79669 () Bool)

(declare-fun b_and!35889 () Bool)

(assert (=> start!95954 (= tp!79669 b_and!35889)))

(declare-fun b!1087085 () Bool)

(declare-fun e!620973 () Bool)

(declare-fun e!620971 () Bool)

(declare-fun mapRes!41668 () Bool)

(assert (=> b!1087085 (= e!620973 (and e!620971 mapRes!41668))))

(declare-fun condMapEmpty!41668 () Bool)

(declare-datatypes ((V!40605 0))(
  ( (V!40606 (val!13361 Int)) )
))
(declare-datatypes ((ValueCell!12595 0))(
  ( (ValueCellFull!12595 (v!15982 V!40605)) (EmptyCell!12595) )
))
(declare-datatypes ((array!70147 0))(
  ( (array!70148 (arr!33747 (Array (_ BitVec 32) ValueCell!12595)) (size!34283 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70147)

(declare-fun mapDefault!41668 () ValueCell!12595)

