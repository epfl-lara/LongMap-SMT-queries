; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41734 () Bool)

(assert start!41734)

(declare-fun b_free!11373 () Bool)

(declare-fun b_next!11373 () Bool)

(assert (=> start!41734 (= b_free!11373 (not b_next!11373))))

(declare-fun tp!40122 () Bool)

(declare-fun b_and!19729 () Bool)

(assert (=> start!41734 (= tp!40122 b_and!19729)))

(declare-fun mapNonEmpty!20884 () Bool)

(declare-fun mapRes!20884 () Bool)

(declare-fun tp!40123 () Bool)

(declare-fun e!272430 () Bool)

(assert (=> mapNonEmpty!20884 (= mapRes!20884 (and tp!40123 e!272430))))

(declare-datatypes ((V!18173 0))(
  ( (V!18174 (val!6445 Int)) )
))
(declare-datatypes ((ValueCell!6057 0))(
  ( (ValueCellFull!6057 (v!8732 V!18173)) (EmptyCell!6057) )
))
(declare-datatypes ((array!29383 0))(
  ( (array!29384 (arr!14121 (Array (_ BitVec 32) ValueCell!6057)) (size!14473 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29383)

(declare-fun mapValue!20884 () ValueCell!6057)

(declare-fun mapRest!20884 () (Array (_ BitVec 32) ValueCell!6057))

(declare-fun mapKey!20884 () (_ BitVec 32))

(assert (=> mapNonEmpty!20884 (= (arr!14121 _values!833) (store mapRest!20884 mapKey!20884 mapValue!20884))))

(declare-fun b!466015 () Bool)

(declare-fun e!272432 () Bool)

(declare-fun tp_is_empty!12801 () Bool)

(assert (=> b!466015 (= e!272432 tp_is_empty!12801)))

(declare-fun res!278573 () Bool)

(declare-fun e!272435 () Bool)

(assert (=> start!41734 (=> (not res!278573) (not e!272435))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41734 (= res!278573 (validMask!0 mask!1365))))

(assert (=> start!41734 e!272435))

(assert (=> start!41734 tp_is_empty!12801))

(assert (=> start!41734 tp!40122))

(assert (=> start!41734 true))

(declare-datatypes ((array!29385 0))(
  ( (array!29386 (arr!14122 (Array (_ BitVec 32) (_ BitVec 64))) (size!14474 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29385)

(declare-fun array_inv!10198 (array!29385) Bool)

(assert (=> start!41734 (array_inv!10198 _keys!1025)))

(declare-fun e!272431 () Bool)

(declare-fun array_inv!10199 (array!29383) Bool)

(assert (=> start!41734 (and (array_inv!10199 _values!833) e!272431)))

(declare-fun b!466016 () Bool)

(declare-fun res!278575 () Bool)

(assert (=> b!466016 (=> (not res!278575) (not e!272435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29385 (_ BitVec 32)) Bool)

(assert (=> b!466016 (= res!278575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466017 () Bool)

(declare-fun e!272433 () Bool)

(assert (=> b!466017 (= e!272433 (bvsle #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(declare-fun b!466018 () Bool)

(declare-fun res!278578 () Bool)

(assert (=> b!466018 (=> res!278578 e!272433)))

(declare-fun minValueBefore!38 () V!18173)

(declare-fun zeroValue!794 () V!18173)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18173)

(declare-datatypes ((tuple2!8446 0))(
  ( (tuple2!8447 (_1!4234 (_ BitVec 64)) (_2!4234 V!18173)) )
))
(declare-datatypes ((List!8539 0))(
  ( (Nil!8536) (Cons!8535 (h!9391 tuple2!8446) (t!14489 List!8539)) )
))
(declare-datatypes ((ListLongMap!7359 0))(
  ( (ListLongMap!7360 (toList!3695 List!8539)) )
))
(declare-fun +!1653 (ListLongMap!7359 tuple2!8446) ListLongMap!7359)

(declare-fun getCurrentListMap!2147 (array!29385 array!29383 (_ BitVec 32) (_ BitVec 32) V!18173 V!18173 (_ BitVec 32) Int) ListLongMap!7359)

(assert (=> b!466018 (= res!278578 (not (= (+!1653 (getCurrentListMap!2147 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2147 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))))

(declare-fun b!466019 () Bool)

(declare-fun res!278576 () Bool)

(assert (=> b!466019 (=> (not res!278576) (not e!272435))))

(declare-datatypes ((List!8540 0))(
  ( (Nil!8537) (Cons!8536 (h!9392 (_ BitVec 64)) (t!14490 List!8540)) )
))
(declare-fun arrayNoDuplicates!0 (array!29385 (_ BitVec 32) List!8540) Bool)

(assert (=> b!466019 (= res!278576 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8537))))

(declare-fun b!466020 () Bool)

(assert (=> b!466020 (= e!272431 (and e!272432 mapRes!20884))))

(declare-fun condMapEmpty!20884 () Bool)

(declare-fun mapDefault!20884 () ValueCell!6057)

(assert (=> b!466020 (= condMapEmpty!20884 (= (arr!14121 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6057)) mapDefault!20884)))))

(declare-fun b!466021 () Bool)

(assert (=> b!466021 (= e!272435 (not e!272433))))

(declare-fun res!278577 () Bool)

(assert (=> b!466021 (=> res!278577 e!272433)))

(assert (=> b!466021 (= res!278577 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210508 () ListLongMap!7359)

(declare-fun lt!210507 () ListLongMap!7359)

(assert (=> b!466021 (= lt!210508 lt!210507)))

(declare-datatypes ((Unit!13556 0))(
  ( (Unit!13557) )
))
(declare-fun lt!210506 () Unit!13556)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!54 (array!29385 array!29383 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18173 V!18173 V!18173 V!18173 (_ BitVec 32) Int) Unit!13556)

(assert (=> b!466021 (= lt!210506 (lemmaNoChangeToArrayThenSameMapNoExtras!54 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1874 (array!29385 array!29383 (_ BitVec 32) (_ BitVec 32) V!18173 V!18173 (_ BitVec 32) Int) ListLongMap!7359)

(assert (=> b!466021 (= lt!210507 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466021 (= lt!210508 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466022 () Bool)

(declare-fun res!278574 () Bool)

(assert (=> b!466022 (=> (not res!278574) (not e!272435))))

(assert (=> b!466022 (= res!278574 (and (= (size!14473 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14474 _keys!1025) (size!14473 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466023 () Bool)

(assert (=> b!466023 (= e!272430 tp_is_empty!12801)))

(declare-fun mapIsEmpty!20884 () Bool)

(assert (=> mapIsEmpty!20884 mapRes!20884))

(assert (= (and start!41734 res!278573) b!466022))

(assert (= (and b!466022 res!278574) b!466016))

(assert (= (and b!466016 res!278575) b!466019))

(assert (= (and b!466019 res!278576) b!466021))

(assert (= (and b!466021 (not res!278577)) b!466018))

(assert (= (and b!466018 (not res!278578)) b!466017))

(assert (= (and b!466020 condMapEmpty!20884) mapIsEmpty!20884))

(assert (= (and b!466020 (not condMapEmpty!20884)) mapNonEmpty!20884))

(get-info :version)

(assert (= (and mapNonEmpty!20884 ((_ is ValueCellFull!6057) mapValue!20884)) b!466023))

(assert (= (and b!466020 ((_ is ValueCellFull!6057) mapDefault!20884)) b!466015))

(assert (= start!41734 b!466020))

(declare-fun m!448241 () Bool)

(assert (=> b!466021 m!448241))

(declare-fun m!448243 () Bool)

(assert (=> b!466021 m!448243))

(declare-fun m!448245 () Bool)

(assert (=> b!466021 m!448245))

(declare-fun m!448247 () Bool)

(assert (=> b!466018 m!448247))

(assert (=> b!466018 m!448247))

(declare-fun m!448249 () Bool)

(assert (=> b!466018 m!448249))

(declare-fun m!448251 () Bool)

(assert (=> b!466018 m!448251))

(declare-fun m!448253 () Bool)

(assert (=> b!466019 m!448253))

(declare-fun m!448255 () Bool)

(assert (=> mapNonEmpty!20884 m!448255))

(declare-fun m!448257 () Bool)

(assert (=> start!41734 m!448257))

(declare-fun m!448259 () Bool)

(assert (=> start!41734 m!448259))

(declare-fun m!448261 () Bool)

(assert (=> start!41734 m!448261))

(declare-fun m!448263 () Bool)

(assert (=> b!466016 m!448263))

(check-sat b_and!19729 (not b!466016) tp_is_empty!12801 (not mapNonEmpty!20884) (not b!466018) (not b!466021) (not start!41734) (not b!466019) (not b_next!11373))
(check-sat b_and!19729 (not b_next!11373))
(get-model)

(declare-fun d!75123 () Bool)

(assert (=> d!75123 (= (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210520 () Unit!13556)

(declare-fun choose!1339 (array!29385 array!29383 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18173 V!18173 V!18173 V!18173 (_ BitVec 32) Int) Unit!13556)

(assert (=> d!75123 (= lt!210520 (choose!1339 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75123 (validMask!0 mask!1365)))

(assert (=> d!75123 (= (lemmaNoChangeToArrayThenSameMapNoExtras!54 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210520)))

(declare-fun bs!14750 () Bool)

(assert (= bs!14750 d!75123))

(assert (=> bs!14750 m!448245))

(assert (=> bs!14750 m!448243))

(declare-fun m!448289 () Bool)

(assert (=> bs!14750 m!448289))

(assert (=> bs!14750 m!448257))

(assert (=> b!466021 d!75123))

(declare-fun b!466075 () Bool)

(declare-fun e!272472 () ListLongMap!7359)

(assert (=> b!466075 (= e!272472 (ListLongMap!7360 Nil!8536))))

(declare-fun b!466076 () Bool)

(declare-fun e!272474 () Bool)

(declare-fun e!272468 () Bool)

(assert (=> b!466076 (= e!272474 e!272468)))

(assert (=> b!466076 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(declare-fun res!278606 () Bool)

(declare-fun lt!210535 () ListLongMap!7359)

(declare-fun contains!2524 (ListLongMap!7359 (_ BitVec 64)) Bool)

(assert (=> b!466076 (= res!278606 (contains!2524 lt!210535 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466076 (=> (not res!278606) (not e!272468))))

(declare-fun b!466078 () Bool)

(declare-fun e!272469 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!466078 (= e!272469 (validKeyInArray!0 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466078 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!466079 () Bool)

(declare-fun e!272473 () ListLongMap!7359)

(assert (=> b!466079 (= e!272472 e!272473)))

(declare-fun c!56708 () Bool)

(assert (=> b!466079 (= c!56708 (validKeyInArray!0 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun call!30241 () ListLongMap!7359)

(declare-fun bm!30238 () Bool)

(assert (=> bm!30238 (= call!30241 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!466080 () Bool)

(declare-fun e!272471 () Bool)

(assert (=> b!466080 (= e!272474 e!272471)))

(declare-fun c!56705 () Bool)

(assert (=> b!466080 (= c!56705 (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(declare-fun b!466081 () Bool)

(assert (=> b!466081 (= e!272471 (= lt!210535 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!466082 () Bool)

(assert (=> b!466082 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(assert (=> b!466082 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14473 _values!833)))))

(declare-fun apply!322 (ListLongMap!7359 (_ BitVec 64)) V!18173)

(declare-fun get!6925 (ValueCell!6057 V!18173) V!18173)

(declare-fun dynLambda!915 (Int (_ BitVec 64)) V!18173)

(assert (=> b!466082 (= e!272468 (= (apply!322 lt!210535 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)) (get!6925 (select (arr!14121 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!466083 () Bool)

(assert (=> b!466083 (= e!272473 call!30241)))

(declare-fun b!466084 () Bool)

(declare-fun e!272470 () Bool)

(assert (=> b!466084 (= e!272470 e!272474)))

(declare-fun c!56706 () Bool)

(assert (=> b!466084 (= c!56706 e!272469)))

(declare-fun res!278607 () Bool)

(assert (=> b!466084 (=> (not res!278607) (not e!272469))))

(assert (=> b!466084 (= res!278607 (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(declare-fun b!466077 () Bool)

(declare-fun lt!210536 () Unit!13556)

(declare-fun lt!210541 () Unit!13556)

(assert (=> b!466077 (= lt!210536 lt!210541)))

(declare-fun lt!210538 () (_ BitVec 64))

(declare-fun lt!210539 () (_ BitVec 64))

(declare-fun lt!210540 () V!18173)

(declare-fun lt!210537 () ListLongMap!7359)

(assert (=> b!466077 (not (contains!2524 (+!1653 lt!210537 (tuple2!8447 lt!210538 lt!210540)) lt!210539))))

(declare-fun addStillNotContains!155 (ListLongMap!7359 (_ BitVec 64) V!18173 (_ BitVec 64)) Unit!13556)

(assert (=> b!466077 (= lt!210541 (addStillNotContains!155 lt!210537 lt!210538 lt!210540 lt!210539))))

(assert (=> b!466077 (= lt!210539 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!466077 (= lt!210540 (get!6925 (select (arr!14121 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!466077 (= lt!210538 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!466077 (= lt!210537 call!30241)))

(assert (=> b!466077 (= e!272473 (+!1653 call!30241 (tuple2!8447 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000) (get!6925 (select (arr!14121 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!75125 () Bool)

(assert (=> d!75125 e!272470))

(declare-fun res!278608 () Bool)

(assert (=> d!75125 (=> (not res!278608) (not e!272470))))

(assert (=> d!75125 (= res!278608 (not (contains!2524 lt!210535 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75125 (= lt!210535 e!272472)))

(declare-fun c!56707 () Bool)

(assert (=> d!75125 (= c!56707 (bvsge #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(assert (=> d!75125 (validMask!0 mask!1365)))

(assert (=> d!75125 (= (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210535)))

(declare-fun b!466085 () Bool)

(declare-fun res!278605 () Bool)

(assert (=> b!466085 (=> (not res!278605) (not e!272470))))

(assert (=> b!466085 (= res!278605 (not (contains!2524 lt!210535 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!466086 () Bool)

(declare-fun isEmpty!569 (ListLongMap!7359) Bool)

(assert (=> b!466086 (= e!272471 (isEmpty!569 lt!210535))))

(assert (= (and d!75125 c!56707) b!466075))

(assert (= (and d!75125 (not c!56707)) b!466079))

(assert (= (and b!466079 c!56708) b!466077))

(assert (= (and b!466079 (not c!56708)) b!466083))

(assert (= (or b!466077 b!466083) bm!30238))

(assert (= (and d!75125 res!278608) b!466085))

(assert (= (and b!466085 res!278605) b!466084))

(assert (= (and b!466084 res!278607) b!466078))

(assert (= (and b!466084 c!56706) b!466076))

(assert (= (and b!466084 (not c!56706)) b!466080))

(assert (= (and b!466076 res!278606) b!466082))

(assert (= (and b!466080 c!56705) b!466081))

(assert (= (and b!466080 (not c!56705)) b!466086))

(declare-fun b_lambda!10005 () Bool)

(assert (=> (not b_lambda!10005) (not b!466082)))

(declare-fun t!14493 () Bool)

(declare-fun tb!3909 () Bool)

(assert (=> (and start!41734 (= defaultEntry!841 defaultEntry!841) t!14493) tb!3909))

(declare-fun result!7385 () Bool)

(assert (=> tb!3909 (= result!7385 tp_is_empty!12801)))

(assert (=> b!466082 t!14493))

(declare-fun b_and!19733 () Bool)

(assert (= b_and!19729 (and (=> t!14493 result!7385) b_and!19733)))

(declare-fun b_lambda!10007 () Bool)

(assert (=> (not b_lambda!10007) (not b!466077)))

(assert (=> b!466077 t!14493))

(declare-fun b_and!19735 () Bool)

(assert (= b_and!19733 (and (=> t!14493 result!7385) b_and!19735)))

(declare-fun m!448291 () Bool)

(assert (=> b!466081 m!448291))

(declare-fun m!448293 () Bool)

(assert (=> d!75125 m!448293))

(assert (=> d!75125 m!448257))

(declare-fun m!448295 () Bool)

(assert (=> b!466077 m!448295))

(declare-fun m!448297 () Bool)

(assert (=> b!466077 m!448297))

(declare-fun m!448299 () Bool)

(assert (=> b!466077 m!448299))

(declare-fun m!448301 () Bool)

(assert (=> b!466077 m!448301))

(assert (=> b!466077 m!448295))

(declare-fun m!448303 () Bool)

(assert (=> b!466077 m!448303))

(declare-fun m!448305 () Bool)

(assert (=> b!466077 m!448305))

(assert (=> b!466077 m!448303))

(declare-fun m!448307 () Bool)

(assert (=> b!466077 m!448307))

(assert (=> b!466077 m!448299))

(declare-fun m!448309 () Bool)

(assert (=> b!466077 m!448309))

(assert (=> bm!30238 m!448291))

(assert (=> b!466079 m!448307))

(assert (=> b!466079 m!448307))

(declare-fun m!448311 () Bool)

(assert (=> b!466079 m!448311))

(declare-fun m!448313 () Bool)

(assert (=> b!466085 m!448313))

(assert (=> b!466076 m!448307))

(assert (=> b!466076 m!448307))

(declare-fun m!448315 () Bool)

(assert (=> b!466076 m!448315))

(assert (=> b!466082 m!448295))

(assert (=> b!466082 m!448307))

(assert (=> b!466082 m!448295))

(assert (=> b!466082 m!448303))

(assert (=> b!466082 m!448305))

(assert (=> b!466082 m!448303))

(assert (=> b!466082 m!448307))

(declare-fun m!448317 () Bool)

(assert (=> b!466082 m!448317))

(declare-fun m!448319 () Bool)

(assert (=> b!466086 m!448319))

(assert (=> b!466078 m!448307))

(assert (=> b!466078 m!448307))

(assert (=> b!466078 m!448311))

(assert (=> b!466021 d!75125))

(declare-fun b!466089 () Bool)

(declare-fun e!272479 () ListLongMap!7359)

(assert (=> b!466089 (= e!272479 (ListLongMap!7360 Nil!8536))))

(declare-fun b!466090 () Bool)

(declare-fun e!272481 () Bool)

(declare-fun e!272475 () Bool)

(assert (=> b!466090 (= e!272481 e!272475)))

(assert (=> b!466090 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(declare-fun res!278610 () Bool)

(declare-fun lt!210542 () ListLongMap!7359)

(assert (=> b!466090 (= res!278610 (contains!2524 lt!210542 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466090 (=> (not res!278610) (not e!272475))))

(declare-fun b!466092 () Bool)

(declare-fun e!272476 () Bool)

(assert (=> b!466092 (= e!272476 (validKeyInArray!0 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466092 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!466093 () Bool)

(declare-fun e!272480 () ListLongMap!7359)

(assert (=> b!466093 (= e!272479 e!272480)))

(declare-fun c!56712 () Bool)

(assert (=> b!466093 (= c!56712 (validKeyInArray!0 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun call!30242 () ListLongMap!7359)

(declare-fun bm!30239 () Bool)

(assert (=> bm!30239 (= call!30242 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!466094 () Bool)

(declare-fun e!272478 () Bool)

(assert (=> b!466094 (= e!272481 e!272478)))

(declare-fun c!56709 () Bool)

(assert (=> b!466094 (= c!56709 (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(declare-fun b!466095 () Bool)

(assert (=> b!466095 (= e!272478 (= lt!210542 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!466096 () Bool)

(assert (=> b!466096 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(assert (=> b!466096 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14473 _values!833)))))

(assert (=> b!466096 (= e!272475 (= (apply!322 lt!210542 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)) (get!6925 (select (arr!14121 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!466097 () Bool)

(assert (=> b!466097 (= e!272480 call!30242)))

(declare-fun b!466098 () Bool)

(declare-fun e!272477 () Bool)

(assert (=> b!466098 (= e!272477 e!272481)))

(declare-fun c!56710 () Bool)

(assert (=> b!466098 (= c!56710 e!272476)))

(declare-fun res!278611 () Bool)

(assert (=> b!466098 (=> (not res!278611) (not e!272476))))

(assert (=> b!466098 (= res!278611 (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(declare-fun b!466091 () Bool)

(declare-fun lt!210543 () Unit!13556)

(declare-fun lt!210548 () Unit!13556)

(assert (=> b!466091 (= lt!210543 lt!210548)))

(declare-fun lt!210547 () V!18173)

(declare-fun lt!210546 () (_ BitVec 64))

(declare-fun lt!210545 () (_ BitVec 64))

(declare-fun lt!210544 () ListLongMap!7359)

(assert (=> b!466091 (not (contains!2524 (+!1653 lt!210544 (tuple2!8447 lt!210545 lt!210547)) lt!210546))))

(assert (=> b!466091 (= lt!210548 (addStillNotContains!155 lt!210544 lt!210545 lt!210547 lt!210546))))

(assert (=> b!466091 (= lt!210546 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!466091 (= lt!210547 (get!6925 (select (arr!14121 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!466091 (= lt!210545 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!466091 (= lt!210544 call!30242)))

(assert (=> b!466091 (= e!272480 (+!1653 call!30242 (tuple2!8447 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000) (get!6925 (select (arr!14121 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!75127 () Bool)

(assert (=> d!75127 e!272477))

(declare-fun res!278612 () Bool)

(assert (=> d!75127 (=> (not res!278612) (not e!272477))))

(assert (=> d!75127 (= res!278612 (not (contains!2524 lt!210542 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75127 (= lt!210542 e!272479)))

(declare-fun c!56711 () Bool)

(assert (=> d!75127 (= c!56711 (bvsge #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(assert (=> d!75127 (validMask!0 mask!1365)))

(assert (=> d!75127 (= (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210542)))

(declare-fun b!466099 () Bool)

(declare-fun res!278609 () Bool)

(assert (=> b!466099 (=> (not res!278609) (not e!272477))))

(assert (=> b!466099 (= res!278609 (not (contains!2524 lt!210542 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!466100 () Bool)

(assert (=> b!466100 (= e!272478 (isEmpty!569 lt!210542))))

(assert (= (and d!75127 c!56711) b!466089))

(assert (= (and d!75127 (not c!56711)) b!466093))

(assert (= (and b!466093 c!56712) b!466091))

(assert (= (and b!466093 (not c!56712)) b!466097))

(assert (= (or b!466091 b!466097) bm!30239))

(assert (= (and d!75127 res!278612) b!466099))

(assert (= (and b!466099 res!278609) b!466098))

(assert (= (and b!466098 res!278611) b!466092))

(assert (= (and b!466098 c!56710) b!466090))

(assert (= (and b!466098 (not c!56710)) b!466094))

(assert (= (and b!466090 res!278610) b!466096))

(assert (= (and b!466094 c!56709) b!466095))

(assert (= (and b!466094 (not c!56709)) b!466100))

(declare-fun b_lambda!10009 () Bool)

(assert (=> (not b_lambda!10009) (not b!466096)))

(assert (=> b!466096 t!14493))

(declare-fun b_and!19737 () Bool)

(assert (= b_and!19735 (and (=> t!14493 result!7385) b_and!19737)))

(declare-fun b_lambda!10011 () Bool)

(assert (=> (not b_lambda!10011) (not b!466091)))

(assert (=> b!466091 t!14493))

(declare-fun b_and!19739 () Bool)

(assert (= b_and!19737 (and (=> t!14493 result!7385) b_and!19739)))

(declare-fun m!448321 () Bool)

(assert (=> b!466095 m!448321))

(declare-fun m!448323 () Bool)

(assert (=> d!75127 m!448323))

(assert (=> d!75127 m!448257))

(assert (=> b!466091 m!448295))

(declare-fun m!448325 () Bool)

(assert (=> b!466091 m!448325))

(declare-fun m!448327 () Bool)

(assert (=> b!466091 m!448327))

(declare-fun m!448329 () Bool)

(assert (=> b!466091 m!448329))

(assert (=> b!466091 m!448295))

(assert (=> b!466091 m!448303))

(assert (=> b!466091 m!448305))

(assert (=> b!466091 m!448303))

(assert (=> b!466091 m!448307))

(assert (=> b!466091 m!448327))

(declare-fun m!448331 () Bool)

(assert (=> b!466091 m!448331))

(assert (=> bm!30239 m!448321))

(assert (=> b!466093 m!448307))

(assert (=> b!466093 m!448307))

(assert (=> b!466093 m!448311))

(declare-fun m!448333 () Bool)

(assert (=> b!466099 m!448333))

(assert (=> b!466090 m!448307))

(assert (=> b!466090 m!448307))

(declare-fun m!448335 () Bool)

(assert (=> b!466090 m!448335))

(assert (=> b!466096 m!448295))

(assert (=> b!466096 m!448307))

(assert (=> b!466096 m!448295))

(assert (=> b!466096 m!448303))

(assert (=> b!466096 m!448305))

(assert (=> b!466096 m!448303))

(assert (=> b!466096 m!448307))

(declare-fun m!448337 () Bool)

(assert (=> b!466096 m!448337))

(declare-fun m!448339 () Bool)

(assert (=> b!466100 m!448339))

(assert (=> b!466092 m!448307))

(assert (=> b!466092 m!448307))

(assert (=> b!466092 m!448311))

(assert (=> b!466021 d!75127))

(declare-fun b!466109 () Bool)

(declare-fun e!272489 () Bool)

(declare-fun call!30245 () Bool)

(assert (=> b!466109 (= e!272489 call!30245)))

(declare-fun bm!30242 () Bool)

(assert (=> bm!30242 (= call!30245 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!466111 () Bool)

(declare-fun e!272490 () Bool)

(assert (=> b!466111 (= e!272490 call!30245)))

(declare-fun b!466112 () Bool)

(assert (=> b!466112 (= e!272489 e!272490)))

(declare-fun lt!210557 () (_ BitVec 64))

(assert (=> b!466112 (= lt!210557 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210555 () Unit!13556)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29385 (_ BitVec 64) (_ BitVec 32)) Unit!13556)

(assert (=> b!466112 (= lt!210555 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!210557 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!466112 (arrayContainsKey!0 _keys!1025 lt!210557 #b00000000000000000000000000000000)))

(declare-fun lt!210556 () Unit!13556)

(assert (=> b!466112 (= lt!210556 lt!210555)))

(declare-fun res!278617 () Bool)

(declare-datatypes ((SeekEntryResult!3546 0))(
  ( (MissingZero!3546 (index!16363 (_ BitVec 32))) (Found!3546 (index!16364 (_ BitVec 32))) (Intermediate!3546 (undefined!4358 Bool) (index!16365 (_ BitVec 32)) (x!43584 (_ BitVec 32))) (Undefined!3546) (MissingVacant!3546 (index!16366 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29385 (_ BitVec 32)) SeekEntryResult!3546)

(assert (=> b!466112 (= res!278617 (= (seekEntryOrOpen!0 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3546 #b00000000000000000000000000000000)))))

(assert (=> b!466112 (=> (not res!278617) (not e!272490))))

(declare-fun b!466110 () Bool)

(declare-fun e!272488 () Bool)

(assert (=> b!466110 (= e!272488 e!272489)))

(declare-fun c!56715 () Bool)

(assert (=> b!466110 (= c!56715 (validKeyInArray!0 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75129 () Bool)

(declare-fun res!278618 () Bool)

(assert (=> d!75129 (=> res!278618 e!272488)))

(assert (=> d!75129 (= res!278618 (bvsge #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(assert (=> d!75129 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!272488)))

(assert (= (and d!75129 (not res!278618)) b!466110))

(assert (= (and b!466110 c!56715) b!466112))

(assert (= (and b!466110 (not c!56715)) b!466109))

(assert (= (and b!466112 res!278617) b!466111))

(assert (= (or b!466111 b!466109) bm!30242))

(declare-fun m!448341 () Bool)

(assert (=> bm!30242 m!448341))

(assert (=> b!466112 m!448307))

(declare-fun m!448343 () Bool)

(assert (=> b!466112 m!448343))

(declare-fun m!448345 () Bool)

(assert (=> b!466112 m!448345))

(assert (=> b!466112 m!448307))

(declare-fun m!448347 () Bool)

(assert (=> b!466112 m!448347))

(assert (=> b!466110 m!448307))

(assert (=> b!466110 m!448307))

(assert (=> b!466110 m!448311))

(assert (=> b!466016 d!75129))

(declare-fun d!75131 () Bool)

(assert (=> d!75131 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41734 d!75131))

(declare-fun d!75133 () Bool)

(assert (=> d!75133 (= (array_inv!10198 _keys!1025) (bvsge (size!14474 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41734 d!75133))

(declare-fun d!75135 () Bool)

(assert (=> d!75135 (= (array_inv!10199 _values!833) (bvsge (size!14473 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41734 d!75135))

(declare-fun d!75137 () Bool)

(declare-fun e!272493 () Bool)

(assert (=> d!75137 e!272493))

(declare-fun res!278624 () Bool)

(assert (=> d!75137 (=> (not res!278624) (not e!272493))))

(declare-fun lt!210567 () ListLongMap!7359)

(assert (=> d!75137 (= res!278624 (contains!2524 lt!210567 (_1!4234 (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lt!210568 () List!8539)

(assert (=> d!75137 (= lt!210567 (ListLongMap!7360 lt!210568))))

(declare-fun lt!210566 () Unit!13556)

(declare-fun lt!210569 () Unit!13556)

(assert (=> d!75137 (= lt!210566 lt!210569)))

(declare-datatypes ((Option!382 0))(
  ( (Some!381 (v!8734 V!18173)) (None!380) )
))
(declare-fun getValueByKey!376 (List!8539 (_ BitVec 64)) Option!382)

(assert (=> d!75137 (= (getValueByKey!376 lt!210568 (_1!4234 (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!381 (_2!4234 (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!198 (List!8539 (_ BitVec 64) V!18173) Unit!13556)

(assert (=> d!75137 (= lt!210569 (lemmaContainsTupThenGetReturnValue!198 lt!210568 (_1!4234 (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4234 (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun insertStrictlySorted!201 (List!8539 (_ BitVec 64) V!18173) List!8539)

(assert (=> d!75137 (= lt!210568 (insertStrictlySorted!201 (toList!3695 (getCurrentListMap!2147 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841)) (_1!4234 (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4234 (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(assert (=> d!75137 (= (+!1653 (getCurrentListMap!2147 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) lt!210567)))

(declare-fun b!466117 () Bool)

(declare-fun res!278623 () Bool)

(assert (=> b!466117 (=> (not res!278623) (not e!272493))))

(assert (=> b!466117 (= res!278623 (= (getValueByKey!376 (toList!3695 lt!210567) (_1!4234 (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!381 (_2!4234 (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))))

(declare-fun b!466118 () Bool)

(declare-fun contains!2525 (List!8539 tuple2!8446) Bool)

(assert (=> b!466118 (= e!272493 (contains!2525 (toList!3695 lt!210567) (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!75137 res!278624) b!466117))

(assert (= (and b!466117 res!278623) b!466118))

(declare-fun m!448349 () Bool)

(assert (=> d!75137 m!448349))

(declare-fun m!448351 () Bool)

(assert (=> d!75137 m!448351))

(declare-fun m!448353 () Bool)

(assert (=> d!75137 m!448353))

(declare-fun m!448355 () Bool)

(assert (=> d!75137 m!448355))

(declare-fun m!448357 () Bool)

(assert (=> b!466117 m!448357))

(declare-fun m!448359 () Bool)

(assert (=> b!466118 m!448359))

(assert (=> b!466018 d!75137))

(declare-fun bm!30257 () Bool)

(declare-fun call!30265 () ListLongMap!7359)

(assert (=> bm!30257 (= call!30265 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466161 () Bool)

(declare-fun e!272521 () Unit!13556)

(declare-fun Unit!13558 () Unit!13556)

(assert (=> b!466161 (= e!272521 Unit!13558)))

(declare-fun b!466162 () Bool)

(declare-fun e!272523 () ListLongMap!7359)

(declare-fun call!30260 () ListLongMap!7359)

(assert (=> b!466162 (= e!272523 call!30260)))

(declare-fun b!466163 () Bool)

(declare-fun e!272520 () Bool)

(assert (=> b!466163 (= e!272520 (validKeyInArray!0 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466165 () Bool)

(declare-fun e!272530 () ListLongMap!7359)

(declare-fun call!30262 () ListLongMap!7359)

(assert (=> b!466165 (= e!272530 (+!1653 call!30262 (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!466166 () Bool)

(declare-fun e!272525 () Bool)

(declare-fun e!272531 () Bool)

(assert (=> b!466166 (= e!272525 e!272531)))

(declare-fun c!56731 () Bool)

(assert (=> b!466166 (= c!56731 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466167 () Bool)

(declare-fun e!272529 () Bool)

(declare-fun lt!210634 () ListLongMap!7359)

(assert (=> b!466167 (= e!272529 (= (apply!322 lt!210634 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!466168 () Bool)

(declare-fun call!30266 () Bool)

(assert (=> b!466168 (= e!272531 (not call!30266))))

(declare-fun bm!30258 () Bool)

(declare-fun call!30264 () ListLongMap!7359)

(assert (=> bm!30258 (= call!30264 call!30265)))

(declare-fun b!466169 () Bool)

(declare-fun res!278643 () Bool)

(assert (=> b!466169 (=> (not res!278643) (not e!272525))))

(declare-fun e!272526 () Bool)

(assert (=> b!466169 (= res!278643 e!272526)))

(declare-fun c!56729 () Bool)

(assert (=> b!466169 (= c!56729 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30259 () Bool)

(assert (=> bm!30259 (= call!30260 call!30262)))

(declare-fun b!466170 () Bool)

(declare-fun e!272528 () Bool)

(assert (=> b!466170 (= e!272531 e!272528)))

(declare-fun res!278644 () Bool)

(assert (=> b!466170 (= res!278644 call!30266)))

(assert (=> b!466170 (=> (not res!278644) (not e!272528))))

(declare-fun b!466171 () Bool)

(declare-fun res!278651 () Bool)

(assert (=> b!466171 (=> (not res!278651) (not e!272525))))

(declare-fun e!272522 () Bool)

(assert (=> b!466171 (= res!278651 e!272522)))

(declare-fun res!278647 () Bool)

(assert (=> b!466171 (=> res!278647 e!272522)))

(declare-fun e!272527 () Bool)

(assert (=> b!466171 (= res!278647 (not e!272527))))

(declare-fun res!278645 () Bool)

(assert (=> b!466171 (=> (not res!278645) (not e!272527))))

(assert (=> b!466171 (= res!278645 (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(declare-fun b!466172 () Bool)

(assert (=> b!466172 (= e!272530 e!272523)))

(declare-fun c!56730 () Bool)

(assert (=> b!466172 (= c!56730 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466173 () Bool)

(assert (=> b!466173 (= e!272526 e!272529)))

(declare-fun res!278650 () Bool)

(declare-fun call!30263 () Bool)

(assert (=> b!466173 (= res!278650 call!30263)))

(assert (=> b!466173 (=> (not res!278650) (not e!272529))))

(declare-fun b!466174 () Bool)

(declare-fun e!272532 () ListLongMap!7359)

(declare-fun call!30261 () ListLongMap!7359)

(assert (=> b!466174 (= e!272532 call!30261)))

(declare-fun b!466175 () Bool)

(declare-fun e!272524 () Bool)

(assert (=> b!466175 (= e!272522 e!272524)))

(declare-fun res!278646 () Bool)

(assert (=> b!466175 (=> (not res!278646) (not e!272524))))

(assert (=> b!466175 (= res!278646 (contains!2524 lt!210634 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466175 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(declare-fun b!466176 () Bool)

(assert (=> b!466176 (= e!272527 (validKeyInArray!0 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466177 () Bool)

(assert (=> b!466177 (= e!272532 call!30260)))

(declare-fun b!466164 () Bool)

(declare-fun c!56733 () Bool)

(assert (=> b!466164 (= c!56733 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!466164 (= e!272523 e!272532)))

(declare-fun d!75139 () Bool)

(assert (=> d!75139 e!272525))

(declare-fun res!278648 () Bool)

(assert (=> d!75139 (=> (not res!278648) (not e!272525))))

(assert (=> d!75139 (= res!278648 (or (bvsge #b00000000000000000000000000000000 (size!14474 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))))

(declare-fun lt!210618 () ListLongMap!7359)

(assert (=> d!75139 (= lt!210634 lt!210618)))

(declare-fun lt!210623 () Unit!13556)

(assert (=> d!75139 (= lt!210623 e!272521)))

(declare-fun c!56732 () Bool)

(assert (=> d!75139 (= c!56732 e!272520)))

(declare-fun res!278649 () Bool)

(assert (=> d!75139 (=> (not res!278649) (not e!272520))))

(assert (=> d!75139 (= res!278649 (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(assert (=> d!75139 (= lt!210618 e!272530)))

(declare-fun c!56728 () Bool)

(assert (=> d!75139 (= c!56728 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75139 (validMask!0 mask!1365)))

(assert (=> d!75139 (= (getCurrentListMap!2147 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210634)))

(declare-fun b!466178 () Bool)

(assert (=> b!466178 (= e!272526 (not call!30263))))

(declare-fun bm!30260 () Bool)

(assert (=> bm!30260 (= call!30263 (contains!2524 lt!210634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30261 () Bool)

(assert (=> bm!30261 (= call!30261 call!30264)))

(declare-fun b!466179 () Bool)

(assert (=> b!466179 (= e!272524 (= (apply!322 lt!210634 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)) (get!6925 (select (arr!14121 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!466179 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14473 _values!833)))))

(assert (=> b!466179 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(declare-fun bm!30262 () Bool)

(assert (=> bm!30262 (= call!30262 (+!1653 (ite c!56728 call!30265 (ite c!56730 call!30264 call!30261)) (ite (or c!56728 c!56730) (tuple2!8447 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun bm!30263 () Bool)

(assert (=> bm!30263 (= call!30266 (contains!2524 lt!210634 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!466180 () Bool)

(assert (=> b!466180 (= e!272528 (= (apply!322 lt!210634 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!466181 () Bool)

(declare-fun lt!210635 () Unit!13556)

(assert (=> b!466181 (= e!272521 lt!210635)))

(declare-fun lt!210627 () ListLongMap!7359)

(assert (=> b!466181 (= lt!210627 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210620 () (_ BitVec 64))

(assert (=> b!466181 (= lt!210620 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210626 () (_ BitVec 64))

(assert (=> b!466181 (= lt!210626 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210619 () Unit!13556)

(declare-fun addStillContains!285 (ListLongMap!7359 (_ BitVec 64) V!18173 (_ BitVec 64)) Unit!13556)

(assert (=> b!466181 (= lt!210619 (addStillContains!285 lt!210627 lt!210620 zeroValue!794 lt!210626))))

(assert (=> b!466181 (contains!2524 (+!1653 lt!210627 (tuple2!8447 lt!210620 zeroValue!794)) lt!210626)))

(declare-fun lt!210616 () Unit!13556)

(assert (=> b!466181 (= lt!210616 lt!210619)))

(declare-fun lt!210624 () ListLongMap!7359)

(assert (=> b!466181 (= lt!210624 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210632 () (_ BitVec 64))

(assert (=> b!466181 (= lt!210632 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210629 () (_ BitVec 64))

(assert (=> b!466181 (= lt!210629 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210628 () Unit!13556)

(declare-fun addApplyDifferent!285 (ListLongMap!7359 (_ BitVec 64) V!18173 (_ BitVec 64)) Unit!13556)

(assert (=> b!466181 (= lt!210628 (addApplyDifferent!285 lt!210624 lt!210632 minValueBefore!38 lt!210629))))

(assert (=> b!466181 (= (apply!322 (+!1653 lt!210624 (tuple2!8447 lt!210632 minValueBefore!38)) lt!210629) (apply!322 lt!210624 lt!210629))))

(declare-fun lt!210630 () Unit!13556)

(assert (=> b!466181 (= lt!210630 lt!210628)))

(declare-fun lt!210621 () ListLongMap!7359)

(assert (=> b!466181 (= lt!210621 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210631 () (_ BitVec 64))

(assert (=> b!466181 (= lt!210631 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210614 () (_ BitVec 64))

(assert (=> b!466181 (= lt!210614 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210617 () Unit!13556)

(assert (=> b!466181 (= lt!210617 (addApplyDifferent!285 lt!210621 lt!210631 zeroValue!794 lt!210614))))

(assert (=> b!466181 (= (apply!322 (+!1653 lt!210621 (tuple2!8447 lt!210631 zeroValue!794)) lt!210614) (apply!322 lt!210621 lt!210614))))

(declare-fun lt!210625 () Unit!13556)

(assert (=> b!466181 (= lt!210625 lt!210617)))

(declare-fun lt!210633 () ListLongMap!7359)

(assert (=> b!466181 (= lt!210633 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210615 () (_ BitVec 64))

(assert (=> b!466181 (= lt!210615 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210622 () (_ BitVec 64))

(assert (=> b!466181 (= lt!210622 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!466181 (= lt!210635 (addApplyDifferent!285 lt!210633 lt!210615 minValueBefore!38 lt!210622))))

(assert (=> b!466181 (= (apply!322 (+!1653 lt!210633 (tuple2!8447 lt!210615 minValueBefore!38)) lt!210622) (apply!322 lt!210633 lt!210622))))

(assert (= (and d!75139 c!56728) b!466165))

(assert (= (and d!75139 (not c!56728)) b!466172))

(assert (= (and b!466172 c!56730) b!466162))

(assert (= (and b!466172 (not c!56730)) b!466164))

(assert (= (and b!466164 c!56733) b!466177))

(assert (= (and b!466164 (not c!56733)) b!466174))

(assert (= (or b!466177 b!466174) bm!30261))

(assert (= (or b!466162 bm!30261) bm!30258))

(assert (= (or b!466162 b!466177) bm!30259))

(assert (= (or b!466165 bm!30258) bm!30257))

(assert (= (or b!466165 bm!30259) bm!30262))

(assert (= (and d!75139 res!278649) b!466163))

(assert (= (and d!75139 c!56732) b!466181))

(assert (= (and d!75139 (not c!56732)) b!466161))

(assert (= (and d!75139 res!278648) b!466171))

(assert (= (and b!466171 res!278645) b!466176))

(assert (= (and b!466171 (not res!278647)) b!466175))

(assert (= (and b!466175 res!278646) b!466179))

(assert (= (and b!466171 res!278651) b!466169))

(assert (= (and b!466169 c!56729) b!466173))

(assert (= (and b!466169 (not c!56729)) b!466178))

(assert (= (and b!466173 res!278650) b!466167))

(assert (= (or b!466173 b!466178) bm!30260))

(assert (= (and b!466169 res!278643) b!466166))

(assert (= (and b!466166 c!56731) b!466170))

(assert (= (and b!466166 (not c!56731)) b!466168))

(assert (= (and b!466170 res!278644) b!466180))

(assert (= (or b!466170 b!466168) bm!30263))

(declare-fun b_lambda!10013 () Bool)

(assert (=> (not b_lambda!10013) (not b!466179)))

(assert (=> b!466179 t!14493))

(declare-fun b_and!19741 () Bool)

(assert (= b_and!19739 (and (=> t!14493 result!7385) b_and!19741)))

(declare-fun m!448361 () Bool)

(assert (=> bm!30263 m!448361))

(declare-fun m!448363 () Bool)

(assert (=> b!466165 m!448363))

(declare-fun m!448365 () Bool)

(assert (=> b!466180 m!448365))

(declare-fun m!448367 () Bool)

(assert (=> bm!30262 m!448367))

(declare-fun m!448369 () Bool)

(assert (=> b!466181 m!448369))

(assert (=> b!466181 m!448245))

(declare-fun m!448371 () Bool)

(assert (=> b!466181 m!448371))

(declare-fun m!448373 () Bool)

(assert (=> b!466181 m!448373))

(declare-fun m!448375 () Bool)

(assert (=> b!466181 m!448375))

(declare-fun m!448377 () Bool)

(assert (=> b!466181 m!448377))

(declare-fun m!448379 () Bool)

(assert (=> b!466181 m!448379))

(declare-fun m!448381 () Bool)

(assert (=> b!466181 m!448381))

(assert (=> b!466181 m!448307))

(declare-fun m!448383 () Bool)

(assert (=> b!466181 m!448383))

(declare-fun m!448385 () Bool)

(assert (=> b!466181 m!448385))

(assert (=> b!466181 m!448375))

(declare-fun m!448387 () Bool)

(assert (=> b!466181 m!448387))

(declare-fun m!448389 () Bool)

(assert (=> b!466181 m!448389))

(declare-fun m!448391 () Bool)

(assert (=> b!466181 m!448391))

(assert (=> b!466181 m!448383))

(assert (=> b!466181 m!448387))

(declare-fun m!448393 () Bool)

(assert (=> b!466181 m!448393))

(declare-fun m!448395 () Bool)

(assert (=> b!466181 m!448395))

(declare-fun m!448397 () Bool)

(assert (=> b!466181 m!448397))

(assert (=> b!466181 m!448371))

(assert (=> b!466179 m!448295))

(assert (=> b!466179 m!448303))

(assert (=> b!466179 m!448305))

(assert (=> b!466179 m!448303))

(assert (=> b!466179 m!448307))

(assert (=> b!466179 m!448295))

(assert (=> b!466179 m!448307))

(declare-fun m!448399 () Bool)

(assert (=> b!466179 m!448399))

(assert (=> b!466175 m!448307))

(assert (=> b!466175 m!448307))

(declare-fun m!448401 () Bool)

(assert (=> b!466175 m!448401))

(declare-fun m!448403 () Bool)

(assert (=> bm!30260 m!448403))

(assert (=> d!75139 m!448257))

(declare-fun m!448405 () Bool)

(assert (=> b!466167 m!448405))

(assert (=> b!466176 m!448307))

(assert (=> b!466176 m!448307))

(assert (=> b!466176 m!448311))

(assert (=> bm!30257 m!448245))

(assert (=> b!466163 m!448307))

(assert (=> b!466163 m!448307))

(assert (=> b!466163 m!448311))

(assert (=> b!466018 d!75139))

(declare-fun call!30272 () ListLongMap!7359)

(declare-fun bm!30264 () Bool)

(assert (=> bm!30264 (= call!30272 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466182 () Bool)

(declare-fun e!272534 () Unit!13556)

(declare-fun Unit!13559 () Unit!13556)

(assert (=> b!466182 (= e!272534 Unit!13559)))

(declare-fun b!466183 () Bool)

(declare-fun e!272536 () ListLongMap!7359)

(declare-fun call!30267 () ListLongMap!7359)

(assert (=> b!466183 (= e!272536 call!30267)))

(declare-fun b!466184 () Bool)

(declare-fun e!272533 () Bool)

(assert (=> b!466184 (= e!272533 (validKeyInArray!0 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466186 () Bool)

(declare-fun e!272543 () ListLongMap!7359)

(declare-fun call!30269 () ListLongMap!7359)

(assert (=> b!466186 (= e!272543 (+!1653 call!30269 (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466187 () Bool)

(declare-fun e!272538 () Bool)

(declare-fun e!272544 () Bool)

(assert (=> b!466187 (= e!272538 e!272544)))

(declare-fun c!56737 () Bool)

(assert (=> b!466187 (= c!56737 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466188 () Bool)

(declare-fun e!272542 () Bool)

(declare-fun lt!210656 () ListLongMap!7359)

(assert (=> b!466188 (= e!272542 (= (apply!322 lt!210656 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!466189 () Bool)

(declare-fun call!30273 () Bool)

(assert (=> b!466189 (= e!272544 (not call!30273))))

(declare-fun bm!30265 () Bool)

(declare-fun call!30271 () ListLongMap!7359)

(assert (=> bm!30265 (= call!30271 call!30272)))

(declare-fun b!466190 () Bool)

(declare-fun res!278652 () Bool)

(assert (=> b!466190 (=> (not res!278652) (not e!272538))))

(declare-fun e!272539 () Bool)

(assert (=> b!466190 (= res!278652 e!272539)))

(declare-fun c!56735 () Bool)

(assert (=> b!466190 (= c!56735 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30266 () Bool)

(assert (=> bm!30266 (= call!30267 call!30269)))

(declare-fun b!466191 () Bool)

(declare-fun e!272541 () Bool)

(assert (=> b!466191 (= e!272544 e!272541)))

(declare-fun res!278653 () Bool)

(assert (=> b!466191 (= res!278653 call!30273)))

(assert (=> b!466191 (=> (not res!278653) (not e!272541))))

(declare-fun b!466192 () Bool)

(declare-fun res!278660 () Bool)

(assert (=> b!466192 (=> (not res!278660) (not e!272538))))

(declare-fun e!272535 () Bool)

(assert (=> b!466192 (= res!278660 e!272535)))

(declare-fun res!278656 () Bool)

(assert (=> b!466192 (=> res!278656 e!272535)))

(declare-fun e!272540 () Bool)

(assert (=> b!466192 (= res!278656 (not e!272540))))

(declare-fun res!278654 () Bool)

(assert (=> b!466192 (=> (not res!278654) (not e!272540))))

(assert (=> b!466192 (= res!278654 (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(declare-fun b!466193 () Bool)

(assert (=> b!466193 (= e!272543 e!272536)))

(declare-fun c!56736 () Bool)

(assert (=> b!466193 (= c!56736 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466194 () Bool)

(assert (=> b!466194 (= e!272539 e!272542)))

(declare-fun res!278659 () Bool)

(declare-fun call!30270 () Bool)

(assert (=> b!466194 (= res!278659 call!30270)))

(assert (=> b!466194 (=> (not res!278659) (not e!272542))))

(declare-fun b!466195 () Bool)

(declare-fun e!272545 () ListLongMap!7359)

(declare-fun call!30268 () ListLongMap!7359)

(assert (=> b!466195 (= e!272545 call!30268)))

(declare-fun b!466196 () Bool)

(declare-fun e!272537 () Bool)

(assert (=> b!466196 (= e!272535 e!272537)))

(declare-fun res!278655 () Bool)

(assert (=> b!466196 (=> (not res!278655) (not e!272537))))

(assert (=> b!466196 (= res!278655 (contains!2524 lt!210656 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466196 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(declare-fun b!466197 () Bool)

(assert (=> b!466197 (= e!272540 (validKeyInArray!0 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466198 () Bool)

(assert (=> b!466198 (= e!272545 call!30267)))

(declare-fun b!466185 () Bool)

(declare-fun c!56739 () Bool)

(assert (=> b!466185 (= c!56739 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!466185 (= e!272536 e!272545)))

(declare-fun d!75141 () Bool)

(assert (=> d!75141 e!272538))

(declare-fun res!278657 () Bool)

(assert (=> d!75141 (=> (not res!278657) (not e!272538))))

(assert (=> d!75141 (= res!278657 (or (bvsge #b00000000000000000000000000000000 (size!14474 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))))

(declare-fun lt!210640 () ListLongMap!7359)

(assert (=> d!75141 (= lt!210656 lt!210640)))

(declare-fun lt!210645 () Unit!13556)

(assert (=> d!75141 (= lt!210645 e!272534)))

(declare-fun c!56738 () Bool)

(assert (=> d!75141 (= c!56738 e!272533)))

(declare-fun res!278658 () Bool)

(assert (=> d!75141 (=> (not res!278658) (not e!272533))))

(assert (=> d!75141 (= res!278658 (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(assert (=> d!75141 (= lt!210640 e!272543)))

(declare-fun c!56734 () Bool)

(assert (=> d!75141 (= c!56734 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75141 (validMask!0 mask!1365)))

(assert (=> d!75141 (= (getCurrentListMap!2147 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210656)))

(declare-fun b!466199 () Bool)

(assert (=> b!466199 (= e!272539 (not call!30270))))

(declare-fun bm!30267 () Bool)

(assert (=> bm!30267 (= call!30270 (contains!2524 lt!210656 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30268 () Bool)

(assert (=> bm!30268 (= call!30268 call!30271)))

(declare-fun b!466200 () Bool)

(assert (=> b!466200 (= e!272537 (= (apply!322 lt!210656 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)) (get!6925 (select (arr!14121 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!466200 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14473 _values!833)))))

(assert (=> b!466200 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(declare-fun bm!30269 () Bool)

(assert (=> bm!30269 (= call!30269 (+!1653 (ite c!56734 call!30272 (ite c!56736 call!30271 call!30268)) (ite (or c!56734 c!56736) (tuple2!8447 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8447 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun bm!30270 () Bool)

(assert (=> bm!30270 (= call!30273 (contains!2524 lt!210656 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!466201 () Bool)

(assert (=> b!466201 (= e!272541 (= (apply!322 lt!210656 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!466202 () Bool)

(declare-fun lt!210657 () Unit!13556)

(assert (=> b!466202 (= e!272534 lt!210657)))

(declare-fun lt!210649 () ListLongMap!7359)

(assert (=> b!466202 (= lt!210649 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210642 () (_ BitVec 64))

(assert (=> b!466202 (= lt!210642 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210648 () (_ BitVec 64))

(assert (=> b!466202 (= lt!210648 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210641 () Unit!13556)

(assert (=> b!466202 (= lt!210641 (addStillContains!285 lt!210649 lt!210642 zeroValue!794 lt!210648))))

(assert (=> b!466202 (contains!2524 (+!1653 lt!210649 (tuple2!8447 lt!210642 zeroValue!794)) lt!210648)))

(declare-fun lt!210638 () Unit!13556)

(assert (=> b!466202 (= lt!210638 lt!210641)))

(declare-fun lt!210646 () ListLongMap!7359)

(assert (=> b!466202 (= lt!210646 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210654 () (_ BitVec 64))

(assert (=> b!466202 (= lt!210654 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210651 () (_ BitVec 64))

(assert (=> b!466202 (= lt!210651 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210650 () Unit!13556)

(assert (=> b!466202 (= lt!210650 (addApplyDifferent!285 lt!210646 lt!210654 minValueAfter!38 lt!210651))))

(assert (=> b!466202 (= (apply!322 (+!1653 lt!210646 (tuple2!8447 lt!210654 minValueAfter!38)) lt!210651) (apply!322 lt!210646 lt!210651))))

(declare-fun lt!210652 () Unit!13556)

(assert (=> b!466202 (= lt!210652 lt!210650)))

(declare-fun lt!210643 () ListLongMap!7359)

(assert (=> b!466202 (= lt!210643 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210653 () (_ BitVec 64))

(assert (=> b!466202 (= lt!210653 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210636 () (_ BitVec 64))

(assert (=> b!466202 (= lt!210636 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210639 () Unit!13556)

(assert (=> b!466202 (= lt!210639 (addApplyDifferent!285 lt!210643 lt!210653 zeroValue!794 lt!210636))))

(assert (=> b!466202 (= (apply!322 (+!1653 lt!210643 (tuple2!8447 lt!210653 zeroValue!794)) lt!210636) (apply!322 lt!210643 lt!210636))))

(declare-fun lt!210647 () Unit!13556)

(assert (=> b!466202 (= lt!210647 lt!210639)))

(declare-fun lt!210655 () ListLongMap!7359)

(assert (=> b!466202 (= lt!210655 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210637 () (_ BitVec 64))

(assert (=> b!466202 (= lt!210637 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210644 () (_ BitVec 64))

(assert (=> b!466202 (= lt!210644 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!466202 (= lt!210657 (addApplyDifferent!285 lt!210655 lt!210637 minValueAfter!38 lt!210644))))

(assert (=> b!466202 (= (apply!322 (+!1653 lt!210655 (tuple2!8447 lt!210637 minValueAfter!38)) lt!210644) (apply!322 lt!210655 lt!210644))))

(assert (= (and d!75141 c!56734) b!466186))

(assert (= (and d!75141 (not c!56734)) b!466193))

(assert (= (and b!466193 c!56736) b!466183))

(assert (= (and b!466193 (not c!56736)) b!466185))

(assert (= (and b!466185 c!56739) b!466198))

(assert (= (and b!466185 (not c!56739)) b!466195))

(assert (= (or b!466198 b!466195) bm!30268))

(assert (= (or b!466183 bm!30268) bm!30265))

(assert (= (or b!466183 b!466198) bm!30266))

(assert (= (or b!466186 bm!30265) bm!30264))

(assert (= (or b!466186 bm!30266) bm!30269))

(assert (= (and d!75141 res!278658) b!466184))

(assert (= (and d!75141 c!56738) b!466202))

(assert (= (and d!75141 (not c!56738)) b!466182))

(assert (= (and d!75141 res!278657) b!466192))

(assert (= (and b!466192 res!278654) b!466197))

(assert (= (and b!466192 (not res!278656)) b!466196))

(assert (= (and b!466196 res!278655) b!466200))

(assert (= (and b!466192 res!278660) b!466190))

(assert (= (and b!466190 c!56735) b!466194))

(assert (= (and b!466190 (not c!56735)) b!466199))

(assert (= (and b!466194 res!278659) b!466188))

(assert (= (or b!466194 b!466199) bm!30267))

(assert (= (and b!466190 res!278652) b!466187))

(assert (= (and b!466187 c!56737) b!466191))

(assert (= (and b!466187 (not c!56737)) b!466189))

(assert (= (and b!466191 res!278653) b!466201))

(assert (= (or b!466191 b!466189) bm!30270))

(declare-fun b_lambda!10015 () Bool)

(assert (=> (not b_lambda!10015) (not b!466200)))

(assert (=> b!466200 t!14493))

(declare-fun b_and!19743 () Bool)

(assert (= b_and!19741 (and (=> t!14493 result!7385) b_and!19743)))

(declare-fun m!448407 () Bool)

(assert (=> bm!30270 m!448407))

(declare-fun m!448409 () Bool)

(assert (=> b!466186 m!448409))

(declare-fun m!448411 () Bool)

(assert (=> b!466201 m!448411))

(declare-fun m!448413 () Bool)

(assert (=> bm!30269 m!448413))

(declare-fun m!448415 () Bool)

(assert (=> b!466202 m!448415))

(assert (=> b!466202 m!448243))

(declare-fun m!448417 () Bool)

(assert (=> b!466202 m!448417))

(declare-fun m!448419 () Bool)

(assert (=> b!466202 m!448419))

(declare-fun m!448421 () Bool)

(assert (=> b!466202 m!448421))

(declare-fun m!448423 () Bool)

(assert (=> b!466202 m!448423))

(declare-fun m!448425 () Bool)

(assert (=> b!466202 m!448425))

(declare-fun m!448427 () Bool)

(assert (=> b!466202 m!448427))

(assert (=> b!466202 m!448307))

(declare-fun m!448429 () Bool)

(assert (=> b!466202 m!448429))

(declare-fun m!448431 () Bool)

(assert (=> b!466202 m!448431))

(assert (=> b!466202 m!448421))

(declare-fun m!448433 () Bool)

(assert (=> b!466202 m!448433))

(declare-fun m!448435 () Bool)

(assert (=> b!466202 m!448435))

(declare-fun m!448437 () Bool)

(assert (=> b!466202 m!448437))

(assert (=> b!466202 m!448429))

(assert (=> b!466202 m!448433))

(declare-fun m!448439 () Bool)

(assert (=> b!466202 m!448439))

(declare-fun m!448441 () Bool)

(assert (=> b!466202 m!448441))

(declare-fun m!448443 () Bool)

(assert (=> b!466202 m!448443))

(assert (=> b!466202 m!448417))

(assert (=> b!466200 m!448295))

(assert (=> b!466200 m!448303))

(assert (=> b!466200 m!448305))

(assert (=> b!466200 m!448303))

(assert (=> b!466200 m!448307))

(assert (=> b!466200 m!448295))

(assert (=> b!466200 m!448307))

(declare-fun m!448445 () Bool)

(assert (=> b!466200 m!448445))

(assert (=> b!466196 m!448307))

(assert (=> b!466196 m!448307))

(declare-fun m!448447 () Bool)

(assert (=> b!466196 m!448447))

(declare-fun m!448449 () Bool)

(assert (=> bm!30267 m!448449))

(assert (=> d!75141 m!448257))

(declare-fun m!448451 () Bool)

(assert (=> b!466188 m!448451))

(assert (=> b!466197 m!448307))

(assert (=> b!466197 m!448307))

(assert (=> b!466197 m!448311))

(assert (=> bm!30264 m!448243))

(assert (=> b!466184 m!448307))

(assert (=> b!466184 m!448307))

(assert (=> b!466184 m!448311))

(assert (=> b!466018 d!75141))

(declare-fun d!75143 () Bool)

(declare-fun res!278669 () Bool)

(declare-fun e!272557 () Bool)

(assert (=> d!75143 (=> res!278669 e!272557)))

(assert (=> d!75143 (= res!278669 (bvsge #b00000000000000000000000000000000 (size!14474 _keys!1025)))))

(assert (=> d!75143 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8537) e!272557)))

(declare-fun b!466213 () Bool)

(declare-fun e!272555 () Bool)

(declare-fun contains!2526 (List!8540 (_ BitVec 64)) Bool)

(assert (=> b!466213 (= e!272555 (contains!2526 Nil!8537 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466214 () Bool)

(declare-fun e!272556 () Bool)

(assert (=> b!466214 (= e!272557 e!272556)))

(declare-fun res!278668 () Bool)

(assert (=> b!466214 (=> (not res!278668) (not e!272556))))

(assert (=> b!466214 (= res!278668 (not e!272555))))

(declare-fun res!278667 () Bool)

(assert (=> b!466214 (=> (not res!278667) (not e!272555))))

(assert (=> b!466214 (= res!278667 (validKeyInArray!0 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466215 () Bool)

(declare-fun e!272554 () Bool)

(declare-fun call!30276 () Bool)

(assert (=> b!466215 (= e!272554 call!30276)))

(declare-fun b!466216 () Bool)

(assert (=> b!466216 (= e!272554 call!30276)))

(declare-fun b!466217 () Bool)

(assert (=> b!466217 (= e!272556 e!272554)))

(declare-fun c!56742 () Bool)

(assert (=> b!466217 (= c!56742 (validKeyInArray!0 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30273 () Bool)

(assert (=> bm!30273 (= call!30276 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56742 (Cons!8536 (select (arr!14122 _keys!1025) #b00000000000000000000000000000000) Nil!8537) Nil!8537)))))

(assert (= (and d!75143 (not res!278669)) b!466214))

(assert (= (and b!466214 res!278667) b!466213))

(assert (= (and b!466214 res!278668) b!466217))

(assert (= (and b!466217 c!56742) b!466215))

(assert (= (and b!466217 (not c!56742)) b!466216))

(assert (= (or b!466215 b!466216) bm!30273))

(assert (=> b!466213 m!448307))

(assert (=> b!466213 m!448307))

(declare-fun m!448453 () Bool)

(assert (=> b!466213 m!448453))

(assert (=> b!466214 m!448307))

(assert (=> b!466214 m!448307))

(assert (=> b!466214 m!448311))

(assert (=> b!466217 m!448307))

(assert (=> b!466217 m!448307))

(assert (=> b!466217 m!448311))

(assert (=> bm!30273 m!448307))

(declare-fun m!448455 () Bool)

(assert (=> bm!30273 m!448455))

(assert (=> b!466019 d!75143))

(declare-fun b!466224 () Bool)

(declare-fun e!272562 () Bool)

(assert (=> b!466224 (= e!272562 tp_is_empty!12801)))

(declare-fun mapIsEmpty!20890 () Bool)

(declare-fun mapRes!20890 () Bool)

(assert (=> mapIsEmpty!20890 mapRes!20890))

(declare-fun b!466225 () Bool)

(declare-fun e!272563 () Bool)

(assert (=> b!466225 (= e!272563 tp_is_empty!12801)))

(declare-fun condMapEmpty!20890 () Bool)

(declare-fun mapDefault!20890 () ValueCell!6057)

(assert (=> mapNonEmpty!20884 (= condMapEmpty!20890 (= mapRest!20884 ((as const (Array (_ BitVec 32) ValueCell!6057)) mapDefault!20890)))))

(assert (=> mapNonEmpty!20884 (= tp!40123 (and e!272563 mapRes!20890))))

(declare-fun mapNonEmpty!20890 () Bool)

(declare-fun tp!40132 () Bool)

(assert (=> mapNonEmpty!20890 (= mapRes!20890 (and tp!40132 e!272562))))

(declare-fun mapValue!20890 () ValueCell!6057)

(declare-fun mapRest!20890 () (Array (_ BitVec 32) ValueCell!6057))

(declare-fun mapKey!20890 () (_ BitVec 32))

(assert (=> mapNonEmpty!20890 (= mapRest!20884 (store mapRest!20890 mapKey!20890 mapValue!20890))))

(assert (= (and mapNonEmpty!20884 condMapEmpty!20890) mapIsEmpty!20890))

(assert (= (and mapNonEmpty!20884 (not condMapEmpty!20890)) mapNonEmpty!20890))

(assert (= (and mapNonEmpty!20890 ((_ is ValueCellFull!6057) mapValue!20890)) b!466224))

(assert (= (and mapNonEmpty!20884 ((_ is ValueCellFull!6057) mapDefault!20890)) b!466225))

(declare-fun m!448457 () Bool)

(assert (=> mapNonEmpty!20890 m!448457))

(declare-fun b_lambda!10017 () Bool)

(assert (= b_lambda!10007 (or (and start!41734 b_free!11373) b_lambda!10017)))

(declare-fun b_lambda!10019 () Bool)

(assert (= b_lambda!10009 (or (and start!41734 b_free!11373) b_lambda!10019)))

(declare-fun b_lambda!10021 () Bool)

(assert (= b_lambda!10011 (or (and start!41734 b_free!11373) b_lambda!10021)))

(declare-fun b_lambda!10023 () Bool)

(assert (= b_lambda!10013 (or (and start!41734 b_free!11373) b_lambda!10023)))

(declare-fun b_lambda!10025 () Bool)

(assert (= b_lambda!10015 (or (and start!41734 b_free!11373) b_lambda!10025)))

(declare-fun b_lambda!10027 () Bool)

(assert (= b_lambda!10005 (or (and start!41734 b_free!11373) b_lambda!10027)))

(check-sat (not b_lambda!10027) (not b!466081) (not b!466118) (not b!466201) (not bm!30239) (not bm!30273) tp_is_empty!12801 (not bm!30238) (not b!466176) (not b_lambda!10023) (not bm!30242) (not b!466202) (not bm!30264) (not bm!30270) (not b!466091) (not b!466175) (not d!75137) (not b!466180) (not b_lambda!10021) (not b!466096) b_and!19743 (not b!466179) (not b!466076) (not d!75123) (not b!466214) (not b!466181) (not b!466077) (not d!75141) (not b!466167) (not bm!30269) (not b!466082) (not bm!30260) (not b!466184) (not b_next!11373) (not b!466110) (not b!466085) (not b!466078) (not b!466213) (not d!75125) (not b!466100) (not d!75127) (not b!466117) (not b!466186) (not b!466200) (not b!466090) (not bm!30267) (not b_lambda!10019) (not mapNonEmpty!20890) (not b!466095) (not b!466197) (not b!466112) (not b!466086) (not b!466092) (not b!466165) (not b!466217) (not b!466163) (not bm!30262) (not bm!30257) (not b_lambda!10017) (not b!466079) (not d!75139) (not b!466188) (not b!466099) (not bm!30263) (not b!466093) (not b_lambda!10025) (not b!466196))
(check-sat b_and!19743 (not b_next!11373))
