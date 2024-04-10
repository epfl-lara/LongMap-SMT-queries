; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96424 () Bool)

(assert start!96424)

(declare-fun b_free!23003 () Bool)

(declare-fun b_next!23003 () Bool)

(assert (=> start!96424 (= b_free!23003 (not b_next!23003))))

(declare-fun tp!80935 () Bool)

(declare-fun b_and!36669 () Bool)

(assert (=> start!96424 (= tp!80935 b_and!36669)))

(declare-fun b!1096142 () Bool)

(declare-fun res!731561 () Bool)

(declare-fun e!625721 () Bool)

(assert (=> b!1096142 (=> (not res!731561) (not e!625721))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71019 0))(
  ( (array!71020 (arr!34181 (Array (_ BitVec 32) (_ BitVec 64))) (size!34717 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71019)

(assert (=> b!1096142 (= res!731561 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34717 _keys!1070))))))

(declare-fun b!1096143 () Bool)

(declare-fun res!731560 () Bool)

(assert (=> b!1096143 (=> (not res!731560) (not e!625721))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1096143 (= res!731560 (= (select (arr!34181 _keys!1070) i!650) k!904))))

(declare-fun b!1096144 () Bool)

(declare-fun e!625722 () Bool)

(declare-fun tp_is_empty!27053 () Bool)

(assert (=> b!1096144 (= e!625722 tp_is_empty!27053)))

(declare-fun b!1096145 () Bool)

(declare-fun res!731564 () Bool)

(assert (=> b!1096145 (=> (not res!731564) (not e!625721))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71019 (_ BitVec 32)) Bool)

(assert (=> b!1096145 (= res!731564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42340 () Bool)

(declare-fun mapRes!42340 () Bool)

(assert (=> mapIsEmpty!42340 mapRes!42340))

(declare-fun b!1096146 () Bool)

(declare-fun e!625720 () Bool)

(assert (=> b!1096146 (= e!625720 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!490056 () array!71019)

(declare-datatypes ((V!41197 0))(
  ( (V!41198 (val!13583 Int)) )
))
(declare-datatypes ((ValueCell!12817 0))(
  ( (ValueCellFull!12817 (v!16204 V!41197)) (EmptyCell!12817) )
))
(declare-datatypes ((array!71021 0))(
  ( (array!71022 (arr!34182 (Array (_ BitVec 32) ValueCell!12817)) (size!34718 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71021)

(declare-fun minValue!831 () V!41197)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17250 0))(
  ( (tuple2!17251 (_1!8636 (_ BitVec 64)) (_2!8636 V!41197)) )
))
(declare-datatypes ((List!23870 0))(
  ( (Nil!23867) (Cons!23866 (h!25075 tuple2!17250) (t!33919 List!23870)) )
))
(declare-datatypes ((ListLongMap!15219 0))(
  ( (ListLongMap!15220 (toList!7625 List!23870)) )
))
(declare-fun lt!490057 () ListLongMap!15219)

(declare-fun zeroValue!831 () V!41197)

(declare-fun getCurrentListMapNoExtraKeys!4141 (array!71019 array!71021 (_ BitVec 32) (_ BitVec 32) V!41197 V!41197 (_ BitVec 32) Int) ListLongMap!15219)

(declare-fun dynLambda!2276 (Int (_ BitVec 64)) V!41197)

(assert (=> b!1096146 (= lt!490057 (getCurrentListMapNoExtraKeys!4141 lt!490056 (array!71022 (store (arr!34182 _values!874) i!650 (ValueCellFull!12817 (dynLambda!2276 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34718 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490055 () ListLongMap!15219)

(assert (=> b!1096146 (= lt!490055 (getCurrentListMapNoExtraKeys!4141 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096146 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36062 0))(
  ( (Unit!36063) )
))
(declare-fun lt!490054 () Unit!36062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71019 (_ BitVec 64) (_ BitVec 32)) Unit!36062)

(assert (=> b!1096146 (= lt!490054 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapNonEmpty!42340 () Bool)

(declare-fun tp!80936 () Bool)

(assert (=> mapNonEmpty!42340 (= mapRes!42340 (and tp!80936 e!625722))))

(declare-fun mapKey!42340 () (_ BitVec 32))

(declare-fun mapValue!42340 () ValueCell!12817)

(declare-fun mapRest!42340 () (Array (_ BitVec 32) ValueCell!12817))

(assert (=> mapNonEmpty!42340 (= (arr!34182 _values!874) (store mapRest!42340 mapKey!42340 mapValue!42340))))

(declare-fun b!1096147 () Bool)

(declare-fun res!731558 () Bool)

(assert (=> b!1096147 (=> (not res!731558) (not e!625720))))

(declare-datatypes ((List!23871 0))(
  ( (Nil!23868) (Cons!23867 (h!25076 (_ BitVec 64)) (t!33920 List!23871)) )
))
(declare-fun arrayNoDuplicates!0 (array!71019 (_ BitVec 32) List!23871) Bool)

(assert (=> b!1096147 (= res!731558 (arrayNoDuplicates!0 lt!490056 #b00000000000000000000000000000000 Nil!23868))))

(declare-fun b!1096148 () Bool)

(assert (=> b!1096148 (= e!625721 e!625720)))

(declare-fun res!731559 () Bool)

(assert (=> b!1096148 (=> (not res!731559) (not e!625720))))

(assert (=> b!1096148 (= res!731559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490056 mask!1414))))

(assert (=> b!1096148 (= lt!490056 (array!71020 (store (arr!34181 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34717 _keys!1070)))))

(declare-fun res!731566 () Bool)

(assert (=> start!96424 (=> (not res!731566) (not e!625721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96424 (= res!731566 (validMask!0 mask!1414))))

(assert (=> start!96424 e!625721))

(assert (=> start!96424 tp!80935))

(assert (=> start!96424 true))

(assert (=> start!96424 tp_is_empty!27053))

(declare-fun array_inv!26338 (array!71019) Bool)

(assert (=> start!96424 (array_inv!26338 _keys!1070)))

(declare-fun e!625719 () Bool)

(declare-fun array_inv!26339 (array!71021) Bool)

(assert (=> start!96424 (and (array_inv!26339 _values!874) e!625719)))

(declare-fun b!1096149 () Bool)

(declare-fun res!731563 () Bool)

(assert (=> b!1096149 (=> (not res!731563) (not e!625721))))

(assert (=> b!1096149 (= res!731563 (and (= (size!34718 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34717 _keys!1070) (size!34718 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096150 () Bool)

(declare-fun e!625723 () Bool)

(assert (=> b!1096150 (= e!625719 (and e!625723 mapRes!42340))))

(declare-fun condMapEmpty!42340 () Bool)

(declare-fun mapDefault!42340 () ValueCell!12817)

