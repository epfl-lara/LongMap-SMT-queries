; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96396 () Bool)

(assert start!96396)

(declare-fun b_free!22813 () Bool)

(declare-fun b_next!22813 () Bool)

(assert (=> start!96396 (= b_free!22813 (not b_next!22813))))

(declare-fun tp!80287 () Bool)

(declare-fun b_and!36311 () Bool)

(assert (=> start!96396 (= tp!80287 b_and!36311)))

(declare-fun b!1092962 () Bool)

(declare-fun res!728874 () Bool)

(declare-fun e!624301 () Bool)

(assert (=> b!1092962 (=> (not res!728874) (not e!624301))))

(declare-datatypes ((array!70585 0))(
  ( (array!70586 (arr!33960 (Array (_ BitVec 32) (_ BitVec 64))) (size!34497 (_ BitVec 32))) )
))
(declare-fun lt!488116 () array!70585)

(declare-datatypes ((List!23721 0))(
  ( (Nil!23718) (Cons!23717 (h!24935 (_ BitVec 64)) (t!33584 List!23721)) )
))
(declare-fun arrayNoDuplicates!0 (array!70585 (_ BitVec 32) List!23721) Bool)

(assert (=> b!1092962 (= res!728874 (arrayNoDuplicates!0 lt!488116 #b00000000000000000000000000000000 Nil!23718))))

(declare-fun b!1092963 () Bool)

(declare-fun res!728880 () Bool)

(declare-fun e!624300 () Bool)

(assert (=> b!1092963 (=> (not res!728880) (not e!624300))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092963 (= res!728880 (validKeyInArray!0 k0!904))))

(declare-fun b!1092964 () Bool)

(declare-fun e!624299 () Bool)

(assert (=> b!1092964 (= e!624301 (not e!624299))))

(declare-fun res!728871 () Bool)

(assert (=> b!1092964 (=> res!728871 e!624299)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1092964 (= res!728871 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40881 0))(
  ( (V!40882 (val!13464 Int)) )
))
(declare-fun minValue!831 () V!40881)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17128 0))(
  ( (tuple2!17129 (_1!8575 (_ BitVec 64)) (_2!8575 V!40881)) )
))
(declare-datatypes ((List!23722 0))(
  ( (Nil!23719) (Cons!23718 (h!24936 tuple2!17128) (t!33585 List!23722)) )
))
(declare-datatypes ((ListLongMap!15105 0))(
  ( (ListLongMap!15106 (toList!7568 List!23722)) )
))
(declare-fun lt!488120 () ListLongMap!15105)

(declare-fun zeroValue!831 () V!40881)

(declare-fun _keys!1070 () array!70585)

(declare-datatypes ((ValueCell!12698 0))(
  ( (ValueCellFull!12698 (v!16081 V!40881)) (EmptyCell!12698) )
))
(declare-datatypes ((array!70587 0))(
  ( (array!70588 (arr!33961 (Array (_ BitVec 32) ValueCell!12698)) (size!34498 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70587)

(declare-fun getCurrentListMap!4318 (array!70585 array!70587 (_ BitVec 32) (_ BitVec 32) V!40881 V!40881 (_ BitVec 32) Int) ListLongMap!15105)

(assert (=> b!1092964 (= lt!488120 (getCurrentListMap!4318 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488110 () ListLongMap!15105)

(declare-fun lt!488114 () array!70587)

(assert (=> b!1092964 (= lt!488110 (getCurrentListMap!4318 lt!488116 lt!488114 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488112 () ListLongMap!15105)

(declare-fun lt!488117 () ListLongMap!15105)

(assert (=> b!1092964 (and (= lt!488112 lt!488117) (= lt!488117 lt!488112))))

(declare-fun lt!488113 () ListLongMap!15105)

(declare-fun -!873 (ListLongMap!15105 (_ BitVec 64)) ListLongMap!15105)

(assert (=> b!1092964 (= lt!488117 (-!873 lt!488113 k0!904))))

(declare-datatypes ((Unit!35913 0))(
  ( (Unit!35914) )
))
(declare-fun lt!488118 () Unit!35913)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!147 (array!70585 array!70587 (_ BitVec 32) (_ BitVec 32) V!40881 V!40881 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35913)

(assert (=> b!1092964 (= lt!488118 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!147 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4123 (array!70585 array!70587 (_ BitVec 32) (_ BitVec 32) V!40881 V!40881 (_ BitVec 32) Int) ListLongMap!15105)

(assert (=> b!1092964 (= lt!488112 (getCurrentListMapNoExtraKeys!4123 lt!488116 lt!488114 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2244 (Int (_ BitVec 64)) V!40881)

(assert (=> b!1092964 (= lt!488114 (array!70588 (store (arr!33961 _values!874) i!650 (ValueCellFull!12698 (dynLambda!2244 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34498 _values!874)))))

(assert (=> b!1092964 (= lt!488113 (getCurrentListMapNoExtraKeys!4123 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092964 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488121 () Unit!35913)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70585 (_ BitVec 64) (_ BitVec 32)) Unit!35913)

(assert (=> b!1092964 (= lt!488121 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092965 () Bool)

(declare-fun e!624304 () Bool)

(declare-fun e!624303 () Bool)

(declare-fun mapRes!41977 () Bool)

(assert (=> b!1092965 (= e!624304 (and e!624303 mapRes!41977))))

(declare-fun condMapEmpty!41977 () Bool)

(declare-fun mapDefault!41977 () ValueCell!12698)

(assert (=> b!1092965 (= condMapEmpty!41977 (= (arr!33961 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12698)) mapDefault!41977)))))

(declare-fun b!1092966 () Bool)

(declare-fun res!728872 () Bool)

(assert (=> b!1092966 (=> (not res!728872) (not e!624300))))

(assert (=> b!1092966 (= res!728872 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23718))))

(declare-fun b!1092967 () Bool)

(declare-fun e!624298 () Bool)

(assert (=> b!1092967 (= e!624298 true)))

(declare-fun lt!488115 () ListLongMap!15105)

(declare-fun lt!488119 () ListLongMap!15105)

(assert (=> b!1092967 (= (-!873 lt!488115 k0!904) lt!488119)))

(declare-fun lt!488109 () Unit!35913)

(declare-fun addRemoveCommutativeForDiffKeys!106 (ListLongMap!15105 (_ BitVec 64) V!40881 (_ BitVec 64)) Unit!35913)

(assert (=> b!1092967 (= lt!488109 (addRemoveCommutativeForDiffKeys!106 lt!488113 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1092968 () Bool)

(declare-fun res!728879 () Bool)

(assert (=> b!1092968 (=> (not res!728879) (not e!624300))))

(assert (=> b!1092968 (= res!728879 (= (select (arr!33960 _keys!1070) i!650) k0!904))))

(declare-fun b!1092969 () Bool)

(declare-fun res!728873 () Bool)

(assert (=> b!1092969 (=> (not res!728873) (not e!624300))))

(assert (=> b!1092969 (= res!728873 (and (= (size!34498 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34497 _keys!1070) (size!34498 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092970 () Bool)

(declare-fun tp_is_empty!26815 () Bool)

(assert (=> b!1092970 (= e!624303 tp_is_empty!26815)))

(declare-fun b!1092971 () Bool)

(assert (=> b!1092971 (= e!624300 e!624301)))

(declare-fun res!728877 () Bool)

(assert (=> b!1092971 (=> (not res!728877) (not e!624301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70585 (_ BitVec 32)) Bool)

(assert (=> b!1092971 (= res!728877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488116 mask!1414))))

(assert (=> b!1092971 (= lt!488116 (array!70586 (store (arr!33960 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34497 _keys!1070)))))

(declare-fun b!1092972 () Bool)

(assert (=> b!1092972 (= e!624299 e!624298)))

(declare-fun res!728875 () Bool)

(assert (=> b!1092972 (=> res!728875 e!624298)))

(assert (=> b!1092972 (= res!728875 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1092972 (= lt!488120 lt!488115)))

(declare-fun lt!488111 () tuple2!17128)

(declare-fun +!3382 (ListLongMap!15105 tuple2!17128) ListLongMap!15105)

(assert (=> b!1092972 (= lt!488115 (+!3382 lt!488113 lt!488111))))

(assert (=> b!1092972 (= lt!488110 lt!488119)))

(assert (=> b!1092972 (= lt!488119 (+!3382 lt!488117 lt!488111))))

(assert (=> b!1092972 (= lt!488110 (+!3382 lt!488112 lt!488111))))

(assert (=> b!1092972 (= lt!488111 (tuple2!17129 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1092973 () Bool)

(declare-fun e!624305 () Bool)

(assert (=> b!1092973 (= e!624305 tp_is_empty!26815)))

(declare-fun b!1092974 () Bool)

(declare-fun res!728878 () Bool)

(assert (=> b!1092974 (=> (not res!728878) (not e!624300))))

(assert (=> b!1092974 (= res!728878 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34497 _keys!1070))))))

(declare-fun mapNonEmpty!41977 () Bool)

(declare-fun tp!80288 () Bool)

(assert (=> mapNonEmpty!41977 (= mapRes!41977 (and tp!80288 e!624305))))

(declare-fun mapKey!41977 () (_ BitVec 32))

(declare-fun mapValue!41977 () ValueCell!12698)

(declare-fun mapRest!41977 () (Array (_ BitVec 32) ValueCell!12698))

(assert (=> mapNonEmpty!41977 (= (arr!33961 _values!874) (store mapRest!41977 mapKey!41977 mapValue!41977))))

(declare-fun res!728876 () Bool)

(assert (=> start!96396 (=> (not res!728876) (not e!624300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96396 (= res!728876 (validMask!0 mask!1414))))

(assert (=> start!96396 e!624300))

(assert (=> start!96396 tp!80287))

(assert (=> start!96396 true))

(assert (=> start!96396 tp_is_empty!26815))

(declare-fun array_inv!26222 (array!70585) Bool)

(assert (=> start!96396 (array_inv!26222 _keys!1070)))

(declare-fun array_inv!26223 (array!70587) Bool)

(assert (=> start!96396 (and (array_inv!26223 _values!874) e!624304)))

(declare-fun mapIsEmpty!41977 () Bool)

(assert (=> mapIsEmpty!41977 mapRes!41977))

(declare-fun b!1092975 () Bool)

(declare-fun res!728870 () Bool)

(assert (=> b!1092975 (=> (not res!728870) (not e!624300))))

(assert (=> b!1092975 (= res!728870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96396 res!728876) b!1092969))

(assert (= (and b!1092969 res!728873) b!1092975))

(assert (= (and b!1092975 res!728870) b!1092966))

(assert (= (and b!1092966 res!728872) b!1092974))

(assert (= (and b!1092974 res!728878) b!1092963))

(assert (= (and b!1092963 res!728880) b!1092968))

(assert (= (and b!1092968 res!728879) b!1092971))

(assert (= (and b!1092971 res!728877) b!1092962))

(assert (= (and b!1092962 res!728874) b!1092964))

(assert (= (and b!1092964 (not res!728871)) b!1092972))

(assert (= (and b!1092972 (not res!728875)) b!1092967))

(assert (= (and b!1092965 condMapEmpty!41977) mapIsEmpty!41977))

(assert (= (and b!1092965 (not condMapEmpty!41977)) mapNonEmpty!41977))

(get-info :version)

(assert (= (and mapNonEmpty!41977 ((_ is ValueCellFull!12698) mapValue!41977)) b!1092973))

(assert (= (and b!1092965 ((_ is ValueCellFull!12698) mapDefault!41977)) b!1092970))

(assert (= start!96396 b!1092965))

(declare-fun b_lambda!17493 () Bool)

(assert (=> (not b_lambda!17493) (not b!1092964)))

(declare-fun t!33583 () Bool)

(declare-fun tb!7683 () Bool)

(assert (=> (and start!96396 (= defaultEntry!882 defaultEntry!882) t!33583) tb!7683))

(declare-fun result!15893 () Bool)

(assert (=> tb!7683 (= result!15893 tp_is_empty!26815)))

(assert (=> b!1092964 t!33583))

(declare-fun b_and!36313 () Bool)

(assert (= b_and!36311 (and (=> t!33583 result!15893) b_and!36313)))

(declare-fun m!1012931 () Bool)

(assert (=> b!1092964 m!1012931))

(declare-fun m!1012933 () Bool)

(assert (=> b!1092964 m!1012933))

(declare-fun m!1012935 () Bool)

(assert (=> b!1092964 m!1012935))

(declare-fun m!1012937 () Bool)

(assert (=> b!1092964 m!1012937))

(declare-fun m!1012939 () Bool)

(assert (=> b!1092964 m!1012939))

(declare-fun m!1012941 () Bool)

(assert (=> b!1092964 m!1012941))

(declare-fun m!1012943 () Bool)

(assert (=> b!1092964 m!1012943))

(declare-fun m!1012945 () Bool)

(assert (=> b!1092964 m!1012945))

(declare-fun m!1012947 () Bool)

(assert (=> b!1092964 m!1012947))

(declare-fun m!1012949 () Bool)

(assert (=> b!1092964 m!1012949))

(declare-fun m!1012951 () Bool)

(assert (=> b!1092967 m!1012951))

(declare-fun m!1012953 () Bool)

(assert (=> b!1092967 m!1012953))

(declare-fun m!1012955 () Bool)

(assert (=> b!1092971 m!1012955))

(declare-fun m!1012957 () Bool)

(assert (=> b!1092971 m!1012957))

(declare-fun m!1012959 () Bool)

(assert (=> b!1092963 m!1012959))

(declare-fun m!1012961 () Bool)

(assert (=> b!1092972 m!1012961))

(declare-fun m!1012963 () Bool)

(assert (=> b!1092972 m!1012963))

(declare-fun m!1012965 () Bool)

(assert (=> b!1092972 m!1012965))

(declare-fun m!1012967 () Bool)

(assert (=> b!1092968 m!1012967))

(declare-fun m!1012969 () Bool)

(assert (=> mapNonEmpty!41977 m!1012969))

(declare-fun m!1012971 () Bool)

(assert (=> start!96396 m!1012971))

(declare-fun m!1012973 () Bool)

(assert (=> start!96396 m!1012973))

(declare-fun m!1012975 () Bool)

(assert (=> start!96396 m!1012975))

(declare-fun m!1012977 () Bool)

(assert (=> b!1092962 m!1012977))

(declare-fun m!1012979 () Bool)

(assert (=> b!1092966 m!1012979))

(declare-fun m!1012981 () Bool)

(assert (=> b!1092975 m!1012981))

(check-sat (not b!1092972) (not b!1092964) (not b!1092962) tp_is_empty!26815 (not mapNonEmpty!41977) (not b!1092975) (not b_lambda!17493) (not b!1092971) b_and!36313 (not b!1092967) (not b!1092966) (not b!1092963) (not b_next!22813) (not start!96396))
(check-sat b_and!36313 (not b_next!22813))
