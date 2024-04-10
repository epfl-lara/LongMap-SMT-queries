; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95708 () Bool)

(assert start!95708)

(declare-fun b_free!22361 () Bool)

(declare-fun b_next!22361 () Bool)

(assert (=> start!95708 (= b_free!22361 (not b_next!22361))))

(declare-fun tp!78931 () Bool)

(declare-fun b_and!35397 () Bool)

(assert (=> start!95708 (= tp!78931 b_and!35397)))

(declare-fun b!1082071 () Bool)

(declare-fun e!618429 () Bool)

(declare-fun tp_is_empty!26363 () Bool)

(assert (=> b!1082071 (= e!618429 tp_is_empty!26363)))

(declare-fun b!1082072 () Bool)

(declare-fun res!721272 () Bool)

(declare-fun e!618426 () Bool)

(assert (=> b!1082072 (=> (not res!721272) (not e!618426))))

(declare-datatypes ((array!69673 0))(
  ( (array!69674 (arr!33510 (Array (_ BitVec 32) (_ BitVec 64))) (size!34046 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69673)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69673 (_ BitVec 32)) Bool)

(assert (=> b!1082072 (= res!721272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082073 () Bool)

(declare-fun e!618430 () Bool)

(declare-fun mapRes!41299 () Bool)

(assert (=> b!1082073 (= e!618430 (and e!618429 mapRes!41299))))

(declare-fun condMapEmpty!41299 () Bool)

(declare-datatypes ((V!40277 0))(
  ( (V!40278 (val!13238 Int)) )
))
(declare-datatypes ((ValueCell!12472 0))(
  ( (ValueCellFull!12472 (v!15859 V!40277)) (EmptyCell!12472) )
))
(declare-datatypes ((array!69675 0))(
  ( (array!69676 (arr!33511 (Array (_ BitVec 32) ValueCell!12472)) (size!34047 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69675)

(declare-fun mapDefault!41299 () ValueCell!12472)

