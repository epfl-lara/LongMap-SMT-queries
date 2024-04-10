; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96868 () Bool)

(assert start!96868)

(declare-fun b_free!23185 () Bool)

(declare-fun b_next!23185 () Bool)

(assert (=> start!96868 (= b_free!23185 (not b_next!23185))))

(declare-fun tp!81512 () Bool)

(declare-fun b_and!37173 () Bool)

(assert (=> start!96868 (= tp!81512 b_and!37173)))

(declare-fun b!1101940 () Bool)

(declare-fun e!628975 () Bool)

(declare-fun e!628972 () Bool)

(assert (=> b!1101940 (= e!628975 (not e!628972))))

(declare-fun res!735265 () Bool)

(assert (=> b!1101940 (=> res!735265 e!628972)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101940 (= res!735265 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41441 0))(
  ( (V!41442 (val!13674 Int)) )
))
(declare-fun minValue!831 () V!41441)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17390 0))(
  ( (tuple2!17391 (_1!8706 (_ BitVec 64)) (_2!8706 V!41441)) )
))
(declare-datatypes ((List!24005 0))(
  ( (Nil!24002) (Cons!24001 (h!25210 tuple2!17390) (t!34236 List!24005)) )
))
(declare-datatypes ((ListLongMap!15359 0))(
  ( (ListLongMap!15360 (toList!7695 List!24005)) )
))
(declare-fun lt!494218 () ListLongMap!15359)

(declare-fun zeroValue!831 () V!41441)

