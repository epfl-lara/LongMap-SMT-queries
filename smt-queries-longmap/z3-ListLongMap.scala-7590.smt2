; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95862 () Bool)

(assert start!95862)

(declare-fun b_free!22515 () Bool)

(declare-fun b_next!22515 () Bool)

(assert (=> start!95862 (= b_free!22515 (not b_next!22515))))

(declare-fun tp!79394 () Bool)

(declare-fun b_and!35705 () Bool)

(assert (=> start!95862 (= tp!79394 b_and!35705)))

(declare-fun mapIsEmpty!41530 () Bool)

(declare-fun mapRes!41530 () Bool)

(assert (=> mapIsEmpty!41530 mapRes!41530))

(declare-fun b!1085061 () Bool)

(declare-fun e!619871 () Bool)

(declare-fun e!619869 () Bool)

(assert (=> b!1085061 (= e!619871 e!619869)))

(declare-fun res!723415 () Bool)

(assert (=> b!1085061 (=> res!723415 e!619869)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1085061 (= res!723415 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40483 0))(
  ( (V!40484 (val!13315 Int)) )
))
(declare-datatypes ((tuple2!16882 0))(
  ( (tuple2!16883 (_1!8452 (_ BitVec 64)) (_2!8452 V!40483)) )
))
(declare-datatypes ((List!23471 0))(
  ( (Nil!23468) (Cons!23467 (h!24676 tuple2!16882) (t!33044 List!23471)) )
))
(declare-datatypes ((ListLongMap!14851 0))(
  ( (ListLongMap!14852 (toList!7441 List!23471)) )
))
(declare-fun lt!481248 () ListLongMap!14851)

(declare-fun lt!481246 () ListLongMap!14851)

(assert (=> b!1085061 (= lt!481248 lt!481246)))

(declare-fun lt!481261 () ListLongMap!14851)

(declare-fun -!767 (ListLongMap!14851 (_ BitVec 64)) ListLongMap!14851)

(assert (=> b!1085061 (= lt!481248 (-!767 lt!481261 k0!904))))

(declare-fun lt!481259 () ListLongMap!14851)

(declare-datatypes ((Unit!35700 0))(
  ( (Unit!35701) )
))
(declare-fun lt!481245 () Unit!35700)

(declare-fun zeroValue!831 () V!40483)

(declare-fun addRemoveCommutativeForDiffKeys!6 (ListLongMap!14851 (_ BitVec 64) V!40483 (_ BitVec 64)) Unit!35700)

