; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133894 () Bool)

(assert start!133894)

(declare-fun b_free!32139 () Bool)

(declare-fun b_next!32139 () Bool)

(assert (=> start!133894 (= b_free!32139 (not b_next!32139))))

(declare-fun tp!113716 () Bool)

(declare-fun b_and!51715 () Bool)

(assert (=> start!133894 (= tp!113716 b_and!51715)))

(declare-fun mapIsEmpty!59758 () Bool)

(declare-fun mapRes!59758 () Bool)

(assert (=> mapIsEmpty!59758 mapRes!59758))

(declare-fun b!1565280 () Bool)

(declare-fun e!872470 () Bool)

(declare-fun tp_is_empty!38913 () Bool)

(assert (=> b!1565280 (= e!872470 tp_is_empty!38913)))

(declare-fun b!1565281 () Bool)

(declare-fun e!872469 () Bool)

(assert (=> b!1565281 (= e!872469 tp_is_empty!38913)))

(declare-fun b!1565282 () Bool)

(declare-fun res!1070022 () Bool)

(declare-fun e!872473 () Bool)

(assert (=> b!1565282 (=> (not res!1070022) (not e!872473))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104514 0))(
  ( (array!104515 (arr!50445 (Array (_ BitVec 32) (_ BitVec 64))) (size!50995 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104514)

(assert (=> b!1565282 (= res!1070022 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50995 _keys!637)) (bvslt from!782 (size!50995 _keys!637))))))

(declare-fun b!1565284 () Bool)

(declare-fun res!1070024 () Bool)