(declare-datatypes ((array!71391 0))(
  ( (array!71392 (arr!34357 (Array (_ BitVec 32) (_ BitVec 64))) (size!34893 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71391)

(declare-datatypes ((ValueCell!12908 0))(
  ( (ValueCellFull!12908 (v!16305 V!41441)) (EmptyCell!12908) )
))
(declare-datatypes ((array!71393 0))(
  ( (array!71394 (arr!34358 (Array (_ BitVec 32) ValueCell!12908)) (size!34894 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71393)

(declare-fun getCurrentListMap!4400 (array!71391 array!71393 (_ BitVec 32) (_ BitVec 32) V!41441 V!41441 (_ BitVec 32) Int) ListLongMap!15359)

(assert (=> b!1101940 (= lt!494218 (getCurrentListMap!4400 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494213 () array!71393)

(declare-fun lt!494220 () ListLongMap!15359)

(declare-fun lt!494215 () array!71391)

(assert (=> b!1101940 (= lt!494220 (getCurrentListMap!4400 lt!494215 lt!494213 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494211 () ListLongMap!15359)

(declare-fun lt!494212 () ListLongMap!15359)

(assert (=> b!1101940 (and (= lt!494211 lt!494212) (= lt!494212 lt!494211))))

(declare-fun lt!494210 () ListLongMap!15359)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!978 (ListLongMap!15359 (_ BitVec 64)) ListLongMap!15359)

(assert (=> b!1101940 (= lt!494212 (-!978 lt!494210 k!904))))

(declare-datatypes ((Unit!36208 0))(
  ( (Unit!36209) )
))
(declare-fun lt!494217 () Unit!36208)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!226 (array!71391 array!71393 (_ BitVec 32) (_ BitVec 32) V!41441 V!41441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36208)

(assert (=> b!1101940 (= lt!494217 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4196 (array!71391 array!71393 (_ BitVec 32) (_ BitVec 32) V!41441 V!41441 (_ BitVec 32) Int) ListLongMap!15359)

(assert (=> b!1101940 (= lt!494211 (getCurrentListMapNoExtraKeys!4196 lt!494215 lt!494213 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2331 (Int (_ BitVec 64)) V!41441)

(assert (=> b!1101940 (= lt!494213 (array!71394 (store (arr!34358 _values!874) i!650 (ValueCellFull!12908 (dynLambda!2331 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34894 _values!874)))))

(assert (=> b!1101940 (= lt!494210 (getCurrentListMapNoExtraKeys!4196 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101940 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!494219 () Unit!36208)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71391 (_ BitVec 64) (_ BitVec 32)) Unit!36208)

(assert (=> b!1101940 (= lt!494219 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1101941 () Bool)

(declare-fun res!735260 () Bool)

(assert (=> b!1101941 (=> (not res!735260) (not e!628975))))

(declare-datatypes ((List!24006 0))(
  ( (Nil!24003) (Cons!24002 (h!25211 (_ BitVec 64)) (t!34237 List!24006)) )
))
(declare-fun arrayNoDuplicates!0 (array!71391 (_ BitVec 32) List!24006) Bool)

(assert (=> b!1101941 (= res!735260 (arrayNoDuplicates!0 lt!494215 #b00000000000000000000000000000000 Nil!24003))))

(declare-fun b!1101942 () Bool)

(declare-fun res!735258 () Bool)

(declare-fun e!628969 () Bool)

(assert (=> b!1101942 (=> (not res!735258) (not e!628969))))

(assert (=> b!1101942 (= res!735258 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24003))))

(declare-fun b!1101943 () Bool)

(declare-fun res!735255 () Bool)

(assert (=> b!1101943 (=> (not res!735255) (not e!628969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101943 (= res!735255 (validKeyInArray!0 k!904))))

(declare-fun b!1101944 () Bool)

(declare-fun e!628973 () Bool)

(assert (=> b!1101944 (= e!628973 (bvslt i!650 (size!34894 _values!874)))))

(declare-fun lt!494209 () ListLongMap!15359)

(declare-fun lt!494221 () ListLongMap!15359)

(assert (=> b!1101944 (= (-!978 lt!494209 k!904) lt!494221)))

(declare-fun lt!494216 () Unit!36208)

(declare-fun addRemoveCommutativeForDiffKeys!135 (ListLongMap!15359 (_ BitVec 64) V!41441 (_ BitVec 64)) Unit!36208)

(assert (=> b!1101944 (= lt!494216 (addRemoveCommutativeForDiffKeys!135 lt!494210 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun res!735264 () Bool)

(assert (=> start!96868 (=> (not res!735264) (not e!628969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96868 (= res!735264 (validMask!0 mask!1414))))

(assert (=> start!96868 e!628969))

(assert (=> start!96868 tp!81512))

(assert (=> start!96868 true))

(declare-fun tp_is_empty!27235 () Bool)

(assert (=> start!96868 tp_is_empty!27235))

(declare-fun array_inv!26462 (array!71391) Bool)

(assert (=> start!96868 (array_inv!26462 _keys!1070)))

(declare-fun e!628971 () Bool)

(declare-fun array_inv!26463 (array!71393) Bool)

(assert (=> start!96868 (and (array_inv!26463 _values!874) e!628971)))

(declare-fun b!1101945 () Bool)

(declare-fun res!735262 () Bool)

(assert (=> b!1101945 (=> (not res!735262) (not e!628969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71391 (_ BitVec 32)) Bool)

(assert (=> b!1101945 (= res!735262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42643 () Bool)

(declare-fun mapRes!42643 () Bool)

(declare-fun tp!81511 () Bool)

(declare-fun e!628974 () Bool)

(assert (=> mapNonEmpty!42643 (= mapRes!42643 (and tp!81511 e!628974))))

(declare-fun mapRest!42643 () (Array (_ BitVec 32) ValueCell!12908))

(declare-fun mapKey!42643 () (_ BitVec 32))

(declare-fun mapValue!42643 () ValueCell!12908)

(assert (=> mapNonEmpty!42643 (= (arr!34358 _values!874) (store mapRest!42643 mapKey!42643 mapValue!42643))))

(declare-fun mapIsEmpty!42643 () Bool)

(assert (=> mapIsEmpty!42643 mapRes!42643))

(declare-fun b!1101946 () Bool)

(declare-fun res!735257 () Bool)

(assert (=> b!1101946 (=> (not res!735257) (not e!628969))))

(assert (=> b!1101946 (= res!735257 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34893 _keys!1070))))))

(declare-fun b!1101947 () Bool)

(assert (=> b!1101947 (= e!628969 e!628975)))

(declare-fun res!735256 () Bool)

(assert (=> b!1101947 (=> (not res!735256) (not e!628975))))

(assert (=> b!1101947 (= res!735256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494215 mask!1414))))

(assert (=> b!1101947 (= lt!494215 (array!71392 (store (arr!34357 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34893 _keys!1070)))))

(declare-fun b!1101948 () Bool)

(assert (=> b!1101948 (= e!628974 tp_is_empty!27235)))

(declare-fun b!1101949 () Bool)

(declare-fun res!735261 () Bool)

(assert (=> b!1101949 (=> (not res!735261) (not e!628969))))

(assert (=> b!1101949 (= res!735261 (= (select (arr!34357 _keys!1070) i!650) k!904))))

(declare-fun b!1101950 () Bool)

(assert (=> b!1101950 (= e!628972 e!628973)))

(declare-fun res!735259 () Bool)

(assert (=> b!1101950 (=> res!735259 e!628973)))

(assert (=> b!1101950 (= res!735259 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(assert (=> b!1101950 (= lt!494218 lt!494209)))

(declare-fun lt!494214 () tuple2!17390)

(declare-fun +!3399 (ListLongMap!15359 tuple2!17390) ListLongMap!15359)

(assert (=> b!1101950 (= lt!494209 (+!3399 lt!494210 lt!494214))))

(assert (=> b!1101950 (= lt!494220 lt!494221)))

(assert (=> b!1101950 (= lt!494221 (+!3399 lt!494212 lt!494214))))

(assert (=> b!1101950 (= lt!494220 (+!3399 lt!494211 lt!494214))))

(assert (=> b!1101950 (= lt!494214 (tuple2!17391 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1101951 () Bool)

(declare-fun res!735263 () Bool)

(assert (=> b!1101951 (=> (not res!735263) (not e!628969))))

(assert (=> b!1101951 (= res!735263 (and (= (size!34894 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34893 _keys!1070) (size!34894 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1101952 () Bool)

(declare-fun e!628970 () Bool)

(assert (=> b!1101952 (= e!628970 tp_is_empty!27235)))

(declare-fun b!1101953 () Bool)

(assert (=> b!1101953 (= e!628971 (and e!628970 mapRes!42643))))

(declare-fun condMapEmpty!42643 () Bool)

(declare-fun mapDefault!42643 () ValueCell!12908)

