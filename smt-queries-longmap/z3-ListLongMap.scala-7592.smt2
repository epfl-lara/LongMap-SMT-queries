; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96108 () Bool)

(assert start!96108)

(declare-fun b_free!22525 () Bool)

(declare-fun b_next!22525 () Bool)

(assert (=> start!96108 (= b_free!22525 (not b_next!22525))))

(declare-fun tp!79424 () Bool)

(declare-fun b_and!35735 () Bool)

(assert (=> start!96108 (= tp!79424 b_and!35735)))

(declare-fun b!1086608 () Bool)

(declare-fun e!620847 () Bool)

(declare-fun tp_is_empty!26527 () Bool)

(assert (=> b!1086608 (= e!620847 tp_is_empty!26527)))

(declare-fun b!1086609 () Bool)

(declare-fun res!724103 () Bool)

(declare-fun e!620846 () Bool)

(assert (=> b!1086609 (=> (not res!724103) (not e!620846))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086609 (= res!724103 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41545 () Bool)

(declare-fun mapRes!41545 () Bool)

(declare-fun tp!79423 () Bool)

(declare-fun e!620845 () Bool)

(assert (=> mapNonEmpty!41545 (= mapRes!41545 (and tp!79423 e!620845))))

(declare-datatypes ((V!40497 0))(
  ( (V!40498 (val!13320 Int)) )
))
(declare-datatypes ((ValueCell!12554 0))(
  ( (ValueCellFull!12554 (v!15937 V!40497)) (EmptyCell!12554) )
))
(declare-datatypes ((array!70029 0))(
  ( (array!70030 (arr!33682 (Array (_ BitVec 32) ValueCell!12554)) (size!34219 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70029)

(declare-fun mapRest!41545 () (Array (_ BitVec 32) ValueCell!12554))

(declare-fun mapValue!41545 () ValueCell!12554)

(declare-fun mapKey!41545 () (_ BitVec 32))

(assert (=> mapNonEmpty!41545 (= (arr!33682 _values!874) (store mapRest!41545 mapKey!41545 mapValue!41545))))

(declare-fun mapIsEmpty!41545 () Bool)

(assert (=> mapIsEmpty!41545 mapRes!41545))

(declare-fun b!1086610 () Bool)

(declare-fun res!724104 () Bool)

(assert (=> b!1086610 (=> (not res!724104) (not e!620846))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70031 0))(
  ( (array!70032 (arr!33683 (Array (_ BitVec 32) (_ BitVec 64))) (size!34220 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70031)

(assert (=> b!1086610 (= res!724104 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34220 _keys!1070))))))

(declare-fun b!1086611 () Bool)

(declare-fun res!724102 () Bool)

(assert (=> b!1086611 (=> (not res!724102) (not e!620846))))

(declare-datatypes ((List!23495 0))(
  ( (Nil!23492) (Cons!23491 (h!24709 (_ BitVec 64)) (t!33070 List!23495)) )
))
(declare-fun arrayNoDuplicates!0 (array!70031 (_ BitVec 32) List!23495) Bool)

(assert (=> b!1086611 (= res!724102 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23492))))

(declare-fun b!1086612 () Bool)

(declare-fun res!724106 () Bool)

(declare-fun e!620844 () Bool)

(assert (=> b!1086612 (=> (not res!724106) (not e!620844))))

(declare-fun lt!482025 () array!70031)

(assert (=> b!1086612 (= res!724106 (arrayNoDuplicates!0 lt!482025 #b00000000000000000000000000000000 Nil!23492))))

(declare-fun b!1086613 () Bool)

(declare-fun e!620842 () Bool)

(assert (=> b!1086613 (= e!620842 (and e!620847 mapRes!41545))))

(declare-fun condMapEmpty!41545 () Bool)

(declare-fun mapDefault!41545 () ValueCell!12554)

(assert (=> b!1086613 (= condMapEmpty!41545 (= (arr!33682 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12554)) mapDefault!41545)))))

(declare-fun b!1086614 () Bool)

(declare-fun e!620843 () Bool)

(declare-fun e!620849 () Bool)

(assert (=> b!1086614 (= e!620843 e!620849)))

(declare-fun res!724101 () Bool)

(assert (=> b!1086614 (=> res!724101 e!620849)))

(assert (=> b!1086614 (= res!724101 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!16896 0))(
  ( (tuple2!16897 (_1!8459 (_ BitVec 64)) (_2!8459 V!40497)) )
))
(declare-datatypes ((List!23496 0))(
  ( (Nil!23493) (Cons!23492 (h!24710 tuple2!16896) (t!33071 List!23496)) )
))
(declare-datatypes ((ListLongMap!14873 0))(
  ( (ListLongMap!14874 (toList!7452 List!23496)) )
))
(declare-fun lt!482027 () ListLongMap!14873)

(declare-fun lt!482016 () ListLongMap!14873)

(assert (=> b!1086614 (= lt!482027 lt!482016)))

(declare-fun lt!482021 () ListLongMap!14873)

(declare-fun -!764 (ListLongMap!14873 (_ BitVec 64)) ListLongMap!14873)

(assert (=> b!1086614 (= lt!482027 (-!764 lt!482021 k0!904))))

(declare-datatypes ((Unit!35695 0))(
  ( (Unit!35696) )
))
(declare-fun lt!482028 () Unit!35695)

(declare-fun lt!482020 () ListLongMap!14873)

(declare-fun zeroValue!831 () V!40497)

(declare-fun addRemoveCommutativeForDiffKeys!11 (ListLongMap!14873 (_ BitVec 64) V!40497 (_ BitVec 64)) Unit!35695)

(assert (=> b!1086614 (= lt!482028 (addRemoveCommutativeForDiffKeys!11 lt!482020 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!482022 () ListLongMap!14873)

(declare-fun lt!482019 () tuple2!16896)

(declare-fun +!3277 (ListLongMap!14873 tuple2!16896) ListLongMap!14873)

(assert (=> b!1086614 (= lt!482022 (+!3277 lt!482016 lt!482019))))

(declare-fun lt!482017 () ListLongMap!14873)

(declare-fun lt!482015 () tuple2!16896)

(assert (=> b!1086614 (= lt!482016 (+!3277 lt!482017 lt!482015))))

(declare-fun lt!482031 () ListLongMap!14873)

(declare-fun lt!482023 () ListLongMap!14873)

(assert (=> b!1086614 (= lt!482031 lt!482023)))

(assert (=> b!1086614 (= lt!482023 (+!3277 lt!482021 lt!482019))))

(assert (=> b!1086614 (= lt!482021 (+!3277 lt!482020 lt!482015))))

(declare-fun lt!482029 () ListLongMap!14873)

(assert (=> b!1086614 (= lt!482022 (+!3277 (+!3277 lt!482029 lt!482015) lt!482019))))

(declare-fun minValue!831 () V!40497)

(assert (=> b!1086614 (= lt!482019 (tuple2!16897 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086614 (= lt!482015 (tuple2!16897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086615 () Bool)

(assert (=> b!1086615 (= e!620845 tp_is_empty!26527)))

(declare-fun b!1086616 () Bool)

(assert (=> b!1086616 (= e!620849 true)))

(assert (=> b!1086616 (= (-!764 lt!482023 k0!904) (+!3277 lt!482027 lt!482019))))

(declare-fun lt!482026 () Unit!35695)

(assert (=> b!1086616 (= lt!482026 (addRemoveCommutativeForDiffKeys!11 lt!482021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1086618 () Bool)

(declare-fun res!724108 () Bool)

(assert (=> b!1086618 (=> (not res!724108) (not e!620846))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70031 (_ BitVec 32)) Bool)

(assert (=> b!1086618 (= res!724108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086619 () Bool)

(declare-fun res!724105 () Bool)

(assert (=> b!1086619 (=> (not res!724105) (not e!620846))))

(assert (=> b!1086619 (= res!724105 (= (select (arr!33683 _keys!1070) i!650) k0!904))))

(declare-fun b!1086620 () Bool)

(assert (=> b!1086620 (= e!620844 (not e!620843))))

(declare-fun res!724110 () Bool)

(assert (=> b!1086620 (=> res!724110 e!620843)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086620 (= res!724110 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4222 (array!70031 array!70029 (_ BitVec 32) (_ BitVec 32) V!40497 V!40497 (_ BitVec 32) Int) ListLongMap!14873)

(assert (=> b!1086620 (= lt!482031 (getCurrentListMap!4222 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482024 () array!70029)

(assert (=> b!1086620 (= lt!482022 (getCurrentListMap!4222 lt!482025 lt!482024 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1086620 (and (= lt!482029 lt!482017) (= lt!482017 lt!482029))))

(assert (=> b!1086620 (= lt!482017 (-!764 lt!482020 k0!904))))

(declare-fun lt!482030 () Unit!35695)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!51 (array!70031 array!70029 (_ BitVec 32) (_ BitVec 32) V!40497 V!40497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35695)

(assert (=> b!1086620 (= lt!482030 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!51 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4027 (array!70031 array!70029 (_ BitVec 32) (_ BitVec 32) V!40497 V!40497 (_ BitVec 32) Int) ListLongMap!14873)

(assert (=> b!1086620 (= lt!482029 (getCurrentListMapNoExtraKeys!4027 lt!482025 lt!482024 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2148 (Int (_ BitVec 64)) V!40497)

(assert (=> b!1086620 (= lt!482024 (array!70030 (store (arr!33682 _values!874) i!650 (ValueCellFull!12554 (dynLambda!2148 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34219 _values!874)))))

(assert (=> b!1086620 (= lt!482020 (getCurrentListMapNoExtraKeys!4027 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086620 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482018 () Unit!35695)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70031 (_ BitVec 64) (_ BitVec 32)) Unit!35695)

(assert (=> b!1086620 (= lt!482018 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086621 () Bool)

(assert (=> b!1086621 (= e!620846 e!620844)))

(declare-fun res!724107 () Bool)

(assert (=> b!1086621 (=> (not res!724107) (not e!620844))))

(assert (=> b!1086621 (= res!724107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482025 mask!1414))))

(assert (=> b!1086621 (= lt!482025 (array!70032 (store (arr!33683 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34220 _keys!1070)))))

(declare-fun b!1086617 () Bool)

(declare-fun res!724100 () Bool)

(assert (=> b!1086617 (=> (not res!724100) (not e!620846))))

(assert (=> b!1086617 (= res!724100 (and (= (size!34219 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34220 _keys!1070) (size!34219 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!724109 () Bool)

(assert (=> start!96108 (=> (not res!724109) (not e!620846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96108 (= res!724109 (validMask!0 mask!1414))))

(assert (=> start!96108 e!620846))

(assert (=> start!96108 tp!79424))

(assert (=> start!96108 true))

(assert (=> start!96108 tp_is_empty!26527))

(declare-fun array_inv!26038 (array!70031) Bool)

(assert (=> start!96108 (array_inv!26038 _keys!1070)))

(declare-fun array_inv!26039 (array!70029) Bool)

(assert (=> start!96108 (and (array_inv!26039 _values!874) e!620842)))

(assert (= (and start!96108 res!724109) b!1086617))

(assert (= (and b!1086617 res!724100) b!1086618))

(assert (= (and b!1086618 res!724108) b!1086611))

(assert (= (and b!1086611 res!724102) b!1086610))

(assert (= (and b!1086610 res!724104) b!1086609))

(assert (= (and b!1086609 res!724103) b!1086619))

(assert (= (and b!1086619 res!724105) b!1086621))

(assert (= (and b!1086621 res!724107) b!1086612))

(assert (= (and b!1086612 res!724106) b!1086620))

(assert (= (and b!1086620 (not res!724110)) b!1086614))

(assert (= (and b!1086614 (not res!724101)) b!1086616))

(assert (= (and b!1086613 condMapEmpty!41545) mapIsEmpty!41545))

(assert (= (and b!1086613 (not condMapEmpty!41545)) mapNonEmpty!41545))

(get-info :version)

(assert (= (and mapNonEmpty!41545 ((_ is ValueCellFull!12554) mapValue!41545)) b!1086615))

(assert (= (and b!1086613 ((_ is ValueCellFull!12554) mapDefault!41545)) b!1086608))

(assert (= start!96108 b!1086613))

(declare-fun b_lambda!17205 () Bool)

(assert (=> (not b_lambda!17205) (not b!1086620)))

(declare-fun t!33069 () Bool)

(declare-fun tb!7395 () Bool)

(assert (=> (and start!96108 (= defaultEntry!882 defaultEntry!882) t!33069) tb!7395))

(declare-fun result!15317 () Bool)

(assert (=> tb!7395 (= result!15317 tp_is_empty!26527)))

(assert (=> b!1086620 t!33069))

(declare-fun b_and!35737 () Bool)

(assert (= b_and!35735 (and (=> t!33069 result!15317) b_and!35737)))

(declare-fun m!1004927 () Bool)

(assert (=> b!1086620 m!1004927))

(declare-fun m!1004929 () Bool)

(assert (=> b!1086620 m!1004929))

(declare-fun m!1004931 () Bool)

(assert (=> b!1086620 m!1004931))

(declare-fun m!1004933 () Bool)

(assert (=> b!1086620 m!1004933))

(declare-fun m!1004935 () Bool)

(assert (=> b!1086620 m!1004935))

(declare-fun m!1004937 () Bool)

(assert (=> b!1086620 m!1004937))

(declare-fun m!1004939 () Bool)

(assert (=> b!1086620 m!1004939))

(declare-fun m!1004941 () Bool)

(assert (=> b!1086620 m!1004941))

(declare-fun m!1004943 () Bool)

(assert (=> b!1086620 m!1004943))

(declare-fun m!1004945 () Bool)

(assert (=> b!1086620 m!1004945))

(declare-fun m!1004947 () Bool)

(assert (=> b!1086611 m!1004947))

(declare-fun m!1004949 () Bool)

(assert (=> b!1086612 m!1004949))

(declare-fun m!1004951 () Bool)

(assert (=> b!1086609 m!1004951))

(declare-fun m!1004953 () Bool)

(assert (=> b!1086618 m!1004953))

(declare-fun m!1004955 () Bool)

(assert (=> start!96108 m!1004955))

(declare-fun m!1004957 () Bool)

(assert (=> start!96108 m!1004957))

(declare-fun m!1004959 () Bool)

(assert (=> start!96108 m!1004959))

(declare-fun m!1004961 () Bool)

(assert (=> b!1086619 m!1004961))

(declare-fun m!1004963 () Bool)

(assert (=> mapNonEmpty!41545 m!1004963))

(declare-fun m!1004965 () Bool)

(assert (=> b!1086621 m!1004965))

(declare-fun m!1004967 () Bool)

(assert (=> b!1086621 m!1004967))

(declare-fun m!1004969 () Bool)

(assert (=> b!1086614 m!1004969))

(declare-fun m!1004971 () Bool)

(assert (=> b!1086614 m!1004971))

(declare-fun m!1004973 () Bool)

(assert (=> b!1086614 m!1004973))

(declare-fun m!1004975 () Bool)

(assert (=> b!1086614 m!1004975))

(declare-fun m!1004977 () Bool)

(assert (=> b!1086614 m!1004977))

(declare-fun m!1004979 () Bool)

(assert (=> b!1086614 m!1004979))

(declare-fun m!1004981 () Bool)

(assert (=> b!1086614 m!1004981))

(assert (=> b!1086614 m!1004975))

(declare-fun m!1004983 () Bool)

(assert (=> b!1086614 m!1004983))

(declare-fun m!1004985 () Bool)

(assert (=> b!1086616 m!1004985))

(declare-fun m!1004987 () Bool)

(assert (=> b!1086616 m!1004987))

(declare-fun m!1004989 () Bool)

(assert (=> b!1086616 m!1004989))

(check-sat (not b!1086620) (not b!1086614) tp_is_empty!26527 (not b!1086609) (not b!1086611) (not b_next!22525) (not mapNonEmpty!41545) (not b!1086616) (not b!1086612) (not b!1086618) (not b_lambda!17205) b_and!35737 (not start!96108) (not b!1086621))
(check-sat b_and!35737 (not b_next!22525))
