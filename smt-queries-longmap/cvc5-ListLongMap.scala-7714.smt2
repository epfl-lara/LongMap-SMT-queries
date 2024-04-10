; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96916 () Bool)

(assert start!96916)

(declare-fun b_free!23209 () Bool)

(declare-fun b_next!23209 () Bool)

(assert (=> start!96916 (= b_free!23209 (not b_next!23209))))

(declare-fun tp!81587 () Bool)

(declare-fun b_and!37235 () Bool)

(assert (=> start!96916 (= tp!81587 b_and!37235)))

(declare-fun b!1102619 () Bool)

(declare-fun res!735693 () Bool)

(declare-fun e!629346 () Bool)

(assert (=> b!1102619 (=> (not res!735693) (not e!629346))))

(declare-datatypes ((array!71439 0))(
  ( (array!71440 (arr!34380 (Array (_ BitVec 32) (_ BitVec 64))) (size!34916 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71439)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71439 (_ BitVec 32)) Bool)

(assert (=> b!1102619 (= res!735693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1102620 () Bool)

(declare-fun e!629343 () Bool)

(declare-fun tp_is_empty!27259 () Bool)

(assert (=> b!1102620 (= e!629343 tp_is_empty!27259)))

(declare-fun mapNonEmpty!42682 () Bool)

(declare-fun mapRes!42682 () Bool)

(declare-fun tp!81586 () Bool)

(declare-fun e!629342 () Bool)

(assert (=> mapNonEmpty!42682 (= mapRes!42682 (and tp!81586 e!629342))))

(declare-datatypes ((V!41473 0))(
  ( (V!41474 (val!13686 Int)) )
))
(declare-datatypes ((ValueCell!12920 0))(
  ( (ValueCellFull!12920 (v!16317 V!41473)) (EmptyCell!12920) )
))
(declare-fun mapValue!42682 () ValueCell!12920)

(declare-datatypes ((array!71441 0))(
  ( (array!71442 (arr!34381 (Array (_ BitVec 32) ValueCell!12920)) (size!34917 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71441)

(declare-fun mapKey!42682 () (_ BitVec 32))

(declare-fun mapRest!42682 () (Array (_ BitVec 32) ValueCell!12920))

(assert (=> mapNonEmpty!42682 (= (arr!34381 _values!874) (store mapRest!42682 mapKey!42682 mapValue!42682))))

(declare-fun b!1102621 () Bool)

(declare-fun res!735700 () Bool)

(declare-fun e!629347 () Bool)

(assert (=> b!1102621 (=> (not res!735700) (not e!629347))))

(declare-fun lt!494747 () array!71439)

(declare-datatypes ((List!24024 0))(
  ( (Nil!24021) (Cons!24020 (h!25229 (_ BitVec 64)) (t!34279 List!24024)) )
))
(declare-fun arrayNoDuplicates!0 (array!71439 (_ BitVec 32) List!24024) Bool)

(assert (=> b!1102621 (= res!735700 (arrayNoDuplicates!0 lt!494747 #b00000000000000000000000000000000 Nil!24021))))

(declare-fun b!1102622 () Bool)

(declare-fun res!735692 () Bool)

(assert (=> b!1102622 (=> (not res!735692) (not e!629346))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1102622 (= res!735692 (= (select (arr!34380 _keys!1070) i!650) k!904))))

(declare-fun b!1102623 () Bool)

(declare-fun res!735695 () Bool)

(assert (=> b!1102623 (=> (not res!735695) (not e!629346))))

(assert (=> b!1102623 (= res!735695 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34916 _keys!1070))))))

(declare-datatypes ((tuple2!17408 0))(
  ( (tuple2!17409 (_1!8715 (_ BitVec 64)) (_2!8715 V!41473)) )
))
(declare-datatypes ((List!24025 0))(
  ( (Nil!24022) (Cons!24021 (h!25230 tuple2!17408) (t!34280 List!24025)) )
))
(declare-datatypes ((ListLongMap!15377 0))(
  ( (ListLongMap!15378 (toList!7704 List!24025)) )
))
(declare-fun lt!494746 () ListLongMap!15377)

(declare-fun lt!494754 () ListLongMap!15377)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun b!1102624 () Bool)

(declare-fun lt!494748 () Bool)

(assert (=> b!1102624 (= e!629347 (not (or (and (not lt!494748) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!494748) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!494748) (not (= lt!494754 lt!494746)) (bvslt i!650 (size!34917 _values!874)))))))

(assert (=> b!1102624 (= lt!494748 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41473)

(declare-fun lt!494745 () ListLongMap!15377)

(declare-fun zeroValue!831 () V!41473)

(declare-fun getCurrentListMap!4408 (array!71439 array!71441 (_ BitVec 32) (_ BitVec 32) V!41473 V!41473 (_ BitVec 32) Int) ListLongMap!15377)

(assert (=> b!1102624 (= lt!494745 (getCurrentListMap!4408 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494752 () array!71441)

(assert (=> b!1102624 (= lt!494754 (getCurrentListMap!4408 lt!494747 lt!494752 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494751 () ListLongMap!15377)

(assert (=> b!1102624 (and (= lt!494746 lt!494751) (= lt!494751 lt!494746))))

(declare-fun lt!494749 () ListLongMap!15377)

(declare-fun -!987 (ListLongMap!15377 (_ BitVec 64)) ListLongMap!15377)

(assert (=> b!1102624 (= lt!494751 (-!987 lt!494749 k!904))))

(declare-datatypes ((Unit!36228 0))(
  ( (Unit!36229) )
))
(declare-fun lt!494753 () Unit!36228)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!234 (array!71439 array!71441 (_ BitVec 32) (_ BitVec 32) V!41473 V!41473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36228)

(assert (=> b!1102624 (= lt!494753 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!234 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4204 (array!71439 array!71441 (_ BitVec 32) (_ BitVec 32) V!41473 V!41473 (_ BitVec 32) Int) ListLongMap!15377)

(assert (=> b!1102624 (= lt!494746 (getCurrentListMapNoExtraKeys!4204 lt!494747 lt!494752 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2339 (Int (_ BitVec 64)) V!41473)

(assert (=> b!1102624 (= lt!494752 (array!71442 (store (arr!34381 _values!874) i!650 (ValueCellFull!12920 (dynLambda!2339 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34917 _values!874)))))

(assert (=> b!1102624 (= lt!494749 (getCurrentListMapNoExtraKeys!4204 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102624 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!494750 () Unit!36228)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71439 (_ BitVec 64) (_ BitVec 32)) Unit!36228)

(assert (=> b!1102624 (= lt!494750 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1102625 () Bool)

(assert (=> b!1102625 (= e!629342 tp_is_empty!27259)))

(declare-fun b!1102626 () Bool)

(declare-fun e!629344 () Bool)

(assert (=> b!1102626 (= e!629344 (and e!629343 mapRes!42682))))

(declare-fun condMapEmpty!42682 () Bool)

(declare-fun mapDefault!42682 () ValueCell!12920)

