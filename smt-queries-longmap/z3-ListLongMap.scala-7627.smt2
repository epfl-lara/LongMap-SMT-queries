; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96084 () Bool)

(assert start!96084)

(declare-fun b_free!22737 () Bool)

(declare-fun b_next!22737 () Bool)

(assert (=> start!96084 (= b_free!22737 (not b_next!22737))))

(declare-fun tp!80060 () Bool)

(declare-fun b_and!36149 () Bool)

(assert (=> start!96084 (= tp!80060 b_and!36149)))

(declare-fun b!1089963 () Bool)

(declare-fun res!727095 () Bool)

(declare-fun e!622533 () Bool)

(assert (=> b!1089963 (=> (not res!727095) (not e!622533))))

(declare-datatypes ((array!70401 0))(
  ( (array!70402 (arr!33874 (Array (_ BitVec 32) (_ BitVec 64))) (size!34410 (_ BitVec 32))) )
))
(declare-fun lt!486116 () array!70401)

(declare-datatypes ((List!23649 0))(
  ( (Nil!23646) (Cons!23645 (h!24854 (_ BitVec 64)) (t!33444 List!23649)) )
))
(declare-fun arrayNoDuplicates!0 (array!70401 (_ BitVec 32) List!23649) Bool)

(assert (=> b!1089963 (= res!727095 (arrayNoDuplicates!0 lt!486116 #b00000000000000000000000000000000 Nil!23646))))

(declare-fun b!1089965 () Bool)

(declare-fun e!622535 () Bool)

(assert (=> b!1089965 (= e!622535 e!622533)))

(declare-fun res!727101 () Bool)

(assert (=> b!1089965 (=> (not res!727101) (not e!622533))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70401 (_ BitVec 32)) Bool)

(assert (=> b!1089965 (= res!727101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486116 mask!1414))))

(declare-fun _keys!1070 () array!70401)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089965 (= lt!486116 (array!70402 (store (arr!33874 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34410 _keys!1070)))))

(declare-fun b!1089966 () Bool)

(declare-fun e!622538 () Bool)

(declare-fun e!622536 () Bool)

(declare-fun mapRes!41863 () Bool)

(assert (=> b!1089966 (= e!622538 (and e!622536 mapRes!41863))))

(declare-fun condMapEmpty!41863 () Bool)

(declare-datatypes ((V!40779 0))(
  ( (V!40780 (val!13426 Int)) )
))
(declare-datatypes ((ValueCell!12660 0))(
  ( (ValueCellFull!12660 (v!16047 V!40779)) (EmptyCell!12660) )
))
(declare-datatypes ((array!70403 0))(
  ( (array!70404 (arr!33875 (Array (_ BitVec 32) ValueCell!12660)) (size!34411 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70403)

(declare-fun mapDefault!41863 () ValueCell!12660)

(assert (=> b!1089966 (= condMapEmpty!41863 (= (arr!33875 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12660)) mapDefault!41863)))))

(declare-fun b!1089967 () Bool)

(declare-fun res!727098 () Bool)

(assert (=> b!1089967 (=> (not res!727098) (not e!622535))))

(assert (=> b!1089967 (= res!727098 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23646))))

(declare-fun b!1089968 () Bool)

(declare-fun res!727104 () Bool)

(assert (=> b!1089968 (=> (not res!727104) (not e!622535))))

(assert (=> b!1089968 (= res!727104 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34410 _keys!1070))))))

(declare-fun mapIsEmpty!41863 () Bool)

(assert (=> mapIsEmpty!41863 mapRes!41863))

(declare-fun b!1089969 () Bool)

(declare-fun res!727097 () Bool)

(assert (=> b!1089969 (=> (not res!727097) (not e!622535))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1089969 (= res!727097 (= (select (arr!33874 _keys!1070) i!650) k0!904))))

(declare-fun b!1089970 () Bool)

(declare-fun e!622534 () Bool)

(assert (=> b!1089970 (= e!622534 true)))

(declare-datatypes ((tuple2!17060 0))(
  ( (tuple2!17061 (_1!8541 (_ BitVec 64)) (_2!8541 V!40779)) )
))
(declare-datatypes ((List!23650 0))(
  ( (Nil!23647) (Cons!23646 (h!24855 tuple2!17060) (t!33445 List!23650)) )
))
(declare-datatypes ((ListLongMap!15029 0))(
  ( (ListLongMap!15030 (toList!7530 List!23650)) )
))
(declare-fun lt!486113 () ListLongMap!15029)

(declare-fun lt!486112 () ListLongMap!15029)

(declare-fun -!855 (ListLongMap!15029 (_ BitVec 64)) ListLongMap!15029)

(assert (=> b!1089970 (= (-!855 lt!486113 k0!904) lt!486112)))

(declare-fun minValue!831 () V!40779)

(declare-fun lt!486123 () ListLongMap!15029)

(declare-datatypes ((Unit!35876 0))(
  ( (Unit!35877) )
))
(declare-fun lt!486117 () Unit!35876)

(declare-fun addRemoveCommutativeForDiffKeys!79 (ListLongMap!15029 (_ BitVec 64) V!40779 (_ BitVec 64)) Unit!35876)

