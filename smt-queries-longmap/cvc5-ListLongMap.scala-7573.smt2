; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95758 () Bool)

(assert start!95758)

(declare-fun b_free!22411 () Bool)

(declare-fun b_next!22411 () Bool)

(assert (=> start!95758 (= b_free!22411 (not b_next!22411))))

(declare-fun tp!79082 () Bool)

(declare-fun b_and!35497 () Bool)

(assert (=> start!95758 (= tp!79082 b_and!35497)))

(declare-fun b!1083021 () Bool)

(declare-fun e!618881 () Bool)

(declare-fun e!618876 () Bool)

(assert (=> b!1083021 (= e!618881 e!618876)))

(declare-fun res!721949 () Bool)

(assert (=> b!1083021 (=> (not res!721949) (not e!618876))))

(declare-datatypes ((array!69769 0))(
  ( (array!69770 (arr!33558 (Array (_ BitVec 32) (_ BitVec 64))) (size!34094 (_ BitVec 32))) )
))
(declare-fun lt!479880 () array!69769)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69769 (_ BitVec 32)) Bool)

(assert (=> b!1083021 (= res!721949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479880 mask!1414))))

(declare-fun _keys!1070 () array!69769)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083021 (= lt!479880 (array!69770 (store (arr!33558 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34094 _keys!1070)))))

(declare-fun b!1083022 () Bool)

(declare-fun e!618877 () Bool)

(declare-fun e!618878 () Bool)

(declare-fun mapRes!41374 () Bool)

(assert (=> b!1083022 (= e!618877 (and e!618878 mapRes!41374))))

(declare-fun condMapEmpty!41374 () Bool)

(declare-datatypes ((V!40345 0))(
  ( (V!40346 (val!13263 Int)) )
))
(declare-datatypes ((ValueCell!12497 0))(
  ( (ValueCellFull!12497 (v!15884 V!40345)) (EmptyCell!12497) )
))
(declare-datatypes ((array!69771 0))(
  ( (array!69772 (arr!33559 (Array (_ BitVec 32) ValueCell!12497)) (size!34095 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69771)

(declare-fun mapDefault!41374 () ValueCell!12497)

