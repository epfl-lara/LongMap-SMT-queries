; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96052 () Bool)

(assert start!96052)

(declare-fun b_free!22705 () Bool)

(declare-fun b_next!22705 () Bool)

(assert (=> start!96052 (= b_free!22705 (not b_next!22705))))

(declare-fun tp!79963 () Bool)

(declare-fun b_and!36085 () Bool)

(assert (=> start!96052 (= tp!79963 b_and!36085)))

(declare-fun b!1089250 () Bool)

(declare-fun res!726557 () Bool)

(declare-fun e!622149 () Bool)

(assert (=> b!1089250 (=> (not res!726557) (not e!622149))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089250 (= res!726557 (validKeyInArray!0 k!904))))

(declare-fun b!1089251 () Bool)

(declare-fun e!622147 () Bool)

(declare-fun tp_is_empty!26707 () Bool)

(assert (=> b!1089251 (= e!622147 tp_is_empty!26707)))

(declare-fun b!1089252 () Bool)

(declare-fun res!726566 () Bool)

(assert (=> b!1089252 (=> (not res!726566) (not e!622149))))

(declare-datatypes ((array!70337 0))(
  ( (array!70338 (arr!33842 (Array (_ BitVec 32) (_ BitVec 64))) (size!34378 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70337)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089252 (= res!726566 (= (select (arr!33842 _keys!1070) i!650) k!904))))

(declare-fun b!1089253 () Bool)

(declare-fun res!726558 () Bool)

(assert (=> b!1089253 (=> (not res!726558) (not e!622149))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40737 0))(
  ( (V!40738 (val!13410 Int)) )
))
(declare-datatypes ((ValueCell!12644 0))(
  ( (ValueCellFull!12644 (v!16031 V!40737)) (EmptyCell!12644) )
))
(declare-datatypes ((array!70339 0))(
  ( (array!70340 (arr!33843 (Array (_ BitVec 32) ValueCell!12644)) (size!34379 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70339)

(declare-fun mask!1414 () (_ BitVec 32))

(assert (=> b!1089253 (= res!726558 (and (= (size!34379 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34378 _keys!1070) (size!34379 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41815 () Bool)

(declare-fun mapRes!41815 () Bool)

(declare-fun tp!79964 () Bool)

(declare-fun e!622154 () Bool)

(assert (=> mapNonEmpty!41815 (= mapRes!41815 (and tp!79964 e!622154))))

(declare-fun mapRest!41815 () (Array (_ BitVec 32) ValueCell!12644))

(declare-fun mapValue!41815 () ValueCell!12644)

(declare-fun mapKey!41815 () (_ BitVec 32))

(assert (=> mapNonEmpty!41815 (= (arr!33843 _values!874) (store mapRest!41815 mapKey!41815 mapValue!41815))))

(declare-fun mapIsEmpty!41815 () Bool)

(assert (=> mapIsEmpty!41815 mapRes!41815))

(declare-fun b!1089254 () Bool)

(declare-fun e!622151 () Bool)

(assert (=> b!1089254 (= e!622151 true)))

(declare-datatypes ((tuple2!17034 0))(
  ( (tuple2!17035 (_1!8528 (_ BitVec 64)) (_2!8528 V!40737)) )
))
(declare-datatypes ((List!23622 0))(
  ( (Nil!23619) (Cons!23618 (h!24827 tuple2!17034) (t!33385 List!23622)) )
))
(declare-datatypes ((ListLongMap!15003 0))(
  ( (ListLongMap!15004 (toList!7517 List!23622)) )
))
(declare-fun lt!485519 () ListLongMap!15003)

(declare-fun lt!485521 () ListLongMap!15003)

(declare-fun -!842 (ListLongMap!15003 (_ BitVec 64)) ListLongMap!15003)

(assert (=> b!1089254 (= (-!842 lt!485519 k!904) lt!485521)))

(declare-fun lt!485525 () ListLongMap!15003)

(declare-datatypes ((Unit!35850 0))(
  ( (Unit!35851) )
))
(declare-fun lt!485516 () Unit!35850)

(declare-fun zeroValue!831 () V!40737)

(declare-fun addRemoveCommutativeForDiffKeys!70 (ListLongMap!15003 (_ BitVec 64) V!40737 (_ BitVec 64)) Unit!35850)

(assert (=> b!1089254 (= lt!485516 (addRemoveCommutativeForDiffKeys!70 lt!485525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1089255 () Bool)

(declare-fun e!622153 () Bool)

(assert (=> b!1089255 (= e!622149 e!622153)))

(declare-fun res!726559 () Bool)

(assert (=> b!1089255 (=> (not res!726559) (not e!622153))))

(declare-fun lt!485526 () array!70337)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70337 (_ BitVec 32)) Bool)

(assert (=> b!1089255 (= res!726559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485526 mask!1414))))

(assert (=> b!1089255 (= lt!485526 (array!70338 (store (arr!33842 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34378 _keys!1070)))))

(declare-fun res!726565 () Bool)

(assert (=> start!96052 (=> (not res!726565) (not e!622149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96052 (= res!726565 (validMask!0 mask!1414))))

(assert (=> start!96052 e!622149))

(assert (=> start!96052 tp!79963))

(assert (=> start!96052 true))

(assert (=> start!96052 tp_is_empty!26707))

(declare-fun array_inv!26102 (array!70337) Bool)

(assert (=> start!96052 (array_inv!26102 _keys!1070)))

(declare-fun e!622150 () Bool)

(declare-fun array_inv!26103 (array!70339) Bool)

(assert (=> start!96052 (and (array_inv!26103 _values!874) e!622150)))

(declare-fun b!1089256 () Bool)

(declare-fun res!726561 () Bool)

(assert (=> b!1089256 (=> (not res!726561) (not e!622153))))

(declare-datatypes ((List!23623 0))(
  ( (Nil!23620) (Cons!23619 (h!24828 (_ BitVec 64)) (t!33386 List!23623)) )
))
(declare-fun arrayNoDuplicates!0 (array!70337 (_ BitVec 32) List!23623) Bool)

(assert (=> b!1089256 (= res!726561 (arrayNoDuplicates!0 lt!485526 #b00000000000000000000000000000000 Nil!23620))))

(declare-fun b!1089257 () Bool)

(declare-fun res!726567 () Bool)

(assert (=> b!1089257 (=> (not res!726567) (not e!622149))))

(assert (=> b!1089257 (= res!726567 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23620))))

(declare-fun b!1089258 () Bool)

(declare-fun e!622148 () Bool)

(assert (=> b!1089258 (= e!622153 (not e!622148))))

(declare-fun res!726560 () Bool)

(assert (=> b!1089258 (=> res!726560 e!622148)))

(assert (=> b!1089258 (= res!726560 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!485520 () ListLongMap!15003)

(declare-fun minValue!831 () V!40737)

(declare-fun getCurrentListMap!4289 (array!70337 array!70339 (_ BitVec 32) (_ BitVec 32) V!40737 V!40737 (_ BitVec 32) Int) ListLongMap!15003)

(assert (=> b!1089258 (= lt!485520 (getCurrentListMap!4289 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485517 () array!70339)

(declare-fun lt!485518 () ListLongMap!15003)

(assert (=> b!1089258 (= lt!485518 (getCurrentListMap!4289 lt!485526 lt!485517 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485523 () ListLongMap!15003)

(declare-fun lt!485515 () ListLongMap!15003)

(assert (=> b!1089258 (and (= lt!485523 lt!485515) (= lt!485515 lt!485523))))

(assert (=> b!1089258 (= lt!485515 (-!842 lt!485525 k!904))))

(declare-fun lt!485524 () Unit!35850)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!108 (array!70337 array!70339 (_ BitVec 32) (_ BitVec 32) V!40737 V!40737 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35850)

(assert (=> b!1089258 (= lt!485524 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!108 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4049 (array!70337 array!70339 (_ BitVec 32) (_ BitVec 32) V!40737 V!40737 (_ BitVec 32) Int) ListLongMap!15003)

(assert (=> b!1089258 (= lt!485523 (getCurrentListMapNoExtraKeys!4049 lt!485526 lt!485517 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2186 (Int (_ BitVec 64)) V!40737)

(assert (=> b!1089258 (= lt!485517 (array!70340 (store (arr!33843 _values!874) i!650 (ValueCellFull!12644 (dynLambda!2186 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34379 _values!874)))))

(assert (=> b!1089258 (= lt!485525 (getCurrentListMapNoExtraKeys!4049 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089258 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!485527 () Unit!35850)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70337 (_ BitVec 64) (_ BitVec 32)) Unit!35850)

(assert (=> b!1089258 (= lt!485527 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1089259 () Bool)

(declare-fun res!726562 () Bool)

(assert (=> b!1089259 (=> (not res!726562) (not e!622149))))

(assert (=> b!1089259 (= res!726562 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34378 _keys!1070))))))

(declare-fun b!1089260 () Bool)

(assert (=> b!1089260 (= e!622150 (and e!622147 mapRes!41815))))

(declare-fun condMapEmpty!41815 () Bool)

(declare-fun mapDefault!41815 () ValueCell!12644)

