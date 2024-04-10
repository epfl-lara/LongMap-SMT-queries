; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95750 () Bool)

(assert start!95750)

(declare-fun b_free!22403 () Bool)

(declare-fun b_next!22403 () Bool)

(assert (=> start!95750 (= b_free!22403 (not b_next!22403))))

(declare-fun tp!79057 () Bool)

(declare-fun b_and!35481 () Bool)

(assert (=> start!95750 (= tp!79057 b_and!35481)))

(declare-fun b!1082869 () Bool)

(declare-fun e!618804 () Bool)

(declare-fun e!618805 () Bool)

(assert (=> b!1082869 (= e!618804 e!618805)))

(declare-fun res!721843 () Bool)

(assert (=> b!1082869 (=> (not res!721843) (not e!618805))))

(declare-datatypes ((array!69755 0))(
  ( (array!69756 (arr!33551 (Array (_ BitVec 32) (_ BitVec 64))) (size!34087 (_ BitVec 32))) )
))
(declare-fun lt!479806 () array!69755)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69755 (_ BitVec 32)) Bool)

(assert (=> b!1082869 (= res!721843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479806 mask!1414))))

(declare-fun _keys!1070 () array!69755)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082869 (= lt!479806 (array!69756 (store (arr!33551 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34087 _keys!1070)))))

(declare-fun b!1082870 () Bool)

(declare-fun e!618806 () Bool)

(declare-fun e!618807 () Bool)

(declare-fun mapRes!41362 () Bool)

(assert (=> b!1082870 (= e!618806 (and e!618807 mapRes!41362))))

(declare-fun condMapEmpty!41362 () Bool)

(declare-datatypes ((V!40333 0))(
  ( (V!40334 (val!13259 Int)) )
))
(declare-datatypes ((ValueCell!12493 0))(
  ( (ValueCellFull!12493 (v!15880 V!40333)) (EmptyCell!12493) )
))
(declare-datatypes ((array!69757 0))(
  ( (array!69758 (arr!33552 (Array (_ BitVec 32) ValueCell!12493)) (size!34088 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69757)

(declare-fun mapDefault!41362 () ValueCell!12493)

