; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96394 () Bool)

(assert start!96394)

(declare-fun b_free!22973 () Bool)

(declare-fun b_next!22973 () Bool)

(assert (=> start!96394 (= b_free!22973 (not b_next!22973))))

(declare-fun tp!80846 () Bool)

(declare-fun b_and!36609 () Bool)

(assert (=> start!96394 (= tp!80846 b_and!36609)))

(declare-fun res!731161 () Bool)

(declare-fun e!625448 () Bool)

(assert (=> start!96394 (=> (not res!731161) (not e!625448))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96394 (= res!731161 (validMask!0 mask!1414))))

(assert (=> start!96394 e!625448))

(assert (=> start!96394 tp!80846))

(assert (=> start!96394 true))

(declare-fun tp_is_empty!27023 () Bool)

(assert (=> start!96394 tp_is_empty!27023))

(declare-datatypes ((array!70959 0))(
  ( (array!70960 (arr!34151 (Array (_ BitVec 32) (_ BitVec 64))) (size!34687 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70959)

(declare-fun array_inv!26316 (array!70959) Bool)

(assert (=> start!96394 (array_inv!26316 _keys!1070)))

(declare-datatypes ((V!41157 0))(
  ( (V!41158 (val!13568 Int)) )
))
(declare-datatypes ((ValueCell!12802 0))(
  ( (ValueCellFull!12802 (v!16189 V!41157)) (EmptyCell!12802) )
))
(declare-datatypes ((array!70961 0))(
  ( (array!70962 (arr!34152 (Array (_ BitVec 32) ValueCell!12802)) (size!34688 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70961)

(declare-fun e!625450 () Bool)

(declare-fun array_inv!26317 (array!70961) Bool)

(assert (=> start!96394 (and (array_inv!26317 _values!874) e!625450)))

(declare-fun b!1095572 () Bool)

(declare-fun res!731153 () Bool)

(declare-fun e!625451 () Bool)

(assert (=> b!1095572 (=> (not res!731153) (not e!625451))))

(declare-fun lt!489876 () array!70959)

(declare-datatypes ((List!23848 0))(
  ( (Nil!23845) (Cons!23844 (h!25053 (_ BitVec 64)) (t!33867 List!23848)) )
))
(declare-fun arrayNoDuplicates!0 (array!70959 (_ BitVec 32) List!23848) Bool)

(assert (=> b!1095572 (= res!731153 (arrayNoDuplicates!0 lt!489876 #b00000000000000000000000000000000 Nil!23845))))

(declare-fun b!1095573 () Bool)

(declare-fun e!625449 () Bool)

(assert (=> b!1095573 (= e!625449 tp_is_empty!27023)))

(declare-fun b!1095574 () Bool)

(declare-fun res!731158 () Bool)

(assert (=> b!1095574 (=> (not res!731158) (not e!625448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70959 (_ BitVec 32)) Bool)

(assert (=> b!1095574 (= res!731158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095575 () Bool)

(declare-fun res!731159 () Bool)

(assert (=> b!1095575 (=> (not res!731159) (not e!625448))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1095575 (= res!731159 (and (= (size!34688 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34687 _keys!1070) (size!34688 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095576 () Bool)

(declare-fun res!731160 () Bool)

(assert (=> b!1095576 (=> (not res!731160) (not e!625448))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095576 (= res!731160 (= (select (arr!34151 _keys!1070) i!650) k!904))))

(declare-fun b!1095577 () Bool)

(declare-fun res!731155 () Bool)

(assert (=> b!1095577 (=> (not res!731155) (not e!625448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095577 (= res!731155 (validKeyInArray!0 k!904))))

(declare-fun b!1095578 () Bool)

(declare-fun e!625453 () Bool)

(declare-fun mapRes!42295 () Bool)

(assert (=> b!1095578 (= e!625450 (and e!625453 mapRes!42295))))

(declare-fun condMapEmpty!42295 () Bool)

(declare-fun mapDefault!42295 () ValueCell!12802)

