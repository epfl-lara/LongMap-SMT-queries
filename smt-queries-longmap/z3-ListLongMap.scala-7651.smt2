; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96228 () Bool)

(assert start!96228)

(declare-fun b_free!22881 () Bool)

(declare-fun b_next!22881 () Bool)

(assert (=> start!96228 (= b_free!22881 (not b_next!22881))))

(declare-fun tp!80492 () Bool)

(declare-fun b_and!36437 () Bool)

(assert (=> start!96228 (= tp!80492 b_and!36437)))

(declare-fun b!1093013 () Bool)

(declare-fun res!729356 () Bool)

(declare-fun e!624145 () Bool)

(assert (=> b!1093013 (=> (not res!729356) (not e!624145))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70685 0))(
  ( (array!70686 (arr!34016 (Array (_ BitVec 32) (_ BitVec 64))) (size!34552 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70685)

(assert (=> b!1093013 (= res!729356 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34552 _keys!1070))))))

(declare-fun b!1093014 () Bool)

(declare-fun res!729354 () Bool)

(assert (=> b!1093014 (=> (not res!729354) (not e!624145))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1093014 (= res!729354 (= (select (arr!34016 _keys!1070) i!650) k0!904))))

(declare-fun b!1093015 () Bool)

(declare-fun res!729352 () Bool)

(assert (=> b!1093015 (=> (not res!729352) (not e!624145))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70685 (_ BitVec 32)) Bool)

