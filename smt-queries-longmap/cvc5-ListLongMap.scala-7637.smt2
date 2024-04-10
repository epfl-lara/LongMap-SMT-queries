; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96142 () Bool)

(assert start!96142)

(declare-fun b_free!22795 () Bool)

(declare-fun b_next!22795 () Bool)

(assert (=> start!96142 (= b_free!22795 (not b_next!22795))))

(declare-fun tp!80234 () Bool)

(declare-fun b_and!36265 () Bool)

(assert (=> start!96142 (= tp!80234 b_and!36265)))

(declare-fun b!1091239 () Bool)

(declare-fun res!728053 () Bool)

(declare-fun e!623232 () Bool)

(assert (=> b!1091239 (=> (not res!728053) (not e!623232))))

(declare-datatypes ((array!70513 0))(
  ( (array!70514 (arr!33930 (Array (_ BitVec 32) (_ BitVec 64))) (size!34466 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70513)

(declare-datatypes ((List!23696 0))(
  ( (Nil!23693) (Cons!23692 (h!24901 (_ BitVec 64)) (t!33549 List!23696)) )
))
(declare-fun arrayNoDuplicates!0 (array!70513 (_ BitVec 32) List!23696) Bool)

(assert (=> b!1091239 (= res!728053 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23693))))

(declare-fun mapNonEmpty!41950 () Bool)

(declare-fun mapRes!41950 () Bool)

(declare-fun tp!80233 () Bool)

(declare-fun e!623234 () Bool)

(assert (=> mapNonEmpty!41950 (= mapRes!41950 (and tp!80233 e!623234))))

(declare-datatypes ((V!40857 0))(
  ( (V!40858 (val!13455 Int)) )
))
(declare-datatypes ((ValueCell!12689 0))(
  ( (ValueCellFull!12689 (v!16076 V!40857)) (EmptyCell!12689) )
))
(declare-fun mapRest!41950 () (Array (_ BitVec 32) ValueCell!12689))

(declare-datatypes ((array!70515 0))(
  ( (array!70516 (arr!33931 (Array (_ BitVec 32) ValueCell!12689)) (size!34467 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70515)

(declare-fun mapValue!41950 () ValueCell!12689)

(declare-fun mapKey!41950 () (_ BitVec 32))

(assert (=> mapNonEmpty!41950 (= (arr!33931 _values!874) (store mapRest!41950 mapKey!41950 mapValue!41950))))

(declare-fun b!1091240 () Bool)

(declare-fun tp_is_empty!26797 () Bool)

(assert (=> b!1091240 (= e!623234 tp_is_empty!26797)))

(declare-fun b!1091241 () Bool)

(declare-fun e!623228 () Bool)

(declare-fun e!623233 () Bool)

(assert (=> b!1091241 (= e!623228 e!623233)))

(declare-fun res!728061 () Bool)

(assert (=> b!1091241 (=> res!728061 e!623233)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1091241 (= res!728061 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!17112 0))(
  ( (tuple2!17113 (_1!8567 (_ BitVec 64)) (_2!8567 V!40857)) )
))
(declare-datatypes ((List!23697 0))(
  ( (Nil!23694) (Cons!23693 (h!24902 tuple2!17112) (t!33550 List!23697)) )
))
(declare-datatypes ((ListLongMap!15081 0))(
  ( (ListLongMap!15082 (toList!7556 List!23697)) )
))
(declare-fun lt!487254 () ListLongMap!15081)

(declare-fun lt!487244 () ListLongMap!15081)

(assert (=> b!1091241 (= lt!487254 lt!487244)))

(declare-fun lt!487243 () ListLongMap!15081)

(declare-fun lt!487245 () tuple2!17112)

(declare-fun +!3341 (ListLongMap!15081 tuple2!17112) ListLongMap!15081)

(assert (=> b!1091241 (= lt!487244 (+!3341 lt!487243 lt!487245))))

(declare-fun lt!487248 () ListLongMap!15081)

(declare-fun lt!487247 () ListLongMap!15081)

(assert (=> b!1091241 (= lt!487248 lt!487247)))

(declare-fun lt!487250 () ListLongMap!15081)

(assert (=> b!1091241 (= lt!487247 (+!3341 lt!487250 lt!487245))))

(declare-fun lt!487253 () ListLongMap!15081)

(assert (=> b!1091241 (= lt!487248 (+!3341 lt!487253 lt!487245))))

(declare-fun minValue!831 () V!40857)

(assert (=> b!1091241 (= lt!487245 (tuple2!17113 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091242 () Bool)

(declare-fun e!623231 () Bool)

(assert (=> b!1091242 (= e!623231 (not e!623228))))

(declare-fun res!728051 () Bool)

(assert (=> b!1091242 (=> res!728051 e!623228)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091242 (= res!728051 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40857)

(declare-fun getCurrentListMap!4317 (array!70513 array!70515 (_ BitVec 32) (_ BitVec 32) V!40857 V!40857 (_ BitVec 32) Int) ListLongMap!15081)

(assert (=> b!1091242 (= lt!487254 (getCurrentListMap!4317 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487251 () array!70515)

(declare-fun lt!487246 () array!70513)

(assert (=> b!1091242 (= lt!487248 (getCurrentListMap!4317 lt!487246 lt!487251 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1091242 (and (= lt!487253 lt!487250) (= lt!487250 lt!487253))))

(declare-fun -!877 (ListLongMap!15081 (_ BitVec 64)) ListLongMap!15081)

(assert (=> b!1091242 (= lt!487250 (-!877 lt!487243 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35920 0))(
  ( (Unit!35921) )
))
(declare-fun lt!487255 () Unit!35920)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!136 (array!70513 array!70515 (_ BitVec 32) (_ BitVec 32) V!40857 V!40857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35920)

(assert (=> b!1091242 (= lt!487255 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!136 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4077 (array!70513 array!70515 (_ BitVec 32) (_ BitVec 32) V!40857 V!40857 (_ BitVec 32) Int) ListLongMap!15081)

(assert (=> b!1091242 (= lt!487253 (getCurrentListMapNoExtraKeys!4077 lt!487246 lt!487251 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2214 (Int (_ BitVec 64)) V!40857)

(assert (=> b!1091242 (= lt!487251 (array!70516 (store (arr!33931 _values!874) i!650 (ValueCellFull!12689 (dynLambda!2214 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34467 _values!874)))))

(assert (=> b!1091242 (= lt!487243 (getCurrentListMapNoExtraKeys!4077 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091242 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!487252 () Unit!35920)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70513 (_ BitVec 64) (_ BitVec 32)) Unit!35920)

(assert (=> b!1091242 (= lt!487252 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1091243 () Bool)

(declare-fun res!728057 () Bool)

(assert (=> b!1091243 (=> (not res!728057) (not e!623232))))

(assert (=> b!1091243 (= res!728057 (= (select (arr!33930 _keys!1070) i!650) k!904))))

(declare-fun res!728052 () Bool)

(assert (=> start!96142 (=> (not res!728052) (not e!623232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96142 (= res!728052 (validMask!0 mask!1414))))

(assert (=> start!96142 e!623232))

(assert (=> start!96142 tp!80234))

(assert (=> start!96142 true))

(assert (=> start!96142 tp_is_empty!26797))

(declare-fun array_inv!26162 (array!70513) Bool)

(assert (=> start!96142 (array_inv!26162 _keys!1070)))

(declare-fun e!623230 () Bool)

(declare-fun array_inv!26163 (array!70515) Bool)

(assert (=> start!96142 (and (array_inv!26163 _values!874) e!623230)))

(declare-fun b!1091244 () Bool)

(declare-fun res!728059 () Bool)

(assert (=> b!1091244 (=> (not res!728059) (not e!623232))))

(assert (=> b!1091244 (= res!728059 (and (= (size!34467 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34466 _keys!1070) (size!34467 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091245 () Bool)

(declare-fun res!728055 () Bool)

(assert (=> b!1091245 (=> (not res!728055) (not e!623232))))

(assert (=> b!1091245 (= res!728055 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34466 _keys!1070))))))

(declare-fun mapIsEmpty!41950 () Bool)

(assert (=> mapIsEmpty!41950 mapRes!41950))

(declare-fun b!1091246 () Bool)

(declare-fun e!623227 () Bool)

(assert (=> b!1091246 (= e!623230 (and e!623227 mapRes!41950))))

(declare-fun condMapEmpty!41950 () Bool)

(declare-fun mapDefault!41950 () ValueCell!12689)

