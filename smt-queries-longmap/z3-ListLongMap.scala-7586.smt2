; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96072 () Bool)

(assert start!96072)

(declare-fun b_free!22489 () Bool)

(declare-fun b_next!22489 () Bool)

(assert (=> start!96072 (= b_free!22489 (not b_next!22489))))

(declare-fun tp!79316 () Bool)

(declare-fun b_and!35663 () Bool)

(assert (=> start!96072 (= tp!79316 b_and!35663)))

(declare-fun b!1085830 () Bool)

(declare-fun e!620436 () Bool)

(declare-fun tp_is_empty!26491 () Bool)

(assert (=> b!1085830 (= e!620436 tp_is_empty!26491)))

(declare-fun b!1085831 () Bool)

(declare-fun e!620438 () Bool)

(declare-fun e!620435 () Bool)

(assert (=> b!1085831 (= e!620438 e!620435)))

(declare-fun res!723526 () Bool)

(assert (=> b!1085831 (=> (not res!723526) (not e!620435))))

(declare-datatypes ((array!69959 0))(
  ( (array!69960 (arr!33647 (Array (_ BitVec 32) (_ BitVec 64))) (size!34184 (_ BitVec 32))) )
))
(declare-fun lt!481244 () array!69959)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69959 (_ BitVec 32)) Bool)

(assert (=> b!1085831 (= res!723526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481244 mask!1414))))

(declare-fun _keys!1070 () array!69959)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085831 (= lt!481244 (array!69960 (store (arr!33647 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34184 _keys!1070)))))

(declare-fun b!1085832 () Bool)

(declare-fun res!723528 () Bool)

