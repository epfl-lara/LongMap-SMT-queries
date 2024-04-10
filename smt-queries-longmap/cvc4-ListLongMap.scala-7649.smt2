; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96218 () Bool)

(assert start!96218)

(declare-fun b_free!22871 () Bool)

(declare-fun b_next!22871 () Bool)

(assert (=> start!96218 (= b_free!22871 (not b_next!22871))))

(declare-fun tp!80462 () Bool)

(declare-fun b_and!36417 () Bool)

(assert (=> start!96218 (= tp!80462 b_and!36417)))

(declare-fun b!1092823 () Bool)

(declare-fun e!624052 () Bool)

(declare-fun tp_is_empty!26873 () Bool)

(assert (=> b!1092823 (= e!624052 tp_is_empty!26873)))

(declare-fun b!1092824 () Bool)

(declare-fun e!624053 () Bool)

(declare-fun e!624055 () Bool)

(assert (=> b!1092824 (= e!624053 e!624055)))

(declare-fun res!729222 () Bool)

(assert (=> b!1092824 (=> (not res!729222) (not e!624055))))

(declare-datatypes ((array!70665 0))(
  ( (array!70666 (arr!34006 (Array (_ BitVec 32) (_ BitVec 64))) (size!34542 (_ BitVec 32))) )
))
(declare-fun lt!488555 () array!70665)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70665 (_ BitVec 32)) Bool)

(assert (=> b!1092824 (= res!729222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488555 mask!1414))))

(declare-fun _keys!1070 () array!70665)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092824 (= lt!488555 (array!70666 (store (arr!34006 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34542 _keys!1070)))))

(declare-fun b!1092825 () Bool)

(assert (=> b!1092825 (= e!624055 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40957 0))(
  ( (V!40958 (val!13493 Int)) )
))
(declare-fun minValue!831 () V!40957)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40957)

(declare-datatypes ((ValueCell!12727 0))(
  ( (ValueCellFull!12727 (v!16114 V!40957)) (EmptyCell!12727) )
))
(declare-datatypes ((array!70667 0))(
  ( (array!70668 (arr!34007 (Array (_ BitVec 32) ValueCell!12727)) (size!34543 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70667)

(declare-datatypes ((tuple2!17170 0))(
  ( (tuple2!17171 (_1!8596 (_ BitVec 64)) (_2!8596 V!40957)) )
))
(declare-datatypes ((List!23757 0))(
  ( (Nil!23754) (Cons!23753 (h!24962 tuple2!17170) (t!33686 List!23757)) )
))
(declare-datatypes ((ListLongMap!15139 0))(
  ( (ListLongMap!15140 (toList!7585 List!23757)) )
))
(declare-fun lt!488549 () ListLongMap!15139)

(declare-fun getCurrentListMap!4341 (array!70665 array!70667 (_ BitVec 32) (_ BitVec 32) V!40957 V!40957 (_ BitVec 32) Int) ListLongMap!15139)

(assert (=> b!1092825 (= lt!488549 (getCurrentListMap!4341 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488554 () ListLongMap!15139)

(declare-fun lt!488556 () array!70667)

(assert (=> b!1092825 (= lt!488554 (getCurrentListMap!4341 lt!488555 lt!488556 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488552 () ListLongMap!15139)

(declare-fun lt!488553 () ListLongMap!15139)

(assert (=> b!1092825 (and (= lt!488552 lt!488553) (= lt!488553 lt!488552))))

(declare-fun lt!488557 () ListLongMap!15139)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!904 (ListLongMap!15139 (_ BitVec 64)) ListLongMap!15139)

(assert (=> b!1092825 (= lt!488553 (-!904 lt!488557 k!904))))

(declare-datatypes ((Unit!35974 0))(
  ( (Unit!35975) )
))
(declare-fun lt!488550 () Unit!35974)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!160 (array!70665 array!70667 (_ BitVec 32) (_ BitVec 32) V!40957 V!40957 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35974)

(assert (=> b!1092825 (= lt!488550 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!160 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4101 (array!70665 array!70667 (_ BitVec 32) (_ BitVec 32) V!40957 V!40957 (_ BitVec 32) Int) ListLongMap!15139)

(assert (=> b!1092825 (= lt!488552 (getCurrentListMapNoExtraKeys!4101 lt!488555 lt!488556 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2238 (Int (_ BitVec 64)) V!40957)

(assert (=> b!1092825 (= lt!488556 (array!70668 (store (arr!34007 _values!874) i!650 (ValueCellFull!12727 (dynLambda!2238 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34543 _values!874)))))

(assert (=> b!1092825 (= lt!488557 (getCurrentListMapNoExtraKeys!4101 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092825 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!488551 () Unit!35974)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70665 (_ BitVec 64) (_ BitVec 32)) Unit!35974)

(assert (=> b!1092825 (= lt!488551 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapIsEmpty!42064 () Bool)

(declare-fun mapRes!42064 () Bool)

(assert (=> mapIsEmpty!42064 mapRes!42064))

(declare-fun b!1092826 () Bool)

(declare-fun res!729225 () Bool)

(assert (=> b!1092826 (=> (not res!729225) (not e!624053))))

(assert (=> b!1092826 (= res!729225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092827 () Bool)

(declare-fun res!729218 () Bool)

(assert (=> b!1092827 (=> (not res!729218) (not e!624053))))

(assert (=> b!1092827 (= res!729218 (and (= (size!34543 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34542 _keys!1070) (size!34543 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092828 () Bool)

(declare-fun e!624054 () Bool)

(assert (=> b!1092828 (= e!624054 tp_is_empty!26873)))

(declare-fun b!1092829 () Bool)

(declare-fun res!729217 () Bool)

(assert (=> b!1092829 (=> (not res!729217) (not e!624053))))

(declare-datatypes ((List!23758 0))(
  ( (Nil!23755) (Cons!23754 (h!24963 (_ BitVec 64)) (t!33687 List!23758)) )
))
(declare-fun arrayNoDuplicates!0 (array!70665 (_ BitVec 32) List!23758) Bool)

(assert (=> b!1092829 (= res!729217 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23755))))

(declare-fun b!1092830 () Bool)

(declare-fun res!729219 () Bool)

(assert (=> b!1092830 (=> (not res!729219) (not e!624053))))

(assert (=> b!1092830 (= res!729219 (= (select (arr!34006 _keys!1070) i!650) k!904))))

(declare-fun b!1092831 () Bool)

(declare-fun e!624056 () Bool)

(assert (=> b!1092831 (= e!624056 (and e!624054 mapRes!42064))))

(declare-fun condMapEmpty!42064 () Bool)

(declare-fun mapDefault!42064 () ValueCell!12727)