(assert (=> b!1085061 (= lt!481245 (addRemoveCommutativeForDiffKeys!6 lt!481259 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!481253 () ListLongMap!14851)

(declare-fun lt!481257 () tuple2!16882)

(declare-fun +!3250 (ListLongMap!14851 tuple2!16882) ListLongMap!14851)

(assert (=> b!1085061 (= lt!481253 (+!3250 lt!481246 lt!481257))))

(declare-fun lt!481251 () ListLongMap!14851)

(declare-fun lt!481256 () tuple2!16882)

(assert (=> b!1085061 (= lt!481246 (+!3250 lt!481251 lt!481256))))

(declare-fun lt!481252 () ListLongMap!14851)

(declare-fun lt!481260 () ListLongMap!14851)

(assert (=> b!1085061 (= lt!481252 lt!481260)))

(assert (=> b!1085061 (= lt!481260 (+!3250 lt!481261 lt!481257))))

(assert (=> b!1085061 (= lt!481261 (+!3250 lt!481259 lt!481256))))

(declare-fun lt!481255 () ListLongMap!14851)

(assert (=> b!1085061 (= lt!481253 (+!3250 (+!3250 lt!481255 lt!481256) lt!481257))))

(declare-fun minValue!831 () V!40483)

(assert (=> b!1085061 (= lt!481257 (tuple2!16883 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085061 (= lt!481256 (tuple2!16883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!723418 () Bool)

(declare-fun e!619874 () Bool)

(assert (=> start!95862 (=> (not res!723418) (not e!619874))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95862 (= res!723418 (validMask!0 mask!1414))))

(assert (=> start!95862 e!619874))

(assert (=> start!95862 tp!79394))

(assert (=> start!95862 true))

(declare-fun tp_is_empty!26517 () Bool)

(assert (=> start!95862 tp_is_empty!26517))

(declare-datatypes ((array!69971 0))(
  ( (array!69972 (arr!33659 (Array (_ BitVec 32) (_ BitVec 64))) (size!34195 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69971)

(declare-fun array_inv!25976 (array!69971) Bool)

(assert (=> start!95862 (array_inv!25976 _keys!1070)))

(declare-datatypes ((ValueCell!12549 0))(
  ( (ValueCellFull!12549 (v!15936 V!40483)) (EmptyCell!12549) )
))
(declare-datatypes ((array!69973 0))(
  ( (array!69974 (arr!33660 (Array (_ BitVec 32) ValueCell!12549)) (size!34196 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69973)

(declare-fun e!619870 () Bool)

(declare-fun array_inv!25977 (array!69973) Bool)

(assert (=> start!95862 (and (array_inv!25977 _values!874) e!619870)))

(declare-fun b!1085062 () Bool)

(declare-fun e!619867 () Bool)

(assert (=> b!1085062 (= e!619867 tp_is_empty!26517)))

(declare-fun b!1085063 () Bool)

(declare-fun e!619872 () Bool)

(assert (=> b!1085063 (= e!619874 e!619872)))

(declare-fun res!723420 () Bool)

(assert (=> b!1085063 (=> (not res!723420) (not e!619872))))

(declare-fun lt!481247 () array!69971)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69971 (_ BitVec 32)) Bool)

(assert (=> b!1085063 (= res!723420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481247 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085063 (= lt!481247 (array!69972 (store (arr!33659 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34195 _keys!1070)))))

(declare-fun b!1085064 () Bool)

(declare-fun res!723419 () Bool)

(assert (=> b!1085064 (=> (not res!723419) (not e!619874))))

(assert (=> b!1085064 (= res!723419 (= (select (arr!33659 _keys!1070) i!650) k0!904))))

(declare-fun b!1085065 () Bool)

(declare-fun e!619868 () Bool)

(assert (=> b!1085065 (= e!619868 tp_is_empty!26517)))

(declare-fun b!1085066 () Bool)

(declare-fun res!723413 () Bool)

(assert (=> b!1085066 (=> (not res!723413) (not e!619874))))

(declare-datatypes ((List!23472 0))(
  ( (Nil!23469) (Cons!23468 (h!24677 (_ BitVec 64)) (t!33045 List!23472)) )
))
(declare-fun arrayNoDuplicates!0 (array!69971 (_ BitVec 32) List!23472) Bool)

(assert (=> b!1085066 (= res!723413 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23469))))

(declare-fun mapNonEmpty!41530 () Bool)

(declare-fun tp!79393 () Bool)

(assert (=> mapNonEmpty!41530 (= mapRes!41530 (and tp!79393 e!619867))))

(declare-fun mapValue!41530 () ValueCell!12549)

(declare-fun mapRest!41530 () (Array (_ BitVec 32) ValueCell!12549))

(declare-fun mapKey!41530 () (_ BitVec 32))

(assert (=> mapNonEmpty!41530 (= (arr!33660 _values!874) (store mapRest!41530 mapKey!41530 mapValue!41530))))

(declare-fun b!1085067 () Bool)

(declare-fun res!723417 () Bool)

(assert (=> b!1085067 (=> (not res!723417) (not e!619874))))

(assert (=> b!1085067 (= res!723417 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34195 _keys!1070))))))

(declare-fun b!1085068 () Bool)

(declare-fun res!723416 () Bool)

(assert (=> b!1085068 (=> (not res!723416) (not e!619874))))

(assert (=> b!1085068 (= res!723416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085069 () Bool)

(declare-fun res!723423 () Bool)

(assert (=> b!1085069 (=> (not res!723423) (not e!619874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085069 (= res!723423 (validKeyInArray!0 k0!904))))

(declare-fun b!1085070 () Bool)

(declare-fun res!723414 () Bool)

(assert (=> b!1085070 (=> (not res!723414) (not e!619872))))

(assert (=> b!1085070 (= res!723414 (arrayNoDuplicates!0 lt!481247 #b00000000000000000000000000000000 Nil!23469))))

(declare-fun b!1085071 () Bool)

(assert (=> b!1085071 (= e!619869 true)))

(assert (=> b!1085071 (= (-!767 lt!481260 k0!904) (+!3250 lt!481248 lt!481257))))

(declare-fun lt!481254 () Unit!35700)

(assert (=> b!1085071 (= lt!481254 (addRemoveCommutativeForDiffKeys!6 lt!481261 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1085072 () Bool)

(declare-fun res!723422 () Bool)

(assert (=> b!1085072 (=> (not res!723422) (not e!619874))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085072 (= res!723422 (and (= (size!34196 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34195 _keys!1070) (size!34196 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085073 () Bool)

(assert (=> b!1085073 (= e!619870 (and e!619868 mapRes!41530))))

(declare-fun condMapEmpty!41530 () Bool)

(declare-fun mapDefault!41530 () ValueCell!12549)

(assert (=> b!1085073 (= condMapEmpty!41530 (= (arr!33660 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12549)) mapDefault!41530)))))

(declare-fun b!1085074 () Bool)

(assert (=> b!1085074 (= e!619872 (not e!619871))))

(declare-fun res!723421 () Bool)

(assert (=> b!1085074 (=> res!723421 e!619871)))

(assert (=> b!1085074 (= res!723421 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4227 (array!69971 array!69973 (_ BitVec 32) (_ BitVec 32) V!40483 V!40483 (_ BitVec 32) Int) ListLongMap!14851)

(assert (=> b!1085074 (= lt!481252 (getCurrentListMap!4227 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481250 () array!69973)

(assert (=> b!1085074 (= lt!481253 (getCurrentListMap!4227 lt!481247 lt!481250 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1085074 (and (= lt!481255 lt!481251) (= lt!481251 lt!481255))))

(assert (=> b!1085074 (= lt!481251 (-!767 lt!481259 k0!904))))

(declare-fun lt!481258 () Unit!35700)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!46 (array!69971 array!69973 (_ BitVec 32) (_ BitVec 32) V!40483 V!40483 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35700)

(assert (=> b!1085074 (= lt!481258 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!46 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3987 (array!69971 array!69973 (_ BitVec 32) (_ BitVec 32) V!40483 V!40483 (_ BitVec 32) Int) ListLongMap!14851)

(assert (=> b!1085074 (= lt!481255 (getCurrentListMapNoExtraKeys!3987 lt!481247 lt!481250 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2124 (Int (_ BitVec 64)) V!40483)

(assert (=> b!1085074 (= lt!481250 (array!69974 (store (arr!33660 _values!874) i!650 (ValueCellFull!12549 (dynLambda!2124 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34196 _values!874)))))

(assert (=> b!1085074 (= lt!481259 (getCurrentListMapNoExtraKeys!3987 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085074 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481249 () Unit!35700)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69971 (_ BitVec 64) (_ BitVec 32)) Unit!35700)

(assert (=> b!1085074 (= lt!481249 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!95862 res!723418) b!1085072))

(assert (= (and b!1085072 res!723422) b!1085068))

(assert (= (and b!1085068 res!723416) b!1085066))

(assert (= (and b!1085066 res!723413) b!1085067))

(assert (= (and b!1085067 res!723417) b!1085069))

(assert (= (and b!1085069 res!723423) b!1085064))

(assert (= (and b!1085064 res!723419) b!1085063))

(assert (= (and b!1085063 res!723420) b!1085070))

(assert (= (and b!1085070 res!723414) b!1085074))

(assert (= (and b!1085074 (not res!723421)) b!1085061))

(assert (= (and b!1085061 (not res!723415)) b!1085071))

(assert (= (and b!1085073 condMapEmpty!41530) mapIsEmpty!41530))

(assert (= (and b!1085073 (not condMapEmpty!41530)) mapNonEmpty!41530))

(get-info :version)

(assert (= (and mapNonEmpty!41530 ((_ is ValueCellFull!12549) mapValue!41530)) b!1085062))

(assert (= (and b!1085073 ((_ is ValueCellFull!12549) mapDefault!41530)) b!1085065))

(assert (= start!95862 b!1085073))

(declare-fun b_lambda!17185 () Bool)

(assert (=> (not b_lambda!17185) (not b!1085074)))

(declare-fun t!33043 () Bool)

(declare-fun tb!7393 () Bool)

(assert (=> (and start!95862 (= defaultEntry!882 defaultEntry!882) t!33043) tb!7393))

(declare-fun result!15305 () Bool)

(assert (=> tb!7393 (= result!15305 tp_is_empty!26517)))

(assert (=> b!1085074 t!33043))

(declare-fun b_and!35707 () Bool)

(assert (= b_and!35705 (and (=> t!33043 result!15305) b_and!35707)))

(declare-fun m!1002935 () Bool)

(assert (=> b!1085070 m!1002935))

(declare-fun m!1002937 () Bool)

(assert (=> mapNonEmpty!41530 m!1002937))

(declare-fun m!1002939 () Bool)

(assert (=> b!1085063 m!1002939))

(declare-fun m!1002941 () Bool)

(assert (=> b!1085063 m!1002941))

(declare-fun m!1002943 () Bool)

(assert (=> b!1085074 m!1002943))

(declare-fun m!1002945 () Bool)

(assert (=> b!1085074 m!1002945))

(declare-fun m!1002947 () Bool)

(assert (=> b!1085074 m!1002947))

(declare-fun m!1002949 () Bool)

(assert (=> b!1085074 m!1002949))

(declare-fun m!1002951 () Bool)

(assert (=> b!1085074 m!1002951))

(declare-fun m!1002953 () Bool)

(assert (=> b!1085074 m!1002953))

(declare-fun m!1002955 () Bool)

(assert (=> b!1085074 m!1002955))

(declare-fun m!1002957 () Bool)

(assert (=> b!1085074 m!1002957))

(declare-fun m!1002959 () Bool)

(assert (=> b!1085074 m!1002959))

(declare-fun m!1002961 () Bool)

(assert (=> b!1085074 m!1002961))

(declare-fun m!1002963 () Bool)

(assert (=> b!1085068 m!1002963))

(declare-fun m!1002965 () Bool)

(assert (=> b!1085066 m!1002965))

(declare-fun m!1002967 () Bool)

(assert (=> start!95862 m!1002967))

(declare-fun m!1002969 () Bool)

(assert (=> start!95862 m!1002969))

(declare-fun m!1002971 () Bool)

(assert (=> start!95862 m!1002971))

(declare-fun m!1002973 () Bool)

(assert (=> b!1085071 m!1002973))

(declare-fun m!1002975 () Bool)

(assert (=> b!1085071 m!1002975))

(declare-fun m!1002977 () Bool)

(assert (=> b!1085071 m!1002977))

(declare-fun m!1002979 () Bool)

(assert (=> b!1085061 m!1002979))

(declare-fun m!1002981 () Bool)

(assert (=> b!1085061 m!1002981))

(declare-fun m!1002983 () Bool)

(assert (=> b!1085061 m!1002983))

(declare-fun m!1002985 () Bool)

(assert (=> b!1085061 m!1002985))

(declare-fun m!1002987 () Bool)

(assert (=> b!1085061 m!1002987))

(assert (=> b!1085061 m!1002979))

(declare-fun m!1002989 () Bool)

(assert (=> b!1085061 m!1002989))

(declare-fun m!1002991 () Bool)

(assert (=> b!1085061 m!1002991))

(declare-fun m!1002993 () Bool)

(assert (=> b!1085061 m!1002993))

(declare-fun m!1002995 () Bool)

(assert (=> b!1085064 m!1002995))

(declare-fun m!1002997 () Bool)

(assert (=> b!1085069 m!1002997))

(check-sat (not b!1085068) (not b!1085071) b_and!35707 (not b_lambda!17185) (not b!1085074) (not start!95862) (not b!1085066) (not b!1085069) (not mapNonEmpty!41530) tp_is_empty!26517 (not b!1085063) (not b_next!22515) (not b!1085070) (not b!1085061))
(check-sat b_and!35707 (not b_next!22515))
