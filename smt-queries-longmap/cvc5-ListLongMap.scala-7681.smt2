; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96432 () Bool)

(assert start!96432)

(declare-fun b_free!23011 () Bool)

(declare-fun b_next!23011 () Bool)

(assert (=> start!96432 (= b_free!23011 (not b_next!23011))))

(declare-fun tp!80959 () Bool)

(declare-fun b_and!36685 () Bool)

(assert (=> start!96432 (= tp!80959 b_and!36685)))

(declare-fun b!1096294 () Bool)

(declare-fun e!625792 () Bool)

(assert (=> b!1096294 (= e!625792 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41209 0))(
  ( (V!41210 (val!13587 Int)) )
))
(declare-datatypes ((ValueCell!12821 0))(
  ( (ValueCellFull!12821 (v!16208 V!41209)) (EmptyCell!12821) )
))
(declare-datatypes ((array!71035 0))(
  ( (array!71036 (arr!34189 (Array (_ BitVec 32) ValueCell!12821)) (size!34725 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71035)

(declare-fun minValue!831 () V!41209)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((tuple2!17256 0))(
  ( (tuple2!17257 (_1!8639 (_ BitVec 64)) (_2!8639 V!41209)) )
))
(declare-datatypes ((List!23876 0))(
  ( (Nil!23873) (Cons!23872 (h!25081 tuple2!17256) (t!33933 List!23876)) )
))
(declare-datatypes ((ListLongMap!15225 0))(
  ( (ListLongMap!15226 (toList!7628 List!23876)) )
))
(declare-fun lt!490103 () ListLongMap!15225)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41209)

(declare-datatypes ((array!71037 0))(
  ( (array!71038 (arr!34190 (Array (_ BitVec 32) (_ BitVec 64))) (size!34726 (_ BitVec 32))) )
))
(declare-fun lt!490105 () array!71037)

(declare-fun getCurrentListMapNoExtraKeys!4144 (array!71037 array!71035 (_ BitVec 32) (_ BitVec 32) V!41209 V!41209 (_ BitVec 32) Int) ListLongMap!15225)

(declare-fun dynLambda!2279 (Int (_ BitVec 64)) V!41209)

(assert (=> b!1096294 (= lt!490103 (getCurrentListMapNoExtraKeys!4144 lt!490105 (array!71036 (store (arr!34189 _values!874) i!650 (ValueCellFull!12821 (dynLambda!2279 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34725 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490102 () ListLongMap!15225)

(declare-fun _keys!1070 () array!71037)

(assert (=> b!1096294 (= lt!490102 (getCurrentListMapNoExtraKeys!4144 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096294 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36068 0))(
  ( (Unit!36069) )
))
(declare-fun lt!490104 () Unit!36068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71037 (_ BitVec 64) (_ BitVec 32)) Unit!36068)

(assert (=> b!1096294 (= lt!490104 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1096295 () Bool)

(declare-fun res!731666 () Bool)

(declare-fun e!625790 () Bool)

(assert (=> b!1096295 (=> (not res!731666) (not e!625790))))

(assert (=> b!1096295 (= res!731666 (= (select (arr!34190 _keys!1070) i!650) k!904))))

(declare-fun b!1096296 () Bool)

(declare-fun e!625794 () Bool)

(declare-fun tp_is_empty!27061 () Bool)

(assert (=> b!1096296 (= e!625794 tp_is_empty!27061)))

(declare-fun b!1096297 () Bool)

(declare-fun res!731667 () Bool)

(assert (=> b!1096297 (=> (not res!731667) (not e!625790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71037 (_ BitVec 32)) Bool)

(assert (=> b!1096297 (= res!731667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096298 () Bool)

(declare-fun res!731674 () Bool)

(assert (=> b!1096298 (=> (not res!731674) (not e!625792))))

(declare-datatypes ((List!23877 0))(
  ( (Nil!23874) (Cons!23873 (h!25082 (_ BitVec 64)) (t!33934 List!23877)) )
))
(declare-fun arrayNoDuplicates!0 (array!71037 (_ BitVec 32) List!23877) Bool)

(assert (=> b!1096298 (= res!731674 (arrayNoDuplicates!0 lt!490105 #b00000000000000000000000000000000 Nil!23874))))

(declare-fun mapIsEmpty!42352 () Bool)

(declare-fun mapRes!42352 () Bool)

(assert (=> mapIsEmpty!42352 mapRes!42352))

(declare-fun b!1096299 () Bool)

(declare-fun res!731668 () Bool)

(assert (=> b!1096299 (=> (not res!731668) (not e!625790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096299 (= res!731668 (validKeyInArray!0 k!904))))

(declare-fun b!1096300 () Bool)

(assert (=> b!1096300 (= e!625790 e!625792)))

(declare-fun res!731671 () Bool)

(assert (=> b!1096300 (=> (not res!731671) (not e!625792))))

(assert (=> b!1096300 (= res!731671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490105 mask!1414))))

(assert (=> b!1096300 (= lt!490105 (array!71038 (store (arr!34190 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34726 _keys!1070)))))

(declare-fun res!731670 () Bool)

(assert (=> start!96432 (=> (not res!731670) (not e!625790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96432 (= res!731670 (validMask!0 mask!1414))))

(assert (=> start!96432 e!625790))

(assert (=> start!96432 tp!80959))

(assert (=> start!96432 true))

(assert (=> start!96432 tp_is_empty!27061))

(declare-fun array_inv!26344 (array!71037) Bool)

(assert (=> start!96432 (array_inv!26344 _keys!1070)))

(declare-fun e!625795 () Bool)

(declare-fun array_inv!26345 (array!71035) Bool)

(assert (=> start!96432 (and (array_inv!26345 _values!874) e!625795)))

(declare-fun mapNonEmpty!42352 () Bool)

(declare-fun tp!80960 () Bool)

(declare-fun e!625793 () Bool)

(assert (=> mapNonEmpty!42352 (= mapRes!42352 (and tp!80960 e!625793))))

(declare-fun mapKey!42352 () (_ BitVec 32))

(declare-fun mapValue!42352 () ValueCell!12821)

(declare-fun mapRest!42352 () (Array (_ BitVec 32) ValueCell!12821))

(assert (=> mapNonEmpty!42352 (= (arr!34189 _values!874) (store mapRest!42352 mapKey!42352 mapValue!42352))))

(declare-fun b!1096301 () Bool)

(declare-fun res!731669 () Bool)

(assert (=> b!1096301 (=> (not res!731669) (not e!625790))))

(assert (=> b!1096301 (= res!731669 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23874))))

(declare-fun b!1096302 () Bool)

(assert (=> b!1096302 (= e!625793 tp_is_empty!27061)))

(declare-fun b!1096303 () Bool)

(declare-fun res!731672 () Bool)

(assert (=> b!1096303 (=> (not res!731672) (not e!625790))))

(assert (=> b!1096303 (= res!731672 (and (= (size!34725 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34726 _keys!1070) (size!34725 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096304 () Bool)

(declare-fun res!731673 () Bool)

(assert (=> b!1096304 (=> (not res!731673) (not e!625790))))

(assert (=> b!1096304 (= res!731673 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34726 _keys!1070))))))

(declare-fun b!1096305 () Bool)

(assert (=> b!1096305 (= e!625795 (and e!625794 mapRes!42352))))

(declare-fun condMapEmpty!42352 () Bool)

(declare-fun mapDefault!42352 () ValueCell!12821)

