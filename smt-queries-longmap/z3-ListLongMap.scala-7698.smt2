; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96642 () Bool)

(assert start!96642)

(declare-fun b_free!23115 () Bool)

(declare-fun b_next!23115 () Bool)

(assert (=> start!96642 (= b_free!23115 (not b_next!23115))))

(declare-fun tp!81284 () Bool)

(declare-fun b_and!36949 () Bool)

(assert (=> start!96642 (= tp!81284 b_and!36949)))

(declare-fun b!1099217 () Bool)

(declare-fun res!733583 () Bool)

(declare-fun e!627378 () Bool)

(assert (=> b!1099217 (=> (not res!733583) (not e!627378))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71243 0))(
  ( (array!71244 (arr!34289 (Array (_ BitVec 32) (_ BitVec 64))) (size!34825 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71243)

(declare-datatypes ((V!41347 0))(
  ( (V!41348 (val!13639 Int)) )
))
(declare-datatypes ((ValueCell!12873 0))(
  ( (ValueCellFull!12873 (v!16264 V!41347)) (EmptyCell!12873) )
))
(declare-datatypes ((array!71245 0))(
  ( (array!71246 (arr!34290 (Array (_ BitVec 32) ValueCell!12873)) (size!34826 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71245)

(assert (=> b!1099217 (= res!733583 (and (= (size!34826 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34825 _keys!1070) (size!34826 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1099218 () Bool)

(declare-fun res!733585 () Bool)

(assert (=> b!1099218 (=> (not res!733585) (not e!627378))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1099218 (= res!733585 (validKeyInArray!0 k0!904))))

(declare-datatypes ((tuple2!17330 0))(
  ( (tuple2!17331 (_1!8676 (_ BitVec 64)) (_2!8676 V!41347)) )
))
(declare-datatypes ((List!23948 0))(
  ( (Nil!23945) (Cons!23944 (h!25153 tuple2!17330) (t!34109 List!23948)) )
))
(declare-datatypes ((ListLongMap!15299 0))(
  ( (ListLongMap!15300 (toList!7665 List!23948)) )
))
(declare-fun lt!492137 () ListLongMap!15299)

(declare-fun lt!492142 () ListLongMap!15299)

(declare-fun e!627379 () Bool)

(declare-fun b!1099219 () Bool)

(declare-fun zeroValue!831 () V!41347)

(declare-fun +!3373 (ListLongMap!15299 tuple2!17330) ListLongMap!15299)

(assert (=> b!1099219 (= e!627379 (= lt!492142 (+!3373 lt!492137 (tuple2!17331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun b!1099220 () Bool)

(declare-fun res!733584 () Bool)

(assert (=> b!1099220 (=> (not res!733584) (not e!627378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71243 (_ BitVec 32)) Bool)

(assert (=> b!1099220 (= res!733584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1099221 () Bool)

(declare-fun res!733581 () Bool)

(assert (=> b!1099221 (=> (not res!733581) (not e!627378))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1099221 (= res!733581 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34825 _keys!1070))))))

(declare-fun b!1099222 () Bool)

(declare-fun res!733582 () Bool)

(declare-fun e!627381 () Bool)

(assert (=> b!1099222 (=> (not res!733582) (not e!627381))))

(declare-fun lt!492139 () array!71243)

(declare-datatypes ((List!23949 0))(
  ( (Nil!23946) (Cons!23945 (h!25154 (_ BitVec 64)) (t!34110 List!23949)) )
))
(declare-fun arrayNoDuplicates!0 (array!71243 (_ BitVec 32) List!23949) Bool)

(assert (=> b!1099222 (= res!733582 (arrayNoDuplicates!0 lt!492139 #b00000000000000000000000000000000 Nil!23946))))

(declare-fun b!1099223 () Bool)

(declare-fun e!627382 () Bool)

(declare-fun tp_is_empty!27165 () Bool)

(assert (=> b!1099223 (= e!627382 tp_is_empty!27165)))

(declare-fun b!1099224 () Bool)

(assert (=> b!1099224 (= e!627378 e!627381)))

(declare-fun res!733577 () Bool)

(assert (=> b!1099224 (=> (not res!733577) (not e!627381))))

(assert (=> b!1099224 (= res!733577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492139 mask!1414))))

(assert (=> b!1099224 (= lt!492139 (array!71244 (store (arr!34289 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34825 _keys!1070)))))

(declare-fun b!1099225 () Bool)

(declare-fun e!627383 () Bool)

(declare-fun e!627384 () Bool)

(declare-fun mapRes!42520 () Bool)

(assert (=> b!1099225 (= e!627383 (and e!627384 mapRes!42520))))

(declare-fun condMapEmpty!42520 () Bool)

(declare-fun mapDefault!42520 () ValueCell!12873)

(assert (=> b!1099225 (= condMapEmpty!42520 (= (arr!34290 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12873)) mapDefault!42520)))))

(declare-fun b!1099226 () Bool)

(assert (=> b!1099226 (= e!627384 tp_is_empty!27165)))

(declare-fun mapNonEmpty!42520 () Bool)

(declare-fun tp!81283 () Bool)

(assert (=> mapNonEmpty!42520 (= mapRes!42520 (and tp!81283 e!627382))))

(declare-fun mapRest!42520 () (Array (_ BitVec 32) ValueCell!12873))

(declare-fun mapKey!42520 () (_ BitVec 32))

(declare-fun mapValue!42520 () ValueCell!12873)

(assert (=> mapNonEmpty!42520 (= (arr!34290 _values!874) (store mapRest!42520 mapKey!42520 mapValue!42520))))

(declare-fun b!1099227 () Bool)

(declare-fun res!733578 () Bool)

(assert (=> b!1099227 (=> (not res!733578) (not e!627378))))

(assert (=> b!1099227 (= res!733578 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23946))))

(declare-fun b!1099228 () Bool)

(assert (=> b!1099228 (= e!627381 (not e!627379))))

(declare-fun res!733580 () Bool)

(assert (=> b!1099228 (=> res!733580 e!627379)))

(assert (=> b!1099228 (= res!733580 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41347)

(declare-fun lt!492140 () ListLongMap!15299)

(declare-fun getCurrentListMap!4379 (array!71243 array!71245 (_ BitVec 32) (_ BitVec 32) V!41347 V!41347 (_ BitVec 32) Int) ListLongMap!15299)

(assert (=> b!1099228 (= lt!492140 (getCurrentListMap!4379 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492138 () array!71245)

(assert (=> b!1099228 (= lt!492142 (getCurrentListMap!4379 lt!492139 lt!492138 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492143 () ListLongMap!15299)

(assert (=> b!1099228 (and (= lt!492137 lt!492143) (= lt!492143 lt!492137))))

(declare-fun lt!492144 () ListLongMap!15299)

(declare-fun -!954 (ListLongMap!15299 (_ BitVec 64)) ListLongMap!15299)

(assert (=> b!1099228 (= lt!492143 (-!954 lt!492144 k0!904))))

(declare-datatypes ((Unit!36148 0))(
  ( (Unit!36149) )
))
(declare-fun lt!492141 () Unit!36148)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!205 (array!71243 array!71245 (_ BitVec 32) (_ BitVec 32) V!41347 V!41347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36148)

(assert (=> b!1099228 (= lt!492141 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!205 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4175 (array!71243 array!71245 (_ BitVec 32) (_ BitVec 32) V!41347 V!41347 (_ BitVec 32) Int) ListLongMap!15299)

(assert (=> b!1099228 (= lt!492137 (getCurrentListMapNoExtraKeys!4175 lt!492139 lt!492138 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2310 (Int (_ BitVec 64)) V!41347)

(assert (=> b!1099228 (= lt!492138 (array!71246 (store (arr!34290 _values!874) i!650 (ValueCellFull!12873 (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34826 _values!874)))))

(assert (=> b!1099228 (= lt!492144 (getCurrentListMapNoExtraKeys!4175 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099228 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492136 () Unit!36148)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71243 (_ BitVec 64) (_ BitVec 32)) Unit!36148)

(assert (=> b!1099228 (= lt!492136 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!42520 () Bool)

(assert (=> mapIsEmpty!42520 mapRes!42520))

(declare-fun b!1099229 () Bool)

(declare-fun res!733586 () Bool)

(assert (=> b!1099229 (=> (not res!733586) (not e!627378))))

(assert (=> b!1099229 (= res!733586 (= (select (arr!34289 _keys!1070) i!650) k0!904))))

(declare-fun res!733579 () Bool)

(assert (=> start!96642 (=> (not res!733579) (not e!627378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96642 (= res!733579 (validMask!0 mask!1414))))

(assert (=> start!96642 e!627378))

(assert (=> start!96642 tp!81284))

(assert (=> start!96642 true))

(assert (=> start!96642 tp_is_empty!27165))

(declare-fun array_inv!26414 (array!71243) Bool)

(assert (=> start!96642 (array_inv!26414 _keys!1070)))

(declare-fun array_inv!26415 (array!71245) Bool)

(assert (=> start!96642 (and (array_inv!26415 _values!874) e!627383)))

(assert (= (and start!96642 res!733579) b!1099217))

(assert (= (and b!1099217 res!733583) b!1099220))

(assert (= (and b!1099220 res!733584) b!1099227))

(assert (= (and b!1099227 res!733578) b!1099221))

(assert (= (and b!1099221 res!733581) b!1099218))

(assert (= (and b!1099218 res!733585) b!1099229))

(assert (= (and b!1099229 res!733586) b!1099224))

(assert (= (and b!1099224 res!733577) b!1099222))

(assert (= (and b!1099222 res!733582) b!1099228))

(assert (= (and b!1099228 (not res!733580)) b!1099219))

(assert (= (and b!1099225 condMapEmpty!42520) mapIsEmpty!42520))

(assert (= (and b!1099225 (not condMapEmpty!42520)) mapNonEmpty!42520))

(get-info :version)

(assert (= (and mapNonEmpty!42520 ((_ is ValueCellFull!12873) mapValue!42520)) b!1099223))

(assert (= (and b!1099225 ((_ is ValueCellFull!12873) mapDefault!42520)) b!1099226))

(assert (= start!96642 b!1099225))

(declare-fun b_lambda!17893 () Bool)

(assert (=> (not b_lambda!17893) (not b!1099228)))

(declare-fun t!34108 () Bool)

(declare-fun tb!7981 () Bool)

(assert (=> (and start!96642 (= defaultEntry!882 defaultEntry!882) t!34108) tb!7981))

(declare-fun result!16493 () Bool)

(assert (=> tb!7981 (= result!16493 tp_is_empty!27165)))

(assert (=> b!1099228 t!34108))

(declare-fun b_and!36951 () Bool)

(assert (= b_and!36949 (and (=> t!34108 result!16493) b_and!36951)))

(declare-fun m!1019187 () Bool)

(assert (=> mapNonEmpty!42520 m!1019187))

(declare-fun m!1019189 () Bool)

(assert (=> b!1099224 m!1019189))

(declare-fun m!1019191 () Bool)

(assert (=> b!1099224 m!1019191))

(declare-fun m!1019193 () Bool)

(assert (=> b!1099222 m!1019193))

(declare-fun m!1019195 () Bool)

(assert (=> b!1099229 m!1019195))

(declare-fun m!1019197 () Bool)

(assert (=> b!1099228 m!1019197))

(declare-fun m!1019199 () Bool)

(assert (=> b!1099228 m!1019199))

(declare-fun m!1019201 () Bool)

(assert (=> b!1099228 m!1019201))

(declare-fun m!1019203 () Bool)

(assert (=> b!1099228 m!1019203))

(declare-fun m!1019205 () Bool)

(assert (=> b!1099228 m!1019205))

(declare-fun m!1019207 () Bool)

(assert (=> b!1099228 m!1019207))

(declare-fun m!1019209 () Bool)

(assert (=> b!1099228 m!1019209))

(declare-fun m!1019211 () Bool)

(assert (=> b!1099228 m!1019211))

(declare-fun m!1019213 () Bool)

(assert (=> b!1099228 m!1019213))

(declare-fun m!1019215 () Bool)

(assert (=> b!1099228 m!1019215))

(declare-fun m!1019217 () Bool)

(assert (=> start!96642 m!1019217))

(declare-fun m!1019219 () Bool)

(assert (=> start!96642 m!1019219))

(declare-fun m!1019221 () Bool)

(assert (=> start!96642 m!1019221))

(declare-fun m!1019223 () Bool)

(assert (=> b!1099218 m!1019223))

(declare-fun m!1019225 () Bool)

(assert (=> b!1099219 m!1019225))

(declare-fun m!1019227 () Bool)

(assert (=> b!1099220 m!1019227))

(declare-fun m!1019229 () Bool)

(assert (=> b!1099227 m!1019229))

(check-sat (not b!1099227) (not mapNonEmpty!42520) (not b!1099222) (not b!1099224) (not b!1099228) b_and!36951 (not b_lambda!17893) (not start!96642) (not b!1099219) (not b!1099218) tp_is_empty!27165 (not b_next!23115) (not b!1099220))
(check-sat b_and!36951 (not b_next!23115))
(get-model)

(declare-fun b_lambda!17897 () Bool)

(assert (= b_lambda!17893 (or (and start!96642 b_free!23115) b_lambda!17897)))

(check-sat (not b!1099227) (not mapNonEmpty!42520) (not b!1099222) (not b_lambda!17897) (not b!1099224) (not b!1099228) b_and!36951 (not start!96642) (not b!1099219) (not b!1099218) tp_is_empty!27165 (not b_next!23115) (not b!1099220))
(check-sat b_and!36951 (not b_next!23115))
(get-model)

(declare-fun b!1099283 () Bool)

(declare-fun e!627415 () Bool)

(declare-fun e!627416 () Bool)

(assert (=> b!1099283 (= e!627415 e!627416)))

(declare-fun c!108565 () Bool)

(assert (=> b!1099283 (= c!108565 (validKeyInArray!0 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099284 () Bool)

(declare-fun e!627417 () Bool)

(declare-fun contains!6389 (List!23949 (_ BitVec 64)) Bool)

(assert (=> b!1099284 (= e!627417 (contains!6389 Nil!23946 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099285 () Bool)

(declare-fun call!45951 () Bool)

(assert (=> b!1099285 (= e!627416 call!45951)))

(declare-fun b!1099286 () Bool)

(assert (=> b!1099286 (= e!627416 call!45951)))

(declare-fun b!1099287 () Bool)

(declare-fun e!627414 () Bool)

(assert (=> b!1099287 (= e!627414 e!627415)))

(declare-fun res!733625 () Bool)

(assert (=> b!1099287 (=> (not res!733625) (not e!627415))))

(assert (=> b!1099287 (= res!733625 (not e!627417))))

(declare-fun res!733623 () Bool)

(assert (=> b!1099287 (=> (not res!733623) (not e!627417))))

(assert (=> b!1099287 (= res!733623 (validKeyInArray!0 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130477 () Bool)

(declare-fun res!733624 () Bool)

(assert (=> d!130477 (=> res!733624 e!627414)))

(assert (=> d!130477 (= res!733624 (bvsge #b00000000000000000000000000000000 (size!34825 _keys!1070)))))

(assert (=> d!130477 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23946) e!627414)))

(declare-fun bm!45948 () Bool)

(assert (=> bm!45948 (= call!45951 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108565 (Cons!23945 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000) Nil!23946) Nil!23946)))))

(assert (= (and d!130477 (not res!733624)) b!1099287))

(assert (= (and b!1099287 res!733623) b!1099284))

(assert (= (and b!1099287 res!733625) b!1099283))

(assert (= (and b!1099283 c!108565) b!1099286))

(assert (= (and b!1099283 (not c!108565)) b!1099285))

(assert (= (or b!1099286 b!1099285) bm!45948))

(declare-fun m!1019275 () Bool)

(assert (=> b!1099283 m!1019275))

(assert (=> b!1099283 m!1019275))

(declare-fun m!1019277 () Bool)

(assert (=> b!1099283 m!1019277))

(assert (=> b!1099284 m!1019275))

(assert (=> b!1099284 m!1019275))

(declare-fun m!1019279 () Bool)

(assert (=> b!1099284 m!1019279))

(assert (=> b!1099287 m!1019275))

(assert (=> b!1099287 m!1019275))

(assert (=> b!1099287 m!1019277))

(assert (=> bm!45948 m!1019275))

(declare-fun m!1019281 () Bool)

(assert (=> bm!45948 m!1019281))

(assert (=> b!1099227 d!130477))

(declare-fun b!1099288 () Bool)

(declare-fun e!627419 () Bool)

(declare-fun e!627420 () Bool)

(assert (=> b!1099288 (= e!627419 e!627420)))

(declare-fun c!108566 () Bool)

(assert (=> b!1099288 (= c!108566 (validKeyInArray!0 (select (arr!34289 lt!492139) #b00000000000000000000000000000000)))))

(declare-fun b!1099289 () Bool)

(declare-fun e!627421 () Bool)

(assert (=> b!1099289 (= e!627421 (contains!6389 Nil!23946 (select (arr!34289 lt!492139) #b00000000000000000000000000000000)))))

(declare-fun b!1099290 () Bool)

(declare-fun call!45952 () Bool)

(assert (=> b!1099290 (= e!627420 call!45952)))

(declare-fun b!1099291 () Bool)

(assert (=> b!1099291 (= e!627420 call!45952)))

(declare-fun b!1099292 () Bool)

(declare-fun e!627418 () Bool)

(assert (=> b!1099292 (= e!627418 e!627419)))

(declare-fun res!733628 () Bool)

(assert (=> b!1099292 (=> (not res!733628) (not e!627419))))

(assert (=> b!1099292 (= res!733628 (not e!627421))))

(declare-fun res!733626 () Bool)

(assert (=> b!1099292 (=> (not res!733626) (not e!627421))))

(assert (=> b!1099292 (= res!733626 (validKeyInArray!0 (select (arr!34289 lt!492139) #b00000000000000000000000000000000)))))

(declare-fun d!130479 () Bool)

(declare-fun res!733627 () Bool)

(assert (=> d!130479 (=> res!733627 e!627418)))

(assert (=> d!130479 (= res!733627 (bvsge #b00000000000000000000000000000000 (size!34825 lt!492139)))))

(assert (=> d!130479 (= (arrayNoDuplicates!0 lt!492139 #b00000000000000000000000000000000 Nil!23946) e!627418)))

(declare-fun bm!45949 () Bool)

(assert (=> bm!45949 (= call!45952 (arrayNoDuplicates!0 lt!492139 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108566 (Cons!23945 (select (arr!34289 lt!492139) #b00000000000000000000000000000000) Nil!23946) Nil!23946)))))

(assert (= (and d!130479 (not res!733627)) b!1099292))

(assert (= (and b!1099292 res!733626) b!1099289))

(assert (= (and b!1099292 res!733628) b!1099288))

(assert (= (and b!1099288 c!108566) b!1099291))

(assert (= (and b!1099288 (not c!108566)) b!1099290))

(assert (= (or b!1099291 b!1099290) bm!45949))

(declare-fun m!1019283 () Bool)

(assert (=> b!1099288 m!1019283))

(assert (=> b!1099288 m!1019283))

(declare-fun m!1019285 () Bool)

(assert (=> b!1099288 m!1019285))

(assert (=> b!1099289 m!1019283))

(assert (=> b!1099289 m!1019283))

(declare-fun m!1019287 () Bool)

(assert (=> b!1099289 m!1019287))

(assert (=> b!1099292 m!1019283))

(assert (=> b!1099292 m!1019283))

(assert (=> b!1099292 m!1019285))

(assert (=> bm!45949 m!1019283))

(declare-fun m!1019289 () Bool)

(assert (=> bm!45949 m!1019289))

(assert (=> b!1099222 d!130479))

(declare-fun d!130481 () Bool)

(assert (=> d!130481 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96642 d!130481))

(declare-fun d!130483 () Bool)

(assert (=> d!130483 (= (array_inv!26414 _keys!1070) (bvsge (size!34825 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96642 d!130483))

(declare-fun d!130485 () Bool)

(assert (=> d!130485 (= (array_inv!26415 _values!874) (bvsge (size!34826 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96642 d!130485))

(declare-fun bm!45952 () Bool)

(declare-fun call!45955 () Bool)

(assert (=> bm!45952 (= call!45955 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun d!130487 () Bool)

(declare-fun res!733634 () Bool)

(declare-fun e!627430 () Bool)

(assert (=> d!130487 (=> res!733634 e!627430)))

(assert (=> d!130487 (= res!733634 (bvsge #b00000000000000000000000000000000 (size!34825 _keys!1070)))))

(assert (=> d!130487 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!627430)))

(declare-fun b!1099301 () Bool)

(declare-fun e!627428 () Bool)

(assert (=> b!1099301 (= e!627428 call!45955)))

(declare-fun b!1099302 () Bool)

(declare-fun e!627429 () Bool)

(assert (=> b!1099302 (= e!627429 call!45955)))

(declare-fun b!1099303 () Bool)

(assert (=> b!1099303 (= e!627430 e!627429)))

(declare-fun c!108569 () Bool)

(assert (=> b!1099303 (= c!108569 (validKeyInArray!0 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099304 () Bool)

(assert (=> b!1099304 (= e!627429 e!627428)))

(declare-fun lt!492178 () (_ BitVec 64))

(assert (=> b!1099304 (= lt!492178 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492179 () Unit!36148)

(assert (=> b!1099304 (= lt!492179 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!492178 #b00000000000000000000000000000000))))

(assert (=> b!1099304 (arrayContainsKey!0 _keys!1070 lt!492178 #b00000000000000000000000000000000)))

(declare-fun lt!492180 () Unit!36148)

(assert (=> b!1099304 (= lt!492180 lt!492179)))

(declare-fun res!733633 () Bool)

(declare-datatypes ((SeekEntryResult!9910 0))(
  ( (MissingZero!9910 (index!42011 (_ BitVec 32))) (Found!9910 (index!42012 (_ BitVec 32))) (Intermediate!9910 (undefined!10722 Bool) (index!42013 (_ BitVec 32)) (x!98870 (_ BitVec 32))) (Undefined!9910) (MissingVacant!9910 (index!42014 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71243 (_ BitVec 32)) SeekEntryResult!9910)

(assert (=> b!1099304 (= res!733633 (= (seekEntryOrOpen!0 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9910 #b00000000000000000000000000000000)))))

(assert (=> b!1099304 (=> (not res!733633) (not e!627428))))

(assert (= (and d!130487 (not res!733634)) b!1099303))

(assert (= (and b!1099303 c!108569) b!1099304))

(assert (= (and b!1099303 (not c!108569)) b!1099302))

(assert (= (and b!1099304 res!733633) b!1099301))

(assert (= (or b!1099301 b!1099302) bm!45952))

(declare-fun m!1019291 () Bool)

(assert (=> bm!45952 m!1019291))

(assert (=> b!1099303 m!1019275))

(assert (=> b!1099303 m!1019275))

(assert (=> b!1099303 m!1019277))

(assert (=> b!1099304 m!1019275))

(declare-fun m!1019293 () Bool)

(assert (=> b!1099304 m!1019293))

(declare-fun m!1019295 () Bool)

(assert (=> b!1099304 m!1019295))

(assert (=> b!1099304 m!1019275))

(declare-fun m!1019297 () Bool)

(assert (=> b!1099304 m!1019297))

(assert (=> b!1099220 d!130487))

(declare-fun bm!45953 () Bool)

(declare-fun call!45956 () Bool)

(assert (=> bm!45953 (= call!45956 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!492139 mask!1414))))

(declare-fun d!130489 () Bool)

(declare-fun res!733636 () Bool)

(declare-fun e!627433 () Bool)

(assert (=> d!130489 (=> res!733636 e!627433)))

(assert (=> d!130489 (= res!733636 (bvsge #b00000000000000000000000000000000 (size!34825 lt!492139)))))

(assert (=> d!130489 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492139 mask!1414) e!627433)))

(declare-fun b!1099305 () Bool)

(declare-fun e!627431 () Bool)

(assert (=> b!1099305 (= e!627431 call!45956)))

(declare-fun b!1099306 () Bool)

(declare-fun e!627432 () Bool)

(assert (=> b!1099306 (= e!627432 call!45956)))

(declare-fun b!1099307 () Bool)

(assert (=> b!1099307 (= e!627433 e!627432)))

(declare-fun c!108570 () Bool)

(assert (=> b!1099307 (= c!108570 (validKeyInArray!0 (select (arr!34289 lt!492139) #b00000000000000000000000000000000)))))

(declare-fun b!1099308 () Bool)

(assert (=> b!1099308 (= e!627432 e!627431)))

(declare-fun lt!492181 () (_ BitVec 64))

(assert (=> b!1099308 (= lt!492181 (select (arr!34289 lt!492139) #b00000000000000000000000000000000))))

(declare-fun lt!492182 () Unit!36148)

(assert (=> b!1099308 (= lt!492182 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!492139 lt!492181 #b00000000000000000000000000000000))))

(assert (=> b!1099308 (arrayContainsKey!0 lt!492139 lt!492181 #b00000000000000000000000000000000)))

(declare-fun lt!492183 () Unit!36148)

(assert (=> b!1099308 (= lt!492183 lt!492182)))

(declare-fun res!733635 () Bool)

(assert (=> b!1099308 (= res!733635 (= (seekEntryOrOpen!0 (select (arr!34289 lt!492139) #b00000000000000000000000000000000) lt!492139 mask!1414) (Found!9910 #b00000000000000000000000000000000)))))

(assert (=> b!1099308 (=> (not res!733635) (not e!627431))))

(assert (= (and d!130489 (not res!733636)) b!1099307))

(assert (= (and b!1099307 c!108570) b!1099308))

(assert (= (and b!1099307 (not c!108570)) b!1099306))

(assert (= (and b!1099308 res!733635) b!1099305))

(assert (= (or b!1099305 b!1099306) bm!45953))

(declare-fun m!1019299 () Bool)

(assert (=> bm!45953 m!1019299))

(assert (=> b!1099307 m!1019283))

(assert (=> b!1099307 m!1019283))

(assert (=> b!1099307 m!1019285))

(assert (=> b!1099308 m!1019283))

(declare-fun m!1019301 () Bool)

(assert (=> b!1099308 m!1019301))

(declare-fun m!1019303 () Bool)

(assert (=> b!1099308 m!1019303))

(assert (=> b!1099308 m!1019283))

(declare-fun m!1019305 () Bool)

(assert (=> b!1099308 m!1019305))

(assert (=> b!1099224 d!130489))

(declare-fun d!130491 () Bool)

(declare-fun e!627436 () Bool)

(assert (=> d!130491 e!627436))

(declare-fun res!733641 () Bool)

(assert (=> d!130491 (=> (not res!733641) (not e!627436))))

(declare-fun lt!492195 () ListLongMap!15299)

(declare-fun contains!6390 (ListLongMap!15299 (_ BitVec 64)) Bool)

(assert (=> d!130491 (= res!733641 (contains!6390 lt!492195 (_1!8676 (tuple2!17331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun lt!492194 () List!23948)

(assert (=> d!130491 (= lt!492195 (ListLongMap!15300 lt!492194))))

(declare-fun lt!492192 () Unit!36148)

(declare-fun lt!492193 () Unit!36148)

(assert (=> d!130491 (= lt!492192 lt!492193)))

(declare-datatypes ((Option!673 0))(
  ( (Some!672 (v!16266 V!41347)) (None!671) )
))
(declare-fun getValueByKey!622 (List!23948 (_ BitVec 64)) Option!673)

(assert (=> d!130491 (= (getValueByKey!622 lt!492194 (_1!8676 (tuple2!17331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))) (Some!672 (_2!8676 (tuple2!17331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun lemmaContainsTupThenGetReturnValue!299 (List!23948 (_ BitVec 64) V!41347) Unit!36148)

(assert (=> d!130491 (= lt!492193 (lemmaContainsTupThenGetReturnValue!299 lt!492194 (_1!8676 (tuple2!17331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (_2!8676 (tuple2!17331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun insertStrictlySorted!392 (List!23948 (_ BitVec 64) V!41347) List!23948)

(assert (=> d!130491 (= lt!492194 (insertStrictlySorted!392 (toList!7665 lt!492137) (_1!8676 (tuple2!17331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (_2!8676 (tuple2!17331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(assert (=> d!130491 (= (+!3373 lt!492137 (tuple2!17331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) lt!492195)))

(declare-fun b!1099313 () Bool)

(declare-fun res!733642 () Bool)

(assert (=> b!1099313 (=> (not res!733642) (not e!627436))))

(assert (=> b!1099313 (= res!733642 (= (getValueByKey!622 (toList!7665 lt!492195) (_1!8676 (tuple2!17331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))) (Some!672 (_2!8676 (tuple2!17331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)))))))

(declare-fun b!1099314 () Bool)

(declare-fun contains!6391 (List!23948 tuple2!17330) Bool)

(assert (=> b!1099314 (= e!627436 (contains!6391 (toList!7665 lt!492195) (tuple2!17331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)))))

(assert (= (and d!130491 res!733641) b!1099313))

(assert (= (and b!1099313 res!733642) b!1099314))

(declare-fun m!1019307 () Bool)

(assert (=> d!130491 m!1019307))

(declare-fun m!1019309 () Bool)

(assert (=> d!130491 m!1019309))

(declare-fun m!1019311 () Bool)

(assert (=> d!130491 m!1019311))

(declare-fun m!1019313 () Bool)

(assert (=> d!130491 m!1019313))

(declare-fun m!1019315 () Bool)

(assert (=> b!1099313 m!1019315))

(declare-fun m!1019317 () Bool)

(assert (=> b!1099314 m!1019317))

(assert (=> b!1099219 d!130491))

(declare-fun d!130493 () Bool)

(assert (=> d!130493 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099218 d!130493))

(declare-fun d!130495 () Bool)

(declare-fun res!733647 () Bool)

(declare-fun e!627441 () Bool)

(assert (=> d!130495 (=> res!733647 e!627441)))

(assert (=> d!130495 (= res!733647 (= (select (arr!34289 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130495 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!627441)))

(declare-fun b!1099319 () Bool)

(declare-fun e!627442 () Bool)

(assert (=> b!1099319 (= e!627441 e!627442)))

(declare-fun res!733648 () Bool)

(assert (=> b!1099319 (=> (not res!733648) (not e!627442))))

(assert (=> b!1099319 (= res!733648 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34825 _keys!1070)))))

(declare-fun b!1099320 () Bool)

(assert (=> b!1099320 (= e!627442 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130495 (not res!733647)) b!1099319))

(assert (= (and b!1099319 res!733648) b!1099320))

(assert (=> d!130495 m!1019275))

(declare-fun m!1019319 () Bool)

(assert (=> b!1099320 m!1019319))

(assert (=> b!1099228 d!130495))

(declare-fun b!1099345 () Bool)

(declare-fun res!733658 () Bool)

(declare-fun e!627458 () Bool)

(assert (=> b!1099345 (=> (not res!733658) (not e!627458))))

(declare-fun lt!492211 () ListLongMap!15299)

(assert (=> b!1099345 (= res!733658 (not (contains!6390 lt!492211 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1099346 () Bool)

(declare-fun e!627460 () Bool)

(assert (=> b!1099346 (= e!627460 (validKeyInArray!0 (select (arr!34289 lt!492139) #b00000000000000000000000000000000)))))

(assert (=> b!1099346 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1099347 () Bool)

(declare-fun e!627463 () ListLongMap!15299)

(declare-fun call!45959 () ListLongMap!15299)

(assert (=> b!1099347 (= e!627463 call!45959)))

(declare-fun b!1099348 () Bool)

(declare-fun e!627461 () Bool)

(declare-fun e!627457 () Bool)

(assert (=> b!1099348 (= e!627461 e!627457)))

(assert (=> b!1099348 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34825 lt!492139)))))

(declare-fun res!733657 () Bool)

(assert (=> b!1099348 (= res!733657 (contains!6390 lt!492211 (select (arr!34289 lt!492139) #b00000000000000000000000000000000)))))

(assert (=> b!1099348 (=> (not res!733657) (not e!627457))))

(declare-fun b!1099349 () Bool)

(assert (=> b!1099349 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34825 lt!492139)))))

(assert (=> b!1099349 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34826 lt!492138)))))

(declare-fun apply!947 (ListLongMap!15299 (_ BitVec 64)) V!41347)

(declare-fun get!17631 (ValueCell!12873 V!41347) V!41347)

(assert (=> b!1099349 (= e!627457 (= (apply!947 lt!492211 (select (arr!34289 lt!492139) #b00000000000000000000000000000000)) (get!17631 (select (arr!34290 lt!492138) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1099350 () Bool)

(assert (=> b!1099350 (= e!627458 e!627461)))

(declare-fun c!108579 () Bool)

(assert (=> b!1099350 (= c!108579 e!627460)))

(declare-fun res!733660 () Bool)

(assert (=> b!1099350 (=> (not res!733660) (not e!627460))))

(assert (=> b!1099350 (= res!733660 (bvslt #b00000000000000000000000000000000 (size!34825 lt!492139)))))

(declare-fun b!1099351 () Bool)

(declare-fun lt!492214 () Unit!36148)

(declare-fun lt!492213 () Unit!36148)

(assert (=> b!1099351 (= lt!492214 lt!492213)))

(declare-fun lt!492215 () (_ BitVec 64))

(declare-fun lt!492212 () V!41347)

(declare-fun lt!492216 () ListLongMap!15299)

(declare-fun lt!492210 () (_ BitVec 64))

(assert (=> b!1099351 (not (contains!6390 (+!3373 lt!492216 (tuple2!17331 lt!492215 lt!492212)) lt!492210))))

(declare-fun addStillNotContains!275 (ListLongMap!15299 (_ BitVec 64) V!41347 (_ BitVec 64)) Unit!36148)

(assert (=> b!1099351 (= lt!492213 (addStillNotContains!275 lt!492216 lt!492215 lt!492212 lt!492210))))

(assert (=> b!1099351 (= lt!492210 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1099351 (= lt!492212 (get!17631 (select (arr!34290 lt!492138) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1099351 (= lt!492215 (select (arr!34289 lt!492139) #b00000000000000000000000000000000))))

(assert (=> b!1099351 (= lt!492216 call!45959)))

(assert (=> b!1099351 (= e!627463 (+!3373 call!45959 (tuple2!17331 (select (arr!34289 lt!492139) #b00000000000000000000000000000000) (get!17631 (select (arr!34290 lt!492138) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1099352 () Bool)

(declare-fun e!627459 () ListLongMap!15299)

(assert (=> b!1099352 (= e!627459 e!627463)))

(declare-fun c!108580 () Bool)

(assert (=> b!1099352 (= c!108580 (validKeyInArray!0 (select (arr!34289 lt!492139) #b00000000000000000000000000000000)))))

(declare-fun b!1099353 () Bool)

(assert (=> b!1099353 (= e!627459 (ListLongMap!15300 Nil!23945))))

(declare-fun d!130497 () Bool)

(assert (=> d!130497 e!627458))

(declare-fun res!733659 () Bool)

(assert (=> d!130497 (=> (not res!733659) (not e!627458))))

(assert (=> d!130497 (= res!733659 (not (contains!6390 lt!492211 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130497 (= lt!492211 e!627459)))

(declare-fun c!108582 () Bool)

(assert (=> d!130497 (= c!108582 (bvsge #b00000000000000000000000000000000 (size!34825 lt!492139)))))

(assert (=> d!130497 (validMask!0 mask!1414)))

(assert (=> d!130497 (= (getCurrentListMapNoExtraKeys!4175 lt!492139 lt!492138 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492211)))

(declare-fun bm!45956 () Bool)

(assert (=> bm!45956 (= call!45959 (getCurrentListMapNoExtraKeys!4175 lt!492139 lt!492138 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun e!627462 () Bool)

(declare-fun b!1099354 () Bool)

(assert (=> b!1099354 (= e!627462 (= lt!492211 (getCurrentListMapNoExtraKeys!4175 lt!492139 lt!492138 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1099355 () Bool)

(declare-fun isEmpty!965 (ListLongMap!15299) Bool)

(assert (=> b!1099355 (= e!627462 (isEmpty!965 lt!492211))))

(declare-fun b!1099356 () Bool)

(assert (=> b!1099356 (= e!627461 e!627462)))

(declare-fun c!108581 () Bool)

(assert (=> b!1099356 (= c!108581 (bvslt #b00000000000000000000000000000000 (size!34825 lt!492139)))))

(assert (= (and d!130497 c!108582) b!1099353))

(assert (= (and d!130497 (not c!108582)) b!1099352))

(assert (= (and b!1099352 c!108580) b!1099351))

(assert (= (and b!1099352 (not c!108580)) b!1099347))

(assert (= (or b!1099351 b!1099347) bm!45956))

(assert (= (and d!130497 res!733659) b!1099345))

(assert (= (and b!1099345 res!733658) b!1099350))

(assert (= (and b!1099350 res!733660) b!1099346))

(assert (= (and b!1099350 c!108579) b!1099348))

(assert (= (and b!1099350 (not c!108579)) b!1099356))

(assert (= (and b!1099348 res!733657) b!1099349))

(assert (= (and b!1099356 c!108581) b!1099354))

(assert (= (and b!1099356 (not c!108581)) b!1099355))

(declare-fun b_lambda!17899 () Bool)

(assert (=> (not b_lambda!17899) (not b!1099349)))

(assert (=> b!1099349 t!34108))

(declare-fun b_and!36957 () Bool)

(assert (= b_and!36951 (and (=> t!34108 result!16493) b_and!36957)))

(declare-fun b_lambda!17901 () Bool)

(assert (=> (not b_lambda!17901) (not b!1099351)))

(assert (=> b!1099351 t!34108))

(declare-fun b_and!36959 () Bool)

(assert (= b_and!36957 (and (=> t!34108 result!16493) b_and!36959)))

(declare-fun m!1019321 () Bool)

(assert (=> b!1099354 m!1019321))

(assert (=> b!1099348 m!1019283))

(assert (=> b!1099348 m!1019283))

(declare-fun m!1019323 () Bool)

(assert (=> b!1099348 m!1019323))

(assert (=> b!1099346 m!1019283))

(assert (=> b!1099346 m!1019283))

(assert (=> b!1099346 m!1019285))

(assert (=> b!1099349 m!1019197))

(assert (=> b!1099349 m!1019283))

(declare-fun m!1019325 () Bool)

(assert (=> b!1099349 m!1019325))

(assert (=> b!1099349 m!1019283))

(declare-fun m!1019327 () Bool)

(assert (=> b!1099349 m!1019327))

(assert (=> b!1099349 m!1019327))

(assert (=> b!1099349 m!1019197))

(declare-fun m!1019329 () Bool)

(assert (=> b!1099349 m!1019329))

(declare-fun m!1019331 () Bool)

(assert (=> b!1099345 m!1019331))

(assert (=> b!1099352 m!1019283))

(assert (=> b!1099352 m!1019283))

(assert (=> b!1099352 m!1019285))

(declare-fun m!1019333 () Bool)

(assert (=> b!1099355 m!1019333))

(assert (=> bm!45956 m!1019321))

(declare-fun m!1019335 () Bool)

(assert (=> b!1099351 m!1019335))

(declare-fun m!1019337 () Bool)

(assert (=> b!1099351 m!1019337))

(assert (=> b!1099351 m!1019283))

(assert (=> b!1099351 m!1019335))

(declare-fun m!1019339 () Bool)

(assert (=> b!1099351 m!1019339))

(assert (=> b!1099351 m!1019197))

(declare-fun m!1019341 () Bool)

(assert (=> b!1099351 m!1019341))

(assert (=> b!1099351 m!1019327))

(assert (=> b!1099351 m!1019327))

(assert (=> b!1099351 m!1019197))

(assert (=> b!1099351 m!1019329))

(declare-fun m!1019343 () Bool)

(assert (=> d!130497 m!1019343))

(assert (=> d!130497 m!1019217))

(assert (=> b!1099228 d!130497))

(declare-fun b!1099399 () Bool)

(declare-fun e!627490 () Unit!36148)

(declare-fun lt!492264 () Unit!36148)

(assert (=> b!1099399 (= e!627490 lt!492264)))

(declare-fun lt!492279 () ListLongMap!15299)

(assert (=> b!1099399 (= lt!492279 (getCurrentListMapNoExtraKeys!4175 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492271 () (_ BitVec 64))

(assert (=> b!1099399 (= lt!492271 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492282 () (_ BitVec 64))

(assert (=> b!1099399 (= lt!492282 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492272 () Unit!36148)

(declare-fun addStillContains!660 (ListLongMap!15299 (_ BitVec 64) V!41347 (_ BitVec 64)) Unit!36148)

(assert (=> b!1099399 (= lt!492272 (addStillContains!660 lt!492279 lt!492271 zeroValue!831 lt!492282))))

(assert (=> b!1099399 (contains!6390 (+!3373 lt!492279 (tuple2!17331 lt!492271 zeroValue!831)) lt!492282)))

(declare-fun lt!492267 () Unit!36148)

(assert (=> b!1099399 (= lt!492267 lt!492272)))

(declare-fun lt!492263 () ListLongMap!15299)

(assert (=> b!1099399 (= lt!492263 (getCurrentListMapNoExtraKeys!4175 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492269 () (_ BitVec 64))

(assert (=> b!1099399 (= lt!492269 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492268 () (_ BitVec 64))

(assert (=> b!1099399 (= lt!492268 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492280 () Unit!36148)

(declare-fun addApplyDifferent!520 (ListLongMap!15299 (_ BitVec 64) V!41347 (_ BitVec 64)) Unit!36148)

(assert (=> b!1099399 (= lt!492280 (addApplyDifferent!520 lt!492263 lt!492269 minValue!831 lt!492268))))

(assert (=> b!1099399 (= (apply!947 (+!3373 lt!492263 (tuple2!17331 lt!492269 minValue!831)) lt!492268) (apply!947 lt!492263 lt!492268))))

(declare-fun lt!492266 () Unit!36148)

(assert (=> b!1099399 (= lt!492266 lt!492280)))

(declare-fun lt!492281 () ListLongMap!15299)

(assert (=> b!1099399 (= lt!492281 (getCurrentListMapNoExtraKeys!4175 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492278 () (_ BitVec 64))

(assert (=> b!1099399 (= lt!492278 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492276 () (_ BitVec 64))

(assert (=> b!1099399 (= lt!492276 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492274 () Unit!36148)

(assert (=> b!1099399 (= lt!492274 (addApplyDifferent!520 lt!492281 lt!492278 zeroValue!831 lt!492276))))

(assert (=> b!1099399 (= (apply!947 (+!3373 lt!492281 (tuple2!17331 lt!492278 zeroValue!831)) lt!492276) (apply!947 lt!492281 lt!492276))))

(declare-fun lt!492261 () Unit!36148)

(assert (=> b!1099399 (= lt!492261 lt!492274)))

(declare-fun lt!492277 () ListLongMap!15299)

(assert (=> b!1099399 (= lt!492277 (getCurrentListMapNoExtraKeys!4175 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492275 () (_ BitVec 64))

(assert (=> b!1099399 (= lt!492275 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492270 () (_ BitVec 64))

(assert (=> b!1099399 (= lt!492270 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1099399 (= lt!492264 (addApplyDifferent!520 lt!492277 lt!492275 minValue!831 lt!492270))))

(assert (=> b!1099399 (= (apply!947 (+!3373 lt!492277 (tuple2!17331 lt!492275 minValue!831)) lt!492270) (apply!947 lt!492277 lt!492270))))

(declare-fun b!1099400 () Bool)

(declare-fun e!627492 () Bool)

(declare-fun e!627496 () Bool)

(assert (=> b!1099400 (= e!627492 e!627496)))

(declare-fun res!733681 () Bool)

(assert (=> b!1099400 (=> (not res!733681) (not e!627496))))

(declare-fun lt!492265 () ListLongMap!15299)

(assert (=> b!1099400 (= res!733681 (contains!6390 lt!492265 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099400 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34825 _keys!1070)))))

(declare-fun b!1099401 () Bool)

(declare-fun e!627493 () ListLongMap!15299)

(declare-fun call!45976 () ListLongMap!15299)

(assert (=> b!1099401 (= e!627493 (+!3373 call!45976 (tuple2!17331 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1099402 () Bool)

(declare-fun c!108599 () Bool)

(assert (=> b!1099402 (= c!108599 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!627494 () ListLongMap!15299)

(declare-fun e!627500 () ListLongMap!15299)

(assert (=> b!1099402 (= e!627494 e!627500)))

(declare-fun d!130499 () Bool)

(declare-fun e!627501 () Bool)

(assert (=> d!130499 e!627501))

(declare-fun res!733687 () Bool)

(assert (=> d!130499 (=> (not res!733687) (not e!627501))))

(assert (=> d!130499 (= res!733687 (or (bvsge #b00000000000000000000000000000000 (size!34825 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34825 _keys!1070)))))))

(declare-fun lt!492262 () ListLongMap!15299)

(assert (=> d!130499 (= lt!492265 lt!492262)))

(declare-fun lt!492273 () Unit!36148)

(assert (=> d!130499 (= lt!492273 e!627490)))

(declare-fun c!108598 () Bool)

(declare-fun e!627499 () Bool)

(assert (=> d!130499 (= c!108598 e!627499)))

(declare-fun res!733685 () Bool)

(assert (=> d!130499 (=> (not res!733685) (not e!627499))))

(assert (=> d!130499 (= res!733685 (bvslt #b00000000000000000000000000000000 (size!34825 _keys!1070)))))

(assert (=> d!130499 (= lt!492262 e!627493)))

(declare-fun c!108597 () Bool)

(assert (=> d!130499 (= c!108597 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130499 (validMask!0 mask!1414)))

(assert (=> d!130499 (= (getCurrentListMap!4379 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492265)))

(declare-fun b!1099403 () Bool)

(declare-fun e!627502 () Bool)

(assert (=> b!1099403 (= e!627502 (= (apply!947 lt!492265 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun bm!45971 () Bool)

(declare-fun call!45979 () Bool)

(assert (=> bm!45971 (= call!45979 (contains!6390 lt!492265 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099404 () Bool)

(declare-fun e!627491 () Bool)

(assert (=> b!1099404 (= e!627491 e!627502)))

(declare-fun res!733682 () Bool)

(assert (=> b!1099404 (= res!733682 call!45979)))

(assert (=> b!1099404 (=> (not res!733682) (not e!627502))))

(declare-fun b!1099405 () Bool)

(declare-fun e!627497 () Bool)

(declare-fun call!45978 () Bool)

(assert (=> b!1099405 (= e!627497 (not call!45978))))

(declare-fun b!1099406 () Bool)

(declare-fun call!45975 () ListLongMap!15299)

(assert (=> b!1099406 (= e!627500 call!45975)))

(declare-fun b!1099407 () Bool)

(declare-fun e!627495 () Bool)

(assert (=> b!1099407 (= e!627497 e!627495)))

(declare-fun res!733686 () Bool)

(assert (=> b!1099407 (= res!733686 call!45978)))

(assert (=> b!1099407 (=> (not res!733686) (not e!627495))))

(declare-fun b!1099408 () Bool)

(declare-fun res!733680 () Bool)

(assert (=> b!1099408 (=> (not res!733680) (not e!627501))))

(assert (=> b!1099408 (= res!733680 e!627491)))

(declare-fun c!108596 () Bool)

(assert (=> b!1099408 (= c!108596 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1099409 () Bool)

(assert (=> b!1099409 (= e!627495 (= (apply!947 lt!492265 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!45972 () Bool)

(assert (=> bm!45972 (= call!45978 (contains!6390 lt!492265 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45973 () Bool)

(declare-fun call!45977 () ListLongMap!15299)

(declare-fun call!45980 () ListLongMap!15299)

(assert (=> bm!45973 (= call!45977 call!45980)))

(declare-fun b!1099410 () Bool)

(assert (=> b!1099410 (= e!627491 (not call!45979))))

(declare-fun b!1099411 () Bool)

(assert (=> b!1099411 (= e!627499 (validKeyInArray!0 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun call!45974 () ListLongMap!15299)

(declare-fun c!108595 () Bool)

(declare-fun bm!45974 () Bool)

(assert (=> bm!45974 (= call!45976 (+!3373 (ite c!108597 call!45974 (ite c!108595 call!45980 call!45977)) (ite (or c!108597 c!108595) (tuple2!17331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17331 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun bm!45975 () Bool)

(assert (=> bm!45975 (= call!45974 (getCurrentListMapNoExtraKeys!4175 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099412 () Bool)

(assert (=> b!1099412 (= e!627493 e!627494)))

(assert (=> b!1099412 (= c!108595 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099413 () Bool)

(assert (=> b!1099413 (= e!627501 e!627497)))

(declare-fun c!108600 () Bool)

(assert (=> b!1099413 (= c!108600 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099414 () Bool)

(assert (=> b!1099414 (= e!627500 call!45977)))

(declare-fun b!1099415 () Bool)

(declare-fun Unit!36152 () Unit!36148)

(assert (=> b!1099415 (= e!627490 Unit!36152)))

(declare-fun b!1099416 () Bool)

(declare-fun res!733684 () Bool)

(assert (=> b!1099416 (=> (not res!733684) (not e!627501))))

(assert (=> b!1099416 (= res!733684 e!627492)))

(declare-fun res!733679 () Bool)

(assert (=> b!1099416 (=> res!733679 e!627492)))

(declare-fun e!627498 () Bool)

(assert (=> b!1099416 (= res!733679 (not e!627498))))

(declare-fun res!733683 () Bool)

(assert (=> b!1099416 (=> (not res!733683) (not e!627498))))

(assert (=> b!1099416 (= res!733683 (bvslt #b00000000000000000000000000000000 (size!34825 _keys!1070)))))

(declare-fun bm!45976 () Bool)

(assert (=> bm!45976 (= call!45980 call!45974)))

(declare-fun bm!45977 () Bool)

(assert (=> bm!45977 (= call!45975 call!45976)))

(declare-fun b!1099417 () Bool)

(assert (=> b!1099417 (= e!627496 (= (apply!947 lt!492265 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000)) (get!17631 (select (arr!34290 _values!874) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34826 _values!874)))))

(assert (=> b!1099417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34825 _keys!1070)))))

(declare-fun b!1099418 () Bool)

(assert (=> b!1099418 (= e!627494 call!45975)))

(declare-fun b!1099419 () Bool)

(assert (=> b!1099419 (= e!627498 (validKeyInArray!0 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130499 c!108597) b!1099401))

(assert (= (and d!130499 (not c!108597)) b!1099412))

(assert (= (and b!1099412 c!108595) b!1099418))

(assert (= (and b!1099412 (not c!108595)) b!1099402))

(assert (= (and b!1099402 c!108599) b!1099406))

(assert (= (and b!1099402 (not c!108599)) b!1099414))

(assert (= (or b!1099406 b!1099414) bm!45973))

(assert (= (or b!1099418 bm!45973) bm!45976))

(assert (= (or b!1099418 b!1099406) bm!45977))

(assert (= (or b!1099401 bm!45976) bm!45975))

(assert (= (or b!1099401 bm!45977) bm!45974))

(assert (= (and d!130499 res!733685) b!1099411))

(assert (= (and d!130499 c!108598) b!1099399))

(assert (= (and d!130499 (not c!108598)) b!1099415))

(assert (= (and d!130499 res!733687) b!1099416))

(assert (= (and b!1099416 res!733683) b!1099419))

(assert (= (and b!1099416 (not res!733679)) b!1099400))

(assert (= (and b!1099400 res!733681) b!1099417))

(assert (= (and b!1099416 res!733684) b!1099408))

(assert (= (and b!1099408 c!108596) b!1099404))

(assert (= (and b!1099408 (not c!108596)) b!1099410))

(assert (= (and b!1099404 res!733682) b!1099403))

(assert (= (or b!1099404 b!1099410) bm!45971))

(assert (= (and b!1099408 res!733680) b!1099413))

(assert (= (and b!1099413 c!108600) b!1099407))

(assert (= (and b!1099413 (not c!108600)) b!1099405))

(assert (= (and b!1099407 res!733686) b!1099409))

(assert (= (or b!1099407 b!1099405) bm!45972))

(declare-fun b_lambda!17903 () Bool)

(assert (=> (not b_lambda!17903) (not b!1099417)))

(assert (=> b!1099417 t!34108))

(declare-fun b_and!36961 () Bool)

(assert (= b_and!36959 (and (=> t!34108 result!16493) b_and!36961)))

(declare-fun m!1019345 () Bool)

(assert (=> b!1099399 m!1019345))

(assert (=> b!1099399 m!1019345))

(declare-fun m!1019347 () Bool)

(assert (=> b!1099399 m!1019347))

(assert (=> b!1099399 m!1019211))

(declare-fun m!1019349 () Bool)

(assert (=> b!1099399 m!1019349))

(declare-fun m!1019351 () Bool)

(assert (=> b!1099399 m!1019351))

(declare-fun m!1019353 () Bool)

(assert (=> b!1099399 m!1019353))

(declare-fun m!1019355 () Bool)

(assert (=> b!1099399 m!1019355))

(declare-fun m!1019357 () Bool)

(assert (=> b!1099399 m!1019357))

(declare-fun m!1019359 () Bool)

(assert (=> b!1099399 m!1019359))

(assert (=> b!1099399 m!1019275))

(declare-fun m!1019361 () Bool)

(assert (=> b!1099399 m!1019361))

(declare-fun m!1019363 () Bool)

(assert (=> b!1099399 m!1019363))

(declare-fun m!1019365 () Bool)

(assert (=> b!1099399 m!1019365))

(assert (=> b!1099399 m!1019357))

(declare-fun m!1019367 () Bool)

(assert (=> b!1099399 m!1019367))

(declare-fun m!1019369 () Bool)

(assert (=> b!1099399 m!1019369))

(declare-fun m!1019371 () Bool)

(assert (=> b!1099399 m!1019371))

(assert (=> b!1099399 m!1019361))

(assert (=> b!1099399 m!1019367))

(declare-fun m!1019373 () Bool)

(assert (=> b!1099399 m!1019373))

(assert (=> b!1099400 m!1019275))

(assert (=> b!1099400 m!1019275))

(declare-fun m!1019375 () Bool)

(assert (=> b!1099400 m!1019375))

(declare-fun m!1019377 () Bool)

(assert (=> bm!45974 m!1019377))

(assert (=> d!130499 m!1019217))

(assert (=> b!1099419 m!1019275))

(assert (=> b!1099419 m!1019275))

(assert (=> b!1099419 m!1019277))

(assert (=> b!1099411 m!1019275))

(assert (=> b!1099411 m!1019275))

(assert (=> b!1099411 m!1019277))

(declare-fun m!1019379 () Bool)

(assert (=> b!1099401 m!1019379))

(declare-fun m!1019381 () Bool)

(assert (=> b!1099409 m!1019381))

(assert (=> b!1099417 m!1019197))

(assert (=> b!1099417 m!1019275))

(assert (=> b!1099417 m!1019275))

(declare-fun m!1019383 () Bool)

(assert (=> b!1099417 m!1019383))

(declare-fun m!1019385 () Bool)

(assert (=> b!1099417 m!1019385))

(assert (=> b!1099417 m!1019385))

(assert (=> b!1099417 m!1019197))

(declare-fun m!1019387 () Bool)

(assert (=> b!1099417 m!1019387))

(declare-fun m!1019389 () Bool)

(assert (=> bm!45972 m!1019389))

(declare-fun m!1019391 () Bool)

(assert (=> b!1099403 m!1019391))

(declare-fun m!1019393 () Bool)

(assert (=> bm!45971 m!1019393))

(assert (=> bm!45975 m!1019211))

(assert (=> b!1099228 d!130499))

(declare-fun b!1099426 () Bool)

(declare-fun e!627508 () Bool)

(declare-fun e!627507 () Bool)

(assert (=> b!1099426 (= e!627508 e!627507)))

(declare-fun c!108603 () Bool)

(assert (=> b!1099426 (= c!108603 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun bm!45982 () Bool)

(declare-fun call!45985 () ListLongMap!15299)

(assert (=> bm!45982 (= call!45985 (getCurrentListMapNoExtraKeys!4175 (array!71244 (store (arr!34289 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34825 _keys!1070)) (array!71246 (store (arr!34290 _values!874) i!650 (ValueCellFull!12873 (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34826 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099427 () Bool)

(declare-fun call!45986 () ListLongMap!15299)

(assert (=> b!1099427 (= e!627507 (= call!45985 (-!954 call!45986 k0!904)))))

(assert (=> b!1099427 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34826 _values!874)))))

(declare-fun d!130501 () Bool)

(assert (=> d!130501 e!627508))

(declare-fun res!733690 () Bool)

(assert (=> d!130501 (=> (not res!733690) (not e!627508))))

(assert (=> d!130501 (= res!733690 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34825 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34825 _keys!1070))))))))

(declare-fun lt!492285 () Unit!36148)

(declare-fun choose!1766 (array!71243 array!71245 (_ BitVec 32) (_ BitVec 32) V!41347 V!41347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36148)

(assert (=> d!130501 (= lt!492285 (choose!1766 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130501 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34825 _keys!1070)))))

(assert (=> d!130501 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!205 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!492285)))

(declare-fun bm!45983 () Bool)

(assert (=> bm!45983 (= call!45986 (getCurrentListMapNoExtraKeys!4175 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099428 () Bool)

(assert (=> b!1099428 (= e!627507 (= call!45985 call!45986))))

(assert (=> b!1099428 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34826 _values!874)))))

(assert (= (and d!130501 res!733690) b!1099426))

(assert (= (and b!1099426 c!108603) b!1099427))

(assert (= (and b!1099426 (not c!108603)) b!1099428))

(assert (= (or b!1099427 b!1099428) bm!45983))

(assert (= (or b!1099427 b!1099428) bm!45982))

(declare-fun b_lambda!17905 () Bool)

(assert (=> (not b_lambda!17905) (not bm!45982)))

(assert (=> bm!45982 t!34108))

(declare-fun b_and!36963 () Bool)

(assert (= b_and!36961 (and (=> t!34108 result!16493) b_and!36963)))

(assert (=> bm!45982 m!1019191))

(assert (=> bm!45982 m!1019197))

(assert (=> bm!45982 m!1019201))

(declare-fun m!1019395 () Bool)

(assert (=> bm!45982 m!1019395))

(declare-fun m!1019397 () Bool)

(assert (=> b!1099427 m!1019397))

(declare-fun m!1019399 () Bool)

(assert (=> d!130501 m!1019399))

(assert (=> bm!45983 m!1019211))

(assert (=> b!1099228 d!130501))

(declare-fun d!130503 () Bool)

(declare-fun lt!492288 () ListLongMap!15299)

(assert (=> d!130503 (not (contains!6390 lt!492288 k0!904))))

(declare-fun removeStrictlySorted!81 (List!23948 (_ BitVec 64)) List!23948)

(assert (=> d!130503 (= lt!492288 (ListLongMap!15300 (removeStrictlySorted!81 (toList!7665 lt!492144) k0!904)))))

(assert (=> d!130503 (= (-!954 lt!492144 k0!904) lt!492288)))

(declare-fun bs!32288 () Bool)

(assert (= bs!32288 d!130503))

(declare-fun m!1019401 () Bool)

(assert (=> bs!32288 m!1019401))

(declare-fun m!1019403 () Bool)

(assert (=> bs!32288 m!1019403))

(assert (=> b!1099228 d!130503))

(declare-fun b!1099429 () Bool)

(declare-fun e!627509 () Unit!36148)

(declare-fun lt!492292 () Unit!36148)

(assert (=> b!1099429 (= e!627509 lt!492292)))

(declare-fun lt!492307 () ListLongMap!15299)

(assert (=> b!1099429 (= lt!492307 (getCurrentListMapNoExtraKeys!4175 lt!492139 lt!492138 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492299 () (_ BitVec 64))

(assert (=> b!1099429 (= lt!492299 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492310 () (_ BitVec 64))

(assert (=> b!1099429 (= lt!492310 (select (arr!34289 lt!492139) #b00000000000000000000000000000000))))

(declare-fun lt!492300 () Unit!36148)

(assert (=> b!1099429 (= lt!492300 (addStillContains!660 lt!492307 lt!492299 zeroValue!831 lt!492310))))

(assert (=> b!1099429 (contains!6390 (+!3373 lt!492307 (tuple2!17331 lt!492299 zeroValue!831)) lt!492310)))

(declare-fun lt!492295 () Unit!36148)

(assert (=> b!1099429 (= lt!492295 lt!492300)))

(declare-fun lt!492291 () ListLongMap!15299)

(assert (=> b!1099429 (= lt!492291 (getCurrentListMapNoExtraKeys!4175 lt!492139 lt!492138 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492297 () (_ BitVec 64))

(assert (=> b!1099429 (= lt!492297 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492296 () (_ BitVec 64))

(assert (=> b!1099429 (= lt!492296 (select (arr!34289 lt!492139) #b00000000000000000000000000000000))))

(declare-fun lt!492308 () Unit!36148)

(assert (=> b!1099429 (= lt!492308 (addApplyDifferent!520 lt!492291 lt!492297 minValue!831 lt!492296))))

(assert (=> b!1099429 (= (apply!947 (+!3373 lt!492291 (tuple2!17331 lt!492297 minValue!831)) lt!492296) (apply!947 lt!492291 lt!492296))))

(declare-fun lt!492294 () Unit!36148)

(assert (=> b!1099429 (= lt!492294 lt!492308)))

(declare-fun lt!492309 () ListLongMap!15299)

(assert (=> b!1099429 (= lt!492309 (getCurrentListMapNoExtraKeys!4175 lt!492139 lt!492138 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492306 () (_ BitVec 64))

(assert (=> b!1099429 (= lt!492306 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492304 () (_ BitVec 64))

(assert (=> b!1099429 (= lt!492304 (select (arr!34289 lt!492139) #b00000000000000000000000000000000))))

(declare-fun lt!492302 () Unit!36148)

(assert (=> b!1099429 (= lt!492302 (addApplyDifferent!520 lt!492309 lt!492306 zeroValue!831 lt!492304))))

(assert (=> b!1099429 (= (apply!947 (+!3373 lt!492309 (tuple2!17331 lt!492306 zeroValue!831)) lt!492304) (apply!947 lt!492309 lt!492304))))

(declare-fun lt!492289 () Unit!36148)

(assert (=> b!1099429 (= lt!492289 lt!492302)))

(declare-fun lt!492305 () ListLongMap!15299)

(assert (=> b!1099429 (= lt!492305 (getCurrentListMapNoExtraKeys!4175 lt!492139 lt!492138 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492303 () (_ BitVec 64))

(assert (=> b!1099429 (= lt!492303 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492298 () (_ BitVec 64))

(assert (=> b!1099429 (= lt!492298 (select (arr!34289 lt!492139) #b00000000000000000000000000000000))))

(assert (=> b!1099429 (= lt!492292 (addApplyDifferent!520 lt!492305 lt!492303 minValue!831 lt!492298))))

(assert (=> b!1099429 (= (apply!947 (+!3373 lt!492305 (tuple2!17331 lt!492303 minValue!831)) lt!492298) (apply!947 lt!492305 lt!492298))))

(declare-fun b!1099430 () Bool)

(declare-fun e!627511 () Bool)

(declare-fun e!627515 () Bool)

(assert (=> b!1099430 (= e!627511 e!627515)))

(declare-fun res!733693 () Bool)

(assert (=> b!1099430 (=> (not res!733693) (not e!627515))))

(declare-fun lt!492293 () ListLongMap!15299)

(assert (=> b!1099430 (= res!733693 (contains!6390 lt!492293 (select (arr!34289 lt!492139) #b00000000000000000000000000000000)))))

(assert (=> b!1099430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34825 lt!492139)))))

(declare-fun b!1099431 () Bool)

(declare-fun e!627512 () ListLongMap!15299)

(declare-fun call!45989 () ListLongMap!15299)

(assert (=> b!1099431 (= e!627512 (+!3373 call!45989 (tuple2!17331 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1099432 () Bool)

(declare-fun c!108608 () Bool)

(assert (=> b!1099432 (= c!108608 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!627513 () ListLongMap!15299)

(declare-fun e!627519 () ListLongMap!15299)

(assert (=> b!1099432 (= e!627513 e!627519)))

(declare-fun d!130505 () Bool)

(declare-fun e!627520 () Bool)

(assert (=> d!130505 e!627520))

(declare-fun res!733699 () Bool)

(assert (=> d!130505 (=> (not res!733699) (not e!627520))))

(assert (=> d!130505 (= res!733699 (or (bvsge #b00000000000000000000000000000000 (size!34825 lt!492139)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34825 lt!492139)))))))

(declare-fun lt!492290 () ListLongMap!15299)

(assert (=> d!130505 (= lt!492293 lt!492290)))

(declare-fun lt!492301 () Unit!36148)

(assert (=> d!130505 (= lt!492301 e!627509)))

(declare-fun c!108607 () Bool)

(declare-fun e!627518 () Bool)

(assert (=> d!130505 (= c!108607 e!627518)))

(declare-fun res!733697 () Bool)

(assert (=> d!130505 (=> (not res!733697) (not e!627518))))

(assert (=> d!130505 (= res!733697 (bvslt #b00000000000000000000000000000000 (size!34825 lt!492139)))))

(assert (=> d!130505 (= lt!492290 e!627512)))

(declare-fun c!108606 () Bool)

(assert (=> d!130505 (= c!108606 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130505 (validMask!0 mask!1414)))

(assert (=> d!130505 (= (getCurrentListMap!4379 lt!492139 lt!492138 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492293)))

(declare-fun b!1099433 () Bool)

(declare-fun e!627521 () Bool)

(assert (=> b!1099433 (= e!627521 (= (apply!947 lt!492293 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun bm!45984 () Bool)

(declare-fun call!45992 () Bool)

(assert (=> bm!45984 (= call!45992 (contains!6390 lt!492293 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099434 () Bool)

(declare-fun e!627510 () Bool)

(assert (=> b!1099434 (= e!627510 e!627521)))

(declare-fun res!733694 () Bool)

(assert (=> b!1099434 (= res!733694 call!45992)))

(assert (=> b!1099434 (=> (not res!733694) (not e!627521))))

(declare-fun b!1099435 () Bool)

(declare-fun e!627516 () Bool)

(declare-fun call!45991 () Bool)

(assert (=> b!1099435 (= e!627516 (not call!45991))))

(declare-fun b!1099436 () Bool)

(declare-fun call!45988 () ListLongMap!15299)

(assert (=> b!1099436 (= e!627519 call!45988)))

(declare-fun b!1099437 () Bool)

(declare-fun e!627514 () Bool)

(assert (=> b!1099437 (= e!627516 e!627514)))

(declare-fun res!733698 () Bool)

(assert (=> b!1099437 (= res!733698 call!45991)))

(assert (=> b!1099437 (=> (not res!733698) (not e!627514))))

(declare-fun b!1099438 () Bool)

(declare-fun res!733692 () Bool)

(assert (=> b!1099438 (=> (not res!733692) (not e!627520))))

(assert (=> b!1099438 (= res!733692 e!627510)))

(declare-fun c!108605 () Bool)

(assert (=> b!1099438 (= c!108605 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1099439 () Bool)

(assert (=> b!1099439 (= e!627514 (= (apply!947 lt!492293 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!45985 () Bool)

(assert (=> bm!45985 (= call!45991 (contains!6390 lt!492293 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45986 () Bool)

(declare-fun call!45990 () ListLongMap!15299)

(declare-fun call!45993 () ListLongMap!15299)

(assert (=> bm!45986 (= call!45990 call!45993)))

(declare-fun b!1099440 () Bool)

(assert (=> b!1099440 (= e!627510 (not call!45992))))

(declare-fun b!1099441 () Bool)

(assert (=> b!1099441 (= e!627518 (validKeyInArray!0 (select (arr!34289 lt!492139) #b00000000000000000000000000000000)))))

(declare-fun c!108604 () Bool)

(declare-fun bm!45987 () Bool)

(declare-fun call!45987 () ListLongMap!15299)

(assert (=> bm!45987 (= call!45989 (+!3373 (ite c!108606 call!45987 (ite c!108604 call!45993 call!45990)) (ite (or c!108606 c!108604) (tuple2!17331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17331 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun bm!45988 () Bool)

(assert (=> bm!45988 (= call!45987 (getCurrentListMapNoExtraKeys!4175 lt!492139 lt!492138 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099442 () Bool)

(assert (=> b!1099442 (= e!627512 e!627513)))

(assert (=> b!1099442 (= c!108604 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099443 () Bool)

(assert (=> b!1099443 (= e!627520 e!627516)))

(declare-fun c!108609 () Bool)

(assert (=> b!1099443 (= c!108609 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099444 () Bool)

(assert (=> b!1099444 (= e!627519 call!45990)))

(declare-fun b!1099445 () Bool)

(declare-fun Unit!36153 () Unit!36148)

(assert (=> b!1099445 (= e!627509 Unit!36153)))

(declare-fun b!1099446 () Bool)

(declare-fun res!733696 () Bool)

(assert (=> b!1099446 (=> (not res!733696) (not e!627520))))

(assert (=> b!1099446 (= res!733696 e!627511)))

(declare-fun res!733691 () Bool)

(assert (=> b!1099446 (=> res!733691 e!627511)))

(declare-fun e!627517 () Bool)

(assert (=> b!1099446 (= res!733691 (not e!627517))))

(declare-fun res!733695 () Bool)

(assert (=> b!1099446 (=> (not res!733695) (not e!627517))))

(assert (=> b!1099446 (= res!733695 (bvslt #b00000000000000000000000000000000 (size!34825 lt!492139)))))

(declare-fun bm!45989 () Bool)

(assert (=> bm!45989 (= call!45993 call!45987)))

(declare-fun bm!45990 () Bool)

(assert (=> bm!45990 (= call!45988 call!45989)))

(declare-fun b!1099447 () Bool)

(assert (=> b!1099447 (= e!627515 (= (apply!947 lt!492293 (select (arr!34289 lt!492139) #b00000000000000000000000000000000)) (get!17631 (select (arr!34290 lt!492138) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099447 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34826 lt!492138)))))

(assert (=> b!1099447 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34825 lt!492139)))))

(declare-fun b!1099448 () Bool)

(assert (=> b!1099448 (= e!627513 call!45988)))

(declare-fun b!1099449 () Bool)

(assert (=> b!1099449 (= e!627517 (validKeyInArray!0 (select (arr!34289 lt!492139) #b00000000000000000000000000000000)))))

(assert (= (and d!130505 c!108606) b!1099431))

(assert (= (and d!130505 (not c!108606)) b!1099442))

(assert (= (and b!1099442 c!108604) b!1099448))

(assert (= (and b!1099442 (not c!108604)) b!1099432))

(assert (= (and b!1099432 c!108608) b!1099436))

(assert (= (and b!1099432 (not c!108608)) b!1099444))

(assert (= (or b!1099436 b!1099444) bm!45986))

(assert (= (or b!1099448 bm!45986) bm!45989))

(assert (= (or b!1099448 b!1099436) bm!45990))

(assert (= (or b!1099431 bm!45989) bm!45988))

(assert (= (or b!1099431 bm!45990) bm!45987))

(assert (= (and d!130505 res!733697) b!1099441))

(assert (= (and d!130505 c!108607) b!1099429))

(assert (= (and d!130505 (not c!108607)) b!1099445))

(assert (= (and d!130505 res!733699) b!1099446))

(assert (= (and b!1099446 res!733695) b!1099449))

(assert (= (and b!1099446 (not res!733691)) b!1099430))

(assert (= (and b!1099430 res!733693) b!1099447))

(assert (= (and b!1099446 res!733696) b!1099438))

(assert (= (and b!1099438 c!108605) b!1099434))

(assert (= (and b!1099438 (not c!108605)) b!1099440))

(assert (= (and b!1099434 res!733694) b!1099433))

(assert (= (or b!1099434 b!1099440) bm!45984))

(assert (= (and b!1099438 res!733692) b!1099443))

(assert (= (and b!1099443 c!108609) b!1099437))

(assert (= (and b!1099443 (not c!108609)) b!1099435))

(assert (= (and b!1099437 res!733698) b!1099439))

(assert (= (or b!1099437 b!1099435) bm!45985))

(declare-fun b_lambda!17907 () Bool)

(assert (=> (not b_lambda!17907) (not b!1099447)))

(assert (=> b!1099447 t!34108))

(declare-fun b_and!36965 () Bool)

(assert (= b_and!36963 (and (=> t!34108 result!16493) b_and!36965)))

(declare-fun m!1019405 () Bool)

(assert (=> b!1099429 m!1019405))

(assert (=> b!1099429 m!1019405))

(declare-fun m!1019407 () Bool)

(assert (=> b!1099429 m!1019407))

(assert (=> b!1099429 m!1019205))

(declare-fun m!1019409 () Bool)

(assert (=> b!1099429 m!1019409))

(declare-fun m!1019411 () Bool)

(assert (=> b!1099429 m!1019411))

(declare-fun m!1019413 () Bool)

(assert (=> b!1099429 m!1019413))

(declare-fun m!1019415 () Bool)

(assert (=> b!1099429 m!1019415))

(declare-fun m!1019417 () Bool)

(assert (=> b!1099429 m!1019417))

(declare-fun m!1019419 () Bool)

(assert (=> b!1099429 m!1019419))

(assert (=> b!1099429 m!1019283))

(declare-fun m!1019421 () Bool)

(assert (=> b!1099429 m!1019421))

(declare-fun m!1019423 () Bool)

(assert (=> b!1099429 m!1019423))

(declare-fun m!1019425 () Bool)

(assert (=> b!1099429 m!1019425))

(assert (=> b!1099429 m!1019417))

(declare-fun m!1019427 () Bool)

(assert (=> b!1099429 m!1019427))

(declare-fun m!1019429 () Bool)

(assert (=> b!1099429 m!1019429))

(declare-fun m!1019431 () Bool)

(assert (=> b!1099429 m!1019431))

(assert (=> b!1099429 m!1019421))

(assert (=> b!1099429 m!1019427))

(declare-fun m!1019433 () Bool)

(assert (=> b!1099429 m!1019433))

(assert (=> b!1099430 m!1019283))

(assert (=> b!1099430 m!1019283))

(declare-fun m!1019435 () Bool)

(assert (=> b!1099430 m!1019435))

(declare-fun m!1019437 () Bool)

(assert (=> bm!45987 m!1019437))

(assert (=> d!130505 m!1019217))

(assert (=> b!1099449 m!1019283))

(assert (=> b!1099449 m!1019283))

(assert (=> b!1099449 m!1019285))

(assert (=> b!1099441 m!1019283))

(assert (=> b!1099441 m!1019283))

(assert (=> b!1099441 m!1019285))

(declare-fun m!1019439 () Bool)

(assert (=> b!1099431 m!1019439))

(declare-fun m!1019441 () Bool)

(assert (=> b!1099439 m!1019441))

(assert (=> b!1099447 m!1019197))

(assert (=> b!1099447 m!1019283))

(assert (=> b!1099447 m!1019283))

(declare-fun m!1019443 () Bool)

(assert (=> b!1099447 m!1019443))

(assert (=> b!1099447 m!1019327))

(assert (=> b!1099447 m!1019327))

(assert (=> b!1099447 m!1019197))

(assert (=> b!1099447 m!1019329))

(declare-fun m!1019445 () Bool)

(assert (=> bm!45985 m!1019445))

(declare-fun m!1019447 () Bool)

(assert (=> b!1099433 m!1019447))

(declare-fun m!1019449 () Bool)

(assert (=> bm!45984 m!1019449))

(assert (=> bm!45988 m!1019205))

(assert (=> b!1099228 d!130505))

(declare-fun b!1099450 () Bool)

(declare-fun res!733701 () Bool)

(declare-fun e!627523 () Bool)

(assert (=> b!1099450 (=> (not res!733701) (not e!627523))))

(declare-fun lt!492312 () ListLongMap!15299)

(assert (=> b!1099450 (= res!733701 (not (contains!6390 lt!492312 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1099451 () Bool)

(declare-fun e!627525 () Bool)

(assert (=> b!1099451 (= e!627525 (validKeyInArray!0 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099451 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1099452 () Bool)

(declare-fun e!627528 () ListLongMap!15299)

(declare-fun call!45994 () ListLongMap!15299)

(assert (=> b!1099452 (= e!627528 call!45994)))

(declare-fun b!1099453 () Bool)

(declare-fun e!627526 () Bool)

(declare-fun e!627522 () Bool)

(assert (=> b!1099453 (= e!627526 e!627522)))

(assert (=> b!1099453 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34825 _keys!1070)))))

(declare-fun res!733700 () Bool)

(assert (=> b!1099453 (= res!733700 (contains!6390 lt!492312 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099453 (=> (not res!733700) (not e!627522))))

(declare-fun b!1099454 () Bool)

(assert (=> b!1099454 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34825 _keys!1070)))))

(assert (=> b!1099454 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34826 _values!874)))))

(assert (=> b!1099454 (= e!627522 (= (apply!947 lt!492312 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000)) (get!17631 (select (arr!34290 _values!874) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1099455 () Bool)

(assert (=> b!1099455 (= e!627523 e!627526)))

(declare-fun c!108610 () Bool)

(assert (=> b!1099455 (= c!108610 e!627525)))

(declare-fun res!733703 () Bool)

(assert (=> b!1099455 (=> (not res!733703) (not e!627525))))

(assert (=> b!1099455 (= res!733703 (bvslt #b00000000000000000000000000000000 (size!34825 _keys!1070)))))

(declare-fun b!1099456 () Bool)

(declare-fun lt!492315 () Unit!36148)

(declare-fun lt!492314 () Unit!36148)

(assert (=> b!1099456 (= lt!492315 lt!492314)))

(declare-fun lt!492316 () (_ BitVec 64))

(declare-fun lt!492311 () (_ BitVec 64))

(declare-fun lt!492313 () V!41347)

(declare-fun lt!492317 () ListLongMap!15299)

(assert (=> b!1099456 (not (contains!6390 (+!3373 lt!492317 (tuple2!17331 lt!492316 lt!492313)) lt!492311))))

(assert (=> b!1099456 (= lt!492314 (addStillNotContains!275 lt!492317 lt!492316 lt!492313 lt!492311))))

(assert (=> b!1099456 (= lt!492311 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1099456 (= lt!492313 (get!17631 (select (arr!34290 _values!874) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1099456 (= lt!492316 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1099456 (= lt!492317 call!45994)))

(assert (=> b!1099456 (= e!627528 (+!3373 call!45994 (tuple2!17331 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000) (get!17631 (select (arr!34290 _values!874) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1099457 () Bool)

(declare-fun e!627524 () ListLongMap!15299)

(assert (=> b!1099457 (= e!627524 e!627528)))

(declare-fun c!108611 () Bool)

(assert (=> b!1099457 (= c!108611 (validKeyInArray!0 (select (arr!34289 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099458 () Bool)

(assert (=> b!1099458 (= e!627524 (ListLongMap!15300 Nil!23945))))

(declare-fun d!130507 () Bool)

(assert (=> d!130507 e!627523))

(declare-fun res!733702 () Bool)

(assert (=> d!130507 (=> (not res!733702) (not e!627523))))

(assert (=> d!130507 (= res!733702 (not (contains!6390 lt!492312 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130507 (= lt!492312 e!627524)))

(declare-fun c!108613 () Bool)

(assert (=> d!130507 (= c!108613 (bvsge #b00000000000000000000000000000000 (size!34825 _keys!1070)))))

(assert (=> d!130507 (validMask!0 mask!1414)))

(assert (=> d!130507 (= (getCurrentListMapNoExtraKeys!4175 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492312)))

(declare-fun bm!45991 () Bool)

(assert (=> bm!45991 (= call!45994 (getCurrentListMapNoExtraKeys!4175 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1099459 () Bool)

(declare-fun e!627527 () Bool)

(assert (=> b!1099459 (= e!627527 (= lt!492312 (getCurrentListMapNoExtraKeys!4175 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1099460 () Bool)

(assert (=> b!1099460 (= e!627527 (isEmpty!965 lt!492312))))

(declare-fun b!1099461 () Bool)

(assert (=> b!1099461 (= e!627526 e!627527)))

(declare-fun c!108612 () Bool)

(assert (=> b!1099461 (= c!108612 (bvslt #b00000000000000000000000000000000 (size!34825 _keys!1070)))))

(assert (= (and d!130507 c!108613) b!1099458))

(assert (= (and d!130507 (not c!108613)) b!1099457))

(assert (= (and b!1099457 c!108611) b!1099456))

(assert (= (and b!1099457 (not c!108611)) b!1099452))

(assert (= (or b!1099456 b!1099452) bm!45991))

(assert (= (and d!130507 res!733702) b!1099450))

(assert (= (and b!1099450 res!733701) b!1099455))

(assert (= (and b!1099455 res!733703) b!1099451))

(assert (= (and b!1099455 c!108610) b!1099453))

(assert (= (and b!1099455 (not c!108610)) b!1099461))

(assert (= (and b!1099453 res!733700) b!1099454))

(assert (= (and b!1099461 c!108612) b!1099459))

(assert (= (and b!1099461 (not c!108612)) b!1099460))

(declare-fun b_lambda!17909 () Bool)

(assert (=> (not b_lambda!17909) (not b!1099454)))

(assert (=> b!1099454 t!34108))

(declare-fun b_and!36967 () Bool)

(assert (= b_and!36965 (and (=> t!34108 result!16493) b_and!36967)))

(declare-fun b_lambda!17911 () Bool)

(assert (=> (not b_lambda!17911) (not b!1099456)))

(assert (=> b!1099456 t!34108))

(declare-fun b_and!36969 () Bool)

(assert (= b_and!36967 (and (=> t!34108 result!16493) b_and!36969)))

(declare-fun m!1019451 () Bool)

(assert (=> b!1099459 m!1019451))

(assert (=> b!1099453 m!1019275))

(assert (=> b!1099453 m!1019275))

(declare-fun m!1019453 () Bool)

(assert (=> b!1099453 m!1019453))

(assert (=> b!1099451 m!1019275))

(assert (=> b!1099451 m!1019275))

(assert (=> b!1099451 m!1019277))

(assert (=> b!1099454 m!1019197))

(assert (=> b!1099454 m!1019275))

(declare-fun m!1019455 () Bool)

(assert (=> b!1099454 m!1019455))

(assert (=> b!1099454 m!1019275))

(assert (=> b!1099454 m!1019385))

(assert (=> b!1099454 m!1019385))

(assert (=> b!1099454 m!1019197))

(assert (=> b!1099454 m!1019387))

(declare-fun m!1019457 () Bool)

(assert (=> b!1099450 m!1019457))

(assert (=> b!1099457 m!1019275))

(assert (=> b!1099457 m!1019275))

(assert (=> b!1099457 m!1019277))

(declare-fun m!1019459 () Bool)

(assert (=> b!1099460 m!1019459))

(assert (=> bm!45991 m!1019451))

(declare-fun m!1019461 () Bool)

(assert (=> b!1099456 m!1019461))

(declare-fun m!1019463 () Bool)

(assert (=> b!1099456 m!1019463))

(assert (=> b!1099456 m!1019275))

(assert (=> b!1099456 m!1019461))

(declare-fun m!1019465 () Bool)

(assert (=> b!1099456 m!1019465))

(assert (=> b!1099456 m!1019197))

(declare-fun m!1019467 () Bool)

(assert (=> b!1099456 m!1019467))

(assert (=> b!1099456 m!1019385))

(assert (=> b!1099456 m!1019385))

(assert (=> b!1099456 m!1019197))

(assert (=> b!1099456 m!1019387))

(declare-fun m!1019469 () Bool)

(assert (=> d!130507 m!1019469))

(assert (=> d!130507 m!1019217))

(assert (=> b!1099228 d!130507))

(declare-fun d!130509 () Bool)

(assert (=> d!130509 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492320 () Unit!36148)

(declare-fun choose!13 (array!71243 (_ BitVec 64) (_ BitVec 32)) Unit!36148)

(assert (=> d!130509 (= lt!492320 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130509 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130509 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!492320)))

(declare-fun bs!32289 () Bool)

(assert (= bs!32289 d!130509))

(assert (=> bs!32289 m!1019207))

(declare-fun m!1019471 () Bool)

(assert (=> bs!32289 m!1019471))

(assert (=> b!1099228 d!130509))

(declare-fun mapIsEmpty!42526 () Bool)

(declare-fun mapRes!42526 () Bool)

(assert (=> mapIsEmpty!42526 mapRes!42526))

(declare-fun condMapEmpty!42526 () Bool)

(declare-fun mapDefault!42526 () ValueCell!12873)

(assert (=> mapNonEmpty!42520 (= condMapEmpty!42526 (= mapRest!42520 ((as const (Array (_ BitVec 32) ValueCell!12873)) mapDefault!42526)))))

(declare-fun e!627533 () Bool)

(assert (=> mapNonEmpty!42520 (= tp!81283 (and e!627533 mapRes!42526))))

(declare-fun b!1099469 () Bool)

(assert (=> b!1099469 (= e!627533 tp_is_empty!27165)))

(declare-fun mapNonEmpty!42526 () Bool)

(declare-fun tp!81293 () Bool)

(declare-fun e!627534 () Bool)

(assert (=> mapNonEmpty!42526 (= mapRes!42526 (and tp!81293 e!627534))))

(declare-fun mapKey!42526 () (_ BitVec 32))

(declare-fun mapValue!42526 () ValueCell!12873)

(declare-fun mapRest!42526 () (Array (_ BitVec 32) ValueCell!12873))

(assert (=> mapNonEmpty!42526 (= mapRest!42520 (store mapRest!42526 mapKey!42526 mapValue!42526))))

(declare-fun b!1099468 () Bool)

(assert (=> b!1099468 (= e!627534 tp_is_empty!27165)))

(assert (= (and mapNonEmpty!42520 condMapEmpty!42526) mapIsEmpty!42526))

(assert (= (and mapNonEmpty!42520 (not condMapEmpty!42526)) mapNonEmpty!42526))

(assert (= (and mapNonEmpty!42526 ((_ is ValueCellFull!12873) mapValue!42526)) b!1099468))

(assert (= (and mapNonEmpty!42520 ((_ is ValueCellFull!12873) mapDefault!42526)) b!1099469))

(declare-fun m!1019473 () Bool)

(assert (=> mapNonEmpty!42526 m!1019473))

(declare-fun b_lambda!17913 () Bool)

(assert (= b_lambda!17899 (or (and start!96642 b_free!23115) b_lambda!17913)))

(declare-fun b_lambda!17915 () Bool)

(assert (= b_lambda!17907 (or (and start!96642 b_free!23115) b_lambda!17915)))

(declare-fun b_lambda!17917 () Bool)

(assert (= b_lambda!17903 (or (and start!96642 b_free!23115) b_lambda!17917)))

(declare-fun b_lambda!17919 () Bool)

(assert (= b_lambda!17911 (or (and start!96642 b_free!23115) b_lambda!17919)))

(declare-fun b_lambda!17921 () Bool)

(assert (= b_lambda!17909 (or (and start!96642 b_free!23115) b_lambda!17921)))

(declare-fun b_lambda!17923 () Bool)

(assert (= b_lambda!17901 (or (and start!96642 b_free!23115) b_lambda!17923)))

(declare-fun b_lambda!17925 () Bool)

(assert (= b_lambda!17905 (or (and start!96642 b_free!23115) b_lambda!17925)))

(check-sat (not b_lambda!17915) (not b!1099430) (not bm!45956) (not b!1099451) (not b!1099313) (not bm!45983) (not bm!45948) (not b!1099346) (not b!1099287) (not b!1099403) (not d!130501) (not b!1099447) (not b!1099289) (not d!130499) (not bm!45971) (not b!1099354) (not b!1099399) (not d!130505) (not b!1099453) (not d!130503) (not bm!45987) (not bm!45984) (not b!1099456) (not bm!45949) (not b!1099349) (not b!1099417) (not b!1099292) (not bm!45991) (not b!1099439) (not b!1099314) (not b_lambda!17897) (not b!1099307) (not b!1099457) (not b_lambda!17921) tp_is_empty!27165 (not b!1099401) (not b!1099351) (not b!1099320) (not b!1099288) (not d!130497) (not b_lambda!17923) (not b_lambda!17919) (not bm!45952) (not bm!45953) (not b!1099284) (not b!1099429) (not b!1099303) (not b!1099454) (not bm!45988) (not b!1099352) (not b_lambda!17925) (not b!1099355) (not d!130491) (not b!1099345) (not bm!45972) (not b!1099427) (not b!1099459) (not bm!45974) (not b!1099433) (not b!1099304) (not b!1099400) (not b!1099450) (not b!1099449) (not b!1099419) (not d!130509) b_and!36969 (not bm!45985) (not b!1099283) (not b_lambda!17913) (not b!1099348) (not b!1099460) (not b!1099308) (not bm!45982) (not b_next!23115) (not b!1099441) (not b!1099409) (not d!130507) (not mapNonEmpty!42526) (not bm!45975) (not b!1099411) (not b!1099431) (not b_lambda!17917))
(check-sat b_and!36969 (not b_next!23115))
