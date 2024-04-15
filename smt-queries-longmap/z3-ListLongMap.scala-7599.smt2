; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95908 () Bool)

(assert start!95908)

(declare-fun b_free!22567 () Bool)

(declare-fun b_next!22567 () Bool)

(assert (=> start!95908 (= b_free!22567 (not b_next!22567))))

(declare-fun tp!79550 () Bool)

(declare-fun b_and!35783 () Bool)

(assert (=> start!95908 (= tp!79550 b_and!35783)))

(declare-fun b!1086052 () Bool)

(declare-fun e!620403 () Bool)

(declare-fun tp_is_empty!26569 () Bool)

(assert (=> b!1086052 (= e!620403 tp_is_empty!26569)))

(declare-fun mapNonEmpty!41608 () Bool)

(declare-fun mapRes!41608 () Bool)

(declare-fun tp!79549 () Bool)

(assert (=> mapNonEmpty!41608 (= mapRes!41608 (and tp!79549 e!620403))))

(declare-datatypes ((V!40553 0))(
  ( (V!40554 (val!13341 Int)) )
))
(declare-datatypes ((ValueCell!12575 0))(
  ( (ValueCellFull!12575 (v!15961 V!40553)) (EmptyCell!12575) )
))
(declare-datatypes ((array!69994 0))(
  ( (array!69995 (arr!33671 (Array (_ BitVec 32) ValueCell!12575)) (size!34209 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69994)

(declare-fun mapRest!41608 () (Array (_ BitVec 32) ValueCell!12575))

(declare-fun mapKey!41608 () (_ BitVec 32))

(declare-fun mapValue!41608 () ValueCell!12575)

(assert (=> mapNonEmpty!41608 (= (arr!33671 _values!874) (store mapRest!41608 mapKey!41608 mapValue!41608))))

(declare-fun b!1086053 () Bool)

(declare-fun res!724208 () Bool)

(declare-fun e!620400 () Bool)

(assert (=> b!1086053 (=> (not res!724208) (not e!620400))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086053 (= res!724208 (validKeyInArray!0 k0!904))))

(declare-fun b!1086054 () Bool)

(declare-fun e!620398 () Bool)

(declare-fun e!620399 () Bool)

(assert (=> b!1086054 (= e!620398 (not e!620399))))

(declare-fun res!724212 () Bool)

(assert (=> b!1086054 (=> res!724212 e!620399)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086054 (= res!724212 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40553)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16976 0))(
  ( (tuple2!16977 (_1!8499 (_ BitVec 64)) (_2!8499 V!40553)) )
))
(declare-datatypes ((List!23546 0))(
  ( (Nil!23543) (Cons!23542 (h!24751 tuple2!16976) (t!33162 List!23546)) )
))
(declare-datatypes ((ListLongMap!14945 0))(
  ( (ListLongMap!14946 (toList!7488 List!23546)) )
))
(declare-fun lt!482382 () ListLongMap!14945)

(declare-fun zeroValue!831 () V!40553)

(declare-datatypes ((array!69996 0))(
  ( (array!69997 (arr!33672 (Array (_ BitVec 32) (_ BitVec 64))) (size!34210 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69996)

(declare-fun getCurrentListMap!4174 (array!69996 array!69994 (_ BitVec 32) (_ BitVec 32) V!40553 V!40553 (_ BitVec 32) Int) ListLongMap!14945)

(assert (=> b!1086054 (= lt!482382 (getCurrentListMap!4174 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482378 () array!69994)

(declare-fun lt!482380 () ListLongMap!14945)

(declare-fun lt!482379 () array!69996)

(assert (=> b!1086054 (= lt!482380 (getCurrentListMap!4174 lt!482379 lt!482378 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482385 () ListLongMap!14945)

(declare-fun lt!482383 () ListLongMap!14945)

(assert (=> b!1086054 (and (= lt!482385 lt!482383) (= lt!482383 lt!482385))))

(declare-fun lt!482381 () ListLongMap!14945)

(declare-fun -!767 (ListLongMap!14945 (_ BitVec 64)) ListLongMap!14945)

(assert (=> b!1086054 (= lt!482383 (-!767 lt!482381 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35569 0))(
  ( (Unit!35570) )
))
(declare-fun lt!482387 () Unit!35569)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!58 (array!69996 array!69994 (_ BitVec 32) (_ BitVec 32) V!40553 V!40553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35569)

(assert (=> b!1086054 (= lt!482387 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!58 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4044 (array!69996 array!69994 (_ BitVec 32) (_ BitVec 32) V!40553 V!40553 (_ BitVec 32) Int) ListLongMap!14945)

(assert (=> b!1086054 (= lt!482385 (getCurrentListMapNoExtraKeys!4044 lt!482379 lt!482378 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2115 (Int (_ BitVec 64)) V!40553)

(assert (=> b!1086054 (= lt!482378 (array!69995 (store (arr!33671 _values!874) i!650 (ValueCellFull!12575 (dynLambda!2115 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34209 _values!874)))))

(assert (=> b!1086054 (= lt!482381 (getCurrentListMapNoExtraKeys!4044 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086054 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482374 () Unit!35569)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69996 (_ BitVec 64) (_ BitVec 32)) Unit!35569)

(assert (=> b!1086054 (= lt!482374 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086055 () Bool)

(declare-fun e!620401 () Bool)

(assert (=> b!1086055 (= e!620401 tp_is_empty!26569)))

(declare-fun b!1086057 () Bool)

(declare-fun e!620402 () Bool)

(assert (=> b!1086057 (= e!620402 (and e!620401 mapRes!41608))))

(declare-fun condMapEmpty!41608 () Bool)

(declare-fun mapDefault!41608 () ValueCell!12575)

(assert (=> b!1086057 (= condMapEmpty!41608 (= (arr!33671 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12575)) mapDefault!41608)))))

(declare-fun b!1086058 () Bool)

(declare-fun res!724202 () Bool)

(assert (=> b!1086058 (=> (not res!724202) (not e!620400))))

(assert (=> b!1086058 (= res!724202 (= (select (arr!33672 _keys!1070) i!650) k0!904))))

(declare-fun b!1086059 () Bool)

(declare-fun e!620405 () Bool)

(assert (=> b!1086059 (= e!620399 e!620405)))

(declare-fun res!724209 () Bool)

(assert (=> b!1086059 (=> res!724209 e!620405)))

(assert (=> b!1086059 (= res!724209 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!482377 () ListLongMap!14945)

(declare-fun lt!482371 () ListLongMap!14945)

(assert (=> b!1086059 (= lt!482377 lt!482371)))

(declare-fun lt!482376 () ListLongMap!14945)

(assert (=> b!1086059 (= lt!482377 (-!767 lt!482376 k0!904))))

(declare-fun lt!482375 () Unit!35569)

(declare-fun addRemoveCommutativeForDiffKeys!25 (ListLongMap!14945 (_ BitVec 64) V!40553 (_ BitVec 64)) Unit!35569)

(assert (=> b!1086059 (= lt!482375 (addRemoveCommutativeForDiffKeys!25 lt!482381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!482373 () tuple2!16976)

(declare-fun +!3296 (ListLongMap!14945 tuple2!16976) ListLongMap!14945)

(assert (=> b!1086059 (= lt!482380 (+!3296 lt!482371 lt!482373))))

(declare-fun lt!482386 () tuple2!16976)

(assert (=> b!1086059 (= lt!482371 (+!3296 lt!482383 lt!482386))))

(declare-fun lt!482372 () ListLongMap!14945)

(assert (=> b!1086059 (= lt!482382 lt!482372)))

(assert (=> b!1086059 (= lt!482372 (+!3296 lt!482376 lt!482373))))

(assert (=> b!1086059 (= lt!482376 (+!3296 lt!482381 lt!482386))))

(assert (=> b!1086059 (= lt!482380 (+!3296 (+!3296 lt!482385 lt!482386) lt!482373))))

(assert (=> b!1086059 (= lt!482373 (tuple2!16977 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086059 (= lt!482386 (tuple2!16977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086060 () Bool)

(declare-fun res!724205 () Bool)

(assert (=> b!1086060 (=> (not res!724205) (not e!620400))))

(declare-datatypes ((List!23547 0))(
  ( (Nil!23544) (Cons!23543 (h!24752 (_ BitVec 64)) (t!33163 List!23547)) )
))
(declare-fun arrayNoDuplicates!0 (array!69996 (_ BitVec 32) List!23547) Bool)

(assert (=> b!1086060 (= res!724205 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23544))))

(declare-fun mapIsEmpty!41608 () Bool)

(assert (=> mapIsEmpty!41608 mapRes!41608))

(declare-fun b!1086061 () Bool)

(declare-fun res!724204 () Bool)

(assert (=> b!1086061 (=> (not res!724204) (not e!620400))))

(assert (=> b!1086061 (= res!724204 (and (= (size!34209 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34210 _keys!1070) (size!34209 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086056 () Bool)

(declare-fun res!724206 () Bool)

(assert (=> b!1086056 (=> (not res!724206) (not e!620400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69996 (_ BitVec 32)) Bool)

(assert (=> b!1086056 (= res!724206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!724203 () Bool)

(assert (=> start!95908 (=> (not res!724203) (not e!620400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95908 (= res!724203 (validMask!0 mask!1414))))

(assert (=> start!95908 e!620400))

(assert (=> start!95908 tp!79550))

(assert (=> start!95908 true))

(assert (=> start!95908 tp_is_empty!26569))

(declare-fun array_inv!26020 (array!69996) Bool)

(assert (=> start!95908 (array_inv!26020 _keys!1070)))

(declare-fun array_inv!26021 (array!69994) Bool)

(assert (=> start!95908 (and (array_inv!26021 _values!874) e!620402)))

(declare-fun b!1086062 () Bool)

(assert (=> b!1086062 (= e!620400 e!620398)))

(declare-fun res!724210 () Bool)

(assert (=> b!1086062 (=> (not res!724210) (not e!620398))))

(assert (=> b!1086062 (= res!724210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482379 mask!1414))))

(assert (=> b!1086062 (= lt!482379 (array!69997 (store (arr!33672 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34210 _keys!1070)))))

(declare-fun b!1086063 () Bool)

(declare-fun res!724211 () Bool)

(assert (=> b!1086063 (=> (not res!724211) (not e!620398))))

(assert (=> b!1086063 (= res!724211 (arrayNoDuplicates!0 lt!482379 #b00000000000000000000000000000000 Nil!23544))))

(declare-fun b!1086064 () Bool)

(assert (=> b!1086064 (= e!620405 true)))

(assert (=> b!1086064 (= (-!767 lt!482372 k0!904) (+!3296 lt!482377 lt!482373))))

(declare-fun lt!482384 () Unit!35569)

(assert (=> b!1086064 (= lt!482384 (addRemoveCommutativeForDiffKeys!25 lt!482376 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1086065 () Bool)

(declare-fun res!724207 () Bool)

(assert (=> b!1086065 (=> (not res!724207) (not e!620400))))

(assert (=> b!1086065 (= res!724207 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34210 _keys!1070))))))

(assert (= (and start!95908 res!724203) b!1086061))

(assert (= (and b!1086061 res!724204) b!1086056))

(assert (= (and b!1086056 res!724206) b!1086060))

(assert (= (and b!1086060 res!724205) b!1086065))

(assert (= (and b!1086065 res!724207) b!1086053))

(assert (= (and b!1086053 res!724208) b!1086058))

(assert (= (and b!1086058 res!724202) b!1086062))

(assert (= (and b!1086062 res!724210) b!1086063))

(assert (= (and b!1086063 res!724211) b!1086054))

(assert (= (and b!1086054 (not res!724212)) b!1086059))

(assert (= (and b!1086059 (not res!724209)) b!1086064))

(assert (= (and b!1086057 condMapEmpty!41608) mapIsEmpty!41608))

(assert (= (and b!1086057 (not condMapEmpty!41608)) mapNonEmpty!41608))

(get-info :version)

(assert (= (and mapNonEmpty!41608 ((_ is ValueCellFull!12575) mapValue!41608)) b!1086052))

(assert (= (and b!1086057 ((_ is ValueCellFull!12575) mapDefault!41608)) b!1086055))

(assert (= start!95908 b!1086057))

(declare-fun b_lambda!17215 () Bool)

(assert (=> (not b_lambda!17215) (not b!1086054)))

(declare-fun t!33161 () Bool)

(declare-fun tb!7437 () Bool)

(assert (=> (and start!95908 (= defaultEntry!882 defaultEntry!882) t!33161) tb!7437))

(declare-fun result!15401 () Bool)

(assert (=> tb!7437 (= result!15401 tp_is_empty!26569)))

(assert (=> b!1086054 t!33161))

(declare-fun b_and!35785 () Bool)

(assert (= b_and!35783 (and (=> t!33161 result!15401) b_and!35785)))

(declare-fun m!1003973 () Bool)

(assert (=> b!1086059 m!1003973))

(declare-fun m!1003975 () Bool)

(assert (=> b!1086059 m!1003975))

(declare-fun m!1003977 () Bool)

(assert (=> b!1086059 m!1003977))

(declare-fun m!1003979 () Bool)

(assert (=> b!1086059 m!1003979))

(declare-fun m!1003981 () Bool)

(assert (=> b!1086059 m!1003981))

(declare-fun m!1003983 () Bool)

(assert (=> b!1086059 m!1003983))

(declare-fun m!1003985 () Bool)

(assert (=> b!1086059 m!1003985))

(declare-fun m!1003987 () Bool)

(assert (=> b!1086059 m!1003987))

(assert (=> b!1086059 m!1003981))

(declare-fun m!1003989 () Bool)

(assert (=> mapNonEmpty!41608 m!1003989))

(declare-fun m!1003991 () Bool)

(assert (=> b!1086062 m!1003991))

(declare-fun m!1003993 () Bool)

(assert (=> b!1086062 m!1003993))

(declare-fun m!1003995 () Bool)

(assert (=> start!95908 m!1003995))

(declare-fun m!1003997 () Bool)

(assert (=> start!95908 m!1003997))

(declare-fun m!1003999 () Bool)

(assert (=> start!95908 m!1003999))

(declare-fun m!1004001 () Bool)

(assert (=> b!1086058 m!1004001))

(declare-fun m!1004003 () Bool)

(assert (=> b!1086063 m!1004003))

(declare-fun m!1004005 () Bool)

(assert (=> b!1086064 m!1004005))

(declare-fun m!1004007 () Bool)

(assert (=> b!1086064 m!1004007))

(declare-fun m!1004009 () Bool)

(assert (=> b!1086064 m!1004009))

(declare-fun m!1004011 () Bool)

(assert (=> b!1086060 m!1004011))

(declare-fun m!1004013 () Bool)

(assert (=> b!1086053 m!1004013))

(declare-fun m!1004015 () Bool)

(assert (=> b!1086054 m!1004015))

(declare-fun m!1004017 () Bool)

(assert (=> b!1086054 m!1004017))

(declare-fun m!1004019 () Bool)

(assert (=> b!1086054 m!1004019))

(declare-fun m!1004021 () Bool)

(assert (=> b!1086054 m!1004021))

(declare-fun m!1004023 () Bool)

(assert (=> b!1086054 m!1004023))

(declare-fun m!1004025 () Bool)

(assert (=> b!1086054 m!1004025))

(declare-fun m!1004027 () Bool)

(assert (=> b!1086054 m!1004027))

(declare-fun m!1004029 () Bool)

(assert (=> b!1086054 m!1004029))

(declare-fun m!1004031 () Bool)

(assert (=> b!1086054 m!1004031))

(declare-fun m!1004033 () Bool)

(assert (=> b!1086054 m!1004033))

(declare-fun m!1004035 () Bool)

(assert (=> b!1086056 m!1004035))

(check-sat (not b!1086063) (not b!1086062) (not b_next!22567) tp_is_empty!26569 (not b!1086059) b_and!35785 (not b_lambda!17215) (not b!1086056) (not mapNonEmpty!41608) (not start!95908) (not b!1086053) (not b!1086054) (not b!1086060) (not b!1086064))
(check-sat b_and!35785 (not b_next!22567))
