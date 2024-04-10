; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96438 () Bool)

(assert start!96438)

(declare-fun b_free!23017 () Bool)

(declare-fun b_next!23017 () Bool)

(assert (=> start!96438 (= b_free!23017 (not b_next!23017))))

(declare-fun tp!80978 () Bool)

(declare-fun b_and!36697 () Bool)

(assert (=> start!96438 (= tp!80978 b_and!36697)))

(declare-fun res!731750 () Bool)

(declare-fun e!625844 () Bool)

(assert (=> start!96438 (=> (not res!731750) (not e!625844))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96438 (= res!731750 (validMask!0 mask!1414))))

(assert (=> start!96438 e!625844))

(assert (=> start!96438 tp!80978))

(assert (=> start!96438 true))

(declare-fun tp_is_empty!27067 () Bool)

(assert (=> start!96438 tp_is_empty!27067))

(declare-datatypes ((array!71047 0))(
  ( (array!71048 (arr!34195 (Array (_ BitVec 32) (_ BitVec 64))) (size!34731 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71047)

(declare-fun array_inv!26348 (array!71047) Bool)

(assert (=> start!96438 (array_inv!26348 _keys!1070)))

(declare-datatypes ((V!41217 0))(
  ( (V!41218 (val!13590 Int)) )
))
(declare-datatypes ((ValueCell!12824 0))(
  ( (ValueCellFull!12824 (v!16211 V!41217)) (EmptyCell!12824) )
))
(declare-datatypes ((array!71049 0))(
  ( (array!71050 (arr!34196 (Array (_ BitVec 32) ValueCell!12824)) (size!34732 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71049)

(declare-fun e!625846 () Bool)

(declare-fun array_inv!26349 (array!71049) Bool)

(assert (=> start!96438 (and (array_inv!26349 _values!874) e!625846)))

(declare-fun mapIsEmpty!42361 () Bool)

(declare-fun mapRes!42361 () Bool)

(assert (=> mapIsEmpty!42361 mapRes!42361))

(declare-fun b!1096408 () Bool)

(declare-fun res!731751 () Bool)

(assert (=> b!1096408 (=> (not res!731751) (not e!625844))))

(declare-datatypes ((List!23881 0))(
  ( (Nil!23878) (Cons!23877 (h!25086 (_ BitVec 64)) (t!33944 List!23881)) )
))
(declare-fun arrayNoDuplicates!0 (array!71047 (_ BitVec 32) List!23881) Bool)

(assert (=> b!1096408 (= res!731751 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23878))))

(declare-fun b!1096409 () Bool)

(declare-fun e!625849 () Bool)

(assert (=> b!1096409 (= e!625849 tp_is_empty!27067)))

(declare-fun b!1096410 () Bool)

(declare-fun res!731755 () Bool)

(assert (=> b!1096410 (=> (not res!731755) (not e!625844))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1096410 (= res!731755 (and (= (size!34732 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34731 _keys!1070) (size!34732 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096411 () Bool)

(declare-fun res!731748 () Bool)

(assert (=> b!1096411 (=> (not res!731748) (not e!625844))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096411 (= res!731748 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34731 _keys!1070))))))

(declare-fun b!1096412 () Bool)

(declare-fun e!625845 () Bool)

(assert (=> b!1096412 (= e!625846 (and e!625845 mapRes!42361))))

(declare-fun condMapEmpty!42361 () Bool)

(declare-fun mapDefault!42361 () ValueCell!12824)

