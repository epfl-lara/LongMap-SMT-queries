; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96262 () Bool)

(assert start!96262)

(declare-fun b_free!22921 () Bool)

(declare-fun b_next!22921 () Bool)

(assert (=> start!96262 (= b_free!22921 (not b_next!22921))))

(declare-fun tp!80612 () Bool)

(declare-fun b_and!36491 () Bool)

(assert (=> start!96262 (= tp!80612 b_and!36491)))

(declare-fun b!1093620 () Bool)

(declare-fun res!729825 () Bool)

(declare-fun e!624408 () Bool)

(assert (=> b!1093620 (=> (not res!729825) (not e!624408))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70676 0))(
  ( (array!70677 (arr!34012 (Array (_ BitVec 32) (_ BitVec 64))) (size!34550 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70676)

(declare-datatypes ((V!41025 0))(
  ( (V!41026 (val!13518 Int)) )
))
(declare-datatypes ((ValueCell!12752 0))(
  ( (ValueCellFull!12752 (v!16138 V!41025)) (EmptyCell!12752) )
))
(declare-datatypes ((array!70678 0))(
  ( (array!70679 (arr!34013 (Array (_ BitVec 32) ValueCell!12752)) (size!34551 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70678)

(assert (=> b!1093620 (= res!729825 (and (= (size!34551 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34550 _keys!1070) (size!34551 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093621 () Bool)

(declare-fun e!624410 () Bool)

(declare-fun tp_is_empty!26923 () Bool)

(assert (=> b!1093621 (= e!624410 tp_is_empty!26923)))

(declare-fun b!1093622 () Bool)

(declare-fun res!729823 () Bool)

(assert (=> b!1093622 (=> (not res!729823) (not e!624408))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093622 (= res!729823 (= (select (arr!34012 _keys!1070) i!650) k0!904))))

(declare-fun b!1093623 () Bool)

(declare-fun e!624413 () Bool)

(declare-fun mapRes!42139 () Bool)

(assert (=> b!1093623 (= e!624413 (and e!624410 mapRes!42139))))

(declare-fun condMapEmpty!42139 () Bool)

(declare-fun mapDefault!42139 () ValueCell!12752)

(assert (=> b!1093623 (= condMapEmpty!42139 (= (arr!34013 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12752)) mapDefault!42139)))))

(declare-fun res!729824 () Bool)

(assert (=> start!96262 (=> (not res!729824) (not e!624408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96262 (= res!729824 (validMask!0 mask!1414))))

(assert (=> start!96262 e!624408))

(assert (=> start!96262 tp!80612))

(assert (=> start!96262 true))

(assert (=> start!96262 tp_is_empty!26923))

(declare-fun array_inv!26256 (array!70676) Bool)

(assert (=> start!96262 (array_inv!26256 _keys!1070)))

(declare-fun array_inv!26257 (array!70678) Bool)

(assert (=> start!96262 (and (array_inv!26257 _values!874) e!624413)))

(declare-fun b!1093624 () Bool)

(declare-fun e!624412 () Bool)

(assert (=> b!1093624 (= e!624412 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41025)

(declare-fun zeroValue!831 () V!41025)

(declare-datatypes ((tuple2!17258 0))(
  ( (tuple2!17259 (_1!8640 (_ BitVec 64)) (_2!8640 V!41025)) )
))
(declare-datatypes ((List!23825 0))(
  ( (Nil!23822) (Cons!23821 (h!25030 tuple2!17258) (t!33795 List!23825)) )
))
(declare-datatypes ((ListLongMap!15227 0))(
  ( (ListLongMap!15228 (toList!7629 List!23825)) )
))
(declare-fun lt!489033 () ListLongMap!15227)

(declare-fun getCurrentListMap!4292 (array!70676 array!70678 (_ BitVec 32) (_ BitVec 32) V!41025 V!41025 (_ BitVec 32) Int) ListLongMap!15227)

(assert (=> b!1093624 (= lt!489033 (getCurrentListMap!4292 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489040 () array!70676)

(declare-fun lt!489038 () ListLongMap!15227)

(declare-fun lt!489039 () array!70678)

(assert (=> b!1093624 (= lt!489038 (getCurrentListMap!4292 lt!489040 lt!489039 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489035 () ListLongMap!15227)

(declare-fun lt!489036 () ListLongMap!15227)

(assert (=> b!1093624 (and (= lt!489035 lt!489036) (= lt!489036 lt!489035))))

(declare-fun lt!489037 () ListLongMap!15227)

(declare-fun -!901 (ListLongMap!15227 (_ BitVec 64)) ListLongMap!15227)

(assert (=> b!1093624 (= lt!489036 (-!901 lt!489037 k0!904))))

(declare-datatypes ((Unit!35837 0))(
  ( (Unit!35838) )
))
(declare-fun lt!489041 () Unit!35837)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!176 (array!70676 array!70678 (_ BitVec 32) (_ BitVec 32) V!41025 V!41025 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35837)

(assert (=> b!1093624 (= lt!489041 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!176 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4162 (array!70676 array!70678 (_ BitVec 32) (_ BitVec 32) V!41025 V!41025 (_ BitVec 32) Int) ListLongMap!15227)

(assert (=> b!1093624 (= lt!489035 (getCurrentListMapNoExtraKeys!4162 lt!489040 lt!489039 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2233 (Int (_ BitVec 64)) V!41025)

(assert (=> b!1093624 (= lt!489039 (array!70679 (store (arr!34013 _values!874) i!650 (ValueCellFull!12752 (dynLambda!2233 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34551 _values!874)))))

(assert (=> b!1093624 (= lt!489037 (getCurrentListMapNoExtraKeys!4162 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093624 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489034 () Unit!35837)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70676 (_ BitVec 64) (_ BitVec 32)) Unit!35837)

(assert (=> b!1093624 (= lt!489034 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093625 () Bool)

(declare-fun res!729831 () Bool)

(assert (=> b!1093625 (=> (not res!729831) (not e!624408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093625 (= res!729831 (validKeyInArray!0 k0!904))))

(declare-fun b!1093626 () Bool)

(declare-fun res!729826 () Bool)

(assert (=> b!1093626 (=> (not res!729826) (not e!624408))))

(assert (=> b!1093626 (= res!729826 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34550 _keys!1070))))))

(declare-fun b!1093627 () Bool)

(declare-fun res!729830 () Bool)

(assert (=> b!1093627 (=> (not res!729830) (not e!624408))))

(declare-datatypes ((List!23826 0))(
  ( (Nil!23823) (Cons!23822 (h!25031 (_ BitVec 64)) (t!33796 List!23826)) )
))
(declare-fun arrayNoDuplicates!0 (array!70676 (_ BitVec 32) List!23826) Bool)

(assert (=> b!1093627 (= res!729830 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23823))))

(declare-fun b!1093628 () Bool)

(declare-fun e!624411 () Bool)

(assert (=> b!1093628 (= e!624411 tp_is_empty!26923)))

(declare-fun mapNonEmpty!42139 () Bool)

(declare-fun tp!80611 () Bool)

(assert (=> mapNonEmpty!42139 (= mapRes!42139 (and tp!80611 e!624411))))

(declare-fun mapRest!42139 () (Array (_ BitVec 32) ValueCell!12752))

(declare-fun mapKey!42139 () (_ BitVec 32))

(declare-fun mapValue!42139 () ValueCell!12752)

(assert (=> mapNonEmpty!42139 (= (arr!34013 _values!874) (store mapRest!42139 mapKey!42139 mapValue!42139))))

(declare-fun b!1093629 () Bool)

(declare-fun res!729827 () Bool)

(assert (=> b!1093629 (=> (not res!729827) (not e!624408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70676 (_ BitVec 32)) Bool)

(assert (=> b!1093629 (= res!729827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093630 () Bool)

(assert (=> b!1093630 (= e!624408 e!624412)))

(declare-fun res!729829 () Bool)

(assert (=> b!1093630 (=> (not res!729829) (not e!624412))))

(assert (=> b!1093630 (= res!729829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489040 mask!1414))))

(assert (=> b!1093630 (= lt!489040 (array!70677 (store (arr!34012 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34550 _keys!1070)))))

(declare-fun mapIsEmpty!42139 () Bool)

(assert (=> mapIsEmpty!42139 mapRes!42139))

(declare-fun b!1093631 () Bool)

(declare-fun res!729828 () Bool)

(assert (=> b!1093631 (=> (not res!729828) (not e!624412))))

(assert (=> b!1093631 (= res!729828 (arrayNoDuplicates!0 lt!489040 #b00000000000000000000000000000000 Nil!23823))))

(assert (= (and start!96262 res!729824) b!1093620))

(assert (= (and b!1093620 res!729825) b!1093629))

(assert (= (and b!1093629 res!729827) b!1093627))

(assert (= (and b!1093627 res!729830) b!1093626))

(assert (= (and b!1093626 res!729826) b!1093625))

(assert (= (and b!1093625 res!729831) b!1093622))

(assert (= (and b!1093622 res!729823) b!1093630))

(assert (= (and b!1093630 res!729829) b!1093631))

(assert (= (and b!1093631 res!729828) b!1093624))

(assert (= (and b!1093623 condMapEmpty!42139) mapIsEmpty!42139))

(assert (= (and b!1093623 (not condMapEmpty!42139)) mapNonEmpty!42139))

(get-info :version)

(assert (= (and mapNonEmpty!42139 ((_ is ValueCellFull!12752) mapValue!42139)) b!1093628))

(assert (= (and b!1093623 ((_ is ValueCellFull!12752) mapDefault!42139)) b!1093621))

(assert (= start!96262 b!1093623))

(declare-fun b_lambda!17569 () Bool)

(assert (=> (not b_lambda!17569) (not b!1093624)))

(declare-fun t!33794 () Bool)

(declare-fun tb!7791 () Bool)

(assert (=> (and start!96262 (= defaultEntry!882 defaultEntry!882) t!33794) tb!7791))

(declare-fun result!16109 () Bool)

(assert (=> tb!7791 (= result!16109 tp_is_empty!26923)))

(assert (=> b!1093624 t!33794))

(declare-fun b_and!36493 () Bool)

(assert (= b_and!36491 (and (=> t!33794 result!16109) b_and!36493)))

(declare-fun m!1013051 () Bool)

(assert (=> b!1093627 m!1013051))

(declare-fun m!1013053 () Bool)

(assert (=> mapNonEmpty!42139 m!1013053))

(declare-fun m!1013055 () Bool)

(assert (=> start!96262 m!1013055))

(declare-fun m!1013057 () Bool)

(assert (=> start!96262 m!1013057))

(declare-fun m!1013059 () Bool)

(assert (=> start!96262 m!1013059))

(declare-fun m!1013061 () Bool)

(assert (=> b!1093630 m!1013061))

(declare-fun m!1013063 () Bool)

(assert (=> b!1093630 m!1013063))

(declare-fun m!1013065 () Bool)

(assert (=> b!1093622 m!1013065))

(declare-fun m!1013067 () Bool)

(assert (=> b!1093629 m!1013067))

(declare-fun m!1013069 () Bool)

(assert (=> b!1093624 m!1013069))

(declare-fun m!1013071 () Bool)

(assert (=> b!1093624 m!1013071))

(declare-fun m!1013073 () Bool)

(assert (=> b!1093624 m!1013073))

(declare-fun m!1013075 () Bool)

(assert (=> b!1093624 m!1013075))

(declare-fun m!1013077 () Bool)

(assert (=> b!1093624 m!1013077))

(declare-fun m!1013079 () Bool)

(assert (=> b!1093624 m!1013079))

(declare-fun m!1013081 () Bool)

(assert (=> b!1093624 m!1013081))

(declare-fun m!1013083 () Bool)

(assert (=> b!1093624 m!1013083))

(declare-fun m!1013085 () Bool)

(assert (=> b!1093624 m!1013085))

(declare-fun m!1013087 () Bool)

(assert (=> b!1093624 m!1013087))

(declare-fun m!1013089 () Bool)

(assert (=> b!1093625 m!1013089))

(declare-fun m!1013091 () Bool)

(assert (=> b!1093631 m!1013091))

(check-sat (not b!1093627) (not b!1093624) (not mapNonEmpty!42139) (not b!1093625) (not b!1093629) (not b_lambda!17569) b_and!36493 (not start!96262) tp_is_empty!26923 (not b!1093631) (not b_next!22921) (not b!1093630))
(check-sat b_and!36493 (not b_next!22921))
