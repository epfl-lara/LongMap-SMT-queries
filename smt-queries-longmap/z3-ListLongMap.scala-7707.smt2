; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96800 () Bool)

(assert start!96800)

(declare-fun b_free!23169 () Bool)

(declare-fun b_next!23169 () Bool)

(assert (=> start!96800 (= b_free!23169 (not b_next!23169))))

(declare-fun tp!81457 () Bool)

(declare-fun b_and!37113 () Bool)

(assert (=> start!96800 (= tp!81457 b_and!37113)))

(declare-fun b!1101177 () Bool)

(declare-fun res!734806 () Bool)

(declare-fun e!628517 () Bool)

(assert (=> b!1101177 (=> (not res!734806) (not e!628517))))

(declare-datatypes ((array!71357 0))(
  ( (array!71358 (arr!34342 (Array (_ BitVec 32) (_ BitVec 64))) (size!34878 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71357)

(declare-datatypes ((List!23994 0))(
  ( (Nil!23991) (Cons!23990 (h!25199 (_ BitVec 64)) (t!34209 List!23994)) )
))
(declare-fun arrayNoDuplicates!0 (array!71357 (_ BitVec 32) List!23994) Bool)

(assert (=> b!1101177 (= res!734806 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23991))))

(declare-fun b!1101178 () Bool)

(declare-fun res!734808 () Bool)

(assert (=> b!1101178 (=> (not res!734808) (not e!628517))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101178 (= res!734808 (validKeyInArray!0 k0!904))))

(declare-datatypes ((V!41419 0))(
  ( (V!41420 (val!13666 Int)) )
))
(declare-datatypes ((tuple2!17378 0))(
  ( (tuple2!17379 (_1!8700 (_ BitVec 64)) (_2!8700 V!41419)) )
))
(declare-datatypes ((List!23995 0))(
  ( (Nil!23992) (Cons!23991 (h!25200 tuple2!17378) (t!34210 List!23995)) )
))
(declare-datatypes ((ListLongMap!15347 0))(
  ( (ListLongMap!15348 (toList!7689 List!23995)) )
))
(declare-fun lt!493625 () ListLongMap!15347)

(declare-fun e!628519 () Bool)

(declare-fun lt!493624 () tuple2!17378)

(declare-fun b!1101179 () Bool)

(declare-fun lt!493623 () ListLongMap!15347)

(declare-fun +!3394 (ListLongMap!15347 tuple2!17378) ListLongMap!15347)

(assert (=> b!1101179 (= e!628519 (= lt!493623 (+!3394 lt!493625 lt!493624)))))

(declare-fun e!628518 () Bool)

(assert (=> b!1101179 e!628518))

(declare-fun res!734809 () Bool)

(assert (=> b!1101179 (=> (not res!734809) (not e!628518))))

(declare-fun lt!493628 () ListLongMap!15347)

(declare-fun lt!493622 () ListLongMap!15347)

(assert (=> b!1101179 (= res!734809 (= lt!493622 (+!3394 lt!493628 lt!493624)))))

(declare-fun minValue!831 () V!41419)

(assert (=> b!1101179 (= lt!493624 (tuple2!17379 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1101180 () Bool)

(declare-fun e!628521 () Bool)

(assert (=> b!1101180 (= e!628517 e!628521)))

(declare-fun res!734800 () Bool)

(assert (=> b!1101180 (=> (not res!734800) (not e!628521))))

(declare-fun lt!493626 () array!71357)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71357 (_ BitVec 32)) Bool)

(assert (=> b!1101180 (= res!734800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493626 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1101180 (= lt!493626 (array!71358 (store (arr!34342 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34878 _keys!1070)))))

(declare-fun lt!493629 () ListLongMap!15347)

(declare-fun b!1101181 () Bool)

(assert (=> b!1101181 (= e!628518 (= lt!493622 (+!3394 lt!493629 lt!493624)))))

(declare-fun b!1101182 () Bool)

(declare-fun res!734804 () Bool)

(assert (=> b!1101182 (=> (not res!734804) (not e!628517))))

(assert (=> b!1101182 (= res!734804 (= (select (arr!34342 _keys!1070) i!650) k0!904))))

(declare-fun b!1101183 () Bool)

(declare-fun e!628514 () Bool)

(declare-fun e!628516 () Bool)

(declare-fun mapRes!42613 () Bool)

(assert (=> b!1101183 (= e!628514 (and e!628516 mapRes!42613))))

(declare-fun condMapEmpty!42613 () Bool)

(declare-datatypes ((ValueCell!12900 0))(
  ( (ValueCellFull!12900 (v!16295 V!41419)) (EmptyCell!12900) )
))
(declare-datatypes ((array!71359 0))(
  ( (array!71360 (arr!34343 (Array (_ BitVec 32) ValueCell!12900)) (size!34879 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71359)

(declare-fun mapDefault!42613 () ValueCell!12900)

(assert (=> b!1101183 (= condMapEmpty!42613 (= (arr!34343 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12900)) mapDefault!42613)))))

(declare-fun mapNonEmpty!42613 () Bool)

(declare-fun tp!81458 () Bool)

(declare-fun e!628520 () Bool)

(assert (=> mapNonEmpty!42613 (= mapRes!42613 (and tp!81458 e!628520))))

(declare-fun mapRest!42613 () (Array (_ BitVec 32) ValueCell!12900))

(declare-fun mapValue!42613 () ValueCell!12900)

(declare-fun mapKey!42613 () (_ BitVec 32))

(assert (=> mapNonEmpty!42613 (= (arr!34343 _values!874) (store mapRest!42613 mapKey!42613 mapValue!42613))))

(declare-fun b!1101184 () Bool)

(declare-fun tp_is_empty!27219 () Bool)

(assert (=> b!1101184 (= e!628516 tp_is_empty!27219)))

(declare-fun b!1101185 () Bool)

(assert (=> b!1101185 (= e!628520 tp_is_empty!27219)))

(declare-fun b!1101186 () Bool)

(declare-fun res!734801 () Bool)

(assert (=> b!1101186 (=> (not res!734801) (not e!628517))))

(assert (=> b!1101186 (= res!734801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42613 () Bool)

(assert (=> mapIsEmpty!42613 mapRes!42613))

(declare-fun res!734807 () Bool)

(assert (=> start!96800 (=> (not res!734807) (not e!628517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96800 (= res!734807 (validMask!0 mask!1414))))

(assert (=> start!96800 e!628517))

(assert (=> start!96800 tp!81457))

(assert (=> start!96800 true))

(assert (=> start!96800 tp_is_empty!27219))

(declare-fun array_inv!26450 (array!71357) Bool)

(assert (=> start!96800 (array_inv!26450 _keys!1070)))

(declare-fun array_inv!26451 (array!71359) Bool)

(assert (=> start!96800 (and (array_inv!26451 _values!874) e!628514)))

(declare-fun b!1101187 () Bool)

(declare-fun res!734802 () Bool)

(assert (=> b!1101187 (=> (not res!734802) (not e!628521))))

(assert (=> b!1101187 (= res!734802 (arrayNoDuplicates!0 lt!493626 #b00000000000000000000000000000000 Nil!23991))))

(declare-fun b!1101188 () Bool)

(declare-fun res!734805 () Bool)

(assert (=> b!1101188 (=> (not res!734805) (not e!628517))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101188 (= res!734805 (and (= (size!34879 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34878 _keys!1070) (size!34879 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1101189 () Bool)

(assert (=> b!1101189 (= e!628521 (not e!628519))))

(declare-fun res!734803 () Bool)

(assert (=> b!1101189 (=> res!734803 e!628519)))

(assert (=> b!1101189 (= res!734803 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41419)

(declare-fun getCurrentListMap!4395 (array!71357 array!71359 (_ BitVec 32) (_ BitVec 32) V!41419 V!41419 (_ BitVec 32) Int) ListLongMap!15347)

(assert (=> b!1101189 (= lt!493623 (getCurrentListMap!4395 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493631 () array!71359)

(assert (=> b!1101189 (= lt!493622 (getCurrentListMap!4395 lt!493626 lt!493631 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1101189 (and (= lt!493628 lt!493629) (= lt!493629 lt!493628))))

(declare-fun -!973 (ListLongMap!15347 (_ BitVec 64)) ListLongMap!15347)

(assert (=> b!1101189 (= lt!493629 (-!973 lt!493625 k0!904))))

(declare-datatypes ((Unit!36194 0))(
  ( (Unit!36195) )
))
(declare-fun lt!493630 () Unit!36194)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!221 (array!71357 array!71359 (_ BitVec 32) (_ BitVec 32) V!41419 V!41419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36194)

(assert (=> b!1101189 (= lt!493630 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!221 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4191 (array!71357 array!71359 (_ BitVec 32) (_ BitVec 32) V!41419 V!41419 (_ BitVec 32) Int) ListLongMap!15347)

(assert (=> b!1101189 (= lt!493628 (getCurrentListMapNoExtraKeys!4191 lt!493626 lt!493631 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2326 (Int (_ BitVec 64)) V!41419)

(assert (=> b!1101189 (= lt!493631 (array!71360 (store (arr!34343 _values!874) i!650 (ValueCellFull!12900 (dynLambda!2326 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34879 _values!874)))))

(assert (=> b!1101189 (= lt!493625 (getCurrentListMapNoExtraKeys!4191 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101189 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493627 () Unit!36194)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71357 (_ BitVec 64) (_ BitVec 32)) Unit!36194)

(assert (=> b!1101189 (= lt!493627 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1101190 () Bool)

(declare-fun res!734810 () Bool)

(assert (=> b!1101190 (=> (not res!734810) (not e!628517))))

(assert (=> b!1101190 (= res!734810 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34878 _keys!1070))))))

(assert (= (and start!96800 res!734807) b!1101188))

(assert (= (and b!1101188 res!734805) b!1101186))

(assert (= (and b!1101186 res!734801) b!1101177))

(assert (= (and b!1101177 res!734806) b!1101190))

(assert (= (and b!1101190 res!734810) b!1101178))

(assert (= (and b!1101178 res!734808) b!1101182))

(assert (= (and b!1101182 res!734804) b!1101180))

(assert (= (and b!1101180 res!734800) b!1101187))

(assert (= (and b!1101187 res!734802) b!1101189))

(assert (= (and b!1101189 (not res!734803)) b!1101179))

(assert (= (and b!1101179 res!734809) b!1101181))

(assert (= (and b!1101183 condMapEmpty!42613) mapIsEmpty!42613))

(assert (= (and b!1101183 (not condMapEmpty!42613)) mapNonEmpty!42613))

(get-info :version)

(assert (= (and mapNonEmpty!42613 ((_ is ValueCellFull!12900) mapValue!42613)) b!1101185))

(assert (= (and b!1101183 ((_ is ValueCellFull!12900) mapDefault!42613)) b!1101184))

(assert (= start!96800 b!1101183))

(declare-fun b_lambda!18067 () Bool)

(assert (=> (not b_lambda!18067) (not b!1101189)))

(declare-fun t!34208 () Bool)

(declare-fun tb!8035 () Bool)

(assert (=> (and start!96800 (= defaultEntry!882 defaultEntry!882) t!34208) tb!8035))

(declare-fun result!16609 () Bool)

(assert (=> tb!8035 (= result!16609 tp_is_empty!27219)))

(assert (=> b!1101189 t!34208))

(declare-fun b_and!37115 () Bool)

(assert (= b_and!37113 (and (=> t!34208 result!16609) b_and!37115)))

(declare-fun m!1021329 () Bool)

(assert (=> b!1101180 m!1021329))

(declare-fun m!1021331 () Bool)

(assert (=> b!1101180 m!1021331))

(declare-fun m!1021333 () Bool)

(assert (=> b!1101182 m!1021333))

(declare-fun m!1021335 () Bool)

(assert (=> mapNonEmpty!42613 m!1021335))

(declare-fun m!1021337 () Bool)

(assert (=> b!1101189 m!1021337))

(declare-fun m!1021339 () Bool)

(assert (=> b!1101189 m!1021339))

(declare-fun m!1021341 () Bool)

(assert (=> b!1101189 m!1021341))

(declare-fun m!1021343 () Bool)

(assert (=> b!1101189 m!1021343))

(declare-fun m!1021345 () Bool)

(assert (=> b!1101189 m!1021345))

(declare-fun m!1021347 () Bool)

(assert (=> b!1101189 m!1021347))

(declare-fun m!1021349 () Bool)

(assert (=> b!1101189 m!1021349))

(declare-fun m!1021351 () Bool)

(assert (=> b!1101189 m!1021351))

(declare-fun m!1021353 () Bool)

(assert (=> b!1101189 m!1021353))

(declare-fun m!1021355 () Bool)

(assert (=> b!1101189 m!1021355))

(declare-fun m!1021357 () Bool)

(assert (=> b!1101187 m!1021357))

(declare-fun m!1021359 () Bool)

(assert (=> start!96800 m!1021359))

(declare-fun m!1021361 () Bool)

(assert (=> start!96800 m!1021361))

(declare-fun m!1021363 () Bool)

(assert (=> start!96800 m!1021363))

(declare-fun m!1021365 () Bool)

(assert (=> b!1101186 m!1021365))

(declare-fun m!1021367 () Bool)

(assert (=> b!1101178 m!1021367))

(declare-fun m!1021369 () Bool)

(assert (=> b!1101177 m!1021369))

(declare-fun m!1021371 () Bool)

(assert (=> b!1101181 m!1021371))

(declare-fun m!1021373 () Bool)

(assert (=> b!1101179 m!1021373))

(declare-fun m!1021375 () Bool)

(assert (=> b!1101179 m!1021375))

(check-sat (not b_next!23169) (not b!1101189) (not b!1101186) (not b!1101187) (not start!96800) (not b_lambda!18067) b_and!37115 (not b!1101178) (not b!1101180) (not b!1101179) (not mapNonEmpty!42613) (not b!1101181) tp_is_empty!27219 (not b!1101177))
(check-sat b_and!37115 (not b_next!23169))
(get-model)

(declare-fun b_lambda!18071 () Bool)

(assert (= b_lambda!18067 (or (and start!96800 b_free!23169) b_lambda!18071)))

(check-sat (not b_next!23169) (not b!1101189) (not b_lambda!18071) (not b!1101186) (not b!1101187) (not start!96800) b_and!37115 (not b!1101178) (not b!1101180) (not b!1101179) (not mapNonEmpty!42613) (not b!1101181) tp_is_empty!27219 (not b!1101177))
(check-sat b_and!37115 (not b_next!23169))
(get-model)

(declare-fun d!130637 () Bool)

(declare-fun e!628548 () Bool)

(assert (=> d!130637 e!628548))

(declare-fun res!734849 () Bool)

(assert (=> d!130637 (=> (not res!734849) (not e!628548))))

(declare-fun lt!493670 () ListLongMap!15347)

(declare-fun contains!6401 (ListLongMap!15347 (_ BitVec 64)) Bool)

(assert (=> d!130637 (= res!734849 (contains!6401 lt!493670 (_1!8700 lt!493624)))))

(declare-fun lt!493673 () List!23995)

(assert (=> d!130637 (= lt!493670 (ListLongMap!15348 lt!493673))))

(declare-fun lt!493671 () Unit!36194)

(declare-fun lt!493672 () Unit!36194)

(assert (=> d!130637 (= lt!493671 lt!493672)))

(declare-datatypes ((Option!677 0))(
  ( (Some!676 (v!16297 V!41419)) (None!675) )
))
(declare-fun getValueByKey!626 (List!23995 (_ BitVec 64)) Option!677)

(assert (=> d!130637 (= (getValueByKey!626 lt!493673 (_1!8700 lt!493624)) (Some!676 (_2!8700 lt!493624)))))

(declare-fun lemmaContainsTupThenGetReturnValue!303 (List!23995 (_ BitVec 64) V!41419) Unit!36194)

(assert (=> d!130637 (= lt!493672 (lemmaContainsTupThenGetReturnValue!303 lt!493673 (_1!8700 lt!493624) (_2!8700 lt!493624)))))

(declare-fun insertStrictlySorted!396 (List!23995 (_ BitVec 64) V!41419) List!23995)

(assert (=> d!130637 (= lt!493673 (insertStrictlySorted!396 (toList!7689 lt!493629) (_1!8700 lt!493624) (_2!8700 lt!493624)))))

(assert (=> d!130637 (= (+!3394 lt!493629 lt!493624) lt!493670)))

(declare-fun b!1101241 () Bool)

(declare-fun res!734848 () Bool)

(assert (=> b!1101241 (=> (not res!734848) (not e!628548))))

(assert (=> b!1101241 (= res!734848 (= (getValueByKey!626 (toList!7689 lt!493670) (_1!8700 lt!493624)) (Some!676 (_2!8700 lt!493624))))))

(declare-fun b!1101242 () Bool)

(declare-fun contains!6402 (List!23995 tuple2!17378) Bool)

(assert (=> b!1101242 (= e!628548 (contains!6402 (toList!7689 lt!493670) lt!493624))))

(assert (= (and d!130637 res!734849) b!1101241))

(assert (= (and b!1101241 res!734848) b!1101242))

(declare-fun m!1021425 () Bool)

(assert (=> d!130637 m!1021425))

(declare-fun m!1021427 () Bool)

(assert (=> d!130637 m!1021427))

(declare-fun m!1021429 () Bool)

(assert (=> d!130637 m!1021429))

(declare-fun m!1021431 () Bool)

(assert (=> d!130637 m!1021431))

(declare-fun m!1021433 () Bool)

(assert (=> b!1101241 m!1021433))

(declare-fun m!1021435 () Bool)

(assert (=> b!1101242 m!1021435))

(assert (=> b!1101181 d!130637))

(declare-fun b!1101251 () Bool)

(declare-fun e!628557 () Bool)

(declare-fun e!628556 () Bool)

(assert (=> b!1101251 (= e!628557 e!628556)))

(declare-fun lt!493682 () (_ BitVec 64))

(assert (=> b!1101251 (= lt!493682 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493681 () Unit!36194)

(assert (=> b!1101251 (= lt!493681 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!493682 #b00000000000000000000000000000000))))

(assert (=> b!1101251 (arrayContainsKey!0 _keys!1070 lt!493682 #b00000000000000000000000000000000)))

(declare-fun lt!493680 () Unit!36194)

(assert (=> b!1101251 (= lt!493680 lt!493681)))

(declare-fun res!734855 () Bool)

(declare-datatypes ((SeekEntryResult!9914 0))(
  ( (MissingZero!9914 (index!42027 (_ BitVec 32))) (Found!9914 (index!42028 (_ BitVec 32))) (Intermediate!9914 (undefined!10726 Bool) (index!42029 (_ BitVec 32)) (x!99044 (_ BitVec 32))) (Undefined!9914) (MissingVacant!9914 (index!42030 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71357 (_ BitVec 32)) SeekEntryResult!9914)

(assert (=> b!1101251 (= res!734855 (= (seekEntryOrOpen!0 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9914 #b00000000000000000000000000000000)))))

(assert (=> b!1101251 (=> (not res!734855) (not e!628556))))

(declare-fun b!1101252 () Bool)

(declare-fun call!46135 () Bool)

(assert (=> b!1101252 (= e!628556 call!46135)))

(declare-fun b!1101253 () Bool)

(assert (=> b!1101253 (= e!628557 call!46135)))

(declare-fun d!130639 () Bool)

(declare-fun res!734854 () Bool)

(declare-fun e!628555 () Bool)

(assert (=> d!130639 (=> res!734854 e!628555)))

(assert (=> d!130639 (= res!734854 (bvsge #b00000000000000000000000000000000 (size!34878 _keys!1070)))))

(assert (=> d!130639 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!628555)))

(declare-fun b!1101254 () Bool)

(assert (=> b!1101254 (= e!628555 e!628557)))

(declare-fun c!108769 () Bool)

(assert (=> b!1101254 (= c!108769 (validKeyInArray!0 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46132 () Bool)

(assert (=> bm!46132 (= call!46135 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(assert (= (and d!130639 (not res!734854)) b!1101254))

(assert (= (and b!1101254 c!108769) b!1101251))

(assert (= (and b!1101254 (not c!108769)) b!1101253))

(assert (= (and b!1101251 res!734855) b!1101252))

(assert (= (or b!1101252 b!1101253) bm!46132))

(declare-fun m!1021437 () Bool)

(assert (=> b!1101251 m!1021437))

(declare-fun m!1021439 () Bool)

(assert (=> b!1101251 m!1021439))

(declare-fun m!1021441 () Bool)

(assert (=> b!1101251 m!1021441))

(assert (=> b!1101251 m!1021437))

(declare-fun m!1021443 () Bool)

(assert (=> b!1101251 m!1021443))

(assert (=> b!1101254 m!1021437))

(assert (=> b!1101254 m!1021437))

(declare-fun m!1021445 () Bool)

(assert (=> b!1101254 m!1021445))

(declare-fun m!1021447 () Bool)

(assert (=> bm!46132 m!1021447))

(assert (=> b!1101186 d!130639))

(declare-fun b!1101265 () Bool)

(declare-fun e!628568 () Bool)

(declare-fun e!628567 () Bool)

(assert (=> b!1101265 (= e!628568 e!628567)))

(declare-fun res!734863 () Bool)

(assert (=> b!1101265 (=> (not res!734863) (not e!628567))))

(declare-fun e!628569 () Bool)

(assert (=> b!1101265 (= res!734863 (not e!628569))))

(declare-fun res!734862 () Bool)

(assert (=> b!1101265 (=> (not res!734862) (not e!628569))))

(assert (=> b!1101265 (= res!734862 (validKeyInArray!0 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101266 () Bool)

(declare-fun e!628566 () Bool)

(assert (=> b!1101266 (= e!628567 e!628566)))

(declare-fun c!108772 () Bool)

(assert (=> b!1101266 (= c!108772 (validKeyInArray!0 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101267 () Bool)

(declare-fun call!46138 () Bool)

(assert (=> b!1101267 (= e!628566 call!46138)))

(declare-fun b!1101268 () Bool)

(declare-fun contains!6403 (List!23994 (_ BitVec 64)) Bool)

(assert (=> b!1101268 (= e!628569 (contains!6403 Nil!23991 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101269 () Bool)

(assert (=> b!1101269 (= e!628566 call!46138)))

(declare-fun d!130641 () Bool)

(declare-fun res!734864 () Bool)

(assert (=> d!130641 (=> res!734864 e!628568)))

(assert (=> d!130641 (= res!734864 (bvsge #b00000000000000000000000000000000 (size!34878 _keys!1070)))))

(assert (=> d!130641 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23991) e!628568)))

(declare-fun bm!46135 () Bool)

(assert (=> bm!46135 (= call!46138 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108772 (Cons!23990 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000) Nil!23991) Nil!23991)))))

(assert (= (and d!130641 (not res!734864)) b!1101265))

(assert (= (and b!1101265 res!734862) b!1101268))

(assert (= (and b!1101265 res!734863) b!1101266))

(assert (= (and b!1101266 c!108772) b!1101269))

(assert (= (and b!1101266 (not c!108772)) b!1101267))

(assert (= (or b!1101269 b!1101267) bm!46135))

(assert (=> b!1101265 m!1021437))

(assert (=> b!1101265 m!1021437))

(assert (=> b!1101265 m!1021445))

(assert (=> b!1101266 m!1021437))

(assert (=> b!1101266 m!1021437))

(assert (=> b!1101266 m!1021445))

(assert (=> b!1101268 m!1021437))

(assert (=> b!1101268 m!1021437))

(declare-fun m!1021449 () Bool)

(assert (=> b!1101268 m!1021449))

(assert (=> bm!46135 m!1021437))

(declare-fun m!1021451 () Bool)

(assert (=> bm!46135 m!1021451))

(assert (=> b!1101177 d!130641))

(declare-fun d!130643 () Bool)

(assert (=> d!130643 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1101178 d!130643))

(declare-fun b!1101270 () Bool)

(declare-fun e!628572 () Bool)

(declare-fun e!628571 () Bool)

(assert (=> b!1101270 (= e!628572 e!628571)))

(declare-fun res!734866 () Bool)

(assert (=> b!1101270 (=> (not res!734866) (not e!628571))))

(declare-fun e!628573 () Bool)

(assert (=> b!1101270 (= res!734866 (not e!628573))))

(declare-fun res!734865 () Bool)

(assert (=> b!1101270 (=> (not res!734865) (not e!628573))))

(assert (=> b!1101270 (= res!734865 (validKeyInArray!0 (select (arr!34342 lt!493626) #b00000000000000000000000000000000)))))

(declare-fun b!1101271 () Bool)

(declare-fun e!628570 () Bool)

(assert (=> b!1101271 (= e!628571 e!628570)))

(declare-fun c!108773 () Bool)

(assert (=> b!1101271 (= c!108773 (validKeyInArray!0 (select (arr!34342 lt!493626) #b00000000000000000000000000000000)))))

(declare-fun b!1101272 () Bool)

(declare-fun call!46139 () Bool)

(assert (=> b!1101272 (= e!628570 call!46139)))

(declare-fun b!1101273 () Bool)

(assert (=> b!1101273 (= e!628573 (contains!6403 Nil!23991 (select (arr!34342 lt!493626) #b00000000000000000000000000000000)))))

(declare-fun b!1101274 () Bool)

(assert (=> b!1101274 (= e!628570 call!46139)))

(declare-fun d!130645 () Bool)

(declare-fun res!734867 () Bool)

(assert (=> d!130645 (=> res!734867 e!628572)))

(assert (=> d!130645 (= res!734867 (bvsge #b00000000000000000000000000000000 (size!34878 lt!493626)))))

(assert (=> d!130645 (= (arrayNoDuplicates!0 lt!493626 #b00000000000000000000000000000000 Nil!23991) e!628572)))

(declare-fun bm!46136 () Bool)

(assert (=> bm!46136 (= call!46139 (arrayNoDuplicates!0 lt!493626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108773 (Cons!23990 (select (arr!34342 lt!493626) #b00000000000000000000000000000000) Nil!23991) Nil!23991)))))

(assert (= (and d!130645 (not res!734867)) b!1101270))

(assert (= (and b!1101270 res!734865) b!1101273))

(assert (= (and b!1101270 res!734866) b!1101271))

(assert (= (and b!1101271 c!108773) b!1101274))

(assert (= (and b!1101271 (not c!108773)) b!1101272))

(assert (= (or b!1101274 b!1101272) bm!46136))

(declare-fun m!1021453 () Bool)

(assert (=> b!1101270 m!1021453))

(assert (=> b!1101270 m!1021453))

(declare-fun m!1021455 () Bool)

(assert (=> b!1101270 m!1021455))

(assert (=> b!1101271 m!1021453))

(assert (=> b!1101271 m!1021453))

(assert (=> b!1101271 m!1021455))

(assert (=> b!1101273 m!1021453))

(assert (=> b!1101273 m!1021453))

(declare-fun m!1021457 () Bool)

(assert (=> b!1101273 m!1021457))

(assert (=> bm!46136 m!1021453))

(declare-fun m!1021459 () Bool)

(assert (=> bm!46136 m!1021459))

(assert (=> b!1101187 d!130645))

(declare-fun d!130647 () Bool)

(declare-fun e!628574 () Bool)

(assert (=> d!130647 e!628574))

(declare-fun res!734869 () Bool)

(assert (=> d!130647 (=> (not res!734869) (not e!628574))))

(declare-fun lt!493683 () ListLongMap!15347)

(assert (=> d!130647 (= res!734869 (contains!6401 lt!493683 (_1!8700 lt!493624)))))

(declare-fun lt!493686 () List!23995)

(assert (=> d!130647 (= lt!493683 (ListLongMap!15348 lt!493686))))

(declare-fun lt!493684 () Unit!36194)

(declare-fun lt!493685 () Unit!36194)

(assert (=> d!130647 (= lt!493684 lt!493685)))

(assert (=> d!130647 (= (getValueByKey!626 lt!493686 (_1!8700 lt!493624)) (Some!676 (_2!8700 lt!493624)))))

(assert (=> d!130647 (= lt!493685 (lemmaContainsTupThenGetReturnValue!303 lt!493686 (_1!8700 lt!493624) (_2!8700 lt!493624)))))

(assert (=> d!130647 (= lt!493686 (insertStrictlySorted!396 (toList!7689 lt!493625) (_1!8700 lt!493624) (_2!8700 lt!493624)))))

(assert (=> d!130647 (= (+!3394 lt!493625 lt!493624) lt!493683)))

(declare-fun b!1101275 () Bool)

(declare-fun res!734868 () Bool)

(assert (=> b!1101275 (=> (not res!734868) (not e!628574))))

(assert (=> b!1101275 (= res!734868 (= (getValueByKey!626 (toList!7689 lt!493683) (_1!8700 lt!493624)) (Some!676 (_2!8700 lt!493624))))))

(declare-fun b!1101276 () Bool)

(assert (=> b!1101276 (= e!628574 (contains!6402 (toList!7689 lt!493683) lt!493624))))

(assert (= (and d!130647 res!734869) b!1101275))

(assert (= (and b!1101275 res!734868) b!1101276))

(declare-fun m!1021461 () Bool)

(assert (=> d!130647 m!1021461))

(declare-fun m!1021463 () Bool)

(assert (=> d!130647 m!1021463))

(declare-fun m!1021465 () Bool)

(assert (=> d!130647 m!1021465))

(declare-fun m!1021467 () Bool)

(assert (=> d!130647 m!1021467))

(declare-fun m!1021469 () Bool)

(assert (=> b!1101275 m!1021469))

(declare-fun m!1021471 () Bool)

(assert (=> b!1101276 m!1021471))

(assert (=> b!1101179 d!130647))

(declare-fun d!130649 () Bool)

(declare-fun e!628575 () Bool)

(assert (=> d!130649 e!628575))

(declare-fun res!734871 () Bool)

(assert (=> d!130649 (=> (not res!734871) (not e!628575))))

(declare-fun lt!493687 () ListLongMap!15347)

(assert (=> d!130649 (= res!734871 (contains!6401 lt!493687 (_1!8700 lt!493624)))))

(declare-fun lt!493690 () List!23995)

(assert (=> d!130649 (= lt!493687 (ListLongMap!15348 lt!493690))))

(declare-fun lt!493688 () Unit!36194)

(declare-fun lt!493689 () Unit!36194)

(assert (=> d!130649 (= lt!493688 lt!493689)))

(assert (=> d!130649 (= (getValueByKey!626 lt!493690 (_1!8700 lt!493624)) (Some!676 (_2!8700 lt!493624)))))

(assert (=> d!130649 (= lt!493689 (lemmaContainsTupThenGetReturnValue!303 lt!493690 (_1!8700 lt!493624) (_2!8700 lt!493624)))))

(assert (=> d!130649 (= lt!493690 (insertStrictlySorted!396 (toList!7689 lt!493628) (_1!8700 lt!493624) (_2!8700 lt!493624)))))

(assert (=> d!130649 (= (+!3394 lt!493628 lt!493624) lt!493687)))

(declare-fun b!1101277 () Bool)

(declare-fun res!734870 () Bool)

(assert (=> b!1101277 (=> (not res!734870) (not e!628575))))

(assert (=> b!1101277 (= res!734870 (= (getValueByKey!626 (toList!7689 lt!493687) (_1!8700 lt!493624)) (Some!676 (_2!8700 lt!493624))))))

(declare-fun b!1101278 () Bool)

(assert (=> b!1101278 (= e!628575 (contains!6402 (toList!7689 lt!493687) lt!493624))))

(assert (= (and d!130649 res!734871) b!1101277))

(assert (= (and b!1101277 res!734870) b!1101278))

(declare-fun m!1021473 () Bool)

(assert (=> d!130649 m!1021473))

(declare-fun m!1021475 () Bool)

(assert (=> d!130649 m!1021475))

(declare-fun m!1021477 () Bool)

(assert (=> d!130649 m!1021477))

(declare-fun m!1021479 () Bool)

(assert (=> d!130649 m!1021479))

(declare-fun m!1021481 () Bool)

(assert (=> b!1101277 m!1021481))

(declare-fun m!1021483 () Bool)

(assert (=> b!1101278 m!1021483))

(assert (=> b!1101179 d!130649))

(declare-fun d!130651 () Bool)

(assert (=> d!130651 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96800 d!130651))

(declare-fun d!130653 () Bool)

(assert (=> d!130653 (= (array_inv!26450 _keys!1070) (bvsge (size!34878 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96800 d!130653))

(declare-fun d!130655 () Bool)

(assert (=> d!130655 (= (array_inv!26451 _values!874) (bvsge (size!34879 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96800 d!130655))

(declare-fun d!130657 () Bool)

(declare-fun res!734876 () Bool)

(declare-fun e!628580 () Bool)

(assert (=> d!130657 (=> res!734876 e!628580)))

(assert (=> d!130657 (= res!734876 (= (select (arr!34342 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130657 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!628580)))

(declare-fun b!1101283 () Bool)

(declare-fun e!628581 () Bool)

(assert (=> b!1101283 (= e!628580 e!628581)))

(declare-fun res!734877 () Bool)

(assert (=> b!1101283 (=> (not res!734877) (not e!628581))))

(assert (=> b!1101283 (= res!734877 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34878 _keys!1070)))))

(declare-fun b!1101284 () Bool)

(assert (=> b!1101284 (= e!628581 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130657 (not res!734876)) b!1101283))

(assert (= (and b!1101283 res!734877) b!1101284))

(assert (=> d!130657 m!1021437))

(declare-fun m!1021485 () Bool)

(assert (=> b!1101284 m!1021485))

(assert (=> b!1101189 d!130657))

(declare-fun b!1101327 () Bool)

(declare-fun e!628615 () ListLongMap!15347)

(declare-fun call!46154 () ListLongMap!15347)

(assert (=> b!1101327 (= e!628615 (+!3394 call!46154 (tuple2!17379 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1101328 () Bool)

(declare-fun e!628608 () Bool)

(declare-fun lt!493756 () ListLongMap!15347)

(declare-fun apply!951 (ListLongMap!15347 (_ BitVec 64)) V!41419)

(assert (=> b!1101328 (= e!628608 (= (apply!951 lt!493756 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1101329 () Bool)

(declare-fun e!628610 () ListLongMap!15347)

(declare-fun call!46159 () ListLongMap!15347)

(assert (=> b!1101329 (= e!628610 call!46159)))

(declare-fun b!1101330 () Bool)

(declare-fun e!628618 () ListLongMap!15347)

(assert (=> b!1101330 (= e!628615 e!628618)))

(declare-fun c!108791 () Bool)

(assert (=> b!1101330 (= c!108791 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!130659 () Bool)

(declare-fun e!628619 () Bool)

(assert (=> d!130659 e!628619))

(declare-fun res!734903 () Bool)

(assert (=> d!130659 (=> (not res!734903) (not e!628619))))

(assert (=> d!130659 (= res!734903 (or (bvsge #b00000000000000000000000000000000 (size!34878 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34878 _keys!1070)))))))

(declare-fun lt!493736 () ListLongMap!15347)

(assert (=> d!130659 (= lt!493756 lt!493736)))

(declare-fun lt!493738 () Unit!36194)

(declare-fun e!628613 () Unit!36194)

(assert (=> d!130659 (= lt!493738 e!628613)))

(declare-fun c!108788 () Bool)

(declare-fun e!628612 () Bool)

(assert (=> d!130659 (= c!108788 e!628612)))

(declare-fun res!734896 () Bool)

(assert (=> d!130659 (=> (not res!734896) (not e!628612))))

(assert (=> d!130659 (= res!734896 (bvslt #b00000000000000000000000000000000 (size!34878 _keys!1070)))))

(assert (=> d!130659 (= lt!493736 e!628615)))

(declare-fun c!108789 () Bool)

(assert (=> d!130659 (= c!108789 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130659 (validMask!0 mask!1414)))

(assert (=> d!130659 (= (getCurrentListMap!4395 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493756)))

(declare-fun b!1101331 () Bool)

(declare-fun lt!493752 () Unit!36194)

(assert (=> b!1101331 (= e!628613 lt!493752)))

(declare-fun lt!493750 () ListLongMap!15347)

(assert (=> b!1101331 (= lt!493750 (getCurrentListMapNoExtraKeys!4191 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493753 () (_ BitVec 64))

(assert (=> b!1101331 (= lt!493753 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493742 () (_ BitVec 64))

(assert (=> b!1101331 (= lt!493742 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493747 () Unit!36194)

(declare-fun addStillContains!664 (ListLongMap!15347 (_ BitVec 64) V!41419 (_ BitVec 64)) Unit!36194)

(assert (=> b!1101331 (= lt!493747 (addStillContains!664 lt!493750 lt!493753 zeroValue!831 lt!493742))))

(assert (=> b!1101331 (contains!6401 (+!3394 lt!493750 (tuple2!17379 lt!493753 zeroValue!831)) lt!493742)))

(declare-fun lt!493749 () Unit!36194)

(assert (=> b!1101331 (= lt!493749 lt!493747)))

(declare-fun lt!493751 () ListLongMap!15347)

(assert (=> b!1101331 (= lt!493751 (getCurrentListMapNoExtraKeys!4191 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493740 () (_ BitVec 64))

(assert (=> b!1101331 (= lt!493740 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493745 () (_ BitVec 64))

(assert (=> b!1101331 (= lt!493745 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493748 () Unit!36194)

(declare-fun addApplyDifferent!524 (ListLongMap!15347 (_ BitVec 64) V!41419 (_ BitVec 64)) Unit!36194)

(assert (=> b!1101331 (= lt!493748 (addApplyDifferent!524 lt!493751 lt!493740 minValue!831 lt!493745))))

(assert (=> b!1101331 (= (apply!951 (+!3394 lt!493751 (tuple2!17379 lt!493740 minValue!831)) lt!493745) (apply!951 lt!493751 lt!493745))))

(declare-fun lt!493743 () Unit!36194)

(assert (=> b!1101331 (= lt!493743 lt!493748)))

(declare-fun lt!493754 () ListLongMap!15347)

(assert (=> b!1101331 (= lt!493754 (getCurrentListMapNoExtraKeys!4191 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493741 () (_ BitVec 64))

(assert (=> b!1101331 (= lt!493741 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493755 () (_ BitVec 64))

(assert (=> b!1101331 (= lt!493755 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493737 () Unit!36194)

(assert (=> b!1101331 (= lt!493737 (addApplyDifferent!524 lt!493754 lt!493741 zeroValue!831 lt!493755))))

(assert (=> b!1101331 (= (apply!951 (+!3394 lt!493754 (tuple2!17379 lt!493741 zeroValue!831)) lt!493755) (apply!951 lt!493754 lt!493755))))

(declare-fun lt!493739 () Unit!36194)

(assert (=> b!1101331 (= lt!493739 lt!493737)))

(declare-fun lt!493746 () ListLongMap!15347)

(assert (=> b!1101331 (= lt!493746 (getCurrentListMapNoExtraKeys!4191 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493744 () (_ BitVec 64))

(assert (=> b!1101331 (= lt!493744 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493735 () (_ BitVec 64))

(assert (=> b!1101331 (= lt!493735 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1101331 (= lt!493752 (addApplyDifferent!524 lt!493746 lt!493744 minValue!831 lt!493735))))

(assert (=> b!1101331 (= (apply!951 (+!3394 lt!493746 (tuple2!17379 lt!493744 minValue!831)) lt!493735) (apply!951 lt!493746 lt!493735))))

(declare-fun b!1101332 () Bool)

(declare-fun res!734900 () Bool)

(assert (=> b!1101332 (=> (not res!734900) (not e!628619))))

(declare-fun e!628611 () Bool)

(assert (=> b!1101332 (= res!734900 e!628611)))

(declare-fun res!734904 () Bool)

(assert (=> b!1101332 (=> res!734904 e!628611)))

(declare-fun e!628616 () Bool)

(assert (=> b!1101332 (= res!734904 (not e!628616))))

(declare-fun res!734899 () Bool)

(assert (=> b!1101332 (=> (not res!734899) (not e!628616))))

(assert (=> b!1101332 (= res!734899 (bvslt #b00000000000000000000000000000000 (size!34878 _keys!1070)))))

(declare-fun bm!46151 () Bool)

(declare-fun call!46160 () Bool)

(assert (=> bm!46151 (= call!46160 (contains!6401 lt!493756 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101333 () Bool)

(declare-fun e!628609 () Bool)

(assert (=> b!1101333 (= e!628609 (not call!46160))))

(declare-fun bm!46152 () Bool)

(declare-fun call!46155 () ListLongMap!15347)

(declare-fun call!46156 () ListLongMap!15347)

(assert (=> bm!46152 (= call!46155 call!46156)))

(declare-fun b!1101334 () Bool)

(declare-fun e!628614 () Bool)

(assert (=> b!1101334 (= e!628609 e!628614)))

(declare-fun res!734898 () Bool)

(assert (=> b!1101334 (= res!734898 call!46160)))

(assert (=> b!1101334 (=> (not res!734898) (not e!628614))))

(declare-fun b!1101335 () Bool)

(declare-fun c!108786 () Bool)

(assert (=> b!1101335 (= c!108786 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1101335 (= e!628618 e!628610)))

(declare-fun b!1101336 () Bool)

(declare-fun e!628620 () Bool)

(assert (=> b!1101336 (= e!628611 e!628620)))

(declare-fun res!734902 () Bool)

(assert (=> b!1101336 (=> (not res!734902) (not e!628620))))

(assert (=> b!1101336 (= res!734902 (contains!6401 lt!493756 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101336 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34878 _keys!1070)))))

(declare-fun bm!46153 () Bool)

(assert (=> bm!46153 (= call!46159 call!46155)))

(declare-fun bm!46154 () Bool)

(declare-fun call!46157 () Bool)

(assert (=> bm!46154 (= call!46157 (contains!6401 lt!493756 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101337 () Bool)

(assert (=> b!1101337 (= e!628616 (validKeyInArray!0 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101338 () Bool)

(assert (=> b!1101338 (= e!628614 (= (apply!951 lt!493756 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1101339 () Bool)

(declare-fun call!46158 () ListLongMap!15347)

(assert (=> b!1101339 (= e!628610 call!46158)))

(declare-fun bm!46155 () Bool)

(assert (=> bm!46155 (= call!46156 (getCurrentListMapNoExtraKeys!4191 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1101340 () Bool)

(assert (=> b!1101340 (= e!628618 call!46158)))

(declare-fun bm!46156 () Bool)

(assert (=> bm!46156 (= call!46158 call!46154)))

(declare-fun b!1101341 () Bool)

(declare-fun Unit!36196 () Unit!36194)

(assert (=> b!1101341 (= e!628613 Unit!36196)))

(declare-fun bm!46157 () Bool)

(assert (=> bm!46157 (= call!46154 (+!3394 (ite c!108789 call!46156 (ite c!108791 call!46155 call!46159)) (ite (or c!108789 c!108791) (tuple2!17379 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17379 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1101342 () Bool)

(declare-fun res!734901 () Bool)

(assert (=> b!1101342 (=> (not res!734901) (not e!628619))))

(declare-fun e!628617 () Bool)

(assert (=> b!1101342 (= res!734901 e!628617)))

(declare-fun c!108787 () Bool)

(assert (=> b!1101342 (= c!108787 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1101343 () Bool)

(declare-fun get!17653 (ValueCell!12900 V!41419) V!41419)

(assert (=> b!1101343 (= e!628620 (= (apply!951 lt!493756 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000)) (get!17653 (select (arr!34343 _values!874) #b00000000000000000000000000000000) (dynLambda!2326 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1101343 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34879 _values!874)))))

(assert (=> b!1101343 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34878 _keys!1070)))))

(declare-fun b!1101344 () Bool)

(assert (=> b!1101344 (= e!628619 e!628609)))

(declare-fun c!108790 () Bool)

(assert (=> b!1101344 (= c!108790 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1101345 () Bool)

(assert (=> b!1101345 (= e!628612 (validKeyInArray!0 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101346 () Bool)

(assert (=> b!1101346 (= e!628617 e!628608)))

(declare-fun res!734897 () Bool)

(assert (=> b!1101346 (= res!734897 call!46157)))

(assert (=> b!1101346 (=> (not res!734897) (not e!628608))))

(declare-fun b!1101347 () Bool)

(assert (=> b!1101347 (= e!628617 (not call!46157))))

(assert (= (and d!130659 c!108789) b!1101327))

(assert (= (and d!130659 (not c!108789)) b!1101330))

(assert (= (and b!1101330 c!108791) b!1101340))

(assert (= (and b!1101330 (not c!108791)) b!1101335))

(assert (= (and b!1101335 c!108786) b!1101339))

(assert (= (and b!1101335 (not c!108786)) b!1101329))

(assert (= (or b!1101339 b!1101329) bm!46153))

(assert (= (or b!1101340 bm!46153) bm!46152))

(assert (= (or b!1101340 b!1101339) bm!46156))

(assert (= (or b!1101327 bm!46152) bm!46155))

(assert (= (or b!1101327 bm!46156) bm!46157))

(assert (= (and d!130659 res!734896) b!1101345))

(assert (= (and d!130659 c!108788) b!1101331))

(assert (= (and d!130659 (not c!108788)) b!1101341))

(assert (= (and d!130659 res!734903) b!1101332))

(assert (= (and b!1101332 res!734899) b!1101337))

(assert (= (and b!1101332 (not res!734904)) b!1101336))

(assert (= (and b!1101336 res!734902) b!1101343))

(assert (= (and b!1101332 res!734900) b!1101342))

(assert (= (and b!1101342 c!108787) b!1101346))

(assert (= (and b!1101342 (not c!108787)) b!1101347))

(assert (= (and b!1101346 res!734897) b!1101328))

(assert (= (or b!1101346 b!1101347) bm!46154))

(assert (= (and b!1101342 res!734901) b!1101344))

(assert (= (and b!1101344 c!108790) b!1101334))

(assert (= (and b!1101344 (not c!108790)) b!1101333))

(assert (= (and b!1101334 res!734898) b!1101338))

(assert (= (or b!1101334 b!1101333) bm!46151))

(declare-fun b_lambda!18073 () Bool)

(assert (=> (not b_lambda!18073) (not b!1101343)))

(assert (=> b!1101343 t!34208))

(declare-fun b_and!37121 () Bool)

(assert (= b_and!37115 (and (=> t!34208 result!16609) b_and!37121)))

(assert (=> d!130659 m!1021359))

(declare-fun m!1021487 () Bool)

(assert (=> b!1101331 m!1021487))

(declare-fun m!1021489 () Bool)

(assert (=> b!1101331 m!1021489))

(declare-fun m!1021491 () Bool)

(assert (=> b!1101331 m!1021491))

(declare-fun m!1021493 () Bool)

(assert (=> b!1101331 m!1021493))

(declare-fun m!1021495 () Bool)

(assert (=> b!1101331 m!1021495))

(declare-fun m!1021497 () Bool)

(assert (=> b!1101331 m!1021497))

(declare-fun m!1021499 () Bool)

(assert (=> b!1101331 m!1021499))

(declare-fun m!1021501 () Bool)

(assert (=> b!1101331 m!1021501))

(declare-fun m!1021503 () Bool)

(assert (=> b!1101331 m!1021503))

(assert (=> b!1101331 m!1021489))

(assert (=> b!1101331 m!1021355))

(declare-fun m!1021505 () Bool)

(assert (=> b!1101331 m!1021505))

(declare-fun m!1021507 () Bool)

(assert (=> b!1101331 m!1021507))

(assert (=> b!1101331 m!1021501))

(declare-fun m!1021509 () Bool)

(assert (=> b!1101331 m!1021509))

(declare-fun m!1021511 () Bool)

(assert (=> b!1101331 m!1021511))

(declare-fun m!1021513 () Bool)

(assert (=> b!1101331 m!1021513))

(declare-fun m!1021515 () Bool)

(assert (=> b!1101331 m!1021515))

(assert (=> b!1101331 m!1021493))

(assert (=> b!1101331 m!1021437))

(assert (=> b!1101331 m!1021511))

(declare-fun m!1021517 () Bool)

(assert (=> b!1101338 m!1021517))

(assert (=> bm!46155 m!1021355))

(declare-fun m!1021519 () Bool)

(assert (=> b!1101343 m!1021519))

(assert (=> b!1101343 m!1021337))

(declare-fun m!1021521 () Bool)

(assert (=> b!1101343 m!1021521))

(assert (=> b!1101343 m!1021437))

(assert (=> b!1101343 m!1021519))

(assert (=> b!1101343 m!1021437))

(declare-fun m!1021523 () Bool)

(assert (=> b!1101343 m!1021523))

(assert (=> b!1101343 m!1021337))

(declare-fun m!1021525 () Bool)

(assert (=> b!1101328 m!1021525))

(declare-fun m!1021527 () Bool)

(assert (=> bm!46157 m!1021527))

(declare-fun m!1021529 () Bool)

(assert (=> b!1101327 m!1021529))

(assert (=> b!1101337 m!1021437))

(assert (=> b!1101337 m!1021437))

(assert (=> b!1101337 m!1021445))

(declare-fun m!1021531 () Bool)

(assert (=> bm!46154 m!1021531))

(declare-fun m!1021533 () Bool)

(assert (=> bm!46151 m!1021533))

(assert (=> b!1101345 m!1021437))

(assert (=> b!1101345 m!1021437))

(assert (=> b!1101345 m!1021445))

(assert (=> b!1101336 m!1021437))

(assert (=> b!1101336 m!1021437))

(declare-fun m!1021535 () Bool)

(assert (=> b!1101336 m!1021535))

(assert (=> b!1101189 d!130659))

(declare-fun b!1101348 () Bool)

(declare-fun e!628628 () ListLongMap!15347)

(declare-fun call!46161 () ListLongMap!15347)

(assert (=> b!1101348 (= e!628628 (+!3394 call!46161 (tuple2!17379 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1101349 () Bool)

(declare-fun e!628621 () Bool)

(declare-fun lt!493778 () ListLongMap!15347)

(assert (=> b!1101349 (= e!628621 (= (apply!951 lt!493778 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1101350 () Bool)

(declare-fun e!628623 () ListLongMap!15347)

(declare-fun call!46166 () ListLongMap!15347)

(assert (=> b!1101350 (= e!628623 call!46166)))

(declare-fun b!1101351 () Bool)

(declare-fun e!628631 () ListLongMap!15347)

(assert (=> b!1101351 (= e!628628 e!628631)))

(declare-fun c!108797 () Bool)

(assert (=> b!1101351 (= c!108797 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!130661 () Bool)

(declare-fun e!628632 () Bool)

(assert (=> d!130661 e!628632))

(declare-fun res!734912 () Bool)

(assert (=> d!130661 (=> (not res!734912) (not e!628632))))

(assert (=> d!130661 (= res!734912 (or (bvsge #b00000000000000000000000000000000 (size!34878 lt!493626)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34878 lt!493626)))))))

(declare-fun lt!493758 () ListLongMap!15347)

(assert (=> d!130661 (= lt!493778 lt!493758)))

(declare-fun lt!493760 () Unit!36194)

(declare-fun e!628626 () Unit!36194)

(assert (=> d!130661 (= lt!493760 e!628626)))

(declare-fun c!108794 () Bool)

(declare-fun e!628625 () Bool)

(assert (=> d!130661 (= c!108794 e!628625)))

(declare-fun res!734905 () Bool)

(assert (=> d!130661 (=> (not res!734905) (not e!628625))))

(assert (=> d!130661 (= res!734905 (bvslt #b00000000000000000000000000000000 (size!34878 lt!493626)))))

(assert (=> d!130661 (= lt!493758 e!628628)))

(declare-fun c!108795 () Bool)

(assert (=> d!130661 (= c!108795 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130661 (validMask!0 mask!1414)))

(assert (=> d!130661 (= (getCurrentListMap!4395 lt!493626 lt!493631 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493778)))

(declare-fun b!1101352 () Bool)

(declare-fun lt!493774 () Unit!36194)

(assert (=> b!1101352 (= e!628626 lt!493774)))

(declare-fun lt!493772 () ListLongMap!15347)

(assert (=> b!1101352 (= lt!493772 (getCurrentListMapNoExtraKeys!4191 lt!493626 lt!493631 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493775 () (_ BitVec 64))

(assert (=> b!1101352 (= lt!493775 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493764 () (_ BitVec 64))

(assert (=> b!1101352 (= lt!493764 (select (arr!34342 lt!493626) #b00000000000000000000000000000000))))

(declare-fun lt!493769 () Unit!36194)

(assert (=> b!1101352 (= lt!493769 (addStillContains!664 lt!493772 lt!493775 zeroValue!831 lt!493764))))

(assert (=> b!1101352 (contains!6401 (+!3394 lt!493772 (tuple2!17379 lt!493775 zeroValue!831)) lt!493764)))

(declare-fun lt!493771 () Unit!36194)

(assert (=> b!1101352 (= lt!493771 lt!493769)))

(declare-fun lt!493773 () ListLongMap!15347)

(assert (=> b!1101352 (= lt!493773 (getCurrentListMapNoExtraKeys!4191 lt!493626 lt!493631 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493762 () (_ BitVec 64))

(assert (=> b!1101352 (= lt!493762 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493767 () (_ BitVec 64))

(assert (=> b!1101352 (= lt!493767 (select (arr!34342 lt!493626) #b00000000000000000000000000000000))))

(declare-fun lt!493770 () Unit!36194)

(assert (=> b!1101352 (= lt!493770 (addApplyDifferent!524 lt!493773 lt!493762 minValue!831 lt!493767))))

(assert (=> b!1101352 (= (apply!951 (+!3394 lt!493773 (tuple2!17379 lt!493762 minValue!831)) lt!493767) (apply!951 lt!493773 lt!493767))))

(declare-fun lt!493765 () Unit!36194)

(assert (=> b!1101352 (= lt!493765 lt!493770)))

(declare-fun lt!493776 () ListLongMap!15347)

(assert (=> b!1101352 (= lt!493776 (getCurrentListMapNoExtraKeys!4191 lt!493626 lt!493631 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493763 () (_ BitVec 64))

(assert (=> b!1101352 (= lt!493763 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493777 () (_ BitVec 64))

(assert (=> b!1101352 (= lt!493777 (select (arr!34342 lt!493626) #b00000000000000000000000000000000))))

(declare-fun lt!493759 () Unit!36194)

(assert (=> b!1101352 (= lt!493759 (addApplyDifferent!524 lt!493776 lt!493763 zeroValue!831 lt!493777))))

(assert (=> b!1101352 (= (apply!951 (+!3394 lt!493776 (tuple2!17379 lt!493763 zeroValue!831)) lt!493777) (apply!951 lt!493776 lt!493777))))

(declare-fun lt!493761 () Unit!36194)

(assert (=> b!1101352 (= lt!493761 lt!493759)))

(declare-fun lt!493768 () ListLongMap!15347)

(assert (=> b!1101352 (= lt!493768 (getCurrentListMapNoExtraKeys!4191 lt!493626 lt!493631 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493766 () (_ BitVec 64))

(assert (=> b!1101352 (= lt!493766 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493757 () (_ BitVec 64))

(assert (=> b!1101352 (= lt!493757 (select (arr!34342 lt!493626) #b00000000000000000000000000000000))))

(assert (=> b!1101352 (= lt!493774 (addApplyDifferent!524 lt!493768 lt!493766 minValue!831 lt!493757))))

(assert (=> b!1101352 (= (apply!951 (+!3394 lt!493768 (tuple2!17379 lt!493766 minValue!831)) lt!493757) (apply!951 lt!493768 lt!493757))))

(declare-fun b!1101353 () Bool)

(declare-fun res!734909 () Bool)

(assert (=> b!1101353 (=> (not res!734909) (not e!628632))))

(declare-fun e!628624 () Bool)

(assert (=> b!1101353 (= res!734909 e!628624)))

(declare-fun res!734913 () Bool)

(assert (=> b!1101353 (=> res!734913 e!628624)))

(declare-fun e!628629 () Bool)

(assert (=> b!1101353 (= res!734913 (not e!628629))))

(declare-fun res!734908 () Bool)

(assert (=> b!1101353 (=> (not res!734908) (not e!628629))))

(assert (=> b!1101353 (= res!734908 (bvslt #b00000000000000000000000000000000 (size!34878 lt!493626)))))

(declare-fun bm!46158 () Bool)

(declare-fun call!46167 () Bool)

(assert (=> bm!46158 (= call!46167 (contains!6401 lt!493778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101354 () Bool)

(declare-fun e!628622 () Bool)

(assert (=> b!1101354 (= e!628622 (not call!46167))))

(declare-fun bm!46159 () Bool)

(declare-fun call!46162 () ListLongMap!15347)

(declare-fun call!46163 () ListLongMap!15347)

(assert (=> bm!46159 (= call!46162 call!46163)))

(declare-fun b!1101355 () Bool)

(declare-fun e!628627 () Bool)

(assert (=> b!1101355 (= e!628622 e!628627)))

(declare-fun res!734907 () Bool)

(assert (=> b!1101355 (= res!734907 call!46167)))

(assert (=> b!1101355 (=> (not res!734907) (not e!628627))))

(declare-fun b!1101356 () Bool)

(declare-fun c!108792 () Bool)

(assert (=> b!1101356 (= c!108792 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1101356 (= e!628631 e!628623)))

(declare-fun b!1101357 () Bool)

(declare-fun e!628633 () Bool)

(assert (=> b!1101357 (= e!628624 e!628633)))

(declare-fun res!734911 () Bool)

(assert (=> b!1101357 (=> (not res!734911) (not e!628633))))

(assert (=> b!1101357 (= res!734911 (contains!6401 lt!493778 (select (arr!34342 lt!493626) #b00000000000000000000000000000000)))))

(assert (=> b!1101357 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34878 lt!493626)))))

(declare-fun bm!46160 () Bool)

(assert (=> bm!46160 (= call!46166 call!46162)))

(declare-fun bm!46161 () Bool)

(declare-fun call!46164 () Bool)

(assert (=> bm!46161 (= call!46164 (contains!6401 lt!493778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101358 () Bool)

(assert (=> b!1101358 (= e!628629 (validKeyInArray!0 (select (arr!34342 lt!493626) #b00000000000000000000000000000000)))))

(declare-fun b!1101359 () Bool)

(assert (=> b!1101359 (= e!628627 (= (apply!951 lt!493778 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1101360 () Bool)

(declare-fun call!46165 () ListLongMap!15347)

(assert (=> b!1101360 (= e!628623 call!46165)))

(declare-fun bm!46162 () Bool)

(assert (=> bm!46162 (= call!46163 (getCurrentListMapNoExtraKeys!4191 lt!493626 lt!493631 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1101361 () Bool)

(assert (=> b!1101361 (= e!628631 call!46165)))

(declare-fun bm!46163 () Bool)

(assert (=> bm!46163 (= call!46165 call!46161)))

(declare-fun b!1101362 () Bool)

(declare-fun Unit!36197 () Unit!36194)

(assert (=> b!1101362 (= e!628626 Unit!36197)))

(declare-fun bm!46164 () Bool)

(assert (=> bm!46164 (= call!46161 (+!3394 (ite c!108795 call!46163 (ite c!108797 call!46162 call!46166)) (ite (or c!108795 c!108797) (tuple2!17379 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17379 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1101363 () Bool)

(declare-fun res!734910 () Bool)

(assert (=> b!1101363 (=> (not res!734910) (not e!628632))))

(declare-fun e!628630 () Bool)

(assert (=> b!1101363 (= res!734910 e!628630)))

(declare-fun c!108793 () Bool)

(assert (=> b!1101363 (= c!108793 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1101364 () Bool)

(assert (=> b!1101364 (= e!628633 (= (apply!951 lt!493778 (select (arr!34342 lt!493626) #b00000000000000000000000000000000)) (get!17653 (select (arr!34343 lt!493631) #b00000000000000000000000000000000) (dynLambda!2326 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1101364 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34879 lt!493631)))))

(assert (=> b!1101364 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34878 lt!493626)))))

(declare-fun b!1101365 () Bool)

(assert (=> b!1101365 (= e!628632 e!628622)))

(declare-fun c!108796 () Bool)

(assert (=> b!1101365 (= c!108796 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1101366 () Bool)

(assert (=> b!1101366 (= e!628625 (validKeyInArray!0 (select (arr!34342 lt!493626) #b00000000000000000000000000000000)))))

(declare-fun b!1101367 () Bool)

(assert (=> b!1101367 (= e!628630 e!628621)))

(declare-fun res!734906 () Bool)

(assert (=> b!1101367 (= res!734906 call!46164)))

(assert (=> b!1101367 (=> (not res!734906) (not e!628621))))

(declare-fun b!1101368 () Bool)

(assert (=> b!1101368 (= e!628630 (not call!46164))))

(assert (= (and d!130661 c!108795) b!1101348))

(assert (= (and d!130661 (not c!108795)) b!1101351))

(assert (= (and b!1101351 c!108797) b!1101361))

(assert (= (and b!1101351 (not c!108797)) b!1101356))

(assert (= (and b!1101356 c!108792) b!1101360))

(assert (= (and b!1101356 (not c!108792)) b!1101350))

(assert (= (or b!1101360 b!1101350) bm!46160))

(assert (= (or b!1101361 bm!46160) bm!46159))

(assert (= (or b!1101361 b!1101360) bm!46163))

(assert (= (or b!1101348 bm!46159) bm!46162))

(assert (= (or b!1101348 bm!46163) bm!46164))

(assert (= (and d!130661 res!734905) b!1101366))

(assert (= (and d!130661 c!108794) b!1101352))

(assert (= (and d!130661 (not c!108794)) b!1101362))

(assert (= (and d!130661 res!734912) b!1101353))

(assert (= (and b!1101353 res!734908) b!1101358))

(assert (= (and b!1101353 (not res!734913)) b!1101357))

(assert (= (and b!1101357 res!734911) b!1101364))

(assert (= (and b!1101353 res!734909) b!1101363))

(assert (= (and b!1101363 c!108793) b!1101367))

(assert (= (and b!1101363 (not c!108793)) b!1101368))

(assert (= (and b!1101367 res!734906) b!1101349))

(assert (= (or b!1101367 b!1101368) bm!46161))

(assert (= (and b!1101363 res!734910) b!1101365))

(assert (= (and b!1101365 c!108796) b!1101355))

(assert (= (and b!1101365 (not c!108796)) b!1101354))

(assert (= (and b!1101355 res!734907) b!1101359))

(assert (= (or b!1101355 b!1101354) bm!46158))

(declare-fun b_lambda!18075 () Bool)

(assert (=> (not b_lambda!18075) (not b!1101364)))

(assert (=> b!1101364 t!34208))

(declare-fun b_and!37123 () Bool)

(assert (= b_and!37121 (and (=> t!34208 result!16609) b_and!37123)))

(assert (=> d!130661 m!1021359))

(declare-fun m!1021537 () Bool)

(assert (=> b!1101352 m!1021537))

(declare-fun m!1021539 () Bool)

(assert (=> b!1101352 m!1021539))

(declare-fun m!1021541 () Bool)

(assert (=> b!1101352 m!1021541))

(declare-fun m!1021543 () Bool)

(assert (=> b!1101352 m!1021543))

(declare-fun m!1021545 () Bool)

(assert (=> b!1101352 m!1021545))

(declare-fun m!1021547 () Bool)

(assert (=> b!1101352 m!1021547))

(declare-fun m!1021549 () Bool)

(assert (=> b!1101352 m!1021549))

(declare-fun m!1021551 () Bool)

(assert (=> b!1101352 m!1021551))

(declare-fun m!1021553 () Bool)

(assert (=> b!1101352 m!1021553))

(assert (=> b!1101352 m!1021539))

(assert (=> b!1101352 m!1021343))

(declare-fun m!1021555 () Bool)

(assert (=> b!1101352 m!1021555))

(declare-fun m!1021557 () Bool)

(assert (=> b!1101352 m!1021557))

(assert (=> b!1101352 m!1021551))

(declare-fun m!1021559 () Bool)

(assert (=> b!1101352 m!1021559))

(declare-fun m!1021561 () Bool)

(assert (=> b!1101352 m!1021561))

(declare-fun m!1021563 () Bool)

(assert (=> b!1101352 m!1021563))

(declare-fun m!1021565 () Bool)

(assert (=> b!1101352 m!1021565))

(assert (=> b!1101352 m!1021543))

(assert (=> b!1101352 m!1021453))

(assert (=> b!1101352 m!1021561))

(declare-fun m!1021567 () Bool)

(assert (=> b!1101359 m!1021567))

(assert (=> bm!46162 m!1021343))

(declare-fun m!1021569 () Bool)

(assert (=> b!1101364 m!1021569))

(assert (=> b!1101364 m!1021337))

(declare-fun m!1021571 () Bool)

(assert (=> b!1101364 m!1021571))

(assert (=> b!1101364 m!1021453))

(assert (=> b!1101364 m!1021569))

(assert (=> b!1101364 m!1021453))

(declare-fun m!1021573 () Bool)

(assert (=> b!1101364 m!1021573))

(assert (=> b!1101364 m!1021337))

(declare-fun m!1021575 () Bool)

(assert (=> b!1101349 m!1021575))

(declare-fun m!1021577 () Bool)

(assert (=> bm!46164 m!1021577))

(declare-fun m!1021579 () Bool)

(assert (=> b!1101348 m!1021579))

(assert (=> b!1101358 m!1021453))

(assert (=> b!1101358 m!1021453))

(assert (=> b!1101358 m!1021455))

(declare-fun m!1021581 () Bool)

(assert (=> bm!46161 m!1021581))

(declare-fun m!1021583 () Bool)

(assert (=> bm!46158 m!1021583))

(assert (=> b!1101366 m!1021453))

(assert (=> b!1101366 m!1021453))

(assert (=> b!1101366 m!1021455))

(assert (=> b!1101357 m!1021453))

(assert (=> b!1101357 m!1021453))

(declare-fun m!1021585 () Bool)

(assert (=> b!1101357 m!1021585))

(assert (=> b!1101189 d!130661))

(declare-fun d!130663 () Bool)

(declare-fun e!628638 () Bool)

(assert (=> d!130663 e!628638))

(declare-fun res!734916 () Bool)

(assert (=> d!130663 (=> (not res!734916) (not e!628638))))

(assert (=> d!130663 (= res!734916 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34878 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34878 _keys!1070))))))))

(declare-fun lt!493781 () Unit!36194)

(declare-fun choose!1770 (array!71357 array!71359 (_ BitVec 32) (_ BitVec 32) V!41419 V!41419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36194)

(assert (=> d!130663 (= lt!493781 (choose!1770 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130663 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34878 _keys!1070)))))

(assert (=> d!130663 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!221 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!493781)))

(declare-fun b!1101375 () Bool)

(declare-fun e!628639 () Bool)

(assert (=> b!1101375 (= e!628638 e!628639)))

(declare-fun c!108800 () Bool)

(assert (=> b!1101375 (= c!108800 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun b!1101376 () Bool)

(declare-fun call!46173 () ListLongMap!15347)

(declare-fun call!46172 () ListLongMap!15347)

(assert (=> b!1101376 (= e!628639 (= call!46173 call!46172))))

(assert (=> b!1101376 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34879 _values!874)))))

(declare-fun bm!46169 () Bool)

(assert (=> bm!46169 (= call!46173 (getCurrentListMapNoExtraKeys!4191 (array!71358 (store (arr!34342 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34878 _keys!1070)) (array!71360 (store (arr!34343 _values!874) i!650 (ValueCellFull!12900 (dynLambda!2326 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34879 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46170 () Bool)

(assert (=> bm!46170 (= call!46172 (getCurrentListMapNoExtraKeys!4191 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1101377 () Bool)

(assert (=> b!1101377 (= e!628639 (= call!46173 (-!973 call!46172 k0!904)))))

(assert (=> b!1101377 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34879 _values!874)))))

(assert (= (and d!130663 res!734916) b!1101375))

(assert (= (and b!1101375 c!108800) b!1101377))

(assert (= (and b!1101375 (not c!108800)) b!1101376))

(assert (= (or b!1101377 b!1101376) bm!46170))

(assert (= (or b!1101377 b!1101376) bm!46169))

(declare-fun b_lambda!18077 () Bool)

(assert (=> (not b_lambda!18077) (not bm!46169)))

(assert (=> bm!46169 t!34208))

(declare-fun b_and!37125 () Bool)

(assert (= b_and!37123 (and (=> t!34208 result!16609) b_and!37125)))

(declare-fun m!1021587 () Bool)

(assert (=> d!130663 m!1021587))

(assert (=> bm!46169 m!1021331))

(assert (=> bm!46169 m!1021337))

(assert (=> bm!46169 m!1021339))

(declare-fun m!1021589 () Bool)

(assert (=> bm!46169 m!1021589))

(assert (=> bm!46170 m!1021355))

(declare-fun m!1021591 () Bool)

(assert (=> b!1101377 m!1021591))

(assert (=> b!1101189 d!130663))

(declare-fun b!1101402 () Bool)

(declare-fun e!628658 () Bool)

(assert (=> b!1101402 (= e!628658 (validKeyInArray!0 (select (arr!34342 lt!493626) #b00000000000000000000000000000000)))))

(assert (=> b!1101402 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1101403 () Bool)

(declare-fun e!628656 () ListLongMap!15347)

(assert (=> b!1101403 (= e!628656 (ListLongMap!15348 Nil!23992))))

(declare-fun b!1101404 () Bool)

(declare-fun e!628660 () Bool)

(declare-fun e!628654 () Bool)

(assert (=> b!1101404 (= e!628660 e!628654)))

(assert (=> b!1101404 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34878 lt!493626)))))

(declare-fun res!734926 () Bool)

(declare-fun lt!493801 () ListLongMap!15347)

(assert (=> b!1101404 (= res!734926 (contains!6401 lt!493801 (select (arr!34342 lt!493626) #b00000000000000000000000000000000)))))

(assert (=> b!1101404 (=> (not res!734926) (not e!628654))))

(declare-fun b!1101405 () Bool)

(declare-fun e!628659 () Bool)

(assert (=> b!1101405 (= e!628659 e!628660)))

(declare-fun c!108811 () Bool)

(assert (=> b!1101405 (= c!108811 e!628658)))

(declare-fun res!734927 () Bool)

(assert (=> b!1101405 (=> (not res!734927) (not e!628658))))

(assert (=> b!1101405 (= res!734927 (bvslt #b00000000000000000000000000000000 (size!34878 lt!493626)))))

(declare-fun b!1101406 () Bool)

(declare-fun e!628655 () Bool)

(declare-fun isEmpty!969 (ListLongMap!15347) Bool)

(assert (=> b!1101406 (= e!628655 (isEmpty!969 lt!493801))))

(declare-fun b!1101407 () Bool)

(declare-fun e!628657 () ListLongMap!15347)

(assert (=> b!1101407 (= e!628656 e!628657)))

(declare-fun c!108812 () Bool)

(assert (=> b!1101407 (= c!108812 (validKeyInArray!0 (select (arr!34342 lt!493626) #b00000000000000000000000000000000)))))

(declare-fun b!1101408 () Bool)

(assert (=> b!1101408 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34878 lt!493626)))))

(assert (=> b!1101408 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34879 lt!493631)))))

(assert (=> b!1101408 (= e!628654 (= (apply!951 lt!493801 (select (arr!34342 lt!493626) #b00000000000000000000000000000000)) (get!17653 (select (arr!34343 lt!493631) #b00000000000000000000000000000000) (dynLambda!2326 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!130665 () Bool)

(assert (=> d!130665 e!628659))

(declare-fun res!734925 () Bool)

(assert (=> d!130665 (=> (not res!734925) (not e!628659))))

(assert (=> d!130665 (= res!734925 (not (contains!6401 lt!493801 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130665 (= lt!493801 e!628656)))

(declare-fun c!108810 () Bool)

(assert (=> d!130665 (= c!108810 (bvsge #b00000000000000000000000000000000 (size!34878 lt!493626)))))

(assert (=> d!130665 (validMask!0 mask!1414)))

(assert (=> d!130665 (= (getCurrentListMapNoExtraKeys!4191 lt!493626 lt!493631 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493801)))

(declare-fun b!1101409 () Bool)

(declare-fun lt!493800 () Unit!36194)

(declare-fun lt!493796 () Unit!36194)

(assert (=> b!1101409 (= lt!493800 lt!493796)))

(declare-fun lt!493802 () (_ BitVec 64))

(declare-fun lt!493798 () (_ BitVec 64))

(declare-fun lt!493799 () V!41419)

(declare-fun lt!493797 () ListLongMap!15347)

(assert (=> b!1101409 (not (contains!6401 (+!3394 lt!493797 (tuple2!17379 lt!493802 lt!493799)) lt!493798))))

(declare-fun addStillNotContains!279 (ListLongMap!15347 (_ BitVec 64) V!41419 (_ BitVec 64)) Unit!36194)

(assert (=> b!1101409 (= lt!493796 (addStillNotContains!279 lt!493797 lt!493802 lt!493799 lt!493798))))

(assert (=> b!1101409 (= lt!493798 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1101409 (= lt!493799 (get!17653 (select (arr!34343 lt!493631) #b00000000000000000000000000000000) (dynLambda!2326 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1101409 (= lt!493802 (select (arr!34342 lt!493626) #b00000000000000000000000000000000))))

(declare-fun call!46176 () ListLongMap!15347)

(assert (=> b!1101409 (= lt!493797 call!46176)))

(assert (=> b!1101409 (= e!628657 (+!3394 call!46176 (tuple2!17379 (select (arr!34342 lt!493626) #b00000000000000000000000000000000) (get!17653 (select (arr!34343 lt!493631) #b00000000000000000000000000000000) (dynLambda!2326 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!46173 () Bool)

(assert (=> bm!46173 (= call!46176 (getCurrentListMapNoExtraKeys!4191 lt!493626 lt!493631 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1101410 () Bool)

(assert (=> b!1101410 (= e!628657 call!46176)))

(declare-fun b!1101411 () Bool)

(declare-fun res!734928 () Bool)

(assert (=> b!1101411 (=> (not res!734928) (not e!628659))))

(assert (=> b!1101411 (= res!734928 (not (contains!6401 lt!493801 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1101412 () Bool)

(assert (=> b!1101412 (= e!628655 (= lt!493801 (getCurrentListMapNoExtraKeys!4191 lt!493626 lt!493631 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1101413 () Bool)

(assert (=> b!1101413 (= e!628660 e!628655)))

(declare-fun c!108809 () Bool)

(assert (=> b!1101413 (= c!108809 (bvslt #b00000000000000000000000000000000 (size!34878 lt!493626)))))

(assert (= (and d!130665 c!108810) b!1101403))

(assert (= (and d!130665 (not c!108810)) b!1101407))

(assert (= (and b!1101407 c!108812) b!1101409))

(assert (= (and b!1101407 (not c!108812)) b!1101410))

(assert (= (or b!1101409 b!1101410) bm!46173))

(assert (= (and d!130665 res!734925) b!1101411))

(assert (= (and b!1101411 res!734928) b!1101405))

(assert (= (and b!1101405 res!734927) b!1101402))

(assert (= (and b!1101405 c!108811) b!1101404))

(assert (= (and b!1101405 (not c!108811)) b!1101413))

(assert (= (and b!1101404 res!734926) b!1101408))

(assert (= (and b!1101413 c!108809) b!1101412))

(assert (= (and b!1101413 (not c!108809)) b!1101406))

(declare-fun b_lambda!18079 () Bool)

(assert (=> (not b_lambda!18079) (not b!1101408)))

(assert (=> b!1101408 t!34208))

(declare-fun b_and!37127 () Bool)

(assert (= b_and!37125 (and (=> t!34208 result!16609) b_and!37127)))

(declare-fun b_lambda!18081 () Bool)

(assert (=> (not b_lambda!18081) (not b!1101409)))

(assert (=> b!1101409 t!34208))

(declare-fun b_and!37129 () Bool)

(assert (= b_and!37127 (and (=> t!34208 result!16609) b_and!37129)))

(assert (=> b!1101404 m!1021453))

(assert (=> b!1101404 m!1021453))

(declare-fun m!1021593 () Bool)

(assert (=> b!1101404 m!1021593))

(declare-fun m!1021595 () Bool)

(assert (=> b!1101411 m!1021595))

(declare-fun m!1021597 () Bool)

(assert (=> b!1101412 m!1021597))

(declare-fun m!1021599 () Bool)

(assert (=> b!1101409 m!1021599))

(declare-fun m!1021601 () Bool)

(assert (=> b!1101409 m!1021601))

(assert (=> b!1101409 m!1021337))

(assert (=> b!1101409 m!1021569))

(assert (=> b!1101409 m!1021337))

(assert (=> b!1101409 m!1021571))

(declare-fun m!1021603 () Bool)

(assert (=> b!1101409 m!1021603))

(assert (=> b!1101409 m!1021453))

(assert (=> b!1101409 m!1021569))

(declare-fun m!1021605 () Bool)

(assert (=> b!1101409 m!1021605))

(assert (=> b!1101409 m!1021599))

(declare-fun m!1021607 () Bool)

(assert (=> b!1101406 m!1021607))

(declare-fun m!1021609 () Bool)

(assert (=> d!130665 m!1021609))

(assert (=> d!130665 m!1021359))

(assert (=> b!1101408 m!1021337))

(assert (=> b!1101408 m!1021569))

(assert (=> b!1101408 m!1021337))

(assert (=> b!1101408 m!1021571))

(assert (=> b!1101408 m!1021453))

(declare-fun m!1021611 () Bool)

(assert (=> b!1101408 m!1021611))

(assert (=> b!1101408 m!1021453))

(assert (=> b!1101408 m!1021569))

(assert (=> bm!46173 m!1021597))

(assert (=> b!1101402 m!1021453))

(assert (=> b!1101402 m!1021453))

(assert (=> b!1101402 m!1021455))

(assert (=> b!1101407 m!1021453))

(assert (=> b!1101407 m!1021453))

(assert (=> b!1101407 m!1021455))

(assert (=> b!1101189 d!130665))

(declare-fun d!130667 () Bool)

(declare-fun lt!493805 () ListLongMap!15347)

(assert (=> d!130667 (not (contains!6401 lt!493805 k0!904))))

(declare-fun removeStrictlySorted!85 (List!23995 (_ BitVec 64)) List!23995)

(assert (=> d!130667 (= lt!493805 (ListLongMap!15348 (removeStrictlySorted!85 (toList!7689 lt!493625) k0!904)))))

(assert (=> d!130667 (= (-!973 lt!493625 k0!904) lt!493805)))

(declare-fun bs!32323 () Bool)

(assert (= bs!32323 d!130667))

(declare-fun m!1021613 () Bool)

(assert (=> bs!32323 m!1021613))

(declare-fun m!1021615 () Bool)

(assert (=> bs!32323 m!1021615))

(assert (=> b!1101189 d!130667))

(declare-fun b!1101414 () Bool)

(declare-fun e!628665 () Bool)

(assert (=> b!1101414 (= e!628665 (validKeyInArray!0 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101414 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1101415 () Bool)

(declare-fun e!628663 () ListLongMap!15347)

(assert (=> b!1101415 (= e!628663 (ListLongMap!15348 Nil!23992))))

(declare-fun b!1101416 () Bool)

(declare-fun e!628667 () Bool)

(declare-fun e!628661 () Bool)

(assert (=> b!1101416 (= e!628667 e!628661)))

(assert (=> b!1101416 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34878 _keys!1070)))))

(declare-fun res!734930 () Bool)

(declare-fun lt!493811 () ListLongMap!15347)

(assert (=> b!1101416 (= res!734930 (contains!6401 lt!493811 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101416 (=> (not res!734930) (not e!628661))))

(declare-fun b!1101417 () Bool)

(declare-fun e!628666 () Bool)

(assert (=> b!1101417 (= e!628666 e!628667)))

(declare-fun c!108815 () Bool)

(assert (=> b!1101417 (= c!108815 e!628665)))

(declare-fun res!734931 () Bool)

(assert (=> b!1101417 (=> (not res!734931) (not e!628665))))

(assert (=> b!1101417 (= res!734931 (bvslt #b00000000000000000000000000000000 (size!34878 _keys!1070)))))

(declare-fun b!1101418 () Bool)

(declare-fun e!628662 () Bool)

(assert (=> b!1101418 (= e!628662 (isEmpty!969 lt!493811))))

(declare-fun b!1101419 () Bool)

(declare-fun e!628664 () ListLongMap!15347)

(assert (=> b!1101419 (= e!628663 e!628664)))

(declare-fun c!108816 () Bool)

(assert (=> b!1101419 (= c!108816 (validKeyInArray!0 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101420 () Bool)

(assert (=> b!1101420 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34878 _keys!1070)))))

(assert (=> b!1101420 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34879 _values!874)))))

(assert (=> b!1101420 (= e!628661 (= (apply!951 lt!493811 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000)) (get!17653 (select (arr!34343 _values!874) #b00000000000000000000000000000000) (dynLambda!2326 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!130669 () Bool)

(assert (=> d!130669 e!628666))

(declare-fun res!734929 () Bool)

(assert (=> d!130669 (=> (not res!734929) (not e!628666))))

(assert (=> d!130669 (= res!734929 (not (contains!6401 lt!493811 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130669 (= lt!493811 e!628663)))

(declare-fun c!108814 () Bool)

(assert (=> d!130669 (= c!108814 (bvsge #b00000000000000000000000000000000 (size!34878 _keys!1070)))))

(assert (=> d!130669 (validMask!0 mask!1414)))

(assert (=> d!130669 (= (getCurrentListMapNoExtraKeys!4191 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493811)))

(declare-fun b!1101421 () Bool)

(declare-fun lt!493810 () Unit!36194)

(declare-fun lt!493806 () Unit!36194)

(assert (=> b!1101421 (= lt!493810 lt!493806)))

(declare-fun lt!493809 () V!41419)

(declare-fun lt!493812 () (_ BitVec 64))

(declare-fun lt!493808 () (_ BitVec 64))

(declare-fun lt!493807 () ListLongMap!15347)

(assert (=> b!1101421 (not (contains!6401 (+!3394 lt!493807 (tuple2!17379 lt!493812 lt!493809)) lt!493808))))

(assert (=> b!1101421 (= lt!493806 (addStillNotContains!279 lt!493807 lt!493812 lt!493809 lt!493808))))

(assert (=> b!1101421 (= lt!493808 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1101421 (= lt!493809 (get!17653 (select (arr!34343 _values!874) #b00000000000000000000000000000000) (dynLambda!2326 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1101421 (= lt!493812 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun call!46177 () ListLongMap!15347)

(assert (=> b!1101421 (= lt!493807 call!46177)))

(assert (=> b!1101421 (= e!628664 (+!3394 call!46177 (tuple2!17379 (select (arr!34342 _keys!1070) #b00000000000000000000000000000000) (get!17653 (select (arr!34343 _values!874) #b00000000000000000000000000000000) (dynLambda!2326 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!46174 () Bool)

(assert (=> bm!46174 (= call!46177 (getCurrentListMapNoExtraKeys!4191 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1101422 () Bool)

(assert (=> b!1101422 (= e!628664 call!46177)))

(declare-fun b!1101423 () Bool)

(declare-fun res!734932 () Bool)

(assert (=> b!1101423 (=> (not res!734932) (not e!628666))))

(assert (=> b!1101423 (= res!734932 (not (contains!6401 lt!493811 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1101424 () Bool)

(assert (=> b!1101424 (= e!628662 (= lt!493811 (getCurrentListMapNoExtraKeys!4191 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1101425 () Bool)

(assert (=> b!1101425 (= e!628667 e!628662)))

(declare-fun c!108813 () Bool)

(assert (=> b!1101425 (= c!108813 (bvslt #b00000000000000000000000000000000 (size!34878 _keys!1070)))))

(assert (= (and d!130669 c!108814) b!1101415))

(assert (= (and d!130669 (not c!108814)) b!1101419))

(assert (= (and b!1101419 c!108816) b!1101421))

(assert (= (and b!1101419 (not c!108816)) b!1101422))

(assert (= (or b!1101421 b!1101422) bm!46174))

(assert (= (and d!130669 res!734929) b!1101423))

(assert (= (and b!1101423 res!734932) b!1101417))

(assert (= (and b!1101417 res!734931) b!1101414))

(assert (= (and b!1101417 c!108815) b!1101416))

(assert (= (and b!1101417 (not c!108815)) b!1101425))

(assert (= (and b!1101416 res!734930) b!1101420))

(assert (= (and b!1101425 c!108813) b!1101424))

(assert (= (and b!1101425 (not c!108813)) b!1101418))

(declare-fun b_lambda!18083 () Bool)

(assert (=> (not b_lambda!18083) (not b!1101420)))

(assert (=> b!1101420 t!34208))

(declare-fun b_and!37131 () Bool)

(assert (= b_and!37129 (and (=> t!34208 result!16609) b_and!37131)))

(declare-fun b_lambda!18085 () Bool)

(assert (=> (not b_lambda!18085) (not b!1101421)))

(assert (=> b!1101421 t!34208))

(declare-fun b_and!37133 () Bool)

(assert (= b_and!37131 (and (=> t!34208 result!16609) b_and!37133)))

(assert (=> b!1101416 m!1021437))

(assert (=> b!1101416 m!1021437))

(declare-fun m!1021617 () Bool)

(assert (=> b!1101416 m!1021617))

(declare-fun m!1021619 () Bool)

(assert (=> b!1101423 m!1021619))

(declare-fun m!1021621 () Bool)

(assert (=> b!1101424 m!1021621))

(declare-fun m!1021623 () Bool)

(assert (=> b!1101421 m!1021623))

(declare-fun m!1021625 () Bool)

(assert (=> b!1101421 m!1021625))

(assert (=> b!1101421 m!1021337))

(assert (=> b!1101421 m!1021519))

(assert (=> b!1101421 m!1021337))

(assert (=> b!1101421 m!1021521))

(declare-fun m!1021627 () Bool)

(assert (=> b!1101421 m!1021627))

(assert (=> b!1101421 m!1021437))

(assert (=> b!1101421 m!1021519))

(declare-fun m!1021629 () Bool)

(assert (=> b!1101421 m!1021629))

(assert (=> b!1101421 m!1021623))

(declare-fun m!1021631 () Bool)

(assert (=> b!1101418 m!1021631))

(declare-fun m!1021633 () Bool)

(assert (=> d!130669 m!1021633))

(assert (=> d!130669 m!1021359))

(assert (=> b!1101420 m!1021337))

(assert (=> b!1101420 m!1021519))

(assert (=> b!1101420 m!1021337))

(assert (=> b!1101420 m!1021521))

(assert (=> b!1101420 m!1021437))

(declare-fun m!1021635 () Bool)

(assert (=> b!1101420 m!1021635))

(assert (=> b!1101420 m!1021437))

(assert (=> b!1101420 m!1021519))

(assert (=> bm!46174 m!1021621))

(assert (=> b!1101414 m!1021437))

(assert (=> b!1101414 m!1021437))

(assert (=> b!1101414 m!1021445))

(assert (=> b!1101419 m!1021437))

(assert (=> b!1101419 m!1021437))

(assert (=> b!1101419 m!1021445))

(assert (=> b!1101189 d!130669))

(declare-fun d!130671 () Bool)

(assert (=> d!130671 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493815 () Unit!36194)

(declare-fun choose!13 (array!71357 (_ BitVec 64) (_ BitVec 32)) Unit!36194)

(assert (=> d!130671 (= lt!493815 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130671 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130671 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!493815)))

(declare-fun bs!32324 () Bool)

(assert (= bs!32324 d!130671))

(assert (=> bs!32324 m!1021345))

(declare-fun m!1021637 () Bool)

(assert (=> bs!32324 m!1021637))

(assert (=> b!1101189 d!130671))

(declare-fun b!1101426 () Bool)

(declare-fun e!628670 () Bool)

(declare-fun e!628669 () Bool)

(assert (=> b!1101426 (= e!628670 e!628669)))

(declare-fun lt!493818 () (_ BitVec 64))

(assert (=> b!1101426 (= lt!493818 (select (arr!34342 lt!493626) #b00000000000000000000000000000000))))

(declare-fun lt!493817 () Unit!36194)

(assert (=> b!1101426 (= lt!493817 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!493626 lt!493818 #b00000000000000000000000000000000))))

(assert (=> b!1101426 (arrayContainsKey!0 lt!493626 lt!493818 #b00000000000000000000000000000000)))

(declare-fun lt!493816 () Unit!36194)

(assert (=> b!1101426 (= lt!493816 lt!493817)))

(declare-fun res!734934 () Bool)

(assert (=> b!1101426 (= res!734934 (= (seekEntryOrOpen!0 (select (arr!34342 lt!493626) #b00000000000000000000000000000000) lt!493626 mask!1414) (Found!9914 #b00000000000000000000000000000000)))))

(assert (=> b!1101426 (=> (not res!734934) (not e!628669))))

(declare-fun b!1101427 () Bool)

(declare-fun call!46178 () Bool)

(assert (=> b!1101427 (= e!628669 call!46178)))

(declare-fun b!1101428 () Bool)

(assert (=> b!1101428 (= e!628670 call!46178)))

(declare-fun d!130673 () Bool)

(declare-fun res!734933 () Bool)

(declare-fun e!628668 () Bool)

(assert (=> d!130673 (=> res!734933 e!628668)))

(assert (=> d!130673 (= res!734933 (bvsge #b00000000000000000000000000000000 (size!34878 lt!493626)))))

(assert (=> d!130673 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493626 mask!1414) e!628668)))

(declare-fun b!1101429 () Bool)

(assert (=> b!1101429 (= e!628668 e!628670)))

(declare-fun c!108817 () Bool)

(assert (=> b!1101429 (= c!108817 (validKeyInArray!0 (select (arr!34342 lt!493626) #b00000000000000000000000000000000)))))

(declare-fun bm!46175 () Bool)

(assert (=> bm!46175 (= call!46178 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!493626 mask!1414))))

(assert (= (and d!130673 (not res!734933)) b!1101429))

(assert (= (and b!1101429 c!108817) b!1101426))

(assert (= (and b!1101429 (not c!108817)) b!1101428))

(assert (= (and b!1101426 res!734934) b!1101427))

(assert (= (or b!1101427 b!1101428) bm!46175))

(assert (=> b!1101426 m!1021453))

(declare-fun m!1021639 () Bool)

(assert (=> b!1101426 m!1021639))

(declare-fun m!1021641 () Bool)

(assert (=> b!1101426 m!1021641))

(assert (=> b!1101426 m!1021453))

(declare-fun m!1021643 () Bool)

(assert (=> b!1101426 m!1021643))

(assert (=> b!1101429 m!1021453))

(assert (=> b!1101429 m!1021453))

(assert (=> b!1101429 m!1021455))

(declare-fun m!1021645 () Bool)

(assert (=> bm!46175 m!1021645))

(assert (=> b!1101180 d!130673))

(declare-fun b!1101437 () Bool)

(declare-fun e!628676 () Bool)

(assert (=> b!1101437 (= e!628676 tp_is_empty!27219)))

(declare-fun mapIsEmpty!42619 () Bool)

(declare-fun mapRes!42619 () Bool)

(assert (=> mapIsEmpty!42619 mapRes!42619))

(declare-fun mapNonEmpty!42619 () Bool)

(declare-fun tp!81467 () Bool)

(declare-fun e!628675 () Bool)

(assert (=> mapNonEmpty!42619 (= mapRes!42619 (and tp!81467 e!628675))))

(declare-fun mapRest!42619 () (Array (_ BitVec 32) ValueCell!12900))

(declare-fun mapValue!42619 () ValueCell!12900)

(declare-fun mapKey!42619 () (_ BitVec 32))

(assert (=> mapNonEmpty!42619 (= mapRest!42613 (store mapRest!42619 mapKey!42619 mapValue!42619))))

(declare-fun condMapEmpty!42619 () Bool)

(declare-fun mapDefault!42619 () ValueCell!12900)

(assert (=> mapNonEmpty!42613 (= condMapEmpty!42619 (= mapRest!42613 ((as const (Array (_ BitVec 32) ValueCell!12900)) mapDefault!42619)))))

(assert (=> mapNonEmpty!42613 (= tp!81458 (and e!628676 mapRes!42619))))

(declare-fun b!1101436 () Bool)

(assert (=> b!1101436 (= e!628675 tp_is_empty!27219)))

(assert (= (and mapNonEmpty!42613 condMapEmpty!42619) mapIsEmpty!42619))

(assert (= (and mapNonEmpty!42613 (not condMapEmpty!42619)) mapNonEmpty!42619))

(assert (= (and mapNonEmpty!42619 ((_ is ValueCellFull!12900) mapValue!42619)) b!1101436))

(assert (= (and mapNonEmpty!42613 ((_ is ValueCellFull!12900) mapDefault!42619)) b!1101437))

(declare-fun m!1021647 () Bool)

(assert (=> mapNonEmpty!42619 m!1021647))

(declare-fun b_lambda!18087 () Bool)

(assert (= b_lambda!18085 (or (and start!96800 b_free!23169) b_lambda!18087)))

(declare-fun b_lambda!18089 () Bool)

(assert (= b_lambda!18077 (or (and start!96800 b_free!23169) b_lambda!18089)))

(declare-fun b_lambda!18091 () Bool)

(assert (= b_lambda!18081 (or (and start!96800 b_free!23169) b_lambda!18091)))

(declare-fun b_lambda!18093 () Bool)

(assert (= b_lambda!18075 (or (and start!96800 b_free!23169) b_lambda!18093)))

(declare-fun b_lambda!18095 () Bool)

(assert (= b_lambda!18083 (or (and start!96800 b_free!23169) b_lambda!18095)))

(declare-fun b_lambda!18097 () Bool)

(assert (= b_lambda!18073 (or (and start!96800 b_free!23169) b_lambda!18097)))

(declare-fun b_lambda!18099 () Bool)

(assert (= b_lambda!18079 (or (and start!96800 b_free!23169) b_lambda!18099)))

(check-sat (not b!1101406) (not b_lambda!18087) (not b!1101408) (not b!1101424) (not b!1101331) (not d!130661) (not b_next!23169) (not bm!46154) (not d!130671) (not b!1101420) (not bm!46161) (not b!1101241) (not b!1101429) (not d!130659) (not b!1101336) (not b!1101414) b_and!37133 (not b!1101242) (not bm!46132) (not b_lambda!18071) (not b!1101423) (not bm!46174) (not bm!46157) (not d!130647) (not b!1101328) (not b_lambda!18099) (not b_lambda!18091) (not b!1101411) (not bm!46169) (not d!130637) (not d!130649) (not b_lambda!18095) (not b_lambda!18089) (not b!1101409) (not b!1101348) (not b!1101270) (not b!1101254) (not b!1101418) (not b!1101277) tp_is_empty!27219 (not mapNonEmpty!42619) (not b!1101345) (not b!1101352) (not bm!46173) (not d!130669) (not b!1101327) (not b!1101358) (not b!1101278) (not b_lambda!18093) (not b!1101338) (not b!1101273) (not b!1101349) (not b!1101364) (not b!1101357) (not bm!46135) (not bm!46175) (not b!1101416) (not d!130667) (not bm!46162) (not b!1101276) (not bm!46151) (not bm!46158) (not b!1101402) (not b!1101251) (not b!1101359) (not b!1101284) (not d!130665) (not b_lambda!18097) (not b!1101366) (not b!1101268) (not b!1101407) (not b!1101343) (not bm!46170) (not d!130663) (not b!1101275) (not b!1101271) (not bm!46164) (not b!1101404) (not bm!46155) (not b!1101419) (not b!1101377) (not b!1101412) (not b!1101265) (not b!1101421) (not b!1101426) (not bm!46136) (not b!1101337) (not b!1101266))
(check-sat b_and!37133 (not b_next!23169))
