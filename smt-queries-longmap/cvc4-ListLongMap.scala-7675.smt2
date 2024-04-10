; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96400 () Bool)

(assert start!96400)

(declare-fun b_free!22979 () Bool)

(declare-fun b_next!22979 () Bool)

(assert (=> start!96400 (= b_free!22979 (not b_next!22979))))

(declare-fun tp!80863 () Bool)

(declare-fun b_and!36621 () Bool)

(assert (=> start!96400 (= tp!80863 b_and!36621)))

(declare-fun b!1095686 () Bool)

(declare-fun res!731242 () Bool)

(declare-fun e!625505 () Bool)

(assert (=> b!1095686 (=> (not res!731242) (not e!625505))))

(declare-datatypes ((array!70971 0))(
  ( (array!70972 (arr!34157 (Array (_ BitVec 32) (_ BitVec 64))) (size!34693 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70971)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095686 (= res!731242 (= (select (arr!34157 _keys!1070) i!650) k!904))))

(declare-fun b!1095687 () Bool)

(declare-fun res!731234 () Bool)

(assert (=> b!1095687 (=> (not res!731234) (not e!625505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095687 (= res!731234 (validKeyInArray!0 k!904))))

(declare-fun b!1095688 () Bool)

(declare-fun e!625504 () Bool)

(declare-fun tp_is_empty!27029 () Bool)

(assert (=> b!1095688 (= e!625504 tp_is_empty!27029)))

(declare-fun b!1095689 () Bool)

(declare-fun e!625503 () Bool)

(assert (=> b!1095689 (= e!625503 (not true))))

(declare-datatypes ((V!41165 0))(
  ( (V!41166 (val!13571 Int)) )
))
(declare-datatypes ((ValueCell!12805 0))(
  ( (ValueCellFull!12805 (v!16192 V!41165)) (EmptyCell!12805) )
))
(declare-datatypes ((array!70973 0))(
  ( (array!70974 (arr!34158 (Array (_ BitVec 32) ValueCell!12805)) (size!34694 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70973)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17230 0))(
  ( (tuple2!17231 (_1!8626 (_ BitVec 64)) (_2!8626 V!41165)) )
))
(declare-datatypes ((List!23851 0))(
  ( (Nil!23848) (Cons!23847 (h!25056 tuple2!17230) (t!33876 List!23851)) )
))
(declare-datatypes ((ListLongMap!15199 0))(
  ( (ListLongMap!15200 (toList!7615 List!23851)) )
))
(declare-fun lt!489911 () ListLongMap!15199)

(declare-fun zeroValue!831 () V!41165)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41165)

(declare-fun lt!489912 () array!70971)

(declare-fun getCurrentListMapNoExtraKeys!4131 (array!70971 array!70973 (_ BitVec 32) (_ BitVec 32) V!41165 V!41165 (_ BitVec 32) Int) ListLongMap!15199)

(declare-fun dynLambda!2266 (Int (_ BitVec 64)) V!41165)

(assert (=> b!1095689 (= lt!489911 (getCurrentListMapNoExtraKeys!4131 lt!489912 (array!70974 (store (arr!34158 _values!874) i!650 (ValueCellFull!12805 (dynLambda!2266 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34694 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489913 () ListLongMap!15199)

(assert (=> b!1095689 (= lt!489913 (getCurrentListMapNoExtraKeys!4131 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095689 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36042 0))(
  ( (Unit!36043) )
))
(declare-fun lt!489910 () Unit!36042)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70971 (_ BitVec 64) (_ BitVec 32)) Unit!36042)

(assert (=> b!1095689 (= lt!489910 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1095690 () Bool)

(declare-fun res!731238 () Bool)

(assert (=> b!1095690 (=> (not res!731238) (not e!625505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70971 (_ BitVec 32)) Bool)

(assert (=> b!1095690 (= res!731238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095691 () Bool)

(declare-fun res!731239 () Bool)

(assert (=> b!1095691 (=> (not res!731239) (not e!625505))))

(assert (=> b!1095691 (= res!731239 (and (= (size!34694 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34693 _keys!1070) (size!34694 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!731240 () Bool)

(assert (=> start!96400 (=> (not res!731240) (not e!625505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96400 (= res!731240 (validMask!0 mask!1414))))

(assert (=> start!96400 e!625505))

(assert (=> start!96400 tp!80863))

(assert (=> start!96400 true))

(assert (=> start!96400 tp_is_empty!27029))

(declare-fun array_inv!26320 (array!70971) Bool)

(assert (=> start!96400 (array_inv!26320 _keys!1070)))

(declare-fun e!625506 () Bool)

(declare-fun array_inv!26321 (array!70973) Bool)

(assert (=> start!96400 (and (array_inv!26321 _values!874) e!625506)))

(declare-fun mapNonEmpty!42304 () Bool)

(declare-fun mapRes!42304 () Bool)

(declare-fun tp!80864 () Bool)

(assert (=> mapNonEmpty!42304 (= mapRes!42304 (and tp!80864 e!625504))))

(declare-fun mapValue!42304 () ValueCell!12805)

(declare-fun mapKey!42304 () (_ BitVec 32))

(declare-fun mapRest!42304 () (Array (_ BitVec 32) ValueCell!12805))

(assert (=> mapNonEmpty!42304 (= (arr!34158 _values!874) (store mapRest!42304 mapKey!42304 mapValue!42304))))

(declare-fun b!1095692 () Bool)

(declare-fun e!625502 () Bool)

(assert (=> b!1095692 (= e!625506 (and e!625502 mapRes!42304))))

(declare-fun condMapEmpty!42304 () Bool)

(declare-fun mapDefault!42304 () ValueCell!12805)