(assert (=> b!1565284 (=> (not res!1070024) (not e!872473))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!60091 0))(
  ( (V!60092 (val!19540 Int)) )
))
(declare-datatypes ((ValueCell!18426 0))(
  ( (ValueCellFull!18426 (v!22295 V!60091)) (EmptyCell!18426) )
))
(declare-datatypes ((array!104516 0))(
  ( (array!104517 (arr!50446 (Array (_ BitVec 32) ValueCell!18426)) (size!50996 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104516)

(assert (=> b!1565284 (= res!1070024 (and (= (size!50996 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50995 _keys!637) (size!50996 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565285 () Bool)

(declare-fun res!1070025 () Bool)

(assert (=> b!1565285 (=> (not res!1070025) (not e!872473))))

(declare-datatypes ((List!36596 0))(
  ( (Nil!36593) (Cons!36592 (h!38038 (_ BitVec 64)) (t!51449 List!36596)) )
))
(declare-fun arrayNoDuplicates!0 (array!104514 (_ BitVec 32) List!36596) Bool)

(assert (=> b!1565285 (= res!1070025 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36593))))

(declare-fun mapNonEmpty!59758 () Bool)

(declare-fun tp!113715 () Bool)

(assert (=> mapNonEmpty!59758 (= mapRes!59758 (and tp!113715 e!872470))))

(declare-fun mapKey!59758 () (_ BitVec 32))

(declare-fun mapRest!59758 () (Array (_ BitVec 32) ValueCell!18426))

(declare-fun mapValue!59758 () ValueCell!18426)

(assert (=> mapNonEmpty!59758 (= (arr!50446 _values!487) (store mapRest!59758 mapKey!59758 mapValue!59758))))

(declare-fun b!1565286 () Bool)

(declare-fun e!872472 () Bool)

(assert (=> b!1565286 (= e!872472 (and e!872469 mapRes!59758))))

(declare-fun condMapEmpty!59758 () Bool)

(declare-fun mapDefault!59758 () ValueCell!18426)

(assert (=> b!1565286 (= condMapEmpty!59758 (= (arr!50446 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18426)) mapDefault!59758)))))

(declare-fun b!1565287 () Bool)

(declare-fun res!1070023 () Bool)

(assert (=> b!1565287 (=> (not res!1070023) (not e!872473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104514 (_ BitVec 32)) Bool)

(assert (=> b!1565287 (= res!1070023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565288 () Bool)

(assert (=> b!1565288 (= e!872473 (not (bvslt (bvsub (size!50995 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!50995 _keys!637)) from!782))))))

(declare-datatypes ((tuple2!25208 0))(
  ( (tuple2!25209 (_1!12615 (_ BitVec 64)) (_2!12615 V!60091)) )
))
(declare-datatypes ((List!36597 0))(
  ( (Nil!36594) (Cons!36593 (h!38039 tuple2!25208) (t!51450 List!36597)) )
))
(declare-datatypes ((ListLongMap!22643 0))(
  ( (ListLongMap!22644 (toList!11337 List!36597)) )
))
(declare-fun lt!672193 () ListLongMap!22643)

(declare-fun lt!672194 () V!60091)

(declare-fun contains!10326 (ListLongMap!22643 (_ BitVec 64)) Bool)

(declare-fun +!5067 (ListLongMap!22643 tuple2!25208) ListLongMap!22643)

(assert (=> b!1565288 (not (contains!10326 (+!5067 lt!672193 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51997 0))(
  ( (Unit!51998) )
))
(declare-fun lt!672192 () Unit!51997)

(declare-fun addStillNotContains!557 (ListLongMap!22643 (_ BitVec 64) V!60091 (_ BitVec 64)) Unit!51997)

(assert (=> b!1565288 (= lt!672192 (addStillNotContains!557 lt!672193 (select (arr!50445 _keys!637) from!782) lt!672194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26326 (ValueCell!18426 V!60091) V!60091)

(declare-fun dynLambda!3851 (Int (_ BitVec 64)) V!60091)

(assert (=> b!1565288 (= lt!672194 (get!26326 (select (arr!50446 _values!487) from!782) (dynLambda!3851 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60091)

(declare-fun minValue!453 () V!60091)

(declare-fun getCurrentListMapNoExtraKeys!6702 (array!104514 array!104516 (_ BitVec 32) (_ BitVec 32) V!60091 V!60091 (_ BitVec 32) Int) ListLongMap!22643)

(assert (=> b!1565288 (= lt!672193 (getCurrentListMapNoExtraKeys!6702 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565283 () Bool)

(declare-fun res!1070021 () Bool)

(assert (=> b!1565283 (=> (not res!1070021) (not e!872473))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565283 (= res!1070021 (validKeyInArray!0 (select (arr!50445 _keys!637) from!782)))))

(declare-fun res!1070026 () Bool)

(assert (=> start!133894 (=> (not res!1070026) (not e!872473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133894 (= res!1070026 (validMask!0 mask!947))))

(assert (=> start!133894 e!872473))

(assert (=> start!133894 tp!113716))

(assert (=> start!133894 tp_is_empty!38913))

(assert (=> start!133894 true))

(declare-fun array_inv!39199 (array!104514) Bool)

(assert (=> start!133894 (array_inv!39199 _keys!637)))

(declare-fun array_inv!39200 (array!104516) Bool)

(assert (=> start!133894 (and (array_inv!39200 _values!487) e!872472)))

(assert (= (and start!133894 res!1070026) b!1565284))

(assert (= (and b!1565284 res!1070024) b!1565287))

(assert (= (and b!1565287 res!1070023) b!1565285))

(assert (= (and b!1565285 res!1070025) b!1565282))

(assert (= (and b!1565282 res!1070022) b!1565283))

(assert (= (and b!1565283 res!1070021) b!1565288))

(assert (= (and b!1565286 condMapEmpty!59758) mapIsEmpty!59758))

(assert (= (and b!1565286 (not condMapEmpty!59758)) mapNonEmpty!59758))

(get-info :version)

(assert (= (and mapNonEmpty!59758 ((_ is ValueCellFull!18426) mapValue!59758)) b!1565280))

(assert (= (and b!1565286 ((_ is ValueCellFull!18426) mapDefault!59758)) b!1565281))

(assert (= start!133894 b!1565286))

(declare-fun b_lambda!24943 () Bool)

(assert (=> (not b_lambda!24943) (not b!1565288)))

(declare-fun t!51448 () Bool)

(declare-fun tb!12607 () Bool)

(assert (=> (and start!133894 (= defaultEntry!495 defaultEntry!495) t!51448) tb!12607))

(declare-fun result!26503 () Bool)

(assert (=> tb!12607 (= result!26503 tp_is_empty!38913)))

(assert (=> b!1565288 t!51448))

(declare-fun b_and!51717 () Bool)

(assert (= b_and!51715 (and (=> t!51448 result!26503) b_and!51717)))

(declare-fun m!1440201 () Bool)

(assert (=> mapNonEmpty!59758 m!1440201))

(declare-fun m!1440203 () Bool)

(assert (=> b!1565285 m!1440203))

(declare-fun m!1440205 () Bool)

(assert (=> b!1565287 m!1440205))

(declare-fun m!1440207 () Bool)

(assert (=> b!1565283 m!1440207))

(assert (=> b!1565283 m!1440207))

(declare-fun m!1440209 () Bool)

(assert (=> b!1565283 m!1440209))

(declare-fun m!1440211 () Bool)

(assert (=> start!133894 m!1440211))

(declare-fun m!1440213 () Bool)

(assert (=> start!133894 m!1440213))

(declare-fun m!1440215 () Bool)

(assert (=> start!133894 m!1440215))

(declare-fun m!1440217 () Bool)

(assert (=> b!1565288 m!1440217))

(declare-fun m!1440219 () Bool)

(assert (=> b!1565288 m!1440219))

(declare-fun m!1440221 () Bool)

(assert (=> b!1565288 m!1440221))

(assert (=> b!1565288 m!1440207))

(declare-fun m!1440223 () Bool)

(assert (=> b!1565288 m!1440223))

(declare-fun m!1440225 () Bool)

(assert (=> b!1565288 m!1440225))

(assert (=> b!1565288 m!1440217))

(assert (=> b!1565288 m!1440219))

(declare-fun m!1440227 () Bool)

(assert (=> b!1565288 m!1440227))

(assert (=> b!1565288 m!1440225))

(declare-fun m!1440229 () Bool)

(assert (=> b!1565288 m!1440229))

(assert (=> b!1565288 m!1440207))

(check-sat (not b!1565288) (not b_lambda!24943) (not b!1565283) (not start!133894) b_and!51717 (not mapNonEmpty!59758) tp_is_empty!38913 (not b!1565285) (not b_next!32139) (not b!1565287))
(check-sat b_and!51717 (not b_next!32139))
(get-model)

(declare-fun b_lambda!24947 () Bool)

(assert (= b_lambda!24943 (or (and start!133894 b_free!32139) b_lambda!24947)))

(check-sat (not b_lambda!24947) (not b!1565288) (not b!1565283) (not start!133894) b_and!51717 (not mapNonEmpty!59758) tp_is_empty!38913 (not b!1565285) (not b_next!32139) (not b!1565287))
(check-sat b_and!51717 (not b_next!32139))
(get-model)

(declare-fun d!163177 () Bool)

(assert (=> d!163177 (= (validKeyInArray!0 (select (arr!50445 _keys!637) from!782)) (and (not (= (select (arr!50445 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50445 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1565283 d!163177))

(declare-fun b!1565328 () Bool)

(declare-fun e!872495 () Bool)

(declare-fun call!71876 () Bool)

(assert (=> b!1565328 (= e!872495 call!71876)))

(declare-fun bm!71873 () Bool)

(assert (=> bm!71873 (= call!71876 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1565329 () Bool)

(declare-fun e!872497 () Bool)

(assert (=> b!1565329 (= e!872497 e!872495)))

(declare-fun lt!672210 () (_ BitVec 64))

(assert (=> b!1565329 (= lt!672210 (select (arr!50445 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!672212 () Unit!51997)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104514 (_ BitVec 64) (_ BitVec 32)) Unit!51997)

(assert (=> b!1565329 (= lt!672212 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672210 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1565329 (arrayContainsKey!0 _keys!637 lt!672210 #b00000000000000000000000000000000)))

(declare-fun lt!672211 () Unit!51997)

(assert (=> b!1565329 (= lt!672211 lt!672212)))

(declare-fun res!1070049 () Bool)

(declare-datatypes ((SeekEntryResult!13525 0))(
  ( (MissingZero!13525 (index!56498 (_ BitVec 32))) (Found!13525 (index!56499 (_ BitVec 32))) (Intermediate!13525 (undefined!14337 Bool) (index!56500 (_ BitVec 32)) (x!140625 (_ BitVec 32))) (Undefined!13525) (MissingVacant!13525 (index!56501 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104514 (_ BitVec 32)) SeekEntryResult!13525)

(assert (=> b!1565329 (= res!1070049 (= (seekEntryOrOpen!0 (select (arr!50445 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13525 #b00000000000000000000000000000000)))))

(assert (=> b!1565329 (=> (not res!1070049) (not e!872495))))

(declare-fun d!163179 () Bool)

(declare-fun res!1070050 () Bool)

(declare-fun e!872496 () Bool)

(assert (=> d!163179 (=> res!1070050 e!872496)))

(assert (=> d!163179 (= res!1070050 (bvsge #b00000000000000000000000000000000 (size!50995 _keys!637)))))

(assert (=> d!163179 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!872496)))

(declare-fun b!1565330 () Bool)

(assert (=> b!1565330 (= e!872496 e!872497)))

(declare-fun c!144281 () Bool)

(assert (=> b!1565330 (= c!144281 (validKeyInArray!0 (select (arr!50445 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1565331 () Bool)

(assert (=> b!1565331 (= e!872497 call!71876)))

(assert (= (and d!163179 (not res!1070050)) b!1565330))

(assert (= (and b!1565330 c!144281) b!1565329))

(assert (= (and b!1565330 (not c!144281)) b!1565331))

(assert (= (and b!1565329 res!1070049) b!1565328))

(assert (= (or b!1565328 b!1565331) bm!71873))

(declare-fun m!1440261 () Bool)

(assert (=> bm!71873 m!1440261))

(declare-fun m!1440263 () Bool)

(assert (=> b!1565329 m!1440263))

(declare-fun m!1440265 () Bool)

(assert (=> b!1565329 m!1440265))

(declare-fun m!1440267 () Bool)

(assert (=> b!1565329 m!1440267))

(assert (=> b!1565329 m!1440263))

(declare-fun m!1440269 () Bool)

(assert (=> b!1565329 m!1440269))

(assert (=> b!1565330 m!1440263))

(assert (=> b!1565330 m!1440263))

(declare-fun m!1440271 () Bool)

(assert (=> b!1565330 m!1440271))

(assert (=> b!1565287 d!163179))

(declare-fun d!163181 () Bool)

(declare-fun c!144284 () Bool)

(assert (=> d!163181 (= c!144284 ((_ is ValueCellFull!18426) (select (arr!50446 _values!487) from!782)))))

(declare-fun e!872500 () V!60091)

(assert (=> d!163181 (= (get!26326 (select (arr!50446 _values!487) from!782) (dynLambda!3851 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) e!872500)))

(declare-fun b!1565336 () Bool)

(declare-fun get!26328 (ValueCell!18426 V!60091) V!60091)

(assert (=> b!1565336 (= e!872500 (get!26328 (select (arr!50446 _values!487) from!782) (dynLambda!3851 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1565337 () Bool)

(declare-fun get!26329 (ValueCell!18426 V!60091) V!60091)

(assert (=> b!1565337 (= e!872500 (get!26329 (select (arr!50446 _values!487) from!782) (dynLambda!3851 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163181 c!144284) b!1565336))

(assert (= (and d!163181 (not c!144284)) b!1565337))

(assert (=> b!1565336 m!1440217))

(assert (=> b!1565336 m!1440219))

(declare-fun m!1440273 () Bool)

(assert (=> b!1565336 m!1440273))

(assert (=> b!1565337 m!1440217))

(assert (=> b!1565337 m!1440219))

(declare-fun m!1440275 () Bool)

(assert (=> b!1565337 m!1440275))

(assert (=> b!1565288 d!163181))

(declare-fun d!163183 () Bool)

(declare-fun e!872506 () Bool)

(assert (=> d!163183 e!872506))

(declare-fun res!1070053 () Bool)

(assert (=> d!163183 (=> res!1070053 e!872506)))

(declare-fun lt!672223 () Bool)

(assert (=> d!163183 (= res!1070053 (not lt!672223))))

(declare-fun lt!672222 () Bool)

(assert (=> d!163183 (= lt!672223 lt!672222)))

(declare-fun lt!672221 () Unit!51997)

(declare-fun e!872505 () Unit!51997)

(assert (=> d!163183 (= lt!672221 e!872505)))

(declare-fun c!144287 () Bool)

(assert (=> d!163183 (= c!144287 lt!672222)))

(declare-fun containsKey!850 (List!36597 (_ BitVec 64)) Bool)

(assert (=> d!163183 (= lt!672222 (containsKey!850 (toList!11337 (+!5067 lt!672193 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163183 (= (contains!10326 (+!5067 lt!672193 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!672223)))

(declare-fun b!1565344 () Bool)

(declare-fun lt!672224 () Unit!51997)

(assert (=> b!1565344 (= e!872505 lt!672224)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!533 (List!36597 (_ BitVec 64)) Unit!51997)

(assert (=> b!1565344 (= lt!672224 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11337 (+!5067 lt!672193 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!868 0))(
  ( (Some!867 (v!22297 V!60091)) (None!866) )
))
(declare-fun isDefined!581 (Option!868) Bool)

(declare-fun getValueByKey!792 (List!36597 (_ BitVec 64)) Option!868)

(assert (=> b!1565344 (isDefined!581 (getValueByKey!792 (toList!11337 (+!5067 lt!672193 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1565345 () Bool)

(declare-fun Unit!52001 () Unit!51997)

(assert (=> b!1565345 (= e!872505 Unit!52001)))

(declare-fun b!1565346 () Bool)

(assert (=> b!1565346 (= e!872506 (isDefined!581 (getValueByKey!792 (toList!11337 (+!5067 lt!672193 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163183 c!144287) b!1565344))

(assert (= (and d!163183 (not c!144287)) b!1565345))

(assert (= (and d!163183 (not res!1070053)) b!1565346))

(declare-fun m!1440277 () Bool)

(assert (=> d!163183 m!1440277))

(declare-fun m!1440279 () Bool)

(assert (=> b!1565344 m!1440279))

(declare-fun m!1440281 () Bool)

(assert (=> b!1565344 m!1440281))

(assert (=> b!1565344 m!1440281))

(declare-fun m!1440283 () Bool)

(assert (=> b!1565344 m!1440283))

(assert (=> b!1565346 m!1440281))

(assert (=> b!1565346 m!1440281))

(assert (=> b!1565346 m!1440283))

(assert (=> b!1565288 d!163183))

(declare-fun d!163185 () Bool)

(declare-fun e!872509 () Bool)

(assert (=> d!163185 e!872509))

(declare-fun res!1070059 () Bool)

(assert (=> d!163185 (=> (not res!1070059) (not e!872509))))

(declare-fun lt!672236 () ListLongMap!22643)

(assert (=> d!163185 (= res!1070059 (contains!10326 lt!672236 (_1!12615 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194))))))

(declare-fun lt!672235 () List!36597)

(assert (=> d!163185 (= lt!672236 (ListLongMap!22644 lt!672235))))

(declare-fun lt!672233 () Unit!51997)

(declare-fun lt!672234 () Unit!51997)

(assert (=> d!163185 (= lt!672233 lt!672234)))

(assert (=> d!163185 (= (getValueByKey!792 lt!672235 (_1!12615 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194))) (Some!867 (_2!12615 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194))))))

(declare-fun lemmaContainsTupThenGetReturnValue!386 (List!36597 (_ BitVec 64) V!60091) Unit!51997)

(assert (=> d!163185 (= lt!672234 (lemmaContainsTupThenGetReturnValue!386 lt!672235 (_1!12615 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194)) (_2!12615 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194))))))

(declare-fun insertStrictlySorted!576 (List!36597 (_ BitVec 64) V!60091) List!36597)

(assert (=> d!163185 (= lt!672235 (insertStrictlySorted!576 (toList!11337 lt!672193) (_1!12615 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194)) (_2!12615 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194))))))

(assert (=> d!163185 (= (+!5067 lt!672193 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194)) lt!672236)))

(declare-fun b!1565351 () Bool)

(declare-fun res!1070058 () Bool)

(assert (=> b!1565351 (=> (not res!1070058) (not e!872509))))

(assert (=> b!1565351 (= res!1070058 (= (getValueByKey!792 (toList!11337 lt!672236) (_1!12615 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194))) (Some!867 (_2!12615 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194)))))))

(declare-fun b!1565352 () Bool)

(declare-fun contains!10328 (List!36597 tuple2!25208) Bool)

(assert (=> b!1565352 (= e!872509 (contains!10328 (toList!11337 lt!672236) (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194)))))

(assert (= (and d!163185 res!1070059) b!1565351))

(assert (= (and b!1565351 res!1070058) b!1565352))

(declare-fun m!1440285 () Bool)

(assert (=> d!163185 m!1440285))

(declare-fun m!1440287 () Bool)

(assert (=> d!163185 m!1440287))

(declare-fun m!1440289 () Bool)

(assert (=> d!163185 m!1440289))

(declare-fun m!1440291 () Bool)

(assert (=> d!163185 m!1440291))

(declare-fun m!1440293 () Bool)

(assert (=> b!1565351 m!1440293))

(declare-fun m!1440295 () Bool)

(assert (=> b!1565352 m!1440295))

(assert (=> b!1565288 d!163185))

(declare-fun b!1565377 () Bool)

(declare-fun e!872524 () Bool)

(assert (=> b!1565377 (= e!872524 (validKeyInArray!0 (select (arr!50445 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1565377 (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))

(declare-fun b!1565378 () Bool)

(declare-fun e!872529 () ListLongMap!22643)

(assert (=> b!1565378 (= e!872529 (ListLongMap!22644 Nil!36594))))

(declare-fun b!1565379 () Bool)

(assert (=> b!1565379 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50995 _keys!637)))))

(assert (=> b!1565379 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50996 _values!487)))))

(declare-fun e!872528 () Bool)

(declare-fun lt!672251 () ListLongMap!22643)

(declare-fun apply!1117 (ListLongMap!22643 (_ BitVec 64)) V!60091)

(assert (=> b!1565379 (= e!872528 (= (apply!1117 lt!672251 (select (arr!50445 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26326 (select (arr!50446 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3851 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1565381 () Bool)

(declare-fun e!872526 () ListLongMap!22643)

(assert (=> b!1565381 (= e!872529 e!872526)))

(declare-fun c!144296 () Bool)

(assert (=> b!1565381 (= c!144296 (validKeyInArray!0 (select (arr!50445 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun b!1565382 () Bool)

(declare-fun e!872527 () Bool)

(assert (=> b!1565382 (= e!872527 e!872528)))

(assert (=> b!1565382 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50995 _keys!637)))))

(declare-fun res!1070071 () Bool)

(assert (=> b!1565382 (= res!1070071 (contains!10326 lt!672251 (select (arr!50445 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1565382 (=> (not res!1070071) (not e!872528))))

(declare-fun call!71879 () ListLongMap!22643)

(declare-fun bm!71876 () Bool)

(assert (=> bm!71876 (= call!71879 (getCurrentListMapNoExtraKeys!6702 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1565383 () Bool)

(declare-fun e!872525 () Bool)

(assert (=> b!1565383 (= e!872527 e!872525)))

(declare-fun c!144299 () Bool)

(assert (=> b!1565383 (= c!144299 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50995 _keys!637)))))

(declare-fun b!1565384 () Bool)

(declare-fun res!1070068 () Bool)

(declare-fun e!872530 () Bool)

(assert (=> b!1565384 (=> (not res!1070068) (not e!872530))))

(assert (=> b!1565384 (= res!1070068 (not (contains!10326 lt!672251 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1565385 () Bool)

(declare-fun lt!672254 () Unit!51997)

(declare-fun lt!672255 () Unit!51997)

(assert (=> b!1565385 (= lt!672254 lt!672255)))

(declare-fun lt!672257 () (_ BitVec 64))

(declare-fun lt!672252 () (_ BitVec 64))

(declare-fun lt!672253 () ListLongMap!22643)

(declare-fun lt!672256 () V!60091)

(assert (=> b!1565385 (not (contains!10326 (+!5067 lt!672253 (tuple2!25209 lt!672252 lt!672256)) lt!672257))))

(assert (=> b!1565385 (= lt!672255 (addStillNotContains!557 lt!672253 lt!672252 lt!672256 lt!672257))))

(assert (=> b!1565385 (= lt!672257 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1565385 (= lt!672256 (get!26326 (select (arr!50446 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3851 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1565385 (= lt!672252 (select (arr!50445 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))

(assert (=> b!1565385 (= lt!672253 call!71879)))

(assert (=> b!1565385 (= e!872526 (+!5067 call!71879 (tuple2!25209 (select (arr!50445 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26326 (select (arr!50446 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3851 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1565386 () Bool)

(assert (=> b!1565386 (= e!872526 call!71879)))

(declare-fun d!163187 () Bool)

(assert (=> d!163187 e!872530))

(declare-fun res!1070069 () Bool)

(assert (=> d!163187 (=> (not res!1070069) (not e!872530))))

(assert (=> d!163187 (= res!1070069 (not (contains!10326 lt!672251 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163187 (= lt!672251 e!872529)))

(declare-fun c!144297 () Bool)

(assert (=> d!163187 (= c!144297 (bvsge (bvadd #b00000000000000000000000000000001 from!782) (size!50995 _keys!637)))))

(assert (=> d!163187 (validMask!0 mask!947)))

(assert (=> d!163187 (= (getCurrentListMapNoExtraKeys!6702 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) lt!672251)))

(declare-fun b!1565380 () Bool)

(assert (=> b!1565380 (= e!872525 (= lt!672251 (getCurrentListMapNoExtraKeys!6702 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun b!1565387 () Bool)

(declare-fun isEmpty!1145 (ListLongMap!22643) Bool)

(assert (=> b!1565387 (= e!872525 (isEmpty!1145 lt!672251))))

(declare-fun b!1565388 () Bool)

(assert (=> b!1565388 (= e!872530 e!872527)))

(declare-fun c!144298 () Bool)

(assert (=> b!1565388 (= c!144298 e!872524)))

(declare-fun res!1070070 () Bool)

(assert (=> b!1565388 (=> (not res!1070070) (not e!872524))))

(assert (=> b!1565388 (= res!1070070 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50995 _keys!637)))))

(assert (= (and d!163187 c!144297) b!1565378))

(assert (= (and d!163187 (not c!144297)) b!1565381))

(assert (= (and b!1565381 c!144296) b!1565385))

(assert (= (and b!1565381 (not c!144296)) b!1565386))

(assert (= (or b!1565385 b!1565386) bm!71876))

(assert (= (and d!163187 res!1070069) b!1565384))

(assert (= (and b!1565384 res!1070068) b!1565388))

(assert (= (and b!1565388 res!1070070) b!1565377))

(assert (= (and b!1565388 c!144298) b!1565382))

(assert (= (and b!1565388 (not c!144298)) b!1565383))

(assert (= (and b!1565382 res!1070071) b!1565379))

(assert (= (and b!1565383 c!144299) b!1565380))

(assert (= (and b!1565383 (not c!144299)) b!1565387))

(declare-fun b_lambda!24949 () Bool)

(assert (=> (not b_lambda!24949) (not b!1565379)))

(assert (=> b!1565379 t!51448))

(declare-fun b_and!51723 () Bool)

(assert (= b_and!51717 (and (=> t!51448 result!26503) b_and!51723)))

(declare-fun b_lambda!24951 () Bool)

(assert (=> (not b_lambda!24951) (not b!1565385)))

(assert (=> b!1565385 t!51448))

(declare-fun b_and!51725 () Bool)

(assert (= b_and!51723 (and (=> t!51448 result!26503) b_and!51725)))

(declare-fun m!1440297 () Bool)

(assert (=> bm!71876 m!1440297))

(declare-fun m!1440299 () Bool)

(assert (=> b!1565382 m!1440299))

(assert (=> b!1565382 m!1440299))

(declare-fun m!1440301 () Bool)

(assert (=> b!1565382 m!1440301))

(declare-fun m!1440303 () Bool)

(assert (=> b!1565384 m!1440303))

(assert (=> b!1565385 m!1440219))

(declare-fun m!1440305 () Bool)

(assert (=> b!1565385 m!1440305))

(declare-fun m!1440307 () Bool)

(assert (=> b!1565385 m!1440307))

(declare-fun m!1440309 () Bool)

(assert (=> b!1565385 m!1440309))

(declare-fun m!1440311 () Bool)

(assert (=> b!1565385 m!1440311))

(declare-fun m!1440313 () Bool)

(assert (=> b!1565385 m!1440313))

(assert (=> b!1565385 m!1440299))

(assert (=> b!1565385 m!1440311))

(assert (=> b!1565385 m!1440305))

(assert (=> b!1565385 m!1440219))

(declare-fun m!1440315 () Bool)

(assert (=> b!1565385 m!1440315))

(assert (=> b!1565380 m!1440297))

(declare-fun m!1440317 () Bool)

(assert (=> b!1565387 m!1440317))

(assert (=> b!1565377 m!1440299))

(assert (=> b!1565377 m!1440299))

(declare-fun m!1440319 () Bool)

(assert (=> b!1565377 m!1440319))

(assert (=> b!1565379 m!1440299))

(declare-fun m!1440321 () Bool)

(assert (=> b!1565379 m!1440321))

(assert (=> b!1565379 m!1440219))

(assert (=> b!1565379 m!1440305))

(assert (=> b!1565379 m!1440299))

(assert (=> b!1565379 m!1440305))

(assert (=> b!1565379 m!1440219))

(assert (=> b!1565379 m!1440315))

(declare-fun m!1440323 () Bool)

(assert (=> d!163187 m!1440323))

(assert (=> d!163187 m!1440211))

(assert (=> b!1565381 m!1440299))

(assert (=> b!1565381 m!1440299))

(assert (=> b!1565381 m!1440319))

(assert (=> b!1565288 d!163187))

(declare-fun d!163189 () Bool)

(assert (=> d!163189 (not (contains!10326 (+!5067 lt!672193 (tuple2!25209 (select (arr!50445 _keys!637) from!782) lt!672194)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672260 () Unit!51997)

(declare-fun choose!2074 (ListLongMap!22643 (_ BitVec 64) V!60091 (_ BitVec 64)) Unit!51997)

(assert (=> d!163189 (= lt!672260 (choose!2074 lt!672193 (select (arr!50445 _keys!637) from!782) lt!672194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!872533 () Bool)

(assert (=> d!163189 e!872533))

(declare-fun res!1070074 () Bool)

(assert (=> d!163189 (=> (not res!1070074) (not e!872533))))

(assert (=> d!163189 (= res!1070074 (not (contains!10326 lt!672193 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163189 (= (addStillNotContains!557 lt!672193 (select (arr!50445 _keys!637) from!782) lt!672194 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672260)))

(declare-fun b!1565392 () Bool)

(assert (=> b!1565392 (= e!872533 (not (= (select (arr!50445 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163189 res!1070074) b!1565392))

(assert (=> d!163189 m!1440225))

(assert (=> d!163189 m!1440225))

(assert (=> d!163189 m!1440229))

(assert (=> d!163189 m!1440207))

(declare-fun m!1440325 () Bool)

(assert (=> d!163189 m!1440325))

(declare-fun m!1440327 () Bool)

(assert (=> d!163189 m!1440327))

(assert (=> b!1565288 d!163189))

(declare-fun d!163191 () Bool)

(assert (=> d!163191 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133894 d!163191))

(declare-fun d!163193 () Bool)

(assert (=> d!163193 (= (array_inv!39199 _keys!637) (bvsge (size!50995 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133894 d!163193))

(declare-fun d!163195 () Bool)

(assert (=> d!163195 (= (array_inv!39200 _values!487) (bvsge (size!50996 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133894 d!163195))

(declare-fun b!1565403 () Bool)

(declare-fun e!872545 () Bool)

(declare-fun call!71882 () Bool)

(assert (=> b!1565403 (= e!872545 call!71882)))

(declare-fun b!1565404 () Bool)

(assert (=> b!1565404 (= e!872545 call!71882)))

(declare-fun b!1565405 () Bool)

(declare-fun e!872543 () Bool)

(declare-fun contains!10329 (List!36596 (_ BitVec 64)) Bool)

(assert (=> b!1565405 (= e!872543 (contains!10329 Nil!36593 (select (arr!50445 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!163197 () Bool)

(declare-fun res!1070083 () Bool)

(declare-fun e!872544 () Bool)

(assert (=> d!163197 (=> res!1070083 e!872544)))

(assert (=> d!163197 (= res!1070083 (bvsge #b00000000000000000000000000000000 (size!50995 _keys!637)))))

(assert (=> d!163197 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36593) e!872544)))

(declare-fun b!1565406 () Bool)

(declare-fun e!872542 () Bool)

(assert (=> b!1565406 (= e!872544 e!872542)))

(declare-fun res!1070081 () Bool)

(assert (=> b!1565406 (=> (not res!1070081) (not e!872542))))

(assert (=> b!1565406 (= res!1070081 (not e!872543))))

(declare-fun res!1070082 () Bool)

(assert (=> b!1565406 (=> (not res!1070082) (not e!872543))))

(assert (=> b!1565406 (= res!1070082 (validKeyInArray!0 (select (arr!50445 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1565407 () Bool)

(assert (=> b!1565407 (= e!872542 e!872545)))

(declare-fun c!144302 () Bool)

(assert (=> b!1565407 (= c!144302 (validKeyInArray!0 (select (arr!50445 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!71879 () Bool)

(assert (=> bm!71879 (= call!71882 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144302 (Cons!36592 (select (arr!50445 _keys!637) #b00000000000000000000000000000000) Nil!36593) Nil!36593)))))

(assert (= (and d!163197 (not res!1070083)) b!1565406))

(assert (= (and b!1565406 res!1070082) b!1565405))

(assert (= (and b!1565406 res!1070081) b!1565407))

(assert (= (and b!1565407 c!144302) b!1565404))

(assert (= (and b!1565407 (not c!144302)) b!1565403))

(assert (= (or b!1565404 b!1565403) bm!71879))

(assert (=> b!1565405 m!1440263))

(assert (=> b!1565405 m!1440263))

(declare-fun m!1440329 () Bool)

(assert (=> b!1565405 m!1440329))

(assert (=> b!1565406 m!1440263))

(assert (=> b!1565406 m!1440263))

(assert (=> b!1565406 m!1440271))

(assert (=> b!1565407 m!1440263))

(assert (=> b!1565407 m!1440263))

(assert (=> b!1565407 m!1440271))

(assert (=> bm!71879 m!1440263))

(declare-fun m!1440331 () Bool)

(assert (=> bm!71879 m!1440331))

(assert (=> b!1565285 d!163197))

(declare-fun mapIsEmpty!59764 () Bool)

(declare-fun mapRes!59764 () Bool)

(assert (=> mapIsEmpty!59764 mapRes!59764))

(declare-fun mapNonEmpty!59764 () Bool)

(declare-fun tp!113725 () Bool)

(declare-fun e!872551 () Bool)

(assert (=> mapNonEmpty!59764 (= mapRes!59764 (and tp!113725 e!872551))))

(declare-fun mapRest!59764 () (Array (_ BitVec 32) ValueCell!18426))

(declare-fun mapValue!59764 () ValueCell!18426)

(declare-fun mapKey!59764 () (_ BitVec 32))

(assert (=> mapNonEmpty!59764 (= mapRest!59758 (store mapRest!59764 mapKey!59764 mapValue!59764))))

(declare-fun condMapEmpty!59764 () Bool)

(declare-fun mapDefault!59764 () ValueCell!18426)

(assert (=> mapNonEmpty!59758 (= condMapEmpty!59764 (= mapRest!59758 ((as const (Array (_ BitVec 32) ValueCell!18426)) mapDefault!59764)))))

(declare-fun e!872550 () Bool)

(assert (=> mapNonEmpty!59758 (= tp!113715 (and e!872550 mapRes!59764))))

(declare-fun b!1565414 () Bool)

(assert (=> b!1565414 (= e!872551 tp_is_empty!38913)))

(declare-fun b!1565415 () Bool)

(assert (=> b!1565415 (= e!872550 tp_is_empty!38913)))

(assert (= (and mapNonEmpty!59758 condMapEmpty!59764) mapIsEmpty!59764))

(assert (= (and mapNonEmpty!59758 (not condMapEmpty!59764)) mapNonEmpty!59764))

(assert (= (and mapNonEmpty!59764 ((_ is ValueCellFull!18426) mapValue!59764)) b!1565414))

(assert (= (and mapNonEmpty!59758 ((_ is ValueCellFull!18426) mapDefault!59764)) b!1565415))

(declare-fun m!1440333 () Bool)

(assert (=> mapNonEmpty!59764 m!1440333))

(declare-fun b_lambda!24953 () Bool)

(assert (= b_lambda!24949 (or (and start!133894 b_free!32139) b_lambda!24953)))

(declare-fun b_lambda!24955 () Bool)

(assert (= b_lambda!24951 (or (and start!133894 b_free!32139) b_lambda!24955)))

(check-sat (not b_next!32139) (not b!1565344) (not b!1565387) (not b!1565406) (not b!1565384) (not b!1565385) (not b!1565380) (not b!1565352) tp_is_empty!38913 (not b!1565377) (not bm!71879) (not bm!71873) (not b!1565381) (not mapNonEmpty!59764) (not b!1565337) (not b!1565346) (not b_lambda!24947) (not b!1565351) (not b!1565382) (not b!1565330) (not b!1565336) (not b!1565379) (not b!1565407) b_and!51725 (not b_lambda!24953) (not b!1565329) (not d!163185) (not b!1565405) (not d!163187) (not d!163183) (not bm!71876) (not b_lambda!24955) (not d!163189))
(check-sat b_and!51725 (not b_next!32139))
