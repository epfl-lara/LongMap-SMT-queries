; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96946 () Bool)

(assert start!96946)

(declare-fun b_free!23131 () Bool)

(declare-fun b_next!23131 () Bool)

(assert (=> start!96946 (= b_free!23131 (not b_next!23131))))

(declare-fun tp!81338 () Bool)

(declare-fun b_and!37019 () Bool)

(assert (=> start!96946 (= tp!81338 b_and!37019)))

(declare-fun b!1101281 () Bool)

(declare-fun e!628675 () Bool)

(declare-fun tp_is_empty!27181 () Bool)

(assert (=> b!1101281 (= e!628675 tp_is_empty!27181)))

(declare-datatypes ((V!41369 0))(
  ( (V!41370 (val!13647 Int)) )
))
(declare-datatypes ((tuple2!17358 0))(
  ( (tuple2!17359 (_1!8690 (_ BitVec 64)) (_2!8690 V!41369)) )
))
(declare-datatypes ((List!23980 0))(
  ( (Nil!23977) (Cons!23976 (h!25194 tuple2!17358) (t!34149 List!23980)) )
))
(declare-datatypes ((ListLongMap!15335 0))(
  ( (ListLongMap!15336 (toList!7683 List!23980)) )
))
(declare-fun lt!493198 () ListLongMap!15335)

(declare-fun lt!493191 () ListLongMap!15335)

(declare-fun e!628673 () Bool)

(declare-fun b!1101282 () Bool)

(declare-fun lt!493189 () tuple2!17358)

(declare-fun +!3415 (ListLongMap!15335 tuple2!17358) ListLongMap!15335)

(assert (=> b!1101282 (= e!628673 (= lt!493198 (+!3415 lt!493191 lt!493189)))))

(declare-fun b!1101283 () Bool)

(declare-fun res!734538 () Bool)

(declare-fun e!628676 () Bool)

(assert (=> b!1101283 (=> (not res!734538) (not e!628676))))

