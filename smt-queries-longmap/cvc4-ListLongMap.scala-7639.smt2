; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96158 () Bool)

(assert start!96158)

(declare-fun b_free!22811 () Bool)

(declare-fun b_next!22811 () Bool)

(assert (=> start!96158 (= b_free!22811 (not b_next!22811))))

(declare-fun tp!80281 () Bool)

(declare-fun b_and!36297 () Bool)

(assert (=> start!96158 (= tp!80281 b_and!36297)))

(declare-fun b!1091592 () Bool)

(declare-fun res!728321 () Bool)

(declare-fun e!623423 () Bool)

(assert (=> b!1091592 (=> (not res!728321) (not e!623423))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091592 (= res!728321 (validKeyInArray!0 k!904))))

(declare-fun b!1091593 () Bool)

(declare-fun e!623424 () Bool)

(declare-fun e!623421 () Bool)

(assert (=> b!1091593 (= e!623424 (not e!623421))))

(declare-fun res!728317 () Bool)

(assert (=> b!1091593 (=> res!728317 e!623421)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091593 (= res!728317 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40877 0))(
  ( (V!40878 (val!13463 Int)) )
))
(declare-fun minValue!831 () V!40877)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17126 0))(
  ( (tuple2!17127 (_1!8574 (_ BitVec 64)) (_2!8574 V!40877)) )
))
(declare-datatypes ((List!23710 0))(
  ( (Nil!23707) (Cons!23706 (h!24915 tuple2!17126) (t!33579 List!23710)) )
))
(declare-datatypes ((ListLongMap!15095 0))(
  ( (ListLongMap!15096 (toList!7563 List!23710)) )
))
(declare-fun lt!487557 () ListLongMap!15095)

(declare-fun zeroValue!831 () V!40877)

(declare-datatypes ((array!70545 0))(
  ( (array!70546 (arr!33946 (Array (_ BitVec 32) (_ BitVec 64))) (size!34482 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70545)

(declare-datatypes ((ValueCell!12697 0))(
  ( (ValueCellFull!12697 (v!16084 V!40877)) (EmptyCell!12697) )
))
(declare-datatypes ((array!70547 0))(
  ( (array!70548 (arr!33947 (Array (_ BitVec 32) ValueCell!12697)) (size!34483 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70547)

(declare-fun getCurrentListMap!4322 (array!70545 array!70547 (_ BitVec 32) (_ BitVec 32) V!40877 V!40877 (_ BitVec 32) Int) ListLongMap!15095)

(assert (=> b!1091593 (= lt!487557 (getCurrentListMap!4322 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487565 () array!70545)

(declare-fun lt!487562 () array!70547)

(declare-fun lt!487558 () ListLongMap!15095)

(assert (=> b!1091593 (= lt!487558 (getCurrentListMap!4322 lt!487565 lt!487562 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487564 () ListLongMap!15095)

(declare-fun lt!487560 () ListLongMap!15095)

(assert (=> b!1091593 (and (= lt!487564 lt!487560) (= lt!487560 lt!487564))))

(declare-fun lt!487555 () ListLongMap!15095)

(declare-fun -!884 (ListLongMap!15095 (_ BitVec 64)) ListLongMap!15095)

(assert (=> b!1091593 (= lt!487560 (-!884 lt!487555 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35934 0))(
  ( (Unit!35935) )
))
(declare-fun lt!487567 () Unit!35934)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!141 (array!70545 array!70547 (_ BitVec 32) (_ BitVec 32) V!40877 V!40877 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35934)

(assert (=> b!1091593 (= lt!487567 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!141 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4082 (array!70545 array!70547 (_ BitVec 32) (_ BitVec 32) V!40877 V!40877 (_ BitVec 32) Int) ListLongMap!15095)

(assert (=> b!1091593 (= lt!487564 (getCurrentListMapNoExtraKeys!4082 lt!487565 lt!487562 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2219 (Int (_ BitVec 64)) V!40877)

(assert (=> b!1091593 (= lt!487562 (array!70548 (store (arr!33947 _values!874) i!650 (ValueCellFull!12697 (dynLambda!2219 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34483 _values!874)))))

(assert (=> b!1091593 (= lt!487555 (getCurrentListMapNoExtraKeys!4082 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091593 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!487559 () Unit!35934)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70545 (_ BitVec 64) (_ BitVec 32)) Unit!35934)

(assert (=> b!1091593 (= lt!487559 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1091594 () Bool)

(declare-fun e!623426 () Bool)

(assert (=> b!1091594 (= e!623426 true)))

(declare-fun lt!487556 () ListLongMap!15095)

(declare-fun lt!487563 () ListLongMap!15095)

(assert (=> b!1091594 (= (-!884 lt!487556 k!904) lt!487563)))

(declare-fun lt!487566 () Unit!35934)

(declare-fun addRemoveCommutativeForDiffKeys!106 (ListLongMap!15095 (_ BitVec 64) V!40877 (_ BitVec 64)) Unit!35934)

(assert (=> b!1091594 (= lt!487566 (addRemoveCommutativeForDiffKeys!106 lt!487555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1091595 () Bool)

(declare-fun res!728325 () Bool)

(assert (=> b!1091595 (=> (not res!728325) (not e!623423))))

(assert (=> b!1091595 (= res!728325 (and (= (size!34483 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34482 _keys!1070) (size!34483 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091596 () Bool)

(declare-fun res!728320 () Bool)

(assert (=> b!1091596 (=> (not res!728320) (not e!623424))))

(declare-datatypes ((List!23711 0))(
  ( (Nil!23708) (Cons!23707 (h!24916 (_ BitVec 64)) (t!33580 List!23711)) )
))
(declare-fun arrayNoDuplicates!0 (array!70545 (_ BitVec 32) List!23711) Bool)

(assert (=> b!1091596 (= res!728320 (arrayNoDuplicates!0 lt!487565 #b00000000000000000000000000000000 Nil!23708))))

(declare-fun b!1091597 () Bool)

(declare-fun res!728318 () Bool)

(assert (=> b!1091597 (=> (not res!728318) (not e!623423))))

(assert (=> b!1091597 (= res!728318 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34482 _keys!1070))))))

(declare-fun b!1091598 () Bool)

(declare-fun e!623420 () Bool)

(declare-fun tp_is_empty!26813 () Bool)

(assert (=> b!1091598 (= e!623420 tp_is_empty!26813)))

(declare-fun b!1091599 () Bool)

(declare-fun e!623425 () Bool)

(declare-fun mapRes!41974 () Bool)

(assert (=> b!1091599 (= e!623425 (and e!623420 mapRes!41974))))

(declare-fun condMapEmpty!41974 () Bool)

(declare-fun mapDefault!41974 () ValueCell!12697)

