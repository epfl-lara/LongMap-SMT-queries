; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96636 () Bool)

(assert start!96636)

(declare-fun b_free!23109 () Bool)

(declare-fun b_next!23109 () Bool)

(assert (=> start!96636 (= b_free!23109 (not b_next!23109))))

(declare-fun tp!81266 () Bool)

(declare-fun b_and!36937 () Bool)

(assert (=> start!96636 (= tp!81266 b_and!36937)))

(declare-fun b!1099090 () Bool)

(declare-fun res!733493 () Bool)

(declare-fun e!627316 () Bool)

(assert (=> b!1099090 (=> (not res!733493) (not e!627316))))

(declare-datatypes ((array!71233 0))(
  ( (array!71234 (arr!34284 (Array (_ BitVec 32) (_ BitVec 64))) (size!34820 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71233)

(declare-datatypes ((List!23943 0))(
  ( (Nil!23940) (Cons!23939 (h!25148 (_ BitVec 64)) (t!34098 List!23943)) )
))
(declare-fun arrayNoDuplicates!0 (array!71233 (_ BitVec 32) List!23943) Bool)

(assert (=> b!1099090 (= res!733493 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23940))))

(declare-fun b!1099091 () Bool)

(declare-fun e!627312 () Bool)

(declare-fun e!627314 () Bool)

(assert (=> b!1099091 (= e!627312 e!627314)))

(declare-fun res!733487 () Bool)

(assert (=> b!1099091 (=> res!733487 e!627314)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1099091 (= res!733487 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!41339 0))(
  ( (V!41340 (val!13636 Int)) )
))
(declare-datatypes ((tuple2!17324 0))(
  ( (tuple2!17325 (_1!8673 (_ BitVec 64)) (_2!8673 V!41339)) )
))
(declare-datatypes ((List!23944 0))(
  ( (Nil!23941) (Cons!23940 (h!25149 tuple2!17324) (t!34099 List!23944)) )
))
(declare-datatypes ((ListLongMap!15293 0))(
  ( (ListLongMap!15294 (toList!7662 List!23944)) )
))
(declare-fun lt!492032 () ListLongMap!15293)

(declare-fun lt!492030 () ListLongMap!15293)

(assert (=> b!1099091 (= lt!492032 lt!492030)))

(declare-fun lt!492025 () ListLongMap!15293)

(declare-fun -!951 (ListLongMap!15293 (_ BitVec 64)) ListLongMap!15293)

(assert (=> b!1099091 (= lt!492032 (-!951 lt!492025 k0!904))))

(declare-datatypes ((Unit!36142 0))(
  ( (Unit!36143) )
))
(declare-fun lt!492033 () Unit!36142)

(declare-fun lt!492028 () ListLongMap!15293)

(declare-fun zeroValue!831 () V!41339)

(declare-fun addRemoveCommutativeForDiffKeys!123 (ListLongMap!15293 (_ BitVec 64) V!41339 (_ BitVec 64)) Unit!36142)

(assert (=> b!1099091 (= lt!492033 (addRemoveCommutativeForDiffKeys!123 lt!492028 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!492038 () ListLongMap!15293)

(declare-fun lt!492029 () tuple2!17324)

(declare-fun +!3371 (ListLongMap!15293 tuple2!17324) ListLongMap!15293)

(assert (=> b!1099091 (= lt!492038 (+!3371 lt!492030 lt!492029))))

(declare-fun lt!492031 () ListLongMap!15293)

(declare-fun lt!492035 () tuple2!17324)

(assert (=> b!1099091 (= lt!492030 (+!3371 lt!492031 lt!492035))))

(declare-fun lt!492026 () ListLongMap!15293)

(declare-fun lt!492037 () ListLongMap!15293)

(assert (=> b!1099091 (= lt!492026 lt!492037)))

(assert (=> b!1099091 (= lt!492037 (+!3371 lt!492025 lt!492029))))

(assert (=> b!1099091 (= lt!492025 (+!3371 lt!492028 lt!492035))))

(declare-fun lt!492027 () ListLongMap!15293)

(assert (=> b!1099091 (= lt!492038 (+!3371 (+!3371 lt!492027 lt!492035) lt!492029))))

(declare-fun minValue!831 () V!41339)

(assert (=> b!1099091 (= lt!492029 (tuple2!17325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1099091 (= lt!492035 (tuple2!17325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapNonEmpty!42511 () Bool)

(declare-fun mapRes!42511 () Bool)

(declare-fun tp!81265 () Bool)

(declare-fun e!627317 () Bool)

(assert (=> mapNonEmpty!42511 (= mapRes!42511 (and tp!81265 e!627317))))

(declare-datatypes ((ValueCell!12870 0))(
  ( (ValueCellFull!12870 (v!16261 V!41339)) (EmptyCell!12870) )
))
(declare-datatypes ((array!71235 0))(
  ( (array!71236 (arr!34285 (Array (_ BitVec 32) ValueCell!12870)) (size!34821 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71235)

(declare-fun mapKey!42511 () (_ BitVec 32))

(declare-fun mapRest!42511 () (Array (_ BitVec 32) ValueCell!12870))

(declare-fun mapValue!42511 () ValueCell!12870)

(assert (=> mapNonEmpty!42511 (= (arr!34285 _values!874) (store mapRest!42511 mapKey!42511 mapValue!42511))))

(declare-fun mapIsEmpty!42511 () Bool)

(assert (=> mapIsEmpty!42511 mapRes!42511))

(declare-fun b!1099092 () Bool)

(declare-fun tp_is_empty!27159 () Bool)

(assert (=> b!1099092 (= e!627317 tp_is_empty!27159)))

(declare-fun b!1099093 () Bool)

(declare-fun res!733484 () Bool)

(assert (=> b!1099093 (=> (not res!733484) (not e!627316))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1099093 (= res!733484 (= (select (arr!34284 _keys!1070) i!650) k0!904))))

(declare-fun b!1099094 () Bool)

(declare-fun e!627315 () Bool)

(assert (=> b!1099094 (= e!627316 e!627315)))

(declare-fun res!733491 () Bool)

(assert (=> b!1099094 (=> (not res!733491) (not e!627315))))

(declare-fun lt!492039 () array!71233)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71233 (_ BitVec 32)) Bool)

(assert (=> b!1099094 (= res!733491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492039 mask!1414))))

(assert (=> b!1099094 (= lt!492039 (array!71234 (store (arr!34284 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34820 _keys!1070)))))

(declare-fun b!1099095 () Bool)

(declare-fun res!733490 () Bool)

(assert (=> b!1099095 (=> (not res!733490) (not e!627316))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1099095 (= res!733490 (and (= (size!34821 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34820 _keys!1070) (size!34821 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1099096 () Bool)

(declare-fun res!733489 () Bool)

(assert (=> b!1099096 (=> (not res!733489) (not e!627316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1099096 (= res!733489 (validKeyInArray!0 k0!904))))

(declare-fun b!1099097 () Bool)

(assert (=> b!1099097 (= e!627314 (= (-!951 lt!492026 k0!904) lt!492038))))

(assert (=> b!1099097 (= (-!951 lt!492037 k0!904) (+!3371 lt!492032 lt!492029))))

(declare-fun lt!492024 () Unit!36142)

(assert (=> b!1099097 (= lt!492024 (addRemoveCommutativeForDiffKeys!123 lt!492025 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1099098 () Bool)

(assert (=> b!1099098 (= e!627315 (not e!627312))))

(declare-fun res!733492 () Bool)

(assert (=> b!1099098 (=> res!733492 e!627312)))

(assert (=> b!1099098 (= res!733492 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4377 (array!71233 array!71235 (_ BitVec 32) (_ BitVec 32) V!41339 V!41339 (_ BitVec 32) Int) ListLongMap!15293)

(assert (=> b!1099098 (= lt!492026 (getCurrentListMap!4377 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492036 () array!71235)

(assert (=> b!1099098 (= lt!492038 (getCurrentListMap!4377 lt!492039 lt!492036 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1099098 (and (= lt!492027 lt!492031) (= lt!492031 lt!492027))))

(assert (=> b!1099098 (= lt!492031 (-!951 lt!492028 k0!904))))

(declare-fun lt!492023 () Unit!36142)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!203 (array!71233 array!71235 (_ BitVec 32) (_ BitVec 32) V!41339 V!41339 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36142)

(assert (=> b!1099098 (= lt!492023 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!203 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4173 (array!71233 array!71235 (_ BitVec 32) (_ BitVec 32) V!41339 V!41339 (_ BitVec 32) Int) ListLongMap!15293)

(assert (=> b!1099098 (= lt!492027 (getCurrentListMapNoExtraKeys!4173 lt!492039 lt!492036 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2308 (Int (_ BitVec 64)) V!41339)

(assert (=> b!1099098 (= lt!492036 (array!71236 (store (arr!34285 _values!874) i!650 (ValueCellFull!12870 (dynLambda!2308 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34821 _values!874)))))

(assert (=> b!1099098 (= lt!492028 (getCurrentListMapNoExtraKeys!4173 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099098 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492034 () Unit!36142)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71233 (_ BitVec 64) (_ BitVec 32)) Unit!36142)

(assert (=> b!1099098 (= lt!492034 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1099099 () Bool)

(declare-fun res!733488 () Bool)

(assert (=> b!1099099 (=> (not res!733488) (not e!627316))))

(assert (=> b!1099099 (= res!733488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1099100 () Bool)

(declare-fun res!733486 () Bool)

(assert (=> b!1099100 (=> (not res!733486) (not e!627315))))

(assert (=> b!1099100 (= res!733486 (arrayNoDuplicates!0 lt!492039 #b00000000000000000000000000000000 Nil!23940))))

(declare-fun b!1099101 () Bool)

(declare-fun e!627313 () Bool)

(declare-fun e!627318 () Bool)

(assert (=> b!1099101 (= e!627313 (and e!627318 mapRes!42511))))

(declare-fun condMapEmpty!42511 () Bool)

(declare-fun mapDefault!42511 () ValueCell!12870)

(assert (=> b!1099101 (= condMapEmpty!42511 (= (arr!34285 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12870)) mapDefault!42511)))))

(declare-fun res!733485 () Bool)

(assert (=> start!96636 (=> (not res!733485) (not e!627316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96636 (= res!733485 (validMask!0 mask!1414))))

(assert (=> start!96636 e!627316))

(assert (=> start!96636 tp!81266))

(assert (=> start!96636 true))

(assert (=> start!96636 tp_is_empty!27159))

(declare-fun array_inv!26410 (array!71233) Bool)

(assert (=> start!96636 (array_inv!26410 _keys!1070)))

(declare-fun array_inv!26411 (array!71235) Bool)

(assert (=> start!96636 (and (array_inv!26411 _values!874) e!627313)))

(declare-fun b!1099102 () Bool)

(declare-fun res!733483 () Bool)

(assert (=> b!1099102 (=> (not res!733483) (not e!627316))))

(assert (=> b!1099102 (= res!733483 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34820 _keys!1070))))))

(declare-fun b!1099103 () Bool)

(assert (=> b!1099103 (= e!627318 tp_is_empty!27159)))

(assert (= (and start!96636 res!733485) b!1099095))

(assert (= (and b!1099095 res!733490) b!1099099))

(assert (= (and b!1099099 res!733488) b!1099090))

(assert (= (and b!1099090 res!733493) b!1099102))

(assert (= (and b!1099102 res!733483) b!1099096))

(assert (= (and b!1099096 res!733489) b!1099093))

(assert (= (and b!1099093 res!733484) b!1099094))

(assert (= (and b!1099094 res!733491) b!1099100))

(assert (= (and b!1099100 res!733486) b!1099098))

(assert (= (and b!1099098 (not res!733492)) b!1099091))

(assert (= (and b!1099091 (not res!733487)) b!1099097))

(assert (= (and b!1099101 condMapEmpty!42511) mapIsEmpty!42511))

(assert (= (and b!1099101 (not condMapEmpty!42511)) mapNonEmpty!42511))

(get-info :version)

(assert (= (and mapNonEmpty!42511 ((_ is ValueCellFull!12870) mapValue!42511)) b!1099092))

(assert (= (and b!1099101 ((_ is ValueCellFull!12870) mapDefault!42511)) b!1099103))

(assert (= start!96636 b!1099101))

(declare-fun b_lambda!17887 () Bool)

(assert (=> (not b_lambda!17887) (not b!1099098)))

(declare-fun t!34097 () Bool)

(declare-fun tb!7975 () Bool)

(assert (=> (and start!96636 (= defaultEntry!882 defaultEntry!882) t!34097) tb!7975))

(declare-fun result!16481 () Bool)

(assert (=> tb!7975 (= result!16481 tp_is_empty!27159)))

(assert (=> b!1099098 t!34097))

(declare-fun b_and!36939 () Bool)

(assert (= b_and!36937 (and (=> t!34097 result!16481) b_and!36939)))

(declare-fun m!1019011 () Bool)

(assert (=> b!1099098 m!1019011))

(declare-fun m!1019013 () Bool)

(assert (=> b!1099098 m!1019013))

(declare-fun m!1019015 () Bool)

(assert (=> b!1099098 m!1019015))

(declare-fun m!1019017 () Bool)

(assert (=> b!1099098 m!1019017))

(declare-fun m!1019019 () Bool)

(assert (=> b!1099098 m!1019019))

(declare-fun m!1019021 () Bool)

(assert (=> b!1099098 m!1019021))

(declare-fun m!1019023 () Bool)

(assert (=> b!1099098 m!1019023))

(declare-fun m!1019025 () Bool)

(assert (=> b!1099098 m!1019025))

(declare-fun m!1019027 () Bool)

(assert (=> b!1099098 m!1019027))

(declare-fun m!1019029 () Bool)

(assert (=> b!1099098 m!1019029))

(declare-fun m!1019031 () Bool)

(assert (=> b!1099097 m!1019031))

(declare-fun m!1019033 () Bool)

(assert (=> b!1099097 m!1019033))

(declare-fun m!1019035 () Bool)

(assert (=> b!1099097 m!1019035))

(declare-fun m!1019037 () Bool)

(assert (=> b!1099097 m!1019037))

(declare-fun m!1019039 () Bool)

(assert (=> mapNonEmpty!42511 m!1019039))

(declare-fun m!1019041 () Bool)

(assert (=> b!1099091 m!1019041))

(declare-fun m!1019043 () Bool)

(assert (=> b!1099091 m!1019043))

(declare-fun m!1019045 () Bool)

(assert (=> b!1099091 m!1019045))

(declare-fun m!1019047 () Bool)

(assert (=> b!1099091 m!1019047))

(declare-fun m!1019049 () Bool)

(assert (=> b!1099091 m!1019049))

(assert (=> b!1099091 m!1019043))

(declare-fun m!1019051 () Bool)

(assert (=> b!1099091 m!1019051))

(declare-fun m!1019053 () Bool)

(assert (=> b!1099091 m!1019053))

(declare-fun m!1019055 () Bool)

(assert (=> b!1099091 m!1019055))

(declare-fun m!1019057 () Bool)

(assert (=> b!1099100 m!1019057))

(declare-fun m!1019059 () Bool)

(assert (=> b!1099090 m!1019059))

(declare-fun m!1019061 () Bool)

(assert (=> b!1099094 m!1019061))

(declare-fun m!1019063 () Bool)

(assert (=> b!1099094 m!1019063))

(declare-fun m!1019065 () Bool)

(assert (=> b!1099096 m!1019065))

(declare-fun m!1019067 () Bool)

(assert (=> start!96636 m!1019067))

(declare-fun m!1019069 () Bool)

(assert (=> start!96636 m!1019069))

(declare-fun m!1019071 () Bool)

(assert (=> start!96636 m!1019071))

(declare-fun m!1019073 () Bool)

(assert (=> b!1099093 m!1019073))

(declare-fun m!1019075 () Bool)

(assert (=> b!1099099 m!1019075))

(check-sat (not b_lambda!17887) (not b_next!23109) (not b!1099099) (not b!1099094) (not b!1099091) (not b!1099090) (not b!1099098) (not b!1099100) (not start!96636) (not b!1099097) (not mapNonEmpty!42511) (not b!1099096) tp_is_empty!27159 b_and!36939)
(check-sat b_and!36939 (not b_next!23109))
