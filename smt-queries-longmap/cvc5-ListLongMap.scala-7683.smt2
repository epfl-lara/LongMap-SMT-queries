; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96444 () Bool)

(assert start!96444)

(declare-fun b_free!23023 () Bool)

(declare-fun b_next!23023 () Bool)

(assert (=> start!96444 (= b_free!23023 (not b_next!23023))))

(declare-fun tp!80995 () Bool)

(declare-fun b_and!36709 () Bool)

(assert (=> start!96444 (= tp!80995 b_and!36709)))

(declare-fun b!1096522 () Bool)

(declare-fun res!731831 () Bool)

(declare-fun e!625901 () Bool)

(assert (=> b!1096522 (=> (not res!731831) (not e!625901))))

(declare-datatypes ((array!71059 0))(
  ( (array!71060 (arr!34201 (Array (_ BitVec 32) (_ BitVec 64))) (size!34737 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71059)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71059 (_ BitVec 32)) Bool)

(assert (=> b!1096522 (= res!731831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096523 () Bool)

(declare-fun e!625899 () Bool)

(declare-fun e!625900 () Bool)

(declare-fun mapRes!42370 () Bool)

(assert (=> b!1096523 (= e!625899 (and e!625900 mapRes!42370))))

(declare-fun condMapEmpty!42370 () Bool)

(declare-datatypes ((V!41225 0))(
  ( (V!41226 (val!13593 Int)) )
))
(declare-datatypes ((ValueCell!12827 0))(
  ( (ValueCellFull!12827 (v!16214 V!41225)) (EmptyCell!12827) )
))
(declare-datatypes ((array!71061 0))(
  ( (array!71062 (arr!34202 (Array (_ BitVec 32) ValueCell!12827)) (size!34738 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71061)

(declare-fun mapDefault!42370 () ValueCell!12827)

