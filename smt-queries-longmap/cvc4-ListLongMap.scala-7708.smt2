; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96834 () Bool)

(assert start!96834)

(declare-fun b_free!23177 () Bool)

(declare-fun b_next!23177 () Bool)

(assert (=> start!96834 (= b_free!23177 (not b_next!23177))))

(declare-fun tp!81485 () Bool)

(declare-fun b_and!37143 () Bool)

(assert (=> start!96834 (= tp!81485 b_and!37143)))

(declare-datatypes ((V!41429 0))(
  ( (V!41430 (val!13670 Int)) )
))
(declare-datatypes ((tuple2!17384 0))(
  ( (tuple2!17385 (_1!8703 (_ BitVec 64)) (_2!8703 V!41429)) )
))
(declare-fun lt!493899 () tuple2!17384)

(declare-datatypes ((List!23999 0))(
  ( (Nil!23996) (Cons!23995 (h!25204 tuple2!17384) (t!34222 List!23999)) )
))
(declare-datatypes ((ListLongMap!15353 0))(
  ( (ListLongMap!15354 (toList!7692 List!23999)) )
))
(declare-fun lt!493908 () ListLongMap!15353)

(declare-fun e!628745 () Bool)

(declare-fun lt!493903 () ListLongMap!15353)

(declare-fun b!1101562 () Bool)

(declare-fun +!3397 (ListLongMap!15353 tuple2!17384) ListLongMap!15353)

(assert (=> b!1101562 (= e!628745 (= lt!493908 (+!3397 lt!493903 lt!493899)))))

(declare-fun b!1101563 () Bool)

(declare-fun e!628744 () Bool)

(declare-fun e!628743 () Bool)

(assert (=> b!1101563 (= e!628744 e!628743)))

(declare-fun res!735036 () Bool)

(assert (=> b!1101563 (=> (not res!735036) (not e!628743))))

(declare-datatypes ((array!71375 0))(
  ( (array!71376 (arr!34350 (Array (_ BitVec 32) (_ BitVec 64))) (size!34886 (_ BitVec 32))) )
))
(declare-fun lt!493905 () array!71375)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71375 (_ BitVec 32)) Bool)

(assert (=> b!1101563 (= res!735036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493905 mask!1414))))

(declare-fun _keys!1070 () array!71375)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1101563 (= lt!493905 (array!71376 (store (arr!34350 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34886 _keys!1070)))))

(declare-fun b!1101564 () Bool)

(declare-fun res!735034 () Bool)

(assert (=> b!1101564 (=> (not res!735034) (not e!628745))))

(declare-fun lt!493906 () ListLongMap!15353)

(declare-fun lt!493904 () ListLongMap!15353)

(assert (=> b!1101564 (= res!735034 (= lt!493906 (+!3397 lt!493904 lt!493899)))))

(declare-fun b!1101565 () Bool)

(declare-fun e!628742 () Bool)

(assert (=> b!1101565 (= e!628743 (not e!628742))))

(declare-fun res!735038 () Bool)

