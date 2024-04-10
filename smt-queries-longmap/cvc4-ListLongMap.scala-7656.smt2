; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96260 () Bool)

(assert start!96260)

(declare-fun b_free!22913 () Bool)

(declare-fun b_next!22913 () Bool)

(assert (=> start!96260 (= b_free!22913 (not b_next!22913))))

(declare-fun tp!80587 () Bool)

(declare-fun b_and!36501 () Bool)

(assert (=> start!96260 (= tp!80587 b_and!36501)))

(declare-fun b!1093621 () Bool)

(declare-fun res!729784 () Bool)

(declare-fun e!624431 () Bool)

(assert (=> b!1093621 (=> (not res!729784) (not e!624431))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70747 0))(
  ( (array!70748 (arr!34047 (Array (_ BitVec 32) (_ BitVec 64))) (size!34583 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70747)

(assert (=> b!1093621 (= res!729784 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34583 _keys!1070))))))

(declare-fun b!1093622 () Bool)

(declare-fun e!624429 () Bool)

(declare-fun tp_is_empty!26915 () Bool)

(assert (=> b!1093622 (= e!624429 tp_is_empty!26915)))

(declare-fun b!1093623 () Bool)

(declare-fun e!624430 () Bool)

(declare-fun mapRes!42127 () Bool)

(assert (=> b!1093623 (= e!624430 (and e!624429 mapRes!42127))))

(declare-fun condMapEmpty!42127 () Bool)

(declare-datatypes ((V!41013 0))(
  ( (V!41014 (val!13514 Int)) )
))
(declare-datatypes ((ValueCell!12748 0))(
  ( (ValueCellFull!12748 (v!16135 V!41013)) (EmptyCell!12748) )
))
(declare-datatypes ((array!70749 0))(
  ( (array!70750 (arr!34048 (Array (_ BitVec 32) ValueCell!12748)) (size!34584 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70749)

(declare-fun mapDefault!42127 () ValueCell!12748)