(declare-datatypes ((array!71315 0))(
  ( (array!71316 (arr!34317 (Array (_ BitVec 32) (_ BitVec 64))) (size!34854 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71315)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1101283 (= res!734538 (= (select (arr!34317 _keys!1070) i!650) k0!904))))

(declare-fun b!1101284 () Bool)

(declare-fun res!734536 () Bool)

(assert (=> b!1101284 (=> (not res!734536) (not e!628676))))

(declare-datatypes ((List!23981 0))(
  ( (Nil!23978) (Cons!23977 (h!25195 (_ BitVec 64)) (t!34150 List!23981)) )
))
(declare-fun arrayNoDuplicates!0 (array!71315 (_ BitVec 32) List!23981) Bool)

(assert (=> b!1101284 (= res!734536 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23978))))

(declare-fun b!1101285 () Bool)

(declare-fun e!628674 () Bool)

(assert (=> b!1101285 (= e!628674 tp_is_empty!27181)))

(declare-fun b!1101286 () Bool)

(declare-fun e!628671 () Bool)

(declare-fun mapRes!42550 () Bool)

(assert (=> b!1101286 (= e!628671 (and e!628675 mapRes!42550))))

(declare-fun condMapEmpty!42550 () Bool)

(declare-datatypes ((ValueCell!12881 0))(
  ( (ValueCellFull!12881 (v!16270 V!41369)) (EmptyCell!12881) )
))
(declare-datatypes ((array!71317 0))(
  ( (array!71318 (arr!34318 (Array (_ BitVec 32) ValueCell!12881)) (size!34855 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71317)

(declare-fun mapDefault!42550 () ValueCell!12881)

(assert (=> b!1101286 (= condMapEmpty!42550 (= (arr!34318 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12881)) mapDefault!42550)))))

(declare-fun b!1101287 () Bool)

(declare-fun res!734539 () Bool)

(assert (=> b!1101287 (=> (not res!734539) (not e!628676))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71315 (_ BitVec 32)) Bool)

(assert (=> b!1101287 (= res!734539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42550 () Bool)

(declare-fun tp!81337 () Bool)

(assert (=> mapNonEmpty!42550 (= mapRes!42550 (and tp!81337 e!628674))))

(declare-fun mapValue!42550 () ValueCell!12881)

(declare-fun mapRest!42550 () (Array (_ BitVec 32) ValueCell!12881))

(declare-fun mapKey!42550 () (_ BitVec 32))

(assert (=> mapNonEmpty!42550 (= (arr!34318 _values!874) (store mapRest!42550 mapKey!42550 mapValue!42550))))

(declare-fun b!1101288 () Bool)

(declare-fun res!734532 () Bool)

(assert (=> b!1101288 (=> (not res!734532) (not e!628676))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101288 (= res!734532 (and (= (size!34855 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34854 _keys!1070) (size!34855 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1101290 () Bool)

(declare-fun res!734534 () Bool)

(assert (=> b!1101290 (=> (not res!734534) (not e!628676))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101290 (= res!734534 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42550 () Bool)

(assert (=> mapIsEmpty!42550 mapRes!42550))

(declare-fun b!1101291 () Bool)

(declare-fun res!734537 () Bool)

(assert (=> b!1101291 (=> (not res!734537) (not e!628673))))

(declare-fun lt!493195 () ListLongMap!15335)

(declare-fun lt!493193 () ListLongMap!15335)

(assert (=> b!1101291 (= res!734537 (= lt!493193 (+!3415 lt!493195 lt!493189)))))

(declare-fun b!1101292 () Bool)

(declare-fun e!628677 () Bool)

(assert (=> b!1101292 (= e!628676 e!628677)))

(declare-fun res!734530 () Bool)

(assert (=> b!1101292 (=> (not res!734530) (not e!628677))))

(declare-fun lt!493190 () array!71315)

(assert (=> b!1101292 (= res!734530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493190 mask!1414))))

(assert (=> b!1101292 (= lt!493190 (array!71316 (store (arr!34317 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34854 _keys!1070)))))

(declare-fun b!1101293 () Bool)

(declare-fun res!734533 () Bool)

(assert (=> b!1101293 (=> (not res!734533) (not e!628677))))

(assert (=> b!1101293 (= res!734533 (arrayNoDuplicates!0 lt!493190 #b00000000000000000000000000000000 Nil!23978))))

(declare-fun b!1101294 () Bool)

(declare-fun e!628678 () Bool)

(assert (=> b!1101294 (= e!628677 (not e!628678))))

(declare-fun res!734529 () Bool)

(assert (=> b!1101294 (=> res!734529 e!628678)))

(assert (=> b!1101294 (= res!734529 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41369)

(declare-fun zeroValue!831 () V!41369)

(declare-fun getCurrentListMap!4389 (array!71315 array!71317 (_ BitVec 32) (_ BitVec 32) V!41369 V!41369 (_ BitVec 32) Int) ListLongMap!15335)

(assert (=> b!1101294 (= lt!493193 (getCurrentListMap!4389 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493192 () array!71317)

(assert (=> b!1101294 (= lt!493198 (getCurrentListMap!4389 lt!493190 lt!493192 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493197 () ListLongMap!15335)

(assert (=> b!1101294 (and (= lt!493197 lt!493191) (= lt!493191 lt!493197))))

(declare-fun -!953 (ListLongMap!15335 (_ BitVec 64)) ListLongMap!15335)

(assert (=> b!1101294 (= lt!493191 (-!953 lt!493195 k0!904))))

(declare-datatypes ((Unit!36157 0))(
  ( (Unit!36158) )
))
(declare-fun lt!493194 () Unit!36157)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!223 (array!71315 array!71317 (_ BitVec 32) (_ BitVec 32) V!41369 V!41369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36157)

(assert (=> b!1101294 (= lt!493194 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!223 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4230 (array!71315 array!71317 (_ BitVec 32) (_ BitVec 32) V!41369 V!41369 (_ BitVec 32) Int) ListLongMap!15335)

(assert (=> b!1101294 (= lt!493197 (getCurrentListMapNoExtraKeys!4230 lt!493190 lt!493192 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2348 (Int (_ BitVec 64)) V!41369)

(assert (=> b!1101294 (= lt!493192 (array!71318 (store (arr!34318 _values!874) i!650 (ValueCellFull!12881 (dynLambda!2348 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34855 _values!874)))))

(assert (=> b!1101294 (= lt!493195 (getCurrentListMapNoExtraKeys!4230 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101294 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493196 () Unit!36157)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71315 (_ BitVec 64) (_ BitVec 32)) Unit!36157)

(assert (=> b!1101294 (= lt!493196 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1101295 () Bool)

(assert (=> b!1101295 (= e!628678 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904)))))

(assert (=> b!1101295 e!628673))

(declare-fun res!734531 () Bool)

(assert (=> b!1101295 (=> (not res!734531) (not e!628673))))

(assert (=> b!1101295 (= res!734531 (= lt!493198 (+!3415 lt!493197 lt!493189)))))

(assert (=> b!1101295 (= lt!493189 (tuple2!17359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!734528 () Bool)

(assert (=> start!96946 (=> (not res!734528) (not e!628676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96946 (= res!734528 (validMask!0 mask!1414))))

(assert (=> start!96946 e!628676))

(assert (=> start!96946 tp!81338))

(assert (=> start!96946 true))

(assert (=> start!96946 tp_is_empty!27181))

(declare-fun array_inv!26458 (array!71315) Bool)

(assert (=> start!96946 (array_inv!26458 _keys!1070)))

(declare-fun array_inv!26459 (array!71317) Bool)

(assert (=> start!96946 (and (array_inv!26459 _values!874) e!628671)))

(declare-fun b!1101289 () Bool)

(declare-fun res!734535 () Bool)

(assert (=> b!1101289 (=> (not res!734535) (not e!628676))))

(assert (=> b!1101289 (= res!734535 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34854 _keys!1070))))))

(assert (= (and start!96946 res!734528) b!1101288))

(assert (= (and b!1101288 res!734532) b!1101287))

(assert (= (and b!1101287 res!734539) b!1101284))

(assert (= (and b!1101284 res!734536) b!1101289))

(assert (= (and b!1101289 res!734535) b!1101290))

(assert (= (and b!1101290 res!734534) b!1101283))

(assert (= (and b!1101283 res!734538) b!1101292))

(assert (= (and b!1101292 res!734530) b!1101293))

(assert (= (and b!1101293 res!734533) b!1101294))

(assert (= (and b!1101294 (not res!734529)) b!1101295))

(assert (= (and b!1101295 res!734531) b!1101291))

(assert (= (and b!1101291 res!734537) b!1101282))

(assert (= (and b!1101286 condMapEmpty!42550) mapIsEmpty!42550))

(assert (= (and b!1101286 (not condMapEmpty!42550)) mapNonEmpty!42550))

(get-info :version)

(assert (= (and mapNonEmpty!42550 ((_ is ValueCellFull!12881) mapValue!42550)) b!1101285))

(assert (= (and b!1101286 ((_ is ValueCellFull!12881) mapDefault!42550)) b!1101281))

(assert (= start!96946 b!1101286))

(declare-fun b_lambda!17979 () Bool)

(assert (=> (not b_lambda!17979) (not b!1101294)))

(declare-fun t!34148 () Bool)

(declare-fun tb!7989 () Bool)

(assert (=> (and start!96946 (= defaultEntry!882 defaultEntry!882) t!34148) tb!7989))

(declare-fun result!16521 () Bool)

(assert (=> tb!7989 (= result!16521 tp_is_empty!27181)))

(assert (=> b!1101294 t!34148))

(declare-fun b_and!37021 () Bool)

(assert (= b_and!37019 (and (=> t!34148 result!16521) b_and!37021)))

(declare-fun m!1021641 () Bool)

(assert (=> b!1101283 m!1021641))

(declare-fun m!1021643 () Bool)

(assert (=> mapNonEmpty!42550 m!1021643))

(declare-fun m!1021645 () Bool)

(assert (=> b!1101293 m!1021645))

(declare-fun m!1021647 () Bool)

(assert (=> b!1101284 m!1021647))

(declare-fun m!1021649 () Bool)

(assert (=> b!1101290 m!1021649))

(declare-fun m!1021651 () Bool)

(assert (=> b!1101282 m!1021651))

(declare-fun m!1021653 () Bool)

(assert (=> b!1101294 m!1021653))

(declare-fun m!1021655 () Bool)

(assert (=> b!1101294 m!1021655))

(declare-fun m!1021657 () Bool)

(assert (=> b!1101294 m!1021657))

(declare-fun m!1021659 () Bool)

(assert (=> b!1101294 m!1021659))

(declare-fun m!1021661 () Bool)

(assert (=> b!1101294 m!1021661))

(declare-fun m!1021663 () Bool)

(assert (=> b!1101294 m!1021663))

(declare-fun m!1021665 () Bool)

(assert (=> b!1101294 m!1021665))

(declare-fun m!1021667 () Bool)

(assert (=> b!1101294 m!1021667))

(declare-fun m!1021669 () Bool)

(assert (=> b!1101294 m!1021669))

(declare-fun m!1021671 () Bool)

(assert (=> b!1101294 m!1021671))

(declare-fun m!1021673 () Bool)

(assert (=> b!1101291 m!1021673))

(declare-fun m!1021675 () Bool)

(assert (=> b!1101295 m!1021675))

(declare-fun m!1021677 () Bool)

(assert (=> start!96946 m!1021677))

(declare-fun m!1021679 () Bool)

(assert (=> start!96946 m!1021679))

(declare-fun m!1021681 () Bool)

(assert (=> start!96946 m!1021681))

(declare-fun m!1021683 () Bool)

(assert (=> b!1101292 m!1021683))

(declare-fun m!1021685 () Bool)

(assert (=> b!1101292 m!1021685))

(declare-fun m!1021687 () Bool)

(assert (=> b!1101287 m!1021687))

(check-sat (not b!1101291) tp_is_empty!27181 (not b!1101293) (not b_next!23131) (not b!1101292) (not b!1101282) (not b!1101287) (not b!1101290) (not mapNonEmpty!42550) (not b!1101295) (not b_lambda!17979) (not b!1101284) (not b!1101294) b_and!37021 (not start!96946))
(check-sat b_and!37021 (not b_next!23131))
(get-model)

(declare-fun b_lambda!17985 () Bool)

(assert (= b_lambda!17979 (or (and start!96946 b_free!23131) b_lambda!17985)))

(check-sat (not b!1101291) tp_is_empty!27181 (not b!1101293) (not b_next!23131) (not b!1101292) (not b!1101282) (not b!1101287) (not b!1101290) (not mapNonEmpty!42550) (not b!1101295) (not b_lambda!17985) (not b!1101284) (not b!1101294) b_and!37021 (not start!96946))
(check-sat b_and!37021 (not b_next!23131))
(get-model)

(declare-fun d!131017 () Bool)

(declare-fun e!628729 () Bool)

(assert (=> d!131017 e!628729))

(declare-fun res!734617 () Bool)

(assert (=> d!131017 (=> (not res!734617) (not e!628729))))

(declare-fun lt!493268 () ListLongMap!15335)

(declare-fun contains!6419 (ListLongMap!15335 (_ BitVec 64)) Bool)

(assert (=> d!131017 (= res!734617 (contains!6419 lt!493268 (_1!8690 lt!493189)))))

(declare-fun lt!493270 () List!23980)

(assert (=> d!131017 (= lt!493268 (ListLongMap!15336 lt!493270))))

(declare-fun lt!493269 () Unit!36157)

(declare-fun lt!493267 () Unit!36157)

(assert (=> d!131017 (= lt!493269 lt!493267)))

(declare-datatypes ((Option!671 0))(
  ( (Some!670 (v!16273 V!41369)) (None!669) )
))
(declare-fun getValueByKey!620 (List!23980 (_ BitVec 64)) Option!671)

(assert (=> d!131017 (= (getValueByKey!620 lt!493270 (_1!8690 lt!493189)) (Some!670 (_2!8690 lt!493189)))))

(declare-fun lemmaContainsTupThenGetReturnValue!302 (List!23980 (_ BitVec 64) V!41369) Unit!36157)

(assert (=> d!131017 (= lt!493267 (lemmaContainsTupThenGetReturnValue!302 lt!493270 (_1!8690 lt!493189) (_2!8690 lt!493189)))))

(declare-fun insertStrictlySorted!395 (List!23980 (_ BitVec 64) V!41369) List!23980)

(assert (=> d!131017 (= lt!493270 (insertStrictlySorted!395 (toList!7683 lt!493195) (_1!8690 lt!493189) (_2!8690 lt!493189)))))

(assert (=> d!131017 (= (+!3415 lt!493195 lt!493189) lt!493268)))

(declare-fun b!1101396 () Bool)

(declare-fun res!734616 () Bool)

(assert (=> b!1101396 (=> (not res!734616) (not e!628729))))

(assert (=> b!1101396 (= res!734616 (= (getValueByKey!620 (toList!7683 lt!493268) (_1!8690 lt!493189)) (Some!670 (_2!8690 lt!493189))))))

(declare-fun b!1101397 () Bool)

(declare-fun contains!6420 (List!23980 tuple2!17358) Bool)

(assert (=> b!1101397 (= e!628729 (contains!6420 (toList!7683 lt!493268) lt!493189))))

(assert (= (and d!131017 res!734617) b!1101396))

(assert (= (and b!1101396 res!734616) b!1101397))

(declare-fun m!1021785 () Bool)

(assert (=> d!131017 m!1021785))

(declare-fun m!1021787 () Bool)

(assert (=> d!131017 m!1021787))

(declare-fun m!1021789 () Bool)

(assert (=> d!131017 m!1021789))

(declare-fun m!1021791 () Bool)

(assert (=> d!131017 m!1021791))

(declare-fun m!1021793 () Bool)

(assert (=> b!1101396 m!1021793))

(declare-fun m!1021795 () Bool)

(assert (=> b!1101397 m!1021795))

(assert (=> b!1101291 d!131017))

(declare-fun d!131019 () Bool)

(declare-fun e!628730 () Bool)

(assert (=> d!131019 e!628730))

(declare-fun res!734619 () Bool)

(assert (=> d!131019 (=> (not res!734619) (not e!628730))))

(declare-fun lt!493272 () ListLongMap!15335)

(assert (=> d!131019 (= res!734619 (contains!6419 lt!493272 (_1!8690 lt!493189)))))

(declare-fun lt!493274 () List!23980)

(assert (=> d!131019 (= lt!493272 (ListLongMap!15336 lt!493274))))

(declare-fun lt!493273 () Unit!36157)

(declare-fun lt!493271 () Unit!36157)

(assert (=> d!131019 (= lt!493273 lt!493271)))

(assert (=> d!131019 (= (getValueByKey!620 lt!493274 (_1!8690 lt!493189)) (Some!670 (_2!8690 lt!493189)))))

(assert (=> d!131019 (= lt!493271 (lemmaContainsTupThenGetReturnValue!302 lt!493274 (_1!8690 lt!493189) (_2!8690 lt!493189)))))

(assert (=> d!131019 (= lt!493274 (insertStrictlySorted!395 (toList!7683 lt!493191) (_1!8690 lt!493189) (_2!8690 lt!493189)))))

(assert (=> d!131019 (= (+!3415 lt!493191 lt!493189) lt!493272)))

(declare-fun b!1101398 () Bool)

(declare-fun res!734618 () Bool)

(assert (=> b!1101398 (=> (not res!734618) (not e!628730))))

(assert (=> b!1101398 (= res!734618 (= (getValueByKey!620 (toList!7683 lt!493272) (_1!8690 lt!493189)) (Some!670 (_2!8690 lt!493189))))))

(declare-fun b!1101399 () Bool)

(assert (=> b!1101399 (= e!628730 (contains!6420 (toList!7683 lt!493272) lt!493189))))

(assert (= (and d!131019 res!734619) b!1101398))

(assert (= (and b!1101398 res!734618) b!1101399))

(declare-fun m!1021797 () Bool)

(assert (=> d!131019 m!1021797))

(declare-fun m!1021799 () Bool)

(assert (=> d!131019 m!1021799))

(declare-fun m!1021801 () Bool)

(assert (=> d!131019 m!1021801))

(declare-fun m!1021803 () Bool)

(assert (=> d!131019 m!1021803))

(declare-fun m!1021805 () Bool)

(assert (=> b!1101398 m!1021805))

(declare-fun m!1021807 () Bool)

(assert (=> b!1101399 m!1021807))

(assert (=> b!1101282 d!131019))

(declare-fun bm!46107 () Bool)

(declare-fun call!46110 () Bool)

(assert (=> bm!46107 (= call!46110 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1101409 () Bool)

(declare-fun e!628739 () Bool)

(declare-fun e!628738 () Bool)

(assert (=> b!1101409 (= e!628739 e!628738)))

(declare-fun lt!493283 () (_ BitVec 64))

(assert (=> b!1101409 (= lt!493283 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493282 () Unit!36157)

(assert (=> b!1101409 (= lt!493282 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!493283 #b00000000000000000000000000000000))))

(assert (=> b!1101409 (arrayContainsKey!0 _keys!1070 lt!493283 #b00000000000000000000000000000000)))

(declare-fun lt!493281 () Unit!36157)

(assert (=> b!1101409 (= lt!493281 lt!493282)))

(declare-fun res!734625 () Bool)

(declare-datatypes ((SeekEntryResult!9868 0))(
  ( (MissingZero!9868 (index!41843 (_ BitVec 32))) (Found!9868 (index!41844 (_ BitVec 32))) (Intermediate!9868 (undefined!10680 Bool) (index!41845 (_ BitVec 32)) (x!98914 (_ BitVec 32))) (Undefined!9868) (MissingVacant!9868 (index!41846 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71315 (_ BitVec 32)) SeekEntryResult!9868)

(assert (=> b!1101409 (= res!734625 (= (seekEntryOrOpen!0 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9868 #b00000000000000000000000000000000)))))

(assert (=> b!1101409 (=> (not res!734625) (not e!628738))))

(declare-fun b!1101410 () Bool)

(declare-fun e!628737 () Bool)

(assert (=> b!1101410 (= e!628737 e!628739)))

(declare-fun c!109077 () Bool)

(assert (=> b!1101410 (= c!109077 (validKeyInArray!0 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101411 () Bool)

(assert (=> b!1101411 (= e!628738 call!46110)))

(declare-fun d!131021 () Bool)

(declare-fun res!734624 () Bool)

(assert (=> d!131021 (=> res!734624 e!628737)))

(assert (=> d!131021 (= res!734624 (bvsge #b00000000000000000000000000000000 (size!34854 _keys!1070)))))

(assert (=> d!131021 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!628737)))

(declare-fun b!1101408 () Bool)

(assert (=> b!1101408 (= e!628739 call!46110)))

(assert (= (and d!131021 (not res!734624)) b!1101410))

(assert (= (and b!1101410 c!109077) b!1101409))

(assert (= (and b!1101410 (not c!109077)) b!1101408))

(assert (= (and b!1101409 res!734625) b!1101411))

(assert (= (or b!1101411 b!1101408) bm!46107))

(declare-fun m!1021809 () Bool)

(assert (=> bm!46107 m!1021809))

(declare-fun m!1021811 () Bool)

(assert (=> b!1101409 m!1021811))

(declare-fun m!1021813 () Bool)

(assert (=> b!1101409 m!1021813))

(declare-fun m!1021815 () Bool)

(assert (=> b!1101409 m!1021815))

(assert (=> b!1101409 m!1021811))

(declare-fun m!1021817 () Bool)

(assert (=> b!1101409 m!1021817))

(assert (=> b!1101410 m!1021811))

(assert (=> b!1101410 m!1021811))

(declare-fun m!1021819 () Bool)

(assert (=> b!1101410 m!1021819))

(assert (=> b!1101287 d!131021))

(declare-fun bm!46108 () Bool)

(declare-fun call!46111 () Bool)

(assert (=> bm!46108 (= call!46111 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!493190 mask!1414))))

(declare-fun b!1101413 () Bool)

(declare-fun e!628742 () Bool)

(declare-fun e!628741 () Bool)

(assert (=> b!1101413 (= e!628742 e!628741)))

(declare-fun lt!493286 () (_ BitVec 64))

(assert (=> b!1101413 (= lt!493286 (select (arr!34317 lt!493190) #b00000000000000000000000000000000))))

(declare-fun lt!493285 () Unit!36157)

(assert (=> b!1101413 (= lt!493285 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!493190 lt!493286 #b00000000000000000000000000000000))))

(assert (=> b!1101413 (arrayContainsKey!0 lt!493190 lt!493286 #b00000000000000000000000000000000)))

(declare-fun lt!493284 () Unit!36157)

(assert (=> b!1101413 (= lt!493284 lt!493285)))

(declare-fun res!734627 () Bool)

(assert (=> b!1101413 (= res!734627 (= (seekEntryOrOpen!0 (select (arr!34317 lt!493190) #b00000000000000000000000000000000) lt!493190 mask!1414) (Found!9868 #b00000000000000000000000000000000)))))

(assert (=> b!1101413 (=> (not res!734627) (not e!628741))))

(declare-fun b!1101414 () Bool)

(declare-fun e!628740 () Bool)

(assert (=> b!1101414 (= e!628740 e!628742)))

(declare-fun c!109078 () Bool)

(assert (=> b!1101414 (= c!109078 (validKeyInArray!0 (select (arr!34317 lt!493190) #b00000000000000000000000000000000)))))

(declare-fun b!1101415 () Bool)

(assert (=> b!1101415 (= e!628741 call!46111)))

(declare-fun d!131023 () Bool)

(declare-fun res!734626 () Bool)

(assert (=> d!131023 (=> res!734626 e!628740)))

(assert (=> d!131023 (= res!734626 (bvsge #b00000000000000000000000000000000 (size!34854 lt!493190)))))

(assert (=> d!131023 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493190 mask!1414) e!628740)))

(declare-fun b!1101412 () Bool)

(assert (=> b!1101412 (= e!628742 call!46111)))

(assert (= (and d!131023 (not res!734626)) b!1101414))

(assert (= (and b!1101414 c!109078) b!1101413))

(assert (= (and b!1101414 (not c!109078)) b!1101412))

(assert (= (and b!1101413 res!734627) b!1101415))

(assert (= (or b!1101415 b!1101412) bm!46108))

(declare-fun m!1021821 () Bool)

(assert (=> bm!46108 m!1021821))

(declare-fun m!1021823 () Bool)

(assert (=> b!1101413 m!1021823))

(declare-fun m!1021825 () Bool)

(assert (=> b!1101413 m!1021825))

(declare-fun m!1021827 () Bool)

(assert (=> b!1101413 m!1021827))

(assert (=> b!1101413 m!1021823))

(declare-fun m!1021829 () Bool)

(assert (=> b!1101413 m!1021829))

(assert (=> b!1101414 m!1021823))

(assert (=> b!1101414 m!1021823))

(declare-fun m!1021831 () Bool)

(assert (=> b!1101414 m!1021831))

(assert (=> b!1101292 d!131023))

(declare-fun d!131025 () Bool)

(assert (=> d!131025 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96946 d!131025))

(declare-fun d!131027 () Bool)

(assert (=> d!131027 (= (array_inv!26458 _keys!1070) (bvsge (size!34854 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96946 d!131027))

(declare-fun d!131029 () Bool)

(assert (=> d!131029 (= (array_inv!26459 _values!874) (bvsge (size!34855 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96946 d!131029))

(declare-fun b!1101426 () Bool)

(declare-fun e!628751 () Bool)

(declare-fun call!46114 () Bool)

(assert (=> b!1101426 (= e!628751 call!46114)))

(declare-fun d!131031 () Bool)

(declare-fun res!734636 () Bool)

(declare-fun e!628752 () Bool)

(assert (=> d!131031 (=> res!734636 e!628752)))

(assert (=> d!131031 (= res!734636 (bvsge #b00000000000000000000000000000000 (size!34854 lt!493190)))))

(assert (=> d!131031 (= (arrayNoDuplicates!0 lt!493190 #b00000000000000000000000000000000 Nil!23978) e!628752)))

(declare-fun bm!46111 () Bool)

(declare-fun c!109081 () Bool)

(assert (=> bm!46111 (= call!46114 (arrayNoDuplicates!0 lt!493190 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109081 (Cons!23977 (select (arr!34317 lt!493190) #b00000000000000000000000000000000) Nil!23978) Nil!23978)))))

(declare-fun b!1101427 () Bool)

(declare-fun e!628754 () Bool)

(assert (=> b!1101427 (= e!628752 e!628754)))

(declare-fun res!734634 () Bool)

(assert (=> b!1101427 (=> (not res!734634) (not e!628754))))

(declare-fun e!628753 () Bool)

(assert (=> b!1101427 (= res!734634 (not e!628753))))

(declare-fun res!734635 () Bool)

(assert (=> b!1101427 (=> (not res!734635) (not e!628753))))

(assert (=> b!1101427 (= res!734635 (validKeyInArray!0 (select (arr!34317 lt!493190) #b00000000000000000000000000000000)))))

(declare-fun b!1101428 () Bool)

(assert (=> b!1101428 (= e!628751 call!46114)))

(declare-fun b!1101429 () Bool)

(declare-fun contains!6421 (List!23981 (_ BitVec 64)) Bool)

(assert (=> b!1101429 (= e!628753 (contains!6421 Nil!23978 (select (arr!34317 lt!493190) #b00000000000000000000000000000000)))))

(declare-fun b!1101430 () Bool)

(assert (=> b!1101430 (= e!628754 e!628751)))

(assert (=> b!1101430 (= c!109081 (validKeyInArray!0 (select (arr!34317 lt!493190) #b00000000000000000000000000000000)))))

(assert (= (and d!131031 (not res!734636)) b!1101427))

(assert (= (and b!1101427 res!734635) b!1101429))

(assert (= (and b!1101427 res!734634) b!1101430))

(assert (= (and b!1101430 c!109081) b!1101428))

(assert (= (and b!1101430 (not c!109081)) b!1101426))

(assert (= (or b!1101428 b!1101426) bm!46111))

(assert (=> bm!46111 m!1021823))

(declare-fun m!1021833 () Bool)

(assert (=> bm!46111 m!1021833))

(assert (=> b!1101427 m!1021823))

(assert (=> b!1101427 m!1021823))

(assert (=> b!1101427 m!1021831))

(assert (=> b!1101429 m!1021823))

(assert (=> b!1101429 m!1021823))

(declare-fun m!1021835 () Bool)

(assert (=> b!1101429 m!1021835))

(assert (=> b!1101430 m!1021823))

(assert (=> b!1101430 m!1021823))

(assert (=> b!1101430 m!1021831))

(assert (=> b!1101293 d!131031))

(declare-fun b!1101431 () Bool)

(declare-fun e!628755 () Bool)

(declare-fun call!46115 () Bool)

(assert (=> b!1101431 (= e!628755 call!46115)))

(declare-fun d!131033 () Bool)

(declare-fun res!734639 () Bool)

(declare-fun e!628756 () Bool)

(assert (=> d!131033 (=> res!734639 e!628756)))

(assert (=> d!131033 (= res!734639 (bvsge #b00000000000000000000000000000000 (size!34854 _keys!1070)))))

(assert (=> d!131033 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23978) e!628756)))

(declare-fun bm!46112 () Bool)

(declare-fun c!109082 () Bool)

(assert (=> bm!46112 (= call!46115 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109082 (Cons!23977 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000) Nil!23978) Nil!23978)))))

(declare-fun b!1101432 () Bool)

(declare-fun e!628758 () Bool)

(assert (=> b!1101432 (= e!628756 e!628758)))

(declare-fun res!734637 () Bool)

(assert (=> b!1101432 (=> (not res!734637) (not e!628758))))

(declare-fun e!628757 () Bool)

(assert (=> b!1101432 (= res!734637 (not e!628757))))

(declare-fun res!734638 () Bool)

(assert (=> b!1101432 (=> (not res!734638) (not e!628757))))

(assert (=> b!1101432 (= res!734638 (validKeyInArray!0 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101433 () Bool)

(assert (=> b!1101433 (= e!628755 call!46115)))

(declare-fun b!1101434 () Bool)

(assert (=> b!1101434 (= e!628757 (contains!6421 Nil!23978 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101435 () Bool)

(assert (=> b!1101435 (= e!628758 e!628755)))

(assert (=> b!1101435 (= c!109082 (validKeyInArray!0 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!131033 (not res!734639)) b!1101432))

(assert (= (and b!1101432 res!734638) b!1101434))

(assert (= (and b!1101432 res!734637) b!1101435))

(assert (= (and b!1101435 c!109082) b!1101433))

(assert (= (and b!1101435 (not c!109082)) b!1101431))

(assert (= (or b!1101433 b!1101431) bm!46112))

(assert (=> bm!46112 m!1021811))

(declare-fun m!1021837 () Bool)

(assert (=> bm!46112 m!1021837))

(assert (=> b!1101432 m!1021811))

(assert (=> b!1101432 m!1021811))

(assert (=> b!1101432 m!1021819))

(assert (=> b!1101434 m!1021811))

(assert (=> b!1101434 m!1021811))

(declare-fun m!1021839 () Bool)

(assert (=> b!1101434 m!1021839))

(assert (=> b!1101435 m!1021811))

(assert (=> b!1101435 m!1021811))

(assert (=> b!1101435 m!1021819))

(assert (=> b!1101284 d!131033))

(declare-fun d!131035 () Bool)

(declare-fun e!628759 () Bool)

(assert (=> d!131035 e!628759))

(declare-fun res!734641 () Bool)

(assert (=> d!131035 (=> (not res!734641) (not e!628759))))

(declare-fun lt!493288 () ListLongMap!15335)

(assert (=> d!131035 (= res!734641 (contains!6419 lt!493288 (_1!8690 lt!493189)))))

(declare-fun lt!493290 () List!23980)

(assert (=> d!131035 (= lt!493288 (ListLongMap!15336 lt!493290))))

(declare-fun lt!493289 () Unit!36157)

(declare-fun lt!493287 () Unit!36157)

(assert (=> d!131035 (= lt!493289 lt!493287)))

(assert (=> d!131035 (= (getValueByKey!620 lt!493290 (_1!8690 lt!493189)) (Some!670 (_2!8690 lt!493189)))))

(assert (=> d!131035 (= lt!493287 (lemmaContainsTupThenGetReturnValue!302 lt!493290 (_1!8690 lt!493189) (_2!8690 lt!493189)))))

(assert (=> d!131035 (= lt!493290 (insertStrictlySorted!395 (toList!7683 lt!493197) (_1!8690 lt!493189) (_2!8690 lt!493189)))))

(assert (=> d!131035 (= (+!3415 lt!493197 lt!493189) lt!493288)))

(declare-fun b!1101436 () Bool)

(declare-fun res!734640 () Bool)

(assert (=> b!1101436 (=> (not res!734640) (not e!628759))))

(assert (=> b!1101436 (= res!734640 (= (getValueByKey!620 (toList!7683 lt!493288) (_1!8690 lt!493189)) (Some!670 (_2!8690 lt!493189))))))

(declare-fun b!1101437 () Bool)

(assert (=> b!1101437 (= e!628759 (contains!6420 (toList!7683 lt!493288) lt!493189))))

(assert (= (and d!131035 res!734641) b!1101436))

(assert (= (and b!1101436 res!734640) b!1101437))

(declare-fun m!1021841 () Bool)

(assert (=> d!131035 m!1021841))

(declare-fun m!1021843 () Bool)

(assert (=> d!131035 m!1021843))

(declare-fun m!1021845 () Bool)

(assert (=> d!131035 m!1021845))

(declare-fun m!1021847 () Bool)

(assert (=> d!131035 m!1021847))

(declare-fun m!1021849 () Bool)

(assert (=> b!1101436 m!1021849))

(declare-fun m!1021851 () Bool)

(assert (=> b!1101437 m!1021851))

(assert (=> b!1101295 d!131035))

(declare-fun d!131037 () Bool)

(assert (=> d!131037 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1101290 d!131037))

(declare-fun b!1101480 () Bool)

(declare-fun e!628793 () Bool)

(declare-fun e!628788 () Bool)

(assert (=> b!1101480 (= e!628793 e!628788)))

(declare-fun c!109097 () Bool)

(assert (=> b!1101480 (= c!109097 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!493346 () ListLongMap!15335)

(declare-fun b!1101481 () Bool)

(declare-fun e!628795 () Bool)

(declare-fun apply!958 (ListLongMap!15335 (_ BitVec 64)) V!41369)

(declare-fun get!17668 (ValueCell!12881 V!41369) V!41369)

(assert (=> b!1101481 (= e!628795 (= (apply!958 lt!493346 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000)) (get!17668 (select (arr!34318 _values!874) #b00000000000000000000000000000000) (dynLambda!2348 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1101481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34855 _values!874)))))

(assert (=> b!1101481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34854 _keys!1070)))))

(declare-fun b!1101482 () Bool)

(declare-fun e!628798 () Bool)

(assert (=> b!1101482 (= e!628798 (validKeyInArray!0 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101483 () Bool)

(declare-fun e!628789 () Bool)

(assert (=> b!1101483 (= e!628789 (= (apply!958 lt!493346 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun c!109096 () Bool)

(declare-fun call!46135 () ListLongMap!15335)

(declare-fun call!46131 () ListLongMap!15335)

(declare-fun bm!46127 () Bool)

(declare-fun c!109100 () Bool)

(declare-fun call!46130 () ListLongMap!15335)

(declare-fun call!46136 () ListLongMap!15335)

(assert (=> bm!46127 (= call!46136 (+!3415 (ite c!109100 call!46131 (ite c!109096 call!46130 call!46135)) (ite (or c!109100 c!109096) (tuple2!17359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun bm!46128 () Bool)

(declare-fun call!46132 () ListLongMap!15335)

(assert (=> bm!46128 (= call!46132 call!46136)))

(declare-fun b!1101484 () Bool)

(declare-fun e!628787 () Bool)

(declare-fun call!46134 () Bool)

(assert (=> b!1101484 (= e!628787 (not call!46134))))

(declare-fun d!131039 () Bool)

(assert (=> d!131039 e!628793))

(declare-fun res!734660 () Bool)

(assert (=> d!131039 (=> (not res!734660) (not e!628793))))

(assert (=> d!131039 (= res!734660 (or (bvsge #b00000000000000000000000000000000 (size!34854 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34854 _keys!1070)))))))

(declare-fun lt!493353 () ListLongMap!15335)

(assert (=> d!131039 (= lt!493346 lt!493353)))

(declare-fun lt!493337 () Unit!36157)

(declare-fun e!628792 () Unit!36157)

(assert (=> d!131039 (= lt!493337 e!628792)))

(declare-fun c!109095 () Bool)

(assert (=> d!131039 (= c!109095 e!628798)))

(declare-fun res!734661 () Bool)

(assert (=> d!131039 (=> (not res!734661) (not e!628798))))

(assert (=> d!131039 (= res!734661 (bvslt #b00000000000000000000000000000000 (size!34854 _keys!1070)))))

(declare-fun e!628786 () ListLongMap!15335)

(assert (=> d!131039 (= lt!493353 e!628786)))

(assert (=> d!131039 (= c!109100 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!131039 (validMask!0 mask!1414)))

(assert (=> d!131039 (= (getCurrentListMap!4389 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493346)))

(declare-fun b!1101485 () Bool)

(declare-fun res!734666 () Bool)

(assert (=> b!1101485 (=> (not res!734666) (not e!628793))))

(declare-fun e!628791 () Bool)

(assert (=> b!1101485 (= res!734666 e!628791)))

(declare-fun res!734664 () Bool)

(assert (=> b!1101485 (=> res!734664 e!628791)))

(declare-fun e!628797 () Bool)

(assert (=> b!1101485 (= res!734664 (not e!628797))))

(declare-fun res!734665 () Bool)

(assert (=> b!1101485 (=> (not res!734665) (not e!628797))))

(assert (=> b!1101485 (= res!734665 (bvslt #b00000000000000000000000000000000 (size!34854 _keys!1070)))))

(declare-fun b!1101486 () Bool)

(declare-fun lt!493343 () Unit!36157)

(assert (=> b!1101486 (= e!628792 lt!493343)))

(declare-fun lt!493356 () ListLongMap!15335)

(assert (=> b!1101486 (= lt!493356 (getCurrentListMapNoExtraKeys!4230 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493350 () (_ BitVec 64))

(assert (=> b!1101486 (= lt!493350 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493354 () (_ BitVec 64))

(assert (=> b!1101486 (= lt!493354 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493342 () Unit!36157)

(declare-fun addStillContains!662 (ListLongMap!15335 (_ BitVec 64) V!41369 (_ BitVec 64)) Unit!36157)

(assert (=> b!1101486 (= lt!493342 (addStillContains!662 lt!493356 lt!493350 zeroValue!831 lt!493354))))

(assert (=> b!1101486 (contains!6419 (+!3415 lt!493356 (tuple2!17359 lt!493350 zeroValue!831)) lt!493354)))

(declare-fun lt!493336 () Unit!36157)

(assert (=> b!1101486 (= lt!493336 lt!493342)))

(declare-fun lt!493344 () ListLongMap!15335)

(assert (=> b!1101486 (= lt!493344 (getCurrentListMapNoExtraKeys!4230 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493352 () (_ BitVec 64))

(assert (=> b!1101486 (= lt!493352 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493347 () (_ BitVec 64))

(assert (=> b!1101486 (= lt!493347 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493335 () Unit!36157)

(declare-fun addApplyDifferent!518 (ListLongMap!15335 (_ BitVec 64) V!41369 (_ BitVec 64)) Unit!36157)

(assert (=> b!1101486 (= lt!493335 (addApplyDifferent!518 lt!493344 lt!493352 minValue!831 lt!493347))))

(assert (=> b!1101486 (= (apply!958 (+!3415 lt!493344 (tuple2!17359 lt!493352 minValue!831)) lt!493347) (apply!958 lt!493344 lt!493347))))

(declare-fun lt!493339 () Unit!36157)

(assert (=> b!1101486 (= lt!493339 lt!493335)))

(declare-fun lt!493341 () ListLongMap!15335)

(assert (=> b!1101486 (= lt!493341 (getCurrentListMapNoExtraKeys!4230 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493345 () (_ BitVec 64))

(assert (=> b!1101486 (= lt!493345 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493355 () (_ BitVec 64))

(assert (=> b!1101486 (= lt!493355 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493351 () Unit!36157)

(assert (=> b!1101486 (= lt!493351 (addApplyDifferent!518 lt!493341 lt!493345 zeroValue!831 lt!493355))))

(assert (=> b!1101486 (= (apply!958 (+!3415 lt!493341 (tuple2!17359 lt!493345 zeroValue!831)) lt!493355) (apply!958 lt!493341 lt!493355))))

(declare-fun lt!493338 () Unit!36157)

(assert (=> b!1101486 (= lt!493338 lt!493351)))

(declare-fun lt!493348 () ListLongMap!15335)

(assert (=> b!1101486 (= lt!493348 (getCurrentListMapNoExtraKeys!4230 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493349 () (_ BitVec 64))

(assert (=> b!1101486 (= lt!493349 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493340 () (_ BitVec 64))

(assert (=> b!1101486 (= lt!493340 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1101486 (= lt!493343 (addApplyDifferent!518 lt!493348 lt!493349 minValue!831 lt!493340))))

(assert (=> b!1101486 (= (apply!958 (+!3415 lt!493348 (tuple2!17359 lt!493349 minValue!831)) lt!493340) (apply!958 lt!493348 lt!493340))))

(declare-fun b!1101487 () Bool)

(declare-fun e!628790 () ListLongMap!15335)

(assert (=> b!1101487 (= e!628790 call!46132)))

(declare-fun b!1101488 () Bool)

(declare-fun c!109099 () Bool)

(assert (=> b!1101488 (= c!109099 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!628796 () ListLongMap!15335)

(assert (=> b!1101488 (= e!628796 e!628790)))

(declare-fun b!1101489 () Bool)

(assert (=> b!1101489 (= e!628790 call!46135)))

(declare-fun b!1101490 () Bool)

(assert (=> b!1101490 (= e!628788 e!628789)))

(declare-fun res!734662 () Bool)

(declare-fun call!46133 () Bool)

(assert (=> b!1101490 (= res!734662 call!46133)))

(assert (=> b!1101490 (=> (not res!734662) (not e!628789))))

(declare-fun bm!46129 () Bool)

(assert (=> bm!46129 (= call!46133 (contains!6419 lt!493346 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46130 () Bool)

(assert (=> bm!46130 (= call!46135 call!46130)))

(declare-fun b!1101491 () Bool)

(declare-fun res!734667 () Bool)

(assert (=> b!1101491 (=> (not res!734667) (not e!628793))))

(assert (=> b!1101491 (= res!734667 e!628787)))

(declare-fun c!109098 () Bool)

(assert (=> b!1101491 (= c!109098 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1101492 () Bool)

(assert (=> b!1101492 (= e!628786 (+!3415 call!46136 (tuple2!17359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1101493 () Bool)

(declare-fun Unit!36159 () Unit!36157)

(assert (=> b!1101493 (= e!628792 Unit!36159)))

(declare-fun bm!46131 () Bool)

(assert (=> bm!46131 (= call!46130 call!46131)))

(declare-fun b!1101494 () Bool)

(assert (=> b!1101494 (= e!628791 e!628795)))

(declare-fun res!734663 () Bool)

(assert (=> b!1101494 (=> (not res!734663) (not e!628795))))

(assert (=> b!1101494 (= res!734663 (contains!6419 lt!493346 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101494 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34854 _keys!1070)))))

(declare-fun b!1101495 () Bool)

(declare-fun e!628794 () Bool)

(assert (=> b!1101495 (= e!628794 (= (apply!958 lt!493346 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun bm!46132 () Bool)

(assert (=> bm!46132 (= call!46134 (contains!6419 lt!493346 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101496 () Bool)

(assert (=> b!1101496 (= e!628787 e!628794)))

(declare-fun res!734668 () Bool)

(assert (=> b!1101496 (= res!734668 call!46134)))

(assert (=> b!1101496 (=> (not res!734668) (not e!628794))))

(declare-fun b!1101497 () Bool)

(assert (=> b!1101497 (= e!628788 (not call!46133))))

(declare-fun bm!46133 () Bool)

(assert (=> bm!46133 (= call!46131 (getCurrentListMapNoExtraKeys!4230 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1101498 () Bool)

(assert (=> b!1101498 (= e!628797 (validKeyInArray!0 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101499 () Bool)

(assert (=> b!1101499 (= e!628796 call!46132)))

(declare-fun b!1101500 () Bool)

(assert (=> b!1101500 (= e!628786 e!628796)))

(assert (=> b!1101500 (= c!109096 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!131039 c!109100) b!1101492))

(assert (= (and d!131039 (not c!109100)) b!1101500))

(assert (= (and b!1101500 c!109096) b!1101499))

(assert (= (and b!1101500 (not c!109096)) b!1101488))

(assert (= (and b!1101488 c!109099) b!1101487))

(assert (= (and b!1101488 (not c!109099)) b!1101489))

(assert (= (or b!1101487 b!1101489) bm!46130))

(assert (= (or b!1101499 bm!46130) bm!46131))

(assert (= (or b!1101499 b!1101487) bm!46128))

(assert (= (or b!1101492 bm!46131) bm!46133))

(assert (= (or b!1101492 bm!46128) bm!46127))

(assert (= (and d!131039 res!734661) b!1101482))

(assert (= (and d!131039 c!109095) b!1101486))

(assert (= (and d!131039 (not c!109095)) b!1101493))

(assert (= (and d!131039 res!734660) b!1101485))

(assert (= (and b!1101485 res!734665) b!1101498))

(assert (= (and b!1101485 (not res!734664)) b!1101494))

(assert (= (and b!1101494 res!734663) b!1101481))

(assert (= (and b!1101485 res!734666) b!1101491))

(assert (= (and b!1101491 c!109098) b!1101496))

(assert (= (and b!1101491 (not c!109098)) b!1101484))

(assert (= (and b!1101496 res!734668) b!1101495))

(assert (= (or b!1101496 b!1101484) bm!46132))

(assert (= (and b!1101491 res!734667) b!1101480))

(assert (= (and b!1101480 c!109097) b!1101490))

(assert (= (and b!1101480 (not c!109097)) b!1101497))

(assert (= (and b!1101490 res!734662) b!1101483))

(assert (= (or b!1101490 b!1101497) bm!46129))

(declare-fun b_lambda!17987 () Bool)

(assert (=> (not b_lambda!17987) (not b!1101481)))

(assert (=> b!1101481 t!34148))

(declare-fun b_and!37031 () Bool)

(assert (= b_and!37021 (and (=> t!34148 result!16521) b_and!37031)))

(assert (=> b!1101498 m!1021811))

(assert (=> b!1101498 m!1021811))

(assert (=> b!1101498 m!1021819))

(assert (=> d!131039 m!1021677))

(declare-fun m!1021853 () Bool)

(assert (=> b!1101495 m!1021853))

(declare-fun m!1021855 () Bool)

(assert (=> bm!46129 m!1021855))

(assert (=> b!1101482 m!1021811))

(assert (=> b!1101482 m!1021811))

(assert (=> b!1101482 m!1021819))

(assert (=> bm!46133 m!1021661))

(declare-fun m!1021857 () Bool)

(assert (=> b!1101486 m!1021857))

(declare-fun m!1021859 () Bool)

(assert (=> b!1101486 m!1021859))

(declare-fun m!1021861 () Bool)

(assert (=> b!1101486 m!1021861))

(declare-fun m!1021863 () Bool)

(assert (=> b!1101486 m!1021863))

(declare-fun m!1021865 () Bool)

(assert (=> b!1101486 m!1021865))

(declare-fun m!1021867 () Bool)

(assert (=> b!1101486 m!1021867))

(declare-fun m!1021869 () Bool)

(assert (=> b!1101486 m!1021869))

(declare-fun m!1021871 () Bool)

(assert (=> b!1101486 m!1021871))

(assert (=> b!1101486 m!1021857))

(declare-fun m!1021873 () Bool)

(assert (=> b!1101486 m!1021873))

(assert (=> b!1101486 m!1021869))

(declare-fun m!1021875 () Bool)

(assert (=> b!1101486 m!1021875))

(declare-fun m!1021877 () Bool)

(assert (=> b!1101486 m!1021877))

(assert (=> b!1101486 m!1021661))

(assert (=> b!1101486 m!1021861))

(declare-fun m!1021879 () Bool)

(assert (=> b!1101486 m!1021879))

(declare-fun m!1021881 () Bool)

(assert (=> b!1101486 m!1021881))

(declare-fun m!1021883 () Bool)

(assert (=> b!1101486 m!1021883))

(assert (=> b!1101486 m!1021865))

(declare-fun m!1021885 () Bool)

(assert (=> b!1101486 m!1021885))

(assert (=> b!1101486 m!1021811))

(declare-fun m!1021887 () Bool)

(assert (=> bm!46127 m!1021887))

(declare-fun m!1021889 () Bool)

(assert (=> b!1101483 m!1021889))

(declare-fun m!1021891 () Bool)

(assert (=> bm!46132 m!1021891))

(assert (=> b!1101494 m!1021811))

(assert (=> b!1101494 m!1021811))

(declare-fun m!1021893 () Bool)

(assert (=> b!1101494 m!1021893))

(assert (=> b!1101481 m!1021653))

(declare-fun m!1021895 () Bool)

(assert (=> b!1101481 m!1021895))

(assert (=> b!1101481 m!1021895))

(assert (=> b!1101481 m!1021653))

(declare-fun m!1021897 () Bool)

(assert (=> b!1101481 m!1021897))

(assert (=> b!1101481 m!1021811))

(declare-fun m!1021899 () Bool)

(assert (=> b!1101481 m!1021899))

(assert (=> b!1101481 m!1021811))

(declare-fun m!1021901 () Bool)

(assert (=> b!1101492 m!1021901))

(assert (=> b!1101294 d!131039))

(declare-fun b!1101507 () Bool)

(declare-fun e!628803 () Bool)

(declare-fun call!46141 () ListLongMap!15335)

(declare-fun call!46142 () ListLongMap!15335)

(assert (=> b!1101507 (= e!628803 (= call!46141 call!46142))))

(assert (=> b!1101507 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34855 _values!874)))))

(declare-fun bm!46138 () Bool)

(assert (=> bm!46138 (= call!46141 (getCurrentListMapNoExtraKeys!4230 (array!71316 (store (arr!34317 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34854 _keys!1070)) (array!71318 (store (arr!34318 _values!874) i!650 (ValueCellFull!12881 (dynLambda!2348 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34855 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1101508 () Bool)

(assert (=> b!1101508 (= e!628803 (= call!46141 (-!953 call!46142 k0!904)))))

(assert (=> b!1101508 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34855 _values!874)))))

(declare-fun b!1101509 () Bool)

(declare-fun e!628804 () Bool)

(assert (=> b!1101509 (= e!628804 e!628803)))

(declare-fun c!109103 () Bool)

(assert (=> b!1101509 (= c!109103 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun d!131041 () Bool)

(assert (=> d!131041 e!628804))

(declare-fun res!734671 () Bool)

(assert (=> d!131041 (=> (not res!734671) (not e!628804))))

(assert (=> d!131041 (= res!734671 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34854 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34854 _keys!1070))))))))

(declare-fun lt!493359 () Unit!36157)

(declare-fun choose!1773 (array!71315 array!71317 (_ BitVec 32) (_ BitVec 32) V!41369 V!41369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36157)

(assert (=> d!131041 (= lt!493359 (choose!1773 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!131041 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34854 _keys!1070)))))

(assert (=> d!131041 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!223 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!493359)))

(declare-fun bm!46139 () Bool)

(assert (=> bm!46139 (= call!46142 (getCurrentListMapNoExtraKeys!4230 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (= (and d!131041 res!734671) b!1101509))

(assert (= (and b!1101509 c!109103) b!1101508))

(assert (= (and b!1101509 (not c!109103)) b!1101507))

(assert (= (or b!1101508 b!1101507) bm!46139))

(assert (= (or b!1101508 b!1101507) bm!46138))

(declare-fun b_lambda!17989 () Bool)

(assert (=> (not b_lambda!17989) (not bm!46138)))

(assert (=> bm!46138 t!34148))

(declare-fun b_and!37033 () Bool)

(assert (= b_and!37031 (and (=> t!34148 result!16521) b_and!37033)))

(assert (=> bm!46138 m!1021685))

(assert (=> bm!46138 m!1021653))

(assert (=> bm!46138 m!1021663))

(declare-fun m!1021903 () Bool)

(assert (=> bm!46138 m!1021903))

(declare-fun m!1021905 () Bool)

(assert (=> b!1101508 m!1021905))

(declare-fun m!1021907 () Bool)

(assert (=> d!131041 m!1021907))

(assert (=> bm!46139 m!1021661))

(assert (=> b!1101294 d!131041))

(declare-fun b!1101510 () Bool)

(declare-fun e!628812 () Bool)

(declare-fun e!628807 () Bool)

(assert (=> b!1101510 (= e!628812 e!628807)))

(declare-fun c!109106 () Bool)

(assert (=> b!1101510 (= c!109106 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1101511 () Bool)

(declare-fun lt!493371 () ListLongMap!15335)

(declare-fun e!628814 () Bool)

(assert (=> b!1101511 (= e!628814 (= (apply!958 lt!493371 (select (arr!34317 lt!493190) #b00000000000000000000000000000000)) (get!17668 (select (arr!34318 lt!493192) #b00000000000000000000000000000000) (dynLambda!2348 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1101511 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34855 lt!493192)))))

(assert (=> b!1101511 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34854 lt!493190)))))

(declare-fun b!1101512 () Bool)

(declare-fun e!628817 () Bool)

(assert (=> b!1101512 (= e!628817 (validKeyInArray!0 (select (arr!34317 lt!493190) #b00000000000000000000000000000000)))))

(declare-fun b!1101513 () Bool)

(declare-fun e!628808 () Bool)

(assert (=> b!1101513 (= e!628808 (= (apply!958 lt!493371 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun c!109105 () Bool)

(declare-fun bm!46140 () Bool)

(declare-fun call!46144 () ListLongMap!15335)

(declare-fun call!46149 () ListLongMap!15335)

(declare-fun call!46148 () ListLongMap!15335)

(declare-fun c!109109 () Bool)

(declare-fun call!46143 () ListLongMap!15335)

(assert (=> bm!46140 (= call!46149 (+!3415 (ite c!109109 call!46144 (ite c!109105 call!46143 call!46148)) (ite (or c!109109 c!109105) (tuple2!17359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun bm!46141 () Bool)

(declare-fun call!46145 () ListLongMap!15335)

(assert (=> bm!46141 (= call!46145 call!46149)))

(declare-fun b!1101514 () Bool)

(declare-fun e!628806 () Bool)

(declare-fun call!46147 () Bool)

(assert (=> b!1101514 (= e!628806 (not call!46147))))

(declare-fun d!131043 () Bool)

(assert (=> d!131043 e!628812))

(declare-fun res!734672 () Bool)

(assert (=> d!131043 (=> (not res!734672) (not e!628812))))

(assert (=> d!131043 (= res!734672 (or (bvsge #b00000000000000000000000000000000 (size!34854 lt!493190)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34854 lt!493190)))))))

(declare-fun lt!493378 () ListLongMap!15335)

(assert (=> d!131043 (= lt!493371 lt!493378)))

(declare-fun lt!493362 () Unit!36157)

(declare-fun e!628811 () Unit!36157)

(assert (=> d!131043 (= lt!493362 e!628811)))

(declare-fun c!109104 () Bool)

(assert (=> d!131043 (= c!109104 e!628817)))

(declare-fun res!734673 () Bool)

(assert (=> d!131043 (=> (not res!734673) (not e!628817))))

(assert (=> d!131043 (= res!734673 (bvslt #b00000000000000000000000000000000 (size!34854 lt!493190)))))

(declare-fun e!628805 () ListLongMap!15335)

(assert (=> d!131043 (= lt!493378 e!628805)))

(assert (=> d!131043 (= c!109109 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!131043 (validMask!0 mask!1414)))

(assert (=> d!131043 (= (getCurrentListMap!4389 lt!493190 lt!493192 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493371)))

(declare-fun b!1101515 () Bool)

(declare-fun res!734678 () Bool)

(assert (=> b!1101515 (=> (not res!734678) (not e!628812))))

(declare-fun e!628810 () Bool)

(assert (=> b!1101515 (= res!734678 e!628810)))

(declare-fun res!734676 () Bool)

(assert (=> b!1101515 (=> res!734676 e!628810)))

(declare-fun e!628816 () Bool)

(assert (=> b!1101515 (= res!734676 (not e!628816))))

(declare-fun res!734677 () Bool)

(assert (=> b!1101515 (=> (not res!734677) (not e!628816))))

(assert (=> b!1101515 (= res!734677 (bvslt #b00000000000000000000000000000000 (size!34854 lt!493190)))))

(declare-fun b!1101516 () Bool)

(declare-fun lt!493368 () Unit!36157)

(assert (=> b!1101516 (= e!628811 lt!493368)))

(declare-fun lt!493381 () ListLongMap!15335)

(assert (=> b!1101516 (= lt!493381 (getCurrentListMapNoExtraKeys!4230 lt!493190 lt!493192 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493375 () (_ BitVec 64))

(assert (=> b!1101516 (= lt!493375 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493379 () (_ BitVec 64))

(assert (=> b!1101516 (= lt!493379 (select (arr!34317 lt!493190) #b00000000000000000000000000000000))))

(declare-fun lt!493367 () Unit!36157)

(assert (=> b!1101516 (= lt!493367 (addStillContains!662 lt!493381 lt!493375 zeroValue!831 lt!493379))))

(assert (=> b!1101516 (contains!6419 (+!3415 lt!493381 (tuple2!17359 lt!493375 zeroValue!831)) lt!493379)))

(declare-fun lt!493361 () Unit!36157)

(assert (=> b!1101516 (= lt!493361 lt!493367)))

(declare-fun lt!493369 () ListLongMap!15335)

(assert (=> b!1101516 (= lt!493369 (getCurrentListMapNoExtraKeys!4230 lt!493190 lt!493192 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493377 () (_ BitVec 64))

(assert (=> b!1101516 (= lt!493377 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493372 () (_ BitVec 64))

(assert (=> b!1101516 (= lt!493372 (select (arr!34317 lt!493190) #b00000000000000000000000000000000))))

(declare-fun lt!493360 () Unit!36157)

(assert (=> b!1101516 (= lt!493360 (addApplyDifferent!518 lt!493369 lt!493377 minValue!831 lt!493372))))

(assert (=> b!1101516 (= (apply!958 (+!3415 lt!493369 (tuple2!17359 lt!493377 minValue!831)) lt!493372) (apply!958 lt!493369 lt!493372))))

(declare-fun lt!493364 () Unit!36157)

(assert (=> b!1101516 (= lt!493364 lt!493360)))

(declare-fun lt!493366 () ListLongMap!15335)

(assert (=> b!1101516 (= lt!493366 (getCurrentListMapNoExtraKeys!4230 lt!493190 lt!493192 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493370 () (_ BitVec 64))

(assert (=> b!1101516 (= lt!493370 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493380 () (_ BitVec 64))

(assert (=> b!1101516 (= lt!493380 (select (arr!34317 lt!493190) #b00000000000000000000000000000000))))

(declare-fun lt!493376 () Unit!36157)

(assert (=> b!1101516 (= lt!493376 (addApplyDifferent!518 lt!493366 lt!493370 zeroValue!831 lt!493380))))

(assert (=> b!1101516 (= (apply!958 (+!3415 lt!493366 (tuple2!17359 lt!493370 zeroValue!831)) lt!493380) (apply!958 lt!493366 lt!493380))))

(declare-fun lt!493363 () Unit!36157)

(assert (=> b!1101516 (= lt!493363 lt!493376)))

(declare-fun lt!493373 () ListLongMap!15335)

(assert (=> b!1101516 (= lt!493373 (getCurrentListMapNoExtraKeys!4230 lt!493190 lt!493192 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493374 () (_ BitVec 64))

(assert (=> b!1101516 (= lt!493374 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493365 () (_ BitVec 64))

(assert (=> b!1101516 (= lt!493365 (select (arr!34317 lt!493190) #b00000000000000000000000000000000))))

(assert (=> b!1101516 (= lt!493368 (addApplyDifferent!518 lt!493373 lt!493374 minValue!831 lt!493365))))

(assert (=> b!1101516 (= (apply!958 (+!3415 lt!493373 (tuple2!17359 lt!493374 minValue!831)) lt!493365) (apply!958 lt!493373 lt!493365))))

(declare-fun b!1101517 () Bool)

(declare-fun e!628809 () ListLongMap!15335)

(assert (=> b!1101517 (= e!628809 call!46145)))

(declare-fun b!1101518 () Bool)

(declare-fun c!109108 () Bool)

(assert (=> b!1101518 (= c!109108 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!628815 () ListLongMap!15335)

(assert (=> b!1101518 (= e!628815 e!628809)))

(declare-fun b!1101519 () Bool)

(assert (=> b!1101519 (= e!628809 call!46148)))

(declare-fun b!1101520 () Bool)

(assert (=> b!1101520 (= e!628807 e!628808)))

(declare-fun res!734674 () Bool)

(declare-fun call!46146 () Bool)

(assert (=> b!1101520 (= res!734674 call!46146)))

(assert (=> b!1101520 (=> (not res!734674) (not e!628808))))

(declare-fun bm!46142 () Bool)

(assert (=> bm!46142 (= call!46146 (contains!6419 lt!493371 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46143 () Bool)

(assert (=> bm!46143 (= call!46148 call!46143)))

(declare-fun b!1101521 () Bool)

(declare-fun res!734679 () Bool)

(assert (=> b!1101521 (=> (not res!734679) (not e!628812))))

(assert (=> b!1101521 (= res!734679 e!628806)))

(declare-fun c!109107 () Bool)

(assert (=> b!1101521 (= c!109107 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1101522 () Bool)

(assert (=> b!1101522 (= e!628805 (+!3415 call!46149 (tuple2!17359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1101523 () Bool)

(declare-fun Unit!36160 () Unit!36157)

(assert (=> b!1101523 (= e!628811 Unit!36160)))

(declare-fun bm!46144 () Bool)

(assert (=> bm!46144 (= call!46143 call!46144)))

(declare-fun b!1101524 () Bool)

(assert (=> b!1101524 (= e!628810 e!628814)))

(declare-fun res!734675 () Bool)

(assert (=> b!1101524 (=> (not res!734675) (not e!628814))))

(assert (=> b!1101524 (= res!734675 (contains!6419 lt!493371 (select (arr!34317 lt!493190) #b00000000000000000000000000000000)))))

(assert (=> b!1101524 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34854 lt!493190)))))

(declare-fun b!1101525 () Bool)

(declare-fun e!628813 () Bool)

(assert (=> b!1101525 (= e!628813 (= (apply!958 lt!493371 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun bm!46145 () Bool)

(assert (=> bm!46145 (= call!46147 (contains!6419 lt!493371 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101526 () Bool)

(assert (=> b!1101526 (= e!628806 e!628813)))

(declare-fun res!734680 () Bool)

(assert (=> b!1101526 (= res!734680 call!46147)))

(assert (=> b!1101526 (=> (not res!734680) (not e!628813))))

(declare-fun b!1101527 () Bool)

(assert (=> b!1101527 (= e!628807 (not call!46146))))

(declare-fun bm!46146 () Bool)

(assert (=> bm!46146 (= call!46144 (getCurrentListMapNoExtraKeys!4230 lt!493190 lt!493192 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1101528 () Bool)

(assert (=> b!1101528 (= e!628816 (validKeyInArray!0 (select (arr!34317 lt!493190) #b00000000000000000000000000000000)))))

(declare-fun b!1101529 () Bool)

(assert (=> b!1101529 (= e!628815 call!46145)))

(declare-fun b!1101530 () Bool)

(assert (=> b!1101530 (= e!628805 e!628815)))

(assert (=> b!1101530 (= c!109105 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!131043 c!109109) b!1101522))

(assert (= (and d!131043 (not c!109109)) b!1101530))

(assert (= (and b!1101530 c!109105) b!1101529))

(assert (= (and b!1101530 (not c!109105)) b!1101518))

(assert (= (and b!1101518 c!109108) b!1101517))

(assert (= (and b!1101518 (not c!109108)) b!1101519))

(assert (= (or b!1101517 b!1101519) bm!46143))

(assert (= (or b!1101529 bm!46143) bm!46144))

(assert (= (or b!1101529 b!1101517) bm!46141))

(assert (= (or b!1101522 bm!46144) bm!46146))

(assert (= (or b!1101522 bm!46141) bm!46140))

(assert (= (and d!131043 res!734673) b!1101512))

(assert (= (and d!131043 c!109104) b!1101516))

(assert (= (and d!131043 (not c!109104)) b!1101523))

(assert (= (and d!131043 res!734672) b!1101515))

(assert (= (and b!1101515 res!734677) b!1101528))

(assert (= (and b!1101515 (not res!734676)) b!1101524))

(assert (= (and b!1101524 res!734675) b!1101511))

(assert (= (and b!1101515 res!734678) b!1101521))

(assert (= (and b!1101521 c!109107) b!1101526))

(assert (= (and b!1101521 (not c!109107)) b!1101514))

(assert (= (and b!1101526 res!734680) b!1101525))

(assert (= (or b!1101526 b!1101514) bm!46145))

(assert (= (and b!1101521 res!734679) b!1101510))

(assert (= (and b!1101510 c!109106) b!1101520))

(assert (= (and b!1101510 (not c!109106)) b!1101527))

(assert (= (and b!1101520 res!734674) b!1101513))

(assert (= (or b!1101520 b!1101527) bm!46142))

(declare-fun b_lambda!17991 () Bool)

(assert (=> (not b_lambda!17991) (not b!1101511)))

(assert (=> b!1101511 t!34148))

(declare-fun b_and!37035 () Bool)

(assert (= b_and!37033 (and (=> t!34148 result!16521) b_and!37035)))

(assert (=> b!1101528 m!1021823))

(assert (=> b!1101528 m!1021823))

(assert (=> b!1101528 m!1021831))

(assert (=> d!131043 m!1021677))

(declare-fun m!1021909 () Bool)

(assert (=> b!1101525 m!1021909))

(declare-fun m!1021911 () Bool)

(assert (=> bm!46142 m!1021911))

(assert (=> b!1101512 m!1021823))

(assert (=> b!1101512 m!1021823))

(assert (=> b!1101512 m!1021831))

(assert (=> bm!46146 m!1021665))

(declare-fun m!1021913 () Bool)

(assert (=> b!1101516 m!1021913))

(declare-fun m!1021915 () Bool)

(assert (=> b!1101516 m!1021915))

(declare-fun m!1021917 () Bool)

(assert (=> b!1101516 m!1021917))

(declare-fun m!1021919 () Bool)

(assert (=> b!1101516 m!1021919))

(declare-fun m!1021921 () Bool)

(assert (=> b!1101516 m!1021921))

(declare-fun m!1021923 () Bool)

(assert (=> b!1101516 m!1021923))

(declare-fun m!1021925 () Bool)

(assert (=> b!1101516 m!1021925))

(declare-fun m!1021927 () Bool)

(assert (=> b!1101516 m!1021927))

(assert (=> b!1101516 m!1021913))

(declare-fun m!1021929 () Bool)

(assert (=> b!1101516 m!1021929))

(assert (=> b!1101516 m!1021925))

(declare-fun m!1021931 () Bool)

(assert (=> b!1101516 m!1021931))

(declare-fun m!1021933 () Bool)

(assert (=> b!1101516 m!1021933))

(assert (=> b!1101516 m!1021665))

(assert (=> b!1101516 m!1021917))

(declare-fun m!1021935 () Bool)

(assert (=> b!1101516 m!1021935))

(declare-fun m!1021937 () Bool)

(assert (=> b!1101516 m!1021937))

(declare-fun m!1021939 () Bool)

(assert (=> b!1101516 m!1021939))

(assert (=> b!1101516 m!1021921))

(declare-fun m!1021941 () Bool)

(assert (=> b!1101516 m!1021941))

(assert (=> b!1101516 m!1021823))

(declare-fun m!1021943 () Bool)

(assert (=> bm!46140 m!1021943))

(declare-fun m!1021945 () Bool)

(assert (=> b!1101513 m!1021945))

(declare-fun m!1021947 () Bool)

(assert (=> bm!46145 m!1021947))

(assert (=> b!1101524 m!1021823))

(assert (=> b!1101524 m!1021823))

(declare-fun m!1021949 () Bool)

(assert (=> b!1101524 m!1021949))

(assert (=> b!1101511 m!1021653))

(declare-fun m!1021951 () Bool)

(assert (=> b!1101511 m!1021951))

(assert (=> b!1101511 m!1021951))

(assert (=> b!1101511 m!1021653))

(declare-fun m!1021953 () Bool)

(assert (=> b!1101511 m!1021953))

(assert (=> b!1101511 m!1021823))

(declare-fun m!1021955 () Bool)

(assert (=> b!1101511 m!1021955))

(assert (=> b!1101511 m!1021823))

(declare-fun m!1021957 () Bool)

(assert (=> b!1101522 m!1021957))

(assert (=> b!1101294 d!131043))

(declare-fun b!1101555 () Bool)

(declare-fun e!628835 () ListLongMap!15335)

(declare-fun e!628834 () ListLongMap!15335)

(assert (=> b!1101555 (= e!628835 e!628834)))

(declare-fun c!109118 () Bool)

(assert (=> b!1101555 (= c!109118 (validKeyInArray!0 (select (arr!34317 lt!493190) #b00000000000000000000000000000000)))))

(declare-fun b!1101556 () Bool)

(declare-fun call!46152 () ListLongMap!15335)

(assert (=> b!1101556 (= e!628834 call!46152)))

(declare-fun lt!493397 () ListLongMap!15335)

(declare-fun b!1101557 () Bool)

(declare-fun e!628838 () Bool)

(assert (=> b!1101557 (= e!628838 (= lt!493397 (getCurrentListMapNoExtraKeys!4230 lt!493190 lt!493192 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1101558 () Bool)

(assert (=> b!1101558 (= e!628835 (ListLongMap!15336 Nil!23977))))

(declare-fun d!131045 () Bool)

(declare-fun e!628832 () Bool)

(assert (=> d!131045 e!628832))

(declare-fun res!734692 () Bool)

(assert (=> d!131045 (=> (not res!734692) (not e!628832))))

(assert (=> d!131045 (= res!734692 (not (contains!6419 lt!493397 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131045 (= lt!493397 e!628835)))

(declare-fun c!109120 () Bool)

(assert (=> d!131045 (= c!109120 (bvsge #b00000000000000000000000000000000 (size!34854 lt!493190)))))

(assert (=> d!131045 (validMask!0 mask!1414)))

(assert (=> d!131045 (= (getCurrentListMapNoExtraKeys!4230 lt!493190 lt!493192 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493397)))

(declare-fun b!1101559 () Bool)

(assert (=> b!1101559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34854 lt!493190)))))

(assert (=> b!1101559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34855 lt!493192)))))

(declare-fun e!628833 () Bool)

(assert (=> b!1101559 (= e!628833 (= (apply!958 lt!493397 (select (arr!34317 lt!493190) #b00000000000000000000000000000000)) (get!17668 (select (arr!34318 lt!493192) #b00000000000000000000000000000000) (dynLambda!2348 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1101560 () Bool)

(declare-fun e!628836 () Bool)

(assert (=> b!1101560 (= e!628836 e!628838)))

(declare-fun c!109119 () Bool)

(assert (=> b!1101560 (= c!109119 (bvslt #b00000000000000000000000000000000 (size!34854 lt!493190)))))

(declare-fun bm!46149 () Bool)

(assert (=> bm!46149 (= call!46152 (getCurrentListMapNoExtraKeys!4230 lt!493190 lt!493192 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1101561 () Bool)

(assert (=> b!1101561 (= e!628832 e!628836)))

(declare-fun c!109121 () Bool)

(declare-fun e!628837 () Bool)

(assert (=> b!1101561 (= c!109121 e!628837)))

(declare-fun res!734690 () Bool)

(assert (=> b!1101561 (=> (not res!734690) (not e!628837))))

(assert (=> b!1101561 (= res!734690 (bvslt #b00000000000000000000000000000000 (size!34854 lt!493190)))))

(declare-fun b!1101562 () Bool)

(declare-fun lt!493396 () Unit!36157)

(declare-fun lt!493399 () Unit!36157)

(assert (=> b!1101562 (= lt!493396 lt!493399)))

(declare-fun lt!493398 () ListLongMap!15335)

(declare-fun lt!493400 () V!41369)

(declare-fun lt!493401 () (_ BitVec 64))

(declare-fun lt!493402 () (_ BitVec 64))

(assert (=> b!1101562 (not (contains!6419 (+!3415 lt!493398 (tuple2!17359 lt!493402 lt!493400)) lt!493401))))

(declare-fun addStillNotContains!279 (ListLongMap!15335 (_ BitVec 64) V!41369 (_ BitVec 64)) Unit!36157)

(assert (=> b!1101562 (= lt!493399 (addStillNotContains!279 lt!493398 lt!493402 lt!493400 lt!493401))))

(assert (=> b!1101562 (= lt!493401 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1101562 (= lt!493400 (get!17668 (select (arr!34318 lt!493192) #b00000000000000000000000000000000) (dynLambda!2348 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1101562 (= lt!493402 (select (arr!34317 lt!493190) #b00000000000000000000000000000000))))

(assert (=> b!1101562 (= lt!493398 call!46152)))

(assert (=> b!1101562 (= e!628834 (+!3415 call!46152 (tuple2!17359 (select (arr!34317 lt!493190) #b00000000000000000000000000000000) (get!17668 (select (arr!34318 lt!493192) #b00000000000000000000000000000000) (dynLambda!2348 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1101563 () Bool)

(declare-fun isEmpty!971 (ListLongMap!15335) Bool)

(assert (=> b!1101563 (= e!628838 (isEmpty!971 lt!493397))))

(declare-fun b!1101564 () Bool)

(declare-fun res!734689 () Bool)

(assert (=> b!1101564 (=> (not res!734689) (not e!628832))))

(assert (=> b!1101564 (= res!734689 (not (contains!6419 lt!493397 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1101565 () Bool)

(assert (=> b!1101565 (= e!628836 e!628833)))

(assert (=> b!1101565 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34854 lt!493190)))))

(declare-fun res!734691 () Bool)

(assert (=> b!1101565 (= res!734691 (contains!6419 lt!493397 (select (arr!34317 lt!493190) #b00000000000000000000000000000000)))))

(assert (=> b!1101565 (=> (not res!734691) (not e!628833))))

(declare-fun b!1101566 () Bool)

(assert (=> b!1101566 (= e!628837 (validKeyInArray!0 (select (arr!34317 lt!493190) #b00000000000000000000000000000000)))))

(assert (=> b!1101566 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!131045 c!109120) b!1101558))

(assert (= (and d!131045 (not c!109120)) b!1101555))

(assert (= (and b!1101555 c!109118) b!1101562))

(assert (= (and b!1101555 (not c!109118)) b!1101556))

(assert (= (or b!1101562 b!1101556) bm!46149))

(assert (= (and d!131045 res!734692) b!1101564))

(assert (= (and b!1101564 res!734689) b!1101561))

(assert (= (and b!1101561 res!734690) b!1101566))

(assert (= (and b!1101561 c!109121) b!1101565))

(assert (= (and b!1101561 (not c!109121)) b!1101560))

(assert (= (and b!1101565 res!734691) b!1101559))

(assert (= (and b!1101560 c!109119) b!1101557))

(assert (= (and b!1101560 (not c!109119)) b!1101563))

(declare-fun b_lambda!17993 () Bool)

(assert (=> (not b_lambda!17993) (not b!1101559)))

(assert (=> b!1101559 t!34148))

(declare-fun b_and!37037 () Bool)

(assert (= b_and!37035 (and (=> t!34148 result!16521) b_and!37037)))

(declare-fun b_lambda!17995 () Bool)

(assert (=> (not b_lambda!17995) (not b!1101562)))

(assert (=> b!1101562 t!34148))

(declare-fun b_and!37039 () Bool)

(assert (= b_and!37037 (and (=> t!34148 result!16521) b_and!37039)))

(declare-fun m!1021959 () Bool)

(assert (=> bm!46149 m!1021959))

(declare-fun m!1021961 () Bool)

(assert (=> b!1101564 m!1021961))

(assert (=> b!1101557 m!1021959))

(declare-fun m!1021963 () Bool)

(assert (=> b!1101562 m!1021963))

(declare-fun m!1021965 () Bool)

(assert (=> b!1101562 m!1021965))

(assert (=> b!1101562 m!1021963))

(assert (=> b!1101562 m!1021951))

(declare-fun m!1021967 () Bool)

(assert (=> b!1101562 m!1021967))

(declare-fun m!1021969 () Bool)

(assert (=> b!1101562 m!1021969))

(assert (=> b!1101562 m!1021653))

(assert (=> b!1101562 m!1021951))

(assert (=> b!1101562 m!1021653))

(assert (=> b!1101562 m!1021953))

(assert (=> b!1101562 m!1021823))

(assert (=> b!1101566 m!1021823))

(assert (=> b!1101566 m!1021823))

(assert (=> b!1101566 m!1021831))

(assert (=> b!1101565 m!1021823))

(assert (=> b!1101565 m!1021823))

(declare-fun m!1021971 () Bool)

(assert (=> b!1101565 m!1021971))

(declare-fun m!1021973 () Bool)

(assert (=> b!1101563 m!1021973))

(assert (=> b!1101559 m!1021823))

(declare-fun m!1021975 () Bool)

(assert (=> b!1101559 m!1021975))

(assert (=> b!1101559 m!1021951))

(assert (=> b!1101559 m!1021653))

(assert (=> b!1101559 m!1021951))

(assert (=> b!1101559 m!1021653))

(assert (=> b!1101559 m!1021953))

(assert (=> b!1101559 m!1021823))

(declare-fun m!1021977 () Bool)

(assert (=> d!131045 m!1021977))

(assert (=> d!131045 m!1021677))

(assert (=> b!1101555 m!1021823))

(assert (=> b!1101555 m!1021823))

(assert (=> b!1101555 m!1021831))

(assert (=> b!1101294 d!131045))

(declare-fun d!131047 () Bool)

(declare-fun lt!493405 () ListLongMap!15335)

(assert (=> d!131047 (not (contains!6419 lt!493405 k0!904))))

(declare-fun removeStrictlySorted!82 (List!23980 (_ BitVec 64)) List!23980)

(assert (=> d!131047 (= lt!493405 (ListLongMap!15336 (removeStrictlySorted!82 (toList!7683 lt!493195) k0!904)))))

(assert (=> d!131047 (= (-!953 lt!493195 k0!904) lt!493405)))

(declare-fun bs!32321 () Bool)

(assert (= bs!32321 d!131047))

(declare-fun m!1021979 () Bool)

(assert (=> bs!32321 m!1021979))

(declare-fun m!1021981 () Bool)

(assert (=> bs!32321 m!1021981))

(assert (=> b!1101294 d!131047))

(declare-fun d!131049 () Bool)

(declare-fun res!734697 () Bool)

(declare-fun e!628843 () Bool)

(assert (=> d!131049 (=> res!734697 e!628843)))

(assert (=> d!131049 (= res!734697 (= (select (arr!34317 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!131049 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!628843)))

(declare-fun b!1101571 () Bool)

(declare-fun e!628844 () Bool)

(assert (=> b!1101571 (= e!628843 e!628844)))

(declare-fun res!734698 () Bool)

(assert (=> b!1101571 (=> (not res!734698) (not e!628844))))

(assert (=> b!1101571 (= res!734698 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34854 _keys!1070)))))

(declare-fun b!1101572 () Bool)

(assert (=> b!1101572 (= e!628844 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131049 (not res!734697)) b!1101571))

(assert (= (and b!1101571 res!734698) b!1101572))

(assert (=> d!131049 m!1021811))

(declare-fun m!1021983 () Bool)

(assert (=> b!1101572 m!1021983))

(assert (=> b!1101294 d!131049))

(declare-fun b!1101573 () Bool)

(declare-fun e!628848 () ListLongMap!15335)

(declare-fun e!628847 () ListLongMap!15335)

(assert (=> b!1101573 (= e!628848 e!628847)))

(declare-fun c!109122 () Bool)

(assert (=> b!1101573 (= c!109122 (validKeyInArray!0 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101574 () Bool)

(declare-fun call!46153 () ListLongMap!15335)

(assert (=> b!1101574 (= e!628847 call!46153)))

(declare-fun b!1101575 () Bool)

(declare-fun lt!493407 () ListLongMap!15335)

(declare-fun e!628851 () Bool)

(assert (=> b!1101575 (= e!628851 (= lt!493407 (getCurrentListMapNoExtraKeys!4230 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1101576 () Bool)

(assert (=> b!1101576 (= e!628848 (ListLongMap!15336 Nil!23977))))

(declare-fun d!131051 () Bool)

(declare-fun e!628845 () Bool)

(assert (=> d!131051 e!628845))

(declare-fun res!734702 () Bool)

(assert (=> d!131051 (=> (not res!734702) (not e!628845))))

(assert (=> d!131051 (= res!734702 (not (contains!6419 lt!493407 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131051 (= lt!493407 e!628848)))

(declare-fun c!109124 () Bool)

(assert (=> d!131051 (= c!109124 (bvsge #b00000000000000000000000000000000 (size!34854 _keys!1070)))))

(assert (=> d!131051 (validMask!0 mask!1414)))

(assert (=> d!131051 (= (getCurrentListMapNoExtraKeys!4230 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493407)))

(declare-fun b!1101577 () Bool)

(assert (=> b!1101577 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34854 _keys!1070)))))

(assert (=> b!1101577 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34855 _values!874)))))

(declare-fun e!628846 () Bool)

(assert (=> b!1101577 (= e!628846 (= (apply!958 lt!493407 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000)) (get!17668 (select (arr!34318 _values!874) #b00000000000000000000000000000000) (dynLambda!2348 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1101578 () Bool)

(declare-fun e!628849 () Bool)

(assert (=> b!1101578 (= e!628849 e!628851)))

(declare-fun c!109123 () Bool)

(assert (=> b!1101578 (= c!109123 (bvslt #b00000000000000000000000000000000 (size!34854 _keys!1070)))))

(declare-fun bm!46150 () Bool)

(assert (=> bm!46150 (= call!46153 (getCurrentListMapNoExtraKeys!4230 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1101579 () Bool)

(assert (=> b!1101579 (= e!628845 e!628849)))

(declare-fun c!109125 () Bool)

(declare-fun e!628850 () Bool)

(assert (=> b!1101579 (= c!109125 e!628850)))

(declare-fun res!734700 () Bool)

(assert (=> b!1101579 (=> (not res!734700) (not e!628850))))

(assert (=> b!1101579 (= res!734700 (bvslt #b00000000000000000000000000000000 (size!34854 _keys!1070)))))

(declare-fun b!1101580 () Bool)

(declare-fun lt!493406 () Unit!36157)

(declare-fun lt!493409 () Unit!36157)

(assert (=> b!1101580 (= lt!493406 lt!493409)))

(declare-fun lt!493411 () (_ BitVec 64))

(declare-fun lt!493410 () V!41369)

(declare-fun lt!493412 () (_ BitVec 64))

(declare-fun lt!493408 () ListLongMap!15335)

(assert (=> b!1101580 (not (contains!6419 (+!3415 lt!493408 (tuple2!17359 lt!493412 lt!493410)) lt!493411))))

(assert (=> b!1101580 (= lt!493409 (addStillNotContains!279 lt!493408 lt!493412 lt!493410 lt!493411))))

(assert (=> b!1101580 (= lt!493411 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1101580 (= lt!493410 (get!17668 (select (arr!34318 _values!874) #b00000000000000000000000000000000) (dynLambda!2348 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1101580 (= lt!493412 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1101580 (= lt!493408 call!46153)))

(assert (=> b!1101580 (= e!628847 (+!3415 call!46153 (tuple2!17359 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000) (get!17668 (select (arr!34318 _values!874) #b00000000000000000000000000000000) (dynLambda!2348 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1101581 () Bool)

(assert (=> b!1101581 (= e!628851 (isEmpty!971 lt!493407))))

(declare-fun b!1101582 () Bool)

(declare-fun res!734699 () Bool)

(assert (=> b!1101582 (=> (not res!734699) (not e!628845))))

(assert (=> b!1101582 (= res!734699 (not (contains!6419 lt!493407 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1101583 () Bool)

(assert (=> b!1101583 (= e!628849 e!628846)))

(assert (=> b!1101583 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34854 _keys!1070)))))

(declare-fun res!734701 () Bool)

(assert (=> b!1101583 (= res!734701 (contains!6419 lt!493407 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101583 (=> (not res!734701) (not e!628846))))

(declare-fun b!1101584 () Bool)

(assert (=> b!1101584 (= e!628850 (validKeyInArray!0 (select (arr!34317 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101584 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!131051 c!109124) b!1101576))

(assert (= (and d!131051 (not c!109124)) b!1101573))

(assert (= (and b!1101573 c!109122) b!1101580))

(assert (= (and b!1101573 (not c!109122)) b!1101574))

(assert (= (or b!1101580 b!1101574) bm!46150))

(assert (= (and d!131051 res!734702) b!1101582))

(assert (= (and b!1101582 res!734699) b!1101579))

(assert (= (and b!1101579 res!734700) b!1101584))

(assert (= (and b!1101579 c!109125) b!1101583))

(assert (= (and b!1101579 (not c!109125)) b!1101578))

(assert (= (and b!1101583 res!734701) b!1101577))

(assert (= (and b!1101578 c!109123) b!1101575))

(assert (= (and b!1101578 (not c!109123)) b!1101581))

(declare-fun b_lambda!17997 () Bool)

(assert (=> (not b_lambda!17997) (not b!1101577)))

(assert (=> b!1101577 t!34148))

(declare-fun b_and!37041 () Bool)

(assert (= b_and!37039 (and (=> t!34148 result!16521) b_and!37041)))

(declare-fun b_lambda!17999 () Bool)

(assert (=> (not b_lambda!17999) (not b!1101580)))

(assert (=> b!1101580 t!34148))

(declare-fun b_and!37043 () Bool)

(assert (= b_and!37041 (and (=> t!34148 result!16521) b_and!37043)))

(declare-fun m!1021985 () Bool)

(assert (=> bm!46150 m!1021985))

(declare-fun m!1021987 () Bool)

(assert (=> b!1101582 m!1021987))

(assert (=> b!1101575 m!1021985))

(declare-fun m!1021989 () Bool)

(assert (=> b!1101580 m!1021989))

(declare-fun m!1021991 () Bool)

(assert (=> b!1101580 m!1021991))

(assert (=> b!1101580 m!1021989))

(assert (=> b!1101580 m!1021895))

(declare-fun m!1021993 () Bool)

(assert (=> b!1101580 m!1021993))

(declare-fun m!1021995 () Bool)

(assert (=> b!1101580 m!1021995))

(assert (=> b!1101580 m!1021653))

(assert (=> b!1101580 m!1021895))

(assert (=> b!1101580 m!1021653))

(assert (=> b!1101580 m!1021897))

(assert (=> b!1101580 m!1021811))

(assert (=> b!1101584 m!1021811))

(assert (=> b!1101584 m!1021811))

(assert (=> b!1101584 m!1021819))

(assert (=> b!1101583 m!1021811))

(assert (=> b!1101583 m!1021811))

(declare-fun m!1021997 () Bool)

(assert (=> b!1101583 m!1021997))

(declare-fun m!1021999 () Bool)

(assert (=> b!1101581 m!1021999))

(assert (=> b!1101577 m!1021811))

(declare-fun m!1022001 () Bool)

(assert (=> b!1101577 m!1022001))

(assert (=> b!1101577 m!1021895))

(assert (=> b!1101577 m!1021653))

(assert (=> b!1101577 m!1021895))

(assert (=> b!1101577 m!1021653))

(assert (=> b!1101577 m!1021897))

(assert (=> b!1101577 m!1021811))

(declare-fun m!1022003 () Bool)

(assert (=> d!131051 m!1022003))

(assert (=> d!131051 m!1021677))

(assert (=> b!1101573 m!1021811))

(assert (=> b!1101573 m!1021811))

(assert (=> b!1101573 m!1021819))

(assert (=> b!1101294 d!131051))

(declare-fun d!131053 () Bool)

(assert (=> d!131053 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493415 () Unit!36157)

(declare-fun choose!13 (array!71315 (_ BitVec 64) (_ BitVec 32)) Unit!36157)

(assert (=> d!131053 (= lt!493415 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!131053 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!131053 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!493415)))

(declare-fun bs!32322 () Bool)

(assert (= bs!32322 d!131053))

(assert (=> bs!32322 m!1021657))

(declare-fun m!1022005 () Bool)

(assert (=> bs!32322 m!1022005))

(assert (=> b!1101294 d!131053))

(declare-fun condMapEmpty!42559 () Bool)

(declare-fun mapDefault!42559 () ValueCell!12881)

(assert (=> mapNonEmpty!42550 (= condMapEmpty!42559 (= mapRest!42550 ((as const (Array (_ BitVec 32) ValueCell!12881)) mapDefault!42559)))))

(declare-fun e!628856 () Bool)

(declare-fun mapRes!42559 () Bool)

(assert (=> mapNonEmpty!42550 (= tp!81337 (and e!628856 mapRes!42559))))

(declare-fun b!1101591 () Bool)

(declare-fun e!628857 () Bool)

(assert (=> b!1101591 (= e!628857 tp_is_empty!27181)))

(declare-fun b!1101592 () Bool)

(assert (=> b!1101592 (= e!628856 tp_is_empty!27181)))

(declare-fun mapNonEmpty!42559 () Bool)

(declare-fun tp!81353 () Bool)

(assert (=> mapNonEmpty!42559 (= mapRes!42559 (and tp!81353 e!628857))))

(declare-fun mapValue!42559 () ValueCell!12881)

(declare-fun mapKey!42559 () (_ BitVec 32))

(declare-fun mapRest!42559 () (Array (_ BitVec 32) ValueCell!12881))

(assert (=> mapNonEmpty!42559 (= mapRest!42550 (store mapRest!42559 mapKey!42559 mapValue!42559))))

(declare-fun mapIsEmpty!42559 () Bool)

(assert (=> mapIsEmpty!42559 mapRes!42559))

(assert (= (and mapNonEmpty!42550 condMapEmpty!42559) mapIsEmpty!42559))

(assert (= (and mapNonEmpty!42550 (not condMapEmpty!42559)) mapNonEmpty!42559))

(assert (= (and mapNonEmpty!42559 ((_ is ValueCellFull!12881) mapValue!42559)) b!1101591))

(assert (= (and mapNonEmpty!42550 ((_ is ValueCellFull!12881) mapDefault!42559)) b!1101592))

(declare-fun m!1022007 () Bool)

(assert (=> mapNonEmpty!42559 m!1022007))

(declare-fun b_lambda!18001 () Bool)

(assert (= b_lambda!17987 (or (and start!96946 b_free!23131) b_lambda!18001)))

(declare-fun b_lambda!18003 () Bool)

(assert (= b_lambda!17993 (or (and start!96946 b_free!23131) b_lambda!18003)))

(declare-fun b_lambda!18005 () Bool)

(assert (= b_lambda!17999 (or (and start!96946 b_free!23131) b_lambda!18005)))

(declare-fun b_lambda!18007 () Bool)

(assert (= b_lambda!17995 (or (and start!96946 b_free!23131) b_lambda!18007)))

(declare-fun b_lambda!18009 () Bool)

(assert (= b_lambda!17991 (or (and start!96946 b_free!23131) b_lambda!18009)))

(declare-fun b_lambda!18011 () Bool)

(assert (= b_lambda!17997 (or (and start!96946 b_free!23131) b_lambda!18011)))

(declare-fun b_lambda!18013 () Bool)

(assert (= b_lambda!17989 (or (and start!96946 b_free!23131) b_lambda!18013)))

(check-sat (not b!1101414) (not b_lambda!18007) (not b_lambda!18013) (not b!1101584) (not d!131053) (not bm!46149) (not b!1101559) (not b!1101486) (not b!1101427) (not b!1101582) (not bm!46108) (not b!1101525) (not b!1101563) (not d!131045) (not b!1101508) (not bm!46140) (not d!131043) (not b_lambda!18001) (not b!1101413) (not b_lambda!18009) (not b!1101575) (not b!1101566) tp_is_empty!27181 (not d!131039) (not b!1101564) (not bm!46107) (not b!1101577) (not b!1101494) (not b_lambda!18011) (not bm!46112) (not b!1101516) (not d!131051) (not b_next!23131) (not b!1101483) (not bm!46145) (not b_lambda!18003) (not b!1101430) (not mapNonEmpty!42559) (not b!1101399) (not b!1101572) (not bm!46127) (not b!1101524) (not b!1101557) (not b!1101409) (not bm!46133) (not b!1101581) (not b_lambda!18005) (not b!1101397) (not b!1101513) (not bm!46139) (not b!1101434) (not b!1101437) (not b!1101580) (not b!1101555) (not b!1101512) (not b!1101482) (not b!1101495) (not b!1101528) (not b!1101435) (not bm!46150) (not d!131041) (not b!1101565) (not b!1101498) (not b!1101522) (not d!131019) (not bm!46132) (not bm!46146) (not bm!46142) (not b!1101432) (not b!1101436) (not b!1101429) (not b!1101410) b_and!37043 (not b!1101481) (not b!1101398) (not b!1101511) (not bm!46129) (not bm!46138) (not b!1101396) (not b!1101562) (not b!1101573) (not d!131035) (not b!1101583) (not b_lambda!17985) (not bm!46111) (not b!1101492) (not d!131017) (not d!131047))
(check-sat b_and!37043 (not b_next!23131))
