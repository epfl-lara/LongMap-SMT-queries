; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96036 () Bool)

(assert start!96036)

(declare-fun b_free!22689 () Bool)

(declare-fun b_next!22689 () Bool)

(assert (=> start!96036 (= b_free!22689 (not b_next!22689))))

(declare-fun tp!79916 () Bool)

(declare-fun b_and!36053 () Bool)

(assert (=> start!96036 (= tp!79916 b_and!36053)))

(declare-fun b!1088898 () Bool)

(declare-fun e!621957 () Bool)

(declare-fun e!621960 () Bool)

(assert (=> b!1088898 (= e!621957 e!621960)))

(declare-fun res!726299 () Bool)

(assert (=> b!1088898 (=> res!726299 e!621960)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1088898 (= res!726299 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40715 0))(
  ( (V!40716 (val!13402 Int)) )
))
(declare-datatypes ((tuple2!17020 0))(
  ( (tuple2!17021 (_1!8521 (_ BitVec 64)) (_2!8521 V!40715)) )
))
(declare-datatypes ((List!23608 0))(
  ( (Nil!23605) (Cons!23604 (h!24813 tuple2!17020) (t!33355 List!23608)) )
))
(declare-datatypes ((ListLongMap!14989 0))(
  ( (ListLongMap!14990 (toList!7510 List!23608)) )
))
(declare-fun lt!485207 () ListLongMap!14989)

(declare-fun lt!485211 () ListLongMap!14989)

(assert (=> b!1088898 (= lt!485207 lt!485211)))

(declare-fun lt!485205 () ListLongMap!14989)

(declare-fun lt!485206 () tuple2!17020)

(declare-fun +!3308 (ListLongMap!14989 tuple2!17020) ListLongMap!14989)

(assert (=> b!1088898 (= lt!485211 (+!3308 lt!485205 lt!485206))))

(declare-fun lt!485204 () ListLongMap!14989)

(declare-fun lt!485214 () ListLongMap!14989)

(assert (=> b!1088898 (= lt!485204 lt!485214)))

(declare-fun lt!485212 () ListLongMap!14989)

(assert (=> b!1088898 (= lt!485214 (+!3308 lt!485212 lt!485206))))

(declare-fun lt!485213 () ListLongMap!14989)

(assert (=> b!1088898 (= lt!485207 (+!3308 lt!485213 lt!485206))))

(declare-fun zeroValue!831 () V!40715)

