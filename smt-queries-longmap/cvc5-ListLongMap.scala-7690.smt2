; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96486 () Bool)

(assert start!96486)

(declare-fun b_free!23065 () Bool)

(declare-fun b_next!23065 () Bool)

(assert (=> start!96486 (= b_free!23065 (not b_next!23065))))

(declare-fun tp!81121 () Bool)

(declare-fun b_and!36793 () Bool)

(assert (=> start!96486 (= tp!81121 b_and!36793)))

(declare-fun b!1097322 () Bool)

(declare-fun e!626284 () Bool)

(declare-fun e!626283 () Bool)

(assert (=> b!1097322 (= e!626284 e!626283)))

(declare-fun res!732398 () Bool)

(assert (=> b!1097322 (=> (not res!732398) (not e!626283))))

(declare-datatypes ((array!71141 0))(
  ( (array!71142 (arr!34242 (Array (_ BitVec 32) (_ BitVec 64))) (size!34778 (_ BitVec 32))) )
))
(declare-fun lt!490498 () array!71141)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71141 (_ BitVec 32)) Bool)

(assert (=> b!1097322 (= res!732398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490498 mask!1414))))

(declare-fun _keys!1070 () array!71141)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097322 (= lt!490498 (array!71142 (store (arr!34242 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34778 _keys!1070)))))

(declare-fun b!1097323 () Bool)

(declare-fun res!732397 () Bool)