(assert (=> b!1085832 (=> (not res!723528) (not e!620438))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40449 0))(
  ( (V!40450 (val!13302 Int)) )
))
(declare-datatypes ((ValueCell!12536 0))(
  ( (ValueCellFull!12536 (v!15919 V!40449)) (EmptyCell!12536) )
))
(declare-datatypes ((array!69961 0))(
  ( (array!69962 (arr!33648 (Array (_ BitVec 32) ValueCell!12536)) (size!34185 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69961)

(assert (=> b!1085832 (= res!723528 (and (= (size!34185 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34184 _keys!1070) (size!34185 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085833 () Bool)

(declare-fun res!723522 () Bool)

(assert (=> b!1085833 (=> (not res!723522) (not e!620438))))

(assert (=> b!1085833 (= res!723522 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34184 _keys!1070))))))

(declare-fun b!1085834 () Bool)

(declare-fun res!723525 () Bool)

(assert (=> b!1085834 (=> (not res!723525) (not e!620438))))

(declare-datatypes ((List!23465 0))(
  ( (Nil!23462) (Cons!23461 (h!24679 (_ BitVec 64)) (t!33004 List!23465)) )
))
(declare-fun arrayNoDuplicates!0 (array!69959 (_ BitVec 32) List!23465) Bool)

(assert (=> b!1085834 (= res!723525 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23462))))

(declare-fun b!1085835 () Bool)

(declare-fun res!723527 () Bool)

(assert (=> b!1085835 (=> (not res!723527) (not e!620438))))

(assert (=> b!1085835 (= res!723527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085836 () Bool)

(declare-fun e!620433 () Bool)

(declare-fun mapRes!41491 () Bool)

(assert (=> b!1085836 (= e!620433 (and e!620436 mapRes!41491))))

(declare-fun condMapEmpty!41491 () Bool)

(declare-fun mapDefault!41491 () ValueCell!12536)

(assert (=> b!1085836 (= condMapEmpty!41491 (= (arr!33648 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12536)) mapDefault!41491)))))

(declare-fun mapNonEmpty!41491 () Bool)

(declare-fun tp!79315 () Bool)

(declare-fun e!620437 () Bool)

(assert (=> mapNonEmpty!41491 (= mapRes!41491 (and tp!79315 e!620437))))

(declare-fun mapValue!41491 () ValueCell!12536)

(declare-fun mapRest!41491 () (Array (_ BitVec 32) ValueCell!12536))

(declare-fun mapKey!41491 () (_ BitVec 32))

(assert (=> mapNonEmpty!41491 (= (arr!33648 _values!874) (store mapRest!41491 mapKey!41491 mapValue!41491))))

(declare-fun b!1085837 () Bool)

(declare-fun res!723523 () Bool)

(assert (=> b!1085837 (=> (not res!723523) (not e!620435))))

(assert (=> b!1085837 (= res!723523 (arrayNoDuplicates!0 lt!481244 #b00000000000000000000000000000000 Nil!23462))))

(declare-fun b!1085838 () Bool)

(declare-fun res!723524 () Bool)

(assert (=> b!1085838 (=> (not res!723524) (not e!620438))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1085838 (= res!723524 (= (select (arr!33647 _keys!1070) i!650) k0!904))))

(declare-fun b!1085839 () Bool)

(assert (=> b!1085839 (= e!620435 (not (bvsle #b00000000000000000000000000000000 (size!34184 _keys!1070))))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40449)

(declare-fun lt!481243 () array!69961)

(declare-datatypes ((tuple2!16868 0))(
  ( (tuple2!16869 (_1!8445 (_ BitVec 64)) (_2!8445 V!40449)) )
))
(declare-datatypes ((List!23466 0))(
  ( (Nil!23463) (Cons!23462 (h!24680 tuple2!16868) (t!33005 List!23466)) )
))
(declare-datatypes ((ListLongMap!14845 0))(
  ( (ListLongMap!14846 (toList!7438 List!23466)) )
))
(declare-fun lt!481245 () ListLongMap!14845)

(declare-fun zeroValue!831 () V!40449)

(declare-fun getCurrentListMap!4210 (array!69959 array!69961 (_ BitVec 32) (_ BitVec 32) V!40449 V!40449 (_ BitVec 32) Int) ListLongMap!14845)

(assert (=> b!1085839 (= lt!481245 (getCurrentListMap!4210 lt!481244 lt!481243 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481247 () ListLongMap!14845)

(declare-fun lt!481242 () ListLongMap!14845)

(assert (=> b!1085839 (and (= lt!481247 lt!481242) (= lt!481242 lt!481247))))

(declare-fun lt!481241 () ListLongMap!14845)

(declare-fun -!750 (ListLongMap!14845 (_ BitVec 64)) ListLongMap!14845)

(assert (=> b!1085839 (= lt!481242 (-!750 lt!481241 k0!904))))

(declare-datatypes ((Unit!35667 0))(
  ( (Unit!35668) )
))
(declare-fun lt!481248 () Unit!35667)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!39 (array!69959 array!69961 (_ BitVec 32) (_ BitVec 32) V!40449 V!40449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35667)

(assert (=> b!1085839 (= lt!481248 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!39 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4015 (array!69959 array!69961 (_ BitVec 32) (_ BitVec 32) V!40449 V!40449 (_ BitVec 32) Int) ListLongMap!14845)

(assert (=> b!1085839 (= lt!481247 (getCurrentListMapNoExtraKeys!4015 lt!481244 lt!481243 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2136 (Int (_ BitVec 64)) V!40449)

(assert (=> b!1085839 (= lt!481243 (array!69962 (store (arr!33648 _values!874) i!650 (ValueCellFull!12536 (dynLambda!2136 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34185 _values!874)))))

(assert (=> b!1085839 (= lt!481241 (getCurrentListMapNoExtraKeys!4015 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085839 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481246 () Unit!35667)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69959 (_ BitVec 64) (_ BitVec 32)) Unit!35667)

(assert (=> b!1085839 (= lt!481246 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!41491 () Bool)

(assert (=> mapIsEmpty!41491 mapRes!41491))

(declare-fun b!1085840 () Bool)

(assert (=> b!1085840 (= e!620437 tp_is_empty!26491)))

(declare-fun res!723520 () Bool)

(assert (=> start!96072 (=> (not res!723520) (not e!620438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96072 (= res!723520 (validMask!0 mask!1414))))

(assert (=> start!96072 e!620438))

(assert (=> start!96072 tp!79316))

(assert (=> start!96072 true))

(assert (=> start!96072 tp_is_empty!26491))

(declare-fun array_inv!26014 (array!69959) Bool)

(assert (=> start!96072 (array_inv!26014 _keys!1070)))

(declare-fun array_inv!26015 (array!69961) Bool)

(assert (=> start!96072 (and (array_inv!26015 _values!874) e!620433)))

(declare-fun b!1085841 () Bool)

(declare-fun res!723521 () Bool)

(assert (=> b!1085841 (=> (not res!723521) (not e!620438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085841 (= res!723521 (validKeyInArray!0 k0!904))))

(assert (= (and start!96072 res!723520) b!1085832))

(assert (= (and b!1085832 res!723528) b!1085835))

(assert (= (and b!1085835 res!723527) b!1085834))

(assert (= (and b!1085834 res!723525) b!1085833))

(assert (= (and b!1085833 res!723522) b!1085841))

(assert (= (and b!1085841 res!723521) b!1085838))

(assert (= (and b!1085838 res!723524) b!1085831))

(assert (= (and b!1085831 res!723526) b!1085837))

(assert (= (and b!1085837 res!723523) b!1085839))

(assert (= (and b!1085836 condMapEmpty!41491) mapIsEmpty!41491))

(assert (= (and b!1085836 (not condMapEmpty!41491)) mapNonEmpty!41491))

(get-info :version)

(assert (= (and mapNonEmpty!41491 ((_ is ValueCellFull!12536) mapValue!41491)) b!1085840))

(assert (= (and b!1085836 ((_ is ValueCellFull!12536) mapDefault!41491)) b!1085830))

(assert (= start!96072 b!1085836))

(declare-fun b_lambda!17169 () Bool)

(assert (=> (not b_lambda!17169) (not b!1085839)))

(declare-fun t!33003 () Bool)

(declare-fun tb!7359 () Bool)

(assert (=> (and start!96072 (= defaultEntry!882 defaultEntry!882) t!33003) tb!7359))

(declare-fun result!15245 () Bool)

(assert (=> tb!7359 (= result!15245 tp_is_empty!26491)))

(assert (=> b!1085839 t!33003))

(declare-fun b_and!35665 () Bool)

(assert (= b_and!35663 (and (=> t!33003 result!15245) b_and!35665)))

(declare-fun m!1003895 () Bool)

(assert (=> mapNonEmpty!41491 m!1003895))

(declare-fun m!1003897 () Bool)

(assert (=> b!1085839 m!1003897))

(declare-fun m!1003899 () Bool)

(assert (=> b!1085839 m!1003899))

(declare-fun m!1003901 () Bool)

(assert (=> b!1085839 m!1003901))

(declare-fun m!1003903 () Bool)

(assert (=> b!1085839 m!1003903))

(declare-fun m!1003905 () Bool)

(assert (=> b!1085839 m!1003905))

(declare-fun m!1003907 () Bool)

(assert (=> b!1085839 m!1003907))

(declare-fun m!1003909 () Bool)

(assert (=> b!1085839 m!1003909))

(declare-fun m!1003911 () Bool)

(assert (=> b!1085839 m!1003911))

(declare-fun m!1003913 () Bool)

(assert (=> b!1085839 m!1003913))

(declare-fun m!1003915 () Bool)

(assert (=> b!1085834 m!1003915))

(declare-fun m!1003917 () Bool)

(assert (=> b!1085841 m!1003917))

(declare-fun m!1003919 () Bool)

(assert (=> b!1085835 m!1003919))

(declare-fun m!1003921 () Bool)

(assert (=> b!1085837 m!1003921))

(declare-fun m!1003923 () Bool)

(assert (=> b!1085831 m!1003923))

(declare-fun m!1003925 () Bool)

(assert (=> b!1085831 m!1003925))

(declare-fun m!1003927 () Bool)

(assert (=> b!1085838 m!1003927))

(declare-fun m!1003929 () Bool)

(assert (=> start!96072 m!1003929))

(declare-fun m!1003931 () Bool)

(assert (=> start!96072 m!1003931))

(declare-fun m!1003933 () Bool)

(assert (=> start!96072 m!1003933))

(check-sat b_and!35665 tp_is_empty!26491 (not b!1085835) (not b!1085837) (not b!1085834) (not mapNonEmpty!41491) (not b!1085839) (not b_lambda!17169) (not b_next!22489) (not b!1085831) (not start!96072) (not b!1085841))
(check-sat b_and!35665 (not b_next!22489))
