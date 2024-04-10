; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96230 () Bool)

(assert start!96230)

(declare-fun b_free!22883 () Bool)

(declare-fun b_next!22883 () Bool)

(assert (=> start!96230 (= b_free!22883 (not b_next!22883))))

(declare-fun tp!80498 () Bool)

(declare-fun b_and!36441 () Bool)

(assert (=> start!96230 (= tp!80498 b_and!36441)))

(declare-fun b!1093051 () Bool)

(declare-fun res!729387 () Bool)

(declare-fun e!624163 () Bool)

(assert (=> b!1093051 (=> (not res!729387) (not e!624163))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70689 0))(
  ( (array!70690 (arr!34018 (Array (_ BitVec 32) (_ BitVec 64))) (size!34554 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70689)

(declare-datatypes ((V!40973 0))(
  ( (V!40974 (val!13499 Int)) )
))
(declare-datatypes ((ValueCell!12733 0))(
  ( (ValueCellFull!12733 (v!16120 V!40973)) (EmptyCell!12733) )
))
(declare-datatypes ((array!70691 0))(
  ( (array!70692 (arr!34019 (Array (_ BitVec 32) ValueCell!12733)) (size!34555 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70691)

(assert (=> b!1093051 (= res!729387 (and (= (size!34555 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34554 _keys!1070) (size!34555 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42082 () Bool)

(declare-fun mapRes!42082 () Bool)

(assert (=> mapIsEmpty!42082 mapRes!42082))

(declare-fun b!1093053 () Bool)

(declare-fun res!729379 () Bool)

(assert (=> b!1093053 (=> (not res!729379) (not e!624163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70689 (_ BitVec 32)) Bool)

(assert (=> b!1093053 (= res!729379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093054 () Bool)

(declare-fun e!624164 () Bool)

(assert (=> b!1093054 (= e!624164 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40973)

(declare-fun zeroValue!831 () V!40973)

(declare-datatypes ((tuple2!17176 0))(
  ( (tuple2!17177 (_1!8599 (_ BitVec 64)) (_2!8599 V!40973)) )
))
(declare-datatypes ((List!23766 0))(
  ( (Nil!23763) (Cons!23762 (h!24971 tuple2!17176) (t!33707 List!23766)) )
))
(declare-datatypes ((ListLongMap!15145 0))(
  ( (ListLongMap!15146 (toList!7588 List!23766)) )
))
(declare-fun lt!488715 () ListLongMap!15145)

(declare-fun getCurrentListMap!4344 (array!70689 array!70691 (_ BitVec 32) (_ BitVec 32) V!40973 V!40973 (_ BitVec 32) Int) ListLongMap!15145)

(assert (=> b!1093054 (= lt!488715 (getCurrentListMap!4344 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488714 () array!70691)

(declare-fun lt!488713 () array!70689)

(declare-fun lt!488711 () ListLongMap!15145)

(assert (=> b!1093054 (= lt!488711 (getCurrentListMap!4344 lt!488713 lt!488714 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488719 () ListLongMap!15145)

(declare-fun lt!488716 () ListLongMap!15145)

(assert (=> b!1093054 (and (= lt!488719 lt!488716) (= lt!488716 lt!488719))))

(declare-fun lt!488718 () ListLongMap!15145)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!907 (ListLongMap!15145 (_ BitVec 64)) ListLongMap!15145)

(assert (=> b!1093054 (= lt!488716 (-!907 lt!488718 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35980 0))(
  ( (Unit!35981) )
))
(declare-fun lt!488712 () Unit!35980)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!163 (array!70689 array!70691 (_ BitVec 32) (_ BitVec 32) V!40973 V!40973 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35980)

(assert (=> b!1093054 (= lt!488712 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!163 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4104 (array!70689 array!70691 (_ BitVec 32) (_ BitVec 32) V!40973 V!40973 (_ BitVec 32) Int) ListLongMap!15145)

(assert (=> b!1093054 (= lt!488719 (getCurrentListMapNoExtraKeys!4104 lt!488713 lt!488714 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2241 (Int (_ BitVec 64)) V!40973)

(assert (=> b!1093054 (= lt!488714 (array!70692 (store (arr!34019 _values!874) i!650 (ValueCellFull!12733 (dynLambda!2241 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34555 _values!874)))))

(assert (=> b!1093054 (= lt!488718 (getCurrentListMapNoExtraKeys!4104 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093054 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!488717 () Unit!35980)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70689 (_ BitVec 64) (_ BitVec 32)) Unit!35980)

(assert (=> b!1093054 (= lt!488717 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1093055 () Bool)

(declare-fun res!729382 () Bool)

(assert (=> b!1093055 (=> (not res!729382) (not e!624163))))

(assert (=> b!1093055 (= res!729382 (= (select (arr!34018 _keys!1070) i!650) k!904))))

(declare-fun b!1093056 () Bool)

(declare-fun res!729383 () Bool)

(assert (=> b!1093056 (=> (not res!729383) (not e!624164))))

(declare-datatypes ((List!23767 0))(
  ( (Nil!23764) (Cons!23763 (h!24972 (_ BitVec 64)) (t!33708 List!23767)) )
))
(declare-fun arrayNoDuplicates!0 (array!70689 (_ BitVec 32) List!23767) Bool)

(assert (=> b!1093056 (= res!729383 (arrayNoDuplicates!0 lt!488713 #b00000000000000000000000000000000 Nil!23764))))

(declare-fun b!1093057 () Bool)

(declare-fun res!729385 () Bool)

(assert (=> b!1093057 (=> (not res!729385) (not e!624163))))

(assert (=> b!1093057 (= res!729385 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34554 _keys!1070))))))

(declare-fun b!1093058 () Bool)

(declare-fun e!624162 () Bool)

(declare-fun e!624161 () Bool)

(assert (=> b!1093058 (= e!624162 (and e!624161 mapRes!42082))))

(declare-fun condMapEmpty!42082 () Bool)

(declare-fun mapDefault!42082 () ValueCell!12733)

