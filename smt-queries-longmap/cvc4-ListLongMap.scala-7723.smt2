; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97028 () Bool)

(assert start!97028)

(declare-fun b!1103624 () Bool)

(declare-fun e!630003 () Bool)

(declare-fun tp_is_empty!27317 () Bool)

(assert (=> b!1103624 (= e!630003 tp_is_empty!27317)))

(declare-fun b!1103625 () Bool)

(declare-fun res!736277 () Bool)

(declare-fun e!630002 () Bool)

(assert (=> b!1103625 (=> (not res!736277) (not e!630002))))

(declare-datatypes ((array!71557 0))(
  ( (array!71558 (arr!34435 (Array (_ BitVec 32) (_ BitVec 64))) (size!34971 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71557)

(declare-datatypes ((List!24044 0))(
  ( (Nil!24041) (Cons!24040 (h!25249 (_ BitVec 64)) (t!34309 List!24044)) )
))
(declare-fun arrayNoDuplicates!0 (array!71557 (_ BitVec 32) List!24044) Bool)

(assert (=> b!1103625 (= res!736277 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24041))))

(declare-fun b!1103626 () Bool)

(declare-fun e!630006 () Bool)

(declare-fun e!630005 () Bool)

(declare-fun mapRes!42781 () Bool)

(assert (=> b!1103626 (= e!630006 (and e!630005 mapRes!42781))))

(declare-fun condMapEmpty!42781 () Bool)

(declare-datatypes ((V!41549 0))(
  ( (V!41550 (val!13715 Int)) )
))
(declare-datatypes ((ValueCell!12949 0))(
  ( (ValueCellFull!12949 (v!16347 V!41549)) (EmptyCell!12949) )
))
(declare-datatypes ((array!71559 0))(
  ( (array!71560 (arr!34436 (Array (_ BitVec 32) ValueCell!12949)) (size!34972 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71559)

(declare-fun mapDefault!42781 () ValueCell!12949)

