; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96870 () Bool)

(assert start!96870)

(declare-fun b_free!23187 () Bool)

(declare-fun b_next!23187 () Bool)

(assert (=> start!96870 (= b_free!23187 (not b_next!23187))))

(declare-fun tp!81517 () Bool)

(declare-fun b_and!37177 () Bool)

(assert (=> start!96870 (= tp!81517 b_and!37177)))

(declare-fun b!1101984 () Bool)

(declare-fun res!735294 () Bool)

(declare-fun e!628996 () Bool)

(assert (=> b!1101984 (=> (not res!735294) (not e!628996))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71395 0))(
  ( (array!71396 (arr!34359 (Array (_ BitVec 32) (_ BitVec 64))) (size!34895 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71395)

(declare-datatypes ((V!41443 0))(
  ( (V!41444 (val!13675 Int)) )
))
(declare-datatypes ((ValueCell!12909 0))(
  ( (ValueCellFull!12909 (v!16306 V!41443)) (EmptyCell!12909) )
))
(declare-datatypes ((array!71397 0))(
  ( (array!71398 (arr!34360 (Array (_ BitVec 32) ValueCell!12909)) (size!34896 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71397)

(declare-fun mask!1414 () (_ BitVec 32))

(assert (=> b!1101984 (= res!735294 (and (= (size!34896 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34895 _keys!1070) (size!34896 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1101985 () Bool)

(declare-fun res!735296 () Bool)

(declare-fun e!628994 () Bool)

(assert (=> b!1101985 (=> (not res!735296) (not e!628994))))

(declare-fun lt!494248 () array!71395)

(declare-datatypes ((List!24007 0))(
  ( (Nil!24004) (Cons!24003 (h!25212 (_ BitVec 64)) (t!34240 List!24007)) )
))
(declare-fun arrayNoDuplicates!0 (array!71395 (_ BitVec 32) List!24007) Bool)

(assert (=> b!1101985 (= res!735296 (arrayNoDuplicates!0 lt!494248 #b00000000000000000000000000000000 Nil!24004))))

(declare-fun b!1101986 () Bool)

(declare-fun e!628993 () Bool)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1101986 (= e!628993 (bvslt i!650 (size!34896 _values!874)))))

(declare-datatypes ((tuple2!17392 0))(
  ( (tuple2!17393 (_1!8707 (_ BitVec 64)) (_2!8707 V!41443)) )
))
(declare-datatypes ((List!24008 0))(
  ( (Nil!24005) (Cons!24004 (h!25213 tuple2!17392) (t!34241 List!24008)) )
))
(declare-datatypes ((ListLongMap!15361 0))(
  ( (ListLongMap!15362 (toList!7696 List!24008)) )
))
(declare-fun lt!494250 () ListLongMap!15361)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!494259 () ListLongMap!15361)

(declare-fun -!979 (ListLongMap!15361 (_ BitVec 64)) ListLongMap!15361)

(assert (=> b!1101986 (= (-!979 lt!494250 k0!904) lt!494259)))

(declare-fun minValue!831 () V!41443)

(declare-datatypes ((Unit!36210 0))(
  ( (Unit!36211) )
))
(declare-fun lt!494255 () Unit!36210)

(declare-fun lt!494251 () ListLongMap!15361)

(declare-fun addRemoveCommutativeForDiffKeys!136 (ListLongMap!15361 (_ BitVec 64) V!41443 (_ BitVec 64)) Unit!36210)

(assert (=> b!1101986 (= lt!494255 (addRemoveCommutativeForDiffKeys!136 lt!494251 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1101987 () Bool)

(declare-fun e!628992 () Bool)

(assert (=> b!1101987 (= e!628992 e!628993)))

(declare-fun res!735290 () Bool)

(assert (=> b!1101987 (=> res!735290 e!628993)))

(assert (=> b!1101987 (= res!735290 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!494260 () ListLongMap!15361)

(assert (=> b!1101987 (= lt!494260 lt!494250)))

(declare-fun lt!494252 () tuple2!17392)

(declare-fun +!3400 (ListLongMap!15361 tuple2!17392) ListLongMap!15361)

(assert (=> b!1101987 (= lt!494250 (+!3400 lt!494251 lt!494252))))

(declare-fun lt!494253 () ListLongMap!15361)

(assert (=> b!1101987 (= lt!494253 lt!494259)))

(declare-fun lt!494256 () ListLongMap!15361)

(assert (=> b!1101987 (= lt!494259 (+!3400 lt!494256 lt!494252))))

(declare-fun lt!494249 () ListLongMap!15361)

(assert (=> b!1101987 (= lt!494253 (+!3400 lt!494249 lt!494252))))

(assert (=> b!1101987 (= lt!494252 (tuple2!17393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1101988 () Bool)

(declare-fun res!735288 () Bool)

(assert (=> b!1101988 (=> (not res!735288) (not e!628996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71395 (_ BitVec 32)) Bool)

(assert (=> b!1101988 (= res!735288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!735292 () Bool)

(assert (=> start!96870 (=> (not res!735292) (not e!628996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96870 (= res!735292 (validMask!0 mask!1414))))

(assert (=> start!96870 e!628996))

(assert (=> start!96870 tp!81517))

(assert (=> start!96870 true))

(declare-fun tp_is_empty!27237 () Bool)

(assert (=> start!96870 tp_is_empty!27237))

(declare-fun array_inv!26464 (array!71395) Bool)

(assert (=> start!96870 (array_inv!26464 _keys!1070)))

(declare-fun e!628998 () Bool)

(declare-fun array_inv!26465 (array!71397) Bool)

(assert (=> start!96870 (and (array_inv!26465 _values!874) e!628998)))

(declare-fun b!1101989 () Bool)

(declare-fun res!735291 () Bool)

(assert (=> b!1101989 (=> (not res!735291) (not e!628996))))

(assert (=> b!1101989 (= res!735291 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24004))))

(declare-fun mapIsEmpty!42646 () Bool)

(declare-fun mapRes!42646 () Bool)

(assert (=> mapIsEmpty!42646 mapRes!42646))

(declare-fun b!1101990 () Bool)

(assert (=> b!1101990 (= e!628994 (not e!628992))))

(declare-fun res!735289 () Bool)

(assert (=> b!1101990 (=> res!735289 e!628992)))

(assert (=> b!1101990 (= res!735289 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41443)

(declare-fun getCurrentListMap!4401 (array!71395 array!71397 (_ BitVec 32) (_ BitVec 32) V!41443 V!41443 (_ BitVec 32) Int) ListLongMap!15361)

(assert (=> b!1101990 (= lt!494260 (getCurrentListMap!4401 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494254 () array!71397)

(assert (=> b!1101990 (= lt!494253 (getCurrentListMap!4401 lt!494248 lt!494254 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1101990 (and (= lt!494249 lt!494256) (= lt!494256 lt!494249))))

(assert (=> b!1101990 (= lt!494256 (-!979 lt!494251 k0!904))))

(declare-fun lt!494257 () Unit!36210)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!227 (array!71395 array!71397 (_ BitVec 32) (_ BitVec 32) V!41443 V!41443 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36210)

(assert (=> b!1101990 (= lt!494257 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!227 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4197 (array!71395 array!71397 (_ BitVec 32) (_ BitVec 32) V!41443 V!41443 (_ BitVec 32) Int) ListLongMap!15361)

(assert (=> b!1101990 (= lt!494249 (getCurrentListMapNoExtraKeys!4197 lt!494248 lt!494254 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2332 (Int (_ BitVec 64)) V!41443)

(assert (=> b!1101990 (= lt!494254 (array!71398 (store (arr!34360 _values!874) i!650 (ValueCellFull!12909 (dynLambda!2332 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34896 _values!874)))))

(assert (=> b!1101990 (= lt!494251 (getCurrentListMapNoExtraKeys!4197 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101990 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494258 () Unit!36210)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71395 (_ BitVec 64) (_ BitVec 32)) Unit!36210)

(assert (=> b!1101990 (= lt!494258 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1101991 () Bool)

(declare-fun e!628999 () Bool)

(assert (=> b!1101991 (= e!628998 (and e!628999 mapRes!42646))))

(declare-fun condMapEmpty!42646 () Bool)

(declare-fun mapDefault!42646 () ValueCell!12909)

(assert (=> b!1101991 (= condMapEmpty!42646 (= (arr!34360 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12909)) mapDefault!42646)))))

(declare-fun b!1101992 () Bool)

(assert (=> b!1101992 (= e!628996 e!628994)))

(declare-fun res!735293 () Bool)

(assert (=> b!1101992 (=> (not res!735293) (not e!628994))))

(assert (=> b!1101992 (= res!735293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494248 mask!1414))))

(assert (=> b!1101992 (= lt!494248 (array!71396 (store (arr!34359 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34895 _keys!1070)))))

(declare-fun b!1101993 () Bool)

(declare-fun res!735298 () Bool)

(assert (=> b!1101993 (=> (not res!735298) (not e!628996))))

(assert (=> b!1101993 (= res!735298 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34895 _keys!1070))))))

(declare-fun b!1101994 () Bool)

(assert (=> b!1101994 (= e!628999 tp_is_empty!27237)))

(declare-fun b!1101995 () Bool)

(declare-fun res!735295 () Bool)

(assert (=> b!1101995 (=> (not res!735295) (not e!628996))))

(assert (=> b!1101995 (= res!735295 (= (select (arr!34359 _keys!1070) i!650) k0!904))))

(declare-fun b!1101996 () Bool)

(declare-fun res!735297 () Bool)

(assert (=> b!1101996 (=> (not res!735297) (not e!628996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101996 (= res!735297 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!42646 () Bool)

(declare-fun tp!81518 () Bool)

(declare-fun e!628995 () Bool)

(assert (=> mapNonEmpty!42646 (= mapRes!42646 (and tp!81518 e!628995))))

(declare-fun mapValue!42646 () ValueCell!12909)

(declare-fun mapRest!42646 () (Array (_ BitVec 32) ValueCell!12909))

(declare-fun mapKey!42646 () (_ BitVec 32))

(assert (=> mapNonEmpty!42646 (= (arr!34360 _values!874) (store mapRest!42646 mapKey!42646 mapValue!42646))))

(declare-fun b!1101997 () Bool)

(assert (=> b!1101997 (= e!628995 tp_is_empty!27237)))

(assert (= (and start!96870 res!735292) b!1101984))

(assert (= (and b!1101984 res!735294) b!1101988))

(assert (= (and b!1101988 res!735288) b!1101989))

(assert (= (and b!1101989 res!735291) b!1101993))

(assert (= (and b!1101993 res!735298) b!1101996))

(assert (= (and b!1101996 res!735297) b!1101995))

(assert (= (and b!1101995 res!735295) b!1101992))

(assert (= (and b!1101992 res!735293) b!1101985))

(assert (= (and b!1101985 res!735296) b!1101990))

(assert (= (and b!1101990 (not res!735289)) b!1101987))

(assert (= (and b!1101987 (not res!735290)) b!1101986))

(assert (= (and b!1101991 condMapEmpty!42646) mapIsEmpty!42646))

(assert (= (and b!1101991 (not condMapEmpty!42646)) mapNonEmpty!42646))

(get-info :version)

(assert (= (and mapNonEmpty!42646 ((_ is ValueCellFull!12909) mapValue!42646)) b!1101997))

(assert (= (and b!1101991 ((_ is ValueCellFull!12909) mapDefault!42646)) b!1101994))

(assert (= start!96870 b!1101991))

(declare-fun b_lambda!18145 () Bool)

(assert (=> (not b_lambda!18145) (not b!1101990)))

(declare-fun t!34239 () Bool)

(declare-fun tb!8053 () Bool)

(assert (=> (and start!96870 (= defaultEntry!882 defaultEntry!882) t!34239) tb!8053))

(declare-fun result!16649 () Bool)

(assert (=> tb!8053 (= result!16649 tp_is_empty!27237)))

(assert (=> b!1101990 t!34239))

(declare-fun b_and!37179 () Bool)

(assert (= b_and!37177 (and (=> t!34239 result!16649) b_and!37179)))

(declare-fun m!1022225 () Bool)

(assert (=> b!1101989 m!1022225))

(declare-fun m!1022227 () Bool)

(assert (=> b!1101987 m!1022227))

(declare-fun m!1022229 () Bool)

(assert (=> b!1101987 m!1022229))

(declare-fun m!1022231 () Bool)

(assert (=> b!1101987 m!1022231))

(declare-fun m!1022233 () Bool)

(assert (=> mapNonEmpty!42646 m!1022233))

(declare-fun m!1022235 () Bool)

(assert (=> b!1101995 m!1022235))

(declare-fun m!1022237 () Bool)

(assert (=> b!1101988 m!1022237))

(declare-fun m!1022239 () Bool)

(assert (=> b!1101985 m!1022239))

(declare-fun m!1022241 () Bool)

(assert (=> b!1101996 m!1022241))

(declare-fun m!1022243 () Bool)

(assert (=> b!1101986 m!1022243))

(declare-fun m!1022245 () Bool)

(assert (=> b!1101986 m!1022245))

(declare-fun m!1022247 () Bool)

(assert (=> start!96870 m!1022247))

(declare-fun m!1022249 () Bool)

(assert (=> start!96870 m!1022249))

(declare-fun m!1022251 () Bool)

(assert (=> start!96870 m!1022251))

(declare-fun m!1022253 () Bool)

(assert (=> b!1101990 m!1022253))

(declare-fun m!1022255 () Bool)

(assert (=> b!1101990 m!1022255))

(declare-fun m!1022257 () Bool)

(assert (=> b!1101990 m!1022257))

(declare-fun m!1022259 () Bool)

(assert (=> b!1101990 m!1022259))

(declare-fun m!1022261 () Bool)

(assert (=> b!1101990 m!1022261))

(declare-fun m!1022263 () Bool)

(assert (=> b!1101990 m!1022263))

(declare-fun m!1022265 () Bool)

(assert (=> b!1101990 m!1022265))

(declare-fun m!1022267 () Bool)

(assert (=> b!1101990 m!1022267))

(declare-fun m!1022269 () Bool)

(assert (=> b!1101990 m!1022269))

(declare-fun m!1022271 () Bool)

(assert (=> b!1101990 m!1022271))

(declare-fun m!1022273 () Bool)

(assert (=> b!1101992 m!1022273))

(declare-fun m!1022275 () Bool)

(assert (=> b!1101992 m!1022275))

(check-sat (not b!1101996) b_and!37179 (not b!1101986) (not b!1101985) (not b!1101990) (not b_lambda!18145) (not b!1101988) tp_is_empty!27237 (not b_next!23187) (not start!96870) (not b!1101992) (not b!1101987) (not mapNonEmpty!42646) (not b!1101989))
(check-sat b_and!37179 (not b_next!23187))
