; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96030 () Bool)

(assert start!96030)

(declare-fun b_free!22447 () Bool)

(declare-fun b_next!22447 () Bool)

(assert (=> start!96030 (= b_free!22447 (not b_next!22447))))

(declare-fun tp!79189 () Bool)

(declare-fun b_and!35579 () Bool)

(assert (=> start!96030 (= tp!79189 b_and!35579)))

(declare-fun b!1085032 () Bool)

(declare-fun e!620056 () Bool)

(declare-fun e!620058 () Bool)

(declare-fun mapRes!41428 () Bool)

(assert (=> b!1085032 (= e!620056 (and e!620058 mapRes!41428))))

(declare-fun condMapEmpty!41428 () Bool)

(declare-datatypes ((V!40393 0))(
  ( (V!40394 (val!13281 Int)) )
))
(declare-datatypes ((ValueCell!12515 0))(
  ( (ValueCellFull!12515 (v!15898 V!40393)) (EmptyCell!12515) )
))
(declare-datatypes ((array!69875 0))(
  ( (array!69876 (arr!33605 (Array (_ BitVec 32) ValueCell!12515)) (size!34142 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69875)

(declare-fun mapDefault!41428 () ValueCell!12515)

(assert (=> b!1085032 (= condMapEmpty!41428 (= (arr!33605 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12515)) mapDefault!41428)))))

(declare-fun mapIsEmpty!41428 () Bool)

(assert (=> mapIsEmpty!41428 mapRes!41428))

(declare-fun b!1085034 () Bool)

(declare-fun res!722955 () Bool)

(declare-fun e!620055 () Bool)

(assert (=> b!1085034 (=> (not res!722955) (not e!620055))))

(declare-datatypes ((array!69877 0))(
  ( (array!69878 (arr!33606 (Array (_ BitVec 32) (_ BitVec 64))) (size!34143 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69877)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69877 (_ BitVec 32)) Bool)

(assert (=> b!1085034 (= res!722955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085035 () Bool)

(declare-fun res!722958 () Bool)

(assert (=> b!1085035 (=> (not res!722958) (not e!620055))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085035 (= res!722958 (and (= (size!34142 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34143 _keys!1070) (size!34142 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085036 () Bool)

(declare-fun res!722960 () Bool)

(assert (=> b!1085036 (=> (not res!722960) (not e!620055))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1085036 (= res!722960 (= (select (arr!33606 _keys!1070) i!650) k0!904))))

(declare-fun b!1085037 () Bool)

(declare-fun e!620060 () Bool)

(assert (=> b!1085037 (= e!620055 e!620060)))

(declare-fun res!722959 () Bool)

(assert (=> b!1085037 (=> (not res!722959) (not e!620060))))

(declare-fun lt!480737 () array!69877)

(assert (=> b!1085037 (= res!722959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480737 mask!1414))))

(assert (=> b!1085037 (= lt!480737 (array!69878 (store (arr!33606 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34143 _keys!1070)))))

(declare-fun mapNonEmpty!41428 () Bool)

(declare-fun tp!79190 () Bool)

(declare-fun e!620059 () Bool)

(assert (=> mapNonEmpty!41428 (= mapRes!41428 (and tp!79190 e!620059))))

(declare-fun mapValue!41428 () ValueCell!12515)

(declare-fun mapRest!41428 () (Array (_ BitVec 32) ValueCell!12515))

(declare-fun mapKey!41428 () (_ BitVec 32))

(assert (=> mapNonEmpty!41428 (= (arr!33605 _values!874) (store mapRest!41428 mapKey!41428 mapValue!41428))))

(declare-fun b!1085038 () Bool)

(declare-fun tp_is_empty!26449 () Bool)

(assert (=> b!1085038 (= e!620059 tp_is_empty!26449)))

(declare-fun b!1085039 () Bool)

(declare-fun res!722957 () Bool)

(assert (=> b!1085039 (=> (not res!722957) (not e!620060))))

(declare-datatypes ((List!23431 0))(
  ( (Nil!23428) (Cons!23427 (h!24645 (_ BitVec 64)) (t!32928 List!23431)) )
))
(declare-fun arrayNoDuplicates!0 (array!69877 (_ BitVec 32) List!23431) Bool)

(assert (=> b!1085039 (= res!722957 (arrayNoDuplicates!0 lt!480737 #b00000000000000000000000000000000 Nil!23428))))

(declare-fun b!1085040 () Bool)

(assert (=> b!1085040 (= e!620060 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40393)

(declare-fun lt!480740 () array!69875)

(declare-datatypes ((tuple2!16836 0))(
  ( (tuple2!16837 (_1!8429 (_ BitVec 64)) (_2!8429 V!40393)) )
))
(declare-datatypes ((List!23432 0))(
  ( (Nil!23429) (Cons!23428 (h!24646 tuple2!16836) (t!32929 List!23432)) )
))
(declare-datatypes ((ListLongMap!14813 0))(
  ( (ListLongMap!14814 (toList!7422 List!23432)) )
))
(declare-fun lt!480743 () ListLongMap!14813)

(declare-fun zeroValue!831 () V!40393)

(declare-fun getCurrentListMap!4194 (array!69877 array!69875 (_ BitVec 32) (_ BitVec 32) V!40393 V!40393 (_ BitVec 32) Int) ListLongMap!14813)

(assert (=> b!1085040 (= lt!480743 (getCurrentListMap!4194 lt!480737 lt!480740 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480738 () ListLongMap!14813)

(declare-fun lt!480741 () ListLongMap!14813)

(assert (=> b!1085040 (and (= lt!480738 lt!480741) (= lt!480741 lt!480738))))

(declare-fun lt!480744 () ListLongMap!14813)

(declare-fun -!734 (ListLongMap!14813 (_ BitVec 64)) ListLongMap!14813)

(assert (=> b!1085040 (= lt!480741 (-!734 lt!480744 k0!904))))

(declare-datatypes ((Unit!35635 0))(
  ( (Unit!35636) )
))
(declare-fun lt!480739 () Unit!35635)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!23 (array!69877 array!69875 (_ BitVec 32) (_ BitVec 32) V!40393 V!40393 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35635)

(assert (=> b!1085040 (= lt!480739 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!23 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3999 (array!69877 array!69875 (_ BitVec 32) (_ BitVec 32) V!40393 V!40393 (_ BitVec 32) Int) ListLongMap!14813)

(assert (=> b!1085040 (= lt!480738 (getCurrentListMapNoExtraKeys!3999 lt!480737 lt!480740 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2120 (Int (_ BitVec 64)) V!40393)

(assert (=> b!1085040 (= lt!480740 (array!69876 (store (arr!33605 _values!874) i!650 (ValueCellFull!12515 (dynLambda!2120 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34142 _values!874)))))

(assert (=> b!1085040 (= lt!480744 (getCurrentListMapNoExtraKeys!3999 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085040 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480742 () Unit!35635)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69877 (_ BitVec 64) (_ BitVec 32)) Unit!35635)

(assert (=> b!1085040 (= lt!480742 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085041 () Bool)

(declare-fun res!722961 () Bool)

(assert (=> b!1085041 (=> (not res!722961) (not e!620055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085041 (= res!722961 (validKeyInArray!0 k0!904))))

(declare-fun b!1085033 () Bool)

(declare-fun res!722954 () Bool)

(assert (=> b!1085033 (=> (not res!722954) (not e!620055))))

(assert (=> b!1085033 (= res!722954 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34143 _keys!1070))))))

(declare-fun res!722953 () Bool)

(assert (=> start!96030 (=> (not res!722953) (not e!620055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96030 (= res!722953 (validMask!0 mask!1414))))

(assert (=> start!96030 e!620055))

(assert (=> start!96030 tp!79189))

(assert (=> start!96030 true))

(assert (=> start!96030 tp_is_empty!26449))

(declare-fun array_inv!25982 (array!69877) Bool)

(assert (=> start!96030 (array_inv!25982 _keys!1070)))

(declare-fun array_inv!25983 (array!69875) Bool)

(assert (=> start!96030 (and (array_inv!25983 _values!874) e!620056)))

(declare-fun b!1085042 () Bool)

(declare-fun res!722956 () Bool)

(assert (=> b!1085042 (=> (not res!722956) (not e!620055))))

(assert (=> b!1085042 (= res!722956 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23428))))

(declare-fun b!1085043 () Bool)

(assert (=> b!1085043 (= e!620058 tp_is_empty!26449)))

(assert (= (and start!96030 res!722953) b!1085035))

(assert (= (and b!1085035 res!722958) b!1085034))

(assert (= (and b!1085034 res!722955) b!1085042))

(assert (= (and b!1085042 res!722956) b!1085033))

(assert (= (and b!1085033 res!722954) b!1085041))

(assert (= (and b!1085041 res!722961) b!1085036))

(assert (= (and b!1085036 res!722960) b!1085037))

(assert (= (and b!1085037 res!722959) b!1085039))

(assert (= (and b!1085039 res!722957) b!1085040))

(assert (= (and b!1085032 condMapEmpty!41428) mapIsEmpty!41428))

(assert (= (and b!1085032 (not condMapEmpty!41428)) mapNonEmpty!41428))

(get-info :version)

(assert (= (and mapNonEmpty!41428 ((_ is ValueCellFull!12515) mapValue!41428)) b!1085038))

(assert (= (and b!1085032 ((_ is ValueCellFull!12515) mapDefault!41428)) b!1085043))

(assert (= start!96030 b!1085032))

(declare-fun b_lambda!17127 () Bool)

(assert (=> (not b_lambda!17127) (not b!1085040)))

(declare-fun t!32927 () Bool)

(declare-fun tb!7317 () Bool)

(assert (=> (and start!96030 (= defaultEntry!882 defaultEntry!882) t!32927) tb!7317))

(declare-fun result!15161 () Bool)

(assert (=> tb!7317 (= result!15161 tp_is_empty!26449)))

(assert (=> b!1085040 t!32927))

(declare-fun b_and!35581 () Bool)

(assert (= b_and!35579 (and (=> t!32927 result!15161) b_and!35581)))

(declare-fun m!1003055 () Bool)

(assert (=> b!1085040 m!1003055))

(declare-fun m!1003057 () Bool)

(assert (=> b!1085040 m!1003057))

(declare-fun m!1003059 () Bool)

(assert (=> b!1085040 m!1003059))

(declare-fun m!1003061 () Bool)

(assert (=> b!1085040 m!1003061))

(declare-fun m!1003063 () Bool)

(assert (=> b!1085040 m!1003063))

(declare-fun m!1003065 () Bool)

(assert (=> b!1085040 m!1003065))

(declare-fun m!1003067 () Bool)

(assert (=> b!1085040 m!1003067))

(declare-fun m!1003069 () Bool)

(assert (=> b!1085040 m!1003069))

(declare-fun m!1003071 () Bool)

(assert (=> b!1085040 m!1003071))

(declare-fun m!1003073 () Bool)

(assert (=> b!1085039 m!1003073))

(declare-fun m!1003075 () Bool)

(assert (=> b!1085042 m!1003075))

(declare-fun m!1003077 () Bool)

(assert (=> start!96030 m!1003077))

(declare-fun m!1003079 () Bool)

(assert (=> start!96030 m!1003079))

(declare-fun m!1003081 () Bool)

(assert (=> start!96030 m!1003081))

(declare-fun m!1003083 () Bool)

(assert (=> b!1085034 m!1003083))

(declare-fun m!1003085 () Bool)

(assert (=> mapNonEmpty!41428 m!1003085))

(declare-fun m!1003087 () Bool)

(assert (=> b!1085041 m!1003087))

(declare-fun m!1003089 () Bool)

(assert (=> b!1085036 m!1003089))

(declare-fun m!1003091 () Bool)

(assert (=> b!1085037 m!1003091))

(declare-fun m!1003093 () Bool)

(assert (=> b!1085037 m!1003093))

(check-sat (not b!1085034) tp_is_empty!26449 (not b!1085041) b_and!35581 (not b_next!22447) (not b_lambda!17127) (not b!1085040) (not b!1085037) (not b!1085039) (not mapNonEmpty!41428) (not b!1085042) (not start!96030))
(check-sat b_and!35581 (not b_next!22447))
