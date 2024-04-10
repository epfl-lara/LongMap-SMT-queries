; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96134 () Bool)

(assert start!96134)

(declare-fun b_free!22787 () Bool)

(declare-fun b_next!22787 () Bool)

(assert (=> start!96134 (= b_free!22787 (not b_next!22787))))

(declare-fun tp!80210 () Bool)

(declare-fun b_and!36249 () Bool)

(assert (=> start!96134 (= tp!80210 b_and!36249)))

(declare-fun b!1091063 () Bool)

(declare-fun e!623134 () Bool)

(declare-fun e!623136 () Bool)

(assert (=> b!1091063 (= e!623134 (not e!623136))))

(declare-fun res!727926 () Bool)

(assert (=> b!1091063 (=> res!727926 e!623136)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091063 (= res!727926 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40845 0))(
  ( (V!40846 (val!13451 Int)) )
))
(declare-datatypes ((tuple2!17104 0))(
  ( (tuple2!17105 (_1!8563 (_ BitVec 64)) (_2!8563 V!40845)) )
))
(declare-datatypes ((List!23690 0))(
  ( (Nil!23687) (Cons!23686 (h!24895 tuple2!17104) (t!33535 List!23690)) )
))
(declare-datatypes ((ListLongMap!15073 0))(
  ( (ListLongMap!15074 (toList!7552 List!23690)) )
))
(declare-fun lt!487089 () ListLongMap!15073)

(declare-fun minValue!831 () V!40845)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40845)

(declare-datatypes ((array!70497 0))(
  ( (array!70498 (arr!33922 (Array (_ BitVec 32) (_ BitVec 64))) (size!34458 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70497)

(declare-datatypes ((ValueCell!12685 0))(
  ( (ValueCellFull!12685 (v!16072 V!40845)) (EmptyCell!12685) )
))
(declare-datatypes ((array!70499 0))(
  ( (array!70500 (arr!33923 (Array (_ BitVec 32) ValueCell!12685)) (size!34459 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70499)

(declare-fun getCurrentListMap!4315 (array!70497 array!70499 (_ BitVec 32) (_ BitVec 32) V!40845 V!40845 (_ BitVec 32) Int) ListLongMap!15073)

(assert (=> b!1091063 (= lt!487089 (getCurrentListMap!4315 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487096 () array!70497)

(declare-fun lt!487090 () ListLongMap!15073)

(declare-fun lt!487092 () array!70499)

(assert (=> b!1091063 (= lt!487090 (getCurrentListMap!4315 lt!487096 lt!487092 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487091 () ListLongMap!15073)

(declare-fun lt!487097 () ListLongMap!15073)

(assert (=> b!1091063 (and (= lt!487091 lt!487097) (= lt!487097 lt!487091))))

(declare-fun lt!487088 () ListLongMap!15073)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!874 (ListLongMap!15073 (_ BitVec 64)) ListLongMap!15073)

(assert (=> b!1091063 (= lt!487097 (-!874 lt!487088 k!904))))

(declare-datatypes ((Unit!35914 0))(
  ( (Unit!35915) )
))
(declare-fun lt!487094 () Unit!35914)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!134 (array!70497 array!70499 (_ BitVec 32) (_ BitVec 32) V!40845 V!40845 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35914)

(assert (=> b!1091063 (= lt!487094 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!134 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4075 (array!70497 array!70499 (_ BitVec 32) (_ BitVec 32) V!40845 V!40845 (_ BitVec 32) Int) ListLongMap!15073)

(assert (=> b!1091063 (= lt!487091 (getCurrentListMapNoExtraKeys!4075 lt!487096 lt!487092 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2212 (Int (_ BitVec 64)) V!40845)

(assert (=> b!1091063 (= lt!487092 (array!70500 (store (arr!33923 _values!874) i!650 (ValueCellFull!12685 (dynLambda!2212 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34459 _values!874)))))

(assert (=> b!1091063 (= lt!487088 (getCurrentListMapNoExtraKeys!4075 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091063 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!487093 () Unit!35914)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70497 (_ BitVec 64) (_ BitVec 32)) Unit!35914)

(assert (=> b!1091063 (= lt!487093 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1091064 () Bool)

(declare-fun e!623137 () Bool)

(declare-fun tp_is_empty!26789 () Bool)

(assert (=> b!1091064 (= e!623137 tp_is_empty!26789)))

(declare-fun b!1091065 () Bool)

(declare-fun e!623138 () Bool)

(declare-fun mapRes!41938 () Bool)

(assert (=> b!1091065 (= e!623138 (and e!623137 mapRes!41938))))

(declare-fun condMapEmpty!41938 () Bool)

(declare-fun mapDefault!41938 () ValueCell!12685)

