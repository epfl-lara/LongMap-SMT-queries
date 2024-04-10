; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96480 () Bool)

(assert start!96480)

(declare-fun b_free!23059 () Bool)

(declare-fun b_next!23059 () Bool)

(assert (=> start!96480 (= b_free!23059 (not b_next!23059))))

(declare-fun tp!81104 () Bool)

(declare-fun b_and!36781 () Bool)

(assert (=> start!96480 (= tp!81104 b_and!36781)))

(declare-fun b!1097206 () Bool)

(declare-fun res!732319 () Bool)

(declare-fun e!626223 () Bool)

(assert (=> b!1097206 (=> (not res!732319) (not e!626223))))

(declare-datatypes ((array!71129 0))(
  ( (array!71130 (arr!34236 (Array (_ BitVec 32) (_ BitVec 64))) (size!34772 (_ BitVec 32))) )
))
(declare-fun lt!490435 () array!71129)

(declare-datatypes ((List!23908 0))(
  ( (Nil!23905) (Cons!23904 (h!25113 (_ BitVec 64)) (t!34013 List!23908)) )
))
(declare-fun arrayNoDuplicates!0 (array!71129 (_ BitVec 32) List!23908) Bool)

(assert (=> b!1097206 (= res!732319 (arrayNoDuplicates!0 lt!490435 #b00000000000000000000000000000000 Nil!23905))))

(declare-fun b!1097207 () Bool)

(declare-fun e!626225 () Bool)

(declare-fun tp_is_empty!27109 () Bool)

(assert (=> b!1097207 (= e!626225 tp_is_empty!27109)))

(declare-fun b!1097208 () Bool)

(declare-fun e!626226 () Bool)

(declare-fun e!626227 () Bool)

(declare-fun mapRes!42424 () Bool)

(assert (=> b!1097208 (= e!626226 (and e!626227 mapRes!42424))))

(declare-fun condMapEmpty!42424 () Bool)

(declare-datatypes ((V!41273 0))(
  ( (V!41274 (val!13611 Int)) )
))
(declare-datatypes ((ValueCell!12845 0))(
  ( (ValueCellFull!12845 (v!16232 V!41273)) (EmptyCell!12845) )
))
(declare-datatypes ((array!71131 0))(
  ( (array!71132 (arr!34237 (Array (_ BitVec 32) ValueCell!12845)) (size!34773 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71131)

(declare-fun mapDefault!42424 () ValueCell!12845)