(assert (=> b!1093015 (= res!729352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093016 () Bool)

(declare-fun res!729360 () Bool)

(assert (=> b!1093016 (=> (not res!729360) (not e!624145))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40971 0))(
  ( (V!40972 (val!13498 Int)) )
))
(declare-datatypes ((ValueCell!12732 0))(
  ( (ValueCellFull!12732 (v!16119 V!40971)) (EmptyCell!12732) )
))
(declare-datatypes ((array!70687 0))(
  ( (array!70688 (arr!34017 (Array (_ BitVec 32) ValueCell!12732)) (size!34553 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70687)

(assert (=> b!1093016 (= res!729360 (and (= (size!34553 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34552 _keys!1070) (size!34553 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093017 () Bool)

(declare-fun res!729355 () Bool)

(assert (=> b!1093017 (=> (not res!729355) (not e!624145))))

(declare-datatypes ((List!23764 0))(
  ( (Nil!23761) (Cons!23760 (h!24969 (_ BitVec 64)) (t!33703 List!23764)) )
))
(declare-fun arrayNoDuplicates!0 (array!70685 (_ BitVec 32) List!23764) Bool)

(assert (=> b!1093017 (= res!729355 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23761))))

(declare-fun b!1093018 () Bool)

(declare-fun e!624144 () Bool)

(declare-fun tp_is_empty!26883 () Bool)

(assert (=> b!1093018 (= e!624144 tp_is_empty!26883)))

(declare-fun b!1093020 () Bool)

(declare-fun e!624141 () Bool)

(assert (=> b!1093020 (= e!624141 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40971)

(declare-datatypes ((tuple2!17174 0))(
  ( (tuple2!17175 (_1!8598 (_ BitVec 64)) (_2!8598 V!40971)) )
))
(declare-datatypes ((List!23765 0))(
  ( (Nil!23762) (Cons!23761 (h!24970 tuple2!17174) (t!33704 List!23765)) )
))
(declare-datatypes ((ListLongMap!15143 0))(
  ( (ListLongMap!15144 (toList!7587 List!23765)) )
))
(declare-fun lt!488684 () ListLongMap!15143)

(declare-fun zeroValue!831 () V!40971)

(declare-fun getCurrentListMap!4343 (array!70685 array!70687 (_ BitVec 32) (_ BitVec 32) V!40971 V!40971 (_ BitVec 32) Int) ListLongMap!15143)

(assert (=> b!1093020 (= lt!488684 (getCurrentListMap!4343 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488686 () array!70687)

(declare-fun lt!488691 () array!70685)

(declare-fun lt!488690 () ListLongMap!15143)

(assert (=> b!1093020 (= lt!488690 (getCurrentListMap!4343 lt!488691 lt!488686 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488688 () ListLongMap!15143)

(declare-fun lt!488685 () ListLongMap!15143)

(assert (=> b!1093020 (and (= lt!488688 lt!488685) (= lt!488685 lt!488688))))

(declare-fun lt!488689 () ListLongMap!15143)

(declare-fun -!906 (ListLongMap!15143 (_ BitVec 64)) ListLongMap!15143)

(assert (=> b!1093020 (= lt!488685 (-!906 lt!488689 k0!904))))

(declare-datatypes ((Unit!35978 0))(
  ( (Unit!35979) )
))
(declare-fun lt!488692 () Unit!35978)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!162 (array!70685 array!70687 (_ BitVec 32) (_ BitVec 32) V!40971 V!40971 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35978)

(assert (=> b!1093020 (= lt!488692 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!162 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4103 (array!70685 array!70687 (_ BitVec 32) (_ BitVec 32) V!40971 V!40971 (_ BitVec 32) Int) ListLongMap!15143)

(assert (=> b!1093020 (= lt!488688 (getCurrentListMapNoExtraKeys!4103 lt!488691 lt!488686 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2240 (Int (_ BitVec 64)) V!40971)

(assert (=> b!1093020 (= lt!488686 (array!70688 (store (arr!34017 _values!874) i!650 (ValueCellFull!12732 (dynLambda!2240 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34553 _values!874)))))

(assert (=> b!1093020 (= lt!488689 (getCurrentListMapNoExtraKeys!4103 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093020 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488687 () Unit!35978)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70685 (_ BitVec 64) (_ BitVec 32)) Unit!35978)

(assert (=> b!1093020 (= lt!488687 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093021 () Bool)

(declare-fun res!729359 () Bool)

(assert (=> b!1093021 (=> (not res!729359) (not e!624145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093021 (= res!729359 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42079 () Bool)

(declare-fun mapRes!42079 () Bool)

(assert (=> mapIsEmpty!42079 mapRes!42079))

(declare-fun b!1093022 () Bool)

(declare-fun res!729357 () Bool)

(assert (=> b!1093022 (=> (not res!729357) (not e!624141))))

(assert (=> b!1093022 (= res!729357 (arrayNoDuplicates!0 lt!488691 #b00000000000000000000000000000000 Nil!23761))))

(declare-fun b!1093023 () Bool)

(declare-fun e!624146 () Bool)

(assert (=> b!1093023 (= e!624146 tp_is_empty!26883)))

(declare-fun b!1093024 () Bool)

(declare-fun e!624142 () Bool)

(assert (=> b!1093024 (= e!624142 (and e!624144 mapRes!42079))))

(declare-fun condMapEmpty!42079 () Bool)

(declare-fun mapDefault!42079 () ValueCell!12732)

(assert (=> b!1093024 (= condMapEmpty!42079 (= (arr!34017 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12732)) mapDefault!42079)))))

(declare-fun mapNonEmpty!42079 () Bool)

(declare-fun tp!80491 () Bool)

(assert (=> mapNonEmpty!42079 (= mapRes!42079 (and tp!80491 e!624146))))

(declare-fun mapRest!42079 () (Array (_ BitVec 32) ValueCell!12732))

(declare-fun mapKey!42079 () (_ BitVec 32))

(declare-fun mapValue!42079 () ValueCell!12732)

(assert (=> mapNonEmpty!42079 (= (arr!34017 _values!874) (store mapRest!42079 mapKey!42079 mapValue!42079))))

(declare-fun b!1093019 () Bool)

(assert (=> b!1093019 (= e!624145 e!624141)))

(declare-fun res!729353 () Bool)

(assert (=> b!1093019 (=> (not res!729353) (not e!624141))))

(assert (=> b!1093019 (= res!729353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488691 mask!1414))))

(assert (=> b!1093019 (= lt!488691 (array!70686 (store (arr!34016 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34552 _keys!1070)))))

(declare-fun res!729358 () Bool)

(assert (=> start!96228 (=> (not res!729358) (not e!624145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96228 (= res!729358 (validMask!0 mask!1414))))

(assert (=> start!96228 e!624145))

(assert (=> start!96228 tp!80492))

(assert (=> start!96228 true))

(assert (=> start!96228 tp_is_empty!26883))

(declare-fun array_inv!26218 (array!70685) Bool)

(assert (=> start!96228 (array_inv!26218 _keys!1070)))

(declare-fun array_inv!26219 (array!70687) Bool)

(assert (=> start!96228 (and (array_inv!26219 _values!874) e!624142)))

(assert (= (and start!96228 res!729358) b!1093016))

(assert (= (and b!1093016 res!729360) b!1093015))

(assert (= (and b!1093015 res!729352) b!1093017))

(assert (= (and b!1093017 res!729355) b!1093013))

(assert (= (and b!1093013 res!729356) b!1093021))

(assert (= (and b!1093021 res!729359) b!1093014))

(assert (= (and b!1093014 res!729354) b!1093019))

(assert (= (and b!1093019 res!729353) b!1093022))

(assert (= (and b!1093022 res!729357) b!1093020))

(assert (= (and b!1093024 condMapEmpty!42079) mapIsEmpty!42079))

(assert (= (and b!1093024 (not condMapEmpty!42079)) mapNonEmpty!42079))

(get-info :version)

(assert (= (and mapNonEmpty!42079 ((_ is ValueCellFull!12732) mapValue!42079)) b!1093023))

(assert (= (and b!1093024 ((_ is ValueCellFull!12732) mapDefault!42079)) b!1093018))

(assert (= start!96228 b!1093024))

(declare-fun b_lambda!17551 () Bool)

(assert (=> (not b_lambda!17551) (not b!1093020)))

(declare-fun t!33702 () Bool)

(declare-fun tb!7759 () Bool)

(assert (=> (and start!96228 (= defaultEntry!882 defaultEntry!882) t!33702) tb!7759))

(declare-fun result!16037 () Bool)

(assert (=> tb!7759 (= result!16037 tp_is_empty!26883)))

(assert (=> b!1093020 t!33702))

(declare-fun b_and!36439 () Bool)

(assert (= b_and!36437 (and (=> t!33702 result!16037) b_and!36439)))

(declare-fun m!1012837 () Bool)

(assert (=> b!1093022 m!1012837))

(declare-fun m!1012839 () Bool)

(assert (=> b!1093014 m!1012839))

(declare-fun m!1012841 () Bool)

(assert (=> b!1093015 m!1012841))

(declare-fun m!1012843 () Bool)

(assert (=> start!96228 m!1012843))

(declare-fun m!1012845 () Bool)

(assert (=> start!96228 m!1012845))

(declare-fun m!1012847 () Bool)

(assert (=> start!96228 m!1012847))

(declare-fun m!1012849 () Bool)

(assert (=> b!1093021 m!1012849))

(declare-fun m!1012851 () Bool)

(assert (=> b!1093019 m!1012851))

(declare-fun m!1012853 () Bool)

(assert (=> b!1093019 m!1012853))

(declare-fun m!1012855 () Bool)

(assert (=> b!1093020 m!1012855))

(declare-fun m!1012857 () Bool)

(assert (=> b!1093020 m!1012857))

(declare-fun m!1012859 () Bool)

(assert (=> b!1093020 m!1012859))

(declare-fun m!1012861 () Bool)

(assert (=> b!1093020 m!1012861))

(declare-fun m!1012863 () Bool)

(assert (=> b!1093020 m!1012863))

(declare-fun m!1012865 () Bool)

(assert (=> b!1093020 m!1012865))

(declare-fun m!1012867 () Bool)

(assert (=> b!1093020 m!1012867))

(declare-fun m!1012869 () Bool)

(assert (=> b!1093020 m!1012869))

(declare-fun m!1012871 () Bool)

(assert (=> b!1093020 m!1012871))

(declare-fun m!1012873 () Bool)

(assert (=> b!1093020 m!1012873))

(declare-fun m!1012875 () Bool)

(assert (=> b!1093017 m!1012875))

(declare-fun m!1012877 () Bool)

(assert (=> mapNonEmpty!42079 m!1012877))

(check-sat tp_is_empty!26883 (not b_next!22881) (not mapNonEmpty!42079) (not b!1093021) (not b_lambda!17551) b_and!36439 (not b!1093015) (not b!1093022) (not b!1093017) (not b!1093019) (not start!96228) (not b!1093020))
(check-sat b_and!36439 (not b_next!22881))
