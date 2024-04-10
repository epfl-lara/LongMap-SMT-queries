; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95966 () Bool)

(assert start!95966)

(declare-fun b_free!22619 () Bool)

(declare-fun b_next!22619 () Bool)

(assert (=> start!95966 (= b_free!22619 (not b_next!22619))))

(declare-fun tp!79706 () Bool)

(declare-fun b_and!35913 () Bool)

(assert (=> start!95966 (= tp!79706 b_and!35913)))

(declare-fun b!1087357 () Bool)

(declare-fun res!725145 () Bool)

(declare-fun e!621119 () Bool)

(assert (=> b!1087357 (=> (not res!725145) (not e!621119))))

(declare-datatypes ((array!70169 0))(
  ( (array!70170 (arr!33758 (Array (_ BitVec 32) (_ BitVec 64))) (size!34294 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70169)

(declare-datatypes ((List!23549 0))(
  ( (Nil!23546) (Cons!23545 (h!24754 (_ BitVec 64)) (t!33226 List!23549)) )
))
(declare-fun arrayNoDuplicates!0 (array!70169 (_ BitVec 32) List!23549) Bool)

(assert (=> b!1087357 (= res!725145 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23546))))

(declare-fun b!1087358 () Bool)

(declare-fun e!621117 () Bool)

(assert (=> b!1087358 (= e!621117 true)))

(declare-fun e!621118 () Bool)

(assert (=> b!1087358 e!621118))

(declare-fun res!725141 () Bool)

(assert (=> b!1087358 (=> (not res!725141) (not e!621118))))

(declare-datatypes ((V!40621 0))(
  ( (V!40622 (val!13367 Int)) )
))
(declare-datatypes ((tuple2!16962 0))(
  ( (tuple2!16963 (_1!8492 (_ BitVec 64)) (_2!8492 V!40621)) )
))
(declare-datatypes ((List!23550 0))(
  ( (Nil!23547) (Cons!23546 (h!24755 tuple2!16962) (t!33227 List!23550)) )
))
(declare-datatypes ((ListLongMap!14931 0))(
  ( (ListLongMap!14932 (toList!7481 List!23550)) )
))
(declare-fun lt!483845 () ListLongMap!14931)

(declare-fun lt!483849 () tuple2!16962)

(declare-fun lt!483842 () ListLongMap!14931)

(declare-fun +!3286 (ListLongMap!14931 tuple2!16962) ListLongMap!14931)

(assert (=> b!1087358 (= res!725141 (= lt!483845 (+!3286 lt!483842 lt!483849)))))

(declare-fun zeroValue!831 () V!40621)

(assert (=> b!1087358 (= lt!483849 (tuple2!16963 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapIsEmpty!41686 () Bool)

(declare-fun mapRes!41686 () Bool)

(assert (=> mapIsEmpty!41686 mapRes!41686))

(declare-fun lt!483843 () ListLongMap!14931)

(declare-fun b!1087359 () Bool)

(assert (=> b!1087359 (= e!621118 (= lt!483845 (+!3286 lt!483843 lt!483849)))))

(declare-fun b!1087360 () Bool)

(declare-fun res!725146 () Bool)

(assert (=> b!1087360 (=> (not res!725146) (not e!621119))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087360 (= res!725146 (validKeyInArray!0 k!904))))

(declare-fun res!725143 () Bool)

(assert (=> start!95966 (=> (not res!725143) (not e!621119))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95966 (= res!725143 (validMask!0 mask!1414))))

(assert (=> start!95966 e!621119))

(assert (=> start!95966 tp!79706))

(assert (=> start!95966 true))

(declare-fun tp_is_empty!26621 () Bool)

(assert (=> start!95966 tp_is_empty!26621))

(declare-fun array_inv!26042 (array!70169) Bool)

(assert (=> start!95966 (array_inv!26042 _keys!1070)))

(declare-datatypes ((ValueCell!12601 0))(
  ( (ValueCellFull!12601 (v!15988 V!40621)) (EmptyCell!12601) )
))
(declare-datatypes ((array!70171 0))(
  ( (array!70172 (arr!33759 (Array (_ BitVec 32) ValueCell!12601)) (size!34295 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70171)

(declare-fun e!621122 () Bool)

(declare-fun array_inv!26043 (array!70171) Bool)

(assert (=> start!95966 (and (array_inv!26043 _values!874) e!621122)))

(declare-fun b!1087361 () Bool)

(declare-fun e!621116 () Bool)

(assert (=> b!1087361 (= e!621116 (not e!621117))))

(declare-fun res!725138 () Bool)

(assert (=> b!1087361 (=> res!725138 e!621117)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087361 (= res!725138 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40621)

(declare-fun lt!483846 () ListLongMap!14931)

(declare-fun getCurrentListMap!4257 (array!70169 array!70171 (_ BitVec 32) (_ BitVec 32) V!40621 V!40621 (_ BitVec 32) Int) ListLongMap!14931)

(assert (=> b!1087361 (= lt!483846 (getCurrentListMap!4257 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483841 () array!70171)

(declare-fun lt!483847 () array!70169)

(assert (=> b!1087361 (= lt!483845 (getCurrentListMap!4257 lt!483847 lt!483841 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1087361 (and (= lt!483842 lt!483843) (= lt!483843 lt!483842))))

(declare-fun lt!483850 () ListLongMap!14931)

(declare-fun -!807 (ListLongMap!14931 (_ BitVec 64)) ListLongMap!14931)

(assert (=> b!1087361 (= lt!483843 (-!807 lt!483850 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35780 0))(
  ( (Unit!35781) )
))
(declare-fun lt!483848 () Unit!35780)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!76 (array!70169 array!70171 (_ BitVec 32) (_ BitVec 32) V!40621 V!40621 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35780)

(assert (=> b!1087361 (= lt!483848 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!76 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4017 (array!70169 array!70171 (_ BitVec 32) (_ BitVec 32) V!40621 V!40621 (_ BitVec 32) Int) ListLongMap!14931)

(assert (=> b!1087361 (= lt!483842 (getCurrentListMapNoExtraKeys!4017 lt!483847 lt!483841 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2154 (Int (_ BitVec 64)) V!40621)

(assert (=> b!1087361 (= lt!483841 (array!70172 (store (arr!33759 _values!874) i!650 (ValueCellFull!12601 (dynLambda!2154 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34295 _values!874)))))

(assert (=> b!1087361 (= lt!483850 (getCurrentListMapNoExtraKeys!4017 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087361 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!483844 () Unit!35780)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70169 (_ BitVec 64) (_ BitVec 32)) Unit!35780)

(assert (=> b!1087361 (= lt!483844 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1087362 () Bool)

(assert (=> b!1087362 (= e!621119 e!621116)))

(declare-fun res!725139 () Bool)

(assert (=> b!1087362 (=> (not res!725139) (not e!621116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70169 (_ BitVec 32)) Bool)

(assert (=> b!1087362 (= res!725139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483847 mask!1414))))

(assert (=> b!1087362 (= lt!483847 (array!70170 (store (arr!33758 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34294 _keys!1070)))))

(declare-fun b!1087363 () Bool)

(declare-fun e!621115 () Bool)

(assert (=> b!1087363 (= e!621115 tp_is_empty!26621)))

(declare-fun b!1087364 () Bool)

(declare-fun res!725147 () Bool)

(assert (=> b!1087364 (=> (not res!725147) (not e!621118))))

(assert (=> b!1087364 (= res!725147 (= lt!483846 (+!3286 lt!483850 lt!483849)))))

(declare-fun b!1087365 () Bool)

(declare-fun e!621120 () Bool)

(assert (=> b!1087365 (= e!621122 (and e!621120 mapRes!41686))))

(declare-fun condMapEmpty!41686 () Bool)

(declare-fun mapDefault!41686 () ValueCell!12601)

