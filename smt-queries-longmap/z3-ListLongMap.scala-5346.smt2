; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71418 () Bool)

(assert start!71418)

(declare-fun b_free!13483 () Bool)

(declare-fun b_next!13483 () Bool)

(assert (=> start!71418 (= b_free!13483 (not b_next!13483))))

(declare-fun tp!47229 () Bool)

(declare-fun b_and!22463 () Bool)

(assert (=> start!71418 (= tp!47229 b_and!22463)))

(declare-fun mapNonEmpty!24436 () Bool)

(declare-fun mapRes!24436 () Bool)

(declare-fun tp!47230 () Bool)

(declare-fun e!462332 () Bool)

(assert (=> mapNonEmpty!24436 (= mapRes!24436 (and tp!47230 e!462332))))

(declare-fun mapKey!24436 () (_ BitVec 32))

(declare-datatypes ((V!25259 0))(
  ( (V!25260 (val!7644 Int)) )
))
(declare-datatypes ((ValueCell!7181 0))(
  ( (ValueCellFull!7181 (v!10078 V!25259)) (EmptyCell!7181) )
))
(declare-fun mapRest!24436 () (Array (_ BitVec 32) ValueCell!7181))

(declare-datatypes ((array!46527 0))(
  ( (array!46528 (arr!22302 (Array (_ BitVec 32) ValueCell!7181)) (size!22723 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46527)

(declare-fun mapValue!24436 () ValueCell!7181)

(assert (=> mapNonEmpty!24436 (= (arr!22302 _values!788) (store mapRest!24436 mapKey!24436 mapValue!24436))))

(declare-fun b!829404 () Bool)

(declare-fun res!565056 () Bool)

(declare-fun e!462335 () Bool)

(assert (=> b!829404 (=> (not res!565056) (not e!462335))))

(declare-datatypes ((array!46529 0))(
  ( (array!46530 (arr!22303 (Array (_ BitVec 32) (_ BitVec 64))) (size!22724 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46529)

(declare-datatypes ((List!15936 0))(
  ( (Nil!15933) (Cons!15932 (h!17061 (_ BitVec 64)) (t!22288 List!15936)) )
))
(declare-fun arrayNoDuplicates!0 (array!46529 (_ BitVec 32) List!15936) Bool)

(assert (=> b!829404 (= res!565056 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15933))))

(declare-fun mapIsEmpty!24436 () Bool)

(assert (=> mapIsEmpty!24436 mapRes!24436))

(declare-fun b!829405 () Bool)

(declare-fun e!462336 () Bool)

(declare-fun e!462333 () Bool)

(assert (=> b!829405 (= e!462336 (and e!462333 mapRes!24436))))

(declare-fun condMapEmpty!24436 () Bool)

(declare-fun mapDefault!24436 () ValueCell!7181)

(assert (=> b!829405 (= condMapEmpty!24436 (= (arr!22302 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7181)) mapDefault!24436)))))

(declare-fun b!829406 () Bool)

(declare-fun res!565053 () Bool)

(assert (=> b!829406 (=> (not res!565053) (not e!462335))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46529 (_ BitVec 32)) Bool)

(assert (=> b!829406 (= res!565053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!829407 () Bool)

(declare-fun tp_is_empty!15193 () Bool)

(assert (=> b!829407 (= e!462333 tp_is_empty!15193)))

(declare-datatypes ((tuple2!10152 0))(
  ( (tuple2!10153 (_1!5087 (_ BitVec 64)) (_2!5087 V!25259)) )
))
(declare-datatypes ((List!15937 0))(
  ( (Nil!15934) (Cons!15933 (h!17062 tuple2!10152) (t!22289 List!15937)) )
))
(declare-datatypes ((ListLongMap!8965 0))(
  ( (ListLongMap!8966 (toList!4498 List!15937)) )
))
(declare-fun lt!376048 () ListLongMap!8965)

(declare-fun zeroValueBefore!34 () V!25259)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun e!462337 () Bool)

(declare-fun minValue!754 () V!25259)

(declare-fun b!829408 () Bool)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2550 (array!46529 array!46527 (_ BitVec 32) (_ BitVec 32) V!25259 V!25259 (_ BitVec 32) Int) ListLongMap!8965)

(declare-fun +!2007 (ListLongMap!8965 tuple2!10152) ListLongMap!8965)

(assert (=> b!829408 (= e!462337 (= (getCurrentListMap!2550 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!2007 (+!2007 lt!376048 (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun zeroValueAfter!34 () V!25259)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lt!376051 () ListLongMap!8965)

(assert (=> b!829408 (= lt!376051 (getCurrentListMap!2550 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!565057 () Bool)

(assert (=> start!71418 (=> (not res!565057) (not e!462335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71418 (= res!565057 (validMask!0 mask!1312))))

(assert (=> start!71418 e!462335))

(assert (=> start!71418 tp_is_empty!15193))

(declare-fun array_inv!17827 (array!46529) Bool)

(assert (=> start!71418 (array_inv!17827 _keys!976)))

(assert (=> start!71418 true))

(declare-fun array_inv!17828 (array!46527) Bool)

(assert (=> start!71418 (and (array_inv!17828 _values!788) e!462336)))

(assert (=> start!71418 tp!47229))

(declare-fun b!829409 () Bool)

(assert (=> b!829409 (= e!462335 (not e!462337))))

(declare-fun res!565054 () Bool)

(assert (=> b!829409 (=> res!565054 e!462337)))

(assert (=> b!829409 (= res!565054 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!376050 () ListLongMap!8965)

(assert (=> b!829409 (= lt!376048 lt!376050)))

(declare-datatypes ((Unit!28371 0))(
  ( (Unit!28372) )
))
(declare-fun lt!376049 () Unit!28371)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!596 (array!46529 array!46527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25259 V!25259 V!25259 V!25259 (_ BitVec 32) Int) Unit!28371)

(assert (=> b!829409 (= lt!376049 (lemmaNoChangeToArrayThenSameMapNoExtras!596 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2526 (array!46529 array!46527 (_ BitVec 32) (_ BitVec 32) V!25259 V!25259 (_ BitVec 32) Int) ListLongMap!8965)

(assert (=> b!829409 (= lt!376050 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829409 (= lt!376048 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829410 () Bool)

(assert (=> b!829410 (= e!462332 tp_is_empty!15193)))

(declare-fun b!829411 () Bool)

(declare-fun res!565055 () Bool)

(assert (=> b!829411 (=> (not res!565055) (not e!462335))))

(assert (=> b!829411 (= res!565055 (and (= (size!22723 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22724 _keys!976) (size!22723 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71418 res!565057) b!829411))

(assert (= (and b!829411 res!565055) b!829406))

(assert (= (and b!829406 res!565053) b!829404))

(assert (= (and b!829404 res!565056) b!829409))

(assert (= (and b!829409 (not res!565054)) b!829408))

(assert (= (and b!829405 condMapEmpty!24436) mapIsEmpty!24436))

(assert (= (and b!829405 (not condMapEmpty!24436)) mapNonEmpty!24436))

(get-info :version)

(assert (= (and mapNonEmpty!24436 ((_ is ValueCellFull!7181) mapValue!24436)) b!829410))

(assert (= (and b!829405 ((_ is ValueCellFull!7181) mapDefault!24436)) b!829407))

(assert (= start!71418 b!829405))

(declare-fun m!771919 () Bool)

(assert (=> b!829408 m!771919))

(declare-fun m!771921 () Bool)

(assert (=> b!829408 m!771921))

(assert (=> b!829408 m!771921))

(declare-fun m!771923 () Bool)

(assert (=> b!829408 m!771923))

(declare-fun m!771925 () Bool)

(assert (=> b!829408 m!771925))

(declare-fun m!771927 () Bool)

(assert (=> b!829406 m!771927))

(declare-fun m!771929 () Bool)

(assert (=> b!829409 m!771929))

(declare-fun m!771931 () Bool)

(assert (=> b!829409 m!771931))

(declare-fun m!771933 () Bool)

(assert (=> b!829409 m!771933))

(declare-fun m!771935 () Bool)

(assert (=> start!71418 m!771935))

(declare-fun m!771937 () Bool)

(assert (=> start!71418 m!771937))

(declare-fun m!771939 () Bool)

(assert (=> start!71418 m!771939))

(declare-fun m!771941 () Bool)

(assert (=> b!829404 m!771941))

(declare-fun m!771943 () Bool)

(assert (=> mapNonEmpty!24436 m!771943))

(check-sat b_and!22463 (not b!829409) (not b!829404) (not start!71418) (not mapNonEmpty!24436) tp_is_empty!15193 (not b!829406) (not b!829408) (not b_next!13483))
(check-sat b_and!22463 (not b_next!13483))
(get-model)

(declare-fun d!105085 () Bool)

(assert (=> d!105085 (= (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376078 () Unit!28371)

(declare-fun choose!1423 (array!46529 array!46527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25259 V!25259 V!25259 V!25259 (_ BitVec 32) Int) Unit!28371)

(assert (=> d!105085 (= lt!376078 (choose!1423 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105085 (validMask!0 mask!1312)))

(assert (=> d!105085 (= (lemmaNoChangeToArrayThenSameMapNoExtras!596 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376078)))

(declare-fun bs!23144 () Bool)

(assert (= bs!23144 d!105085))

(assert (=> bs!23144 m!771933))

(assert (=> bs!23144 m!771931))

(declare-fun m!771997 () Bool)

(assert (=> bs!23144 m!771997))

(assert (=> bs!23144 m!771935))

(assert (=> b!829409 d!105085))

(declare-fun b!829485 () Bool)

(declare-fun e!462389 () ListLongMap!8965)

(declare-fun call!36123 () ListLongMap!8965)

(assert (=> b!829485 (= e!462389 call!36123)))

(declare-fun b!829486 () Bool)

(declare-fun e!462391 () Bool)

(declare-fun e!462393 () Bool)

(assert (=> b!829486 (= e!462391 e!462393)))

(assert (=> b!829486 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(declare-fun res!565096 () Bool)

(declare-fun lt!376098 () ListLongMap!8965)

(declare-fun contains!4181 (ListLongMap!8965 (_ BitVec 64)) Bool)

(assert (=> b!829486 (= res!565096 (contains!4181 lt!376098 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829486 (=> (not res!565096) (not e!462393))))

(declare-fun b!829487 () Bool)

(declare-fun e!462392 () Bool)

(assert (=> b!829487 (= e!462392 e!462391)))

(declare-fun c!89713 () Bool)

(declare-fun e!462394 () Bool)

(assert (=> b!829487 (= c!89713 e!462394)))

(declare-fun res!565098 () Bool)

(assert (=> b!829487 (=> (not res!565098) (not e!462394))))

(assert (=> b!829487 (= res!565098 (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(declare-fun e!462388 () Bool)

(declare-fun b!829488 () Bool)

(assert (=> b!829488 (= e!462388 (= lt!376098 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829489 () Bool)

(declare-fun lt!376096 () Unit!28371)

(declare-fun lt!376099 () Unit!28371)

(assert (=> b!829489 (= lt!376096 lt!376099)))

(declare-fun lt!376093 () V!25259)

(declare-fun lt!376095 () (_ BitVec 64))

(declare-fun lt!376097 () ListLongMap!8965)

(declare-fun lt!376094 () (_ BitVec 64))

(assert (=> b!829489 (not (contains!4181 (+!2007 lt!376097 (tuple2!10153 lt!376094 lt!376093)) lt!376095))))

(declare-fun addStillNotContains!196 (ListLongMap!8965 (_ BitVec 64) V!25259 (_ BitVec 64)) Unit!28371)

(assert (=> b!829489 (= lt!376099 (addStillNotContains!196 lt!376097 lt!376094 lt!376093 lt!376095))))

(assert (=> b!829489 (= lt!376095 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11817 (ValueCell!7181 V!25259) V!25259)

(declare-fun dynLambda!984 (Int (_ BitVec 64)) V!25259)

(assert (=> b!829489 (= lt!376093 (get!11817 (select (arr!22302 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829489 (= lt!376094 (select (arr!22303 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829489 (= lt!376097 call!36123)))

(assert (=> b!829489 (= e!462389 (+!2007 call!36123 (tuple2!10153 (select (arr!22303 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22302 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829490 () Bool)

(declare-fun isEmpty!657 (ListLongMap!8965) Bool)

(assert (=> b!829490 (= e!462388 (isEmpty!657 lt!376098))))

(declare-fun b!829491 () Bool)

(declare-fun e!462390 () ListLongMap!8965)

(assert (=> b!829491 (= e!462390 (ListLongMap!8966 Nil!15934))))

(declare-fun b!829492 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!829492 (= e!462394 (validKeyInArray!0 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829492 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829484 () Bool)

(assert (=> b!829484 (= e!462390 e!462389)))

(declare-fun c!89714 () Bool)

(assert (=> b!829484 (= c!89714 (validKeyInArray!0 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105087 () Bool)

(assert (=> d!105087 e!462392))

(declare-fun res!565097 () Bool)

(assert (=> d!105087 (=> (not res!565097) (not e!462392))))

(assert (=> d!105087 (= res!565097 (not (contains!4181 lt!376098 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105087 (= lt!376098 e!462390)))

(declare-fun c!89715 () Bool)

(assert (=> d!105087 (= c!89715 (bvsge #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(assert (=> d!105087 (validMask!0 mask!1312)))

(assert (=> d!105087 (= (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376098)))

(declare-fun b!829493 () Bool)

(declare-fun res!565099 () Bool)

(assert (=> b!829493 (=> (not res!565099) (not e!462392))))

(assert (=> b!829493 (= res!565099 (not (contains!4181 lt!376098 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!829494 () Bool)

(assert (=> b!829494 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(assert (=> b!829494 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22723 _values!788)))))

(declare-fun apply!370 (ListLongMap!8965 (_ BitVec 64)) V!25259)

(assert (=> b!829494 (= e!462393 (= (apply!370 lt!376098 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)) (get!11817 (select (arr!22302 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!829495 () Bool)

(assert (=> b!829495 (= e!462391 e!462388)))

(declare-fun c!89716 () Bool)

(assert (=> b!829495 (= c!89716 (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(declare-fun bm!36120 () Bool)

(assert (=> bm!36120 (= call!36123 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!105087 c!89715) b!829491))

(assert (= (and d!105087 (not c!89715)) b!829484))

(assert (= (and b!829484 c!89714) b!829489))

(assert (= (and b!829484 (not c!89714)) b!829485))

(assert (= (or b!829489 b!829485) bm!36120))

(assert (= (and d!105087 res!565097) b!829493))

(assert (= (and b!829493 res!565099) b!829487))

(assert (= (and b!829487 res!565098) b!829492))

(assert (= (and b!829487 c!89713) b!829486))

(assert (= (and b!829487 (not c!89713)) b!829495))

(assert (= (and b!829486 res!565096) b!829494))

(assert (= (and b!829495 c!89716) b!829488))

(assert (= (and b!829495 (not c!89716)) b!829490))

(declare-fun b_lambda!11281 () Bool)

(assert (=> (not b_lambda!11281) (not b!829489)))

(declare-fun t!22293 () Bool)

(declare-fun tb!4213 () Bool)

(assert (=> (and start!71418 (= defaultEntry!796 defaultEntry!796) t!22293) tb!4213))

(declare-fun result!7995 () Bool)

(assert (=> tb!4213 (= result!7995 tp_is_empty!15193)))

(assert (=> b!829489 t!22293))

(declare-fun b_and!22469 () Bool)

(assert (= b_and!22463 (and (=> t!22293 result!7995) b_and!22469)))

(declare-fun b_lambda!11283 () Bool)

(assert (=> (not b_lambda!11283) (not b!829494)))

(assert (=> b!829494 t!22293))

(declare-fun b_and!22471 () Bool)

(assert (= b_and!22469 (and (=> t!22293 result!7995) b_and!22471)))

(declare-fun m!771999 () Bool)

(assert (=> d!105087 m!771999))

(assert (=> d!105087 m!771935))

(declare-fun m!772001 () Bool)

(assert (=> b!829494 m!772001))

(declare-fun m!772003 () Bool)

(assert (=> b!829494 m!772003))

(declare-fun m!772005 () Bool)

(assert (=> b!829494 m!772005))

(assert (=> b!829494 m!772001))

(declare-fun m!772007 () Bool)

(assert (=> b!829494 m!772007))

(assert (=> b!829494 m!772003))

(declare-fun m!772009 () Bool)

(assert (=> b!829494 m!772009))

(assert (=> b!829494 m!772005))

(declare-fun m!772011 () Bool)

(assert (=> bm!36120 m!772011))

(assert (=> b!829492 m!772003))

(assert (=> b!829492 m!772003))

(declare-fun m!772013 () Bool)

(assert (=> b!829492 m!772013))

(declare-fun m!772015 () Bool)

(assert (=> b!829493 m!772015))

(declare-fun m!772017 () Bool)

(assert (=> b!829490 m!772017))

(assert (=> b!829488 m!772011))

(assert (=> b!829489 m!772001))

(declare-fun m!772019 () Bool)

(assert (=> b!829489 m!772019))

(assert (=> b!829489 m!772005))

(assert (=> b!829489 m!772019))

(declare-fun m!772021 () Bool)

(assert (=> b!829489 m!772021))

(assert (=> b!829489 m!772003))

(declare-fun m!772023 () Bool)

(assert (=> b!829489 m!772023))

(assert (=> b!829489 m!772005))

(assert (=> b!829489 m!772001))

(assert (=> b!829489 m!772007))

(declare-fun m!772025 () Bool)

(assert (=> b!829489 m!772025))

(assert (=> b!829484 m!772003))

(assert (=> b!829484 m!772003))

(assert (=> b!829484 m!772013))

(assert (=> b!829486 m!772003))

(assert (=> b!829486 m!772003))

(declare-fun m!772027 () Bool)

(assert (=> b!829486 m!772027))

(assert (=> b!829409 d!105087))

(declare-fun b!829499 () Bool)

(declare-fun e!462396 () ListLongMap!8965)

(declare-fun call!36124 () ListLongMap!8965)

(assert (=> b!829499 (= e!462396 call!36124)))

(declare-fun b!829500 () Bool)

(declare-fun e!462398 () Bool)

(declare-fun e!462400 () Bool)

(assert (=> b!829500 (= e!462398 e!462400)))

(assert (=> b!829500 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(declare-fun res!565100 () Bool)

(declare-fun lt!376105 () ListLongMap!8965)

(assert (=> b!829500 (= res!565100 (contains!4181 lt!376105 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829500 (=> (not res!565100) (not e!462400))))

(declare-fun b!829501 () Bool)

(declare-fun e!462399 () Bool)

(assert (=> b!829501 (= e!462399 e!462398)))

(declare-fun c!89717 () Bool)

(declare-fun e!462401 () Bool)

(assert (=> b!829501 (= c!89717 e!462401)))

(declare-fun res!565102 () Bool)

(assert (=> b!829501 (=> (not res!565102) (not e!462401))))

(assert (=> b!829501 (= res!565102 (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(declare-fun e!462395 () Bool)

(declare-fun b!829502 () Bool)

(assert (=> b!829502 (= e!462395 (= lt!376105 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829503 () Bool)

(declare-fun lt!376103 () Unit!28371)

(declare-fun lt!376106 () Unit!28371)

(assert (=> b!829503 (= lt!376103 lt!376106)))

(declare-fun lt!376102 () (_ BitVec 64))

(declare-fun lt!376104 () ListLongMap!8965)

(declare-fun lt!376101 () (_ BitVec 64))

(declare-fun lt!376100 () V!25259)

(assert (=> b!829503 (not (contains!4181 (+!2007 lt!376104 (tuple2!10153 lt!376101 lt!376100)) lt!376102))))

(assert (=> b!829503 (= lt!376106 (addStillNotContains!196 lt!376104 lt!376101 lt!376100 lt!376102))))

(assert (=> b!829503 (= lt!376102 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!829503 (= lt!376100 (get!11817 (select (arr!22302 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829503 (= lt!376101 (select (arr!22303 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829503 (= lt!376104 call!36124)))

(assert (=> b!829503 (= e!462396 (+!2007 call!36124 (tuple2!10153 (select (arr!22303 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22302 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829504 () Bool)

(assert (=> b!829504 (= e!462395 (isEmpty!657 lt!376105))))

(declare-fun b!829505 () Bool)

(declare-fun e!462397 () ListLongMap!8965)

(assert (=> b!829505 (= e!462397 (ListLongMap!8966 Nil!15934))))

(declare-fun b!829506 () Bool)

(assert (=> b!829506 (= e!462401 (validKeyInArray!0 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829506 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829498 () Bool)

(assert (=> b!829498 (= e!462397 e!462396)))

(declare-fun c!89718 () Bool)

(assert (=> b!829498 (= c!89718 (validKeyInArray!0 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105089 () Bool)

(assert (=> d!105089 e!462399))

(declare-fun res!565101 () Bool)

(assert (=> d!105089 (=> (not res!565101) (not e!462399))))

(assert (=> d!105089 (= res!565101 (not (contains!4181 lt!376105 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105089 (= lt!376105 e!462397)))

(declare-fun c!89719 () Bool)

(assert (=> d!105089 (= c!89719 (bvsge #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(assert (=> d!105089 (validMask!0 mask!1312)))

(assert (=> d!105089 (= (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376105)))

(declare-fun b!829507 () Bool)

(declare-fun res!565103 () Bool)

(assert (=> b!829507 (=> (not res!565103) (not e!462399))))

(assert (=> b!829507 (= res!565103 (not (contains!4181 lt!376105 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!829508 () Bool)

(assert (=> b!829508 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(assert (=> b!829508 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22723 _values!788)))))

(assert (=> b!829508 (= e!462400 (= (apply!370 lt!376105 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)) (get!11817 (select (arr!22302 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!829509 () Bool)

(assert (=> b!829509 (= e!462398 e!462395)))

(declare-fun c!89720 () Bool)

(assert (=> b!829509 (= c!89720 (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(declare-fun bm!36121 () Bool)

(assert (=> bm!36121 (= call!36124 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!105089 c!89719) b!829505))

(assert (= (and d!105089 (not c!89719)) b!829498))

(assert (= (and b!829498 c!89718) b!829503))

(assert (= (and b!829498 (not c!89718)) b!829499))

(assert (= (or b!829503 b!829499) bm!36121))

(assert (= (and d!105089 res!565101) b!829507))

(assert (= (and b!829507 res!565103) b!829501))

(assert (= (and b!829501 res!565102) b!829506))

(assert (= (and b!829501 c!89717) b!829500))

(assert (= (and b!829501 (not c!89717)) b!829509))

(assert (= (and b!829500 res!565100) b!829508))

(assert (= (and b!829509 c!89720) b!829502))

(assert (= (and b!829509 (not c!89720)) b!829504))

(declare-fun b_lambda!11285 () Bool)

(assert (=> (not b_lambda!11285) (not b!829503)))

(assert (=> b!829503 t!22293))

(declare-fun b_and!22473 () Bool)

(assert (= b_and!22471 (and (=> t!22293 result!7995) b_and!22473)))

(declare-fun b_lambda!11287 () Bool)

(assert (=> (not b_lambda!11287) (not b!829508)))

(assert (=> b!829508 t!22293))

(declare-fun b_and!22475 () Bool)

(assert (= b_and!22473 (and (=> t!22293 result!7995) b_and!22475)))

(declare-fun m!772029 () Bool)

(assert (=> d!105089 m!772029))

(assert (=> d!105089 m!771935))

(assert (=> b!829508 m!772001))

(assert (=> b!829508 m!772003))

(assert (=> b!829508 m!772005))

(assert (=> b!829508 m!772001))

(assert (=> b!829508 m!772007))

(assert (=> b!829508 m!772003))

(declare-fun m!772031 () Bool)

(assert (=> b!829508 m!772031))

(assert (=> b!829508 m!772005))

(declare-fun m!772033 () Bool)

(assert (=> bm!36121 m!772033))

(assert (=> b!829506 m!772003))

(assert (=> b!829506 m!772003))

(assert (=> b!829506 m!772013))

(declare-fun m!772035 () Bool)

(assert (=> b!829507 m!772035))

(declare-fun m!772037 () Bool)

(assert (=> b!829504 m!772037))

(assert (=> b!829502 m!772033))

(assert (=> b!829503 m!772001))

(declare-fun m!772039 () Bool)

(assert (=> b!829503 m!772039))

(assert (=> b!829503 m!772005))

(assert (=> b!829503 m!772039))

(declare-fun m!772041 () Bool)

(assert (=> b!829503 m!772041))

(assert (=> b!829503 m!772003))

(declare-fun m!772043 () Bool)

(assert (=> b!829503 m!772043))

(assert (=> b!829503 m!772005))

(assert (=> b!829503 m!772001))

(assert (=> b!829503 m!772007))

(declare-fun m!772045 () Bool)

(assert (=> b!829503 m!772045))

(assert (=> b!829498 m!772003))

(assert (=> b!829498 m!772003))

(assert (=> b!829498 m!772013))

(assert (=> b!829500 m!772003))

(assert (=> b!829500 m!772003))

(declare-fun m!772047 () Bool)

(assert (=> b!829500 m!772047))

(assert (=> b!829409 d!105089))

(declare-fun b!829518 () Bool)

(declare-fun e!462409 () Bool)

(declare-fun e!462408 () Bool)

(assert (=> b!829518 (= e!462409 e!462408)))

(declare-fun lt!376113 () (_ BitVec 64))

(assert (=> b!829518 (= lt!376113 (select (arr!22303 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376115 () Unit!28371)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46529 (_ BitVec 64) (_ BitVec 32)) Unit!28371)

(assert (=> b!829518 (= lt!376115 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!376113 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!829518 (arrayContainsKey!0 _keys!976 lt!376113 #b00000000000000000000000000000000)))

(declare-fun lt!376114 () Unit!28371)

(assert (=> b!829518 (= lt!376114 lt!376115)))

(declare-fun res!565108 () Bool)

(declare-datatypes ((SeekEntryResult!8738 0))(
  ( (MissingZero!8738 (index!37323 (_ BitVec 32))) (Found!8738 (index!37324 (_ BitVec 32))) (Intermediate!8738 (undefined!9550 Bool) (index!37325 (_ BitVec 32)) (x!70060 (_ BitVec 32))) (Undefined!8738) (MissingVacant!8738 (index!37326 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46529 (_ BitVec 32)) SeekEntryResult!8738)

(assert (=> b!829518 (= res!565108 (= (seekEntryOrOpen!0 (select (arr!22303 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8738 #b00000000000000000000000000000000)))))

(assert (=> b!829518 (=> (not res!565108) (not e!462408))))

(declare-fun bm!36124 () Bool)

(declare-fun call!36127 () Bool)

(assert (=> bm!36124 (= call!36127 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!829519 () Bool)

(declare-fun e!462410 () Bool)

(assert (=> b!829519 (= e!462410 e!462409)))

(declare-fun c!89723 () Bool)

(assert (=> b!829519 (= c!89723 (validKeyInArray!0 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829520 () Bool)

(assert (=> b!829520 (= e!462409 call!36127)))

(declare-fun b!829521 () Bool)

(assert (=> b!829521 (= e!462408 call!36127)))

(declare-fun d!105091 () Bool)

(declare-fun res!565109 () Bool)

(assert (=> d!105091 (=> res!565109 e!462410)))

(assert (=> d!105091 (= res!565109 (bvsge #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(assert (=> d!105091 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!462410)))

(assert (= (and d!105091 (not res!565109)) b!829519))

(assert (= (and b!829519 c!89723) b!829518))

(assert (= (and b!829519 (not c!89723)) b!829520))

(assert (= (and b!829518 res!565108) b!829521))

(assert (= (or b!829521 b!829520) bm!36124))

(assert (=> b!829518 m!772003))

(declare-fun m!772049 () Bool)

(assert (=> b!829518 m!772049))

(declare-fun m!772051 () Bool)

(assert (=> b!829518 m!772051))

(assert (=> b!829518 m!772003))

(declare-fun m!772053 () Bool)

(assert (=> b!829518 m!772053))

(declare-fun m!772055 () Bool)

(assert (=> bm!36124 m!772055))

(assert (=> b!829519 m!772003))

(assert (=> b!829519 m!772003))

(assert (=> b!829519 m!772013))

(assert (=> b!829406 d!105091))

(declare-fun d!105093 () Bool)

(assert (=> d!105093 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71418 d!105093))

(declare-fun d!105095 () Bool)

(assert (=> d!105095 (= (array_inv!17827 _keys!976) (bvsge (size!22724 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71418 d!105095))

(declare-fun d!105097 () Bool)

(assert (=> d!105097 (= (array_inv!17828 _values!788) (bvsge (size!22723 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71418 d!105097))

(declare-fun b!829564 () Bool)

(declare-fun e!462441 () Bool)

(declare-fun lt!376162 () ListLongMap!8965)

(assert (=> b!829564 (= e!462441 (= (apply!370 lt!376162 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!829565 () Bool)

(declare-fun e!462442 () Bool)

(declare-fun call!36143 () Bool)

(assert (=> b!829565 (= e!462442 (not call!36143))))

(declare-fun b!829566 () Bool)

(declare-fun c!89737 () Bool)

(assert (=> b!829566 (= c!89737 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!462443 () ListLongMap!8965)

(declare-fun e!462447 () ListLongMap!8965)

(assert (=> b!829566 (= e!462443 e!462447)))

(declare-fun call!36142 () ListLongMap!8965)

(declare-fun c!89740 () Bool)

(declare-fun bm!36139 () Bool)

(declare-fun c!89739 () Bool)

(declare-fun call!36144 () ListLongMap!8965)

(declare-fun call!36145 () ListLongMap!8965)

(declare-fun call!36147 () ListLongMap!8965)

(assert (=> bm!36139 (= call!36142 (+!2007 (ite c!89740 call!36144 (ite c!89739 call!36147 call!36145)) (ite (or c!89740 c!89739) (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829567 () Bool)

(declare-fun e!462445 () Bool)

(assert (=> b!829567 (= e!462445 e!462442)))

(declare-fun c!89736 () Bool)

(assert (=> b!829567 (= c!89736 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829568 () Bool)

(declare-fun e!462448 () ListLongMap!8965)

(assert (=> b!829568 (= e!462448 e!462443)))

(assert (=> b!829568 (= c!89739 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829569 () Bool)

(declare-fun call!36146 () ListLongMap!8965)

(assert (=> b!829569 (= e!462447 call!36146)))

(declare-fun b!829570 () Bool)

(declare-fun e!462440 () Bool)

(assert (=> b!829570 (= e!462442 e!462440)))

(declare-fun res!565133 () Bool)

(assert (=> b!829570 (= res!565133 call!36143)))

(assert (=> b!829570 (=> (not res!565133) (not e!462440))))

(declare-fun e!462449 () Bool)

(declare-fun b!829571 () Bool)

(assert (=> b!829571 (= e!462449 (= (apply!370 lt!376162 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)) (get!11817 (select (arr!22302 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829571 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22723 _values!788)))))

(assert (=> b!829571 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(declare-fun bm!36140 () Bool)

(assert (=> bm!36140 (= call!36143 (contains!4181 lt!376162 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36141 () Bool)

(assert (=> bm!36141 (= call!36146 call!36142)))

(declare-fun bm!36142 () Bool)

(assert (=> bm!36142 (= call!36144 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829573 () Bool)

(declare-fun res!565130 () Bool)

(assert (=> b!829573 (=> (not res!565130) (not e!462445))))

(declare-fun e!462444 () Bool)

(assert (=> b!829573 (= res!565130 e!462444)))

(declare-fun c!89738 () Bool)

(assert (=> b!829573 (= c!89738 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!829574 () Bool)

(declare-fun call!36148 () Bool)

(assert (=> b!829574 (= e!462444 (not call!36148))))

(declare-fun bm!36143 () Bool)

(assert (=> bm!36143 (= call!36148 (contains!4181 lt!376162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829575 () Bool)

(declare-fun e!462446 () Bool)

(assert (=> b!829575 (= e!462446 (validKeyInArray!0 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829576 () Bool)

(assert (=> b!829576 (= e!462444 e!462441)))

(declare-fun res!565128 () Bool)

(assert (=> b!829576 (= res!565128 call!36148)))

(assert (=> b!829576 (=> (not res!565128) (not e!462441))))

(declare-fun b!829577 () Bool)

(declare-fun e!462439 () Unit!28371)

(declare-fun Unit!28375 () Unit!28371)

(assert (=> b!829577 (= e!462439 Unit!28375)))

(declare-fun bm!36144 () Bool)

(assert (=> bm!36144 (= call!36145 call!36147)))

(declare-fun b!829578 () Bool)

(declare-fun res!565129 () Bool)

(assert (=> b!829578 (=> (not res!565129) (not e!462445))))

(declare-fun e!462438 () Bool)

(assert (=> b!829578 (= res!565129 e!462438)))

(declare-fun res!565131 () Bool)

(assert (=> b!829578 (=> res!565131 e!462438)))

(assert (=> b!829578 (= res!565131 (not e!462446))))

(declare-fun res!565134 () Bool)

(assert (=> b!829578 (=> (not res!565134) (not e!462446))))

(assert (=> b!829578 (= res!565134 (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(declare-fun b!829579 () Bool)

(assert (=> b!829579 (= e!462443 call!36146)))

(declare-fun bm!36145 () Bool)

(assert (=> bm!36145 (= call!36147 call!36144)))

(declare-fun b!829580 () Bool)

(declare-fun lt!376179 () Unit!28371)

(assert (=> b!829580 (= e!462439 lt!376179)))

(declare-fun lt!376174 () ListLongMap!8965)

(assert (=> b!829580 (= lt!376174 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376169 () (_ BitVec 64))

(assert (=> b!829580 (= lt!376169 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376160 () (_ BitVec 64))

(assert (=> b!829580 (= lt!376160 (select (arr!22303 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376180 () Unit!28371)

(declare-fun addStillContains!321 (ListLongMap!8965 (_ BitVec 64) V!25259 (_ BitVec 64)) Unit!28371)

(assert (=> b!829580 (= lt!376180 (addStillContains!321 lt!376174 lt!376169 zeroValueBefore!34 lt!376160))))

(assert (=> b!829580 (contains!4181 (+!2007 lt!376174 (tuple2!10153 lt!376169 zeroValueBefore!34)) lt!376160)))

(declare-fun lt!376175 () Unit!28371)

(assert (=> b!829580 (= lt!376175 lt!376180)))

(declare-fun lt!376166 () ListLongMap!8965)

(assert (=> b!829580 (= lt!376166 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376177 () (_ BitVec 64))

(assert (=> b!829580 (= lt!376177 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376161 () (_ BitVec 64))

(assert (=> b!829580 (= lt!376161 (select (arr!22303 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376165 () Unit!28371)

(declare-fun addApplyDifferent!321 (ListLongMap!8965 (_ BitVec 64) V!25259 (_ BitVec 64)) Unit!28371)

(assert (=> b!829580 (= lt!376165 (addApplyDifferent!321 lt!376166 lt!376177 minValue!754 lt!376161))))

(assert (=> b!829580 (= (apply!370 (+!2007 lt!376166 (tuple2!10153 lt!376177 minValue!754)) lt!376161) (apply!370 lt!376166 lt!376161))))

(declare-fun lt!376167 () Unit!28371)

(assert (=> b!829580 (= lt!376167 lt!376165)))

(declare-fun lt!376178 () ListLongMap!8965)

(assert (=> b!829580 (= lt!376178 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376168 () (_ BitVec 64))

(assert (=> b!829580 (= lt!376168 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376163 () (_ BitVec 64))

(assert (=> b!829580 (= lt!376163 (select (arr!22303 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376172 () Unit!28371)

(assert (=> b!829580 (= lt!376172 (addApplyDifferent!321 lt!376178 lt!376168 zeroValueBefore!34 lt!376163))))

(assert (=> b!829580 (= (apply!370 (+!2007 lt!376178 (tuple2!10153 lt!376168 zeroValueBefore!34)) lt!376163) (apply!370 lt!376178 lt!376163))))

(declare-fun lt!376164 () Unit!28371)

(assert (=> b!829580 (= lt!376164 lt!376172)))

(declare-fun lt!376181 () ListLongMap!8965)

(assert (=> b!829580 (= lt!376181 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376171 () (_ BitVec 64))

(assert (=> b!829580 (= lt!376171 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376176 () (_ BitVec 64))

(assert (=> b!829580 (= lt!376176 (select (arr!22303 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829580 (= lt!376179 (addApplyDifferent!321 lt!376181 lt!376171 minValue!754 lt!376176))))

(assert (=> b!829580 (= (apply!370 (+!2007 lt!376181 (tuple2!10153 lt!376171 minValue!754)) lt!376176) (apply!370 lt!376181 lt!376176))))

(declare-fun b!829581 () Bool)

(assert (=> b!829581 (= e!462438 e!462449)))

(declare-fun res!565135 () Bool)

(assert (=> b!829581 (=> (not res!565135) (not e!462449))))

(assert (=> b!829581 (= res!565135 (contains!4181 lt!376162 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829581 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(declare-fun d!105099 () Bool)

(assert (=> d!105099 e!462445))

(declare-fun res!565132 () Bool)

(assert (=> d!105099 (=> (not res!565132) (not e!462445))))

(assert (=> d!105099 (= res!565132 (or (bvsge #b00000000000000000000000000000000 (size!22724 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))))

(declare-fun lt!376170 () ListLongMap!8965)

(assert (=> d!105099 (= lt!376162 lt!376170)))

(declare-fun lt!376173 () Unit!28371)

(assert (=> d!105099 (= lt!376173 e!462439)))

(declare-fun c!89741 () Bool)

(declare-fun e!462437 () Bool)

(assert (=> d!105099 (= c!89741 e!462437)))

(declare-fun res!565136 () Bool)

(assert (=> d!105099 (=> (not res!565136) (not e!462437))))

(assert (=> d!105099 (= res!565136 (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(assert (=> d!105099 (= lt!376170 e!462448)))

(assert (=> d!105099 (= c!89740 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105099 (validMask!0 mask!1312)))

(assert (=> d!105099 (= (getCurrentListMap!2550 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376162)))

(declare-fun b!829572 () Bool)

(assert (=> b!829572 (= e!462440 (= (apply!370 lt!376162 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829582 () Bool)

(assert (=> b!829582 (= e!462448 (+!2007 call!36142 (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!829583 () Bool)

(assert (=> b!829583 (= e!462437 (validKeyInArray!0 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829584 () Bool)

(assert (=> b!829584 (= e!462447 call!36145)))

(assert (= (and d!105099 c!89740) b!829582))

(assert (= (and d!105099 (not c!89740)) b!829568))

(assert (= (and b!829568 c!89739) b!829579))

(assert (= (and b!829568 (not c!89739)) b!829566))

(assert (= (and b!829566 c!89737) b!829569))

(assert (= (and b!829566 (not c!89737)) b!829584))

(assert (= (or b!829569 b!829584) bm!36144))

(assert (= (or b!829579 bm!36144) bm!36145))

(assert (= (or b!829579 b!829569) bm!36141))

(assert (= (or b!829582 bm!36145) bm!36142))

(assert (= (or b!829582 bm!36141) bm!36139))

(assert (= (and d!105099 res!565136) b!829583))

(assert (= (and d!105099 c!89741) b!829580))

(assert (= (and d!105099 (not c!89741)) b!829577))

(assert (= (and d!105099 res!565132) b!829578))

(assert (= (and b!829578 res!565134) b!829575))

(assert (= (and b!829578 (not res!565131)) b!829581))

(assert (= (and b!829581 res!565135) b!829571))

(assert (= (and b!829578 res!565129) b!829573))

(assert (= (and b!829573 c!89738) b!829576))

(assert (= (and b!829573 (not c!89738)) b!829574))

(assert (= (and b!829576 res!565128) b!829564))

(assert (= (or b!829576 b!829574) bm!36143))

(assert (= (and b!829573 res!565130) b!829567))

(assert (= (and b!829567 c!89736) b!829570))

(assert (= (and b!829567 (not c!89736)) b!829565))

(assert (= (and b!829570 res!565133) b!829572))

(assert (= (or b!829570 b!829565) bm!36140))

(declare-fun b_lambda!11289 () Bool)

(assert (=> (not b_lambda!11289) (not b!829571)))

(assert (=> b!829571 t!22293))

(declare-fun b_and!22477 () Bool)

(assert (= b_and!22475 (and (=> t!22293 result!7995) b_and!22477)))

(assert (=> d!105099 m!771935))

(assert (=> b!829583 m!772003))

(assert (=> b!829583 m!772003))

(assert (=> b!829583 m!772013))

(declare-fun m!772057 () Bool)

(assert (=> b!829564 m!772057))

(assert (=> b!829575 m!772003))

(assert (=> b!829575 m!772003))

(assert (=> b!829575 m!772013))

(assert (=> bm!36142 m!771933))

(assert (=> b!829581 m!772003))

(assert (=> b!829581 m!772003))

(declare-fun m!772059 () Bool)

(assert (=> b!829581 m!772059))

(declare-fun m!772061 () Bool)

(assert (=> b!829582 m!772061))

(declare-fun m!772063 () Bool)

(assert (=> bm!36143 m!772063))

(declare-fun m!772065 () Bool)

(assert (=> b!829580 m!772065))

(declare-fun m!772067 () Bool)

(assert (=> b!829580 m!772067))

(assert (=> b!829580 m!771933))

(declare-fun m!772069 () Bool)

(assert (=> b!829580 m!772069))

(declare-fun m!772071 () Bool)

(assert (=> b!829580 m!772071))

(declare-fun m!772073 () Bool)

(assert (=> b!829580 m!772073))

(declare-fun m!772075 () Bool)

(assert (=> b!829580 m!772075))

(assert (=> b!829580 m!772073))

(declare-fun m!772077 () Bool)

(assert (=> b!829580 m!772077))

(assert (=> b!829580 m!772071))

(declare-fun m!772079 () Bool)

(assert (=> b!829580 m!772079))

(declare-fun m!772081 () Bool)

(assert (=> b!829580 m!772081))

(declare-fun m!772083 () Bool)

(assert (=> b!829580 m!772083))

(declare-fun m!772085 () Bool)

(assert (=> b!829580 m!772085))

(declare-fun m!772087 () Bool)

(assert (=> b!829580 m!772087))

(assert (=> b!829580 m!772085))

(declare-fun m!772089 () Bool)

(assert (=> b!829580 m!772089))

(assert (=> b!829580 m!772065))

(assert (=> b!829580 m!772003))

(declare-fun m!772091 () Bool)

(assert (=> b!829580 m!772091))

(declare-fun m!772093 () Bool)

(assert (=> b!829580 m!772093))

(declare-fun m!772095 () Bool)

(assert (=> bm!36139 m!772095))

(assert (=> b!829571 m!772005))

(assert (=> b!829571 m!772001))

(assert (=> b!829571 m!772007))

(assert (=> b!829571 m!772003))

(declare-fun m!772097 () Bool)

(assert (=> b!829571 m!772097))

(assert (=> b!829571 m!772005))

(assert (=> b!829571 m!772001))

(assert (=> b!829571 m!772003))

(declare-fun m!772099 () Bool)

(assert (=> bm!36140 m!772099))

(declare-fun m!772101 () Bool)

(assert (=> b!829572 m!772101))

(assert (=> b!829408 d!105099))

(declare-fun d!105101 () Bool)

(declare-fun e!462452 () Bool)

(assert (=> d!105101 e!462452))

(declare-fun res!565142 () Bool)

(assert (=> d!105101 (=> (not res!565142) (not e!462452))))

(declare-fun lt!376193 () ListLongMap!8965)

(assert (=> d!105101 (= res!565142 (contains!4181 lt!376193 (_1!5087 (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376191 () List!15937)

(assert (=> d!105101 (= lt!376193 (ListLongMap!8966 lt!376191))))

(declare-fun lt!376190 () Unit!28371)

(declare-fun lt!376192 () Unit!28371)

(assert (=> d!105101 (= lt!376190 lt!376192)))

(declare-datatypes ((Option!417 0))(
  ( (Some!416 (v!10081 V!25259)) (None!415) )
))
(declare-fun getValueByKey!411 (List!15937 (_ BitVec 64)) Option!417)

(assert (=> d!105101 (= (getValueByKey!411 lt!376191 (_1!5087 (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!416 (_2!5087 (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lemmaContainsTupThenGetReturnValue!228 (List!15937 (_ BitVec 64) V!25259) Unit!28371)

(assert (=> d!105101 (= lt!376192 (lemmaContainsTupThenGetReturnValue!228 lt!376191 (_1!5087 (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5087 (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun insertStrictlySorted!267 (List!15937 (_ BitVec 64) V!25259) List!15937)

(assert (=> d!105101 (= lt!376191 (insertStrictlySorted!267 (toList!4498 (+!2007 lt!376048 (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (_1!5087 (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5087 (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105101 (= (+!2007 (+!2007 lt!376048 (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376193)))

(declare-fun b!829589 () Bool)

(declare-fun res!565141 () Bool)

(assert (=> b!829589 (=> (not res!565141) (not e!462452))))

(assert (=> b!829589 (= res!565141 (= (getValueByKey!411 (toList!4498 lt!376193) (_1!5087 (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!416 (_2!5087 (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!829590 () Bool)

(declare-fun contains!4182 (List!15937 tuple2!10152) Bool)

(assert (=> b!829590 (= e!462452 (contains!4182 (toList!4498 lt!376193) (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105101 res!565142) b!829589))

(assert (= (and b!829589 res!565141) b!829590))

(declare-fun m!772103 () Bool)

(assert (=> d!105101 m!772103))

(declare-fun m!772105 () Bool)

(assert (=> d!105101 m!772105))

(declare-fun m!772107 () Bool)

(assert (=> d!105101 m!772107))

(declare-fun m!772109 () Bool)

(assert (=> d!105101 m!772109))

(declare-fun m!772111 () Bool)

(assert (=> b!829589 m!772111))

(declare-fun m!772113 () Bool)

(assert (=> b!829590 m!772113))

(assert (=> b!829408 d!105101))

(declare-fun d!105103 () Bool)

(declare-fun e!462453 () Bool)

(assert (=> d!105103 e!462453))

(declare-fun res!565144 () Bool)

(assert (=> d!105103 (=> (not res!565144) (not e!462453))))

(declare-fun lt!376197 () ListLongMap!8965)

(assert (=> d!105103 (= res!565144 (contains!4181 lt!376197 (_1!5087 (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lt!376195 () List!15937)

(assert (=> d!105103 (= lt!376197 (ListLongMap!8966 lt!376195))))

(declare-fun lt!376194 () Unit!28371)

(declare-fun lt!376196 () Unit!28371)

(assert (=> d!105103 (= lt!376194 lt!376196)))

(assert (=> d!105103 (= (getValueByKey!411 lt!376195 (_1!5087 (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!416 (_2!5087 (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105103 (= lt!376196 (lemmaContainsTupThenGetReturnValue!228 lt!376195 (_1!5087 (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5087 (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105103 (= lt!376195 (insertStrictlySorted!267 (toList!4498 lt!376048) (_1!5087 (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5087 (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105103 (= (+!2007 lt!376048 (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) lt!376197)))

(declare-fun b!829591 () Bool)

(declare-fun res!565143 () Bool)

(assert (=> b!829591 (=> (not res!565143) (not e!462453))))

(assert (=> b!829591 (= res!565143 (= (getValueByKey!411 (toList!4498 lt!376197) (_1!5087 (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!416 (_2!5087 (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))))

(declare-fun b!829592 () Bool)

(assert (=> b!829592 (= e!462453 (contains!4182 (toList!4498 lt!376197) (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))

(assert (= (and d!105103 res!565144) b!829591))

(assert (= (and b!829591 res!565143) b!829592))

(declare-fun m!772115 () Bool)

(assert (=> d!105103 m!772115))

(declare-fun m!772117 () Bool)

(assert (=> d!105103 m!772117))

(declare-fun m!772119 () Bool)

(assert (=> d!105103 m!772119))

(declare-fun m!772121 () Bool)

(assert (=> d!105103 m!772121))

(declare-fun m!772123 () Bool)

(assert (=> b!829591 m!772123))

(declare-fun m!772125 () Bool)

(assert (=> b!829592 m!772125))

(assert (=> b!829408 d!105103))

(declare-fun b!829593 () Bool)

(declare-fun e!462458 () Bool)

(declare-fun lt!376200 () ListLongMap!8965)

(assert (=> b!829593 (= e!462458 (= (apply!370 lt!376200 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!829594 () Bool)

(declare-fun e!462459 () Bool)

(declare-fun call!36150 () Bool)

(assert (=> b!829594 (= e!462459 (not call!36150))))

(declare-fun b!829595 () Bool)

(declare-fun c!89743 () Bool)

(assert (=> b!829595 (= c!89743 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!462460 () ListLongMap!8965)

(declare-fun e!462464 () ListLongMap!8965)

(assert (=> b!829595 (= e!462460 e!462464)))

(declare-fun call!36152 () ListLongMap!8965)

(declare-fun c!89746 () Bool)

(declare-fun call!36154 () ListLongMap!8965)

(declare-fun call!36151 () ListLongMap!8965)

(declare-fun call!36149 () ListLongMap!8965)

(declare-fun c!89745 () Bool)

(declare-fun bm!36146 () Bool)

(assert (=> bm!36146 (= call!36149 (+!2007 (ite c!89746 call!36151 (ite c!89745 call!36154 call!36152)) (ite (or c!89746 c!89745) (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829596 () Bool)

(declare-fun e!462462 () Bool)

(assert (=> b!829596 (= e!462462 e!462459)))

(declare-fun c!89742 () Bool)

(assert (=> b!829596 (= c!89742 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829597 () Bool)

(declare-fun e!462465 () ListLongMap!8965)

(assert (=> b!829597 (= e!462465 e!462460)))

(assert (=> b!829597 (= c!89745 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829598 () Bool)

(declare-fun call!36153 () ListLongMap!8965)

(assert (=> b!829598 (= e!462464 call!36153)))

(declare-fun b!829599 () Bool)

(declare-fun e!462457 () Bool)

(assert (=> b!829599 (= e!462459 e!462457)))

(declare-fun res!565150 () Bool)

(assert (=> b!829599 (= res!565150 call!36150)))

(assert (=> b!829599 (=> (not res!565150) (not e!462457))))

(declare-fun b!829600 () Bool)

(declare-fun e!462466 () Bool)

(assert (=> b!829600 (= e!462466 (= (apply!370 lt!376200 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)) (get!11817 (select (arr!22302 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829600 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22723 _values!788)))))

(assert (=> b!829600 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(declare-fun bm!36147 () Bool)

(assert (=> bm!36147 (= call!36150 (contains!4181 lt!376200 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36148 () Bool)

(assert (=> bm!36148 (= call!36153 call!36149)))

(declare-fun bm!36149 () Bool)

(assert (=> bm!36149 (= call!36151 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829602 () Bool)

(declare-fun res!565147 () Bool)

(assert (=> b!829602 (=> (not res!565147) (not e!462462))))

(declare-fun e!462461 () Bool)

(assert (=> b!829602 (= res!565147 e!462461)))

(declare-fun c!89744 () Bool)

(assert (=> b!829602 (= c!89744 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!829603 () Bool)

(declare-fun call!36155 () Bool)

(assert (=> b!829603 (= e!462461 (not call!36155))))

(declare-fun bm!36150 () Bool)

(assert (=> bm!36150 (= call!36155 (contains!4181 lt!376200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829604 () Bool)

(declare-fun e!462463 () Bool)

(assert (=> b!829604 (= e!462463 (validKeyInArray!0 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829605 () Bool)

(assert (=> b!829605 (= e!462461 e!462458)))

(declare-fun res!565145 () Bool)

(assert (=> b!829605 (= res!565145 call!36155)))

(assert (=> b!829605 (=> (not res!565145) (not e!462458))))

(declare-fun b!829606 () Bool)

(declare-fun e!462456 () Unit!28371)

(declare-fun Unit!28376 () Unit!28371)

(assert (=> b!829606 (= e!462456 Unit!28376)))

(declare-fun bm!36151 () Bool)

(assert (=> bm!36151 (= call!36152 call!36154)))

(declare-fun b!829607 () Bool)

(declare-fun res!565146 () Bool)

(assert (=> b!829607 (=> (not res!565146) (not e!462462))))

(declare-fun e!462455 () Bool)

(assert (=> b!829607 (= res!565146 e!462455)))

(declare-fun res!565148 () Bool)

(assert (=> b!829607 (=> res!565148 e!462455)))

(assert (=> b!829607 (= res!565148 (not e!462463))))

(declare-fun res!565151 () Bool)

(assert (=> b!829607 (=> (not res!565151) (not e!462463))))

(assert (=> b!829607 (= res!565151 (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(declare-fun b!829608 () Bool)

(assert (=> b!829608 (= e!462460 call!36153)))

(declare-fun bm!36152 () Bool)

(assert (=> bm!36152 (= call!36154 call!36151)))

(declare-fun b!829609 () Bool)

(declare-fun lt!376217 () Unit!28371)

(assert (=> b!829609 (= e!462456 lt!376217)))

(declare-fun lt!376212 () ListLongMap!8965)

(assert (=> b!829609 (= lt!376212 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376207 () (_ BitVec 64))

(assert (=> b!829609 (= lt!376207 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376198 () (_ BitVec 64))

(assert (=> b!829609 (= lt!376198 (select (arr!22303 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376218 () Unit!28371)

(assert (=> b!829609 (= lt!376218 (addStillContains!321 lt!376212 lt!376207 zeroValueAfter!34 lt!376198))))

(assert (=> b!829609 (contains!4181 (+!2007 lt!376212 (tuple2!10153 lt!376207 zeroValueAfter!34)) lt!376198)))

(declare-fun lt!376213 () Unit!28371)

(assert (=> b!829609 (= lt!376213 lt!376218)))

(declare-fun lt!376204 () ListLongMap!8965)

(assert (=> b!829609 (= lt!376204 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376215 () (_ BitVec 64))

(assert (=> b!829609 (= lt!376215 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376199 () (_ BitVec 64))

(assert (=> b!829609 (= lt!376199 (select (arr!22303 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376203 () Unit!28371)

(assert (=> b!829609 (= lt!376203 (addApplyDifferent!321 lt!376204 lt!376215 minValue!754 lt!376199))))

(assert (=> b!829609 (= (apply!370 (+!2007 lt!376204 (tuple2!10153 lt!376215 minValue!754)) lt!376199) (apply!370 lt!376204 lt!376199))))

(declare-fun lt!376205 () Unit!28371)

(assert (=> b!829609 (= lt!376205 lt!376203)))

(declare-fun lt!376216 () ListLongMap!8965)

(assert (=> b!829609 (= lt!376216 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376206 () (_ BitVec 64))

(assert (=> b!829609 (= lt!376206 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376201 () (_ BitVec 64))

(assert (=> b!829609 (= lt!376201 (select (arr!22303 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376210 () Unit!28371)

(assert (=> b!829609 (= lt!376210 (addApplyDifferent!321 lt!376216 lt!376206 zeroValueAfter!34 lt!376201))))

(assert (=> b!829609 (= (apply!370 (+!2007 lt!376216 (tuple2!10153 lt!376206 zeroValueAfter!34)) lt!376201) (apply!370 lt!376216 lt!376201))))

(declare-fun lt!376202 () Unit!28371)

(assert (=> b!829609 (= lt!376202 lt!376210)))

(declare-fun lt!376219 () ListLongMap!8965)

(assert (=> b!829609 (= lt!376219 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376209 () (_ BitVec 64))

(assert (=> b!829609 (= lt!376209 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376214 () (_ BitVec 64))

(assert (=> b!829609 (= lt!376214 (select (arr!22303 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829609 (= lt!376217 (addApplyDifferent!321 lt!376219 lt!376209 minValue!754 lt!376214))))

(assert (=> b!829609 (= (apply!370 (+!2007 lt!376219 (tuple2!10153 lt!376209 minValue!754)) lt!376214) (apply!370 lt!376219 lt!376214))))

(declare-fun b!829610 () Bool)

(assert (=> b!829610 (= e!462455 e!462466)))

(declare-fun res!565152 () Bool)

(assert (=> b!829610 (=> (not res!565152) (not e!462466))))

(assert (=> b!829610 (= res!565152 (contains!4181 lt!376200 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829610 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(declare-fun d!105105 () Bool)

(assert (=> d!105105 e!462462))

(declare-fun res!565149 () Bool)

(assert (=> d!105105 (=> (not res!565149) (not e!462462))))

(assert (=> d!105105 (= res!565149 (or (bvsge #b00000000000000000000000000000000 (size!22724 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))))

(declare-fun lt!376208 () ListLongMap!8965)

(assert (=> d!105105 (= lt!376200 lt!376208)))

(declare-fun lt!376211 () Unit!28371)

(assert (=> d!105105 (= lt!376211 e!462456)))

(declare-fun c!89747 () Bool)

(declare-fun e!462454 () Bool)

(assert (=> d!105105 (= c!89747 e!462454)))

(declare-fun res!565153 () Bool)

(assert (=> d!105105 (=> (not res!565153) (not e!462454))))

(assert (=> d!105105 (= res!565153 (bvslt #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(assert (=> d!105105 (= lt!376208 e!462465)))

(assert (=> d!105105 (= c!89746 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105105 (validMask!0 mask!1312)))

(assert (=> d!105105 (= (getCurrentListMap!2550 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376200)))

(declare-fun b!829601 () Bool)

(assert (=> b!829601 (= e!462457 (= (apply!370 lt!376200 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829611 () Bool)

(assert (=> b!829611 (= e!462465 (+!2007 call!36149 (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!829612 () Bool)

(assert (=> b!829612 (= e!462454 (validKeyInArray!0 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829613 () Bool)

(assert (=> b!829613 (= e!462464 call!36152)))

(assert (= (and d!105105 c!89746) b!829611))

(assert (= (and d!105105 (not c!89746)) b!829597))

(assert (= (and b!829597 c!89745) b!829608))

(assert (= (and b!829597 (not c!89745)) b!829595))

(assert (= (and b!829595 c!89743) b!829598))

(assert (= (and b!829595 (not c!89743)) b!829613))

(assert (= (or b!829598 b!829613) bm!36151))

(assert (= (or b!829608 bm!36151) bm!36152))

(assert (= (or b!829608 b!829598) bm!36148))

(assert (= (or b!829611 bm!36152) bm!36149))

(assert (= (or b!829611 bm!36148) bm!36146))

(assert (= (and d!105105 res!565153) b!829612))

(assert (= (and d!105105 c!89747) b!829609))

(assert (= (and d!105105 (not c!89747)) b!829606))

(assert (= (and d!105105 res!565149) b!829607))

(assert (= (and b!829607 res!565151) b!829604))

(assert (= (and b!829607 (not res!565148)) b!829610))

(assert (= (and b!829610 res!565152) b!829600))

(assert (= (and b!829607 res!565146) b!829602))

(assert (= (and b!829602 c!89744) b!829605))

(assert (= (and b!829602 (not c!89744)) b!829603))

(assert (= (and b!829605 res!565145) b!829593))

(assert (= (or b!829605 b!829603) bm!36150))

(assert (= (and b!829602 res!565147) b!829596))

(assert (= (and b!829596 c!89742) b!829599))

(assert (= (and b!829596 (not c!89742)) b!829594))

(assert (= (and b!829599 res!565150) b!829601))

(assert (= (or b!829599 b!829594) bm!36147))

(declare-fun b_lambda!11291 () Bool)

(assert (=> (not b_lambda!11291) (not b!829600)))

(assert (=> b!829600 t!22293))

(declare-fun b_and!22479 () Bool)

(assert (= b_and!22477 (and (=> t!22293 result!7995) b_and!22479)))

(assert (=> d!105105 m!771935))

(assert (=> b!829612 m!772003))

(assert (=> b!829612 m!772003))

(assert (=> b!829612 m!772013))

(declare-fun m!772127 () Bool)

(assert (=> b!829593 m!772127))

(assert (=> b!829604 m!772003))

(assert (=> b!829604 m!772003))

(assert (=> b!829604 m!772013))

(assert (=> bm!36149 m!771931))

(assert (=> b!829610 m!772003))

(assert (=> b!829610 m!772003))

(declare-fun m!772129 () Bool)

(assert (=> b!829610 m!772129))

(declare-fun m!772131 () Bool)

(assert (=> b!829611 m!772131))

(declare-fun m!772133 () Bool)

(assert (=> bm!36150 m!772133))

(declare-fun m!772135 () Bool)

(assert (=> b!829609 m!772135))

(declare-fun m!772137 () Bool)

(assert (=> b!829609 m!772137))

(assert (=> b!829609 m!771931))

(declare-fun m!772139 () Bool)

(assert (=> b!829609 m!772139))

(declare-fun m!772141 () Bool)

(assert (=> b!829609 m!772141))

(declare-fun m!772143 () Bool)

(assert (=> b!829609 m!772143))

(declare-fun m!772145 () Bool)

(assert (=> b!829609 m!772145))

(assert (=> b!829609 m!772143))

(declare-fun m!772147 () Bool)

(assert (=> b!829609 m!772147))

(assert (=> b!829609 m!772141))

(declare-fun m!772149 () Bool)

(assert (=> b!829609 m!772149))

(declare-fun m!772151 () Bool)

(assert (=> b!829609 m!772151))

(declare-fun m!772153 () Bool)

(assert (=> b!829609 m!772153))

(declare-fun m!772155 () Bool)

(assert (=> b!829609 m!772155))

(declare-fun m!772157 () Bool)

(assert (=> b!829609 m!772157))

(assert (=> b!829609 m!772155))

(declare-fun m!772159 () Bool)

(assert (=> b!829609 m!772159))

(assert (=> b!829609 m!772135))

(assert (=> b!829609 m!772003))

(declare-fun m!772161 () Bool)

(assert (=> b!829609 m!772161))

(declare-fun m!772163 () Bool)

(assert (=> b!829609 m!772163))

(declare-fun m!772165 () Bool)

(assert (=> bm!36146 m!772165))

(assert (=> b!829600 m!772005))

(assert (=> b!829600 m!772001))

(assert (=> b!829600 m!772007))

(assert (=> b!829600 m!772003))

(declare-fun m!772167 () Bool)

(assert (=> b!829600 m!772167))

(assert (=> b!829600 m!772005))

(assert (=> b!829600 m!772001))

(assert (=> b!829600 m!772003))

(declare-fun m!772169 () Bool)

(assert (=> bm!36147 m!772169))

(declare-fun m!772171 () Bool)

(assert (=> b!829601 m!772171))

(assert (=> b!829408 d!105105))

(declare-fun bm!36155 () Bool)

(declare-fun call!36158 () Bool)

(declare-fun c!89750 () Bool)

(assert (=> bm!36155 (= call!36158 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89750 (Cons!15932 (select (arr!22303 _keys!976) #b00000000000000000000000000000000) Nil!15933) Nil!15933)))))

(declare-fun b!829624 () Bool)

(declare-fun e!462475 () Bool)

(declare-fun contains!4183 (List!15936 (_ BitVec 64)) Bool)

(assert (=> b!829624 (= e!462475 (contains!4183 Nil!15933 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829625 () Bool)

(declare-fun e!462477 () Bool)

(assert (=> b!829625 (= e!462477 call!36158)))

(declare-fun b!829626 () Bool)

(declare-fun e!462476 () Bool)

(declare-fun e!462478 () Bool)

(assert (=> b!829626 (= e!462476 e!462478)))

(declare-fun res!565160 () Bool)

(assert (=> b!829626 (=> (not res!565160) (not e!462478))))

(assert (=> b!829626 (= res!565160 (not e!462475))))

(declare-fun res!565161 () Bool)

(assert (=> b!829626 (=> (not res!565161) (not e!462475))))

(assert (=> b!829626 (= res!565161 (validKeyInArray!0 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829627 () Bool)

(assert (=> b!829627 (= e!462478 e!462477)))

(assert (=> b!829627 (= c!89750 (validKeyInArray!0 (select (arr!22303 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829628 () Bool)

(assert (=> b!829628 (= e!462477 call!36158)))

(declare-fun d!105107 () Bool)

(declare-fun res!565162 () Bool)

(assert (=> d!105107 (=> res!565162 e!462476)))

(assert (=> d!105107 (= res!565162 (bvsge #b00000000000000000000000000000000 (size!22724 _keys!976)))))

(assert (=> d!105107 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15933) e!462476)))

(assert (= (and d!105107 (not res!565162)) b!829626))

(assert (= (and b!829626 res!565161) b!829624))

(assert (= (and b!829626 res!565160) b!829627))

(assert (= (and b!829627 c!89750) b!829625))

(assert (= (and b!829627 (not c!89750)) b!829628))

(assert (= (or b!829625 b!829628) bm!36155))

(assert (=> bm!36155 m!772003))

(declare-fun m!772173 () Bool)

(assert (=> bm!36155 m!772173))

(assert (=> b!829624 m!772003))

(assert (=> b!829624 m!772003))

(declare-fun m!772175 () Bool)

(assert (=> b!829624 m!772175))

(assert (=> b!829626 m!772003))

(assert (=> b!829626 m!772003))

(assert (=> b!829626 m!772013))

(assert (=> b!829627 m!772003))

(assert (=> b!829627 m!772003))

(assert (=> b!829627 m!772013))

(assert (=> b!829404 d!105107))

(declare-fun mapIsEmpty!24445 () Bool)

(declare-fun mapRes!24445 () Bool)

(assert (=> mapIsEmpty!24445 mapRes!24445))

(declare-fun condMapEmpty!24445 () Bool)

(declare-fun mapDefault!24445 () ValueCell!7181)

(assert (=> mapNonEmpty!24436 (= condMapEmpty!24445 (= mapRest!24436 ((as const (Array (_ BitVec 32) ValueCell!7181)) mapDefault!24445)))))

(declare-fun e!462483 () Bool)

(assert (=> mapNonEmpty!24436 (= tp!47230 (and e!462483 mapRes!24445))))

(declare-fun b!829635 () Bool)

(declare-fun e!462484 () Bool)

(assert (=> b!829635 (= e!462484 tp_is_empty!15193)))

(declare-fun b!829636 () Bool)

(assert (=> b!829636 (= e!462483 tp_is_empty!15193)))

(declare-fun mapNonEmpty!24445 () Bool)

(declare-fun tp!47245 () Bool)

(assert (=> mapNonEmpty!24445 (= mapRes!24445 (and tp!47245 e!462484))))

(declare-fun mapRest!24445 () (Array (_ BitVec 32) ValueCell!7181))

(declare-fun mapValue!24445 () ValueCell!7181)

(declare-fun mapKey!24445 () (_ BitVec 32))

(assert (=> mapNonEmpty!24445 (= mapRest!24436 (store mapRest!24445 mapKey!24445 mapValue!24445))))

(assert (= (and mapNonEmpty!24436 condMapEmpty!24445) mapIsEmpty!24445))

(assert (= (and mapNonEmpty!24436 (not condMapEmpty!24445)) mapNonEmpty!24445))

(assert (= (and mapNonEmpty!24445 ((_ is ValueCellFull!7181) mapValue!24445)) b!829635))

(assert (= (and mapNonEmpty!24436 ((_ is ValueCellFull!7181) mapDefault!24445)) b!829636))

(declare-fun m!772177 () Bool)

(assert (=> mapNonEmpty!24445 m!772177))

(declare-fun b_lambda!11293 () Bool)

(assert (= b_lambda!11285 (or (and start!71418 b_free!13483) b_lambda!11293)))

(declare-fun b_lambda!11295 () Bool)

(assert (= b_lambda!11281 (or (and start!71418 b_free!13483) b_lambda!11295)))

(declare-fun b_lambda!11297 () Bool)

(assert (= b_lambda!11287 (or (and start!71418 b_free!13483) b_lambda!11297)))

(declare-fun b_lambda!11299 () Bool)

(assert (= b_lambda!11283 (or (and start!71418 b_free!13483) b_lambda!11299)))

(declare-fun b_lambda!11301 () Bool)

(assert (= b_lambda!11291 (or (and start!71418 b_free!13483) b_lambda!11301)))

(declare-fun b_lambda!11303 () Bool)

(assert (= b_lambda!11289 (or (and start!71418 b_free!13483) b_lambda!11303)))

(check-sat (not bm!36120) (not b!829612) (not bm!36146) (not b!829489) (not b_lambda!11297) (not b!829488) (not d!105085) (not d!105099) (not b!829492) (not bm!36147) (not bm!36143) (not b!829508) (not bm!36150) (not b!829494) (not b!829582) (not b!829610) (not b!829507) (not b!829493) (not b!829506) (not b!829504) (not b!829572) (not b!829580) (not bm!36149) (not b!829589) (not b!829575) (not b!829624) (not b!829609) (not b!829626) (not bm!36140) (not b!829500) (not d!105105) (not b!829498) (not b!829484) (not b!829591) (not b!829564) (not b!829518) (not b!829581) (not b_lambda!11293) (not bm!36142) (not mapNonEmpty!24445) (not b!829611) (not b!829486) (not b!829601) (not bm!36124) (not b!829519) (not bm!36139) (not b!829583) (not b!829503) (not b!829593) (not b_lambda!11299) (not b!829592) (not b_lambda!11301) (not bm!36155) (not d!105087) (not d!105101) b_and!22479 (not b!829627) (not b!829571) (not b_next!13483) (not d!105103) (not b!829600) (not b!829604) (not b_lambda!11303) tp_is_empty!15193 (not d!105089) (not b!829502) (not b!829490) (not bm!36121) (not b_lambda!11295) (not b!829590))
(check-sat b_and!22479 (not b_next!13483))
