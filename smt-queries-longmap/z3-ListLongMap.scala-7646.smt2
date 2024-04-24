; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96432 () Bool)

(assert start!96432)

(declare-fun b_free!22849 () Bool)

(declare-fun b_next!22849 () Bool)

(assert (=> start!96432 (= b_free!22849 (not b_next!22849))))

(declare-fun tp!80396 () Bool)

(declare-fun b_and!36383 () Bool)

(assert (=> start!96432 (= tp!80396 b_and!36383)))

(declare-fun mapIsEmpty!42031 () Bool)

(declare-fun mapRes!42031 () Bool)

(assert (=> mapIsEmpty!42031 mapRes!42031))

(declare-fun b!1093732 () Bool)

(declare-fun res!729442 () Bool)

(declare-fun e!624712 () Bool)

(assert (=> b!1093732 (=> (not res!729442) (not e!624712))))

(declare-datatypes ((array!70651 0))(
  ( (array!70652 (arr!33993 (Array (_ BitVec 32) (_ BitVec 64))) (size!34530 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70651)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70651 (_ BitVec 32)) Bool)

(assert (=> b!1093732 (= res!729442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093733 () Bool)

(declare-fun res!729445 () Bool)

(assert (=> b!1093733 (=> (not res!729445) (not e!624712))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093733 (= res!729445 (= (select (arr!33993 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42031 () Bool)

(declare-fun tp!80395 () Bool)

(declare-fun e!624711 () Bool)

(assert (=> mapNonEmpty!42031 (= mapRes!42031 (and tp!80395 e!624711))))

(declare-datatypes ((V!40929 0))(
  ( (V!40930 (val!13482 Int)) )
))
(declare-datatypes ((ValueCell!12716 0))(
  ( (ValueCellFull!12716 (v!16099 V!40929)) (EmptyCell!12716) )
))
(declare-datatypes ((array!70653 0))(
  ( (array!70654 (arr!33994 (Array (_ BitVec 32) ValueCell!12716)) (size!34531 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70653)

(declare-fun mapValue!42031 () ValueCell!12716)

(declare-fun mapRest!42031 () (Array (_ BitVec 32) ValueCell!12716))

(declare-fun mapKey!42031 () (_ BitVec 32))

(assert (=> mapNonEmpty!42031 (= (arr!33994 _values!874) (store mapRest!42031 mapKey!42031 mapValue!42031))))

(declare-fun res!729449 () Bool)

(assert (=> start!96432 (=> (not res!729449) (not e!624712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96432 (= res!729449 (validMask!0 mask!1414))))

(assert (=> start!96432 e!624712))

(assert (=> start!96432 tp!80396))

(assert (=> start!96432 true))

(declare-fun tp_is_empty!26851 () Bool)

(assert (=> start!96432 tp_is_empty!26851))

(declare-fun array_inv!26244 (array!70651) Bool)

(assert (=> start!96432 (array_inv!26244 _keys!1070)))

(declare-fun e!624713 () Bool)

(declare-fun array_inv!26245 (array!70653) Bool)

(assert (=> start!96432 (and (array_inv!26245 _values!874) e!624713)))

(declare-fun b!1093734 () Bool)

(declare-fun res!729448 () Bool)

(assert (=> b!1093734 (=> (not res!729448) (not e!624712))))

(assert (=> b!1093734 (= res!729448 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34530 _keys!1070))))))

(declare-fun b!1093735 () Bool)

(declare-fun res!729444 () Bool)

(assert (=> b!1093735 (=> (not res!729444) (not e!624712))))

(declare-datatypes ((List!23747 0))(
  ( (Nil!23744) (Cons!23743 (h!24961 (_ BitVec 64)) (t!33646 List!23747)) )
))
(declare-fun arrayNoDuplicates!0 (array!70651 (_ BitVec 32) List!23747) Bool)

(assert (=> b!1093735 (= res!729444 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23744))))

(declare-fun b!1093736 () Bool)

(declare-fun e!624708 () Bool)

(assert (=> b!1093736 (= e!624708 tp_is_empty!26851)))

(declare-fun b!1093737 () Bool)

(declare-fun res!729443 () Bool)

(assert (=> b!1093737 (=> (not res!729443) (not e!624712))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093737 (= res!729443 (and (= (size!34531 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34530 _keys!1070) (size!34531 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093738 () Bool)

(declare-fun res!729447 () Bool)

(declare-fun e!624710 () Bool)

(assert (=> b!1093738 (=> (not res!729447) (not e!624710))))

(declare-fun lt!488773 () array!70651)

(assert (=> b!1093738 (= res!729447 (arrayNoDuplicates!0 lt!488773 #b00000000000000000000000000000000 Nil!23744))))

(declare-fun b!1093739 () Bool)

(declare-fun res!729446 () Bool)

(assert (=> b!1093739 (=> (not res!729446) (not e!624712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093739 (= res!729446 (validKeyInArray!0 k0!904))))

(declare-fun b!1093740 () Bool)

(assert (=> b!1093740 (= e!624713 (and e!624708 mapRes!42031))))

(declare-fun condMapEmpty!42031 () Bool)

(declare-fun mapDefault!42031 () ValueCell!12716)

(assert (=> b!1093740 (= condMapEmpty!42031 (= (arr!33994 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12716)) mapDefault!42031)))))

(declare-fun b!1093741 () Bool)

(assert (=> b!1093741 (= e!624711 tp_is_empty!26851)))

(declare-fun b!1093742 () Bool)

(assert (=> b!1093742 (= e!624710 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40929)

(declare-fun zeroValue!831 () V!40929)

(declare-datatypes ((tuple2!17156 0))(
  ( (tuple2!17157 (_1!8589 (_ BitVec 64)) (_2!8589 V!40929)) )
))
(declare-datatypes ((List!23748 0))(
  ( (Nil!23745) (Cons!23744 (h!24962 tuple2!17156) (t!33647 List!23748)) )
))
(declare-datatypes ((ListLongMap!15133 0))(
  ( (ListLongMap!15134 (toList!7582 List!23748)) )
))
(declare-fun lt!488772 () ListLongMap!15133)

(declare-fun getCurrentListMap!4330 (array!70651 array!70653 (_ BitVec 32) (_ BitVec 32) V!40929 V!40929 (_ BitVec 32) Int) ListLongMap!15133)

(assert (=> b!1093742 (= lt!488772 (getCurrentListMap!4330 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488770 () ListLongMap!15133)

(declare-fun lt!488768 () array!70653)

(assert (=> b!1093742 (= lt!488770 (getCurrentListMap!4330 lt!488773 lt!488768 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488769 () ListLongMap!15133)

(declare-fun lt!488767 () ListLongMap!15133)

(assert (=> b!1093742 (and (= lt!488769 lt!488767) (= lt!488767 lt!488769))))

(declare-fun lt!488771 () ListLongMap!15133)

(declare-fun -!887 (ListLongMap!15133 (_ BitVec 64)) ListLongMap!15133)

(assert (=> b!1093742 (= lt!488767 (-!887 lt!488771 k0!904))))

(declare-datatypes ((Unit!35941 0))(
  ( (Unit!35942) )
))
(declare-fun lt!488775 () Unit!35941)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!159 (array!70651 array!70653 (_ BitVec 32) (_ BitVec 32) V!40929 V!40929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35941)

(assert (=> b!1093742 (= lt!488775 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!159 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4135 (array!70651 array!70653 (_ BitVec 32) (_ BitVec 32) V!40929 V!40929 (_ BitVec 32) Int) ListLongMap!15133)

(assert (=> b!1093742 (= lt!488769 (getCurrentListMapNoExtraKeys!4135 lt!488773 lt!488768 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2256 (Int (_ BitVec 64)) V!40929)

(assert (=> b!1093742 (= lt!488768 (array!70654 (store (arr!33994 _values!874) i!650 (ValueCellFull!12716 (dynLambda!2256 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34531 _values!874)))))

(assert (=> b!1093742 (= lt!488771 (getCurrentListMapNoExtraKeys!4135 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093742 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488774 () Unit!35941)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70651 (_ BitVec 64) (_ BitVec 32)) Unit!35941)

(assert (=> b!1093742 (= lt!488774 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093743 () Bool)

(assert (=> b!1093743 (= e!624712 e!624710)))

(declare-fun res!729450 () Bool)

(assert (=> b!1093743 (=> (not res!729450) (not e!624710))))

(assert (=> b!1093743 (= res!729450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488773 mask!1414))))

(assert (=> b!1093743 (= lt!488773 (array!70652 (store (arr!33993 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34530 _keys!1070)))))

(assert (= (and start!96432 res!729449) b!1093737))

(assert (= (and b!1093737 res!729443) b!1093732))

(assert (= (and b!1093732 res!729442) b!1093735))

(assert (= (and b!1093735 res!729444) b!1093734))

(assert (= (and b!1093734 res!729448) b!1093739))

(assert (= (and b!1093739 res!729446) b!1093733))

(assert (= (and b!1093733 res!729445) b!1093743))

(assert (= (and b!1093743 res!729450) b!1093738))

(assert (= (and b!1093738 res!729447) b!1093742))

(assert (= (and b!1093740 condMapEmpty!42031) mapIsEmpty!42031))

(assert (= (and b!1093740 (not condMapEmpty!42031)) mapNonEmpty!42031))

(get-info :version)

(assert (= (and mapNonEmpty!42031 ((_ is ValueCellFull!12716) mapValue!42031)) b!1093741))

(assert (= (and b!1093740 ((_ is ValueCellFull!12716) mapDefault!42031)) b!1093736))

(assert (= start!96432 b!1093740))

(declare-fun b_lambda!17529 () Bool)

(assert (=> (not b_lambda!17529) (not b!1093742)))

(declare-fun t!33645 () Bool)

(declare-fun tb!7719 () Bool)

(assert (=> (and start!96432 (= defaultEntry!882 defaultEntry!882) t!33645) tb!7719))

(declare-fun result!15965 () Bool)

(assert (=> tb!7719 (= result!15965 tp_is_empty!26851)))

(assert (=> b!1093742 t!33645))

(declare-fun b_and!36385 () Bool)

(assert (= b_and!36383 (and (=> t!33645 result!15965) b_and!36385)))

(declare-fun m!1013837 () Bool)

(assert (=> b!1093739 m!1013837))

(declare-fun m!1013839 () Bool)

(assert (=> b!1093733 m!1013839))

(declare-fun m!1013841 () Bool)

(assert (=> b!1093732 m!1013841))

(declare-fun m!1013843 () Bool)

(assert (=> b!1093743 m!1013843))

(declare-fun m!1013845 () Bool)

(assert (=> b!1093743 m!1013845))

(declare-fun m!1013847 () Bool)

(assert (=> b!1093735 m!1013847))

(declare-fun m!1013849 () Bool)

(assert (=> start!96432 m!1013849))

(declare-fun m!1013851 () Bool)

(assert (=> start!96432 m!1013851))

(declare-fun m!1013853 () Bool)

(assert (=> start!96432 m!1013853))

(declare-fun m!1013855 () Bool)

(assert (=> b!1093742 m!1013855))

(declare-fun m!1013857 () Bool)

(assert (=> b!1093742 m!1013857))

(declare-fun m!1013859 () Bool)

(assert (=> b!1093742 m!1013859))

(declare-fun m!1013861 () Bool)

(assert (=> b!1093742 m!1013861))

(declare-fun m!1013863 () Bool)

(assert (=> b!1093742 m!1013863))

(declare-fun m!1013865 () Bool)

(assert (=> b!1093742 m!1013865))

(declare-fun m!1013867 () Bool)

(assert (=> b!1093742 m!1013867))

(declare-fun m!1013869 () Bool)

(assert (=> b!1093742 m!1013869))

(declare-fun m!1013871 () Bool)

(assert (=> b!1093742 m!1013871))

(declare-fun m!1013873 () Bool)

(assert (=> b!1093742 m!1013873))

(declare-fun m!1013875 () Bool)

(assert (=> b!1093738 m!1013875))

(declare-fun m!1013877 () Bool)

(assert (=> mapNonEmpty!42031 m!1013877))

(check-sat (not b!1093743) (not start!96432) (not b!1093739) (not b!1093732) (not b!1093735) (not mapNonEmpty!42031) b_and!36385 (not b_next!22849) tp_is_empty!26851 (not b_lambda!17529) (not b!1093742) (not b!1093738))
(check-sat b_and!36385 (not b_next!22849))
