; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96480 () Bool)

(assert start!96480)

(declare-fun b_free!23065 () Bool)

(declare-fun b_next!23065 () Bool)

(assert (=> start!96480 (= b_free!23065 (not b_next!23065))))

(declare-fun tp!81121 () Bool)

(declare-fun b_and!36767 () Bool)

(assert (=> start!96480 (= tp!81121 b_and!36767)))

(declare-fun b!1097169 () Bool)

(declare-fun res!732331 () Bool)

(declare-fun e!626190 () Bool)

(assert (=> b!1097169 (=> (not res!732331) (not e!626190))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71048 0))(
  ( (array!71049 (arr!34196 (Array (_ BitVec 32) (_ BitVec 64))) (size!34734 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71048)

(assert (=> b!1097169 (= res!732331 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34734 _keys!1070))))))

(declare-fun b!1097171 () Bool)

(declare-fun res!732328 () Bool)

(assert (=> b!1097171 (=> (not res!732328) (not e!626190))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41281 0))(
  ( (V!41282 (val!13614 Int)) )
))
(declare-datatypes ((ValueCell!12848 0))(
  ( (ValueCellFull!12848 (v!16234 V!41281)) (EmptyCell!12848) )
))
(declare-datatypes ((array!71050 0))(
  ( (array!71051 (arr!34197 (Array (_ BitVec 32) ValueCell!12848)) (size!34735 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71050)

(assert (=> b!1097171 (= res!732328 (and (= (size!34735 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34734 _keys!1070) (size!34735 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097172 () Bool)

(declare-fun e!626188 () Bool)

(declare-fun e!626185 () Bool)

(assert (=> b!1097172 (= e!626188 (not e!626185))))

(declare-fun res!732330 () Bool)

(assert (=> b!1097172 (=> res!732330 e!626185)))

(assert (=> b!1097172 (= res!732330 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun minValue!831 () V!41281)

(declare-fun zeroValue!831 () V!41281)

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!17352 0))(
  ( (tuple2!17353 (_1!8687 (_ BitVec 64)) (_2!8687 V!41281)) )
))
(declare-datatypes ((List!23947 0))(
  ( (Nil!23944) (Cons!23943 (h!25152 tuple2!17352) (t!34049 List!23947)) )
))
(declare-datatypes ((ListLongMap!15321 0))(
  ( (ListLongMap!15322 (toList!7676 List!23947)) )
))
(declare-fun lt!490293 () ListLongMap!15321)

(declare-fun getCurrentListMap!4302 (array!71048 array!71050 (_ BitVec 32) (_ BitVec 32) V!41281 V!41281 (_ BitVec 32) Int) ListLongMap!15321)

(assert (=> b!1097172 (= lt!490293 (getCurrentListMap!4302 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490297 () ListLongMap!15321)

(declare-fun lt!490290 () array!71048)

(declare-fun lt!490291 () array!71050)

(assert (=> b!1097172 (= lt!490297 (getCurrentListMap!4302 lt!490290 lt!490291 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490294 () ListLongMap!15321)

(declare-fun lt!490292 () ListLongMap!15321)

(assert (=> b!1097172 (and (= lt!490294 lt!490292) (= lt!490292 lt!490294))))

(declare-fun lt!490296 () ListLongMap!15321)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!916 (ListLongMap!15321 (_ BitVec 64)) ListLongMap!15321)

(assert (=> b!1097172 (= lt!490292 (-!916 lt!490296 k0!904))))

(declare-datatypes ((Unit!35939 0))(
  ( (Unit!35940) )
))
(declare-fun lt!490298 () Unit!35939)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!191 (array!71048 array!71050 (_ BitVec 32) (_ BitVec 32) V!41281 V!41281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35939)

(assert (=> b!1097172 (= lt!490298 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!191 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4209 (array!71048 array!71050 (_ BitVec 32) (_ BitVec 32) V!41281 V!41281 (_ BitVec 32) Int) ListLongMap!15321)

(assert (=> b!1097172 (= lt!490294 (getCurrentListMapNoExtraKeys!4209 lt!490290 lt!490291 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2278 (Int (_ BitVec 64)) V!41281)

(assert (=> b!1097172 (= lt!490291 (array!71051 (store (arr!34197 _values!874) i!650 (ValueCellFull!12848 (dynLambda!2278 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34735 _values!874)))))

(assert (=> b!1097172 (= lt!490296 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097172 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490295 () Unit!35939)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71048 (_ BitVec 64) (_ BitVec 32)) Unit!35939)

(assert (=> b!1097172 (= lt!490295 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1097173 () Bool)

(declare-fun res!732332 () Bool)

(assert (=> b!1097173 (=> (not res!732332) (not e!626190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097173 (= res!732332 (validKeyInArray!0 k0!904))))

(declare-fun b!1097174 () Bool)

(declare-fun res!732329 () Bool)

(assert (=> b!1097174 (=> (not res!732329) (not e!626190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71048 (_ BitVec 32)) Bool)

(assert (=> b!1097174 (= res!732329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1097175 () Bool)

(declare-fun e!626186 () Bool)

(declare-fun e!626191 () Bool)

(declare-fun mapRes!42433 () Bool)

(assert (=> b!1097175 (= e!626186 (and e!626191 mapRes!42433))))

(declare-fun condMapEmpty!42433 () Bool)

(declare-fun mapDefault!42433 () ValueCell!12848)

(assert (=> b!1097175 (= condMapEmpty!42433 (= (arr!34197 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12848)) mapDefault!42433)))))

(declare-fun mapNonEmpty!42433 () Bool)

(declare-fun tp!81122 () Bool)

(declare-fun e!626189 () Bool)

(assert (=> mapNonEmpty!42433 (= mapRes!42433 (and tp!81122 e!626189))))

(declare-fun mapRest!42433 () (Array (_ BitVec 32) ValueCell!12848))

(declare-fun mapKey!42433 () (_ BitVec 32))

(declare-fun mapValue!42433 () ValueCell!12848)

(assert (=> mapNonEmpty!42433 (= (arr!34197 _values!874) (store mapRest!42433 mapKey!42433 mapValue!42433))))

(declare-fun b!1097176 () Bool)

(declare-fun res!732335 () Bool)

(assert (=> b!1097176 (=> (not res!732335) (not e!626190))))

(declare-datatypes ((List!23948 0))(
  ( (Nil!23945) (Cons!23944 (h!25153 (_ BitVec 64)) (t!34050 List!23948)) )
))
(declare-fun arrayNoDuplicates!0 (array!71048 (_ BitVec 32) List!23948) Bool)

(assert (=> b!1097176 (= res!732335 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23945))))

(declare-fun mapIsEmpty!42433 () Bool)

(assert (=> mapIsEmpty!42433 mapRes!42433))

(declare-fun b!1097177 () Bool)

(declare-fun tp_is_empty!27115 () Bool)

(assert (=> b!1097177 (= e!626191 tp_is_empty!27115)))

(declare-fun b!1097170 () Bool)

(declare-fun res!732337 () Bool)

(assert (=> b!1097170 (=> (not res!732337) (not e!626190))))

(assert (=> b!1097170 (= res!732337 (= (select (arr!34196 _keys!1070) i!650) k0!904))))

(declare-fun res!732334 () Bool)

(assert (=> start!96480 (=> (not res!732334) (not e!626190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96480 (= res!732334 (validMask!0 mask!1414))))

(assert (=> start!96480 e!626190))

(assert (=> start!96480 tp!81121))

(assert (=> start!96480 true))

(assert (=> start!96480 tp_is_empty!27115))

(declare-fun array_inv!26380 (array!71048) Bool)

(assert (=> start!96480 (array_inv!26380 _keys!1070)))

(declare-fun array_inv!26381 (array!71050) Bool)

(assert (=> start!96480 (and (array_inv!26381 _values!874) e!626186)))

(declare-fun b!1097178 () Bool)

(assert (=> b!1097178 (= e!626190 e!626188)))

(declare-fun res!732333 () Bool)

(assert (=> b!1097178 (=> (not res!732333) (not e!626188))))

(assert (=> b!1097178 (= res!732333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490290 mask!1414))))

(assert (=> b!1097178 (= lt!490290 (array!71049 (store (arr!34196 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34734 _keys!1070)))))

(declare-fun b!1097179 () Bool)

(declare-fun res!732336 () Bool)

(assert (=> b!1097179 (=> (not res!732336) (not e!626188))))

(assert (=> b!1097179 (= res!732336 (arrayNoDuplicates!0 lt!490290 #b00000000000000000000000000000000 Nil!23945))))

(declare-fun b!1097180 () Bool)

(declare-fun +!3388 (ListLongMap!15321 tuple2!17352) ListLongMap!15321)

(assert (=> b!1097180 (= e!626185 (= lt!490297 (+!3388 (+!3388 lt!490294 (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1097181 () Bool)

(assert (=> b!1097181 (= e!626189 tp_is_empty!27115)))

(assert (= (and start!96480 res!732334) b!1097171))

(assert (= (and b!1097171 res!732328) b!1097174))

(assert (= (and b!1097174 res!732329) b!1097176))

(assert (= (and b!1097176 res!732335) b!1097169))

(assert (= (and b!1097169 res!732331) b!1097173))

(assert (= (and b!1097173 res!732332) b!1097170))

(assert (= (and b!1097170 res!732337) b!1097178))

(assert (= (and b!1097178 res!732333) b!1097179))

(assert (= (and b!1097179 res!732336) b!1097172))

(assert (= (and b!1097172 (not res!732330)) b!1097180))

(assert (= (and b!1097175 condMapEmpty!42433) mapIsEmpty!42433))

(assert (= (and b!1097175 (not condMapEmpty!42433)) mapNonEmpty!42433))

(get-info :version)

(assert (= (and mapNonEmpty!42433 ((_ is ValueCellFull!12848) mapValue!42433)) b!1097181))

(assert (= (and b!1097175 ((_ is ValueCellFull!12848) mapDefault!42433)) b!1097177))

(assert (= start!96480 b!1097175))

(declare-fun b_lambda!17701 () Bool)

(assert (=> (not b_lambda!17701) (not b!1097172)))

(declare-fun t!34048 () Bool)

(declare-fun tb!7923 () Bool)

(assert (=> (and start!96480 (= defaultEntry!882 defaultEntry!882) t!34048) tb!7923))

(declare-fun result!16377 () Bool)

(assert (=> tb!7923 (= result!16377 tp_is_empty!27115)))

(assert (=> b!1097172 t!34048))

(declare-fun b_and!36769 () Bool)

(assert (= b_and!36767 (and (=> t!34048 result!16377) b_and!36769)))

(declare-fun m!1016169 () Bool)

(assert (=> b!1097174 m!1016169))

(declare-fun m!1016171 () Bool)

(assert (=> b!1097180 m!1016171))

(assert (=> b!1097180 m!1016171))

(declare-fun m!1016173 () Bool)

(assert (=> b!1097180 m!1016173))

(declare-fun m!1016175 () Bool)

(assert (=> b!1097178 m!1016175))

(declare-fun m!1016177 () Bool)

(assert (=> b!1097178 m!1016177))

(declare-fun m!1016179 () Bool)

(assert (=> b!1097179 m!1016179))

(declare-fun m!1016181 () Bool)

(assert (=> mapNonEmpty!42433 m!1016181))

(declare-fun m!1016183 () Bool)

(assert (=> b!1097172 m!1016183))

(declare-fun m!1016185 () Bool)

(assert (=> b!1097172 m!1016185))

(declare-fun m!1016187 () Bool)

(assert (=> b!1097172 m!1016187))

(declare-fun m!1016189 () Bool)

(assert (=> b!1097172 m!1016189))

(declare-fun m!1016191 () Bool)

(assert (=> b!1097172 m!1016191))

(declare-fun m!1016193 () Bool)

(assert (=> b!1097172 m!1016193))

(declare-fun m!1016195 () Bool)

(assert (=> b!1097172 m!1016195))

(declare-fun m!1016197 () Bool)

(assert (=> b!1097172 m!1016197))

(declare-fun m!1016199 () Bool)

(assert (=> b!1097172 m!1016199))

(declare-fun m!1016201 () Bool)

(assert (=> b!1097172 m!1016201))

(declare-fun m!1016203 () Bool)

(assert (=> start!96480 m!1016203))

(declare-fun m!1016205 () Bool)

(assert (=> start!96480 m!1016205))

(declare-fun m!1016207 () Bool)

(assert (=> start!96480 m!1016207))

(declare-fun m!1016209 () Bool)

(assert (=> b!1097170 m!1016209))

(declare-fun m!1016211 () Bool)

(assert (=> b!1097173 m!1016211))

(declare-fun m!1016213 () Bool)

(assert (=> b!1097176 m!1016213))

(check-sat (not b!1097176) b_and!36769 (not b!1097179) (not b!1097172) tp_is_empty!27115 (not b!1097180) (not b_next!23065) (not start!96480) (not b_lambda!17701) (not b!1097173) (not mapNonEmpty!42433) (not b!1097178) (not b!1097174))
(check-sat b_and!36769 (not b_next!23065))
(get-model)

(declare-fun b_lambda!17707 () Bool)

(assert (= b_lambda!17701 (or (and start!96480 b_free!23065) b_lambda!17707)))

(check-sat (not b!1097176) b_and!36769 (not b!1097179) (not b!1097172) tp_is_empty!27115 (not b!1097180) (not b_next!23065) (not start!96480) (not b!1097173) (not mapNonEmpty!42433) (not b!1097178) (not b!1097174) (not b_lambda!17707))
(check-sat b_and!36769 (not b_next!23065))
(get-model)

(declare-fun d!130137 () Bool)

(declare-fun res!732405 () Bool)

(declare-fun e!626245 () Bool)

(assert (=> d!130137 (=> res!732405 e!626245)))

(assert (=> d!130137 (= res!732405 (bvsge #b00000000000000000000000000000000 (size!34734 _keys!1070)))))

(assert (=> d!130137 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23945) e!626245)))

(declare-fun b!1097276 () Bool)

(declare-fun e!626244 () Bool)

(declare-fun call!45744 () Bool)

(assert (=> b!1097276 (= e!626244 call!45744)))

(declare-fun b!1097277 () Bool)

(assert (=> b!1097277 (= e!626244 call!45744)))

(declare-fun bm!45741 () Bool)

(declare-fun c!108322 () Bool)

(assert (=> bm!45741 (= call!45744 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108322 (Cons!23944 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000) Nil!23945) Nil!23945)))))

(declare-fun b!1097278 () Bool)

(declare-fun e!626242 () Bool)

(assert (=> b!1097278 (= e!626242 e!626244)))

(assert (=> b!1097278 (= c!108322 (validKeyInArray!0 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097279 () Bool)

(declare-fun e!626243 () Bool)

(declare-fun contains!6347 (List!23948 (_ BitVec 64)) Bool)

(assert (=> b!1097279 (= e!626243 (contains!6347 Nil!23945 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097280 () Bool)

(assert (=> b!1097280 (= e!626245 e!626242)))

(declare-fun res!732406 () Bool)

(assert (=> b!1097280 (=> (not res!732406) (not e!626242))))

(assert (=> b!1097280 (= res!732406 (not e!626243))))

(declare-fun res!732404 () Bool)

(assert (=> b!1097280 (=> (not res!732404) (not e!626243))))

(assert (=> b!1097280 (= res!732404 (validKeyInArray!0 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130137 (not res!732405)) b!1097280))

(assert (= (and b!1097280 res!732404) b!1097279))

(assert (= (and b!1097280 res!732406) b!1097278))

(assert (= (and b!1097278 c!108322) b!1097277))

(assert (= (and b!1097278 (not c!108322)) b!1097276))

(assert (= (or b!1097277 b!1097276) bm!45741))

(declare-fun m!1016307 () Bool)

(assert (=> bm!45741 m!1016307))

(declare-fun m!1016309 () Bool)

(assert (=> bm!45741 m!1016309))

(assert (=> b!1097278 m!1016307))

(assert (=> b!1097278 m!1016307))

(declare-fun m!1016311 () Bool)

(assert (=> b!1097278 m!1016311))

(assert (=> b!1097279 m!1016307))

(assert (=> b!1097279 m!1016307))

(declare-fun m!1016313 () Bool)

(assert (=> b!1097279 m!1016313))

(assert (=> b!1097280 m!1016307))

(assert (=> b!1097280 m!1016307))

(assert (=> b!1097280 m!1016311))

(assert (=> b!1097176 d!130137))

(declare-fun d!130139 () Bool)

(declare-fun e!626248 () Bool)

(assert (=> d!130139 e!626248))

(declare-fun res!732412 () Bool)

(assert (=> d!130139 (=> (not res!732412) (not e!626248))))

(declare-fun lt!490361 () ListLongMap!15321)

(declare-fun contains!6348 (ListLongMap!15321 (_ BitVec 64)) Bool)

(assert (=> d!130139 (= res!732412 (contains!6348 lt!490361 (_1!8687 (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun lt!490363 () List!23947)

(assert (=> d!130139 (= lt!490361 (ListLongMap!15322 lt!490363))))

(declare-fun lt!490362 () Unit!35939)

(declare-fun lt!490364 () Unit!35939)

(assert (=> d!130139 (= lt!490362 lt!490364)))

(declare-datatypes ((Option!671 0))(
  ( (Some!670 (v!16237 V!41281)) (None!669) )
))
(declare-fun getValueByKey!620 (List!23947 (_ BitVec 64)) Option!671)

(assert (=> d!130139 (= (getValueByKey!620 lt!490363 (_1!8687 (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))) (Some!670 (_2!8687 (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun lemmaContainsTupThenGetReturnValue!296 (List!23947 (_ BitVec 64) V!41281) Unit!35939)

(assert (=> d!130139 (= lt!490364 (lemmaContainsTupThenGetReturnValue!296 lt!490363 (_1!8687 (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) (_2!8687 (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun insertStrictlySorted!389 (List!23947 (_ BitVec 64) V!41281) List!23947)

(assert (=> d!130139 (= lt!490363 (insertStrictlySorted!389 (toList!7676 (+!3388 lt!490294 (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))) (_1!8687 (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) (_2!8687 (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(assert (=> d!130139 (= (+!3388 (+!3388 lt!490294 (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) lt!490361)))

(declare-fun b!1097285 () Bool)

(declare-fun res!732411 () Bool)

(assert (=> b!1097285 (=> (not res!732411) (not e!626248))))

(assert (=> b!1097285 (= res!732411 (= (getValueByKey!620 (toList!7676 lt!490361) (_1!8687 (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))) (Some!670 (_2!8687 (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))))

(declare-fun b!1097286 () Bool)

(declare-fun contains!6349 (List!23947 tuple2!17352) Bool)

(assert (=> b!1097286 (= e!626248 (contains!6349 (toList!7676 lt!490361) (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(assert (= (and d!130139 res!732412) b!1097285))

(assert (= (and b!1097285 res!732411) b!1097286))

(declare-fun m!1016315 () Bool)

(assert (=> d!130139 m!1016315))

(declare-fun m!1016317 () Bool)

(assert (=> d!130139 m!1016317))

(declare-fun m!1016319 () Bool)

(assert (=> d!130139 m!1016319))

(declare-fun m!1016321 () Bool)

(assert (=> d!130139 m!1016321))

(declare-fun m!1016323 () Bool)

(assert (=> b!1097285 m!1016323))

(declare-fun m!1016325 () Bool)

(assert (=> b!1097286 m!1016325))

(assert (=> b!1097180 d!130139))

(declare-fun d!130141 () Bool)

(declare-fun e!626249 () Bool)

(assert (=> d!130141 e!626249))

(declare-fun res!732414 () Bool)

(assert (=> d!130141 (=> (not res!732414) (not e!626249))))

(declare-fun lt!490365 () ListLongMap!15321)

(assert (=> d!130141 (= res!732414 (contains!6348 lt!490365 (_1!8687 (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun lt!490367 () List!23947)

(assert (=> d!130141 (= lt!490365 (ListLongMap!15322 lt!490367))))

(declare-fun lt!490366 () Unit!35939)

(declare-fun lt!490368 () Unit!35939)

(assert (=> d!130141 (= lt!490366 lt!490368)))

(assert (=> d!130141 (= (getValueByKey!620 lt!490367 (_1!8687 (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))) (Some!670 (_2!8687 (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(assert (=> d!130141 (= lt!490368 (lemmaContainsTupThenGetReturnValue!296 lt!490367 (_1!8687 (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (_2!8687 (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(assert (=> d!130141 (= lt!490367 (insertStrictlySorted!389 (toList!7676 lt!490294) (_1!8687 (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (_2!8687 (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(assert (=> d!130141 (= (+!3388 lt!490294 (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) lt!490365)))

(declare-fun b!1097287 () Bool)

(declare-fun res!732413 () Bool)

(assert (=> b!1097287 (=> (not res!732413) (not e!626249))))

(assert (=> b!1097287 (= res!732413 (= (getValueByKey!620 (toList!7676 lt!490365) (_1!8687 (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))) (Some!670 (_2!8687 (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)))))))

(declare-fun b!1097288 () Bool)

(assert (=> b!1097288 (= e!626249 (contains!6349 (toList!7676 lt!490365) (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)))))

(assert (= (and d!130141 res!732414) b!1097287))

(assert (= (and b!1097287 res!732413) b!1097288))

(declare-fun m!1016327 () Bool)

(assert (=> d!130141 m!1016327))

(declare-fun m!1016329 () Bool)

(assert (=> d!130141 m!1016329))

(declare-fun m!1016331 () Bool)

(assert (=> d!130141 m!1016331))

(declare-fun m!1016333 () Bool)

(assert (=> d!130141 m!1016333))

(declare-fun m!1016335 () Bool)

(assert (=> b!1097287 m!1016335))

(declare-fun m!1016337 () Bool)

(assert (=> b!1097288 m!1016337))

(assert (=> b!1097180 d!130141))

(declare-fun d!130143 () Bool)

(assert (=> d!130143 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96480 d!130143))

(declare-fun d!130145 () Bool)

(assert (=> d!130145 (= (array_inv!26380 _keys!1070) (bvsge (size!34734 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96480 d!130145))

(declare-fun d!130147 () Bool)

(assert (=> d!130147 (= (array_inv!26381 _values!874) (bvsge (size!34735 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96480 d!130147))

(declare-fun d!130149 () Bool)

(assert (=> d!130149 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1097173 d!130149))

(declare-fun d!130151 () Bool)

(declare-fun res!732419 () Bool)

(declare-fun e!626254 () Bool)

(assert (=> d!130151 (=> res!732419 e!626254)))

(assert (=> d!130151 (= res!732419 (= (select (arr!34196 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130151 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!626254)))

(declare-fun b!1097293 () Bool)

(declare-fun e!626255 () Bool)

(assert (=> b!1097293 (= e!626254 e!626255)))

(declare-fun res!732420 () Bool)

(assert (=> b!1097293 (=> (not res!732420) (not e!626255))))

(assert (=> b!1097293 (= res!732420 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34734 _keys!1070)))))

(declare-fun b!1097294 () Bool)

(assert (=> b!1097294 (= e!626255 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130151 (not res!732419)) b!1097293))

(assert (= (and b!1097293 res!732420) b!1097294))

(assert (=> d!130151 m!1016307))

(declare-fun m!1016339 () Bool)

(assert (=> b!1097294 m!1016339))

(assert (=> b!1097172 d!130151))

(declare-fun b!1097337 () Bool)

(declare-fun e!626282 () Unit!35939)

(declare-fun lt!490423 () Unit!35939)

(assert (=> b!1097337 (= e!626282 lt!490423)))

(declare-fun lt!490414 () ListLongMap!15321)

(assert (=> b!1097337 (= lt!490414 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490422 () (_ BitVec 64))

(assert (=> b!1097337 (= lt!490422 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490432 () (_ BitVec 64))

(assert (=> b!1097337 (= lt!490432 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490425 () Unit!35939)

(declare-fun addStillContains!649 (ListLongMap!15321 (_ BitVec 64) V!41281 (_ BitVec 64)) Unit!35939)

(assert (=> b!1097337 (= lt!490425 (addStillContains!649 lt!490414 lt!490422 zeroValue!831 lt!490432))))

(assert (=> b!1097337 (contains!6348 (+!3388 lt!490414 (tuple2!17353 lt!490422 zeroValue!831)) lt!490432)))

(declare-fun lt!490434 () Unit!35939)

(assert (=> b!1097337 (= lt!490434 lt!490425)))

(declare-fun lt!490415 () ListLongMap!15321)

(assert (=> b!1097337 (= lt!490415 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490418 () (_ BitVec 64))

(assert (=> b!1097337 (= lt!490418 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490419 () (_ BitVec 64))

(assert (=> b!1097337 (= lt!490419 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490417 () Unit!35939)

(declare-fun addApplyDifferent!505 (ListLongMap!15321 (_ BitVec 64) V!41281 (_ BitVec 64)) Unit!35939)

(assert (=> b!1097337 (= lt!490417 (addApplyDifferent!505 lt!490415 lt!490418 minValue!831 lt!490419))))

(declare-fun apply!936 (ListLongMap!15321 (_ BitVec 64)) V!41281)

(assert (=> b!1097337 (= (apply!936 (+!3388 lt!490415 (tuple2!17353 lt!490418 minValue!831)) lt!490419) (apply!936 lt!490415 lt!490419))))

(declare-fun lt!490433 () Unit!35939)

(assert (=> b!1097337 (= lt!490433 lt!490417)))

(declare-fun lt!490429 () ListLongMap!15321)

(assert (=> b!1097337 (= lt!490429 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490426 () (_ BitVec 64))

(assert (=> b!1097337 (= lt!490426 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490420 () (_ BitVec 64))

(assert (=> b!1097337 (= lt!490420 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490413 () Unit!35939)

(assert (=> b!1097337 (= lt!490413 (addApplyDifferent!505 lt!490429 lt!490426 zeroValue!831 lt!490420))))

(assert (=> b!1097337 (= (apply!936 (+!3388 lt!490429 (tuple2!17353 lt!490426 zeroValue!831)) lt!490420) (apply!936 lt!490429 lt!490420))))

(declare-fun lt!490428 () Unit!35939)

(assert (=> b!1097337 (= lt!490428 lt!490413)))

(declare-fun lt!490424 () ListLongMap!15321)

(assert (=> b!1097337 (= lt!490424 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490430 () (_ BitVec 64))

(assert (=> b!1097337 (= lt!490430 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490431 () (_ BitVec 64))

(assert (=> b!1097337 (= lt!490431 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1097337 (= lt!490423 (addApplyDifferent!505 lt!490424 lt!490430 minValue!831 lt!490431))))

(assert (=> b!1097337 (= (apply!936 (+!3388 lt!490424 (tuple2!17353 lt!490430 minValue!831)) lt!490431) (apply!936 lt!490424 lt!490431))))

(declare-fun b!1097338 () Bool)

(declare-fun e!626287 () Bool)

(assert (=> b!1097338 (= e!626287 (validKeyInArray!0 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097339 () Bool)

(declare-fun e!626286 () Bool)

(declare-fun e!626290 () Bool)

(assert (=> b!1097339 (= e!626286 e!626290)))

(declare-fun res!732441 () Bool)

(declare-fun call!45760 () Bool)

(assert (=> b!1097339 (= res!732441 call!45760)))

(assert (=> b!1097339 (=> (not res!732441) (not e!626290))))

(declare-fun bm!45757 () Bool)

(declare-fun call!45761 () ListLongMap!15321)

(declare-fun call!45763 () ListLongMap!15321)

(assert (=> bm!45757 (= call!45761 call!45763)))

(declare-fun b!1097340 () Bool)

(declare-fun e!626293 () ListLongMap!15321)

(assert (=> b!1097340 (= e!626293 call!45761)))

(declare-fun b!1097341 () Bool)

(declare-fun e!626294 () Bool)

(declare-fun lt!490427 () ListLongMap!15321)

(assert (=> b!1097341 (= e!626294 (= (apply!936 lt!490427 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1097342 () Bool)

(declare-fun res!732440 () Bool)

(declare-fun e!626283 () Bool)

(assert (=> b!1097342 (=> (not res!732440) (not e!626283))))

(assert (=> b!1097342 (= res!732440 e!626286)))

(declare-fun c!108335 () Bool)

(assert (=> b!1097342 (= c!108335 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1097343 () Bool)

(declare-fun Unit!35943 () Unit!35939)

(assert (=> b!1097343 (= e!626282 Unit!35943)))

(declare-fun b!1097344 () Bool)

(declare-fun e!626288 () ListLongMap!15321)

(assert (=> b!1097344 (= e!626288 e!626293)))

(declare-fun c!108336 () Bool)

(assert (=> b!1097344 (= c!108336 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1097345 () Bool)

(declare-fun e!626291 () Bool)

(assert (=> b!1097345 (= e!626291 e!626294)))

(declare-fun res!732444 () Bool)

(declare-fun call!45759 () Bool)

(assert (=> b!1097345 (= res!732444 call!45759)))

(assert (=> b!1097345 (=> (not res!732444) (not e!626294))))

(declare-fun b!1097346 () Bool)

(declare-fun res!732439 () Bool)

(assert (=> b!1097346 (=> (not res!732439) (not e!626283))))

(declare-fun e!626285 () Bool)

(assert (=> b!1097346 (= res!732439 e!626285)))

(declare-fun res!732443 () Bool)

(assert (=> b!1097346 (=> res!732443 e!626285)))

(assert (=> b!1097346 (= res!732443 (not e!626287))))

(declare-fun res!732447 () Bool)

(assert (=> b!1097346 (=> (not res!732447) (not e!626287))))

(assert (=> b!1097346 (= res!732447 (bvslt #b00000000000000000000000000000000 (size!34734 _keys!1070)))))

(declare-fun b!1097347 () Bool)

(declare-fun e!626289 () Bool)

(assert (=> b!1097347 (= e!626285 e!626289)))

(declare-fun res!732446 () Bool)

(assert (=> b!1097347 (=> (not res!732446) (not e!626289))))

(assert (=> b!1097347 (= res!732446 (contains!6348 lt!490427 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1097347 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34734 _keys!1070)))))

(declare-fun b!1097348 () Bool)

(assert (=> b!1097348 (= e!626286 (not call!45760))))

(declare-fun bm!45756 () Bool)

(assert (=> bm!45756 (= call!45759 (contains!6348 lt!490427 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!130153 () Bool)

(assert (=> d!130153 e!626283))

(declare-fun res!732442 () Bool)

(assert (=> d!130153 (=> (not res!732442) (not e!626283))))

(assert (=> d!130153 (= res!732442 (or (bvsge #b00000000000000000000000000000000 (size!34734 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34734 _keys!1070)))))))

(declare-fun lt!490421 () ListLongMap!15321)

(assert (=> d!130153 (= lt!490427 lt!490421)))

(declare-fun lt!490416 () Unit!35939)

(assert (=> d!130153 (= lt!490416 e!626282)))

(declare-fun c!108337 () Bool)

(declare-fun e!626284 () Bool)

(assert (=> d!130153 (= c!108337 e!626284)))

(declare-fun res!732445 () Bool)

(assert (=> d!130153 (=> (not res!732445) (not e!626284))))

(assert (=> d!130153 (= res!732445 (bvslt #b00000000000000000000000000000000 (size!34734 _keys!1070)))))

(assert (=> d!130153 (= lt!490421 e!626288)))

(declare-fun c!108340 () Bool)

(assert (=> d!130153 (= c!108340 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130153 (validMask!0 mask!1414)))

(assert (=> d!130153 (= (getCurrentListMap!4302 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490427)))

(declare-fun b!1097349 () Bool)

(declare-fun get!17606 (ValueCell!12848 V!41281) V!41281)

(assert (=> b!1097349 (= e!626289 (= (apply!936 lt!490427 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000)) (get!17606 (select (arr!34197 _values!874) #b00000000000000000000000000000000) (dynLambda!2278 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1097349 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34735 _values!874)))))

(assert (=> b!1097349 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34734 _keys!1070)))))

(declare-fun b!1097350 () Bool)

(declare-fun c!108338 () Bool)

(assert (=> b!1097350 (= c!108338 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!626292 () ListLongMap!15321)

(assert (=> b!1097350 (= e!626293 e!626292)))

(declare-fun call!45765 () ListLongMap!15321)

(declare-fun bm!45758 () Bool)

(assert (=> bm!45758 (= call!45765 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1097351 () Bool)

(declare-fun call!45764 () ListLongMap!15321)

(assert (=> b!1097351 (= e!626292 call!45764)))

(declare-fun b!1097352 () Bool)

(assert (=> b!1097352 (= e!626292 call!45761)))

(declare-fun call!45762 () ListLongMap!15321)

(declare-fun bm!45759 () Bool)

(assert (=> bm!45759 (= call!45763 (+!3388 (ite c!108340 call!45765 (ite c!108336 call!45762 call!45764)) (ite (or c!108340 c!108336) (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1097353 () Bool)

(assert (=> b!1097353 (= e!626283 e!626291)))

(declare-fun c!108339 () Bool)

(assert (=> b!1097353 (= c!108339 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1097354 () Bool)

(assert (=> b!1097354 (= e!626284 (validKeyInArray!0 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45760 () Bool)

(assert (=> bm!45760 (= call!45764 call!45762)))

(declare-fun b!1097355 () Bool)

(assert (=> b!1097355 (= e!626290 (= (apply!936 lt!490427 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1097356 () Bool)

(assert (=> b!1097356 (= e!626288 (+!3388 call!45763 (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun bm!45761 () Bool)

(assert (=> bm!45761 (= call!45760 (contains!6348 lt!490427 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45762 () Bool)

(assert (=> bm!45762 (= call!45762 call!45765)))

(declare-fun b!1097357 () Bool)

(assert (=> b!1097357 (= e!626291 (not call!45759))))

(assert (= (and d!130153 c!108340) b!1097356))

(assert (= (and d!130153 (not c!108340)) b!1097344))

(assert (= (and b!1097344 c!108336) b!1097340))

(assert (= (and b!1097344 (not c!108336)) b!1097350))

(assert (= (and b!1097350 c!108338) b!1097352))

(assert (= (and b!1097350 (not c!108338)) b!1097351))

(assert (= (or b!1097352 b!1097351) bm!45760))

(assert (= (or b!1097340 bm!45760) bm!45762))

(assert (= (or b!1097340 b!1097352) bm!45757))

(assert (= (or b!1097356 bm!45762) bm!45758))

(assert (= (or b!1097356 bm!45757) bm!45759))

(assert (= (and d!130153 res!732445) b!1097354))

(assert (= (and d!130153 c!108337) b!1097337))

(assert (= (and d!130153 (not c!108337)) b!1097343))

(assert (= (and d!130153 res!732442) b!1097346))

(assert (= (and b!1097346 res!732447) b!1097338))

(assert (= (and b!1097346 (not res!732443)) b!1097347))

(assert (= (and b!1097347 res!732446) b!1097349))

(assert (= (and b!1097346 res!732439) b!1097342))

(assert (= (and b!1097342 c!108335) b!1097339))

(assert (= (and b!1097342 (not c!108335)) b!1097348))

(assert (= (and b!1097339 res!732441) b!1097355))

(assert (= (or b!1097339 b!1097348) bm!45761))

(assert (= (and b!1097342 res!732440) b!1097353))

(assert (= (and b!1097353 c!108339) b!1097345))

(assert (= (and b!1097353 (not c!108339)) b!1097357))

(assert (= (and b!1097345 res!732444) b!1097341))

(assert (= (or b!1097345 b!1097357) bm!45756))

(declare-fun b_lambda!17709 () Bool)

(assert (=> (not b_lambda!17709) (not b!1097349)))

(assert (=> b!1097349 t!34048))

(declare-fun b_and!36779 () Bool)

(assert (= b_and!36769 (and (=> t!34048 result!16377) b_and!36779)))

(assert (=> bm!45758 m!1016201))

(assert (=> d!130153 m!1016203))

(declare-fun m!1016341 () Bool)

(assert (=> b!1097349 m!1016341))

(assert (=> b!1097349 m!1016183))

(assert (=> b!1097349 m!1016307))

(declare-fun m!1016343 () Bool)

(assert (=> b!1097349 m!1016343))

(assert (=> b!1097349 m!1016307))

(assert (=> b!1097349 m!1016341))

(assert (=> b!1097349 m!1016183))

(declare-fun m!1016345 () Bool)

(assert (=> b!1097349 m!1016345))

(declare-fun m!1016347 () Bool)

(assert (=> b!1097356 m!1016347))

(declare-fun m!1016349 () Bool)

(assert (=> bm!45761 m!1016349))

(declare-fun m!1016351 () Bool)

(assert (=> bm!45756 m!1016351))

(declare-fun m!1016353 () Bool)

(assert (=> b!1097341 m!1016353))

(declare-fun m!1016355 () Bool)

(assert (=> bm!45759 m!1016355))

(assert (=> b!1097347 m!1016307))

(assert (=> b!1097347 m!1016307))

(declare-fun m!1016357 () Bool)

(assert (=> b!1097347 m!1016357))

(declare-fun m!1016359 () Bool)

(assert (=> b!1097355 m!1016359))

(declare-fun m!1016361 () Bool)

(assert (=> b!1097337 m!1016361))

(declare-fun m!1016363 () Bool)

(assert (=> b!1097337 m!1016363))

(declare-fun m!1016365 () Bool)

(assert (=> b!1097337 m!1016365))

(declare-fun m!1016367 () Bool)

(assert (=> b!1097337 m!1016367))

(declare-fun m!1016369 () Bool)

(assert (=> b!1097337 m!1016369))

(declare-fun m!1016371 () Bool)

(assert (=> b!1097337 m!1016371))

(declare-fun m!1016373 () Bool)

(assert (=> b!1097337 m!1016373))

(declare-fun m!1016375 () Bool)

(assert (=> b!1097337 m!1016375))

(assert (=> b!1097337 m!1016361))

(declare-fun m!1016377 () Bool)

(assert (=> b!1097337 m!1016377))

(assert (=> b!1097337 m!1016363))

(assert (=> b!1097337 m!1016373))

(declare-fun m!1016379 () Bool)

(assert (=> b!1097337 m!1016379))

(declare-fun m!1016381 () Bool)

(assert (=> b!1097337 m!1016381))

(assert (=> b!1097337 m!1016201))

(assert (=> b!1097337 m!1016369))

(declare-fun m!1016383 () Bool)

(assert (=> b!1097337 m!1016383))

(declare-fun m!1016385 () Bool)

(assert (=> b!1097337 m!1016385))

(declare-fun m!1016387 () Bool)

(assert (=> b!1097337 m!1016387))

(assert (=> b!1097337 m!1016307))

(declare-fun m!1016389 () Bool)

(assert (=> b!1097337 m!1016389))

(assert (=> b!1097354 m!1016307))

(assert (=> b!1097354 m!1016307))

(assert (=> b!1097354 m!1016311))

(assert (=> b!1097338 m!1016307))

(assert (=> b!1097338 m!1016307))

(assert (=> b!1097338 m!1016311))

(assert (=> b!1097172 d!130153))

(declare-fun b!1097382 () Bool)

(declare-fun e!626314 () ListLongMap!15321)

(declare-fun call!45768 () ListLongMap!15321)

(assert (=> b!1097382 (= e!626314 call!45768)))

(declare-fun b!1097383 () Bool)

(declare-fun e!626311 () Bool)

(declare-fun lt!490451 () ListLongMap!15321)

(declare-fun isEmpty!966 (ListLongMap!15321) Bool)

(assert (=> b!1097383 (= e!626311 (isEmpty!966 lt!490451))))

(declare-fun b!1097384 () Bool)

(declare-fun e!626313 () ListLongMap!15321)

(assert (=> b!1097384 (= e!626313 (ListLongMap!15322 Nil!23944))))

(declare-fun d!130155 () Bool)

(declare-fun e!626309 () Bool)

(assert (=> d!130155 e!626309))

(declare-fun res!732457 () Bool)

(assert (=> d!130155 (=> (not res!732457) (not e!626309))))

(assert (=> d!130155 (= res!732457 (not (contains!6348 lt!490451 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130155 (= lt!490451 e!626313)))

(declare-fun c!108349 () Bool)

(assert (=> d!130155 (= c!108349 (bvsge #b00000000000000000000000000000000 (size!34734 lt!490290)))))

(assert (=> d!130155 (validMask!0 mask!1414)))

(assert (=> d!130155 (= (getCurrentListMapNoExtraKeys!4209 lt!490290 lt!490291 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490451)))

(declare-fun b!1097385 () Bool)

(declare-fun e!626315 () Bool)

(assert (=> b!1097385 (= e!626315 (validKeyInArray!0 (select (arr!34196 lt!490290) #b00000000000000000000000000000000)))))

(assert (=> b!1097385 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1097386 () Bool)

(declare-fun e!626312 () Bool)

(assert (=> b!1097386 (= e!626312 e!626311)))

(declare-fun c!108352 () Bool)

(assert (=> b!1097386 (= c!108352 (bvslt #b00000000000000000000000000000000 (size!34734 lt!490290)))))

(declare-fun b!1097387 () Bool)

(declare-fun lt!490453 () Unit!35939)

(declare-fun lt!490455 () Unit!35939)

(assert (=> b!1097387 (= lt!490453 lt!490455)))

(declare-fun lt!490450 () (_ BitVec 64))

(declare-fun lt!490449 () ListLongMap!15321)

(declare-fun lt!490452 () V!41281)

(declare-fun lt!490454 () (_ BitVec 64))

(assert (=> b!1097387 (not (contains!6348 (+!3388 lt!490449 (tuple2!17353 lt!490450 lt!490452)) lt!490454))))

(declare-fun addStillNotContains!272 (ListLongMap!15321 (_ BitVec 64) V!41281 (_ BitVec 64)) Unit!35939)

(assert (=> b!1097387 (= lt!490455 (addStillNotContains!272 lt!490449 lt!490450 lt!490452 lt!490454))))

(assert (=> b!1097387 (= lt!490454 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1097387 (= lt!490452 (get!17606 (select (arr!34197 lt!490291) #b00000000000000000000000000000000) (dynLambda!2278 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1097387 (= lt!490450 (select (arr!34196 lt!490290) #b00000000000000000000000000000000))))

(assert (=> b!1097387 (= lt!490449 call!45768)))

(assert (=> b!1097387 (= e!626314 (+!3388 call!45768 (tuple2!17353 (select (arr!34196 lt!490290) #b00000000000000000000000000000000) (get!17606 (select (arr!34197 lt!490291) #b00000000000000000000000000000000) (dynLambda!2278 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1097388 () Bool)

(assert (=> b!1097388 (= e!626311 (= lt!490451 (getCurrentListMapNoExtraKeys!4209 lt!490290 lt!490291 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1097389 () Bool)

(declare-fun res!732458 () Bool)

(assert (=> b!1097389 (=> (not res!732458) (not e!626309))))

(assert (=> b!1097389 (= res!732458 (not (contains!6348 lt!490451 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1097390 () Bool)

(assert (=> b!1097390 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34734 lt!490290)))))

(assert (=> b!1097390 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34735 lt!490291)))))

(declare-fun e!626310 () Bool)

(assert (=> b!1097390 (= e!626310 (= (apply!936 lt!490451 (select (arr!34196 lt!490290) #b00000000000000000000000000000000)) (get!17606 (select (arr!34197 lt!490291) #b00000000000000000000000000000000) (dynLambda!2278 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!45765 () Bool)

(assert (=> bm!45765 (= call!45768 (getCurrentListMapNoExtraKeys!4209 lt!490290 lt!490291 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1097391 () Bool)

(assert (=> b!1097391 (= e!626309 e!626312)))

(declare-fun c!108350 () Bool)

(assert (=> b!1097391 (= c!108350 e!626315)))

(declare-fun res!732456 () Bool)

(assert (=> b!1097391 (=> (not res!732456) (not e!626315))))

(assert (=> b!1097391 (= res!732456 (bvslt #b00000000000000000000000000000000 (size!34734 lt!490290)))))

(declare-fun b!1097392 () Bool)

(assert (=> b!1097392 (= e!626313 e!626314)))

(declare-fun c!108351 () Bool)

(assert (=> b!1097392 (= c!108351 (validKeyInArray!0 (select (arr!34196 lt!490290) #b00000000000000000000000000000000)))))

(declare-fun b!1097393 () Bool)

(assert (=> b!1097393 (= e!626312 e!626310)))

(assert (=> b!1097393 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34734 lt!490290)))))

(declare-fun res!732459 () Bool)

(assert (=> b!1097393 (= res!732459 (contains!6348 lt!490451 (select (arr!34196 lt!490290) #b00000000000000000000000000000000)))))

(assert (=> b!1097393 (=> (not res!732459) (not e!626310))))

(assert (= (and d!130155 c!108349) b!1097384))

(assert (= (and d!130155 (not c!108349)) b!1097392))

(assert (= (and b!1097392 c!108351) b!1097387))

(assert (= (and b!1097392 (not c!108351)) b!1097382))

(assert (= (or b!1097387 b!1097382) bm!45765))

(assert (= (and d!130155 res!732457) b!1097389))

(assert (= (and b!1097389 res!732458) b!1097391))

(assert (= (and b!1097391 res!732456) b!1097385))

(assert (= (and b!1097391 c!108350) b!1097393))

(assert (= (and b!1097391 (not c!108350)) b!1097386))

(assert (= (and b!1097393 res!732459) b!1097390))

(assert (= (and b!1097386 c!108352) b!1097388))

(assert (= (and b!1097386 (not c!108352)) b!1097383))

(declare-fun b_lambda!17711 () Bool)

(assert (=> (not b_lambda!17711) (not b!1097387)))

(assert (=> b!1097387 t!34048))

(declare-fun b_and!36781 () Bool)

(assert (= b_and!36779 (and (=> t!34048 result!16377) b_and!36781)))

(declare-fun b_lambda!17713 () Bool)

(assert (=> (not b_lambda!17713) (not b!1097390)))

(assert (=> b!1097390 t!34048))

(declare-fun b_and!36783 () Bool)

(assert (= b_and!36781 (and (=> t!34048 result!16377) b_and!36783)))

(declare-fun m!1016391 () Bool)

(assert (=> b!1097385 m!1016391))

(assert (=> b!1097385 m!1016391))

(declare-fun m!1016393 () Bool)

(assert (=> b!1097385 m!1016393))

(assert (=> b!1097393 m!1016391))

(assert (=> b!1097393 m!1016391))

(declare-fun m!1016395 () Bool)

(assert (=> b!1097393 m!1016395))

(assert (=> b!1097387 m!1016183))

(declare-fun m!1016397 () Bool)

(assert (=> b!1097387 m!1016397))

(declare-fun m!1016399 () Bool)

(assert (=> b!1097387 m!1016399))

(assert (=> b!1097387 m!1016391))

(declare-fun m!1016401 () Bool)

(assert (=> b!1097387 m!1016401))

(assert (=> b!1097387 m!1016397))

(declare-fun m!1016403 () Bool)

(assert (=> b!1097387 m!1016403))

(assert (=> b!1097387 m!1016183))

(declare-fun m!1016405 () Bool)

(assert (=> b!1097387 m!1016405))

(assert (=> b!1097387 m!1016403))

(declare-fun m!1016407 () Bool)

(assert (=> b!1097387 m!1016407))

(declare-fun m!1016409 () Bool)

(assert (=> b!1097389 m!1016409))

(assert (=> b!1097392 m!1016391))

(assert (=> b!1097392 m!1016391))

(assert (=> b!1097392 m!1016393))

(declare-fun m!1016411 () Bool)

(assert (=> b!1097388 m!1016411))

(declare-fun m!1016413 () Bool)

(assert (=> d!130155 m!1016413))

(assert (=> d!130155 m!1016203))

(assert (=> bm!45765 m!1016411))

(assert (=> b!1097390 m!1016183))

(assert (=> b!1097390 m!1016403))

(assert (=> b!1097390 m!1016183))

(assert (=> b!1097390 m!1016405))

(assert (=> b!1097390 m!1016403))

(assert (=> b!1097390 m!1016391))

(assert (=> b!1097390 m!1016391))

(declare-fun m!1016415 () Bool)

(assert (=> b!1097390 m!1016415))

(declare-fun m!1016417 () Bool)

(assert (=> b!1097383 m!1016417))

(assert (=> b!1097172 d!130155))

(declare-fun bm!45770 () Bool)

(declare-fun call!45774 () ListLongMap!15321)

(assert (=> bm!45770 (= call!45774 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun e!626320 () Bool)

(declare-fun call!45773 () ListLongMap!15321)

(declare-fun b!1097400 () Bool)

(assert (=> b!1097400 (= e!626320 (= call!45773 (-!916 call!45774 k0!904)))))

(assert (=> b!1097400 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34735 _values!874)))))

(declare-fun b!1097401 () Bool)

(assert (=> b!1097401 (= e!626320 (= call!45773 call!45774))))

(assert (=> b!1097401 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34735 _values!874)))))

(declare-fun b!1097402 () Bool)

(declare-fun e!626321 () Bool)

(assert (=> b!1097402 (= e!626321 e!626320)))

(declare-fun c!108355 () Bool)

(assert (=> b!1097402 (= c!108355 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun bm!45771 () Bool)

(assert (=> bm!45771 (= call!45773 (getCurrentListMapNoExtraKeys!4209 (array!71049 (store (arr!34196 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34734 _keys!1070)) (array!71051 (store (arr!34197 _values!874) i!650 (ValueCellFull!12848 (dynLambda!2278 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34735 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun d!130157 () Bool)

(assert (=> d!130157 e!626321))

(declare-fun res!732462 () Bool)

(assert (=> d!130157 (=> (not res!732462) (not e!626321))))

(assert (=> d!130157 (= res!732462 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34734 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34734 _keys!1070))))))))

(declare-fun lt!490458 () Unit!35939)

(declare-fun choose!1769 (array!71048 array!71050 (_ BitVec 32) (_ BitVec 32) V!41281 V!41281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35939)

(assert (=> d!130157 (= lt!490458 (choose!1769 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130157 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34734 _keys!1070)))))

(assert (=> d!130157 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!191 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!490458)))

(assert (= (and d!130157 res!732462) b!1097402))

(assert (= (and b!1097402 c!108355) b!1097400))

(assert (= (and b!1097402 (not c!108355)) b!1097401))

(assert (= (or b!1097400 b!1097401) bm!45770))

(assert (= (or b!1097400 b!1097401) bm!45771))

(declare-fun b_lambda!17715 () Bool)

(assert (=> (not b_lambda!17715) (not bm!45771)))

(assert (=> bm!45771 t!34048))

(declare-fun b_and!36785 () Bool)

(assert (= b_and!36783 (and (=> t!34048 result!16377) b_and!36785)))

(assert (=> bm!45770 m!1016201))

(declare-fun m!1016419 () Bool)

(assert (=> b!1097400 m!1016419))

(assert (=> bm!45771 m!1016177))

(assert (=> bm!45771 m!1016183))

(assert (=> bm!45771 m!1016185))

(declare-fun m!1016421 () Bool)

(assert (=> bm!45771 m!1016421))

(declare-fun m!1016423 () Bool)

(assert (=> d!130157 m!1016423))

(assert (=> b!1097172 d!130157))

(declare-fun d!130159 () Bool)

(declare-fun lt!490461 () ListLongMap!15321)

(assert (=> d!130159 (not (contains!6348 lt!490461 k0!904))))

(declare-fun removeStrictlySorted!77 (List!23947 (_ BitVec 64)) List!23947)

(assert (=> d!130159 (= lt!490461 (ListLongMap!15322 (removeStrictlySorted!77 (toList!7676 lt!490296) k0!904)))))

(assert (=> d!130159 (= (-!916 lt!490296 k0!904) lt!490461)))

(declare-fun bs!32225 () Bool)

(assert (= bs!32225 d!130159))

(declare-fun m!1016425 () Bool)

(assert (=> bs!32225 m!1016425))

(declare-fun m!1016427 () Bool)

(assert (=> bs!32225 m!1016427))

(assert (=> b!1097172 d!130159))

(declare-fun b!1097403 () Bool)

(declare-fun e!626322 () Unit!35939)

(declare-fun lt!490472 () Unit!35939)

(assert (=> b!1097403 (= e!626322 lt!490472)))

(declare-fun lt!490463 () ListLongMap!15321)

(assert (=> b!1097403 (= lt!490463 (getCurrentListMapNoExtraKeys!4209 lt!490290 lt!490291 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490471 () (_ BitVec 64))

(assert (=> b!1097403 (= lt!490471 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490481 () (_ BitVec 64))

(assert (=> b!1097403 (= lt!490481 (select (arr!34196 lt!490290) #b00000000000000000000000000000000))))

(declare-fun lt!490474 () Unit!35939)

(assert (=> b!1097403 (= lt!490474 (addStillContains!649 lt!490463 lt!490471 zeroValue!831 lt!490481))))

(assert (=> b!1097403 (contains!6348 (+!3388 lt!490463 (tuple2!17353 lt!490471 zeroValue!831)) lt!490481)))

(declare-fun lt!490483 () Unit!35939)

(assert (=> b!1097403 (= lt!490483 lt!490474)))

(declare-fun lt!490464 () ListLongMap!15321)

(assert (=> b!1097403 (= lt!490464 (getCurrentListMapNoExtraKeys!4209 lt!490290 lt!490291 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490467 () (_ BitVec 64))

(assert (=> b!1097403 (= lt!490467 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490468 () (_ BitVec 64))

(assert (=> b!1097403 (= lt!490468 (select (arr!34196 lt!490290) #b00000000000000000000000000000000))))

(declare-fun lt!490466 () Unit!35939)

(assert (=> b!1097403 (= lt!490466 (addApplyDifferent!505 lt!490464 lt!490467 minValue!831 lt!490468))))

(assert (=> b!1097403 (= (apply!936 (+!3388 lt!490464 (tuple2!17353 lt!490467 minValue!831)) lt!490468) (apply!936 lt!490464 lt!490468))))

(declare-fun lt!490482 () Unit!35939)

(assert (=> b!1097403 (= lt!490482 lt!490466)))

(declare-fun lt!490478 () ListLongMap!15321)

(assert (=> b!1097403 (= lt!490478 (getCurrentListMapNoExtraKeys!4209 lt!490290 lt!490291 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490475 () (_ BitVec 64))

(assert (=> b!1097403 (= lt!490475 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490469 () (_ BitVec 64))

(assert (=> b!1097403 (= lt!490469 (select (arr!34196 lt!490290) #b00000000000000000000000000000000))))

(declare-fun lt!490462 () Unit!35939)

(assert (=> b!1097403 (= lt!490462 (addApplyDifferent!505 lt!490478 lt!490475 zeroValue!831 lt!490469))))

(assert (=> b!1097403 (= (apply!936 (+!3388 lt!490478 (tuple2!17353 lt!490475 zeroValue!831)) lt!490469) (apply!936 lt!490478 lt!490469))))

(declare-fun lt!490477 () Unit!35939)

(assert (=> b!1097403 (= lt!490477 lt!490462)))

(declare-fun lt!490473 () ListLongMap!15321)

(assert (=> b!1097403 (= lt!490473 (getCurrentListMapNoExtraKeys!4209 lt!490290 lt!490291 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490479 () (_ BitVec 64))

(assert (=> b!1097403 (= lt!490479 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490480 () (_ BitVec 64))

(assert (=> b!1097403 (= lt!490480 (select (arr!34196 lt!490290) #b00000000000000000000000000000000))))

(assert (=> b!1097403 (= lt!490472 (addApplyDifferent!505 lt!490473 lt!490479 minValue!831 lt!490480))))

(assert (=> b!1097403 (= (apply!936 (+!3388 lt!490473 (tuple2!17353 lt!490479 minValue!831)) lt!490480) (apply!936 lt!490473 lt!490480))))

(declare-fun b!1097404 () Bool)

(declare-fun e!626327 () Bool)

(assert (=> b!1097404 (= e!626327 (validKeyInArray!0 (select (arr!34196 lt!490290) #b00000000000000000000000000000000)))))

(declare-fun b!1097405 () Bool)

(declare-fun e!626326 () Bool)

(declare-fun e!626330 () Bool)

(assert (=> b!1097405 (= e!626326 e!626330)))

(declare-fun res!732465 () Bool)

(declare-fun call!45776 () Bool)

(assert (=> b!1097405 (= res!732465 call!45776)))

(assert (=> b!1097405 (=> (not res!732465) (not e!626330))))

(declare-fun bm!45773 () Bool)

(declare-fun call!45777 () ListLongMap!15321)

(declare-fun call!45779 () ListLongMap!15321)

(assert (=> bm!45773 (= call!45777 call!45779)))

(declare-fun b!1097406 () Bool)

(declare-fun e!626333 () ListLongMap!15321)

(assert (=> b!1097406 (= e!626333 call!45777)))

(declare-fun b!1097407 () Bool)

(declare-fun e!626334 () Bool)

(declare-fun lt!490476 () ListLongMap!15321)

(assert (=> b!1097407 (= e!626334 (= (apply!936 lt!490476 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1097408 () Bool)

(declare-fun res!732464 () Bool)

(declare-fun e!626323 () Bool)

(assert (=> b!1097408 (=> (not res!732464) (not e!626323))))

(assert (=> b!1097408 (= res!732464 e!626326)))

(declare-fun c!108356 () Bool)

(assert (=> b!1097408 (= c!108356 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1097409 () Bool)

(declare-fun Unit!35944 () Unit!35939)

(assert (=> b!1097409 (= e!626322 Unit!35944)))

(declare-fun b!1097410 () Bool)

(declare-fun e!626328 () ListLongMap!15321)

(assert (=> b!1097410 (= e!626328 e!626333)))

(declare-fun c!108357 () Bool)

(assert (=> b!1097410 (= c!108357 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1097411 () Bool)

(declare-fun e!626331 () Bool)

(assert (=> b!1097411 (= e!626331 e!626334)))

(declare-fun res!732468 () Bool)

(declare-fun call!45775 () Bool)

(assert (=> b!1097411 (= res!732468 call!45775)))

(assert (=> b!1097411 (=> (not res!732468) (not e!626334))))

(declare-fun b!1097412 () Bool)

(declare-fun res!732463 () Bool)

(assert (=> b!1097412 (=> (not res!732463) (not e!626323))))

(declare-fun e!626325 () Bool)

(assert (=> b!1097412 (= res!732463 e!626325)))

(declare-fun res!732467 () Bool)

(assert (=> b!1097412 (=> res!732467 e!626325)))

(assert (=> b!1097412 (= res!732467 (not e!626327))))

(declare-fun res!732471 () Bool)

(assert (=> b!1097412 (=> (not res!732471) (not e!626327))))

(assert (=> b!1097412 (= res!732471 (bvslt #b00000000000000000000000000000000 (size!34734 lt!490290)))))

(declare-fun b!1097413 () Bool)

(declare-fun e!626329 () Bool)

(assert (=> b!1097413 (= e!626325 e!626329)))

(declare-fun res!732470 () Bool)

(assert (=> b!1097413 (=> (not res!732470) (not e!626329))))

(assert (=> b!1097413 (= res!732470 (contains!6348 lt!490476 (select (arr!34196 lt!490290) #b00000000000000000000000000000000)))))

(assert (=> b!1097413 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34734 lt!490290)))))

(declare-fun b!1097414 () Bool)

(assert (=> b!1097414 (= e!626326 (not call!45776))))

(declare-fun bm!45772 () Bool)

(assert (=> bm!45772 (= call!45775 (contains!6348 lt!490476 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!130161 () Bool)

(assert (=> d!130161 e!626323))

(declare-fun res!732466 () Bool)

(assert (=> d!130161 (=> (not res!732466) (not e!626323))))

(assert (=> d!130161 (= res!732466 (or (bvsge #b00000000000000000000000000000000 (size!34734 lt!490290)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34734 lt!490290)))))))

(declare-fun lt!490470 () ListLongMap!15321)

(assert (=> d!130161 (= lt!490476 lt!490470)))

(declare-fun lt!490465 () Unit!35939)

(assert (=> d!130161 (= lt!490465 e!626322)))

(declare-fun c!108358 () Bool)

(declare-fun e!626324 () Bool)

(assert (=> d!130161 (= c!108358 e!626324)))

(declare-fun res!732469 () Bool)

(assert (=> d!130161 (=> (not res!732469) (not e!626324))))

(assert (=> d!130161 (= res!732469 (bvslt #b00000000000000000000000000000000 (size!34734 lt!490290)))))

(assert (=> d!130161 (= lt!490470 e!626328)))

(declare-fun c!108361 () Bool)

(assert (=> d!130161 (= c!108361 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130161 (validMask!0 mask!1414)))

(assert (=> d!130161 (= (getCurrentListMap!4302 lt!490290 lt!490291 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490476)))

(declare-fun b!1097415 () Bool)

(assert (=> b!1097415 (= e!626329 (= (apply!936 lt!490476 (select (arr!34196 lt!490290) #b00000000000000000000000000000000)) (get!17606 (select (arr!34197 lt!490291) #b00000000000000000000000000000000) (dynLambda!2278 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1097415 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34735 lt!490291)))))

(assert (=> b!1097415 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34734 lt!490290)))))

(declare-fun b!1097416 () Bool)

(declare-fun c!108359 () Bool)

(assert (=> b!1097416 (= c!108359 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!626332 () ListLongMap!15321)

(assert (=> b!1097416 (= e!626333 e!626332)))

(declare-fun bm!45774 () Bool)

(declare-fun call!45781 () ListLongMap!15321)

(assert (=> bm!45774 (= call!45781 (getCurrentListMapNoExtraKeys!4209 lt!490290 lt!490291 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1097417 () Bool)

(declare-fun call!45780 () ListLongMap!15321)

(assert (=> b!1097417 (= e!626332 call!45780)))

(declare-fun b!1097418 () Bool)

(assert (=> b!1097418 (= e!626332 call!45777)))

(declare-fun call!45778 () ListLongMap!15321)

(declare-fun bm!45775 () Bool)

(assert (=> bm!45775 (= call!45779 (+!3388 (ite c!108361 call!45781 (ite c!108357 call!45778 call!45780)) (ite (or c!108361 c!108357) (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1097419 () Bool)

(assert (=> b!1097419 (= e!626323 e!626331)))

(declare-fun c!108360 () Bool)

(assert (=> b!1097419 (= c!108360 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1097420 () Bool)

(assert (=> b!1097420 (= e!626324 (validKeyInArray!0 (select (arr!34196 lt!490290) #b00000000000000000000000000000000)))))

(declare-fun bm!45776 () Bool)

(assert (=> bm!45776 (= call!45780 call!45778)))

(declare-fun b!1097421 () Bool)

(assert (=> b!1097421 (= e!626330 (= (apply!936 lt!490476 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1097422 () Bool)

(assert (=> b!1097422 (= e!626328 (+!3388 call!45779 (tuple2!17353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun bm!45777 () Bool)

(assert (=> bm!45777 (= call!45776 (contains!6348 lt!490476 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45778 () Bool)

(assert (=> bm!45778 (= call!45778 call!45781)))

(declare-fun b!1097423 () Bool)

(assert (=> b!1097423 (= e!626331 (not call!45775))))

(assert (= (and d!130161 c!108361) b!1097422))

(assert (= (and d!130161 (not c!108361)) b!1097410))

(assert (= (and b!1097410 c!108357) b!1097406))

(assert (= (and b!1097410 (not c!108357)) b!1097416))

(assert (= (and b!1097416 c!108359) b!1097418))

(assert (= (and b!1097416 (not c!108359)) b!1097417))

(assert (= (or b!1097418 b!1097417) bm!45776))

(assert (= (or b!1097406 bm!45776) bm!45778))

(assert (= (or b!1097406 b!1097418) bm!45773))

(assert (= (or b!1097422 bm!45778) bm!45774))

(assert (= (or b!1097422 bm!45773) bm!45775))

(assert (= (and d!130161 res!732469) b!1097420))

(assert (= (and d!130161 c!108358) b!1097403))

(assert (= (and d!130161 (not c!108358)) b!1097409))

(assert (= (and d!130161 res!732466) b!1097412))

(assert (= (and b!1097412 res!732471) b!1097404))

(assert (= (and b!1097412 (not res!732467)) b!1097413))

(assert (= (and b!1097413 res!732470) b!1097415))

(assert (= (and b!1097412 res!732463) b!1097408))

(assert (= (and b!1097408 c!108356) b!1097405))

(assert (= (and b!1097408 (not c!108356)) b!1097414))

(assert (= (and b!1097405 res!732465) b!1097421))

(assert (= (or b!1097405 b!1097414) bm!45777))

(assert (= (and b!1097408 res!732464) b!1097419))

(assert (= (and b!1097419 c!108360) b!1097411))

(assert (= (and b!1097419 (not c!108360)) b!1097423))

(assert (= (and b!1097411 res!732468) b!1097407))

(assert (= (or b!1097411 b!1097423) bm!45772))

(declare-fun b_lambda!17717 () Bool)

(assert (=> (not b_lambda!17717) (not b!1097415)))

(assert (=> b!1097415 t!34048))

(declare-fun b_and!36787 () Bool)

(assert (= b_and!36785 (and (=> t!34048 result!16377) b_and!36787)))

(assert (=> bm!45774 m!1016197))

(assert (=> d!130161 m!1016203))

(assert (=> b!1097415 m!1016403))

(assert (=> b!1097415 m!1016183))

(assert (=> b!1097415 m!1016391))

(declare-fun m!1016429 () Bool)

(assert (=> b!1097415 m!1016429))

(assert (=> b!1097415 m!1016391))

(assert (=> b!1097415 m!1016403))

(assert (=> b!1097415 m!1016183))

(assert (=> b!1097415 m!1016405))

(declare-fun m!1016431 () Bool)

(assert (=> b!1097422 m!1016431))

(declare-fun m!1016433 () Bool)

(assert (=> bm!45777 m!1016433))

(declare-fun m!1016435 () Bool)

(assert (=> bm!45772 m!1016435))

(declare-fun m!1016437 () Bool)

(assert (=> b!1097407 m!1016437))

(declare-fun m!1016439 () Bool)

(assert (=> bm!45775 m!1016439))

(assert (=> b!1097413 m!1016391))

(assert (=> b!1097413 m!1016391))

(declare-fun m!1016441 () Bool)

(assert (=> b!1097413 m!1016441))

(declare-fun m!1016443 () Bool)

(assert (=> b!1097421 m!1016443))

(declare-fun m!1016445 () Bool)

(assert (=> b!1097403 m!1016445))

(declare-fun m!1016447 () Bool)

(assert (=> b!1097403 m!1016447))

(declare-fun m!1016449 () Bool)

(assert (=> b!1097403 m!1016449))

(declare-fun m!1016451 () Bool)

(assert (=> b!1097403 m!1016451))

(declare-fun m!1016453 () Bool)

(assert (=> b!1097403 m!1016453))

(declare-fun m!1016455 () Bool)

(assert (=> b!1097403 m!1016455))

(declare-fun m!1016457 () Bool)

(assert (=> b!1097403 m!1016457))

(declare-fun m!1016459 () Bool)

(assert (=> b!1097403 m!1016459))

(assert (=> b!1097403 m!1016445))

(declare-fun m!1016461 () Bool)

(assert (=> b!1097403 m!1016461))

(assert (=> b!1097403 m!1016447))

(assert (=> b!1097403 m!1016457))

(declare-fun m!1016463 () Bool)

(assert (=> b!1097403 m!1016463))

(declare-fun m!1016465 () Bool)

(assert (=> b!1097403 m!1016465))

(assert (=> b!1097403 m!1016197))

(assert (=> b!1097403 m!1016453))

(declare-fun m!1016467 () Bool)

(assert (=> b!1097403 m!1016467))

(declare-fun m!1016469 () Bool)

(assert (=> b!1097403 m!1016469))

(declare-fun m!1016471 () Bool)

(assert (=> b!1097403 m!1016471))

(assert (=> b!1097403 m!1016391))

(declare-fun m!1016473 () Bool)

(assert (=> b!1097403 m!1016473))

(assert (=> b!1097420 m!1016391))

(assert (=> b!1097420 m!1016391))

(assert (=> b!1097420 m!1016393))

(assert (=> b!1097404 m!1016391))

(assert (=> b!1097404 m!1016391))

(assert (=> b!1097404 m!1016393))

(assert (=> b!1097172 d!130161))

(declare-fun b!1097424 () Bool)

(declare-fun e!626340 () ListLongMap!15321)

(declare-fun call!45782 () ListLongMap!15321)

(assert (=> b!1097424 (= e!626340 call!45782)))

(declare-fun b!1097425 () Bool)

(declare-fun e!626337 () Bool)

(declare-fun lt!490486 () ListLongMap!15321)

(assert (=> b!1097425 (= e!626337 (isEmpty!966 lt!490486))))

(declare-fun b!1097426 () Bool)

(declare-fun e!626339 () ListLongMap!15321)

(assert (=> b!1097426 (= e!626339 (ListLongMap!15322 Nil!23944))))

(declare-fun d!130163 () Bool)

(declare-fun e!626335 () Bool)

(assert (=> d!130163 e!626335))

(declare-fun res!732473 () Bool)

(assert (=> d!130163 (=> (not res!732473) (not e!626335))))

(assert (=> d!130163 (= res!732473 (not (contains!6348 lt!490486 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130163 (= lt!490486 e!626339)))

(declare-fun c!108362 () Bool)

(assert (=> d!130163 (= c!108362 (bvsge #b00000000000000000000000000000000 (size!34734 _keys!1070)))))

(assert (=> d!130163 (validMask!0 mask!1414)))

(assert (=> d!130163 (= (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490486)))

(declare-fun b!1097427 () Bool)

(declare-fun e!626341 () Bool)

(assert (=> b!1097427 (= e!626341 (validKeyInArray!0 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1097427 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1097428 () Bool)

(declare-fun e!626338 () Bool)

(assert (=> b!1097428 (= e!626338 e!626337)))

(declare-fun c!108365 () Bool)

(assert (=> b!1097428 (= c!108365 (bvslt #b00000000000000000000000000000000 (size!34734 _keys!1070)))))

(declare-fun b!1097429 () Bool)

(declare-fun lt!490488 () Unit!35939)

(declare-fun lt!490490 () Unit!35939)

(assert (=> b!1097429 (= lt!490488 lt!490490)))

(declare-fun lt!490487 () V!41281)

(declare-fun lt!490484 () ListLongMap!15321)

(declare-fun lt!490485 () (_ BitVec 64))

(declare-fun lt!490489 () (_ BitVec 64))

(assert (=> b!1097429 (not (contains!6348 (+!3388 lt!490484 (tuple2!17353 lt!490485 lt!490487)) lt!490489))))

(assert (=> b!1097429 (= lt!490490 (addStillNotContains!272 lt!490484 lt!490485 lt!490487 lt!490489))))

(assert (=> b!1097429 (= lt!490489 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1097429 (= lt!490487 (get!17606 (select (arr!34197 _values!874) #b00000000000000000000000000000000) (dynLambda!2278 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1097429 (= lt!490485 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1097429 (= lt!490484 call!45782)))

(assert (=> b!1097429 (= e!626340 (+!3388 call!45782 (tuple2!17353 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000) (get!17606 (select (arr!34197 _values!874) #b00000000000000000000000000000000) (dynLambda!2278 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1097430 () Bool)

(assert (=> b!1097430 (= e!626337 (= lt!490486 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1097431 () Bool)

(declare-fun res!732474 () Bool)

(assert (=> b!1097431 (=> (not res!732474) (not e!626335))))

(assert (=> b!1097431 (= res!732474 (not (contains!6348 lt!490486 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1097432 () Bool)

(assert (=> b!1097432 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34734 _keys!1070)))))

(assert (=> b!1097432 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34735 _values!874)))))

(declare-fun e!626336 () Bool)

(assert (=> b!1097432 (= e!626336 (= (apply!936 lt!490486 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000)) (get!17606 (select (arr!34197 _values!874) #b00000000000000000000000000000000) (dynLambda!2278 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!45779 () Bool)

(assert (=> bm!45779 (= call!45782 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1097433 () Bool)

(assert (=> b!1097433 (= e!626335 e!626338)))

(declare-fun c!108363 () Bool)

(assert (=> b!1097433 (= c!108363 e!626341)))

(declare-fun res!732472 () Bool)

(assert (=> b!1097433 (=> (not res!732472) (not e!626341))))

(assert (=> b!1097433 (= res!732472 (bvslt #b00000000000000000000000000000000 (size!34734 _keys!1070)))))

(declare-fun b!1097434 () Bool)

(assert (=> b!1097434 (= e!626339 e!626340)))

(declare-fun c!108364 () Bool)

(assert (=> b!1097434 (= c!108364 (validKeyInArray!0 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097435 () Bool)

(assert (=> b!1097435 (= e!626338 e!626336)))

(assert (=> b!1097435 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34734 _keys!1070)))))

(declare-fun res!732475 () Bool)

(assert (=> b!1097435 (= res!732475 (contains!6348 lt!490486 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1097435 (=> (not res!732475) (not e!626336))))

(assert (= (and d!130163 c!108362) b!1097426))

(assert (= (and d!130163 (not c!108362)) b!1097434))

(assert (= (and b!1097434 c!108364) b!1097429))

(assert (= (and b!1097434 (not c!108364)) b!1097424))

(assert (= (or b!1097429 b!1097424) bm!45779))

(assert (= (and d!130163 res!732473) b!1097431))

(assert (= (and b!1097431 res!732474) b!1097433))

(assert (= (and b!1097433 res!732472) b!1097427))

(assert (= (and b!1097433 c!108363) b!1097435))

(assert (= (and b!1097433 (not c!108363)) b!1097428))

(assert (= (and b!1097435 res!732475) b!1097432))

(assert (= (and b!1097428 c!108365) b!1097430))

(assert (= (and b!1097428 (not c!108365)) b!1097425))

(declare-fun b_lambda!17719 () Bool)

(assert (=> (not b_lambda!17719) (not b!1097429)))

(assert (=> b!1097429 t!34048))

(declare-fun b_and!36789 () Bool)

(assert (= b_and!36787 (and (=> t!34048 result!16377) b_and!36789)))

(declare-fun b_lambda!17721 () Bool)

(assert (=> (not b_lambda!17721) (not b!1097432)))

(assert (=> b!1097432 t!34048))

(declare-fun b_and!36791 () Bool)

(assert (= b_and!36789 (and (=> t!34048 result!16377) b_and!36791)))

(assert (=> b!1097427 m!1016307))

(assert (=> b!1097427 m!1016307))

(assert (=> b!1097427 m!1016311))

(assert (=> b!1097435 m!1016307))

(assert (=> b!1097435 m!1016307))

(declare-fun m!1016475 () Bool)

(assert (=> b!1097435 m!1016475))

(assert (=> b!1097429 m!1016183))

(declare-fun m!1016477 () Bool)

(assert (=> b!1097429 m!1016477))

(declare-fun m!1016479 () Bool)

(assert (=> b!1097429 m!1016479))

(assert (=> b!1097429 m!1016307))

(declare-fun m!1016481 () Bool)

(assert (=> b!1097429 m!1016481))

(assert (=> b!1097429 m!1016477))

(assert (=> b!1097429 m!1016341))

(assert (=> b!1097429 m!1016183))

(assert (=> b!1097429 m!1016345))

(assert (=> b!1097429 m!1016341))

(declare-fun m!1016483 () Bool)

(assert (=> b!1097429 m!1016483))

(declare-fun m!1016485 () Bool)

(assert (=> b!1097431 m!1016485))

(assert (=> b!1097434 m!1016307))

(assert (=> b!1097434 m!1016307))

(assert (=> b!1097434 m!1016311))

(declare-fun m!1016487 () Bool)

(assert (=> b!1097430 m!1016487))

(declare-fun m!1016489 () Bool)

(assert (=> d!130163 m!1016489))

(assert (=> d!130163 m!1016203))

(assert (=> bm!45779 m!1016487))

(assert (=> b!1097432 m!1016183))

(assert (=> b!1097432 m!1016341))

(assert (=> b!1097432 m!1016183))

(assert (=> b!1097432 m!1016345))

(assert (=> b!1097432 m!1016341))

(assert (=> b!1097432 m!1016307))

(assert (=> b!1097432 m!1016307))

(declare-fun m!1016491 () Bool)

(assert (=> b!1097432 m!1016491))

(declare-fun m!1016493 () Bool)

(assert (=> b!1097425 m!1016493))

(assert (=> b!1097172 d!130163))

(declare-fun d!130165 () Bool)

(assert (=> d!130165 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490493 () Unit!35939)

(declare-fun choose!13 (array!71048 (_ BitVec 64) (_ BitVec 32)) Unit!35939)

(assert (=> d!130165 (= lt!490493 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130165 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130165 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!490493)))

(declare-fun bs!32226 () Bool)

(assert (= bs!32226 d!130165))

(assert (=> bs!32226 m!1016187))

(declare-fun m!1016495 () Bool)

(assert (=> bs!32226 m!1016495))

(assert (=> b!1097172 d!130165))

(declare-fun b!1097444 () Bool)

(declare-fun e!626350 () Bool)

(declare-fun e!626349 () Bool)

(assert (=> b!1097444 (= e!626350 e!626349)))

(declare-fun lt!490501 () (_ BitVec 64))

(assert (=> b!1097444 (= lt!490501 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490500 () Unit!35939)

(assert (=> b!1097444 (= lt!490500 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!490501 #b00000000000000000000000000000000))))

(assert (=> b!1097444 (arrayContainsKey!0 _keys!1070 lt!490501 #b00000000000000000000000000000000)))

(declare-fun lt!490502 () Unit!35939)

(assert (=> b!1097444 (= lt!490502 lt!490500)))

(declare-fun res!732480 () Bool)

(declare-datatypes ((SeekEntryResult!9905 0))(
  ( (MissingZero!9905 (index!41991 (_ BitVec 32))) (Found!9905 (index!41992 (_ BitVec 32))) (Intermediate!9905 (undefined!10717 Bool) (index!41993 (_ BitVec 32)) (x!98706 (_ BitVec 32))) (Undefined!9905) (MissingVacant!9905 (index!41994 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71048 (_ BitVec 32)) SeekEntryResult!9905)

(assert (=> b!1097444 (= res!732480 (= (seekEntryOrOpen!0 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9905 #b00000000000000000000000000000000)))))

(assert (=> b!1097444 (=> (not res!732480) (not e!626349))))

(declare-fun bm!45782 () Bool)

(declare-fun call!45785 () Bool)

(assert (=> bm!45782 (= call!45785 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1097445 () Bool)

(assert (=> b!1097445 (= e!626350 call!45785)))

(declare-fun b!1097446 () Bool)

(declare-fun e!626348 () Bool)

(assert (=> b!1097446 (= e!626348 e!626350)))

(declare-fun c!108368 () Bool)

(assert (=> b!1097446 (= c!108368 (validKeyInArray!0 (select (arr!34196 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097447 () Bool)

(assert (=> b!1097447 (= e!626349 call!45785)))

(declare-fun d!130167 () Bool)

(declare-fun res!732481 () Bool)

(assert (=> d!130167 (=> res!732481 e!626348)))

(assert (=> d!130167 (= res!732481 (bvsge #b00000000000000000000000000000000 (size!34734 _keys!1070)))))

(assert (=> d!130167 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!626348)))

(assert (= (and d!130167 (not res!732481)) b!1097446))

(assert (= (and b!1097446 c!108368) b!1097444))

(assert (= (and b!1097446 (not c!108368)) b!1097445))

(assert (= (and b!1097444 res!732480) b!1097447))

(assert (= (or b!1097447 b!1097445) bm!45782))

(assert (=> b!1097444 m!1016307))

(declare-fun m!1016497 () Bool)

(assert (=> b!1097444 m!1016497))

(declare-fun m!1016499 () Bool)

(assert (=> b!1097444 m!1016499))

(assert (=> b!1097444 m!1016307))

(declare-fun m!1016501 () Bool)

(assert (=> b!1097444 m!1016501))

(declare-fun m!1016503 () Bool)

(assert (=> bm!45782 m!1016503))

(assert (=> b!1097446 m!1016307))

(assert (=> b!1097446 m!1016307))

(assert (=> b!1097446 m!1016311))

(assert (=> b!1097174 d!130167))

(declare-fun d!130169 () Bool)

(declare-fun res!732483 () Bool)

(declare-fun e!626354 () Bool)

(assert (=> d!130169 (=> res!732483 e!626354)))

(assert (=> d!130169 (= res!732483 (bvsge #b00000000000000000000000000000000 (size!34734 lt!490290)))))

(assert (=> d!130169 (= (arrayNoDuplicates!0 lt!490290 #b00000000000000000000000000000000 Nil!23945) e!626354)))

(declare-fun b!1097448 () Bool)

(declare-fun e!626353 () Bool)

(declare-fun call!45786 () Bool)

(assert (=> b!1097448 (= e!626353 call!45786)))

(declare-fun b!1097449 () Bool)

(assert (=> b!1097449 (= e!626353 call!45786)))

(declare-fun bm!45783 () Bool)

(declare-fun c!108369 () Bool)

(assert (=> bm!45783 (= call!45786 (arrayNoDuplicates!0 lt!490290 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108369 (Cons!23944 (select (arr!34196 lt!490290) #b00000000000000000000000000000000) Nil!23945) Nil!23945)))))

(declare-fun b!1097450 () Bool)

(declare-fun e!626351 () Bool)

(assert (=> b!1097450 (= e!626351 e!626353)))

(assert (=> b!1097450 (= c!108369 (validKeyInArray!0 (select (arr!34196 lt!490290) #b00000000000000000000000000000000)))))

(declare-fun b!1097451 () Bool)

(declare-fun e!626352 () Bool)

(assert (=> b!1097451 (= e!626352 (contains!6347 Nil!23945 (select (arr!34196 lt!490290) #b00000000000000000000000000000000)))))

(declare-fun b!1097452 () Bool)

(assert (=> b!1097452 (= e!626354 e!626351)))

(declare-fun res!732484 () Bool)

(assert (=> b!1097452 (=> (not res!732484) (not e!626351))))

(assert (=> b!1097452 (= res!732484 (not e!626352))))

(declare-fun res!732482 () Bool)

(assert (=> b!1097452 (=> (not res!732482) (not e!626352))))

(assert (=> b!1097452 (= res!732482 (validKeyInArray!0 (select (arr!34196 lt!490290) #b00000000000000000000000000000000)))))

(assert (= (and d!130169 (not res!732483)) b!1097452))

(assert (= (and b!1097452 res!732482) b!1097451))

(assert (= (and b!1097452 res!732484) b!1097450))

(assert (= (and b!1097450 c!108369) b!1097449))

(assert (= (and b!1097450 (not c!108369)) b!1097448))

(assert (= (or b!1097449 b!1097448) bm!45783))

(assert (=> bm!45783 m!1016391))

(declare-fun m!1016505 () Bool)

(assert (=> bm!45783 m!1016505))

(assert (=> b!1097450 m!1016391))

(assert (=> b!1097450 m!1016391))

(assert (=> b!1097450 m!1016393))

(assert (=> b!1097451 m!1016391))

(assert (=> b!1097451 m!1016391))

(declare-fun m!1016507 () Bool)

(assert (=> b!1097451 m!1016507))

(assert (=> b!1097452 m!1016391))

(assert (=> b!1097452 m!1016391))

(assert (=> b!1097452 m!1016393))

(assert (=> b!1097179 d!130169))

(declare-fun b!1097453 () Bool)

(declare-fun e!626357 () Bool)

(declare-fun e!626356 () Bool)

(assert (=> b!1097453 (= e!626357 e!626356)))

(declare-fun lt!490504 () (_ BitVec 64))

(assert (=> b!1097453 (= lt!490504 (select (arr!34196 lt!490290) #b00000000000000000000000000000000))))

(declare-fun lt!490503 () Unit!35939)

(assert (=> b!1097453 (= lt!490503 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!490290 lt!490504 #b00000000000000000000000000000000))))

(assert (=> b!1097453 (arrayContainsKey!0 lt!490290 lt!490504 #b00000000000000000000000000000000)))

(declare-fun lt!490505 () Unit!35939)

(assert (=> b!1097453 (= lt!490505 lt!490503)))

(declare-fun res!732485 () Bool)

(assert (=> b!1097453 (= res!732485 (= (seekEntryOrOpen!0 (select (arr!34196 lt!490290) #b00000000000000000000000000000000) lt!490290 mask!1414) (Found!9905 #b00000000000000000000000000000000)))))

(assert (=> b!1097453 (=> (not res!732485) (not e!626356))))

(declare-fun bm!45784 () Bool)

(declare-fun call!45787 () Bool)

(assert (=> bm!45784 (= call!45787 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!490290 mask!1414))))

(declare-fun b!1097454 () Bool)

(assert (=> b!1097454 (= e!626357 call!45787)))

(declare-fun b!1097455 () Bool)

(declare-fun e!626355 () Bool)

(assert (=> b!1097455 (= e!626355 e!626357)))

(declare-fun c!108370 () Bool)

(assert (=> b!1097455 (= c!108370 (validKeyInArray!0 (select (arr!34196 lt!490290) #b00000000000000000000000000000000)))))

(declare-fun b!1097456 () Bool)

(assert (=> b!1097456 (= e!626356 call!45787)))

(declare-fun d!130171 () Bool)

(declare-fun res!732486 () Bool)

(assert (=> d!130171 (=> res!732486 e!626355)))

(assert (=> d!130171 (= res!732486 (bvsge #b00000000000000000000000000000000 (size!34734 lt!490290)))))

(assert (=> d!130171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490290 mask!1414) e!626355)))

(assert (= (and d!130171 (not res!732486)) b!1097455))

(assert (= (and b!1097455 c!108370) b!1097453))

(assert (= (and b!1097455 (not c!108370)) b!1097454))

(assert (= (and b!1097453 res!732485) b!1097456))

(assert (= (or b!1097456 b!1097454) bm!45784))

(assert (=> b!1097453 m!1016391))

(declare-fun m!1016509 () Bool)

(assert (=> b!1097453 m!1016509))

(declare-fun m!1016511 () Bool)

(assert (=> b!1097453 m!1016511))

(assert (=> b!1097453 m!1016391))

(declare-fun m!1016513 () Bool)

(assert (=> b!1097453 m!1016513))

(declare-fun m!1016515 () Bool)

(assert (=> bm!45784 m!1016515))

(assert (=> b!1097455 m!1016391))

(assert (=> b!1097455 m!1016391))

(assert (=> b!1097455 m!1016393))

(assert (=> b!1097178 d!130171))

(declare-fun b!1097463 () Bool)

(declare-fun e!626363 () Bool)

(assert (=> b!1097463 (= e!626363 tp_is_empty!27115)))

(declare-fun condMapEmpty!42442 () Bool)

(declare-fun mapDefault!42442 () ValueCell!12848)

(assert (=> mapNonEmpty!42433 (= condMapEmpty!42442 (= mapRest!42433 ((as const (Array (_ BitVec 32) ValueCell!12848)) mapDefault!42442)))))

(declare-fun e!626362 () Bool)

(declare-fun mapRes!42442 () Bool)

(assert (=> mapNonEmpty!42433 (= tp!81122 (and e!626362 mapRes!42442))))

(declare-fun b!1097464 () Bool)

(assert (=> b!1097464 (= e!626362 tp_is_empty!27115)))

(declare-fun mapNonEmpty!42442 () Bool)

(declare-fun tp!81137 () Bool)

(assert (=> mapNonEmpty!42442 (= mapRes!42442 (and tp!81137 e!626363))))

(declare-fun mapKey!42442 () (_ BitVec 32))

(declare-fun mapRest!42442 () (Array (_ BitVec 32) ValueCell!12848))

(declare-fun mapValue!42442 () ValueCell!12848)

(assert (=> mapNonEmpty!42442 (= mapRest!42433 (store mapRest!42442 mapKey!42442 mapValue!42442))))

(declare-fun mapIsEmpty!42442 () Bool)

(assert (=> mapIsEmpty!42442 mapRes!42442))

(assert (= (and mapNonEmpty!42433 condMapEmpty!42442) mapIsEmpty!42442))

(assert (= (and mapNonEmpty!42433 (not condMapEmpty!42442)) mapNonEmpty!42442))

(assert (= (and mapNonEmpty!42442 ((_ is ValueCellFull!12848) mapValue!42442)) b!1097463))

(assert (= (and mapNonEmpty!42433 ((_ is ValueCellFull!12848) mapDefault!42442)) b!1097464))

(declare-fun m!1016517 () Bool)

(assert (=> mapNonEmpty!42442 m!1016517))

(declare-fun b_lambda!17723 () Bool)

(assert (= b_lambda!17709 (or (and start!96480 b_free!23065) b_lambda!17723)))

(declare-fun b_lambda!17725 () Bool)

(assert (= b_lambda!17715 (or (and start!96480 b_free!23065) b_lambda!17725)))

(declare-fun b_lambda!17727 () Bool)

(assert (= b_lambda!17713 (or (and start!96480 b_free!23065) b_lambda!17727)))

(declare-fun b_lambda!17729 () Bool)

(assert (= b_lambda!17717 (or (and start!96480 b_free!23065) b_lambda!17729)))

(declare-fun b_lambda!17731 () Bool)

(assert (= b_lambda!17721 (or (and start!96480 b_free!23065) b_lambda!17731)))

(declare-fun b_lambda!17733 () Bool)

(assert (= b_lambda!17711 (or (and start!96480 b_free!23065) b_lambda!17733)))

(declare-fun b_lambda!17735 () Bool)

(assert (= b_lambda!17719 (or (and start!96480 b_free!23065) b_lambda!17735)))

(check-sat (not b!1097383) (not b!1097403) (not bm!45772) (not mapNonEmpty!42442) (not b!1097434) (not b!1097404) (not b!1097294) (not d!130163) (not b!1097280) (not b!1097413) (not b!1097337) (not d!130139) (not b_next!23065) (not bm!45777) (not b_lambda!17733) (not b!1097446) (not b!1097393) (not b!1097285) (not b!1097420) (not bm!45765) (not b!1097427) (not bm!45759) (not b!1097429) (not b!1097392) (not bm!45782) (not b!1097288) (not b!1097356) (not b_lambda!17725) (not b!1097407) (not b_lambda!17729) (not b_lambda!17727) (not bm!45771) (not b!1097388) (not b!1097444) (not b!1097355) (not b!1097341) (not b!1097385) (not d!130159) (not bm!45774) (not bm!45761) (not b_lambda!17723) (not b!1097432) (not b!1097453) (not b!1097415) (not b!1097451) (not b!1097387) (not bm!45758) (not d!130155) (not b!1097400) (not b!1097287) (not bm!45741) (not bm!45783) (not b_lambda!17731) (not bm!45775) (not b!1097279) (not b!1097435) (not d!130165) (not b!1097389) (not b!1097354) b_and!36791 (not b!1097338) tp_is_empty!27115 (not b!1097452) (not d!130157) (not b!1097278) (not d!130141) (not bm!45784) (not b!1097425) (not b!1097430) (not b!1097390) (not bm!45779) (not b!1097347) (not b!1097431) (not b!1097349) (not bm!45756) (not b!1097455) (not b!1097286) (not b!1097450) (not d!130161) (not b_lambda!17735) (not b!1097421) (not bm!45770) (not b!1097422) (not d!130153) (not b_lambda!17707))
(check-sat b_and!36791 (not b_next!23065))
