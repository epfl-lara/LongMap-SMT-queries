; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41450 () Bool)

(assert start!41450)

(declare-fun b_free!11143 () Bool)

(declare-fun b_next!11143 () Bool)

(assert (=> start!41450 (= b_free!11143 (not b_next!11143))))

(declare-fun tp!39424 () Bool)

(declare-fun b_and!19489 () Bool)

(assert (=> start!41450 (= tp!39424 b_and!19489)))

(declare-fun b!463214 () Bool)

(declare-fun e!270433 () Bool)

(declare-fun tp_is_empty!12571 () Bool)

(assert (=> b!463214 (= e!270433 tp_is_empty!12571)))

(declare-fun mapNonEmpty!20530 () Bool)

(declare-fun mapRes!20530 () Bool)

(declare-fun tp!39423 () Bool)

(assert (=> mapNonEmpty!20530 (= mapRes!20530 (and tp!39423 e!270433))))

(declare-datatypes ((V!17867 0))(
  ( (V!17868 (val!6330 Int)) )
))
(declare-datatypes ((ValueCell!5942 0))(
  ( (ValueCellFull!5942 (v!8618 V!17867)) (EmptyCell!5942) )
))
(declare-datatypes ((array!28938 0))(
  ( (array!28939 (arr!13901 (Array (_ BitVec 32) ValueCell!5942)) (size!14253 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28938)

(declare-fun mapValue!20530 () ValueCell!5942)

(declare-fun mapKey!20530 () (_ BitVec 32))

(declare-fun mapRest!20530 () (Array (_ BitVec 32) ValueCell!5942))

(assert (=> mapNonEmpty!20530 (= (arr!13901 _values!833) (store mapRest!20530 mapKey!20530 mapValue!20530))))

(declare-fun b!463215 () Bool)

(declare-fun res!277018 () Bool)

(declare-fun e!270431 () Bool)

(assert (=> b!463215 (=> (not res!277018) (not e!270431))))

(declare-datatypes ((array!28940 0))(
  ( (array!28941 (arr!13902 (Array (_ BitVec 32) (_ BitVec 64))) (size!14254 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28940)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28940 (_ BitVec 32)) Bool)

(assert (=> b!463215 (= res!277018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463216 () Bool)

(declare-fun res!277015 () Bool)

(assert (=> b!463216 (=> (not res!277015) (not e!270431))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463216 (= res!277015 (and (= (size!14253 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14254 _keys!1025) (size!14253 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463217 () Bool)

(assert (=> b!463217 (= e!270431 (bvsgt #b00000000000000000000000000000000 (size!14254 _keys!1025)))))

(declare-fun minValueBefore!38 () V!17867)

(declare-fun zeroValue!794 () V!17867)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8230 0))(
  ( (tuple2!8231 (_1!4126 (_ BitVec 64)) (_2!4126 V!17867)) )
))
(declare-datatypes ((List!8312 0))(
  ( (Nil!8309) (Cons!8308 (h!9164 tuple2!8230) (t!14248 List!8312)) )
))
(declare-datatypes ((ListLongMap!7145 0))(
  ( (ListLongMap!7146 (toList!3588 List!8312)) )
))
(declare-fun lt!209342 () ListLongMap!7145)

(declare-fun getCurrentListMapNoExtraKeys!1815 (array!28940 array!28938 (_ BitVec 32) (_ BitVec 32) V!17867 V!17867 (_ BitVec 32) Int) ListLongMap!7145)

(assert (=> b!463217 (= lt!209342 (getCurrentListMapNoExtraKeys!1815 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463218 () Bool)

(declare-fun e!270435 () Bool)

(assert (=> b!463218 (= e!270435 tp_is_empty!12571)))

(declare-fun b!463219 () Bool)

(declare-fun e!270434 () Bool)

(assert (=> b!463219 (= e!270434 (and e!270435 mapRes!20530))))

(declare-fun condMapEmpty!20530 () Bool)

(declare-fun mapDefault!20530 () ValueCell!5942)

(assert (=> b!463219 (= condMapEmpty!20530 (= (arr!13901 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5942)) mapDefault!20530)))))

(declare-fun b!463220 () Bool)

(declare-fun res!277016 () Bool)

(assert (=> b!463220 (=> (not res!277016) (not e!270431))))

(declare-datatypes ((List!8313 0))(
  ( (Nil!8310) (Cons!8309 (h!9165 (_ BitVec 64)) (t!14249 List!8313)) )
))
(declare-fun arrayNoDuplicates!0 (array!28940 (_ BitVec 32) List!8313) Bool)

(assert (=> b!463220 (= res!277016 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8310))))

(declare-fun mapIsEmpty!20530 () Bool)

(assert (=> mapIsEmpty!20530 mapRes!20530))

(declare-fun res!277017 () Bool)

(assert (=> start!41450 (=> (not res!277017) (not e!270431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41450 (= res!277017 (validMask!0 mask!1365))))

(assert (=> start!41450 e!270431))

(assert (=> start!41450 tp_is_empty!12571))

(assert (=> start!41450 tp!39424))

(assert (=> start!41450 true))

(declare-fun array_inv!10132 (array!28940) Bool)

(assert (=> start!41450 (array_inv!10132 _keys!1025)))

(declare-fun array_inv!10133 (array!28938) Bool)

(assert (=> start!41450 (and (array_inv!10133 _values!833) e!270434)))

(assert (= (and start!41450 res!277017) b!463216))

(assert (= (and b!463216 res!277015) b!463215))

(assert (= (and b!463215 res!277018) b!463220))

(assert (= (and b!463220 res!277016) b!463217))

(assert (= (and b!463219 condMapEmpty!20530) mapIsEmpty!20530))

(assert (= (and b!463219 (not condMapEmpty!20530)) mapNonEmpty!20530))

(get-info :version)

(assert (= (and mapNonEmpty!20530 ((_ is ValueCellFull!5942) mapValue!20530)) b!463214))

(assert (= (and b!463219 ((_ is ValueCellFull!5942) mapDefault!20530)) b!463218))

(assert (= start!41450 b!463219))

(declare-fun m!446105 () Bool)

(assert (=> b!463220 m!446105))

(declare-fun m!446107 () Bool)

(assert (=> b!463217 m!446107))

(declare-fun m!446109 () Bool)

(assert (=> start!41450 m!446109))

(declare-fun m!446111 () Bool)

(assert (=> start!41450 m!446111))

(declare-fun m!446113 () Bool)

(assert (=> start!41450 m!446113))

(declare-fun m!446115 () Bool)

(assert (=> mapNonEmpty!20530 m!446115))

(declare-fun m!446117 () Bool)

(assert (=> b!463215 m!446117))

(check-sat b_and!19489 (not b_next!11143) (not b!463215) (not b!463217) tp_is_empty!12571 (not mapNonEmpty!20530) (not b!463220) (not start!41450))
(check-sat b_and!19489 (not b_next!11143))
(get-model)

(declare-fun b!463273 () Bool)

(declare-fun e!270477 () Bool)

(declare-fun call!30198 () Bool)

(assert (=> b!463273 (= e!270477 call!30198)))

(declare-fun b!463274 () Bool)

(assert (=> b!463274 (= e!270477 call!30198)))

(declare-fun b!463275 () Bool)

(declare-fun e!270474 () Bool)

(assert (=> b!463275 (= e!270474 e!270477)))

(declare-fun c!56610 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!463275 (= c!56610 (validKeyInArray!0 (select (arr!13902 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75031 () Bool)

(declare-fun res!277049 () Bool)

(declare-fun e!270476 () Bool)

(assert (=> d!75031 (=> res!277049 e!270476)))

(assert (=> d!75031 (= res!277049 (bvsge #b00000000000000000000000000000000 (size!14254 _keys!1025)))))

(assert (=> d!75031 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8310) e!270476)))

(declare-fun b!463276 () Bool)

(declare-fun e!270475 () Bool)

(declare-fun contains!2499 (List!8313 (_ BitVec 64)) Bool)

(assert (=> b!463276 (= e!270475 (contains!2499 Nil!8310 (select (arr!13902 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30195 () Bool)

(assert (=> bm!30195 (= call!30198 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56610 (Cons!8309 (select (arr!13902 _keys!1025) #b00000000000000000000000000000000) Nil!8310) Nil!8310)))))

(declare-fun b!463277 () Bool)

(assert (=> b!463277 (= e!270476 e!270474)))

(declare-fun res!277050 () Bool)

(assert (=> b!463277 (=> (not res!277050) (not e!270474))))

(assert (=> b!463277 (= res!277050 (not e!270475))))

(declare-fun res!277051 () Bool)

(assert (=> b!463277 (=> (not res!277051) (not e!270475))))

(assert (=> b!463277 (= res!277051 (validKeyInArray!0 (select (arr!13902 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75031 (not res!277049)) b!463277))

(assert (= (and b!463277 res!277051) b!463276))

(assert (= (and b!463277 res!277050) b!463275))

(assert (= (and b!463275 c!56610) b!463274))

(assert (= (and b!463275 (not c!56610)) b!463273))

(assert (= (or b!463274 b!463273) bm!30195))

(declare-fun m!446147 () Bool)

(assert (=> b!463275 m!446147))

(assert (=> b!463275 m!446147))

(declare-fun m!446149 () Bool)

(assert (=> b!463275 m!446149))

(assert (=> b!463276 m!446147))

(assert (=> b!463276 m!446147))

(declare-fun m!446151 () Bool)

(assert (=> b!463276 m!446151))

(assert (=> bm!30195 m!446147))

(declare-fun m!446153 () Bool)

(assert (=> bm!30195 m!446153))

(assert (=> b!463277 m!446147))

(assert (=> b!463277 m!446147))

(assert (=> b!463277 m!446149))

(assert (=> b!463220 d!75031))

(declare-fun b!463286 () Bool)

(declare-fun e!270484 () Bool)

(declare-fun e!270486 () Bool)

(assert (=> b!463286 (= e!270484 e!270486)))

(declare-fun lt!209356 () (_ BitVec 64))

(assert (=> b!463286 (= lt!209356 (select (arr!13902 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13444 0))(
  ( (Unit!13445) )
))
(declare-fun lt!209355 () Unit!13444)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28940 (_ BitVec 64) (_ BitVec 32)) Unit!13444)

(assert (=> b!463286 (= lt!209355 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209356 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!463286 (arrayContainsKey!0 _keys!1025 lt!209356 #b00000000000000000000000000000000)))

(declare-fun lt!209357 () Unit!13444)

(assert (=> b!463286 (= lt!209357 lt!209355)))

(declare-fun res!277057 () Bool)

(declare-datatypes ((SeekEntryResult!3492 0))(
  ( (MissingZero!3492 (index!16147 (_ BitVec 32))) (Found!3492 (index!16148 (_ BitVec 32))) (Intermediate!3492 (undefined!4304 Bool) (index!16149 (_ BitVec 32)) (x!43190 (_ BitVec 32))) (Undefined!3492) (MissingVacant!3492 (index!16150 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28940 (_ BitVec 32)) SeekEntryResult!3492)

(assert (=> b!463286 (= res!277057 (= (seekEntryOrOpen!0 (select (arr!13902 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3492 #b00000000000000000000000000000000)))))

(assert (=> b!463286 (=> (not res!277057) (not e!270486))))

(declare-fun b!463287 () Bool)

(declare-fun call!30201 () Bool)

(assert (=> b!463287 (= e!270484 call!30201)))

(declare-fun d!75033 () Bool)

(declare-fun res!277056 () Bool)

(declare-fun e!270485 () Bool)

(assert (=> d!75033 (=> res!277056 e!270485)))

(assert (=> d!75033 (= res!277056 (bvsge #b00000000000000000000000000000000 (size!14254 _keys!1025)))))

(assert (=> d!75033 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!270485)))

(declare-fun bm!30198 () Bool)

(assert (=> bm!30198 (= call!30201 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!463288 () Bool)

(assert (=> b!463288 (= e!270485 e!270484)))

(declare-fun c!56613 () Bool)

(assert (=> b!463288 (= c!56613 (validKeyInArray!0 (select (arr!13902 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!463289 () Bool)

(assert (=> b!463289 (= e!270486 call!30201)))

(assert (= (and d!75033 (not res!277056)) b!463288))

(assert (= (and b!463288 c!56613) b!463286))

(assert (= (and b!463288 (not c!56613)) b!463287))

(assert (= (and b!463286 res!277057) b!463289))

(assert (= (or b!463289 b!463287) bm!30198))

(assert (=> b!463286 m!446147))

(declare-fun m!446155 () Bool)

(assert (=> b!463286 m!446155))

(declare-fun m!446157 () Bool)

(assert (=> b!463286 m!446157))

(assert (=> b!463286 m!446147))

(declare-fun m!446159 () Bool)

(assert (=> b!463286 m!446159))

(declare-fun m!446161 () Bool)

(assert (=> bm!30198 m!446161))

(assert (=> b!463288 m!446147))

(assert (=> b!463288 m!446147))

(assert (=> b!463288 m!446149))

(assert (=> b!463215 d!75033))

(declare-fun b!463314 () Bool)

(assert (=> b!463314 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14254 _keys!1025)))))

(assert (=> b!463314 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14253 _values!833)))))

(declare-fun lt!209378 () ListLongMap!7145)

(declare-fun e!270505 () Bool)

(declare-fun apply!319 (ListLongMap!7145 (_ BitVec 64)) V!17867)

(declare-fun get!6849 (ValueCell!5942 V!17867) V!17867)

(declare-fun dynLambda!909 (Int (_ BitVec 64)) V!17867)

(assert (=> b!463314 (= e!270505 (= (apply!319 lt!209378 (select (arr!13902 _keys!1025) #b00000000000000000000000000000000)) (get!6849 (select (arr!13901 _values!833) #b00000000000000000000000000000000) (dynLambda!909 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!463315 () Bool)

(declare-fun e!270502 () Bool)

(declare-fun isEmpty!572 (ListLongMap!7145) Bool)

(assert (=> b!463315 (= e!270502 (isEmpty!572 lt!209378))))

(declare-fun b!463316 () Bool)

(declare-fun e!270504 () Bool)

(declare-fun e!270506 () Bool)

(assert (=> b!463316 (= e!270504 e!270506)))

(declare-fun c!56625 () Bool)

(declare-fun e!270507 () Bool)

(assert (=> b!463316 (= c!56625 e!270507)))

(declare-fun res!277068 () Bool)

(assert (=> b!463316 (=> (not res!277068) (not e!270507))))

(assert (=> b!463316 (= res!277068 (bvslt #b00000000000000000000000000000000 (size!14254 _keys!1025)))))

(declare-fun b!463317 () Bool)

(assert (=> b!463317 (= e!270502 (= lt!209378 (getCurrentListMapNoExtraKeys!1815 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!463318 () Bool)

(declare-fun e!270503 () ListLongMap!7145)

(assert (=> b!463318 (= e!270503 (ListLongMap!7146 Nil!8309))))

(declare-fun b!463319 () Bool)

(declare-fun e!270501 () ListLongMap!7145)

(declare-fun call!30204 () ListLongMap!7145)

(assert (=> b!463319 (= e!270501 call!30204)))

(declare-fun b!463320 () Bool)

(declare-fun lt!209373 () Unit!13444)

(declare-fun lt!209375 () Unit!13444)

(assert (=> b!463320 (= lt!209373 lt!209375)))

(declare-fun lt!209372 () V!17867)

(declare-fun lt!209376 () (_ BitVec 64))

(declare-fun lt!209374 () ListLongMap!7145)

(declare-fun lt!209377 () (_ BitVec 64))

(declare-fun contains!2500 (ListLongMap!7145 (_ BitVec 64)) Bool)

(declare-fun +!1646 (ListLongMap!7145 tuple2!8230) ListLongMap!7145)

(assert (=> b!463320 (not (contains!2500 (+!1646 lt!209374 (tuple2!8231 lt!209376 lt!209372)) lt!209377))))

(declare-fun addStillNotContains!154 (ListLongMap!7145 (_ BitVec 64) V!17867 (_ BitVec 64)) Unit!13444)

(assert (=> b!463320 (= lt!209375 (addStillNotContains!154 lt!209374 lt!209376 lt!209372 lt!209377))))

(assert (=> b!463320 (= lt!209377 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!463320 (= lt!209372 (get!6849 (select (arr!13901 _values!833) #b00000000000000000000000000000000) (dynLambda!909 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!463320 (= lt!209376 (select (arr!13902 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!463320 (= lt!209374 call!30204)))

(assert (=> b!463320 (= e!270501 (+!1646 call!30204 (tuple2!8231 (select (arr!13902 _keys!1025) #b00000000000000000000000000000000) (get!6849 (select (arr!13901 _values!833) #b00000000000000000000000000000000) (dynLambda!909 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!463321 () Bool)

(assert (=> b!463321 (= e!270503 e!270501)))

(declare-fun c!56623 () Bool)

(assert (=> b!463321 (= c!56623 (validKeyInArray!0 (select (arr!13902 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75035 () Bool)

(assert (=> d!75035 e!270504))

(declare-fun res!277067 () Bool)

(assert (=> d!75035 (=> (not res!277067) (not e!270504))))

(assert (=> d!75035 (= res!277067 (not (contains!2500 lt!209378 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75035 (= lt!209378 e!270503)))

(declare-fun c!56624 () Bool)

(assert (=> d!75035 (= c!56624 (bvsge #b00000000000000000000000000000000 (size!14254 _keys!1025)))))

(assert (=> d!75035 (validMask!0 mask!1365)))

(assert (=> d!75035 (= (getCurrentListMapNoExtraKeys!1815 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!209378)))

(declare-fun b!463322 () Bool)

(assert (=> b!463322 (= e!270506 e!270502)))

(declare-fun c!56622 () Bool)

(assert (=> b!463322 (= c!56622 (bvslt #b00000000000000000000000000000000 (size!14254 _keys!1025)))))

(declare-fun bm!30201 () Bool)

(assert (=> bm!30201 (= call!30204 (getCurrentListMapNoExtraKeys!1815 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!463323 () Bool)

(declare-fun res!277069 () Bool)

(assert (=> b!463323 (=> (not res!277069) (not e!270504))))

(assert (=> b!463323 (= res!277069 (not (contains!2500 lt!209378 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!463324 () Bool)

(assert (=> b!463324 (= e!270506 e!270505)))

(assert (=> b!463324 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14254 _keys!1025)))))

(declare-fun res!277066 () Bool)

(assert (=> b!463324 (= res!277066 (contains!2500 lt!209378 (select (arr!13902 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!463324 (=> (not res!277066) (not e!270505))))

(declare-fun b!463325 () Bool)

(assert (=> b!463325 (= e!270507 (validKeyInArray!0 (select (arr!13902 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!463325 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!75035 c!56624) b!463318))

(assert (= (and d!75035 (not c!56624)) b!463321))

(assert (= (and b!463321 c!56623) b!463320))

(assert (= (and b!463321 (not c!56623)) b!463319))

(assert (= (or b!463320 b!463319) bm!30201))

(assert (= (and d!75035 res!277067) b!463323))

(assert (= (and b!463323 res!277069) b!463316))

(assert (= (and b!463316 res!277068) b!463325))

(assert (= (and b!463316 c!56625) b!463324))

(assert (= (and b!463316 (not c!56625)) b!463322))

(assert (= (and b!463324 res!277066) b!463314))

(assert (= (and b!463322 c!56622) b!463317))

(assert (= (and b!463322 (not c!56622)) b!463315))

(declare-fun b_lambda!9979 () Bool)

(assert (=> (not b_lambda!9979) (not b!463314)))

(declare-fun t!14252 () Bool)

(declare-fun tb!3895 () Bool)

(assert (=> (and start!41450 (= defaultEntry!841 defaultEntry!841) t!14252) tb!3895))

(declare-fun result!7359 () Bool)

(assert (=> tb!3895 (= result!7359 tp_is_empty!12571)))

(assert (=> b!463314 t!14252))

(declare-fun b_and!19495 () Bool)

(assert (= b_and!19489 (and (=> t!14252 result!7359) b_and!19495)))

(declare-fun b_lambda!9981 () Bool)

(assert (=> (not b_lambda!9981) (not b!463320)))

(assert (=> b!463320 t!14252))

(declare-fun b_and!19497 () Bool)

(assert (= b_and!19495 (and (=> t!14252 result!7359) b_and!19497)))

(declare-fun m!446163 () Bool)

(assert (=> b!463320 m!446163))

(declare-fun m!446165 () Bool)

(assert (=> b!463320 m!446165))

(declare-fun m!446167 () Bool)

(assert (=> b!463320 m!446167))

(assert (=> b!463320 m!446163))

(assert (=> b!463320 m!446167))

(declare-fun m!446169 () Bool)

(assert (=> b!463320 m!446169))

(declare-fun m!446171 () Bool)

(assert (=> b!463320 m!446171))

(declare-fun m!446173 () Bool)

(assert (=> b!463320 m!446173))

(assert (=> b!463320 m!446147))

(assert (=> b!463320 m!446171))

(declare-fun m!446175 () Bool)

(assert (=> b!463320 m!446175))

(declare-fun m!446177 () Bool)

(assert (=> b!463317 m!446177))

(declare-fun m!446179 () Bool)

(assert (=> b!463315 m!446179))

(declare-fun m!446181 () Bool)

(assert (=> d!75035 m!446181))

(assert (=> d!75035 m!446109))

(assert (=> b!463321 m!446147))

(assert (=> b!463321 m!446147))

(assert (=> b!463321 m!446149))

(declare-fun m!446183 () Bool)

(assert (=> b!463323 m!446183))

(assert (=> b!463325 m!446147))

(assert (=> b!463325 m!446147))

(assert (=> b!463325 m!446149))

(assert (=> b!463314 m!446147))

(declare-fun m!446185 () Bool)

(assert (=> b!463314 m!446185))

(assert (=> b!463314 m!446163))

(assert (=> b!463314 m!446167))

(assert (=> b!463314 m!446163))

(assert (=> b!463314 m!446167))

(assert (=> b!463314 m!446169))

(assert (=> b!463314 m!446147))

(assert (=> bm!30201 m!446177))

(assert (=> b!463324 m!446147))

(assert (=> b!463324 m!446147))

(declare-fun m!446187 () Bool)

(assert (=> b!463324 m!446187))

(assert (=> b!463217 d!75035))

(declare-fun d!75037 () Bool)

(assert (=> d!75037 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41450 d!75037))

(declare-fun d!75039 () Bool)

(assert (=> d!75039 (= (array_inv!10132 _keys!1025) (bvsge (size!14254 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41450 d!75039))

(declare-fun d!75041 () Bool)

(assert (=> d!75041 (= (array_inv!10133 _values!833) (bvsge (size!14253 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41450 d!75041))

(declare-fun condMapEmpty!20539 () Bool)

(declare-fun mapDefault!20539 () ValueCell!5942)

(assert (=> mapNonEmpty!20530 (= condMapEmpty!20539 (= mapRest!20530 ((as const (Array (_ BitVec 32) ValueCell!5942)) mapDefault!20539)))))

(declare-fun e!270512 () Bool)

(declare-fun mapRes!20539 () Bool)

(assert (=> mapNonEmpty!20530 (= tp!39423 (and e!270512 mapRes!20539))))

(declare-fun b!463334 () Bool)

(declare-fun e!270513 () Bool)

(assert (=> b!463334 (= e!270513 tp_is_empty!12571)))

(declare-fun mapIsEmpty!20539 () Bool)

(assert (=> mapIsEmpty!20539 mapRes!20539))

(declare-fun mapNonEmpty!20539 () Bool)

(declare-fun tp!39439 () Bool)

(assert (=> mapNonEmpty!20539 (= mapRes!20539 (and tp!39439 e!270513))))

(declare-fun mapRest!20539 () (Array (_ BitVec 32) ValueCell!5942))

(declare-fun mapKey!20539 () (_ BitVec 32))

(declare-fun mapValue!20539 () ValueCell!5942)

(assert (=> mapNonEmpty!20539 (= mapRest!20530 (store mapRest!20539 mapKey!20539 mapValue!20539))))

(declare-fun b!463335 () Bool)

(assert (=> b!463335 (= e!270512 tp_is_empty!12571)))

(assert (= (and mapNonEmpty!20530 condMapEmpty!20539) mapIsEmpty!20539))

(assert (= (and mapNonEmpty!20530 (not condMapEmpty!20539)) mapNonEmpty!20539))

(assert (= (and mapNonEmpty!20539 ((_ is ValueCellFull!5942) mapValue!20539)) b!463334))

(assert (= (and mapNonEmpty!20530 ((_ is ValueCellFull!5942) mapDefault!20539)) b!463335))

(declare-fun m!446189 () Bool)

(assert (=> mapNonEmpty!20539 m!446189))

(declare-fun b_lambda!9983 () Bool)

(assert (= b_lambda!9979 (or (and start!41450 b_free!11143) b_lambda!9983)))

(declare-fun b_lambda!9985 () Bool)

(assert (= b_lambda!9981 (or (and start!41450 b_free!11143) b_lambda!9985)))

(check-sat (not b!463277) (not b_next!11143) (not b!463314) b_and!19497 (not bm!30195) (not mapNonEmpty!20539) (not b!463286) (not b!463276) (not b!463325) (not bm!30201) (not bm!30198) (not b!463288) (not b!463323) (not b!463317) (not d!75035) (not b!463321) (not b!463315) tp_is_empty!12571 (not b!463324) (not b!463320) (not b!463275) (not b_lambda!9985) (not b_lambda!9983))
(check-sat b_and!19497 (not b_next!11143))
