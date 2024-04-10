; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96466 () Bool)

(assert start!96466)

(declare-fun b_free!23045 () Bool)

(declare-fun b_next!23045 () Bool)

(assert (=> start!96466 (= b_free!23045 (not b_next!23045))))

(declare-fun tp!81062 () Bool)

(declare-fun b_and!36753 () Bool)

(assert (=> start!96466 (= tp!81062 b_and!36753)))

(declare-fun b!1096941 () Bool)

(declare-fun e!626101 () Bool)

(declare-fun tp_is_empty!27095 () Bool)

(assert (=> b!1096941 (= e!626101 tp_is_empty!27095)))

(declare-fun b!1096942 () Bool)

(declare-fun e!626099 () Bool)

(declare-fun e!626098 () Bool)

(declare-fun mapRes!42403 () Bool)

(assert (=> b!1096942 (= e!626099 (and e!626098 mapRes!42403))))

(declare-fun condMapEmpty!42403 () Bool)

(declare-datatypes ((V!41253 0))(
  ( (V!41254 (val!13604 Int)) )
))
(declare-datatypes ((ValueCell!12838 0))(
  ( (ValueCellFull!12838 (v!16225 V!41253)) (EmptyCell!12838) )
))
(declare-datatypes ((array!71103 0))(
  ( (array!71104 (arr!34223 (Array (_ BitVec 32) ValueCell!12838)) (size!34759 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71103)

(declare-fun mapDefault!42403 () ValueCell!12838)

