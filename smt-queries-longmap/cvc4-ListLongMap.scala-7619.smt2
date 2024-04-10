; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96038 () Bool)

(assert start!96038)

(declare-fun b_free!22691 () Bool)

(declare-fun b_next!22691 () Bool)

(assert (=> start!96038 (= b_free!22691 (not b_next!22691))))

(declare-fun tp!79922 () Bool)

(declare-fun b_and!36057 () Bool)

(assert (=> start!96038 (= tp!79922 b_and!36057)))

(declare-fun b!1088942 () Bool)

(declare-fun res!726328 () Bool)

(declare-fun e!621980 () Bool)

(assert (=> b!1088942 (=> (not res!726328) (not e!621980))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088942 (= res!726328 (validKeyInArray!0 k!904))))

(declare-fun b!1088944 () Bool)

(declare-fun res!726331 () Bool)

(assert (=> b!1088944 (=> (not res!726331) (not e!621980))))

(declare-datatypes ((array!70311 0))(
  ( (array!70312 (arr!33829 (Array (_ BitVec 32) (_ BitVec 64))) (size!34365 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70311)

(declare-datatypes ((List!23610 0))(
  ( (Nil!23607) (Cons!23606 (h!24815 (_ BitVec 64)) (t!33359 List!23610)) )
))
(declare-fun arrayNoDuplicates!0 (array!70311 (_ BitVec 32) List!23610) Bool)

(assert (=> b!1088944 (= res!726331 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23607))))

(declare-fun b!1088945 () Bool)

(declare-fun e!621979 () Bool)

(declare-fun e!621983 () Bool)

(assert (=> b!1088945 (= e!621979 (not e!621983))))

(declare-fun res!726332 () Bool)

(assert (=> b!1088945 (=> res!726332 e!621983)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088945 (= res!726332 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!40717 0))(
  ( (V!40718 (val!13403 Int)) )
))
(declare-fun minValue!831 () V!40717)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17022 0))(
  ( (tuple2!17023 (_1!8522 (_ BitVec 64)) (_2!8522 V!40717)) )
))
(declare-datatypes ((List!23611 0))(
  ( (Nil!23608) (Cons!23607 (h!24816 tuple2!17022) (t!33360 List!23611)) )
))
(declare-datatypes ((ListLongMap!14991 0))(
  ( (ListLongMap!14992 (toList!7511 List!23611)) )
))
(declare-fun lt!485247 () ListLongMap!14991)

(declare-fun zeroValue!831 () V!40717)

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((ValueCell!12637 0))(
  ( (ValueCellFull!12637 (v!16024 V!40717)) (EmptyCell!12637) )
))
(declare-datatypes ((array!70313 0))(
  ( (array!70314 (arr!33830 (Array (_ BitVec 32) ValueCell!12637)) (size!34366 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70313)

(declare-fun getCurrentListMap!4284 (array!70311 array!70313 (_ BitVec 32) (_ BitVec 32) V!40717 V!40717 (_ BitVec 32) Int) ListLongMap!14991)

(assert (=> b!1088945 (= lt!485247 (getCurrentListMap!4284 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485246 () array!70311)

(declare-fun lt!485250 () array!70313)

(declare-fun lt!485254 () ListLongMap!14991)

(assert (=> b!1088945 (= lt!485254 (getCurrentListMap!4284 lt!485246 lt!485250 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485253 () ListLongMap!14991)

(declare-fun lt!485242 () ListLongMap!14991)

(assert (=> b!1088945 (and (= lt!485253 lt!485242) (= lt!485242 lt!485253))))

(declare-fun lt!485252 () ListLongMap!14991)

(declare-fun -!836 (ListLongMap!14991 (_ BitVec 64)) ListLongMap!14991)

(assert (=> b!1088945 (= lt!485242 (-!836 lt!485252 k!904))))

(declare-datatypes ((Unit!35838 0))(
  ( (Unit!35839) )
))
(declare-fun lt!485249 () Unit!35838)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!103 (array!70311 array!70313 (_ BitVec 32) (_ BitVec 32) V!40717 V!40717 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35838)

(assert (=> b!1088945 (= lt!485249 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!103 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4044 (array!70311 array!70313 (_ BitVec 32) (_ BitVec 32) V!40717 V!40717 (_ BitVec 32) Int) ListLongMap!14991)

(assert (=> b!1088945 (= lt!485253 (getCurrentListMapNoExtraKeys!4044 lt!485246 lt!485250 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2181 (Int (_ BitVec 64)) V!40717)

(assert (=> b!1088945 (= lt!485250 (array!70314 (store (arr!33830 _values!874) i!650 (ValueCellFull!12637 (dynLambda!2181 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34366 _values!874)))))

(assert (=> b!1088945 (= lt!485252 (getCurrentListMapNoExtraKeys!4044 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088945 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!485251 () Unit!35838)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70311 (_ BitVec 64) (_ BitVec 32)) Unit!35838)

(assert (=> b!1088945 (= lt!485251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1088946 () Bool)

(declare-fun e!621985 () Bool)

(assert (=> b!1088946 (= e!621985 true)))

(declare-fun lt!485248 () ListLongMap!14991)

(declare-fun lt!485245 () ListLongMap!14991)

(assert (=> b!1088946 (= (-!836 lt!485248 k!904) lt!485245)))

(declare-fun lt!485244 () Unit!35838)

(declare-fun addRemoveCommutativeForDiffKeys!64 (ListLongMap!14991 (_ BitVec 64) V!40717 (_ BitVec 64)) Unit!35838)

(assert (=> b!1088946 (= lt!485244 (addRemoveCommutativeForDiffKeys!64 lt!485252 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1088947 () Bool)

(declare-fun e!621986 () Bool)

(declare-fun tp_is_empty!26693 () Bool)

(assert (=> b!1088947 (= e!621986 tp_is_empty!26693)))

(declare-fun b!1088948 () Bool)

(declare-fun e!621981 () Bool)

(assert (=> b!1088948 (= e!621981 tp_is_empty!26693)))

(declare-fun b!1088949 () Bool)

(assert (=> b!1088949 (= e!621983 e!621985)))

(declare-fun res!726330 () Bool)

(assert (=> b!1088949 (=> res!726330 e!621985)))

(assert (=> b!1088949 (= res!726330 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(assert (=> b!1088949 (= lt!485254 lt!485245)))

(declare-fun lt!485243 () tuple2!17022)

(declare-fun +!3309 (ListLongMap!14991 tuple2!17022) ListLongMap!14991)

(assert (=> b!1088949 (= lt!485245 (+!3309 lt!485242 lt!485243))))

(assert (=> b!1088949 (= lt!485247 lt!485248)))

(assert (=> b!1088949 (= lt!485248 (+!3309 lt!485252 lt!485243))))

(assert (=> b!1088949 (= lt!485254 (+!3309 lt!485253 lt!485243))))

(assert (=> b!1088949 (= lt!485243 (tuple2!17023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088950 () Bool)

(declare-fun e!621984 () Bool)

(declare-fun mapRes!41794 () Bool)

(assert (=> b!1088950 (= e!621984 (and e!621986 mapRes!41794))))

(declare-fun condMapEmpty!41794 () Bool)

(declare-fun mapDefault!41794 () ValueCell!12637)

