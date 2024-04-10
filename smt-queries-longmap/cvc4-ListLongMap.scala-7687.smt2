; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96472 () Bool)

(assert start!96472)

(declare-fun b_free!23051 () Bool)

(declare-fun b_next!23051 () Bool)

(assert (=> start!96472 (= b_free!23051 (not b_next!23051))))

(declare-fun tp!81080 () Bool)

(declare-fun b_and!36765 () Bool)

(assert (=> start!96472 (= tp!81080 b_and!36765)))

(declare-fun b!1097054 () Bool)

(declare-fun e!626154 () Bool)

(declare-fun e!626155 () Bool)

(assert (=> b!1097054 (= e!626154 e!626155)))

(declare-fun res!732208 () Bool)

(assert (=> b!1097054 (=> (not res!732208) (not e!626155))))

(declare-datatypes ((array!71113 0))(
  ( (array!71114 (arr!34228 (Array (_ BitVec 32) (_ BitVec 64))) (size!34764 (_ BitVec 32))) )
))
(declare-fun lt!490359 () array!71113)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71113 (_ BitVec 32)) Bool)

(assert (=> b!1097054 (= res!732208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490359 mask!1414))))

(declare-fun _keys!1070 () array!71113)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097054 (= lt!490359 (array!71114 (store (arr!34228 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34764 _keys!1070)))))

(declare-fun res!732209 () Bool)

(assert (=> start!96472 (=> (not res!732209) (not e!626154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96472 (= res!732209 (validMask!0 mask!1414))))

(assert (=> start!96472 e!626154))

(assert (=> start!96472 tp!81080))

(assert (=> start!96472 true))

(declare-fun tp_is_empty!27101 () Bool)

(assert (=> start!96472 tp_is_empty!27101))

(declare-fun array_inv!26372 (array!71113) Bool)

(assert (=> start!96472 (array_inv!26372 _keys!1070)))

(declare-datatypes ((V!41261 0))(
  ( (V!41262 (val!13607 Int)) )
))
(declare-datatypes ((ValueCell!12841 0))(
  ( (ValueCellFull!12841 (v!16228 V!41261)) (EmptyCell!12841) )
))
(declare-datatypes ((array!71115 0))(
  ( (array!71116 (arr!34229 (Array (_ BitVec 32) ValueCell!12841)) (size!34765 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71115)

(declare-fun e!626151 () Bool)

(declare-fun array_inv!26373 (array!71115) Bool)

(assert (=> start!96472 (and (array_inv!26373 _values!874) e!626151)))

(declare-fun b!1097055 () Bool)

(declare-datatypes ((tuple2!17280 0))(
  ( (tuple2!17281 (_1!8651 (_ BitVec 64)) (_2!8651 V!41261)) )
))
(declare-datatypes ((List!23903 0))(
  ( (Nil!23900) (Cons!23899 (h!25108 tuple2!17280) (t!34000 List!23903)) )
))
(declare-datatypes ((ListLongMap!15249 0))(
  ( (ListLongMap!15250 (toList!7640 List!23903)) )
))
(declare-fun lt!490360 () ListLongMap!15249)

(declare-fun lt!490361 () ListLongMap!15249)

(assert (=> b!1097055 (= e!626155 (not (= lt!490360 lt!490361)))))

(assert (=> b!1097055 (= lt!490361 lt!490360)))

(declare-fun lt!490362 () ListLongMap!15249)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!930 (ListLongMap!15249 (_ BitVec 64)) ListLongMap!15249)

(assert (=> b!1097055 (= lt!490360 (-!930 lt!490362 k!904))))

(declare-datatypes ((Unit!36092 0))(
  ( (Unit!36093) )
))
(declare-fun lt!490358 () Unit!36092)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41261)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41261)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!186 (array!71113 array!71115 (_ BitVec 32) (_ BitVec 32) V!41261 V!41261 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36092)

(assert (=> b!1097055 (= lt!490358 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!186 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4156 (array!71113 array!71115 (_ BitVec 32) (_ BitVec 32) V!41261 V!41261 (_ BitVec 32) Int) ListLongMap!15249)

(declare-fun dynLambda!2291 (Int (_ BitVec 64)) V!41261)

(assert (=> b!1097055 (= lt!490361 (getCurrentListMapNoExtraKeys!4156 lt!490359 (array!71116 (store (arr!34229 _values!874) i!650 (ValueCellFull!12841 (dynLambda!2291 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34765 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1097055 (= lt!490362 (getCurrentListMapNoExtraKeys!4156 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097055 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!490363 () Unit!36092)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71113 (_ BitVec 64) (_ BitVec 32)) Unit!36092)

(assert (=> b!1097055 (= lt!490363 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapNonEmpty!42412 () Bool)

(declare-fun mapRes!42412 () Bool)

(declare-fun tp!81079 () Bool)

(declare-fun e!626152 () Bool)

(assert (=> mapNonEmpty!42412 (= mapRes!42412 (and tp!81079 e!626152))))

(declare-fun mapValue!42412 () ValueCell!12841)

(declare-fun mapKey!42412 () (_ BitVec 32))

(declare-fun mapRest!42412 () (Array (_ BitVec 32) ValueCell!12841))

(assert (=> mapNonEmpty!42412 (= (arr!34229 _values!874) (store mapRest!42412 mapKey!42412 mapValue!42412))))

(declare-fun b!1097056 () Bool)

(declare-fun res!732213 () Bool)

(assert (=> b!1097056 (=> (not res!732213) (not e!626154))))

(assert (=> b!1097056 (= res!732213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1097057 () Bool)

(declare-fun res!732211 () Bool)

(assert (=> b!1097057 (=> (not res!732211) (not e!626154))))

(assert (=> b!1097057 (= res!732211 (and (= (size!34765 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34764 _keys!1070) (size!34765 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097058 () Bool)

(declare-fun res!732214 () Bool)

(assert (=> b!1097058 (=> (not res!732214) (not e!626154))))

(assert (=> b!1097058 (= res!732214 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34764 _keys!1070))))))

(declare-fun b!1097059 () Bool)

(declare-fun e!626153 () Bool)

(assert (=> b!1097059 (= e!626151 (and e!626153 mapRes!42412))))

(declare-fun condMapEmpty!42412 () Bool)

(declare-fun mapDefault!42412 () ValueCell!12841)

