; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96474 () Bool)

(assert start!96474)

(declare-fun b_free!23053 () Bool)

(declare-fun b_next!23053 () Bool)

(assert (=> start!96474 (= b_free!23053 (not b_next!23053))))

(declare-fun tp!81085 () Bool)

(declare-fun b_and!36769 () Bool)

(assert (=> start!96474 (= tp!81085 b_and!36769)))

(declare-fun b!1097092 () Bool)

(declare-fun res!732241 () Bool)

(declare-fun e!626173 () Bool)

(assert (=> b!1097092 (=> (not res!732241) (not e!626173))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097092 (= res!732241 (validKeyInArray!0 k!904))))

(declare-fun b!1097093 () Bool)

(declare-fun res!732239 () Bool)

(assert (=> b!1097093 (=> (not res!732239) (not e!626173))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71117 0))(
  ( (array!71118 (arr!34230 (Array (_ BitVec 32) (_ BitVec 64))) (size!34766 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71117)

(declare-datatypes ((V!41265 0))(
  ( (V!41266 (val!13608 Int)) )
))
(declare-datatypes ((ValueCell!12842 0))(
  ( (ValueCellFull!12842 (v!16229 V!41265)) (EmptyCell!12842) )
))
(declare-datatypes ((array!71119 0))(
  ( (array!71120 (arr!34231 (Array (_ BitVec 32) ValueCell!12842)) (size!34767 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71119)

(assert (=> b!1097093 (= res!732239 (and (= (size!34767 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34766 _keys!1070) (size!34767 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42415 () Bool)

(declare-fun mapRes!42415 () Bool)

(assert (=> mapIsEmpty!42415 mapRes!42415))

(declare-fun b!1097094 () Bool)

(declare-fun res!732235 () Bool)

(assert (=> b!1097094 (=> (not res!732235) (not e!626173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71117 (_ BitVec 32)) Bool)

(assert (=> b!1097094 (= res!732235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1097095 () Bool)

(declare-fun res!732236 () Bool)

(assert (=> b!1097095 (=> (not res!732236) (not e!626173))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097095 (= res!732236 (= (select (arr!34230 _keys!1070) i!650) k!904))))

(declare-fun b!1097096 () Bool)

(declare-fun res!732234 () Bool)

(assert (=> b!1097096 (=> (not res!732234) (not e!626173))))

(declare-datatypes ((List!23904 0))(
  ( (Nil!23901) (Cons!23900 (h!25109 (_ BitVec 64)) (t!34003 List!23904)) )
))
(declare-fun arrayNoDuplicates!0 (array!71117 (_ BitVec 32) List!23904) Bool)

(assert (=> b!1097096 (= res!732234 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23901))))

(declare-fun b!1097097 () Bool)

(declare-fun e!626168 () Bool)

(assert (=> b!1097097 (= e!626168 (not true))))

(declare-datatypes ((tuple2!17282 0))(
  ( (tuple2!17283 (_1!8652 (_ BitVec 64)) (_2!8652 V!41265)) )
))
(declare-datatypes ((List!23905 0))(
  ( (Nil!23902) (Cons!23901 (h!25110 tuple2!17282) (t!34004 List!23905)) )
))
(declare-datatypes ((ListLongMap!15251 0))(
  ( (ListLongMap!15252 (toList!7641 List!23905)) )
))
(declare-fun lt!490379 () ListLongMap!15251)

(declare-fun lt!490380 () ListLongMap!15251)

(assert (=> b!1097097 (and (= lt!490379 lt!490380) (= lt!490380 lt!490379))))

(declare-fun lt!490377 () ListLongMap!15251)

(declare-fun -!931 (ListLongMap!15251 (_ BitVec 64)) ListLongMap!15251)

(assert (=> b!1097097 (= lt!490380 (-!931 lt!490377 k!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41265)

(declare-datatypes ((Unit!36094 0))(
  ( (Unit!36095) )
))
(declare-fun lt!490376 () Unit!36094)

(declare-fun zeroValue!831 () V!41265)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!187 (array!71117 array!71119 (_ BitVec 32) (_ BitVec 32) V!41265 V!41265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36094)

(assert (=> b!1097097 (= lt!490376 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!187 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490381 () array!71117)

(declare-fun getCurrentListMapNoExtraKeys!4157 (array!71117 array!71119 (_ BitVec 32) (_ BitVec 32) V!41265 V!41265 (_ BitVec 32) Int) ListLongMap!15251)

(declare-fun dynLambda!2292 (Int (_ BitVec 64)) V!41265)

(assert (=> b!1097097 (= lt!490379 (getCurrentListMapNoExtraKeys!4157 lt!490381 (array!71120 (store (arr!34231 _values!874) i!650 (ValueCellFull!12842 (dynLambda!2292 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34767 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1097097 (= lt!490377 (getCurrentListMapNoExtraKeys!4157 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097097 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!490378 () Unit!36094)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71117 (_ BitVec 64) (_ BitVec 32)) Unit!36094)

(assert (=> b!1097097 (= lt!490378 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1097098 () Bool)

(declare-fun e!626169 () Bool)

(declare-fun e!626171 () Bool)

(assert (=> b!1097098 (= e!626169 (and e!626171 mapRes!42415))))

(declare-fun condMapEmpty!42415 () Bool)

(declare-fun mapDefault!42415 () ValueCell!12842)

