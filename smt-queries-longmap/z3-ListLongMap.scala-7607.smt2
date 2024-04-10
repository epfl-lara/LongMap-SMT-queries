; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95964 () Bool)

(assert start!95964)

(declare-fun b_free!22617 () Bool)

(declare-fun b_next!22617 () Bool)

(assert (=> start!95964 (= b_free!22617 (not b_next!22617))))

(declare-fun tp!79700 () Bool)

(declare-fun b_and!35909 () Bool)

(assert (=> start!95964 (= tp!79700 b_and!35909)))

(declare-fun res!725103 () Bool)

(declare-fun e!621092 () Bool)

(assert (=> start!95964 (=> (not res!725103) (not e!621092))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95964 (= res!725103 (validMask!0 mask!1414))))

(assert (=> start!95964 e!621092))

(assert (=> start!95964 tp!79700))

(assert (=> start!95964 true))

(declare-fun tp_is_empty!26619 () Bool)

(assert (=> start!95964 tp_is_empty!26619))

(declare-datatypes ((array!70165 0))(
  ( (array!70166 (arr!33756 (Array (_ BitVec 32) (_ BitVec 64))) (size!34292 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70165)

(declare-fun array_inv!26040 (array!70165) Bool)

(assert (=> start!95964 (array_inv!26040 _keys!1070)))

(declare-datatypes ((V!40619 0))(
  ( (V!40620 (val!13366 Int)) )
))
(declare-datatypes ((ValueCell!12600 0))(
  ( (ValueCellFull!12600 (v!15987 V!40619)) (EmptyCell!12600) )
))
(declare-datatypes ((array!70167 0))(
  ( (array!70168 (arr!33757 (Array (_ BitVec 32) ValueCell!12600)) (size!34293 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70167)

(declare-fun e!621094 () Bool)

(declare-fun array_inv!26041 (array!70167) Bool)

(assert (=> start!95964 (and (array_inv!26041 _values!874) e!621094)))

(declare-fun b!1087310 () Bool)

(declare-fun e!621096 () Bool)

(assert (=> b!1087310 (= e!621092 e!621096)))

(declare-fun res!725110 () Bool)

(assert (=> b!1087310 (=> (not res!725110) (not e!621096))))

(declare-fun lt!483820 () array!70165)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70165 (_ BitVec 32)) Bool)

(assert (=> b!1087310 (= res!725110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483820 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087310 (= lt!483820 (array!70166 (store (arr!33756 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34292 _keys!1070)))))

(declare-fun b!1087311 () Bool)

(declare-fun res!725108 () Bool)

(assert (=> b!1087311 (=> (not res!725108) (not e!621092))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1087311 (= res!725108 (= (select (arr!33756 _keys!1070) i!650) k0!904))))

(declare-fun b!1087312 () Bool)

(declare-fun res!725111 () Bool)

(assert (=> b!1087312 (=> (not res!725111) (not e!621092))))

(assert (=> b!1087312 (= res!725111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087313 () Bool)

(declare-fun e!621098 () Bool)

(assert (=> b!1087313 (= e!621098 true)))

(declare-fun e!621093 () Bool)

(assert (=> b!1087313 e!621093))

(declare-fun res!725102 () Bool)

(assert (=> b!1087313 (=> (not res!725102) (not e!621093))))

(declare-datatypes ((tuple2!16960 0))(
  ( (tuple2!16961 (_1!8491 (_ BitVec 64)) (_2!8491 V!40619)) )
))
(declare-datatypes ((List!23547 0))(
  ( (Nil!23544) (Cons!23543 (h!24752 tuple2!16960) (t!33222 List!23547)) )
))
(declare-datatypes ((ListLongMap!14929 0))(
  ( (ListLongMap!14930 (toList!7480 List!23547)) )
))
(declare-fun lt!483819 () ListLongMap!14929)

(declare-fun lt!483817 () ListLongMap!14929)

(declare-fun lt!483816 () tuple2!16960)

(declare-fun +!3285 (ListLongMap!14929 tuple2!16960) ListLongMap!14929)

(assert (=> b!1087313 (= res!725102 (= lt!483819 (+!3285 lt!483817 lt!483816)))))

(declare-fun zeroValue!831 () V!40619)

(assert (=> b!1087313 (= lt!483816 (tuple2!16961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087314 () Bool)

(assert (=> b!1087314 (= e!621096 (not e!621098))))

(declare-fun res!725104 () Bool)

(assert (=> b!1087314 (=> res!725104 e!621098)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087314 (= res!725104 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!483811 () ListLongMap!14929)

(declare-fun minValue!831 () V!40619)

(declare-fun getCurrentListMap!4256 (array!70165 array!70167 (_ BitVec 32) (_ BitVec 32) V!40619 V!40619 (_ BitVec 32) Int) ListLongMap!14929)

(assert (=> b!1087314 (= lt!483811 (getCurrentListMap!4256 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483814 () array!70167)

(assert (=> b!1087314 (= lt!483819 (getCurrentListMap!4256 lt!483820 lt!483814 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483813 () ListLongMap!14929)

(assert (=> b!1087314 (and (= lt!483817 lt!483813) (= lt!483813 lt!483817))))

(declare-fun lt!483815 () ListLongMap!14929)

(declare-fun -!806 (ListLongMap!14929 (_ BitVec 64)) ListLongMap!14929)

(assert (=> b!1087314 (= lt!483813 (-!806 lt!483815 k0!904))))

(declare-datatypes ((Unit!35778 0))(
  ( (Unit!35779) )
))
(declare-fun lt!483812 () Unit!35778)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!75 (array!70165 array!70167 (_ BitVec 32) (_ BitVec 32) V!40619 V!40619 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35778)

(assert (=> b!1087314 (= lt!483812 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!75 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4016 (array!70165 array!70167 (_ BitVec 32) (_ BitVec 32) V!40619 V!40619 (_ BitVec 32) Int) ListLongMap!14929)

(assert (=> b!1087314 (= lt!483817 (getCurrentListMapNoExtraKeys!4016 lt!483820 lt!483814 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2153 (Int (_ BitVec 64)) V!40619)

(assert (=> b!1087314 (= lt!483814 (array!70168 (store (arr!33757 _values!874) i!650 (ValueCellFull!12600 (dynLambda!2153 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34293 _values!874)))))

(assert (=> b!1087314 (= lt!483815 (getCurrentListMapNoExtraKeys!4016 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087314 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483818 () Unit!35778)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70165 (_ BitVec 64) (_ BitVec 32)) Unit!35778)

(assert (=> b!1087314 (= lt!483818 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087315 () Bool)

(declare-fun res!725107 () Bool)

(assert (=> b!1087315 (=> (not res!725107) (not e!621096))))

(declare-datatypes ((List!23548 0))(
  ( (Nil!23545) (Cons!23544 (h!24753 (_ BitVec 64)) (t!33223 List!23548)) )
))
(declare-fun arrayNoDuplicates!0 (array!70165 (_ BitVec 32) List!23548) Bool)

(assert (=> b!1087315 (= res!725107 (arrayNoDuplicates!0 lt!483820 #b00000000000000000000000000000000 Nil!23545))))

(declare-fun mapNonEmpty!41683 () Bool)

(declare-fun mapRes!41683 () Bool)

(declare-fun tp!79699 () Bool)

(declare-fun e!621091 () Bool)

(assert (=> mapNonEmpty!41683 (= mapRes!41683 (and tp!79699 e!621091))))

(declare-fun mapValue!41683 () ValueCell!12600)

(declare-fun mapRest!41683 () (Array (_ BitVec 32) ValueCell!12600))

(declare-fun mapKey!41683 () (_ BitVec 32))

(assert (=> mapNonEmpty!41683 (= (arr!33757 _values!874) (store mapRest!41683 mapKey!41683 mapValue!41683))))

(declare-fun b!1087316 () Bool)

(declare-fun res!725101 () Bool)

(assert (=> b!1087316 (=> (not res!725101) (not e!621092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087316 (= res!725101 (validKeyInArray!0 k0!904))))

(declare-fun b!1087317 () Bool)

(declare-fun res!725106 () Bool)

(assert (=> b!1087317 (=> (not res!725106) (not e!621093))))

(assert (=> b!1087317 (= res!725106 (= lt!483811 (+!3285 lt!483815 lt!483816)))))

(declare-fun b!1087318 () Bool)

(declare-fun res!725109 () Bool)

(assert (=> b!1087318 (=> (not res!725109) (not e!621092))))

(assert (=> b!1087318 (= res!725109 (and (= (size!34293 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34292 _keys!1070) (size!34293 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087319 () Bool)

(declare-fun e!621095 () Bool)

(assert (=> b!1087319 (= e!621094 (and e!621095 mapRes!41683))))

(declare-fun condMapEmpty!41683 () Bool)

(declare-fun mapDefault!41683 () ValueCell!12600)

(assert (=> b!1087319 (= condMapEmpty!41683 (= (arr!33757 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12600)) mapDefault!41683)))))

(declare-fun b!1087320 () Bool)

(assert (=> b!1087320 (= e!621095 tp_is_empty!26619)))

(declare-fun b!1087321 () Bool)

(assert (=> b!1087321 (= e!621093 (= lt!483819 (+!3285 lt!483813 lt!483816)))))

(declare-fun b!1087322 () Bool)

(declare-fun res!725112 () Bool)

(assert (=> b!1087322 (=> (not res!725112) (not e!621092))))

(assert (=> b!1087322 (= res!725112 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23545))))

(declare-fun mapIsEmpty!41683 () Bool)

(assert (=> mapIsEmpty!41683 mapRes!41683))

(declare-fun b!1087323 () Bool)

(declare-fun res!725105 () Bool)

(assert (=> b!1087323 (=> (not res!725105) (not e!621092))))

(assert (=> b!1087323 (= res!725105 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34292 _keys!1070))))))

(declare-fun b!1087324 () Bool)

(assert (=> b!1087324 (= e!621091 tp_is_empty!26619)))

(assert (= (and start!95964 res!725103) b!1087318))

(assert (= (and b!1087318 res!725109) b!1087312))

(assert (= (and b!1087312 res!725111) b!1087322))

(assert (= (and b!1087322 res!725112) b!1087323))

(assert (= (and b!1087323 res!725105) b!1087316))

(assert (= (and b!1087316 res!725101) b!1087311))

(assert (= (and b!1087311 res!725108) b!1087310))

(assert (= (and b!1087310 res!725110) b!1087315))

(assert (= (and b!1087315 res!725107) b!1087314))

(assert (= (and b!1087314 (not res!725104)) b!1087313))

(assert (= (and b!1087313 res!725102) b!1087317))

(assert (= (and b!1087317 res!725106) b!1087321))

(assert (= (and b!1087319 condMapEmpty!41683) mapIsEmpty!41683))

(assert (= (and b!1087319 (not condMapEmpty!41683)) mapNonEmpty!41683))

(get-info :version)

(assert (= (and mapNonEmpty!41683 ((_ is ValueCellFull!12600) mapValue!41683)) b!1087324))

(assert (= (and b!1087319 ((_ is ValueCellFull!12600) mapDefault!41683)) b!1087320))

(assert (= start!95964 b!1087319))

(declare-fun b_lambda!17287 () Bool)

(assert (=> (not b_lambda!17287) (not b!1087314)))

(declare-fun t!33221 () Bool)

(declare-fun tb!7495 () Bool)

(assert (=> (and start!95964 (= defaultEntry!882 defaultEntry!882) t!33221) tb!7495))

(declare-fun result!15509 () Bool)

(assert (=> tb!7495 (= result!15509 tp_is_empty!26619)))

(assert (=> b!1087314 t!33221))

(declare-fun b_and!35911 () Bool)

(assert (= b_and!35909 (and (=> t!33221 result!15509) b_and!35911)))

(declare-fun m!1006183 () Bool)

(assert (=> mapNonEmpty!41683 m!1006183))

(declare-fun m!1006185 () Bool)

(assert (=> start!95964 m!1006185))

(declare-fun m!1006187 () Bool)

(assert (=> start!95964 m!1006187))

(declare-fun m!1006189 () Bool)

(assert (=> start!95964 m!1006189))

(declare-fun m!1006191 () Bool)

(assert (=> b!1087317 m!1006191))

(declare-fun m!1006193 () Bool)

(assert (=> b!1087314 m!1006193))

(declare-fun m!1006195 () Bool)

(assert (=> b!1087314 m!1006195))

(declare-fun m!1006197 () Bool)

(assert (=> b!1087314 m!1006197))

(declare-fun m!1006199 () Bool)

(assert (=> b!1087314 m!1006199))

(declare-fun m!1006201 () Bool)

(assert (=> b!1087314 m!1006201))

(declare-fun m!1006203 () Bool)

(assert (=> b!1087314 m!1006203))

(declare-fun m!1006205 () Bool)

(assert (=> b!1087314 m!1006205))

(declare-fun m!1006207 () Bool)

(assert (=> b!1087314 m!1006207))

(declare-fun m!1006209 () Bool)

(assert (=> b!1087314 m!1006209))

(declare-fun m!1006211 () Bool)

(assert (=> b!1087314 m!1006211))

(declare-fun m!1006213 () Bool)

(assert (=> b!1087321 m!1006213))

(declare-fun m!1006215 () Bool)

(assert (=> b!1087322 m!1006215))

(declare-fun m!1006217 () Bool)

(assert (=> b!1087313 m!1006217))

(declare-fun m!1006219 () Bool)

(assert (=> b!1087311 m!1006219))

(declare-fun m!1006221 () Bool)

(assert (=> b!1087316 m!1006221))

(declare-fun m!1006223 () Bool)

(assert (=> b!1087310 m!1006223))

(declare-fun m!1006225 () Bool)

(assert (=> b!1087310 m!1006225))

(declare-fun m!1006227 () Bool)

(assert (=> b!1087312 m!1006227))

(declare-fun m!1006229 () Bool)

(assert (=> b!1087315 m!1006229))

(check-sat b_and!35911 tp_is_empty!26619 (not b!1087314) (not b!1087312) (not b_lambda!17287) (not b!1087321) (not start!95964) (not b!1087310) (not b!1087315) (not b!1087313) (not b!1087317) (not b!1087316) (not b!1087322) (not b_next!22617) (not mapNonEmpty!41683))
(check-sat b_and!35911 (not b_next!22617))