(assert (=> b!1097323 (=> (not res!732397) (not e!626284))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41281 0))(
  ( (V!41282 (val!13614 Int)) )
))
(declare-datatypes ((ValueCell!12848 0))(
  ( (ValueCellFull!12848 (v!16235 V!41281)) (EmptyCell!12848) )
))
(declare-datatypes ((array!71143 0))(
  ( (array!71144 (arr!34243 (Array (_ BitVec 32) ValueCell!12848)) (size!34779 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71143)

(assert (=> b!1097323 (= res!732397 (and (= (size!34779 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34778 _keys!1070) (size!34779 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097324 () Bool)

(declare-fun res!732404 () Bool)

(assert (=> b!1097324 (=> (not res!732404) (not e!626284))))

(assert (=> b!1097324 (= res!732404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1097325 () Bool)

(declare-fun e!626280 () Bool)

(declare-fun tp_is_empty!27115 () Bool)

(assert (=> b!1097325 (= e!626280 tp_is_empty!27115)))

(declare-fun b!1097326 () Bool)

(declare-fun res!732399 () Bool)

(assert (=> b!1097326 (=> (not res!732399) (not e!626284))))

(declare-datatypes ((List!23912 0))(
  ( (Nil!23909) (Cons!23908 (h!25117 (_ BitVec 64)) (t!34023 List!23912)) )
))
(declare-fun arrayNoDuplicates!0 (array!71141 (_ BitVec 32) List!23912) Bool)

(assert (=> b!1097326 (= res!732399 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23909))))

(declare-fun mapNonEmpty!42433 () Bool)

(declare-fun mapRes!42433 () Bool)

(declare-fun tp!81122 () Bool)

(declare-fun e!626282 () Bool)

(assert (=> mapNonEmpty!42433 (= mapRes!42433 (and tp!81122 e!626282))))

(declare-fun mapKey!42433 () (_ BitVec 32))

(declare-fun mapValue!42433 () ValueCell!12848)

(declare-fun mapRest!42433 () (Array (_ BitVec 32) ValueCell!12848))

(assert (=> mapNonEmpty!42433 (= (arr!34243 _values!874) (store mapRest!42433 mapKey!42433 mapValue!42433))))

(declare-fun mapIsEmpty!42433 () Bool)

(assert (=> mapIsEmpty!42433 mapRes!42433))

(declare-fun b!1097327 () Bool)

(declare-fun res!732402 () Bool)

(assert (=> b!1097327 (=> (not res!732402) (not e!626284))))

(assert (=> b!1097327 (= res!732402 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34778 _keys!1070))))))

(declare-fun b!1097329 () Bool)

(declare-fun e!626281 () Bool)

(assert (=> b!1097329 (= e!626283 (not e!626281))))

(declare-fun res!732405 () Bool)

(assert (=> b!1097329 (=> res!732405 e!626281)))

(assert (=> b!1097329 (= res!732405 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41281)

(declare-datatypes ((tuple2!17290 0))(
  ( (tuple2!17291 (_1!8656 (_ BitVec 64)) (_2!8656 V!41281)) )
))
(declare-datatypes ((List!23913 0))(
  ( (Nil!23910) (Cons!23909 (h!25118 tuple2!17290) (t!34024 List!23913)) )
))
(declare-datatypes ((ListLongMap!15259 0))(
  ( (ListLongMap!15260 (toList!7645 List!23913)) )
))
(declare-fun lt!490491 () ListLongMap!15259)

(declare-fun zeroValue!831 () V!41281)

(declare-fun getCurrentListMap!4365 (array!71141 array!71143 (_ BitVec 32) (_ BitVec 32) V!41281 V!41281 (_ BitVec 32) Int) ListLongMap!15259)

(assert (=> b!1097329 (= lt!490491 (getCurrentListMap!4365 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490490 () ListLongMap!15259)

(declare-fun lt!490497 () array!71143)

(assert (=> b!1097329 (= lt!490490 (getCurrentListMap!4365 lt!490498 lt!490497 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490492 () ListLongMap!15259)

(declare-fun lt!490496 () ListLongMap!15259)

(assert (=> b!1097329 (and (= lt!490492 lt!490496) (= lt!490496 lt!490492))))

(declare-fun lt!490495 () ListLongMap!15259)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!935 (ListLongMap!15259 (_ BitVec 64)) ListLongMap!15259)

(assert (=> b!1097329 (= lt!490496 (-!935 lt!490495 k!904))))

(declare-datatypes ((Unit!36102 0))(
  ( (Unit!36103) )
))
(declare-fun lt!490494 () Unit!36102)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!191 (array!71141 array!71143 (_ BitVec 32) (_ BitVec 32) V!41281 V!41281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36102)

(assert (=> b!1097329 (= lt!490494 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!191 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4161 (array!71141 array!71143 (_ BitVec 32) (_ BitVec 32) V!41281 V!41281 (_ BitVec 32) Int) ListLongMap!15259)

(assert (=> b!1097329 (= lt!490492 (getCurrentListMapNoExtraKeys!4161 lt!490498 lt!490497 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2296 (Int (_ BitVec 64)) V!41281)

(assert (=> b!1097329 (= lt!490497 (array!71144 (store (arr!34243 _values!874) i!650 (ValueCellFull!12848 (dynLambda!2296 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34779 _values!874)))))

(assert (=> b!1097329 (= lt!490495 (getCurrentListMapNoExtraKeys!4161 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097329 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!490493 () Unit!36102)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71141 (_ BitVec 64) (_ BitVec 32)) Unit!36102)

(assert (=> b!1097329 (= lt!490493 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1097330 () Bool)

(declare-fun res!732401 () Bool)

(assert (=> b!1097330 (=> (not res!732401) (not e!626284))))

(assert (=> b!1097330 (= res!732401 (= (select (arr!34242 _keys!1070) i!650) k!904))))

(declare-fun b!1097331 () Bool)

(assert (=> b!1097331 (= e!626282 tp_is_empty!27115)))

(declare-fun b!1097332 () Bool)

(declare-fun +!3355 (ListLongMap!15259 tuple2!17290) ListLongMap!15259)

(assert (=> b!1097332 (= e!626281 (= lt!490490 (+!3355 (+!3355 lt!490492 (tuple2!17291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (tuple2!17291 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun res!732406 () Bool)

(assert (=> start!96486 (=> (not res!732406) (not e!626284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96486 (= res!732406 (validMask!0 mask!1414))))

(assert (=> start!96486 e!626284))

(assert (=> start!96486 tp!81121))

(assert (=> start!96486 true))

(assert (=> start!96486 tp_is_empty!27115))

(declare-fun array_inv!26380 (array!71141) Bool)

(assert (=> start!96486 (array_inv!26380 _keys!1070)))

(declare-fun e!626279 () Bool)

(declare-fun array_inv!26381 (array!71143) Bool)

(assert (=> start!96486 (and (array_inv!26381 _values!874) e!626279)))

(declare-fun b!1097328 () Bool)

(assert (=> b!1097328 (= e!626279 (and e!626280 mapRes!42433))))

(declare-fun condMapEmpty!42433 () Bool)

(declare-fun mapDefault!42433 () ValueCell!12848)