(assert (=> b!1101565 (=> res!735038 e!628742)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101565 (= res!735038 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41429)

(declare-fun zeroValue!831 () V!41429)

(declare-datatypes ((ValueCell!12904 0))(
  ( (ValueCellFull!12904 (v!16300 V!41429)) (EmptyCell!12904) )
))
(declare-datatypes ((array!71377 0))(
  ( (array!71378 (arr!34351 (Array (_ BitVec 32) ValueCell!12904)) (size!34887 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71377)

(declare-fun getCurrentListMap!4397 (array!71375 array!71377 (_ BitVec 32) (_ BitVec 32) V!41429 V!41429 (_ BitVec 32) Int) ListLongMap!15353)

(assert (=> b!1101565 (= lt!493908 (getCurrentListMap!4397 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493900 () array!71377)

(assert (=> b!1101565 (= lt!493906 (getCurrentListMap!4397 lt!493905 lt!493900 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493907 () ListLongMap!15353)

(assert (=> b!1101565 (and (= lt!493907 lt!493904) (= lt!493904 lt!493907))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!975 (ListLongMap!15353 (_ BitVec 64)) ListLongMap!15353)

(assert (=> b!1101565 (= lt!493904 (-!975 lt!493903 k!904))))

(declare-datatypes ((Unit!36200 0))(
  ( (Unit!36201) )
))
(declare-fun lt!493902 () Unit!36200)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!223 (array!71375 array!71377 (_ BitVec 32) (_ BitVec 32) V!41429 V!41429 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36200)

(assert (=> b!1101565 (= lt!493902 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!223 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4193 (array!71375 array!71377 (_ BitVec 32) (_ BitVec 32) V!41429 V!41429 (_ BitVec 32) Int) ListLongMap!15353)

(assert (=> b!1101565 (= lt!493907 (getCurrentListMapNoExtraKeys!4193 lt!493905 lt!493900 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2328 (Int (_ BitVec 64)) V!41429)

(assert (=> b!1101565 (= lt!493900 (array!71378 (store (arr!34351 _values!874) i!650 (ValueCellFull!12904 (dynLambda!2328 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34887 _values!874)))))

(assert (=> b!1101565 (= lt!493903 (getCurrentListMapNoExtraKeys!4193 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101565 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!493901 () Unit!36200)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71375 (_ BitVec 64) (_ BitVec 32)) Unit!36200)

(assert (=> b!1101565 (= lt!493901 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1101566 () Bool)

(declare-fun res!735037 () Bool)

(assert (=> b!1101566 (=> (not res!735037) (not e!628744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101566 (= res!735037 (validKeyInArray!0 k!904))))

(declare-fun b!1101567 () Bool)

(declare-fun e!628741 () Bool)

(declare-fun tp_is_empty!27227 () Bool)

(assert (=> b!1101567 (= e!628741 tp_is_empty!27227)))

(declare-fun mapIsEmpty!42628 () Bool)

(declare-fun mapRes!42628 () Bool)

(assert (=> mapIsEmpty!42628 mapRes!42628))

(declare-fun mapNonEmpty!42628 () Bool)

(declare-fun tp!81484 () Bool)

(assert (=> mapNonEmpty!42628 (= mapRes!42628 (and tp!81484 e!628741))))

(declare-fun mapValue!42628 () ValueCell!12904)

(declare-fun mapKey!42628 () (_ BitVec 32))

(declare-fun mapRest!42628 () (Array (_ BitVec 32) ValueCell!12904))

(assert (=> mapNonEmpty!42628 (= (arr!34351 _values!874) (store mapRest!42628 mapKey!42628 mapValue!42628))))

(declare-fun b!1101568 () Bool)

(declare-fun res!735039 () Bool)

(assert (=> b!1101568 (=> (not res!735039) (not e!628743))))

(declare-datatypes ((List!24000 0))(
  ( (Nil!23997) (Cons!23996 (h!25205 (_ BitVec 64)) (t!34223 List!24000)) )
))
(declare-fun arrayNoDuplicates!0 (array!71375 (_ BitVec 32) List!24000) Bool)

(assert (=> b!1101568 (= res!735039 (arrayNoDuplicates!0 lt!493905 #b00000000000000000000000000000000 Nil!23997))))

(declare-fun res!735042 () Bool)

(assert (=> start!96834 (=> (not res!735042) (not e!628744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96834 (= res!735042 (validMask!0 mask!1414))))

(assert (=> start!96834 e!628744))

(assert (=> start!96834 tp!81485))

(assert (=> start!96834 true))

(assert (=> start!96834 tp_is_empty!27227))

(declare-fun array_inv!26456 (array!71375) Bool)

(assert (=> start!96834 (array_inv!26456 _keys!1070)))

(declare-fun e!628747 () Bool)

(declare-fun array_inv!26457 (array!71377) Bool)

(assert (=> start!96834 (and (array_inv!26457 _values!874) e!628747)))

(declare-fun b!1101569 () Bool)

(declare-fun e!628746 () Bool)

(assert (=> b!1101569 (= e!628746 tp_is_empty!27227)))

(declare-fun b!1101570 () Bool)

(assert (=> b!1101570 (= e!628747 (and e!628746 mapRes!42628))))

(declare-fun condMapEmpty!42628 () Bool)

(declare-fun mapDefault!42628 () ValueCell!12904)