(assert (=> b!1088898 (= lt!485206 (tuple2!17021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088899 () Bool)

(declare-fun e!621955 () Bool)

(declare-fun tp_is_empty!26691 () Bool)

(assert (=> b!1088899 (= e!621955 tp_is_empty!26691)))

(declare-fun b!1088900 () Bool)

(declare-fun res!726294 () Bool)

(declare-fun e!621959 () Bool)

(assert (=> b!1088900 (=> (not res!726294) (not e!621959))))

(declare-datatypes ((array!70307 0))(
  ( (array!70308 (arr!33827 (Array (_ BitVec 32) (_ BitVec 64))) (size!34363 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70307)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088900 (= res!726294 (= (select (arr!33827 _keys!1070) i!650) k0!904))))

(declare-fun b!1088901 () Bool)

(declare-fun res!726297 () Bool)

(assert (=> b!1088901 (=> (not res!726297) (not e!621959))))

(assert (=> b!1088901 (= res!726297 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34363 _keys!1070))))))

(declare-fun b!1088902 () Bool)

(declare-fun res!726301 () Bool)

(assert (=> b!1088902 (=> (not res!726301) (not e!621959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088902 (= res!726301 (validKeyInArray!0 k0!904))))

(declare-fun res!726298 () Bool)

(assert (=> start!96036 (=> (not res!726298) (not e!621959))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96036 (= res!726298 (validMask!0 mask!1414))))

(assert (=> start!96036 e!621959))

(assert (=> start!96036 tp!79916))

(assert (=> start!96036 true))

(assert (=> start!96036 tp_is_empty!26691))

(declare-fun array_inv!26090 (array!70307) Bool)

(assert (=> start!96036 (array_inv!26090 _keys!1070)))

(declare-datatypes ((ValueCell!12636 0))(
  ( (ValueCellFull!12636 (v!16023 V!40715)) (EmptyCell!12636) )
))
(declare-datatypes ((array!70309 0))(
  ( (array!70310 (arr!33828 (Array (_ BitVec 32) ValueCell!12636)) (size!34364 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70309)

(declare-fun e!621962 () Bool)

(declare-fun array_inv!26091 (array!70309) Bool)

(assert (=> start!96036 (and (array_inv!26091 _values!874) e!621962)))

(declare-fun mapIsEmpty!41791 () Bool)

(declare-fun mapRes!41791 () Bool)

(assert (=> mapIsEmpty!41791 mapRes!41791))

(declare-fun b!1088903 () Bool)

(declare-fun e!621961 () Bool)

(assert (=> b!1088903 (= e!621961 tp_is_empty!26691)))

(declare-fun b!1088904 () Bool)

(declare-fun res!726302 () Bool)

(assert (=> b!1088904 (=> (not res!726302) (not e!621959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70307 (_ BitVec 32)) Bool)

(assert (=> b!1088904 (= res!726302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088905 () Bool)

(declare-fun e!621958 () Bool)

(assert (=> b!1088905 (= e!621958 (not e!621957))))

(declare-fun res!726300 () Bool)

(assert (=> b!1088905 (=> res!726300 e!621957)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088905 (= res!726300 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40715)

(declare-fun getCurrentListMap!4283 (array!70307 array!70309 (_ BitVec 32) (_ BitVec 32) V!40715 V!40715 (_ BitVec 32) Int) ListLongMap!14989)

(assert (=> b!1088905 (= lt!485204 (getCurrentListMap!4283 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485209 () array!70307)

(declare-fun lt!485208 () array!70309)

(assert (=> b!1088905 (= lt!485207 (getCurrentListMap!4283 lt!485209 lt!485208 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088905 (and (= lt!485213 lt!485205) (= lt!485205 lt!485213))))

(declare-fun -!835 (ListLongMap!14989 (_ BitVec 64)) ListLongMap!14989)

(assert (=> b!1088905 (= lt!485205 (-!835 lt!485212 k0!904))))

(declare-datatypes ((Unit!35836 0))(
  ( (Unit!35837) )
))
(declare-fun lt!485215 () Unit!35836)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!102 (array!70307 array!70309 (_ BitVec 32) (_ BitVec 32) V!40715 V!40715 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35836)

(assert (=> b!1088905 (= lt!485215 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!102 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4043 (array!70307 array!70309 (_ BitVec 32) (_ BitVec 32) V!40715 V!40715 (_ BitVec 32) Int) ListLongMap!14989)

(assert (=> b!1088905 (= lt!485213 (getCurrentListMapNoExtraKeys!4043 lt!485209 lt!485208 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2180 (Int (_ BitVec 64)) V!40715)

(assert (=> b!1088905 (= lt!485208 (array!70310 (store (arr!33828 _values!874) i!650 (ValueCellFull!12636 (dynLambda!2180 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34364 _values!874)))))

(assert (=> b!1088905 (= lt!485212 (getCurrentListMapNoExtraKeys!4043 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088905 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485203 () Unit!35836)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70307 (_ BitVec 64) (_ BitVec 32)) Unit!35836)

(assert (=> b!1088905 (= lt!485203 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1088906 () Bool)

(declare-fun res!726303 () Bool)

(assert (=> b!1088906 (=> (not res!726303) (not e!621959))))

(assert (=> b!1088906 (= res!726303 (and (= (size!34364 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34363 _keys!1070) (size!34364 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088907 () Bool)

(declare-fun res!726295 () Bool)

(assert (=> b!1088907 (=> (not res!726295) (not e!621959))))

(declare-datatypes ((List!23609 0))(
  ( (Nil!23606) (Cons!23605 (h!24814 (_ BitVec 64)) (t!33356 List!23609)) )
))
(declare-fun arrayNoDuplicates!0 (array!70307 (_ BitVec 32) List!23609) Bool)

(assert (=> b!1088907 (= res!726295 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23606))))

(declare-fun b!1088908 () Bool)

(assert (=> b!1088908 (= e!621962 (and e!621961 mapRes!41791))))

(declare-fun condMapEmpty!41791 () Bool)

(declare-fun mapDefault!41791 () ValueCell!12636)

(assert (=> b!1088908 (= condMapEmpty!41791 (= (arr!33828 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12636)) mapDefault!41791)))))

(declare-fun b!1088909 () Bool)

(assert (=> b!1088909 (= e!621959 e!621958)))

(declare-fun res!726296 () Bool)

(assert (=> b!1088909 (=> (not res!726296) (not e!621958))))

(assert (=> b!1088909 (= res!726296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485209 mask!1414))))

(assert (=> b!1088909 (= lt!485209 (array!70308 (store (arr!33827 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34363 _keys!1070)))))

(declare-fun mapNonEmpty!41791 () Bool)

(declare-fun tp!79915 () Bool)

(assert (=> mapNonEmpty!41791 (= mapRes!41791 (and tp!79915 e!621955))))

(declare-fun mapKey!41791 () (_ BitVec 32))

(declare-fun mapRest!41791 () (Array (_ BitVec 32) ValueCell!12636))

(declare-fun mapValue!41791 () ValueCell!12636)

(assert (=> mapNonEmpty!41791 (= (arr!33828 _values!874) (store mapRest!41791 mapKey!41791 mapValue!41791))))

(declare-fun b!1088910 () Bool)

(assert (=> b!1088910 (= e!621960 true)))

(assert (=> b!1088910 (= (-!835 lt!485214 k0!904) lt!485211)))

(declare-fun lt!485210 () Unit!35836)

(declare-fun addRemoveCommutativeForDiffKeys!63 (ListLongMap!14989 (_ BitVec 64) V!40715 (_ BitVec 64)) Unit!35836)

(assert (=> b!1088910 (= lt!485210 (addRemoveCommutativeForDiffKeys!63 lt!485212 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1088911 () Bool)

(declare-fun res!726293 () Bool)

(assert (=> b!1088911 (=> (not res!726293) (not e!621958))))

(assert (=> b!1088911 (= res!726293 (arrayNoDuplicates!0 lt!485209 #b00000000000000000000000000000000 Nil!23606))))

(assert (= (and start!96036 res!726298) b!1088906))

(assert (= (and b!1088906 res!726303) b!1088904))

(assert (= (and b!1088904 res!726302) b!1088907))

(assert (= (and b!1088907 res!726295) b!1088901))

(assert (= (and b!1088901 res!726297) b!1088902))

(assert (= (and b!1088902 res!726301) b!1088900))

(assert (= (and b!1088900 res!726294) b!1088909))

(assert (= (and b!1088909 res!726296) b!1088911))

(assert (= (and b!1088911 res!726293) b!1088905))

(assert (= (and b!1088905 (not res!726300)) b!1088898))

(assert (= (and b!1088898 (not res!726299)) b!1088910))

(assert (= (and b!1088908 condMapEmpty!41791) mapIsEmpty!41791))

(assert (= (and b!1088908 (not condMapEmpty!41791)) mapNonEmpty!41791))

(get-info :version)

(assert (= (and mapNonEmpty!41791 ((_ is ValueCellFull!12636) mapValue!41791)) b!1088899))

(assert (= (and b!1088908 ((_ is ValueCellFull!12636) mapDefault!41791)) b!1088903))

(assert (= start!96036 b!1088908))

(declare-fun b_lambda!17359 () Bool)

(assert (=> (not b_lambda!17359) (not b!1088905)))

(declare-fun t!33354 () Bool)

(declare-fun tb!7567 () Bool)

(assert (=> (and start!96036 (= defaultEntry!882 defaultEntry!882) t!33354) tb!7567))

(declare-fun result!15653 () Bool)

(assert (=> tb!7567 (= result!15653 tp_is_empty!26691)))

(assert (=> b!1088905 t!33354))

(declare-fun b_and!36055 () Bool)

(assert (= b_and!36053 (and (=> t!33354 result!15653) b_and!36055)))

(declare-fun m!1008047 () Bool)

(assert (=> b!1088911 m!1008047))

(declare-fun m!1008049 () Bool)

(assert (=> b!1088909 m!1008049))

(declare-fun m!1008051 () Bool)

(assert (=> b!1088909 m!1008051))

(declare-fun m!1008053 () Bool)

(assert (=> b!1088904 m!1008053))

(declare-fun m!1008055 () Bool)

(assert (=> b!1088898 m!1008055))

(declare-fun m!1008057 () Bool)

(assert (=> b!1088898 m!1008057))

(declare-fun m!1008059 () Bool)

(assert (=> b!1088898 m!1008059))

(declare-fun m!1008061 () Bool)

(assert (=> mapNonEmpty!41791 m!1008061))

(declare-fun m!1008063 () Bool)

(assert (=> b!1088900 m!1008063))

(declare-fun m!1008065 () Bool)

(assert (=> b!1088907 m!1008065))

(declare-fun m!1008067 () Bool)

(assert (=> b!1088902 m!1008067))

(declare-fun m!1008069 () Bool)

(assert (=> b!1088910 m!1008069))

(declare-fun m!1008071 () Bool)

(assert (=> b!1088910 m!1008071))

(declare-fun m!1008073 () Bool)

(assert (=> start!96036 m!1008073))

(declare-fun m!1008075 () Bool)

(assert (=> start!96036 m!1008075))

(declare-fun m!1008077 () Bool)

(assert (=> start!96036 m!1008077))

(declare-fun m!1008079 () Bool)

(assert (=> b!1088905 m!1008079))

(declare-fun m!1008081 () Bool)

(assert (=> b!1088905 m!1008081))

(declare-fun m!1008083 () Bool)

(assert (=> b!1088905 m!1008083))

(declare-fun m!1008085 () Bool)

(assert (=> b!1088905 m!1008085))

(declare-fun m!1008087 () Bool)

(assert (=> b!1088905 m!1008087))

(declare-fun m!1008089 () Bool)

(assert (=> b!1088905 m!1008089))

(declare-fun m!1008091 () Bool)

(assert (=> b!1088905 m!1008091))

(declare-fun m!1008093 () Bool)

(assert (=> b!1088905 m!1008093))

(declare-fun m!1008095 () Bool)

(assert (=> b!1088905 m!1008095))

(declare-fun m!1008097 () Bool)

(assert (=> b!1088905 m!1008097))

(check-sat (not start!96036) (not b!1088898) tp_is_empty!26691 (not b_lambda!17359) (not b!1088907) (not mapNonEmpty!41791) (not b_next!22689) (not b!1088911) (not b!1088909) (not b!1088905) b_and!36055 (not b!1088910) (not b!1088904) (not b!1088902))
(check-sat b_and!36055 (not b_next!22689))