(assert (=> b!1089970 (= lt!486117 (addRemoveCommutativeForDiffKeys!79 lt!486123 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1089971 () Bool)

(declare-fun e!622532 () Bool)

(assert (=> b!1089971 (= e!622532 e!622534)))

(declare-fun res!727103 () Bool)

(assert (=> b!1089971 (=> res!727103 e!622534)))

(assert (=> b!1089971 (= res!727103 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!486118 () ListLongMap!15029)

(assert (=> b!1089971 (= lt!486118 lt!486113)))

(declare-fun lt!486122 () tuple2!17060)

(declare-fun +!3321 (ListLongMap!15029 tuple2!17060) ListLongMap!15029)

(assert (=> b!1089971 (= lt!486113 (+!3321 lt!486123 lt!486122))))

(declare-fun lt!486120 () ListLongMap!15029)

(assert (=> b!1089971 (= lt!486120 lt!486112)))

(declare-fun lt!486121 () ListLongMap!15029)

(assert (=> b!1089971 (= lt!486112 (+!3321 lt!486121 lt!486122))))

(declare-fun lt!486119 () ListLongMap!15029)

(assert (=> b!1089971 (= lt!486120 (+!3321 lt!486119 lt!486122))))

(assert (=> b!1089971 (= lt!486122 (tuple2!17061 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1089972 () Bool)

(declare-fun res!727100 () Bool)

(assert (=> b!1089972 (=> (not res!727100) (not e!622535))))

(assert (=> b!1089972 (= res!727100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41863 () Bool)

(declare-fun tp!80059 () Bool)

(declare-fun e!622531 () Bool)

(assert (=> mapNonEmpty!41863 (= mapRes!41863 (and tp!80059 e!622531))))

(declare-fun mapRest!41863 () (Array (_ BitVec 32) ValueCell!12660))

(declare-fun mapValue!41863 () ValueCell!12660)

(declare-fun mapKey!41863 () (_ BitVec 32))

(assert (=> mapNonEmpty!41863 (= (arr!33875 _values!874) (store mapRest!41863 mapKey!41863 mapValue!41863))))

(declare-fun res!727102 () Bool)

(assert (=> start!96084 (=> (not res!727102) (not e!622535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96084 (= res!727102 (validMask!0 mask!1414))))

(assert (=> start!96084 e!622535))

(assert (=> start!96084 tp!80060))

(assert (=> start!96084 true))

(declare-fun tp_is_empty!26739 () Bool)

(assert (=> start!96084 tp_is_empty!26739))

(declare-fun array_inv!26122 (array!70401) Bool)

(assert (=> start!96084 (array_inv!26122 _keys!1070)))

(declare-fun array_inv!26123 (array!70403) Bool)

(assert (=> start!96084 (and (array_inv!26123 _values!874) e!622538)))

(declare-fun b!1089964 () Bool)

(declare-fun res!727096 () Bool)

(assert (=> b!1089964 (=> (not res!727096) (not e!622535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089964 (= res!727096 (validKeyInArray!0 k0!904))))

(declare-fun b!1089973 () Bool)

(declare-fun res!727099 () Bool)

(assert (=> b!1089973 (=> (not res!727099) (not e!622535))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089973 (= res!727099 (and (= (size!34411 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34410 _keys!1070) (size!34411 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089974 () Bool)

(assert (=> b!1089974 (= e!622531 tp_is_empty!26739)))

(declare-fun b!1089975 () Bool)

(assert (=> b!1089975 (= e!622533 (not e!622532))))

(declare-fun res!727094 () Bool)

(assert (=> b!1089975 (=> res!727094 e!622532)))

(assert (=> b!1089975 (= res!727094 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40779)

(declare-fun getCurrentListMap!4299 (array!70401 array!70403 (_ BitVec 32) (_ BitVec 32) V!40779 V!40779 (_ BitVec 32) Int) ListLongMap!15029)

(assert (=> b!1089975 (= lt!486118 (getCurrentListMap!4299 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486114 () array!70403)

(assert (=> b!1089975 (= lt!486120 (getCurrentListMap!4299 lt!486116 lt!486114 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1089975 (and (= lt!486119 lt!486121) (= lt!486121 lt!486119))))

(assert (=> b!1089975 (= lt!486121 (-!855 lt!486123 k0!904))))

(declare-fun lt!486115 () Unit!35876)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!118 (array!70401 array!70403 (_ BitVec 32) (_ BitVec 32) V!40779 V!40779 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35876)

(assert (=> b!1089975 (= lt!486115 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!118 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4059 (array!70401 array!70403 (_ BitVec 32) (_ BitVec 32) V!40779 V!40779 (_ BitVec 32) Int) ListLongMap!15029)

(assert (=> b!1089975 (= lt!486119 (getCurrentListMapNoExtraKeys!4059 lt!486116 lt!486114 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2196 (Int (_ BitVec 64)) V!40779)

(assert (=> b!1089975 (= lt!486114 (array!70404 (store (arr!33875 _values!874) i!650 (ValueCellFull!12660 (dynLambda!2196 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34411 _values!874)))))

(assert (=> b!1089975 (= lt!486123 (getCurrentListMapNoExtraKeys!4059 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089975 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486124 () Unit!35876)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70401 (_ BitVec 64) (_ BitVec 32)) Unit!35876)

(assert (=> b!1089975 (= lt!486124 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089976 () Bool)

(assert (=> b!1089976 (= e!622536 tp_is_empty!26739)))

(assert (= (and start!96084 res!727102) b!1089973))

(assert (= (and b!1089973 res!727099) b!1089972))

(assert (= (and b!1089972 res!727100) b!1089967))

(assert (= (and b!1089967 res!727098) b!1089968))

(assert (= (and b!1089968 res!727104) b!1089964))

(assert (= (and b!1089964 res!727096) b!1089969))

(assert (= (and b!1089969 res!727097) b!1089965))

(assert (= (and b!1089965 res!727101) b!1089963))

(assert (= (and b!1089963 res!727095) b!1089975))

(assert (= (and b!1089975 (not res!727094)) b!1089971))

(assert (= (and b!1089971 (not res!727103)) b!1089970))

(assert (= (and b!1089966 condMapEmpty!41863) mapIsEmpty!41863))

(assert (= (and b!1089966 (not condMapEmpty!41863)) mapNonEmpty!41863))

(get-info :version)

(assert (= (and mapNonEmpty!41863 ((_ is ValueCellFull!12660) mapValue!41863)) b!1089974))

(assert (= (and b!1089966 ((_ is ValueCellFull!12660) mapDefault!41863)) b!1089976))

(assert (= start!96084 b!1089966))

(declare-fun b_lambda!17407 () Bool)

(assert (=> (not b_lambda!17407) (not b!1089975)))

(declare-fun t!33443 () Bool)

(declare-fun tb!7615 () Bool)

(assert (=> (and start!96084 (= defaultEntry!882 defaultEntry!882) t!33443) tb!7615))

(declare-fun result!15749 () Bool)

(assert (=> tb!7615 (= result!15749 tp_is_empty!26739)))

(assert (=> b!1089975 t!33443))

(declare-fun b_and!36151 () Bool)

(assert (= b_and!36149 (and (=> t!33443 result!15749) b_and!36151)))

(declare-fun m!1009283 () Bool)

(assert (=> b!1089971 m!1009283))

(declare-fun m!1009285 () Bool)

(assert (=> b!1089971 m!1009285))

(declare-fun m!1009287 () Bool)

(assert (=> b!1089971 m!1009287))

(declare-fun m!1009289 () Bool)

(assert (=> b!1089963 m!1009289))

(declare-fun m!1009291 () Bool)

(assert (=> b!1089967 m!1009291))

(declare-fun m!1009293 () Bool)

(assert (=> b!1089964 m!1009293))

(declare-fun m!1009295 () Bool)

(assert (=> b!1089965 m!1009295))

(declare-fun m!1009297 () Bool)

(assert (=> b!1089965 m!1009297))

(declare-fun m!1009299 () Bool)

(assert (=> b!1089969 m!1009299))

(declare-fun m!1009301 () Bool)

(assert (=> start!96084 m!1009301))

(declare-fun m!1009303 () Bool)

(assert (=> start!96084 m!1009303))

(declare-fun m!1009305 () Bool)

(assert (=> start!96084 m!1009305))

(declare-fun m!1009307 () Bool)

(assert (=> b!1089975 m!1009307))

(declare-fun m!1009309 () Bool)

(assert (=> b!1089975 m!1009309))

(declare-fun m!1009311 () Bool)

(assert (=> b!1089975 m!1009311))

(declare-fun m!1009313 () Bool)

(assert (=> b!1089975 m!1009313))

(declare-fun m!1009315 () Bool)

(assert (=> b!1089975 m!1009315))

(declare-fun m!1009317 () Bool)

(assert (=> b!1089975 m!1009317))

(declare-fun m!1009319 () Bool)

(assert (=> b!1089975 m!1009319))

(declare-fun m!1009321 () Bool)

(assert (=> b!1089975 m!1009321))

(declare-fun m!1009323 () Bool)

(assert (=> b!1089975 m!1009323))

(declare-fun m!1009325 () Bool)

(assert (=> b!1089975 m!1009325))

(declare-fun m!1009327 () Bool)

(assert (=> b!1089970 m!1009327))

(declare-fun m!1009329 () Bool)

(assert (=> b!1089970 m!1009329))

(declare-fun m!1009331 () Bool)

(assert (=> b!1089972 m!1009331))

(declare-fun m!1009333 () Bool)

(assert (=> mapNonEmpty!41863 m!1009333))

(check-sat (not b!1089972) (not b!1089970) (not mapNonEmpty!41863) b_and!36151 (not b!1089965) (not b!1089975) (not b!1089971) (not b!1089967) (not b!1089964) (not b!1089963) (not start!96084) (not b_lambda!17407) (not b_next!22737) tp_is_empty!26739)
(check-sat b_and!36151 (not b_next!22737))
