; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113678 () Bool)

(assert start!113678)

(declare-fun b_free!31587 () Bool)

(declare-fun b_next!31587 () Bool)

(assert (=> start!113678 (= b_free!31587 (not b_next!31587))))

(declare-fun tp!110576 () Bool)

(declare-fun b_and!50973 () Bool)

(assert (=> start!113678 (= tp!110576 b_and!50973)))

(declare-datatypes ((V!55219 0))(
  ( (V!55220 (val!18868 Int)) )
))
(declare-fun minValue!1245 () V!55219)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!92004 0))(
  ( (array!92005 (arr!44455 (Array (_ BitVec 32) (_ BitVec 64))) (size!45005 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92004)

(declare-fun zeroValue!1245 () V!55219)

(declare-fun b!1349305 () Bool)

(declare-fun e!767560 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17895 0))(
  ( (ValueCellFull!17895 (v!21523 V!55219)) (EmptyCell!17895) )
))
(declare-datatypes ((array!92006 0))(
  ( (array!92007 (arr!44456 (Array (_ BitVec 32) ValueCell!17895)) (size!45006 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92006)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24334 0))(
  ( (tuple2!24335 (_1!12178 (_ BitVec 64)) (_2!12178 V!55219)) )
))
(declare-datatypes ((List!31486 0))(
  ( (Nil!31483) (Cons!31482 (h!32691 tuple2!24334) (t!46140 List!31486)) )
))
(declare-datatypes ((ListLongMap!21991 0))(
  ( (ListLongMap!21992 (toList!11011 List!31486)) )
))
(declare-fun contains!9193 (ListLongMap!21991 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5959 (array!92004 array!92006 (_ BitVec 32) (_ BitVec 32) V!55219 V!55219 (_ BitVec 32) Int) ListLongMap!21991)

(assert (=> b!1349305 (= e!767560 (not (contains!9193 (getCurrentListMap!5959 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142)))))

(declare-fun lt!596443 () ListLongMap!21991)

(assert (=> b!1349305 (contains!9193 lt!596443 k0!1142)))

(declare-fun lt!596441 () V!55219)

(declare-datatypes ((Unit!44195 0))(
  ( (Unit!44196) )
))
(declare-fun lt!596442 () Unit!44195)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!410 ((_ BitVec 64) (_ BitVec 64) V!55219 ListLongMap!21991) Unit!44195)

(assert (=> b!1349305 (= lt!596442 (lemmaInListMapAfterAddingDiffThenInBefore!410 k0!1142 (select (arr!44455 _keys!1571) from!1960) lt!596441 lt!596443))))

(declare-fun b!1349306 () Bool)

(declare-fun res!895192 () Bool)

(declare-fun e!767559 () Bool)

(assert (=> b!1349306 (=> (not res!895192) (not e!767559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1349306 (= res!895192 (validKeyInArray!0 (select (arr!44455 _keys!1571) from!1960)))))

(declare-fun b!1349307 () Bool)

(declare-fun e!767558 () Bool)

(declare-fun tp_is_empty!37587 () Bool)

(assert (=> b!1349307 (= e!767558 tp_is_empty!37587)))

(declare-fun b!1349308 () Bool)

(declare-fun res!895185 () Bool)

(assert (=> b!1349308 (=> (not res!895185) (not e!767559))))

(assert (=> b!1349308 (= res!895185 (not (= (select (arr!44455 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1349309 () Bool)

(declare-fun res!895183 () Bool)

(assert (=> b!1349309 (=> (not res!895183) (not e!767559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!92004 (_ BitVec 32)) Bool)

(assert (=> b!1349309 (= res!895183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1349310 () Bool)

(declare-fun e!767562 () Bool)

(assert (=> b!1349310 (= e!767562 tp_is_empty!37587)))

(declare-fun b!1349311 () Bool)

(declare-fun res!895187 () Bool)

(assert (=> b!1349311 (=> (not res!895187) (not e!767559))))

(assert (=> b!1349311 (= res!895187 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45005 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349312 () Bool)

(declare-fun res!895191 () Bool)

(assert (=> b!1349312 (=> (not res!895191) (not e!767559))))

(declare-datatypes ((List!31487 0))(
  ( (Nil!31484) (Cons!31483 (h!32692 (_ BitVec 64)) (t!46141 List!31487)) )
))
(declare-fun arrayNoDuplicates!0 (array!92004 (_ BitVec 32) List!31487) Bool)

(assert (=> b!1349312 (= res!895191 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31484))))

(declare-fun b!1349313 () Bool)

(assert (=> b!1349313 (= e!767559 e!767560)))

(declare-fun res!895186 () Bool)

(assert (=> b!1349313 (=> (not res!895186) (not e!767560))))

(declare-fun +!4854 (ListLongMap!21991 tuple2!24334) ListLongMap!21991)

(assert (=> b!1349313 (= res!895186 (contains!9193 (+!4854 lt!596443 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6500 (array!92004 array!92006 (_ BitVec 32) (_ BitVec 32) V!55219 V!55219 (_ BitVec 32) Int) ListLongMap!21991)

(assert (=> b!1349313 (= lt!596443 (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22463 (ValueCell!17895 V!55219) V!55219)

(declare-fun dynLambda!3793 (Int (_ BitVec 64)) V!55219)

(assert (=> b!1349313 (= lt!596441 (get!22463 (select (arr!44456 _values!1303) from!1960) (dynLambda!3793 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1349314 () Bool)

(declare-fun res!895190 () Bool)

(assert (=> b!1349314 (=> (not res!895190) (not e!767559))))

(assert (=> b!1349314 (= res!895190 (contains!9193 (getCurrentListMap!5959 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1349315 () Bool)

(declare-fun res!895188 () Bool)

(assert (=> b!1349315 (=> (not res!895188) (not e!767559))))

(assert (=> b!1349315 (= res!895188 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1349316 () Bool)

(declare-fun res!895182 () Bool)

(assert (=> b!1349316 (=> (not res!895182) (not e!767559))))

(assert (=> b!1349316 (= res!895182 (and (= (size!45006 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!45005 _keys!1571) (size!45006 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1349317 () Bool)

(declare-fun res!895189 () Bool)

(assert (=> b!1349317 (=> (not res!895189) (not e!767560))))

(assert (=> b!1349317 (= res!895189 (not (= k0!1142 (select (arr!44455 _keys!1571) from!1960))))))

(declare-fun mapIsEmpty!58098 () Bool)

(declare-fun mapRes!58098 () Bool)

(assert (=> mapIsEmpty!58098 mapRes!58098))

(declare-fun res!895184 () Bool)

(assert (=> start!113678 (=> (not res!895184) (not e!767559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113678 (= res!895184 (validMask!0 mask!1977))))

(assert (=> start!113678 e!767559))

(assert (=> start!113678 tp_is_empty!37587))

(assert (=> start!113678 true))

(declare-fun array_inv!33485 (array!92004) Bool)

(assert (=> start!113678 (array_inv!33485 _keys!1571)))

(declare-fun e!767561 () Bool)

(declare-fun array_inv!33486 (array!92006) Bool)

(assert (=> start!113678 (and (array_inv!33486 _values!1303) e!767561)))

(assert (=> start!113678 tp!110576))

(declare-fun b!1349318 () Bool)

(assert (=> b!1349318 (= e!767561 (and e!767558 mapRes!58098))))

(declare-fun condMapEmpty!58098 () Bool)

(declare-fun mapDefault!58098 () ValueCell!17895)

(assert (=> b!1349318 (= condMapEmpty!58098 (= (arr!44456 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17895)) mapDefault!58098)))))

(declare-fun mapNonEmpty!58098 () Bool)

(declare-fun tp!110577 () Bool)

(assert (=> mapNonEmpty!58098 (= mapRes!58098 (and tp!110577 e!767562))))

(declare-fun mapValue!58098 () ValueCell!17895)

(declare-fun mapRest!58098 () (Array (_ BitVec 32) ValueCell!17895))

(declare-fun mapKey!58098 () (_ BitVec 32))

(assert (=> mapNonEmpty!58098 (= (arr!44456 _values!1303) (store mapRest!58098 mapKey!58098 mapValue!58098))))

(assert (= (and start!113678 res!895184) b!1349316))

(assert (= (and b!1349316 res!895182) b!1349309))

(assert (= (and b!1349309 res!895183) b!1349312))

(assert (= (and b!1349312 res!895191) b!1349311))

(assert (= (and b!1349311 res!895187) b!1349314))

(assert (= (and b!1349314 res!895190) b!1349308))

(assert (= (and b!1349308 res!895185) b!1349306))

(assert (= (and b!1349306 res!895192) b!1349315))

(assert (= (and b!1349315 res!895188) b!1349313))

(assert (= (and b!1349313 res!895186) b!1349317))

(assert (= (and b!1349317 res!895189) b!1349305))

(assert (= (and b!1349318 condMapEmpty!58098) mapIsEmpty!58098))

(assert (= (and b!1349318 (not condMapEmpty!58098)) mapNonEmpty!58098))

(get-info :version)

(assert (= (and mapNonEmpty!58098 ((_ is ValueCellFull!17895) mapValue!58098)) b!1349310))

(assert (= (and b!1349318 ((_ is ValueCellFull!17895) mapDefault!58098)) b!1349307))

(assert (= start!113678 b!1349318))

(declare-fun b_lambda!24697 () Bool)

(assert (=> (not b_lambda!24697) (not b!1349313)))

(declare-fun t!46139 () Bool)

(declare-fun tb!12457 () Bool)

(assert (=> (and start!113678 (= defaultEntry!1306 defaultEntry!1306) t!46139) tb!12457))

(declare-fun result!26011 () Bool)

(assert (=> tb!12457 (= result!26011 tp_is_empty!37587)))

(assert (=> b!1349313 t!46139))

(declare-fun b_and!50975 () Bool)

(assert (= b_and!50973 (and (=> t!46139 result!26011) b_and!50975)))

(declare-fun m!1236401 () Bool)

(assert (=> b!1349314 m!1236401))

(assert (=> b!1349314 m!1236401))

(declare-fun m!1236403 () Bool)

(assert (=> b!1349314 m!1236403))

(declare-fun m!1236405 () Bool)

(assert (=> b!1349312 m!1236405))

(declare-fun m!1236407 () Bool)

(assert (=> mapNonEmpty!58098 m!1236407))

(declare-fun m!1236409 () Bool)

(assert (=> b!1349313 m!1236409))

(declare-fun m!1236411 () Bool)

(assert (=> b!1349313 m!1236411))

(declare-fun m!1236413 () Bool)

(assert (=> b!1349313 m!1236413))

(declare-fun m!1236415 () Bool)

(assert (=> b!1349313 m!1236415))

(assert (=> b!1349313 m!1236411))

(declare-fun m!1236417 () Bool)

(assert (=> b!1349313 m!1236417))

(assert (=> b!1349313 m!1236413))

(assert (=> b!1349313 m!1236417))

(declare-fun m!1236419 () Bool)

(assert (=> b!1349313 m!1236419))

(declare-fun m!1236421 () Bool)

(assert (=> b!1349313 m!1236421))

(assert (=> b!1349308 m!1236421))

(declare-fun m!1236423 () Bool)

(assert (=> b!1349305 m!1236423))

(declare-fun m!1236425 () Bool)

(assert (=> b!1349305 m!1236425))

(assert (=> b!1349305 m!1236421))

(declare-fun m!1236427 () Bool)

(assert (=> b!1349305 m!1236427))

(assert (=> b!1349305 m!1236423))

(declare-fun m!1236429 () Bool)

(assert (=> b!1349305 m!1236429))

(assert (=> b!1349305 m!1236421))

(declare-fun m!1236431 () Bool)

(assert (=> start!113678 m!1236431))

(declare-fun m!1236433 () Bool)

(assert (=> start!113678 m!1236433))

(declare-fun m!1236435 () Bool)

(assert (=> start!113678 m!1236435))

(declare-fun m!1236437 () Bool)

(assert (=> b!1349309 m!1236437))

(assert (=> b!1349306 m!1236421))

(assert (=> b!1349306 m!1236421))

(declare-fun m!1236439 () Bool)

(assert (=> b!1349306 m!1236439))

(assert (=> b!1349317 m!1236421))

(check-sat (not b!1349314) (not b!1349305) (not b!1349313) (not b!1349309) (not mapNonEmpty!58098) b_and!50975 tp_is_empty!37587 (not b_next!31587) (not b!1349306) (not b!1349312) (not b_lambda!24697) (not start!113678))
(check-sat b_and!50975 (not b_next!31587))
(get-model)

(declare-fun b_lambda!24701 () Bool)

(assert (= b_lambda!24697 (or (and start!113678 b_free!31587) b_lambda!24701)))

(check-sat (not b!1349314) (not b!1349305) (not b!1349313) (not b_lambda!24701) (not b!1349309) (not mapNonEmpty!58098) (not start!113678) b_and!50975 tp_is_empty!37587 (not b_next!31587) (not b!1349306) (not b!1349312))
(check-sat b_and!50975 (not b_next!31587))
(get-model)

(declare-fun d!144657 () Bool)

(declare-fun e!767585 () Bool)

(assert (=> d!144657 e!767585))

(declare-fun res!895228 () Bool)

(assert (=> d!144657 (=> res!895228 e!767585)))

(declare-fun lt!596463 () Bool)

(assert (=> d!144657 (= res!895228 (not lt!596463))))

(declare-fun lt!596462 () Bool)

(assert (=> d!144657 (= lt!596463 lt!596462)))

(declare-fun lt!596461 () Unit!44195)

(declare-fun e!767586 () Unit!44195)

(assert (=> d!144657 (= lt!596461 e!767586)))

(declare-fun c!126554 () Bool)

(assert (=> d!144657 (= c!126554 lt!596462)))

(declare-fun containsKey!745 (List!31486 (_ BitVec 64)) Bool)

(assert (=> d!144657 (= lt!596462 (containsKey!745 (toList!11011 (getCurrentListMap!5959 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> d!144657 (= (contains!9193 (getCurrentListMap!5959 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142) lt!596463)))

(declare-fun b!1349371 () Bool)

(declare-fun lt!596464 () Unit!44195)

(assert (=> b!1349371 (= e!767586 lt!596464)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!491 (List!31486 (_ BitVec 64)) Unit!44195)

(assert (=> b!1349371 (= lt!596464 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11011 (getCurrentListMap!5959 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-datatypes ((Option!775 0))(
  ( (Some!774 (v!21525 V!55219)) (None!773) )
))
(declare-fun isDefined!530 (Option!775) Bool)

(declare-fun getValueByKey!723 (List!31486 (_ BitVec 64)) Option!775)

(assert (=> b!1349371 (isDefined!530 (getValueByKey!723 (toList!11011 (getCurrentListMap!5959 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-fun b!1349372 () Bool)

(declare-fun Unit!44197 () Unit!44195)

(assert (=> b!1349372 (= e!767586 Unit!44197)))

(declare-fun b!1349373 () Bool)

(assert (=> b!1349373 (= e!767585 (isDefined!530 (getValueByKey!723 (toList!11011 (getCurrentListMap!5959 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144657 c!126554) b!1349371))

(assert (= (and d!144657 (not c!126554)) b!1349372))

(assert (= (and d!144657 (not res!895228)) b!1349373))

(declare-fun m!1236481 () Bool)

(assert (=> d!144657 m!1236481))

(declare-fun m!1236483 () Bool)

(assert (=> b!1349371 m!1236483))

(declare-fun m!1236485 () Bool)

(assert (=> b!1349371 m!1236485))

(assert (=> b!1349371 m!1236485))

(declare-fun m!1236487 () Bool)

(assert (=> b!1349371 m!1236487))

(assert (=> b!1349373 m!1236485))

(assert (=> b!1349373 m!1236485))

(assert (=> b!1349373 m!1236487))

(assert (=> b!1349305 d!144657))

(declare-fun b!1349416 () Bool)

(declare-fun e!767624 () Bool)

(declare-fun e!767613 () Bool)

(assert (=> b!1349416 (= e!767624 e!767613)))

(declare-fun res!895255 () Bool)

(assert (=> b!1349416 (=> (not res!895255) (not e!767613))))

(declare-fun lt!596522 () ListLongMap!21991)

(assert (=> b!1349416 (= res!895255 (contains!9193 lt!596522 (select (arr!44455 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349416 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45005 _keys!1571)))))

(declare-fun b!1349417 () Bool)

(declare-fun e!767623 () Bool)

(declare-fun apply!1040 (ListLongMap!21991 (_ BitVec 64)) V!55219)

(assert (=> b!1349417 (= e!767623 (= (apply!1040 lt!596522 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun b!1349418 () Bool)

(declare-fun e!767625 () Bool)

(declare-fun call!65184 () Bool)

(assert (=> b!1349418 (= e!767625 (not call!65184))))

(declare-fun bm!65175 () Bool)

(declare-fun call!65182 () ListLongMap!21991)

(declare-fun call!65180 () ListLongMap!21991)

(assert (=> bm!65175 (= call!65182 call!65180)))

(declare-fun b!1349419 () Bool)

(declare-fun res!895254 () Bool)

(declare-fun e!767617 () Bool)

(assert (=> b!1349419 (=> (not res!895254) (not e!767617))))

(assert (=> b!1349419 (= res!895254 e!767624)))

(declare-fun res!895248 () Bool)

(assert (=> b!1349419 (=> res!895248 e!767624)))

(declare-fun e!767615 () Bool)

(assert (=> b!1349419 (= res!895248 (not e!767615))))

(declare-fun res!895253 () Bool)

(assert (=> b!1349419 (=> (not res!895253) (not e!767615))))

(assert (=> b!1349419 (= res!895253 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45005 _keys!1571)))))

(declare-fun b!1349420 () Bool)

(assert (=> b!1349420 (= e!767625 e!767623)))

(declare-fun res!895250 () Bool)

(assert (=> b!1349420 (= res!895250 call!65184)))

(assert (=> b!1349420 (=> (not res!895250) (not e!767623))))

(declare-fun bm!65176 () Bool)

(declare-fun call!65183 () ListLongMap!21991)

(declare-fun call!65179 () ListLongMap!21991)

(assert (=> bm!65176 (= call!65183 call!65179)))

(declare-fun bm!65177 () Bool)

(declare-fun call!65178 () Bool)

(assert (=> bm!65177 (= call!65178 (contains!9193 lt!596522 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349421 () Bool)

(assert (=> b!1349421 (= e!767615 (validKeyInArray!0 (select (arr!44455 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun bm!65178 () Bool)

(declare-fun call!65181 () ListLongMap!21991)

(assert (=> bm!65178 (= call!65181 (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1349422 () Bool)

(assert (=> b!1349422 (= e!767613 (= (apply!1040 lt!596522 (select (arr!44455 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22463 (select (arr!44456 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3793 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349422 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45006 _values!1303)))))

(assert (=> b!1349422 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45005 _keys!1571)))))

(declare-fun b!1349423 () Bool)

(declare-fun e!767618 () ListLongMap!21991)

(assert (=> b!1349423 (= e!767618 call!65182)))

(declare-fun b!1349424 () Bool)

(declare-fun e!767614 () ListLongMap!21991)

(assert (=> b!1349424 (= e!767614 (+!4854 call!65180 (tuple2!24335 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1349425 () Bool)

(declare-fun e!767619 () Bool)

(assert (=> b!1349425 (= e!767617 e!767619)))

(declare-fun c!126569 () Bool)

(assert (=> b!1349425 (= c!126569 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1349426 () Bool)

(declare-fun e!767621 () Bool)

(assert (=> b!1349426 (= e!767621 (= (apply!1040 lt!596522 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1349427 () Bool)

(declare-fun e!767622 () ListLongMap!21991)

(assert (=> b!1349427 (= e!767622 call!65182)))

(declare-fun b!1349428 () Bool)

(assert (=> b!1349428 (= e!767619 e!767621)))

(declare-fun res!895252 () Bool)

(assert (=> b!1349428 (= res!895252 call!65178)))

(assert (=> b!1349428 (=> (not res!895252) (not e!767621))))

(declare-fun b!1349429 () Bool)

(assert (=> b!1349429 (= e!767614 e!767622)))

(declare-fun c!126572 () Bool)

(assert (=> b!1349429 (= c!126572 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1349430 () Bool)

(declare-fun e!767620 () Unit!44195)

(declare-fun Unit!44198 () Unit!44195)

(assert (=> b!1349430 (= e!767620 Unit!44198)))

(declare-fun b!1349431 () Bool)

(declare-fun res!895251 () Bool)

(assert (=> b!1349431 (=> (not res!895251) (not e!767617))))

(assert (=> b!1349431 (= res!895251 e!767625)))

(declare-fun c!126570 () Bool)

(assert (=> b!1349431 (= c!126570 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!65179 () Bool)

(assert (=> bm!65179 (= call!65179 call!65181)))

(declare-fun bm!65180 () Bool)

(declare-fun c!126567 () Bool)

(assert (=> bm!65180 (= call!65180 (+!4854 (ite c!126567 call!65181 (ite c!126572 call!65179 call!65183)) (ite (or c!126567 c!126572) (tuple2!24335 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24335 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun d!144659 () Bool)

(assert (=> d!144659 e!767617))

(declare-fun res!895249 () Bool)

(assert (=> d!144659 (=> (not res!895249) (not e!767617))))

(assert (=> d!144659 (= res!895249 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!45005 _keys!1571)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45005 _keys!1571)))))))

(declare-fun lt!596509 () ListLongMap!21991)

(assert (=> d!144659 (= lt!596522 lt!596509)))

(declare-fun lt!596514 () Unit!44195)

(assert (=> d!144659 (= lt!596514 e!767620)))

(declare-fun c!126571 () Bool)

(declare-fun e!767616 () Bool)

(assert (=> d!144659 (= c!126571 e!767616)))

(declare-fun res!895247 () Bool)

(assert (=> d!144659 (=> (not res!895247) (not e!767616))))

(assert (=> d!144659 (= res!895247 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45005 _keys!1571)))))

(assert (=> d!144659 (= lt!596509 e!767614)))

(assert (=> d!144659 (= c!126567 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144659 (validMask!0 mask!1977)))

(assert (=> d!144659 (= (getCurrentListMap!5959 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596522)))

(declare-fun b!1349432 () Bool)

(declare-fun c!126568 () Bool)

(assert (=> b!1349432 (= c!126568 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1349432 (= e!767622 e!767618)))

(declare-fun b!1349433 () Bool)

(assert (=> b!1349433 (= e!767619 (not call!65178))))

(declare-fun bm!65181 () Bool)

(assert (=> bm!65181 (= call!65184 (contains!9193 lt!596522 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349434 () Bool)

(assert (=> b!1349434 (= e!767616 (validKeyInArray!0 (select (arr!44455 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1349435 () Bool)

(assert (=> b!1349435 (= e!767618 call!65183)))

(declare-fun b!1349436 () Bool)

(declare-fun lt!596518 () Unit!44195)

(assert (=> b!1349436 (= e!767620 lt!596518)))

(declare-fun lt!596517 () ListLongMap!21991)

(assert (=> b!1349436 (= lt!596517 (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596520 () (_ BitVec 64))

(assert (=> b!1349436 (= lt!596520 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596516 () (_ BitVec 64))

(assert (=> b!1349436 (= lt!596516 (select (arr!44455 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596515 () Unit!44195)

(declare-fun addStillContains!1215 (ListLongMap!21991 (_ BitVec 64) V!55219 (_ BitVec 64)) Unit!44195)

(assert (=> b!1349436 (= lt!596515 (addStillContains!1215 lt!596517 lt!596520 zeroValue!1245 lt!596516))))

(assert (=> b!1349436 (contains!9193 (+!4854 lt!596517 (tuple2!24335 lt!596520 zeroValue!1245)) lt!596516)))

(declare-fun lt!596527 () Unit!44195)

(assert (=> b!1349436 (= lt!596527 lt!596515)))

(declare-fun lt!596524 () ListLongMap!21991)

(assert (=> b!1349436 (= lt!596524 (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596513 () (_ BitVec 64))

(assert (=> b!1349436 (= lt!596513 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596519 () (_ BitVec 64))

(assert (=> b!1349436 (= lt!596519 (select (arr!44455 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596526 () Unit!44195)

(declare-fun addApplyDifferent!582 (ListLongMap!21991 (_ BitVec 64) V!55219 (_ BitVec 64)) Unit!44195)

(assert (=> b!1349436 (= lt!596526 (addApplyDifferent!582 lt!596524 lt!596513 minValue!1245 lt!596519))))

(assert (=> b!1349436 (= (apply!1040 (+!4854 lt!596524 (tuple2!24335 lt!596513 minValue!1245)) lt!596519) (apply!1040 lt!596524 lt!596519))))

(declare-fun lt!596521 () Unit!44195)

(assert (=> b!1349436 (= lt!596521 lt!596526)))

(declare-fun lt!596529 () ListLongMap!21991)

(assert (=> b!1349436 (= lt!596529 (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596530 () (_ BitVec 64))

(assert (=> b!1349436 (= lt!596530 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596512 () (_ BitVec 64))

(assert (=> b!1349436 (= lt!596512 (select (arr!44455 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596528 () Unit!44195)

(assert (=> b!1349436 (= lt!596528 (addApplyDifferent!582 lt!596529 lt!596530 zeroValue!1245 lt!596512))))

(assert (=> b!1349436 (= (apply!1040 (+!4854 lt!596529 (tuple2!24335 lt!596530 zeroValue!1245)) lt!596512) (apply!1040 lt!596529 lt!596512))))

(declare-fun lt!596510 () Unit!44195)

(assert (=> b!1349436 (= lt!596510 lt!596528)))

(declare-fun lt!596523 () ListLongMap!21991)

(assert (=> b!1349436 (= lt!596523 (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596511 () (_ BitVec 64))

(assert (=> b!1349436 (= lt!596511 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596525 () (_ BitVec 64))

(assert (=> b!1349436 (= lt!596525 (select (arr!44455 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1349436 (= lt!596518 (addApplyDifferent!582 lt!596523 lt!596511 minValue!1245 lt!596525))))

(assert (=> b!1349436 (= (apply!1040 (+!4854 lt!596523 (tuple2!24335 lt!596511 minValue!1245)) lt!596525) (apply!1040 lt!596523 lt!596525))))

(assert (= (and d!144659 c!126567) b!1349424))

(assert (= (and d!144659 (not c!126567)) b!1349429))

(assert (= (and b!1349429 c!126572) b!1349427))

(assert (= (and b!1349429 (not c!126572)) b!1349432))

(assert (= (and b!1349432 c!126568) b!1349423))

(assert (= (and b!1349432 (not c!126568)) b!1349435))

(assert (= (or b!1349423 b!1349435) bm!65176))

(assert (= (or b!1349427 bm!65176) bm!65179))

(assert (= (or b!1349427 b!1349423) bm!65175))

(assert (= (or b!1349424 bm!65179) bm!65178))

(assert (= (or b!1349424 bm!65175) bm!65180))

(assert (= (and d!144659 res!895247) b!1349434))

(assert (= (and d!144659 c!126571) b!1349436))

(assert (= (and d!144659 (not c!126571)) b!1349430))

(assert (= (and d!144659 res!895249) b!1349419))

(assert (= (and b!1349419 res!895253) b!1349421))

(assert (= (and b!1349419 (not res!895248)) b!1349416))

(assert (= (and b!1349416 res!895255) b!1349422))

(assert (= (and b!1349419 res!895254) b!1349431))

(assert (= (and b!1349431 c!126570) b!1349420))

(assert (= (and b!1349431 (not c!126570)) b!1349418))

(assert (= (and b!1349420 res!895250) b!1349417))

(assert (= (or b!1349420 b!1349418) bm!65181))

(assert (= (and b!1349431 res!895251) b!1349425))

(assert (= (and b!1349425 c!126569) b!1349428))

(assert (= (and b!1349425 (not c!126569)) b!1349433))

(assert (= (and b!1349428 res!895252) b!1349426))

(assert (= (or b!1349428 b!1349433) bm!65177))

(declare-fun b_lambda!24703 () Bool)

(assert (=> (not b_lambda!24703) (not b!1349422)))

(assert (=> b!1349422 t!46139))

(declare-fun b_and!50981 () Bool)

(assert (= b_and!50975 (and (=> t!46139 result!26011) b_and!50981)))

(declare-fun m!1236489 () Bool)

(assert (=> b!1349417 m!1236489))

(assert (=> d!144659 m!1236431))

(declare-fun m!1236491 () Bool)

(assert (=> bm!65181 m!1236491))

(declare-fun m!1236493 () Bool)

(assert (=> bm!65177 m!1236493))

(declare-fun m!1236495 () Bool)

(assert (=> b!1349416 m!1236495))

(assert (=> b!1349416 m!1236495))

(declare-fun m!1236497 () Bool)

(assert (=> b!1349416 m!1236497))

(declare-fun m!1236499 () Bool)

(assert (=> b!1349426 m!1236499))

(assert (=> b!1349434 m!1236495))

(assert (=> b!1349434 m!1236495))

(declare-fun m!1236501 () Bool)

(assert (=> b!1349434 m!1236501))

(assert (=> b!1349421 m!1236495))

(assert (=> b!1349421 m!1236495))

(assert (=> b!1349421 m!1236501))

(assert (=> b!1349422 m!1236495))

(assert (=> b!1349422 m!1236413))

(declare-fun m!1236503 () Bool)

(assert (=> b!1349422 m!1236503))

(assert (=> b!1349422 m!1236503))

(assert (=> b!1349422 m!1236413))

(declare-fun m!1236505 () Bool)

(assert (=> b!1349422 m!1236505))

(assert (=> b!1349422 m!1236495))

(declare-fun m!1236507 () Bool)

(assert (=> b!1349422 m!1236507))

(declare-fun m!1236509 () Bool)

(assert (=> b!1349436 m!1236509))

(assert (=> b!1349436 m!1236409))

(declare-fun m!1236511 () Bool)

(assert (=> b!1349436 m!1236511))

(declare-fun m!1236513 () Bool)

(assert (=> b!1349436 m!1236513))

(declare-fun m!1236515 () Bool)

(assert (=> b!1349436 m!1236515))

(declare-fun m!1236517 () Bool)

(assert (=> b!1349436 m!1236517))

(declare-fun m!1236519 () Bool)

(assert (=> b!1349436 m!1236519))

(assert (=> b!1349436 m!1236517))

(declare-fun m!1236521 () Bool)

(assert (=> b!1349436 m!1236521))

(declare-fun m!1236523 () Bool)

(assert (=> b!1349436 m!1236523))

(declare-fun m!1236525 () Bool)

(assert (=> b!1349436 m!1236525))

(declare-fun m!1236527 () Bool)

(assert (=> b!1349436 m!1236527))

(declare-fun m!1236529 () Bool)

(assert (=> b!1349436 m!1236529))

(declare-fun m!1236531 () Bool)

(assert (=> b!1349436 m!1236531))

(assert (=> b!1349436 m!1236531))

(declare-fun m!1236533 () Bool)

(assert (=> b!1349436 m!1236533))

(assert (=> b!1349436 m!1236525))

(assert (=> b!1349436 m!1236511))

(declare-fun m!1236535 () Bool)

(assert (=> b!1349436 m!1236535))

(declare-fun m!1236537 () Bool)

(assert (=> b!1349436 m!1236537))

(assert (=> b!1349436 m!1236495))

(declare-fun m!1236539 () Bool)

(assert (=> b!1349424 m!1236539))

(declare-fun m!1236541 () Bool)

(assert (=> bm!65180 m!1236541))

(assert (=> bm!65178 m!1236409))

(assert (=> b!1349305 d!144659))

(declare-fun d!144661 () Bool)

(declare-fun e!767626 () Bool)

(assert (=> d!144661 e!767626))

(declare-fun res!895256 () Bool)

(assert (=> d!144661 (=> res!895256 e!767626)))

(declare-fun lt!596533 () Bool)

(assert (=> d!144661 (= res!895256 (not lt!596533))))

(declare-fun lt!596532 () Bool)

(assert (=> d!144661 (= lt!596533 lt!596532)))

(declare-fun lt!596531 () Unit!44195)

(declare-fun e!767627 () Unit!44195)

(assert (=> d!144661 (= lt!596531 e!767627)))

(declare-fun c!126573 () Bool)

(assert (=> d!144661 (= c!126573 lt!596532)))

(assert (=> d!144661 (= lt!596532 (containsKey!745 (toList!11011 lt!596443) k0!1142))))

(assert (=> d!144661 (= (contains!9193 lt!596443 k0!1142) lt!596533)))

(declare-fun b!1349437 () Bool)

(declare-fun lt!596534 () Unit!44195)

(assert (=> b!1349437 (= e!767627 lt!596534)))

(assert (=> b!1349437 (= lt!596534 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11011 lt!596443) k0!1142))))

(assert (=> b!1349437 (isDefined!530 (getValueByKey!723 (toList!11011 lt!596443) k0!1142))))

(declare-fun b!1349438 () Bool)

(declare-fun Unit!44199 () Unit!44195)

(assert (=> b!1349438 (= e!767627 Unit!44199)))

(declare-fun b!1349439 () Bool)

(assert (=> b!1349439 (= e!767626 (isDefined!530 (getValueByKey!723 (toList!11011 lt!596443) k0!1142)))))

(assert (= (and d!144661 c!126573) b!1349437))

(assert (= (and d!144661 (not c!126573)) b!1349438))

(assert (= (and d!144661 (not res!895256)) b!1349439))

(declare-fun m!1236543 () Bool)

(assert (=> d!144661 m!1236543))

(declare-fun m!1236545 () Bool)

(assert (=> b!1349437 m!1236545))

(declare-fun m!1236547 () Bool)

(assert (=> b!1349437 m!1236547))

(assert (=> b!1349437 m!1236547))

(declare-fun m!1236549 () Bool)

(assert (=> b!1349437 m!1236549))

(assert (=> b!1349439 m!1236547))

(assert (=> b!1349439 m!1236547))

(assert (=> b!1349439 m!1236549))

(assert (=> b!1349305 d!144661))

(declare-fun d!144663 () Bool)

(assert (=> d!144663 (contains!9193 lt!596443 k0!1142)))

(declare-fun lt!596537 () Unit!44195)

(declare-fun choose!1983 ((_ BitVec 64) (_ BitVec 64) V!55219 ListLongMap!21991) Unit!44195)

(assert (=> d!144663 (= lt!596537 (choose!1983 k0!1142 (select (arr!44455 _keys!1571) from!1960) lt!596441 lt!596443))))

(assert (=> d!144663 (contains!9193 (+!4854 lt!596443 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441)) k0!1142)))

(assert (=> d!144663 (= (lemmaInListMapAfterAddingDiffThenInBefore!410 k0!1142 (select (arr!44455 _keys!1571) from!1960) lt!596441 lt!596443) lt!596537)))

(declare-fun bs!38682 () Bool)

(assert (= bs!38682 d!144663))

(assert (=> bs!38682 m!1236425))

(assert (=> bs!38682 m!1236421))

(declare-fun m!1236551 () Bool)

(assert (=> bs!38682 m!1236551))

(assert (=> bs!38682 m!1236417))

(assert (=> bs!38682 m!1236417))

(assert (=> bs!38682 m!1236419))

(assert (=> b!1349305 d!144663))

(declare-fun d!144665 () Bool)

(assert (=> d!144665 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113678 d!144665))

(declare-fun d!144667 () Bool)

(assert (=> d!144667 (= (array_inv!33485 _keys!1571) (bvsge (size!45005 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113678 d!144667))

(declare-fun d!144669 () Bool)

(assert (=> d!144669 (= (array_inv!33486 _values!1303) (bvsge (size!45006 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113678 d!144669))

(declare-fun d!144671 () Bool)

(declare-fun e!767628 () Bool)

(assert (=> d!144671 e!767628))

(declare-fun res!895257 () Bool)

(assert (=> d!144671 (=> res!895257 e!767628)))

(declare-fun lt!596540 () Bool)

(assert (=> d!144671 (= res!895257 (not lt!596540))))

(declare-fun lt!596539 () Bool)

(assert (=> d!144671 (= lt!596540 lt!596539)))

(declare-fun lt!596538 () Unit!44195)

(declare-fun e!767629 () Unit!44195)

(assert (=> d!144671 (= lt!596538 e!767629)))

(declare-fun c!126574 () Bool)

(assert (=> d!144671 (= c!126574 lt!596539)))

(assert (=> d!144671 (= lt!596539 (containsKey!745 (toList!11011 (getCurrentListMap!5959 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> d!144671 (= (contains!9193 (getCurrentListMap!5959 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142) lt!596540)))

(declare-fun b!1349440 () Bool)

(declare-fun lt!596541 () Unit!44195)

(assert (=> b!1349440 (= e!767629 lt!596541)))

(assert (=> b!1349440 (= lt!596541 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11011 (getCurrentListMap!5959 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> b!1349440 (isDefined!530 (getValueByKey!723 (toList!11011 (getCurrentListMap!5959 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun b!1349441 () Bool)

(declare-fun Unit!44200 () Unit!44195)

(assert (=> b!1349441 (= e!767629 Unit!44200)))

(declare-fun b!1349442 () Bool)

(assert (=> b!1349442 (= e!767628 (isDefined!530 (getValueByKey!723 (toList!11011 (getCurrentListMap!5959 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144671 c!126574) b!1349440))

(assert (= (and d!144671 (not c!126574)) b!1349441))

(assert (= (and d!144671 (not res!895257)) b!1349442))

(declare-fun m!1236553 () Bool)

(assert (=> d!144671 m!1236553))

(declare-fun m!1236555 () Bool)

(assert (=> b!1349440 m!1236555))

(declare-fun m!1236557 () Bool)

(assert (=> b!1349440 m!1236557))

(assert (=> b!1349440 m!1236557))

(declare-fun m!1236559 () Bool)

(assert (=> b!1349440 m!1236559))

(assert (=> b!1349442 m!1236557))

(assert (=> b!1349442 m!1236557))

(assert (=> b!1349442 m!1236559))

(assert (=> b!1349314 d!144671))

(declare-fun b!1349443 () Bool)

(declare-fun e!767641 () Bool)

(declare-fun e!767630 () Bool)

(assert (=> b!1349443 (= e!767641 e!767630)))

(declare-fun res!895266 () Bool)

(assert (=> b!1349443 (=> (not res!895266) (not e!767630))))

(declare-fun lt!596555 () ListLongMap!21991)

(assert (=> b!1349443 (= res!895266 (contains!9193 lt!596555 (select (arr!44455 _keys!1571) from!1960)))))

(assert (=> b!1349443 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45005 _keys!1571)))))

(declare-fun b!1349444 () Bool)

(declare-fun e!767640 () Bool)

(assert (=> b!1349444 (= e!767640 (= (apply!1040 lt!596555 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun b!1349445 () Bool)

(declare-fun e!767642 () Bool)

(declare-fun call!65191 () Bool)

(assert (=> b!1349445 (= e!767642 (not call!65191))))

(declare-fun bm!65182 () Bool)

(declare-fun call!65189 () ListLongMap!21991)

(declare-fun call!65187 () ListLongMap!21991)

(assert (=> bm!65182 (= call!65189 call!65187)))

(declare-fun b!1349446 () Bool)

(declare-fun res!895265 () Bool)

(declare-fun e!767634 () Bool)

(assert (=> b!1349446 (=> (not res!895265) (not e!767634))))

(assert (=> b!1349446 (= res!895265 e!767641)))

(declare-fun res!895259 () Bool)

(assert (=> b!1349446 (=> res!895259 e!767641)))

(declare-fun e!767632 () Bool)

(assert (=> b!1349446 (= res!895259 (not e!767632))))

(declare-fun res!895264 () Bool)

(assert (=> b!1349446 (=> (not res!895264) (not e!767632))))

(assert (=> b!1349446 (= res!895264 (bvslt from!1960 (size!45005 _keys!1571)))))

(declare-fun b!1349447 () Bool)

(assert (=> b!1349447 (= e!767642 e!767640)))

(declare-fun res!895261 () Bool)

(assert (=> b!1349447 (= res!895261 call!65191)))

(assert (=> b!1349447 (=> (not res!895261) (not e!767640))))

(declare-fun bm!65183 () Bool)

(declare-fun call!65190 () ListLongMap!21991)

(declare-fun call!65186 () ListLongMap!21991)

(assert (=> bm!65183 (= call!65190 call!65186)))

(declare-fun bm!65184 () Bool)

(declare-fun call!65185 () Bool)

(assert (=> bm!65184 (= call!65185 (contains!9193 lt!596555 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349448 () Bool)

(assert (=> b!1349448 (= e!767632 (validKeyInArray!0 (select (arr!44455 _keys!1571) from!1960)))))

(declare-fun bm!65185 () Bool)

(declare-fun call!65188 () ListLongMap!21991)

(assert (=> bm!65185 (= call!65188 (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun b!1349449 () Bool)

(assert (=> b!1349449 (= e!767630 (= (apply!1040 lt!596555 (select (arr!44455 _keys!1571) from!1960)) (get!22463 (select (arr!44456 _values!1303) from!1960) (dynLambda!3793 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349449 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45006 _values!1303)))))

(assert (=> b!1349449 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45005 _keys!1571)))))

(declare-fun b!1349450 () Bool)

(declare-fun e!767635 () ListLongMap!21991)

(assert (=> b!1349450 (= e!767635 call!65189)))

(declare-fun b!1349451 () Bool)

(declare-fun e!767631 () ListLongMap!21991)

(assert (=> b!1349451 (= e!767631 (+!4854 call!65187 (tuple2!24335 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1349452 () Bool)

(declare-fun e!767636 () Bool)

(assert (=> b!1349452 (= e!767634 e!767636)))

(declare-fun c!126577 () Bool)

(assert (=> b!1349452 (= c!126577 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1349453 () Bool)

(declare-fun e!767638 () Bool)

(assert (=> b!1349453 (= e!767638 (= (apply!1040 lt!596555 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1349454 () Bool)

(declare-fun e!767639 () ListLongMap!21991)

(assert (=> b!1349454 (= e!767639 call!65189)))

(declare-fun b!1349455 () Bool)

(assert (=> b!1349455 (= e!767636 e!767638)))

(declare-fun res!895263 () Bool)

(assert (=> b!1349455 (= res!895263 call!65185)))

(assert (=> b!1349455 (=> (not res!895263) (not e!767638))))

(declare-fun b!1349456 () Bool)

(assert (=> b!1349456 (= e!767631 e!767639)))

(declare-fun c!126580 () Bool)

(assert (=> b!1349456 (= c!126580 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1349457 () Bool)

(declare-fun e!767637 () Unit!44195)

(declare-fun Unit!44201 () Unit!44195)

(assert (=> b!1349457 (= e!767637 Unit!44201)))

(declare-fun b!1349458 () Bool)

(declare-fun res!895262 () Bool)

(assert (=> b!1349458 (=> (not res!895262) (not e!767634))))

(assert (=> b!1349458 (= res!895262 e!767642)))

(declare-fun c!126578 () Bool)

(assert (=> b!1349458 (= c!126578 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!65186 () Bool)

(assert (=> bm!65186 (= call!65186 call!65188)))

(declare-fun c!126575 () Bool)

(declare-fun bm!65187 () Bool)

(assert (=> bm!65187 (= call!65187 (+!4854 (ite c!126575 call!65188 (ite c!126580 call!65186 call!65190)) (ite (or c!126575 c!126580) (tuple2!24335 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24335 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun d!144673 () Bool)

(assert (=> d!144673 e!767634))

(declare-fun res!895260 () Bool)

(assert (=> d!144673 (=> (not res!895260) (not e!767634))))

(assert (=> d!144673 (= res!895260 (or (bvsge from!1960 (size!45005 _keys!1571)) (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45005 _keys!1571)))))))

(declare-fun lt!596542 () ListLongMap!21991)

(assert (=> d!144673 (= lt!596555 lt!596542)))

(declare-fun lt!596547 () Unit!44195)

(assert (=> d!144673 (= lt!596547 e!767637)))

(declare-fun c!126579 () Bool)

(declare-fun e!767633 () Bool)

(assert (=> d!144673 (= c!126579 e!767633)))

(declare-fun res!895258 () Bool)

(assert (=> d!144673 (=> (not res!895258) (not e!767633))))

(assert (=> d!144673 (= res!895258 (bvslt from!1960 (size!45005 _keys!1571)))))

(assert (=> d!144673 (= lt!596542 e!767631)))

(assert (=> d!144673 (= c!126575 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144673 (validMask!0 mask!1977)))

(assert (=> d!144673 (= (getCurrentListMap!5959 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596555)))

(declare-fun b!1349459 () Bool)

(declare-fun c!126576 () Bool)

(assert (=> b!1349459 (= c!126576 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1349459 (= e!767639 e!767635)))

(declare-fun b!1349460 () Bool)

(assert (=> b!1349460 (= e!767636 (not call!65185))))

(declare-fun bm!65188 () Bool)

(assert (=> bm!65188 (= call!65191 (contains!9193 lt!596555 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349461 () Bool)

(assert (=> b!1349461 (= e!767633 (validKeyInArray!0 (select (arr!44455 _keys!1571) from!1960)))))

(declare-fun b!1349462 () Bool)

(assert (=> b!1349462 (= e!767635 call!65190)))

(declare-fun b!1349463 () Bool)

(declare-fun lt!596551 () Unit!44195)

(assert (=> b!1349463 (= e!767637 lt!596551)))

(declare-fun lt!596550 () ListLongMap!21991)

(assert (=> b!1349463 (= lt!596550 (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596553 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596553 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596549 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596549 (select (arr!44455 _keys!1571) from!1960))))

(declare-fun lt!596548 () Unit!44195)

(assert (=> b!1349463 (= lt!596548 (addStillContains!1215 lt!596550 lt!596553 zeroValue!1245 lt!596549))))

(assert (=> b!1349463 (contains!9193 (+!4854 lt!596550 (tuple2!24335 lt!596553 zeroValue!1245)) lt!596549)))

(declare-fun lt!596560 () Unit!44195)

(assert (=> b!1349463 (= lt!596560 lt!596548)))

(declare-fun lt!596557 () ListLongMap!21991)

(assert (=> b!1349463 (= lt!596557 (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596546 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596546 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596552 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596552 (select (arr!44455 _keys!1571) from!1960))))

(declare-fun lt!596559 () Unit!44195)

(assert (=> b!1349463 (= lt!596559 (addApplyDifferent!582 lt!596557 lt!596546 minValue!1245 lt!596552))))

(assert (=> b!1349463 (= (apply!1040 (+!4854 lt!596557 (tuple2!24335 lt!596546 minValue!1245)) lt!596552) (apply!1040 lt!596557 lt!596552))))

(declare-fun lt!596554 () Unit!44195)

(assert (=> b!1349463 (= lt!596554 lt!596559)))

(declare-fun lt!596562 () ListLongMap!21991)

(assert (=> b!1349463 (= lt!596562 (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596563 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596563 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596545 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596545 (select (arr!44455 _keys!1571) from!1960))))

(declare-fun lt!596561 () Unit!44195)

(assert (=> b!1349463 (= lt!596561 (addApplyDifferent!582 lt!596562 lt!596563 zeroValue!1245 lt!596545))))

(assert (=> b!1349463 (= (apply!1040 (+!4854 lt!596562 (tuple2!24335 lt!596563 zeroValue!1245)) lt!596545) (apply!1040 lt!596562 lt!596545))))

(declare-fun lt!596543 () Unit!44195)

(assert (=> b!1349463 (= lt!596543 lt!596561)))

(declare-fun lt!596556 () ListLongMap!21991)

(assert (=> b!1349463 (= lt!596556 (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596544 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596544 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596558 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596558 (select (arr!44455 _keys!1571) from!1960))))

(assert (=> b!1349463 (= lt!596551 (addApplyDifferent!582 lt!596556 lt!596544 minValue!1245 lt!596558))))

(assert (=> b!1349463 (= (apply!1040 (+!4854 lt!596556 (tuple2!24335 lt!596544 minValue!1245)) lt!596558) (apply!1040 lt!596556 lt!596558))))

(assert (= (and d!144673 c!126575) b!1349451))

(assert (= (and d!144673 (not c!126575)) b!1349456))

(assert (= (and b!1349456 c!126580) b!1349454))

(assert (= (and b!1349456 (not c!126580)) b!1349459))

(assert (= (and b!1349459 c!126576) b!1349450))

(assert (= (and b!1349459 (not c!126576)) b!1349462))

(assert (= (or b!1349450 b!1349462) bm!65183))

(assert (= (or b!1349454 bm!65183) bm!65186))

(assert (= (or b!1349454 b!1349450) bm!65182))

(assert (= (or b!1349451 bm!65186) bm!65185))

(assert (= (or b!1349451 bm!65182) bm!65187))

(assert (= (and d!144673 res!895258) b!1349461))

(assert (= (and d!144673 c!126579) b!1349463))

(assert (= (and d!144673 (not c!126579)) b!1349457))

(assert (= (and d!144673 res!895260) b!1349446))

(assert (= (and b!1349446 res!895264) b!1349448))

(assert (= (and b!1349446 (not res!895259)) b!1349443))

(assert (= (and b!1349443 res!895266) b!1349449))

(assert (= (and b!1349446 res!895265) b!1349458))

(assert (= (and b!1349458 c!126578) b!1349447))

(assert (= (and b!1349458 (not c!126578)) b!1349445))

(assert (= (and b!1349447 res!895261) b!1349444))

(assert (= (or b!1349447 b!1349445) bm!65188))

(assert (= (and b!1349458 res!895262) b!1349452))

(assert (= (and b!1349452 c!126577) b!1349455))

(assert (= (and b!1349452 (not c!126577)) b!1349460))

(assert (= (and b!1349455 res!895263) b!1349453))

(assert (= (or b!1349455 b!1349460) bm!65184))

(declare-fun b_lambda!24705 () Bool)

(assert (=> (not b_lambda!24705) (not b!1349449)))

(assert (=> b!1349449 t!46139))

(declare-fun b_and!50983 () Bool)

(assert (= b_and!50981 (and (=> t!46139 result!26011) b_and!50983)))

(declare-fun m!1236561 () Bool)

(assert (=> b!1349444 m!1236561))

(assert (=> d!144673 m!1236431))

(declare-fun m!1236563 () Bool)

(assert (=> bm!65188 m!1236563))

(declare-fun m!1236565 () Bool)

(assert (=> bm!65184 m!1236565))

(assert (=> b!1349443 m!1236421))

(assert (=> b!1349443 m!1236421))

(declare-fun m!1236567 () Bool)

(assert (=> b!1349443 m!1236567))

(declare-fun m!1236569 () Bool)

(assert (=> b!1349453 m!1236569))

(assert (=> b!1349461 m!1236421))

(assert (=> b!1349461 m!1236421))

(assert (=> b!1349461 m!1236439))

(assert (=> b!1349448 m!1236421))

(assert (=> b!1349448 m!1236421))

(assert (=> b!1349448 m!1236439))

(assert (=> b!1349449 m!1236421))

(assert (=> b!1349449 m!1236413))

(assert (=> b!1349449 m!1236411))

(assert (=> b!1349449 m!1236411))

(assert (=> b!1349449 m!1236413))

(assert (=> b!1349449 m!1236415))

(assert (=> b!1349449 m!1236421))

(declare-fun m!1236571 () Bool)

(assert (=> b!1349449 m!1236571))

(declare-fun m!1236573 () Bool)

(assert (=> b!1349463 m!1236573))

(declare-fun m!1236575 () Bool)

(assert (=> b!1349463 m!1236575))

(declare-fun m!1236577 () Bool)

(assert (=> b!1349463 m!1236577))

(declare-fun m!1236579 () Bool)

(assert (=> b!1349463 m!1236579))

(declare-fun m!1236581 () Bool)

(assert (=> b!1349463 m!1236581))

(declare-fun m!1236583 () Bool)

(assert (=> b!1349463 m!1236583))

(declare-fun m!1236585 () Bool)

(assert (=> b!1349463 m!1236585))

(assert (=> b!1349463 m!1236583))

(declare-fun m!1236587 () Bool)

(assert (=> b!1349463 m!1236587))

(declare-fun m!1236589 () Bool)

(assert (=> b!1349463 m!1236589))

(declare-fun m!1236591 () Bool)

(assert (=> b!1349463 m!1236591))

(declare-fun m!1236593 () Bool)

(assert (=> b!1349463 m!1236593))

(declare-fun m!1236595 () Bool)

(assert (=> b!1349463 m!1236595))

(declare-fun m!1236597 () Bool)

(assert (=> b!1349463 m!1236597))

(assert (=> b!1349463 m!1236597))

(declare-fun m!1236599 () Bool)

(assert (=> b!1349463 m!1236599))

(assert (=> b!1349463 m!1236591))

(assert (=> b!1349463 m!1236577))

(declare-fun m!1236601 () Bool)

(assert (=> b!1349463 m!1236601))

(declare-fun m!1236603 () Bool)

(assert (=> b!1349463 m!1236603))

(assert (=> b!1349463 m!1236421))

(declare-fun m!1236605 () Bool)

(assert (=> b!1349451 m!1236605))

(declare-fun m!1236607 () Bool)

(assert (=> bm!65187 m!1236607))

(assert (=> bm!65185 m!1236575))

(assert (=> b!1349314 d!144673))

(declare-fun bm!65191 () Bool)

(declare-fun call!65194 () Bool)

(assert (=> bm!65191 (= call!65194 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1349472 () Bool)

(declare-fun e!767651 () Bool)

(assert (=> b!1349472 (= e!767651 call!65194)))

(declare-fun d!144675 () Bool)

(declare-fun res!895271 () Bool)

(declare-fun e!767649 () Bool)

(assert (=> d!144675 (=> res!895271 e!767649)))

(assert (=> d!144675 (= res!895271 (bvsge #b00000000000000000000000000000000 (size!45005 _keys!1571)))))

(assert (=> d!144675 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!767649)))

(declare-fun b!1349473 () Bool)

(declare-fun e!767650 () Bool)

(assert (=> b!1349473 (= e!767650 call!65194)))

(declare-fun b!1349474 () Bool)

(assert (=> b!1349474 (= e!767651 e!767650)))

(declare-fun lt!596572 () (_ BitVec 64))

(assert (=> b!1349474 (= lt!596572 (select (arr!44455 _keys!1571) #b00000000000000000000000000000000))))

(declare-fun lt!596571 () Unit!44195)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!92004 (_ BitVec 64) (_ BitVec 32)) Unit!44195)

(assert (=> b!1349474 (= lt!596571 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596572 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!92004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1349474 (arrayContainsKey!0 _keys!1571 lt!596572 #b00000000000000000000000000000000)))

(declare-fun lt!596570 () Unit!44195)

(assert (=> b!1349474 (= lt!596570 lt!596571)))

(declare-fun res!895272 () Bool)

(declare-datatypes ((SeekEntryResult!10059 0))(
  ( (MissingZero!10059 (index!42607 (_ BitVec 32))) (Found!10059 (index!42608 (_ BitVec 32))) (Intermediate!10059 (undefined!10871 Bool) (index!42609 (_ BitVec 32)) (x!120760 (_ BitVec 32))) (Undefined!10059) (MissingVacant!10059 (index!42610 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!92004 (_ BitVec 32)) SeekEntryResult!10059)

(assert (=> b!1349474 (= res!895272 (= (seekEntryOrOpen!0 (select (arr!44455 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10059 #b00000000000000000000000000000000)))))

(assert (=> b!1349474 (=> (not res!895272) (not e!767650))))

(declare-fun b!1349475 () Bool)

(assert (=> b!1349475 (= e!767649 e!767651)))

(declare-fun c!126583 () Bool)

(assert (=> b!1349475 (= c!126583 (validKeyInArray!0 (select (arr!44455 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144675 (not res!895271)) b!1349475))

(assert (= (and b!1349475 c!126583) b!1349474))

(assert (= (and b!1349475 (not c!126583)) b!1349472))

(assert (= (and b!1349474 res!895272) b!1349473))

(assert (= (or b!1349473 b!1349472) bm!65191))

(declare-fun m!1236609 () Bool)

(assert (=> bm!65191 m!1236609))

(declare-fun m!1236611 () Bool)

(assert (=> b!1349474 m!1236611))

(declare-fun m!1236613 () Bool)

(assert (=> b!1349474 m!1236613))

(declare-fun m!1236615 () Bool)

(assert (=> b!1349474 m!1236615))

(assert (=> b!1349474 m!1236611))

(declare-fun m!1236617 () Bool)

(assert (=> b!1349474 m!1236617))

(assert (=> b!1349475 m!1236611))

(assert (=> b!1349475 m!1236611))

(declare-fun m!1236619 () Bool)

(assert (=> b!1349475 m!1236619))

(assert (=> b!1349309 d!144675))

(declare-fun d!144677 () Bool)

(declare-fun e!767652 () Bool)

(assert (=> d!144677 e!767652))

(declare-fun res!895273 () Bool)

(assert (=> d!144677 (=> res!895273 e!767652)))

(declare-fun lt!596575 () Bool)

(assert (=> d!144677 (= res!895273 (not lt!596575))))

(declare-fun lt!596574 () Bool)

(assert (=> d!144677 (= lt!596575 lt!596574)))

(declare-fun lt!596573 () Unit!44195)

(declare-fun e!767653 () Unit!44195)

(assert (=> d!144677 (= lt!596573 e!767653)))

(declare-fun c!126584 () Bool)

(assert (=> d!144677 (= c!126584 lt!596574)))

(assert (=> d!144677 (= lt!596574 (containsKey!745 (toList!11011 (+!4854 lt!596443 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441))) k0!1142))))

(assert (=> d!144677 (= (contains!9193 (+!4854 lt!596443 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441)) k0!1142) lt!596575)))

(declare-fun b!1349476 () Bool)

(declare-fun lt!596576 () Unit!44195)

(assert (=> b!1349476 (= e!767653 lt!596576)))

(assert (=> b!1349476 (= lt!596576 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11011 (+!4854 lt!596443 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441))) k0!1142))))

(assert (=> b!1349476 (isDefined!530 (getValueByKey!723 (toList!11011 (+!4854 lt!596443 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441))) k0!1142))))

(declare-fun b!1349477 () Bool)

(declare-fun Unit!44202 () Unit!44195)

(assert (=> b!1349477 (= e!767653 Unit!44202)))

(declare-fun b!1349478 () Bool)

(assert (=> b!1349478 (= e!767652 (isDefined!530 (getValueByKey!723 (toList!11011 (+!4854 lt!596443 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441))) k0!1142)))))

(assert (= (and d!144677 c!126584) b!1349476))

(assert (= (and d!144677 (not c!126584)) b!1349477))

(assert (= (and d!144677 (not res!895273)) b!1349478))

(declare-fun m!1236621 () Bool)

(assert (=> d!144677 m!1236621))

(declare-fun m!1236623 () Bool)

(assert (=> b!1349476 m!1236623))

(declare-fun m!1236625 () Bool)

(assert (=> b!1349476 m!1236625))

(assert (=> b!1349476 m!1236625))

(declare-fun m!1236627 () Bool)

(assert (=> b!1349476 m!1236627))

(assert (=> b!1349478 m!1236625))

(assert (=> b!1349478 m!1236625))

(assert (=> b!1349478 m!1236627))

(assert (=> b!1349313 d!144677))

(declare-fun d!144679 () Bool)

(declare-fun e!767656 () Bool)

(assert (=> d!144679 e!767656))

(declare-fun res!895278 () Bool)

(assert (=> d!144679 (=> (not res!895278) (not e!767656))))

(declare-fun lt!596587 () ListLongMap!21991)

(assert (=> d!144679 (= res!895278 (contains!9193 lt!596587 (_1!12178 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441))))))

(declare-fun lt!596585 () List!31486)

(assert (=> d!144679 (= lt!596587 (ListLongMap!21992 lt!596585))))

(declare-fun lt!596588 () Unit!44195)

(declare-fun lt!596586 () Unit!44195)

(assert (=> d!144679 (= lt!596588 lt!596586)))

(assert (=> d!144679 (= (getValueByKey!723 lt!596585 (_1!12178 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441))) (Some!774 (_2!12178 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441))))))

(declare-fun lemmaContainsTupThenGetReturnValue!368 (List!31486 (_ BitVec 64) V!55219) Unit!44195)

(assert (=> d!144679 (= lt!596586 (lemmaContainsTupThenGetReturnValue!368 lt!596585 (_1!12178 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441)) (_2!12178 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441))))))

(declare-fun insertStrictlySorted!497 (List!31486 (_ BitVec 64) V!55219) List!31486)

(assert (=> d!144679 (= lt!596585 (insertStrictlySorted!497 (toList!11011 lt!596443) (_1!12178 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441)) (_2!12178 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441))))))

(assert (=> d!144679 (= (+!4854 lt!596443 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441)) lt!596587)))

(declare-fun b!1349483 () Bool)

(declare-fun res!895279 () Bool)

(assert (=> b!1349483 (=> (not res!895279) (not e!767656))))

(assert (=> b!1349483 (= res!895279 (= (getValueByKey!723 (toList!11011 lt!596587) (_1!12178 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441))) (Some!774 (_2!12178 (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441)))))))

(declare-fun b!1349484 () Bool)

(declare-fun contains!9195 (List!31486 tuple2!24334) Bool)

(assert (=> b!1349484 (= e!767656 (contains!9195 (toList!11011 lt!596587) (tuple2!24335 (select (arr!44455 _keys!1571) from!1960) lt!596441)))))

(assert (= (and d!144679 res!895278) b!1349483))

(assert (= (and b!1349483 res!895279) b!1349484))

(declare-fun m!1236629 () Bool)

(assert (=> d!144679 m!1236629))

(declare-fun m!1236631 () Bool)

(assert (=> d!144679 m!1236631))

(declare-fun m!1236633 () Bool)

(assert (=> d!144679 m!1236633))

(declare-fun m!1236635 () Bool)

(assert (=> d!144679 m!1236635))

(declare-fun m!1236637 () Bool)

(assert (=> b!1349483 m!1236637))

(declare-fun m!1236639 () Bool)

(assert (=> b!1349484 m!1236639))

(assert (=> b!1349313 d!144679))

(declare-fun b!1349509 () Bool)

(declare-fun e!767673 () Bool)

(declare-fun e!767675 () Bool)

(assert (=> b!1349509 (= e!767673 e!767675)))

(declare-fun c!126595 () Bool)

(declare-fun e!767671 () Bool)

(assert (=> b!1349509 (= c!126595 e!767671)))

(declare-fun res!895291 () Bool)

(assert (=> b!1349509 (=> (not res!895291) (not e!767671))))

(assert (=> b!1349509 (= res!895291 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45005 _keys!1571)))))

(declare-fun b!1349510 () Bool)

(declare-fun e!767674 () ListLongMap!21991)

(declare-fun e!767672 () ListLongMap!21991)

(assert (=> b!1349510 (= e!767674 e!767672)))

(declare-fun c!126596 () Bool)

(assert (=> b!1349510 (= c!126596 (validKeyInArray!0 (select (arr!44455 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun call!65197 () ListLongMap!21991)

(declare-fun bm!65194 () Bool)

(assert (=> bm!65194 (= call!65197 (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun d!144681 () Bool)

(assert (=> d!144681 e!767673))

(declare-fun res!895290 () Bool)

(assert (=> d!144681 (=> (not res!895290) (not e!767673))))

(declare-fun lt!596606 () ListLongMap!21991)

(assert (=> d!144681 (= res!895290 (not (contains!9193 lt!596606 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144681 (= lt!596606 e!767674)))

(declare-fun c!126594 () Bool)

(assert (=> d!144681 (= c!126594 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!45005 _keys!1571)))))

(assert (=> d!144681 (validMask!0 mask!1977)))

(assert (=> d!144681 (= (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596606)))

(declare-fun b!1349511 () Bool)

(declare-fun e!767676 () Bool)

(declare-fun isEmpty!1098 (ListLongMap!21991) Bool)

(assert (=> b!1349511 (= e!767676 (isEmpty!1098 lt!596606))))

(declare-fun b!1349512 () Bool)

(assert (=> b!1349512 (= e!767671 (validKeyInArray!0 (select (arr!44455 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349512 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))

(declare-fun b!1349513 () Bool)

(declare-fun res!895288 () Bool)

(assert (=> b!1349513 (=> (not res!895288) (not e!767673))))

(assert (=> b!1349513 (= res!895288 (not (contains!9193 lt!596606 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1349514 () Bool)

(assert (=> b!1349514 (= e!767672 call!65197)))

(declare-fun b!1349515 () Bool)

(declare-fun lt!596603 () Unit!44195)

(declare-fun lt!596607 () Unit!44195)

(assert (=> b!1349515 (= lt!596603 lt!596607)))

(declare-fun lt!596608 () (_ BitVec 64))

(declare-fun lt!596605 () V!55219)

(declare-fun lt!596609 () (_ BitVec 64))

(declare-fun lt!596604 () ListLongMap!21991)

(assert (=> b!1349515 (not (contains!9193 (+!4854 lt!596604 (tuple2!24335 lt!596609 lt!596605)) lt!596608))))

(declare-fun addStillNotContains!504 (ListLongMap!21991 (_ BitVec 64) V!55219 (_ BitVec 64)) Unit!44195)

(assert (=> b!1349515 (= lt!596607 (addStillNotContains!504 lt!596604 lt!596609 lt!596605 lt!596608))))

(assert (=> b!1349515 (= lt!596608 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1349515 (= lt!596605 (get!22463 (select (arr!44456 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3793 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1349515 (= lt!596609 (select (arr!44455 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1349515 (= lt!596604 call!65197)))

(assert (=> b!1349515 (= e!767672 (+!4854 call!65197 (tuple2!24335 (select (arr!44455 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22463 (select (arr!44456 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3793 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1349516 () Bool)

(assert (=> b!1349516 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45005 _keys!1571)))))

(assert (=> b!1349516 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45006 _values!1303)))))

(declare-fun e!767677 () Bool)

(assert (=> b!1349516 (= e!767677 (= (apply!1040 lt!596606 (select (arr!44455 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22463 (select (arr!44456 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3793 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349517 () Bool)

(assert (=> b!1349517 (= e!767675 e!767677)))

(assert (=> b!1349517 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45005 _keys!1571)))))

(declare-fun res!895289 () Bool)

(assert (=> b!1349517 (= res!895289 (contains!9193 lt!596606 (select (arr!44455 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349517 (=> (not res!895289) (not e!767677))))

(declare-fun b!1349518 () Bool)

(assert (=> b!1349518 (= e!767676 (= lt!596606 (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1349519 () Bool)

(assert (=> b!1349519 (= e!767674 (ListLongMap!21992 Nil!31483))))

(declare-fun b!1349520 () Bool)

(assert (=> b!1349520 (= e!767675 e!767676)))

(declare-fun c!126593 () Bool)

(assert (=> b!1349520 (= c!126593 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45005 _keys!1571)))))

(assert (= (and d!144681 c!126594) b!1349519))

(assert (= (and d!144681 (not c!126594)) b!1349510))

(assert (= (and b!1349510 c!126596) b!1349515))

(assert (= (and b!1349510 (not c!126596)) b!1349514))

(assert (= (or b!1349515 b!1349514) bm!65194))

(assert (= (and d!144681 res!895290) b!1349513))

(assert (= (and b!1349513 res!895288) b!1349509))

(assert (= (and b!1349509 res!895291) b!1349512))

(assert (= (and b!1349509 c!126595) b!1349517))

(assert (= (and b!1349509 (not c!126595)) b!1349520))

(assert (= (and b!1349517 res!895289) b!1349516))

(assert (= (and b!1349520 c!126593) b!1349518))

(assert (= (and b!1349520 (not c!126593)) b!1349511))

(declare-fun b_lambda!24707 () Bool)

(assert (=> (not b_lambda!24707) (not b!1349515)))

(assert (=> b!1349515 t!46139))

(declare-fun b_and!50985 () Bool)

(assert (= b_and!50983 (and (=> t!46139 result!26011) b_and!50985)))

(declare-fun b_lambda!24709 () Bool)

(assert (=> (not b_lambda!24709) (not b!1349516)))

(assert (=> b!1349516 t!46139))

(declare-fun b_and!50987 () Bool)

(assert (= b_and!50985 (and (=> t!46139 result!26011) b_and!50987)))

(assert (=> b!1349515 m!1236503))

(declare-fun m!1236641 () Bool)

(assert (=> b!1349515 m!1236641))

(assert (=> b!1349515 m!1236495))

(declare-fun m!1236643 () Bool)

(assert (=> b!1349515 m!1236643))

(declare-fun m!1236645 () Bool)

(assert (=> b!1349515 m!1236645))

(assert (=> b!1349515 m!1236413))

(assert (=> b!1349515 m!1236643))

(declare-fun m!1236647 () Bool)

(assert (=> b!1349515 m!1236647))

(assert (=> b!1349515 m!1236503))

(assert (=> b!1349515 m!1236413))

(assert (=> b!1349515 m!1236505))

(declare-fun m!1236649 () Bool)

(assert (=> b!1349511 m!1236649))

(declare-fun m!1236651 () Bool)

(assert (=> b!1349518 m!1236651))

(declare-fun m!1236653 () Bool)

(assert (=> d!144681 m!1236653))

(assert (=> d!144681 m!1236431))

(assert (=> bm!65194 m!1236651))

(assert (=> b!1349516 m!1236503))

(assert (=> b!1349516 m!1236495))

(assert (=> b!1349516 m!1236413))

(assert (=> b!1349516 m!1236495))

(declare-fun m!1236655 () Bool)

(assert (=> b!1349516 m!1236655))

(assert (=> b!1349516 m!1236503))

(assert (=> b!1349516 m!1236413))

(assert (=> b!1349516 m!1236505))

(declare-fun m!1236657 () Bool)

(assert (=> b!1349513 m!1236657))

(assert (=> b!1349512 m!1236495))

(assert (=> b!1349512 m!1236495))

(assert (=> b!1349512 m!1236501))

(assert (=> b!1349517 m!1236495))

(assert (=> b!1349517 m!1236495))

(declare-fun m!1236659 () Bool)

(assert (=> b!1349517 m!1236659))

(assert (=> b!1349510 m!1236495))

(assert (=> b!1349510 m!1236495))

(assert (=> b!1349510 m!1236501))

(assert (=> b!1349313 d!144681))

(declare-fun d!144683 () Bool)

(declare-fun c!126599 () Bool)

(assert (=> d!144683 (= c!126599 ((_ is ValueCellFull!17895) (select (arr!44456 _values!1303) from!1960)))))

(declare-fun e!767680 () V!55219)

(assert (=> d!144683 (= (get!22463 (select (arr!44456 _values!1303) from!1960) (dynLambda!3793 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!767680)))

(declare-fun b!1349525 () Bool)

(declare-fun get!22464 (ValueCell!17895 V!55219) V!55219)

(assert (=> b!1349525 (= e!767680 (get!22464 (select (arr!44456 _values!1303) from!1960) (dynLambda!3793 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1349526 () Bool)

(declare-fun get!22465 (ValueCell!17895 V!55219) V!55219)

(assert (=> b!1349526 (= e!767680 (get!22465 (select (arr!44456 _values!1303) from!1960) (dynLambda!3793 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144683 c!126599) b!1349525))

(assert (= (and d!144683 (not c!126599)) b!1349526))

(assert (=> b!1349525 m!1236411))

(assert (=> b!1349525 m!1236413))

(declare-fun m!1236661 () Bool)

(assert (=> b!1349525 m!1236661))

(assert (=> b!1349526 m!1236411))

(assert (=> b!1349526 m!1236413))

(declare-fun m!1236663 () Bool)

(assert (=> b!1349526 m!1236663))

(assert (=> b!1349313 d!144683))

(declare-fun b!1349537 () Bool)

(declare-fun e!767691 () Bool)

(declare-fun e!767689 () Bool)

(assert (=> b!1349537 (= e!767691 e!767689)))

(declare-fun res!895300 () Bool)

(assert (=> b!1349537 (=> (not res!895300) (not e!767689))))

(declare-fun e!767692 () Bool)

(assert (=> b!1349537 (= res!895300 (not e!767692))))

(declare-fun res!895299 () Bool)

(assert (=> b!1349537 (=> (not res!895299) (not e!767692))))

(assert (=> b!1349537 (= res!895299 (validKeyInArray!0 (select (arr!44455 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349538 () Bool)

(declare-fun e!767690 () Bool)

(declare-fun call!65200 () Bool)

(assert (=> b!1349538 (= e!767690 call!65200)))

(declare-fun bm!65197 () Bool)

(declare-fun c!126602 () Bool)

(assert (=> bm!65197 (= call!65200 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126602 (Cons!31483 (select (arr!44455 _keys!1571) #b00000000000000000000000000000000) Nil!31484) Nil!31484)))))

(declare-fun b!1349539 () Bool)

(declare-fun contains!9196 (List!31487 (_ BitVec 64)) Bool)

(assert (=> b!1349539 (= e!767692 (contains!9196 Nil!31484 (select (arr!44455 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349541 () Bool)

(assert (=> b!1349541 (= e!767689 e!767690)))

(assert (=> b!1349541 (= c!126602 (validKeyInArray!0 (select (arr!44455 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349540 () Bool)

(assert (=> b!1349540 (= e!767690 call!65200)))

(declare-fun d!144685 () Bool)

(declare-fun res!895298 () Bool)

(assert (=> d!144685 (=> res!895298 e!767691)))

(assert (=> d!144685 (= res!895298 (bvsge #b00000000000000000000000000000000 (size!45005 _keys!1571)))))

(assert (=> d!144685 (= (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31484) e!767691)))

(assert (= (and d!144685 (not res!895298)) b!1349537))

(assert (= (and b!1349537 res!895299) b!1349539))

(assert (= (and b!1349537 res!895300) b!1349541))

(assert (= (and b!1349541 c!126602) b!1349538))

(assert (= (and b!1349541 (not c!126602)) b!1349540))

(assert (= (or b!1349538 b!1349540) bm!65197))

(assert (=> b!1349537 m!1236611))

(assert (=> b!1349537 m!1236611))

(assert (=> b!1349537 m!1236619))

(assert (=> bm!65197 m!1236611))

(declare-fun m!1236665 () Bool)

(assert (=> bm!65197 m!1236665))

(assert (=> b!1349539 m!1236611))

(assert (=> b!1349539 m!1236611))

(declare-fun m!1236667 () Bool)

(assert (=> b!1349539 m!1236667))

(assert (=> b!1349541 m!1236611))

(assert (=> b!1349541 m!1236611))

(assert (=> b!1349541 m!1236619))

(assert (=> b!1349312 d!144685))

(declare-fun d!144687 () Bool)

(assert (=> d!144687 (= (validKeyInArray!0 (select (arr!44455 _keys!1571) from!1960)) (and (not (= (select (arr!44455 _keys!1571) from!1960) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44455 _keys!1571) from!1960) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349306 d!144687))

(declare-fun mapNonEmpty!58104 () Bool)

(declare-fun mapRes!58104 () Bool)

(declare-fun tp!110586 () Bool)

(declare-fun e!767697 () Bool)

(assert (=> mapNonEmpty!58104 (= mapRes!58104 (and tp!110586 e!767697))))

(declare-fun mapKey!58104 () (_ BitVec 32))

(declare-fun mapRest!58104 () (Array (_ BitVec 32) ValueCell!17895))

(declare-fun mapValue!58104 () ValueCell!17895)

(assert (=> mapNonEmpty!58104 (= mapRest!58098 (store mapRest!58104 mapKey!58104 mapValue!58104))))

(declare-fun condMapEmpty!58104 () Bool)

(declare-fun mapDefault!58104 () ValueCell!17895)

(assert (=> mapNonEmpty!58098 (= condMapEmpty!58104 (= mapRest!58098 ((as const (Array (_ BitVec 32) ValueCell!17895)) mapDefault!58104)))))

(declare-fun e!767698 () Bool)

(assert (=> mapNonEmpty!58098 (= tp!110577 (and e!767698 mapRes!58104))))

(declare-fun mapIsEmpty!58104 () Bool)

(assert (=> mapIsEmpty!58104 mapRes!58104))

(declare-fun b!1349549 () Bool)

(assert (=> b!1349549 (= e!767698 tp_is_empty!37587)))

(declare-fun b!1349548 () Bool)

(assert (=> b!1349548 (= e!767697 tp_is_empty!37587)))

(assert (= (and mapNonEmpty!58098 condMapEmpty!58104) mapIsEmpty!58104))

(assert (= (and mapNonEmpty!58098 (not condMapEmpty!58104)) mapNonEmpty!58104))

(assert (= (and mapNonEmpty!58104 ((_ is ValueCellFull!17895) mapValue!58104)) b!1349548))

(assert (= (and mapNonEmpty!58098 ((_ is ValueCellFull!17895) mapDefault!58104)) b!1349549))

(declare-fun m!1236669 () Bool)

(assert (=> mapNonEmpty!58104 m!1236669))

(declare-fun b_lambda!24711 () Bool)

(assert (= b_lambda!24703 (or (and start!113678 b_free!31587) b_lambda!24711)))

(declare-fun b_lambda!24713 () Bool)

(assert (= b_lambda!24709 (or (and start!113678 b_free!31587) b_lambda!24713)))

(declare-fun b_lambda!24715 () Bool)

(assert (= b_lambda!24705 (or (and start!113678 b_free!31587) b_lambda!24715)))

(declare-fun b_lambda!24717 () Bool)

(assert (= b_lambda!24707 (or (and start!113678 b_free!31587) b_lambda!24717)))

(check-sat (not b!1349417) (not b_lambda!24701) (not bm!65181) (not b!1349448) (not bm!65185) (not mapNonEmpty!58104) (not bm!65187) (not b!1349510) (not b!1349373) (not b!1349371) (not b!1349444) (not b_lambda!24713) (not b!1349426) (not b!1349512) (not bm!65194) (not b!1349461) (not d!144681) (not b!1349453) (not b!1349518) tp_is_empty!37587 (not b_next!31587) (not bm!65188) (not b!1349439) (not bm!65178) (not b!1349517) (not b!1349539) (not b!1349478) (not b!1349463) (not d!144661) (not b!1349476) (not b!1349451) (not d!144679) (not b!1349443) (not d!144671) (not b!1349424) (not bm!65180) (not b!1349475) (not b!1349421) (not bm!65184) (not b!1349511) (not b!1349513) (not b_lambda!24711) (not d!144659) (not b_lambda!24717) (not b!1349437) (not b!1349526) (not bm!65191) (not d!144663) (not b_lambda!24715) (not b!1349474) (not b!1349525) (not b!1349449) (not b!1349483) (not b!1349434) (not bm!65197) (not b!1349422) (not b!1349436) b_and!50987 (not b!1349516) (not b!1349440) (not d!144673) (not b!1349515) (not b!1349541) (not b!1349484) (not b!1349416) (not d!144657) (not bm!65177) (not b!1349442) (not d!144677) (not b!1349537))
(check-sat b_and!50987 (not b_next!31587))
