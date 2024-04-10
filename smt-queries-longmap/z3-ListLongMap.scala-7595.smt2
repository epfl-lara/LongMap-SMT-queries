; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95892 () Bool)

(assert start!95892)

(declare-fun b_free!22545 () Bool)

(declare-fun b_next!22545 () Bool)

(assert (=> start!95892 (= b_free!22545 (not b_next!22545))))

(declare-fun tp!79484 () Bool)

(declare-fun b_and!35765 () Bool)

(assert (=> start!95892 (= tp!79484 b_and!35765)))

(declare-fun b!1085721 () Bool)

(declare-fun res!723913 () Bool)

(declare-fun e!620232 () Bool)

(assert (=> b!1085721 (=> (not res!723913) (not e!620232))))

(declare-datatypes ((array!70029 0))(
  ( (array!70030 (arr!33688 (Array (_ BitVec 32) (_ BitVec 64))) (size!34224 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70029)

(declare-datatypes ((List!23493 0))(
  ( (Nil!23490) (Cons!23489 (h!24698 (_ BitVec 64)) (t!33096 List!23493)) )
))
(declare-fun arrayNoDuplicates!0 (array!70029 (_ BitVec 32) List!23493) Bool)

(assert (=> b!1085721 (= res!723913 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23490))))

(declare-fun b!1085722 () Bool)

(declare-fun res!723908 () Bool)

(declare-fun e!620231 () Bool)

(assert (=> b!1085722 (=> (not res!723908) (not e!620231))))

(declare-fun lt!482017 () array!70029)

(assert (=> b!1085722 (= res!723908 (arrayNoDuplicates!0 lt!482017 #b00000000000000000000000000000000 Nil!23490))))

(declare-fun b!1085723 () Bool)

(declare-fun res!723918 () Bool)

(assert (=> b!1085723 (=> (not res!723918) (not e!620232))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085723 (= res!723918 (= (select (arr!33688 _keys!1070) i!650) k0!904))))

(declare-fun b!1085724 () Bool)

(declare-fun res!723911 () Bool)

(assert (=> b!1085724 (=> (not res!723911) (not e!620232))))

(assert (=> b!1085724 (= res!723911 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34224 _keys!1070))))))

(declare-fun b!1085725 () Bool)

(declare-fun e!620234 () Bool)

(declare-fun e!620230 () Bool)

(assert (=> b!1085725 (= e!620234 e!620230)))

(declare-fun res!723909 () Bool)

(assert (=> b!1085725 (=> res!723909 e!620230)))

(assert (=> b!1085725 (= res!723909 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40523 0))(
  ( (V!40524 (val!13330 Int)) )
))
(declare-datatypes ((tuple2!16904 0))(
  ( (tuple2!16905 (_1!8463 (_ BitVec 64)) (_2!8463 V!40523)) )
))
(declare-datatypes ((List!23494 0))(
  ( (Nil!23491) (Cons!23490 (h!24699 tuple2!16904) (t!33097 List!23494)) )
))
(declare-datatypes ((ListLongMap!14873 0))(
  ( (ListLongMap!14874 (toList!7452 List!23494)) )
))
(declare-fun lt!482022 () ListLongMap!14873)

(declare-fun lt!482019 () ListLongMap!14873)

(assert (=> b!1085725 (= lt!482022 lt!482019)))

(declare-fun lt!482026 () ListLongMap!14873)

(declare-fun -!778 (ListLongMap!14873 (_ BitVec 64)) ListLongMap!14873)

(assert (=> b!1085725 (= lt!482022 (-!778 lt!482026 k0!904))))

(declare-datatypes ((Unit!35722 0))(
  ( (Unit!35723) )
))
(declare-fun lt!482015 () Unit!35722)

(declare-fun zeroValue!831 () V!40523)

(declare-fun lt!482018 () ListLongMap!14873)

(declare-fun addRemoveCommutativeForDiffKeys!16 (ListLongMap!14873 (_ BitVec 64) V!40523 (_ BitVec 64)) Unit!35722)

(assert (=> b!1085725 (= lt!482015 (addRemoveCommutativeForDiffKeys!16 lt!482018 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!482016 () ListLongMap!14873)

(declare-fun lt!482010 () tuple2!16904)

(declare-fun +!3260 (ListLongMap!14873 tuple2!16904) ListLongMap!14873)

(assert (=> b!1085725 (= lt!482016 (+!3260 lt!482019 lt!482010))))

(declare-fun lt!482020 () ListLongMap!14873)

(declare-fun lt!482012 () tuple2!16904)

(assert (=> b!1085725 (= lt!482019 (+!3260 lt!482020 lt!482012))))

(declare-fun lt!482023 () ListLongMap!14873)

(declare-fun lt!482021 () ListLongMap!14873)

(assert (=> b!1085725 (= lt!482023 lt!482021)))

(assert (=> b!1085725 (= lt!482021 (+!3260 lt!482026 lt!482010))))

(assert (=> b!1085725 (= lt!482026 (+!3260 lt!482018 lt!482012))))

(declare-fun lt!482024 () ListLongMap!14873)

(assert (=> b!1085725 (= lt!482016 (+!3260 (+!3260 lt!482024 lt!482012) lt!482010))))

(declare-fun minValue!831 () V!40523)

(assert (=> b!1085725 (= lt!482010 (tuple2!16905 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085725 (= lt!482012 (tuple2!16905 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085727 () Bool)

(declare-fun res!723914 () Bool)

(assert (=> b!1085727 (=> (not res!723914) (not e!620232))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70029 (_ BitVec 32)) Bool)

(assert (=> b!1085727 (= res!723914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085728 () Bool)

(assert (=> b!1085728 (= e!620231 (not e!620234))))

(declare-fun res!723917 () Bool)

(assert (=> b!1085728 (=> res!723917 e!620234)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085728 (= res!723917 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((ValueCell!12564 0))(
  ( (ValueCellFull!12564 (v!15951 V!40523)) (EmptyCell!12564) )
))
(declare-datatypes ((array!70031 0))(
  ( (array!70032 (arr!33689 (Array (_ BitVec 32) ValueCell!12564)) (size!34225 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70031)

(declare-fun getCurrentListMap!4236 (array!70029 array!70031 (_ BitVec 32) (_ BitVec 32) V!40523 V!40523 (_ BitVec 32) Int) ListLongMap!14873)

(assert (=> b!1085728 (= lt!482023 (getCurrentListMap!4236 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482025 () array!70031)

(assert (=> b!1085728 (= lt!482016 (getCurrentListMap!4236 lt!482017 lt!482025 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1085728 (and (= lt!482024 lt!482020) (= lt!482020 lt!482024))))

(assert (=> b!1085728 (= lt!482020 (-!778 lt!482018 k0!904))))

(declare-fun lt!482014 () Unit!35722)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!55 (array!70029 array!70031 (_ BitVec 32) (_ BitVec 32) V!40523 V!40523 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35722)

(assert (=> b!1085728 (= lt!482014 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!55 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3996 (array!70029 array!70031 (_ BitVec 32) (_ BitVec 32) V!40523 V!40523 (_ BitVec 32) Int) ListLongMap!14873)

(assert (=> b!1085728 (= lt!482024 (getCurrentListMapNoExtraKeys!3996 lt!482017 lt!482025 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2133 (Int (_ BitVec 64)) V!40523)

(assert (=> b!1085728 (= lt!482025 (array!70032 (store (arr!33689 _values!874) i!650 (ValueCellFull!12564 (dynLambda!2133 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34225 _values!874)))))

(assert (=> b!1085728 (= lt!482018 (getCurrentListMapNoExtraKeys!3996 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085728 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482013 () Unit!35722)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70029 (_ BitVec 64) (_ BitVec 32)) Unit!35722)

(assert (=> b!1085728 (= lt!482013 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085729 () Bool)

(declare-fun e!620227 () Bool)

(declare-fun e!620229 () Bool)

(declare-fun mapRes!41575 () Bool)

(assert (=> b!1085729 (= e!620227 (and e!620229 mapRes!41575))))

(declare-fun condMapEmpty!41575 () Bool)

(declare-fun mapDefault!41575 () ValueCell!12564)

(assert (=> b!1085729 (= condMapEmpty!41575 (= (arr!33689 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12564)) mapDefault!41575)))))

(declare-fun mapIsEmpty!41575 () Bool)

(assert (=> mapIsEmpty!41575 mapRes!41575))

(declare-fun mapNonEmpty!41575 () Bool)

(declare-fun tp!79483 () Bool)

(declare-fun e!620233 () Bool)

(assert (=> mapNonEmpty!41575 (= mapRes!41575 (and tp!79483 e!620233))))

(declare-fun mapValue!41575 () ValueCell!12564)

(declare-fun mapKey!41575 () (_ BitVec 32))

(declare-fun mapRest!41575 () (Array (_ BitVec 32) ValueCell!12564))

(assert (=> mapNonEmpty!41575 (= (arr!33689 _values!874) (store mapRest!41575 mapKey!41575 mapValue!41575))))

(declare-fun b!1085730 () Bool)

(assert (=> b!1085730 (= e!620230 true)))

(assert (=> b!1085730 (= (-!778 lt!482021 k0!904) (+!3260 lt!482022 lt!482010))))

(declare-fun lt!482011 () Unit!35722)

(assert (=> b!1085730 (= lt!482011 (addRemoveCommutativeForDiffKeys!16 lt!482026 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1085731 () Bool)

(assert (=> b!1085731 (= e!620232 e!620231)))

(declare-fun res!723912 () Bool)

(assert (=> b!1085731 (=> (not res!723912) (not e!620231))))

(assert (=> b!1085731 (= res!723912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482017 mask!1414))))

(assert (=> b!1085731 (= lt!482017 (array!70030 (store (arr!33688 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34224 _keys!1070)))))

(declare-fun b!1085732 () Bool)

(declare-fun tp_is_empty!26547 () Bool)

(assert (=> b!1085732 (= e!620229 tp_is_empty!26547)))

(declare-fun res!723910 () Bool)

(assert (=> start!95892 (=> (not res!723910) (not e!620232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95892 (= res!723910 (validMask!0 mask!1414))))

(assert (=> start!95892 e!620232))

(assert (=> start!95892 tp!79484))

(assert (=> start!95892 true))

(assert (=> start!95892 tp_is_empty!26547))

(declare-fun array_inv!25998 (array!70029) Bool)

(assert (=> start!95892 (array_inv!25998 _keys!1070)))

(declare-fun array_inv!25999 (array!70031) Bool)

(assert (=> start!95892 (and (array_inv!25999 _values!874) e!620227)))

(declare-fun b!1085726 () Bool)

(declare-fun res!723916 () Bool)

(assert (=> b!1085726 (=> (not res!723916) (not e!620232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085726 (= res!723916 (validKeyInArray!0 k0!904))))

(declare-fun b!1085733 () Bool)

(declare-fun res!723915 () Bool)

(assert (=> b!1085733 (=> (not res!723915) (not e!620232))))

(assert (=> b!1085733 (= res!723915 (and (= (size!34225 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34224 _keys!1070) (size!34225 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085734 () Bool)

(assert (=> b!1085734 (= e!620233 tp_is_empty!26547)))

(assert (= (and start!95892 res!723910) b!1085733))

(assert (= (and b!1085733 res!723915) b!1085727))

(assert (= (and b!1085727 res!723914) b!1085721))

(assert (= (and b!1085721 res!723913) b!1085724))

(assert (= (and b!1085724 res!723911) b!1085726))

(assert (= (and b!1085726 res!723916) b!1085723))

(assert (= (and b!1085723 res!723918) b!1085731))

(assert (= (and b!1085731 res!723912) b!1085722))

(assert (= (and b!1085722 res!723908) b!1085728))

(assert (= (and b!1085728 (not res!723917)) b!1085725))

(assert (= (and b!1085725 (not res!723909)) b!1085730))

(assert (= (and b!1085729 condMapEmpty!41575) mapIsEmpty!41575))

(assert (= (and b!1085729 (not condMapEmpty!41575)) mapNonEmpty!41575))

(get-info :version)

(assert (= (and mapNonEmpty!41575 ((_ is ValueCellFull!12564) mapValue!41575)) b!1085734))

(assert (= (and b!1085729 ((_ is ValueCellFull!12564) mapDefault!41575)) b!1085732))

(assert (= start!95892 b!1085729))

(declare-fun b_lambda!17215 () Bool)

(assert (=> (not b_lambda!17215) (not b!1085728)))

(declare-fun t!33095 () Bool)

(declare-fun tb!7423 () Bool)

(assert (=> (and start!95892 (= defaultEntry!882 defaultEntry!882) t!33095) tb!7423))

(declare-fun result!15365 () Bool)

(assert (=> tb!7423 (= result!15365 tp_is_empty!26547)))

(assert (=> b!1085728 t!33095))

(declare-fun b_and!35767 () Bool)

(assert (= b_and!35765 (and (=> t!33095 result!15365) b_and!35767)))

(declare-fun m!1003895 () Bool)

(assert (=> mapNonEmpty!41575 m!1003895))

(declare-fun m!1003897 () Bool)

(assert (=> b!1085728 m!1003897))

(declare-fun m!1003899 () Bool)

(assert (=> b!1085728 m!1003899))

(declare-fun m!1003901 () Bool)

(assert (=> b!1085728 m!1003901))

(declare-fun m!1003903 () Bool)

(assert (=> b!1085728 m!1003903))

(declare-fun m!1003905 () Bool)

(assert (=> b!1085728 m!1003905))

(declare-fun m!1003907 () Bool)

(assert (=> b!1085728 m!1003907))

(declare-fun m!1003909 () Bool)

(assert (=> b!1085728 m!1003909))

(declare-fun m!1003911 () Bool)

(assert (=> b!1085728 m!1003911))

(declare-fun m!1003913 () Bool)

(assert (=> b!1085728 m!1003913))

(declare-fun m!1003915 () Bool)

(assert (=> b!1085728 m!1003915))

(declare-fun m!1003917 () Bool)

(assert (=> b!1085723 m!1003917))

(declare-fun m!1003919 () Bool)

(assert (=> b!1085727 m!1003919))

(declare-fun m!1003921 () Bool)

(assert (=> b!1085721 m!1003921))

(declare-fun m!1003923 () Bool)

(assert (=> b!1085725 m!1003923))

(declare-fun m!1003925 () Bool)

(assert (=> b!1085725 m!1003925))

(declare-fun m!1003927 () Bool)

(assert (=> b!1085725 m!1003927))

(declare-fun m!1003929 () Bool)

(assert (=> b!1085725 m!1003929))

(assert (=> b!1085725 m!1003927))

(declare-fun m!1003931 () Bool)

(assert (=> b!1085725 m!1003931))

(declare-fun m!1003933 () Bool)

(assert (=> b!1085725 m!1003933))

(declare-fun m!1003935 () Bool)

(assert (=> b!1085725 m!1003935))

(declare-fun m!1003937 () Bool)

(assert (=> b!1085725 m!1003937))

(declare-fun m!1003939 () Bool)

(assert (=> b!1085730 m!1003939))

(declare-fun m!1003941 () Bool)

(assert (=> b!1085730 m!1003941))

(declare-fun m!1003943 () Bool)

(assert (=> b!1085730 m!1003943))

(declare-fun m!1003945 () Bool)

(assert (=> start!95892 m!1003945))

(declare-fun m!1003947 () Bool)

(assert (=> start!95892 m!1003947))

(declare-fun m!1003949 () Bool)

(assert (=> start!95892 m!1003949))

(declare-fun m!1003951 () Bool)

(assert (=> b!1085731 m!1003951))

(declare-fun m!1003953 () Bool)

(assert (=> b!1085731 m!1003953))

(declare-fun m!1003955 () Bool)

(assert (=> b!1085726 m!1003955))

(declare-fun m!1003957 () Bool)

(assert (=> b!1085722 m!1003957))

(check-sat (not b!1085731) (not b!1085728) (not b_lambda!17215) (not b!1085722) (not b!1085730) b_and!35767 (not mapNonEmpty!41575) (not b!1085726) (not b!1085725) (not b_next!22545) (not start!95892) tp_is_empty!26547 (not b!1085721) (not b!1085727))
(check-sat b_and!35767 (not b_next!22545))
