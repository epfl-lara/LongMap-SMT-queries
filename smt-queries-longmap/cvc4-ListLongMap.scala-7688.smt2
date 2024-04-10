; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96478 () Bool)

(assert start!96478)

(declare-fun b_free!23057 () Bool)

(declare-fun b_next!23057 () Bool)

(assert (=> start!96478 (= b_free!23057 (not b_next!23057))))

(declare-fun tp!81097 () Bool)

(declare-fun b_and!36777 () Bool)

(assert (=> start!96478 (= tp!81097 b_and!36777)))

(declare-fun mapNonEmpty!42421 () Bool)

(declare-fun mapRes!42421 () Bool)

(declare-fun tp!81098 () Bool)

(declare-fun e!626209 () Bool)

(assert (=> mapNonEmpty!42421 (= mapRes!42421 (and tp!81098 e!626209))))

(declare-datatypes ((V!41269 0))(
  ( (V!41270 (val!13610 Int)) )
))
(declare-datatypes ((ValueCell!12844 0))(
  ( (ValueCellFull!12844 (v!16231 V!41269)) (EmptyCell!12844) )
))
(declare-datatypes ((array!71125 0))(
  ( (array!71126 (arr!34234 (Array (_ BitVec 32) ValueCell!12844)) (size!34770 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71125)

(declare-fun mapKey!42421 () (_ BitVec 32))

(declare-fun mapRest!42421 () (Array (_ BitVec 32) ValueCell!12844))

(declare-fun mapValue!42421 () ValueCell!12844)

(assert (=> mapNonEmpty!42421 (= (arr!34234 _values!874) (store mapRest!42421 mapKey!42421 mapValue!42421))))

(declare-fun res!732290 () Bool)

(declare-fun e!626204 () Bool)

(assert (=> start!96478 (=> (not res!732290) (not e!626204))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96478 (= res!732290 (validMask!0 mask!1414))))

(assert (=> start!96478 e!626204))

(assert (=> start!96478 tp!81097))

(assert (=> start!96478 true))

(declare-fun tp_is_empty!27107 () Bool)

(assert (=> start!96478 tp_is_empty!27107))

(declare-datatypes ((array!71127 0))(
  ( (array!71128 (arr!34235 (Array (_ BitVec 32) (_ BitVec 64))) (size!34771 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71127)

(declare-fun array_inv!26376 (array!71127) Bool)

(assert (=> start!96478 (array_inv!26376 _keys!1070)))

(declare-fun e!626206 () Bool)

(declare-fun array_inv!26377 (array!71125) Bool)

(assert (=> start!96478 (and (array_inv!26377 _values!874) e!626206)))

(declare-fun b!1097168 () Bool)

(declare-fun e!626208 () Bool)

(assert (=> b!1097168 (= e!626204 e!626208)))

(declare-fun res!732295 () Bool)

(assert (=> b!1097168 (=> (not res!732295) (not e!626208))))

(declare-fun lt!490412 () array!71127)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71127 (_ BitVec 32)) Bool)

(assert (=> b!1097168 (= res!732295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490412 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097168 (= lt!490412 (array!71128 (store (arr!34235 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34771 _keys!1070)))))

(declare-fun b!1097169 () Bool)

(declare-fun res!732288 () Bool)

(assert (=> b!1097169 (=> (not res!732288) (not e!626204))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1097169 (= res!732288 (and (= (size!34770 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34771 _keys!1070) (size!34770 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097170 () Bool)

(declare-fun e!626205 () Bool)

(assert (=> b!1097170 (= e!626206 (and e!626205 mapRes!42421))))

(declare-fun condMapEmpty!42421 () Bool)

(declare-fun mapDefault!42421 () ValueCell!12844)

