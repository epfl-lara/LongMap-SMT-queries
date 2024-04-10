; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71488 () Bool)

(assert start!71488)

(declare-fun b_free!13497 () Bool)

(declare-fun b_next!13497 () Bool)

(assert (=> start!71488 (= b_free!13497 (not b_next!13497))))

(declare-fun tp!47277 () Bool)

(declare-fun b_and!22527 () Bool)

(assert (=> start!71488 (= tp!47277 b_and!22527)))

(declare-fun res!565442 () Bool)

(declare-fun e!462856 () Bool)

(assert (=> start!71488 (=> (not res!565442) (not e!462856))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71488 (= res!565442 (validMask!0 mask!1312))))

(assert (=> start!71488 e!462856))

(declare-fun tp_is_empty!15207 () Bool)

(assert (=> start!71488 tp_is_empty!15207))

(declare-datatypes ((array!46584 0))(
  ( (array!46585 (arr!22328 (Array (_ BitVec 32) (_ BitVec 64))) (size!22749 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46584)

(declare-fun array_inv!17783 (array!46584) Bool)

(assert (=> start!71488 (array_inv!17783 _keys!976)))

(assert (=> start!71488 true))

(declare-datatypes ((V!25277 0))(
  ( (V!25278 (val!7651 Int)) )
))
(declare-datatypes ((ValueCell!7188 0))(
  ( (ValueCellFull!7188 (v!10093 V!25277)) (EmptyCell!7188) )
))
(declare-datatypes ((array!46586 0))(
  ( (array!46587 (arr!22329 (Array (_ BitVec 32) ValueCell!7188)) (size!22750 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46586)

(declare-fun e!462861 () Bool)

(declare-fun array_inv!17784 (array!46586) Bool)

(assert (=> start!71488 (and (array_inv!17784 _values!788) e!462861)))

(assert (=> start!71488 tp!47277))

(declare-fun b!830199 () Bool)

(declare-fun e!462859 () Bool)

(assert (=> b!830199 (= e!462859 tp_is_empty!15207)))

(declare-fun b!830200 () Bool)

(declare-fun res!565446 () Bool)

(assert (=> b!830200 (=> (not res!565446) (not e!462856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46584 (_ BitVec 32)) Bool)

(assert (=> b!830200 (= res!565446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!830201 () Bool)

(declare-fun e!462858 () Bool)

(assert (=> b!830201 (= e!462858 tp_is_empty!15207)))

(declare-fun b!830202 () Bool)

(declare-fun res!565441 () Bool)

(assert (=> b!830202 (=> (not res!565441) (not e!462856))))

(declare-datatypes ((List!15944 0))(
  ( (Nil!15941) (Cons!15940 (h!17069 (_ BitVec 64)) (t!22309 List!15944)) )
))
(declare-fun arrayNoDuplicates!0 (array!46584 (_ BitVec 32) List!15944) Bool)

(assert (=> b!830202 (= res!565441 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15941))))

(declare-fun mapNonEmpty!24463 () Bool)

(declare-fun mapRes!24463 () Bool)

(declare-fun tp!47278 () Bool)

(assert (=> mapNonEmpty!24463 (= mapRes!24463 (and tp!47278 e!462858))))

(declare-fun mapValue!24463 () ValueCell!7188)

(declare-fun mapRest!24463 () (Array (_ BitVec 32) ValueCell!7188))

(declare-fun mapKey!24463 () (_ BitVec 32))

(assert (=> mapNonEmpty!24463 (= (arr!22329 _values!788) (store mapRest!24463 mapKey!24463 mapValue!24463))))

(declare-fun b!830203 () Bool)

(assert (=> b!830203 (= e!462861 (and e!462859 mapRes!24463))))

(declare-fun condMapEmpty!24463 () Bool)

(declare-fun mapDefault!24463 () ValueCell!7188)

(assert (=> b!830203 (= condMapEmpty!24463 (= (arr!22329 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7188)) mapDefault!24463)))))

(declare-datatypes ((tuple2!10150 0))(
  ( (tuple2!10151 (_1!5086 (_ BitVec 64)) (_2!5086 V!25277)) )
))
(declare-fun lt!376677 () tuple2!10150)

(declare-datatypes ((List!15945 0))(
  ( (Nil!15942) (Cons!15941 (h!17070 tuple2!10150) (t!22310 List!15945)) )
))
(declare-datatypes ((ListLongMap!8973 0))(
  ( (ListLongMap!8974 (toList!4502 List!15945)) )
))
(declare-fun lt!376678 () ListLongMap!8973)

(declare-fun lt!376679 () tuple2!10150)

(declare-fun b!830204 () Bool)

(declare-fun lt!376683 () ListLongMap!8973)

(declare-fun e!462855 () Bool)

(declare-fun +!1980 (ListLongMap!8973 tuple2!10150) ListLongMap!8973)

(assert (=> b!830204 (= e!462855 (= lt!376678 (+!1980 (+!1980 lt!376683 lt!376677) lt!376679)))))

(declare-fun e!462857 () Bool)

(assert (=> b!830204 e!462857))

(declare-fun res!565444 () Bool)

(assert (=> b!830204 (=> (not res!565444) (not e!462857))))

(assert (=> b!830204 (= res!565444 (= lt!376678 (+!1980 (+!1980 lt!376683 lt!376679) lt!376677)))))

(declare-fun minValue!754 () V!25277)

(assert (=> b!830204 (= lt!376677 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun zeroValueBefore!34 () V!25277)

(assert (=> b!830204 (= lt!376679 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun zeroValueAfter!34 () V!25277)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lt!376682 () ListLongMap!8973)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2598 (array!46584 array!46586 (_ BitVec 32) (_ BitVec 32) V!25277 V!25277 (_ BitVec 32) Int) ListLongMap!8973)

(assert (=> b!830204 (= lt!376682 (getCurrentListMap!2598 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!830204 (= lt!376678 (getCurrentListMap!2598 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830205 () Bool)

(declare-fun res!565443 () Bool)

(assert (=> b!830205 (=> (not res!565443) (not e!462856))))

(assert (=> b!830205 (= res!565443 (and (= (size!22750 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22749 _keys!976) (size!22750 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!830206 () Bool)

(assert (=> b!830206 (= e!462856 (not e!462855))))

(declare-fun res!565445 () Bool)

(assert (=> b!830206 (=> res!565445 e!462855)))

(assert (=> b!830206 (= res!565445 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!376681 () ListLongMap!8973)

(assert (=> b!830206 (= lt!376683 lt!376681)))

(declare-datatypes ((Unit!28429 0))(
  ( (Unit!28430) )
))
(declare-fun lt!376680 () Unit!28429)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!589 (array!46584 array!46586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25277 V!25277 V!25277 V!25277 (_ BitVec 32) Int) Unit!28429)

(assert (=> b!830206 (= lt!376680 (lemmaNoChangeToArrayThenSameMapNoExtras!589 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2501 (array!46584 array!46586 (_ BitVec 32) (_ BitVec 32) V!25277 V!25277 (_ BitVec 32) Int) ListLongMap!8973)

(assert (=> b!830206 (= lt!376681 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!830206 (= lt!376683 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830207 () Bool)

(assert (=> b!830207 (= e!462857 (= lt!376682 (+!1980 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376677)))))

(declare-fun mapIsEmpty!24463 () Bool)

(assert (=> mapIsEmpty!24463 mapRes!24463))

(assert (= (and start!71488 res!565442) b!830205))

(assert (= (and b!830205 res!565443) b!830200))

(assert (= (and b!830200 res!565446) b!830202))

(assert (= (and b!830202 res!565441) b!830206))

(assert (= (and b!830206 (not res!565445)) b!830204))

(assert (= (and b!830204 res!565444) b!830207))

(assert (= (and b!830203 condMapEmpty!24463) mapIsEmpty!24463))

(assert (= (and b!830203 (not condMapEmpty!24463)) mapNonEmpty!24463))

(get-info :version)

(assert (= (and mapNonEmpty!24463 ((_ is ValueCellFull!7188) mapValue!24463)) b!830201))

(assert (= (and b!830203 ((_ is ValueCellFull!7188) mapDefault!24463)) b!830199))

(assert (= start!71488 b!830203))

(declare-fun m!773261 () Bool)

(assert (=> b!830207 m!773261))

(assert (=> b!830207 m!773261))

(declare-fun m!773263 () Bool)

(assert (=> b!830207 m!773263))

(declare-fun m!773265 () Bool)

(assert (=> b!830200 m!773265))

(declare-fun m!773267 () Bool)

(assert (=> b!830202 m!773267))

(declare-fun m!773269 () Bool)

(assert (=> b!830206 m!773269))

(declare-fun m!773271 () Bool)

(assert (=> b!830206 m!773271))

(declare-fun m!773273 () Bool)

(assert (=> b!830206 m!773273))

(declare-fun m!773275 () Bool)

(assert (=> b!830204 m!773275))

(declare-fun m!773277 () Bool)

(assert (=> b!830204 m!773277))

(declare-fun m!773279 () Bool)

(assert (=> b!830204 m!773279))

(assert (=> b!830204 m!773279))

(declare-fun m!773281 () Bool)

(assert (=> b!830204 m!773281))

(declare-fun m!773283 () Bool)

(assert (=> b!830204 m!773283))

(assert (=> b!830204 m!773275))

(declare-fun m!773285 () Bool)

(assert (=> b!830204 m!773285))

(declare-fun m!773287 () Bool)

(assert (=> mapNonEmpty!24463 m!773287))

(declare-fun m!773289 () Bool)

(assert (=> start!71488 m!773289))

(declare-fun m!773291 () Bool)

(assert (=> start!71488 m!773291))

(declare-fun m!773293 () Bool)

(assert (=> start!71488 m!773293))

(check-sat (not b!830204) (not b!830206) (not start!71488) b_and!22527 (not b!830200) (not b!830202) tp_is_empty!15207 (not b_next!13497) (not mapNonEmpty!24463) (not b!830207))
(check-sat b_and!22527 (not b_next!13497))
(get-model)

(declare-fun d!105337 () Bool)

(declare-fun e!462885 () Bool)

(assert (=> d!105337 e!462885))

(declare-fun res!565470 () Bool)

(assert (=> d!105337 (=> (not res!565470) (not e!462885))))

(declare-fun lt!376716 () ListLongMap!8973)

(declare-fun contains!4208 (ListLongMap!8973 (_ BitVec 64)) Bool)

(assert (=> d!105337 (= res!565470 (contains!4208 lt!376716 (_1!5086 lt!376677)))))

(declare-fun lt!376713 () List!15945)

(assert (=> d!105337 (= lt!376716 (ListLongMap!8974 lt!376713))))

(declare-fun lt!376715 () Unit!28429)

(declare-fun lt!376714 () Unit!28429)

(assert (=> d!105337 (= lt!376715 lt!376714)))

(declare-datatypes ((Option!421 0))(
  ( (Some!420 (v!10095 V!25277)) (None!419) )
))
(declare-fun getValueByKey!415 (List!15945 (_ BitVec 64)) Option!421)

(assert (=> d!105337 (= (getValueByKey!415 lt!376713 (_1!5086 lt!376677)) (Some!420 (_2!5086 lt!376677)))))

(declare-fun lemmaContainsTupThenGetReturnValue!229 (List!15945 (_ BitVec 64) V!25277) Unit!28429)

(assert (=> d!105337 (= lt!376714 (lemmaContainsTupThenGetReturnValue!229 lt!376713 (_1!5086 lt!376677) (_2!5086 lt!376677)))))

(declare-fun insertStrictlySorted!268 (List!15945 (_ BitVec 64) V!25277) List!15945)

(assert (=> d!105337 (= lt!376713 (insertStrictlySorted!268 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5086 lt!376677) (_2!5086 lt!376677)))))

(assert (=> d!105337 (= (+!1980 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376677) lt!376716)))

(declare-fun b!830239 () Bool)

(declare-fun res!565469 () Bool)

(assert (=> b!830239 (=> (not res!565469) (not e!462885))))

(assert (=> b!830239 (= res!565469 (= (getValueByKey!415 (toList!4502 lt!376716) (_1!5086 lt!376677)) (Some!420 (_2!5086 lt!376677))))))

(declare-fun b!830240 () Bool)

(declare-fun contains!4209 (List!15945 tuple2!10150) Bool)

(assert (=> b!830240 (= e!462885 (contains!4209 (toList!4502 lt!376716) lt!376677))))

(assert (= (and d!105337 res!565470) b!830239))

(assert (= (and b!830239 res!565469) b!830240))

(declare-fun m!773329 () Bool)

(assert (=> d!105337 m!773329))

(declare-fun m!773331 () Bool)

(assert (=> d!105337 m!773331))

(declare-fun m!773333 () Bool)

(assert (=> d!105337 m!773333))

(declare-fun m!773335 () Bool)

(assert (=> d!105337 m!773335))

(declare-fun m!773337 () Bool)

(assert (=> b!830239 m!773337))

(declare-fun m!773339 () Bool)

(assert (=> b!830240 m!773339))

(assert (=> b!830207 d!105337))

(declare-fun d!105339 () Bool)

(declare-fun e!462886 () Bool)

(assert (=> d!105339 e!462886))

(declare-fun res!565472 () Bool)

(assert (=> d!105339 (=> (not res!565472) (not e!462886))))

(declare-fun lt!376720 () ListLongMap!8973)

(assert (=> d!105339 (= res!565472 (contains!4208 lt!376720 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!376717 () List!15945)

(assert (=> d!105339 (= lt!376720 (ListLongMap!8974 lt!376717))))

(declare-fun lt!376719 () Unit!28429)

(declare-fun lt!376718 () Unit!28429)

(assert (=> d!105339 (= lt!376719 lt!376718)))

(assert (=> d!105339 (= (getValueByKey!415 lt!376717 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!420 (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105339 (= lt!376718 (lemmaContainsTupThenGetReturnValue!229 lt!376717 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105339 (= lt!376717 (insertStrictlySorted!268 (toList!4502 lt!376681) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105339 (= (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376720)))

(declare-fun b!830241 () Bool)

(declare-fun res!565471 () Bool)

(assert (=> b!830241 (=> (not res!565471) (not e!462886))))

(assert (=> b!830241 (= res!565471 (= (getValueByKey!415 (toList!4502 lt!376720) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!420 (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!830242 () Bool)

(assert (=> b!830242 (= e!462886 (contains!4209 (toList!4502 lt!376720) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105339 res!565472) b!830241))

(assert (= (and b!830241 res!565471) b!830242))

(declare-fun m!773341 () Bool)

(assert (=> d!105339 m!773341))

(declare-fun m!773343 () Bool)

(assert (=> d!105339 m!773343))

(declare-fun m!773345 () Bool)

(assert (=> d!105339 m!773345))

(declare-fun m!773347 () Bool)

(assert (=> d!105339 m!773347))

(declare-fun m!773349 () Bool)

(assert (=> b!830241 m!773349))

(declare-fun m!773351 () Bool)

(assert (=> b!830242 m!773351))

(assert (=> b!830207 d!105339))

(declare-fun b!830253 () Bool)

(declare-fun e!462895 () Bool)

(declare-fun e!462898 () Bool)

(assert (=> b!830253 (= e!462895 e!462898)))

(declare-fun c!89869 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!830253 (= c!89869 (validKeyInArray!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830254 () Bool)

(declare-fun call!36225 () Bool)

(assert (=> b!830254 (= e!462898 call!36225)))

(declare-fun b!830255 () Bool)

(declare-fun e!462896 () Bool)

(assert (=> b!830255 (= e!462896 e!462895)))

(declare-fun res!565480 () Bool)

(assert (=> b!830255 (=> (not res!565480) (not e!462895))))

(declare-fun e!462897 () Bool)

(assert (=> b!830255 (= res!565480 (not e!462897))))

(declare-fun res!565479 () Bool)

(assert (=> b!830255 (=> (not res!565479) (not e!462897))))

(assert (=> b!830255 (= res!565479 (validKeyInArray!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36222 () Bool)

(assert (=> bm!36222 (= call!36225 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941)))))

(declare-fun d!105341 () Bool)

(declare-fun res!565481 () Bool)

(assert (=> d!105341 (=> res!565481 e!462896)))

(assert (=> d!105341 (= res!565481 (bvsge #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(assert (=> d!105341 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15941) e!462896)))

(declare-fun b!830256 () Bool)

(declare-fun contains!4210 (List!15944 (_ BitVec 64)) Bool)

(assert (=> b!830256 (= e!462897 (contains!4210 Nil!15941 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830257 () Bool)

(assert (=> b!830257 (= e!462898 call!36225)))

(assert (= (and d!105341 (not res!565481)) b!830255))

(assert (= (and b!830255 res!565479) b!830256))

(assert (= (and b!830255 res!565480) b!830253))

(assert (= (and b!830253 c!89869) b!830257))

(assert (= (and b!830253 (not c!89869)) b!830254))

(assert (= (or b!830257 b!830254) bm!36222))

(declare-fun m!773353 () Bool)

(assert (=> b!830253 m!773353))

(assert (=> b!830253 m!773353))

(declare-fun m!773355 () Bool)

(assert (=> b!830253 m!773355))

(assert (=> b!830255 m!773353))

(assert (=> b!830255 m!773353))

(assert (=> b!830255 m!773355))

(assert (=> bm!36222 m!773353))

(declare-fun m!773357 () Bool)

(assert (=> bm!36222 m!773357))

(assert (=> b!830256 m!773353))

(assert (=> b!830256 m!773353))

(declare-fun m!773359 () Bool)

(assert (=> b!830256 m!773359))

(assert (=> b!830202 d!105341))

(declare-fun d!105343 () Bool)

(assert (=> d!105343 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71488 d!105343))

(declare-fun d!105345 () Bool)

(assert (=> d!105345 (= (array_inv!17783 _keys!976) (bvsge (size!22749 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71488 d!105345))

(declare-fun d!105347 () Bool)

(assert (=> d!105347 (= (array_inv!17784 _values!788) (bvsge (size!22750 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71488 d!105347))

(declare-fun bm!36225 () Bool)

(declare-fun call!36228 () Bool)

(assert (=> bm!36225 (= call!36228 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!830266 () Bool)

(declare-fun e!462907 () Bool)

(assert (=> b!830266 (= e!462907 call!36228)))

(declare-fun b!830267 () Bool)

(declare-fun e!462906 () Bool)

(declare-fun e!462905 () Bool)

(assert (=> b!830267 (= e!462906 e!462905)))

(declare-fun c!89872 () Bool)

(assert (=> b!830267 (= c!89872 (validKeyInArray!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105349 () Bool)

(declare-fun res!565487 () Bool)

(assert (=> d!105349 (=> res!565487 e!462906)))

(assert (=> d!105349 (= res!565487 (bvsge #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(assert (=> d!105349 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!462906)))

(declare-fun b!830268 () Bool)

(assert (=> b!830268 (= e!462905 e!462907)))

(declare-fun lt!376728 () (_ BitVec 64))

(assert (=> b!830268 (= lt!376728 (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376727 () Unit!28429)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46584 (_ BitVec 64) (_ BitVec 32)) Unit!28429)

(assert (=> b!830268 (= lt!376727 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!376728 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!830268 (arrayContainsKey!0 _keys!976 lt!376728 #b00000000000000000000000000000000)))

(declare-fun lt!376729 () Unit!28429)

(assert (=> b!830268 (= lt!376729 lt!376727)))

(declare-fun res!565486 () Bool)

(declare-datatypes ((SeekEntryResult!8744 0))(
  ( (MissingZero!8744 (index!37347 (_ BitVec 32))) (Found!8744 (index!37348 (_ BitVec 32))) (Intermediate!8744 (undefined!9556 Bool) (index!37349 (_ BitVec 32)) (x!70109 (_ BitVec 32))) (Undefined!8744) (MissingVacant!8744 (index!37350 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46584 (_ BitVec 32)) SeekEntryResult!8744)

(assert (=> b!830268 (= res!565486 (= (seekEntryOrOpen!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8744 #b00000000000000000000000000000000)))))

(assert (=> b!830268 (=> (not res!565486) (not e!462907))))

(declare-fun b!830269 () Bool)

(assert (=> b!830269 (= e!462905 call!36228)))

(assert (= (and d!105349 (not res!565487)) b!830267))

(assert (= (and b!830267 c!89872) b!830268))

(assert (= (and b!830267 (not c!89872)) b!830269))

(assert (= (and b!830268 res!565486) b!830266))

(assert (= (or b!830266 b!830269) bm!36225))

(declare-fun m!773361 () Bool)

(assert (=> bm!36225 m!773361))

(assert (=> b!830267 m!773353))

(assert (=> b!830267 m!773353))

(assert (=> b!830267 m!773355))

(assert (=> b!830268 m!773353))

(declare-fun m!773363 () Bool)

(assert (=> b!830268 m!773363))

(declare-fun m!773365 () Bool)

(assert (=> b!830268 m!773365))

(assert (=> b!830268 m!773353))

(declare-fun m!773367 () Bool)

(assert (=> b!830268 m!773367))

(assert (=> b!830200 d!105349))

(declare-fun d!105351 () Bool)

(declare-fun e!462908 () Bool)

(assert (=> d!105351 e!462908))

(declare-fun res!565489 () Bool)

(assert (=> d!105351 (=> (not res!565489) (not e!462908))))

(declare-fun lt!376733 () ListLongMap!8973)

(assert (=> d!105351 (= res!565489 (contains!4208 lt!376733 (_1!5086 lt!376679)))))

(declare-fun lt!376730 () List!15945)

(assert (=> d!105351 (= lt!376733 (ListLongMap!8974 lt!376730))))

(declare-fun lt!376732 () Unit!28429)

(declare-fun lt!376731 () Unit!28429)

(assert (=> d!105351 (= lt!376732 lt!376731)))

(assert (=> d!105351 (= (getValueByKey!415 lt!376730 (_1!5086 lt!376679)) (Some!420 (_2!5086 lt!376679)))))

(assert (=> d!105351 (= lt!376731 (lemmaContainsTupThenGetReturnValue!229 lt!376730 (_1!5086 lt!376679) (_2!5086 lt!376679)))))

(assert (=> d!105351 (= lt!376730 (insertStrictlySorted!268 (toList!4502 (+!1980 lt!376683 lt!376677)) (_1!5086 lt!376679) (_2!5086 lt!376679)))))

(assert (=> d!105351 (= (+!1980 (+!1980 lt!376683 lt!376677) lt!376679) lt!376733)))

(declare-fun b!830270 () Bool)

(declare-fun res!565488 () Bool)

(assert (=> b!830270 (=> (not res!565488) (not e!462908))))

(assert (=> b!830270 (= res!565488 (= (getValueByKey!415 (toList!4502 lt!376733) (_1!5086 lt!376679)) (Some!420 (_2!5086 lt!376679))))))

(declare-fun b!830271 () Bool)

(assert (=> b!830271 (= e!462908 (contains!4209 (toList!4502 lt!376733) lt!376679))))

(assert (= (and d!105351 res!565489) b!830270))

(assert (= (and b!830270 res!565488) b!830271))

(declare-fun m!773369 () Bool)

(assert (=> d!105351 m!773369))

(declare-fun m!773371 () Bool)

(assert (=> d!105351 m!773371))

(declare-fun m!773373 () Bool)

(assert (=> d!105351 m!773373))

(declare-fun m!773375 () Bool)

(assert (=> d!105351 m!773375))

(declare-fun m!773377 () Bool)

(assert (=> b!830270 m!773377))

(declare-fun m!773379 () Bool)

(assert (=> b!830271 m!773379))

(assert (=> b!830204 d!105351))

(declare-fun d!105353 () Bool)

(declare-fun e!462909 () Bool)

(assert (=> d!105353 e!462909))

(declare-fun res!565491 () Bool)

(assert (=> d!105353 (=> (not res!565491) (not e!462909))))

(declare-fun lt!376737 () ListLongMap!8973)

(assert (=> d!105353 (= res!565491 (contains!4208 lt!376737 (_1!5086 lt!376679)))))

(declare-fun lt!376734 () List!15945)

(assert (=> d!105353 (= lt!376737 (ListLongMap!8974 lt!376734))))

(declare-fun lt!376736 () Unit!28429)

(declare-fun lt!376735 () Unit!28429)

(assert (=> d!105353 (= lt!376736 lt!376735)))

(assert (=> d!105353 (= (getValueByKey!415 lt!376734 (_1!5086 lt!376679)) (Some!420 (_2!5086 lt!376679)))))

(assert (=> d!105353 (= lt!376735 (lemmaContainsTupThenGetReturnValue!229 lt!376734 (_1!5086 lt!376679) (_2!5086 lt!376679)))))

(assert (=> d!105353 (= lt!376734 (insertStrictlySorted!268 (toList!4502 lt!376683) (_1!5086 lt!376679) (_2!5086 lt!376679)))))

(assert (=> d!105353 (= (+!1980 lt!376683 lt!376679) lt!376737)))

(declare-fun b!830272 () Bool)

(declare-fun res!565490 () Bool)

(assert (=> b!830272 (=> (not res!565490) (not e!462909))))

(assert (=> b!830272 (= res!565490 (= (getValueByKey!415 (toList!4502 lt!376737) (_1!5086 lt!376679)) (Some!420 (_2!5086 lt!376679))))))

(declare-fun b!830273 () Bool)

(assert (=> b!830273 (= e!462909 (contains!4209 (toList!4502 lt!376737) lt!376679))))

(assert (= (and d!105353 res!565491) b!830272))

(assert (= (and b!830272 res!565490) b!830273))

(declare-fun m!773381 () Bool)

(assert (=> d!105353 m!773381))

(declare-fun m!773383 () Bool)

(assert (=> d!105353 m!773383))

(declare-fun m!773385 () Bool)

(assert (=> d!105353 m!773385))

(declare-fun m!773387 () Bool)

(assert (=> d!105353 m!773387))

(declare-fun m!773389 () Bool)

(assert (=> b!830272 m!773389))

(declare-fun m!773391 () Bool)

(assert (=> b!830273 m!773391))

(assert (=> b!830204 d!105353))

(declare-fun bm!36240 () Bool)

(declare-fun call!36244 () ListLongMap!8973)

(declare-fun call!36246 () ListLongMap!8973)

(assert (=> bm!36240 (= call!36244 call!36246)))

(declare-fun b!830316 () Bool)

(declare-fun e!462940 () Bool)

(declare-fun lt!376795 () ListLongMap!8973)

(declare-fun apply!372 (ListLongMap!8973 (_ BitVec 64)) V!25277)

(assert (=> b!830316 (= e!462940 (= (apply!372 lt!376795 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!830317 () Bool)

(declare-fun e!462946 () Bool)

(declare-fun e!462939 () Bool)

(assert (=> b!830317 (= e!462946 e!462939)))

(declare-fun res!565516 () Bool)

(assert (=> b!830317 (=> (not res!565516) (not e!462939))))

(assert (=> b!830317 (= res!565516 (contains!4208 lt!376795 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830317 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(declare-fun d!105355 () Bool)

(declare-fun e!462944 () Bool)

(assert (=> d!105355 e!462944))

(declare-fun res!565517 () Bool)

(assert (=> d!105355 (=> (not res!565517) (not e!462944))))

(assert (=> d!105355 (= res!565517 (or (bvsge #b00000000000000000000000000000000 (size!22749 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))))

(declare-fun lt!376784 () ListLongMap!8973)

(assert (=> d!105355 (= lt!376795 lt!376784)))

(declare-fun lt!376801 () Unit!28429)

(declare-fun e!462942 () Unit!28429)

(assert (=> d!105355 (= lt!376801 e!462942)))

(declare-fun c!89886 () Bool)

(declare-fun e!462948 () Bool)

(assert (=> d!105355 (= c!89886 e!462948)))

(declare-fun res!565511 () Bool)

(assert (=> d!105355 (=> (not res!565511) (not e!462948))))

(assert (=> d!105355 (= res!565511 (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(declare-fun e!462941 () ListLongMap!8973)

(assert (=> d!105355 (= lt!376784 e!462941)))

(declare-fun c!89885 () Bool)

(assert (=> d!105355 (= c!89885 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105355 (validMask!0 mask!1312)))

(assert (=> d!105355 (= (getCurrentListMap!2598 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376795)))

(declare-fun b!830318 () Bool)

(declare-fun call!36248 () ListLongMap!8973)

(assert (=> b!830318 (= e!462941 (+!1980 call!36248 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!830319 () Bool)

(declare-fun Unit!28433 () Unit!28429)

(assert (=> b!830319 (= e!462942 Unit!28433)))

(declare-fun b!830320 () Bool)

(declare-fun res!565510 () Bool)

(assert (=> b!830320 (=> (not res!565510) (not e!462944))))

(assert (=> b!830320 (= res!565510 e!462946)))

(declare-fun res!565515 () Bool)

(assert (=> b!830320 (=> res!565515 e!462946)))

(declare-fun e!462937 () Bool)

(assert (=> b!830320 (= res!565515 (not e!462937))))

(declare-fun res!565518 () Bool)

(assert (=> b!830320 (=> (not res!565518) (not e!462937))))

(assert (=> b!830320 (= res!565518 (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(declare-fun bm!36241 () Bool)

(declare-fun call!36247 () ListLongMap!8973)

(assert (=> bm!36241 (= call!36246 call!36247)))

(declare-fun bm!36242 () Bool)

(declare-fun call!36245 () ListLongMap!8973)

(assert (=> bm!36242 (= call!36245 call!36248)))

(declare-fun b!830321 () Bool)

(declare-fun e!462938 () Bool)

(declare-fun e!462936 () Bool)

(assert (=> b!830321 (= e!462938 e!462936)))

(declare-fun res!565514 () Bool)

(declare-fun call!36243 () Bool)

(assert (=> b!830321 (= res!565514 call!36243)))

(assert (=> b!830321 (=> (not res!565514) (not e!462936))))

(declare-fun b!830322 () Bool)

(declare-fun e!462947 () ListLongMap!8973)

(assert (=> b!830322 (= e!462947 call!36245)))

(declare-fun bm!36243 () Bool)

(assert (=> bm!36243 (= call!36243 (contains!4208 lt!376795 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830323 () Bool)

(declare-fun e!462945 () ListLongMap!8973)

(assert (=> b!830323 (= e!462945 call!36245)))

(declare-fun b!830324 () Bool)

(assert (=> b!830324 (= e!462945 call!36244)))

(declare-fun b!830325 () Bool)

(declare-fun e!462943 () Bool)

(declare-fun call!36249 () Bool)

(assert (=> b!830325 (= e!462943 (not call!36249))))

(declare-fun b!830326 () Bool)

(declare-fun lt!376785 () Unit!28429)

(assert (=> b!830326 (= e!462942 lt!376785)))

(declare-fun lt!376802 () ListLongMap!8973)

(assert (=> b!830326 (= lt!376802 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376788 () (_ BitVec 64))

(assert (=> b!830326 (= lt!376788 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376783 () (_ BitVec 64))

(assert (=> b!830326 (= lt!376783 (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376789 () Unit!28429)

(declare-fun addStillContains!323 (ListLongMap!8973 (_ BitVec 64) V!25277 (_ BitVec 64)) Unit!28429)

(assert (=> b!830326 (= lt!376789 (addStillContains!323 lt!376802 lt!376788 zeroValueBefore!34 lt!376783))))

(assert (=> b!830326 (contains!4208 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34)) lt!376783)))

(declare-fun lt!376798 () Unit!28429)

(assert (=> b!830326 (= lt!376798 lt!376789)))

(declare-fun lt!376794 () ListLongMap!8973)

(assert (=> b!830326 (= lt!376794 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376782 () (_ BitVec 64))

(assert (=> b!830326 (= lt!376782 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376796 () (_ BitVec 64))

(assert (=> b!830326 (= lt!376796 (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376793 () Unit!28429)

(declare-fun addApplyDifferent!323 (ListLongMap!8973 (_ BitVec 64) V!25277 (_ BitVec 64)) Unit!28429)

(assert (=> b!830326 (= lt!376793 (addApplyDifferent!323 lt!376794 lt!376782 minValue!754 lt!376796))))

(assert (=> b!830326 (= (apply!372 (+!1980 lt!376794 (tuple2!10151 lt!376782 minValue!754)) lt!376796) (apply!372 lt!376794 lt!376796))))

(declare-fun lt!376800 () Unit!28429)

(assert (=> b!830326 (= lt!376800 lt!376793)))

(declare-fun lt!376803 () ListLongMap!8973)

(assert (=> b!830326 (= lt!376803 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376792 () (_ BitVec 64))

(assert (=> b!830326 (= lt!376792 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376787 () (_ BitVec 64))

(assert (=> b!830326 (= lt!376787 (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376786 () Unit!28429)

(assert (=> b!830326 (= lt!376786 (addApplyDifferent!323 lt!376803 lt!376792 zeroValueBefore!34 lt!376787))))

(assert (=> b!830326 (= (apply!372 (+!1980 lt!376803 (tuple2!10151 lt!376792 zeroValueBefore!34)) lt!376787) (apply!372 lt!376803 lt!376787))))

(declare-fun lt!376797 () Unit!28429)

(assert (=> b!830326 (= lt!376797 lt!376786)))

(declare-fun lt!376790 () ListLongMap!8973)

(assert (=> b!830326 (= lt!376790 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376791 () (_ BitVec 64))

(assert (=> b!830326 (= lt!376791 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376799 () (_ BitVec 64))

(assert (=> b!830326 (= lt!376799 (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830326 (= lt!376785 (addApplyDifferent!323 lt!376790 lt!376791 minValue!754 lt!376799))))

(assert (=> b!830326 (= (apply!372 (+!1980 lt!376790 (tuple2!10151 lt!376791 minValue!754)) lt!376799) (apply!372 lt!376790 lt!376799))))

(declare-fun b!830327 () Bool)

(assert (=> b!830327 (= e!462938 (not call!36243))))

(declare-fun bm!36244 () Bool)

(assert (=> bm!36244 (= call!36247 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830328 () Bool)

(assert (=> b!830328 (= e!462937 (validKeyInArray!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36245 () Bool)

(assert (=> bm!36245 (= call!36249 (contains!4208 lt!376795 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830329 () Bool)

(assert (=> b!830329 (= e!462944 e!462943)))

(declare-fun c!89888 () Bool)

(assert (=> b!830329 (= c!89888 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830330 () Bool)

(assert (=> b!830330 (= e!462948 (validKeyInArray!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830331 () Bool)

(declare-fun c!89887 () Bool)

(assert (=> b!830331 (= c!89887 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!830331 (= e!462947 e!462945)))

(declare-fun b!830332 () Bool)

(assert (=> b!830332 (= e!462936 (= (apply!372 lt!376795 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun bm!36246 () Bool)

(declare-fun c!89890 () Bool)

(assert (=> bm!36246 (= call!36248 (+!1980 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244)) (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!830333 () Bool)

(declare-fun get!11817 (ValueCell!7188 V!25277) V!25277)

(declare-fun dynLambda!983 (Int (_ BitVec 64)) V!25277)

(assert (=> b!830333 (= e!462939 (= (apply!372 lt!376795 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830333 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22750 _values!788)))))

(assert (=> b!830333 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(declare-fun b!830334 () Bool)

(assert (=> b!830334 (= e!462941 e!462947)))

(assert (=> b!830334 (= c!89890 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830335 () Bool)

(declare-fun res!565512 () Bool)

(assert (=> b!830335 (=> (not res!565512) (not e!462944))))

(assert (=> b!830335 (= res!565512 e!462938)))

(declare-fun c!89889 () Bool)

(assert (=> b!830335 (= c!89889 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!830336 () Bool)

(assert (=> b!830336 (= e!462943 e!462940)))

(declare-fun res!565513 () Bool)

(assert (=> b!830336 (= res!565513 call!36249)))

(assert (=> b!830336 (=> (not res!565513) (not e!462940))))

(assert (= (and d!105355 c!89885) b!830318))

(assert (= (and d!105355 (not c!89885)) b!830334))

(assert (= (and b!830334 c!89890) b!830322))

(assert (= (and b!830334 (not c!89890)) b!830331))

(assert (= (and b!830331 c!89887) b!830323))

(assert (= (and b!830331 (not c!89887)) b!830324))

(assert (= (or b!830323 b!830324) bm!36240))

(assert (= (or b!830322 bm!36240) bm!36241))

(assert (= (or b!830322 b!830323) bm!36242))

(assert (= (or b!830318 bm!36241) bm!36244))

(assert (= (or b!830318 bm!36242) bm!36246))

(assert (= (and d!105355 res!565511) b!830330))

(assert (= (and d!105355 c!89886) b!830326))

(assert (= (and d!105355 (not c!89886)) b!830319))

(assert (= (and d!105355 res!565517) b!830320))

(assert (= (and b!830320 res!565518) b!830328))

(assert (= (and b!830320 (not res!565515)) b!830317))

(assert (= (and b!830317 res!565516) b!830333))

(assert (= (and b!830320 res!565510) b!830335))

(assert (= (and b!830335 c!89889) b!830321))

(assert (= (and b!830335 (not c!89889)) b!830327))

(assert (= (and b!830321 res!565514) b!830332))

(assert (= (or b!830321 b!830327) bm!36243))

(assert (= (and b!830335 res!565512) b!830329))

(assert (= (and b!830329 c!89888) b!830336))

(assert (= (and b!830329 (not c!89888)) b!830325))

(assert (= (and b!830336 res!565513) b!830316))

(assert (= (or b!830336 b!830325) bm!36245))

(declare-fun b_lambda!11347 () Bool)

(assert (=> (not b_lambda!11347) (not b!830333)))

(declare-fun t!22314 () Bool)

(declare-fun tb!4225 () Bool)

(assert (=> (and start!71488 (= defaultEntry!796 defaultEntry!796) t!22314) tb!4225))

(declare-fun result!8015 () Bool)

(assert (=> tb!4225 (= result!8015 tp_is_empty!15207)))

(assert (=> b!830333 t!22314))

(declare-fun b_and!22531 () Bool)

(assert (= b_and!22527 (and (=> t!22314 result!8015) b_and!22531)))

(declare-fun m!773393 () Bool)

(assert (=> b!830316 m!773393))

(assert (=> b!830317 m!773353))

(assert (=> b!830317 m!773353))

(declare-fun m!773395 () Bool)

(assert (=> b!830317 m!773395))

(declare-fun m!773397 () Bool)

(assert (=> b!830332 m!773397))

(declare-fun m!773399 () Bool)

(assert (=> b!830326 m!773399))

(assert (=> b!830326 m!773273))

(declare-fun m!773401 () Bool)

(assert (=> b!830326 m!773401))

(declare-fun m!773403 () Bool)

(assert (=> b!830326 m!773403))

(declare-fun m!773405 () Bool)

(assert (=> b!830326 m!773405))

(declare-fun m!773407 () Bool)

(assert (=> b!830326 m!773407))

(assert (=> b!830326 m!773401))

(assert (=> b!830326 m!773353))

(declare-fun m!773409 () Bool)

(assert (=> b!830326 m!773409))

(assert (=> b!830326 m!773405))

(declare-fun m!773411 () Bool)

(assert (=> b!830326 m!773411))

(declare-fun m!773413 () Bool)

(assert (=> b!830326 m!773413))

(declare-fun m!773415 () Bool)

(assert (=> b!830326 m!773415))

(declare-fun m!773417 () Bool)

(assert (=> b!830326 m!773417))

(assert (=> b!830326 m!773413))

(declare-fun m!773419 () Bool)

(assert (=> b!830326 m!773419))

(declare-fun m!773421 () Bool)

(assert (=> b!830326 m!773421))

(declare-fun m!773423 () Bool)

(assert (=> b!830326 m!773423))

(declare-fun m!773425 () Bool)

(assert (=> b!830326 m!773425))

(declare-fun m!773427 () Bool)

(assert (=> b!830326 m!773427))

(assert (=> b!830326 m!773425))

(declare-fun m!773429 () Bool)

(assert (=> bm!36245 m!773429))

(declare-fun m!773431 () Bool)

(assert (=> bm!36243 m!773431))

(assert (=> b!830330 m!773353))

(assert (=> b!830330 m!773353))

(assert (=> b!830330 m!773355))

(assert (=> b!830333 m!773353))

(declare-fun m!773433 () Bool)

(assert (=> b!830333 m!773433))

(declare-fun m!773435 () Bool)

(assert (=> b!830333 m!773435))

(assert (=> b!830333 m!773433))

(declare-fun m!773437 () Bool)

(assert (=> b!830333 m!773437))

(assert (=> b!830333 m!773435))

(assert (=> b!830333 m!773353))

(declare-fun m!773439 () Bool)

(assert (=> b!830333 m!773439))

(assert (=> b!830328 m!773353))

(assert (=> b!830328 m!773353))

(assert (=> b!830328 m!773355))

(declare-fun m!773441 () Bool)

(assert (=> bm!36246 m!773441))

(assert (=> bm!36244 m!773273))

(assert (=> d!105355 m!773289))

(declare-fun m!773443 () Bool)

(assert (=> b!830318 m!773443))

(assert (=> b!830204 d!105355))

(declare-fun bm!36247 () Bool)

(declare-fun call!36251 () ListLongMap!8973)

(declare-fun call!36253 () ListLongMap!8973)

(assert (=> bm!36247 (= call!36251 call!36253)))

(declare-fun b!830339 () Bool)

(declare-fun e!462953 () Bool)

(declare-fun lt!376817 () ListLongMap!8973)

(assert (=> b!830339 (= e!462953 (= (apply!372 lt!376817 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!830340 () Bool)

(declare-fun e!462959 () Bool)

(declare-fun e!462952 () Bool)

(assert (=> b!830340 (= e!462959 e!462952)))

(declare-fun res!565525 () Bool)

(assert (=> b!830340 (=> (not res!565525) (not e!462952))))

(assert (=> b!830340 (= res!565525 (contains!4208 lt!376817 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830340 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(declare-fun d!105357 () Bool)

(declare-fun e!462957 () Bool)

(assert (=> d!105357 e!462957))

(declare-fun res!565526 () Bool)

(assert (=> d!105357 (=> (not res!565526) (not e!462957))))

(assert (=> d!105357 (= res!565526 (or (bvsge #b00000000000000000000000000000000 (size!22749 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))))

(declare-fun lt!376806 () ListLongMap!8973)

(assert (=> d!105357 (= lt!376817 lt!376806)))

(declare-fun lt!376823 () Unit!28429)

(declare-fun e!462955 () Unit!28429)

(assert (=> d!105357 (= lt!376823 e!462955)))

(declare-fun c!89892 () Bool)

(declare-fun e!462961 () Bool)

(assert (=> d!105357 (= c!89892 e!462961)))

(declare-fun res!565520 () Bool)

(assert (=> d!105357 (=> (not res!565520) (not e!462961))))

(assert (=> d!105357 (= res!565520 (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(declare-fun e!462954 () ListLongMap!8973)

(assert (=> d!105357 (= lt!376806 e!462954)))

(declare-fun c!89891 () Bool)

(assert (=> d!105357 (= c!89891 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105357 (validMask!0 mask!1312)))

(assert (=> d!105357 (= (getCurrentListMap!2598 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376817)))

(declare-fun b!830341 () Bool)

(declare-fun call!36255 () ListLongMap!8973)

(assert (=> b!830341 (= e!462954 (+!1980 call!36255 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!830342 () Bool)

(declare-fun Unit!28434 () Unit!28429)

(assert (=> b!830342 (= e!462955 Unit!28434)))

(declare-fun b!830343 () Bool)

(declare-fun res!565519 () Bool)

(assert (=> b!830343 (=> (not res!565519) (not e!462957))))

(assert (=> b!830343 (= res!565519 e!462959)))

(declare-fun res!565524 () Bool)

(assert (=> b!830343 (=> res!565524 e!462959)))

(declare-fun e!462950 () Bool)

(assert (=> b!830343 (= res!565524 (not e!462950))))

(declare-fun res!565527 () Bool)

(assert (=> b!830343 (=> (not res!565527) (not e!462950))))

(assert (=> b!830343 (= res!565527 (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(declare-fun bm!36248 () Bool)

(declare-fun call!36254 () ListLongMap!8973)

(assert (=> bm!36248 (= call!36253 call!36254)))

(declare-fun bm!36249 () Bool)

(declare-fun call!36252 () ListLongMap!8973)

(assert (=> bm!36249 (= call!36252 call!36255)))

(declare-fun b!830344 () Bool)

(declare-fun e!462951 () Bool)

(declare-fun e!462949 () Bool)

(assert (=> b!830344 (= e!462951 e!462949)))

(declare-fun res!565523 () Bool)

(declare-fun call!36250 () Bool)

(assert (=> b!830344 (= res!565523 call!36250)))

(assert (=> b!830344 (=> (not res!565523) (not e!462949))))

(declare-fun b!830345 () Bool)

(declare-fun e!462960 () ListLongMap!8973)

(assert (=> b!830345 (= e!462960 call!36252)))

(declare-fun bm!36250 () Bool)

(assert (=> bm!36250 (= call!36250 (contains!4208 lt!376817 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830346 () Bool)

(declare-fun e!462958 () ListLongMap!8973)

(assert (=> b!830346 (= e!462958 call!36252)))

(declare-fun b!830347 () Bool)

(assert (=> b!830347 (= e!462958 call!36251)))

(declare-fun b!830348 () Bool)

(declare-fun e!462956 () Bool)

(declare-fun call!36256 () Bool)

(assert (=> b!830348 (= e!462956 (not call!36256))))

(declare-fun b!830349 () Bool)

(declare-fun lt!376807 () Unit!28429)

(assert (=> b!830349 (= e!462955 lt!376807)))

(declare-fun lt!376824 () ListLongMap!8973)

(assert (=> b!830349 (= lt!376824 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376810 () (_ BitVec 64))

(assert (=> b!830349 (= lt!376810 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376805 () (_ BitVec 64))

(assert (=> b!830349 (= lt!376805 (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376811 () Unit!28429)

(assert (=> b!830349 (= lt!376811 (addStillContains!323 lt!376824 lt!376810 zeroValueAfter!34 lt!376805))))

(assert (=> b!830349 (contains!4208 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34)) lt!376805)))

(declare-fun lt!376820 () Unit!28429)

(assert (=> b!830349 (= lt!376820 lt!376811)))

(declare-fun lt!376816 () ListLongMap!8973)

(assert (=> b!830349 (= lt!376816 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376804 () (_ BitVec 64))

(assert (=> b!830349 (= lt!376804 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376818 () (_ BitVec 64))

(assert (=> b!830349 (= lt!376818 (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376815 () Unit!28429)

(assert (=> b!830349 (= lt!376815 (addApplyDifferent!323 lt!376816 lt!376804 minValue!754 lt!376818))))

(assert (=> b!830349 (= (apply!372 (+!1980 lt!376816 (tuple2!10151 lt!376804 minValue!754)) lt!376818) (apply!372 lt!376816 lt!376818))))

(declare-fun lt!376822 () Unit!28429)

(assert (=> b!830349 (= lt!376822 lt!376815)))

(declare-fun lt!376825 () ListLongMap!8973)

(assert (=> b!830349 (= lt!376825 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376814 () (_ BitVec 64))

(assert (=> b!830349 (= lt!376814 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376809 () (_ BitVec 64))

(assert (=> b!830349 (= lt!376809 (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376808 () Unit!28429)

(assert (=> b!830349 (= lt!376808 (addApplyDifferent!323 lt!376825 lt!376814 zeroValueAfter!34 lt!376809))))

(assert (=> b!830349 (= (apply!372 (+!1980 lt!376825 (tuple2!10151 lt!376814 zeroValueAfter!34)) lt!376809) (apply!372 lt!376825 lt!376809))))

(declare-fun lt!376819 () Unit!28429)

(assert (=> b!830349 (= lt!376819 lt!376808)))

(declare-fun lt!376812 () ListLongMap!8973)

(assert (=> b!830349 (= lt!376812 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376813 () (_ BitVec 64))

(assert (=> b!830349 (= lt!376813 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376821 () (_ BitVec 64))

(assert (=> b!830349 (= lt!376821 (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830349 (= lt!376807 (addApplyDifferent!323 lt!376812 lt!376813 minValue!754 lt!376821))))

(assert (=> b!830349 (= (apply!372 (+!1980 lt!376812 (tuple2!10151 lt!376813 minValue!754)) lt!376821) (apply!372 lt!376812 lt!376821))))

(declare-fun b!830350 () Bool)

(assert (=> b!830350 (= e!462951 (not call!36250))))

(declare-fun bm!36251 () Bool)

(assert (=> bm!36251 (= call!36254 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830351 () Bool)

(assert (=> b!830351 (= e!462950 (validKeyInArray!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36252 () Bool)

(assert (=> bm!36252 (= call!36256 (contains!4208 lt!376817 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830352 () Bool)

(assert (=> b!830352 (= e!462957 e!462956)))

(declare-fun c!89894 () Bool)

(assert (=> b!830352 (= c!89894 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830353 () Bool)

(assert (=> b!830353 (= e!462961 (validKeyInArray!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830354 () Bool)

(declare-fun c!89893 () Bool)

(assert (=> b!830354 (= c!89893 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!830354 (= e!462960 e!462958)))

(declare-fun b!830355 () Bool)

(assert (=> b!830355 (= e!462949 (= (apply!372 lt!376817 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun c!89896 () Bool)

(declare-fun bm!36253 () Bool)

(assert (=> bm!36253 (= call!36255 (+!1980 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251)) (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!830356 () Bool)

(assert (=> b!830356 (= e!462952 (= (apply!372 lt!376817 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830356 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22750 _values!788)))))

(assert (=> b!830356 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(declare-fun b!830357 () Bool)

(assert (=> b!830357 (= e!462954 e!462960)))

(assert (=> b!830357 (= c!89896 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830358 () Bool)

(declare-fun res!565521 () Bool)

(assert (=> b!830358 (=> (not res!565521) (not e!462957))))

(assert (=> b!830358 (= res!565521 e!462951)))

(declare-fun c!89895 () Bool)

(assert (=> b!830358 (= c!89895 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!830359 () Bool)

(assert (=> b!830359 (= e!462956 e!462953)))

(declare-fun res!565522 () Bool)

(assert (=> b!830359 (= res!565522 call!36256)))

(assert (=> b!830359 (=> (not res!565522) (not e!462953))))

(assert (= (and d!105357 c!89891) b!830341))

(assert (= (and d!105357 (not c!89891)) b!830357))

(assert (= (and b!830357 c!89896) b!830345))

(assert (= (and b!830357 (not c!89896)) b!830354))

(assert (= (and b!830354 c!89893) b!830346))

(assert (= (and b!830354 (not c!89893)) b!830347))

(assert (= (or b!830346 b!830347) bm!36247))

(assert (= (or b!830345 bm!36247) bm!36248))

(assert (= (or b!830345 b!830346) bm!36249))

(assert (= (or b!830341 bm!36248) bm!36251))

(assert (= (or b!830341 bm!36249) bm!36253))

(assert (= (and d!105357 res!565520) b!830353))

(assert (= (and d!105357 c!89892) b!830349))

(assert (= (and d!105357 (not c!89892)) b!830342))

(assert (= (and d!105357 res!565526) b!830343))

(assert (= (and b!830343 res!565527) b!830351))

(assert (= (and b!830343 (not res!565524)) b!830340))

(assert (= (and b!830340 res!565525) b!830356))

(assert (= (and b!830343 res!565519) b!830358))

(assert (= (and b!830358 c!89895) b!830344))

(assert (= (and b!830358 (not c!89895)) b!830350))

(assert (= (and b!830344 res!565523) b!830355))

(assert (= (or b!830344 b!830350) bm!36250))

(assert (= (and b!830358 res!565521) b!830352))

(assert (= (and b!830352 c!89894) b!830359))

(assert (= (and b!830352 (not c!89894)) b!830348))

(assert (= (and b!830359 res!565522) b!830339))

(assert (= (or b!830359 b!830348) bm!36252))

(declare-fun b_lambda!11349 () Bool)

(assert (=> (not b_lambda!11349) (not b!830356)))

(assert (=> b!830356 t!22314))

(declare-fun b_and!22533 () Bool)

(assert (= b_and!22531 (and (=> t!22314 result!8015) b_and!22533)))

(declare-fun m!773445 () Bool)

(assert (=> b!830339 m!773445))

(assert (=> b!830340 m!773353))

(assert (=> b!830340 m!773353))

(declare-fun m!773447 () Bool)

(assert (=> b!830340 m!773447))

(declare-fun m!773449 () Bool)

(assert (=> b!830355 m!773449))

(declare-fun m!773451 () Bool)

(assert (=> b!830349 m!773451))

(assert (=> b!830349 m!773271))

(declare-fun m!773453 () Bool)

(assert (=> b!830349 m!773453))

(declare-fun m!773455 () Bool)

(assert (=> b!830349 m!773455))

(declare-fun m!773457 () Bool)

(assert (=> b!830349 m!773457))

(declare-fun m!773459 () Bool)

(assert (=> b!830349 m!773459))

(assert (=> b!830349 m!773453))

(assert (=> b!830349 m!773353))

(declare-fun m!773461 () Bool)

(assert (=> b!830349 m!773461))

(assert (=> b!830349 m!773457))

(declare-fun m!773463 () Bool)

(assert (=> b!830349 m!773463))

(declare-fun m!773465 () Bool)

(assert (=> b!830349 m!773465))

(declare-fun m!773467 () Bool)

(assert (=> b!830349 m!773467))

(declare-fun m!773469 () Bool)

(assert (=> b!830349 m!773469))

(assert (=> b!830349 m!773465))

(declare-fun m!773471 () Bool)

(assert (=> b!830349 m!773471))

(declare-fun m!773473 () Bool)

(assert (=> b!830349 m!773473))

(declare-fun m!773475 () Bool)

(assert (=> b!830349 m!773475))

(declare-fun m!773477 () Bool)

(assert (=> b!830349 m!773477))

(declare-fun m!773479 () Bool)

(assert (=> b!830349 m!773479))

(assert (=> b!830349 m!773477))

(declare-fun m!773481 () Bool)

(assert (=> bm!36252 m!773481))

(declare-fun m!773483 () Bool)

(assert (=> bm!36250 m!773483))

(assert (=> b!830353 m!773353))

(assert (=> b!830353 m!773353))

(assert (=> b!830353 m!773355))

(assert (=> b!830356 m!773353))

(assert (=> b!830356 m!773433))

(assert (=> b!830356 m!773435))

(assert (=> b!830356 m!773433))

(assert (=> b!830356 m!773437))

(assert (=> b!830356 m!773435))

(assert (=> b!830356 m!773353))

(declare-fun m!773485 () Bool)

(assert (=> b!830356 m!773485))

(assert (=> b!830351 m!773353))

(assert (=> b!830351 m!773353))

(assert (=> b!830351 m!773355))

(declare-fun m!773487 () Bool)

(assert (=> bm!36253 m!773487))

(assert (=> bm!36251 m!773271))

(assert (=> d!105357 m!773289))

(declare-fun m!773489 () Bool)

(assert (=> b!830341 m!773489))

(assert (=> b!830204 d!105357))

(declare-fun d!105359 () Bool)

(declare-fun e!462962 () Bool)

(assert (=> d!105359 e!462962))

(declare-fun res!565529 () Bool)

(assert (=> d!105359 (=> (not res!565529) (not e!462962))))

(declare-fun lt!376829 () ListLongMap!8973)

(assert (=> d!105359 (= res!565529 (contains!4208 lt!376829 (_1!5086 lt!376677)))))

(declare-fun lt!376826 () List!15945)

(assert (=> d!105359 (= lt!376829 (ListLongMap!8974 lt!376826))))

(declare-fun lt!376828 () Unit!28429)

(declare-fun lt!376827 () Unit!28429)

(assert (=> d!105359 (= lt!376828 lt!376827)))

(assert (=> d!105359 (= (getValueByKey!415 lt!376826 (_1!5086 lt!376677)) (Some!420 (_2!5086 lt!376677)))))

(assert (=> d!105359 (= lt!376827 (lemmaContainsTupThenGetReturnValue!229 lt!376826 (_1!5086 lt!376677) (_2!5086 lt!376677)))))

(assert (=> d!105359 (= lt!376826 (insertStrictlySorted!268 (toList!4502 lt!376683) (_1!5086 lt!376677) (_2!5086 lt!376677)))))

(assert (=> d!105359 (= (+!1980 lt!376683 lt!376677) lt!376829)))

(declare-fun b!830360 () Bool)

(declare-fun res!565528 () Bool)

(assert (=> b!830360 (=> (not res!565528) (not e!462962))))

(assert (=> b!830360 (= res!565528 (= (getValueByKey!415 (toList!4502 lt!376829) (_1!5086 lt!376677)) (Some!420 (_2!5086 lt!376677))))))

(declare-fun b!830361 () Bool)

(assert (=> b!830361 (= e!462962 (contains!4209 (toList!4502 lt!376829) lt!376677))))

(assert (= (and d!105359 res!565529) b!830360))

(assert (= (and b!830360 res!565528) b!830361))

(declare-fun m!773491 () Bool)

(assert (=> d!105359 m!773491))

(declare-fun m!773493 () Bool)

(assert (=> d!105359 m!773493))

(declare-fun m!773495 () Bool)

(assert (=> d!105359 m!773495))

(declare-fun m!773497 () Bool)

(assert (=> d!105359 m!773497))

(declare-fun m!773499 () Bool)

(assert (=> b!830360 m!773499))

(declare-fun m!773501 () Bool)

(assert (=> b!830361 m!773501))

(assert (=> b!830204 d!105359))

(declare-fun d!105361 () Bool)

(declare-fun e!462963 () Bool)

(assert (=> d!105361 e!462963))

(declare-fun res!565531 () Bool)

(assert (=> d!105361 (=> (not res!565531) (not e!462963))))

(declare-fun lt!376833 () ListLongMap!8973)

(assert (=> d!105361 (= res!565531 (contains!4208 lt!376833 (_1!5086 lt!376677)))))

(declare-fun lt!376830 () List!15945)

(assert (=> d!105361 (= lt!376833 (ListLongMap!8974 lt!376830))))

(declare-fun lt!376832 () Unit!28429)

(declare-fun lt!376831 () Unit!28429)

(assert (=> d!105361 (= lt!376832 lt!376831)))

(assert (=> d!105361 (= (getValueByKey!415 lt!376830 (_1!5086 lt!376677)) (Some!420 (_2!5086 lt!376677)))))

(assert (=> d!105361 (= lt!376831 (lemmaContainsTupThenGetReturnValue!229 lt!376830 (_1!5086 lt!376677) (_2!5086 lt!376677)))))

(assert (=> d!105361 (= lt!376830 (insertStrictlySorted!268 (toList!4502 (+!1980 lt!376683 lt!376679)) (_1!5086 lt!376677) (_2!5086 lt!376677)))))

(assert (=> d!105361 (= (+!1980 (+!1980 lt!376683 lt!376679) lt!376677) lt!376833)))

(declare-fun b!830362 () Bool)

(declare-fun res!565530 () Bool)

(assert (=> b!830362 (=> (not res!565530) (not e!462963))))

(assert (=> b!830362 (= res!565530 (= (getValueByKey!415 (toList!4502 lt!376833) (_1!5086 lt!376677)) (Some!420 (_2!5086 lt!376677))))))

(declare-fun b!830363 () Bool)

(assert (=> b!830363 (= e!462963 (contains!4209 (toList!4502 lt!376833) lt!376677))))

(assert (= (and d!105361 res!565531) b!830362))

(assert (= (and b!830362 res!565530) b!830363))

(declare-fun m!773503 () Bool)

(assert (=> d!105361 m!773503))

(declare-fun m!773505 () Bool)

(assert (=> d!105361 m!773505))

(declare-fun m!773507 () Bool)

(assert (=> d!105361 m!773507))

(declare-fun m!773509 () Bool)

(assert (=> d!105361 m!773509))

(declare-fun m!773511 () Bool)

(assert (=> b!830362 m!773511))

(declare-fun m!773513 () Bool)

(assert (=> b!830363 m!773513))

(assert (=> b!830204 d!105361))

(declare-fun d!105363 () Bool)

(assert (=> d!105363 (= (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376836 () Unit!28429)

(declare-fun choose!1416 (array!46584 array!46586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25277 V!25277 V!25277 V!25277 (_ BitVec 32) Int) Unit!28429)

(assert (=> d!105363 (= lt!376836 (choose!1416 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105363 (validMask!0 mask!1312)))

(assert (=> d!105363 (= (lemmaNoChangeToArrayThenSameMapNoExtras!589 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376836)))

(declare-fun bs!23184 () Bool)

(assert (= bs!23184 d!105363))

(assert (=> bs!23184 m!773273))

(assert (=> bs!23184 m!773271))

(declare-fun m!773515 () Bool)

(assert (=> bs!23184 m!773515))

(assert (=> bs!23184 m!773289))

(assert (=> b!830206 d!105363))

(declare-fun b!830388 () Bool)

(assert (=> b!830388 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(assert (=> b!830388 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22750 _values!788)))))

(declare-fun lt!376856 () ListLongMap!8973)

(declare-fun e!462978 () Bool)

(assert (=> b!830388 (= e!462978 (= (apply!372 lt!376856 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830389 () Bool)

(declare-fun lt!376857 () Unit!28429)

(declare-fun lt!376851 () Unit!28429)

(assert (=> b!830389 (= lt!376857 lt!376851)))

(declare-fun lt!376852 () V!25277)

(declare-fun lt!376854 () (_ BitVec 64))

(declare-fun lt!376855 () ListLongMap!8973)

(declare-fun lt!376853 () (_ BitVec 64))

(assert (=> b!830389 (not (contains!4208 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852)) lt!376853))))

(declare-fun addStillNotContains!197 (ListLongMap!8973 (_ BitVec 64) V!25277 (_ BitVec 64)) Unit!28429)

(assert (=> b!830389 (= lt!376851 (addStillNotContains!197 lt!376855 lt!376854 lt!376852 lt!376853))))

(assert (=> b!830389 (= lt!376853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830389 (= lt!376852 (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830389 (= lt!376854 (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!36259 () ListLongMap!8973)

(assert (=> b!830389 (= lt!376855 call!36259)))

(declare-fun e!462984 () ListLongMap!8973)

(assert (=> b!830389 (= e!462984 (+!1980 call!36259 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830390 () Bool)

(declare-fun e!462979 () Bool)

(declare-fun e!462980 () Bool)

(assert (=> b!830390 (= e!462979 e!462980)))

(declare-fun c!89908 () Bool)

(declare-fun e!462982 () Bool)

(assert (=> b!830390 (= c!89908 e!462982)))

(declare-fun res!565542 () Bool)

(assert (=> b!830390 (=> (not res!565542) (not e!462982))))

(assert (=> b!830390 (= res!565542 (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(declare-fun b!830391 () Bool)

(declare-fun e!462983 () ListLongMap!8973)

(assert (=> b!830391 (= e!462983 (ListLongMap!8974 Nil!15942))))

(declare-fun b!830392 () Bool)

(declare-fun res!565540 () Bool)

(assert (=> b!830392 (=> (not res!565540) (not e!462979))))

(assert (=> b!830392 (= res!565540 (not (contains!4208 lt!376856 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830393 () Bool)

(declare-fun e!462981 () Bool)

(declare-fun isEmpty!654 (ListLongMap!8973) Bool)

(assert (=> b!830393 (= e!462981 (isEmpty!654 lt!376856))))

(declare-fun d!105365 () Bool)

(assert (=> d!105365 e!462979))

(declare-fun res!565541 () Bool)

(assert (=> d!105365 (=> (not res!565541) (not e!462979))))

(assert (=> d!105365 (= res!565541 (not (contains!4208 lt!376856 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105365 (= lt!376856 e!462983)))

(declare-fun c!89906 () Bool)

(assert (=> d!105365 (= c!89906 (bvsge #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(assert (=> d!105365 (validMask!0 mask!1312)))

(assert (=> d!105365 (= (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376856)))

(declare-fun b!830394 () Bool)

(assert (=> b!830394 (= e!462980 e!462978)))

(assert (=> b!830394 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(declare-fun res!565543 () Bool)

(assert (=> b!830394 (= res!565543 (contains!4208 lt!376856 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830394 (=> (not res!565543) (not e!462978))))

(declare-fun b!830395 () Bool)

(assert (=> b!830395 (= e!462984 call!36259)))

(declare-fun b!830396 () Bool)

(assert (=> b!830396 (= e!462981 (= lt!376856 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!36256 () Bool)

(assert (=> bm!36256 (= call!36259 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830397 () Bool)

(assert (=> b!830397 (= e!462980 e!462981)))

(declare-fun c!89907 () Bool)

(assert (=> b!830397 (= c!89907 (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(declare-fun b!830398 () Bool)

(assert (=> b!830398 (= e!462982 (validKeyInArray!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830398 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!830399 () Bool)

(assert (=> b!830399 (= e!462983 e!462984)))

(declare-fun c!89905 () Bool)

(assert (=> b!830399 (= c!89905 (validKeyInArray!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105365 c!89906) b!830391))

(assert (= (and d!105365 (not c!89906)) b!830399))

(assert (= (and b!830399 c!89905) b!830389))

(assert (= (and b!830399 (not c!89905)) b!830395))

(assert (= (or b!830389 b!830395) bm!36256))

(assert (= (and d!105365 res!565541) b!830392))

(assert (= (and b!830392 res!565540) b!830390))

(assert (= (and b!830390 res!565542) b!830398))

(assert (= (and b!830390 c!89908) b!830394))

(assert (= (and b!830390 (not c!89908)) b!830397))

(assert (= (and b!830394 res!565543) b!830388))

(assert (= (and b!830397 c!89907) b!830396))

(assert (= (and b!830397 (not c!89907)) b!830393))

(declare-fun b_lambda!11351 () Bool)

(assert (=> (not b_lambda!11351) (not b!830388)))

(assert (=> b!830388 t!22314))

(declare-fun b_and!22535 () Bool)

(assert (= b_and!22533 (and (=> t!22314 result!8015) b_and!22535)))

(declare-fun b_lambda!11353 () Bool)

(assert (=> (not b_lambda!11353) (not b!830389)))

(assert (=> b!830389 t!22314))

(declare-fun b_and!22537 () Bool)

(assert (= b_and!22535 (and (=> t!22314 result!8015) b_and!22537)))

(declare-fun m!773517 () Bool)

(assert (=> bm!36256 m!773517))

(assert (=> b!830388 m!773435))

(assert (=> b!830388 m!773435))

(assert (=> b!830388 m!773433))

(assert (=> b!830388 m!773437))

(assert (=> b!830388 m!773433))

(assert (=> b!830388 m!773353))

(declare-fun m!773519 () Bool)

(assert (=> b!830388 m!773519))

(assert (=> b!830388 m!773353))

(declare-fun m!773521 () Bool)

(assert (=> b!830393 m!773521))

(assert (=> b!830394 m!773353))

(assert (=> b!830394 m!773353))

(declare-fun m!773523 () Bool)

(assert (=> b!830394 m!773523))

(assert (=> b!830399 m!773353))

(assert (=> b!830399 m!773353))

(assert (=> b!830399 m!773355))

(assert (=> b!830389 m!773435))

(declare-fun m!773525 () Bool)

(assert (=> b!830389 m!773525))

(assert (=> b!830389 m!773433))

(declare-fun m!773527 () Bool)

(assert (=> b!830389 m!773527))

(assert (=> b!830389 m!773435))

(assert (=> b!830389 m!773433))

(assert (=> b!830389 m!773437))

(assert (=> b!830389 m!773525))

(declare-fun m!773529 () Bool)

(assert (=> b!830389 m!773529))

(declare-fun m!773531 () Bool)

(assert (=> b!830389 m!773531))

(assert (=> b!830389 m!773353))

(declare-fun m!773533 () Bool)

(assert (=> b!830392 m!773533))

(assert (=> b!830398 m!773353))

(assert (=> b!830398 m!773353))

(assert (=> b!830398 m!773355))

(assert (=> b!830396 m!773517))

(declare-fun m!773535 () Bool)

(assert (=> d!105365 m!773535))

(assert (=> d!105365 m!773289))

(assert (=> b!830206 d!105365))

(declare-fun b!830400 () Bool)

(assert (=> b!830400 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(assert (=> b!830400 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22750 _values!788)))))

(declare-fun lt!376863 () ListLongMap!8973)

(declare-fun e!462985 () Bool)

(assert (=> b!830400 (= e!462985 (= (apply!372 lt!376863 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830401 () Bool)

(declare-fun lt!376864 () Unit!28429)

(declare-fun lt!376858 () Unit!28429)

(assert (=> b!830401 (= lt!376864 lt!376858)))

(declare-fun lt!376860 () (_ BitVec 64))

(declare-fun lt!376861 () (_ BitVec 64))

(declare-fun lt!376859 () V!25277)

(declare-fun lt!376862 () ListLongMap!8973)

(assert (=> b!830401 (not (contains!4208 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859)) lt!376860))))

(assert (=> b!830401 (= lt!376858 (addStillNotContains!197 lt!376862 lt!376861 lt!376859 lt!376860))))

(assert (=> b!830401 (= lt!376860 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830401 (= lt!376859 (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830401 (= lt!376861 (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!36260 () ListLongMap!8973)

(assert (=> b!830401 (= lt!376862 call!36260)))

(declare-fun e!462991 () ListLongMap!8973)

(assert (=> b!830401 (= e!462991 (+!1980 call!36260 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830402 () Bool)

(declare-fun e!462986 () Bool)

(declare-fun e!462987 () Bool)

(assert (=> b!830402 (= e!462986 e!462987)))

(declare-fun c!89912 () Bool)

(declare-fun e!462989 () Bool)

(assert (=> b!830402 (= c!89912 e!462989)))

(declare-fun res!565546 () Bool)

(assert (=> b!830402 (=> (not res!565546) (not e!462989))))

(assert (=> b!830402 (= res!565546 (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(declare-fun b!830403 () Bool)

(declare-fun e!462990 () ListLongMap!8973)

(assert (=> b!830403 (= e!462990 (ListLongMap!8974 Nil!15942))))

(declare-fun b!830404 () Bool)

(declare-fun res!565544 () Bool)

(assert (=> b!830404 (=> (not res!565544) (not e!462986))))

(assert (=> b!830404 (= res!565544 (not (contains!4208 lt!376863 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830405 () Bool)

(declare-fun e!462988 () Bool)

(assert (=> b!830405 (= e!462988 (isEmpty!654 lt!376863))))

(declare-fun d!105367 () Bool)

(assert (=> d!105367 e!462986))

(declare-fun res!565545 () Bool)

(assert (=> d!105367 (=> (not res!565545) (not e!462986))))

(assert (=> d!105367 (= res!565545 (not (contains!4208 lt!376863 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105367 (= lt!376863 e!462990)))

(declare-fun c!89910 () Bool)

(assert (=> d!105367 (= c!89910 (bvsge #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(assert (=> d!105367 (validMask!0 mask!1312)))

(assert (=> d!105367 (= (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376863)))

(declare-fun b!830406 () Bool)

(assert (=> b!830406 (= e!462987 e!462985)))

(assert (=> b!830406 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(declare-fun res!565547 () Bool)

(assert (=> b!830406 (= res!565547 (contains!4208 lt!376863 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830406 (=> (not res!565547) (not e!462985))))

(declare-fun b!830407 () Bool)

(assert (=> b!830407 (= e!462991 call!36260)))

(declare-fun b!830408 () Bool)

(assert (=> b!830408 (= e!462988 (= lt!376863 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!36257 () Bool)

(assert (=> bm!36257 (= call!36260 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830409 () Bool)

(assert (=> b!830409 (= e!462987 e!462988)))

(declare-fun c!89911 () Bool)

(assert (=> b!830409 (= c!89911 (bvslt #b00000000000000000000000000000000 (size!22749 _keys!976)))))

(declare-fun b!830410 () Bool)

(assert (=> b!830410 (= e!462989 (validKeyInArray!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830410 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!830411 () Bool)

(assert (=> b!830411 (= e!462990 e!462991)))

(declare-fun c!89909 () Bool)

(assert (=> b!830411 (= c!89909 (validKeyInArray!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105367 c!89910) b!830403))

(assert (= (and d!105367 (not c!89910)) b!830411))

(assert (= (and b!830411 c!89909) b!830401))

(assert (= (and b!830411 (not c!89909)) b!830407))

(assert (= (or b!830401 b!830407) bm!36257))

(assert (= (and d!105367 res!565545) b!830404))

(assert (= (and b!830404 res!565544) b!830402))

(assert (= (and b!830402 res!565546) b!830410))

(assert (= (and b!830402 c!89912) b!830406))

(assert (= (and b!830402 (not c!89912)) b!830409))

(assert (= (and b!830406 res!565547) b!830400))

(assert (= (and b!830409 c!89911) b!830408))

(assert (= (and b!830409 (not c!89911)) b!830405))

(declare-fun b_lambda!11355 () Bool)

(assert (=> (not b_lambda!11355) (not b!830400)))

(assert (=> b!830400 t!22314))

(declare-fun b_and!22539 () Bool)

(assert (= b_and!22537 (and (=> t!22314 result!8015) b_and!22539)))

(declare-fun b_lambda!11357 () Bool)

(assert (=> (not b_lambda!11357) (not b!830401)))

(assert (=> b!830401 t!22314))

(declare-fun b_and!22541 () Bool)

(assert (= b_and!22539 (and (=> t!22314 result!8015) b_and!22541)))

(declare-fun m!773537 () Bool)

(assert (=> bm!36257 m!773537))

(assert (=> b!830400 m!773435))

(assert (=> b!830400 m!773435))

(assert (=> b!830400 m!773433))

(assert (=> b!830400 m!773437))

(assert (=> b!830400 m!773433))

(assert (=> b!830400 m!773353))

(declare-fun m!773539 () Bool)

(assert (=> b!830400 m!773539))

(assert (=> b!830400 m!773353))

(declare-fun m!773541 () Bool)

(assert (=> b!830405 m!773541))

(assert (=> b!830406 m!773353))

(assert (=> b!830406 m!773353))

(declare-fun m!773543 () Bool)

(assert (=> b!830406 m!773543))

(assert (=> b!830411 m!773353))

(assert (=> b!830411 m!773353))

(assert (=> b!830411 m!773355))

(assert (=> b!830401 m!773435))

(declare-fun m!773545 () Bool)

(assert (=> b!830401 m!773545))

(assert (=> b!830401 m!773433))

(declare-fun m!773547 () Bool)

(assert (=> b!830401 m!773547))

(assert (=> b!830401 m!773435))

(assert (=> b!830401 m!773433))

(assert (=> b!830401 m!773437))

(assert (=> b!830401 m!773545))

(declare-fun m!773549 () Bool)

(assert (=> b!830401 m!773549))

(declare-fun m!773551 () Bool)

(assert (=> b!830401 m!773551))

(assert (=> b!830401 m!773353))

(declare-fun m!773553 () Bool)

(assert (=> b!830404 m!773553))

(assert (=> b!830410 m!773353))

(assert (=> b!830410 m!773353))

(assert (=> b!830410 m!773355))

(assert (=> b!830408 m!773537))

(declare-fun m!773555 () Bool)

(assert (=> d!105367 m!773555))

(assert (=> d!105367 m!773289))

(assert (=> b!830206 d!105367))

(declare-fun b!830418 () Bool)

(declare-fun e!462997 () Bool)

(assert (=> b!830418 (= e!462997 tp_is_empty!15207)))

(declare-fun mapIsEmpty!24469 () Bool)

(declare-fun mapRes!24469 () Bool)

(assert (=> mapIsEmpty!24469 mapRes!24469))

(declare-fun b!830419 () Bool)

(declare-fun e!462996 () Bool)

(assert (=> b!830419 (= e!462996 tp_is_empty!15207)))

(declare-fun condMapEmpty!24469 () Bool)

(declare-fun mapDefault!24469 () ValueCell!7188)

(assert (=> mapNonEmpty!24463 (= condMapEmpty!24469 (= mapRest!24463 ((as const (Array (_ BitVec 32) ValueCell!7188)) mapDefault!24469)))))

(assert (=> mapNonEmpty!24463 (= tp!47278 (and e!462996 mapRes!24469))))

(declare-fun mapNonEmpty!24469 () Bool)

(declare-fun tp!47287 () Bool)

(assert (=> mapNonEmpty!24469 (= mapRes!24469 (and tp!47287 e!462997))))

(declare-fun mapValue!24469 () ValueCell!7188)

(declare-fun mapRest!24469 () (Array (_ BitVec 32) ValueCell!7188))

(declare-fun mapKey!24469 () (_ BitVec 32))

(assert (=> mapNonEmpty!24469 (= mapRest!24463 (store mapRest!24469 mapKey!24469 mapValue!24469))))

(assert (= (and mapNonEmpty!24463 condMapEmpty!24469) mapIsEmpty!24469))

(assert (= (and mapNonEmpty!24463 (not condMapEmpty!24469)) mapNonEmpty!24469))

(assert (= (and mapNonEmpty!24469 ((_ is ValueCellFull!7188) mapValue!24469)) b!830418))

(assert (= (and mapNonEmpty!24463 ((_ is ValueCellFull!7188) mapDefault!24469)) b!830419))

(declare-fun m!773557 () Bool)

(assert (=> mapNonEmpty!24469 m!773557))

(declare-fun b_lambda!11359 () Bool)

(assert (= b_lambda!11349 (or (and start!71488 b_free!13497) b_lambda!11359)))

(declare-fun b_lambda!11361 () Bool)

(assert (= b_lambda!11347 (or (and start!71488 b_free!13497) b_lambda!11361)))

(declare-fun b_lambda!11363 () Bool)

(assert (= b_lambda!11351 (or (and start!71488 b_free!13497) b_lambda!11363)))

(declare-fun b_lambda!11365 () Bool)

(assert (= b_lambda!11357 (or (and start!71488 b_free!13497) b_lambda!11365)))

(declare-fun b_lambda!11367 () Bool)

(assert (= b_lambda!11355 (or (and start!71488 b_free!13497) b_lambda!11367)))

(declare-fun b_lambda!11369 () Bool)

(assert (= b_lambda!11353 (or (and start!71488 b_free!13497) b_lambda!11369)))

(check-sat (not b!830401) (not b_lambda!11369) (not bm!36225) (not b_lambda!11365) (not b_lambda!11359) (not b!830330) (not b!830389) (not b!830272) (not b!830392) (not d!105353) (not bm!36250) (not b!830362) (not b!830271) (not b!830333) (not b!830355) (not b!830239) (not b!830267) (not bm!36257) (not bm!36245) (not b!830399) (not b!830363) (not b!830253) (not b!830353) (not b!830268) (not b!830408) (not b!830341) (not b!830318) (not d!105359) (not b!830351) (not b!830388) (not b!830411) tp_is_empty!15207 (not b_next!13497) (not bm!36252) (not b!830405) (not b!830410) (not d!105363) (not b_lambda!11367) (not bm!36256) (not d!105351) (not b!830255) (not b!830404) (not b!830270) (not b!830400) (not b_lambda!11361) (not b!830317) (not b!830326) (not b_lambda!11363) (not b!830361) (not b!830273) (not d!105367) (not b!830240) (not b!830396) (not b!830332) b_and!22541 (not b!830256) (not d!105361) (not bm!36222) (not b!830398) (not b!830242) (not b!830241) (not bm!36253) (not b!830360) (not bm!36243) (not bm!36251) (not b!830340) (not bm!36244) (not b!830328) (not b!830316) (not b!830406) (not d!105339) (not d!105365) (not mapNonEmpty!24469) (not bm!36246) (not b!830349) (not d!105357) (not b!830393) (not b!830339) (not d!105337) (not b!830394) (not d!105355) (not b!830356))
(check-sat b_and!22541 (not b_next!13497))
(get-model)

(declare-fun d!105369 () Bool)

(declare-fun e!462998 () Bool)

(assert (=> d!105369 e!462998))

(declare-fun res!565549 () Bool)

(assert (=> d!105369 (=> (not res!565549) (not e!462998))))

(declare-fun lt!376868 () ListLongMap!8973)

(assert (=> d!105369 (= res!565549 (contains!4208 lt!376868 (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!376865 () List!15945)

(assert (=> d!105369 (= lt!376868 (ListLongMap!8974 lt!376865))))

(declare-fun lt!376867 () Unit!28429)

(declare-fun lt!376866 () Unit!28429)

(assert (=> d!105369 (= lt!376867 lt!376866)))

(assert (=> d!105369 (= (getValueByKey!415 lt!376865 (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!420 (_2!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105369 (= lt!376866 (lemmaContainsTupThenGetReturnValue!229 lt!376865 (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105369 (= lt!376865 (insertStrictlySorted!268 (toList!4502 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251))) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105369 (= (+!1980 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251)) (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!376868)))

(declare-fun b!830420 () Bool)

(declare-fun res!565548 () Bool)

(assert (=> b!830420 (=> (not res!565548) (not e!462998))))

(assert (=> b!830420 (= res!565548 (= (getValueByKey!415 (toList!4502 lt!376868) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!420 (_2!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!830421 () Bool)

(assert (=> b!830421 (= e!462998 (contains!4209 (toList!4502 lt!376868) (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!105369 res!565549) b!830420))

(assert (= (and b!830420 res!565548) b!830421))

(declare-fun m!773559 () Bool)

(assert (=> d!105369 m!773559))

(declare-fun m!773561 () Bool)

(assert (=> d!105369 m!773561))

(declare-fun m!773563 () Bool)

(assert (=> d!105369 m!773563))

(declare-fun m!773565 () Bool)

(assert (=> d!105369 m!773565))

(declare-fun m!773567 () Bool)

(assert (=> b!830420 m!773567))

(declare-fun m!773569 () Bool)

(assert (=> b!830421 m!773569))

(assert (=> bm!36253 d!105369))

(declare-fun d!105371 () Bool)

(declare-fun lt!376871 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!386 (List!15945) (InoxSet tuple2!10150))

(assert (=> d!105371 (= lt!376871 (select (content!386 (toList!4502 lt!376829)) lt!376677))))

(declare-fun e!463004 () Bool)

(assert (=> d!105371 (= lt!376871 e!463004)))

(declare-fun res!565554 () Bool)

(assert (=> d!105371 (=> (not res!565554) (not e!463004))))

(assert (=> d!105371 (= res!565554 ((_ is Cons!15941) (toList!4502 lt!376829)))))

(assert (=> d!105371 (= (contains!4209 (toList!4502 lt!376829) lt!376677) lt!376871)))

(declare-fun b!830426 () Bool)

(declare-fun e!463003 () Bool)

(assert (=> b!830426 (= e!463004 e!463003)))

(declare-fun res!565555 () Bool)

(assert (=> b!830426 (=> res!565555 e!463003)))

(assert (=> b!830426 (= res!565555 (= (h!17070 (toList!4502 lt!376829)) lt!376677))))

(declare-fun b!830427 () Bool)

(assert (=> b!830427 (= e!463003 (contains!4209 (t!22310 (toList!4502 lt!376829)) lt!376677))))

(assert (= (and d!105371 res!565554) b!830426))

(assert (= (and b!830426 (not res!565555)) b!830427))

(declare-fun m!773571 () Bool)

(assert (=> d!105371 m!773571))

(declare-fun m!773573 () Bool)

(assert (=> d!105371 m!773573))

(declare-fun m!773575 () Bool)

(assert (=> b!830427 m!773575))

(assert (=> b!830361 d!105371))

(declare-fun d!105373 () Bool)

(declare-fun e!463009 () Bool)

(assert (=> d!105373 e!463009))

(declare-fun res!565558 () Bool)

(assert (=> d!105373 (=> res!565558 e!463009)))

(declare-fun lt!376880 () Bool)

(assert (=> d!105373 (= res!565558 (not lt!376880))))

(declare-fun lt!376882 () Bool)

(assert (=> d!105373 (= lt!376880 lt!376882)))

(declare-fun lt!376881 () Unit!28429)

(declare-fun e!463010 () Unit!28429)

(assert (=> d!105373 (= lt!376881 e!463010)))

(declare-fun c!89915 () Bool)

(assert (=> d!105373 (= c!89915 lt!376882)))

(declare-fun containsKey!401 (List!15945 (_ BitVec 64)) Bool)

(assert (=> d!105373 (= lt!376882 (containsKey!401 (toList!4502 lt!376863) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105373 (= (contains!4208 lt!376863 #b1000000000000000000000000000000000000000000000000000000000000000) lt!376880)))

(declare-fun b!830434 () Bool)

(declare-fun lt!376883 () Unit!28429)

(assert (=> b!830434 (= e!463010 lt!376883)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!310 (List!15945 (_ BitVec 64)) Unit!28429)

(assert (=> b!830434 (= lt!376883 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376863) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!311 (Option!421) Bool)

(assert (=> b!830434 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376863) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830435 () Bool)

(declare-fun Unit!28435 () Unit!28429)

(assert (=> b!830435 (= e!463010 Unit!28435)))

(declare-fun b!830436 () Bool)

(assert (=> b!830436 (= e!463009 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376863) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105373 c!89915) b!830434))

(assert (= (and d!105373 (not c!89915)) b!830435))

(assert (= (and d!105373 (not res!565558)) b!830436))

(declare-fun m!773577 () Bool)

(assert (=> d!105373 m!773577))

(declare-fun m!773579 () Bool)

(assert (=> b!830434 m!773579))

(declare-fun m!773581 () Bool)

(assert (=> b!830434 m!773581))

(assert (=> b!830434 m!773581))

(declare-fun m!773583 () Bool)

(assert (=> b!830434 m!773583))

(assert (=> b!830436 m!773581))

(assert (=> b!830436 m!773581))

(assert (=> b!830436 m!773583))

(assert (=> b!830404 d!105373))

(declare-fun d!105375 () Bool)

(declare-fun isEmpty!655 (List!15945) Bool)

(assert (=> d!105375 (= (isEmpty!654 lt!376856) (isEmpty!655 (toList!4502 lt!376856)))))

(declare-fun bs!23185 () Bool)

(assert (= bs!23185 d!105375))

(declare-fun m!773585 () Bool)

(assert (=> bs!23185 m!773585))

(assert (=> b!830393 d!105375))

(declare-fun d!105377 () Bool)

(declare-fun e!463011 () Bool)

(assert (=> d!105377 e!463011))

(declare-fun res!565559 () Bool)

(assert (=> d!105377 (=> res!565559 e!463011)))

(declare-fun lt!376884 () Bool)

(assert (=> d!105377 (= res!565559 (not lt!376884))))

(declare-fun lt!376886 () Bool)

(assert (=> d!105377 (= lt!376884 lt!376886)))

(declare-fun lt!376885 () Unit!28429)

(declare-fun e!463012 () Unit!28429)

(assert (=> d!105377 (= lt!376885 e!463012)))

(declare-fun c!89916 () Bool)

(assert (=> d!105377 (= c!89916 lt!376886)))

(assert (=> d!105377 (= lt!376886 (containsKey!401 (toList!4502 lt!376817) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!105377 (= (contains!4208 lt!376817 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) lt!376884)))

(declare-fun b!830437 () Bool)

(declare-fun lt!376887 () Unit!28429)

(assert (=> b!830437 (= e!463012 lt!376887)))

(assert (=> b!830437 (= lt!376887 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376817) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830437 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376817) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830438 () Bool)

(declare-fun Unit!28436 () Unit!28429)

(assert (=> b!830438 (= e!463012 Unit!28436)))

(declare-fun b!830439 () Bool)

(assert (=> b!830439 (= e!463011 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376817) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!105377 c!89916) b!830437))

(assert (= (and d!105377 (not c!89916)) b!830438))

(assert (= (and d!105377 (not res!565559)) b!830439))

(assert (=> d!105377 m!773353))

(declare-fun m!773587 () Bool)

(assert (=> d!105377 m!773587))

(assert (=> b!830437 m!773353))

(declare-fun m!773589 () Bool)

(assert (=> b!830437 m!773589))

(assert (=> b!830437 m!773353))

(declare-fun m!773591 () Bool)

(assert (=> b!830437 m!773591))

(assert (=> b!830437 m!773591))

(declare-fun m!773593 () Bool)

(assert (=> b!830437 m!773593))

(assert (=> b!830439 m!773353))

(assert (=> b!830439 m!773591))

(assert (=> b!830439 m!773591))

(assert (=> b!830439 m!773593))

(assert (=> b!830340 d!105377))

(declare-fun d!105379 () Bool)

(assert (=> d!105379 (= (validKeyInArray!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) (and (not (= (select (arr!22328 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!22328 _keys!976) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830253 d!105379))

(declare-fun d!105381 () Bool)

(declare-fun lt!376888 () Bool)

(assert (=> d!105381 (= lt!376888 (select (content!386 (toList!4502 lt!376833)) lt!376677))))

(declare-fun e!463014 () Bool)

(assert (=> d!105381 (= lt!376888 e!463014)))

(declare-fun res!565560 () Bool)

(assert (=> d!105381 (=> (not res!565560) (not e!463014))))

(assert (=> d!105381 (= res!565560 ((_ is Cons!15941) (toList!4502 lt!376833)))))

(assert (=> d!105381 (= (contains!4209 (toList!4502 lt!376833) lt!376677) lt!376888)))

(declare-fun b!830440 () Bool)

(declare-fun e!463013 () Bool)

(assert (=> b!830440 (= e!463014 e!463013)))

(declare-fun res!565561 () Bool)

(assert (=> b!830440 (=> res!565561 e!463013)))

(assert (=> b!830440 (= res!565561 (= (h!17070 (toList!4502 lt!376833)) lt!376677))))

(declare-fun b!830441 () Bool)

(assert (=> b!830441 (= e!463013 (contains!4209 (t!22310 (toList!4502 lt!376833)) lt!376677))))

(assert (= (and d!105381 res!565560) b!830440))

(assert (= (and b!830440 (not res!565561)) b!830441))

(declare-fun m!773595 () Bool)

(assert (=> d!105381 m!773595))

(declare-fun m!773597 () Bool)

(assert (=> d!105381 m!773597))

(declare-fun m!773599 () Bool)

(assert (=> b!830441 m!773599))

(assert (=> b!830363 d!105381))

(declare-fun d!105383 () Bool)

(declare-fun e!463015 () Bool)

(assert (=> d!105383 e!463015))

(declare-fun res!565562 () Bool)

(assert (=> d!105383 (=> res!565562 e!463015)))

(declare-fun lt!376889 () Bool)

(assert (=> d!105383 (= res!565562 (not lt!376889))))

(declare-fun lt!376891 () Bool)

(assert (=> d!105383 (= lt!376889 lt!376891)))

(declare-fun lt!376890 () Unit!28429)

(declare-fun e!463016 () Unit!28429)

(assert (=> d!105383 (= lt!376890 e!463016)))

(declare-fun c!89917 () Bool)

(assert (=> d!105383 (= c!89917 lt!376891)))

(assert (=> d!105383 (= lt!376891 (containsKey!401 (toList!4502 lt!376795) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105383 (= (contains!4208 lt!376795 #b0000000000000000000000000000000000000000000000000000000000000000) lt!376889)))

(declare-fun b!830442 () Bool)

(declare-fun lt!376892 () Unit!28429)

(assert (=> b!830442 (= e!463016 lt!376892)))

(assert (=> b!830442 (= lt!376892 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376795) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830442 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376795) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830443 () Bool)

(declare-fun Unit!28437 () Unit!28429)

(assert (=> b!830443 (= e!463016 Unit!28437)))

(declare-fun b!830444 () Bool)

(assert (=> b!830444 (= e!463015 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376795) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105383 c!89917) b!830442))

(assert (= (and d!105383 (not c!89917)) b!830443))

(assert (= (and d!105383 (not res!565562)) b!830444))

(declare-fun m!773601 () Bool)

(assert (=> d!105383 m!773601))

(declare-fun m!773603 () Bool)

(assert (=> b!830442 m!773603))

(declare-fun m!773605 () Bool)

(assert (=> b!830442 m!773605))

(assert (=> b!830442 m!773605))

(declare-fun m!773607 () Bool)

(assert (=> b!830442 m!773607))

(assert (=> b!830444 m!773605))

(assert (=> b!830444 m!773605))

(assert (=> b!830444 m!773607))

(assert (=> bm!36243 d!105383))

(declare-fun d!105385 () Bool)

(declare-fun e!463017 () Bool)

(assert (=> d!105385 e!463017))

(declare-fun res!565563 () Bool)

(assert (=> d!105385 (=> res!565563 e!463017)))

(declare-fun lt!376893 () Bool)

(assert (=> d!105385 (= res!565563 (not lt!376893))))

(declare-fun lt!376895 () Bool)

(assert (=> d!105385 (= lt!376893 lt!376895)))

(declare-fun lt!376894 () Unit!28429)

(declare-fun e!463018 () Unit!28429)

(assert (=> d!105385 (= lt!376894 e!463018)))

(declare-fun c!89918 () Bool)

(assert (=> d!105385 (= c!89918 lt!376895)))

(assert (=> d!105385 (= lt!376895 (containsKey!401 (toList!4502 lt!376863) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!105385 (= (contains!4208 lt!376863 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) lt!376893)))

(declare-fun b!830445 () Bool)

(declare-fun lt!376896 () Unit!28429)

(assert (=> b!830445 (= e!463018 lt!376896)))

(assert (=> b!830445 (= lt!376896 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376863) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830445 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376863) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830446 () Bool)

(declare-fun Unit!28438 () Unit!28429)

(assert (=> b!830446 (= e!463018 Unit!28438)))

(declare-fun b!830447 () Bool)

(assert (=> b!830447 (= e!463017 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376863) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!105385 c!89918) b!830445))

(assert (= (and d!105385 (not c!89918)) b!830446))

(assert (= (and d!105385 (not res!565563)) b!830447))

(assert (=> d!105385 m!773353))

(declare-fun m!773609 () Bool)

(assert (=> d!105385 m!773609))

(assert (=> b!830445 m!773353))

(declare-fun m!773611 () Bool)

(assert (=> b!830445 m!773611))

(assert (=> b!830445 m!773353))

(declare-fun m!773613 () Bool)

(assert (=> b!830445 m!773613))

(assert (=> b!830445 m!773613))

(declare-fun m!773615 () Bool)

(assert (=> b!830445 m!773615))

(assert (=> b!830447 m!773353))

(assert (=> b!830447 m!773613))

(assert (=> b!830447 m!773613))

(assert (=> b!830447 m!773615))

(assert (=> b!830406 d!105385))

(declare-fun d!105387 () Bool)

(declare-fun e!463019 () Bool)

(assert (=> d!105387 e!463019))

(declare-fun res!565565 () Bool)

(assert (=> d!105387 (=> (not res!565565) (not e!463019))))

(declare-fun lt!376900 () ListLongMap!8973)

(assert (=> d!105387 (= res!565565 (contains!4208 lt!376900 (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!376897 () List!15945)

(assert (=> d!105387 (= lt!376900 (ListLongMap!8974 lt!376897))))

(declare-fun lt!376899 () Unit!28429)

(declare-fun lt!376898 () Unit!28429)

(assert (=> d!105387 (= lt!376899 lt!376898)))

(assert (=> d!105387 (= (getValueByKey!415 lt!376897 (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!420 (_2!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105387 (= lt!376898 (lemmaContainsTupThenGetReturnValue!229 lt!376897 (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105387 (= lt!376897 (insertStrictlySorted!268 (toList!4502 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244))) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105387 (= (+!1980 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244)) (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!376900)))

(declare-fun b!830448 () Bool)

(declare-fun res!565564 () Bool)

(assert (=> b!830448 (=> (not res!565564) (not e!463019))))

(assert (=> b!830448 (= res!565564 (= (getValueByKey!415 (toList!4502 lt!376900) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!420 (_2!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!830449 () Bool)

(assert (=> b!830449 (= e!463019 (contains!4209 (toList!4502 lt!376900) (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!105387 res!565565) b!830448))

(assert (= (and b!830448 res!565564) b!830449))

(declare-fun m!773617 () Bool)

(assert (=> d!105387 m!773617))

(declare-fun m!773619 () Bool)

(assert (=> d!105387 m!773619))

(declare-fun m!773621 () Bool)

(assert (=> d!105387 m!773621))

(declare-fun m!773623 () Bool)

(assert (=> d!105387 m!773623))

(declare-fun m!773625 () Bool)

(assert (=> b!830448 m!773625))

(declare-fun m!773627 () Bool)

(assert (=> b!830449 m!773627))

(assert (=> bm!36246 d!105387))

(declare-fun d!105389 () Bool)

(declare-fun e!463020 () Bool)

(assert (=> d!105389 e!463020))

(declare-fun res!565566 () Bool)

(assert (=> d!105389 (=> res!565566 e!463020)))

(declare-fun lt!376901 () Bool)

(assert (=> d!105389 (= res!565566 (not lt!376901))))

(declare-fun lt!376903 () Bool)

(assert (=> d!105389 (= lt!376901 lt!376903)))

(declare-fun lt!376902 () Unit!28429)

(declare-fun e!463021 () Unit!28429)

(assert (=> d!105389 (= lt!376902 e!463021)))

(declare-fun c!89919 () Bool)

(assert (=> d!105389 (= c!89919 lt!376903)))

(assert (=> d!105389 (= lt!376903 (containsKey!401 (toList!4502 lt!376795) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!105389 (= (contains!4208 lt!376795 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) lt!376901)))

(declare-fun b!830450 () Bool)

(declare-fun lt!376904 () Unit!28429)

(assert (=> b!830450 (= e!463021 lt!376904)))

(assert (=> b!830450 (= lt!376904 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376795) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830450 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376795) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830451 () Bool)

(declare-fun Unit!28439 () Unit!28429)

(assert (=> b!830451 (= e!463021 Unit!28439)))

(declare-fun b!830452 () Bool)

(assert (=> b!830452 (= e!463020 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376795) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!105389 c!89919) b!830450))

(assert (= (and d!105389 (not c!89919)) b!830451))

(assert (= (and d!105389 (not res!565566)) b!830452))

(assert (=> d!105389 m!773353))

(declare-fun m!773629 () Bool)

(assert (=> d!105389 m!773629))

(assert (=> b!830450 m!773353))

(declare-fun m!773631 () Bool)

(assert (=> b!830450 m!773631))

(assert (=> b!830450 m!773353))

(declare-fun m!773633 () Bool)

(assert (=> b!830450 m!773633))

(assert (=> b!830450 m!773633))

(declare-fun m!773635 () Bool)

(assert (=> b!830450 m!773635))

(assert (=> b!830452 m!773353))

(assert (=> b!830452 m!773633))

(assert (=> b!830452 m!773633))

(assert (=> b!830452 m!773635))

(assert (=> b!830317 d!105389))

(assert (=> b!830351 d!105379))

(declare-fun d!105391 () Bool)

(declare-fun lt!376905 () Bool)

(assert (=> d!105391 (= lt!376905 (select (content!386 (toList!4502 lt!376733)) lt!376679))))

(declare-fun e!463023 () Bool)

(assert (=> d!105391 (= lt!376905 e!463023)))

(declare-fun res!565567 () Bool)

(assert (=> d!105391 (=> (not res!565567) (not e!463023))))

(assert (=> d!105391 (= res!565567 ((_ is Cons!15941) (toList!4502 lt!376733)))))

(assert (=> d!105391 (= (contains!4209 (toList!4502 lt!376733) lt!376679) lt!376905)))

(declare-fun b!830453 () Bool)

(declare-fun e!463022 () Bool)

(assert (=> b!830453 (= e!463023 e!463022)))

(declare-fun res!565568 () Bool)

(assert (=> b!830453 (=> res!565568 e!463022)))

(assert (=> b!830453 (= res!565568 (= (h!17070 (toList!4502 lt!376733)) lt!376679))))

(declare-fun b!830454 () Bool)

(assert (=> b!830454 (= e!463022 (contains!4209 (t!22310 (toList!4502 lt!376733)) lt!376679))))

(assert (= (and d!105391 res!565567) b!830453))

(assert (= (and b!830453 (not res!565568)) b!830454))

(declare-fun m!773637 () Bool)

(assert (=> d!105391 m!773637))

(declare-fun m!773639 () Bool)

(assert (=> d!105391 m!773639))

(declare-fun m!773641 () Bool)

(assert (=> b!830454 m!773641))

(assert (=> b!830271 d!105391))

(assert (=> b!830267 d!105379))

(declare-fun d!105393 () Bool)

(declare-fun get!11818 (Option!421) V!25277)

(assert (=> d!105393 (= (apply!372 lt!376863 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) (get!11818 (getValueByKey!415 (toList!4502 lt!376863) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23186 () Bool)

(assert (= bs!23186 d!105393))

(assert (=> bs!23186 m!773353))

(assert (=> bs!23186 m!773613))

(assert (=> bs!23186 m!773613))

(declare-fun m!773643 () Bool)

(assert (=> bs!23186 m!773643))

(assert (=> b!830400 d!105393))

(declare-fun d!105395 () Bool)

(declare-fun c!89922 () Bool)

(assert (=> d!105395 (= c!89922 ((_ is ValueCellFull!7188) (select (arr!22329 _values!788) #b00000000000000000000000000000000)))))

(declare-fun e!463026 () V!25277)

(assert (=> d!105395 (= (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) e!463026)))

(declare-fun b!830459 () Bool)

(declare-fun get!11819 (ValueCell!7188 V!25277) V!25277)

(assert (=> b!830459 (= e!463026 (get!11819 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830460 () Bool)

(declare-fun get!11820 (ValueCell!7188 V!25277) V!25277)

(assert (=> b!830460 (= e!463026 (get!11820 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105395 c!89922) b!830459))

(assert (= (and d!105395 (not c!89922)) b!830460))

(assert (=> b!830459 m!773435))

(assert (=> b!830459 m!773433))

(declare-fun m!773645 () Bool)

(assert (=> b!830459 m!773645))

(assert (=> b!830460 m!773435))

(assert (=> b!830460 m!773433))

(declare-fun m!773647 () Bool)

(assert (=> b!830460 m!773647))

(assert (=> b!830400 d!105395))

(declare-fun d!105397 () Bool)

(declare-fun e!463027 () Bool)

(assert (=> d!105397 e!463027))

(declare-fun res!565570 () Bool)

(assert (=> d!105397 (=> (not res!565570) (not e!463027))))

(declare-fun lt!376909 () ListLongMap!8973)

(assert (=> d!105397 (= res!565570 (contains!4208 lt!376909 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!376906 () List!15945)

(assert (=> d!105397 (= lt!376909 (ListLongMap!8974 lt!376906))))

(declare-fun lt!376908 () Unit!28429)

(declare-fun lt!376907 () Unit!28429)

(assert (=> d!105397 (= lt!376908 lt!376907)))

(assert (=> d!105397 (= (getValueByKey!415 lt!376906 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!420 (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105397 (= lt!376907 (lemmaContainsTupThenGetReturnValue!229 lt!376906 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105397 (= lt!376906 (insertStrictlySorted!268 (toList!4502 call!36259) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105397 (= (+!1980 call!36259 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!376909)))

(declare-fun b!830461 () Bool)

(declare-fun res!565569 () Bool)

(assert (=> b!830461 (=> (not res!565569) (not e!463027))))

(assert (=> b!830461 (= res!565569 (= (getValueByKey!415 (toList!4502 lt!376909) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!420 (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!830462 () Bool)

(assert (=> b!830462 (= e!463027 (contains!4209 (toList!4502 lt!376909) (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105397 res!565570) b!830461))

(assert (= (and b!830461 res!565569) b!830462))

(declare-fun m!773649 () Bool)

(assert (=> d!105397 m!773649))

(declare-fun m!773651 () Bool)

(assert (=> d!105397 m!773651))

(declare-fun m!773653 () Bool)

(assert (=> d!105397 m!773653))

(declare-fun m!773655 () Bool)

(assert (=> d!105397 m!773655))

(declare-fun m!773657 () Bool)

(assert (=> b!830461 m!773657))

(declare-fun m!773659 () Bool)

(assert (=> b!830462 m!773659))

(assert (=> b!830389 d!105397))

(declare-fun d!105399 () Bool)

(declare-fun e!463028 () Bool)

(assert (=> d!105399 e!463028))

(declare-fun res!565572 () Bool)

(assert (=> d!105399 (=> (not res!565572) (not e!463028))))

(declare-fun lt!376913 () ListLongMap!8973)

(assert (=> d!105399 (= res!565572 (contains!4208 lt!376913 (_1!5086 (tuple2!10151 lt!376854 lt!376852))))))

(declare-fun lt!376910 () List!15945)

(assert (=> d!105399 (= lt!376913 (ListLongMap!8974 lt!376910))))

(declare-fun lt!376912 () Unit!28429)

(declare-fun lt!376911 () Unit!28429)

(assert (=> d!105399 (= lt!376912 lt!376911)))

(assert (=> d!105399 (= (getValueByKey!415 lt!376910 (_1!5086 (tuple2!10151 lt!376854 lt!376852))) (Some!420 (_2!5086 (tuple2!10151 lt!376854 lt!376852))))))

(assert (=> d!105399 (= lt!376911 (lemmaContainsTupThenGetReturnValue!229 lt!376910 (_1!5086 (tuple2!10151 lt!376854 lt!376852)) (_2!5086 (tuple2!10151 lt!376854 lt!376852))))))

(assert (=> d!105399 (= lt!376910 (insertStrictlySorted!268 (toList!4502 lt!376855) (_1!5086 (tuple2!10151 lt!376854 lt!376852)) (_2!5086 (tuple2!10151 lt!376854 lt!376852))))))

(assert (=> d!105399 (= (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852)) lt!376913)))

(declare-fun b!830463 () Bool)

(declare-fun res!565571 () Bool)

(assert (=> b!830463 (=> (not res!565571) (not e!463028))))

(assert (=> b!830463 (= res!565571 (= (getValueByKey!415 (toList!4502 lt!376913) (_1!5086 (tuple2!10151 lt!376854 lt!376852))) (Some!420 (_2!5086 (tuple2!10151 lt!376854 lt!376852)))))))

(declare-fun b!830464 () Bool)

(assert (=> b!830464 (= e!463028 (contains!4209 (toList!4502 lt!376913) (tuple2!10151 lt!376854 lt!376852)))))

(assert (= (and d!105399 res!565572) b!830463))

(assert (= (and b!830463 res!565571) b!830464))

(declare-fun m!773661 () Bool)

(assert (=> d!105399 m!773661))

(declare-fun m!773663 () Bool)

(assert (=> d!105399 m!773663))

(declare-fun m!773665 () Bool)

(assert (=> d!105399 m!773665))

(declare-fun m!773667 () Bool)

(assert (=> d!105399 m!773667))

(declare-fun m!773669 () Bool)

(assert (=> b!830463 m!773669))

(declare-fun m!773671 () Bool)

(assert (=> b!830464 m!773671))

(assert (=> b!830389 d!105399))

(declare-fun d!105401 () Bool)

(assert (=> d!105401 (not (contains!4208 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852)) lt!376853))))

(declare-fun lt!376916 () Unit!28429)

(declare-fun choose!1417 (ListLongMap!8973 (_ BitVec 64) V!25277 (_ BitVec 64)) Unit!28429)

(assert (=> d!105401 (= lt!376916 (choose!1417 lt!376855 lt!376854 lt!376852 lt!376853))))

(declare-fun e!463031 () Bool)

(assert (=> d!105401 e!463031))

(declare-fun res!565575 () Bool)

(assert (=> d!105401 (=> (not res!565575) (not e!463031))))

(assert (=> d!105401 (= res!565575 (not (contains!4208 lt!376855 lt!376853)))))

(assert (=> d!105401 (= (addStillNotContains!197 lt!376855 lt!376854 lt!376852 lt!376853) lt!376916)))

(declare-fun b!830468 () Bool)

(assert (=> b!830468 (= e!463031 (not (= lt!376854 lt!376853)))))

(assert (= (and d!105401 res!565575) b!830468))

(assert (=> d!105401 m!773525))

(assert (=> d!105401 m!773525))

(assert (=> d!105401 m!773529))

(declare-fun m!773673 () Bool)

(assert (=> d!105401 m!773673))

(declare-fun m!773675 () Bool)

(assert (=> d!105401 m!773675))

(assert (=> b!830389 d!105401))

(declare-fun d!105403 () Bool)

(declare-fun e!463032 () Bool)

(assert (=> d!105403 e!463032))

(declare-fun res!565576 () Bool)

(assert (=> d!105403 (=> res!565576 e!463032)))

(declare-fun lt!376917 () Bool)

(assert (=> d!105403 (= res!565576 (not lt!376917))))

(declare-fun lt!376919 () Bool)

(assert (=> d!105403 (= lt!376917 lt!376919)))

(declare-fun lt!376918 () Unit!28429)

(declare-fun e!463033 () Unit!28429)

(assert (=> d!105403 (= lt!376918 e!463033)))

(declare-fun c!89923 () Bool)

(assert (=> d!105403 (= c!89923 lt!376919)))

(assert (=> d!105403 (= lt!376919 (containsKey!401 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))) lt!376853))))

(assert (=> d!105403 (= (contains!4208 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852)) lt!376853) lt!376917)))

(declare-fun b!830469 () Bool)

(declare-fun lt!376920 () Unit!28429)

(assert (=> b!830469 (= e!463033 lt!376920)))

(assert (=> b!830469 (= lt!376920 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))) lt!376853))))

(assert (=> b!830469 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))) lt!376853))))

(declare-fun b!830470 () Bool)

(declare-fun Unit!28440 () Unit!28429)

(assert (=> b!830470 (= e!463033 Unit!28440)))

(declare-fun b!830471 () Bool)

(assert (=> b!830471 (= e!463032 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))) lt!376853)))))

(assert (= (and d!105403 c!89923) b!830469))

(assert (= (and d!105403 (not c!89923)) b!830470))

(assert (= (and d!105403 (not res!565576)) b!830471))

(declare-fun m!773677 () Bool)

(assert (=> d!105403 m!773677))

(declare-fun m!773679 () Bool)

(assert (=> b!830469 m!773679))

(declare-fun m!773681 () Bool)

(assert (=> b!830469 m!773681))

(assert (=> b!830469 m!773681))

(declare-fun m!773683 () Bool)

(assert (=> b!830469 m!773683))

(assert (=> b!830471 m!773681))

(assert (=> b!830471 m!773681))

(assert (=> b!830471 m!773683))

(assert (=> b!830389 d!105403))

(assert (=> b!830389 d!105395))

(declare-fun d!105405 () Bool)

(declare-fun e!463034 () Bool)

(assert (=> d!105405 e!463034))

(declare-fun res!565577 () Bool)

(assert (=> d!105405 (=> res!565577 e!463034)))

(declare-fun lt!376921 () Bool)

(assert (=> d!105405 (= res!565577 (not lt!376921))))

(declare-fun lt!376923 () Bool)

(assert (=> d!105405 (= lt!376921 lt!376923)))

(declare-fun lt!376922 () Unit!28429)

(declare-fun e!463035 () Unit!28429)

(assert (=> d!105405 (= lt!376922 e!463035)))

(declare-fun c!89924 () Bool)

(assert (=> d!105405 (= c!89924 lt!376923)))

(assert (=> d!105405 (= lt!376923 (containsKey!401 (toList!4502 lt!376716) (_1!5086 lt!376677)))))

(assert (=> d!105405 (= (contains!4208 lt!376716 (_1!5086 lt!376677)) lt!376921)))

(declare-fun b!830472 () Bool)

(declare-fun lt!376924 () Unit!28429)

(assert (=> b!830472 (= e!463035 lt!376924)))

(assert (=> b!830472 (= lt!376924 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376716) (_1!5086 lt!376677)))))

(assert (=> b!830472 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376716) (_1!5086 lt!376677)))))

(declare-fun b!830473 () Bool)

(declare-fun Unit!28441 () Unit!28429)

(assert (=> b!830473 (= e!463035 Unit!28441)))

(declare-fun b!830474 () Bool)

(assert (=> b!830474 (= e!463034 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376716) (_1!5086 lt!376677))))))

(assert (= (and d!105405 c!89924) b!830472))

(assert (= (and d!105405 (not c!89924)) b!830473))

(assert (= (and d!105405 (not res!565577)) b!830474))

(declare-fun m!773685 () Bool)

(assert (=> d!105405 m!773685))

(declare-fun m!773687 () Bool)

(assert (=> b!830472 m!773687))

(assert (=> b!830472 m!773337))

(assert (=> b!830472 m!773337))

(declare-fun m!773689 () Bool)

(assert (=> b!830472 m!773689))

(assert (=> b!830474 m!773337))

(assert (=> b!830474 m!773337))

(assert (=> b!830474 m!773689))

(assert (=> d!105337 d!105405))

(declare-fun b!830484 () Bool)

(declare-fun e!463040 () Option!421)

(declare-fun e!463041 () Option!421)

(assert (=> b!830484 (= e!463040 e!463041)))

(declare-fun c!89930 () Bool)

(assert (=> b!830484 (= c!89930 (and ((_ is Cons!15941) lt!376713) (not (= (_1!5086 (h!17070 lt!376713)) (_1!5086 lt!376677)))))))

(declare-fun b!830485 () Bool)

(assert (=> b!830485 (= e!463041 (getValueByKey!415 (t!22310 lt!376713) (_1!5086 lt!376677)))))

(declare-fun b!830486 () Bool)

(assert (=> b!830486 (= e!463041 None!419)))

(declare-fun b!830483 () Bool)

(assert (=> b!830483 (= e!463040 (Some!420 (_2!5086 (h!17070 lt!376713))))))

(declare-fun d!105407 () Bool)

(declare-fun c!89929 () Bool)

(assert (=> d!105407 (= c!89929 (and ((_ is Cons!15941) lt!376713) (= (_1!5086 (h!17070 lt!376713)) (_1!5086 lt!376677))))))

(assert (=> d!105407 (= (getValueByKey!415 lt!376713 (_1!5086 lt!376677)) e!463040)))

(assert (= (and d!105407 c!89929) b!830483))

(assert (= (and d!105407 (not c!89929)) b!830484))

(assert (= (and b!830484 c!89930) b!830485))

(assert (= (and b!830484 (not c!89930)) b!830486))

(declare-fun m!773691 () Bool)

(assert (=> b!830485 m!773691))

(assert (=> d!105337 d!105407))

(declare-fun d!105409 () Bool)

(assert (=> d!105409 (= (getValueByKey!415 lt!376713 (_1!5086 lt!376677)) (Some!420 (_2!5086 lt!376677)))))

(declare-fun lt!376927 () Unit!28429)

(declare-fun choose!1418 (List!15945 (_ BitVec 64) V!25277) Unit!28429)

(assert (=> d!105409 (= lt!376927 (choose!1418 lt!376713 (_1!5086 lt!376677) (_2!5086 lt!376677)))))

(declare-fun e!463044 () Bool)

(assert (=> d!105409 e!463044))

(declare-fun res!565582 () Bool)

(assert (=> d!105409 (=> (not res!565582) (not e!463044))))

(declare-fun isStrictlySorted!441 (List!15945) Bool)

(assert (=> d!105409 (= res!565582 (isStrictlySorted!441 lt!376713))))

(assert (=> d!105409 (= (lemmaContainsTupThenGetReturnValue!229 lt!376713 (_1!5086 lt!376677) (_2!5086 lt!376677)) lt!376927)))

(declare-fun b!830491 () Bool)

(declare-fun res!565583 () Bool)

(assert (=> b!830491 (=> (not res!565583) (not e!463044))))

(assert (=> b!830491 (= res!565583 (containsKey!401 lt!376713 (_1!5086 lt!376677)))))

(declare-fun b!830492 () Bool)

(assert (=> b!830492 (= e!463044 (contains!4209 lt!376713 (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(assert (= (and d!105409 res!565582) b!830491))

(assert (= (and b!830491 res!565583) b!830492))

(assert (=> d!105409 m!773331))

(declare-fun m!773693 () Bool)

(assert (=> d!105409 m!773693))

(declare-fun m!773695 () Bool)

(assert (=> d!105409 m!773695))

(declare-fun m!773697 () Bool)

(assert (=> b!830491 m!773697))

(declare-fun m!773699 () Bool)

(assert (=> b!830492 m!773699))

(assert (=> d!105337 d!105409))

(declare-fun d!105411 () Bool)

(declare-fun e!463057 () Bool)

(assert (=> d!105411 e!463057))

(declare-fun res!565589 () Bool)

(assert (=> d!105411 (=> (not res!565589) (not e!463057))))

(declare-fun lt!376930 () List!15945)

(assert (=> d!105411 (= res!565589 (isStrictlySorted!441 lt!376930))))

(declare-fun e!463058 () List!15945)

(assert (=> d!105411 (= lt!376930 e!463058)))

(declare-fun c!89942 () Bool)

(assert (=> d!105411 (= c!89942 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (bvslt (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5086 lt!376677))))))

(assert (=> d!105411 (isStrictlySorted!441 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105411 (= (insertStrictlySorted!268 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5086 lt!376677) (_2!5086 lt!376677)) lt!376930)))

(declare-fun b!830513 () Bool)

(declare-fun res!565588 () Bool)

(assert (=> b!830513 (=> (not res!565588) (not e!463057))))

(assert (=> b!830513 (= res!565588 (containsKey!401 lt!376930 (_1!5086 lt!376677)))))

(declare-fun e!463056 () List!15945)

(declare-fun b!830514 () Bool)

(assert (=> b!830514 (= e!463056 (insertStrictlySorted!268 (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (_1!5086 lt!376677) (_2!5086 lt!376677)))))

(declare-fun bm!36264 () Bool)

(declare-fun call!36269 () List!15945)

(declare-fun $colon$colon!536 (List!15945 tuple2!10150) List!15945)

(assert (=> bm!36264 (= call!36269 ($colon$colon!536 e!463056 (ite c!89942 (h!17070 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677)))))))

(declare-fun c!89941 () Bool)

(assert (=> bm!36264 (= c!89941 c!89942)))

(declare-fun b!830515 () Bool)

(assert (=> b!830515 (= e!463057 (contains!4209 lt!376930 (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun c!89940 () Bool)

(declare-fun c!89939 () Bool)

(declare-fun b!830516 () Bool)

(assert (=> b!830516 (= e!463056 (ite c!89939 (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (ite c!89940 (Cons!15941 (h!17070 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) Nil!15942)))))

(declare-fun b!830517 () Bool)

(declare-fun e!463055 () List!15945)

(declare-fun call!36268 () List!15945)

(assert (=> b!830517 (= e!463055 call!36268)))

(declare-fun bm!36265 () Bool)

(declare-fun call!36267 () List!15945)

(assert (=> bm!36265 (= call!36268 call!36267)))

(declare-fun bm!36266 () Bool)

(assert (=> bm!36266 (= call!36267 call!36269)))

(declare-fun b!830518 () Bool)

(assert (=> b!830518 (= e!463055 call!36268)))

(declare-fun b!830519 () Bool)

(assert (=> b!830519 (= e!463058 call!36269)))

(declare-fun b!830520 () Bool)

(declare-fun e!463059 () List!15945)

(assert (=> b!830520 (= e!463059 call!36267)))

(declare-fun b!830521 () Bool)

(assert (=> b!830521 (= c!89940 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (bvsgt (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5086 lt!376677))))))

(assert (=> b!830521 (= e!463059 e!463055)))

(declare-fun b!830522 () Bool)

(assert (=> b!830522 (= e!463058 e!463059)))

(assert (=> b!830522 (= c!89939 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5086 lt!376677))))))

(assert (= (and d!105411 c!89942) b!830519))

(assert (= (and d!105411 (not c!89942)) b!830522))

(assert (= (and b!830522 c!89939) b!830520))

(assert (= (and b!830522 (not c!89939)) b!830521))

(assert (= (and b!830521 c!89940) b!830518))

(assert (= (and b!830521 (not c!89940)) b!830517))

(assert (= (or b!830518 b!830517) bm!36265))

(assert (= (or b!830520 bm!36265) bm!36266))

(assert (= (or b!830519 bm!36266) bm!36264))

(assert (= (and bm!36264 c!89941) b!830514))

(assert (= (and bm!36264 (not c!89941)) b!830516))

(assert (= (and d!105411 res!565589) b!830513))

(assert (= (and b!830513 res!565588) b!830515))

(declare-fun m!773701 () Bool)

(assert (=> bm!36264 m!773701))

(declare-fun m!773703 () Bool)

(assert (=> b!830513 m!773703))

(declare-fun m!773705 () Bool)

(assert (=> b!830515 m!773705))

(declare-fun m!773707 () Bool)

(assert (=> d!105411 m!773707))

(declare-fun m!773709 () Bool)

(assert (=> d!105411 m!773709))

(declare-fun m!773711 () Bool)

(assert (=> b!830514 m!773711))

(assert (=> d!105337 d!105411))

(declare-fun d!105413 () Bool)

(declare-fun lt!376931 () Bool)

(assert (=> d!105413 (= lt!376931 (select (content!386 (toList!4502 lt!376737)) lt!376679))))

(declare-fun e!463061 () Bool)

(assert (=> d!105413 (= lt!376931 e!463061)))

(declare-fun res!565590 () Bool)

(assert (=> d!105413 (=> (not res!565590) (not e!463061))))

(assert (=> d!105413 (= res!565590 ((_ is Cons!15941) (toList!4502 lt!376737)))))

(assert (=> d!105413 (= (contains!4209 (toList!4502 lt!376737) lt!376679) lt!376931)))

(declare-fun b!830523 () Bool)

(declare-fun e!463060 () Bool)

(assert (=> b!830523 (= e!463061 e!463060)))

(declare-fun res!565591 () Bool)

(assert (=> b!830523 (=> res!565591 e!463060)))

(assert (=> b!830523 (= res!565591 (= (h!17070 (toList!4502 lt!376737)) lt!376679))))

(declare-fun b!830524 () Bool)

(assert (=> b!830524 (= e!463060 (contains!4209 (t!22310 (toList!4502 lt!376737)) lt!376679))))

(assert (= (and d!105413 res!565590) b!830523))

(assert (= (and b!830523 (not res!565591)) b!830524))

(declare-fun m!773713 () Bool)

(assert (=> d!105413 m!773713))

(declare-fun m!773715 () Bool)

(assert (=> d!105413 m!773715))

(declare-fun m!773717 () Bool)

(assert (=> b!830524 m!773717))

(assert (=> b!830273 d!105413))

(declare-fun d!105415 () Bool)

(declare-fun e!463062 () Bool)

(assert (=> d!105415 e!463062))

(declare-fun res!565592 () Bool)

(assert (=> d!105415 (=> res!565592 e!463062)))

(declare-fun lt!376932 () Bool)

(assert (=> d!105415 (= res!565592 (not lt!376932))))

(declare-fun lt!376934 () Bool)

(assert (=> d!105415 (= lt!376932 lt!376934)))

(declare-fun lt!376933 () Unit!28429)

(declare-fun e!463063 () Unit!28429)

(assert (=> d!105415 (= lt!376933 e!463063)))

(declare-fun c!89943 () Bool)

(assert (=> d!105415 (= c!89943 lt!376934)))

(assert (=> d!105415 (= lt!376934 (containsKey!401 (toList!4502 lt!376795) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105415 (= (contains!4208 lt!376795 #b1000000000000000000000000000000000000000000000000000000000000000) lt!376932)))

(declare-fun b!830525 () Bool)

(declare-fun lt!376935 () Unit!28429)

(assert (=> b!830525 (= e!463063 lt!376935)))

(assert (=> b!830525 (= lt!376935 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376795) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830525 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376795) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830526 () Bool)

(declare-fun Unit!28442 () Unit!28429)

(assert (=> b!830526 (= e!463063 Unit!28442)))

(declare-fun b!830527 () Bool)

(assert (=> b!830527 (= e!463062 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376795) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105415 c!89943) b!830525))

(assert (= (and d!105415 (not c!89943)) b!830526))

(assert (= (and d!105415 (not res!565592)) b!830527))

(declare-fun m!773719 () Bool)

(assert (=> d!105415 m!773719))

(declare-fun m!773721 () Bool)

(assert (=> b!830525 m!773721))

(declare-fun m!773723 () Bool)

(assert (=> b!830525 m!773723))

(assert (=> b!830525 m!773723))

(declare-fun m!773725 () Bool)

(assert (=> b!830525 m!773725))

(assert (=> b!830527 m!773723))

(assert (=> b!830527 m!773723))

(assert (=> b!830527 m!773725))

(assert (=> bm!36245 d!105415))

(assert (=> d!105355 d!105343))

(declare-fun d!105417 () Bool)

(declare-fun e!463064 () Bool)

(assert (=> d!105417 e!463064))

(declare-fun res!565593 () Bool)

(assert (=> d!105417 (=> res!565593 e!463064)))

(declare-fun lt!376936 () Bool)

(assert (=> d!105417 (= res!565593 (not lt!376936))))

(declare-fun lt!376938 () Bool)

(assert (=> d!105417 (= lt!376936 lt!376938)))

(declare-fun lt!376937 () Unit!28429)

(declare-fun e!463065 () Unit!28429)

(assert (=> d!105417 (= lt!376937 e!463065)))

(declare-fun c!89944 () Bool)

(assert (=> d!105417 (= c!89944 lt!376938)))

(assert (=> d!105417 (= lt!376938 (containsKey!401 (toList!4502 lt!376829) (_1!5086 lt!376677)))))

(assert (=> d!105417 (= (contains!4208 lt!376829 (_1!5086 lt!376677)) lt!376936)))

(declare-fun b!830528 () Bool)

(declare-fun lt!376939 () Unit!28429)

(assert (=> b!830528 (= e!463065 lt!376939)))

(assert (=> b!830528 (= lt!376939 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376829) (_1!5086 lt!376677)))))

(assert (=> b!830528 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376829) (_1!5086 lt!376677)))))

(declare-fun b!830529 () Bool)

(declare-fun Unit!28443 () Unit!28429)

(assert (=> b!830529 (= e!463065 Unit!28443)))

(declare-fun b!830530 () Bool)

(assert (=> b!830530 (= e!463064 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376829) (_1!5086 lt!376677))))))

(assert (= (and d!105417 c!89944) b!830528))

(assert (= (and d!105417 (not c!89944)) b!830529))

(assert (= (and d!105417 (not res!565593)) b!830530))

(declare-fun m!773727 () Bool)

(assert (=> d!105417 m!773727))

(declare-fun m!773729 () Bool)

(assert (=> b!830528 m!773729))

(assert (=> b!830528 m!773499))

(assert (=> b!830528 m!773499))

(declare-fun m!773731 () Bool)

(assert (=> b!830528 m!773731))

(assert (=> b!830530 m!773499))

(assert (=> b!830530 m!773499))

(assert (=> b!830530 m!773731))

(assert (=> d!105359 d!105417))

(declare-fun b!830532 () Bool)

(declare-fun e!463066 () Option!421)

(declare-fun e!463067 () Option!421)

(assert (=> b!830532 (= e!463066 e!463067)))

(declare-fun c!89946 () Bool)

(assert (=> b!830532 (= c!89946 (and ((_ is Cons!15941) lt!376826) (not (= (_1!5086 (h!17070 lt!376826)) (_1!5086 lt!376677)))))))

(declare-fun b!830533 () Bool)

(assert (=> b!830533 (= e!463067 (getValueByKey!415 (t!22310 lt!376826) (_1!5086 lt!376677)))))

(declare-fun b!830534 () Bool)

(assert (=> b!830534 (= e!463067 None!419)))

(declare-fun b!830531 () Bool)

(assert (=> b!830531 (= e!463066 (Some!420 (_2!5086 (h!17070 lt!376826))))))

(declare-fun d!105419 () Bool)

(declare-fun c!89945 () Bool)

(assert (=> d!105419 (= c!89945 (and ((_ is Cons!15941) lt!376826) (= (_1!5086 (h!17070 lt!376826)) (_1!5086 lt!376677))))))

(assert (=> d!105419 (= (getValueByKey!415 lt!376826 (_1!5086 lt!376677)) e!463066)))

(assert (= (and d!105419 c!89945) b!830531))

(assert (= (and d!105419 (not c!89945)) b!830532))

(assert (= (and b!830532 c!89946) b!830533))

(assert (= (and b!830532 (not c!89946)) b!830534))

(declare-fun m!773733 () Bool)

(assert (=> b!830533 m!773733))

(assert (=> d!105359 d!105419))

(declare-fun d!105421 () Bool)

(assert (=> d!105421 (= (getValueByKey!415 lt!376826 (_1!5086 lt!376677)) (Some!420 (_2!5086 lt!376677)))))

(declare-fun lt!376940 () Unit!28429)

(assert (=> d!105421 (= lt!376940 (choose!1418 lt!376826 (_1!5086 lt!376677) (_2!5086 lt!376677)))))

(declare-fun e!463068 () Bool)

(assert (=> d!105421 e!463068))

(declare-fun res!565594 () Bool)

(assert (=> d!105421 (=> (not res!565594) (not e!463068))))

(assert (=> d!105421 (= res!565594 (isStrictlySorted!441 lt!376826))))

(assert (=> d!105421 (= (lemmaContainsTupThenGetReturnValue!229 lt!376826 (_1!5086 lt!376677) (_2!5086 lt!376677)) lt!376940)))

(declare-fun b!830535 () Bool)

(declare-fun res!565595 () Bool)

(assert (=> b!830535 (=> (not res!565595) (not e!463068))))

(assert (=> b!830535 (= res!565595 (containsKey!401 lt!376826 (_1!5086 lt!376677)))))

(declare-fun b!830536 () Bool)

(assert (=> b!830536 (= e!463068 (contains!4209 lt!376826 (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(assert (= (and d!105421 res!565594) b!830535))

(assert (= (and b!830535 res!565595) b!830536))

(assert (=> d!105421 m!773493))

(declare-fun m!773735 () Bool)

(assert (=> d!105421 m!773735))

(declare-fun m!773737 () Bool)

(assert (=> d!105421 m!773737))

(declare-fun m!773739 () Bool)

(assert (=> b!830535 m!773739))

(declare-fun m!773741 () Bool)

(assert (=> b!830536 m!773741))

(assert (=> d!105359 d!105421))

(declare-fun d!105423 () Bool)

(declare-fun e!463071 () Bool)

(assert (=> d!105423 e!463071))

(declare-fun res!565597 () Bool)

(assert (=> d!105423 (=> (not res!565597) (not e!463071))))

(declare-fun lt!376941 () List!15945)

(assert (=> d!105423 (= res!565597 (isStrictlySorted!441 lt!376941))))

(declare-fun e!463072 () List!15945)

(assert (=> d!105423 (= lt!376941 e!463072)))

(declare-fun c!89950 () Bool)

(assert (=> d!105423 (= c!89950 (and ((_ is Cons!15941) (toList!4502 lt!376683)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376683))) (_1!5086 lt!376677))))))

(assert (=> d!105423 (isStrictlySorted!441 (toList!4502 lt!376683))))

(assert (=> d!105423 (= (insertStrictlySorted!268 (toList!4502 lt!376683) (_1!5086 lt!376677) (_2!5086 lt!376677)) lt!376941)))

(declare-fun b!830537 () Bool)

(declare-fun res!565596 () Bool)

(assert (=> b!830537 (=> (not res!565596) (not e!463071))))

(assert (=> b!830537 (= res!565596 (containsKey!401 lt!376941 (_1!5086 lt!376677)))))

(declare-fun b!830538 () Bool)

(declare-fun e!463070 () List!15945)

(assert (=> b!830538 (= e!463070 (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376683)) (_1!5086 lt!376677) (_2!5086 lt!376677)))))

(declare-fun bm!36267 () Bool)

(declare-fun call!36272 () List!15945)

(assert (=> bm!36267 (= call!36272 ($colon$colon!536 e!463070 (ite c!89950 (h!17070 (toList!4502 lt!376683)) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677)))))))

(declare-fun c!89949 () Bool)

(assert (=> bm!36267 (= c!89949 c!89950)))

(declare-fun b!830539 () Bool)

(assert (=> b!830539 (= e!463071 (contains!4209 lt!376941 (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun b!830540 () Bool)

(declare-fun c!89948 () Bool)

(declare-fun c!89947 () Bool)

(assert (=> b!830540 (= e!463070 (ite c!89947 (t!22310 (toList!4502 lt!376683)) (ite c!89948 (Cons!15941 (h!17070 (toList!4502 lt!376683)) (t!22310 (toList!4502 lt!376683))) Nil!15942)))))

(declare-fun b!830541 () Bool)

(declare-fun e!463069 () List!15945)

(declare-fun call!36271 () List!15945)

(assert (=> b!830541 (= e!463069 call!36271)))

(declare-fun bm!36268 () Bool)

(declare-fun call!36270 () List!15945)

(assert (=> bm!36268 (= call!36271 call!36270)))

(declare-fun bm!36269 () Bool)

(assert (=> bm!36269 (= call!36270 call!36272)))

(declare-fun b!830542 () Bool)

(assert (=> b!830542 (= e!463069 call!36271)))

(declare-fun b!830543 () Bool)

(assert (=> b!830543 (= e!463072 call!36272)))

(declare-fun b!830544 () Bool)

(declare-fun e!463073 () List!15945)

(assert (=> b!830544 (= e!463073 call!36270)))

(declare-fun b!830545 () Bool)

(assert (=> b!830545 (= c!89948 (and ((_ is Cons!15941) (toList!4502 lt!376683)) (bvsgt (_1!5086 (h!17070 (toList!4502 lt!376683))) (_1!5086 lt!376677))))))

(assert (=> b!830545 (= e!463073 e!463069)))

(declare-fun b!830546 () Bool)

(assert (=> b!830546 (= e!463072 e!463073)))

(assert (=> b!830546 (= c!89947 (and ((_ is Cons!15941) (toList!4502 lt!376683)) (= (_1!5086 (h!17070 (toList!4502 lt!376683))) (_1!5086 lt!376677))))))

(assert (= (and d!105423 c!89950) b!830543))

(assert (= (and d!105423 (not c!89950)) b!830546))

(assert (= (and b!830546 c!89947) b!830544))

(assert (= (and b!830546 (not c!89947)) b!830545))

(assert (= (and b!830545 c!89948) b!830542))

(assert (= (and b!830545 (not c!89948)) b!830541))

(assert (= (or b!830542 b!830541) bm!36268))

(assert (= (or b!830544 bm!36268) bm!36269))

(assert (= (or b!830543 bm!36269) bm!36267))

(assert (= (and bm!36267 c!89949) b!830538))

(assert (= (and bm!36267 (not c!89949)) b!830540))

(assert (= (and d!105423 res!565597) b!830537))

(assert (= (and b!830537 res!565596) b!830539))

(declare-fun m!773743 () Bool)

(assert (=> bm!36267 m!773743))

(declare-fun m!773745 () Bool)

(assert (=> b!830537 m!773745))

(declare-fun m!773747 () Bool)

(assert (=> b!830539 m!773747))

(declare-fun m!773749 () Bool)

(assert (=> d!105423 m!773749))

(declare-fun m!773751 () Bool)

(assert (=> d!105423 m!773751))

(declare-fun m!773753 () Bool)

(assert (=> b!830538 m!773753))

(assert (=> d!105359 d!105423))

(declare-fun d!105425 () Bool)

(assert (=> d!105425 (= (apply!372 (+!1980 lt!376816 (tuple2!10151 lt!376804 minValue!754)) lt!376818) (apply!372 lt!376816 lt!376818))))

(declare-fun lt!376944 () Unit!28429)

(declare-fun choose!1419 (ListLongMap!8973 (_ BitVec 64) V!25277 (_ BitVec 64)) Unit!28429)

(assert (=> d!105425 (= lt!376944 (choose!1419 lt!376816 lt!376804 minValue!754 lt!376818))))

(declare-fun e!463076 () Bool)

(assert (=> d!105425 e!463076))

(declare-fun res!565600 () Bool)

(assert (=> d!105425 (=> (not res!565600) (not e!463076))))

(assert (=> d!105425 (= res!565600 (contains!4208 lt!376816 lt!376818))))

(assert (=> d!105425 (= (addApplyDifferent!323 lt!376816 lt!376804 minValue!754 lt!376818) lt!376944)))

(declare-fun b!830550 () Bool)

(assert (=> b!830550 (= e!463076 (not (= lt!376818 lt!376804)))))

(assert (= (and d!105425 res!565600) b!830550))

(assert (=> d!105425 m!773467))

(declare-fun m!773755 () Bool)

(assert (=> d!105425 m!773755))

(assert (=> d!105425 m!773453))

(assert (=> d!105425 m!773453))

(assert (=> d!105425 m!773455))

(declare-fun m!773757 () Bool)

(assert (=> d!105425 m!773757))

(assert (=> b!830349 d!105425))

(declare-fun d!105427 () Bool)

(assert (=> d!105427 (= (apply!372 (+!1980 lt!376812 (tuple2!10151 lt!376813 minValue!754)) lt!376821) (apply!372 lt!376812 lt!376821))))

(declare-fun lt!376945 () Unit!28429)

(assert (=> d!105427 (= lt!376945 (choose!1419 lt!376812 lt!376813 minValue!754 lt!376821))))

(declare-fun e!463077 () Bool)

(assert (=> d!105427 e!463077))

(declare-fun res!565601 () Bool)

(assert (=> d!105427 (=> (not res!565601) (not e!463077))))

(assert (=> d!105427 (= res!565601 (contains!4208 lt!376812 lt!376821))))

(assert (=> d!105427 (= (addApplyDifferent!323 lt!376812 lt!376813 minValue!754 lt!376821) lt!376945)))

(declare-fun b!830551 () Bool)

(assert (=> b!830551 (= e!463077 (not (= lt!376821 lt!376813)))))

(assert (= (and d!105427 res!565601) b!830551))

(assert (=> d!105427 m!773451))

(declare-fun m!773759 () Bool)

(assert (=> d!105427 m!773759))

(assert (=> d!105427 m!773465))

(assert (=> d!105427 m!773465))

(assert (=> d!105427 m!773471))

(declare-fun m!773761 () Bool)

(assert (=> d!105427 m!773761))

(assert (=> b!830349 d!105427))

(declare-fun d!105429 () Bool)

(assert (=> d!105429 (= (apply!372 (+!1980 lt!376812 (tuple2!10151 lt!376813 minValue!754)) lt!376821) (get!11818 (getValueByKey!415 (toList!4502 (+!1980 lt!376812 (tuple2!10151 lt!376813 minValue!754))) lt!376821)))))

(declare-fun bs!23187 () Bool)

(assert (= bs!23187 d!105429))

(declare-fun m!773763 () Bool)

(assert (=> bs!23187 m!773763))

(assert (=> bs!23187 m!773763))

(declare-fun m!773765 () Bool)

(assert (=> bs!23187 m!773765))

(assert (=> b!830349 d!105429))

(declare-fun d!105431 () Bool)

(assert (=> d!105431 (= (apply!372 lt!376816 lt!376818) (get!11818 (getValueByKey!415 (toList!4502 lt!376816) lt!376818)))))

(declare-fun bs!23188 () Bool)

(assert (= bs!23188 d!105431))

(declare-fun m!773767 () Bool)

(assert (=> bs!23188 m!773767))

(assert (=> bs!23188 m!773767))

(declare-fun m!773769 () Bool)

(assert (=> bs!23188 m!773769))

(assert (=> b!830349 d!105431))

(declare-fun d!105433 () Bool)

(assert (=> d!105433 (= (apply!372 (+!1980 lt!376816 (tuple2!10151 lt!376804 minValue!754)) lt!376818) (get!11818 (getValueByKey!415 (toList!4502 (+!1980 lt!376816 (tuple2!10151 lt!376804 minValue!754))) lt!376818)))))

(declare-fun bs!23189 () Bool)

(assert (= bs!23189 d!105433))

(declare-fun m!773771 () Bool)

(assert (=> bs!23189 m!773771))

(assert (=> bs!23189 m!773771))

(declare-fun m!773773 () Bool)

(assert (=> bs!23189 m!773773))

(assert (=> b!830349 d!105433))

(assert (=> b!830349 d!105365))

(declare-fun d!105435 () Bool)

(declare-fun e!463078 () Bool)

(assert (=> d!105435 e!463078))

(declare-fun res!565603 () Bool)

(assert (=> d!105435 (=> (not res!565603) (not e!463078))))

(declare-fun lt!376949 () ListLongMap!8973)

(assert (=> d!105435 (= res!565603 (contains!4208 lt!376949 (_1!5086 (tuple2!10151 lt!376804 minValue!754))))))

(declare-fun lt!376946 () List!15945)

(assert (=> d!105435 (= lt!376949 (ListLongMap!8974 lt!376946))))

(declare-fun lt!376948 () Unit!28429)

(declare-fun lt!376947 () Unit!28429)

(assert (=> d!105435 (= lt!376948 lt!376947)))

(assert (=> d!105435 (= (getValueByKey!415 lt!376946 (_1!5086 (tuple2!10151 lt!376804 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 lt!376804 minValue!754))))))

(assert (=> d!105435 (= lt!376947 (lemmaContainsTupThenGetReturnValue!229 lt!376946 (_1!5086 (tuple2!10151 lt!376804 minValue!754)) (_2!5086 (tuple2!10151 lt!376804 minValue!754))))))

(assert (=> d!105435 (= lt!376946 (insertStrictlySorted!268 (toList!4502 lt!376816) (_1!5086 (tuple2!10151 lt!376804 minValue!754)) (_2!5086 (tuple2!10151 lt!376804 minValue!754))))))

(assert (=> d!105435 (= (+!1980 lt!376816 (tuple2!10151 lt!376804 minValue!754)) lt!376949)))

(declare-fun b!830552 () Bool)

(declare-fun res!565602 () Bool)

(assert (=> b!830552 (=> (not res!565602) (not e!463078))))

(assert (=> b!830552 (= res!565602 (= (getValueByKey!415 (toList!4502 lt!376949) (_1!5086 (tuple2!10151 lt!376804 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 lt!376804 minValue!754)))))))

(declare-fun b!830553 () Bool)

(assert (=> b!830553 (= e!463078 (contains!4209 (toList!4502 lt!376949) (tuple2!10151 lt!376804 minValue!754)))))

(assert (= (and d!105435 res!565603) b!830552))

(assert (= (and b!830552 res!565602) b!830553))

(declare-fun m!773775 () Bool)

(assert (=> d!105435 m!773775))

(declare-fun m!773777 () Bool)

(assert (=> d!105435 m!773777))

(declare-fun m!773779 () Bool)

(assert (=> d!105435 m!773779))

(declare-fun m!773781 () Bool)

(assert (=> d!105435 m!773781))

(declare-fun m!773783 () Bool)

(assert (=> b!830552 m!773783))

(declare-fun m!773785 () Bool)

(assert (=> b!830553 m!773785))

(assert (=> b!830349 d!105435))

(declare-fun d!105437 () Bool)

(declare-fun e!463079 () Bool)

(assert (=> d!105437 e!463079))

(declare-fun res!565605 () Bool)

(assert (=> d!105437 (=> (not res!565605) (not e!463079))))

(declare-fun lt!376953 () ListLongMap!8973)

(assert (=> d!105437 (= res!565605 (contains!4208 lt!376953 (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))

(declare-fun lt!376950 () List!15945)

(assert (=> d!105437 (= lt!376953 (ListLongMap!8974 lt!376950))))

(declare-fun lt!376952 () Unit!28429)

(declare-fun lt!376951 () Unit!28429)

(assert (=> d!105437 (= lt!376952 lt!376951)))

(assert (=> d!105437 (= (getValueByKey!415 lt!376950 (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))) (Some!420 (_2!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))

(assert (=> d!105437 (= lt!376951 (lemmaContainsTupThenGetReturnValue!229 lt!376950 (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))

(assert (=> d!105437 (= lt!376950 (insertStrictlySorted!268 (toList!4502 lt!376824) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))

(assert (=> d!105437 (= (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34)) lt!376953)))

(declare-fun b!830554 () Bool)

(declare-fun res!565604 () Bool)

(assert (=> b!830554 (=> (not res!565604) (not e!463079))))

(assert (=> b!830554 (= res!565604 (= (getValueByKey!415 (toList!4502 lt!376953) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))) (Some!420 (_2!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)))))))

(declare-fun b!830555 () Bool)

(assert (=> b!830555 (= e!463079 (contains!4209 (toList!4502 lt!376953) (tuple2!10151 lt!376810 zeroValueAfter!34)))))

(assert (= (and d!105437 res!565605) b!830554))

(assert (= (and b!830554 res!565604) b!830555))

(declare-fun m!773787 () Bool)

(assert (=> d!105437 m!773787))

(declare-fun m!773789 () Bool)

(assert (=> d!105437 m!773789))

(declare-fun m!773791 () Bool)

(assert (=> d!105437 m!773791))

(declare-fun m!773793 () Bool)

(assert (=> d!105437 m!773793))

(declare-fun m!773795 () Bool)

(assert (=> b!830554 m!773795))

(declare-fun m!773797 () Bool)

(assert (=> b!830555 m!773797))

(assert (=> b!830349 d!105437))

(declare-fun d!105439 () Bool)

(assert (=> d!105439 (= (apply!372 lt!376812 lt!376821) (get!11818 (getValueByKey!415 (toList!4502 lt!376812) lt!376821)))))

(declare-fun bs!23190 () Bool)

(assert (= bs!23190 d!105439))

(declare-fun m!773799 () Bool)

(assert (=> bs!23190 m!773799))

(assert (=> bs!23190 m!773799))

(declare-fun m!773801 () Bool)

(assert (=> bs!23190 m!773801))

(assert (=> b!830349 d!105439))

(declare-fun d!105441 () Bool)

(assert (=> d!105441 (= (apply!372 (+!1980 lt!376825 (tuple2!10151 lt!376814 zeroValueAfter!34)) lt!376809) (get!11818 (getValueByKey!415 (toList!4502 (+!1980 lt!376825 (tuple2!10151 lt!376814 zeroValueAfter!34))) lt!376809)))))

(declare-fun bs!23191 () Bool)

(assert (= bs!23191 d!105441))

(declare-fun m!773803 () Bool)

(assert (=> bs!23191 m!773803))

(assert (=> bs!23191 m!773803))

(declare-fun m!773805 () Bool)

(assert (=> bs!23191 m!773805))

(assert (=> b!830349 d!105441))

(declare-fun d!105443 () Bool)

(assert (=> d!105443 (= (apply!372 lt!376825 lt!376809) (get!11818 (getValueByKey!415 (toList!4502 lt!376825) lt!376809)))))

(declare-fun bs!23192 () Bool)

(assert (= bs!23192 d!105443))

(declare-fun m!773807 () Bool)

(assert (=> bs!23192 m!773807))

(assert (=> bs!23192 m!773807))

(declare-fun m!773809 () Bool)

(assert (=> bs!23192 m!773809))

(assert (=> b!830349 d!105443))

(declare-fun d!105445 () Bool)

(declare-fun e!463080 () Bool)

(assert (=> d!105445 e!463080))

(declare-fun res!565606 () Bool)

(assert (=> d!105445 (=> res!565606 e!463080)))

(declare-fun lt!376954 () Bool)

(assert (=> d!105445 (= res!565606 (not lt!376954))))

(declare-fun lt!376956 () Bool)

(assert (=> d!105445 (= lt!376954 lt!376956)))

(declare-fun lt!376955 () Unit!28429)

(declare-fun e!463081 () Unit!28429)

(assert (=> d!105445 (= lt!376955 e!463081)))

(declare-fun c!89951 () Bool)

(assert (=> d!105445 (= c!89951 lt!376956)))

(assert (=> d!105445 (= lt!376956 (containsKey!401 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))) lt!376805))))

(assert (=> d!105445 (= (contains!4208 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34)) lt!376805) lt!376954)))

(declare-fun b!830556 () Bool)

(declare-fun lt!376957 () Unit!28429)

(assert (=> b!830556 (= e!463081 lt!376957)))

(assert (=> b!830556 (= lt!376957 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))) lt!376805))))

(assert (=> b!830556 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))) lt!376805))))

(declare-fun b!830557 () Bool)

(declare-fun Unit!28444 () Unit!28429)

(assert (=> b!830557 (= e!463081 Unit!28444)))

(declare-fun b!830558 () Bool)

(assert (=> b!830558 (= e!463080 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))) lt!376805)))))

(assert (= (and d!105445 c!89951) b!830556))

(assert (= (and d!105445 (not c!89951)) b!830557))

(assert (= (and d!105445 (not res!565606)) b!830558))

(declare-fun m!773811 () Bool)

(assert (=> d!105445 m!773811))

(declare-fun m!773813 () Bool)

(assert (=> b!830556 m!773813))

(declare-fun m!773815 () Bool)

(assert (=> b!830556 m!773815))

(assert (=> b!830556 m!773815))

(declare-fun m!773817 () Bool)

(assert (=> b!830556 m!773817))

(assert (=> b!830558 m!773815))

(assert (=> b!830558 m!773815))

(assert (=> b!830558 m!773817))

(assert (=> b!830349 d!105445))

(declare-fun d!105447 () Bool)

(declare-fun e!463082 () Bool)

(assert (=> d!105447 e!463082))

(declare-fun res!565608 () Bool)

(assert (=> d!105447 (=> (not res!565608) (not e!463082))))

(declare-fun lt!376961 () ListLongMap!8973)

(assert (=> d!105447 (= res!565608 (contains!4208 lt!376961 (_1!5086 (tuple2!10151 lt!376813 minValue!754))))))

(declare-fun lt!376958 () List!15945)

(assert (=> d!105447 (= lt!376961 (ListLongMap!8974 lt!376958))))

(declare-fun lt!376960 () Unit!28429)

(declare-fun lt!376959 () Unit!28429)

(assert (=> d!105447 (= lt!376960 lt!376959)))

(assert (=> d!105447 (= (getValueByKey!415 lt!376958 (_1!5086 (tuple2!10151 lt!376813 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 lt!376813 minValue!754))))))

(assert (=> d!105447 (= lt!376959 (lemmaContainsTupThenGetReturnValue!229 lt!376958 (_1!5086 (tuple2!10151 lt!376813 minValue!754)) (_2!5086 (tuple2!10151 lt!376813 minValue!754))))))

(assert (=> d!105447 (= lt!376958 (insertStrictlySorted!268 (toList!4502 lt!376812) (_1!5086 (tuple2!10151 lt!376813 minValue!754)) (_2!5086 (tuple2!10151 lt!376813 minValue!754))))))

(assert (=> d!105447 (= (+!1980 lt!376812 (tuple2!10151 lt!376813 minValue!754)) lt!376961)))

(declare-fun b!830559 () Bool)

(declare-fun res!565607 () Bool)

(assert (=> b!830559 (=> (not res!565607) (not e!463082))))

(assert (=> b!830559 (= res!565607 (= (getValueByKey!415 (toList!4502 lt!376961) (_1!5086 (tuple2!10151 lt!376813 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 lt!376813 minValue!754)))))))

(declare-fun b!830560 () Bool)

(assert (=> b!830560 (= e!463082 (contains!4209 (toList!4502 lt!376961) (tuple2!10151 lt!376813 minValue!754)))))

(assert (= (and d!105447 res!565608) b!830559))

(assert (= (and b!830559 res!565607) b!830560))

(declare-fun m!773819 () Bool)

(assert (=> d!105447 m!773819))

(declare-fun m!773821 () Bool)

(assert (=> d!105447 m!773821))

(declare-fun m!773823 () Bool)

(assert (=> d!105447 m!773823))

(declare-fun m!773825 () Bool)

(assert (=> d!105447 m!773825))

(declare-fun m!773827 () Bool)

(assert (=> b!830559 m!773827))

(declare-fun m!773829 () Bool)

(assert (=> b!830560 m!773829))

(assert (=> b!830349 d!105447))

(declare-fun d!105449 () Bool)

(assert (=> d!105449 (= (apply!372 (+!1980 lt!376825 (tuple2!10151 lt!376814 zeroValueAfter!34)) lt!376809) (apply!372 lt!376825 lt!376809))))

(declare-fun lt!376962 () Unit!28429)

(assert (=> d!105449 (= lt!376962 (choose!1419 lt!376825 lt!376814 zeroValueAfter!34 lt!376809))))

(declare-fun e!463083 () Bool)

(assert (=> d!105449 e!463083))

(declare-fun res!565609 () Bool)

(assert (=> d!105449 (=> (not res!565609) (not e!463083))))

(assert (=> d!105449 (= res!565609 (contains!4208 lt!376825 lt!376809))))

(assert (=> d!105449 (= (addApplyDifferent!323 lt!376825 lt!376814 zeroValueAfter!34 lt!376809) lt!376962)))

(declare-fun b!830561 () Bool)

(assert (=> b!830561 (= e!463083 (not (= lt!376809 lt!376814)))))

(assert (= (and d!105449 res!565609) b!830561))

(assert (=> d!105449 m!773469))

(declare-fun m!773831 () Bool)

(assert (=> d!105449 m!773831))

(assert (=> d!105449 m!773457))

(assert (=> d!105449 m!773457))

(assert (=> d!105449 m!773459))

(declare-fun m!773833 () Bool)

(assert (=> d!105449 m!773833))

(assert (=> b!830349 d!105449))

(declare-fun d!105451 () Bool)

(declare-fun e!463084 () Bool)

(assert (=> d!105451 e!463084))

(declare-fun res!565611 () Bool)

(assert (=> d!105451 (=> (not res!565611) (not e!463084))))

(declare-fun lt!376966 () ListLongMap!8973)

(assert (=> d!105451 (= res!565611 (contains!4208 lt!376966 (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))

(declare-fun lt!376963 () List!15945)

(assert (=> d!105451 (= lt!376966 (ListLongMap!8974 lt!376963))))

(declare-fun lt!376965 () Unit!28429)

(declare-fun lt!376964 () Unit!28429)

(assert (=> d!105451 (= lt!376965 lt!376964)))

(assert (=> d!105451 (= (getValueByKey!415 lt!376963 (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))) (Some!420 (_2!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))

(assert (=> d!105451 (= lt!376964 (lemmaContainsTupThenGetReturnValue!229 lt!376963 (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))

(assert (=> d!105451 (= lt!376963 (insertStrictlySorted!268 (toList!4502 lt!376825) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))

(assert (=> d!105451 (= (+!1980 lt!376825 (tuple2!10151 lt!376814 zeroValueAfter!34)) lt!376966)))

(declare-fun b!830562 () Bool)

(declare-fun res!565610 () Bool)

(assert (=> b!830562 (=> (not res!565610) (not e!463084))))

(assert (=> b!830562 (= res!565610 (= (getValueByKey!415 (toList!4502 lt!376966) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))) (Some!420 (_2!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)))))))

(declare-fun b!830563 () Bool)

(assert (=> b!830563 (= e!463084 (contains!4209 (toList!4502 lt!376966) (tuple2!10151 lt!376814 zeroValueAfter!34)))))

(assert (= (and d!105451 res!565611) b!830562))

(assert (= (and b!830562 res!565610) b!830563))

(declare-fun m!773835 () Bool)

(assert (=> d!105451 m!773835))

(declare-fun m!773837 () Bool)

(assert (=> d!105451 m!773837))

(declare-fun m!773839 () Bool)

(assert (=> d!105451 m!773839))

(declare-fun m!773841 () Bool)

(assert (=> d!105451 m!773841))

(declare-fun m!773843 () Bool)

(assert (=> b!830562 m!773843))

(declare-fun m!773845 () Bool)

(assert (=> b!830563 m!773845))

(assert (=> b!830349 d!105451))

(declare-fun d!105453 () Bool)

(assert (=> d!105453 (contains!4208 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34)) lt!376805)))

(declare-fun lt!376969 () Unit!28429)

(declare-fun choose!1420 (ListLongMap!8973 (_ BitVec 64) V!25277 (_ BitVec 64)) Unit!28429)

(assert (=> d!105453 (= lt!376969 (choose!1420 lt!376824 lt!376810 zeroValueAfter!34 lt!376805))))

(assert (=> d!105453 (contains!4208 lt!376824 lt!376805)))

(assert (=> d!105453 (= (addStillContains!323 lt!376824 lt!376810 zeroValueAfter!34 lt!376805) lt!376969)))

(declare-fun bs!23193 () Bool)

(assert (= bs!23193 d!105453))

(assert (=> bs!23193 m!773477))

(assert (=> bs!23193 m!773477))

(assert (=> bs!23193 m!773479))

(declare-fun m!773847 () Bool)

(assert (=> bs!23193 m!773847))

(declare-fun m!773849 () Bool)

(assert (=> bs!23193 m!773849))

(assert (=> b!830349 d!105453))

(assert (=> b!830330 d!105379))

(assert (=> bm!36251 d!105365))

(declare-fun d!105455 () Bool)

(assert (=> d!105455 (= (apply!372 lt!376795 #b0000000000000000000000000000000000000000000000000000000000000000) (get!11818 (getValueByKey!415 (toList!4502 lt!376795) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23194 () Bool)

(assert (= bs!23194 d!105455))

(assert (=> bs!23194 m!773605))

(assert (=> bs!23194 m!773605))

(declare-fun m!773851 () Bool)

(assert (=> bs!23194 m!773851))

(assert (=> b!830332 d!105455))

(declare-fun b!830565 () Bool)

(assert (=> b!830565 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(assert (=> b!830565 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22750 _values!788)))))

(declare-fun e!463085 () Bool)

(declare-fun lt!376975 () ListLongMap!8973)

(assert (=> b!830565 (= e!463085 (= (apply!372 lt!376975 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830566 () Bool)

(declare-fun lt!376976 () Unit!28429)

(declare-fun lt!376970 () Unit!28429)

(assert (=> b!830566 (= lt!376976 lt!376970)))

(declare-fun lt!376974 () ListLongMap!8973)

(declare-fun lt!376971 () V!25277)

(declare-fun lt!376972 () (_ BitVec 64))

(declare-fun lt!376973 () (_ BitVec 64))

(assert (=> b!830566 (not (contains!4208 (+!1980 lt!376974 (tuple2!10151 lt!376973 lt!376971)) lt!376972))))

(assert (=> b!830566 (= lt!376970 (addStillNotContains!197 lt!376974 lt!376973 lt!376971 lt!376972))))

(assert (=> b!830566 (= lt!376972 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830566 (= lt!376971 (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830566 (= lt!376973 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!36273 () ListLongMap!8973)

(assert (=> b!830566 (= lt!376974 call!36273)))

(declare-fun e!463091 () ListLongMap!8973)

(assert (=> b!830566 (= e!463091 (+!1980 call!36273 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830567 () Bool)

(declare-fun e!463086 () Bool)

(declare-fun e!463087 () Bool)

(assert (=> b!830567 (= e!463086 e!463087)))

(declare-fun c!89955 () Bool)

(declare-fun e!463089 () Bool)

(assert (=> b!830567 (= c!89955 e!463089)))

(declare-fun res!565614 () Bool)

(assert (=> b!830567 (=> (not res!565614) (not e!463089))))

(assert (=> b!830567 (= res!565614 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(declare-fun b!830568 () Bool)

(declare-fun e!463090 () ListLongMap!8973)

(assert (=> b!830568 (= e!463090 (ListLongMap!8974 Nil!15942))))

(declare-fun b!830569 () Bool)

(declare-fun res!565612 () Bool)

(assert (=> b!830569 (=> (not res!565612) (not e!463086))))

(assert (=> b!830569 (= res!565612 (not (contains!4208 lt!376975 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830570 () Bool)

(declare-fun e!463088 () Bool)

(assert (=> b!830570 (= e!463088 (isEmpty!654 lt!376975))))

(declare-fun d!105457 () Bool)

(assert (=> d!105457 e!463086))

(declare-fun res!565613 () Bool)

(assert (=> d!105457 (=> (not res!565613) (not e!463086))))

(assert (=> d!105457 (= res!565613 (not (contains!4208 lt!376975 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105457 (= lt!376975 e!463090)))

(declare-fun c!89953 () Bool)

(assert (=> d!105457 (= c!89953 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(assert (=> d!105457 (validMask!0 mask!1312)))

(assert (=> d!105457 (= (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796) lt!376975)))

(declare-fun b!830571 () Bool)

(assert (=> b!830571 (= e!463087 e!463085)))

(assert (=> b!830571 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(declare-fun res!565615 () Bool)

(assert (=> b!830571 (= res!565615 (contains!4208 lt!376975 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!830571 (=> (not res!565615) (not e!463085))))

(declare-fun b!830572 () Bool)

(assert (=> b!830572 (= e!463091 call!36273)))

(declare-fun b!830573 () Bool)

(assert (=> b!830573 (= e!463088 (= lt!376975 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!36270 () Bool)

(assert (=> bm!36270 (= call!36273 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830574 () Bool)

(assert (=> b!830574 (= e!463087 e!463088)))

(declare-fun c!89954 () Bool)

(assert (=> b!830574 (= c!89954 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(declare-fun b!830575 () Bool)

(assert (=> b!830575 (= e!463089 (validKeyInArray!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!830575 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!830576 () Bool)

(assert (=> b!830576 (= e!463090 e!463091)))

(declare-fun c!89952 () Bool)

(assert (=> b!830576 (= c!89952 (validKeyInArray!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!105457 c!89953) b!830568))

(assert (= (and d!105457 (not c!89953)) b!830576))

(assert (= (and b!830576 c!89952) b!830566))

(assert (= (and b!830576 (not c!89952)) b!830572))

(assert (= (or b!830566 b!830572) bm!36270))

(assert (= (and d!105457 res!565613) b!830569))

(assert (= (and b!830569 res!565612) b!830567))

(assert (= (and b!830567 res!565614) b!830575))

(assert (= (and b!830567 c!89955) b!830571))

(assert (= (and b!830567 (not c!89955)) b!830574))

(assert (= (and b!830571 res!565615) b!830565))

(assert (= (and b!830574 c!89954) b!830573))

(assert (= (and b!830574 (not c!89954)) b!830570))

(declare-fun b_lambda!11371 () Bool)

(assert (=> (not b_lambda!11371) (not b!830565)))

(assert (=> b!830565 t!22314))

(declare-fun b_and!22543 () Bool)

(assert (= b_and!22541 (and (=> t!22314 result!8015) b_and!22543)))

(declare-fun b_lambda!11373 () Bool)

(assert (=> (not b_lambda!11373) (not b!830566)))

(assert (=> b!830566 t!22314))

(declare-fun b_and!22545 () Bool)

(assert (= b_and!22543 (and (=> t!22314 result!8015) b_and!22545)))

(declare-fun m!773853 () Bool)

(assert (=> bm!36270 m!773853))

(declare-fun m!773855 () Bool)

(assert (=> b!830565 m!773855))

(assert (=> b!830565 m!773855))

(assert (=> b!830565 m!773433))

(declare-fun m!773857 () Bool)

(assert (=> b!830565 m!773857))

(assert (=> b!830565 m!773433))

(declare-fun m!773859 () Bool)

(assert (=> b!830565 m!773859))

(declare-fun m!773861 () Bool)

(assert (=> b!830565 m!773861))

(assert (=> b!830565 m!773859))

(declare-fun m!773863 () Bool)

(assert (=> b!830570 m!773863))

(assert (=> b!830571 m!773859))

(assert (=> b!830571 m!773859))

(declare-fun m!773865 () Bool)

(assert (=> b!830571 m!773865))

(assert (=> b!830576 m!773859))

(assert (=> b!830576 m!773859))

(declare-fun m!773867 () Bool)

(assert (=> b!830576 m!773867))

(assert (=> b!830566 m!773855))

(declare-fun m!773869 () Bool)

(assert (=> b!830566 m!773869))

(assert (=> b!830566 m!773433))

(declare-fun m!773871 () Bool)

(assert (=> b!830566 m!773871))

(assert (=> b!830566 m!773855))

(assert (=> b!830566 m!773433))

(assert (=> b!830566 m!773857))

(assert (=> b!830566 m!773869))

(declare-fun m!773873 () Bool)

(assert (=> b!830566 m!773873))

(declare-fun m!773875 () Bool)

(assert (=> b!830566 m!773875))

(assert (=> b!830566 m!773859))

(declare-fun m!773877 () Bool)

(assert (=> b!830569 m!773877))

(assert (=> b!830575 m!773859))

(assert (=> b!830575 m!773859))

(assert (=> b!830575 m!773867))

(assert (=> b!830573 m!773853))

(declare-fun m!773879 () Bool)

(assert (=> d!105457 m!773879))

(assert (=> d!105457 m!773289))

(assert (=> b!830408 d!105457))

(assert (=> b!830255 d!105379))

(declare-fun b!830577 () Bool)

(assert (=> b!830577 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(assert (=> b!830577 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22750 _values!788)))))

(declare-fun e!463092 () Bool)

(declare-fun lt!376982 () ListLongMap!8973)

(assert (=> b!830577 (= e!463092 (= (apply!372 lt!376982 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830578 () Bool)

(declare-fun lt!376983 () Unit!28429)

(declare-fun lt!376977 () Unit!28429)

(assert (=> b!830578 (= lt!376983 lt!376977)))

(declare-fun lt!376979 () (_ BitVec 64))

(declare-fun lt!376981 () ListLongMap!8973)

(declare-fun lt!376978 () V!25277)

(declare-fun lt!376980 () (_ BitVec 64))

(assert (=> b!830578 (not (contains!4208 (+!1980 lt!376981 (tuple2!10151 lt!376980 lt!376978)) lt!376979))))

(assert (=> b!830578 (= lt!376977 (addStillNotContains!197 lt!376981 lt!376980 lt!376978 lt!376979))))

(assert (=> b!830578 (= lt!376979 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830578 (= lt!376978 (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830578 (= lt!376980 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!36274 () ListLongMap!8973)

(assert (=> b!830578 (= lt!376981 call!36274)))

(declare-fun e!463098 () ListLongMap!8973)

(assert (=> b!830578 (= e!463098 (+!1980 call!36274 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830579 () Bool)

(declare-fun e!463093 () Bool)

(declare-fun e!463094 () Bool)

(assert (=> b!830579 (= e!463093 e!463094)))

(declare-fun c!89959 () Bool)

(declare-fun e!463096 () Bool)

(assert (=> b!830579 (= c!89959 e!463096)))

(declare-fun res!565618 () Bool)

(assert (=> b!830579 (=> (not res!565618) (not e!463096))))

(assert (=> b!830579 (= res!565618 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(declare-fun b!830580 () Bool)

(declare-fun e!463097 () ListLongMap!8973)

(assert (=> b!830580 (= e!463097 (ListLongMap!8974 Nil!15942))))

(declare-fun b!830581 () Bool)

(declare-fun res!565616 () Bool)

(assert (=> b!830581 (=> (not res!565616) (not e!463093))))

(assert (=> b!830581 (= res!565616 (not (contains!4208 lt!376982 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830582 () Bool)

(declare-fun e!463095 () Bool)

(assert (=> b!830582 (= e!463095 (isEmpty!654 lt!376982))))

(declare-fun d!105459 () Bool)

(assert (=> d!105459 e!463093))

(declare-fun res!565617 () Bool)

(assert (=> d!105459 (=> (not res!565617) (not e!463093))))

(assert (=> d!105459 (= res!565617 (not (contains!4208 lt!376982 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105459 (= lt!376982 e!463097)))

(declare-fun c!89957 () Bool)

(assert (=> d!105459 (= c!89957 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(assert (=> d!105459 (validMask!0 mask!1312)))

(assert (=> d!105459 (= (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796) lt!376982)))

(declare-fun b!830583 () Bool)

(assert (=> b!830583 (= e!463094 e!463092)))

(assert (=> b!830583 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(declare-fun res!565619 () Bool)

(assert (=> b!830583 (= res!565619 (contains!4208 lt!376982 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!830583 (=> (not res!565619) (not e!463092))))

(declare-fun b!830584 () Bool)

(assert (=> b!830584 (= e!463098 call!36274)))

(declare-fun b!830585 () Bool)

(assert (=> b!830585 (= e!463095 (= lt!376982 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!36271 () Bool)

(assert (=> bm!36271 (= call!36274 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830586 () Bool)

(assert (=> b!830586 (= e!463094 e!463095)))

(declare-fun c!89958 () Bool)

(assert (=> b!830586 (= c!89958 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(declare-fun b!830587 () Bool)

(assert (=> b!830587 (= e!463096 (validKeyInArray!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!830587 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!830588 () Bool)

(assert (=> b!830588 (= e!463097 e!463098)))

(declare-fun c!89956 () Bool)

(assert (=> b!830588 (= c!89956 (validKeyInArray!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!105459 c!89957) b!830580))

(assert (= (and d!105459 (not c!89957)) b!830588))

(assert (= (and b!830588 c!89956) b!830578))

(assert (= (and b!830588 (not c!89956)) b!830584))

(assert (= (or b!830578 b!830584) bm!36271))

(assert (= (and d!105459 res!565617) b!830581))

(assert (= (and b!830581 res!565616) b!830579))

(assert (= (and b!830579 res!565618) b!830587))

(assert (= (and b!830579 c!89959) b!830583))

(assert (= (and b!830579 (not c!89959)) b!830586))

(assert (= (and b!830583 res!565619) b!830577))

(assert (= (and b!830586 c!89958) b!830585))

(assert (= (and b!830586 (not c!89958)) b!830582))

(declare-fun b_lambda!11375 () Bool)

(assert (=> (not b_lambda!11375) (not b!830577)))

(assert (=> b!830577 t!22314))

(declare-fun b_and!22547 () Bool)

(assert (= b_and!22545 (and (=> t!22314 result!8015) b_and!22547)))

(declare-fun b_lambda!11377 () Bool)

(assert (=> (not b_lambda!11377) (not b!830578)))

(assert (=> b!830578 t!22314))

(declare-fun b_and!22549 () Bool)

(assert (= b_and!22547 (and (=> t!22314 result!8015) b_and!22549)))

(declare-fun m!773881 () Bool)

(assert (=> bm!36271 m!773881))

(assert (=> b!830577 m!773855))

(assert (=> b!830577 m!773855))

(assert (=> b!830577 m!773433))

(assert (=> b!830577 m!773857))

(assert (=> b!830577 m!773433))

(assert (=> b!830577 m!773859))

(declare-fun m!773883 () Bool)

(assert (=> b!830577 m!773883))

(assert (=> b!830577 m!773859))

(declare-fun m!773885 () Bool)

(assert (=> b!830582 m!773885))

(assert (=> b!830583 m!773859))

(assert (=> b!830583 m!773859))

(declare-fun m!773887 () Bool)

(assert (=> b!830583 m!773887))

(assert (=> b!830588 m!773859))

(assert (=> b!830588 m!773859))

(assert (=> b!830588 m!773867))

(assert (=> b!830578 m!773855))

(declare-fun m!773889 () Bool)

(assert (=> b!830578 m!773889))

(assert (=> b!830578 m!773433))

(declare-fun m!773891 () Bool)

(assert (=> b!830578 m!773891))

(assert (=> b!830578 m!773855))

(assert (=> b!830578 m!773433))

(assert (=> b!830578 m!773857))

(assert (=> b!830578 m!773889))

(declare-fun m!773893 () Bool)

(assert (=> b!830578 m!773893))

(declare-fun m!773895 () Bool)

(assert (=> b!830578 m!773895))

(assert (=> b!830578 m!773859))

(declare-fun m!773897 () Bool)

(assert (=> b!830581 m!773897))

(assert (=> b!830587 m!773859))

(assert (=> b!830587 m!773859))

(assert (=> b!830587 m!773867))

(assert (=> b!830585 m!773881))

(declare-fun m!773899 () Bool)

(assert (=> d!105459 m!773899))

(assert (=> d!105459 m!773289))

(assert (=> bm!36256 d!105459))

(declare-fun d!105461 () Bool)

(declare-fun lt!376986 () Bool)

(declare-fun content!387 (List!15944) (InoxSet (_ BitVec 64)))

(assert (=> d!105461 (= lt!376986 (select (content!387 Nil!15941) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!463103 () Bool)

(assert (=> d!105461 (= lt!376986 e!463103)))

(declare-fun res!565624 () Bool)

(assert (=> d!105461 (=> (not res!565624) (not e!463103))))

(assert (=> d!105461 (= res!565624 ((_ is Cons!15940) Nil!15941))))

(assert (=> d!105461 (= (contains!4210 Nil!15941 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) lt!376986)))

(declare-fun b!830593 () Bool)

(declare-fun e!463104 () Bool)

(assert (=> b!830593 (= e!463103 e!463104)))

(declare-fun res!565625 () Bool)

(assert (=> b!830593 (=> res!565625 e!463104)))

(assert (=> b!830593 (= res!565625 (= (h!17069 Nil!15941) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830594 () Bool)

(assert (=> b!830594 (= e!463104 (contains!4210 (t!22309 Nil!15941) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105461 res!565624) b!830593))

(assert (= (and b!830593 (not res!565625)) b!830594))

(declare-fun m!773901 () Bool)

(assert (=> d!105461 m!773901))

(assert (=> d!105461 m!773353))

(declare-fun m!773903 () Bool)

(assert (=> d!105461 m!773903))

(assert (=> b!830594 m!773353))

(declare-fun m!773905 () Bool)

(assert (=> b!830594 m!773905))

(assert (=> b!830256 d!105461))

(assert (=> b!830398 d!105379))

(declare-fun d!105463 () Bool)

(declare-fun e!463105 () Bool)

(assert (=> d!105463 e!463105))

(declare-fun res!565627 () Bool)

(assert (=> d!105463 (=> (not res!565627) (not e!463105))))

(declare-fun lt!376990 () ListLongMap!8973)

(assert (=> d!105463 (= res!565627 (contains!4208 lt!376990 (_1!5086 (tuple2!10151 lt!376791 minValue!754))))))

(declare-fun lt!376987 () List!15945)

(assert (=> d!105463 (= lt!376990 (ListLongMap!8974 lt!376987))))

(declare-fun lt!376989 () Unit!28429)

(declare-fun lt!376988 () Unit!28429)

(assert (=> d!105463 (= lt!376989 lt!376988)))

(assert (=> d!105463 (= (getValueByKey!415 lt!376987 (_1!5086 (tuple2!10151 lt!376791 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 lt!376791 minValue!754))))))

(assert (=> d!105463 (= lt!376988 (lemmaContainsTupThenGetReturnValue!229 lt!376987 (_1!5086 (tuple2!10151 lt!376791 minValue!754)) (_2!5086 (tuple2!10151 lt!376791 minValue!754))))))

(assert (=> d!105463 (= lt!376987 (insertStrictlySorted!268 (toList!4502 lt!376790) (_1!5086 (tuple2!10151 lt!376791 minValue!754)) (_2!5086 (tuple2!10151 lt!376791 minValue!754))))))

(assert (=> d!105463 (= (+!1980 lt!376790 (tuple2!10151 lt!376791 minValue!754)) lt!376990)))

(declare-fun b!830595 () Bool)

(declare-fun res!565626 () Bool)

(assert (=> b!830595 (=> (not res!565626) (not e!463105))))

(assert (=> b!830595 (= res!565626 (= (getValueByKey!415 (toList!4502 lt!376990) (_1!5086 (tuple2!10151 lt!376791 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 lt!376791 minValue!754)))))))

(declare-fun b!830596 () Bool)

(assert (=> b!830596 (= e!463105 (contains!4209 (toList!4502 lt!376990) (tuple2!10151 lt!376791 minValue!754)))))

(assert (= (and d!105463 res!565627) b!830595))

(assert (= (and b!830595 res!565626) b!830596))

(declare-fun m!773907 () Bool)

(assert (=> d!105463 m!773907))

(declare-fun m!773909 () Bool)

(assert (=> d!105463 m!773909))

(declare-fun m!773911 () Bool)

(assert (=> d!105463 m!773911))

(declare-fun m!773913 () Bool)

(assert (=> d!105463 m!773913))

(declare-fun m!773915 () Bool)

(assert (=> b!830595 m!773915))

(declare-fun m!773917 () Bool)

(assert (=> b!830596 m!773917))

(assert (=> b!830326 d!105463))

(declare-fun d!105465 () Bool)

(assert (=> d!105465 (= (apply!372 (+!1980 lt!376794 (tuple2!10151 lt!376782 minValue!754)) lt!376796) (get!11818 (getValueByKey!415 (toList!4502 (+!1980 lt!376794 (tuple2!10151 lt!376782 minValue!754))) lt!376796)))))

(declare-fun bs!23195 () Bool)

(assert (= bs!23195 d!105465))

(declare-fun m!773919 () Bool)

(assert (=> bs!23195 m!773919))

(assert (=> bs!23195 m!773919))

(declare-fun m!773921 () Bool)

(assert (=> bs!23195 m!773921))

(assert (=> b!830326 d!105465))

(declare-fun d!105467 () Bool)

(assert (=> d!105467 (= (apply!372 lt!376803 lt!376787) (get!11818 (getValueByKey!415 (toList!4502 lt!376803) lt!376787)))))

(declare-fun bs!23196 () Bool)

(assert (= bs!23196 d!105467))

(declare-fun m!773923 () Bool)

(assert (=> bs!23196 m!773923))

(assert (=> bs!23196 m!773923))

(declare-fun m!773925 () Bool)

(assert (=> bs!23196 m!773925))

(assert (=> b!830326 d!105467))

(declare-fun d!105469 () Bool)

(assert (=> d!105469 (= (apply!372 lt!376794 lt!376796) (get!11818 (getValueByKey!415 (toList!4502 lt!376794) lt!376796)))))

(declare-fun bs!23197 () Bool)

(assert (= bs!23197 d!105469))

(declare-fun m!773927 () Bool)

(assert (=> bs!23197 m!773927))

(assert (=> bs!23197 m!773927))

(declare-fun m!773929 () Bool)

(assert (=> bs!23197 m!773929))

(assert (=> b!830326 d!105469))

(declare-fun d!105471 () Bool)

(assert (=> d!105471 (= (apply!372 lt!376790 lt!376799) (get!11818 (getValueByKey!415 (toList!4502 lt!376790) lt!376799)))))

(declare-fun bs!23198 () Bool)

(assert (= bs!23198 d!105471))

(declare-fun m!773931 () Bool)

(assert (=> bs!23198 m!773931))

(assert (=> bs!23198 m!773931))

(declare-fun m!773933 () Bool)

(assert (=> bs!23198 m!773933))

(assert (=> b!830326 d!105471))

(declare-fun d!105473 () Bool)

(assert (=> d!105473 (contains!4208 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34)) lt!376783)))

(declare-fun lt!376991 () Unit!28429)

(assert (=> d!105473 (= lt!376991 (choose!1420 lt!376802 lt!376788 zeroValueBefore!34 lt!376783))))

(assert (=> d!105473 (contains!4208 lt!376802 lt!376783)))

(assert (=> d!105473 (= (addStillContains!323 lt!376802 lt!376788 zeroValueBefore!34 lt!376783) lt!376991)))

(declare-fun bs!23199 () Bool)

(assert (= bs!23199 d!105473))

(assert (=> bs!23199 m!773425))

(assert (=> bs!23199 m!773425))

(assert (=> bs!23199 m!773427))

(declare-fun m!773935 () Bool)

(assert (=> bs!23199 m!773935))

(declare-fun m!773937 () Bool)

(assert (=> bs!23199 m!773937))

(assert (=> b!830326 d!105473))

(declare-fun d!105475 () Bool)

(declare-fun e!463106 () Bool)

(assert (=> d!105475 e!463106))

(declare-fun res!565628 () Bool)

(assert (=> d!105475 (=> res!565628 e!463106)))

(declare-fun lt!376992 () Bool)

(assert (=> d!105475 (= res!565628 (not lt!376992))))

(declare-fun lt!376994 () Bool)

(assert (=> d!105475 (= lt!376992 lt!376994)))

(declare-fun lt!376993 () Unit!28429)

(declare-fun e!463107 () Unit!28429)

(assert (=> d!105475 (= lt!376993 e!463107)))

(declare-fun c!89960 () Bool)

(assert (=> d!105475 (= c!89960 lt!376994)))

(assert (=> d!105475 (= lt!376994 (containsKey!401 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))) lt!376783))))

(assert (=> d!105475 (= (contains!4208 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34)) lt!376783) lt!376992)))

(declare-fun b!830597 () Bool)

(declare-fun lt!376995 () Unit!28429)

(assert (=> b!830597 (= e!463107 lt!376995)))

(assert (=> b!830597 (= lt!376995 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))) lt!376783))))

(assert (=> b!830597 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))) lt!376783))))

(declare-fun b!830598 () Bool)

(declare-fun Unit!28445 () Unit!28429)

(assert (=> b!830598 (= e!463107 Unit!28445)))

(declare-fun b!830599 () Bool)

(assert (=> b!830599 (= e!463106 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))) lt!376783)))))

(assert (= (and d!105475 c!89960) b!830597))

(assert (= (and d!105475 (not c!89960)) b!830598))

(assert (= (and d!105475 (not res!565628)) b!830599))

(declare-fun m!773939 () Bool)

(assert (=> d!105475 m!773939))

(declare-fun m!773941 () Bool)

(assert (=> b!830597 m!773941))

(declare-fun m!773943 () Bool)

(assert (=> b!830597 m!773943))

(assert (=> b!830597 m!773943))

(declare-fun m!773945 () Bool)

(assert (=> b!830597 m!773945))

(assert (=> b!830599 m!773943))

(assert (=> b!830599 m!773943))

(assert (=> b!830599 m!773945))

(assert (=> b!830326 d!105475))

(declare-fun d!105477 () Bool)

(assert (=> d!105477 (= (apply!372 (+!1980 lt!376790 (tuple2!10151 lt!376791 minValue!754)) lt!376799) (get!11818 (getValueByKey!415 (toList!4502 (+!1980 lt!376790 (tuple2!10151 lt!376791 minValue!754))) lt!376799)))))

(declare-fun bs!23200 () Bool)

(assert (= bs!23200 d!105477))

(declare-fun m!773947 () Bool)

(assert (=> bs!23200 m!773947))

(assert (=> bs!23200 m!773947))

(declare-fun m!773949 () Bool)

(assert (=> bs!23200 m!773949))

(assert (=> b!830326 d!105477))

(declare-fun d!105479 () Bool)

(declare-fun e!463108 () Bool)

(assert (=> d!105479 e!463108))

(declare-fun res!565630 () Bool)

(assert (=> d!105479 (=> (not res!565630) (not e!463108))))

(declare-fun lt!376999 () ListLongMap!8973)

(assert (=> d!105479 (= res!565630 (contains!4208 lt!376999 (_1!5086 (tuple2!10151 lt!376782 minValue!754))))))

(declare-fun lt!376996 () List!15945)

(assert (=> d!105479 (= lt!376999 (ListLongMap!8974 lt!376996))))

(declare-fun lt!376998 () Unit!28429)

(declare-fun lt!376997 () Unit!28429)

(assert (=> d!105479 (= lt!376998 lt!376997)))

(assert (=> d!105479 (= (getValueByKey!415 lt!376996 (_1!5086 (tuple2!10151 lt!376782 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 lt!376782 minValue!754))))))

(assert (=> d!105479 (= lt!376997 (lemmaContainsTupThenGetReturnValue!229 lt!376996 (_1!5086 (tuple2!10151 lt!376782 minValue!754)) (_2!5086 (tuple2!10151 lt!376782 minValue!754))))))

(assert (=> d!105479 (= lt!376996 (insertStrictlySorted!268 (toList!4502 lt!376794) (_1!5086 (tuple2!10151 lt!376782 minValue!754)) (_2!5086 (tuple2!10151 lt!376782 minValue!754))))))

(assert (=> d!105479 (= (+!1980 lt!376794 (tuple2!10151 lt!376782 minValue!754)) lt!376999)))

(declare-fun b!830600 () Bool)

(declare-fun res!565629 () Bool)

(assert (=> b!830600 (=> (not res!565629) (not e!463108))))

(assert (=> b!830600 (= res!565629 (= (getValueByKey!415 (toList!4502 lt!376999) (_1!5086 (tuple2!10151 lt!376782 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 lt!376782 minValue!754)))))))

(declare-fun b!830601 () Bool)

(assert (=> b!830601 (= e!463108 (contains!4209 (toList!4502 lt!376999) (tuple2!10151 lt!376782 minValue!754)))))

(assert (= (and d!105479 res!565630) b!830600))

(assert (= (and b!830600 res!565629) b!830601))

(declare-fun m!773951 () Bool)

(assert (=> d!105479 m!773951))

(declare-fun m!773953 () Bool)

(assert (=> d!105479 m!773953))

(declare-fun m!773955 () Bool)

(assert (=> d!105479 m!773955))

(declare-fun m!773957 () Bool)

(assert (=> d!105479 m!773957))

(declare-fun m!773959 () Bool)

(assert (=> b!830600 m!773959))

(declare-fun m!773961 () Bool)

(assert (=> b!830601 m!773961))

(assert (=> b!830326 d!105479))

(declare-fun d!105481 () Bool)

(declare-fun e!463109 () Bool)

(assert (=> d!105481 e!463109))

(declare-fun res!565632 () Bool)

(assert (=> d!105481 (=> (not res!565632) (not e!463109))))

(declare-fun lt!377003 () ListLongMap!8973)

(assert (=> d!105481 (= res!565632 (contains!4208 lt!377003 (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))

(declare-fun lt!377000 () List!15945)

(assert (=> d!105481 (= lt!377003 (ListLongMap!8974 lt!377000))))

(declare-fun lt!377002 () Unit!28429)

(declare-fun lt!377001 () Unit!28429)

(assert (=> d!105481 (= lt!377002 lt!377001)))

(assert (=> d!105481 (= (getValueByKey!415 lt!377000 (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))) (Some!420 (_2!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))

(assert (=> d!105481 (= lt!377001 (lemmaContainsTupThenGetReturnValue!229 lt!377000 (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))

(assert (=> d!105481 (= lt!377000 (insertStrictlySorted!268 (toList!4502 lt!376803) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))

(assert (=> d!105481 (= (+!1980 lt!376803 (tuple2!10151 lt!376792 zeroValueBefore!34)) lt!377003)))

(declare-fun b!830602 () Bool)

(declare-fun res!565631 () Bool)

(assert (=> b!830602 (=> (not res!565631) (not e!463109))))

(assert (=> b!830602 (= res!565631 (= (getValueByKey!415 (toList!4502 lt!377003) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))) (Some!420 (_2!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)))))))

(declare-fun b!830603 () Bool)

(assert (=> b!830603 (= e!463109 (contains!4209 (toList!4502 lt!377003) (tuple2!10151 lt!376792 zeroValueBefore!34)))))

(assert (= (and d!105481 res!565632) b!830602))

(assert (= (and b!830602 res!565631) b!830603))

(declare-fun m!773963 () Bool)

(assert (=> d!105481 m!773963))

(declare-fun m!773965 () Bool)

(assert (=> d!105481 m!773965))

(declare-fun m!773967 () Bool)

(assert (=> d!105481 m!773967))

(declare-fun m!773969 () Bool)

(assert (=> d!105481 m!773969))

(declare-fun m!773971 () Bool)

(assert (=> b!830602 m!773971))

(declare-fun m!773973 () Bool)

(assert (=> b!830603 m!773973))

(assert (=> b!830326 d!105481))

(declare-fun d!105483 () Bool)

(assert (=> d!105483 (= (apply!372 (+!1980 lt!376794 (tuple2!10151 lt!376782 minValue!754)) lt!376796) (apply!372 lt!376794 lt!376796))))

(declare-fun lt!377004 () Unit!28429)

(assert (=> d!105483 (= lt!377004 (choose!1419 lt!376794 lt!376782 minValue!754 lt!376796))))

(declare-fun e!463110 () Bool)

(assert (=> d!105483 e!463110))

(declare-fun res!565633 () Bool)

(assert (=> d!105483 (=> (not res!565633) (not e!463110))))

(assert (=> d!105483 (= res!565633 (contains!4208 lt!376794 lt!376796))))

(assert (=> d!105483 (= (addApplyDifferent!323 lt!376794 lt!376782 minValue!754 lt!376796) lt!377004)))

(declare-fun b!830604 () Bool)

(assert (=> b!830604 (= e!463110 (not (= lt!376796 lt!376782)))))

(assert (= (and d!105483 res!565633) b!830604))

(assert (=> d!105483 m!773415))

(declare-fun m!773975 () Bool)

(assert (=> d!105483 m!773975))

(assert (=> d!105483 m!773401))

(assert (=> d!105483 m!773401))

(assert (=> d!105483 m!773403))

(declare-fun m!773977 () Bool)

(assert (=> d!105483 m!773977))

(assert (=> b!830326 d!105483))

(declare-fun d!105485 () Bool)

(assert (=> d!105485 (= (apply!372 (+!1980 lt!376803 (tuple2!10151 lt!376792 zeroValueBefore!34)) lt!376787) (apply!372 lt!376803 lt!376787))))

(declare-fun lt!377005 () Unit!28429)

(assert (=> d!105485 (= lt!377005 (choose!1419 lt!376803 lt!376792 zeroValueBefore!34 lt!376787))))

(declare-fun e!463111 () Bool)

(assert (=> d!105485 e!463111))

(declare-fun res!565634 () Bool)

(assert (=> d!105485 (=> (not res!565634) (not e!463111))))

(assert (=> d!105485 (= res!565634 (contains!4208 lt!376803 lt!376787))))

(assert (=> d!105485 (= (addApplyDifferent!323 lt!376803 lt!376792 zeroValueBefore!34 lt!376787) lt!377005)))

(declare-fun b!830605 () Bool)

(assert (=> b!830605 (= e!463111 (not (= lt!376787 lt!376792)))))

(assert (= (and d!105485 res!565634) b!830605))

(assert (=> d!105485 m!773417))

(declare-fun m!773979 () Bool)

(assert (=> d!105485 m!773979))

(assert (=> d!105485 m!773405))

(assert (=> d!105485 m!773405))

(assert (=> d!105485 m!773407))

(declare-fun m!773981 () Bool)

(assert (=> d!105485 m!773981))

(assert (=> b!830326 d!105485))

(declare-fun d!105487 () Bool)

(assert (=> d!105487 (= (apply!372 (+!1980 lt!376790 (tuple2!10151 lt!376791 minValue!754)) lt!376799) (apply!372 lt!376790 lt!376799))))

(declare-fun lt!377006 () Unit!28429)

(assert (=> d!105487 (= lt!377006 (choose!1419 lt!376790 lt!376791 minValue!754 lt!376799))))

(declare-fun e!463112 () Bool)

(assert (=> d!105487 e!463112))

(declare-fun res!565635 () Bool)

(assert (=> d!105487 (=> (not res!565635) (not e!463112))))

(assert (=> d!105487 (= res!565635 (contains!4208 lt!376790 lt!376799))))

(assert (=> d!105487 (= (addApplyDifferent!323 lt!376790 lt!376791 minValue!754 lt!376799) lt!377006)))

(declare-fun b!830606 () Bool)

(assert (=> b!830606 (= e!463112 (not (= lt!376799 lt!376791)))))

(assert (= (and d!105487 res!565635) b!830606))

(assert (=> d!105487 m!773399))

(declare-fun m!773983 () Bool)

(assert (=> d!105487 m!773983))

(assert (=> d!105487 m!773413))

(assert (=> d!105487 m!773413))

(assert (=> d!105487 m!773419))

(declare-fun m!773985 () Bool)

(assert (=> d!105487 m!773985))

(assert (=> b!830326 d!105487))

(declare-fun d!105489 () Bool)

(declare-fun e!463113 () Bool)

(assert (=> d!105489 e!463113))

(declare-fun res!565637 () Bool)

(assert (=> d!105489 (=> (not res!565637) (not e!463113))))

(declare-fun lt!377010 () ListLongMap!8973)

(assert (=> d!105489 (= res!565637 (contains!4208 lt!377010 (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))

(declare-fun lt!377007 () List!15945)

(assert (=> d!105489 (= lt!377010 (ListLongMap!8974 lt!377007))))

(declare-fun lt!377009 () Unit!28429)

(declare-fun lt!377008 () Unit!28429)

(assert (=> d!105489 (= lt!377009 lt!377008)))

(assert (=> d!105489 (= (getValueByKey!415 lt!377007 (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))) (Some!420 (_2!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))

(assert (=> d!105489 (= lt!377008 (lemmaContainsTupThenGetReturnValue!229 lt!377007 (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))

(assert (=> d!105489 (= lt!377007 (insertStrictlySorted!268 (toList!4502 lt!376802) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))

(assert (=> d!105489 (= (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34)) lt!377010)))

(declare-fun b!830607 () Bool)

(declare-fun res!565636 () Bool)

(assert (=> b!830607 (=> (not res!565636) (not e!463113))))

(assert (=> b!830607 (= res!565636 (= (getValueByKey!415 (toList!4502 lt!377010) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))) (Some!420 (_2!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)))))))

(declare-fun b!830608 () Bool)

(assert (=> b!830608 (= e!463113 (contains!4209 (toList!4502 lt!377010) (tuple2!10151 lt!376788 zeroValueBefore!34)))))

(assert (= (and d!105489 res!565637) b!830607))

(assert (= (and b!830607 res!565636) b!830608))

(declare-fun m!773987 () Bool)

(assert (=> d!105489 m!773987))

(declare-fun m!773989 () Bool)

(assert (=> d!105489 m!773989))

(declare-fun m!773991 () Bool)

(assert (=> d!105489 m!773991))

(declare-fun m!773993 () Bool)

(assert (=> d!105489 m!773993))

(declare-fun m!773995 () Bool)

(assert (=> b!830607 m!773995))

(declare-fun m!773997 () Bool)

(assert (=> b!830608 m!773997))

(assert (=> b!830326 d!105489))

(assert (=> b!830326 d!105367))

(declare-fun d!105491 () Bool)

(assert (=> d!105491 (= (apply!372 (+!1980 lt!376803 (tuple2!10151 lt!376792 zeroValueBefore!34)) lt!376787) (get!11818 (getValueByKey!415 (toList!4502 (+!1980 lt!376803 (tuple2!10151 lt!376792 zeroValueBefore!34))) lt!376787)))))

(declare-fun bs!23201 () Bool)

(assert (= bs!23201 d!105491))

(declare-fun m!773999 () Bool)

(assert (=> bs!23201 m!773999))

(assert (=> bs!23201 m!773999))

(declare-fun m!774001 () Bool)

(assert (=> bs!23201 m!774001))

(assert (=> b!830326 d!105491))

(declare-fun d!105493 () Bool)

(declare-fun lt!377011 () Bool)

(assert (=> d!105493 (= lt!377011 (select (content!386 (toList!4502 lt!376716)) lt!376677))))

(declare-fun e!463115 () Bool)

(assert (=> d!105493 (= lt!377011 e!463115)))

(declare-fun res!565638 () Bool)

(assert (=> d!105493 (=> (not res!565638) (not e!463115))))

(assert (=> d!105493 (= res!565638 ((_ is Cons!15941) (toList!4502 lt!376716)))))

(assert (=> d!105493 (= (contains!4209 (toList!4502 lt!376716) lt!376677) lt!377011)))

(declare-fun b!830609 () Bool)

(declare-fun e!463114 () Bool)

(assert (=> b!830609 (= e!463115 e!463114)))

(declare-fun res!565639 () Bool)

(assert (=> b!830609 (=> res!565639 e!463114)))

(assert (=> b!830609 (= res!565639 (= (h!17070 (toList!4502 lt!376716)) lt!376677))))

(declare-fun b!830610 () Bool)

(assert (=> b!830610 (= e!463114 (contains!4209 (t!22310 (toList!4502 lt!376716)) lt!376677))))

(assert (= (and d!105493 res!565638) b!830609))

(assert (= (and b!830609 (not res!565639)) b!830610))

(declare-fun m!774003 () Bool)

(assert (=> d!105493 m!774003))

(declare-fun m!774005 () Bool)

(assert (=> d!105493 m!774005))

(declare-fun m!774007 () Bool)

(assert (=> b!830610 m!774007))

(assert (=> b!830240 d!105493))

(declare-fun d!105495 () Bool)

(declare-fun lt!377012 () Bool)

(assert (=> d!105495 (= lt!377012 (select (content!386 (toList!4502 lt!376720)) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!463117 () Bool)

(assert (=> d!105495 (= lt!377012 e!463117)))

(declare-fun res!565640 () Bool)

(assert (=> d!105495 (=> (not res!565640) (not e!463117))))

(assert (=> d!105495 (= res!565640 ((_ is Cons!15941) (toList!4502 lt!376720)))))

(assert (=> d!105495 (= (contains!4209 (toList!4502 lt!376720) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377012)))

(declare-fun b!830611 () Bool)

(declare-fun e!463116 () Bool)

(assert (=> b!830611 (= e!463117 e!463116)))

(declare-fun res!565641 () Bool)

(assert (=> b!830611 (=> res!565641 e!463116)))

(assert (=> b!830611 (= res!565641 (= (h!17070 (toList!4502 lt!376720)) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!830612 () Bool)

(assert (=> b!830612 (= e!463116 (contains!4209 (t!22310 (toList!4502 lt!376720)) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105495 res!565640) b!830611))

(assert (= (and b!830611 (not res!565641)) b!830612))

(declare-fun m!774009 () Bool)

(assert (=> d!105495 m!774009))

(declare-fun m!774011 () Bool)

(assert (=> d!105495 m!774011))

(declare-fun m!774013 () Bool)

(assert (=> b!830612 m!774013))

(assert (=> b!830242 d!105495))

(declare-fun d!105497 () Bool)

(declare-fun e!463118 () Bool)

(assert (=> d!105497 e!463118))

(declare-fun res!565642 () Bool)

(assert (=> d!105497 (=> res!565642 e!463118)))

(declare-fun lt!377013 () Bool)

(assert (=> d!105497 (= res!565642 (not lt!377013))))

(declare-fun lt!377015 () Bool)

(assert (=> d!105497 (= lt!377013 lt!377015)))

(declare-fun lt!377014 () Unit!28429)

(declare-fun e!463119 () Unit!28429)

(assert (=> d!105497 (= lt!377014 e!463119)))

(declare-fun c!89961 () Bool)

(assert (=> d!105497 (= c!89961 lt!377015)))

(assert (=> d!105497 (= lt!377015 (containsKey!401 (toList!4502 lt!376733) (_1!5086 lt!376679)))))

(assert (=> d!105497 (= (contains!4208 lt!376733 (_1!5086 lt!376679)) lt!377013)))

(declare-fun b!830613 () Bool)

(declare-fun lt!377016 () Unit!28429)

(assert (=> b!830613 (= e!463119 lt!377016)))

(assert (=> b!830613 (= lt!377016 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376733) (_1!5086 lt!376679)))))

(assert (=> b!830613 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376733) (_1!5086 lt!376679)))))

(declare-fun b!830614 () Bool)

(declare-fun Unit!28446 () Unit!28429)

(assert (=> b!830614 (= e!463119 Unit!28446)))

(declare-fun b!830615 () Bool)

(assert (=> b!830615 (= e!463118 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376733) (_1!5086 lt!376679))))))

(assert (= (and d!105497 c!89961) b!830613))

(assert (= (and d!105497 (not c!89961)) b!830614))

(assert (= (and d!105497 (not res!565642)) b!830615))

(declare-fun m!774015 () Bool)

(assert (=> d!105497 m!774015))

(declare-fun m!774017 () Bool)

(assert (=> b!830613 m!774017))

(assert (=> b!830613 m!773377))

(assert (=> b!830613 m!773377))

(declare-fun m!774019 () Bool)

(assert (=> b!830613 m!774019))

(assert (=> b!830615 m!773377))

(assert (=> b!830615 m!773377))

(assert (=> b!830615 m!774019))

(assert (=> d!105351 d!105497))

(declare-fun b!830617 () Bool)

(declare-fun e!463120 () Option!421)

(declare-fun e!463121 () Option!421)

(assert (=> b!830617 (= e!463120 e!463121)))

(declare-fun c!89963 () Bool)

(assert (=> b!830617 (= c!89963 (and ((_ is Cons!15941) lt!376730) (not (= (_1!5086 (h!17070 lt!376730)) (_1!5086 lt!376679)))))))

(declare-fun b!830618 () Bool)

(assert (=> b!830618 (= e!463121 (getValueByKey!415 (t!22310 lt!376730) (_1!5086 lt!376679)))))

(declare-fun b!830619 () Bool)

(assert (=> b!830619 (= e!463121 None!419)))

(declare-fun b!830616 () Bool)

(assert (=> b!830616 (= e!463120 (Some!420 (_2!5086 (h!17070 lt!376730))))))

(declare-fun d!105499 () Bool)

(declare-fun c!89962 () Bool)

(assert (=> d!105499 (= c!89962 (and ((_ is Cons!15941) lt!376730) (= (_1!5086 (h!17070 lt!376730)) (_1!5086 lt!376679))))))

(assert (=> d!105499 (= (getValueByKey!415 lt!376730 (_1!5086 lt!376679)) e!463120)))

(assert (= (and d!105499 c!89962) b!830616))

(assert (= (and d!105499 (not c!89962)) b!830617))

(assert (= (and b!830617 c!89963) b!830618))

(assert (= (and b!830617 (not c!89963)) b!830619))

(declare-fun m!774021 () Bool)

(assert (=> b!830618 m!774021))

(assert (=> d!105351 d!105499))

(declare-fun d!105501 () Bool)

(assert (=> d!105501 (= (getValueByKey!415 lt!376730 (_1!5086 lt!376679)) (Some!420 (_2!5086 lt!376679)))))

(declare-fun lt!377017 () Unit!28429)

(assert (=> d!105501 (= lt!377017 (choose!1418 lt!376730 (_1!5086 lt!376679) (_2!5086 lt!376679)))))

(declare-fun e!463122 () Bool)

(assert (=> d!105501 e!463122))

(declare-fun res!565643 () Bool)

(assert (=> d!105501 (=> (not res!565643) (not e!463122))))

(assert (=> d!105501 (= res!565643 (isStrictlySorted!441 lt!376730))))

(assert (=> d!105501 (= (lemmaContainsTupThenGetReturnValue!229 lt!376730 (_1!5086 lt!376679) (_2!5086 lt!376679)) lt!377017)))

(declare-fun b!830620 () Bool)

(declare-fun res!565644 () Bool)

(assert (=> b!830620 (=> (not res!565644) (not e!463122))))

(assert (=> b!830620 (= res!565644 (containsKey!401 lt!376730 (_1!5086 lt!376679)))))

(declare-fun b!830621 () Bool)

(assert (=> b!830621 (= e!463122 (contains!4209 lt!376730 (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(assert (= (and d!105501 res!565643) b!830620))

(assert (= (and b!830620 res!565644) b!830621))

(assert (=> d!105501 m!773371))

(declare-fun m!774023 () Bool)

(assert (=> d!105501 m!774023))

(declare-fun m!774025 () Bool)

(assert (=> d!105501 m!774025))

(declare-fun m!774027 () Bool)

(assert (=> b!830620 m!774027))

(declare-fun m!774029 () Bool)

(assert (=> b!830621 m!774029))

(assert (=> d!105351 d!105501))

(declare-fun d!105503 () Bool)

(declare-fun e!463125 () Bool)

(assert (=> d!105503 e!463125))

(declare-fun res!565646 () Bool)

(assert (=> d!105503 (=> (not res!565646) (not e!463125))))

(declare-fun lt!377018 () List!15945)

(assert (=> d!105503 (= res!565646 (isStrictlySorted!441 lt!377018))))

(declare-fun e!463126 () List!15945)

(assert (=> d!105503 (= lt!377018 e!463126)))

(declare-fun c!89967 () Bool)

(assert (=> d!105503 (= c!89967 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376683 lt!376677))) (bvslt (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376677)))) (_1!5086 lt!376679))))))

(assert (=> d!105503 (isStrictlySorted!441 (toList!4502 (+!1980 lt!376683 lt!376677)))))

(assert (=> d!105503 (= (insertStrictlySorted!268 (toList!4502 (+!1980 lt!376683 lt!376677)) (_1!5086 lt!376679) (_2!5086 lt!376679)) lt!377018)))

(declare-fun b!830622 () Bool)

(declare-fun res!565645 () Bool)

(assert (=> b!830622 (=> (not res!565645) (not e!463125))))

(assert (=> b!830622 (= res!565645 (containsKey!401 lt!377018 (_1!5086 lt!376679)))))

(declare-fun b!830623 () Bool)

(declare-fun e!463124 () List!15945)

(assert (=> b!830623 (= e!463124 (insertStrictlySorted!268 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677))) (_1!5086 lt!376679) (_2!5086 lt!376679)))))

(declare-fun call!36277 () List!15945)

(declare-fun bm!36272 () Bool)

(assert (=> bm!36272 (= call!36277 ($colon$colon!536 e!463124 (ite c!89967 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376677))) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679)))))))

(declare-fun c!89966 () Bool)

(assert (=> bm!36272 (= c!89966 c!89967)))

(declare-fun b!830624 () Bool)

(assert (=> b!830624 (= e!463125 (contains!4209 lt!377018 (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(declare-fun c!89965 () Bool)

(declare-fun b!830625 () Bool)

(declare-fun c!89964 () Bool)

(assert (=> b!830625 (= e!463124 (ite c!89964 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677))) (ite c!89965 (Cons!15941 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376677))) (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677)))) Nil!15942)))))

(declare-fun b!830626 () Bool)

(declare-fun e!463123 () List!15945)

(declare-fun call!36276 () List!15945)

(assert (=> b!830626 (= e!463123 call!36276)))

(declare-fun bm!36273 () Bool)

(declare-fun call!36275 () List!15945)

(assert (=> bm!36273 (= call!36276 call!36275)))

(declare-fun bm!36274 () Bool)

(assert (=> bm!36274 (= call!36275 call!36277)))

(declare-fun b!830627 () Bool)

(assert (=> b!830627 (= e!463123 call!36276)))

(declare-fun b!830628 () Bool)

(assert (=> b!830628 (= e!463126 call!36277)))

(declare-fun b!830629 () Bool)

(declare-fun e!463127 () List!15945)

(assert (=> b!830629 (= e!463127 call!36275)))

(declare-fun b!830630 () Bool)

(assert (=> b!830630 (= c!89965 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376683 lt!376677))) (bvsgt (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376677)))) (_1!5086 lt!376679))))))

(assert (=> b!830630 (= e!463127 e!463123)))

(declare-fun b!830631 () Bool)

(assert (=> b!830631 (= e!463126 e!463127)))

(assert (=> b!830631 (= c!89964 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376683 lt!376677))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376677)))) (_1!5086 lt!376679))))))

(assert (= (and d!105503 c!89967) b!830628))

(assert (= (and d!105503 (not c!89967)) b!830631))

(assert (= (and b!830631 c!89964) b!830629))

(assert (= (and b!830631 (not c!89964)) b!830630))

(assert (= (and b!830630 c!89965) b!830627))

(assert (= (and b!830630 (not c!89965)) b!830626))

(assert (= (or b!830627 b!830626) bm!36273))

(assert (= (or b!830629 bm!36273) bm!36274))

(assert (= (or b!830628 bm!36274) bm!36272))

(assert (= (and bm!36272 c!89966) b!830623))

(assert (= (and bm!36272 (not c!89966)) b!830625))

(assert (= (and d!105503 res!565646) b!830622))

(assert (= (and b!830622 res!565645) b!830624))

(declare-fun m!774031 () Bool)

(assert (=> bm!36272 m!774031))

(declare-fun m!774033 () Bool)

(assert (=> b!830622 m!774033))

(declare-fun m!774035 () Bool)

(assert (=> b!830624 m!774035))

(declare-fun m!774037 () Bool)

(assert (=> d!105503 m!774037))

(declare-fun m!774039 () Bool)

(assert (=> d!105503 m!774039))

(declare-fun m!774041 () Bool)

(assert (=> b!830623 m!774041))

(assert (=> d!105351 d!105503))

(declare-fun d!105505 () Bool)

(declare-fun e!463128 () Bool)

(assert (=> d!105505 e!463128))

(declare-fun res!565647 () Bool)

(assert (=> d!105505 (=> res!565647 e!463128)))

(declare-fun lt!377019 () Bool)

(assert (=> d!105505 (= res!565647 (not lt!377019))))

(declare-fun lt!377021 () Bool)

(assert (=> d!105505 (= lt!377019 lt!377021)))

(declare-fun lt!377020 () Unit!28429)

(declare-fun e!463129 () Unit!28429)

(assert (=> d!105505 (= lt!377020 e!463129)))

(declare-fun c!89968 () Bool)

(assert (=> d!105505 (= c!89968 lt!377021)))

(assert (=> d!105505 (= lt!377021 (containsKey!401 (toList!4502 lt!376737) (_1!5086 lt!376679)))))

(assert (=> d!105505 (= (contains!4208 lt!376737 (_1!5086 lt!376679)) lt!377019)))

(declare-fun b!830632 () Bool)

(declare-fun lt!377022 () Unit!28429)

(assert (=> b!830632 (= e!463129 lt!377022)))

(assert (=> b!830632 (= lt!377022 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376737) (_1!5086 lt!376679)))))

(assert (=> b!830632 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376737) (_1!5086 lt!376679)))))

(declare-fun b!830633 () Bool)

(declare-fun Unit!28447 () Unit!28429)

(assert (=> b!830633 (= e!463129 Unit!28447)))

(declare-fun b!830634 () Bool)

(assert (=> b!830634 (= e!463128 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376737) (_1!5086 lt!376679))))))

(assert (= (and d!105505 c!89968) b!830632))

(assert (= (and d!105505 (not c!89968)) b!830633))

(assert (= (and d!105505 (not res!565647)) b!830634))

(declare-fun m!774043 () Bool)

(assert (=> d!105505 m!774043))

(declare-fun m!774045 () Bool)

(assert (=> b!830632 m!774045))

(assert (=> b!830632 m!773389))

(assert (=> b!830632 m!773389))

(declare-fun m!774047 () Bool)

(assert (=> b!830632 m!774047))

(assert (=> b!830634 m!773389))

(assert (=> b!830634 m!773389))

(assert (=> b!830634 m!774047))

(assert (=> d!105353 d!105505))

(declare-fun b!830636 () Bool)

(declare-fun e!463130 () Option!421)

(declare-fun e!463131 () Option!421)

(assert (=> b!830636 (= e!463130 e!463131)))

(declare-fun c!89970 () Bool)

(assert (=> b!830636 (= c!89970 (and ((_ is Cons!15941) lt!376734) (not (= (_1!5086 (h!17070 lt!376734)) (_1!5086 lt!376679)))))))

(declare-fun b!830637 () Bool)

(assert (=> b!830637 (= e!463131 (getValueByKey!415 (t!22310 lt!376734) (_1!5086 lt!376679)))))

(declare-fun b!830638 () Bool)

(assert (=> b!830638 (= e!463131 None!419)))

(declare-fun b!830635 () Bool)

(assert (=> b!830635 (= e!463130 (Some!420 (_2!5086 (h!17070 lt!376734))))))

(declare-fun d!105507 () Bool)

(declare-fun c!89969 () Bool)

(assert (=> d!105507 (= c!89969 (and ((_ is Cons!15941) lt!376734) (= (_1!5086 (h!17070 lt!376734)) (_1!5086 lt!376679))))))

(assert (=> d!105507 (= (getValueByKey!415 lt!376734 (_1!5086 lt!376679)) e!463130)))

(assert (= (and d!105507 c!89969) b!830635))

(assert (= (and d!105507 (not c!89969)) b!830636))

(assert (= (and b!830636 c!89970) b!830637))

(assert (= (and b!830636 (not c!89970)) b!830638))

(declare-fun m!774049 () Bool)

(assert (=> b!830637 m!774049))

(assert (=> d!105353 d!105507))

(declare-fun d!105509 () Bool)

(assert (=> d!105509 (= (getValueByKey!415 lt!376734 (_1!5086 lt!376679)) (Some!420 (_2!5086 lt!376679)))))

(declare-fun lt!377023 () Unit!28429)

(assert (=> d!105509 (= lt!377023 (choose!1418 lt!376734 (_1!5086 lt!376679) (_2!5086 lt!376679)))))

(declare-fun e!463132 () Bool)

(assert (=> d!105509 e!463132))

(declare-fun res!565648 () Bool)

(assert (=> d!105509 (=> (not res!565648) (not e!463132))))

(assert (=> d!105509 (= res!565648 (isStrictlySorted!441 lt!376734))))

(assert (=> d!105509 (= (lemmaContainsTupThenGetReturnValue!229 lt!376734 (_1!5086 lt!376679) (_2!5086 lt!376679)) lt!377023)))

(declare-fun b!830639 () Bool)

(declare-fun res!565649 () Bool)

(assert (=> b!830639 (=> (not res!565649) (not e!463132))))

(assert (=> b!830639 (= res!565649 (containsKey!401 lt!376734 (_1!5086 lt!376679)))))

(declare-fun b!830640 () Bool)

(assert (=> b!830640 (= e!463132 (contains!4209 lt!376734 (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(assert (= (and d!105509 res!565648) b!830639))

(assert (= (and b!830639 res!565649) b!830640))

(assert (=> d!105509 m!773383))

(declare-fun m!774051 () Bool)

(assert (=> d!105509 m!774051))

(declare-fun m!774053 () Bool)

(assert (=> d!105509 m!774053))

(declare-fun m!774055 () Bool)

(assert (=> b!830639 m!774055))

(declare-fun m!774057 () Bool)

(assert (=> b!830640 m!774057))

(assert (=> d!105353 d!105509))

(declare-fun d!105511 () Bool)

(declare-fun e!463135 () Bool)

(assert (=> d!105511 e!463135))

(declare-fun res!565651 () Bool)

(assert (=> d!105511 (=> (not res!565651) (not e!463135))))

(declare-fun lt!377024 () List!15945)

(assert (=> d!105511 (= res!565651 (isStrictlySorted!441 lt!377024))))

(declare-fun e!463136 () List!15945)

(assert (=> d!105511 (= lt!377024 e!463136)))

(declare-fun c!89974 () Bool)

(assert (=> d!105511 (= c!89974 (and ((_ is Cons!15941) (toList!4502 lt!376683)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376683))) (_1!5086 lt!376679))))))

(assert (=> d!105511 (isStrictlySorted!441 (toList!4502 lt!376683))))

(assert (=> d!105511 (= (insertStrictlySorted!268 (toList!4502 lt!376683) (_1!5086 lt!376679) (_2!5086 lt!376679)) lt!377024)))

(declare-fun b!830641 () Bool)

(declare-fun res!565650 () Bool)

(assert (=> b!830641 (=> (not res!565650) (not e!463135))))

(assert (=> b!830641 (= res!565650 (containsKey!401 lt!377024 (_1!5086 lt!376679)))))

(declare-fun b!830642 () Bool)

(declare-fun e!463134 () List!15945)

(assert (=> b!830642 (= e!463134 (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376683)) (_1!5086 lt!376679) (_2!5086 lt!376679)))))

(declare-fun call!36280 () List!15945)

(declare-fun bm!36275 () Bool)

(assert (=> bm!36275 (= call!36280 ($colon$colon!536 e!463134 (ite c!89974 (h!17070 (toList!4502 lt!376683)) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679)))))))

(declare-fun c!89973 () Bool)

(assert (=> bm!36275 (= c!89973 c!89974)))

(declare-fun b!830643 () Bool)

(assert (=> b!830643 (= e!463135 (contains!4209 lt!377024 (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(declare-fun c!89971 () Bool)

(declare-fun c!89972 () Bool)

(declare-fun b!830644 () Bool)

(assert (=> b!830644 (= e!463134 (ite c!89971 (t!22310 (toList!4502 lt!376683)) (ite c!89972 (Cons!15941 (h!17070 (toList!4502 lt!376683)) (t!22310 (toList!4502 lt!376683))) Nil!15942)))))

(declare-fun b!830645 () Bool)

(declare-fun e!463133 () List!15945)

(declare-fun call!36279 () List!15945)

(assert (=> b!830645 (= e!463133 call!36279)))

(declare-fun bm!36276 () Bool)

(declare-fun call!36278 () List!15945)

(assert (=> bm!36276 (= call!36279 call!36278)))

(declare-fun bm!36277 () Bool)

(assert (=> bm!36277 (= call!36278 call!36280)))

(declare-fun b!830646 () Bool)

(assert (=> b!830646 (= e!463133 call!36279)))

(declare-fun b!830647 () Bool)

(assert (=> b!830647 (= e!463136 call!36280)))

(declare-fun b!830648 () Bool)

(declare-fun e!463137 () List!15945)

(assert (=> b!830648 (= e!463137 call!36278)))

(declare-fun b!830649 () Bool)

(assert (=> b!830649 (= c!89972 (and ((_ is Cons!15941) (toList!4502 lt!376683)) (bvsgt (_1!5086 (h!17070 (toList!4502 lt!376683))) (_1!5086 lt!376679))))))

(assert (=> b!830649 (= e!463137 e!463133)))

(declare-fun b!830650 () Bool)

(assert (=> b!830650 (= e!463136 e!463137)))

(assert (=> b!830650 (= c!89971 (and ((_ is Cons!15941) (toList!4502 lt!376683)) (= (_1!5086 (h!17070 (toList!4502 lt!376683))) (_1!5086 lt!376679))))))

(assert (= (and d!105511 c!89974) b!830647))

(assert (= (and d!105511 (not c!89974)) b!830650))

(assert (= (and b!830650 c!89971) b!830648))

(assert (= (and b!830650 (not c!89971)) b!830649))

(assert (= (and b!830649 c!89972) b!830646))

(assert (= (and b!830649 (not c!89972)) b!830645))

(assert (= (or b!830646 b!830645) bm!36276))

(assert (= (or b!830648 bm!36276) bm!36277))

(assert (= (or b!830647 bm!36277) bm!36275))

(assert (= (and bm!36275 c!89973) b!830642))

(assert (= (and bm!36275 (not c!89973)) b!830644))

(assert (= (and d!105511 res!565651) b!830641))

(assert (= (and b!830641 res!565650) b!830643))

(declare-fun m!774059 () Bool)

(assert (=> bm!36275 m!774059))

(declare-fun m!774061 () Bool)

(assert (=> b!830641 m!774061))

(declare-fun m!774063 () Bool)

(assert (=> b!830643 m!774063))

(declare-fun m!774065 () Bool)

(assert (=> d!105511 m!774065))

(assert (=> d!105511 m!773751))

(declare-fun m!774067 () Bool)

(assert (=> b!830642 m!774067))

(assert (=> d!105353 d!105511))

(assert (=> b!830411 d!105379))

(declare-fun d!105513 () Bool)

(declare-fun e!463138 () Bool)

(assert (=> d!105513 e!463138))

(declare-fun res!565652 () Bool)

(assert (=> d!105513 (=> res!565652 e!463138)))

(declare-fun lt!377025 () Bool)

(assert (=> d!105513 (= res!565652 (not lt!377025))))

(declare-fun lt!377027 () Bool)

(assert (=> d!105513 (= lt!377025 lt!377027)))

(declare-fun lt!377026 () Unit!28429)

(declare-fun e!463139 () Unit!28429)

(assert (=> d!105513 (= lt!377026 e!463139)))

(declare-fun c!89975 () Bool)

(assert (=> d!105513 (= c!89975 lt!377027)))

(assert (=> d!105513 (= lt!377027 (containsKey!401 (toList!4502 lt!376817) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105513 (= (contains!4208 lt!376817 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377025)))

(declare-fun b!830651 () Bool)

(declare-fun lt!377028 () Unit!28429)

(assert (=> b!830651 (= e!463139 lt!377028)))

(assert (=> b!830651 (= lt!377028 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376817) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830651 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376817) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830652 () Bool)

(declare-fun Unit!28448 () Unit!28429)

(assert (=> b!830652 (= e!463139 Unit!28448)))

(declare-fun b!830653 () Bool)

(assert (=> b!830653 (= e!463138 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376817) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105513 c!89975) b!830651))

(assert (= (and d!105513 (not c!89975)) b!830652))

(assert (= (and d!105513 (not res!565652)) b!830653))

(declare-fun m!774069 () Bool)

(assert (=> d!105513 m!774069))

(declare-fun m!774071 () Bool)

(assert (=> b!830651 m!774071))

(declare-fun m!774073 () Bool)

(assert (=> b!830651 m!774073))

(assert (=> b!830651 m!774073))

(declare-fun m!774075 () Bool)

(assert (=> b!830651 m!774075))

(assert (=> b!830653 m!774073))

(assert (=> b!830653 m!774073))

(assert (=> b!830653 m!774075))

(assert (=> bm!36250 d!105513))

(assert (=> bm!36244 d!105367))

(declare-fun b!830655 () Bool)

(declare-fun e!463140 () Option!421)

(declare-fun e!463141 () Option!421)

(assert (=> b!830655 (= e!463140 e!463141)))

(declare-fun c!89977 () Bool)

(assert (=> b!830655 (= c!89977 (and ((_ is Cons!15941) (toList!4502 lt!376829)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376829))) (_1!5086 lt!376677)))))))

(declare-fun b!830656 () Bool)

(assert (=> b!830656 (= e!463141 (getValueByKey!415 (t!22310 (toList!4502 lt!376829)) (_1!5086 lt!376677)))))

(declare-fun b!830657 () Bool)

(assert (=> b!830657 (= e!463141 None!419)))

(declare-fun b!830654 () Bool)

(assert (=> b!830654 (= e!463140 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376829)))))))

(declare-fun d!105515 () Bool)

(declare-fun c!89976 () Bool)

(assert (=> d!105515 (= c!89976 (and ((_ is Cons!15941) (toList!4502 lt!376829)) (= (_1!5086 (h!17070 (toList!4502 lt!376829))) (_1!5086 lt!376677))))))

(assert (=> d!105515 (= (getValueByKey!415 (toList!4502 lt!376829) (_1!5086 lt!376677)) e!463140)))

(assert (= (and d!105515 c!89976) b!830654))

(assert (= (and d!105515 (not c!89976)) b!830655))

(assert (= (and b!830655 c!89977) b!830656))

(assert (= (and b!830655 (not c!89977)) b!830657))

(declare-fun m!774077 () Bool)

(assert (=> b!830656 m!774077))

(assert (=> b!830360 d!105515))

(declare-fun d!105517 () Bool)

(assert (=> d!105517 (= (apply!372 lt!376817 #b0000000000000000000000000000000000000000000000000000000000000000) (get!11818 (getValueByKey!415 (toList!4502 lt!376817) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23202 () Bool)

(assert (= bs!23202 d!105517))

(assert (=> bs!23202 m!774073))

(assert (=> bs!23202 m!774073))

(declare-fun m!774079 () Bool)

(assert (=> bs!23202 m!774079))

(assert (=> b!830355 d!105517))

(declare-fun d!105519 () Bool)

(declare-fun e!463142 () Bool)

(assert (=> d!105519 e!463142))

(declare-fun res!565653 () Bool)

(assert (=> d!105519 (=> res!565653 e!463142)))

(declare-fun lt!377029 () Bool)

(assert (=> d!105519 (= res!565653 (not lt!377029))))

(declare-fun lt!377031 () Bool)

(assert (=> d!105519 (= lt!377029 lt!377031)))

(declare-fun lt!377030 () Unit!28429)

(declare-fun e!463143 () Unit!28429)

(assert (=> d!105519 (= lt!377030 e!463143)))

(declare-fun c!89978 () Bool)

(assert (=> d!105519 (= c!89978 lt!377031)))

(assert (=> d!105519 (= lt!377031 (containsKey!401 (toList!4502 lt!376856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105519 (= (contains!4208 lt!376856 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377029)))

(declare-fun b!830658 () Bool)

(declare-fun lt!377032 () Unit!28429)

(assert (=> b!830658 (= e!463143 lt!377032)))

(assert (=> b!830658 (= lt!377032 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830658 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830659 () Bool)

(declare-fun Unit!28449 () Unit!28429)

(assert (=> b!830659 (= e!463143 Unit!28449)))

(declare-fun b!830660 () Bool)

(assert (=> b!830660 (= e!463142 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376856) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105519 c!89978) b!830658))

(assert (= (and d!105519 (not c!89978)) b!830659))

(assert (= (and d!105519 (not res!565653)) b!830660))

(declare-fun m!774081 () Bool)

(assert (=> d!105519 m!774081))

(declare-fun m!774083 () Bool)

(assert (=> b!830658 m!774083))

(declare-fun m!774085 () Bool)

(assert (=> b!830658 m!774085))

(assert (=> b!830658 m!774085))

(declare-fun m!774087 () Bool)

(assert (=> b!830658 m!774087))

(assert (=> b!830660 m!774085))

(assert (=> b!830660 m!774085))

(assert (=> b!830660 m!774087))

(assert (=> b!830392 d!105519))

(declare-fun d!105521 () Bool)

(assert (=> d!105521 (= (apply!372 lt!376817 #b1000000000000000000000000000000000000000000000000000000000000000) (get!11818 (getValueByKey!415 (toList!4502 lt!376817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23203 () Bool)

(assert (= bs!23203 d!105521))

(declare-fun m!774089 () Bool)

(assert (=> bs!23203 m!774089))

(assert (=> bs!23203 m!774089))

(declare-fun m!774091 () Bool)

(assert (=> bs!23203 m!774091))

(assert (=> b!830339 d!105521))

(declare-fun d!105523 () Bool)

(assert (=> d!105523 (= (apply!372 lt!376817 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) (get!11818 (getValueByKey!415 (toList!4502 lt!376817) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23204 () Bool)

(assert (= bs!23204 d!105523))

(assert (=> bs!23204 m!773353))

(assert (=> bs!23204 m!773591))

(assert (=> bs!23204 m!773591))

(declare-fun m!774093 () Bool)

(assert (=> bs!23204 m!774093))

(assert (=> b!830356 d!105523))

(assert (=> b!830356 d!105395))

(declare-fun d!105525 () Bool)

(declare-fun e!463144 () Bool)

(assert (=> d!105525 e!463144))

(declare-fun res!565654 () Bool)

(assert (=> d!105525 (=> res!565654 e!463144)))

(declare-fun lt!377033 () Bool)

(assert (=> d!105525 (= res!565654 (not lt!377033))))

(declare-fun lt!377035 () Bool)

(assert (=> d!105525 (= lt!377033 lt!377035)))

(declare-fun lt!377034 () Unit!28429)

(declare-fun e!463145 () Unit!28429)

(assert (=> d!105525 (= lt!377034 e!463145)))

(declare-fun c!89979 () Bool)

(assert (=> d!105525 (= c!89979 lt!377035)))

(assert (=> d!105525 (= lt!377035 (containsKey!401 (toList!4502 lt!376856) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!105525 (= (contains!4208 lt!376856 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) lt!377033)))

(declare-fun b!830661 () Bool)

(declare-fun lt!377036 () Unit!28429)

(assert (=> b!830661 (= e!463145 lt!377036)))

(assert (=> b!830661 (= lt!377036 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376856) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830661 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376856) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830662 () Bool)

(declare-fun Unit!28450 () Unit!28429)

(assert (=> b!830662 (= e!463145 Unit!28450)))

(declare-fun b!830663 () Bool)

(assert (=> b!830663 (= e!463144 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376856) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!105525 c!89979) b!830661))

(assert (= (and d!105525 (not c!89979)) b!830662))

(assert (= (and d!105525 (not res!565654)) b!830663))

(assert (=> d!105525 m!773353))

(declare-fun m!774095 () Bool)

(assert (=> d!105525 m!774095))

(assert (=> b!830661 m!773353))

(declare-fun m!774097 () Bool)

(assert (=> b!830661 m!774097))

(assert (=> b!830661 m!773353))

(declare-fun m!774099 () Bool)

(assert (=> b!830661 m!774099))

(assert (=> b!830661 m!774099))

(declare-fun m!774101 () Bool)

(assert (=> b!830661 m!774101))

(assert (=> b!830663 m!773353))

(assert (=> b!830663 m!774099))

(assert (=> b!830663 m!774099))

(assert (=> b!830663 m!774101))

(assert (=> b!830394 d!105525))

(declare-fun d!105527 () Bool)

(declare-fun e!463146 () Bool)

(assert (=> d!105527 e!463146))

(declare-fun res!565656 () Bool)

(assert (=> d!105527 (=> (not res!565656) (not e!463146))))

(declare-fun lt!377040 () ListLongMap!8973)

(assert (=> d!105527 (= res!565656 (contains!4208 lt!377040 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377037 () List!15945)

(assert (=> d!105527 (= lt!377040 (ListLongMap!8974 lt!377037))))

(declare-fun lt!377039 () Unit!28429)

(declare-fun lt!377038 () Unit!28429)

(assert (=> d!105527 (= lt!377039 lt!377038)))

(assert (=> d!105527 (= (getValueByKey!415 lt!377037 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105527 (= lt!377038 (lemmaContainsTupThenGetReturnValue!229 lt!377037 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105527 (= lt!377037 (insertStrictlySorted!268 (toList!4502 call!36255) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105527 (= (+!1980 call!36255 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377040)))

(declare-fun b!830664 () Bool)

(declare-fun res!565655 () Bool)

(assert (=> b!830664 (=> (not res!565655) (not e!463146))))

(assert (=> b!830664 (= res!565655 (= (getValueByKey!415 (toList!4502 lt!377040) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830665 () Bool)

(assert (=> b!830665 (= e!463146 (contains!4209 (toList!4502 lt!377040) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105527 res!565656) b!830664))

(assert (= (and b!830664 res!565655) b!830665))

(declare-fun m!774103 () Bool)

(assert (=> d!105527 m!774103))

(declare-fun m!774105 () Bool)

(assert (=> d!105527 m!774105))

(declare-fun m!774107 () Bool)

(assert (=> d!105527 m!774107))

(declare-fun m!774109 () Bool)

(assert (=> d!105527 m!774109))

(declare-fun m!774111 () Bool)

(assert (=> b!830664 m!774111))

(declare-fun m!774113 () Bool)

(assert (=> b!830665 m!774113))

(assert (=> b!830341 d!105527))

(declare-fun d!105529 () Bool)

(assert (=> d!105529 (= (isEmpty!654 lt!376863) (isEmpty!655 (toList!4502 lt!376863)))))

(declare-fun bs!23205 () Bool)

(assert (= bs!23205 d!105529))

(declare-fun m!774115 () Bool)

(assert (=> bs!23205 m!774115))

(assert (=> b!830405 d!105529))

(declare-fun b!830667 () Bool)

(declare-fun e!463147 () Option!421)

(declare-fun e!463148 () Option!421)

(assert (=> b!830667 (= e!463147 e!463148)))

(declare-fun c!89981 () Bool)

(assert (=> b!830667 (= c!89981 (and ((_ is Cons!15941) (toList!4502 lt!376833)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376833))) (_1!5086 lt!376677)))))))

(declare-fun b!830668 () Bool)

(assert (=> b!830668 (= e!463148 (getValueByKey!415 (t!22310 (toList!4502 lt!376833)) (_1!5086 lt!376677)))))

(declare-fun b!830669 () Bool)

(assert (=> b!830669 (= e!463148 None!419)))

(declare-fun b!830666 () Bool)

(assert (=> b!830666 (= e!463147 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376833)))))))

(declare-fun d!105531 () Bool)

(declare-fun c!89980 () Bool)

(assert (=> d!105531 (= c!89980 (and ((_ is Cons!15941) (toList!4502 lt!376833)) (= (_1!5086 (h!17070 (toList!4502 lt!376833))) (_1!5086 lt!376677))))))

(assert (=> d!105531 (= (getValueByKey!415 (toList!4502 lt!376833) (_1!5086 lt!376677)) e!463147)))

(assert (= (and d!105531 c!89980) b!830666))

(assert (= (and d!105531 (not c!89980)) b!830667))

(assert (= (and b!830667 c!89981) b!830668))

(assert (= (and b!830667 (not c!89981)) b!830669))

(declare-fun m!774117 () Bool)

(assert (=> b!830668 m!774117))

(assert (=> b!830362 d!105531))

(assert (=> b!830396 d!105459))

(declare-fun d!105533 () Bool)

(declare-fun e!463149 () Bool)

(assert (=> d!105533 e!463149))

(declare-fun res!565657 () Bool)

(assert (=> d!105533 (=> res!565657 e!463149)))

(declare-fun lt!377041 () Bool)

(assert (=> d!105533 (= res!565657 (not lt!377041))))

(declare-fun lt!377043 () Bool)

(assert (=> d!105533 (= lt!377041 lt!377043)))

(declare-fun lt!377042 () Unit!28429)

(declare-fun e!463150 () Unit!28429)

(assert (=> d!105533 (= lt!377042 e!463150)))

(declare-fun c!89982 () Bool)

(assert (=> d!105533 (= c!89982 lt!377043)))

(assert (=> d!105533 (= lt!377043 (containsKey!401 (toList!4502 lt!376863) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105533 (= (contains!4208 lt!376863 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377041)))

(declare-fun b!830670 () Bool)

(declare-fun lt!377044 () Unit!28429)

(assert (=> b!830670 (= e!463150 lt!377044)))

(assert (=> b!830670 (= lt!377044 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376863) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830670 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376863) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830671 () Bool)

(declare-fun Unit!28451 () Unit!28429)

(assert (=> b!830671 (= e!463150 Unit!28451)))

(declare-fun b!830672 () Bool)

(assert (=> b!830672 (= e!463149 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376863) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105533 c!89982) b!830670))

(assert (= (and d!105533 (not c!89982)) b!830671))

(assert (= (and d!105533 (not res!565657)) b!830672))

(declare-fun m!774119 () Bool)

(assert (=> d!105533 m!774119))

(declare-fun m!774121 () Bool)

(assert (=> b!830670 m!774121))

(declare-fun m!774123 () Bool)

(assert (=> b!830670 m!774123))

(assert (=> b!830670 m!774123))

(declare-fun m!774125 () Bool)

(assert (=> b!830670 m!774125))

(assert (=> b!830672 m!774123))

(assert (=> b!830672 m!774123))

(assert (=> b!830672 m!774125))

(assert (=> d!105367 d!105533))

(assert (=> d!105367 d!105343))

(declare-fun d!105535 () Bool)

(declare-fun e!463151 () Bool)

(assert (=> d!105535 e!463151))

(declare-fun res!565658 () Bool)

(assert (=> d!105535 (=> res!565658 e!463151)))

(declare-fun lt!377045 () Bool)

(assert (=> d!105535 (= res!565658 (not lt!377045))))

(declare-fun lt!377047 () Bool)

(assert (=> d!105535 (= lt!377045 lt!377047)))

(declare-fun lt!377046 () Unit!28429)

(declare-fun e!463152 () Unit!28429)

(assert (=> d!105535 (= lt!377046 e!463152)))

(declare-fun c!89983 () Bool)

(assert (=> d!105535 (= c!89983 lt!377047)))

(assert (=> d!105535 (= lt!377047 (containsKey!401 (toList!4502 lt!376833) (_1!5086 lt!376677)))))

(assert (=> d!105535 (= (contains!4208 lt!376833 (_1!5086 lt!376677)) lt!377045)))

(declare-fun b!830673 () Bool)

(declare-fun lt!377048 () Unit!28429)

(assert (=> b!830673 (= e!463152 lt!377048)))

(assert (=> b!830673 (= lt!377048 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376833) (_1!5086 lt!376677)))))

(assert (=> b!830673 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376833) (_1!5086 lt!376677)))))

(declare-fun b!830674 () Bool)

(declare-fun Unit!28452 () Unit!28429)

(assert (=> b!830674 (= e!463152 Unit!28452)))

(declare-fun b!830675 () Bool)

(assert (=> b!830675 (= e!463151 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376833) (_1!5086 lt!376677))))))

(assert (= (and d!105535 c!89983) b!830673))

(assert (= (and d!105535 (not c!89983)) b!830674))

(assert (= (and d!105535 (not res!565658)) b!830675))

(declare-fun m!774127 () Bool)

(assert (=> d!105535 m!774127))

(declare-fun m!774129 () Bool)

(assert (=> b!830673 m!774129))

(assert (=> b!830673 m!773511))

(assert (=> b!830673 m!773511))

(declare-fun m!774131 () Bool)

(assert (=> b!830673 m!774131))

(assert (=> b!830675 m!773511))

(assert (=> b!830675 m!773511))

(assert (=> b!830675 m!774131))

(assert (=> d!105361 d!105535))

(declare-fun b!830677 () Bool)

(declare-fun e!463153 () Option!421)

(declare-fun e!463154 () Option!421)

(assert (=> b!830677 (= e!463153 e!463154)))

(declare-fun c!89985 () Bool)

(assert (=> b!830677 (= c!89985 (and ((_ is Cons!15941) lt!376830) (not (= (_1!5086 (h!17070 lt!376830)) (_1!5086 lt!376677)))))))

(declare-fun b!830678 () Bool)

(assert (=> b!830678 (= e!463154 (getValueByKey!415 (t!22310 lt!376830) (_1!5086 lt!376677)))))

(declare-fun b!830679 () Bool)

(assert (=> b!830679 (= e!463154 None!419)))

(declare-fun b!830676 () Bool)

(assert (=> b!830676 (= e!463153 (Some!420 (_2!5086 (h!17070 lt!376830))))))

(declare-fun d!105537 () Bool)

(declare-fun c!89984 () Bool)

(assert (=> d!105537 (= c!89984 (and ((_ is Cons!15941) lt!376830) (= (_1!5086 (h!17070 lt!376830)) (_1!5086 lt!376677))))))

(assert (=> d!105537 (= (getValueByKey!415 lt!376830 (_1!5086 lt!376677)) e!463153)))

(assert (= (and d!105537 c!89984) b!830676))

(assert (= (and d!105537 (not c!89984)) b!830677))

(assert (= (and b!830677 c!89985) b!830678))

(assert (= (and b!830677 (not c!89985)) b!830679))

(declare-fun m!774133 () Bool)

(assert (=> b!830678 m!774133))

(assert (=> d!105361 d!105537))

(declare-fun d!105539 () Bool)

(assert (=> d!105539 (= (getValueByKey!415 lt!376830 (_1!5086 lt!376677)) (Some!420 (_2!5086 lt!376677)))))

(declare-fun lt!377049 () Unit!28429)

(assert (=> d!105539 (= lt!377049 (choose!1418 lt!376830 (_1!5086 lt!376677) (_2!5086 lt!376677)))))

(declare-fun e!463155 () Bool)

(assert (=> d!105539 e!463155))

(declare-fun res!565659 () Bool)

(assert (=> d!105539 (=> (not res!565659) (not e!463155))))

(assert (=> d!105539 (= res!565659 (isStrictlySorted!441 lt!376830))))

(assert (=> d!105539 (= (lemmaContainsTupThenGetReturnValue!229 lt!376830 (_1!5086 lt!376677) (_2!5086 lt!376677)) lt!377049)))

(declare-fun b!830680 () Bool)

(declare-fun res!565660 () Bool)

(assert (=> b!830680 (=> (not res!565660) (not e!463155))))

(assert (=> b!830680 (= res!565660 (containsKey!401 lt!376830 (_1!5086 lt!376677)))))

(declare-fun b!830681 () Bool)

(assert (=> b!830681 (= e!463155 (contains!4209 lt!376830 (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(assert (= (and d!105539 res!565659) b!830680))

(assert (= (and b!830680 res!565660) b!830681))

(assert (=> d!105539 m!773505))

(declare-fun m!774135 () Bool)

(assert (=> d!105539 m!774135))

(declare-fun m!774137 () Bool)

(assert (=> d!105539 m!774137))

(declare-fun m!774139 () Bool)

(assert (=> b!830680 m!774139))

(declare-fun m!774141 () Bool)

(assert (=> b!830681 m!774141))

(assert (=> d!105361 d!105539))

(declare-fun d!105541 () Bool)

(declare-fun e!463158 () Bool)

(assert (=> d!105541 e!463158))

(declare-fun res!565662 () Bool)

(assert (=> d!105541 (=> (not res!565662) (not e!463158))))

(declare-fun lt!377050 () List!15945)

(assert (=> d!105541 (= res!565662 (isStrictlySorted!441 lt!377050))))

(declare-fun e!463159 () List!15945)

(assert (=> d!105541 (= lt!377050 e!463159)))

(declare-fun c!89989 () Bool)

(assert (=> d!105541 (= c!89989 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376683 lt!376679))) (bvslt (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376679)))) (_1!5086 lt!376677))))))

(assert (=> d!105541 (isStrictlySorted!441 (toList!4502 (+!1980 lt!376683 lt!376679)))))

(assert (=> d!105541 (= (insertStrictlySorted!268 (toList!4502 (+!1980 lt!376683 lt!376679)) (_1!5086 lt!376677) (_2!5086 lt!376677)) lt!377050)))

(declare-fun b!830682 () Bool)

(declare-fun res!565661 () Bool)

(assert (=> b!830682 (=> (not res!565661) (not e!463158))))

(assert (=> b!830682 (= res!565661 (containsKey!401 lt!377050 (_1!5086 lt!376677)))))

(declare-fun b!830683 () Bool)

(declare-fun e!463157 () List!15945)

(assert (=> b!830683 (= e!463157 (insertStrictlySorted!268 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679))) (_1!5086 lt!376677) (_2!5086 lt!376677)))))

(declare-fun call!36283 () List!15945)

(declare-fun bm!36278 () Bool)

(assert (=> bm!36278 (= call!36283 ($colon$colon!536 e!463157 (ite c!89989 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376679))) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677)))))))

(declare-fun c!89988 () Bool)

(assert (=> bm!36278 (= c!89988 c!89989)))

(declare-fun b!830684 () Bool)

(assert (=> b!830684 (= e!463158 (contains!4209 lt!377050 (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun b!830685 () Bool)

(declare-fun c!89986 () Bool)

(declare-fun c!89987 () Bool)

(assert (=> b!830685 (= e!463157 (ite c!89986 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679))) (ite c!89987 (Cons!15941 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376679))) (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679)))) Nil!15942)))))

(declare-fun b!830686 () Bool)

(declare-fun e!463156 () List!15945)

(declare-fun call!36282 () List!15945)

(assert (=> b!830686 (= e!463156 call!36282)))

(declare-fun bm!36279 () Bool)

(declare-fun call!36281 () List!15945)

(assert (=> bm!36279 (= call!36282 call!36281)))

(declare-fun bm!36280 () Bool)

(assert (=> bm!36280 (= call!36281 call!36283)))

(declare-fun b!830687 () Bool)

(assert (=> b!830687 (= e!463156 call!36282)))

(declare-fun b!830688 () Bool)

(assert (=> b!830688 (= e!463159 call!36283)))

(declare-fun b!830689 () Bool)

(declare-fun e!463160 () List!15945)

(assert (=> b!830689 (= e!463160 call!36281)))

(declare-fun b!830690 () Bool)

(assert (=> b!830690 (= c!89987 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376683 lt!376679))) (bvsgt (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376679)))) (_1!5086 lt!376677))))))

(assert (=> b!830690 (= e!463160 e!463156)))

(declare-fun b!830691 () Bool)

(assert (=> b!830691 (= e!463159 e!463160)))

(assert (=> b!830691 (= c!89986 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376683 lt!376679))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376679)))) (_1!5086 lt!376677))))))

(assert (= (and d!105541 c!89989) b!830688))

(assert (= (and d!105541 (not c!89989)) b!830691))

(assert (= (and b!830691 c!89986) b!830689))

(assert (= (and b!830691 (not c!89986)) b!830690))

(assert (= (and b!830690 c!89987) b!830687))

(assert (= (and b!830690 (not c!89987)) b!830686))

(assert (= (or b!830687 b!830686) bm!36279))

(assert (= (or b!830689 bm!36279) bm!36280))

(assert (= (or b!830688 bm!36280) bm!36278))

(assert (= (and bm!36278 c!89988) b!830683))

(assert (= (and bm!36278 (not c!89988)) b!830685))

(assert (= (and d!105541 res!565662) b!830682))

(assert (= (and b!830682 res!565661) b!830684))

(declare-fun m!774143 () Bool)

(assert (=> bm!36278 m!774143))

(declare-fun m!774145 () Bool)

(assert (=> b!830682 m!774145))

(declare-fun m!774147 () Bool)

(assert (=> b!830684 m!774147))

(declare-fun m!774149 () Bool)

(assert (=> d!105541 m!774149))

(declare-fun m!774151 () Bool)

(assert (=> d!105541 m!774151))

(declare-fun m!774153 () Bool)

(assert (=> b!830683 m!774153))

(assert (=> d!105361 d!105541))

(declare-fun d!105543 () Bool)

(assert (=> d!105543 (= (apply!372 lt!376795 #b1000000000000000000000000000000000000000000000000000000000000000) (get!11818 (getValueByKey!415 (toList!4502 lt!376795) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23206 () Bool)

(assert (= bs!23206 d!105543))

(assert (=> bs!23206 m!773723))

(assert (=> bs!23206 m!773723))

(declare-fun m!774155 () Bool)

(assert (=> bs!23206 m!774155))

(assert (=> b!830316 d!105543))

(declare-fun b!830693 () Bool)

(declare-fun e!463161 () Option!421)

(declare-fun e!463162 () Option!421)

(assert (=> b!830693 (= e!463161 e!463162)))

(declare-fun c!89991 () Bool)

(assert (=> b!830693 (= c!89991 (and ((_ is Cons!15941) (toList!4502 lt!376733)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376733))) (_1!5086 lt!376679)))))))

(declare-fun b!830694 () Bool)

(assert (=> b!830694 (= e!463162 (getValueByKey!415 (t!22310 (toList!4502 lt!376733)) (_1!5086 lt!376679)))))

(declare-fun b!830695 () Bool)

(assert (=> b!830695 (= e!463162 None!419)))

(declare-fun b!830692 () Bool)

(assert (=> b!830692 (= e!463161 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376733)))))))

(declare-fun d!105545 () Bool)

(declare-fun c!89990 () Bool)

(assert (=> d!105545 (= c!89990 (and ((_ is Cons!15941) (toList!4502 lt!376733)) (= (_1!5086 (h!17070 (toList!4502 lt!376733))) (_1!5086 lt!376679))))))

(assert (=> d!105545 (= (getValueByKey!415 (toList!4502 lt!376733) (_1!5086 lt!376679)) e!463161)))

(assert (= (and d!105545 c!89990) b!830692))

(assert (= (and d!105545 (not c!89990)) b!830693))

(assert (= (and b!830693 c!89991) b!830694))

(assert (= (and b!830693 (not c!89991)) b!830695))

(declare-fun m!774157 () Bool)

(assert (=> b!830694 m!774157))

(assert (=> b!830270 d!105545))

(declare-fun d!105547 () Bool)

(declare-fun e!463163 () Bool)

(assert (=> d!105547 e!463163))

(declare-fun res!565664 () Bool)

(assert (=> d!105547 (=> (not res!565664) (not e!463163))))

(declare-fun lt!377054 () ListLongMap!8973)

(assert (=> d!105547 (= res!565664 (contains!4208 lt!377054 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377051 () List!15945)

(assert (=> d!105547 (= lt!377054 (ListLongMap!8974 lt!377051))))

(declare-fun lt!377053 () Unit!28429)

(declare-fun lt!377052 () Unit!28429)

(assert (=> d!105547 (= lt!377053 lt!377052)))

(assert (=> d!105547 (= (getValueByKey!415 lt!377051 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105547 (= lt!377052 (lemmaContainsTupThenGetReturnValue!229 lt!377051 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105547 (= lt!377051 (insertStrictlySorted!268 (toList!4502 call!36248) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105547 (= (+!1980 call!36248 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377054)))

(declare-fun b!830696 () Bool)

(declare-fun res!565663 () Bool)

(assert (=> b!830696 (=> (not res!565663) (not e!463163))))

(assert (=> b!830696 (= res!565663 (= (getValueByKey!415 (toList!4502 lt!377054) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830697 () Bool)

(assert (=> b!830697 (= e!463163 (contains!4209 (toList!4502 lt!377054) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105547 res!565664) b!830696))

(assert (= (and b!830696 res!565663) b!830697))

(declare-fun m!774159 () Bool)

(assert (=> d!105547 m!774159))

(declare-fun m!774161 () Bool)

(assert (=> d!105547 m!774161))

(declare-fun m!774163 () Bool)

(assert (=> d!105547 m!774163))

(declare-fun m!774165 () Bool)

(assert (=> d!105547 m!774165))

(declare-fun m!774167 () Bool)

(assert (=> b!830696 m!774167))

(declare-fun m!774169 () Bool)

(assert (=> b!830697 m!774169))

(assert (=> b!830318 d!105547))

(declare-fun b!830699 () Bool)

(declare-fun e!463164 () Option!421)

(declare-fun e!463165 () Option!421)

(assert (=> b!830699 (= e!463164 e!463165)))

(declare-fun c!89993 () Bool)

(assert (=> b!830699 (= c!89993 (and ((_ is Cons!15941) (toList!4502 lt!376737)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376737))) (_1!5086 lt!376679)))))))

(declare-fun b!830700 () Bool)

(assert (=> b!830700 (= e!463165 (getValueByKey!415 (t!22310 (toList!4502 lt!376737)) (_1!5086 lt!376679)))))

(declare-fun b!830701 () Bool)

(assert (=> b!830701 (= e!463165 None!419)))

(declare-fun b!830698 () Bool)

(assert (=> b!830698 (= e!463164 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376737)))))))

(declare-fun d!105549 () Bool)

(declare-fun c!89992 () Bool)

(assert (=> d!105549 (= c!89992 (and ((_ is Cons!15941) (toList!4502 lt!376737)) (= (_1!5086 (h!17070 (toList!4502 lt!376737))) (_1!5086 lt!376679))))))

(assert (=> d!105549 (= (getValueByKey!415 (toList!4502 lt!376737) (_1!5086 lt!376679)) e!463164)))

(assert (= (and d!105549 c!89992) b!830698))

(assert (= (and d!105549 (not c!89992)) b!830699))

(assert (= (and b!830699 c!89993) b!830700))

(assert (= (and b!830699 (not c!89993)) b!830701))

(declare-fun m!774171 () Bool)

(assert (=> b!830700 m!774171))

(assert (=> b!830272 d!105549))

(declare-fun d!105551 () Bool)

(declare-fun e!463166 () Bool)

(assert (=> d!105551 e!463166))

(declare-fun res!565665 () Bool)

(assert (=> d!105551 (=> res!565665 e!463166)))

(declare-fun lt!377055 () Bool)

(assert (=> d!105551 (= res!565665 (not lt!377055))))

(declare-fun lt!377057 () Bool)

(assert (=> d!105551 (= lt!377055 lt!377057)))

(declare-fun lt!377056 () Unit!28429)

(declare-fun e!463167 () Unit!28429)

(assert (=> d!105551 (= lt!377056 e!463167)))

(declare-fun c!89994 () Bool)

(assert (=> d!105551 (= c!89994 lt!377057)))

(assert (=> d!105551 (= lt!377057 (containsKey!401 (toList!4502 lt!376856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105551 (= (contains!4208 lt!376856 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377055)))

(declare-fun b!830702 () Bool)

(declare-fun lt!377058 () Unit!28429)

(assert (=> b!830702 (= e!463167 lt!377058)))

(assert (=> b!830702 (= lt!377058 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830702 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830703 () Bool)

(declare-fun Unit!28453 () Unit!28429)

(assert (=> b!830703 (= e!463167 Unit!28453)))

(declare-fun b!830704 () Bool)

(assert (=> b!830704 (= e!463166 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376856) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105551 c!89994) b!830702))

(assert (= (and d!105551 (not c!89994)) b!830703))

(assert (= (and d!105551 (not res!565665)) b!830704))

(declare-fun m!774173 () Bool)

(assert (=> d!105551 m!774173))

(declare-fun m!774175 () Bool)

(assert (=> b!830702 m!774175))

(declare-fun m!774177 () Bool)

(assert (=> b!830702 m!774177))

(assert (=> b!830702 m!774177))

(declare-fun m!774179 () Bool)

(assert (=> b!830702 m!774179))

(assert (=> b!830704 m!774177))

(assert (=> b!830704 m!774177))

(assert (=> b!830704 m!774179))

(assert (=> d!105365 d!105551))

(assert (=> d!105365 d!105343))

(declare-fun d!105553 () Bool)

(declare-fun e!463168 () Bool)

(assert (=> d!105553 e!463168))

(declare-fun res!565666 () Bool)

(assert (=> d!105553 (=> res!565666 e!463168)))

(declare-fun lt!377059 () Bool)

(assert (=> d!105553 (= res!565666 (not lt!377059))))

(declare-fun lt!377061 () Bool)

(assert (=> d!105553 (= lt!377059 lt!377061)))

(declare-fun lt!377060 () Unit!28429)

(declare-fun e!463169 () Unit!28429)

(assert (=> d!105553 (= lt!377060 e!463169)))

(declare-fun c!89995 () Bool)

(assert (=> d!105553 (= c!89995 lt!377061)))

(assert (=> d!105553 (= lt!377061 (containsKey!401 (toList!4502 lt!376817) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105553 (= (contains!4208 lt!376817 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377059)))

(declare-fun b!830705 () Bool)

(declare-fun lt!377062 () Unit!28429)

(assert (=> b!830705 (= e!463169 lt!377062)))

(assert (=> b!830705 (= lt!377062 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376817) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830705 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376817) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830706 () Bool)

(declare-fun Unit!28454 () Unit!28429)

(assert (=> b!830706 (= e!463169 Unit!28454)))

(declare-fun b!830707 () Bool)

(assert (=> b!830707 (= e!463168 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105553 c!89995) b!830705))

(assert (= (and d!105553 (not c!89995)) b!830706))

(assert (= (and d!105553 (not res!565666)) b!830707))

(declare-fun m!774181 () Bool)

(assert (=> d!105553 m!774181))

(declare-fun m!774183 () Bool)

(assert (=> b!830705 m!774183))

(assert (=> b!830705 m!774089))

(assert (=> b!830705 m!774089))

(declare-fun m!774185 () Bool)

(assert (=> b!830705 m!774185))

(assert (=> b!830707 m!774089))

(assert (=> b!830707 m!774089))

(assert (=> b!830707 m!774185))

(assert (=> bm!36252 d!105553))

(declare-fun d!105555 () Bool)

(assert (=> d!105555 (= (apply!372 lt!376856 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) (get!11818 (getValueByKey!415 (toList!4502 lt!376856) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23207 () Bool)

(assert (= bs!23207 d!105555))

(assert (=> bs!23207 m!773353))

(assert (=> bs!23207 m!774099))

(assert (=> bs!23207 m!774099))

(declare-fun m!774187 () Bool)

(assert (=> bs!23207 m!774187))

(assert (=> b!830388 d!105555))

(assert (=> b!830388 d!105395))

(assert (=> d!105363 d!105367))

(assert (=> d!105363 d!105365))

(declare-fun d!105557 () Bool)

(assert (=> d!105557 (= (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105557 true))

(declare-fun _$13!46 () Unit!28429)

(assert (=> d!105557 (= (choose!1416 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) _$13!46)))

(declare-fun bs!23208 () Bool)

(assert (= bs!23208 d!105557))

(assert (=> bs!23208 m!773273))

(assert (=> bs!23208 m!773271))

(assert (=> d!105363 d!105557))

(assert (=> d!105363 d!105343))

(declare-fun d!105559 () Bool)

(assert (=> d!105559 (= (apply!372 lt!376795 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) (get!11818 (getValueByKey!415 (toList!4502 lt!376795) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23209 () Bool)

(assert (= bs!23209 d!105559))

(assert (=> bs!23209 m!773353))

(assert (=> bs!23209 m!773633))

(assert (=> bs!23209 m!773633))

(declare-fun m!774189 () Bool)

(assert (=> bs!23209 m!774189))

(assert (=> b!830333 d!105559))

(assert (=> b!830333 d!105395))

(assert (=> b!830353 d!105379))

(declare-fun d!105561 () Bool)

(assert (=> d!105561 (arrayContainsKey!0 _keys!976 lt!376728 #b00000000000000000000000000000000)))

(declare-fun lt!377065 () Unit!28429)

(declare-fun choose!13 (array!46584 (_ BitVec 64) (_ BitVec 32)) Unit!28429)

(assert (=> d!105561 (= lt!377065 (choose!13 _keys!976 lt!376728 #b00000000000000000000000000000000))))

(assert (=> d!105561 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!105561 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!376728 #b00000000000000000000000000000000) lt!377065)))

(declare-fun bs!23210 () Bool)

(assert (= bs!23210 d!105561))

(assert (=> bs!23210 m!773365))

(declare-fun m!774191 () Bool)

(assert (=> bs!23210 m!774191))

(assert (=> b!830268 d!105561))

(declare-fun d!105563 () Bool)

(declare-fun res!565671 () Bool)

(declare-fun e!463174 () Bool)

(assert (=> d!105563 (=> res!565671 e!463174)))

(assert (=> d!105563 (= res!565671 (= (select (arr!22328 _keys!976) #b00000000000000000000000000000000) lt!376728))))

(assert (=> d!105563 (= (arrayContainsKey!0 _keys!976 lt!376728 #b00000000000000000000000000000000) e!463174)))

(declare-fun b!830712 () Bool)

(declare-fun e!463175 () Bool)

(assert (=> b!830712 (= e!463174 e!463175)))

(declare-fun res!565672 () Bool)

(assert (=> b!830712 (=> (not res!565672) (not e!463175))))

(assert (=> b!830712 (= res!565672 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(declare-fun b!830713 () Bool)

(assert (=> b!830713 (= e!463175 (arrayContainsKey!0 _keys!976 lt!376728 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!105563 (not res!565671)) b!830712))

(assert (= (and b!830712 res!565672) b!830713))

(assert (=> d!105563 m!773353))

(declare-fun m!774193 () Bool)

(assert (=> b!830713 m!774193))

(assert (=> b!830268 d!105563))

(declare-fun b!830726 () Bool)

(declare-fun e!463184 () SeekEntryResult!8744)

(declare-fun lt!377072 () SeekEntryResult!8744)

(assert (=> b!830726 (= e!463184 (Found!8744 (index!37349 lt!377072)))))

(declare-fun b!830727 () Bool)

(declare-fun e!463182 () SeekEntryResult!8744)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!46584 (_ BitVec 32)) SeekEntryResult!8744)

(assert (=> b!830727 (= e!463182 (seekKeyOrZeroReturnVacant!0 (x!70109 lt!377072) (index!37349 lt!377072) (index!37349 lt!377072) (select (arr!22328 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(declare-fun b!830728 () Bool)

(declare-fun e!463183 () SeekEntryResult!8744)

(assert (=> b!830728 (= e!463183 e!463184)))

(declare-fun lt!377074 () (_ BitVec 64))

(assert (=> b!830728 (= lt!377074 (select (arr!22328 _keys!976) (index!37349 lt!377072)))))

(declare-fun c!90003 () Bool)

(assert (=> b!830728 (= c!90003 (= lt!377074 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105565 () Bool)

(declare-fun lt!377073 () SeekEntryResult!8744)

(assert (=> d!105565 (and (or ((_ is Undefined!8744) lt!377073) (not ((_ is Found!8744) lt!377073)) (and (bvsge (index!37348 lt!377073) #b00000000000000000000000000000000) (bvslt (index!37348 lt!377073) (size!22749 _keys!976)))) (or ((_ is Undefined!8744) lt!377073) ((_ is Found!8744) lt!377073) (not ((_ is MissingZero!8744) lt!377073)) (and (bvsge (index!37347 lt!377073) #b00000000000000000000000000000000) (bvslt (index!37347 lt!377073) (size!22749 _keys!976)))) (or ((_ is Undefined!8744) lt!377073) ((_ is Found!8744) lt!377073) ((_ is MissingZero!8744) lt!377073) (not ((_ is MissingVacant!8744) lt!377073)) (and (bvsge (index!37350 lt!377073) #b00000000000000000000000000000000) (bvslt (index!37350 lt!377073) (size!22749 _keys!976)))) (or ((_ is Undefined!8744) lt!377073) (ite ((_ is Found!8744) lt!377073) (= (select (arr!22328 _keys!976) (index!37348 lt!377073)) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8744) lt!377073) (= (select (arr!22328 _keys!976) (index!37347 lt!377073)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8744) lt!377073) (= (select (arr!22328 _keys!976) (index!37350 lt!377073)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105565 (= lt!377073 e!463183)))

(declare-fun c!90002 () Bool)

(assert (=> d!105565 (= c!90002 (and ((_ is Intermediate!8744) lt!377072) (undefined!9556 lt!377072)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!46584 (_ BitVec 32)) SeekEntryResult!8744)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!105565 (= lt!377072 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) mask!1312) (select (arr!22328 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(assert (=> d!105565 (validMask!0 mask!1312)))

(assert (=> d!105565 (= (seekEntryOrOpen!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!377073)))

(declare-fun b!830729 () Bool)

(assert (=> b!830729 (= e!463183 Undefined!8744)))

(declare-fun b!830730 () Bool)

(declare-fun c!90004 () Bool)

(assert (=> b!830730 (= c!90004 (= lt!377074 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830730 (= e!463184 e!463182)))

(declare-fun b!830731 () Bool)

(assert (=> b!830731 (= e!463182 (MissingZero!8744 (index!37349 lt!377072)))))

(assert (= (and d!105565 c!90002) b!830729))

(assert (= (and d!105565 (not c!90002)) b!830728))

(assert (= (and b!830728 c!90003) b!830726))

(assert (= (and b!830728 (not c!90003)) b!830730))

(assert (= (and b!830730 c!90004) b!830731))

(assert (= (and b!830730 (not c!90004)) b!830727))

(assert (=> b!830727 m!773353))

(declare-fun m!774195 () Bool)

(assert (=> b!830727 m!774195))

(declare-fun m!774197 () Bool)

(assert (=> b!830728 m!774197))

(assert (=> d!105565 m!773289))

(declare-fun m!774199 () Bool)

(assert (=> d!105565 m!774199))

(declare-fun m!774201 () Bool)

(assert (=> d!105565 m!774201))

(declare-fun m!774203 () Bool)

(assert (=> d!105565 m!774203))

(assert (=> d!105565 m!773353))

(declare-fun m!774205 () Bool)

(assert (=> d!105565 m!774205))

(declare-fun m!774207 () Bool)

(assert (=> d!105565 m!774207))

(assert (=> d!105565 m!773353))

(assert (=> d!105565 m!774203))

(assert (=> b!830268 d!105565))

(declare-fun d!105567 () Bool)

(declare-fun e!463185 () Bool)

(assert (=> d!105567 e!463185))

(declare-fun res!565673 () Bool)

(assert (=> d!105567 (=> res!565673 e!463185)))

(declare-fun lt!377075 () Bool)

(assert (=> d!105567 (= res!565673 (not lt!377075))))

(declare-fun lt!377077 () Bool)

(assert (=> d!105567 (= lt!377075 lt!377077)))

(declare-fun lt!377076 () Unit!28429)

(declare-fun e!463186 () Unit!28429)

(assert (=> d!105567 (= lt!377076 e!463186)))

(declare-fun c!90005 () Bool)

(assert (=> d!105567 (= c!90005 lt!377077)))

(assert (=> d!105567 (= lt!377077 (containsKey!401 (toList!4502 lt!376720) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105567 (= (contains!4208 lt!376720 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377075)))

(declare-fun b!830732 () Bool)

(declare-fun lt!377078 () Unit!28429)

(assert (=> b!830732 (= e!463186 lt!377078)))

(assert (=> b!830732 (= lt!377078 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376720) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> b!830732 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376720) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!830733 () Bool)

(declare-fun Unit!28455 () Unit!28429)

(assert (=> b!830733 (= e!463186 Unit!28455)))

(declare-fun b!830734 () Bool)

(assert (=> b!830734 (= e!463185 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376720) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!105567 c!90005) b!830732))

(assert (= (and d!105567 (not c!90005)) b!830733))

(assert (= (and d!105567 (not res!565673)) b!830734))

(declare-fun m!774209 () Bool)

(assert (=> d!105567 m!774209))

(declare-fun m!774211 () Bool)

(assert (=> b!830732 m!774211))

(assert (=> b!830732 m!773349))

(assert (=> b!830732 m!773349))

(declare-fun m!774213 () Bool)

(assert (=> b!830732 m!774213))

(assert (=> b!830734 m!773349))

(assert (=> b!830734 m!773349))

(assert (=> b!830734 m!774213))

(assert (=> d!105339 d!105567))

(declare-fun b!830736 () Bool)

(declare-fun e!463187 () Option!421)

(declare-fun e!463188 () Option!421)

(assert (=> b!830736 (= e!463187 e!463188)))

(declare-fun c!90007 () Bool)

(assert (=> b!830736 (= c!90007 (and ((_ is Cons!15941) lt!376717) (not (= (_1!5086 (h!17070 lt!376717)) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!830737 () Bool)

(assert (=> b!830737 (= e!463188 (getValueByKey!415 (t!22310 lt!376717) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!830738 () Bool)

(assert (=> b!830738 (= e!463188 None!419)))

(declare-fun b!830735 () Bool)

(assert (=> b!830735 (= e!463187 (Some!420 (_2!5086 (h!17070 lt!376717))))))

(declare-fun d!105569 () Bool)

(declare-fun c!90006 () Bool)

(assert (=> d!105569 (= c!90006 (and ((_ is Cons!15941) lt!376717) (= (_1!5086 (h!17070 lt!376717)) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105569 (= (getValueByKey!415 lt!376717 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463187)))

(assert (= (and d!105569 c!90006) b!830735))

(assert (= (and d!105569 (not c!90006)) b!830736))

(assert (= (and b!830736 c!90007) b!830737))

(assert (= (and b!830736 (not c!90007)) b!830738))

(declare-fun m!774215 () Bool)

(assert (=> b!830737 m!774215))

(assert (=> d!105339 d!105569))

(declare-fun d!105571 () Bool)

(assert (=> d!105571 (= (getValueByKey!415 lt!376717 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!420 (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377079 () Unit!28429)

(assert (=> d!105571 (= lt!377079 (choose!1418 lt!376717 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!463189 () Bool)

(assert (=> d!105571 e!463189))

(declare-fun res!565674 () Bool)

(assert (=> d!105571 (=> (not res!565674) (not e!463189))))

(assert (=> d!105571 (= res!565674 (isStrictlySorted!441 lt!376717))))

(assert (=> d!105571 (= (lemmaContainsTupThenGetReturnValue!229 lt!376717 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377079)))

(declare-fun b!830739 () Bool)

(declare-fun res!565675 () Bool)

(assert (=> b!830739 (=> (not res!565675) (not e!463189))))

(assert (=> b!830739 (= res!565675 (containsKey!401 lt!376717 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!830740 () Bool)

(assert (=> b!830740 (= e!463189 (contains!4209 lt!376717 (tuple2!10151 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!105571 res!565674) b!830739))

(assert (= (and b!830739 res!565675) b!830740))

(assert (=> d!105571 m!773343))

(declare-fun m!774217 () Bool)

(assert (=> d!105571 m!774217))

(declare-fun m!774219 () Bool)

(assert (=> d!105571 m!774219))

(declare-fun m!774221 () Bool)

(assert (=> b!830739 m!774221))

(declare-fun m!774223 () Bool)

(assert (=> b!830740 m!774223))

(assert (=> d!105339 d!105571))

(declare-fun d!105573 () Bool)

(declare-fun e!463192 () Bool)

(assert (=> d!105573 e!463192))

(declare-fun res!565677 () Bool)

(assert (=> d!105573 (=> (not res!565677) (not e!463192))))

(declare-fun lt!377080 () List!15945)

(assert (=> d!105573 (= res!565677 (isStrictlySorted!441 lt!377080))))

(declare-fun e!463193 () List!15945)

(assert (=> d!105573 (= lt!377080 e!463193)))

(declare-fun c!90011 () Bool)

(assert (=> d!105573 (= c!90011 (and ((_ is Cons!15941) (toList!4502 lt!376681)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376681))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105573 (isStrictlySorted!441 (toList!4502 lt!376681))))

(assert (=> d!105573 (= (insertStrictlySorted!268 (toList!4502 lt!376681) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377080)))

(declare-fun b!830741 () Bool)

(declare-fun res!565676 () Bool)

(assert (=> b!830741 (=> (not res!565676) (not e!463192))))

(assert (=> b!830741 (= res!565676 (containsKey!401 lt!377080 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!830742 () Bool)

(declare-fun e!463191 () List!15945)

(assert (=> b!830742 (= e!463191 (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376681)) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun call!36286 () List!15945)

(declare-fun bm!36281 () Bool)

(assert (=> bm!36281 (= call!36286 ($colon$colon!536 e!463191 (ite c!90011 (h!17070 (toList!4502 lt!376681)) (tuple2!10151 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!90010 () Bool)

(assert (=> bm!36281 (= c!90010 c!90011)))

(declare-fun b!830743 () Bool)

(assert (=> b!830743 (= e!463192 (contains!4209 lt!377080 (tuple2!10151 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!830744 () Bool)

(declare-fun c!90009 () Bool)

(declare-fun c!90008 () Bool)

(assert (=> b!830744 (= e!463191 (ite c!90008 (t!22310 (toList!4502 lt!376681)) (ite c!90009 (Cons!15941 (h!17070 (toList!4502 lt!376681)) (t!22310 (toList!4502 lt!376681))) Nil!15942)))))

(declare-fun b!830745 () Bool)

(declare-fun e!463190 () List!15945)

(declare-fun call!36285 () List!15945)

(assert (=> b!830745 (= e!463190 call!36285)))

(declare-fun bm!36282 () Bool)

(declare-fun call!36284 () List!15945)

(assert (=> bm!36282 (= call!36285 call!36284)))

(declare-fun bm!36283 () Bool)

(assert (=> bm!36283 (= call!36284 call!36286)))

(declare-fun b!830746 () Bool)

(assert (=> b!830746 (= e!463190 call!36285)))

(declare-fun b!830747 () Bool)

(assert (=> b!830747 (= e!463193 call!36286)))

(declare-fun b!830748 () Bool)

(declare-fun e!463194 () List!15945)

(assert (=> b!830748 (= e!463194 call!36284)))

(declare-fun b!830749 () Bool)

(assert (=> b!830749 (= c!90009 (and ((_ is Cons!15941) (toList!4502 lt!376681)) (bvsgt (_1!5086 (h!17070 (toList!4502 lt!376681))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> b!830749 (= e!463194 e!463190)))

(declare-fun b!830750 () Bool)

(assert (=> b!830750 (= e!463193 e!463194)))

(assert (=> b!830750 (= c!90008 (and ((_ is Cons!15941) (toList!4502 lt!376681)) (= (_1!5086 (h!17070 (toList!4502 lt!376681))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!105573 c!90011) b!830747))

(assert (= (and d!105573 (not c!90011)) b!830750))

(assert (= (and b!830750 c!90008) b!830748))

(assert (= (and b!830750 (not c!90008)) b!830749))

(assert (= (and b!830749 c!90009) b!830746))

(assert (= (and b!830749 (not c!90009)) b!830745))

(assert (= (or b!830746 b!830745) bm!36282))

(assert (= (or b!830748 bm!36282) bm!36283))

(assert (= (or b!830747 bm!36283) bm!36281))

(assert (= (and bm!36281 c!90010) b!830742))

(assert (= (and bm!36281 (not c!90010)) b!830744))

(assert (= (and d!105573 res!565677) b!830741))

(assert (= (and b!830741 res!565676) b!830743))

(declare-fun m!774225 () Bool)

(assert (=> bm!36281 m!774225))

(declare-fun m!774227 () Bool)

(assert (=> b!830741 m!774227))

(declare-fun m!774229 () Bool)

(assert (=> b!830743 m!774229))

(declare-fun m!774231 () Bool)

(assert (=> d!105573 m!774231))

(declare-fun m!774233 () Bool)

(assert (=> d!105573 m!774233))

(declare-fun m!774235 () Bool)

(assert (=> b!830742 m!774235))

(assert (=> d!105339 d!105573))

(declare-fun d!105575 () Bool)

(declare-fun e!463195 () Bool)

(assert (=> d!105575 e!463195))

(declare-fun res!565679 () Bool)

(assert (=> d!105575 (=> (not res!565679) (not e!463195))))

(declare-fun lt!377084 () ListLongMap!8973)

(assert (=> d!105575 (= res!565679 (contains!4208 lt!377084 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377081 () List!15945)

(assert (=> d!105575 (= lt!377084 (ListLongMap!8974 lt!377081))))

(declare-fun lt!377083 () Unit!28429)

(declare-fun lt!377082 () Unit!28429)

(assert (=> d!105575 (= lt!377083 lt!377082)))

(assert (=> d!105575 (= (getValueByKey!415 lt!377081 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!420 (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105575 (= lt!377082 (lemmaContainsTupThenGetReturnValue!229 lt!377081 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105575 (= lt!377081 (insertStrictlySorted!268 (toList!4502 call!36260) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105575 (= (+!1980 call!36260 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377084)))

(declare-fun b!830751 () Bool)

(declare-fun res!565678 () Bool)

(assert (=> b!830751 (=> (not res!565678) (not e!463195))))

(assert (=> b!830751 (= res!565678 (= (getValueByKey!415 (toList!4502 lt!377084) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!420 (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!830752 () Bool)

(assert (=> b!830752 (= e!463195 (contains!4209 (toList!4502 lt!377084) (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105575 res!565679) b!830751))

(assert (= (and b!830751 res!565678) b!830752))

(declare-fun m!774237 () Bool)

(assert (=> d!105575 m!774237))

(declare-fun m!774239 () Bool)

(assert (=> d!105575 m!774239))

(declare-fun m!774241 () Bool)

(assert (=> d!105575 m!774241))

(declare-fun m!774243 () Bool)

(assert (=> d!105575 m!774243))

(declare-fun m!774245 () Bool)

(assert (=> b!830751 m!774245))

(declare-fun m!774247 () Bool)

(assert (=> b!830752 m!774247))

(assert (=> b!830401 d!105575))

(assert (=> b!830401 d!105395))

(declare-fun d!105577 () Bool)

(declare-fun e!463196 () Bool)

(assert (=> d!105577 e!463196))

(declare-fun res!565680 () Bool)

(assert (=> d!105577 (=> res!565680 e!463196)))

(declare-fun lt!377085 () Bool)

(assert (=> d!105577 (= res!565680 (not lt!377085))))

(declare-fun lt!377087 () Bool)

(assert (=> d!105577 (= lt!377085 lt!377087)))

(declare-fun lt!377086 () Unit!28429)

(declare-fun e!463197 () Unit!28429)

(assert (=> d!105577 (= lt!377086 e!463197)))

(declare-fun c!90012 () Bool)

(assert (=> d!105577 (= c!90012 lt!377087)))

(assert (=> d!105577 (= lt!377087 (containsKey!401 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))) lt!376860))))

(assert (=> d!105577 (= (contains!4208 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859)) lt!376860) lt!377085)))

(declare-fun b!830753 () Bool)

(declare-fun lt!377088 () Unit!28429)

(assert (=> b!830753 (= e!463197 lt!377088)))

(assert (=> b!830753 (= lt!377088 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))) lt!376860))))

(assert (=> b!830753 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))) lt!376860))))

(declare-fun b!830754 () Bool)

(declare-fun Unit!28456 () Unit!28429)

(assert (=> b!830754 (= e!463197 Unit!28456)))

(declare-fun b!830755 () Bool)

(assert (=> b!830755 (= e!463196 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))) lt!376860)))))

(assert (= (and d!105577 c!90012) b!830753))

(assert (= (and d!105577 (not c!90012)) b!830754))

(assert (= (and d!105577 (not res!565680)) b!830755))

(declare-fun m!774249 () Bool)

(assert (=> d!105577 m!774249))

(declare-fun m!774251 () Bool)

(assert (=> b!830753 m!774251))

(declare-fun m!774253 () Bool)

(assert (=> b!830753 m!774253))

(assert (=> b!830753 m!774253))

(declare-fun m!774255 () Bool)

(assert (=> b!830753 m!774255))

(assert (=> b!830755 m!774253))

(assert (=> b!830755 m!774253))

(assert (=> b!830755 m!774255))

(assert (=> b!830401 d!105577))

(declare-fun d!105579 () Bool)

(assert (=> d!105579 (not (contains!4208 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859)) lt!376860))))

(declare-fun lt!377089 () Unit!28429)

(assert (=> d!105579 (= lt!377089 (choose!1417 lt!376862 lt!376861 lt!376859 lt!376860))))

(declare-fun e!463198 () Bool)

(assert (=> d!105579 e!463198))

(declare-fun res!565681 () Bool)

(assert (=> d!105579 (=> (not res!565681) (not e!463198))))

(assert (=> d!105579 (= res!565681 (not (contains!4208 lt!376862 lt!376860)))))

(assert (=> d!105579 (= (addStillNotContains!197 lt!376862 lt!376861 lt!376859 lt!376860) lt!377089)))

(declare-fun b!830756 () Bool)

(assert (=> b!830756 (= e!463198 (not (= lt!376861 lt!376860)))))

(assert (= (and d!105579 res!565681) b!830756))

(assert (=> d!105579 m!773545))

(assert (=> d!105579 m!773545))

(assert (=> d!105579 m!773549))

(declare-fun m!774257 () Bool)

(assert (=> d!105579 m!774257))

(declare-fun m!774259 () Bool)

(assert (=> d!105579 m!774259))

(assert (=> b!830401 d!105579))

(declare-fun d!105581 () Bool)

(declare-fun e!463199 () Bool)

(assert (=> d!105581 e!463199))

(declare-fun res!565683 () Bool)

(assert (=> d!105581 (=> (not res!565683) (not e!463199))))

(declare-fun lt!377093 () ListLongMap!8973)

(assert (=> d!105581 (= res!565683 (contains!4208 lt!377093 (_1!5086 (tuple2!10151 lt!376861 lt!376859))))))

(declare-fun lt!377090 () List!15945)

(assert (=> d!105581 (= lt!377093 (ListLongMap!8974 lt!377090))))

(declare-fun lt!377092 () Unit!28429)

(declare-fun lt!377091 () Unit!28429)

(assert (=> d!105581 (= lt!377092 lt!377091)))

(assert (=> d!105581 (= (getValueByKey!415 lt!377090 (_1!5086 (tuple2!10151 lt!376861 lt!376859))) (Some!420 (_2!5086 (tuple2!10151 lt!376861 lt!376859))))))

(assert (=> d!105581 (= lt!377091 (lemmaContainsTupThenGetReturnValue!229 lt!377090 (_1!5086 (tuple2!10151 lt!376861 lt!376859)) (_2!5086 (tuple2!10151 lt!376861 lt!376859))))))

(assert (=> d!105581 (= lt!377090 (insertStrictlySorted!268 (toList!4502 lt!376862) (_1!5086 (tuple2!10151 lt!376861 lt!376859)) (_2!5086 (tuple2!10151 lt!376861 lt!376859))))))

(assert (=> d!105581 (= (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859)) lt!377093)))

(declare-fun b!830757 () Bool)

(declare-fun res!565682 () Bool)

(assert (=> b!830757 (=> (not res!565682) (not e!463199))))

(assert (=> b!830757 (= res!565682 (= (getValueByKey!415 (toList!4502 lt!377093) (_1!5086 (tuple2!10151 lt!376861 lt!376859))) (Some!420 (_2!5086 (tuple2!10151 lt!376861 lt!376859)))))))

(declare-fun b!830758 () Bool)

(assert (=> b!830758 (= e!463199 (contains!4209 (toList!4502 lt!377093) (tuple2!10151 lt!376861 lt!376859)))))

(assert (= (and d!105581 res!565683) b!830757))

(assert (= (and b!830757 res!565682) b!830758))

(declare-fun m!774261 () Bool)

(assert (=> d!105581 m!774261))

(declare-fun m!774263 () Bool)

(assert (=> d!105581 m!774263))

(declare-fun m!774265 () Bool)

(assert (=> d!105581 m!774265))

(declare-fun m!774267 () Bool)

(assert (=> d!105581 m!774267))

(declare-fun m!774269 () Bool)

(assert (=> b!830757 m!774269))

(declare-fun m!774271 () Bool)

(assert (=> b!830758 m!774271))

(assert (=> b!830401 d!105581))

(assert (=> b!830328 d!105379))

(declare-fun bm!36284 () Bool)

(declare-fun call!36287 () Bool)

(assert (=> bm!36284 (= call!36287 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!830759 () Bool)

(declare-fun e!463202 () Bool)

(assert (=> b!830759 (= e!463202 call!36287)))

(declare-fun b!830760 () Bool)

(declare-fun e!463201 () Bool)

(declare-fun e!463200 () Bool)

(assert (=> b!830760 (= e!463201 e!463200)))

(declare-fun c!90013 () Bool)

(assert (=> b!830760 (= c!90013 (validKeyInArray!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!105583 () Bool)

(declare-fun res!565685 () Bool)

(assert (=> d!105583 (=> res!565685 e!463201)))

(assert (=> d!105583 (= res!565685 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(assert (=> d!105583 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312) e!463201)))

(declare-fun b!830761 () Bool)

(assert (=> b!830761 (= e!463200 e!463202)))

(declare-fun lt!377095 () (_ BitVec 64))

(assert (=> b!830761 (= lt!377095 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!377094 () Unit!28429)

(assert (=> b!830761 (= lt!377094 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377095 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!830761 (arrayContainsKey!0 _keys!976 lt!377095 #b00000000000000000000000000000000)))

(declare-fun lt!377096 () Unit!28429)

(assert (=> b!830761 (= lt!377096 lt!377094)))

(declare-fun res!565684 () Bool)

(assert (=> b!830761 (= res!565684 (= (seekEntryOrOpen!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312) (Found!8744 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!830761 (=> (not res!565684) (not e!463202))))

(declare-fun b!830762 () Bool)

(assert (=> b!830762 (= e!463200 call!36287)))

(assert (= (and d!105583 (not res!565685)) b!830760))

(assert (= (and b!830760 c!90013) b!830761))

(assert (= (and b!830760 (not c!90013)) b!830762))

(assert (= (and b!830761 res!565684) b!830759))

(assert (= (or b!830759 b!830762) bm!36284))

(declare-fun m!774273 () Bool)

(assert (=> bm!36284 m!774273))

(assert (=> b!830760 m!773859))

(assert (=> b!830760 m!773859))

(assert (=> b!830760 m!773867))

(assert (=> b!830761 m!773859))

(declare-fun m!774275 () Bool)

(assert (=> b!830761 m!774275))

(declare-fun m!774277 () Bool)

(assert (=> b!830761 m!774277))

(assert (=> b!830761 m!773859))

(declare-fun m!774279 () Bool)

(assert (=> b!830761 m!774279))

(assert (=> bm!36225 d!105583))

(declare-fun b!830764 () Bool)

(declare-fun e!463203 () Option!421)

(declare-fun e!463204 () Option!421)

(assert (=> b!830764 (= e!463203 e!463204)))

(declare-fun c!90015 () Bool)

(assert (=> b!830764 (= c!90015 (and ((_ is Cons!15941) (toList!4502 lt!376716)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376716))) (_1!5086 lt!376677)))))))

(declare-fun b!830765 () Bool)

(assert (=> b!830765 (= e!463204 (getValueByKey!415 (t!22310 (toList!4502 lt!376716)) (_1!5086 lt!376677)))))

(declare-fun b!830766 () Bool)

(assert (=> b!830766 (= e!463204 None!419)))

(declare-fun b!830763 () Bool)

(assert (=> b!830763 (= e!463203 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376716)))))))

(declare-fun d!105585 () Bool)

(declare-fun c!90014 () Bool)

(assert (=> d!105585 (= c!90014 (and ((_ is Cons!15941) (toList!4502 lt!376716)) (= (_1!5086 (h!17070 (toList!4502 lt!376716))) (_1!5086 lt!376677))))))

(assert (=> d!105585 (= (getValueByKey!415 (toList!4502 lt!376716) (_1!5086 lt!376677)) e!463203)))

(assert (= (and d!105585 c!90014) b!830763))

(assert (= (and d!105585 (not c!90014)) b!830764))

(assert (= (and b!830764 c!90015) b!830765))

(assert (= (and b!830764 (not c!90015)) b!830766))

(declare-fun m!774281 () Bool)

(assert (=> b!830765 m!774281))

(assert (=> b!830239 d!105585))

(assert (=> d!105357 d!105343))

(declare-fun b!830768 () Bool)

(declare-fun e!463205 () Option!421)

(declare-fun e!463206 () Option!421)

(assert (=> b!830768 (= e!463205 e!463206)))

(declare-fun c!90017 () Bool)

(assert (=> b!830768 (= c!90017 (and ((_ is Cons!15941) (toList!4502 lt!376720)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376720))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!830769 () Bool)

(assert (=> b!830769 (= e!463206 (getValueByKey!415 (t!22310 (toList!4502 lt!376720)) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!830770 () Bool)

(assert (=> b!830770 (= e!463206 None!419)))

(declare-fun b!830767 () Bool)

(assert (=> b!830767 (= e!463205 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376720)))))))

(declare-fun d!105587 () Bool)

(declare-fun c!90016 () Bool)

(assert (=> d!105587 (= c!90016 (and ((_ is Cons!15941) (toList!4502 lt!376720)) (= (_1!5086 (h!17070 (toList!4502 lt!376720))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105587 (= (getValueByKey!415 (toList!4502 lt!376720) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463205)))

(assert (= (and d!105587 c!90016) b!830767))

(assert (= (and d!105587 (not c!90016)) b!830768))

(assert (= (and b!830768 c!90017) b!830769))

(assert (= (and b!830768 (not c!90017)) b!830770))

(declare-fun m!774283 () Bool)

(assert (=> b!830769 m!774283))

(assert (=> b!830241 d!105587))

(assert (=> bm!36257 d!105457))

(declare-fun b!830771 () Bool)

(declare-fun e!463207 () Bool)

(declare-fun e!463210 () Bool)

(assert (=> b!830771 (= e!463207 e!463210)))

(declare-fun c!90018 () Bool)

(assert (=> b!830771 (= c!90018 (validKeyInArray!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!830772 () Bool)

(declare-fun call!36288 () Bool)

(assert (=> b!830772 (= e!463210 call!36288)))

(declare-fun b!830773 () Bool)

(declare-fun e!463208 () Bool)

(assert (=> b!830773 (= e!463208 e!463207)))

(declare-fun res!565687 () Bool)

(assert (=> b!830773 (=> (not res!565687) (not e!463207))))

(declare-fun e!463209 () Bool)

(assert (=> b!830773 (= res!565687 (not e!463209))))

(declare-fun res!565686 () Bool)

(assert (=> b!830773 (=> (not res!565686) (not e!463209))))

(assert (=> b!830773 (= res!565686 (validKeyInArray!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!36285 () Bool)

(assert (=> bm!36285 (= call!36288 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90018 (Cons!15940 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941)) (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941))))))

(declare-fun d!105589 () Bool)

(declare-fun res!565688 () Bool)

(assert (=> d!105589 (=> res!565688 e!463208)))

(assert (=> d!105589 (= res!565688 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(assert (=> d!105589 (= (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941)) e!463208)))

(declare-fun b!830774 () Bool)

(assert (=> b!830774 (= e!463209 (contains!4210 (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!830775 () Bool)

(assert (=> b!830775 (= e!463210 call!36288)))

(assert (= (and d!105589 (not res!565688)) b!830773))

(assert (= (and b!830773 res!565686) b!830774))

(assert (= (and b!830773 res!565687) b!830771))

(assert (= (and b!830771 c!90018) b!830775))

(assert (= (and b!830771 (not c!90018)) b!830772))

(assert (= (or b!830775 b!830772) bm!36285))

(assert (=> b!830771 m!773859))

(assert (=> b!830771 m!773859))

(assert (=> b!830771 m!773867))

(assert (=> b!830773 m!773859))

(assert (=> b!830773 m!773859))

(assert (=> b!830773 m!773867))

(assert (=> bm!36285 m!773859))

(declare-fun m!774285 () Bool)

(assert (=> bm!36285 m!774285))

(assert (=> b!830774 m!773859))

(assert (=> b!830774 m!773859))

(declare-fun m!774287 () Bool)

(assert (=> b!830774 m!774287))

(assert (=> bm!36222 d!105589))

(assert (=> b!830399 d!105379))

(assert (=> b!830410 d!105379))

(declare-fun b!830776 () Bool)

(declare-fun e!463212 () Bool)

(assert (=> b!830776 (= e!463212 tp_is_empty!15207)))

(declare-fun mapIsEmpty!24470 () Bool)

(declare-fun mapRes!24470 () Bool)

(assert (=> mapIsEmpty!24470 mapRes!24470))

(declare-fun b!830777 () Bool)

(declare-fun e!463211 () Bool)

(assert (=> b!830777 (= e!463211 tp_is_empty!15207)))

(declare-fun condMapEmpty!24470 () Bool)

(declare-fun mapDefault!24470 () ValueCell!7188)

(assert (=> mapNonEmpty!24469 (= condMapEmpty!24470 (= mapRest!24469 ((as const (Array (_ BitVec 32) ValueCell!7188)) mapDefault!24470)))))

(assert (=> mapNonEmpty!24469 (= tp!47287 (and e!463211 mapRes!24470))))

(declare-fun mapNonEmpty!24470 () Bool)

(declare-fun tp!47288 () Bool)

(assert (=> mapNonEmpty!24470 (= mapRes!24470 (and tp!47288 e!463212))))

(declare-fun mapRest!24470 () (Array (_ BitVec 32) ValueCell!7188))

(declare-fun mapKey!24470 () (_ BitVec 32))

(declare-fun mapValue!24470 () ValueCell!7188)

(assert (=> mapNonEmpty!24470 (= mapRest!24469 (store mapRest!24470 mapKey!24470 mapValue!24470))))

(assert (= (and mapNonEmpty!24469 condMapEmpty!24470) mapIsEmpty!24470))

(assert (= (and mapNonEmpty!24469 (not condMapEmpty!24470)) mapNonEmpty!24470))

(assert (= (and mapNonEmpty!24470 ((_ is ValueCellFull!7188) mapValue!24470)) b!830776))

(assert (= (and mapNonEmpty!24469 ((_ is ValueCellFull!7188) mapDefault!24470)) b!830777))

(declare-fun m!774289 () Bool)

(assert (=> mapNonEmpty!24470 m!774289))

(declare-fun b_lambda!11379 () Bool)

(assert (= b_lambda!11377 (or (and start!71488 b_free!13497) b_lambda!11379)))

(declare-fun b_lambda!11381 () Bool)

(assert (= b_lambda!11371 (or (and start!71488 b_free!13497) b_lambda!11381)))

(declare-fun b_lambda!11383 () Bool)

(assert (= b_lambda!11373 (or (and start!71488 b_free!13497) b_lambda!11383)))

(declare-fun b_lambda!11385 () Bool)

(assert (= b_lambda!11375 (or (and start!71488 b_free!13497) b_lambda!11385)))

(check-sat (not b!830571) (not b!830640) (not d!105571) (not b!830566) (not b!830474) (not b!830615) (not b_lambda!11385) (not d!105541) (not b!830437) (not b!830492) (not d!105495) (not d!105491) (not b!830565) (not d!105435) (not b!830734) (not b!830420) (not d!105555) (not d!105447) (not d!105559) (not d!105497) (not b!830485) (not b!830732) (not b!830702) (not b!830694) (not b!830600) (not bm!36271) (not b!830536) (not b!830554) (not b!830599) (not b!830444) (not b!830682) (not d!105525) (not b!830460) (not b!830563) (not d!105473) (not b!830570) (not d!105459) (not b!830653) (not d!105405) (not d!105455) (not d!105567) (not b_lambda!11369) (not b!830639) (not b!830601) (not b!830673) (not d!105553) (not d!105465) (not b!830553) (not b!830559) (not b!830461) (not d!105475) (not d!105417) (not b!830678) (not b!830758) (not b_lambda!11381) (not d!105445) (not b!830527) (not b!830704) (not bm!36284) (not b!830575) (not b!830469) (not b!830560) (not b!830552) (not b!830753) (not b!830596) (not d!105539) (not b!830491) (not b!830755) (not b!830513) (not b_lambda!11365) (not b!830613) (not bm!36267) (not b!830582) tp_is_empty!15207 (not b_next!13497) (not b!830447) (not b!830421) (not b!830562) (not d!105551) (not b!830621) (not d!105481) (not d!105489) (not b!830663) (not b!830459) (not b!830739) (not b!830515) (not d!105529) (not d!105467) (not b!830525) (not b!830585) (not d!105399) (not d!105519) (not d!105381) (not b!830524) (not b!830595) (not b!830576) (not b!830774) (not d!105401) (not b!830537) (not d!105547) (not d!105439) (not d!105535) (not b!830757) (not b!830530) (not b!830634) (not d!105409) (not d!105441) (not d!105503) (not d!105579) (not d!105433) (not b!830603) (not d!105505) (not d!105427) (not b!830643) (not b!830623) (not b_lambda!11367) (not b!830743) (not b_lambda!11359) (not b!830681) (not d!105527) (not b!830642) (not d!105493) (not d!105411) (not b!830439) (not mapNonEmpty!24470) (not b!830641) (not b!830533) (not b!830427) (not d!105463) (not d!105461) (not b!830583) (not b!830769) (not d!105557) (not b_lambda!11361) (not b!830441) (not b!830602) (not d!105421) (not d!105477) (not bm!36272) (not b!830707) (not b!830752) (not b!830684) (not b!830528) (not d!105501) (not d!105533) (not b!830538) (not d!105485) (not b!830587) (not b!830632) (not b!830581) (not b!830618) (not d!105521) (not b!830434) (not b!830555) b_and!22549 (not d!105383) (not d!105581) (not b_lambda!11363) (not b_lambda!11379) (not bm!36285) (not d!105471) (not b!830610) (not b!830751) (not b!830658) (not d!105373) (not d!105371) (not bm!36278) (not d!105543) (not bm!36270) (not b!830514) (not b!830462) (not d!105575) (not b!830608) (not bm!36281) (not b!830573) (not b!830624) (not b!830713) (not d!105377) (not b!830607) (not d!105573) (not b!830675) (not b!830700) (not b!830450) (not d!105397) (not b!830680) (not d!105415) (not b!830660) (not b!830765) (not d!105389) (not b!830622) (not bm!36264) (not b!830436) (not b!830742) (not b!830670) (not b!830683) (not d!105375) (not d!105509) (not b!830771) (not b!830727) (not b!830741) (not d!105483) (not b!830665) (not b!830737) (not b!830556) (not b!830442) (not b!830577) (not b!830597) (not b!830471) (not b!830705) (not d!105517) (not b!830472) (not b!830697) (not b!830448) (not b!830588) (not b!830535) (not d!105565) (not d!105387) (not b!830664) (not d!105457) (not b!830594) (not d!105487) (not b!830696) (not b!830569) (not d!105369) (not b!830637) (not b!830464) (not b!830539) (not b!830620) (not d!105453) (not d!105431) (not d!105561) (not b!830452) (not d!105391) (not d!105449) (not d!105513) (not b!830445) (not d!105425) (not d!105523) (not b!830668) (not b!830760) (not d!105403) (not d!105429) (not b!830612) (not d!105479) (not d!105469) (not b!830672) (not d!105443) (not d!105423) (not b!830449) (not b!830651) (not d!105437) (not b!830463) (not b!830558) (not b!830773) (not bm!36275) (not d!105451) (not b!830454) (not d!105413) (not b!830661) (not d!105393) (not b!830656) (not b!830740) (not b_lambda!11383) (not d!105385) (not b!830761) (not d!105577) (not d!105511) (not b!830578))
(check-sat b_and!22549 (not b_next!13497))
(get-model)

(declare-fun d!105591 () Bool)

(assert (=> d!105591 (= (get!11818 (getValueByKey!415 (toList!4502 lt!376817) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))) (v!10095 (getValueByKey!415 (toList!4502 lt!376817) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105523 d!105591))

(declare-fun b!830779 () Bool)

(declare-fun e!463213 () Option!421)

(declare-fun e!463214 () Option!421)

(assert (=> b!830779 (= e!463213 e!463214)))

(declare-fun c!90020 () Bool)

(assert (=> b!830779 (= c!90020 (and ((_ is Cons!15941) (toList!4502 lt!376817)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376817))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!830780 () Bool)

(assert (=> b!830780 (= e!463214 (getValueByKey!415 (t!22310 (toList!4502 lt!376817)) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830781 () Bool)

(assert (=> b!830781 (= e!463214 None!419)))

(declare-fun b!830778 () Bool)

(assert (=> b!830778 (= e!463213 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376817)))))))

(declare-fun d!105593 () Bool)

(declare-fun c!90019 () Bool)

(assert (=> d!105593 (= c!90019 (and ((_ is Cons!15941) (toList!4502 lt!376817)) (= (_1!5086 (h!17070 (toList!4502 lt!376817))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105593 (= (getValueByKey!415 (toList!4502 lt!376817) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) e!463213)))

(assert (= (and d!105593 c!90019) b!830778))

(assert (= (and d!105593 (not c!90019)) b!830779))

(assert (= (and b!830779 c!90020) b!830780))

(assert (= (and b!830779 (not c!90020)) b!830781))

(assert (=> b!830780 m!773353))

(declare-fun m!774291 () Bool)

(assert (=> b!830780 m!774291))

(assert (=> d!105523 d!105593))

(declare-fun d!105595 () Bool)

(declare-fun lt!377097 () Bool)

(assert (=> d!105595 (= lt!377097 (select (content!386 (toList!4502 lt!376868)) (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!463216 () Bool)

(assert (=> d!105595 (= lt!377097 e!463216)))

(declare-fun res!565689 () Bool)

(assert (=> d!105595 (=> (not res!565689) (not e!463216))))

(assert (=> d!105595 (= res!565689 ((_ is Cons!15941) (toList!4502 lt!376868)))))

(assert (=> d!105595 (= (contains!4209 (toList!4502 lt!376868) (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377097)))

(declare-fun b!830782 () Bool)

(declare-fun e!463215 () Bool)

(assert (=> b!830782 (= e!463216 e!463215)))

(declare-fun res!565690 () Bool)

(assert (=> b!830782 (=> res!565690 e!463215)))

(assert (=> b!830782 (= res!565690 (= (h!17070 (toList!4502 lt!376868)) (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!830783 () Bool)

(assert (=> b!830783 (= e!463215 (contains!4209 (t!22310 (toList!4502 lt!376868)) (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!105595 res!565689) b!830782))

(assert (= (and b!830782 (not res!565690)) b!830783))

(declare-fun m!774293 () Bool)

(assert (=> d!105595 m!774293))

(declare-fun m!774295 () Bool)

(assert (=> d!105595 m!774295))

(declare-fun m!774297 () Bool)

(assert (=> b!830783 m!774297))

(assert (=> b!830421 d!105595))

(declare-fun b!830785 () Bool)

(declare-fun e!463217 () Option!421)

(declare-fun e!463218 () Option!421)

(assert (=> b!830785 (= e!463217 e!463218)))

(declare-fun c!90022 () Bool)

(assert (=> b!830785 (= c!90022 (and ((_ is Cons!15941) (toList!4502 lt!376900)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376900))) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!830786 () Bool)

(assert (=> b!830786 (= e!463218 (getValueByKey!415 (t!22310 (toList!4502 lt!376900)) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830787 () Bool)

(assert (=> b!830787 (= e!463218 None!419)))

(declare-fun b!830784 () Bool)

(assert (=> b!830784 (= e!463217 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376900)))))))

(declare-fun d!105597 () Bool)

(declare-fun c!90021 () Bool)

(assert (=> d!105597 (= c!90021 (and ((_ is Cons!15941) (toList!4502 lt!376900)) (= (_1!5086 (h!17070 (toList!4502 lt!376900))) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!105597 (= (getValueByKey!415 (toList!4502 lt!376900) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!463217)))

(assert (= (and d!105597 c!90021) b!830784))

(assert (= (and d!105597 (not c!90021)) b!830785))

(assert (= (and b!830785 c!90022) b!830786))

(assert (= (and b!830785 (not c!90022)) b!830787))

(declare-fun m!774299 () Bool)

(assert (=> b!830786 m!774299))

(assert (=> b!830448 d!105597))

(declare-fun d!105599 () Bool)

(declare-fun e!463221 () Bool)

(assert (=> d!105599 e!463221))

(declare-fun res!565692 () Bool)

(assert (=> d!105599 (=> (not res!565692) (not e!463221))))

(declare-fun lt!377098 () List!15945)

(assert (=> d!105599 (= res!565692 (isStrictlySorted!441 lt!377098))))

(declare-fun e!463222 () List!15945)

(assert (=> d!105599 (= lt!377098 e!463222)))

(declare-fun c!90026 () Bool)

(assert (=> d!105599 (= c!90026 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376681))) (bvslt (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376681)))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105599 (isStrictlySorted!441 (t!22310 (toList!4502 lt!376681)))))

(assert (=> d!105599 (= (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376681)) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377098)))

(declare-fun b!830788 () Bool)

(declare-fun res!565691 () Bool)

(assert (=> b!830788 (=> (not res!565691) (not e!463221))))

(assert (=> b!830788 (= res!565691 (containsKey!401 lt!377098 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!830789 () Bool)

(declare-fun e!463220 () List!15945)

(assert (=> b!830789 (= e!463220 (insertStrictlySorted!268 (t!22310 (t!22310 (toList!4502 lt!376681))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun call!36291 () List!15945)

(declare-fun bm!36286 () Bool)

(assert (=> bm!36286 (= call!36291 ($colon$colon!536 e!463220 (ite c!90026 (h!17070 (t!22310 (toList!4502 lt!376681))) (tuple2!10151 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!90025 () Bool)

(assert (=> bm!36286 (= c!90025 c!90026)))

(declare-fun b!830790 () Bool)

(assert (=> b!830790 (= e!463221 (contains!4209 lt!377098 (tuple2!10151 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun c!90023 () Bool)

(declare-fun c!90024 () Bool)

(declare-fun b!830791 () Bool)

(assert (=> b!830791 (= e!463220 (ite c!90023 (t!22310 (t!22310 (toList!4502 lt!376681))) (ite c!90024 (Cons!15941 (h!17070 (t!22310 (toList!4502 lt!376681))) (t!22310 (t!22310 (toList!4502 lt!376681)))) Nil!15942)))))

(declare-fun b!830792 () Bool)

(declare-fun e!463219 () List!15945)

(declare-fun call!36290 () List!15945)

(assert (=> b!830792 (= e!463219 call!36290)))

(declare-fun bm!36287 () Bool)

(declare-fun call!36289 () List!15945)

(assert (=> bm!36287 (= call!36290 call!36289)))

(declare-fun bm!36288 () Bool)

(assert (=> bm!36288 (= call!36289 call!36291)))

(declare-fun b!830793 () Bool)

(assert (=> b!830793 (= e!463219 call!36290)))

(declare-fun b!830794 () Bool)

(assert (=> b!830794 (= e!463222 call!36291)))

(declare-fun b!830795 () Bool)

(declare-fun e!463223 () List!15945)

(assert (=> b!830795 (= e!463223 call!36289)))

(declare-fun b!830796 () Bool)

(assert (=> b!830796 (= c!90024 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376681))) (bvsgt (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376681)))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> b!830796 (= e!463223 e!463219)))

(declare-fun b!830797 () Bool)

(assert (=> b!830797 (= e!463222 e!463223)))

(assert (=> b!830797 (= c!90023 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376681))) (= (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376681)))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!105599 c!90026) b!830794))

(assert (= (and d!105599 (not c!90026)) b!830797))

(assert (= (and b!830797 c!90023) b!830795))

(assert (= (and b!830797 (not c!90023)) b!830796))

(assert (= (and b!830796 c!90024) b!830793))

(assert (= (and b!830796 (not c!90024)) b!830792))

(assert (= (or b!830793 b!830792) bm!36287))

(assert (= (or b!830795 bm!36287) bm!36288))

(assert (= (or b!830794 bm!36288) bm!36286))

(assert (= (and bm!36286 c!90025) b!830789))

(assert (= (and bm!36286 (not c!90025)) b!830791))

(assert (= (and d!105599 res!565692) b!830788))

(assert (= (and b!830788 res!565691) b!830790))

(declare-fun m!774301 () Bool)

(assert (=> bm!36286 m!774301))

(declare-fun m!774303 () Bool)

(assert (=> b!830788 m!774303))

(declare-fun m!774305 () Bool)

(assert (=> b!830790 m!774305))

(declare-fun m!774307 () Bool)

(assert (=> d!105599 m!774307))

(declare-fun m!774309 () Bool)

(assert (=> d!105599 m!774309))

(declare-fun m!774311 () Bool)

(assert (=> b!830789 m!774311))

(assert (=> b!830742 d!105599))

(declare-fun d!105601 () Bool)

(declare-fun e!463224 () Bool)

(assert (=> d!105601 e!463224))

(declare-fun res!565693 () Bool)

(assert (=> d!105601 (=> res!565693 e!463224)))

(declare-fun lt!377099 () Bool)

(assert (=> d!105601 (= res!565693 (not lt!377099))))

(declare-fun lt!377101 () Bool)

(assert (=> d!105601 (= lt!377099 lt!377101)))

(declare-fun lt!377100 () Unit!28429)

(declare-fun e!463225 () Unit!28429)

(assert (=> d!105601 (= lt!377100 e!463225)))

(declare-fun c!90027 () Bool)

(assert (=> d!105601 (= c!90027 lt!377101)))

(assert (=> d!105601 (= lt!377101 (containsKey!401 (toList!4502 lt!377054) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105601 (= (contains!4208 lt!377054 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377099)))

(declare-fun b!830798 () Bool)

(declare-fun lt!377102 () Unit!28429)

(assert (=> b!830798 (= e!463225 lt!377102)))

(assert (=> b!830798 (= lt!377102 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!377054) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> b!830798 (isDefined!311 (getValueByKey!415 (toList!4502 lt!377054) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!830799 () Bool)

(declare-fun Unit!28457 () Unit!28429)

(assert (=> b!830799 (= e!463225 Unit!28457)))

(declare-fun b!830800 () Bool)

(assert (=> b!830800 (= e!463224 (isDefined!311 (getValueByKey!415 (toList!4502 lt!377054) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!105601 c!90027) b!830798))

(assert (= (and d!105601 (not c!90027)) b!830799))

(assert (= (and d!105601 (not res!565693)) b!830800))

(declare-fun m!774313 () Bool)

(assert (=> d!105601 m!774313))

(declare-fun m!774315 () Bool)

(assert (=> b!830798 m!774315))

(assert (=> b!830798 m!774167))

(assert (=> b!830798 m!774167))

(declare-fun m!774317 () Bool)

(assert (=> b!830798 m!774317))

(assert (=> b!830800 m!774167))

(assert (=> b!830800 m!774167))

(assert (=> b!830800 m!774317))

(assert (=> d!105547 d!105601))

(declare-fun b!830802 () Bool)

(declare-fun e!463226 () Option!421)

(declare-fun e!463227 () Option!421)

(assert (=> b!830802 (= e!463226 e!463227)))

(declare-fun c!90029 () Bool)

(assert (=> b!830802 (= c!90029 (and ((_ is Cons!15941) lt!377051) (not (= (_1!5086 (h!17070 lt!377051)) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!830803 () Bool)

(assert (=> b!830803 (= e!463227 (getValueByKey!415 (t!22310 lt!377051) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!830804 () Bool)

(assert (=> b!830804 (= e!463227 None!419)))

(declare-fun b!830801 () Bool)

(assert (=> b!830801 (= e!463226 (Some!420 (_2!5086 (h!17070 lt!377051))))))

(declare-fun d!105603 () Bool)

(declare-fun c!90028 () Bool)

(assert (=> d!105603 (= c!90028 (and ((_ is Cons!15941) lt!377051) (= (_1!5086 (h!17070 lt!377051)) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105603 (= (getValueByKey!415 lt!377051 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!463226)))

(assert (= (and d!105603 c!90028) b!830801))

(assert (= (and d!105603 (not c!90028)) b!830802))

(assert (= (and b!830802 c!90029) b!830803))

(assert (= (and b!830802 (not c!90029)) b!830804))

(declare-fun m!774319 () Bool)

(assert (=> b!830803 m!774319))

(assert (=> d!105547 d!105603))

(declare-fun d!105605 () Bool)

(assert (=> d!105605 (= (getValueByKey!415 lt!377051 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377103 () Unit!28429)

(assert (=> d!105605 (= lt!377103 (choose!1418 lt!377051 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!463228 () Bool)

(assert (=> d!105605 e!463228))

(declare-fun res!565694 () Bool)

(assert (=> d!105605 (=> (not res!565694) (not e!463228))))

(assert (=> d!105605 (= res!565694 (isStrictlySorted!441 lt!377051))))

(assert (=> d!105605 (= (lemmaContainsTupThenGetReturnValue!229 lt!377051 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377103)))

(declare-fun b!830805 () Bool)

(declare-fun res!565695 () Bool)

(assert (=> b!830805 (=> (not res!565695) (not e!463228))))

(assert (=> b!830805 (= res!565695 (containsKey!401 lt!377051 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!830806 () Bool)

(assert (=> b!830806 (= e!463228 (contains!4209 lt!377051 (tuple2!10151 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!105605 res!565694) b!830805))

(assert (= (and b!830805 res!565695) b!830806))

(assert (=> d!105605 m!774161))

(declare-fun m!774321 () Bool)

(assert (=> d!105605 m!774321))

(declare-fun m!774323 () Bool)

(assert (=> d!105605 m!774323))

(declare-fun m!774325 () Bool)

(assert (=> b!830805 m!774325))

(declare-fun m!774327 () Bool)

(assert (=> b!830806 m!774327))

(assert (=> d!105547 d!105605))

(declare-fun d!105607 () Bool)

(declare-fun e!463231 () Bool)

(assert (=> d!105607 e!463231))

(declare-fun res!565697 () Bool)

(assert (=> d!105607 (=> (not res!565697) (not e!463231))))

(declare-fun lt!377104 () List!15945)

(assert (=> d!105607 (= res!565697 (isStrictlySorted!441 lt!377104))))

(declare-fun e!463232 () List!15945)

(assert (=> d!105607 (= lt!377104 e!463232)))

(declare-fun c!90033 () Bool)

(assert (=> d!105607 (= c!90033 (and ((_ is Cons!15941) (toList!4502 call!36248)) (bvslt (_1!5086 (h!17070 (toList!4502 call!36248))) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105607 (isStrictlySorted!441 (toList!4502 call!36248))))

(assert (=> d!105607 (= (insertStrictlySorted!268 (toList!4502 call!36248) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377104)))

(declare-fun b!830807 () Bool)

(declare-fun res!565696 () Bool)

(assert (=> b!830807 (=> (not res!565696) (not e!463231))))

(assert (=> b!830807 (= res!565696 (containsKey!401 lt!377104 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!830808 () Bool)

(declare-fun e!463230 () List!15945)

(assert (=> b!830808 (= e!463230 (insertStrictlySorted!268 (t!22310 (toList!4502 call!36248)) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!36289 () Bool)

(declare-fun call!36294 () List!15945)

(assert (=> bm!36289 (= call!36294 ($colon$colon!536 e!463230 (ite c!90033 (h!17070 (toList!4502 call!36248)) (tuple2!10151 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun c!90032 () Bool)

(assert (=> bm!36289 (= c!90032 c!90033)))

(declare-fun b!830809 () Bool)

(assert (=> b!830809 (= e!463231 (contains!4209 lt!377104 (tuple2!10151 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830810 () Bool)

(declare-fun c!90030 () Bool)

(declare-fun c!90031 () Bool)

(assert (=> b!830810 (= e!463230 (ite c!90030 (t!22310 (toList!4502 call!36248)) (ite c!90031 (Cons!15941 (h!17070 (toList!4502 call!36248)) (t!22310 (toList!4502 call!36248))) Nil!15942)))))

(declare-fun b!830811 () Bool)

(declare-fun e!463229 () List!15945)

(declare-fun call!36293 () List!15945)

(assert (=> b!830811 (= e!463229 call!36293)))

(declare-fun bm!36290 () Bool)

(declare-fun call!36292 () List!15945)

(assert (=> bm!36290 (= call!36293 call!36292)))

(declare-fun bm!36291 () Bool)

(assert (=> bm!36291 (= call!36292 call!36294)))

(declare-fun b!830812 () Bool)

(assert (=> b!830812 (= e!463229 call!36293)))

(declare-fun b!830813 () Bool)

(assert (=> b!830813 (= e!463232 call!36294)))

(declare-fun b!830814 () Bool)

(declare-fun e!463233 () List!15945)

(assert (=> b!830814 (= e!463233 call!36292)))

(declare-fun b!830815 () Bool)

(assert (=> b!830815 (= c!90031 (and ((_ is Cons!15941) (toList!4502 call!36248)) (bvsgt (_1!5086 (h!17070 (toList!4502 call!36248))) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!830815 (= e!463233 e!463229)))

(declare-fun b!830816 () Bool)

(assert (=> b!830816 (= e!463232 e!463233)))

(assert (=> b!830816 (= c!90030 (and ((_ is Cons!15941) (toList!4502 call!36248)) (= (_1!5086 (h!17070 (toList!4502 call!36248))) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!105607 c!90033) b!830813))

(assert (= (and d!105607 (not c!90033)) b!830816))

(assert (= (and b!830816 c!90030) b!830814))

(assert (= (and b!830816 (not c!90030)) b!830815))

(assert (= (and b!830815 c!90031) b!830812))

(assert (= (and b!830815 (not c!90031)) b!830811))

(assert (= (or b!830812 b!830811) bm!36290))

(assert (= (or b!830814 bm!36290) bm!36291))

(assert (= (or b!830813 bm!36291) bm!36289))

(assert (= (and bm!36289 c!90032) b!830808))

(assert (= (and bm!36289 (not c!90032)) b!830810))

(assert (= (and d!105607 res!565697) b!830807))

(assert (= (and b!830807 res!565696) b!830809))

(declare-fun m!774329 () Bool)

(assert (=> bm!36289 m!774329))

(declare-fun m!774331 () Bool)

(assert (=> b!830807 m!774331))

(declare-fun m!774333 () Bool)

(assert (=> b!830809 m!774333))

(declare-fun m!774335 () Bool)

(assert (=> d!105607 m!774335))

(declare-fun m!774337 () Bool)

(assert (=> d!105607 m!774337))

(declare-fun m!774339 () Bool)

(assert (=> b!830808 m!774339))

(assert (=> d!105547 d!105607))

(declare-fun d!105609 () Bool)

(declare-fun e!463236 () Bool)

(assert (=> d!105609 e!463236))

(declare-fun res!565699 () Bool)

(assert (=> d!105609 (=> (not res!565699) (not e!463236))))

(declare-fun lt!377105 () List!15945)

(assert (=> d!105609 (= res!565699 (isStrictlySorted!441 lt!377105))))

(declare-fun e!463237 () List!15945)

(assert (=> d!105609 (= lt!377105 e!463237)))

(declare-fun c!90037 () Bool)

(assert (=> d!105609 (= c!90037 (and ((_ is Cons!15941) (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679)))) (bvslt (_1!5086 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679))))) (_1!5086 lt!376677))))))

(assert (=> d!105609 (isStrictlySorted!441 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679))))))

(assert (=> d!105609 (= (insertStrictlySorted!268 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679))) (_1!5086 lt!376677) (_2!5086 lt!376677)) lt!377105)))

(declare-fun b!830817 () Bool)

(declare-fun res!565698 () Bool)

(assert (=> b!830817 (=> (not res!565698) (not e!463236))))

(assert (=> b!830817 (= res!565698 (containsKey!401 lt!377105 (_1!5086 lt!376677)))))

(declare-fun b!830818 () Bool)

(declare-fun e!463235 () List!15945)

(assert (=> b!830818 (= e!463235 (insertStrictlySorted!268 (t!22310 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679)))) (_1!5086 lt!376677) (_2!5086 lt!376677)))))

(declare-fun call!36297 () List!15945)

(declare-fun bm!36292 () Bool)

(assert (=> bm!36292 (= call!36297 ($colon$colon!536 e!463235 (ite c!90037 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679)))) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677)))))))

(declare-fun c!90036 () Bool)

(assert (=> bm!36292 (= c!90036 c!90037)))

(declare-fun b!830819 () Bool)

(assert (=> b!830819 (= e!463236 (contains!4209 lt!377105 (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun c!90035 () Bool)

(declare-fun b!830820 () Bool)

(declare-fun c!90034 () Bool)

(assert (=> b!830820 (= e!463235 (ite c!90034 (t!22310 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679)))) (ite c!90035 (Cons!15941 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679)))) (t!22310 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679))))) Nil!15942)))))

(declare-fun b!830821 () Bool)

(declare-fun e!463234 () List!15945)

(declare-fun call!36296 () List!15945)

(assert (=> b!830821 (= e!463234 call!36296)))

(declare-fun bm!36293 () Bool)

(declare-fun call!36295 () List!15945)

(assert (=> bm!36293 (= call!36296 call!36295)))

(declare-fun bm!36294 () Bool)

(assert (=> bm!36294 (= call!36295 call!36297)))

(declare-fun b!830822 () Bool)

(assert (=> b!830822 (= e!463234 call!36296)))

(declare-fun b!830823 () Bool)

(assert (=> b!830823 (= e!463237 call!36297)))

(declare-fun b!830824 () Bool)

(declare-fun e!463238 () List!15945)

(assert (=> b!830824 (= e!463238 call!36295)))

(declare-fun b!830825 () Bool)

(assert (=> b!830825 (= c!90035 (and ((_ is Cons!15941) (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679)))) (bvsgt (_1!5086 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679))))) (_1!5086 lt!376677))))))

(assert (=> b!830825 (= e!463238 e!463234)))

(declare-fun b!830826 () Bool)

(assert (=> b!830826 (= e!463237 e!463238)))

(assert (=> b!830826 (= c!90034 (and ((_ is Cons!15941) (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679)))) (= (_1!5086 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679))))) (_1!5086 lt!376677))))))

(assert (= (and d!105609 c!90037) b!830823))

(assert (= (and d!105609 (not c!90037)) b!830826))

(assert (= (and b!830826 c!90034) b!830824))

(assert (= (and b!830826 (not c!90034)) b!830825))

(assert (= (and b!830825 c!90035) b!830822))

(assert (= (and b!830825 (not c!90035)) b!830821))

(assert (= (or b!830822 b!830821) bm!36293))

(assert (= (or b!830824 bm!36293) bm!36294))

(assert (= (or b!830823 bm!36294) bm!36292))

(assert (= (and bm!36292 c!90036) b!830818))

(assert (= (and bm!36292 (not c!90036)) b!830820))

(assert (= (and d!105609 res!565699) b!830817))

(assert (= (and b!830817 res!565698) b!830819))

(declare-fun m!774341 () Bool)

(assert (=> bm!36292 m!774341))

(declare-fun m!774343 () Bool)

(assert (=> b!830817 m!774343))

(declare-fun m!774345 () Bool)

(assert (=> b!830819 m!774345))

(declare-fun m!774347 () Bool)

(assert (=> d!105609 m!774347))

(declare-fun m!774349 () Bool)

(assert (=> d!105609 m!774349))

(declare-fun m!774351 () Bool)

(assert (=> b!830818 m!774351))

(assert (=> b!830683 d!105609))

(declare-fun b!830839 () Bool)

(declare-fun e!463245 () SeekEntryResult!8744)

(declare-fun e!463247 () SeekEntryResult!8744)

(assert (=> b!830839 (= e!463245 e!463247)))

(declare-fun c!90044 () Bool)

(declare-fun lt!377110 () (_ BitVec 64))

(assert (=> b!830839 (= c!90044 (= lt!377110 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105611 () Bool)

(declare-fun lt!377111 () SeekEntryResult!8744)

(assert (=> d!105611 (and (or ((_ is Undefined!8744) lt!377111) (not ((_ is Found!8744) lt!377111)) (and (bvsge (index!37348 lt!377111) #b00000000000000000000000000000000) (bvslt (index!37348 lt!377111) (size!22749 _keys!976)))) (or ((_ is Undefined!8744) lt!377111) ((_ is Found!8744) lt!377111) (not ((_ is MissingVacant!8744) lt!377111)) (not (= (index!37350 lt!377111) (index!37349 lt!377072))) (and (bvsge (index!37350 lt!377111) #b00000000000000000000000000000000) (bvslt (index!37350 lt!377111) (size!22749 _keys!976)))) (or ((_ is Undefined!8744) lt!377111) (ite ((_ is Found!8744) lt!377111) (= (select (arr!22328 _keys!976) (index!37348 lt!377111)) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!8744) lt!377111) (= (index!37350 lt!377111) (index!37349 lt!377072)) (= (select (arr!22328 _keys!976) (index!37350 lt!377111)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!105611 (= lt!377111 e!463245)))

(declare-fun c!90046 () Bool)

(assert (=> d!105611 (= c!90046 (bvsge (x!70109 lt!377072) #b01111111111111111111111111111110))))

(assert (=> d!105611 (= lt!377110 (select (arr!22328 _keys!976) (index!37349 lt!377072)))))

(assert (=> d!105611 (validMask!0 mask!1312)))

(assert (=> d!105611 (= (seekKeyOrZeroReturnVacant!0 (x!70109 lt!377072) (index!37349 lt!377072) (index!37349 lt!377072) (select (arr!22328 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!377111)))

(declare-fun b!830840 () Bool)

(assert (=> b!830840 (= e!463245 Undefined!8744)))

(declare-fun b!830841 () Bool)

(declare-fun e!463246 () SeekEntryResult!8744)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!830841 (= e!463246 (seekKeyOrZeroReturnVacant!0 (bvadd (x!70109 lt!377072) #b00000000000000000000000000000001) (nextIndex!0 (index!37349 lt!377072) (x!70109 lt!377072) mask!1312) (index!37349 lt!377072) (select (arr!22328 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(declare-fun b!830842 () Bool)

(assert (=> b!830842 (= e!463246 (MissingVacant!8744 (index!37349 lt!377072)))))

(declare-fun b!830843 () Bool)

(declare-fun c!90045 () Bool)

(assert (=> b!830843 (= c!90045 (= lt!377110 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830843 (= e!463247 e!463246)))

(declare-fun b!830844 () Bool)

(assert (=> b!830844 (= e!463247 (Found!8744 (index!37349 lt!377072)))))

(assert (= (and d!105611 c!90046) b!830840))

(assert (= (and d!105611 (not c!90046)) b!830839))

(assert (= (and b!830839 c!90044) b!830844))

(assert (= (and b!830839 (not c!90044)) b!830843))

(assert (= (and b!830843 c!90045) b!830842))

(assert (= (and b!830843 (not c!90045)) b!830841))

(declare-fun m!774353 () Bool)

(assert (=> d!105611 m!774353))

(declare-fun m!774355 () Bool)

(assert (=> d!105611 m!774355))

(assert (=> d!105611 m!774197))

(assert (=> d!105611 m!773289))

(declare-fun m!774357 () Bool)

(assert (=> b!830841 m!774357))

(assert (=> b!830841 m!774357))

(assert (=> b!830841 m!773353))

(declare-fun m!774359 () Bool)

(assert (=> b!830841 m!774359))

(assert (=> b!830727 d!105611))

(declare-fun d!105613 () Bool)

(declare-fun e!463248 () Bool)

(assert (=> d!105613 e!463248))

(declare-fun res!565700 () Bool)

(assert (=> d!105613 (=> res!565700 e!463248)))

(declare-fun lt!377112 () Bool)

(assert (=> d!105613 (= res!565700 (not lt!377112))))

(declare-fun lt!377114 () Bool)

(assert (=> d!105613 (= lt!377112 lt!377114)))

(declare-fun lt!377113 () Unit!28429)

(declare-fun e!463249 () Unit!28429)

(assert (=> d!105613 (= lt!377113 e!463249)))

(declare-fun c!90047 () Bool)

(assert (=> d!105613 (= c!90047 lt!377114)))

(assert (=> d!105613 (= lt!377114 (containsKey!401 (toList!4502 lt!376975) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105613 (= (contains!4208 lt!376975 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377112)))

(declare-fun b!830845 () Bool)

(declare-fun lt!377115 () Unit!28429)

(assert (=> b!830845 (= e!463249 lt!377115)))

(assert (=> b!830845 (= lt!377115 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376975) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830845 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376975) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830846 () Bool)

(declare-fun Unit!28458 () Unit!28429)

(assert (=> b!830846 (= e!463249 Unit!28458)))

(declare-fun b!830847 () Bool)

(assert (=> b!830847 (= e!463248 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376975) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105613 c!90047) b!830845))

(assert (= (and d!105613 (not c!90047)) b!830846))

(assert (= (and d!105613 (not res!565700)) b!830847))

(declare-fun m!774361 () Bool)

(assert (=> d!105613 m!774361))

(declare-fun m!774363 () Bool)

(assert (=> b!830845 m!774363))

(declare-fun m!774365 () Bool)

(assert (=> b!830845 m!774365))

(assert (=> b!830845 m!774365))

(declare-fun m!774367 () Bool)

(assert (=> b!830845 m!774367))

(assert (=> b!830847 m!774365))

(assert (=> b!830847 m!774365))

(assert (=> b!830847 m!774367))

(assert (=> d!105457 d!105613))

(assert (=> d!105457 d!105343))

(declare-fun d!105615 () Bool)

(declare-fun isEmpty!656 (Option!421) Bool)

(assert (=> d!105615 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376795) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376795) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23211 () Bool)

(assert (= bs!23211 d!105615))

(assert (=> bs!23211 m!773723))

(declare-fun m!774369 () Bool)

(assert (=> bs!23211 m!774369))

(assert (=> b!830527 d!105615))

(declare-fun b!830849 () Bool)

(declare-fun e!463250 () Option!421)

(declare-fun e!463251 () Option!421)

(assert (=> b!830849 (= e!463250 e!463251)))

(declare-fun c!90049 () Bool)

(assert (=> b!830849 (= c!90049 (and ((_ is Cons!15941) (toList!4502 lt!376795)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376795))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830850 () Bool)

(assert (=> b!830850 (= e!463251 (getValueByKey!415 (t!22310 (toList!4502 lt!376795)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830851 () Bool)

(assert (=> b!830851 (= e!463251 None!419)))

(declare-fun b!830848 () Bool)

(assert (=> b!830848 (= e!463250 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376795)))))))

(declare-fun d!105617 () Bool)

(declare-fun c!90048 () Bool)

(assert (=> d!105617 (= c!90048 (and ((_ is Cons!15941) (toList!4502 lt!376795)) (= (_1!5086 (h!17070 (toList!4502 lt!376795))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105617 (= (getValueByKey!415 (toList!4502 lt!376795) #b1000000000000000000000000000000000000000000000000000000000000000) e!463250)))

(assert (= (and d!105617 c!90048) b!830848))

(assert (= (and d!105617 (not c!90048)) b!830849))

(assert (= (and b!830849 c!90049) b!830850))

(assert (= (and b!830849 (not c!90049)) b!830851))

(declare-fun m!774371 () Bool)

(assert (=> b!830850 m!774371))

(assert (=> b!830527 d!105617))

(declare-fun d!105619 () Bool)

(assert (=> d!105619 (= (validKeyInArray!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830587 d!105619))

(declare-fun d!105621 () Bool)

(assert (=> d!105621 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376817) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376817) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23212 () Bool)

(assert (= bs!23212 d!105621))

(assert (=> bs!23212 m!774089))

(declare-fun m!774373 () Bool)

(assert (=> bs!23212 m!774373))

(assert (=> b!830707 d!105621))

(declare-fun b!830853 () Bool)

(declare-fun e!463252 () Option!421)

(declare-fun e!463253 () Option!421)

(assert (=> b!830853 (= e!463252 e!463253)))

(declare-fun c!90051 () Bool)

(assert (=> b!830853 (= c!90051 (and ((_ is Cons!15941) (toList!4502 lt!376817)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376817))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830854 () Bool)

(assert (=> b!830854 (= e!463253 (getValueByKey!415 (t!22310 (toList!4502 lt!376817)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830855 () Bool)

(assert (=> b!830855 (= e!463253 None!419)))

(declare-fun b!830852 () Bool)

(assert (=> b!830852 (= e!463252 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376817)))))))

(declare-fun d!105623 () Bool)

(declare-fun c!90050 () Bool)

(assert (=> d!105623 (= c!90050 (and ((_ is Cons!15941) (toList!4502 lt!376817)) (= (_1!5086 (h!17070 (toList!4502 lt!376817))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105623 (= (getValueByKey!415 (toList!4502 lt!376817) #b1000000000000000000000000000000000000000000000000000000000000000) e!463252)))

(assert (= (and d!105623 c!90050) b!830852))

(assert (= (and d!105623 (not c!90050)) b!830853))

(assert (= (and b!830853 c!90051) b!830854))

(assert (= (and b!830853 (not c!90051)) b!830855))

(declare-fun m!774375 () Bool)

(assert (=> b!830854 m!774375))

(assert (=> b!830707 d!105623))

(declare-fun d!105625 () Bool)

(declare-fun e!463254 () Bool)

(assert (=> d!105625 e!463254))

(declare-fun res!565701 () Bool)

(assert (=> d!105625 (=> res!565701 e!463254)))

(declare-fun lt!377116 () Bool)

(assert (=> d!105625 (= res!565701 (not lt!377116))))

(declare-fun lt!377118 () Bool)

(assert (=> d!105625 (= lt!377116 lt!377118)))

(declare-fun lt!377117 () Unit!28429)

(declare-fun e!463255 () Unit!28429)

(assert (=> d!105625 (= lt!377117 e!463255)))

(declare-fun c!90052 () Bool)

(assert (=> d!105625 (= c!90052 lt!377118)))

(assert (=> d!105625 (= lt!377118 (containsKey!401 (toList!4502 lt!377084) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105625 (= (contains!4208 lt!377084 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377116)))

(declare-fun b!830856 () Bool)

(declare-fun lt!377119 () Unit!28429)

(assert (=> b!830856 (= e!463255 lt!377119)))

(assert (=> b!830856 (= lt!377119 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!377084) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!830856 (isDefined!311 (getValueByKey!415 (toList!4502 lt!377084) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!830857 () Bool)

(declare-fun Unit!28459 () Unit!28429)

(assert (=> b!830857 (= e!463255 Unit!28459)))

(declare-fun b!830858 () Bool)

(assert (=> b!830858 (= e!463254 (isDefined!311 (getValueByKey!415 (toList!4502 lt!377084) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!105625 c!90052) b!830856))

(assert (= (and d!105625 (not c!90052)) b!830857))

(assert (= (and d!105625 (not res!565701)) b!830858))

(declare-fun m!774377 () Bool)

(assert (=> d!105625 m!774377))

(declare-fun m!774379 () Bool)

(assert (=> b!830856 m!774379))

(assert (=> b!830856 m!774245))

(assert (=> b!830856 m!774245))

(declare-fun m!774381 () Bool)

(assert (=> b!830856 m!774381))

(assert (=> b!830858 m!774245))

(assert (=> b!830858 m!774245))

(assert (=> b!830858 m!774381))

(assert (=> d!105575 d!105625))

(declare-fun b!830860 () Bool)

(declare-fun e!463256 () Option!421)

(declare-fun e!463257 () Option!421)

(assert (=> b!830860 (= e!463256 e!463257)))

(declare-fun c!90054 () Bool)

(assert (=> b!830860 (= c!90054 (and ((_ is Cons!15941) lt!377081) (not (= (_1!5086 (h!17070 lt!377081)) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!830861 () Bool)

(assert (=> b!830861 (= e!463257 (getValueByKey!415 (t!22310 lt!377081) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!830862 () Bool)

(assert (=> b!830862 (= e!463257 None!419)))

(declare-fun b!830859 () Bool)

(assert (=> b!830859 (= e!463256 (Some!420 (_2!5086 (h!17070 lt!377081))))))

(declare-fun c!90053 () Bool)

(declare-fun d!105627 () Bool)

(assert (=> d!105627 (= c!90053 (and ((_ is Cons!15941) lt!377081) (= (_1!5086 (h!17070 lt!377081)) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!105627 (= (getValueByKey!415 lt!377081 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!463256)))

(assert (= (and d!105627 c!90053) b!830859))

(assert (= (and d!105627 (not c!90053)) b!830860))

(assert (= (and b!830860 c!90054) b!830861))

(assert (= (and b!830860 (not c!90054)) b!830862))

(declare-fun m!774383 () Bool)

(assert (=> b!830861 m!774383))

(assert (=> d!105575 d!105627))

(declare-fun d!105629 () Bool)

(assert (=> d!105629 (= (getValueByKey!415 lt!377081 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!420 (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377120 () Unit!28429)

(assert (=> d!105629 (= lt!377120 (choose!1418 lt!377081 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!463258 () Bool)

(assert (=> d!105629 e!463258))

(declare-fun res!565702 () Bool)

(assert (=> d!105629 (=> (not res!565702) (not e!463258))))

(assert (=> d!105629 (= res!565702 (isStrictlySorted!441 lt!377081))))

(assert (=> d!105629 (= (lemmaContainsTupThenGetReturnValue!229 lt!377081 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377120)))

(declare-fun b!830863 () Bool)

(declare-fun res!565703 () Bool)

(assert (=> b!830863 (=> (not res!565703) (not e!463258))))

(assert (=> b!830863 (= res!565703 (containsKey!401 lt!377081 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!830864 () Bool)

(assert (=> b!830864 (= e!463258 (contains!4209 lt!377081 (tuple2!10151 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!105629 res!565702) b!830863))

(assert (= (and b!830863 res!565703) b!830864))

(assert (=> d!105629 m!774239))

(declare-fun m!774385 () Bool)

(assert (=> d!105629 m!774385))

(declare-fun m!774387 () Bool)

(assert (=> d!105629 m!774387))

(declare-fun m!774389 () Bool)

(assert (=> b!830863 m!774389))

(declare-fun m!774391 () Bool)

(assert (=> b!830864 m!774391))

(assert (=> d!105575 d!105629))

(declare-fun d!105631 () Bool)

(declare-fun e!463261 () Bool)

(assert (=> d!105631 e!463261))

(declare-fun res!565705 () Bool)

(assert (=> d!105631 (=> (not res!565705) (not e!463261))))

(declare-fun lt!377121 () List!15945)

(assert (=> d!105631 (= res!565705 (isStrictlySorted!441 lt!377121))))

(declare-fun e!463262 () List!15945)

(assert (=> d!105631 (= lt!377121 e!463262)))

(declare-fun c!90058 () Bool)

(assert (=> d!105631 (= c!90058 (and ((_ is Cons!15941) (toList!4502 call!36260)) (bvslt (_1!5086 (h!17070 (toList!4502 call!36260))) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!105631 (isStrictlySorted!441 (toList!4502 call!36260))))

(assert (=> d!105631 (= (insertStrictlySorted!268 (toList!4502 call!36260) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377121)))

(declare-fun b!830865 () Bool)

(declare-fun res!565704 () Bool)

(assert (=> b!830865 (=> (not res!565704) (not e!463261))))

(assert (=> b!830865 (= res!565704 (containsKey!401 lt!377121 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!463260 () List!15945)

(declare-fun b!830866 () Bool)

(assert (=> b!830866 (= e!463260 (insertStrictlySorted!268 (t!22310 (toList!4502 call!36260)) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun call!36300 () List!15945)

(declare-fun bm!36295 () Bool)

(assert (=> bm!36295 (= call!36300 ($colon$colon!536 e!463260 (ite c!90058 (h!17070 (toList!4502 call!36260)) (tuple2!10151 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!90057 () Bool)

(assert (=> bm!36295 (= c!90057 c!90058)))

(declare-fun b!830867 () Bool)

(assert (=> b!830867 (= e!463261 (contains!4209 lt!377121 (tuple2!10151 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun c!90056 () Bool)

(declare-fun c!90055 () Bool)

(declare-fun b!830868 () Bool)

(assert (=> b!830868 (= e!463260 (ite c!90055 (t!22310 (toList!4502 call!36260)) (ite c!90056 (Cons!15941 (h!17070 (toList!4502 call!36260)) (t!22310 (toList!4502 call!36260))) Nil!15942)))))

(declare-fun b!830869 () Bool)

(declare-fun e!463259 () List!15945)

(declare-fun call!36299 () List!15945)

(assert (=> b!830869 (= e!463259 call!36299)))

(declare-fun bm!36296 () Bool)

(declare-fun call!36298 () List!15945)

(assert (=> bm!36296 (= call!36299 call!36298)))

(declare-fun bm!36297 () Bool)

(assert (=> bm!36297 (= call!36298 call!36300)))

(declare-fun b!830870 () Bool)

(assert (=> b!830870 (= e!463259 call!36299)))

(declare-fun b!830871 () Bool)

(assert (=> b!830871 (= e!463262 call!36300)))

(declare-fun b!830872 () Bool)

(declare-fun e!463263 () List!15945)

(assert (=> b!830872 (= e!463263 call!36298)))

(declare-fun b!830873 () Bool)

(assert (=> b!830873 (= c!90056 (and ((_ is Cons!15941) (toList!4502 call!36260)) (bvsgt (_1!5086 (h!17070 (toList!4502 call!36260))) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!830873 (= e!463263 e!463259)))

(declare-fun b!830874 () Bool)

(assert (=> b!830874 (= e!463262 e!463263)))

(assert (=> b!830874 (= c!90055 (and ((_ is Cons!15941) (toList!4502 call!36260)) (= (_1!5086 (h!17070 (toList!4502 call!36260))) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!105631 c!90058) b!830871))

(assert (= (and d!105631 (not c!90058)) b!830874))

(assert (= (and b!830874 c!90055) b!830872))

(assert (= (and b!830874 (not c!90055)) b!830873))

(assert (= (and b!830873 c!90056) b!830870))

(assert (= (and b!830873 (not c!90056)) b!830869))

(assert (= (or b!830870 b!830869) bm!36296))

(assert (= (or b!830872 bm!36296) bm!36297))

(assert (= (or b!830871 bm!36297) bm!36295))

(assert (= (and bm!36295 c!90057) b!830866))

(assert (= (and bm!36295 (not c!90057)) b!830868))

(assert (= (and d!105631 res!565705) b!830865))

(assert (= (and b!830865 res!565704) b!830867))

(declare-fun m!774393 () Bool)

(assert (=> bm!36295 m!774393))

(declare-fun m!774395 () Bool)

(assert (=> b!830865 m!774395))

(declare-fun m!774397 () Bool)

(assert (=> b!830867 m!774397))

(declare-fun m!774399 () Bool)

(assert (=> d!105631 m!774399))

(declare-fun m!774401 () Bool)

(assert (=> d!105631 m!774401))

(declare-fun m!774403 () Bool)

(assert (=> b!830866 m!774403))

(assert (=> d!105575 d!105631))

(declare-fun d!105633 () Bool)

(assert (=> d!105633 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376856) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376856) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23213 () Bool)

(assert (= bs!23213 d!105633))

(assert (=> bs!23213 m!774085))

(declare-fun m!774405 () Bool)

(assert (=> bs!23213 m!774405))

(assert (=> b!830660 d!105633))

(declare-fun b!830876 () Bool)

(declare-fun e!463264 () Option!421)

(declare-fun e!463265 () Option!421)

(assert (=> b!830876 (= e!463264 e!463265)))

(declare-fun c!90060 () Bool)

(assert (=> b!830876 (= c!90060 (and ((_ is Cons!15941) (toList!4502 lt!376856)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376856))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830877 () Bool)

(assert (=> b!830877 (= e!463265 (getValueByKey!415 (t!22310 (toList!4502 lt!376856)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830878 () Bool)

(assert (=> b!830878 (= e!463265 None!419)))

(declare-fun b!830875 () Bool)

(assert (=> b!830875 (= e!463264 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376856)))))))

(declare-fun d!105635 () Bool)

(declare-fun c!90059 () Bool)

(assert (=> d!105635 (= c!90059 (and ((_ is Cons!15941) (toList!4502 lt!376856)) (= (_1!5086 (h!17070 (toList!4502 lt!376856))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105635 (= (getValueByKey!415 (toList!4502 lt!376856) #b1000000000000000000000000000000000000000000000000000000000000000) e!463264)))

(assert (= (and d!105635 c!90059) b!830875))

(assert (= (and d!105635 (not c!90059)) b!830876))

(assert (= (and b!830876 c!90060) b!830877))

(assert (= (and b!830876 (not c!90060)) b!830878))

(declare-fun m!774407 () Bool)

(assert (=> b!830877 m!774407))

(assert (=> b!830660 d!105635))

(declare-fun b!830880 () Bool)

(declare-fun e!463266 () Option!421)

(declare-fun e!463267 () Option!421)

(assert (=> b!830880 (= e!463266 e!463267)))

(declare-fun c!90062 () Bool)

(assert (=> b!830880 (= c!90062 (and ((_ is Cons!15941) (toList!4502 lt!377010)) (not (= (_1!5086 (h!17070 (toList!4502 lt!377010))) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))))

(declare-fun b!830881 () Bool)

(assert (=> b!830881 (= e!463267 (getValueByKey!415 (t!22310 (toList!4502 lt!377010)) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))

(declare-fun b!830882 () Bool)

(assert (=> b!830882 (= e!463267 None!419)))

(declare-fun b!830879 () Bool)

(assert (=> b!830879 (= e!463266 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!377010)))))))

(declare-fun c!90061 () Bool)

(declare-fun d!105637 () Bool)

(assert (=> d!105637 (= c!90061 (and ((_ is Cons!15941) (toList!4502 lt!377010)) (= (_1!5086 (h!17070 (toList!4502 lt!377010))) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)))))))

(assert (=> d!105637 (= (getValueByKey!415 (toList!4502 lt!377010) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))) e!463266)))

(assert (= (and d!105637 c!90061) b!830879))

(assert (= (and d!105637 (not c!90061)) b!830880))

(assert (= (and b!830880 c!90062) b!830881))

(assert (= (and b!830880 (not c!90062)) b!830882))

(declare-fun m!774409 () Bool)

(assert (=> b!830881 m!774409))

(assert (=> b!830607 d!105637))

(declare-fun d!105639 () Bool)

(declare-fun res!565710 () Bool)

(declare-fun e!463272 () Bool)

(assert (=> d!105639 (=> res!565710 e!463272)))

(assert (=> d!105639 (= res!565710 (or ((_ is Nil!15942) lt!377080) ((_ is Nil!15942) (t!22310 lt!377080))))))

(assert (=> d!105639 (= (isStrictlySorted!441 lt!377080) e!463272)))

(declare-fun b!830887 () Bool)

(declare-fun e!463273 () Bool)

(assert (=> b!830887 (= e!463272 e!463273)))

(declare-fun res!565711 () Bool)

(assert (=> b!830887 (=> (not res!565711) (not e!463273))))

(assert (=> b!830887 (= res!565711 (bvslt (_1!5086 (h!17070 lt!377080)) (_1!5086 (h!17070 (t!22310 lt!377080)))))))

(declare-fun b!830888 () Bool)

(assert (=> b!830888 (= e!463273 (isStrictlySorted!441 (t!22310 lt!377080)))))

(assert (= (and d!105639 (not res!565710)) b!830887))

(assert (= (and b!830887 res!565711) b!830888))

(declare-fun m!774411 () Bool)

(assert (=> b!830888 m!774411))

(assert (=> d!105573 d!105639))

(declare-fun d!105641 () Bool)

(declare-fun res!565712 () Bool)

(declare-fun e!463274 () Bool)

(assert (=> d!105641 (=> res!565712 e!463274)))

(assert (=> d!105641 (= res!565712 (or ((_ is Nil!15942) (toList!4502 lt!376681)) ((_ is Nil!15942) (t!22310 (toList!4502 lt!376681)))))))

(assert (=> d!105641 (= (isStrictlySorted!441 (toList!4502 lt!376681)) e!463274)))

(declare-fun b!830889 () Bool)

(declare-fun e!463275 () Bool)

(assert (=> b!830889 (= e!463274 e!463275)))

(declare-fun res!565713 () Bool)

(assert (=> b!830889 (=> (not res!565713) (not e!463275))))

(assert (=> b!830889 (= res!565713 (bvslt (_1!5086 (h!17070 (toList!4502 lt!376681))) (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376681))))))))

(declare-fun b!830890 () Bool)

(assert (=> b!830890 (= e!463275 (isStrictlySorted!441 (t!22310 (toList!4502 lt!376681))))))

(assert (= (and d!105641 (not res!565712)) b!830889))

(assert (= (and b!830889 res!565713) b!830890))

(assert (=> b!830890 m!774309))

(assert (=> d!105573 d!105641))

(declare-fun d!105643 () Bool)

(declare-fun lt!377122 () Bool)

(assert (=> d!105643 (= lt!377122 (select (content!386 lt!377018) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(declare-fun e!463277 () Bool)

(assert (=> d!105643 (= lt!377122 e!463277)))

(declare-fun res!565714 () Bool)

(assert (=> d!105643 (=> (not res!565714) (not e!463277))))

(assert (=> d!105643 (= res!565714 ((_ is Cons!15941) lt!377018))))

(assert (=> d!105643 (= (contains!4209 lt!377018 (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))) lt!377122)))

(declare-fun b!830891 () Bool)

(declare-fun e!463276 () Bool)

(assert (=> b!830891 (= e!463277 e!463276)))

(declare-fun res!565715 () Bool)

(assert (=> b!830891 (=> res!565715 e!463276)))

(assert (=> b!830891 (= res!565715 (= (h!17070 lt!377018) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(declare-fun b!830892 () Bool)

(assert (=> b!830892 (= e!463276 (contains!4209 (t!22310 lt!377018) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(assert (= (and d!105643 res!565714) b!830891))

(assert (= (and b!830891 (not res!565715)) b!830892))

(declare-fun m!774413 () Bool)

(assert (=> d!105643 m!774413))

(declare-fun m!774415 () Bool)

(assert (=> d!105643 m!774415))

(declare-fun m!774417 () Bool)

(assert (=> b!830892 m!774417))

(assert (=> b!830624 d!105643))

(declare-fun d!105645 () Bool)

(assert (=> d!105645 (= ($colon$colon!536 e!463056 (ite c!89942 (h!17070 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677)))) (Cons!15941 (ite c!89942 (h!17070 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))) e!463056))))

(assert (=> bm!36264 d!105645))

(declare-fun d!105647 () Bool)

(assert (=> d!105647 (= (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))) lt!376860)) (not (isEmpty!656 (getValueByKey!415 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))) lt!376860))))))

(declare-fun bs!23214 () Bool)

(assert (= bs!23214 d!105647))

(assert (=> bs!23214 m!774253))

(declare-fun m!774419 () Bool)

(assert (=> bs!23214 m!774419))

(assert (=> b!830755 d!105647))

(declare-fun b!830894 () Bool)

(declare-fun e!463278 () Option!421)

(declare-fun e!463279 () Option!421)

(assert (=> b!830894 (= e!463278 e!463279)))

(declare-fun c!90064 () Bool)

(assert (=> b!830894 (= c!90064 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859)))) (not (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))))) lt!376860))))))

(declare-fun b!830895 () Bool)

(assert (=> b!830895 (= e!463279 (getValueByKey!415 (t!22310 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859)))) lt!376860))))

(declare-fun b!830896 () Bool)

(assert (=> b!830896 (= e!463279 None!419)))

(declare-fun b!830893 () Bool)

(assert (=> b!830893 (= e!463278 (Some!420 (_2!5086 (h!17070 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859)))))))))

(declare-fun d!105649 () Bool)

(declare-fun c!90063 () Bool)

(assert (=> d!105649 (= c!90063 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859)))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))))) lt!376860)))))

(assert (=> d!105649 (= (getValueByKey!415 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))) lt!376860) e!463278)))

(assert (= (and d!105649 c!90063) b!830893))

(assert (= (and d!105649 (not c!90063)) b!830894))

(assert (= (and b!830894 c!90064) b!830895))

(assert (= (and b!830894 (not c!90064)) b!830896))

(declare-fun m!774421 () Bool)

(assert (=> b!830895 m!774421))

(assert (=> b!830755 d!105649))

(declare-fun b!830898 () Bool)

(declare-fun e!463280 () Option!421)

(declare-fun e!463281 () Option!421)

(assert (=> b!830898 (= e!463280 e!463281)))

(declare-fun c!90066 () Bool)

(assert (=> b!830898 (= c!90066 (and ((_ is Cons!15941) (toList!4502 lt!376953)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376953))) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))))

(declare-fun b!830899 () Bool)

(assert (=> b!830899 (= e!463281 (getValueByKey!415 (t!22310 (toList!4502 lt!376953)) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))

(declare-fun b!830900 () Bool)

(assert (=> b!830900 (= e!463281 None!419)))

(declare-fun b!830897 () Bool)

(assert (=> b!830897 (= e!463280 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376953)))))))

(declare-fun c!90065 () Bool)

(declare-fun d!105651 () Bool)

(assert (=> d!105651 (= c!90065 (and ((_ is Cons!15941) (toList!4502 lt!376953)) (= (_1!5086 (h!17070 (toList!4502 lt!376953))) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)))))))

(assert (=> d!105651 (= (getValueByKey!415 (toList!4502 lt!376953) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))) e!463280)))

(assert (= (and d!105651 c!90065) b!830897))

(assert (= (and d!105651 (not c!90065)) b!830898))

(assert (= (and b!830898 c!90066) b!830899))

(assert (= (and b!830898 (not c!90066)) b!830900))

(declare-fun m!774423 () Bool)

(assert (=> b!830899 m!774423))

(assert (=> b!830554 d!105651))

(declare-fun d!105653 () Bool)

(declare-fun e!463282 () Bool)

(assert (=> d!105653 e!463282))

(declare-fun res!565716 () Bool)

(assert (=> d!105653 (=> res!565716 e!463282)))

(declare-fun lt!377123 () Bool)

(assert (=> d!105653 (= res!565716 (not lt!377123))))

(declare-fun lt!377125 () Bool)

(assert (=> d!105653 (= lt!377123 lt!377125)))

(declare-fun lt!377124 () Unit!28429)

(declare-fun e!463283 () Unit!28429)

(assert (=> d!105653 (= lt!377124 e!463283)))

(declare-fun c!90067 () Bool)

(assert (=> d!105653 (= c!90067 lt!377125)))

(assert (=> d!105653 (= lt!377125 (containsKey!401 (toList!4502 lt!377010) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))

(assert (=> d!105653 (= (contains!4208 lt!377010 (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))) lt!377123)))

(declare-fun b!830901 () Bool)

(declare-fun lt!377126 () Unit!28429)

(assert (=> b!830901 (= e!463283 lt!377126)))

(assert (=> b!830901 (= lt!377126 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!377010) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))

(assert (=> b!830901 (isDefined!311 (getValueByKey!415 (toList!4502 lt!377010) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))

(declare-fun b!830902 () Bool)

(declare-fun Unit!28460 () Unit!28429)

(assert (=> b!830902 (= e!463283 Unit!28460)))

(declare-fun b!830903 () Bool)

(assert (=> b!830903 (= e!463282 (isDefined!311 (getValueByKey!415 (toList!4502 lt!377010) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)))))))

(assert (= (and d!105653 c!90067) b!830901))

(assert (= (and d!105653 (not c!90067)) b!830902))

(assert (= (and d!105653 (not res!565716)) b!830903))

(declare-fun m!774425 () Bool)

(assert (=> d!105653 m!774425))

(declare-fun m!774427 () Bool)

(assert (=> b!830901 m!774427))

(assert (=> b!830901 m!773995))

(assert (=> b!830901 m!773995))

(declare-fun m!774429 () Bool)

(assert (=> b!830901 m!774429))

(assert (=> b!830903 m!773995))

(assert (=> b!830903 m!773995))

(assert (=> b!830903 m!774429))

(assert (=> d!105489 d!105653))

(declare-fun b!830905 () Bool)

(declare-fun e!463284 () Option!421)

(declare-fun e!463285 () Option!421)

(assert (=> b!830905 (= e!463284 e!463285)))

(declare-fun c!90069 () Bool)

(assert (=> b!830905 (= c!90069 (and ((_ is Cons!15941) lt!377007) (not (= (_1!5086 (h!17070 lt!377007)) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))))

(declare-fun b!830906 () Bool)

(assert (=> b!830906 (= e!463285 (getValueByKey!415 (t!22310 lt!377007) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))

(declare-fun b!830907 () Bool)

(assert (=> b!830907 (= e!463285 None!419)))

(declare-fun b!830904 () Bool)

(assert (=> b!830904 (= e!463284 (Some!420 (_2!5086 (h!17070 lt!377007))))))

(declare-fun d!105655 () Bool)

(declare-fun c!90068 () Bool)

(assert (=> d!105655 (= c!90068 (and ((_ is Cons!15941) lt!377007) (= (_1!5086 (h!17070 lt!377007)) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)))))))

(assert (=> d!105655 (= (getValueByKey!415 lt!377007 (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))) e!463284)))

(assert (= (and d!105655 c!90068) b!830904))

(assert (= (and d!105655 (not c!90068)) b!830905))

(assert (= (and b!830905 c!90069) b!830906))

(assert (= (and b!830905 (not c!90069)) b!830907))

(declare-fun m!774431 () Bool)

(assert (=> b!830906 m!774431))

(assert (=> d!105489 d!105655))

(declare-fun d!105657 () Bool)

(assert (=> d!105657 (= (getValueByKey!415 lt!377007 (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))) (Some!420 (_2!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))

(declare-fun lt!377127 () Unit!28429)

(assert (=> d!105657 (= lt!377127 (choose!1418 lt!377007 (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))

(declare-fun e!463286 () Bool)

(assert (=> d!105657 e!463286))

(declare-fun res!565717 () Bool)

(assert (=> d!105657 (=> (not res!565717) (not e!463286))))

(assert (=> d!105657 (= res!565717 (isStrictlySorted!441 lt!377007))))

(assert (=> d!105657 (= (lemmaContainsTupThenGetReturnValue!229 lt!377007 (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))) lt!377127)))

(declare-fun b!830908 () Bool)

(declare-fun res!565718 () Bool)

(assert (=> b!830908 (=> (not res!565718) (not e!463286))))

(assert (=> b!830908 (= res!565718 (containsKey!401 lt!377007 (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))

(declare-fun b!830909 () Bool)

(assert (=> b!830909 (= e!463286 (contains!4209 lt!377007 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)))))))

(assert (= (and d!105657 res!565717) b!830908))

(assert (= (and b!830908 res!565718) b!830909))

(assert (=> d!105657 m!773989))

(declare-fun m!774433 () Bool)

(assert (=> d!105657 m!774433))

(declare-fun m!774435 () Bool)

(assert (=> d!105657 m!774435))

(declare-fun m!774437 () Bool)

(assert (=> b!830908 m!774437))

(declare-fun m!774439 () Bool)

(assert (=> b!830909 m!774439))

(assert (=> d!105489 d!105657))

(declare-fun d!105659 () Bool)

(declare-fun e!463289 () Bool)

(assert (=> d!105659 e!463289))

(declare-fun res!565720 () Bool)

(assert (=> d!105659 (=> (not res!565720) (not e!463289))))

(declare-fun lt!377128 () List!15945)

(assert (=> d!105659 (= res!565720 (isStrictlySorted!441 lt!377128))))

(declare-fun e!463290 () List!15945)

(assert (=> d!105659 (= lt!377128 e!463290)))

(declare-fun c!90073 () Bool)

(assert (=> d!105659 (= c!90073 (and ((_ is Cons!15941) (toList!4502 lt!376802)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376802))) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)))))))

(assert (=> d!105659 (isStrictlySorted!441 (toList!4502 lt!376802))))

(assert (=> d!105659 (= (insertStrictlySorted!268 (toList!4502 lt!376802) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))) lt!377128)))

(declare-fun b!830910 () Bool)

(declare-fun res!565719 () Bool)

(assert (=> b!830910 (=> (not res!565719) (not e!463289))))

(assert (=> b!830910 (= res!565719 (containsKey!401 lt!377128 (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))

(declare-fun e!463288 () List!15945)

(declare-fun b!830911 () Bool)

(assert (=> b!830911 (= e!463288 (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376802)) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))

(declare-fun call!36303 () List!15945)

(declare-fun bm!36298 () Bool)

(assert (=> bm!36298 (= call!36303 ($colon$colon!536 e!463288 (ite c!90073 (h!17070 (toList!4502 lt!376802)) (tuple2!10151 (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376788 zeroValueBefore!34))))))))

(declare-fun c!90072 () Bool)

(assert (=> bm!36298 (= c!90072 c!90073)))

(declare-fun b!830912 () Bool)

(assert (=> b!830912 (= e!463289 (contains!4209 lt!377128 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)))))))

(declare-fun c!90071 () Bool)

(declare-fun c!90070 () Bool)

(declare-fun b!830913 () Bool)

(assert (=> b!830913 (= e!463288 (ite c!90070 (t!22310 (toList!4502 lt!376802)) (ite c!90071 (Cons!15941 (h!17070 (toList!4502 lt!376802)) (t!22310 (toList!4502 lt!376802))) Nil!15942)))))

(declare-fun b!830914 () Bool)

(declare-fun e!463287 () List!15945)

(declare-fun call!36302 () List!15945)

(assert (=> b!830914 (= e!463287 call!36302)))

(declare-fun bm!36299 () Bool)

(declare-fun call!36301 () List!15945)

(assert (=> bm!36299 (= call!36302 call!36301)))

(declare-fun bm!36300 () Bool)

(assert (=> bm!36300 (= call!36301 call!36303)))

(declare-fun b!830915 () Bool)

(assert (=> b!830915 (= e!463287 call!36302)))

(declare-fun b!830916 () Bool)

(assert (=> b!830916 (= e!463290 call!36303)))

(declare-fun b!830917 () Bool)

(declare-fun e!463291 () List!15945)

(assert (=> b!830917 (= e!463291 call!36301)))

(declare-fun b!830918 () Bool)

(assert (=> b!830918 (= c!90071 (and ((_ is Cons!15941) (toList!4502 lt!376802)) (bvsgt (_1!5086 (h!17070 (toList!4502 lt!376802))) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)))))))

(assert (=> b!830918 (= e!463291 e!463287)))

(declare-fun b!830919 () Bool)

(assert (=> b!830919 (= e!463290 e!463291)))

(assert (=> b!830919 (= c!90070 (and ((_ is Cons!15941) (toList!4502 lt!376802)) (= (_1!5086 (h!17070 (toList!4502 lt!376802))) (_1!5086 (tuple2!10151 lt!376788 zeroValueBefore!34)))))))

(assert (= (and d!105659 c!90073) b!830916))

(assert (= (and d!105659 (not c!90073)) b!830919))

(assert (= (and b!830919 c!90070) b!830917))

(assert (= (and b!830919 (not c!90070)) b!830918))

(assert (= (and b!830918 c!90071) b!830915))

(assert (= (and b!830918 (not c!90071)) b!830914))

(assert (= (or b!830915 b!830914) bm!36299))

(assert (= (or b!830917 bm!36299) bm!36300))

(assert (= (or b!830916 bm!36300) bm!36298))

(assert (= (and bm!36298 c!90072) b!830911))

(assert (= (and bm!36298 (not c!90072)) b!830913))

(assert (= (and d!105659 res!565720) b!830910))

(assert (= (and b!830910 res!565719) b!830912))

(declare-fun m!774441 () Bool)

(assert (=> bm!36298 m!774441))

(declare-fun m!774443 () Bool)

(assert (=> b!830910 m!774443))

(declare-fun m!774445 () Bool)

(assert (=> b!830912 m!774445))

(declare-fun m!774447 () Bool)

(assert (=> d!105659 m!774447))

(declare-fun m!774449 () Bool)

(assert (=> d!105659 m!774449))

(declare-fun m!774451 () Bool)

(assert (=> b!830911 m!774451))

(assert (=> d!105489 d!105659))

(declare-fun d!105661 () Bool)

(assert (=> d!105661 (= (get!11818 (getValueByKey!415 (toList!4502 lt!376794) lt!376796)) (v!10095 (getValueByKey!415 (toList!4502 lt!376794) lt!376796)))))

(assert (=> d!105469 d!105661))

(declare-fun b!830921 () Bool)

(declare-fun e!463292 () Option!421)

(declare-fun e!463293 () Option!421)

(assert (=> b!830921 (= e!463292 e!463293)))

(declare-fun c!90075 () Bool)

(assert (=> b!830921 (= c!90075 (and ((_ is Cons!15941) (toList!4502 lt!376794)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376794))) lt!376796))))))

(declare-fun b!830922 () Bool)

(assert (=> b!830922 (= e!463293 (getValueByKey!415 (t!22310 (toList!4502 lt!376794)) lt!376796))))

(declare-fun b!830923 () Bool)

(assert (=> b!830923 (= e!463293 None!419)))

(declare-fun b!830920 () Bool)

(assert (=> b!830920 (= e!463292 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376794)))))))

(declare-fun d!105663 () Bool)

(declare-fun c!90074 () Bool)

(assert (=> d!105663 (= c!90074 (and ((_ is Cons!15941) (toList!4502 lt!376794)) (= (_1!5086 (h!17070 (toList!4502 lt!376794))) lt!376796)))))

(assert (=> d!105663 (= (getValueByKey!415 (toList!4502 lt!376794) lt!376796) e!463292)))

(assert (= (and d!105663 c!90074) b!830920))

(assert (= (and d!105663 (not c!90074)) b!830921))

(assert (= (and b!830921 c!90075) b!830922))

(assert (= (and b!830921 (not c!90075)) b!830923))

(declare-fun m!774453 () Bool)

(assert (=> b!830922 m!774453))

(assert (=> d!105469 d!105663))

(declare-fun d!105665 () Bool)

(assert (=> d!105665 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376863) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23215 () Bool)

(assert (= bs!23215 d!105665))

(assert (=> bs!23215 m!773581))

(declare-fun m!774455 () Bool)

(assert (=> bs!23215 m!774455))

(assert (=> b!830436 d!105665))

(declare-fun b!830925 () Bool)

(declare-fun e!463294 () Option!421)

(declare-fun e!463295 () Option!421)

(assert (=> b!830925 (= e!463294 e!463295)))

(declare-fun c!90077 () Bool)

(assert (=> b!830925 (= c!90077 (and ((_ is Cons!15941) (toList!4502 lt!376863)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376863))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830926 () Bool)

(assert (=> b!830926 (= e!463295 (getValueByKey!415 (t!22310 (toList!4502 lt!376863)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830927 () Bool)

(assert (=> b!830927 (= e!463295 None!419)))

(declare-fun b!830924 () Bool)

(assert (=> b!830924 (= e!463294 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376863)))))))

(declare-fun d!105667 () Bool)

(declare-fun c!90076 () Bool)

(assert (=> d!105667 (= c!90076 (and ((_ is Cons!15941) (toList!4502 lt!376863)) (= (_1!5086 (h!17070 (toList!4502 lt!376863))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105667 (= (getValueByKey!415 (toList!4502 lt!376863) #b1000000000000000000000000000000000000000000000000000000000000000) e!463294)))

(assert (= (and d!105667 c!90076) b!830924))

(assert (= (and d!105667 (not c!90076)) b!830925))

(assert (= (and b!830925 c!90077) b!830926))

(assert (= (and b!830925 (not c!90077)) b!830927))

(declare-fun m!774457 () Bool)

(assert (=> b!830926 m!774457))

(assert (=> b!830436 d!105667))

(declare-fun d!105669 () Bool)

(assert (=> d!105669 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376863) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377131 () Unit!28429)

(declare-fun choose!1421 (List!15945 (_ BitVec 64)) Unit!28429)

(assert (=> d!105669 (= lt!377131 (choose!1421 (toList!4502 lt!376863) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463298 () Bool)

(assert (=> d!105669 e!463298))

(declare-fun res!565723 () Bool)

(assert (=> d!105669 (=> (not res!565723) (not e!463298))))

(assert (=> d!105669 (= res!565723 (isStrictlySorted!441 (toList!4502 lt!376863)))))

(assert (=> d!105669 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376863) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377131)))

(declare-fun b!830930 () Bool)

(assert (=> b!830930 (= e!463298 (containsKey!401 (toList!4502 lt!376863) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105669 res!565723) b!830930))

(assert (=> d!105669 m!774123))

(assert (=> d!105669 m!774123))

(assert (=> d!105669 m!774125))

(declare-fun m!774459 () Bool)

(assert (=> d!105669 m!774459))

(declare-fun m!774461 () Bool)

(assert (=> d!105669 m!774461))

(assert (=> b!830930 m!774119))

(assert (=> b!830670 d!105669))

(declare-fun d!105671 () Bool)

(assert (=> d!105671 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376863) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23216 () Bool)

(assert (= bs!23216 d!105671))

(assert (=> bs!23216 m!774123))

(declare-fun m!774463 () Bool)

(assert (=> bs!23216 m!774463))

(assert (=> b!830670 d!105671))

(declare-fun b!830932 () Bool)

(declare-fun e!463299 () Option!421)

(declare-fun e!463300 () Option!421)

(assert (=> b!830932 (= e!463299 e!463300)))

(declare-fun c!90079 () Bool)

(assert (=> b!830932 (= c!90079 (and ((_ is Cons!15941) (toList!4502 lt!376863)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376863))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830933 () Bool)

(assert (=> b!830933 (= e!463300 (getValueByKey!415 (t!22310 (toList!4502 lt!376863)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830934 () Bool)

(assert (=> b!830934 (= e!463300 None!419)))

(declare-fun b!830931 () Bool)

(assert (=> b!830931 (= e!463299 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376863)))))))

(declare-fun d!105673 () Bool)

(declare-fun c!90078 () Bool)

(assert (=> d!105673 (= c!90078 (and ((_ is Cons!15941) (toList!4502 lt!376863)) (= (_1!5086 (h!17070 (toList!4502 lt!376863))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105673 (= (getValueByKey!415 (toList!4502 lt!376863) #b0000000000000000000000000000000000000000000000000000000000000000) e!463299)))

(assert (= (and d!105673 c!90078) b!830931))

(assert (= (and d!105673 (not c!90078)) b!830932))

(assert (= (and b!830932 c!90079) b!830933))

(assert (= (and b!830932 (not c!90079)) b!830934))

(declare-fun m!774465 () Bool)

(assert (=> b!830933 m!774465))

(assert (=> b!830670 d!105673))

(declare-fun d!105675 () Bool)

(assert (=> d!105675 (= (get!11818 (getValueByKey!415 (toList!4502 lt!376856) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))) (v!10095 (getValueByKey!415 (toList!4502 lt!376856) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105555 d!105675))

(declare-fun b!830936 () Bool)

(declare-fun e!463301 () Option!421)

(declare-fun e!463302 () Option!421)

(assert (=> b!830936 (= e!463301 e!463302)))

(declare-fun c!90081 () Bool)

(assert (=> b!830936 (= c!90081 (and ((_ is Cons!15941) (toList!4502 lt!376856)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376856))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!830937 () Bool)

(assert (=> b!830937 (= e!463302 (getValueByKey!415 (t!22310 (toList!4502 lt!376856)) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830938 () Bool)

(assert (=> b!830938 (= e!463302 None!419)))

(declare-fun b!830935 () Bool)

(assert (=> b!830935 (= e!463301 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376856)))))))

(declare-fun d!105677 () Bool)

(declare-fun c!90080 () Bool)

(assert (=> d!105677 (= c!90080 (and ((_ is Cons!15941) (toList!4502 lt!376856)) (= (_1!5086 (h!17070 (toList!4502 lt!376856))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105677 (= (getValueByKey!415 (toList!4502 lt!376856) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) e!463301)))

(assert (= (and d!105677 c!90080) b!830935))

(assert (= (and d!105677 (not c!90080)) b!830936))

(assert (= (and b!830936 c!90081) b!830937))

(assert (= (and b!830936 (not c!90081)) b!830938))

(assert (=> b!830937 m!773353))

(declare-fun m!774467 () Bool)

(assert (=> b!830937 m!774467))

(assert (=> d!105555 d!105677))

(declare-fun d!105679 () Bool)

(assert (=> d!105679 (= (get!11819 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10093 (select (arr!22329 _values!788) #b00000000000000000000000000000000)))))

(assert (=> b!830459 d!105679))

(declare-fun b!830940 () Bool)

(declare-fun e!463303 () Option!421)

(declare-fun e!463304 () Option!421)

(assert (=> b!830940 (= e!463303 e!463304)))

(declare-fun c!90083 () Bool)

(assert (=> b!830940 (= c!90083 (and ((_ is Cons!15941) (toList!4502 lt!377084)) (not (= (_1!5086 (h!17070 (toList!4502 lt!377084))) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!830941 () Bool)

(assert (=> b!830941 (= e!463304 (getValueByKey!415 (t!22310 (toList!4502 lt!377084)) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!830942 () Bool)

(assert (=> b!830942 (= e!463304 None!419)))

(declare-fun b!830939 () Bool)

(assert (=> b!830939 (= e!463303 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!377084)))))))

(declare-fun c!90082 () Bool)

(declare-fun d!105681 () Bool)

(assert (=> d!105681 (= c!90082 (and ((_ is Cons!15941) (toList!4502 lt!377084)) (= (_1!5086 (h!17070 (toList!4502 lt!377084))) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!105681 (= (getValueByKey!415 (toList!4502 lt!377084) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!463303)))

(assert (= (and d!105681 c!90082) b!830939))

(assert (= (and d!105681 (not c!90082)) b!830940))

(assert (= (and b!830940 c!90083) b!830941))

(assert (= (and b!830940 (not c!90083)) b!830942))

(declare-fun m!774469 () Bool)

(assert (=> b!830941 m!774469))

(assert (=> b!830751 d!105681))

(declare-fun d!105683 () Bool)

(declare-fun e!463305 () Bool)

(assert (=> d!105683 e!463305))

(declare-fun res!565724 () Bool)

(assert (=> d!105683 (=> res!565724 e!463305)))

(declare-fun lt!377132 () Bool)

(assert (=> d!105683 (= res!565724 (not lt!377132))))

(declare-fun lt!377134 () Bool)

(assert (=> d!105683 (= lt!377132 lt!377134)))

(declare-fun lt!377133 () Unit!28429)

(declare-fun e!463306 () Unit!28429)

(assert (=> d!105683 (= lt!377133 e!463306)))

(declare-fun c!90084 () Bool)

(assert (=> d!105683 (= c!90084 lt!377134)))

(assert (=> d!105683 (= lt!377134 (containsKey!401 (toList!4502 lt!376868) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105683 (= (contains!4208 lt!376868 (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377132)))

(declare-fun b!830943 () Bool)

(declare-fun lt!377135 () Unit!28429)

(assert (=> b!830943 (= e!463306 lt!377135)))

(assert (=> b!830943 (= lt!377135 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376868) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!830943 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376868) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830944 () Bool)

(declare-fun Unit!28461 () Unit!28429)

(assert (=> b!830944 (= e!463306 Unit!28461)))

(declare-fun b!830945 () Bool)

(assert (=> b!830945 (= e!463305 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376868) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!105683 c!90084) b!830943))

(assert (= (and d!105683 (not c!90084)) b!830944))

(assert (= (and d!105683 (not res!565724)) b!830945))

(declare-fun m!774471 () Bool)

(assert (=> d!105683 m!774471))

(declare-fun m!774473 () Bool)

(assert (=> b!830943 m!774473))

(assert (=> b!830943 m!773567))

(assert (=> b!830943 m!773567))

(declare-fun m!774475 () Bool)

(assert (=> b!830943 m!774475))

(assert (=> b!830945 m!773567))

(assert (=> b!830945 m!773567))

(assert (=> b!830945 m!774475))

(assert (=> d!105369 d!105683))

(declare-fun b!830947 () Bool)

(declare-fun e!463307 () Option!421)

(declare-fun e!463308 () Option!421)

(assert (=> b!830947 (= e!463307 e!463308)))

(declare-fun c!90086 () Bool)

(assert (=> b!830947 (= c!90086 (and ((_ is Cons!15941) lt!376865) (not (= (_1!5086 (h!17070 lt!376865)) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!830948 () Bool)

(assert (=> b!830948 (= e!463308 (getValueByKey!415 (t!22310 lt!376865) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830949 () Bool)

(assert (=> b!830949 (= e!463308 None!419)))

(declare-fun b!830946 () Bool)

(assert (=> b!830946 (= e!463307 (Some!420 (_2!5086 (h!17070 lt!376865))))))

(declare-fun c!90085 () Bool)

(declare-fun d!105685 () Bool)

(assert (=> d!105685 (= c!90085 (and ((_ is Cons!15941) lt!376865) (= (_1!5086 (h!17070 lt!376865)) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!105685 (= (getValueByKey!415 lt!376865 (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!463307)))

(assert (= (and d!105685 c!90085) b!830946))

(assert (= (and d!105685 (not c!90085)) b!830947))

(assert (= (and b!830947 c!90086) b!830948))

(assert (= (and b!830947 (not c!90086)) b!830949))

(declare-fun m!774477 () Bool)

(assert (=> b!830948 m!774477))

(assert (=> d!105369 d!105685))

(declare-fun d!105687 () Bool)

(assert (=> d!105687 (= (getValueByKey!415 lt!376865 (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!420 (_2!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377136 () Unit!28429)

(assert (=> d!105687 (= lt!377136 (choose!1418 lt!376865 (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!463309 () Bool)

(assert (=> d!105687 e!463309))

(declare-fun res!565725 () Bool)

(assert (=> d!105687 (=> (not res!565725) (not e!463309))))

(assert (=> d!105687 (= res!565725 (isStrictlySorted!441 lt!376865))))

(assert (=> d!105687 (= (lemmaContainsTupThenGetReturnValue!229 lt!376865 (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377136)))

(declare-fun b!830950 () Bool)

(declare-fun res!565726 () Bool)

(assert (=> b!830950 (=> (not res!565726) (not e!463309))))

(assert (=> b!830950 (= res!565726 (containsKey!401 lt!376865 (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830951 () Bool)

(assert (=> b!830951 (= e!463309 (contains!4209 lt!376865 (tuple2!10151 (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!105687 res!565725) b!830950))

(assert (= (and b!830950 res!565726) b!830951))

(assert (=> d!105687 m!773561))

(declare-fun m!774479 () Bool)

(assert (=> d!105687 m!774479))

(declare-fun m!774481 () Bool)

(assert (=> d!105687 m!774481))

(declare-fun m!774483 () Bool)

(assert (=> b!830950 m!774483))

(declare-fun m!774485 () Bool)

(assert (=> b!830951 m!774485))

(assert (=> d!105369 d!105687))

(declare-fun d!105689 () Bool)

(declare-fun e!463312 () Bool)

(assert (=> d!105689 e!463312))

(declare-fun res!565728 () Bool)

(assert (=> d!105689 (=> (not res!565728) (not e!463312))))

(declare-fun lt!377137 () List!15945)

(assert (=> d!105689 (= res!565728 (isStrictlySorted!441 lt!377137))))

(declare-fun e!463313 () List!15945)

(assert (=> d!105689 (= lt!377137 e!463313)))

(declare-fun c!90090 () Bool)

(assert (=> d!105689 (= c!90090 (and ((_ is Cons!15941) (toList!4502 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251)))) (bvslt (_1!5086 (h!17070 (toList!4502 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251))))) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!105689 (isStrictlySorted!441 (toList!4502 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251))))))

(assert (=> d!105689 (= (insertStrictlySorted!268 (toList!4502 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251))) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377137)))

(declare-fun b!830952 () Bool)

(declare-fun res!565727 () Bool)

(assert (=> b!830952 (=> (not res!565727) (not e!463312))))

(assert (=> b!830952 (= res!565727 (containsKey!401 lt!377137 (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830953 () Bool)

(declare-fun e!463311 () List!15945)

(assert (=> b!830953 (= e!463311 (insertStrictlySorted!268 (t!22310 (toList!4502 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251)))) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun call!36306 () List!15945)

(declare-fun bm!36301 () Bool)

(assert (=> bm!36301 (= call!36306 ($colon$colon!536 e!463311 (ite c!90090 (h!17070 (toList!4502 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251)))) (tuple2!10151 (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun c!90089 () Bool)

(assert (=> bm!36301 (= c!90089 c!90090)))

(declare-fun b!830954 () Bool)

(assert (=> b!830954 (= e!463312 (contains!4209 lt!377137 (tuple2!10151 (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun c!90087 () Bool)

(declare-fun c!90088 () Bool)

(declare-fun b!830955 () Bool)

(assert (=> b!830955 (= e!463311 (ite c!90087 (t!22310 (toList!4502 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251)))) (ite c!90088 (Cons!15941 (h!17070 (toList!4502 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251)))) (t!22310 (toList!4502 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251))))) Nil!15942)))))

(declare-fun b!830956 () Bool)

(declare-fun e!463310 () List!15945)

(declare-fun call!36305 () List!15945)

(assert (=> b!830956 (= e!463310 call!36305)))

(declare-fun bm!36302 () Bool)

(declare-fun call!36304 () List!15945)

(assert (=> bm!36302 (= call!36305 call!36304)))

(declare-fun bm!36303 () Bool)

(assert (=> bm!36303 (= call!36304 call!36306)))

(declare-fun b!830957 () Bool)

(assert (=> b!830957 (= e!463310 call!36305)))

(declare-fun b!830958 () Bool)

(assert (=> b!830958 (= e!463313 call!36306)))

(declare-fun b!830959 () Bool)

(declare-fun e!463314 () List!15945)

(assert (=> b!830959 (= e!463314 call!36304)))

(declare-fun b!830960 () Bool)

(assert (=> b!830960 (= c!90088 (and ((_ is Cons!15941) (toList!4502 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251)))) (bvsgt (_1!5086 (h!17070 (toList!4502 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251))))) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> b!830960 (= e!463314 e!463310)))

(declare-fun b!830961 () Bool)

(assert (=> b!830961 (= e!463313 e!463314)))

(assert (=> b!830961 (= c!90087 (and ((_ is Cons!15941) (toList!4502 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251)))) (= (_1!5086 (h!17070 (toList!4502 (ite c!89891 call!36254 (ite c!89896 call!36253 call!36251))))) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!105689 c!90090) b!830958))

(assert (= (and d!105689 (not c!90090)) b!830961))

(assert (= (and b!830961 c!90087) b!830959))

(assert (= (and b!830961 (not c!90087)) b!830960))

(assert (= (and b!830960 c!90088) b!830957))

(assert (= (and b!830960 (not c!90088)) b!830956))

(assert (= (or b!830957 b!830956) bm!36302))

(assert (= (or b!830959 bm!36302) bm!36303))

(assert (= (or b!830958 bm!36303) bm!36301))

(assert (= (and bm!36301 c!90089) b!830953))

(assert (= (and bm!36301 (not c!90089)) b!830955))

(assert (= (and d!105689 res!565728) b!830952))

(assert (= (and b!830952 res!565727) b!830954))

(declare-fun m!774487 () Bool)

(assert (=> bm!36301 m!774487))

(declare-fun m!774489 () Bool)

(assert (=> b!830952 m!774489))

(declare-fun m!774491 () Bool)

(assert (=> b!830954 m!774491))

(declare-fun m!774493 () Bool)

(assert (=> d!105689 m!774493))

(declare-fun m!774495 () Bool)

(assert (=> d!105689 m!774495))

(declare-fun m!774497 () Bool)

(assert (=> b!830953 m!774497))

(assert (=> d!105369 d!105689))

(declare-fun b!830962 () Bool)

(assert (=> b!830962 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(assert (=> b!830962 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22750 _values!788)))))

(declare-fun e!463315 () Bool)

(declare-fun lt!377143 () ListLongMap!8973)

(assert (=> b!830962 (= e!463315 (= (apply!372 lt!377143 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830963 () Bool)

(declare-fun lt!377144 () Unit!28429)

(declare-fun lt!377138 () Unit!28429)

(assert (=> b!830963 (= lt!377144 lt!377138)))

(declare-fun lt!377139 () V!25277)

(declare-fun lt!377140 () (_ BitVec 64))

(declare-fun lt!377142 () ListLongMap!8973)

(declare-fun lt!377141 () (_ BitVec 64))

(assert (=> b!830963 (not (contains!4208 (+!1980 lt!377142 (tuple2!10151 lt!377141 lt!377139)) lt!377140))))

(assert (=> b!830963 (= lt!377138 (addStillNotContains!197 lt!377142 lt!377141 lt!377139 lt!377140))))

(assert (=> b!830963 (= lt!377140 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830963 (= lt!377139 (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830963 (= lt!377141 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun call!36307 () ListLongMap!8973)

(assert (=> b!830963 (= lt!377142 call!36307)))

(declare-fun e!463321 () ListLongMap!8973)

(assert (=> b!830963 (= e!463321 (+!1980 call!36307 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830964 () Bool)

(declare-fun e!463316 () Bool)

(declare-fun e!463317 () Bool)

(assert (=> b!830964 (= e!463316 e!463317)))

(declare-fun c!90094 () Bool)

(declare-fun e!463319 () Bool)

(assert (=> b!830964 (= c!90094 e!463319)))

(declare-fun res!565731 () Bool)

(assert (=> b!830964 (=> (not res!565731) (not e!463319))))

(assert (=> b!830964 (= res!565731 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(declare-fun b!830965 () Bool)

(declare-fun e!463320 () ListLongMap!8973)

(assert (=> b!830965 (= e!463320 (ListLongMap!8974 Nil!15942))))

(declare-fun b!830966 () Bool)

(declare-fun res!565729 () Bool)

(assert (=> b!830966 (=> (not res!565729) (not e!463316))))

(assert (=> b!830966 (= res!565729 (not (contains!4208 lt!377143 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830967 () Bool)

(declare-fun e!463318 () Bool)

(assert (=> b!830967 (= e!463318 (isEmpty!654 lt!377143))))

(declare-fun d!105691 () Bool)

(assert (=> d!105691 e!463316))

(declare-fun res!565730 () Bool)

(assert (=> d!105691 (=> (not res!565730) (not e!463316))))

(assert (=> d!105691 (= res!565730 (not (contains!4208 lt!377143 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105691 (= lt!377143 e!463320)))

(declare-fun c!90092 () Bool)

(assert (=> d!105691 (= c!90092 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(assert (=> d!105691 (validMask!0 mask!1312)))

(assert (=> d!105691 (= (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796) lt!377143)))

(declare-fun b!830968 () Bool)

(assert (=> b!830968 (= e!463317 e!463315)))

(assert (=> b!830968 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(declare-fun res!565732 () Bool)

(assert (=> b!830968 (= res!565732 (contains!4208 lt!377143 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!830968 (=> (not res!565732) (not e!463315))))

(declare-fun b!830969 () Bool)

(assert (=> b!830969 (= e!463321 call!36307)))

(declare-fun b!830970 () Bool)

(assert (=> b!830970 (= e!463318 (= lt!377143 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!36304 () Bool)

(assert (=> bm!36304 (= call!36307 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830971 () Bool)

(assert (=> b!830971 (= e!463317 e!463318)))

(declare-fun c!90093 () Bool)

(assert (=> b!830971 (= c!90093 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(declare-fun b!830972 () Bool)

(assert (=> b!830972 (= e!463319 (validKeyInArray!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!830972 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!830973 () Bool)

(assert (=> b!830973 (= e!463320 e!463321)))

(declare-fun c!90091 () Bool)

(assert (=> b!830973 (= c!90091 (validKeyInArray!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!105691 c!90092) b!830965))

(assert (= (and d!105691 (not c!90092)) b!830973))

(assert (= (and b!830973 c!90091) b!830963))

(assert (= (and b!830973 (not c!90091)) b!830969))

(assert (= (or b!830963 b!830969) bm!36304))

(assert (= (and d!105691 res!565730) b!830966))

(assert (= (and b!830966 res!565729) b!830964))

(assert (= (and b!830964 res!565731) b!830972))

(assert (= (and b!830964 c!90094) b!830968))

(assert (= (and b!830964 (not c!90094)) b!830971))

(assert (= (and b!830968 res!565732) b!830962))

(assert (= (and b!830971 c!90093) b!830970))

(assert (= (and b!830971 (not c!90093)) b!830967))

(declare-fun b_lambda!11387 () Bool)

(assert (=> (not b_lambda!11387) (not b!830962)))

(assert (=> b!830962 t!22314))

(declare-fun b_and!22551 () Bool)

(assert (= b_and!22549 (and (=> t!22314 result!8015) b_and!22551)))

(declare-fun b_lambda!11389 () Bool)

(assert (=> (not b_lambda!11389) (not b!830963)))

(assert (=> b!830963 t!22314))

(declare-fun b_and!22553 () Bool)

(assert (= b_and!22551 (and (=> t!22314 result!8015) b_and!22553)))

(declare-fun m!774499 () Bool)

(assert (=> bm!36304 m!774499))

(declare-fun m!774501 () Bool)

(assert (=> b!830962 m!774501))

(assert (=> b!830962 m!774501))

(assert (=> b!830962 m!773433))

(declare-fun m!774503 () Bool)

(assert (=> b!830962 m!774503))

(assert (=> b!830962 m!773433))

(declare-fun m!774505 () Bool)

(assert (=> b!830962 m!774505))

(declare-fun m!774507 () Bool)

(assert (=> b!830962 m!774507))

(assert (=> b!830962 m!774505))

(declare-fun m!774509 () Bool)

(assert (=> b!830967 m!774509))

(assert (=> b!830968 m!774505))

(assert (=> b!830968 m!774505))

(declare-fun m!774511 () Bool)

(assert (=> b!830968 m!774511))

(assert (=> b!830973 m!774505))

(assert (=> b!830973 m!774505))

(declare-fun m!774513 () Bool)

(assert (=> b!830973 m!774513))

(assert (=> b!830963 m!774501))

(declare-fun m!774515 () Bool)

(assert (=> b!830963 m!774515))

(assert (=> b!830963 m!773433))

(declare-fun m!774517 () Bool)

(assert (=> b!830963 m!774517))

(assert (=> b!830963 m!774501))

(assert (=> b!830963 m!773433))

(assert (=> b!830963 m!774503))

(assert (=> b!830963 m!774515))

(declare-fun m!774519 () Bool)

(assert (=> b!830963 m!774519))

(declare-fun m!774521 () Bool)

(assert (=> b!830963 m!774521))

(assert (=> b!830963 m!774505))

(declare-fun m!774523 () Bool)

(assert (=> b!830966 m!774523))

(assert (=> b!830972 m!774505))

(assert (=> b!830972 m!774505))

(assert (=> b!830972 m!774513))

(assert (=> b!830970 m!774499))

(declare-fun m!774525 () Bool)

(assert (=> d!105691 m!774525))

(assert (=> d!105691 m!773289))

(assert (=> bm!36270 d!105691))

(declare-fun d!105693 () Bool)

(assert (=> d!105693 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376716) (_1!5086 lt!376677))) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376716) (_1!5086 lt!376677)))))))

(declare-fun bs!23217 () Bool)

(assert (= bs!23217 d!105693))

(assert (=> bs!23217 m!773337))

(declare-fun m!774527 () Bool)

(assert (=> bs!23217 m!774527))

(assert (=> b!830474 d!105693))

(assert (=> b!830474 d!105585))

(declare-fun b!830975 () Bool)

(declare-fun e!463322 () Option!421)

(declare-fun e!463323 () Option!421)

(assert (=> b!830975 (= e!463322 e!463323)))

(declare-fun c!90096 () Bool)

(assert (=> b!830975 (= c!90096 (and ((_ is Cons!15941) (toList!4502 lt!376999)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376999))) (_1!5086 (tuple2!10151 lt!376782 minValue!754))))))))

(declare-fun b!830976 () Bool)

(assert (=> b!830976 (= e!463323 (getValueByKey!415 (t!22310 (toList!4502 lt!376999)) (_1!5086 (tuple2!10151 lt!376782 minValue!754))))))

(declare-fun b!830977 () Bool)

(assert (=> b!830977 (= e!463323 None!419)))

(declare-fun b!830974 () Bool)

(assert (=> b!830974 (= e!463322 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376999)))))))

(declare-fun d!105695 () Bool)

(declare-fun c!90095 () Bool)

(assert (=> d!105695 (= c!90095 (and ((_ is Cons!15941) (toList!4502 lt!376999)) (= (_1!5086 (h!17070 (toList!4502 lt!376999))) (_1!5086 (tuple2!10151 lt!376782 minValue!754)))))))

(assert (=> d!105695 (= (getValueByKey!415 (toList!4502 lt!376999) (_1!5086 (tuple2!10151 lt!376782 minValue!754))) e!463322)))

(assert (= (and d!105695 c!90095) b!830974))

(assert (= (and d!105695 (not c!90095)) b!830975))

(assert (= (and b!830975 c!90096) b!830976))

(assert (= (and b!830975 (not c!90096)) b!830977))

(declare-fun m!774529 () Bool)

(assert (=> b!830976 m!774529))

(assert (=> b!830600 d!105695))

(declare-fun d!105697 () Bool)

(assert (=> d!105697 (= ($colon$colon!536 e!463070 (ite c!89950 (h!17070 (toList!4502 lt!376683)) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677)))) (Cons!15941 (ite c!89950 (h!17070 (toList!4502 lt!376683)) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))) e!463070))))

(assert (=> bm!36267 d!105697))

(declare-fun d!105699 () Bool)

(assert (=> d!105699 (= ($colon$colon!536 e!463124 (ite c!89967 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376677))) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679)))) (Cons!15941 (ite c!89967 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376677))) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))) e!463124))))

(assert (=> bm!36272 d!105699))

(declare-fun d!105701 () Bool)

(declare-fun e!463324 () Bool)

(assert (=> d!105701 e!463324))

(declare-fun res!565734 () Bool)

(assert (=> d!105701 (=> (not res!565734) (not e!463324))))

(declare-fun lt!377148 () ListLongMap!8973)

(assert (=> d!105701 (= res!565734 (contains!4208 lt!377148 (_1!5086 (tuple2!10151 lt!376973 lt!376971))))))

(declare-fun lt!377145 () List!15945)

(assert (=> d!105701 (= lt!377148 (ListLongMap!8974 lt!377145))))

(declare-fun lt!377147 () Unit!28429)

(declare-fun lt!377146 () Unit!28429)

(assert (=> d!105701 (= lt!377147 lt!377146)))

(assert (=> d!105701 (= (getValueByKey!415 lt!377145 (_1!5086 (tuple2!10151 lt!376973 lt!376971))) (Some!420 (_2!5086 (tuple2!10151 lt!376973 lt!376971))))))

(assert (=> d!105701 (= lt!377146 (lemmaContainsTupThenGetReturnValue!229 lt!377145 (_1!5086 (tuple2!10151 lt!376973 lt!376971)) (_2!5086 (tuple2!10151 lt!376973 lt!376971))))))

(assert (=> d!105701 (= lt!377145 (insertStrictlySorted!268 (toList!4502 lt!376974) (_1!5086 (tuple2!10151 lt!376973 lt!376971)) (_2!5086 (tuple2!10151 lt!376973 lt!376971))))))

(assert (=> d!105701 (= (+!1980 lt!376974 (tuple2!10151 lt!376973 lt!376971)) lt!377148)))

(declare-fun b!830978 () Bool)

(declare-fun res!565733 () Bool)

(assert (=> b!830978 (=> (not res!565733) (not e!463324))))

(assert (=> b!830978 (= res!565733 (= (getValueByKey!415 (toList!4502 lt!377148) (_1!5086 (tuple2!10151 lt!376973 lt!376971))) (Some!420 (_2!5086 (tuple2!10151 lt!376973 lt!376971)))))))

(declare-fun b!830979 () Bool)

(assert (=> b!830979 (= e!463324 (contains!4209 (toList!4502 lt!377148) (tuple2!10151 lt!376973 lt!376971)))))

(assert (= (and d!105701 res!565734) b!830978))

(assert (= (and b!830978 res!565733) b!830979))

(declare-fun m!774531 () Bool)

(assert (=> d!105701 m!774531))

(declare-fun m!774533 () Bool)

(assert (=> d!105701 m!774533))

(declare-fun m!774535 () Bool)

(assert (=> d!105701 m!774535))

(declare-fun m!774537 () Bool)

(assert (=> d!105701 m!774537))

(declare-fun m!774539 () Bool)

(assert (=> b!830978 m!774539))

(declare-fun m!774541 () Bool)

(assert (=> b!830979 m!774541))

(assert (=> b!830566 d!105701))

(declare-fun d!105703 () Bool)

(declare-fun e!463325 () Bool)

(assert (=> d!105703 e!463325))

(declare-fun res!565736 () Bool)

(assert (=> d!105703 (=> (not res!565736) (not e!463325))))

(declare-fun lt!377152 () ListLongMap!8973)

(assert (=> d!105703 (= res!565736 (contains!4208 lt!377152 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377149 () List!15945)

(assert (=> d!105703 (= lt!377152 (ListLongMap!8974 lt!377149))))

(declare-fun lt!377151 () Unit!28429)

(declare-fun lt!377150 () Unit!28429)

(assert (=> d!105703 (= lt!377151 lt!377150)))

(assert (=> d!105703 (= (getValueByKey!415 lt!377149 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!420 (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105703 (= lt!377150 (lemmaContainsTupThenGetReturnValue!229 lt!377149 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105703 (= lt!377149 (insertStrictlySorted!268 (toList!4502 call!36273) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105703 (= (+!1980 call!36273 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377152)))

(declare-fun b!830980 () Bool)

(declare-fun res!565735 () Bool)

(assert (=> b!830980 (=> (not res!565735) (not e!463325))))

(assert (=> b!830980 (= res!565735 (= (getValueByKey!415 (toList!4502 lt!377152) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!420 (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!830981 () Bool)

(assert (=> b!830981 (= e!463325 (contains!4209 (toList!4502 lt!377152) (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105703 res!565736) b!830980))

(assert (= (and b!830980 res!565735) b!830981))

(declare-fun m!774543 () Bool)

(assert (=> d!105703 m!774543))

(declare-fun m!774545 () Bool)

(assert (=> d!105703 m!774545))

(declare-fun m!774547 () Bool)

(assert (=> d!105703 m!774547))

(declare-fun m!774549 () Bool)

(assert (=> d!105703 m!774549))

(declare-fun m!774551 () Bool)

(assert (=> b!830980 m!774551))

(declare-fun m!774553 () Bool)

(assert (=> b!830981 m!774553))

(assert (=> b!830566 d!105703))

(declare-fun d!105705 () Bool)

(declare-fun c!90097 () Bool)

(assert (=> d!105705 (= c!90097 ((_ is ValueCellFull!7188) (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!463326 () V!25277)

(assert (=> d!105705 (= (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) e!463326)))

(declare-fun b!830982 () Bool)

(assert (=> b!830982 (= e!463326 (get!11819 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830983 () Bool)

(assert (=> b!830983 (= e!463326 (get!11820 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105705 c!90097) b!830982))

(assert (= (and d!105705 (not c!90097)) b!830983))

(assert (=> b!830982 m!773855))

(assert (=> b!830982 m!773433))

(declare-fun m!774555 () Bool)

(assert (=> b!830982 m!774555))

(assert (=> b!830983 m!773855))

(assert (=> b!830983 m!773433))

(declare-fun m!774557 () Bool)

(assert (=> b!830983 m!774557))

(assert (=> b!830566 d!105705))

(declare-fun d!105707 () Bool)

(assert (=> d!105707 (not (contains!4208 (+!1980 lt!376974 (tuple2!10151 lt!376973 lt!376971)) lt!376972))))

(declare-fun lt!377153 () Unit!28429)

(assert (=> d!105707 (= lt!377153 (choose!1417 lt!376974 lt!376973 lt!376971 lt!376972))))

(declare-fun e!463327 () Bool)

(assert (=> d!105707 e!463327))

(declare-fun res!565737 () Bool)

(assert (=> d!105707 (=> (not res!565737) (not e!463327))))

(assert (=> d!105707 (= res!565737 (not (contains!4208 lt!376974 lt!376972)))))

(assert (=> d!105707 (= (addStillNotContains!197 lt!376974 lt!376973 lt!376971 lt!376972) lt!377153)))

(declare-fun b!830984 () Bool)

(assert (=> b!830984 (= e!463327 (not (= lt!376973 lt!376972)))))

(assert (= (and d!105707 res!565737) b!830984))

(assert (=> d!105707 m!773869))

(assert (=> d!105707 m!773869))

(assert (=> d!105707 m!773873))

(declare-fun m!774559 () Bool)

(assert (=> d!105707 m!774559))

(declare-fun m!774561 () Bool)

(assert (=> d!105707 m!774561))

(assert (=> b!830566 d!105707))

(declare-fun d!105709 () Bool)

(declare-fun e!463328 () Bool)

(assert (=> d!105709 e!463328))

(declare-fun res!565738 () Bool)

(assert (=> d!105709 (=> res!565738 e!463328)))

(declare-fun lt!377154 () Bool)

(assert (=> d!105709 (= res!565738 (not lt!377154))))

(declare-fun lt!377156 () Bool)

(assert (=> d!105709 (= lt!377154 lt!377156)))

(declare-fun lt!377155 () Unit!28429)

(declare-fun e!463329 () Unit!28429)

(assert (=> d!105709 (= lt!377155 e!463329)))

(declare-fun c!90098 () Bool)

(assert (=> d!105709 (= c!90098 lt!377156)))

(assert (=> d!105709 (= lt!377156 (containsKey!401 (toList!4502 (+!1980 lt!376974 (tuple2!10151 lt!376973 lt!376971))) lt!376972))))

(assert (=> d!105709 (= (contains!4208 (+!1980 lt!376974 (tuple2!10151 lt!376973 lt!376971)) lt!376972) lt!377154)))

(declare-fun b!830985 () Bool)

(declare-fun lt!377157 () Unit!28429)

(assert (=> b!830985 (= e!463329 lt!377157)))

(assert (=> b!830985 (= lt!377157 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 (+!1980 lt!376974 (tuple2!10151 lt!376973 lt!376971))) lt!376972))))

(assert (=> b!830985 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376974 (tuple2!10151 lt!376973 lt!376971))) lt!376972))))

(declare-fun b!830986 () Bool)

(declare-fun Unit!28462 () Unit!28429)

(assert (=> b!830986 (= e!463329 Unit!28462)))

(declare-fun b!830987 () Bool)

(assert (=> b!830987 (= e!463328 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376974 (tuple2!10151 lt!376973 lt!376971))) lt!376972)))))

(assert (= (and d!105709 c!90098) b!830985))

(assert (= (and d!105709 (not c!90098)) b!830986))

(assert (= (and d!105709 (not res!565738)) b!830987))

(declare-fun m!774563 () Bool)

(assert (=> d!105709 m!774563))

(declare-fun m!774565 () Bool)

(assert (=> b!830985 m!774565))

(declare-fun m!774567 () Bool)

(assert (=> b!830985 m!774567))

(assert (=> b!830985 m!774567))

(declare-fun m!774569 () Bool)

(assert (=> b!830985 m!774569))

(assert (=> b!830987 m!774567))

(assert (=> b!830987 m!774567))

(assert (=> b!830987 m!774569))

(assert (=> b!830566 d!105709))

(declare-fun d!105711 () Bool)

(assert (=> d!105711 (= (get!11818 (getValueByKey!415 (toList!4502 lt!376795) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!10095 (getValueByKey!415 (toList!4502 lt!376795) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105543 d!105711))

(assert (=> d!105543 d!105617))

(declare-fun d!105713 () Bool)

(declare-fun res!565739 () Bool)

(declare-fun e!463330 () Bool)

(assert (=> d!105713 (=> res!565739 e!463330)))

(assert (=> d!105713 (= res!565739 (or ((_ is Nil!15942) lt!377050) ((_ is Nil!15942) (t!22310 lt!377050))))))

(assert (=> d!105713 (= (isStrictlySorted!441 lt!377050) e!463330)))

(declare-fun b!830988 () Bool)

(declare-fun e!463331 () Bool)

(assert (=> b!830988 (= e!463330 e!463331)))

(declare-fun res!565740 () Bool)

(assert (=> b!830988 (=> (not res!565740) (not e!463331))))

(assert (=> b!830988 (= res!565740 (bvslt (_1!5086 (h!17070 lt!377050)) (_1!5086 (h!17070 (t!22310 lt!377050)))))))

(declare-fun b!830989 () Bool)

(assert (=> b!830989 (= e!463331 (isStrictlySorted!441 (t!22310 lt!377050)))))

(assert (= (and d!105713 (not res!565739)) b!830988))

(assert (= (and b!830988 res!565740) b!830989))

(declare-fun m!774571 () Bool)

(assert (=> b!830989 m!774571))

(assert (=> d!105541 d!105713))

(declare-fun d!105715 () Bool)

(declare-fun res!565741 () Bool)

(declare-fun e!463332 () Bool)

(assert (=> d!105715 (=> res!565741 e!463332)))

(assert (=> d!105715 (= res!565741 (or ((_ is Nil!15942) (toList!4502 (+!1980 lt!376683 lt!376679))) ((_ is Nil!15942) (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679))))))))

(assert (=> d!105715 (= (isStrictlySorted!441 (toList!4502 (+!1980 lt!376683 lt!376679))) e!463332)))

(declare-fun b!830990 () Bool)

(declare-fun e!463333 () Bool)

(assert (=> b!830990 (= e!463332 e!463333)))

(declare-fun res!565742 () Bool)

(assert (=> b!830990 (=> (not res!565742) (not e!463333))))

(assert (=> b!830990 (= res!565742 (bvslt (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376679)))) (_1!5086 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679)))))))))

(declare-fun b!830991 () Bool)

(assert (=> b!830991 (= e!463333 (isStrictlySorted!441 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376679)))))))

(assert (= (and d!105715 (not res!565741)) b!830990))

(assert (= (and b!830990 res!565742) b!830991))

(assert (=> b!830991 m!774349))

(assert (=> d!105541 d!105715))

(declare-fun d!105717 () Bool)

(declare-fun e!463334 () Bool)

(assert (=> d!105717 e!463334))

(declare-fun res!565743 () Bool)

(assert (=> d!105717 (=> res!565743 e!463334)))

(declare-fun lt!377158 () Bool)

(assert (=> d!105717 (= res!565743 (not lt!377158))))

(declare-fun lt!377160 () Bool)

(assert (=> d!105717 (= lt!377158 lt!377160)))

(declare-fun lt!377159 () Unit!28429)

(declare-fun e!463335 () Unit!28429)

(assert (=> d!105717 (= lt!377159 e!463335)))

(declare-fun c!90099 () Bool)

(assert (=> d!105717 (= c!90099 lt!377160)))

(assert (=> d!105717 (= lt!377160 (containsKey!401 (toList!4502 lt!376999) (_1!5086 (tuple2!10151 lt!376782 minValue!754))))))

(assert (=> d!105717 (= (contains!4208 lt!376999 (_1!5086 (tuple2!10151 lt!376782 minValue!754))) lt!377158)))

(declare-fun b!830992 () Bool)

(declare-fun lt!377161 () Unit!28429)

(assert (=> b!830992 (= e!463335 lt!377161)))

(assert (=> b!830992 (= lt!377161 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376999) (_1!5086 (tuple2!10151 lt!376782 minValue!754))))))

(assert (=> b!830992 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376999) (_1!5086 (tuple2!10151 lt!376782 minValue!754))))))

(declare-fun b!830993 () Bool)

(declare-fun Unit!28463 () Unit!28429)

(assert (=> b!830993 (= e!463335 Unit!28463)))

(declare-fun b!830994 () Bool)

(assert (=> b!830994 (= e!463334 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376999) (_1!5086 (tuple2!10151 lt!376782 minValue!754)))))))

(assert (= (and d!105717 c!90099) b!830992))

(assert (= (and d!105717 (not c!90099)) b!830993))

(assert (= (and d!105717 (not res!565743)) b!830994))

(declare-fun m!774573 () Bool)

(assert (=> d!105717 m!774573))

(declare-fun m!774575 () Bool)

(assert (=> b!830992 m!774575))

(assert (=> b!830992 m!773959))

(assert (=> b!830992 m!773959))

(declare-fun m!774577 () Bool)

(assert (=> b!830992 m!774577))

(assert (=> b!830994 m!773959))

(assert (=> b!830994 m!773959))

(assert (=> b!830994 m!774577))

(assert (=> d!105479 d!105717))

(declare-fun b!830996 () Bool)

(declare-fun e!463336 () Option!421)

(declare-fun e!463337 () Option!421)

(assert (=> b!830996 (= e!463336 e!463337)))

(declare-fun c!90101 () Bool)

(assert (=> b!830996 (= c!90101 (and ((_ is Cons!15941) lt!376996) (not (= (_1!5086 (h!17070 lt!376996)) (_1!5086 (tuple2!10151 lt!376782 minValue!754))))))))

(declare-fun b!830997 () Bool)

(assert (=> b!830997 (= e!463337 (getValueByKey!415 (t!22310 lt!376996) (_1!5086 (tuple2!10151 lt!376782 minValue!754))))))

(declare-fun b!830998 () Bool)

(assert (=> b!830998 (= e!463337 None!419)))

(declare-fun b!830995 () Bool)

(assert (=> b!830995 (= e!463336 (Some!420 (_2!5086 (h!17070 lt!376996))))))

(declare-fun d!105719 () Bool)

(declare-fun c!90100 () Bool)

(assert (=> d!105719 (= c!90100 (and ((_ is Cons!15941) lt!376996) (= (_1!5086 (h!17070 lt!376996)) (_1!5086 (tuple2!10151 lt!376782 minValue!754)))))))

(assert (=> d!105719 (= (getValueByKey!415 lt!376996 (_1!5086 (tuple2!10151 lt!376782 minValue!754))) e!463336)))

(assert (= (and d!105719 c!90100) b!830995))

(assert (= (and d!105719 (not c!90100)) b!830996))

(assert (= (and b!830996 c!90101) b!830997))

(assert (= (and b!830996 (not c!90101)) b!830998))

(declare-fun m!774579 () Bool)

(assert (=> b!830997 m!774579))

(assert (=> d!105479 d!105719))

(declare-fun d!105721 () Bool)

(assert (=> d!105721 (= (getValueByKey!415 lt!376996 (_1!5086 (tuple2!10151 lt!376782 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 lt!376782 minValue!754))))))

(declare-fun lt!377162 () Unit!28429)

(assert (=> d!105721 (= lt!377162 (choose!1418 lt!376996 (_1!5086 (tuple2!10151 lt!376782 minValue!754)) (_2!5086 (tuple2!10151 lt!376782 minValue!754))))))

(declare-fun e!463338 () Bool)

(assert (=> d!105721 e!463338))

(declare-fun res!565744 () Bool)

(assert (=> d!105721 (=> (not res!565744) (not e!463338))))

(assert (=> d!105721 (= res!565744 (isStrictlySorted!441 lt!376996))))

(assert (=> d!105721 (= (lemmaContainsTupThenGetReturnValue!229 lt!376996 (_1!5086 (tuple2!10151 lt!376782 minValue!754)) (_2!5086 (tuple2!10151 lt!376782 minValue!754))) lt!377162)))

(declare-fun b!830999 () Bool)

(declare-fun res!565745 () Bool)

(assert (=> b!830999 (=> (not res!565745) (not e!463338))))

(assert (=> b!830999 (= res!565745 (containsKey!401 lt!376996 (_1!5086 (tuple2!10151 lt!376782 minValue!754))))))

(declare-fun b!831000 () Bool)

(assert (=> b!831000 (= e!463338 (contains!4209 lt!376996 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376782 minValue!754)) (_2!5086 (tuple2!10151 lt!376782 minValue!754)))))))

(assert (= (and d!105721 res!565744) b!830999))

(assert (= (and b!830999 res!565745) b!831000))

(assert (=> d!105721 m!773953))

(declare-fun m!774581 () Bool)

(assert (=> d!105721 m!774581))

(declare-fun m!774583 () Bool)

(assert (=> d!105721 m!774583))

(declare-fun m!774585 () Bool)

(assert (=> b!830999 m!774585))

(declare-fun m!774587 () Bool)

(assert (=> b!831000 m!774587))

(assert (=> d!105479 d!105721))

(declare-fun d!105723 () Bool)

(declare-fun e!463341 () Bool)

(assert (=> d!105723 e!463341))

(declare-fun res!565747 () Bool)

(assert (=> d!105723 (=> (not res!565747) (not e!463341))))

(declare-fun lt!377163 () List!15945)

(assert (=> d!105723 (= res!565747 (isStrictlySorted!441 lt!377163))))

(declare-fun e!463342 () List!15945)

(assert (=> d!105723 (= lt!377163 e!463342)))

(declare-fun c!90105 () Bool)

(assert (=> d!105723 (= c!90105 (and ((_ is Cons!15941) (toList!4502 lt!376794)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376794))) (_1!5086 (tuple2!10151 lt!376782 minValue!754)))))))

(assert (=> d!105723 (isStrictlySorted!441 (toList!4502 lt!376794))))

(assert (=> d!105723 (= (insertStrictlySorted!268 (toList!4502 lt!376794) (_1!5086 (tuple2!10151 lt!376782 minValue!754)) (_2!5086 (tuple2!10151 lt!376782 minValue!754))) lt!377163)))

(declare-fun b!831001 () Bool)

(declare-fun res!565746 () Bool)

(assert (=> b!831001 (=> (not res!565746) (not e!463341))))

(assert (=> b!831001 (= res!565746 (containsKey!401 lt!377163 (_1!5086 (tuple2!10151 lt!376782 minValue!754))))))

(declare-fun b!831002 () Bool)

(declare-fun e!463340 () List!15945)

(assert (=> b!831002 (= e!463340 (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376794)) (_1!5086 (tuple2!10151 lt!376782 minValue!754)) (_2!5086 (tuple2!10151 lt!376782 minValue!754))))))

(declare-fun call!36310 () List!15945)

(declare-fun bm!36305 () Bool)

(assert (=> bm!36305 (= call!36310 ($colon$colon!536 e!463340 (ite c!90105 (h!17070 (toList!4502 lt!376794)) (tuple2!10151 (_1!5086 (tuple2!10151 lt!376782 minValue!754)) (_2!5086 (tuple2!10151 lt!376782 minValue!754))))))))

(declare-fun c!90104 () Bool)

(assert (=> bm!36305 (= c!90104 c!90105)))

(declare-fun b!831003 () Bool)

(assert (=> b!831003 (= e!463341 (contains!4209 lt!377163 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376782 minValue!754)) (_2!5086 (tuple2!10151 lt!376782 minValue!754)))))))

(declare-fun b!831004 () Bool)

(declare-fun c!90103 () Bool)

(declare-fun c!90102 () Bool)

(assert (=> b!831004 (= e!463340 (ite c!90102 (t!22310 (toList!4502 lt!376794)) (ite c!90103 (Cons!15941 (h!17070 (toList!4502 lt!376794)) (t!22310 (toList!4502 lt!376794))) Nil!15942)))))

(declare-fun b!831005 () Bool)

(declare-fun e!463339 () List!15945)

(declare-fun call!36309 () List!15945)

(assert (=> b!831005 (= e!463339 call!36309)))

(declare-fun bm!36306 () Bool)

(declare-fun call!36308 () List!15945)

(assert (=> bm!36306 (= call!36309 call!36308)))

(declare-fun bm!36307 () Bool)

(assert (=> bm!36307 (= call!36308 call!36310)))

(declare-fun b!831006 () Bool)

(assert (=> b!831006 (= e!463339 call!36309)))

(declare-fun b!831007 () Bool)

(assert (=> b!831007 (= e!463342 call!36310)))

(declare-fun b!831008 () Bool)

(declare-fun e!463343 () List!15945)

(assert (=> b!831008 (= e!463343 call!36308)))

(declare-fun b!831009 () Bool)

(assert (=> b!831009 (= c!90103 (and ((_ is Cons!15941) (toList!4502 lt!376794)) (bvsgt (_1!5086 (h!17070 (toList!4502 lt!376794))) (_1!5086 (tuple2!10151 lt!376782 minValue!754)))))))

(assert (=> b!831009 (= e!463343 e!463339)))

(declare-fun b!831010 () Bool)

(assert (=> b!831010 (= e!463342 e!463343)))

(assert (=> b!831010 (= c!90102 (and ((_ is Cons!15941) (toList!4502 lt!376794)) (= (_1!5086 (h!17070 (toList!4502 lt!376794))) (_1!5086 (tuple2!10151 lt!376782 minValue!754)))))))

(assert (= (and d!105723 c!90105) b!831007))

(assert (= (and d!105723 (not c!90105)) b!831010))

(assert (= (and b!831010 c!90102) b!831008))

(assert (= (and b!831010 (not c!90102)) b!831009))

(assert (= (and b!831009 c!90103) b!831006))

(assert (= (and b!831009 (not c!90103)) b!831005))

(assert (= (or b!831006 b!831005) bm!36306))

(assert (= (or b!831008 bm!36306) bm!36307))

(assert (= (or b!831007 bm!36307) bm!36305))

(assert (= (and bm!36305 c!90104) b!831002))

(assert (= (and bm!36305 (not c!90104)) b!831004))

(assert (= (and d!105723 res!565747) b!831001))

(assert (= (and b!831001 res!565746) b!831003))

(declare-fun m!774589 () Bool)

(assert (=> bm!36305 m!774589))

(declare-fun m!774591 () Bool)

(assert (=> b!831001 m!774591))

(declare-fun m!774593 () Bool)

(assert (=> b!831003 m!774593))

(declare-fun m!774595 () Bool)

(assert (=> d!105723 m!774595))

(declare-fun m!774597 () Bool)

(assert (=> d!105723 m!774597))

(declare-fun m!774599 () Bool)

(assert (=> b!831002 m!774599))

(assert (=> d!105479 d!105723))

(declare-fun b!831012 () Bool)

(declare-fun e!463344 () Option!421)

(declare-fun e!463345 () Option!421)

(assert (=> b!831012 (= e!463344 e!463345)))

(declare-fun c!90107 () Bool)

(assert (=> b!831012 (= c!90107 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376716))) (not (= (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376716)))) (_1!5086 lt!376677)))))))

(declare-fun b!831013 () Bool)

(assert (=> b!831013 (= e!463345 (getValueByKey!415 (t!22310 (t!22310 (toList!4502 lt!376716))) (_1!5086 lt!376677)))))

(declare-fun b!831014 () Bool)

(assert (=> b!831014 (= e!463345 None!419)))

(declare-fun b!831011 () Bool)

(assert (=> b!831011 (= e!463344 (Some!420 (_2!5086 (h!17070 (t!22310 (toList!4502 lt!376716))))))))

(declare-fun d!105725 () Bool)

(declare-fun c!90106 () Bool)

(assert (=> d!105725 (= c!90106 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376716))) (= (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376716)))) (_1!5086 lt!376677))))))

(assert (=> d!105725 (= (getValueByKey!415 (t!22310 (toList!4502 lt!376716)) (_1!5086 lt!376677)) e!463344)))

(assert (= (and d!105725 c!90106) b!831011))

(assert (= (and d!105725 (not c!90106)) b!831012))

(assert (= (and b!831012 c!90107) b!831013))

(assert (= (and b!831012 (not c!90107)) b!831014))

(declare-fun m!774601 () Bool)

(assert (=> b!831013 m!774601))

(assert (=> b!830765 d!105725))

(declare-fun b!831016 () Bool)

(declare-fun e!463346 () Option!421)

(declare-fun e!463347 () Option!421)

(assert (=> b!831016 (= e!463346 e!463347)))

(declare-fun c!90109 () Bool)

(assert (=> b!831016 (= c!90109 (and ((_ is Cons!15941) (toList!4502 lt!377054)) (not (= (_1!5086 (h!17070 (toList!4502 lt!377054))) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!831017 () Bool)

(assert (=> b!831017 (= e!463347 (getValueByKey!415 (t!22310 (toList!4502 lt!377054)) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831018 () Bool)

(assert (=> b!831018 (= e!463347 None!419)))

(declare-fun b!831015 () Bool)

(assert (=> b!831015 (= e!463346 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!377054)))))))

(declare-fun d!105727 () Bool)

(declare-fun c!90108 () Bool)

(assert (=> d!105727 (= c!90108 (and ((_ is Cons!15941) (toList!4502 lt!377054)) (= (_1!5086 (h!17070 (toList!4502 lt!377054))) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105727 (= (getValueByKey!415 (toList!4502 lt!377054) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!463346)))

(assert (= (and d!105727 c!90108) b!831015))

(assert (= (and d!105727 (not c!90108)) b!831016))

(assert (= (and b!831016 c!90109) b!831017))

(assert (= (and b!831016 (not c!90109)) b!831018))

(declare-fun m!774603 () Bool)

(assert (=> b!831017 m!774603))

(assert (=> b!830696 d!105727))

(declare-fun d!105729 () Bool)

(assert (=> d!105729 (= (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))) lt!376783)) (not (isEmpty!656 (getValueByKey!415 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))) lt!376783))))))

(declare-fun bs!23218 () Bool)

(assert (= bs!23218 d!105729))

(assert (=> bs!23218 m!773943))

(declare-fun m!774605 () Bool)

(assert (=> bs!23218 m!774605))

(assert (=> b!830599 d!105729))

(declare-fun b!831020 () Bool)

(declare-fun e!463348 () Option!421)

(declare-fun e!463349 () Option!421)

(assert (=> b!831020 (= e!463348 e!463349)))

(declare-fun c!90111 () Bool)

(assert (=> b!831020 (= c!90111 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34)))) (not (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))))) lt!376783))))))

(declare-fun b!831021 () Bool)

(assert (=> b!831021 (= e!463349 (getValueByKey!415 (t!22310 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34)))) lt!376783))))

(declare-fun b!831022 () Bool)

(assert (=> b!831022 (= e!463349 None!419)))

(declare-fun b!831019 () Bool)

(assert (=> b!831019 (= e!463348 (Some!420 (_2!5086 (h!17070 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34)))))))))

(declare-fun d!105731 () Bool)

(declare-fun c!90110 () Bool)

(assert (=> d!105731 (= c!90110 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34)))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))))) lt!376783)))))

(assert (=> d!105731 (= (getValueByKey!415 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))) lt!376783) e!463348)))

(assert (= (and d!105731 c!90110) b!831019))

(assert (= (and d!105731 (not c!90110)) b!831020))

(assert (= (and b!831020 c!90111) b!831021))

(assert (= (and b!831020 (not c!90111)) b!831022))

(declare-fun m!774607 () Bool)

(assert (=> b!831021 m!774607))

(assert (=> b!830599 d!105731))

(declare-fun d!105733 () Bool)

(declare-fun res!565752 () Bool)

(declare-fun e!463354 () Bool)

(assert (=> d!105733 (=> res!565752 e!463354)))

(assert (=> d!105733 (= res!565752 (and ((_ is Cons!15941) lt!377050) (= (_1!5086 (h!17070 lt!377050)) (_1!5086 lt!376677))))))

(assert (=> d!105733 (= (containsKey!401 lt!377050 (_1!5086 lt!376677)) e!463354)))

(declare-fun b!831027 () Bool)

(declare-fun e!463355 () Bool)

(assert (=> b!831027 (= e!463354 e!463355)))

(declare-fun res!565753 () Bool)

(assert (=> b!831027 (=> (not res!565753) (not e!463355))))

(assert (=> b!831027 (= res!565753 (and (or (not ((_ is Cons!15941) lt!377050)) (bvsle (_1!5086 (h!17070 lt!377050)) (_1!5086 lt!376677))) ((_ is Cons!15941) lt!377050) (bvslt (_1!5086 (h!17070 lt!377050)) (_1!5086 lt!376677))))))

(declare-fun b!831028 () Bool)

(assert (=> b!831028 (= e!463355 (containsKey!401 (t!22310 lt!377050) (_1!5086 lt!376677)))))

(assert (= (and d!105733 (not res!565752)) b!831027))

(assert (= (and b!831027 res!565753) b!831028))

(declare-fun m!774609 () Bool)

(assert (=> b!831028 m!774609))

(assert (=> b!830682 d!105733))

(declare-fun b!831030 () Bool)

(declare-fun e!463356 () Option!421)

(declare-fun e!463357 () Option!421)

(assert (=> b!831030 (= e!463356 e!463357)))

(declare-fun c!90113 () Bool)

(assert (=> b!831030 (= c!90113 (and ((_ is Cons!15941) (t!22310 lt!376734)) (not (= (_1!5086 (h!17070 (t!22310 lt!376734))) (_1!5086 lt!376679)))))))

(declare-fun b!831031 () Bool)

(assert (=> b!831031 (= e!463357 (getValueByKey!415 (t!22310 (t!22310 lt!376734)) (_1!5086 lt!376679)))))

(declare-fun b!831032 () Bool)

(assert (=> b!831032 (= e!463357 None!419)))

(declare-fun b!831029 () Bool)

(assert (=> b!831029 (= e!463356 (Some!420 (_2!5086 (h!17070 (t!22310 lt!376734)))))))

(declare-fun d!105735 () Bool)

(declare-fun c!90112 () Bool)

(assert (=> d!105735 (= c!90112 (and ((_ is Cons!15941) (t!22310 lt!376734)) (= (_1!5086 (h!17070 (t!22310 lt!376734))) (_1!5086 lt!376679))))))

(assert (=> d!105735 (= (getValueByKey!415 (t!22310 lt!376734) (_1!5086 lt!376679)) e!463356)))

(assert (= (and d!105735 c!90112) b!831029))

(assert (= (and d!105735 (not c!90112)) b!831030))

(assert (= (and b!831030 c!90113) b!831031))

(assert (= (and b!831030 (not c!90113)) b!831032))

(declare-fun m!774611 () Bool)

(assert (=> b!831031 m!774611))

(assert (=> b!830637 d!105735))

(assert (=> d!105421 d!105419))

(declare-fun d!105737 () Bool)

(assert (=> d!105737 (= (getValueByKey!415 lt!376826 (_1!5086 lt!376677)) (Some!420 (_2!5086 lt!376677)))))

(assert (=> d!105737 true))

(declare-fun _$22!568 () Unit!28429)

(assert (=> d!105737 (= (choose!1418 lt!376826 (_1!5086 lt!376677) (_2!5086 lt!376677)) _$22!568)))

(declare-fun bs!23219 () Bool)

(assert (= bs!23219 d!105737))

(assert (=> bs!23219 m!773493))

(assert (=> d!105421 d!105737))

(declare-fun d!105739 () Bool)

(declare-fun res!565754 () Bool)

(declare-fun e!463358 () Bool)

(assert (=> d!105739 (=> res!565754 e!463358)))

(assert (=> d!105739 (= res!565754 (or ((_ is Nil!15942) lt!376826) ((_ is Nil!15942) (t!22310 lt!376826))))))

(assert (=> d!105739 (= (isStrictlySorted!441 lt!376826) e!463358)))

(declare-fun b!831033 () Bool)

(declare-fun e!463359 () Bool)

(assert (=> b!831033 (= e!463358 e!463359)))

(declare-fun res!565755 () Bool)

(assert (=> b!831033 (=> (not res!565755) (not e!463359))))

(assert (=> b!831033 (= res!565755 (bvslt (_1!5086 (h!17070 lt!376826)) (_1!5086 (h!17070 (t!22310 lt!376826)))))))

(declare-fun b!831034 () Bool)

(assert (=> b!831034 (= e!463359 (isStrictlySorted!441 (t!22310 lt!376826)))))

(assert (= (and d!105739 (not res!565754)) b!831033))

(assert (= (and b!831033 res!565755) b!831034))

(declare-fun m!774613 () Bool)

(assert (=> b!831034 m!774613))

(assert (=> d!105421 d!105739))

(declare-fun d!105741 () Bool)

(declare-fun res!565756 () Bool)

(declare-fun e!463360 () Bool)

(assert (=> d!105741 (=> res!565756 e!463360)))

(assert (=> d!105741 (= res!565756 (and ((_ is Cons!15941) (toList!4502 lt!376863)) (= (_1!5086 (h!17070 (toList!4502 lt!376863))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105741 (= (containsKey!401 (toList!4502 lt!376863) #b0000000000000000000000000000000000000000000000000000000000000000) e!463360)))

(declare-fun b!831035 () Bool)

(declare-fun e!463361 () Bool)

(assert (=> b!831035 (= e!463360 e!463361)))

(declare-fun res!565757 () Bool)

(assert (=> b!831035 (=> (not res!565757) (not e!463361))))

(assert (=> b!831035 (= res!565757 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376863))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376863))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15941) (toList!4502 lt!376863)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376863))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831036 () Bool)

(assert (=> b!831036 (= e!463361 (containsKey!401 (t!22310 (toList!4502 lt!376863)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105741 (not res!565756)) b!831035))

(assert (= (and b!831035 res!565757) b!831036))

(declare-fun m!774615 () Bool)

(assert (=> b!831036 m!774615))

(assert (=> d!105533 d!105741))

(assert (=> d!105501 d!105499))

(declare-fun d!105743 () Bool)

(assert (=> d!105743 (= (getValueByKey!415 lt!376730 (_1!5086 lt!376679)) (Some!420 (_2!5086 lt!376679)))))

(assert (=> d!105743 true))

(declare-fun _$22!569 () Unit!28429)

(assert (=> d!105743 (= (choose!1418 lt!376730 (_1!5086 lt!376679) (_2!5086 lt!376679)) _$22!569)))

(declare-fun bs!23220 () Bool)

(assert (= bs!23220 d!105743))

(assert (=> bs!23220 m!773371))

(assert (=> d!105501 d!105743))

(declare-fun d!105745 () Bool)

(declare-fun res!565758 () Bool)

(declare-fun e!463362 () Bool)

(assert (=> d!105745 (=> res!565758 e!463362)))

(assert (=> d!105745 (= res!565758 (or ((_ is Nil!15942) lt!376730) ((_ is Nil!15942) (t!22310 lt!376730))))))

(assert (=> d!105745 (= (isStrictlySorted!441 lt!376730) e!463362)))

(declare-fun b!831037 () Bool)

(declare-fun e!463363 () Bool)

(assert (=> b!831037 (= e!463362 e!463363)))

(declare-fun res!565759 () Bool)

(assert (=> b!831037 (=> (not res!565759) (not e!463363))))

(assert (=> b!831037 (= res!565759 (bvslt (_1!5086 (h!17070 lt!376730)) (_1!5086 (h!17070 (t!22310 lt!376730)))))))

(declare-fun b!831038 () Bool)

(assert (=> b!831038 (= e!463363 (isStrictlySorted!441 (t!22310 lt!376730)))))

(assert (= (and d!105745 (not res!565758)) b!831037))

(assert (= (and b!831037 res!565759) b!831038))

(declare-fun m!774617 () Bool)

(assert (=> b!831038 m!774617))

(assert (=> d!105501 d!105745))

(declare-fun d!105747 () Bool)

(assert (=> d!105747 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376795) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377164 () Unit!28429)

(assert (=> d!105747 (= lt!377164 (choose!1421 (toList!4502 lt!376795) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!463364 () Bool)

(assert (=> d!105747 e!463364))

(declare-fun res!565760 () Bool)

(assert (=> d!105747 (=> (not res!565760) (not e!463364))))

(assert (=> d!105747 (= res!565760 (isStrictlySorted!441 (toList!4502 lt!376795)))))

(assert (=> d!105747 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376795) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) lt!377164)))

(declare-fun b!831039 () Bool)

(assert (=> b!831039 (= e!463364 (containsKey!401 (toList!4502 lt!376795) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105747 res!565760) b!831039))

(assert (=> d!105747 m!773353))

(assert (=> d!105747 m!773633))

(assert (=> d!105747 m!773633))

(assert (=> d!105747 m!773635))

(assert (=> d!105747 m!773353))

(declare-fun m!774619 () Bool)

(assert (=> d!105747 m!774619))

(declare-fun m!774621 () Bool)

(assert (=> d!105747 m!774621))

(assert (=> b!831039 m!773353))

(assert (=> b!831039 m!773629))

(assert (=> b!830450 d!105747))

(declare-fun d!105749 () Bool)

(assert (=> d!105749 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376795) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376795) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23221 () Bool)

(assert (= bs!23221 d!105749))

(assert (=> bs!23221 m!773633))

(declare-fun m!774623 () Bool)

(assert (=> bs!23221 m!774623))

(assert (=> b!830450 d!105749))

(declare-fun b!831041 () Bool)

(declare-fun e!463365 () Option!421)

(declare-fun e!463366 () Option!421)

(assert (=> b!831041 (= e!463365 e!463366)))

(declare-fun c!90115 () Bool)

(assert (=> b!831041 (= c!90115 (and ((_ is Cons!15941) (toList!4502 lt!376795)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376795))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!831042 () Bool)

(assert (=> b!831042 (= e!463366 (getValueByKey!415 (t!22310 (toList!4502 lt!376795)) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831043 () Bool)

(assert (=> b!831043 (= e!463366 None!419)))

(declare-fun b!831040 () Bool)

(assert (=> b!831040 (= e!463365 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376795)))))))

(declare-fun d!105751 () Bool)

(declare-fun c!90114 () Bool)

(assert (=> d!105751 (= c!90114 (and ((_ is Cons!15941) (toList!4502 lt!376795)) (= (_1!5086 (h!17070 (toList!4502 lt!376795))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105751 (= (getValueByKey!415 (toList!4502 lt!376795) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) e!463365)))

(assert (= (and d!105751 c!90114) b!831040))

(assert (= (and d!105751 (not c!90114)) b!831041))

(assert (= (and b!831041 c!90115) b!831042))

(assert (= (and b!831041 (not c!90115)) b!831043))

(assert (=> b!831042 m!773353))

(declare-fun m!774625 () Bool)

(assert (=> b!831042 m!774625))

(assert (=> b!830450 d!105751))

(declare-fun d!105753 () Bool)

(assert (=> d!105753 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376863) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376863) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23222 () Bool)

(assert (= bs!23222 d!105753))

(assert (=> bs!23222 m!773613))

(declare-fun m!774627 () Bool)

(assert (=> bs!23222 m!774627))

(assert (=> b!830447 d!105753))

(declare-fun b!831045 () Bool)

(declare-fun e!463367 () Option!421)

(declare-fun e!463368 () Option!421)

(assert (=> b!831045 (= e!463367 e!463368)))

(declare-fun c!90117 () Bool)

(assert (=> b!831045 (= c!90117 (and ((_ is Cons!15941) (toList!4502 lt!376863)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376863))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!831046 () Bool)

(assert (=> b!831046 (= e!463368 (getValueByKey!415 (t!22310 (toList!4502 lt!376863)) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831047 () Bool)

(assert (=> b!831047 (= e!463368 None!419)))

(declare-fun b!831044 () Bool)

(assert (=> b!831044 (= e!463367 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376863)))))))

(declare-fun d!105755 () Bool)

(declare-fun c!90116 () Bool)

(assert (=> d!105755 (= c!90116 (and ((_ is Cons!15941) (toList!4502 lt!376863)) (= (_1!5086 (h!17070 (toList!4502 lt!376863))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105755 (= (getValueByKey!415 (toList!4502 lt!376863) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) e!463367)))

(assert (= (and d!105755 c!90116) b!831044))

(assert (= (and d!105755 (not c!90116)) b!831045))

(assert (= (and b!831045 c!90117) b!831046))

(assert (= (and b!831045 (not c!90117)) b!831047))

(assert (=> b!831046 m!773353))

(declare-fun m!774629 () Bool)

(assert (=> b!831046 m!774629))

(assert (=> b!830447 d!105755))

(declare-fun d!105757 () Bool)

(assert (=> d!105757 (= (apply!372 lt!376975 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11818 (getValueByKey!415 (toList!4502 lt!376975) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun bs!23223 () Bool)

(assert (= bs!23223 d!105757))

(assert (=> bs!23223 m!773859))

(declare-fun m!774631 () Bool)

(assert (=> bs!23223 m!774631))

(assert (=> bs!23223 m!774631))

(declare-fun m!774633 () Bool)

(assert (=> bs!23223 m!774633))

(assert (=> b!830565 d!105757))

(assert (=> b!830565 d!105705))

(declare-fun d!105759 () Bool)

(assert (=> d!105759 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376856) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376856) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23224 () Bool)

(assert (= bs!23224 d!105759))

(assert (=> bs!23224 m!774099))

(declare-fun m!774635 () Bool)

(assert (=> bs!23224 m!774635))

(assert (=> b!830663 d!105759))

(assert (=> b!830663 d!105677))

(declare-fun d!105761 () Bool)

(declare-fun e!463371 () Bool)

(assert (=> d!105761 e!463371))

(declare-fun res!565762 () Bool)

(assert (=> d!105761 (=> (not res!565762) (not e!463371))))

(declare-fun lt!377165 () List!15945)

(assert (=> d!105761 (= res!565762 (isStrictlySorted!441 lt!377165))))

(declare-fun e!463372 () List!15945)

(assert (=> d!105761 (= lt!377165 e!463372)))

(declare-fun c!90121 () Bool)

(assert (=> d!105761 (= c!90121 (and ((_ is Cons!15941) (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (bvslt (_1!5086 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5086 lt!376677))))))

(assert (=> d!105761 (isStrictlySorted!441 (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105761 (= (insertStrictlySorted!268 (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (_1!5086 lt!376677) (_2!5086 lt!376677)) lt!377165)))

(declare-fun b!831048 () Bool)

(declare-fun res!565761 () Bool)

(assert (=> b!831048 (=> (not res!565761) (not e!463371))))

(assert (=> b!831048 (= res!565761 (containsKey!401 lt!377165 (_1!5086 lt!376677)))))

(declare-fun b!831049 () Bool)

(declare-fun e!463370 () List!15945)

(assert (=> b!831049 (= e!463370 (insertStrictlySorted!268 (t!22310 (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5086 lt!376677) (_2!5086 lt!376677)))))

(declare-fun call!36313 () List!15945)

(declare-fun bm!36308 () Bool)

(assert (=> bm!36308 (= call!36313 ($colon$colon!536 e!463370 (ite c!90121 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677)))))))

(declare-fun c!90120 () Bool)

(assert (=> bm!36308 (= c!90120 c!90121)))

(declare-fun b!831050 () Bool)

(assert (=> b!831050 (= e!463371 (contains!4209 lt!377165 (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun c!90119 () Bool)

(declare-fun c!90118 () Bool)

(declare-fun b!831051 () Bool)

(assert (=> b!831051 (= e!463370 (ite c!90118 (t!22310 (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (ite c!90119 (Cons!15941 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (t!22310 (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) Nil!15942)))))

(declare-fun b!831052 () Bool)

(declare-fun e!463369 () List!15945)

(declare-fun call!36312 () List!15945)

(assert (=> b!831052 (= e!463369 call!36312)))

(declare-fun bm!36309 () Bool)

(declare-fun call!36311 () List!15945)

(assert (=> bm!36309 (= call!36312 call!36311)))

(declare-fun bm!36310 () Bool)

(assert (=> bm!36310 (= call!36311 call!36313)))

(declare-fun b!831053 () Bool)

(assert (=> b!831053 (= e!463369 call!36312)))

(declare-fun b!831054 () Bool)

(assert (=> b!831054 (= e!463372 call!36313)))

(declare-fun b!831055 () Bool)

(declare-fun e!463373 () List!15945)

(assert (=> b!831055 (= e!463373 call!36311)))

(declare-fun b!831056 () Bool)

(assert (=> b!831056 (= c!90119 (and ((_ is Cons!15941) (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (bvsgt (_1!5086 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5086 lt!376677))))))

(assert (=> b!831056 (= e!463373 e!463369)))

(declare-fun b!831057 () Bool)

(assert (=> b!831057 (= e!463372 e!463373)))

(assert (=> b!831057 (= c!90118 (and ((_ is Cons!15941) (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (= (_1!5086 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5086 lt!376677))))))

(assert (= (and d!105761 c!90121) b!831054))

(assert (= (and d!105761 (not c!90121)) b!831057))

(assert (= (and b!831057 c!90118) b!831055))

(assert (= (and b!831057 (not c!90118)) b!831056))

(assert (= (and b!831056 c!90119) b!831053))

(assert (= (and b!831056 (not c!90119)) b!831052))

(assert (= (or b!831053 b!831052) bm!36309))

(assert (= (or b!831055 bm!36309) bm!36310))

(assert (= (or b!831054 bm!36310) bm!36308))

(assert (= (and bm!36308 c!90120) b!831049))

(assert (= (and bm!36308 (not c!90120)) b!831051))

(assert (= (and d!105761 res!565762) b!831048))

(assert (= (and b!831048 res!565761) b!831050))

(declare-fun m!774637 () Bool)

(assert (=> bm!36308 m!774637))

(declare-fun m!774639 () Bool)

(assert (=> b!831048 m!774639))

(declare-fun m!774641 () Bool)

(assert (=> b!831050 m!774641))

(declare-fun m!774643 () Bool)

(assert (=> d!105761 m!774643))

(declare-fun m!774645 () Bool)

(assert (=> d!105761 m!774645))

(declare-fun m!774647 () Bool)

(assert (=> b!831049 m!774647))

(assert (=> b!830514 d!105761))

(declare-fun d!105763 () Bool)

(declare-fun c!90124 () Bool)

(assert (=> d!105763 (= c!90124 ((_ is Nil!15942) (toList!4502 lt!376737)))))

(declare-fun e!463376 () (InoxSet tuple2!10150))

(assert (=> d!105763 (= (content!386 (toList!4502 lt!376737)) e!463376)))

(declare-fun b!831062 () Bool)

(assert (=> b!831062 (= e!463376 ((as const (Array tuple2!10150 Bool)) false))))

(declare-fun b!831063 () Bool)

(assert (=> b!831063 (= e!463376 ((_ map or) (store ((as const (Array tuple2!10150 Bool)) false) (h!17070 (toList!4502 lt!376737)) true) (content!386 (t!22310 (toList!4502 lt!376737)))))))

(assert (= (and d!105763 c!90124) b!831062))

(assert (= (and d!105763 (not c!90124)) b!831063))

(declare-fun m!774649 () Bool)

(assert (=> b!831063 m!774649))

(declare-fun m!774651 () Bool)

(assert (=> b!831063 m!774651))

(assert (=> d!105413 d!105763))

(declare-fun lt!377166 () Bool)

(declare-fun d!105765 () Bool)

(assert (=> d!105765 (= lt!377166 (select (content!386 (toList!4502 lt!376961)) (tuple2!10151 lt!376813 minValue!754)))))

(declare-fun e!463378 () Bool)

(assert (=> d!105765 (= lt!377166 e!463378)))

(declare-fun res!565763 () Bool)

(assert (=> d!105765 (=> (not res!565763) (not e!463378))))

(assert (=> d!105765 (= res!565763 ((_ is Cons!15941) (toList!4502 lt!376961)))))

(assert (=> d!105765 (= (contains!4209 (toList!4502 lt!376961) (tuple2!10151 lt!376813 minValue!754)) lt!377166)))

(declare-fun b!831064 () Bool)

(declare-fun e!463377 () Bool)

(assert (=> b!831064 (= e!463378 e!463377)))

(declare-fun res!565764 () Bool)

(assert (=> b!831064 (=> res!565764 e!463377)))

(assert (=> b!831064 (= res!565764 (= (h!17070 (toList!4502 lt!376961)) (tuple2!10151 lt!376813 minValue!754)))))

(declare-fun b!831065 () Bool)

(assert (=> b!831065 (= e!463377 (contains!4209 (t!22310 (toList!4502 lt!376961)) (tuple2!10151 lt!376813 minValue!754)))))

(assert (= (and d!105765 res!565763) b!831064))

(assert (= (and b!831064 (not res!565764)) b!831065))

(declare-fun m!774653 () Bool)

(assert (=> d!105765 m!774653))

(declare-fun m!774655 () Bool)

(assert (=> d!105765 m!774655))

(declare-fun m!774657 () Bool)

(assert (=> b!831065 m!774657))

(assert (=> b!830560 d!105765))

(declare-fun b!831067 () Bool)

(declare-fun e!463379 () Option!421)

(declare-fun e!463380 () Option!421)

(assert (=> b!831067 (= e!463379 e!463380)))

(declare-fun c!90126 () Bool)

(assert (=> b!831067 (= c!90126 (and ((_ is Cons!15941) (toList!4502 lt!376868)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376868))) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!831068 () Bool)

(assert (=> b!831068 (= e!463380 (getValueByKey!415 (t!22310 (toList!4502 lt!376868)) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!831069 () Bool)

(assert (=> b!831069 (= e!463380 None!419)))

(declare-fun b!831066 () Bool)

(assert (=> b!831066 (= e!463379 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376868)))))))

(declare-fun d!105767 () Bool)

(declare-fun c!90125 () Bool)

(assert (=> d!105767 (= c!90125 (and ((_ is Cons!15941) (toList!4502 lt!376868)) (= (_1!5086 (h!17070 (toList!4502 lt!376868))) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!105767 (= (getValueByKey!415 (toList!4502 lt!376868) (_1!5086 (ite (or c!89891 c!89896) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!463379)))

(assert (= (and d!105767 c!90125) b!831066))

(assert (= (and d!105767 (not c!90125)) b!831067))

(assert (= (and b!831067 c!90126) b!831068))

(assert (= (and b!831067 (not c!90126)) b!831069))

(declare-fun m!774659 () Bool)

(assert (=> b!831068 m!774659))

(assert (=> b!830420 d!105767))

(declare-fun d!105769 () Bool)

(declare-fun res!565765 () Bool)

(declare-fun e!463381 () Bool)

(assert (=> d!105769 (=> res!565765 e!463381)))

(assert (=> d!105769 (= res!565765 (and ((_ is Cons!15941) lt!377080) (= (_1!5086 (h!17070 lt!377080)) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105769 (= (containsKey!401 lt!377080 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463381)))

(declare-fun b!831070 () Bool)

(declare-fun e!463382 () Bool)

(assert (=> b!831070 (= e!463381 e!463382)))

(declare-fun res!565766 () Bool)

(assert (=> b!831070 (=> (not res!565766) (not e!463382))))

(assert (=> b!831070 (= res!565766 (and (or (not ((_ is Cons!15941) lt!377080)) (bvsle (_1!5086 (h!17070 lt!377080)) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15941) lt!377080) (bvslt (_1!5086 (h!17070 lt!377080)) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831071 () Bool)

(assert (=> b!831071 (= e!463382 (containsKey!401 (t!22310 lt!377080) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!105769 (not res!565765)) b!831070))

(assert (= (and b!831070 res!565766) b!831071))

(declare-fun m!774661 () Bool)

(assert (=> b!831071 m!774661))

(assert (=> b!830741 d!105769))

(declare-fun d!105771 () Bool)

(assert (=> d!105771 (= (get!11818 (getValueByKey!415 (toList!4502 lt!376812) lt!376821)) (v!10095 (getValueByKey!415 (toList!4502 lt!376812) lt!376821)))))

(assert (=> d!105439 d!105771))

(declare-fun b!831073 () Bool)

(declare-fun e!463383 () Option!421)

(declare-fun e!463384 () Option!421)

(assert (=> b!831073 (= e!463383 e!463384)))

(declare-fun c!90128 () Bool)

(assert (=> b!831073 (= c!90128 (and ((_ is Cons!15941) (toList!4502 lt!376812)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376812))) lt!376821))))))

(declare-fun b!831074 () Bool)

(assert (=> b!831074 (= e!463384 (getValueByKey!415 (t!22310 (toList!4502 lt!376812)) lt!376821))))

(declare-fun b!831075 () Bool)

(assert (=> b!831075 (= e!463384 None!419)))

(declare-fun b!831072 () Bool)

(assert (=> b!831072 (= e!463383 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376812)))))))

(declare-fun d!105773 () Bool)

(declare-fun c!90127 () Bool)

(assert (=> d!105773 (= c!90127 (and ((_ is Cons!15941) (toList!4502 lt!376812)) (= (_1!5086 (h!17070 (toList!4502 lt!376812))) lt!376821)))))

(assert (=> d!105773 (= (getValueByKey!415 (toList!4502 lt!376812) lt!376821) e!463383)))

(assert (= (and d!105773 c!90127) b!831072))

(assert (= (and d!105773 (not c!90127)) b!831073))

(assert (= (and b!831073 c!90128) b!831074))

(assert (= (and b!831073 (not c!90128)) b!831075))

(declare-fun m!774663 () Bool)

(assert (=> b!831074 m!774663))

(assert (=> d!105439 d!105773))

(declare-fun d!105775 () Bool)

(declare-fun e!463385 () Bool)

(assert (=> d!105775 e!463385))

(declare-fun res!565767 () Bool)

(assert (=> d!105775 (=> res!565767 e!463385)))

(declare-fun lt!377167 () Bool)

(assert (=> d!105775 (= res!565767 (not lt!377167))))

(declare-fun lt!377169 () Bool)

(assert (=> d!105775 (= lt!377167 lt!377169)))

(declare-fun lt!377168 () Unit!28429)

(declare-fun e!463386 () Unit!28429)

(assert (=> d!105775 (= lt!377168 e!463386)))

(declare-fun c!90129 () Bool)

(assert (=> d!105775 (= c!90129 lt!377169)))

(assert (=> d!105775 (= lt!377169 (containsKey!401 (toList!4502 lt!376982) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105775 (= (contains!4208 lt!376982 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377167)))

(declare-fun b!831076 () Bool)

(declare-fun lt!377170 () Unit!28429)

(assert (=> b!831076 (= e!463386 lt!377170)))

(assert (=> b!831076 (= lt!377170 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376982) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831076 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376982) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831077 () Bool)

(declare-fun Unit!28464 () Unit!28429)

(assert (=> b!831077 (= e!463386 Unit!28464)))

(declare-fun b!831078 () Bool)

(assert (=> b!831078 (= e!463385 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376982) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105775 c!90129) b!831076))

(assert (= (and d!105775 (not c!90129)) b!831077))

(assert (= (and d!105775 (not res!565767)) b!831078))

(declare-fun m!774665 () Bool)

(assert (=> d!105775 m!774665))

(declare-fun m!774667 () Bool)

(assert (=> b!831076 m!774667))

(declare-fun m!774669 () Bool)

(assert (=> b!831076 m!774669))

(assert (=> b!831076 m!774669))

(declare-fun m!774671 () Bool)

(assert (=> b!831076 m!774671))

(assert (=> b!831078 m!774669))

(assert (=> b!831078 m!774669))

(assert (=> b!831078 m!774671))

(assert (=> d!105459 d!105775))

(assert (=> d!105459 d!105343))

(declare-fun d!105777 () Bool)

(declare-fun e!463389 () Bool)

(assert (=> d!105777 e!463389))

(declare-fun res!565769 () Bool)

(assert (=> d!105777 (=> (not res!565769) (not e!463389))))

(declare-fun lt!377171 () List!15945)

(assert (=> d!105777 (= res!565769 (isStrictlySorted!441 lt!377171))))

(declare-fun e!463390 () List!15945)

(assert (=> d!105777 (= lt!377171 e!463390)))

(declare-fun c!90133 () Bool)

(assert (=> d!105777 (= c!90133 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376683))) (bvslt (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376683)))) (_1!5086 lt!376677))))))

(assert (=> d!105777 (isStrictlySorted!441 (t!22310 (toList!4502 lt!376683)))))

(assert (=> d!105777 (= (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376683)) (_1!5086 lt!376677) (_2!5086 lt!376677)) lt!377171)))

(declare-fun b!831079 () Bool)

(declare-fun res!565768 () Bool)

(assert (=> b!831079 (=> (not res!565768) (not e!463389))))

(assert (=> b!831079 (= res!565768 (containsKey!401 lt!377171 (_1!5086 lt!376677)))))

(declare-fun b!831080 () Bool)

(declare-fun e!463388 () List!15945)

(assert (=> b!831080 (= e!463388 (insertStrictlySorted!268 (t!22310 (t!22310 (toList!4502 lt!376683))) (_1!5086 lt!376677) (_2!5086 lt!376677)))))

(declare-fun call!36316 () List!15945)

(declare-fun bm!36311 () Bool)

(assert (=> bm!36311 (= call!36316 ($colon$colon!536 e!463388 (ite c!90133 (h!17070 (t!22310 (toList!4502 lt!376683))) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677)))))))

(declare-fun c!90132 () Bool)

(assert (=> bm!36311 (= c!90132 c!90133)))

(declare-fun b!831081 () Bool)

(assert (=> b!831081 (= e!463389 (contains!4209 lt!377171 (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun c!90130 () Bool)

(declare-fun b!831082 () Bool)

(declare-fun c!90131 () Bool)

(assert (=> b!831082 (= e!463388 (ite c!90130 (t!22310 (t!22310 (toList!4502 lt!376683))) (ite c!90131 (Cons!15941 (h!17070 (t!22310 (toList!4502 lt!376683))) (t!22310 (t!22310 (toList!4502 lt!376683)))) Nil!15942)))))

(declare-fun b!831083 () Bool)

(declare-fun e!463387 () List!15945)

(declare-fun call!36315 () List!15945)

(assert (=> b!831083 (= e!463387 call!36315)))

(declare-fun bm!36312 () Bool)

(declare-fun call!36314 () List!15945)

(assert (=> bm!36312 (= call!36315 call!36314)))

(declare-fun bm!36313 () Bool)

(assert (=> bm!36313 (= call!36314 call!36316)))

(declare-fun b!831084 () Bool)

(assert (=> b!831084 (= e!463387 call!36315)))

(declare-fun b!831085 () Bool)

(assert (=> b!831085 (= e!463390 call!36316)))

(declare-fun b!831086 () Bool)

(declare-fun e!463391 () List!15945)

(assert (=> b!831086 (= e!463391 call!36314)))

(declare-fun b!831087 () Bool)

(assert (=> b!831087 (= c!90131 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376683))) (bvsgt (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376683)))) (_1!5086 lt!376677))))))

(assert (=> b!831087 (= e!463391 e!463387)))

(declare-fun b!831088 () Bool)

(assert (=> b!831088 (= e!463390 e!463391)))

(assert (=> b!831088 (= c!90130 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376683))) (= (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376683)))) (_1!5086 lt!376677))))))

(assert (= (and d!105777 c!90133) b!831085))

(assert (= (and d!105777 (not c!90133)) b!831088))

(assert (= (and b!831088 c!90130) b!831086))

(assert (= (and b!831088 (not c!90130)) b!831087))

(assert (= (and b!831087 c!90131) b!831084))

(assert (= (and b!831087 (not c!90131)) b!831083))

(assert (= (or b!831084 b!831083) bm!36312))

(assert (= (or b!831086 bm!36312) bm!36313))

(assert (= (or b!831085 bm!36313) bm!36311))

(assert (= (and bm!36311 c!90132) b!831080))

(assert (= (and bm!36311 (not c!90132)) b!831082))

(assert (= (and d!105777 res!565769) b!831079))

(assert (= (and b!831079 res!565768) b!831081))

(declare-fun m!774673 () Bool)

(assert (=> bm!36311 m!774673))

(declare-fun m!774675 () Bool)

(assert (=> b!831079 m!774675))

(declare-fun m!774677 () Bool)

(assert (=> b!831081 m!774677))

(declare-fun m!774679 () Bool)

(assert (=> d!105777 m!774679))

(declare-fun m!774681 () Bool)

(assert (=> d!105777 m!774681))

(declare-fun m!774683 () Bool)

(assert (=> b!831080 m!774683))

(assert (=> b!830538 d!105777))

(assert (=> b!830573 d!105691))

(declare-fun d!105779 () Bool)

(declare-fun e!463394 () Bool)

(assert (=> d!105779 e!463394))

(declare-fun res!565771 () Bool)

(assert (=> d!105779 (=> (not res!565771) (not e!463394))))

(declare-fun lt!377172 () List!15945)

(assert (=> d!105779 (= res!565771 (isStrictlySorted!441 lt!377172))))

(declare-fun e!463395 () List!15945)

(assert (=> d!105779 (= lt!377172 e!463395)))

(declare-fun c!90137 () Bool)

(assert (=> d!105779 (= c!90137 (and ((_ is Cons!15941) (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677)))) (bvslt (_1!5086 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677))))) (_1!5086 lt!376679))))))

(assert (=> d!105779 (isStrictlySorted!441 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677))))))

(assert (=> d!105779 (= (insertStrictlySorted!268 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677))) (_1!5086 lt!376679) (_2!5086 lt!376679)) lt!377172)))

(declare-fun b!831089 () Bool)

(declare-fun res!565770 () Bool)

(assert (=> b!831089 (=> (not res!565770) (not e!463394))))

(assert (=> b!831089 (= res!565770 (containsKey!401 lt!377172 (_1!5086 lt!376679)))))

(declare-fun b!831090 () Bool)

(declare-fun e!463393 () List!15945)

(assert (=> b!831090 (= e!463393 (insertStrictlySorted!268 (t!22310 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677)))) (_1!5086 lt!376679) (_2!5086 lt!376679)))))

(declare-fun bm!36314 () Bool)

(declare-fun call!36319 () List!15945)

(assert (=> bm!36314 (= call!36319 ($colon$colon!536 e!463393 (ite c!90137 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677)))) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679)))))))

(declare-fun c!90136 () Bool)

(assert (=> bm!36314 (= c!90136 c!90137)))

(declare-fun b!831091 () Bool)

(assert (=> b!831091 (= e!463394 (contains!4209 lt!377172 (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(declare-fun c!90135 () Bool)

(declare-fun c!90134 () Bool)

(declare-fun b!831092 () Bool)

(assert (=> b!831092 (= e!463393 (ite c!90134 (t!22310 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677)))) (ite c!90135 (Cons!15941 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677)))) (t!22310 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677))))) Nil!15942)))))

(declare-fun b!831093 () Bool)

(declare-fun e!463392 () List!15945)

(declare-fun call!36318 () List!15945)

(assert (=> b!831093 (= e!463392 call!36318)))

(declare-fun bm!36315 () Bool)

(declare-fun call!36317 () List!15945)

(assert (=> bm!36315 (= call!36318 call!36317)))

(declare-fun bm!36316 () Bool)

(assert (=> bm!36316 (= call!36317 call!36319)))

(declare-fun b!831094 () Bool)

(assert (=> b!831094 (= e!463392 call!36318)))

(declare-fun b!831095 () Bool)

(assert (=> b!831095 (= e!463395 call!36319)))

(declare-fun b!831096 () Bool)

(declare-fun e!463396 () List!15945)

(assert (=> b!831096 (= e!463396 call!36317)))

(declare-fun b!831097 () Bool)

(assert (=> b!831097 (= c!90135 (and ((_ is Cons!15941) (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677)))) (bvsgt (_1!5086 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677))))) (_1!5086 lt!376679))))))

(assert (=> b!831097 (= e!463396 e!463392)))

(declare-fun b!831098 () Bool)

(assert (=> b!831098 (= e!463395 e!463396)))

(assert (=> b!831098 (= c!90134 (and ((_ is Cons!15941) (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677)))) (= (_1!5086 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677))))) (_1!5086 lt!376679))))))

(assert (= (and d!105779 c!90137) b!831095))

(assert (= (and d!105779 (not c!90137)) b!831098))

(assert (= (and b!831098 c!90134) b!831096))

(assert (= (and b!831098 (not c!90134)) b!831097))

(assert (= (and b!831097 c!90135) b!831094))

(assert (= (and b!831097 (not c!90135)) b!831093))

(assert (= (or b!831094 b!831093) bm!36315))

(assert (= (or b!831096 bm!36315) bm!36316))

(assert (= (or b!831095 bm!36316) bm!36314))

(assert (= (and bm!36314 c!90136) b!831090))

(assert (= (and bm!36314 (not c!90136)) b!831092))

(assert (= (and d!105779 res!565771) b!831089))

(assert (= (and b!831089 res!565770) b!831091))

(declare-fun m!774685 () Bool)

(assert (=> bm!36314 m!774685))

(declare-fun m!774687 () Bool)

(assert (=> b!831089 m!774687))

(declare-fun m!774689 () Bool)

(assert (=> b!831091 m!774689))

(declare-fun m!774691 () Bool)

(assert (=> d!105779 m!774691))

(declare-fun m!774693 () Bool)

(assert (=> d!105779 m!774693))

(declare-fun m!774695 () Bool)

(assert (=> b!831090 m!774695))

(assert (=> b!830623 d!105779))

(declare-fun d!105781 () Bool)

(declare-fun res!565772 () Bool)

(declare-fun e!463397 () Bool)

(assert (=> d!105781 (=> res!565772 e!463397)))

(assert (=> d!105781 (= res!565772 (and ((_ is Cons!15941) lt!376930) (= (_1!5086 (h!17070 lt!376930)) (_1!5086 lt!376677))))))

(assert (=> d!105781 (= (containsKey!401 lt!376930 (_1!5086 lt!376677)) e!463397)))

(declare-fun b!831099 () Bool)

(declare-fun e!463398 () Bool)

(assert (=> b!831099 (= e!463397 e!463398)))

(declare-fun res!565773 () Bool)

(assert (=> b!831099 (=> (not res!565773) (not e!463398))))

(assert (=> b!831099 (= res!565773 (and (or (not ((_ is Cons!15941) lt!376930)) (bvsle (_1!5086 (h!17070 lt!376930)) (_1!5086 lt!376677))) ((_ is Cons!15941) lt!376930) (bvslt (_1!5086 (h!17070 lt!376930)) (_1!5086 lt!376677))))))

(declare-fun b!831100 () Bool)

(assert (=> b!831100 (= e!463398 (containsKey!401 (t!22310 lt!376930) (_1!5086 lt!376677)))))

(assert (= (and d!105781 (not res!565772)) b!831099))

(assert (= (and b!831099 res!565773) b!831100))

(declare-fun m!774697 () Bool)

(assert (=> b!831100 m!774697))

(assert (=> b!830513 d!105781))

(declare-fun d!105783 () Bool)

(assert (=> d!105783 (= (get!11818 (getValueByKey!415 (toList!4502 lt!376795) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))) (v!10095 (getValueByKey!415 (toList!4502 lt!376795) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105559 d!105783))

(assert (=> d!105559 d!105751))

(declare-fun d!105785 () Bool)

(assert (=> d!105785 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))) lt!376860))))

(declare-fun lt!377173 () Unit!28429)

(assert (=> d!105785 (= lt!377173 (choose!1421 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))) lt!376860))))

(declare-fun e!463399 () Bool)

(assert (=> d!105785 e!463399))

(declare-fun res!565774 () Bool)

(assert (=> d!105785 (=> (not res!565774) (not e!463399))))

(assert (=> d!105785 (= res!565774 (isStrictlySorted!441 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859)))))))

(assert (=> d!105785 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))) lt!376860) lt!377173)))

(declare-fun b!831101 () Bool)

(assert (=> b!831101 (= e!463399 (containsKey!401 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))) lt!376860))))

(assert (= (and d!105785 res!565774) b!831101))

(assert (=> d!105785 m!774253))

(assert (=> d!105785 m!774253))

(assert (=> d!105785 m!774255))

(declare-fun m!774699 () Bool)

(assert (=> d!105785 m!774699))

(declare-fun m!774701 () Bool)

(assert (=> d!105785 m!774701))

(assert (=> b!831101 m!774249))

(assert (=> b!830753 d!105785))

(assert (=> b!830753 d!105647))

(assert (=> b!830753 d!105649))

(declare-fun d!105787 () Bool)

(declare-fun e!463400 () Bool)

(assert (=> d!105787 e!463400))

(declare-fun res!565775 () Bool)

(assert (=> d!105787 (=> res!565775 e!463400)))

(declare-fun lt!377174 () Bool)

(assert (=> d!105787 (= res!565775 (not lt!377174))))

(declare-fun lt!377176 () Bool)

(assert (=> d!105787 (= lt!377174 lt!377176)))

(declare-fun lt!377175 () Unit!28429)

(declare-fun e!463401 () Unit!28429)

(assert (=> d!105787 (= lt!377175 e!463401)))

(declare-fun c!90138 () Bool)

(assert (=> d!105787 (= c!90138 lt!377176)))

(assert (=> d!105787 (= lt!377176 (containsKey!401 (toList!4502 (+!1980 lt!376981 (tuple2!10151 lt!376980 lt!376978))) lt!376979))))

(assert (=> d!105787 (= (contains!4208 (+!1980 lt!376981 (tuple2!10151 lt!376980 lt!376978)) lt!376979) lt!377174)))

(declare-fun b!831102 () Bool)

(declare-fun lt!377177 () Unit!28429)

(assert (=> b!831102 (= e!463401 lt!377177)))

(assert (=> b!831102 (= lt!377177 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 (+!1980 lt!376981 (tuple2!10151 lt!376980 lt!376978))) lt!376979))))

(assert (=> b!831102 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376981 (tuple2!10151 lt!376980 lt!376978))) lt!376979))))

(declare-fun b!831103 () Bool)

(declare-fun Unit!28465 () Unit!28429)

(assert (=> b!831103 (= e!463401 Unit!28465)))

(declare-fun b!831104 () Bool)

(assert (=> b!831104 (= e!463400 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376981 (tuple2!10151 lt!376980 lt!376978))) lt!376979)))))

(assert (= (and d!105787 c!90138) b!831102))

(assert (= (and d!105787 (not c!90138)) b!831103))

(assert (= (and d!105787 (not res!565775)) b!831104))

(declare-fun m!774703 () Bool)

(assert (=> d!105787 m!774703))

(declare-fun m!774705 () Bool)

(assert (=> b!831102 m!774705))

(declare-fun m!774707 () Bool)

(assert (=> b!831102 m!774707))

(assert (=> b!831102 m!774707))

(declare-fun m!774709 () Bool)

(assert (=> b!831102 m!774709))

(assert (=> b!831104 m!774707))

(assert (=> b!831104 m!774707))

(assert (=> b!831104 m!774709))

(assert (=> b!830578 d!105787))

(declare-fun d!105789 () Bool)

(declare-fun e!463402 () Bool)

(assert (=> d!105789 e!463402))

(declare-fun res!565777 () Bool)

(assert (=> d!105789 (=> (not res!565777) (not e!463402))))

(declare-fun lt!377181 () ListLongMap!8973)

(assert (=> d!105789 (= res!565777 (contains!4208 lt!377181 (_1!5086 (tuple2!10151 lt!376980 lt!376978))))))

(declare-fun lt!377178 () List!15945)

(assert (=> d!105789 (= lt!377181 (ListLongMap!8974 lt!377178))))

(declare-fun lt!377180 () Unit!28429)

(declare-fun lt!377179 () Unit!28429)

(assert (=> d!105789 (= lt!377180 lt!377179)))

(assert (=> d!105789 (= (getValueByKey!415 lt!377178 (_1!5086 (tuple2!10151 lt!376980 lt!376978))) (Some!420 (_2!5086 (tuple2!10151 lt!376980 lt!376978))))))

(assert (=> d!105789 (= lt!377179 (lemmaContainsTupThenGetReturnValue!229 lt!377178 (_1!5086 (tuple2!10151 lt!376980 lt!376978)) (_2!5086 (tuple2!10151 lt!376980 lt!376978))))))

(assert (=> d!105789 (= lt!377178 (insertStrictlySorted!268 (toList!4502 lt!376981) (_1!5086 (tuple2!10151 lt!376980 lt!376978)) (_2!5086 (tuple2!10151 lt!376980 lt!376978))))))

(assert (=> d!105789 (= (+!1980 lt!376981 (tuple2!10151 lt!376980 lt!376978)) lt!377181)))

(declare-fun b!831105 () Bool)

(declare-fun res!565776 () Bool)

(assert (=> b!831105 (=> (not res!565776) (not e!463402))))

(assert (=> b!831105 (= res!565776 (= (getValueByKey!415 (toList!4502 lt!377181) (_1!5086 (tuple2!10151 lt!376980 lt!376978))) (Some!420 (_2!5086 (tuple2!10151 lt!376980 lt!376978)))))))

(declare-fun b!831106 () Bool)

(assert (=> b!831106 (= e!463402 (contains!4209 (toList!4502 lt!377181) (tuple2!10151 lt!376980 lt!376978)))))

(assert (= (and d!105789 res!565777) b!831105))

(assert (= (and b!831105 res!565776) b!831106))

(declare-fun m!774711 () Bool)

(assert (=> d!105789 m!774711))

(declare-fun m!774713 () Bool)

(assert (=> d!105789 m!774713))

(declare-fun m!774715 () Bool)

(assert (=> d!105789 m!774715))

(declare-fun m!774717 () Bool)

(assert (=> d!105789 m!774717))

(declare-fun m!774719 () Bool)

(assert (=> b!831105 m!774719))

(declare-fun m!774721 () Bool)

(assert (=> b!831106 m!774721))

(assert (=> b!830578 d!105789))

(assert (=> b!830578 d!105705))

(declare-fun d!105791 () Bool)

(assert (=> d!105791 (not (contains!4208 (+!1980 lt!376981 (tuple2!10151 lt!376980 lt!376978)) lt!376979))))

(declare-fun lt!377182 () Unit!28429)

(assert (=> d!105791 (= lt!377182 (choose!1417 lt!376981 lt!376980 lt!376978 lt!376979))))

(declare-fun e!463403 () Bool)

(assert (=> d!105791 e!463403))

(declare-fun res!565778 () Bool)

(assert (=> d!105791 (=> (not res!565778) (not e!463403))))

(assert (=> d!105791 (= res!565778 (not (contains!4208 lt!376981 lt!376979)))))

(assert (=> d!105791 (= (addStillNotContains!197 lt!376981 lt!376980 lt!376978 lt!376979) lt!377182)))

(declare-fun b!831107 () Bool)

(assert (=> b!831107 (= e!463403 (not (= lt!376980 lt!376979)))))

(assert (= (and d!105791 res!565778) b!831107))

(assert (=> d!105791 m!773889))

(assert (=> d!105791 m!773889))

(assert (=> d!105791 m!773893))

(declare-fun m!774723 () Bool)

(assert (=> d!105791 m!774723))

(declare-fun m!774725 () Bool)

(assert (=> d!105791 m!774725))

(assert (=> b!830578 d!105791))

(declare-fun d!105793 () Bool)

(declare-fun e!463404 () Bool)

(assert (=> d!105793 e!463404))

(declare-fun res!565780 () Bool)

(assert (=> d!105793 (=> (not res!565780) (not e!463404))))

(declare-fun lt!377186 () ListLongMap!8973)

(assert (=> d!105793 (= res!565780 (contains!4208 lt!377186 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377183 () List!15945)

(assert (=> d!105793 (= lt!377186 (ListLongMap!8974 lt!377183))))

(declare-fun lt!377185 () Unit!28429)

(declare-fun lt!377184 () Unit!28429)

(assert (=> d!105793 (= lt!377185 lt!377184)))

(assert (=> d!105793 (= (getValueByKey!415 lt!377183 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!420 (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105793 (= lt!377184 (lemmaContainsTupThenGetReturnValue!229 lt!377183 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105793 (= lt!377183 (insertStrictlySorted!268 (toList!4502 call!36274) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105793 (= (+!1980 call!36274 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377186)))

(declare-fun b!831108 () Bool)

(declare-fun res!565779 () Bool)

(assert (=> b!831108 (=> (not res!565779) (not e!463404))))

(assert (=> b!831108 (= res!565779 (= (getValueByKey!415 (toList!4502 lt!377186) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!420 (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!831109 () Bool)

(assert (=> b!831109 (= e!463404 (contains!4209 (toList!4502 lt!377186) (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105793 res!565780) b!831108))

(assert (= (and b!831108 res!565779) b!831109))

(declare-fun m!774727 () Bool)

(assert (=> d!105793 m!774727))

(declare-fun m!774729 () Bool)

(assert (=> d!105793 m!774729))

(declare-fun m!774731 () Bool)

(assert (=> d!105793 m!774731))

(declare-fun m!774733 () Bool)

(assert (=> d!105793 m!774733))

(declare-fun m!774735 () Bool)

(assert (=> b!831108 m!774735))

(declare-fun m!774737 () Bool)

(assert (=> b!831109 m!774737))

(assert (=> b!830578 d!105793))

(declare-fun d!105795 () Bool)

(assert (=> d!105795 (= (get!11818 (getValueByKey!415 (toList!4502 lt!376790) lt!376799)) (v!10095 (getValueByKey!415 (toList!4502 lt!376790) lt!376799)))))

(assert (=> d!105471 d!105795))

(declare-fun b!831111 () Bool)

(declare-fun e!463405 () Option!421)

(declare-fun e!463406 () Option!421)

(assert (=> b!831111 (= e!463405 e!463406)))

(declare-fun c!90140 () Bool)

(assert (=> b!831111 (= c!90140 (and ((_ is Cons!15941) (toList!4502 lt!376790)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376790))) lt!376799))))))

(declare-fun b!831112 () Bool)

(assert (=> b!831112 (= e!463406 (getValueByKey!415 (t!22310 (toList!4502 lt!376790)) lt!376799))))

(declare-fun b!831113 () Bool)

(assert (=> b!831113 (= e!463406 None!419)))

(declare-fun b!831110 () Bool)

(assert (=> b!831110 (= e!463405 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376790)))))))

(declare-fun d!105797 () Bool)

(declare-fun c!90139 () Bool)

(assert (=> d!105797 (= c!90139 (and ((_ is Cons!15941) (toList!4502 lt!376790)) (= (_1!5086 (h!17070 (toList!4502 lt!376790))) lt!376799)))))

(assert (=> d!105797 (= (getValueByKey!415 (toList!4502 lt!376790) lt!376799) e!463405)))

(assert (= (and d!105797 c!90139) b!831110))

(assert (= (and d!105797 (not c!90139)) b!831111))

(assert (= (and b!831111 c!90140) b!831112))

(assert (= (and b!831111 (not c!90140)) b!831113))

(declare-fun m!774739 () Bool)

(assert (=> b!831112 m!774739))

(assert (=> d!105471 d!105797))

(declare-fun d!105799 () Bool)

(assert (=> d!105799 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376737) (_1!5086 lt!376679)))))

(declare-fun lt!377187 () Unit!28429)

(assert (=> d!105799 (= lt!377187 (choose!1421 (toList!4502 lt!376737) (_1!5086 lt!376679)))))

(declare-fun e!463407 () Bool)

(assert (=> d!105799 e!463407))

(declare-fun res!565781 () Bool)

(assert (=> d!105799 (=> (not res!565781) (not e!463407))))

(assert (=> d!105799 (= res!565781 (isStrictlySorted!441 (toList!4502 lt!376737)))))

(assert (=> d!105799 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376737) (_1!5086 lt!376679)) lt!377187)))

(declare-fun b!831114 () Bool)

(assert (=> b!831114 (= e!463407 (containsKey!401 (toList!4502 lt!376737) (_1!5086 lt!376679)))))

(assert (= (and d!105799 res!565781) b!831114))

(assert (=> d!105799 m!773389))

(assert (=> d!105799 m!773389))

(assert (=> d!105799 m!774047))

(declare-fun m!774741 () Bool)

(assert (=> d!105799 m!774741))

(declare-fun m!774743 () Bool)

(assert (=> d!105799 m!774743))

(assert (=> b!831114 m!774043))

(assert (=> b!830632 d!105799))

(declare-fun d!105801 () Bool)

(assert (=> d!105801 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376737) (_1!5086 lt!376679))) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376737) (_1!5086 lt!376679)))))))

(declare-fun bs!23225 () Bool)

(assert (= bs!23225 d!105801))

(assert (=> bs!23225 m!773389))

(declare-fun m!774745 () Bool)

(assert (=> bs!23225 m!774745))

(assert (=> b!830632 d!105801))

(assert (=> b!830632 d!105549))

(declare-fun d!105803 () Bool)

(assert (=> d!105803 (= (isEmpty!655 (toList!4502 lt!376863)) ((_ is Nil!15942) (toList!4502 lt!376863)))))

(assert (=> d!105529 d!105803))

(declare-fun d!105805 () Bool)

(declare-fun lt!377188 () Bool)

(assert (=> d!105805 (= lt!377188 (select (content!386 (toList!4502 lt!376909)) (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!463409 () Bool)

(assert (=> d!105805 (= lt!377188 e!463409)))

(declare-fun res!565782 () Bool)

(assert (=> d!105805 (=> (not res!565782) (not e!463409))))

(assert (=> d!105805 (= res!565782 ((_ is Cons!15941) (toList!4502 lt!376909)))))

(assert (=> d!105805 (= (contains!4209 (toList!4502 lt!376909) (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377188)))

(declare-fun b!831115 () Bool)

(declare-fun e!463408 () Bool)

(assert (=> b!831115 (= e!463409 e!463408)))

(declare-fun res!565783 () Bool)

(assert (=> b!831115 (=> res!565783 e!463408)))

(assert (=> b!831115 (= res!565783 (= (h!17070 (toList!4502 lt!376909)) (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!831116 () Bool)

(assert (=> b!831116 (= e!463408 (contains!4209 (t!22310 (toList!4502 lt!376909)) (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105805 res!565782) b!831115))

(assert (= (and b!831115 (not res!565783)) b!831116))

(declare-fun m!774747 () Bool)

(assert (=> d!105805 m!774747))

(declare-fun m!774749 () Bool)

(assert (=> d!105805 m!774749))

(declare-fun m!774751 () Bool)

(assert (=> b!831116 m!774751))

(assert (=> b!830462 d!105805))

(declare-fun d!105807 () Bool)

(declare-fun e!463410 () Bool)

(assert (=> d!105807 e!463410))

(declare-fun res!565784 () Bool)

(assert (=> d!105807 (=> res!565784 e!463410)))

(declare-fun lt!377189 () Bool)

(assert (=> d!105807 (= res!565784 (not lt!377189))))

(declare-fun lt!377191 () Bool)

(assert (=> d!105807 (= lt!377189 lt!377191)))

(declare-fun lt!377190 () Unit!28429)

(declare-fun e!463411 () Unit!28429)

(assert (=> d!105807 (= lt!377190 e!463411)))

(declare-fun c!90141 () Bool)

(assert (=> d!105807 (= c!90141 lt!377191)))

(assert (=> d!105807 (= lt!377191 (containsKey!401 (toList!4502 lt!376790) lt!376799))))

(assert (=> d!105807 (= (contains!4208 lt!376790 lt!376799) lt!377189)))

(declare-fun b!831117 () Bool)

(declare-fun lt!377192 () Unit!28429)

(assert (=> b!831117 (= e!463411 lt!377192)))

(assert (=> b!831117 (= lt!377192 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376790) lt!376799))))

(assert (=> b!831117 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376790) lt!376799))))

(declare-fun b!831118 () Bool)

(declare-fun Unit!28466 () Unit!28429)

(assert (=> b!831118 (= e!463411 Unit!28466)))

(declare-fun b!831119 () Bool)

(assert (=> b!831119 (= e!463410 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376790) lt!376799)))))

(assert (= (and d!105807 c!90141) b!831117))

(assert (= (and d!105807 (not c!90141)) b!831118))

(assert (= (and d!105807 (not res!565784)) b!831119))

(declare-fun m!774753 () Bool)

(assert (=> d!105807 m!774753))

(declare-fun m!774755 () Bool)

(assert (=> b!831117 m!774755))

(assert (=> b!831117 m!773931))

(assert (=> b!831117 m!773931))

(declare-fun m!774757 () Bool)

(assert (=> b!831117 m!774757))

(assert (=> b!831119 m!773931))

(assert (=> b!831119 m!773931))

(assert (=> b!831119 m!774757))

(assert (=> d!105487 d!105807))

(assert (=> d!105487 d!105463))

(assert (=> d!105487 d!105471))

(declare-fun d!105809 () Bool)

(assert (=> d!105809 (= (apply!372 (+!1980 lt!376790 (tuple2!10151 lt!376791 minValue!754)) lt!376799) (apply!372 lt!376790 lt!376799))))

(assert (=> d!105809 true))

(declare-fun _$34!1142 () Unit!28429)

(assert (=> d!105809 (= (choose!1419 lt!376790 lt!376791 minValue!754 lt!376799) _$34!1142)))

(declare-fun bs!23226 () Bool)

(assert (= bs!23226 d!105809))

(assert (=> bs!23226 m!773413))

(assert (=> bs!23226 m!773413))

(assert (=> bs!23226 m!773419))

(assert (=> bs!23226 m!773399))

(assert (=> d!105487 d!105809))

(assert (=> d!105487 d!105477))

(declare-fun d!105811 () Bool)

(assert (=> d!105811 (= (get!11818 (getValueByKey!415 (toList!4502 (+!1980 lt!376812 (tuple2!10151 lt!376813 minValue!754))) lt!376821)) (v!10095 (getValueByKey!415 (toList!4502 (+!1980 lt!376812 (tuple2!10151 lt!376813 minValue!754))) lt!376821)))))

(assert (=> d!105429 d!105811))

(declare-fun b!831122 () Bool)

(declare-fun e!463412 () Option!421)

(declare-fun e!463413 () Option!421)

(assert (=> b!831122 (= e!463412 e!463413)))

(declare-fun c!90143 () Bool)

(assert (=> b!831122 (= c!90143 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376812 (tuple2!10151 lt!376813 minValue!754)))) (not (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376812 (tuple2!10151 lt!376813 minValue!754))))) lt!376821))))))

(declare-fun b!831123 () Bool)

(assert (=> b!831123 (= e!463413 (getValueByKey!415 (t!22310 (toList!4502 (+!1980 lt!376812 (tuple2!10151 lt!376813 minValue!754)))) lt!376821))))

(declare-fun b!831124 () Bool)

(assert (=> b!831124 (= e!463413 None!419)))

(declare-fun b!831121 () Bool)

(assert (=> b!831121 (= e!463412 (Some!420 (_2!5086 (h!17070 (toList!4502 (+!1980 lt!376812 (tuple2!10151 lt!376813 minValue!754)))))))))

(declare-fun c!90142 () Bool)

(declare-fun d!105813 () Bool)

(assert (=> d!105813 (= c!90142 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376812 (tuple2!10151 lt!376813 minValue!754)))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376812 (tuple2!10151 lt!376813 minValue!754))))) lt!376821)))))

(assert (=> d!105813 (= (getValueByKey!415 (toList!4502 (+!1980 lt!376812 (tuple2!10151 lt!376813 minValue!754))) lt!376821) e!463412)))

(assert (= (and d!105813 c!90142) b!831121))

(assert (= (and d!105813 (not c!90142)) b!831122))

(assert (= (and b!831122 c!90143) b!831123))

(assert (= (and b!831122 (not c!90143)) b!831124))

(declare-fun m!774759 () Bool)

(assert (=> b!831123 m!774759))

(assert (=> d!105429 d!105813))

(declare-fun d!105815 () Bool)

(declare-fun lt!377193 () Bool)

(assert (=> d!105815 (= lt!377193 (select (content!386 (toList!4502 lt!376966)) (tuple2!10151 lt!376814 zeroValueAfter!34)))))

(declare-fun e!463415 () Bool)

(assert (=> d!105815 (= lt!377193 e!463415)))

(declare-fun res!565785 () Bool)

(assert (=> d!105815 (=> (not res!565785) (not e!463415))))

(assert (=> d!105815 (= res!565785 ((_ is Cons!15941) (toList!4502 lt!376966)))))

(assert (=> d!105815 (= (contains!4209 (toList!4502 lt!376966) (tuple2!10151 lt!376814 zeroValueAfter!34)) lt!377193)))

(declare-fun b!831125 () Bool)

(declare-fun e!463414 () Bool)

(assert (=> b!831125 (= e!463415 e!463414)))

(declare-fun res!565786 () Bool)

(assert (=> b!831125 (=> res!565786 e!463414)))

(assert (=> b!831125 (= res!565786 (= (h!17070 (toList!4502 lt!376966)) (tuple2!10151 lt!376814 zeroValueAfter!34)))))

(declare-fun b!831126 () Bool)

(assert (=> b!831126 (= e!463414 (contains!4209 (t!22310 (toList!4502 lt!376966)) (tuple2!10151 lt!376814 zeroValueAfter!34)))))

(assert (= (and d!105815 res!565785) b!831125))

(assert (= (and b!831125 (not res!565786)) b!831126))

(declare-fun m!774761 () Bool)

(assert (=> d!105815 m!774761))

(declare-fun m!774763 () Bool)

(assert (=> d!105815 m!774763))

(declare-fun m!774765 () Bool)

(assert (=> b!831126 m!774765))

(assert (=> b!830563 d!105815))

(declare-fun d!105817 () Bool)

(declare-fun e!463416 () Bool)

(assert (=> d!105817 e!463416))

(declare-fun res!565787 () Bool)

(assert (=> d!105817 (=> res!565787 e!463416)))

(declare-fun lt!377194 () Bool)

(assert (=> d!105817 (= res!565787 (not lt!377194))))

(declare-fun lt!377196 () Bool)

(assert (=> d!105817 (= lt!377194 lt!377196)))

(declare-fun lt!377195 () Unit!28429)

(declare-fun e!463417 () Unit!28429)

(assert (=> d!105817 (= lt!377195 e!463417)))

(declare-fun c!90144 () Bool)

(assert (=> d!105817 (= c!90144 lt!377196)))

(assert (=> d!105817 (= lt!377196 (containsKey!401 (toList!4502 lt!376961) (_1!5086 (tuple2!10151 lt!376813 minValue!754))))))

(assert (=> d!105817 (= (contains!4208 lt!376961 (_1!5086 (tuple2!10151 lt!376813 minValue!754))) lt!377194)))

(declare-fun b!831127 () Bool)

(declare-fun lt!377197 () Unit!28429)

(assert (=> b!831127 (= e!463417 lt!377197)))

(assert (=> b!831127 (= lt!377197 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376961) (_1!5086 (tuple2!10151 lt!376813 minValue!754))))))

(assert (=> b!831127 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376961) (_1!5086 (tuple2!10151 lt!376813 minValue!754))))))

(declare-fun b!831128 () Bool)

(declare-fun Unit!28467 () Unit!28429)

(assert (=> b!831128 (= e!463417 Unit!28467)))

(declare-fun b!831129 () Bool)

(assert (=> b!831129 (= e!463416 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376961) (_1!5086 (tuple2!10151 lt!376813 minValue!754)))))))

(assert (= (and d!105817 c!90144) b!831127))

(assert (= (and d!105817 (not c!90144)) b!831128))

(assert (= (and d!105817 (not res!565787)) b!831129))

(declare-fun m!774767 () Bool)

(assert (=> d!105817 m!774767))

(declare-fun m!774769 () Bool)

(assert (=> b!831127 m!774769))

(assert (=> b!831127 m!773827))

(assert (=> b!831127 m!773827))

(declare-fun m!774771 () Bool)

(assert (=> b!831127 m!774771))

(assert (=> b!831129 m!773827))

(assert (=> b!831129 m!773827))

(assert (=> b!831129 m!774771))

(assert (=> d!105447 d!105817))

(declare-fun b!831131 () Bool)

(declare-fun e!463418 () Option!421)

(declare-fun e!463419 () Option!421)

(assert (=> b!831131 (= e!463418 e!463419)))

(declare-fun c!90146 () Bool)

(assert (=> b!831131 (= c!90146 (and ((_ is Cons!15941) lt!376958) (not (= (_1!5086 (h!17070 lt!376958)) (_1!5086 (tuple2!10151 lt!376813 minValue!754))))))))

(declare-fun b!831132 () Bool)

(assert (=> b!831132 (= e!463419 (getValueByKey!415 (t!22310 lt!376958) (_1!5086 (tuple2!10151 lt!376813 minValue!754))))))

(declare-fun b!831133 () Bool)

(assert (=> b!831133 (= e!463419 None!419)))

(declare-fun b!831130 () Bool)

(assert (=> b!831130 (= e!463418 (Some!420 (_2!5086 (h!17070 lt!376958))))))

(declare-fun c!90145 () Bool)

(declare-fun d!105819 () Bool)

(assert (=> d!105819 (= c!90145 (and ((_ is Cons!15941) lt!376958) (= (_1!5086 (h!17070 lt!376958)) (_1!5086 (tuple2!10151 lt!376813 minValue!754)))))))

(assert (=> d!105819 (= (getValueByKey!415 lt!376958 (_1!5086 (tuple2!10151 lt!376813 minValue!754))) e!463418)))

(assert (= (and d!105819 c!90145) b!831130))

(assert (= (and d!105819 (not c!90145)) b!831131))

(assert (= (and b!831131 c!90146) b!831132))

(assert (= (and b!831131 (not c!90146)) b!831133))

(declare-fun m!774773 () Bool)

(assert (=> b!831132 m!774773))

(assert (=> d!105447 d!105819))

(declare-fun d!105821 () Bool)

(assert (=> d!105821 (= (getValueByKey!415 lt!376958 (_1!5086 (tuple2!10151 lt!376813 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 lt!376813 minValue!754))))))

(declare-fun lt!377198 () Unit!28429)

(assert (=> d!105821 (= lt!377198 (choose!1418 lt!376958 (_1!5086 (tuple2!10151 lt!376813 minValue!754)) (_2!5086 (tuple2!10151 lt!376813 minValue!754))))))

(declare-fun e!463420 () Bool)

(assert (=> d!105821 e!463420))

(declare-fun res!565788 () Bool)

(assert (=> d!105821 (=> (not res!565788) (not e!463420))))

(assert (=> d!105821 (= res!565788 (isStrictlySorted!441 lt!376958))))

(assert (=> d!105821 (= (lemmaContainsTupThenGetReturnValue!229 lt!376958 (_1!5086 (tuple2!10151 lt!376813 minValue!754)) (_2!5086 (tuple2!10151 lt!376813 minValue!754))) lt!377198)))

(declare-fun b!831134 () Bool)

(declare-fun res!565789 () Bool)

(assert (=> b!831134 (=> (not res!565789) (not e!463420))))

(assert (=> b!831134 (= res!565789 (containsKey!401 lt!376958 (_1!5086 (tuple2!10151 lt!376813 minValue!754))))))

(declare-fun b!831135 () Bool)

(assert (=> b!831135 (= e!463420 (contains!4209 lt!376958 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376813 minValue!754)) (_2!5086 (tuple2!10151 lt!376813 minValue!754)))))))

(assert (= (and d!105821 res!565788) b!831134))

(assert (= (and b!831134 res!565789) b!831135))

(assert (=> d!105821 m!773821))

(declare-fun m!774775 () Bool)

(assert (=> d!105821 m!774775))

(declare-fun m!774777 () Bool)

(assert (=> d!105821 m!774777))

(declare-fun m!774779 () Bool)

(assert (=> b!831134 m!774779))

(declare-fun m!774781 () Bool)

(assert (=> b!831135 m!774781))

(assert (=> d!105447 d!105821))

(declare-fun d!105823 () Bool)

(declare-fun e!463423 () Bool)

(assert (=> d!105823 e!463423))

(declare-fun res!565791 () Bool)

(assert (=> d!105823 (=> (not res!565791) (not e!463423))))

(declare-fun lt!377199 () List!15945)

(assert (=> d!105823 (= res!565791 (isStrictlySorted!441 lt!377199))))

(declare-fun e!463424 () List!15945)

(assert (=> d!105823 (= lt!377199 e!463424)))

(declare-fun c!90150 () Bool)

(assert (=> d!105823 (= c!90150 (and ((_ is Cons!15941) (toList!4502 lt!376812)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376812))) (_1!5086 (tuple2!10151 lt!376813 minValue!754)))))))

(assert (=> d!105823 (isStrictlySorted!441 (toList!4502 lt!376812))))

(assert (=> d!105823 (= (insertStrictlySorted!268 (toList!4502 lt!376812) (_1!5086 (tuple2!10151 lt!376813 minValue!754)) (_2!5086 (tuple2!10151 lt!376813 minValue!754))) lt!377199)))

(declare-fun b!831136 () Bool)

(declare-fun res!565790 () Bool)

(assert (=> b!831136 (=> (not res!565790) (not e!463423))))

(assert (=> b!831136 (= res!565790 (containsKey!401 lt!377199 (_1!5086 (tuple2!10151 lt!376813 minValue!754))))))

(declare-fun e!463422 () List!15945)

(declare-fun b!831137 () Bool)

(assert (=> b!831137 (= e!463422 (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376812)) (_1!5086 (tuple2!10151 lt!376813 minValue!754)) (_2!5086 (tuple2!10151 lt!376813 minValue!754))))))

(declare-fun call!36322 () List!15945)

(declare-fun bm!36317 () Bool)

(assert (=> bm!36317 (= call!36322 ($colon$colon!536 e!463422 (ite c!90150 (h!17070 (toList!4502 lt!376812)) (tuple2!10151 (_1!5086 (tuple2!10151 lt!376813 minValue!754)) (_2!5086 (tuple2!10151 lt!376813 minValue!754))))))))

(declare-fun c!90149 () Bool)

(assert (=> bm!36317 (= c!90149 c!90150)))

(declare-fun b!831138 () Bool)

(assert (=> b!831138 (= e!463423 (contains!4209 lt!377199 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376813 minValue!754)) (_2!5086 (tuple2!10151 lt!376813 minValue!754)))))))

(declare-fun c!90148 () Bool)

(declare-fun c!90147 () Bool)

(declare-fun b!831139 () Bool)

(assert (=> b!831139 (= e!463422 (ite c!90147 (t!22310 (toList!4502 lt!376812)) (ite c!90148 (Cons!15941 (h!17070 (toList!4502 lt!376812)) (t!22310 (toList!4502 lt!376812))) Nil!15942)))))

(declare-fun b!831140 () Bool)

(declare-fun e!463421 () List!15945)

(declare-fun call!36321 () List!15945)

(assert (=> b!831140 (= e!463421 call!36321)))

(declare-fun bm!36318 () Bool)

(declare-fun call!36320 () List!15945)

(assert (=> bm!36318 (= call!36321 call!36320)))

(declare-fun bm!36319 () Bool)

(assert (=> bm!36319 (= call!36320 call!36322)))

(declare-fun b!831141 () Bool)

(assert (=> b!831141 (= e!463421 call!36321)))

(declare-fun b!831142 () Bool)

(assert (=> b!831142 (= e!463424 call!36322)))

(declare-fun b!831143 () Bool)

(declare-fun e!463425 () List!15945)

(assert (=> b!831143 (= e!463425 call!36320)))

(declare-fun b!831144 () Bool)

(assert (=> b!831144 (= c!90148 (and ((_ is Cons!15941) (toList!4502 lt!376812)) (bvsgt (_1!5086 (h!17070 (toList!4502 lt!376812))) (_1!5086 (tuple2!10151 lt!376813 minValue!754)))))))

(assert (=> b!831144 (= e!463425 e!463421)))

(declare-fun b!831145 () Bool)

(assert (=> b!831145 (= e!463424 e!463425)))

(assert (=> b!831145 (= c!90147 (and ((_ is Cons!15941) (toList!4502 lt!376812)) (= (_1!5086 (h!17070 (toList!4502 lt!376812))) (_1!5086 (tuple2!10151 lt!376813 minValue!754)))))))

(assert (= (and d!105823 c!90150) b!831142))

(assert (= (and d!105823 (not c!90150)) b!831145))

(assert (= (and b!831145 c!90147) b!831143))

(assert (= (and b!831145 (not c!90147)) b!831144))

(assert (= (and b!831144 c!90148) b!831141))

(assert (= (and b!831144 (not c!90148)) b!831140))

(assert (= (or b!831141 b!831140) bm!36318))

(assert (= (or b!831143 bm!36318) bm!36319))

(assert (= (or b!831142 bm!36319) bm!36317))

(assert (= (and bm!36317 c!90149) b!831137))

(assert (= (and bm!36317 (not c!90149)) b!831139))

(assert (= (and d!105823 res!565791) b!831136))

(assert (= (and b!831136 res!565790) b!831138))

(declare-fun m!774783 () Bool)

(assert (=> bm!36317 m!774783))

(declare-fun m!774785 () Bool)

(assert (=> b!831136 m!774785))

(declare-fun m!774787 () Bool)

(assert (=> b!831138 m!774787))

(declare-fun m!774789 () Bool)

(assert (=> d!105823 m!774789))

(declare-fun m!774791 () Bool)

(assert (=> d!105823 m!774791))

(declare-fun m!774793 () Bool)

(assert (=> b!831137 m!774793))

(assert (=> d!105447 d!105823))

(declare-fun d!105825 () Bool)

(assert (=> d!105825 (arrayContainsKey!0 _keys!976 lt!377095 #b00000000000000000000000000000000)))

(declare-fun lt!377200 () Unit!28429)

(assert (=> d!105825 (= lt!377200 (choose!13 _keys!976 lt!377095 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!105825 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!105825 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377095 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!377200)))

(declare-fun bs!23227 () Bool)

(assert (= bs!23227 d!105825))

(assert (=> bs!23227 m!774277))

(declare-fun m!774795 () Bool)

(assert (=> bs!23227 m!774795))

(assert (=> b!830761 d!105825))

(declare-fun d!105827 () Bool)

(declare-fun res!565792 () Bool)

(declare-fun e!463426 () Bool)

(assert (=> d!105827 (=> res!565792 e!463426)))

(assert (=> d!105827 (= res!565792 (= (select (arr!22328 _keys!976) #b00000000000000000000000000000000) lt!377095))))

(assert (=> d!105827 (= (arrayContainsKey!0 _keys!976 lt!377095 #b00000000000000000000000000000000) e!463426)))

(declare-fun b!831146 () Bool)

(declare-fun e!463427 () Bool)

(assert (=> b!831146 (= e!463426 e!463427)))

(declare-fun res!565793 () Bool)

(assert (=> b!831146 (=> (not res!565793) (not e!463427))))

(assert (=> b!831146 (= res!565793 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(declare-fun b!831147 () Bool)

(assert (=> b!831147 (= e!463427 (arrayContainsKey!0 _keys!976 lt!377095 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!105827 (not res!565792)) b!831146))

(assert (= (and b!831146 res!565793) b!831147))

(assert (=> d!105827 m!773353))

(declare-fun m!774797 () Bool)

(assert (=> b!831147 m!774797))

(assert (=> b!830761 d!105827))

(declare-fun b!831148 () Bool)

(declare-fun e!463430 () SeekEntryResult!8744)

(declare-fun lt!377201 () SeekEntryResult!8744)

(assert (=> b!831148 (= e!463430 (Found!8744 (index!37349 lt!377201)))))

(declare-fun b!831149 () Bool)

(declare-fun e!463428 () SeekEntryResult!8744)

(assert (=> b!831149 (= e!463428 (seekKeyOrZeroReturnVacant!0 (x!70109 lt!377201) (index!37349 lt!377201) (index!37349 lt!377201) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312))))

(declare-fun b!831150 () Bool)

(declare-fun e!463429 () SeekEntryResult!8744)

(assert (=> b!831150 (= e!463429 e!463430)))

(declare-fun lt!377203 () (_ BitVec 64))

(assert (=> b!831150 (= lt!377203 (select (arr!22328 _keys!976) (index!37349 lt!377201)))))

(declare-fun c!90152 () Bool)

(assert (=> b!831150 (= c!90152 (= lt!377203 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!105829 () Bool)

(declare-fun lt!377202 () SeekEntryResult!8744)

(assert (=> d!105829 (and (or ((_ is Undefined!8744) lt!377202) (not ((_ is Found!8744) lt!377202)) (and (bvsge (index!37348 lt!377202) #b00000000000000000000000000000000) (bvslt (index!37348 lt!377202) (size!22749 _keys!976)))) (or ((_ is Undefined!8744) lt!377202) ((_ is Found!8744) lt!377202) (not ((_ is MissingZero!8744) lt!377202)) (and (bvsge (index!37347 lt!377202) #b00000000000000000000000000000000) (bvslt (index!37347 lt!377202) (size!22749 _keys!976)))) (or ((_ is Undefined!8744) lt!377202) ((_ is Found!8744) lt!377202) ((_ is MissingZero!8744) lt!377202) (not ((_ is MissingVacant!8744) lt!377202)) (and (bvsge (index!37350 lt!377202) #b00000000000000000000000000000000) (bvslt (index!37350 lt!377202) (size!22749 _keys!976)))) (or ((_ is Undefined!8744) lt!377202) (ite ((_ is Found!8744) lt!377202) (= (select (arr!22328 _keys!976) (index!37348 lt!377202)) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!8744) lt!377202) (= (select (arr!22328 _keys!976) (index!37347 lt!377202)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8744) lt!377202) (= (select (arr!22328 _keys!976) (index!37350 lt!377202)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105829 (= lt!377202 e!463429)))

(declare-fun c!90151 () Bool)

(assert (=> d!105829 (= c!90151 (and ((_ is Intermediate!8744) lt!377201) (undefined!9556 lt!377201)))))

(assert (=> d!105829 (= lt!377201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!1312) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312))))

(assert (=> d!105829 (validMask!0 mask!1312)))

(assert (=> d!105829 (= (seekEntryOrOpen!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312) lt!377202)))

(declare-fun b!831151 () Bool)

(assert (=> b!831151 (= e!463429 Undefined!8744)))

(declare-fun b!831152 () Bool)

(declare-fun c!90153 () Bool)

(assert (=> b!831152 (= c!90153 (= lt!377203 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831152 (= e!463430 e!463428)))

(declare-fun b!831153 () Bool)

(assert (=> b!831153 (= e!463428 (MissingZero!8744 (index!37349 lt!377201)))))

(assert (= (and d!105829 c!90151) b!831151))

(assert (= (and d!105829 (not c!90151)) b!831150))

(assert (= (and b!831150 c!90152) b!831148))

(assert (= (and b!831150 (not c!90152)) b!831152))

(assert (= (and b!831152 c!90153) b!831153))

(assert (= (and b!831152 (not c!90153)) b!831149))

(assert (=> b!831149 m!773859))

(declare-fun m!774799 () Bool)

(assert (=> b!831149 m!774799))

(declare-fun m!774801 () Bool)

(assert (=> b!831150 m!774801))

(assert (=> d!105829 m!773289))

(declare-fun m!774803 () Bool)

(assert (=> d!105829 m!774803))

(declare-fun m!774805 () Bool)

(assert (=> d!105829 m!774805))

(declare-fun m!774807 () Bool)

(assert (=> d!105829 m!774807))

(assert (=> d!105829 m!773859))

(declare-fun m!774809 () Bool)

(assert (=> d!105829 m!774809))

(declare-fun m!774811 () Bool)

(assert (=> d!105829 m!774811))

(assert (=> d!105829 m!773859))

(assert (=> d!105829 m!774807))

(assert (=> b!830761 d!105829))

(declare-fun d!105831 () Bool)

(declare-fun c!90154 () Bool)

(assert (=> d!105831 (= c!90154 ((_ is Nil!15942) (toList!4502 lt!376833)))))

(declare-fun e!463431 () (InoxSet tuple2!10150))

(assert (=> d!105831 (= (content!386 (toList!4502 lt!376833)) e!463431)))

(declare-fun b!831154 () Bool)

(assert (=> b!831154 (= e!463431 ((as const (Array tuple2!10150 Bool)) false))))

(declare-fun b!831155 () Bool)

(assert (=> b!831155 (= e!463431 ((_ map or) (store ((as const (Array tuple2!10150 Bool)) false) (h!17070 (toList!4502 lt!376833)) true) (content!386 (t!22310 (toList!4502 lt!376833)))))))

(assert (= (and d!105831 c!90154) b!831154))

(assert (= (and d!105831 (not c!90154)) b!831155))

(declare-fun m!774813 () Bool)

(assert (=> b!831155 m!774813))

(declare-fun m!774815 () Bool)

(assert (=> b!831155 m!774815))

(assert (=> d!105381 d!105831))

(assert (=> d!105401 d!105403))

(assert (=> d!105401 d!105399))

(declare-fun d!105833 () Bool)

(assert (=> d!105833 (not (contains!4208 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852)) lt!376853))))

(assert (=> d!105833 true))

(declare-fun _$36!343 () Unit!28429)

(assert (=> d!105833 (= (choose!1417 lt!376855 lt!376854 lt!376852 lt!376853) _$36!343)))

(declare-fun bs!23228 () Bool)

(assert (= bs!23228 d!105833))

(assert (=> bs!23228 m!773525))

(assert (=> bs!23228 m!773525))

(assert (=> bs!23228 m!773529))

(assert (=> d!105401 d!105833))

(declare-fun d!105835 () Bool)

(declare-fun e!463432 () Bool)

(assert (=> d!105835 e!463432))

(declare-fun res!565794 () Bool)

(assert (=> d!105835 (=> res!565794 e!463432)))

(declare-fun lt!377204 () Bool)

(assert (=> d!105835 (= res!565794 (not lt!377204))))

(declare-fun lt!377206 () Bool)

(assert (=> d!105835 (= lt!377204 lt!377206)))

(declare-fun lt!377205 () Unit!28429)

(declare-fun e!463433 () Unit!28429)

(assert (=> d!105835 (= lt!377205 e!463433)))

(declare-fun c!90155 () Bool)

(assert (=> d!105835 (= c!90155 lt!377206)))

(assert (=> d!105835 (= lt!377206 (containsKey!401 (toList!4502 lt!376855) lt!376853))))

(assert (=> d!105835 (= (contains!4208 lt!376855 lt!376853) lt!377204)))

(declare-fun b!831157 () Bool)

(declare-fun lt!377207 () Unit!28429)

(assert (=> b!831157 (= e!463433 lt!377207)))

(assert (=> b!831157 (= lt!377207 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376855) lt!376853))))

(assert (=> b!831157 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376855) lt!376853))))

(declare-fun b!831158 () Bool)

(declare-fun Unit!28468 () Unit!28429)

(assert (=> b!831158 (= e!463433 Unit!28468)))

(declare-fun b!831159 () Bool)

(assert (=> b!831159 (= e!463432 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376855) lt!376853)))))

(assert (= (and d!105835 c!90155) b!831157))

(assert (= (and d!105835 (not c!90155)) b!831158))

(assert (= (and d!105835 (not res!565794)) b!831159))

(declare-fun m!774817 () Bool)

(assert (=> d!105835 m!774817))

(declare-fun m!774819 () Bool)

(assert (=> b!831157 m!774819))

(declare-fun m!774821 () Bool)

(assert (=> b!831157 m!774821))

(assert (=> b!831157 m!774821))

(declare-fun m!774823 () Bool)

(assert (=> b!831157 m!774823))

(assert (=> b!831159 m!774821))

(assert (=> b!831159 m!774821))

(assert (=> b!831159 m!774823))

(assert (=> d!105401 d!105835))

(declare-fun d!105837 () Bool)

(assert (=> d!105837 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376829) (_1!5086 lt!376677)))))

(declare-fun lt!377208 () Unit!28429)

(assert (=> d!105837 (= lt!377208 (choose!1421 (toList!4502 lt!376829) (_1!5086 lt!376677)))))

(declare-fun e!463434 () Bool)

(assert (=> d!105837 e!463434))

(declare-fun res!565795 () Bool)

(assert (=> d!105837 (=> (not res!565795) (not e!463434))))

(assert (=> d!105837 (= res!565795 (isStrictlySorted!441 (toList!4502 lt!376829)))))

(assert (=> d!105837 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376829) (_1!5086 lt!376677)) lt!377208)))

(declare-fun b!831160 () Bool)

(assert (=> b!831160 (= e!463434 (containsKey!401 (toList!4502 lt!376829) (_1!5086 lt!376677)))))

(assert (= (and d!105837 res!565795) b!831160))

(assert (=> d!105837 m!773499))

(assert (=> d!105837 m!773499))

(assert (=> d!105837 m!773731))

(declare-fun m!774825 () Bool)

(assert (=> d!105837 m!774825))

(declare-fun m!774827 () Bool)

(assert (=> d!105837 m!774827))

(assert (=> b!831160 m!773727))

(assert (=> b!830528 d!105837))

(declare-fun d!105839 () Bool)

(assert (=> d!105839 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376829) (_1!5086 lt!376677))) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376829) (_1!5086 lt!376677)))))))

(declare-fun bs!23229 () Bool)

(assert (= bs!23229 d!105839))

(assert (=> bs!23229 m!773499))

(declare-fun m!774829 () Bool)

(assert (=> bs!23229 m!774829))

(assert (=> b!830528 d!105839))

(assert (=> b!830528 d!105515))

(declare-fun d!105841 () Bool)

(assert (=> d!105841 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376733) (_1!5086 lt!376679)))))

(declare-fun lt!377209 () Unit!28429)

(assert (=> d!105841 (= lt!377209 (choose!1421 (toList!4502 lt!376733) (_1!5086 lt!376679)))))

(declare-fun e!463435 () Bool)

(assert (=> d!105841 e!463435))

(declare-fun res!565796 () Bool)

(assert (=> d!105841 (=> (not res!565796) (not e!463435))))

(assert (=> d!105841 (= res!565796 (isStrictlySorted!441 (toList!4502 lt!376733)))))

(assert (=> d!105841 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376733) (_1!5086 lt!376679)) lt!377209)))

(declare-fun b!831161 () Bool)

(assert (=> b!831161 (= e!463435 (containsKey!401 (toList!4502 lt!376733) (_1!5086 lt!376679)))))

(assert (= (and d!105841 res!565796) b!831161))

(assert (=> d!105841 m!773377))

(assert (=> d!105841 m!773377))

(assert (=> d!105841 m!774019))

(declare-fun m!774831 () Bool)

(assert (=> d!105841 m!774831))

(declare-fun m!774833 () Bool)

(assert (=> d!105841 m!774833))

(assert (=> b!831161 m!774015))

(assert (=> b!830613 d!105841))

(declare-fun d!105843 () Bool)

(assert (=> d!105843 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376733) (_1!5086 lt!376679))) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376733) (_1!5086 lt!376679)))))))

(declare-fun bs!23230 () Bool)

(assert (= bs!23230 d!105843))

(assert (=> bs!23230 m!773377))

(declare-fun m!774835 () Bool)

(assert (=> bs!23230 m!774835))

(assert (=> b!830613 d!105843))

(assert (=> b!830613 d!105545))

(declare-fun d!105845 () Bool)

(assert (=> d!105845 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377210 () Unit!28429)

(assert (=> d!105845 (= lt!377210 (choose!1421 (toList!4502 lt!376856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463436 () Bool)

(assert (=> d!105845 e!463436))

(declare-fun res!565797 () Bool)

(assert (=> d!105845 (=> (not res!565797) (not e!463436))))

(assert (=> d!105845 (= res!565797 (isStrictlySorted!441 (toList!4502 lt!376856)))))

(assert (=> d!105845 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376856) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377210)))

(declare-fun b!831162 () Bool)

(assert (=> b!831162 (= e!463436 (containsKey!401 (toList!4502 lt!376856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105845 res!565797) b!831162))

(assert (=> d!105845 m!774177))

(assert (=> d!105845 m!774177))

(assert (=> d!105845 m!774179))

(declare-fun m!774837 () Bool)

(assert (=> d!105845 m!774837))

(declare-fun m!774839 () Bool)

(assert (=> d!105845 m!774839))

(assert (=> b!831162 m!774173))

(assert (=> b!830702 d!105845))

(declare-fun d!105847 () Bool)

(assert (=> d!105847 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376856) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376856) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23231 () Bool)

(assert (= bs!23231 d!105847))

(assert (=> bs!23231 m!774177))

(declare-fun m!774841 () Bool)

(assert (=> bs!23231 m!774841))

(assert (=> b!830702 d!105847))

(declare-fun b!831164 () Bool)

(declare-fun e!463437 () Option!421)

(declare-fun e!463438 () Option!421)

(assert (=> b!831164 (= e!463437 e!463438)))

(declare-fun c!90157 () Bool)

(assert (=> b!831164 (= c!90157 (and ((_ is Cons!15941) (toList!4502 lt!376856)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376856))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831165 () Bool)

(assert (=> b!831165 (= e!463438 (getValueByKey!415 (t!22310 (toList!4502 lt!376856)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831166 () Bool)

(assert (=> b!831166 (= e!463438 None!419)))

(declare-fun b!831163 () Bool)

(assert (=> b!831163 (= e!463437 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376856)))))))

(declare-fun d!105849 () Bool)

(declare-fun c!90156 () Bool)

(assert (=> d!105849 (= c!90156 (and ((_ is Cons!15941) (toList!4502 lt!376856)) (= (_1!5086 (h!17070 (toList!4502 lt!376856))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105849 (= (getValueByKey!415 (toList!4502 lt!376856) #b0000000000000000000000000000000000000000000000000000000000000000) e!463437)))

(assert (= (and d!105849 c!90156) b!831163))

(assert (= (and d!105849 (not c!90156)) b!831164))

(assert (= (and b!831164 c!90157) b!831165))

(assert (= (and b!831164 (not c!90157)) b!831166))

(declare-fun m!774843 () Bool)

(assert (=> b!831165 m!774843))

(assert (=> b!830702 d!105849))

(declare-fun d!105851 () Bool)

(declare-fun lt!377211 () Bool)

(assert (=> d!105851 (= lt!377211 (select (content!386 lt!377080) (tuple2!10151 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!463440 () Bool)

(assert (=> d!105851 (= lt!377211 e!463440)))

(declare-fun res!565798 () Bool)

(assert (=> d!105851 (=> (not res!565798) (not e!463440))))

(assert (=> d!105851 (= res!565798 ((_ is Cons!15941) lt!377080))))

(assert (=> d!105851 (= (contains!4209 lt!377080 (tuple2!10151 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!377211)))

(declare-fun b!831167 () Bool)

(declare-fun e!463439 () Bool)

(assert (=> b!831167 (= e!463440 e!463439)))

(declare-fun res!565799 () Bool)

(assert (=> b!831167 (=> res!565799 e!463439)))

(assert (=> b!831167 (= res!565799 (= (h!17070 lt!377080) (tuple2!10151 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831168 () Bool)

(assert (=> b!831168 (= e!463439 (contains!4209 (t!22310 lt!377080) (tuple2!10151 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!105851 res!565798) b!831167))

(assert (= (and b!831167 (not res!565799)) b!831168))

(declare-fun m!774845 () Bool)

(assert (=> d!105851 m!774845))

(declare-fun m!774847 () Bool)

(assert (=> d!105851 m!774847))

(declare-fun m!774849 () Bool)

(assert (=> b!831168 m!774849))

(assert (=> b!830743 d!105851))

(declare-fun d!105853 () Bool)

(declare-fun lt!377212 () Bool)

(assert (=> d!105853 (= lt!377212 (select (content!386 lt!377050) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun e!463442 () Bool)

(assert (=> d!105853 (= lt!377212 e!463442)))

(declare-fun res!565800 () Bool)

(assert (=> d!105853 (=> (not res!565800) (not e!463442))))

(assert (=> d!105853 (= res!565800 ((_ is Cons!15941) lt!377050))))

(assert (=> d!105853 (= (contains!4209 lt!377050 (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))) lt!377212)))

(declare-fun b!831169 () Bool)

(declare-fun e!463441 () Bool)

(assert (=> b!831169 (= e!463442 e!463441)))

(declare-fun res!565801 () Bool)

(assert (=> b!831169 (=> res!565801 e!463441)))

(assert (=> b!831169 (= res!565801 (= (h!17070 lt!377050) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun b!831170 () Bool)

(assert (=> b!831170 (= e!463441 (contains!4209 (t!22310 lt!377050) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(assert (= (and d!105853 res!565800) b!831169))

(assert (= (and b!831169 (not res!565801)) b!831170))

(declare-fun m!774851 () Bool)

(assert (=> d!105853 m!774851))

(declare-fun m!774853 () Bool)

(assert (=> d!105853 m!774853))

(declare-fun m!774855 () Bool)

(assert (=> b!831170 m!774855))

(assert (=> b!830684 d!105853))

(declare-fun d!105855 () Bool)

(assert (=> d!105855 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376817) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377213 () Unit!28429)

(assert (=> d!105855 (= lt!377213 (choose!1421 (toList!4502 lt!376817) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!463443 () Bool)

(assert (=> d!105855 e!463443))

(declare-fun res!565802 () Bool)

(assert (=> d!105855 (=> (not res!565802) (not e!463443))))

(assert (=> d!105855 (= res!565802 (isStrictlySorted!441 (toList!4502 lt!376817)))))

(assert (=> d!105855 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376817) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) lt!377213)))

(declare-fun b!831171 () Bool)

(assert (=> b!831171 (= e!463443 (containsKey!401 (toList!4502 lt!376817) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105855 res!565802) b!831171))

(assert (=> d!105855 m!773353))

(assert (=> d!105855 m!773591))

(assert (=> d!105855 m!773591))

(assert (=> d!105855 m!773593))

(assert (=> d!105855 m!773353))

(declare-fun m!774857 () Bool)

(assert (=> d!105855 m!774857))

(declare-fun m!774859 () Bool)

(assert (=> d!105855 m!774859))

(assert (=> b!831171 m!773353))

(assert (=> b!831171 m!773587))

(assert (=> b!830437 d!105855))

(declare-fun d!105857 () Bool)

(assert (=> d!105857 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376817) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376817) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23232 () Bool)

(assert (= bs!23232 d!105857))

(assert (=> bs!23232 m!773591))

(declare-fun m!774861 () Bool)

(assert (=> bs!23232 m!774861))

(assert (=> b!830437 d!105857))

(assert (=> b!830437 d!105593))

(declare-fun d!105859 () Bool)

(declare-fun res!565803 () Bool)

(declare-fun e!463444 () Bool)

(assert (=> d!105859 (=> res!565803 e!463444)))

(assert (=> d!105859 (= res!565803 (and ((_ is Cons!15941) lt!377024) (= (_1!5086 (h!17070 lt!377024)) (_1!5086 lt!376679))))))

(assert (=> d!105859 (= (containsKey!401 lt!377024 (_1!5086 lt!376679)) e!463444)))

(declare-fun b!831172 () Bool)

(declare-fun e!463445 () Bool)

(assert (=> b!831172 (= e!463444 e!463445)))

(declare-fun res!565804 () Bool)

(assert (=> b!831172 (=> (not res!565804) (not e!463445))))

(assert (=> b!831172 (= res!565804 (and (or (not ((_ is Cons!15941) lt!377024)) (bvsle (_1!5086 (h!17070 lt!377024)) (_1!5086 lt!376679))) ((_ is Cons!15941) lt!377024) (bvslt (_1!5086 (h!17070 lt!377024)) (_1!5086 lt!376679))))))

(declare-fun b!831173 () Bool)

(assert (=> b!831173 (= e!463445 (containsKey!401 (t!22310 lt!377024) (_1!5086 lt!376679)))))

(assert (= (and d!105859 (not res!565803)) b!831172))

(assert (= (and b!831172 res!565804) b!831173))

(declare-fun m!774863 () Bool)

(assert (=> b!831173 m!774863))

(assert (=> b!830641 d!105859))

(assert (=> b!830576 d!105619))

(declare-fun b!831175 () Bool)

(declare-fun e!463446 () Option!421)

(declare-fun e!463447 () Option!421)

(assert (=> b!831175 (= e!463446 e!463447)))

(declare-fun c!90159 () Bool)

(assert (=> b!831175 (= c!90159 (and ((_ is Cons!15941) (t!22310 lt!376826)) (not (= (_1!5086 (h!17070 (t!22310 lt!376826))) (_1!5086 lt!376677)))))))

(declare-fun b!831176 () Bool)

(assert (=> b!831176 (= e!463447 (getValueByKey!415 (t!22310 (t!22310 lt!376826)) (_1!5086 lt!376677)))))

(declare-fun b!831177 () Bool)

(assert (=> b!831177 (= e!463447 None!419)))

(declare-fun b!831174 () Bool)

(assert (=> b!831174 (= e!463446 (Some!420 (_2!5086 (h!17070 (t!22310 lt!376826)))))))

(declare-fun d!105861 () Bool)

(declare-fun c!90158 () Bool)

(assert (=> d!105861 (= c!90158 (and ((_ is Cons!15941) (t!22310 lt!376826)) (= (_1!5086 (h!17070 (t!22310 lt!376826))) (_1!5086 lt!376677))))))

(assert (=> d!105861 (= (getValueByKey!415 (t!22310 lt!376826) (_1!5086 lt!376677)) e!463446)))

(assert (= (and d!105861 c!90158) b!831174))

(assert (= (and d!105861 (not c!90158)) b!831175))

(assert (= (and b!831175 c!90159) b!831176))

(assert (= (and b!831175 (not c!90159)) b!831177))

(declare-fun m!774865 () Bool)

(assert (=> b!831176 m!774865))

(assert (=> b!830533 d!105861))

(declare-fun b!831179 () Bool)

(declare-fun e!463448 () Option!421)

(declare-fun e!463449 () Option!421)

(assert (=> b!831179 (= e!463448 e!463449)))

(declare-fun c!90161 () Bool)

(assert (=> b!831179 (= c!90161 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376833))) (not (= (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376833)))) (_1!5086 lt!376677)))))))

(declare-fun b!831180 () Bool)

(assert (=> b!831180 (= e!463449 (getValueByKey!415 (t!22310 (t!22310 (toList!4502 lt!376833))) (_1!5086 lt!376677)))))

(declare-fun b!831181 () Bool)

(assert (=> b!831181 (= e!463449 None!419)))

(declare-fun b!831178 () Bool)

(assert (=> b!831178 (= e!463448 (Some!420 (_2!5086 (h!17070 (t!22310 (toList!4502 lt!376833))))))))

(declare-fun d!105863 () Bool)

(declare-fun c!90160 () Bool)

(assert (=> d!105863 (= c!90160 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376833))) (= (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376833)))) (_1!5086 lt!376677))))))

(assert (=> d!105863 (= (getValueByKey!415 (t!22310 (toList!4502 lt!376833)) (_1!5086 lt!376677)) e!463448)))

(assert (= (and d!105863 c!90160) b!831178))

(assert (= (and d!105863 (not c!90160)) b!831179))

(assert (= (and b!831179 c!90161) b!831180))

(assert (= (and b!831179 (not c!90161)) b!831181))

(declare-fun m!774867 () Bool)

(assert (=> b!831180 m!774867))

(assert (=> b!830668 d!105863))

(declare-fun b!831183 () Bool)

(declare-fun e!463450 () Option!421)

(declare-fun e!463451 () Option!421)

(assert (=> b!831183 (= e!463450 e!463451)))

(declare-fun c!90163 () Bool)

(assert (=> b!831183 (= c!90163 (and ((_ is Cons!15941) (t!22310 lt!376730)) (not (= (_1!5086 (h!17070 (t!22310 lt!376730))) (_1!5086 lt!376679)))))))

(declare-fun b!831184 () Bool)

(assert (=> b!831184 (= e!463451 (getValueByKey!415 (t!22310 (t!22310 lt!376730)) (_1!5086 lt!376679)))))

(declare-fun b!831185 () Bool)

(assert (=> b!831185 (= e!463451 None!419)))

(declare-fun b!831182 () Bool)

(assert (=> b!831182 (= e!463450 (Some!420 (_2!5086 (h!17070 (t!22310 lt!376730)))))))

(declare-fun d!105865 () Bool)

(declare-fun c!90162 () Bool)

(assert (=> d!105865 (= c!90162 (and ((_ is Cons!15941) (t!22310 lt!376730)) (= (_1!5086 (h!17070 (t!22310 lt!376730))) (_1!5086 lt!376679))))))

(assert (=> d!105865 (= (getValueByKey!415 (t!22310 lt!376730) (_1!5086 lt!376679)) e!463450)))

(assert (= (and d!105865 c!90162) b!831182))

(assert (= (and d!105865 (not c!90162)) b!831183))

(assert (= (and b!831183 c!90163) b!831184))

(assert (= (and b!831183 (not c!90163)) b!831185))

(declare-fun m!774869 () Bool)

(assert (=> b!831184 m!774869))

(assert (=> b!830618 d!105865))

(declare-fun d!105867 () Bool)

(assert (=> d!105867 (= (isEmpty!654 lt!376982) (isEmpty!655 (toList!4502 lt!376982)))))

(declare-fun bs!23233 () Bool)

(assert (= bs!23233 d!105867))

(declare-fun m!774871 () Bool)

(assert (=> bs!23233 m!774871))

(assert (=> b!830582 d!105867))

(declare-fun d!105869 () Bool)

(declare-fun lt!377214 () Bool)

(assert (=> d!105869 (= lt!377214 (select (content!386 lt!376734) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(declare-fun e!463453 () Bool)

(assert (=> d!105869 (= lt!377214 e!463453)))

(declare-fun res!565805 () Bool)

(assert (=> d!105869 (=> (not res!565805) (not e!463453))))

(assert (=> d!105869 (= res!565805 ((_ is Cons!15941) lt!376734))))

(assert (=> d!105869 (= (contains!4209 lt!376734 (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))) lt!377214)))

(declare-fun b!831186 () Bool)

(declare-fun e!463452 () Bool)

(assert (=> b!831186 (= e!463453 e!463452)))

(declare-fun res!565806 () Bool)

(assert (=> b!831186 (=> res!565806 e!463452)))

(assert (=> b!831186 (= res!565806 (= (h!17070 lt!376734) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(declare-fun b!831187 () Bool)

(assert (=> b!831187 (= e!463452 (contains!4209 (t!22310 lt!376734) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(assert (= (and d!105869 res!565805) b!831186))

(assert (= (and b!831186 (not res!565806)) b!831187))

(declare-fun m!774873 () Bool)

(assert (=> d!105869 m!774873))

(declare-fun m!774875 () Bool)

(assert (=> d!105869 m!774875))

(declare-fun m!774877 () Bool)

(assert (=> b!831187 m!774877))

(assert (=> b!830640 d!105869))

(assert (=> b!830771 d!105619))

(declare-fun d!105871 () Bool)

(assert (=> d!105871 (= (get!11818 (getValueByKey!415 (toList!4502 lt!376803) lt!376787)) (v!10095 (getValueByKey!415 (toList!4502 lt!376803) lt!376787)))))

(assert (=> d!105467 d!105871))

(declare-fun b!831189 () Bool)

(declare-fun e!463454 () Option!421)

(declare-fun e!463455 () Option!421)

(assert (=> b!831189 (= e!463454 e!463455)))

(declare-fun c!90165 () Bool)

(assert (=> b!831189 (= c!90165 (and ((_ is Cons!15941) (toList!4502 lt!376803)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376803))) lt!376787))))))

(declare-fun b!831190 () Bool)

(assert (=> b!831190 (= e!463455 (getValueByKey!415 (t!22310 (toList!4502 lt!376803)) lt!376787))))

(declare-fun b!831191 () Bool)

(assert (=> b!831191 (= e!463455 None!419)))

(declare-fun b!831188 () Bool)

(assert (=> b!831188 (= e!463454 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376803)))))))

(declare-fun d!105873 () Bool)

(declare-fun c!90164 () Bool)

(assert (=> d!105873 (= c!90164 (and ((_ is Cons!15941) (toList!4502 lt!376803)) (= (_1!5086 (h!17070 (toList!4502 lt!376803))) lt!376787)))))

(assert (=> d!105873 (= (getValueByKey!415 (toList!4502 lt!376803) lt!376787) e!463454)))

(assert (= (and d!105873 c!90164) b!831188))

(assert (= (and d!105873 (not c!90164)) b!831189))

(assert (= (and b!831189 c!90165) b!831190))

(assert (= (and b!831189 (not c!90165)) b!831191))

(declare-fun m!774879 () Bool)

(assert (=> b!831190 m!774879))

(assert (=> d!105467 d!105873))

(declare-fun d!105875 () Bool)

(declare-fun res!565807 () Bool)

(declare-fun e!463456 () Bool)

(assert (=> d!105875 (=> res!565807 e!463456)))

(assert (=> d!105875 (= res!565807 (and ((_ is Cons!15941) (toList!4502 lt!376829)) (= (_1!5086 (h!17070 (toList!4502 lt!376829))) (_1!5086 lt!376677))))))

(assert (=> d!105875 (= (containsKey!401 (toList!4502 lt!376829) (_1!5086 lt!376677)) e!463456)))

(declare-fun b!831192 () Bool)

(declare-fun e!463457 () Bool)

(assert (=> b!831192 (= e!463456 e!463457)))

(declare-fun res!565808 () Bool)

(assert (=> b!831192 (=> (not res!565808) (not e!463457))))

(assert (=> b!831192 (= res!565808 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376829))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376829))) (_1!5086 lt!376677))) ((_ is Cons!15941) (toList!4502 lt!376829)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376829))) (_1!5086 lt!376677))))))

(declare-fun b!831193 () Bool)

(assert (=> b!831193 (= e!463457 (containsKey!401 (t!22310 (toList!4502 lt!376829)) (_1!5086 lt!376677)))))

(assert (= (and d!105875 (not res!565807)) b!831192))

(assert (= (and b!831192 res!565808) b!831193))

(declare-fun m!774881 () Bool)

(assert (=> b!831193 m!774881))

(assert (=> d!105417 d!105875))

(declare-fun d!105877 () Bool)

(assert (=> d!105877 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))) lt!376853))))

(declare-fun lt!377215 () Unit!28429)

(assert (=> d!105877 (= lt!377215 (choose!1421 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))) lt!376853))))

(declare-fun e!463458 () Bool)

(assert (=> d!105877 e!463458))

(declare-fun res!565809 () Bool)

(assert (=> d!105877 (=> (not res!565809) (not e!463458))))

(assert (=> d!105877 (= res!565809 (isStrictlySorted!441 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852)))))))

(assert (=> d!105877 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))) lt!376853) lt!377215)))

(declare-fun b!831194 () Bool)

(assert (=> b!831194 (= e!463458 (containsKey!401 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))) lt!376853))))

(assert (= (and d!105877 res!565809) b!831194))

(assert (=> d!105877 m!773681))

(assert (=> d!105877 m!773681))

(assert (=> d!105877 m!773683))

(declare-fun m!774883 () Bool)

(assert (=> d!105877 m!774883))

(declare-fun m!774885 () Bool)

(assert (=> d!105877 m!774885))

(assert (=> b!831194 m!773677))

(assert (=> b!830469 d!105877))

(declare-fun d!105879 () Bool)

(assert (=> d!105879 (= (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))) lt!376853)) (not (isEmpty!656 (getValueByKey!415 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))) lt!376853))))))

(declare-fun bs!23234 () Bool)

(assert (= bs!23234 d!105879))

(assert (=> bs!23234 m!773681))

(declare-fun m!774887 () Bool)

(assert (=> bs!23234 m!774887))

(assert (=> b!830469 d!105879))

(declare-fun b!831196 () Bool)

(declare-fun e!463459 () Option!421)

(declare-fun e!463460 () Option!421)

(assert (=> b!831196 (= e!463459 e!463460)))

(declare-fun c!90167 () Bool)

(assert (=> b!831196 (= c!90167 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852)))) (not (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))))) lt!376853))))))

(declare-fun b!831197 () Bool)

(assert (=> b!831197 (= e!463460 (getValueByKey!415 (t!22310 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852)))) lt!376853))))

(declare-fun b!831198 () Bool)

(assert (=> b!831198 (= e!463460 None!419)))

(declare-fun b!831195 () Bool)

(assert (=> b!831195 (= e!463459 (Some!420 (_2!5086 (h!17070 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852)))))))))

(declare-fun d!105881 () Bool)

(declare-fun c!90166 () Bool)

(assert (=> d!105881 (= c!90166 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852)))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))))) lt!376853)))))

(assert (=> d!105881 (= (getValueByKey!415 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))) lt!376853) e!463459)))

(assert (= (and d!105881 c!90166) b!831195))

(assert (= (and d!105881 (not c!90166)) b!831196))

(assert (= (and b!831196 c!90167) b!831197))

(assert (= (and b!831196 (not c!90167)) b!831198))

(declare-fun m!774889 () Bool)

(assert (=> b!831197 m!774889))

(assert (=> b!830469 d!105881))

(assert (=> b!830672 d!105671))

(assert (=> b!830672 d!105673))

(declare-fun d!105883 () Bool)

(declare-fun lt!377216 () Bool)

(assert (=> d!105883 (= lt!377216 (select (content!386 (toList!4502 lt!377040)) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun e!463462 () Bool)

(assert (=> d!105883 (= lt!377216 e!463462)))

(declare-fun res!565810 () Bool)

(assert (=> d!105883 (=> (not res!565810) (not e!463462))))

(assert (=> d!105883 (= res!565810 ((_ is Cons!15941) (toList!4502 lt!377040)))))

(assert (=> d!105883 (= (contains!4209 (toList!4502 lt!377040) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377216)))

(declare-fun b!831199 () Bool)

(declare-fun e!463461 () Bool)

(assert (=> b!831199 (= e!463462 e!463461)))

(declare-fun res!565811 () Bool)

(assert (=> b!831199 (=> res!565811 e!463461)))

(assert (=> b!831199 (= res!565811 (= (h!17070 (toList!4502 lt!377040)) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!831200 () Bool)

(assert (=> b!831200 (= e!463461 (contains!4209 (t!22310 (toList!4502 lt!377040)) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105883 res!565810) b!831199))

(assert (= (and b!831199 (not res!565811)) b!831200))

(declare-fun m!774891 () Bool)

(assert (=> d!105883 m!774891))

(declare-fun m!774893 () Bool)

(assert (=> d!105883 m!774893))

(declare-fun m!774895 () Bool)

(assert (=> b!831200 m!774895))

(assert (=> b!830665 d!105883))

(declare-fun d!105885 () Bool)

(declare-fun res!565812 () Bool)

(declare-fun e!463463 () Bool)

(assert (=> d!105885 (=> res!565812 e!463463)))

(assert (=> d!105885 (= res!565812 (and ((_ is Cons!15941) (toList!4502 lt!376733)) (= (_1!5086 (h!17070 (toList!4502 lt!376733))) (_1!5086 lt!376679))))))

(assert (=> d!105885 (= (containsKey!401 (toList!4502 lt!376733) (_1!5086 lt!376679)) e!463463)))

(declare-fun b!831201 () Bool)

(declare-fun e!463464 () Bool)

(assert (=> b!831201 (= e!463463 e!463464)))

(declare-fun res!565813 () Bool)

(assert (=> b!831201 (=> (not res!565813) (not e!463464))))

(assert (=> b!831201 (= res!565813 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376733))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376733))) (_1!5086 lt!376679))) ((_ is Cons!15941) (toList!4502 lt!376733)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376733))) (_1!5086 lt!376679))))))

(declare-fun b!831202 () Bool)

(assert (=> b!831202 (= e!463464 (containsKey!401 (t!22310 (toList!4502 lt!376733)) (_1!5086 lt!376679)))))

(assert (= (and d!105885 (not res!565812)) b!831201))

(assert (= (and b!831201 res!565813) b!831202))

(declare-fun m!774897 () Bool)

(assert (=> b!831202 m!774897))

(assert (=> d!105497 d!105885))

(declare-fun d!105887 () Bool)

(assert (=> d!105887 (= (get!11818 (getValueByKey!415 (toList!4502 lt!376817) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!10095 (getValueByKey!415 (toList!4502 lt!376817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105521 d!105887))

(assert (=> d!105521 d!105623))

(declare-fun d!105889 () Bool)

(declare-fun res!565814 () Bool)

(declare-fun e!463465 () Bool)

(assert (=> d!105889 (=> res!565814 e!463465)))

(assert (=> d!105889 (= res!565814 (and ((_ is Cons!15941) (toList!4502 lt!376856)) (= (_1!5086 (h!17070 (toList!4502 lt!376856))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105889 (= (containsKey!401 (toList!4502 lt!376856) #b0000000000000000000000000000000000000000000000000000000000000000) e!463465)))

(declare-fun b!831203 () Bool)

(declare-fun e!463466 () Bool)

(assert (=> b!831203 (= e!463465 e!463466)))

(declare-fun res!565815 () Bool)

(assert (=> b!831203 (=> (not res!565815) (not e!463466))))

(assert (=> b!831203 (= res!565815 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376856))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376856))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15941) (toList!4502 lt!376856)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376856))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831204 () Bool)

(assert (=> b!831204 (= e!463466 (containsKey!401 (t!22310 (toList!4502 lt!376856)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105889 (not res!565814)) b!831203))

(assert (= (and b!831203 res!565815) b!831204))

(declare-fun m!774899 () Bool)

(assert (=> b!831204 m!774899))

(assert (=> d!105551 d!105889))

(assert (=> b!830575 d!105619))

(assert (=> d!105579 d!105577))

(assert (=> d!105579 d!105581))

(declare-fun d!105891 () Bool)

(assert (=> d!105891 (not (contains!4208 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859)) lt!376860))))

(assert (=> d!105891 true))

(declare-fun _$36!344 () Unit!28429)

(assert (=> d!105891 (= (choose!1417 lt!376862 lt!376861 lt!376859 lt!376860) _$36!344)))

(declare-fun bs!23235 () Bool)

(assert (= bs!23235 d!105891))

(assert (=> bs!23235 m!773545))

(assert (=> bs!23235 m!773545))

(assert (=> bs!23235 m!773549))

(assert (=> d!105579 d!105891))

(declare-fun d!105893 () Bool)

(declare-fun e!463467 () Bool)

(assert (=> d!105893 e!463467))

(declare-fun res!565816 () Bool)

(assert (=> d!105893 (=> res!565816 e!463467)))

(declare-fun lt!377217 () Bool)

(assert (=> d!105893 (= res!565816 (not lt!377217))))

(declare-fun lt!377219 () Bool)

(assert (=> d!105893 (= lt!377217 lt!377219)))

(declare-fun lt!377218 () Unit!28429)

(declare-fun e!463468 () Unit!28429)

(assert (=> d!105893 (= lt!377218 e!463468)))

(declare-fun c!90168 () Bool)

(assert (=> d!105893 (= c!90168 lt!377219)))

(assert (=> d!105893 (= lt!377219 (containsKey!401 (toList!4502 lt!376862) lt!376860))))

(assert (=> d!105893 (= (contains!4208 lt!376862 lt!376860) lt!377217)))

(declare-fun b!831205 () Bool)

(declare-fun lt!377220 () Unit!28429)

(assert (=> b!831205 (= e!463468 lt!377220)))

(assert (=> b!831205 (= lt!377220 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376862) lt!376860))))

(assert (=> b!831205 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376862) lt!376860))))

(declare-fun b!831206 () Bool)

(declare-fun Unit!28469 () Unit!28429)

(assert (=> b!831206 (= e!463468 Unit!28469)))

(declare-fun b!831207 () Bool)

(assert (=> b!831207 (= e!463467 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376862) lt!376860)))))

(assert (= (and d!105893 c!90168) b!831205))

(assert (= (and d!105893 (not c!90168)) b!831206))

(assert (= (and d!105893 (not res!565816)) b!831207))

(declare-fun m!774901 () Bool)

(assert (=> d!105893 m!774901))

(declare-fun m!774903 () Bool)

(assert (=> b!831205 m!774903))

(declare-fun m!774905 () Bool)

(assert (=> b!831205 m!774905))

(assert (=> b!831205 m!774905))

(declare-fun m!774907 () Bool)

(assert (=> b!831205 m!774907))

(assert (=> b!831207 m!774905))

(assert (=> b!831207 m!774905))

(assert (=> b!831207 m!774907))

(assert (=> d!105579 d!105893))

(declare-fun d!105895 () Bool)

(declare-fun lt!377221 () Bool)

(assert (=> d!105895 (= lt!377221 (select (content!386 (t!22310 (toList!4502 lt!376720))) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!463470 () Bool)

(assert (=> d!105895 (= lt!377221 e!463470)))

(declare-fun res!565817 () Bool)

(assert (=> d!105895 (=> (not res!565817) (not e!463470))))

(assert (=> d!105895 (= res!565817 ((_ is Cons!15941) (t!22310 (toList!4502 lt!376720))))))

(assert (=> d!105895 (= (contains!4209 (t!22310 (toList!4502 lt!376720)) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377221)))

(declare-fun b!831208 () Bool)

(declare-fun e!463469 () Bool)

(assert (=> b!831208 (= e!463470 e!463469)))

(declare-fun res!565818 () Bool)

(assert (=> b!831208 (=> res!565818 e!463469)))

(assert (=> b!831208 (= res!565818 (= (h!17070 (t!22310 (toList!4502 lt!376720))) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!831209 () Bool)

(assert (=> b!831209 (= e!463469 (contains!4209 (t!22310 (t!22310 (toList!4502 lt!376720))) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105895 res!565817) b!831208))

(assert (= (and b!831208 (not res!565818)) b!831209))

(declare-fun m!774909 () Bool)

(assert (=> d!105895 m!774909))

(declare-fun m!774911 () Bool)

(assert (=> d!105895 m!774911))

(declare-fun m!774913 () Bool)

(assert (=> b!831209 m!774913))

(assert (=> b!830612 d!105895))

(declare-fun d!105897 () Bool)

(assert (=> d!105897 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376817) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377222 () Unit!28429)

(assert (=> d!105897 (= lt!377222 (choose!1421 (toList!4502 lt!376817) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463471 () Bool)

(assert (=> d!105897 e!463471))

(declare-fun res!565819 () Bool)

(assert (=> d!105897 (=> (not res!565819) (not e!463471))))

(assert (=> d!105897 (= res!565819 (isStrictlySorted!441 (toList!4502 lt!376817)))))

(assert (=> d!105897 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376817) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377222)))

(declare-fun b!831210 () Bool)

(assert (=> b!831210 (= e!463471 (containsKey!401 (toList!4502 lt!376817) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105897 res!565819) b!831210))

(assert (=> d!105897 m!774073))

(assert (=> d!105897 m!774073))

(assert (=> d!105897 m!774075))

(declare-fun m!774915 () Bool)

(assert (=> d!105897 m!774915))

(assert (=> d!105897 m!774859))

(assert (=> b!831210 m!774069))

(assert (=> b!830651 d!105897))

(declare-fun d!105899 () Bool)

(assert (=> d!105899 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376817) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376817) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23236 () Bool)

(assert (= bs!23236 d!105899))

(assert (=> bs!23236 m!774073))

(declare-fun m!774917 () Bool)

(assert (=> bs!23236 m!774917))

(assert (=> b!830651 d!105899))

(declare-fun b!831212 () Bool)

(declare-fun e!463472 () Option!421)

(declare-fun e!463473 () Option!421)

(assert (=> b!831212 (= e!463472 e!463473)))

(declare-fun c!90170 () Bool)

(assert (=> b!831212 (= c!90170 (and ((_ is Cons!15941) (toList!4502 lt!376817)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376817))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831213 () Bool)

(assert (=> b!831213 (= e!463473 (getValueByKey!415 (t!22310 (toList!4502 lt!376817)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831214 () Bool)

(assert (=> b!831214 (= e!463473 None!419)))

(declare-fun b!831211 () Bool)

(assert (=> b!831211 (= e!463472 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376817)))))))

(declare-fun d!105901 () Bool)

(declare-fun c!90169 () Bool)

(assert (=> d!105901 (= c!90169 (and ((_ is Cons!15941) (toList!4502 lt!376817)) (= (_1!5086 (h!17070 (toList!4502 lt!376817))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105901 (= (getValueByKey!415 (toList!4502 lt!376817) #b0000000000000000000000000000000000000000000000000000000000000000) e!463472)))

(assert (= (and d!105901 c!90169) b!831211))

(assert (= (and d!105901 (not c!90169)) b!831212))

(assert (= (and b!831212 c!90170) b!831213))

(assert (= (and b!831212 (not c!90170)) b!831214))

(declare-fun m!774919 () Bool)

(assert (=> b!831213 m!774919))

(assert (=> b!830651 d!105901))

(declare-fun d!105903 () Bool)

(assert (=> d!105903 (= (isEmpty!655 (toList!4502 lt!376856)) ((_ is Nil!15942) (toList!4502 lt!376856)))))

(assert (=> d!105375 d!105903))

(declare-fun d!105905 () Bool)

(declare-fun lt!377223 () Bool)

(assert (=> d!105905 (= lt!377223 (select (content!386 (t!22310 (toList!4502 lt!376733))) lt!376679))))

(declare-fun e!463475 () Bool)

(assert (=> d!105905 (= lt!377223 e!463475)))

(declare-fun res!565820 () Bool)

(assert (=> d!105905 (=> (not res!565820) (not e!463475))))

(assert (=> d!105905 (= res!565820 ((_ is Cons!15941) (t!22310 (toList!4502 lt!376733))))))

(assert (=> d!105905 (= (contains!4209 (t!22310 (toList!4502 lt!376733)) lt!376679) lt!377223)))

(declare-fun b!831215 () Bool)

(declare-fun e!463474 () Bool)

(assert (=> b!831215 (= e!463475 e!463474)))

(declare-fun res!565821 () Bool)

(assert (=> b!831215 (=> res!565821 e!463474)))

(assert (=> b!831215 (= res!565821 (= (h!17070 (t!22310 (toList!4502 lt!376733))) lt!376679))))

(declare-fun b!831216 () Bool)

(assert (=> b!831216 (= e!463474 (contains!4209 (t!22310 (t!22310 (toList!4502 lt!376733))) lt!376679))))

(assert (= (and d!105905 res!565820) b!831215))

(assert (= (and b!831215 (not res!565821)) b!831216))

(declare-fun m!774921 () Bool)

(assert (=> d!105905 m!774921))

(declare-fun m!774923 () Bool)

(assert (=> d!105905 m!774923))

(declare-fun m!774925 () Bool)

(assert (=> b!831216 m!774925))

(assert (=> b!830454 d!105905))

(declare-fun d!105907 () Bool)

(assert (=> d!105907 (= ($colon$colon!536 e!463191 (ite c!90011 (h!17070 (toList!4502 lt!376681)) (tuple2!10151 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (Cons!15941 (ite c!90011 (h!17070 (toList!4502 lt!376681)) (tuple2!10151 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) e!463191))))

(assert (=> bm!36281 d!105907))

(declare-fun lt!377224 () Bool)

(declare-fun d!105909 () Bool)

(assert (=> d!105909 (= lt!377224 (select (content!386 (toList!4502 lt!376900)) (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!463477 () Bool)

(assert (=> d!105909 (= lt!377224 e!463477)))

(declare-fun res!565822 () Bool)

(assert (=> d!105909 (=> (not res!565822) (not e!463477))))

(assert (=> d!105909 (= res!565822 ((_ is Cons!15941) (toList!4502 lt!376900)))))

(assert (=> d!105909 (= (contains!4209 (toList!4502 lt!376900) (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377224)))

(declare-fun b!831217 () Bool)

(declare-fun e!463476 () Bool)

(assert (=> b!831217 (= e!463477 e!463476)))

(declare-fun res!565823 () Bool)

(assert (=> b!831217 (=> res!565823 e!463476)))

(assert (=> b!831217 (= res!565823 (= (h!17070 (toList!4502 lt!376900)) (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831218 () Bool)

(assert (=> b!831218 (= e!463476 (contains!4209 (t!22310 (toList!4502 lt!376900)) (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!105909 res!565822) b!831217))

(assert (= (and b!831217 (not res!565823)) b!831218))

(declare-fun m!774927 () Bool)

(assert (=> d!105909 m!774927))

(declare-fun m!774929 () Bool)

(assert (=> d!105909 m!774929))

(declare-fun m!774931 () Bool)

(assert (=> b!831218 m!774931))

(assert (=> b!830449 d!105909))

(declare-fun d!105911 () Bool)

(assert (=> d!105911 (= ($colon$colon!536 e!463157 (ite c!89989 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376679))) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677)))) (Cons!15941 (ite c!89989 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376679))) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))) e!463157))))

(assert (=> bm!36278 d!105911))

(declare-fun d!105913 () Bool)

(assert (=> d!105913 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376795) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377225 () Unit!28429)

(assert (=> d!105913 (= lt!377225 (choose!1421 (toList!4502 lt!376795) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463478 () Bool)

(assert (=> d!105913 e!463478))

(declare-fun res!565824 () Bool)

(assert (=> d!105913 (=> (not res!565824) (not e!463478))))

(assert (=> d!105913 (= res!565824 (isStrictlySorted!441 (toList!4502 lt!376795)))))

(assert (=> d!105913 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376795) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377225)))

(declare-fun b!831219 () Bool)

(assert (=> b!831219 (= e!463478 (containsKey!401 (toList!4502 lt!376795) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105913 res!565824) b!831219))

(assert (=> d!105913 m!773605))

(assert (=> d!105913 m!773605))

(assert (=> d!105913 m!773607))

(declare-fun m!774933 () Bool)

(assert (=> d!105913 m!774933))

(assert (=> d!105913 m!774621))

(assert (=> b!831219 m!773601))

(assert (=> b!830442 d!105913))

(declare-fun d!105915 () Bool)

(assert (=> d!105915 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376795) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376795) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23237 () Bool)

(assert (= bs!23237 d!105915))

(assert (=> bs!23237 m!773605))

(declare-fun m!774935 () Bool)

(assert (=> bs!23237 m!774935))

(assert (=> b!830442 d!105915))

(declare-fun b!831221 () Bool)

(declare-fun e!463479 () Option!421)

(declare-fun e!463480 () Option!421)

(assert (=> b!831221 (= e!463479 e!463480)))

(declare-fun c!90172 () Bool)

(assert (=> b!831221 (= c!90172 (and ((_ is Cons!15941) (toList!4502 lt!376795)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376795))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831222 () Bool)

(assert (=> b!831222 (= e!463480 (getValueByKey!415 (t!22310 (toList!4502 lt!376795)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831223 () Bool)

(assert (=> b!831223 (= e!463480 None!419)))

(declare-fun b!831220 () Bool)

(assert (=> b!831220 (= e!463479 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376795)))))))

(declare-fun d!105917 () Bool)

(declare-fun c!90171 () Bool)

(assert (=> d!105917 (= c!90171 (and ((_ is Cons!15941) (toList!4502 lt!376795)) (= (_1!5086 (h!17070 (toList!4502 lt!376795))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105917 (= (getValueByKey!415 (toList!4502 lt!376795) #b0000000000000000000000000000000000000000000000000000000000000000) e!463479)))

(assert (= (and d!105917 c!90171) b!831220))

(assert (= (and d!105917 (not c!90171)) b!831221))

(assert (= (and b!831221 c!90172) b!831222))

(assert (= (and b!831221 (not c!90172)) b!831223))

(declare-fun m!774937 () Bool)

(assert (=> b!831222 m!774937))

(assert (=> b!830442 d!105917))

(declare-fun d!105919 () Bool)

(declare-fun res!565825 () Bool)

(declare-fun e!463481 () Bool)

(assert (=> d!105919 (=> res!565825 e!463481)))

(assert (=> d!105919 (= res!565825 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852)))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))))) lt!376853)))))

(assert (=> d!105919 (= (containsKey!401 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))) lt!376853) e!463481)))

(declare-fun b!831224 () Bool)

(declare-fun e!463482 () Bool)

(assert (=> b!831224 (= e!463481 e!463482)))

(declare-fun res!565826 () Bool)

(assert (=> b!831224 (=> (not res!565826) (not e!463482))))

(assert (=> b!831224 (= res!565826 (and (or (not ((_ is Cons!15941) (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))))) (bvsle (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))))) lt!376853)) ((_ is Cons!15941) (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852)))) (bvslt (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852))))) lt!376853)))))

(declare-fun b!831225 () Bool)

(assert (=> b!831225 (= e!463482 (containsKey!401 (t!22310 (toList!4502 (+!1980 lt!376855 (tuple2!10151 lt!376854 lt!376852)))) lt!376853))))

(assert (= (and d!105919 (not res!565825)) b!831224))

(assert (= (and b!831224 res!565826) b!831225))

(declare-fun m!774939 () Bool)

(assert (=> b!831225 m!774939))

(assert (=> d!105403 d!105919))

(declare-fun d!105921 () Bool)

(declare-fun e!463483 () Bool)

(assert (=> d!105921 e!463483))

(declare-fun res!565827 () Bool)

(assert (=> d!105921 (=> res!565827 e!463483)))

(declare-fun lt!377226 () Bool)

(assert (=> d!105921 (= res!565827 (not lt!377226))))

(declare-fun lt!377228 () Bool)

(assert (=> d!105921 (= lt!377226 lt!377228)))

(declare-fun lt!377227 () Unit!28429)

(declare-fun e!463484 () Unit!28429)

(assert (=> d!105921 (= lt!377227 e!463484)))

(declare-fun c!90173 () Bool)

(assert (=> d!105921 (= c!90173 lt!377228)))

(assert (=> d!105921 (= lt!377228 (containsKey!401 (toList!4502 lt!377040) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105921 (= (contains!4208 lt!377040 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377226)))

(declare-fun b!831226 () Bool)

(declare-fun lt!377229 () Unit!28429)

(assert (=> b!831226 (= e!463484 lt!377229)))

(assert (=> b!831226 (= lt!377229 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!377040) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> b!831226 (isDefined!311 (getValueByKey!415 (toList!4502 lt!377040) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831227 () Bool)

(declare-fun Unit!28470 () Unit!28429)

(assert (=> b!831227 (= e!463484 Unit!28470)))

(declare-fun b!831228 () Bool)

(assert (=> b!831228 (= e!463483 (isDefined!311 (getValueByKey!415 (toList!4502 lt!377040) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!105921 c!90173) b!831226))

(assert (= (and d!105921 (not c!90173)) b!831227))

(assert (= (and d!105921 (not res!565827)) b!831228))

(declare-fun m!774941 () Bool)

(assert (=> d!105921 m!774941))

(declare-fun m!774943 () Bool)

(assert (=> b!831226 m!774943))

(assert (=> b!831226 m!774111))

(assert (=> b!831226 m!774111))

(declare-fun m!774945 () Bool)

(assert (=> b!831226 m!774945))

(assert (=> b!831228 m!774111))

(assert (=> b!831228 m!774111))

(assert (=> b!831228 m!774945))

(assert (=> d!105527 d!105921))

(declare-fun b!831230 () Bool)

(declare-fun e!463485 () Option!421)

(declare-fun e!463486 () Option!421)

(assert (=> b!831230 (= e!463485 e!463486)))

(declare-fun c!90175 () Bool)

(assert (=> b!831230 (= c!90175 (and ((_ is Cons!15941) lt!377037) (not (= (_1!5086 (h!17070 lt!377037)) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!831231 () Bool)

(assert (=> b!831231 (= e!463486 (getValueByKey!415 (t!22310 lt!377037) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831232 () Bool)

(assert (=> b!831232 (= e!463486 None!419)))

(declare-fun b!831229 () Bool)

(assert (=> b!831229 (= e!463485 (Some!420 (_2!5086 (h!17070 lt!377037))))))

(declare-fun d!105923 () Bool)

(declare-fun c!90174 () Bool)

(assert (=> d!105923 (= c!90174 (and ((_ is Cons!15941) lt!377037) (= (_1!5086 (h!17070 lt!377037)) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105923 (= (getValueByKey!415 lt!377037 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!463485)))

(assert (= (and d!105923 c!90174) b!831229))

(assert (= (and d!105923 (not c!90174)) b!831230))

(assert (= (and b!831230 c!90175) b!831231))

(assert (= (and b!831230 (not c!90175)) b!831232))

(declare-fun m!774947 () Bool)

(assert (=> b!831231 m!774947))

(assert (=> d!105527 d!105923))

(declare-fun d!105925 () Bool)

(assert (=> d!105925 (= (getValueByKey!415 lt!377037 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377230 () Unit!28429)

(assert (=> d!105925 (= lt!377230 (choose!1418 lt!377037 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!463487 () Bool)

(assert (=> d!105925 e!463487))

(declare-fun res!565828 () Bool)

(assert (=> d!105925 (=> (not res!565828) (not e!463487))))

(assert (=> d!105925 (= res!565828 (isStrictlySorted!441 lt!377037))))

(assert (=> d!105925 (= (lemmaContainsTupThenGetReturnValue!229 lt!377037 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377230)))

(declare-fun b!831233 () Bool)

(declare-fun res!565829 () Bool)

(assert (=> b!831233 (=> (not res!565829) (not e!463487))))

(assert (=> b!831233 (= res!565829 (containsKey!401 lt!377037 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831234 () Bool)

(assert (=> b!831234 (= e!463487 (contains!4209 lt!377037 (tuple2!10151 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!105925 res!565828) b!831233))

(assert (= (and b!831233 res!565829) b!831234))

(assert (=> d!105925 m!774105))

(declare-fun m!774949 () Bool)

(assert (=> d!105925 m!774949))

(declare-fun m!774951 () Bool)

(assert (=> d!105925 m!774951))

(declare-fun m!774953 () Bool)

(assert (=> b!831233 m!774953))

(declare-fun m!774955 () Bool)

(assert (=> b!831234 m!774955))

(assert (=> d!105527 d!105925))

(declare-fun d!105927 () Bool)

(declare-fun e!463490 () Bool)

(assert (=> d!105927 e!463490))

(declare-fun res!565831 () Bool)

(assert (=> d!105927 (=> (not res!565831) (not e!463490))))

(declare-fun lt!377231 () List!15945)

(assert (=> d!105927 (= res!565831 (isStrictlySorted!441 lt!377231))))

(declare-fun e!463491 () List!15945)

(assert (=> d!105927 (= lt!377231 e!463491)))

(declare-fun c!90179 () Bool)

(assert (=> d!105927 (= c!90179 (and ((_ is Cons!15941) (toList!4502 call!36255)) (bvslt (_1!5086 (h!17070 (toList!4502 call!36255))) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105927 (isStrictlySorted!441 (toList!4502 call!36255))))

(assert (=> d!105927 (= (insertStrictlySorted!268 (toList!4502 call!36255) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377231)))

(declare-fun b!831235 () Bool)

(declare-fun res!565830 () Bool)

(assert (=> b!831235 (=> (not res!565830) (not e!463490))))

(assert (=> b!831235 (= res!565830 (containsKey!401 lt!377231 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831236 () Bool)

(declare-fun e!463489 () List!15945)

(assert (=> b!831236 (= e!463489 (insertStrictlySorted!268 (t!22310 (toList!4502 call!36255)) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!36320 () Bool)

(declare-fun call!36325 () List!15945)

(assert (=> bm!36320 (= call!36325 ($colon$colon!536 e!463489 (ite c!90179 (h!17070 (toList!4502 call!36255)) (tuple2!10151 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun c!90178 () Bool)

(assert (=> bm!36320 (= c!90178 c!90179)))

(declare-fun b!831237 () Bool)

(assert (=> b!831237 (= e!463490 (contains!4209 lt!377231 (tuple2!10151 (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun c!90177 () Bool)

(declare-fun b!831238 () Bool)

(declare-fun c!90176 () Bool)

(assert (=> b!831238 (= e!463489 (ite c!90176 (t!22310 (toList!4502 call!36255)) (ite c!90177 (Cons!15941 (h!17070 (toList!4502 call!36255)) (t!22310 (toList!4502 call!36255))) Nil!15942)))))

(declare-fun b!831239 () Bool)

(declare-fun e!463488 () List!15945)

(declare-fun call!36324 () List!15945)

(assert (=> b!831239 (= e!463488 call!36324)))

(declare-fun bm!36321 () Bool)

(declare-fun call!36323 () List!15945)

(assert (=> bm!36321 (= call!36324 call!36323)))

(declare-fun bm!36322 () Bool)

(assert (=> bm!36322 (= call!36323 call!36325)))

(declare-fun b!831240 () Bool)

(assert (=> b!831240 (= e!463488 call!36324)))

(declare-fun b!831241 () Bool)

(assert (=> b!831241 (= e!463491 call!36325)))

(declare-fun b!831242 () Bool)

(declare-fun e!463492 () List!15945)

(assert (=> b!831242 (= e!463492 call!36323)))

(declare-fun b!831243 () Bool)

(assert (=> b!831243 (= c!90177 (and ((_ is Cons!15941) (toList!4502 call!36255)) (bvsgt (_1!5086 (h!17070 (toList!4502 call!36255))) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!831243 (= e!463492 e!463488)))

(declare-fun b!831244 () Bool)

(assert (=> b!831244 (= e!463491 e!463492)))

(assert (=> b!831244 (= c!90176 (and ((_ is Cons!15941) (toList!4502 call!36255)) (= (_1!5086 (h!17070 (toList!4502 call!36255))) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!105927 c!90179) b!831241))

(assert (= (and d!105927 (not c!90179)) b!831244))

(assert (= (and b!831244 c!90176) b!831242))

(assert (= (and b!831244 (not c!90176)) b!831243))

(assert (= (and b!831243 c!90177) b!831240))

(assert (= (and b!831243 (not c!90177)) b!831239))

(assert (= (or b!831240 b!831239) bm!36321))

(assert (= (or b!831242 bm!36321) bm!36322))

(assert (= (or b!831241 bm!36322) bm!36320))

(assert (= (and bm!36320 c!90178) b!831236))

(assert (= (and bm!36320 (not c!90178)) b!831238))

(assert (= (and d!105927 res!565831) b!831235))

(assert (= (and b!831235 res!565830) b!831237))

(declare-fun m!774957 () Bool)

(assert (=> bm!36320 m!774957))

(declare-fun m!774959 () Bool)

(assert (=> b!831235 m!774959))

(declare-fun m!774961 () Bool)

(assert (=> b!831237 m!774961))

(declare-fun m!774963 () Bool)

(assert (=> d!105927 m!774963))

(declare-fun m!774965 () Bool)

(assert (=> d!105927 m!774965))

(declare-fun m!774967 () Bool)

(assert (=> b!831236 m!774967))

(assert (=> d!105527 d!105927))

(declare-fun d!105929 () Bool)

(declare-fun res!565832 () Bool)

(declare-fun e!463493 () Bool)

(assert (=> d!105929 (=> res!565832 e!463493)))

(assert (=> d!105929 (= res!565832 (and ((_ is Cons!15941) (toList!4502 lt!376817)) (= (_1!5086 (h!17070 (toList!4502 lt!376817))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105929 (= (containsKey!401 (toList!4502 lt!376817) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) e!463493)))

(declare-fun b!831245 () Bool)

(declare-fun e!463494 () Bool)

(assert (=> b!831245 (= e!463493 e!463494)))

(declare-fun res!565833 () Bool)

(assert (=> b!831245 (=> (not res!565833) (not e!463494))))

(assert (=> b!831245 (= res!565833 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376817))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376817))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15941) (toList!4502 lt!376817)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376817))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!831246 () Bool)

(assert (=> b!831246 (= e!463494 (containsKey!401 (t!22310 (toList!4502 lt!376817)) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105929 (not res!565832)) b!831245))

(assert (= (and b!831245 res!565833) b!831246))

(assert (=> b!831246 m!773353))

(declare-fun m!774969 () Bool)

(assert (=> b!831246 m!774969))

(assert (=> d!105377 d!105929))

(declare-fun b!831265 () Bool)

(declare-fun e!463509 () Bool)

(declare-fun lt!377236 () SeekEntryResult!8744)

(assert (=> b!831265 (= e!463509 (bvsge (x!70109 lt!377236) #b01111111111111111111111111111110))))

(declare-fun b!831266 () Bool)

(declare-fun e!463508 () Bool)

(assert (=> b!831266 (= e!463509 e!463508)))

(declare-fun res!565840 () Bool)

(assert (=> b!831266 (= res!565840 (and ((_ is Intermediate!8744) lt!377236) (not (undefined!9556 lt!377236)) (bvslt (x!70109 lt!377236) #b01111111111111111111111111111110) (bvsge (x!70109 lt!377236) #b00000000000000000000000000000000) (bvsge (x!70109 lt!377236) #b00000000000000000000000000000000)))))

(assert (=> b!831266 (=> (not res!565840) (not e!463508))))

(declare-fun b!831267 () Bool)

(declare-fun e!463507 () SeekEntryResult!8744)

(assert (=> b!831267 (= e!463507 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000 mask!1312) (select (arr!22328 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(declare-fun b!831268 () Bool)

(assert (=> b!831268 (= e!463507 (Intermediate!8744 false (toIndex!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000))))

(declare-fun d!105931 () Bool)

(assert (=> d!105931 e!463509))

(declare-fun c!90187 () Bool)

(assert (=> d!105931 (= c!90187 (and ((_ is Intermediate!8744) lt!377236) (undefined!9556 lt!377236)))))

(declare-fun e!463505 () SeekEntryResult!8744)

(assert (=> d!105931 (= lt!377236 e!463505)))

(declare-fun c!90186 () Bool)

(assert (=> d!105931 (= c!90186 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!377237 () (_ BitVec 64))

(assert (=> d!105931 (= lt!377237 (select (arr!22328 _keys!976) (toIndex!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) mask!1312)))))

(assert (=> d!105931 (validMask!0 mask!1312)))

(assert (=> d!105931 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) mask!1312) (select (arr!22328 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!377236)))

(declare-fun b!831269 () Bool)

(assert (=> b!831269 (= e!463505 e!463507)))

(declare-fun c!90188 () Bool)

(assert (=> b!831269 (= c!90188 (or (= lt!377237 (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) (= (bvadd lt!377237 lt!377237) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831270 () Bool)

(assert (=> b!831270 (and (bvsge (index!37349 lt!377236) #b00000000000000000000000000000000) (bvslt (index!37349 lt!377236) (size!22749 _keys!976)))))

(declare-fun e!463506 () Bool)

(assert (=> b!831270 (= e!463506 (= (select (arr!22328 _keys!976) (index!37349 lt!377236)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831271 () Bool)

(assert (=> b!831271 (and (bvsge (index!37349 lt!377236) #b00000000000000000000000000000000) (bvslt (index!37349 lt!377236) (size!22749 _keys!976)))))

(declare-fun res!565842 () Bool)

(assert (=> b!831271 (= res!565842 (= (select (arr!22328 _keys!976) (index!37349 lt!377236)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831271 (=> res!565842 e!463506)))

(declare-fun b!831272 () Bool)

(assert (=> b!831272 (= e!463505 (Intermediate!8744 true (toIndex!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000))))

(declare-fun b!831273 () Bool)

(assert (=> b!831273 (and (bvsge (index!37349 lt!377236) #b00000000000000000000000000000000) (bvslt (index!37349 lt!377236) (size!22749 _keys!976)))))

(declare-fun res!565841 () Bool)

(assert (=> b!831273 (= res!565841 (= (select (arr!22328 _keys!976) (index!37349 lt!377236)) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831273 (=> res!565841 e!463506)))

(assert (=> b!831273 (= e!463508 e!463506)))

(assert (= (and d!105931 c!90186) b!831272))

(assert (= (and d!105931 (not c!90186)) b!831269))

(assert (= (and b!831269 c!90188) b!831268))

(assert (= (and b!831269 (not c!90188)) b!831267))

(assert (= (and d!105931 c!90187) b!831265))

(assert (= (and d!105931 (not c!90187)) b!831266))

(assert (= (and b!831266 res!565840) b!831273))

(assert (= (and b!831273 (not res!565841)) b!831271))

(assert (= (and b!831271 (not res!565842)) b!831270))

(declare-fun m!774971 () Bool)

(assert (=> b!831271 m!774971))

(assert (=> b!831273 m!774971))

(assert (=> b!831270 m!774971))

(assert (=> d!105931 m!774203))

(declare-fun m!774973 () Bool)

(assert (=> d!105931 m!774973))

(assert (=> d!105931 m!773289))

(assert (=> b!831267 m!774203))

(declare-fun m!774975 () Bool)

(assert (=> b!831267 m!774975))

(assert (=> b!831267 m!774975))

(assert (=> b!831267 m!773353))

(declare-fun m!774977 () Bool)

(assert (=> b!831267 m!774977))

(assert (=> d!105565 d!105931))

(declare-fun d!105933 () Bool)

(declare-fun lt!377243 () (_ BitVec 32))

(declare-fun lt!377242 () (_ BitVec 32))

(assert (=> d!105933 (= lt!377243 (bvmul (bvxor lt!377242 (bvlshr lt!377242 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!105933 (= lt!377242 ((_ extract 31 0) (bvand (bvxor (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (bvlshr (select (arr!22328 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!105933 (and (bvsge mask!1312 #b00000000000000000000000000000000) (let ((res!565843 (let ((h!17073 ((_ extract 31 0) (bvand (bvxor (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (bvlshr (select (arr!22328 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!70120 (bvmul (bvxor h!17073 (bvlshr h!17073 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!70120 (bvlshr x!70120 #b00000000000000000000000000001101)) mask!1312))))) (and (bvslt res!565843 (bvadd mask!1312 #b00000000000000000000000000000001)) (bvsge res!565843 #b00000000000000000000000000000000))))))

(assert (=> d!105933 (= (toIndex!0 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) mask!1312) (bvand (bvxor lt!377243 (bvlshr lt!377243 #b00000000000000000000000000001101)) mask!1312))))

(assert (=> d!105565 d!105933))

(assert (=> d!105565 d!105343))

(declare-fun lt!377244 () Bool)

(declare-fun d!105935 () Bool)

(assert (=> d!105935 (= lt!377244 (select (content!386 (toList!4502 lt!376953)) (tuple2!10151 lt!376810 zeroValueAfter!34)))))

(declare-fun e!463511 () Bool)

(assert (=> d!105935 (= lt!377244 e!463511)))

(declare-fun res!565844 () Bool)

(assert (=> d!105935 (=> (not res!565844) (not e!463511))))

(assert (=> d!105935 (= res!565844 ((_ is Cons!15941) (toList!4502 lt!376953)))))

(assert (=> d!105935 (= (contains!4209 (toList!4502 lt!376953) (tuple2!10151 lt!376810 zeroValueAfter!34)) lt!377244)))

(declare-fun b!831274 () Bool)

(declare-fun e!463510 () Bool)

(assert (=> b!831274 (= e!463511 e!463510)))

(declare-fun res!565845 () Bool)

(assert (=> b!831274 (=> res!565845 e!463510)))

(assert (=> b!831274 (= res!565845 (= (h!17070 (toList!4502 lt!376953)) (tuple2!10151 lt!376810 zeroValueAfter!34)))))

(declare-fun b!831275 () Bool)

(assert (=> b!831275 (= e!463510 (contains!4209 (t!22310 (toList!4502 lt!376953)) (tuple2!10151 lt!376810 zeroValueAfter!34)))))

(assert (= (and d!105935 res!565844) b!831274))

(assert (= (and b!831274 (not res!565845)) b!831275))

(declare-fun m!774979 () Bool)

(assert (=> d!105935 m!774979))

(declare-fun m!774981 () Bool)

(assert (=> d!105935 m!774981))

(declare-fun m!774983 () Bool)

(assert (=> b!831275 m!774983))

(assert (=> b!830555 d!105935))

(declare-fun d!105937 () Bool)

(declare-fun lt!377245 () Bool)

(assert (=> d!105937 (= lt!377245 (select (content!386 lt!376930) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun e!463513 () Bool)

(assert (=> d!105937 (= lt!377245 e!463513)))

(declare-fun res!565846 () Bool)

(assert (=> d!105937 (=> (not res!565846) (not e!463513))))

(assert (=> d!105937 (= res!565846 ((_ is Cons!15941) lt!376930))))

(assert (=> d!105937 (= (contains!4209 lt!376930 (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))) lt!377245)))

(declare-fun b!831276 () Bool)

(declare-fun e!463512 () Bool)

(assert (=> b!831276 (= e!463513 e!463512)))

(declare-fun res!565847 () Bool)

(assert (=> b!831276 (=> res!565847 e!463512)))

(assert (=> b!831276 (= res!565847 (= (h!17070 lt!376930) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun b!831277 () Bool)

(assert (=> b!831277 (= e!463512 (contains!4209 (t!22310 lt!376930) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(assert (= (and d!105937 res!565846) b!831276))

(assert (= (and b!831276 (not res!565847)) b!831277))

(declare-fun m!774985 () Bool)

(assert (=> d!105937 m!774985))

(declare-fun m!774987 () Bool)

(assert (=> d!105937 m!774987))

(declare-fun m!774989 () Bool)

(assert (=> b!831277 m!774989))

(assert (=> b!830515 d!105937))

(declare-fun d!105939 () Bool)

(declare-fun e!463514 () Bool)

(assert (=> d!105939 e!463514))

(declare-fun res!565848 () Bool)

(assert (=> d!105939 (=> res!565848 e!463514)))

(declare-fun lt!377246 () Bool)

(assert (=> d!105939 (= res!565848 (not lt!377246))))

(declare-fun lt!377248 () Bool)

(assert (=> d!105939 (= lt!377246 lt!377248)))

(declare-fun lt!377247 () Unit!28429)

(declare-fun e!463515 () Unit!28429)

(assert (=> d!105939 (= lt!377247 e!463515)))

(declare-fun c!90189 () Bool)

(assert (=> d!105939 (= c!90189 lt!377248)))

(assert (=> d!105939 (= lt!377248 (containsKey!401 (toList!4502 lt!376982) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105939 (= (contains!4208 lt!376982 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377246)))

(declare-fun b!831278 () Bool)

(declare-fun lt!377249 () Unit!28429)

(assert (=> b!831278 (= e!463515 lt!377249)))

(assert (=> b!831278 (= lt!377249 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376982) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831278 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376982) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831279 () Bool)

(declare-fun Unit!28471 () Unit!28429)

(assert (=> b!831279 (= e!463515 Unit!28471)))

(declare-fun b!831280 () Bool)

(assert (=> b!831280 (= e!463514 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376982) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105939 c!90189) b!831278))

(assert (= (and d!105939 (not c!90189)) b!831279))

(assert (= (and d!105939 (not res!565848)) b!831280))

(declare-fun m!774991 () Bool)

(assert (=> d!105939 m!774991))

(declare-fun m!774993 () Bool)

(assert (=> b!831278 m!774993))

(declare-fun m!774995 () Bool)

(assert (=> b!831278 m!774995))

(assert (=> b!831278 m!774995))

(declare-fun m!774997 () Bool)

(assert (=> b!831278 m!774997))

(assert (=> b!831280 m!774995))

(assert (=> b!831280 m!774995))

(assert (=> b!831280 m!774997))

(assert (=> b!830581 d!105939))

(declare-fun d!105941 () Bool)

(declare-fun res!565849 () Bool)

(declare-fun e!463516 () Bool)

(assert (=> d!105941 (=> res!565849 e!463516)))

(assert (=> d!105941 (= res!565849 (and ((_ is Cons!15941) (toList!4502 lt!376817)) (= (_1!5086 (h!17070 (toList!4502 lt!376817))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105941 (= (containsKey!401 (toList!4502 lt!376817) #b0000000000000000000000000000000000000000000000000000000000000000) e!463516)))

(declare-fun b!831281 () Bool)

(declare-fun e!463517 () Bool)

(assert (=> b!831281 (= e!463516 e!463517)))

(declare-fun res!565850 () Bool)

(assert (=> b!831281 (=> (not res!565850) (not e!463517))))

(assert (=> b!831281 (= res!565850 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376817))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376817))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15941) (toList!4502 lt!376817)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376817))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831282 () Bool)

(assert (=> b!831282 (= e!463517 (containsKey!401 (t!22310 (toList!4502 lt!376817)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105941 (not res!565849)) b!831281))

(assert (= (and b!831281 res!565850) b!831282))

(declare-fun m!774999 () Bool)

(assert (=> b!831282 m!774999))

(assert (=> d!105513 d!105941))

(declare-fun d!105943 () Bool)

(assert (=> d!105943 (= (get!11818 (getValueByKey!415 (toList!4502 (+!1980 lt!376790 (tuple2!10151 lt!376791 minValue!754))) lt!376799)) (v!10095 (getValueByKey!415 (toList!4502 (+!1980 lt!376790 (tuple2!10151 lt!376791 minValue!754))) lt!376799)))))

(assert (=> d!105477 d!105943))

(declare-fun b!831284 () Bool)

(declare-fun e!463518 () Option!421)

(declare-fun e!463519 () Option!421)

(assert (=> b!831284 (= e!463518 e!463519)))

(declare-fun c!90191 () Bool)

(assert (=> b!831284 (= c!90191 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376790 (tuple2!10151 lt!376791 minValue!754)))) (not (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376790 (tuple2!10151 lt!376791 minValue!754))))) lt!376799))))))

(declare-fun b!831285 () Bool)

(assert (=> b!831285 (= e!463519 (getValueByKey!415 (t!22310 (toList!4502 (+!1980 lt!376790 (tuple2!10151 lt!376791 minValue!754)))) lt!376799))))

(declare-fun b!831286 () Bool)

(assert (=> b!831286 (= e!463519 None!419)))

(declare-fun b!831283 () Bool)

(assert (=> b!831283 (= e!463518 (Some!420 (_2!5086 (h!17070 (toList!4502 (+!1980 lt!376790 (tuple2!10151 lt!376791 minValue!754)))))))))

(declare-fun d!105945 () Bool)

(declare-fun c!90190 () Bool)

(assert (=> d!105945 (= c!90190 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376790 (tuple2!10151 lt!376791 minValue!754)))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376790 (tuple2!10151 lt!376791 minValue!754))))) lt!376799)))))

(assert (=> d!105945 (= (getValueByKey!415 (toList!4502 (+!1980 lt!376790 (tuple2!10151 lt!376791 minValue!754))) lt!376799) e!463518)))

(assert (= (and d!105945 c!90190) b!831283))

(assert (= (and d!105945 (not c!90190)) b!831284))

(assert (= (and b!831284 c!90191) b!831285))

(assert (= (and b!831284 (not c!90191)) b!831286))

(declare-fun m!775001 () Bool)

(assert (=> b!831285 m!775001))

(assert (=> d!105477 d!105945))

(declare-fun d!105947 () Bool)

(declare-fun res!565851 () Bool)

(declare-fun e!463520 () Bool)

(assert (=> d!105947 (=> res!565851 e!463520)))

(assert (=> d!105947 (= res!565851 (and ((_ is Cons!15941) lt!376734) (= (_1!5086 (h!17070 lt!376734)) (_1!5086 lt!376679))))))

(assert (=> d!105947 (= (containsKey!401 lt!376734 (_1!5086 lt!376679)) e!463520)))

(declare-fun b!831287 () Bool)

(declare-fun e!463521 () Bool)

(assert (=> b!831287 (= e!463520 e!463521)))

(declare-fun res!565852 () Bool)

(assert (=> b!831287 (=> (not res!565852) (not e!463521))))

(assert (=> b!831287 (= res!565852 (and (or (not ((_ is Cons!15941) lt!376734)) (bvsle (_1!5086 (h!17070 lt!376734)) (_1!5086 lt!376679))) ((_ is Cons!15941) lt!376734) (bvslt (_1!5086 (h!17070 lt!376734)) (_1!5086 lt!376679))))))

(declare-fun b!831288 () Bool)

(assert (=> b!831288 (= e!463521 (containsKey!401 (t!22310 lt!376734) (_1!5086 lt!376679)))))

(assert (= (and d!105947 (not res!565851)) b!831287))

(assert (= (and b!831287 res!565852) b!831288))

(declare-fun m!775003 () Bool)

(assert (=> b!831288 m!775003))

(assert (=> b!830639 d!105947))

(assert (=> d!105539 d!105537))

(declare-fun d!105949 () Bool)

(assert (=> d!105949 (= (getValueByKey!415 lt!376830 (_1!5086 lt!376677)) (Some!420 (_2!5086 lt!376677)))))

(assert (=> d!105949 true))

(declare-fun _$22!570 () Unit!28429)

(assert (=> d!105949 (= (choose!1418 lt!376830 (_1!5086 lt!376677) (_2!5086 lt!376677)) _$22!570)))

(declare-fun bs!23238 () Bool)

(assert (= bs!23238 d!105949))

(assert (=> bs!23238 m!773505))

(assert (=> d!105539 d!105949))

(declare-fun d!105951 () Bool)

(declare-fun res!565853 () Bool)

(declare-fun e!463522 () Bool)

(assert (=> d!105951 (=> res!565853 e!463522)))

(assert (=> d!105951 (= res!565853 (or ((_ is Nil!15942) lt!376830) ((_ is Nil!15942) (t!22310 lt!376830))))))

(assert (=> d!105951 (= (isStrictlySorted!441 lt!376830) e!463522)))

(declare-fun b!831289 () Bool)

(declare-fun e!463523 () Bool)

(assert (=> b!831289 (= e!463522 e!463523)))

(declare-fun res!565854 () Bool)

(assert (=> b!831289 (=> (not res!565854) (not e!463523))))

(assert (=> b!831289 (= res!565854 (bvslt (_1!5086 (h!17070 lt!376830)) (_1!5086 (h!17070 (t!22310 lt!376830)))))))

(declare-fun b!831290 () Bool)

(assert (=> b!831290 (= e!463523 (isStrictlySorted!441 (t!22310 lt!376830)))))

(assert (= (and d!105951 (not res!565853)) b!831289))

(assert (= (and b!831289 res!565854) b!831290))

(declare-fun m!775005 () Bool)

(assert (=> b!831290 m!775005))

(assert (=> d!105539 d!105951))

(declare-fun d!105953 () Bool)

(assert (=> d!105953 (= (get!11820 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830460 d!105953))

(declare-fun b!831292 () Bool)

(declare-fun e!463524 () Option!421)

(declare-fun e!463525 () Option!421)

(assert (=> b!831292 (= e!463524 e!463525)))

(declare-fun c!90193 () Bool)

(assert (=> b!831292 (= c!90193 (and ((_ is Cons!15941) (toList!4502 lt!377040)) (not (= (_1!5086 (h!17070 (toList!4502 lt!377040))) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!831293 () Bool)

(assert (=> b!831293 (= e!463525 (getValueByKey!415 (t!22310 (toList!4502 lt!377040)) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831294 () Bool)

(assert (=> b!831294 (= e!463525 None!419)))

(declare-fun b!831291 () Bool)

(assert (=> b!831291 (= e!463524 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!377040)))))))

(declare-fun d!105955 () Bool)

(declare-fun c!90192 () Bool)

(assert (=> d!105955 (= c!90192 (and ((_ is Cons!15941) (toList!4502 lt!377040)) (= (_1!5086 (h!17070 (toList!4502 lt!377040))) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105955 (= (getValueByKey!415 (toList!4502 lt!377040) (_1!5086 (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!463524)))

(assert (= (and d!105955 c!90192) b!831291))

(assert (= (and d!105955 (not c!90192)) b!831292))

(assert (= (and b!831292 c!90193) b!831293))

(assert (= (and b!831292 (not c!90193)) b!831294))

(declare-fun m!775007 () Bool)

(assert (=> b!831293 m!775007))

(assert (=> b!830664 d!105955))

(declare-fun lt!377250 () Bool)

(declare-fun d!105957 () Bool)

(assert (=> d!105957 (= lt!377250 (select (content!386 (toList!4502 lt!377084)) (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!463527 () Bool)

(assert (=> d!105957 (= lt!377250 e!463527)))

(declare-fun res!565855 () Bool)

(assert (=> d!105957 (=> (not res!565855) (not e!463527))))

(assert (=> d!105957 (= res!565855 ((_ is Cons!15941) (toList!4502 lt!377084)))))

(assert (=> d!105957 (= (contains!4209 (toList!4502 lt!377084) (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377250)))

(declare-fun b!831295 () Bool)

(declare-fun e!463526 () Bool)

(assert (=> b!831295 (= e!463527 e!463526)))

(declare-fun res!565856 () Bool)

(assert (=> b!831295 (=> res!565856 e!463526)))

(assert (=> b!831295 (= res!565856 (= (h!17070 (toList!4502 lt!377084)) (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!831296 () Bool)

(assert (=> b!831296 (= e!463526 (contains!4209 (t!22310 (toList!4502 lt!377084)) (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105957 res!565855) b!831295))

(assert (= (and b!831295 (not res!565856)) b!831296))

(declare-fun m!775009 () Bool)

(assert (=> d!105957 m!775009))

(declare-fun m!775011 () Bool)

(assert (=> d!105957 m!775011))

(declare-fun m!775013 () Bool)

(assert (=> b!831296 m!775013))

(assert (=> b!830752 d!105957))

(declare-fun d!105959 () Bool)

(declare-fun e!463528 () Bool)

(assert (=> d!105959 e!463528))

(declare-fun res!565857 () Bool)

(assert (=> d!105959 (=> res!565857 e!463528)))

(declare-fun lt!377251 () Bool)

(assert (=> d!105959 (= res!565857 (not lt!377251))))

(declare-fun lt!377253 () Bool)

(assert (=> d!105959 (= lt!377251 lt!377253)))

(declare-fun lt!377252 () Unit!28429)

(declare-fun e!463529 () Unit!28429)

(assert (=> d!105959 (= lt!377252 e!463529)))

(declare-fun c!90194 () Bool)

(assert (=> d!105959 (= c!90194 lt!377253)))

(assert (=> d!105959 (= lt!377253 (containsKey!401 (toList!4502 lt!376900) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105959 (= (contains!4208 lt!376900 (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377251)))

(declare-fun b!831297 () Bool)

(declare-fun lt!377254 () Unit!28429)

(assert (=> b!831297 (= e!463529 lt!377254)))

(assert (=> b!831297 (= lt!377254 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376900) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!831297 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376900) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!831298 () Bool)

(declare-fun Unit!28472 () Unit!28429)

(assert (=> b!831298 (= e!463529 Unit!28472)))

(declare-fun b!831299 () Bool)

(assert (=> b!831299 (= e!463528 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376900) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!105959 c!90194) b!831297))

(assert (= (and d!105959 (not c!90194)) b!831298))

(assert (= (and d!105959 (not res!565857)) b!831299))

(declare-fun m!775015 () Bool)

(assert (=> d!105959 m!775015))

(declare-fun m!775017 () Bool)

(assert (=> b!831297 m!775017))

(assert (=> b!831297 m!773625))

(assert (=> b!831297 m!773625))

(declare-fun m!775019 () Bool)

(assert (=> b!831297 m!775019))

(assert (=> b!831299 m!773625))

(assert (=> b!831299 m!773625))

(assert (=> b!831299 m!775019))

(assert (=> d!105387 d!105959))

(declare-fun b!831301 () Bool)

(declare-fun e!463530 () Option!421)

(declare-fun e!463531 () Option!421)

(assert (=> b!831301 (= e!463530 e!463531)))

(declare-fun c!90196 () Bool)

(assert (=> b!831301 (= c!90196 (and ((_ is Cons!15941) lt!376897) (not (= (_1!5086 (h!17070 lt!376897)) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!831302 () Bool)

(assert (=> b!831302 (= e!463531 (getValueByKey!415 (t!22310 lt!376897) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!831303 () Bool)

(assert (=> b!831303 (= e!463531 None!419)))

(declare-fun b!831300 () Bool)

(assert (=> b!831300 (= e!463530 (Some!420 (_2!5086 (h!17070 lt!376897))))))

(declare-fun c!90195 () Bool)

(declare-fun d!105961 () Bool)

(assert (=> d!105961 (= c!90195 (and ((_ is Cons!15941) lt!376897) (= (_1!5086 (h!17070 lt!376897)) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!105961 (= (getValueByKey!415 lt!376897 (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!463530)))

(assert (= (and d!105961 c!90195) b!831300))

(assert (= (and d!105961 (not c!90195)) b!831301))

(assert (= (and b!831301 c!90196) b!831302))

(assert (= (and b!831301 (not c!90196)) b!831303))

(declare-fun m!775021 () Bool)

(assert (=> b!831302 m!775021))

(assert (=> d!105387 d!105961))

(declare-fun d!105963 () Bool)

(assert (=> d!105963 (= (getValueByKey!415 lt!376897 (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!420 (_2!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377255 () Unit!28429)

(assert (=> d!105963 (= lt!377255 (choose!1418 lt!376897 (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!463532 () Bool)

(assert (=> d!105963 e!463532))

(declare-fun res!565858 () Bool)

(assert (=> d!105963 (=> (not res!565858) (not e!463532))))

(assert (=> d!105963 (= res!565858 (isStrictlySorted!441 lt!376897))))

(assert (=> d!105963 (= (lemmaContainsTupThenGetReturnValue!229 lt!376897 (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377255)))

(declare-fun b!831304 () Bool)

(declare-fun res!565859 () Bool)

(assert (=> b!831304 (=> (not res!565859) (not e!463532))))

(assert (=> b!831304 (= res!565859 (containsKey!401 lt!376897 (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!831305 () Bool)

(assert (=> b!831305 (= e!463532 (contains!4209 lt!376897 (tuple2!10151 (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!105963 res!565858) b!831304))

(assert (= (and b!831304 res!565859) b!831305))

(assert (=> d!105963 m!773619))

(declare-fun m!775023 () Bool)

(assert (=> d!105963 m!775023))

(declare-fun m!775025 () Bool)

(assert (=> d!105963 m!775025))

(declare-fun m!775027 () Bool)

(assert (=> b!831304 m!775027))

(declare-fun m!775029 () Bool)

(assert (=> b!831305 m!775029))

(assert (=> d!105387 d!105963))

(declare-fun d!105965 () Bool)

(declare-fun e!463535 () Bool)

(assert (=> d!105965 e!463535))

(declare-fun res!565861 () Bool)

(assert (=> d!105965 (=> (not res!565861) (not e!463535))))

(declare-fun lt!377256 () List!15945)

(assert (=> d!105965 (= res!565861 (isStrictlySorted!441 lt!377256))))

(declare-fun e!463536 () List!15945)

(assert (=> d!105965 (= lt!377256 e!463536)))

(declare-fun c!90200 () Bool)

(assert (=> d!105965 (= c!90200 (and ((_ is Cons!15941) (toList!4502 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244)))) (bvslt (_1!5086 (h!17070 (toList!4502 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244))))) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!105965 (isStrictlySorted!441 (toList!4502 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244))))))

(assert (=> d!105965 (= (insertStrictlySorted!268 (toList!4502 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244))) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377256)))

(declare-fun b!831306 () Bool)

(declare-fun res!565860 () Bool)

(assert (=> b!831306 (=> (not res!565860) (not e!463535))))

(assert (=> b!831306 (= res!565860 (containsKey!401 lt!377256 (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!831307 () Bool)

(declare-fun e!463534 () List!15945)

(assert (=> b!831307 (= e!463534 (insertStrictlySorted!268 (t!22310 (toList!4502 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244)))) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun call!36328 () List!15945)

(declare-fun bm!36323 () Bool)

(assert (=> bm!36323 (= call!36328 ($colon$colon!536 e!463534 (ite c!90200 (h!17070 (toList!4502 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244)))) (tuple2!10151 (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun c!90199 () Bool)

(assert (=> bm!36323 (= c!90199 c!90200)))

(declare-fun b!831308 () Bool)

(assert (=> b!831308 (= e!463535 (contains!4209 lt!377256 (tuple2!10151 (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun c!90198 () Bool)

(declare-fun c!90197 () Bool)

(declare-fun b!831309 () Bool)

(assert (=> b!831309 (= e!463534 (ite c!90197 (t!22310 (toList!4502 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244)))) (ite c!90198 (Cons!15941 (h!17070 (toList!4502 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244)))) (t!22310 (toList!4502 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244))))) Nil!15942)))))

(declare-fun b!831310 () Bool)

(declare-fun e!463533 () List!15945)

(declare-fun call!36327 () List!15945)

(assert (=> b!831310 (= e!463533 call!36327)))

(declare-fun bm!36324 () Bool)

(declare-fun call!36326 () List!15945)

(assert (=> bm!36324 (= call!36327 call!36326)))

(declare-fun bm!36325 () Bool)

(assert (=> bm!36325 (= call!36326 call!36328)))

(declare-fun b!831311 () Bool)

(assert (=> b!831311 (= e!463533 call!36327)))

(declare-fun b!831312 () Bool)

(assert (=> b!831312 (= e!463536 call!36328)))

(declare-fun b!831313 () Bool)

(declare-fun e!463537 () List!15945)

(assert (=> b!831313 (= e!463537 call!36326)))

(declare-fun b!831314 () Bool)

(assert (=> b!831314 (= c!90198 (and ((_ is Cons!15941) (toList!4502 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244)))) (bvsgt (_1!5086 (h!17070 (toList!4502 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244))))) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> b!831314 (= e!463537 e!463533)))

(declare-fun b!831315 () Bool)

(assert (=> b!831315 (= e!463536 e!463537)))

(assert (=> b!831315 (= c!90197 (and ((_ is Cons!15941) (toList!4502 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244)))) (= (_1!5086 (h!17070 (toList!4502 (ite c!89885 call!36247 (ite c!89890 call!36246 call!36244))))) (_1!5086 (ite (or c!89885 c!89890) (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!105965 c!90200) b!831312))

(assert (= (and d!105965 (not c!90200)) b!831315))

(assert (= (and b!831315 c!90197) b!831313))

(assert (= (and b!831315 (not c!90197)) b!831314))

(assert (= (and b!831314 c!90198) b!831311))

(assert (= (and b!831314 (not c!90198)) b!831310))

(assert (= (or b!831311 b!831310) bm!36324))

(assert (= (or b!831313 bm!36324) bm!36325))

(assert (= (or b!831312 bm!36325) bm!36323))

(assert (= (and bm!36323 c!90199) b!831307))

(assert (= (and bm!36323 (not c!90199)) b!831309))

(assert (= (and d!105965 res!565861) b!831306))

(assert (= (and b!831306 res!565860) b!831308))

(declare-fun m!775031 () Bool)

(assert (=> bm!36323 m!775031))

(declare-fun m!775033 () Bool)

(assert (=> b!831306 m!775033))

(declare-fun m!775035 () Bool)

(assert (=> b!831308 m!775035))

(declare-fun m!775037 () Bool)

(assert (=> d!105965 m!775037))

(declare-fun m!775039 () Bool)

(assert (=> d!105965 m!775039))

(declare-fun m!775041 () Bool)

(assert (=> b!831307 m!775041))

(assert (=> d!105387 d!105965))

(declare-fun lt!377257 () Bool)

(declare-fun d!105967 () Bool)

(assert (=> d!105967 (= lt!377257 (select (content!386 (toList!4502 lt!376999)) (tuple2!10151 lt!376782 minValue!754)))))

(declare-fun e!463539 () Bool)

(assert (=> d!105967 (= lt!377257 e!463539)))

(declare-fun res!565862 () Bool)

(assert (=> d!105967 (=> (not res!565862) (not e!463539))))

(assert (=> d!105967 (= res!565862 ((_ is Cons!15941) (toList!4502 lt!376999)))))

(assert (=> d!105967 (= (contains!4209 (toList!4502 lt!376999) (tuple2!10151 lt!376782 minValue!754)) lt!377257)))

(declare-fun b!831316 () Bool)

(declare-fun e!463538 () Bool)

(assert (=> b!831316 (= e!463539 e!463538)))

(declare-fun res!565863 () Bool)

(assert (=> b!831316 (=> res!565863 e!463538)))

(assert (=> b!831316 (= res!565863 (= (h!17070 (toList!4502 lt!376999)) (tuple2!10151 lt!376782 minValue!754)))))

(declare-fun b!831317 () Bool)

(assert (=> b!831317 (= e!463538 (contains!4209 (t!22310 (toList!4502 lt!376999)) (tuple2!10151 lt!376782 minValue!754)))))

(assert (= (and d!105967 res!565862) b!831316))

(assert (= (and b!831316 (not res!565863)) b!831317))

(declare-fun m!775043 () Bool)

(assert (=> d!105967 m!775043))

(declare-fun m!775045 () Bool)

(assert (=> d!105967 m!775045))

(declare-fun m!775047 () Bool)

(assert (=> b!831317 m!775047))

(assert (=> b!830601 d!105967))

(declare-fun d!105969 () Bool)

(declare-fun lt!377258 () Bool)

(assert (=> d!105969 (= lt!377258 (select (content!386 lt!376941) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun e!463541 () Bool)

(assert (=> d!105969 (= lt!377258 e!463541)))

(declare-fun res!565864 () Bool)

(assert (=> d!105969 (=> (not res!565864) (not e!463541))))

(assert (=> d!105969 (= res!565864 ((_ is Cons!15941) lt!376941))))

(assert (=> d!105969 (= (contains!4209 lt!376941 (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))) lt!377258)))

(declare-fun b!831318 () Bool)

(declare-fun e!463540 () Bool)

(assert (=> b!831318 (= e!463541 e!463540)))

(declare-fun res!565865 () Bool)

(assert (=> b!831318 (=> res!565865 e!463540)))

(assert (=> b!831318 (= res!565865 (= (h!17070 lt!376941) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun b!831319 () Bool)

(assert (=> b!831319 (= e!463540 (contains!4209 (t!22310 lt!376941) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(assert (= (and d!105969 res!565864) b!831318))

(assert (= (and b!831318 (not res!565865)) b!831319))

(declare-fun m!775049 () Bool)

(assert (=> d!105969 m!775049))

(declare-fun m!775051 () Bool)

(assert (=> d!105969 m!775051))

(declare-fun m!775053 () Bool)

(assert (=> b!831319 m!775053))

(assert (=> b!830539 d!105969))

(declare-fun d!105971 () Bool)

(declare-fun res!565866 () Bool)

(declare-fun e!463542 () Bool)

(assert (=> d!105971 (=> res!565866 e!463542)))

(assert (=> d!105971 (= res!565866 (and ((_ is Cons!15941) (toList!4502 lt!376795)) (= (_1!5086 (h!17070 (toList!4502 lt!376795))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105971 (= (containsKey!401 (toList!4502 lt!376795) #b0000000000000000000000000000000000000000000000000000000000000000) e!463542)))

(declare-fun b!831320 () Bool)

(declare-fun e!463543 () Bool)

(assert (=> b!831320 (= e!463542 e!463543)))

(declare-fun res!565867 () Bool)

(assert (=> b!831320 (=> (not res!565867) (not e!463543))))

(assert (=> b!831320 (= res!565867 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376795))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376795))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15941) (toList!4502 lt!376795)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376795))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831321 () Bool)

(assert (=> b!831321 (= e!463543 (containsKey!401 (t!22310 (toList!4502 lt!376795)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105971 (not res!565866)) b!831320))

(assert (= (and b!831320 res!565867) b!831321))

(declare-fun m!775055 () Bool)

(assert (=> b!831321 m!775055))

(assert (=> d!105383 d!105971))

(assert (=> b!830452 d!105749))

(assert (=> b!830452 d!105751))

(assert (=> b!830588 d!105619))

(declare-fun lt!377259 () Bool)

(declare-fun d!105973 () Bool)

(assert (=> d!105973 (= lt!377259 (select (content!386 (toList!4502 lt!377010)) (tuple2!10151 lt!376788 zeroValueBefore!34)))))

(declare-fun e!463545 () Bool)

(assert (=> d!105973 (= lt!377259 e!463545)))

(declare-fun res!565868 () Bool)

(assert (=> d!105973 (=> (not res!565868) (not e!463545))))

(assert (=> d!105973 (= res!565868 ((_ is Cons!15941) (toList!4502 lt!377010)))))

(assert (=> d!105973 (= (contains!4209 (toList!4502 lt!377010) (tuple2!10151 lt!376788 zeroValueBefore!34)) lt!377259)))

(declare-fun b!831322 () Bool)

(declare-fun e!463544 () Bool)

(assert (=> b!831322 (= e!463545 e!463544)))

(declare-fun res!565869 () Bool)

(assert (=> b!831322 (=> res!565869 e!463544)))

(assert (=> b!831322 (= res!565869 (= (h!17070 (toList!4502 lt!377010)) (tuple2!10151 lt!376788 zeroValueBefore!34)))))

(declare-fun b!831323 () Bool)

(assert (=> b!831323 (= e!463544 (contains!4209 (t!22310 (toList!4502 lt!377010)) (tuple2!10151 lt!376788 zeroValueBefore!34)))))

(assert (= (and d!105973 res!565868) b!831322))

(assert (= (and b!831322 (not res!565869)) b!831323))

(declare-fun m!775057 () Bool)

(assert (=> d!105973 m!775057))

(declare-fun m!775059 () Bool)

(assert (=> d!105973 m!775059))

(declare-fun m!775061 () Bool)

(assert (=> b!831323 m!775061))

(assert (=> b!830608 d!105973))

(declare-fun b!831325 () Bool)

(declare-fun e!463546 () Option!421)

(declare-fun e!463547 () Option!421)

(assert (=> b!831325 (= e!463546 e!463547)))

(declare-fun c!90202 () Bool)

(assert (=> b!831325 (= c!90202 (and ((_ is Cons!15941) (t!22310 lt!376713)) (not (= (_1!5086 (h!17070 (t!22310 lt!376713))) (_1!5086 lt!376677)))))))

(declare-fun b!831326 () Bool)

(assert (=> b!831326 (= e!463547 (getValueByKey!415 (t!22310 (t!22310 lt!376713)) (_1!5086 lt!376677)))))

(declare-fun b!831327 () Bool)

(assert (=> b!831327 (= e!463547 None!419)))

(declare-fun b!831324 () Bool)

(assert (=> b!831324 (= e!463546 (Some!420 (_2!5086 (h!17070 (t!22310 lt!376713)))))))

(declare-fun d!105975 () Bool)

(declare-fun c!90201 () Bool)

(assert (=> d!105975 (= c!90201 (and ((_ is Cons!15941) (t!22310 lt!376713)) (= (_1!5086 (h!17070 (t!22310 lt!376713))) (_1!5086 lt!376677))))))

(assert (=> d!105975 (= (getValueByKey!415 (t!22310 lt!376713) (_1!5086 lt!376677)) e!463546)))

(assert (= (and d!105975 c!90201) b!831324))

(assert (= (and d!105975 (not c!90201)) b!831325))

(assert (= (and b!831325 c!90202) b!831326))

(assert (= (and b!831325 (not c!90202)) b!831327))

(declare-fun m!775063 () Bool)

(assert (=> b!831326 m!775063))

(assert (=> b!830485 d!105975))

(assert (=> b!830634 d!105801))

(assert (=> b!830634 d!105549))

(declare-fun d!105977 () Bool)

(declare-fun lt!377260 () Bool)

(assert (=> d!105977 (= lt!377260 (select (content!386 (t!22310 (toList!4502 lt!376833))) lt!376677))))

(declare-fun e!463549 () Bool)

(assert (=> d!105977 (= lt!377260 e!463549)))

(declare-fun res!565870 () Bool)

(assert (=> d!105977 (=> (not res!565870) (not e!463549))))

(assert (=> d!105977 (= res!565870 ((_ is Cons!15941) (t!22310 (toList!4502 lt!376833))))))

(assert (=> d!105977 (= (contains!4209 (t!22310 (toList!4502 lt!376833)) lt!376677) lt!377260)))

(declare-fun b!831328 () Bool)

(declare-fun e!463548 () Bool)

(assert (=> b!831328 (= e!463549 e!463548)))

(declare-fun res!565871 () Bool)

(assert (=> b!831328 (=> res!565871 e!463548)))

(assert (=> b!831328 (= res!565871 (= (h!17070 (t!22310 (toList!4502 lt!376833))) lt!376677))))

(declare-fun b!831329 () Bool)

(assert (=> b!831329 (= e!463548 (contains!4209 (t!22310 (t!22310 (toList!4502 lt!376833))) lt!376677))))

(assert (= (and d!105977 res!565870) b!831328))

(assert (= (and b!831328 (not res!565871)) b!831329))

(assert (=> d!105977 m!774815))

(declare-fun m!775065 () Bool)

(assert (=> d!105977 m!775065))

(declare-fun m!775067 () Bool)

(assert (=> b!831329 m!775067))

(assert (=> b!830441 d!105977))

(declare-fun d!105979 () Bool)

(declare-fun e!463550 () Bool)

(assert (=> d!105979 e!463550))

(declare-fun res!565872 () Bool)

(assert (=> d!105979 (=> res!565872 e!463550)))

(declare-fun lt!377261 () Bool)

(assert (=> d!105979 (= res!565872 (not lt!377261))))

(declare-fun lt!377263 () Bool)

(assert (=> d!105979 (= lt!377261 lt!377263)))

(declare-fun lt!377262 () Unit!28429)

(declare-fun e!463551 () Unit!28429)

(assert (=> d!105979 (= lt!377262 e!463551)))

(declare-fun c!90203 () Bool)

(assert (=> d!105979 (= c!90203 lt!377263)))

(assert (=> d!105979 (= lt!377263 (containsKey!401 (toList!4502 lt!376953) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))

(assert (=> d!105979 (= (contains!4208 lt!376953 (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))) lt!377261)))

(declare-fun b!831330 () Bool)

(declare-fun lt!377264 () Unit!28429)

(assert (=> b!831330 (= e!463551 lt!377264)))

(assert (=> b!831330 (= lt!377264 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376953) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))

(assert (=> b!831330 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376953) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))

(declare-fun b!831331 () Bool)

(declare-fun Unit!28473 () Unit!28429)

(assert (=> b!831331 (= e!463551 Unit!28473)))

(declare-fun b!831332 () Bool)

(assert (=> b!831332 (= e!463550 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376953) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)))))))

(assert (= (and d!105979 c!90203) b!831330))

(assert (= (and d!105979 (not c!90203)) b!831331))

(assert (= (and d!105979 (not res!565872)) b!831332))

(declare-fun m!775069 () Bool)

(assert (=> d!105979 m!775069))

(declare-fun m!775071 () Bool)

(assert (=> b!831330 m!775071))

(assert (=> b!831330 m!773795))

(assert (=> b!831330 m!773795))

(declare-fun m!775073 () Bool)

(assert (=> b!831330 m!775073))

(assert (=> b!831332 m!773795))

(assert (=> b!831332 m!773795))

(assert (=> b!831332 m!775073))

(assert (=> d!105437 d!105979))

(declare-fun b!831334 () Bool)

(declare-fun e!463552 () Option!421)

(declare-fun e!463553 () Option!421)

(assert (=> b!831334 (= e!463552 e!463553)))

(declare-fun c!90205 () Bool)

(assert (=> b!831334 (= c!90205 (and ((_ is Cons!15941) lt!376950) (not (= (_1!5086 (h!17070 lt!376950)) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))))

(declare-fun b!831335 () Bool)

(assert (=> b!831335 (= e!463553 (getValueByKey!415 (t!22310 lt!376950) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))

(declare-fun b!831336 () Bool)

(assert (=> b!831336 (= e!463553 None!419)))

(declare-fun b!831333 () Bool)

(assert (=> b!831333 (= e!463552 (Some!420 (_2!5086 (h!17070 lt!376950))))))

(declare-fun c!90204 () Bool)

(declare-fun d!105981 () Bool)

(assert (=> d!105981 (= c!90204 (and ((_ is Cons!15941) lt!376950) (= (_1!5086 (h!17070 lt!376950)) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)))))))

(assert (=> d!105981 (= (getValueByKey!415 lt!376950 (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))) e!463552)))

(assert (= (and d!105981 c!90204) b!831333))

(assert (= (and d!105981 (not c!90204)) b!831334))

(assert (= (and b!831334 c!90205) b!831335))

(assert (= (and b!831334 (not c!90205)) b!831336))

(declare-fun m!775075 () Bool)

(assert (=> b!831335 m!775075))

(assert (=> d!105437 d!105981))

(declare-fun d!105983 () Bool)

(assert (=> d!105983 (= (getValueByKey!415 lt!376950 (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))) (Some!420 (_2!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))

(declare-fun lt!377265 () Unit!28429)

(assert (=> d!105983 (= lt!377265 (choose!1418 lt!376950 (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))

(declare-fun e!463554 () Bool)

(assert (=> d!105983 e!463554))

(declare-fun res!565873 () Bool)

(assert (=> d!105983 (=> (not res!565873) (not e!463554))))

(assert (=> d!105983 (= res!565873 (isStrictlySorted!441 lt!376950))))

(assert (=> d!105983 (= (lemmaContainsTupThenGetReturnValue!229 lt!376950 (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))) lt!377265)))

(declare-fun b!831337 () Bool)

(declare-fun res!565874 () Bool)

(assert (=> b!831337 (=> (not res!565874) (not e!463554))))

(assert (=> b!831337 (= res!565874 (containsKey!401 lt!376950 (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))

(declare-fun b!831338 () Bool)

(assert (=> b!831338 (= e!463554 (contains!4209 lt!376950 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)))))))

(assert (= (and d!105983 res!565873) b!831337))

(assert (= (and b!831337 res!565874) b!831338))

(assert (=> d!105983 m!773789))

(declare-fun m!775077 () Bool)

(assert (=> d!105983 m!775077))

(declare-fun m!775079 () Bool)

(assert (=> d!105983 m!775079))

(declare-fun m!775081 () Bool)

(assert (=> b!831337 m!775081))

(declare-fun m!775083 () Bool)

(assert (=> b!831338 m!775083))

(assert (=> d!105437 d!105983))

(declare-fun d!105985 () Bool)

(declare-fun e!463557 () Bool)

(assert (=> d!105985 e!463557))

(declare-fun res!565876 () Bool)

(assert (=> d!105985 (=> (not res!565876) (not e!463557))))

(declare-fun lt!377266 () List!15945)

(assert (=> d!105985 (= res!565876 (isStrictlySorted!441 lt!377266))))

(declare-fun e!463558 () List!15945)

(assert (=> d!105985 (= lt!377266 e!463558)))

(declare-fun c!90209 () Bool)

(assert (=> d!105985 (= c!90209 (and ((_ is Cons!15941) (toList!4502 lt!376824)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376824))) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)))))))

(assert (=> d!105985 (isStrictlySorted!441 (toList!4502 lt!376824))))

(assert (=> d!105985 (= (insertStrictlySorted!268 (toList!4502 lt!376824) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))) lt!377266)))

(declare-fun b!831339 () Bool)

(declare-fun res!565875 () Bool)

(assert (=> b!831339 (=> (not res!565875) (not e!463557))))

(assert (=> b!831339 (= res!565875 (containsKey!401 lt!377266 (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))

(declare-fun e!463556 () List!15945)

(declare-fun b!831340 () Bool)

(assert (=> b!831340 (= e!463556 (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376824)) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))

(declare-fun bm!36326 () Bool)

(declare-fun call!36331 () List!15945)

(assert (=> bm!36326 (= call!36331 ($colon$colon!536 e!463556 (ite c!90209 (h!17070 (toList!4502 lt!376824)) (tuple2!10151 (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376810 zeroValueAfter!34))))))))

(declare-fun c!90208 () Bool)

(assert (=> bm!36326 (= c!90208 c!90209)))

(declare-fun b!831341 () Bool)

(assert (=> b!831341 (= e!463557 (contains!4209 lt!377266 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)))))))

(declare-fun c!90206 () Bool)

(declare-fun c!90207 () Bool)

(declare-fun b!831342 () Bool)

(assert (=> b!831342 (= e!463556 (ite c!90206 (t!22310 (toList!4502 lt!376824)) (ite c!90207 (Cons!15941 (h!17070 (toList!4502 lt!376824)) (t!22310 (toList!4502 lt!376824))) Nil!15942)))))

(declare-fun b!831343 () Bool)

(declare-fun e!463555 () List!15945)

(declare-fun call!36330 () List!15945)

(assert (=> b!831343 (= e!463555 call!36330)))

(declare-fun bm!36327 () Bool)

(declare-fun call!36329 () List!15945)

(assert (=> bm!36327 (= call!36330 call!36329)))

(declare-fun bm!36328 () Bool)

(assert (=> bm!36328 (= call!36329 call!36331)))

(declare-fun b!831344 () Bool)

(assert (=> b!831344 (= e!463555 call!36330)))

(declare-fun b!831345 () Bool)

(assert (=> b!831345 (= e!463558 call!36331)))

(declare-fun b!831346 () Bool)

(declare-fun e!463559 () List!15945)

(assert (=> b!831346 (= e!463559 call!36329)))

(declare-fun b!831347 () Bool)

(assert (=> b!831347 (= c!90207 (and ((_ is Cons!15941) (toList!4502 lt!376824)) (bvsgt (_1!5086 (h!17070 (toList!4502 lt!376824))) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)))))))

(assert (=> b!831347 (= e!463559 e!463555)))

(declare-fun b!831348 () Bool)

(assert (=> b!831348 (= e!463558 e!463559)))

(assert (=> b!831348 (= c!90206 (and ((_ is Cons!15941) (toList!4502 lt!376824)) (= (_1!5086 (h!17070 (toList!4502 lt!376824))) (_1!5086 (tuple2!10151 lt!376810 zeroValueAfter!34)))))))

(assert (= (and d!105985 c!90209) b!831345))

(assert (= (and d!105985 (not c!90209)) b!831348))

(assert (= (and b!831348 c!90206) b!831346))

(assert (= (and b!831348 (not c!90206)) b!831347))

(assert (= (and b!831347 c!90207) b!831344))

(assert (= (and b!831347 (not c!90207)) b!831343))

(assert (= (or b!831344 b!831343) bm!36327))

(assert (= (or b!831346 bm!36327) bm!36328))

(assert (= (or b!831345 bm!36328) bm!36326))

(assert (= (and bm!36326 c!90208) b!831340))

(assert (= (and bm!36326 (not c!90208)) b!831342))

(assert (= (and d!105985 res!565876) b!831339))

(assert (= (and b!831339 res!565875) b!831341))

(declare-fun m!775085 () Bool)

(assert (=> bm!36326 m!775085))

(declare-fun m!775087 () Bool)

(assert (=> b!831339 m!775087))

(declare-fun m!775089 () Bool)

(assert (=> b!831341 m!775089))

(declare-fun m!775091 () Bool)

(assert (=> d!105985 m!775091))

(declare-fun m!775093 () Bool)

(assert (=> d!105985 m!775093))

(declare-fun m!775095 () Bool)

(assert (=> b!831340 m!775095))

(assert (=> d!105437 d!105985))

(declare-fun d!105987 () Bool)

(assert (=> d!105987 (= (get!11818 (getValueByKey!415 (toList!4502 lt!376863) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))) (v!10095 (getValueByKey!415 (toList!4502 lt!376863) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105393 d!105987))

(assert (=> d!105393 d!105755))

(declare-fun d!105989 () Bool)

(assert (=> d!105989 (= (get!11818 (getValueByKey!415 (toList!4502 lt!376817) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10095 (getValueByKey!415 (toList!4502 lt!376817) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105517 d!105989))

(assert (=> d!105517 d!105901))

(declare-fun d!105991 () Bool)

(declare-fun lt!377267 () Bool)

(assert (=> d!105991 (= lt!377267 (select (content!386 (toList!4502 lt!377054)) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun e!463561 () Bool)

(assert (=> d!105991 (= lt!377267 e!463561)))

(declare-fun res!565877 () Bool)

(assert (=> d!105991 (=> (not res!565877) (not e!463561))))

(assert (=> d!105991 (= res!565877 ((_ is Cons!15941) (toList!4502 lt!377054)))))

(assert (=> d!105991 (= (contains!4209 (toList!4502 lt!377054) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377267)))

(declare-fun b!831349 () Bool)

(declare-fun e!463560 () Bool)

(assert (=> b!831349 (= e!463561 e!463560)))

(declare-fun res!565878 () Bool)

(assert (=> b!831349 (=> res!565878 e!463560)))

(assert (=> b!831349 (= res!565878 (= (h!17070 (toList!4502 lt!377054)) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!831350 () Bool)

(assert (=> b!831350 (= e!463560 (contains!4209 (t!22310 (toList!4502 lt!377054)) (tuple2!10151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105991 res!565877) b!831349))

(assert (= (and b!831349 (not res!565878)) b!831350))

(declare-fun m!775097 () Bool)

(assert (=> d!105991 m!775097))

(declare-fun m!775099 () Bool)

(assert (=> d!105991 m!775099))

(declare-fun m!775101 () Bool)

(assert (=> b!831350 m!775101))

(assert (=> b!830697 d!105991))

(assert (=> d!105571 d!105569))

(declare-fun d!105993 () Bool)

(assert (=> d!105993 (= (getValueByKey!415 lt!376717 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!420 (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105993 true))

(declare-fun _$22!571 () Unit!28429)

(assert (=> d!105993 (= (choose!1418 lt!376717 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) _$22!571)))

(declare-fun bs!23239 () Bool)

(assert (= bs!23239 d!105993))

(assert (=> bs!23239 m!773343))

(assert (=> d!105571 d!105993))

(declare-fun d!105995 () Bool)

(declare-fun res!565879 () Bool)

(declare-fun e!463562 () Bool)

(assert (=> d!105995 (=> res!565879 e!463562)))

(assert (=> d!105995 (= res!565879 (or ((_ is Nil!15942) lt!376717) ((_ is Nil!15942) (t!22310 lt!376717))))))

(assert (=> d!105995 (= (isStrictlySorted!441 lt!376717) e!463562)))

(declare-fun b!831351 () Bool)

(declare-fun e!463563 () Bool)

(assert (=> b!831351 (= e!463562 e!463563)))

(declare-fun res!565880 () Bool)

(assert (=> b!831351 (=> (not res!565880) (not e!463563))))

(assert (=> b!831351 (= res!565880 (bvslt (_1!5086 (h!17070 lt!376717)) (_1!5086 (h!17070 (t!22310 lt!376717)))))))

(declare-fun b!831352 () Bool)

(assert (=> b!831352 (= e!463563 (isStrictlySorted!441 (t!22310 lt!376717)))))

(assert (= (and d!105995 (not res!565879)) b!831351))

(assert (= (and b!831351 res!565880) b!831352))

(declare-fun m!775103 () Bool)

(assert (=> b!831352 m!775103))

(assert (=> d!105571 d!105995))

(declare-fun d!105997 () Bool)

(assert (=> d!105997 (= (get!11818 (getValueByKey!415 (toList!4502 (+!1980 lt!376816 (tuple2!10151 lt!376804 minValue!754))) lt!376818)) (v!10095 (getValueByKey!415 (toList!4502 (+!1980 lt!376816 (tuple2!10151 lt!376804 minValue!754))) lt!376818)))))

(assert (=> d!105433 d!105997))

(declare-fun b!831354 () Bool)

(declare-fun e!463564 () Option!421)

(declare-fun e!463565 () Option!421)

(assert (=> b!831354 (= e!463564 e!463565)))

(declare-fun c!90211 () Bool)

(assert (=> b!831354 (= c!90211 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376816 (tuple2!10151 lt!376804 minValue!754)))) (not (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376816 (tuple2!10151 lt!376804 minValue!754))))) lt!376818))))))

(declare-fun b!831355 () Bool)

(assert (=> b!831355 (= e!463565 (getValueByKey!415 (t!22310 (toList!4502 (+!1980 lt!376816 (tuple2!10151 lt!376804 minValue!754)))) lt!376818))))

(declare-fun b!831356 () Bool)

(assert (=> b!831356 (= e!463565 None!419)))

(declare-fun b!831353 () Bool)

(assert (=> b!831353 (= e!463564 (Some!420 (_2!5086 (h!17070 (toList!4502 (+!1980 lt!376816 (tuple2!10151 lt!376804 minValue!754)))))))))

(declare-fun c!90210 () Bool)

(declare-fun d!105999 () Bool)

(assert (=> d!105999 (= c!90210 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376816 (tuple2!10151 lt!376804 minValue!754)))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376816 (tuple2!10151 lt!376804 minValue!754))))) lt!376818)))))

(assert (=> d!105999 (= (getValueByKey!415 (toList!4502 (+!1980 lt!376816 (tuple2!10151 lt!376804 minValue!754))) lt!376818) e!463564)))

(assert (= (and d!105999 c!90210) b!831353))

(assert (= (and d!105999 (not c!90210)) b!831354))

(assert (= (and b!831354 c!90211) b!831355))

(assert (= (and b!831354 (not c!90211)) b!831356))

(declare-fun m!775105 () Bool)

(assert (=> b!831355 m!775105))

(assert (=> d!105433 d!105999))

(assert (=> d!105453 d!105445))

(assert (=> d!105453 d!105437))

(declare-fun d!106001 () Bool)

(assert (=> d!106001 (contains!4208 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34)) lt!376805)))

(assert (=> d!106001 true))

(declare-fun _$35!424 () Unit!28429)

(assert (=> d!106001 (= (choose!1420 lt!376824 lt!376810 zeroValueAfter!34 lt!376805) _$35!424)))

(declare-fun bs!23240 () Bool)

(assert (= bs!23240 d!106001))

(assert (=> bs!23240 m!773477))

(assert (=> bs!23240 m!773477))

(assert (=> bs!23240 m!773479))

(assert (=> d!105453 d!106001))

(declare-fun d!106003 () Bool)

(declare-fun e!463566 () Bool)

(assert (=> d!106003 e!463566))

(declare-fun res!565881 () Bool)

(assert (=> d!106003 (=> res!565881 e!463566)))

(declare-fun lt!377268 () Bool)

(assert (=> d!106003 (= res!565881 (not lt!377268))))

(declare-fun lt!377270 () Bool)

(assert (=> d!106003 (= lt!377268 lt!377270)))

(declare-fun lt!377269 () Unit!28429)

(declare-fun e!463567 () Unit!28429)

(assert (=> d!106003 (= lt!377269 e!463567)))

(declare-fun c!90212 () Bool)

(assert (=> d!106003 (= c!90212 lt!377270)))

(assert (=> d!106003 (= lt!377270 (containsKey!401 (toList!4502 lt!376824) lt!376805))))

(assert (=> d!106003 (= (contains!4208 lt!376824 lt!376805) lt!377268)))

(declare-fun b!831358 () Bool)

(declare-fun lt!377271 () Unit!28429)

(assert (=> b!831358 (= e!463567 lt!377271)))

(assert (=> b!831358 (= lt!377271 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376824) lt!376805))))

(assert (=> b!831358 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376824) lt!376805))))

(declare-fun b!831359 () Bool)

(declare-fun Unit!28474 () Unit!28429)

(assert (=> b!831359 (= e!463567 Unit!28474)))

(declare-fun b!831360 () Bool)

(assert (=> b!831360 (= e!463566 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376824) lt!376805)))))

(assert (= (and d!106003 c!90212) b!831358))

(assert (= (and d!106003 (not c!90212)) b!831359))

(assert (= (and d!106003 (not res!565881)) b!831360))

(declare-fun m!775107 () Bool)

(assert (=> d!106003 m!775107))

(declare-fun m!775109 () Bool)

(assert (=> b!831358 m!775109))

(declare-fun m!775111 () Bool)

(assert (=> b!831358 m!775111))

(assert (=> b!831358 m!775111))

(declare-fun m!775113 () Bool)

(assert (=> b!831358 m!775113))

(assert (=> b!831360 m!775111))

(assert (=> b!831360 m!775111))

(assert (=> b!831360 m!775113))

(assert (=> d!105453 d!106003))

(assert (=> b!830530 d!105839))

(assert (=> b!830530 d!105515))

(declare-fun d!106005 () Bool)

(assert (=> d!106005 (= (get!11818 (getValueByKey!415 (toList!4502 lt!376825) lt!376809)) (v!10095 (getValueByKey!415 (toList!4502 lt!376825) lt!376809)))))

(assert (=> d!105443 d!106005))

(declare-fun b!831362 () Bool)

(declare-fun e!463568 () Option!421)

(declare-fun e!463569 () Option!421)

(assert (=> b!831362 (= e!463568 e!463569)))

(declare-fun c!90214 () Bool)

(assert (=> b!831362 (= c!90214 (and ((_ is Cons!15941) (toList!4502 lt!376825)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376825))) lt!376809))))))

(declare-fun b!831363 () Bool)

(assert (=> b!831363 (= e!463569 (getValueByKey!415 (t!22310 (toList!4502 lt!376825)) lt!376809))))

(declare-fun b!831364 () Bool)

(assert (=> b!831364 (= e!463569 None!419)))

(declare-fun b!831361 () Bool)

(assert (=> b!831361 (= e!463568 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376825)))))))

(declare-fun d!106007 () Bool)

(declare-fun c!90213 () Bool)

(assert (=> d!106007 (= c!90213 (and ((_ is Cons!15941) (toList!4502 lt!376825)) (= (_1!5086 (h!17070 (toList!4502 lt!376825))) lt!376809)))))

(assert (=> d!106007 (= (getValueByKey!415 (toList!4502 lt!376825) lt!376809) e!463568)))

(assert (= (and d!106007 c!90213) b!831361))

(assert (= (and d!106007 (not c!90213)) b!831362))

(assert (= (and b!831362 c!90214) b!831363))

(assert (= (and b!831362 (not c!90214)) b!831364))

(declare-fun m!775115 () Bool)

(assert (=> b!831363 m!775115))

(assert (=> d!105443 d!106007))

(declare-fun d!106009 () Bool)

(declare-fun lt!377272 () Bool)

(assert (=> d!106009 (= lt!377272 (select (content!386 (toList!4502 lt!377093)) (tuple2!10151 lt!376861 lt!376859)))))

(declare-fun e!463571 () Bool)

(assert (=> d!106009 (= lt!377272 e!463571)))

(declare-fun res!565882 () Bool)

(assert (=> d!106009 (=> (not res!565882) (not e!463571))))

(assert (=> d!106009 (= res!565882 ((_ is Cons!15941) (toList!4502 lt!377093)))))

(assert (=> d!106009 (= (contains!4209 (toList!4502 lt!377093) (tuple2!10151 lt!376861 lt!376859)) lt!377272)))

(declare-fun b!831365 () Bool)

(declare-fun e!463570 () Bool)

(assert (=> b!831365 (= e!463571 e!463570)))

(declare-fun res!565883 () Bool)

(assert (=> b!831365 (=> res!565883 e!463570)))

(assert (=> b!831365 (= res!565883 (= (h!17070 (toList!4502 lt!377093)) (tuple2!10151 lt!376861 lt!376859)))))

(declare-fun b!831366 () Bool)

(assert (=> b!831366 (= e!463570 (contains!4209 (t!22310 (toList!4502 lt!377093)) (tuple2!10151 lt!376861 lt!376859)))))

(assert (= (and d!106009 res!565882) b!831365))

(assert (= (and b!831365 (not res!565883)) b!831366))

(declare-fun m!775117 () Bool)

(assert (=> d!106009 m!775117))

(declare-fun m!775119 () Bool)

(assert (=> d!106009 m!775119))

(declare-fun m!775121 () Bool)

(assert (=> b!831366 m!775121))

(assert (=> b!830758 d!106009))

(assert (=> b!830615 d!105843))

(assert (=> b!830615 d!105545))

(assert (=> b!830704 d!105847))

(assert (=> b!830704 d!105849))

(declare-fun b!831368 () Bool)

(declare-fun e!463572 () Option!421)

(declare-fun e!463573 () Option!421)

(assert (=> b!831368 (= e!463572 e!463573)))

(declare-fun c!90216 () Bool)

(assert (=> b!831368 (= c!90216 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376829))) (not (= (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376829)))) (_1!5086 lt!376677)))))))

(declare-fun b!831369 () Bool)

(assert (=> b!831369 (= e!463573 (getValueByKey!415 (t!22310 (t!22310 (toList!4502 lt!376829))) (_1!5086 lt!376677)))))

(declare-fun b!831370 () Bool)

(assert (=> b!831370 (= e!463573 None!419)))

(declare-fun b!831367 () Bool)

(assert (=> b!831367 (= e!463572 (Some!420 (_2!5086 (h!17070 (t!22310 (toList!4502 lt!376829))))))))

(declare-fun d!106011 () Bool)

(declare-fun c!90215 () Bool)

(assert (=> d!106011 (= c!90215 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376829))) (= (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376829)))) (_1!5086 lt!376677))))))

(assert (=> d!106011 (= (getValueByKey!415 (t!22310 (toList!4502 lt!376829)) (_1!5086 lt!376677)) e!463572)))

(assert (= (and d!106011 c!90215) b!831367))

(assert (= (and d!106011 (not c!90215)) b!831368))

(assert (= (and b!831368 c!90216) b!831369))

(assert (= (and b!831368 (not c!90216)) b!831370))

(declare-fun m!775123 () Bool)

(assert (=> b!831369 m!775123))

(assert (=> b!830656 d!106011))

(assert (=> d!105557 d!105367))

(assert (=> d!105557 d!105365))

(declare-fun d!106013 () Bool)

(assert (=> d!106013 (= ($colon$colon!536 e!463134 (ite c!89974 (h!17070 (toList!4502 lt!376683)) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679)))) (Cons!15941 (ite c!89974 (h!17070 (toList!4502 lt!376683)) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))) e!463134))))

(assert (=> bm!36275 d!106013))

(declare-fun d!106015 () Bool)

(declare-fun e!463574 () Bool)

(assert (=> d!106015 e!463574))

(declare-fun res!565884 () Bool)

(assert (=> d!106015 (=> res!565884 e!463574)))

(declare-fun lt!377273 () Bool)

(assert (=> d!106015 (= res!565884 (not lt!377273))))

(declare-fun lt!377275 () Bool)

(assert (=> d!106015 (= lt!377273 lt!377275)))

(declare-fun lt!377274 () Unit!28429)

(declare-fun e!463575 () Unit!28429)

(assert (=> d!106015 (= lt!377274 e!463575)))

(declare-fun c!90217 () Bool)

(assert (=> d!106015 (= c!90217 lt!377275)))

(assert (=> d!106015 (= lt!377275 (containsKey!401 (toList!4502 lt!376913) (_1!5086 (tuple2!10151 lt!376854 lt!376852))))))

(assert (=> d!106015 (= (contains!4208 lt!376913 (_1!5086 (tuple2!10151 lt!376854 lt!376852))) lt!377273)))

(declare-fun b!831371 () Bool)

(declare-fun lt!377276 () Unit!28429)

(assert (=> b!831371 (= e!463575 lt!377276)))

(assert (=> b!831371 (= lt!377276 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376913) (_1!5086 (tuple2!10151 lt!376854 lt!376852))))))

(assert (=> b!831371 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376913) (_1!5086 (tuple2!10151 lt!376854 lt!376852))))))

(declare-fun b!831372 () Bool)

(declare-fun Unit!28475 () Unit!28429)

(assert (=> b!831372 (= e!463575 Unit!28475)))

(declare-fun b!831373 () Bool)

(assert (=> b!831373 (= e!463574 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376913) (_1!5086 (tuple2!10151 lt!376854 lt!376852)))))))

(assert (= (and d!106015 c!90217) b!831371))

(assert (= (and d!106015 (not c!90217)) b!831372))

(assert (= (and d!106015 (not res!565884)) b!831373))

(declare-fun m!775125 () Bool)

(assert (=> d!106015 m!775125))

(declare-fun m!775127 () Bool)

(assert (=> b!831371 m!775127))

(assert (=> b!831371 m!773669))

(assert (=> b!831371 m!773669))

(declare-fun m!775129 () Bool)

(assert (=> b!831371 m!775129))

(assert (=> b!831373 m!773669))

(assert (=> b!831373 m!773669))

(assert (=> b!831373 m!775129))

(assert (=> d!105399 d!106015))

(declare-fun b!831375 () Bool)

(declare-fun e!463576 () Option!421)

(declare-fun e!463577 () Option!421)

(assert (=> b!831375 (= e!463576 e!463577)))

(declare-fun c!90219 () Bool)

(assert (=> b!831375 (= c!90219 (and ((_ is Cons!15941) lt!376910) (not (= (_1!5086 (h!17070 lt!376910)) (_1!5086 (tuple2!10151 lt!376854 lt!376852))))))))

(declare-fun b!831376 () Bool)

(assert (=> b!831376 (= e!463577 (getValueByKey!415 (t!22310 lt!376910) (_1!5086 (tuple2!10151 lt!376854 lt!376852))))))

(declare-fun b!831377 () Bool)

(assert (=> b!831377 (= e!463577 None!419)))

(declare-fun b!831374 () Bool)

(assert (=> b!831374 (= e!463576 (Some!420 (_2!5086 (h!17070 lt!376910))))))

(declare-fun c!90218 () Bool)

(declare-fun d!106017 () Bool)

(assert (=> d!106017 (= c!90218 (and ((_ is Cons!15941) lt!376910) (= (_1!5086 (h!17070 lt!376910)) (_1!5086 (tuple2!10151 lt!376854 lt!376852)))))))

(assert (=> d!106017 (= (getValueByKey!415 lt!376910 (_1!5086 (tuple2!10151 lt!376854 lt!376852))) e!463576)))

(assert (= (and d!106017 c!90218) b!831374))

(assert (= (and d!106017 (not c!90218)) b!831375))

(assert (= (and b!831375 c!90219) b!831376))

(assert (= (and b!831375 (not c!90219)) b!831377))

(declare-fun m!775131 () Bool)

(assert (=> b!831376 m!775131))

(assert (=> d!105399 d!106017))

(declare-fun d!106019 () Bool)

(assert (=> d!106019 (= (getValueByKey!415 lt!376910 (_1!5086 (tuple2!10151 lt!376854 lt!376852))) (Some!420 (_2!5086 (tuple2!10151 lt!376854 lt!376852))))))

(declare-fun lt!377277 () Unit!28429)

(assert (=> d!106019 (= lt!377277 (choose!1418 lt!376910 (_1!5086 (tuple2!10151 lt!376854 lt!376852)) (_2!5086 (tuple2!10151 lt!376854 lt!376852))))))

(declare-fun e!463578 () Bool)

(assert (=> d!106019 e!463578))

(declare-fun res!565885 () Bool)

(assert (=> d!106019 (=> (not res!565885) (not e!463578))))

(assert (=> d!106019 (= res!565885 (isStrictlySorted!441 lt!376910))))

(assert (=> d!106019 (= (lemmaContainsTupThenGetReturnValue!229 lt!376910 (_1!5086 (tuple2!10151 lt!376854 lt!376852)) (_2!5086 (tuple2!10151 lt!376854 lt!376852))) lt!377277)))

(declare-fun b!831378 () Bool)

(declare-fun res!565886 () Bool)

(assert (=> b!831378 (=> (not res!565886) (not e!463578))))

(assert (=> b!831378 (= res!565886 (containsKey!401 lt!376910 (_1!5086 (tuple2!10151 lt!376854 lt!376852))))))

(declare-fun b!831379 () Bool)

(assert (=> b!831379 (= e!463578 (contains!4209 lt!376910 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376854 lt!376852)) (_2!5086 (tuple2!10151 lt!376854 lt!376852)))))))

(assert (= (and d!106019 res!565885) b!831378))

(assert (= (and b!831378 res!565886) b!831379))

(assert (=> d!106019 m!773663))

(declare-fun m!775133 () Bool)

(assert (=> d!106019 m!775133))

(declare-fun m!775135 () Bool)

(assert (=> d!106019 m!775135))

(declare-fun m!775137 () Bool)

(assert (=> b!831378 m!775137))

(declare-fun m!775139 () Bool)

(assert (=> b!831379 m!775139))

(assert (=> d!105399 d!106019))

(declare-fun d!106021 () Bool)

(declare-fun e!463581 () Bool)

(assert (=> d!106021 e!463581))

(declare-fun res!565888 () Bool)

(assert (=> d!106021 (=> (not res!565888) (not e!463581))))

(declare-fun lt!377278 () List!15945)

(assert (=> d!106021 (= res!565888 (isStrictlySorted!441 lt!377278))))

(declare-fun e!463582 () List!15945)

(assert (=> d!106021 (= lt!377278 e!463582)))

(declare-fun c!90223 () Bool)

(assert (=> d!106021 (= c!90223 (and ((_ is Cons!15941) (toList!4502 lt!376855)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376855))) (_1!5086 (tuple2!10151 lt!376854 lt!376852)))))))

(assert (=> d!106021 (isStrictlySorted!441 (toList!4502 lt!376855))))

(assert (=> d!106021 (= (insertStrictlySorted!268 (toList!4502 lt!376855) (_1!5086 (tuple2!10151 lt!376854 lt!376852)) (_2!5086 (tuple2!10151 lt!376854 lt!376852))) lt!377278)))

(declare-fun b!831380 () Bool)

(declare-fun res!565887 () Bool)

(assert (=> b!831380 (=> (not res!565887) (not e!463581))))

(assert (=> b!831380 (= res!565887 (containsKey!401 lt!377278 (_1!5086 (tuple2!10151 lt!376854 lt!376852))))))

(declare-fun b!831381 () Bool)

(declare-fun e!463580 () List!15945)

(assert (=> b!831381 (= e!463580 (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376855)) (_1!5086 (tuple2!10151 lt!376854 lt!376852)) (_2!5086 (tuple2!10151 lt!376854 lt!376852))))))

(declare-fun bm!36329 () Bool)

(declare-fun call!36334 () List!15945)

(assert (=> bm!36329 (= call!36334 ($colon$colon!536 e!463580 (ite c!90223 (h!17070 (toList!4502 lt!376855)) (tuple2!10151 (_1!5086 (tuple2!10151 lt!376854 lt!376852)) (_2!5086 (tuple2!10151 lt!376854 lt!376852))))))))

(declare-fun c!90222 () Bool)

(assert (=> bm!36329 (= c!90222 c!90223)))

(declare-fun b!831382 () Bool)

(assert (=> b!831382 (= e!463581 (contains!4209 lt!377278 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376854 lt!376852)) (_2!5086 (tuple2!10151 lt!376854 lt!376852)))))))

(declare-fun b!831383 () Bool)

(declare-fun c!90221 () Bool)

(declare-fun c!90220 () Bool)

(assert (=> b!831383 (= e!463580 (ite c!90220 (t!22310 (toList!4502 lt!376855)) (ite c!90221 (Cons!15941 (h!17070 (toList!4502 lt!376855)) (t!22310 (toList!4502 lt!376855))) Nil!15942)))))

(declare-fun b!831384 () Bool)

(declare-fun e!463579 () List!15945)

(declare-fun call!36333 () List!15945)

(assert (=> b!831384 (= e!463579 call!36333)))

(declare-fun bm!36330 () Bool)

(declare-fun call!36332 () List!15945)

(assert (=> bm!36330 (= call!36333 call!36332)))

(declare-fun bm!36331 () Bool)

(assert (=> bm!36331 (= call!36332 call!36334)))

(declare-fun b!831385 () Bool)

(assert (=> b!831385 (= e!463579 call!36333)))

(declare-fun b!831386 () Bool)

(assert (=> b!831386 (= e!463582 call!36334)))

(declare-fun b!831387 () Bool)

(declare-fun e!463583 () List!15945)

(assert (=> b!831387 (= e!463583 call!36332)))

(declare-fun b!831388 () Bool)

(assert (=> b!831388 (= c!90221 (and ((_ is Cons!15941) (toList!4502 lt!376855)) (bvsgt (_1!5086 (h!17070 (toList!4502 lt!376855))) (_1!5086 (tuple2!10151 lt!376854 lt!376852)))))))

(assert (=> b!831388 (= e!463583 e!463579)))

(declare-fun b!831389 () Bool)

(assert (=> b!831389 (= e!463582 e!463583)))

(assert (=> b!831389 (= c!90220 (and ((_ is Cons!15941) (toList!4502 lt!376855)) (= (_1!5086 (h!17070 (toList!4502 lt!376855))) (_1!5086 (tuple2!10151 lt!376854 lt!376852)))))))

(assert (= (and d!106021 c!90223) b!831386))

(assert (= (and d!106021 (not c!90223)) b!831389))

(assert (= (and b!831389 c!90220) b!831387))

(assert (= (and b!831389 (not c!90220)) b!831388))

(assert (= (and b!831388 c!90221) b!831385))

(assert (= (and b!831388 (not c!90221)) b!831384))

(assert (= (or b!831385 b!831384) bm!36330))

(assert (= (or b!831387 bm!36330) bm!36331))

(assert (= (or b!831386 bm!36331) bm!36329))

(assert (= (and bm!36329 c!90222) b!831381))

(assert (= (and bm!36329 (not c!90222)) b!831383))

(assert (= (and d!106021 res!565888) b!831380))

(assert (= (and b!831380 res!565887) b!831382))

(declare-fun m!775141 () Bool)

(assert (=> bm!36329 m!775141))

(declare-fun m!775143 () Bool)

(assert (=> b!831380 m!775143))

(declare-fun m!775145 () Bool)

(assert (=> b!831382 m!775145))

(declare-fun m!775147 () Bool)

(assert (=> d!106021 m!775147))

(declare-fun m!775149 () Bool)

(assert (=> d!106021 m!775149))

(declare-fun m!775151 () Bool)

(assert (=> b!831381 m!775151))

(assert (=> d!105399 d!106021))

(declare-fun d!106023 () Bool)

(assert (=> d!106023 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376833) (_1!5086 lt!376677)))))

(declare-fun lt!377279 () Unit!28429)

(assert (=> d!106023 (= lt!377279 (choose!1421 (toList!4502 lt!376833) (_1!5086 lt!376677)))))

(declare-fun e!463584 () Bool)

(assert (=> d!106023 e!463584))

(declare-fun res!565889 () Bool)

(assert (=> d!106023 (=> (not res!565889) (not e!463584))))

(assert (=> d!106023 (= res!565889 (isStrictlySorted!441 (toList!4502 lt!376833)))))

(assert (=> d!106023 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376833) (_1!5086 lt!376677)) lt!377279)))

(declare-fun b!831390 () Bool)

(assert (=> b!831390 (= e!463584 (containsKey!401 (toList!4502 lt!376833) (_1!5086 lt!376677)))))

(assert (= (and d!106023 res!565889) b!831390))

(assert (=> d!106023 m!773511))

(assert (=> d!106023 m!773511))

(assert (=> d!106023 m!774131))

(declare-fun m!775153 () Bool)

(assert (=> d!106023 m!775153))

(declare-fun m!775155 () Bool)

(assert (=> d!106023 m!775155))

(assert (=> b!831390 m!774127))

(assert (=> b!830673 d!106023))

(declare-fun d!106025 () Bool)

(assert (=> d!106025 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376833) (_1!5086 lt!376677))) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376833) (_1!5086 lt!376677)))))))

(declare-fun bs!23241 () Bool)

(assert (= bs!23241 d!106025))

(assert (=> bs!23241 m!773511))

(declare-fun m!775157 () Bool)

(assert (=> bs!23241 m!775157))

(assert (=> b!830673 d!106025))

(assert (=> b!830673 d!105531))

(declare-fun d!106027 () Bool)

(declare-fun lt!377280 () Bool)

(assert (=> d!106027 (= lt!377280 (select (content!386 (t!22310 (toList!4502 lt!376716))) lt!376677))))

(declare-fun e!463586 () Bool)

(assert (=> d!106027 (= lt!377280 e!463586)))

(declare-fun res!565890 () Bool)

(assert (=> d!106027 (=> (not res!565890) (not e!463586))))

(assert (=> d!106027 (= res!565890 ((_ is Cons!15941) (t!22310 (toList!4502 lt!376716))))))

(assert (=> d!106027 (= (contains!4209 (t!22310 (toList!4502 lt!376716)) lt!376677) lt!377280)))

(declare-fun b!831391 () Bool)

(declare-fun e!463585 () Bool)

(assert (=> b!831391 (= e!463586 e!463585)))

(declare-fun res!565891 () Bool)

(assert (=> b!831391 (=> res!565891 e!463585)))

(assert (=> b!831391 (= res!565891 (= (h!17070 (t!22310 (toList!4502 lt!376716))) lt!376677))))

(declare-fun b!831392 () Bool)

(assert (=> b!831392 (= e!463585 (contains!4209 (t!22310 (t!22310 (toList!4502 lt!376716))) lt!376677))))

(assert (= (and d!106027 res!565890) b!831391))

(assert (= (and b!831391 (not res!565891)) b!831392))

(declare-fun m!775159 () Bool)

(assert (=> d!106027 m!775159))

(declare-fun m!775161 () Bool)

(assert (=> d!106027 m!775161))

(declare-fun m!775163 () Bool)

(assert (=> b!831392 m!775163))

(assert (=> b!830610 d!106027))

(declare-fun d!106029 () Bool)

(declare-fun lt!377281 () Bool)

(assert (=> d!106029 (= lt!377281 (select (content!386 lt!376713) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun e!463588 () Bool)

(assert (=> d!106029 (= lt!377281 e!463588)))

(declare-fun res!565892 () Bool)

(assert (=> d!106029 (=> (not res!565892) (not e!463588))))

(assert (=> d!106029 (= res!565892 ((_ is Cons!15941) lt!376713))))

(assert (=> d!106029 (= (contains!4209 lt!376713 (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))) lt!377281)))

(declare-fun b!831393 () Bool)

(declare-fun e!463587 () Bool)

(assert (=> b!831393 (= e!463588 e!463587)))

(declare-fun res!565893 () Bool)

(assert (=> b!831393 (=> res!565893 e!463587)))

(assert (=> b!831393 (= res!565893 (= (h!17070 lt!376713) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun b!831394 () Bool)

(assert (=> b!831394 (= e!463587 (contains!4209 (t!22310 lt!376713) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(assert (= (and d!106029 res!565892) b!831393))

(assert (= (and b!831393 (not res!565893)) b!831394))

(declare-fun m!775165 () Bool)

(assert (=> d!106029 m!775165))

(declare-fun m!775167 () Bool)

(assert (=> d!106029 m!775167))

(declare-fun m!775169 () Bool)

(assert (=> b!831394 m!775169))

(assert (=> b!830492 d!106029))

(assert (=> b!830773 d!105619))

(assert (=> b!830471 d!105879))

(assert (=> b!830471 d!105881))

(declare-fun d!106031 () Bool)

(declare-fun e!463589 () Bool)

(assert (=> d!106031 e!463589))

(declare-fun res!565894 () Bool)

(assert (=> d!106031 (=> res!565894 e!463589)))

(declare-fun lt!377282 () Bool)

(assert (=> d!106031 (= res!565894 (not lt!377282))))

(declare-fun lt!377284 () Bool)

(assert (=> d!106031 (= lt!377282 lt!377284)))

(declare-fun lt!377283 () Unit!28429)

(declare-fun e!463590 () Unit!28429)

(assert (=> d!106031 (= lt!377283 e!463590)))

(declare-fun c!90224 () Bool)

(assert (=> d!106031 (= c!90224 lt!377284)))

(assert (=> d!106031 (= lt!377284 (containsKey!401 (toList!4502 lt!377093) (_1!5086 (tuple2!10151 lt!376861 lt!376859))))))

(assert (=> d!106031 (= (contains!4208 lt!377093 (_1!5086 (tuple2!10151 lt!376861 lt!376859))) lt!377282)))

(declare-fun b!831395 () Bool)

(declare-fun lt!377285 () Unit!28429)

(assert (=> b!831395 (= e!463590 lt!377285)))

(assert (=> b!831395 (= lt!377285 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!377093) (_1!5086 (tuple2!10151 lt!376861 lt!376859))))))

(assert (=> b!831395 (isDefined!311 (getValueByKey!415 (toList!4502 lt!377093) (_1!5086 (tuple2!10151 lt!376861 lt!376859))))))

(declare-fun b!831396 () Bool)

(declare-fun Unit!28476 () Unit!28429)

(assert (=> b!831396 (= e!463590 Unit!28476)))

(declare-fun b!831397 () Bool)

(assert (=> b!831397 (= e!463589 (isDefined!311 (getValueByKey!415 (toList!4502 lt!377093) (_1!5086 (tuple2!10151 lt!376861 lt!376859)))))))

(assert (= (and d!106031 c!90224) b!831395))

(assert (= (and d!106031 (not c!90224)) b!831396))

(assert (= (and d!106031 (not res!565894)) b!831397))

(declare-fun m!775171 () Bool)

(assert (=> d!106031 m!775171))

(declare-fun m!775173 () Bool)

(assert (=> b!831395 m!775173))

(assert (=> b!831395 m!774269))

(assert (=> b!831395 m!774269))

(declare-fun m!775175 () Bool)

(assert (=> b!831395 m!775175))

(assert (=> b!831397 m!774269))

(assert (=> b!831397 m!774269))

(assert (=> b!831397 m!775175))

(assert (=> d!105581 d!106031))

(declare-fun b!831399 () Bool)

(declare-fun e!463591 () Option!421)

(declare-fun e!463592 () Option!421)

(assert (=> b!831399 (= e!463591 e!463592)))

(declare-fun c!90226 () Bool)

(assert (=> b!831399 (= c!90226 (and ((_ is Cons!15941) lt!377090) (not (= (_1!5086 (h!17070 lt!377090)) (_1!5086 (tuple2!10151 lt!376861 lt!376859))))))))

(declare-fun b!831400 () Bool)

(assert (=> b!831400 (= e!463592 (getValueByKey!415 (t!22310 lt!377090) (_1!5086 (tuple2!10151 lt!376861 lt!376859))))))

(declare-fun b!831401 () Bool)

(assert (=> b!831401 (= e!463592 None!419)))

(declare-fun b!831398 () Bool)

(assert (=> b!831398 (= e!463591 (Some!420 (_2!5086 (h!17070 lt!377090))))))

(declare-fun d!106033 () Bool)

(declare-fun c!90225 () Bool)

(assert (=> d!106033 (= c!90225 (and ((_ is Cons!15941) lt!377090) (= (_1!5086 (h!17070 lt!377090)) (_1!5086 (tuple2!10151 lt!376861 lt!376859)))))))

(assert (=> d!106033 (= (getValueByKey!415 lt!377090 (_1!5086 (tuple2!10151 lt!376861 lt!376859))) e!463591)))

(assert (= (and d!106033 c!90225) b!831398))

(assert (= (and d!106033 (not c!90225)) b!831399))

(assert (= (and b!831399 c!90226) b!831400))

(assert (= (and b!831399 (not c!90226)) b!831401))

(declare-fun m!775177 () Bool)

(assert (=> b!831400 m!775177))

(assert (=> d!105581 d!106033))

(declare-fun d!106035 () Bool)

(assert (=> d!106035 (= (getValueByKey!415 lt!377090 (_1!5086 (tuple2!10151 lt!376861 lt!376859))) (Some!420 (_2!5086 (tuple2!10151 lt!376861 lt!376859))))))

(declare-fun lt!377286 () Unit!28429)

(assert (=> d!106035 (= lt!377286 (choose!1418 lt!377090 (_1!5086 (tuple2!10151 lt!376861 lt!376859)) (_2!5086 (tuple2!10151 lt!376861 lt!376859))))))

(declare-fun e!463593 () Bool)

(assert (=> d!106035 e!463593))

(declare-fun res!565895 () Bool)

(assert (=> d!106035 (=> (not res!565895) (not e!463593))))

(assert (=> d!106035 (= res!565895 (isStrictlySorted!441 lt!377090))))

(assert (=> d!106035 (= (lemmaContainsTupThenGetReturnValue!229 lt!377090 (_1!5086 (tuple2!10151 lt!376861 lt!376859)) (_2!5086 (tuple2!10151 lt!376861 lt!376859))) lt!377286)))

(declare-fun b!831402 () Bool)

(declare-fun res!565896 () Bool)

(assert (=> b!831402 (=> (not res!565896) (not e!463593))))

(assert (=> b!831402 (= res!565896 (containsKey!401 lt!377090 (_1!5086 (tuple2!10151 lt!376861 lt!376859))))))

(declare-fun b!831403 () Bool)

(assert (=> b!831403 (= e!463593 (contains!4209 lt!377090 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376861 lt!376859)) (_2!5086 (tuple2!10151 lt!376861 lt!376859)))))))

(assert (= (and d!106035 res!565895) b!831402))

(assert (= (and b!831402 res!565896) b!831403))

(assert (=> d!106035 m!774263))

(declare-fun m!775179 () Bool)

(assert (=> d!106035 m!775179))

(declare-fun m!775181 () Bool)

(assert (=> d!106035 m!775181))

(declare-fun m!775183 () Bool)

(assert (=> b!831402 m!775183))

(declare-fun m!775185 () Bool)

(assert (=> b!831403 m!775185))

(assert (=> d!105581 d!106035))

(declare-fun d!106037 () Bool)

(declare-fun e!463596 () Bool)

(assert (=> d!106037 e!463596))

(declare-fun res!565898 () Bool)

(assert (=> d!106037 (=> (not res!565898) (not e!463596))))

(declare-fun lt!377287 () List!15945)

(assert (=> d!106037 (= res!565898 (isStrictlySorted!441 lt!377287))))

(declare-fun e!463597 () List!15945)

(assert (=> d!106037 (= lt!377287 e!463597)))

(declare-fun c!90230 () Bool)

(assert (=> d!106037 (= c!90230 (and ((_ is Cons!15941) (toList!4502 lt!376862)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376862))) (_1!5086 (tuple2!10151 lt!376861 lt!376859)))))))

(assert (=> d!106037 (isStrictlySorted!441 (toList!4502 lt!376862))))

(assert (=> d!106037 (= (insertStrictlySorted!268 (toList!4502 lt!376862) (_1!5086 (tuple2!10151 lt!376861 lt!376859)) (_2!5086 (tuple2!10151 lt!376861 lt!376859))) lt!377287)))

(declare-fun b!831404 () Bool)

(declare-fun res!565897 () Bool)

(assert (=> b!831404 (=> (not res!565897) (not e!463596))))

(assert (=> b!831404 (= res!565897 (containsKey!401 lt!377287 (_1!5086 (tuple2!10151 lt!376861 lt!376859))))))

(declare-fun b!831405 () Bool)

(declare-fun e!463595 () List!15945)

(assert (=> b!831405 (= e!463595 (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376862)) (_1!5086 (tuple2!10151 lt!376861 lt!376859)) (_2!5086 (tuple2!10151 lt!376861 lt!376859))))))

(declare-fun bm!36332 () Bool)

(declare-fun call!36337 () List!15945)

(assert (=> bm!36332 (= call!36337 ($colon$colon!536 e!463595 (ite c!90230 (h!17070 (toList!4502 lt!376862)) (tuple2!10151 (_1!5086 (tuple2!10151 lt!376861 lt!376859)) (_2!5086 (tuple2!10151 lt!376861 lt!376859))))))))

(declare-fun c!90229 () Bool)

(assert (=> bm!36332 (= c!90229 c!90230)))

(declare-fun b!831406 () Bool)

(assert (=> b!831406 (= e!463596 (contains!4209 lt!377287 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376861 lt!376859)) (_2!5086 (tuple2!10151 lt!376861 lt!376859)))))))

(declare-fun c!90228 () Bool)

(declare-fun c!90227 () Bool)

(declare-fun b!831407 () Bool)

(assert (=> b!831407 (= e!463595 (ite c!90227 (t!22310 (toList!4502 lt!376862)) (ite c!90228 (Cons!15941 (h!17070 (toList!4502 lt!376862)) (t!22310 (toList!4502 lt!376862))) Nil!15942)))))

(declare-fun b!831408 () Bool)

(declare-fun e!463594 () List!15945)

(declare-fun call!36336 () List!15945)

(assert (=> b!831408 (= e!463594 call!36336)))

(declare-fun bm!36333 () Bool)

(declare-fun call!36335 () List!15945)

(assert (=> bm!36333 (= call!36336 call!36335)))

(declare-fun bm!36334 () Bool)

(assert (=> bm!36334 (= call!36335 call!36337)))

(declare-fun b!831409 () Bool)

(assert (=> b!831409 (= e!463594 call!36336)))

(declare-fun b!831410 () Bool)

(assert (=> b!831410 (= e!463597 call!36337)))

(declare-fun b!831411 () Bool)

(declare-fun e!463598 () List!15945)

(assert (=> b!831411 (= e!463598 call!36335)))

(declare-fun b!831412 () Bool)

(assert (=> b!831412 (= c!90228 (and ((_ is Cons!15941) (toList!4502 lt!376862)) (bvsgt (_1!5086 (h!17070 (toList!4502 lt!376862))) (_1!5086 (tuple2!10151 lt!376861 lt!376859)))))))

(assert (=> b!831412 (= e!463598 e!463594)))

(declare-fun b!831413 () Bool)

(assert (=> b!831413 (= e!463597 e!463598)))

(assert (=> b!831413 (= c!90227 (and ((_ is Cons!15941) (toList!4502 lt!376862)) (= (_1!5086 (h!17070 (toList!4502 lt!376862))) (_1!5086 (tuple2!10151 lt!376861 lt!376859)))))))

(assert (= (and d!106037 c!90230) b!831410))

(assert (= (and d!106037 (not c!90230)) b!831413))

(assert (= (and b!831413 c!90227) b!831411))

(assert (= (and b!831413 (not c!90227)) b!831412))

(assert (= (and b!831412 c!90228) b!831409))

(assert (= (and b!831412 (not c!90228)) b!831408))

(assert (= (or b!831409 b!831408) bm!36333))

(assert (= (or b!831411 bm!36333) bm!36334))

(assert (= (or b!831410 bm!36334) bm!36332))

(assert (= (and bm!36332 c!90229) b!831405))

(assert (= (and bm!36332 (not c!90229)) b!831407))

(assert (= (and d!106037 res!565898) b!831404))

(assert (= (and b!831404 res!565897) b!831406))

(declare-fun m!775187 () Bool)

(assert (=> bm!36332 m!775187))

(declare-fun m!775189 () Bool)

(assert (=> b!831404 m!775189))

(declare-fun m!775191 () Bool)

(assert (=> b!831406 m!775191))

(declare-fun m!775193 () Bool)

(assert (=> d!106037 m!775193))

(declare-fun m!775195 () Bool)

(assert (=> d!106037 m!775195))

(declare-fun m!775197 () Bool)

(assert (=> b!831405 m!775197))

(assert (=> d!105581 d!106037))

(declare-fun b!831415 () Bool)

(declare-fun e!463599 () Option!421)

(declare-fun e!463600 () Option!421)

(assert (=> b!831415 (= e!463599 e!463600)))

(declare-fun c!90232 () Bool)

(assert (=> b!831415 (= c!90232 (and ((_ is Cons!15941) (t!22310 lt!376717)) (not (= (_1!5086 (h!17070 (t!22310 lt!376717))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!831416 () Bool)

(assert (=> b!831416 (= e!463600 (getValueByKey!415 (t!22310 (t!22310 lt!376717)) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!831417 () Bool)

(assert (=> b!831417 (= e!463600 None!419)))

(declare-fun b!831414 () Bool)

(assert (=> b!831414 (= e!463599 (Some!420 (_2!5086 (h!17070 (t!22310 lt!376717)))))))

(declare-fun d!106039 () Bool)

(declare-fun c!90231 () Bool)

(assert (=> d!106039 (= c!90231 (and ((_ is Cons!15941) (t!22310 lt!376717)) (= (_1!5086 (h!17070 (t!22310 lt!376717))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106039 (= (getValueByKey!415 (t!22310 lt!376717) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463599)))

(assert (= (and d!106039 c!90231) b!831414))

(assert (= (and d!106039 (not c!90231)) b!831415))

(assert (= (and b!831415 c!90232) b!831416))

(assert (= (and b!831415 (not c!90232)) b!831417))

(declare-fun m!775199 () Bool)

(assert (=> b!831416 m!775199))

(assert (=> b!830737 d!106039))

(assert (=> b!830439 d!105857))

(assert (=> b!830439 d!105593))

(declare-fun d!106041 () Bool)

(declare-fun res!565899 () Bool)

(declare-fun e!463601 () Bool)

(assert (=> d!106041 (=> res!565899 e!463601)))

(assert (=> d!106041 (= res!565899 (and ((_ is Cons!15941) lt!376826) (= (_1!5086 (h!17070 lt!376826)) (_1!5086 lt!376677))))))

(assert (=> d!106041 (= (containsKey!401 lt!376826 (_1!5086 lt!376677)) e!463601)))

(declare-fun b!831418 () Bool)

(declare-fun e!463602 () Bool)

(assert (=> b!831418 (= e!463601 e!463602)))

(declare-fun res!565900 () Bool)

(assert (=> b!831418 (=> (not res!565900) (not e!463602))))

(assert (=> b!831418 (= res!565900 (and (or (not ((_ is Cons!15941) lt!376826)) (bvsle (_1!5086 (h!17070 lt!376826)) (_1!5086 lt!376677))) ((_ is Cons!15941) lt!376826) (bvslt (_1!5086 (h!17070 lt!376826)) (_1!5086 lt!376677))))))

(declare-fun b!831419 () Bool)

(assert (=> b!831419 (= e!463602 (containsKey!401 (t!22310 lt!376826) (_1!5086 lt!376677)))))

(assert (= (and d!106041 (not res!565899)) b!831418))

(assert (= (and b!831418 res!565900) b!831419))

(declare-fun m!775201 () Bool)

(assert (=> b!831419 m!775201))

(assert (=> b!830535 d!106041))

(assert (=> d!105509 d!105507))

(declare-fun d!106043 () Bool)

(assert (=> d!106043 (= (getValueByKey!415 lt!376734 (_1!5086 lt!376679)) (Some!420 (_2!5086 lt!376679)))))

(assert (=> d!106043 true))

(declare-fun _$22!572 () Unit!28429)

(assert (=> d!106043 (= (choose!1418 lt!376734 (_1!5086 lt!376679) (_2!5086 lt!376679)) _$22!572)))

(declare-fun bs!23242 () Bool)

(assert (= bs!23242 d!106043))

(assert (=> bs!23242 m!773383))

(assert (=> d!105509 d!106043))

(declare-fun d!106045 () Bool)

(declare-fun res!565901 () Bool)

(declare-fun e!463603 () Bool)

(assert (=> d!106045 (=> res!565901 e!463603)))

(assert (=> d!106045 (= res!565901 (or ((_ is Nil!15942) lt!376734) ((_ is Nil!15942) (t!22310 lt!376734))))))

(assert (=> d!106045 (= (isStrictlySorted!441 lt!376734) e!463603)))

(declare-fun b!831420 () Bool)

(declare-fun e!463604 () Bool)

(assert (=> b!831420 (= e!463603 e!463604)))

(declare-fun res!565902 () Bool)

(assert (=> b!831420 (=> (not res!565902) (not e!463604))))

(assert (=> b!831420 (= res!565902 (bvslt (_1!5086 (h!17070 lt!376734)) (_1!5086 (h!17070 (t!22310 lt!376734)))))))

(declare-fun b!831421 () Bool)

(assert (=> b!831421 (= e!463604 (isStrictlySorted!441 (t!22310 lt!376734)))))

(assert (= (and d!106045 (not res!565901)) b!831420))

(assert (= (and b!831420 res!565902) b!831421))

(declare-fun m!775203 () Bool)

(assert (=> b!831421 m!775203))

(assert (=> d!105509 d!106045))

(declare-fun b!831423 () Bool)

(declare-fun e!463605 () Option!421)

(declare-fun e!463606 () Option!421)

(assert (=> b!831423 (= e!463605 e!463606)))

(declare-fun c!90234 () Bool)

(assert (=> b!831423 (= c!90234 (and ((_ is Cons!15941) (t!22310 lt!376830)) (not (= (_1!5086 (h!17070 (t!22310 lt!376830))) (_1!5086 lt!376677)))))))

(declare-fun b!831424 () Bool)

(assert (=> b!831424 (= e!463606 (getValueByKey!415 (t!22310 (t!22310 lt!376830)) (_1!5086 lt!376677)))))

(declare-fun b!831425 () Bool)

(assert (=> b!831425 (= e!463606 None!419)))

(declare-fun b!831422 () Bool)

(assert (=> b!831422 (= e!463605 (Some!420 (_2!5086 (h!17070 (t!22310 lt!376830)))))))

(declare-fun d!106047 () Bool)

(declare-fun c!90233 () Bool)

(assert (=> d!106047 (= c!90233 (and ((_ is Cons!15941) (t!22310 lt!376830)) (= (_1!5086 (h!17070 (t!22310 lt!376830))) (_1!5086 lt!376677))))))

(assert (=> d!106047 (= (getValueByKey!415 (t!22310 lt!376830) (_1!5086 lt!376677)) e!463605)))

(assert (= (and d!106047 c!90233) b!831422))

(assert (= (and d!106047 (not c!90233)) b!831423))

(assert (= (and b!831423 c!90234) b!831424))

(assert (= (and b!831423 (not c!90234)) b!831425))

(declare-fun m!775205 () Bool)

(assert (=> b!831424 m!775205))

(assert (=> b!830678 d!106047))

(declare-fun bm!36335 () Bool)

(declare-fun call!36338 () Bool)

(assert (=> bm!36335 (= call!36338 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!831426 () Bool)

(declare-fun e!463609 () Bool)

(assert (=> b!831426 (= e!463609 call!36338)))

(declare-fun b!831427 () Bool)

(declare-fun e!463608 () Bool)

(declare-fun e!463607 () Bool)

(assert (=> b!831427 (= e!463608 e!463607)))

(declare-fun c!90235 () Bool)

(assert (=> b!831427 (= c!90235 (validKeyInArray!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!106049 () Bool)

(declare-fun res!565904 () Bool)

(assert (=> d!106049 (=> res!565904 e!463608)))

(assert (=> d!106049 (= res!565904 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(assert (=> d!106049 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312) e!463608)))

(declare-fun b!831428 () Bool)

(assert (=> b!831428 (= e!463607 e!463609)))

(declare-fun lt!377289 () (_ BitVec 64))

(assert (=> b!831428 (= lt!377289 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!377288 () Unit!28429)

(assert (=> b!831428 (= lt!377288 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377289 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!831428 (arrayContainsKey!0 _keys!976 lt!377289 #b00000000000000000000000000000000)))

(declare-fun lt!377290 () Unit!28429)

(assert (=> b!831428 (= lt!377290 lt!377288)))

(declare-fun res!565903 () Bool)

(assert (=> b!831428 (= res!565903 (= (seekEntryOrOpen!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) _keys!976 mask!1312) (Found!8744 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!831428 (=> (not res!565903) (not e!463609))))

(declare-fun b!831429 () Bool)

(assert (=> b!831429 (= e!463607 call!36338)))

(assert (= (and d!106049 (not res!565904)) b!831427))

(assert (= (and b!831427 c!90235) b!831428))

(assert (= (and b!831427 (not c!90235)) b!831429))

(assert (= (and b!831428 res!565903) b!831426))

(assert (= (or b!831426 b!831429) bm!36335))

(declare-fun m!775207 () Bool)

(assert (=> bm!36335 m!775207))

(assert (=> b!831427 m!774505))

(assert (=> b!831427 m!774505))

(assert (=> b!831427 m!774513))

(assert (=> b!831428 m!774505))

(declare-fun m!775209 () Bool)

(assert (=> b!831428 m!775209))

(declare-fun m!775211 () Bool)

(assert (=> b!831428 m!775211))

(assert (=> b!831428 m!774505))

(declare-fun m!775213 () Bool)

(assert (=> b!831428 m!775213))

(assert (=> bm!36284 d!106049))

(declare-fun d!106051 () Bool)

(declare-fun res!565905 () Bool)

(declare-fun e!463610 () Bool)

(assert (=> d!106051 (=> res!565905 e!463610)))

(assert (=> d!106051 (= res!565905 (and ((_ is Cons!15941) lt!376730) (= (_1!5086 (h!17070 lt!376730)) (_1!5086 lt!376679))))))

(assert (=> d!106051 (= (containsKey!401 lt!376730 (_1!5086 lt!376679)) e!463610)))

(declare-fun b!831430 () Bool)

(declare-fun e!463611 () Bool)

(assert (=> b!831430 (= e!463610 e!463611)))

(declare-fun res!565906 () Bool)

(assert (=> b!831430 (=> (not res!565906) (not e!463611))))

(assert (=> b!831430 (= res!565906 (and (or (not ((_ is Cons!15941) lt!376730)) (bvsle (_1!5086 (h!17070 lt!376730)) (_1!5086 lt!376679))) ((_ is Cons!15941) lt!376730) (bvslt (_1!5086 (h!17070 lt!376730)) (_1!5086 lt!376679))))))

(declare-fun b!831431 () Bool)

(assert (=> b!831431 (= e!463611 (containsKey!401 (t!22310 lt!376730) (_1!5086 lt!376679)))))

(assert (= (and d!106051 (not res!565905)) b!831430))

(assert (= (and b!831430 res!565906) b!831431))

(declare-fun m!775215 () Bool)

(assert (=> b!831431 m!775215))

(assert (=> b!830620 d!106051))

(declare-fun b!831433 () Bool)

(declare-fun e!463612 () Option!421)

(declare-fun e!463613 () Option!421)

(assert (=> b!831433 (= e!463612 e!463613)))

(declare-fun c!90237 () Bool)

(assert (=> b!831433 (= c!90237 (and ((_ is Cons!15941) (toList!4502 lt!376913)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376913))) (_1!5086 (tuple2!10151 lt!376854 lt!376852))))))))

(declare-fun b!831434 () Bool)

(assert (=> b!831434 (= e!463613 (getValueByKey!415 (t!22310 (toList!4502 lt!376913)) (_1!5086 (tuple2!10151 lt!376854 lt!376852))))))

(declare-fun b!831435 () Bool)

(assert (=> b!831435 (= e!463613 None!419)))

(declare-fun b!831432 () Bool)

(assert (=> b!831432 (= e!463612 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376913)))))))

(declare-fun c!90236 () Bool)

(declare-fun d!106053 () Bool)

(assert (=> d!106053 (= c!90236 (and ((_ is Cons!15941) (toList!4502 lt!376913)) (= (_1!5086 (h!17070 (toList!4502 lt!376913))) (_1!5086 (tuple2!10151 lt!376854 lt!376852)))))))

(assert (=> d!106053 (= (getValueByKey!415 (toList!4502 lt!376913) (_1!5086 (tuple2!10151 lt!376854 lt!376852))) e!463612)))

(assert (= (and d!106053 c!90236) b!831432))

(assert (= (and d!106053 (not c!90236)) b!831433))

(assert (= (and b!831433 c!90237) b!831434))

(assert (= (and b!831433 (not c!90237)) b!831435))

(declare-fun m!775217 () Bool)

(assert (=> b!831434 m!775217))

(assert (=> b!830463 d!106053))

(assert (=> b!830653 d!105899))

(assert (=> b!830653 d!105901))

(declare-fun d!106055 () Bool)

(assert (=> d!106055 (= (isEmpty!654 lt!376975) (isEmpty!655 (toList!4502 lt!376975)))))

(declare-fun bs!23243 () Bool)

(assert (= bs!23243 d!106055))

(declare-fun m!775219 () Bool)

(assert (=> bs!23243 m!775219))

(assert (=> b!830570 d!106055))

(assert (=> d!105483 d!105479))

(declare-fun d!106057 () Bool)

(assert (=> d!106057 (= (apply!372 (+!1980 lt!376794 (tuple2!10151 lt!376782 minValue!754)) lt!376796) (apply!372 lt!376794 lt!376796))))

(assert (=> d!106057 true))

(declare-fun _$34!1143 () Unit!28429)

(assert (=> d!106057 (= (choose!1419 lt!376794 lt!376782 minValue!754 lt!376796) _$34!1143)))

(declare-fun bs!23244 () Bool)

(assert (= bs!23244 d!106057))

(assert (=> bs!23244 m!773401))

(assert (=> bs!23244 m!773401))

(assert (=> bs!23244 m!773403))

(assert (=> bs!23244 m!773415))

(assert (=> d!105483 d!106057))

(assert (=> d!105483 d!105465))

(assert (=> d!105483 d!105469))

(declare-fun d!106059 () Bool)

(declare-fun e!463614 () Bool)

(assert (=> d!106059 e!463614))

(declare-fun res!565907 () Bool)

(assert (=> d!106059 (=> res!565907 e!463614)))

(declare-fun lt!377291 () Bool)

(assert (=> d!106059 (= res!565907 (not lt!377291))))

(declare-fun lt!377293 () Bool)

(assert (=> d!106059 (= lt!377291 lt!377293)))

(declare-fun lt!377292 () Unit!28429)

(declare-fun e!463615 () Unit!28429)

(assert (=> d!106059 (= lt!377292 e!463615)))

(declare-fun c!90238 () Bool)

(assert (=> d!106059 (= c!90238 lt!377293)))

(assert (=> d!106059 (= lt!377293 (containsKey!401 (toList!4502 lt!376794) lt!376796))))

(assert (=> d!106059 (= (contains!4208 lt!376794 lt!376796) lt!377291)))

(declare-fun b!831436 () Bool)

(declare-fun lt!377294 () Unit!28429)

(assert (=> b!831436 (= e!463615 lt!377294)))

(assert (=> b!831436 (= lt!377294 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376794) lt!376796))))

(assert (=> b!831436 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376794) lt!376796))))

(declare-fun b!831437 () Bool)

(declare-fun Unit!28477 () Unit!28429)

(assert (=> b!831437 (= e!463615 Unit!28477)))

(declare-fun b!831438 () Bool)

(assert (=> b!831438 (= e!463614 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376794) lt!376796)))))

(assert (= (and d!106059 c!90238) b!831436))

(assert (= (and d!106059 (not c!90238)) b!831437))

(assert (= (and d!106059 (not res!565907)) b!831438))

(declare-fun m!775221 () Bool)

(assert (=> d!106059 m!775221))

(declare-fun m!775223 () Bool)

(assert (=> b!831436 m!775223))

(assert (=> b!831436 m!773927))

(assert (=> b!831436 m!773927))

(declare-fun m!775225 () Bool)

(assert (=> b!831436 m!775225))

(assert (=> b!831438 m!773927))

(assert (=> b!831438 m!773927))

(assert (=> b!831438 m!775225))

(assert (=> d!105483 d!106059))

(declare-fun d!106061 () Bool)

(assert (=> d!106061 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376720) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377295 () Unit!28429)

(assert (=> d!106061 (= lt!377295 (choose!1421 (toList!4502 lt!376720) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!463616 () Bool)

(assert (=> d!106061 e!463616))

(declare-fun res!565908 () Bool)

(assert (=> d!106061 (=> (not res!565908) (not e!463616))))

(assert (=> d!106061 (= res!565908 (isStrictlySorted!441 (toList!4502 lt!376720)))))

(assert (=> d!106061 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376720) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377295)))

(declare-fun b!831439 () Bool)

(assert (=> b!831439 (= e!463616 (containsKey!401 (toList!4502 lt!376720) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106061 res!565908) b!831439))

(assert (=> d!106061 m!773349))

(assert (=> d!106061 m!773349))

(assert (=> d!106061 m!774213))

(declare-fun m!775227 () Bool)

(assert (=> d!106061 m!775227))

(declare-fun m!775229 () Bool)

(assert (=> d!106061 m!775229))

(assert (=> b!831439 m!774209))

(assert (=> b!830732 d!106061))

(declare-fun d!106063 () Bool)

(assert (=> d!106063 (= (isDefined!311 (getValueByKey!415 (toList!4502 lt!376720) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (not (isEmpty!656 (getValueByKey!415 (toList!4502 lt!376720) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun bs!23245 () Bool)

(assert (= bs!23245 d!106063))

(assert (=> bs!23245 m!773349))

(declare-fun m!775231 () Bool)

(assert (=> bs!23245 m!775231))

(assert (=> b!830732 d!106063))

(assert (=> b!830732 d!105587))

(declare-fun d!106065 () Bool)

(declare-fun res!565909 () Bool)

(declare-fun e!463617 () Bool)

(assert (=> d!106065 (=> res!565909 e!463617)))

(assert (=> d!106065 (= res!565909 (and ((_ is Cons!15941) (toList!4502 lt!376720)) (= (_1!5086 (h!17070 (toList!4502 lt!376720))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106065 (= (containsKey!401 (toList!4502 lt!376720) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463617)))

(declare-fun b!831440 () Bool)

(declare-fun e!463618 () Bool)

(assert (=> b!831440 (= e!463617 e!463618)))

(declare-fun res!565910 () Bool)

(assert (=> b!831440 (=> (not res!565910) (not e!463618))))

(assert (=> b!831440 (= res!565910 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376720))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376720))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15941) (toList!4502 lt!376720)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376720))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831441 () Bool)

(assert (=> b!831441 (= e!463618 (containsKey!401 (t!22310 (toList!4502 lt!376720)) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106065 (not res!565909)) b!831440))

(assert (= (and b!831440 res!565910) b!831441))

(declare-fun m!775233 () Bool)

(assert (=> b!831441 m!775233))

(assert (=> d!105567 d!106065))

(declare-fun d!106067 () Bool)

(declare-fun res!565911 () Bool)

(declare-fun e!463619 () Bool)

(assert (=> d!106067 (=> res!565911 e!463619)))

(assert (=> d!106067 (= res!565911 (or ((_ is Nil!15942) lt!377024) ((_ is Nil!15942) (t!22310 lt!377024))))))

(assert (=> d!106067 (= (isStrictlySorted!441 lt!377024) e!463619)))

(declare-fun b!831442 () Bool)

(declare-fun e!463620 () Bool)

(assert (=> b!831442 (= e!463619 e!463620)))

(declare-fun res!565912 () Bool)

(assert (=> b!831442 (=> (not res!565912) (not e!463620))))

(assert (=> b!831442 (= res!565912 (bvslt (_1!5086 (h!17070 lt!377024)) (_1!5086 (h!17070 (t!22310 lt!377024)))))))

(declare-fun b!831443 () Bool)

(assert (=> b!831443 (= e!463620 (isStrictlySorted!441 (t!22310 lt!377024)))))

(assert (= (and d!106067 (not res!565911)) b!831442))

(assert (= (and b!831442 res!565912) b!831443))

(declare-fun m!775235 () Bool)

(assert (=> b!831443 m!775235))

(assert (=> d!105511 d!106067))

(declare-fun d!106069 () Bool)

(declare-fun res!565913 () Bool)

(declare-fun e!463621 () Bool)

(assert (=> d!106069 (=> res!565913 e!463621)))

(assert (=> d!106069 (= res!565913 (or ((_ is Nil!15942) (toList!4502 lt!376683)) ((_ is Nil!15942) (t!22310 (toList!4502 lt!376683)))))))

(assert (=> d!106069 (= (isStrictlySorted!441 (toList!4502 lt!376683)) e!463621)))

(declare-fun b!831444 () Bool)

(declare-fun e!463622 () Bool)

(assert (=> b!831444 (= e!463621 e!463622)))

(declare-fun res!565914 () Bool)

(assert (=> b!831444 (=> (not res!565914) (not e!463622))))

(assert (=> b!831444 (= res!565914 (bvslt (_1!5086 (h!17070 (toList!4502 lt!376683))) (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376683))))))))

(declare-fun b!831445 () Bool)

(assert (=> b!831445 (= e!463622 (isStrictlySorted!441 (t!22310 (toList!4502 lt!376683))))))

(assert (= (and d!106069 (not res!565913)) b!831444))

(assert (= (and b!831444 res!565914) b!831445))

(assert (=> b!831445 m!774681))

(assert (=> d!105511 d!106069))

(declare-fun d!106071 () Bool)

(declare-fun res!565915 () Bool)

(declare-fun e!463623 () Bool)

(assert (=> d!106071 (=> res!565915 e!463623)))

(assert (=> d!106071 (= res!565915 (and ((_ is Cons!15941) (toList!4502 lt!376833)) (= (_1!5086 (h!17070 (toList!4502 lt!376833))) (_1!5086 lt!376677))))))

(assert (=> d!106071 (= (containsKey!401 (toList!4502 lt!376833) (_1!5086 lt!376677)) e!463623)))

(declare-fun b!831446 () Bool)

(declare-fun e!463624 () Bool)

(assert (=> b!831446 (= e!463623 e!463624)))

(declare-fun res!565916 () Bool)

(assert (=> b!831446 (=> (not res!565916) (not e!463624))))

(assert (=> b!831446 (= res!565916 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376833))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376833))) (_1!5086 lt!376677))) ((_ is Cons!15941) (toList!4502 lt!376833)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376833))) (_1!5086 lt!376677))))))

(declare-fun b!831447 () Bool)

(assert (=> b!831447 (= e!463624 (containsKey!401 (t!22310 (toList!4502 lt!376833)) (_1!5086 lt!376677)))))

(assert (= (and d!106071 (not res!565915)) b!831446))

(assert (= (and b!831446 res!565916) b!831447))

(declare-fun m!775237 () Bool)

(assert (=> b!831447 m!775237))

(assert (=> d!105535 d!106071))

(declare-fun b!831449 () Bool)

(declare-fun e!463625 () Option!421)

(declare-fun e!463626 () Option!421)

(assert (=> b!831449 (= e!463625 e!463626)))

(declare-fun c!90240 () Bool)

(assert (=> b!831449 (= c!90240 (and ((_ is Cons!15941) (toList!4502 lt!377093)) (not (= (_1!5086 (h!17070 (toList!4502 lt!377093))) (_1!5086 (tuple2!10151 lt!376861 lt!376859))))))))

(declare-fun b!831450 () Bool)

(assert (=> b!831450 (= e!463626 (getValueByKey!415 (t!22310 (toList!4502 lt!377093)) (_1!5086 (tuple2!10151 lt!376861 lt!376859))))))

(declare-fun b!831451 () Bool)

(assert (=> b!831451 (= e!463626 None!419)))

(declare-fun b!831448 () Bool)

(assert (=> b!831448 (= e!463625 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!377093)))))))

(declare-fun c!90239 () Bool)

(declare-fun d!106073 () Bool)

(assert (=> d!106073 (= c!90239 (and ((_ is Cons!15941) (toList!4502 lt!377093)) (= (_1!5086 (h!17070 (toList!4502 lt!377093))) (_1!5086 (tuple2!10151 lt!376861 lt!376859)))))))

(assert (=> d!106073 (= (getValueByKey!415 (toList!4502 lt!377093) (_1!5086 (tuple2!10151 lt!376861 lt!376859))) e!463625)))

(assert (= (and d!106073 c!90239) b!831448))

(assert (= (and d!106073 (not c!90239)) b!831449))

(assert (= (and b!831449 c!90240) b!831450))

(assert (= (and b!831449 (not c!90240)) b!831451))

(declare-fun m!775239 () Bool)

(assert (=> b!831450 m!775239))

(assert (=> b!830757 d!106073))

(assert (=> b!830444 d!105915))

(assert (=> b!830444 d!105917))

(declare-fun lt!377296 () Bool)

(declare-fun d!106075 () Bool)

(assert (=> d!106075 (= lt!377296 (select (content!386 (toList!4502 lt!376949)) (tuple2!10151 lt!376804 minValue!754)))))

(declare-fun e!463628 () Bool)

(assert (=> d!106075 (= lt!377296 e!463628)))

(declare-fun res!565917 () Bool)

(assert (=> d!106075 (=> (not res!565917) (not e!463628))))

(assert (=> d!106075 (= res!565917 ((_ is Cons!15941) (toList!4502 lt!376949)))))

(assert (=> d!106075 (= (contains!4209 (toList!4502 lt!376949) (tuple2!10151 lt!376804 minValue!754)) lt!377296)))

(declare-fun b!831452 () Bool)

(declare-fun e!463627 () Bool)

(assert (=> b!831452 (= e!463628 e!463627)))

(declare-fun res!565918 () Bool)

(assert (=> b!831452 (=> res!565918 e!463627)))

(assert (=> b!831452 (= res!565918 (= (h!17070 (toList!4502 lt!376949)) (tuple2!10151 lt!376804 minValue!754)))))

(declare-fun b!831453 () Bool)

(assert (=> b!831453 (= e!463627 (contains!4209 (t!22310 (toList!4502 lt!376949)) (tuple2!10151 lt!376804 minValue!754)))))

(assert (= (and d!106075 res!565917) b!831452))

(assert (= (and b!831452 (not res!565918)) b!831453))

(declare-fun m!775241 () Bool)

(assert (=> d!106075 m!775241))

(declare-fun m!775243 () Bool)

(assert (=> d!106075 m!775243))

(declare-fun m!775245 () Bool)

(assert (=> b!831453 m!775245))

(assert (=> b!830553 d!106075))

(declare-fun b!831455 () Bool)

(declare-fun e!463629 () Option!421)

(declare-fun e!463630 () Option!421)

(assert (=> b!831455 (= e!463629 e!463630)))

(declare-fun c!90242 () Bool)

(assert (=> b!831455 (= c!90242 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376733))) (not (= (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376733)))) (_1!5086 lt!376679)))))))

(declare-fun b!831456 () Bool)

(assert (=> b!831456 (= e!463630 (getValueByKey!415 (t!22310 (t!22310 (toList!4502 lt!376733))) (_1!5086 lt!376679)))))

(declare-fun b!831457 () Bool)

(assert (=> b!831457 (= e!463630 None!419)))

(declare-fun b!831454 () Bool)

(assert (=> b!831454 (= e!463629 (Some!420 (_2!5086 (h!17070 (t!22310 (toList!4502 lt!376733))))))))

(declare-fun d!106077 () Bool)

(declare-fun c!90241 () Bool)

(assert (=> d!106077 (= c!90241 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376733))) (= (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376733)))) (_1!5086 lt!376679))))))

(assert (=> d!106077 (= (getValueByKey!415 (t!22310 (toList!4502 lt!376733)) (_1!5086 lt!376679)) e!463629)))

(assert (= (and d!106077 c!90241) b!831454))

(assert (= (and d!106077 (not c!90241)) b!831455))

(assert (= (and b!831455 c!90242) b!831456))

(assert (= (and b!831455 (not c!90242)) b!831457))

(declare-fun m!775247 () Bool)

(assert (=> b!831456 m!775247))

(assert (=> b!830694 d!106077))

(declare-fun d!106079 () Bool)

(declare-fun e!463633 () Bool)

(assert (=> d!106079 e!463633))

(declare-fun res!565920 () Bool)

(assert (=> d!106079 (=> (not res!565920) (not e!463633))))

(declare-fun lt!377297 () List!15945)

(assert (=> d!106079 (= res!565920 (isStrictlySorted!441 lt!377297))))

(declare-fun e!463634 () List!15945)

(assert (=> d!106079 (= lt!377297 e!463634)))

(declare-fun c!90246 () Bool)

(assert (=> d!106079 (= c!90246 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376683))) (bvslt (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376683)))) (_1!5086 lt!376679))))))

(assert (=> d!106079 (isStrictlySorted!441 (t!22310 (toList!4502 lt!376683)))))

(assert (=> d!106079 (= (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376683)) (_1!5086 lt!376679) (_2!5086 lt!376679)) lt!377297)))

(declare-fun b!831458 () Bool)

(declare-fun res!565919 () Bool)

(assert (=> b!831458 (=> (not res!565919) (not e!463633))))

(assert (=> b!831458 (= res!565919 (containsKey!401 lt!377297 (_1!5086 lt!376679)))))

(declare-fun b!831459 () Bool)

(declare-fun e!463632 () List!15945)

(assert (=> b!831459 (= e!463632 (insertStrictlySorted!268 (t!22310 (t!22310 (toList!4502 lt!376683))) (_1!5086 lt!376679) (_2!5086 lt!376679)))))

(declare-fun bm!36336 () Bool)

(declare-fun call!36341 () List!15945)

(assert (=> bm!36336 (= call!36341 ($colon$colon!536 e!463632 (ite c!90246 (h!17070 (t!22310 (toList!4502 lt!376683))) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679)))))))

(declare-fun c!90245 () Bool)

(assert (=> bm!36336 (= c!90245 c!90246)))

(declare-fun b!831460 () Bool)

(assert (=> b!831460 (= e!463633 (contains!4209 lt!377297 (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(declare-fun c!90243 () Bool)

(declare-fun b!831461 () Bool)

(declare-fun c!90244 () Bool)

(assert (=> b!831461 (= e!463632 (ite c!90243 (t!22310 (t!22310 (toList!4502 lt!376683))) (ite c!90244 (Cons!15941 (h!17070 (t!22310 (toList!4502 lt!376683))) (t!22310 (t!22310 (toList!4502 lt!376683)))) Nil!15942)))))

(declare-fun b!831462 () Bool)

(declare-fun e!463631 () List!15945)

(declare-fun call!36340 () List!15945)

(assert (=> b!831462 (= e!463631 call!36340)))

(declare-fun bm!36337 () Bool)

(declare-fun call!36339 () List!15945)

(assert (=> bm!36337 (= call!36340 call!36339)))

(declare-fun bm!36338 () Bool)

(assert (=> bm!36338 (= call!36339 call!36341)))

(declare-fun b!831463 () Bool)

(assert (=> b!831463 (= e!463631 call!36340)))

(declare-fun b!831464 () Bool)

(assert (=> b!831464 (= e!463634 call!36341)))

(declare-fun b!831465 () Bool)

(declare-fun e!463635 () List!15945)

(assert (=> b!831465 (= e!463635 call!36339)))

(declare-fun b!831466 () Bool)

(assert (=> b!831466 (= c!90244 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376683))) (bvsgt (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376683)))) (_1!5086 lt!376679))))))

(assert (=> b!831466 (= e!463635 e!463631)))

(declare-fun b!831467 () Bool)

(assert (=> b!831467 (= e!463634 e!463635)))

(assert (=> b!831467 (= c!90243 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376683))) (= (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376683)))) (_1!5086 lt!376679))))))

(assert (= (and d!106079 c!90246) b!831464))

(assert (= (and d!106079 (not c!90246)) b!831467))

(assert (= (and b!831467 c!90243) b!831465))

(assert (= (and b!831467 (not c!90243)) b!831466))

(assert (= (and b!831466 c!90244) b!831463))

(assert (= (and b!831466 (not c!90244)) b!831462))

(assert (= (or b!831463 b!831462) bm!36337))

(assert (= (or b!831465 bm!36337) bm!36338))

(assert (= (or b!831464 bm!36338) bm!36336))

(assert (= (and bm!36336 c!90245) b!831459))

(assert (= (and bm!36336 (not c!90245)) b!831461))

(assert (= (and d!106079 res!565920) b!831458))

(assert (= (and b!831458 res!565919) b!831460))

(declare-fun m!775249 () Bool)

(assert (=> bm!36336 m!775249))

(declare-fun m!775251 () Bool)

(assert (=> b!831458 m!775251))

(declare-fun m!775253 () Bool)

(assert (=> b!831460 m!775253))

(declare-fun m!775255 () Bool)

(assert (=> d!106079 m!775255))

(assert (=> d!106079 m!774681))

(declare-fun m!775257 () Bool)

(assert (=> b!831459 m!775257))

(assert (=> b!830642 d!106079))

(declare-fun d!106081 () Bool)

(assert (=> d!106081 (= (get!11818 (getValueByKey!415 (toList!4502 lt!376795) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10095 (getValueByKey!415 (toList!4502 lt!376795) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105455 d!106081))

(assert (=> d!105455 d!105917))

(declare-fun b!831469 () Bool)

(declare-fun e!463636 () Option!421)

(declare-fun e!463637 () Option!421)

(assert (=> b!831469 (= e!463636 e!463637)))

(declare-fun c!90248 () Bool)

(assert (=> b!831469 (= c!90248 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376720))) (not (= (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376720)))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!831470 () Bool)

(assert (=> b!831470 (= e!463637 (getValueByKey!415 (t!22310 (t!22310 (toList!4502 lt!376720))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!831471 () Bool)

(assert (=> b!831471 (= e!463637 None!419)))

(declare-fun b!831468 () Bool)

(assert (=> b!831468 (= e!463636 (Some!420 (_2!5086 (h!17070 (t!22310 (toList!4502 lt!376720))))))))

(declare-fun d!106083 () Bool)

(declare-fun c!90247 () Bool)

(assert (=> d!106083 (= c!90247 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376720))) (= (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376720)))) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106083 (= (getValueByKey!415 (t!22310 (toList!4502 lt!376720)) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463636)))

(assert (= (and d!106083 c!90247) b!831468))

(assert (= (and d!106083 (not c!90247)) b!831469))

(assert (= (and b!831469 c!90248) b!831470))

(assert (= (and b!831469 (not c!90248)) b!831471))

(declare-fun m!775259 () Bool)

(assert (=> b!831470 m!775259))

(assert (=> b!830769 d!106083))

(declare-fun d!106085 () Bool)

(assert (=> d!106085 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))) lt!376805))))

(declare-fun lt!377298 () Unit!28429)

(assert (=> d!106085 (= lt!377298 (choose!1421 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))) lt!376805))))

(declare-fun e!463638 () Bool)

(assert (=> d!106085 e!463638))

(declare-fun res!565921 () Bool)

(assert (=> d!106085 (=> (not res!565921) (not e!463638))))

(assert (=> d!106085 (= res!565921 (isStrictlySorted!441 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34)))))))

(assert (=> d!106085 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))) lt!376805) lt!377298)))

(declare-fun b!831472 () Bool)

(assert (=> b!831472 (= e!463638 (containsKey!401 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))) lt!376805))))

(assert (= (and d!106085 res!565921) b!831472))

(assert (=> d!106085 m!773815))

(assert (=> d!106085 m!773815))

(assert (=> d!106085 m!773817))

(declare-fun m!775261 () Bool)

(assert (=> d!106085 m!775261))

(declare-fun m!775263 () Bool)

(assert (=> d!106085 m!775263))

(assert (=> b!831472 m!773811))

(assert (=> b!830556 d!106085))

(declare-fun d!106087 () Bool)

(assert (=> d!106087 (= (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))) lt!376805)) (not (isEmpty!656 (getValueByKey!415 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))) lt!376805))))))

(declare-fun bs!23246 () Bool)

(assert (= bs!23246 d!106087))

(assert (=> bs!23246 m!773815))

(declare-fun m!775265 () Bool)

(assert (=> bs!23246 m!775265))

(assert (=> b!830556 d!106087))

(declare-fun b!831474 () Bool)

(declare-fun e!463639 () Option!421)

(declare-fun e!463640 () Option!421)

(assert (=> b!831474 (= e!463639 e!463640)))

(declare-fun c!90250 () Bool)

(assert (=> b!831474 (= c!90250 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34)))) (not (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))))) lt!376805))))))

(declare-fun b!831475 () Bool)

(assert (=> b!831475 (= e!463640 (getValueByKey!415 (t!22310 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34)))) lt!376805))))

(declare-fun b!831476 () Bool)

(assert (=> b!831476 (= e!463640 None!419)))

(declare-fun b!831473 () Bool)

(assert (=> b!831473 (= e!463639 (Some!420 (_2!5086 (h!17070 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34)))))))))

(declare-fun d!106089 () Bool)

(declare-fun c!90249 () Bool)

(assert (=> d!106089 (= c!90249 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34)))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))))) lt!376805)))))

(assert (=> d!106089 (= (getValueByKey!415 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))) lt!376805) e!463639)))

(assert (= (and d!106089 c!90249) b!831473))

(assert (= (and d!106089 (not c!90249)) b!831474))

(assert (= (and b!831474 c!90250) b!831475))

(assert (= (and b!831474 (not c!90250)) b!831476))

(declare-fun m!775267 () Bool)

(assert (=> b!831475 m!775267))

(assert (=> b!830556 d!106089))

(assert (=> d!105561 d!105563))

(declare-fun d!106091 () Bool)

(assert (=> d!106091 (arrayContainsKey!0 _keys!976 lt!376728 #b00000000000000000000000000000000)))

(assert (=> d!106091 true))

(declare-fun _$60!394 () Unit!28429)

(assert (=> d!106091 (= (choose!13 _keys!976 lt!376728 #b00000000000000000000000000000000) _$60!394)))

(declare-fun bs!23247 () Bool)

(assert (= bs!23247 d!106091))

(assert (=> bs!23247 m!773365))

(assert (=> d!105561 d!106091))

(declare-fun d!106093 () Bool)

(declare-fun c!90251 () Bool)

(assert (=> d!106093 (= c!90251 ((_ is Nil!15942) (toList!4502 lt!376720)))))

(declare-fun e!463641 () (InoxSet tuple2!10150))

(assert (=> d!106093 (= (content!386 (toList!4502 lt!376720)) e!463641)))

(declare-fun b!831477 () Bool)

(assert (=> b!831477 (= e!463641 ((as const (Array tuple2!10150 Bool)) false))))

(declare-fun b!831478 () Bool)

(assert (=> b!831478 (= e!463641 ((_ map or) (store ((as const (Array tuple2!10150 Bool)) false) (h!17070 (toList!4502 lt!376720)) true) (content!386 (t!22310 (toList!4502 lt!376720)))))))

(assert (= (and d!106093 c!90251) b!831477))

(assert (= (and d!106093 (not c!90251)) b!831478))

(declare-fun m!775269 () Bool)

(assert (=> b!831478 m!775269))

(assert (=> b!831478 m!774909))

(assert (=> d!105495 d!106093))

(declare-fun d!106095 () Bool)

(declare-fun e!463642 () Bool)

(assert (=> d!106095 e!463642))

(declare-fun res!565922 () Bool)

(assert (=> d!106095 (=> res!565922 e!463642)))

(declare-fun lt!377299 () Bool)

(assert (=> d!106095 (= res!565922 (not lt!377299))))

(declare-fun lt!377301 () Bool)

(assert (=> d!106095 (= lt!377299 lt!377301)))

(declare-fun lt!377300 () Unit!28429)

(declare-fun e!463643 () Unit!28429)

(assert (=> d!106095 (= lt!377300 e!463643)))

(declare-fun c!90252 () Bool)

(assert (=> d!106095 (= c!90252 lt!377301)))

(assert (=> d!106095 (= lt!377301 (containsKey!401 (toList!4502 lt!376982) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!106095 (= (contains!4208 lt!376982 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!377299)))

(declare-fun b!831479 () Bool)

(declare-fun lt!377302 () Unit!28429)

(assert (=> b!831479 (= e!463643 lt!377302)))

(assert (=> b!831479 (= lt!377302 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376982) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!831479 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376982) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!831480 () Bool)

(declare-fun Unit!28478 () Unit!28429)

(assert (=> b!831480 (= e!463643 Unit!28478)))

(declare-fun b!831481 () Bool)

(assert (=> b!831481 (= e!463642 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376982) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(assert (= (and d!106095 c!90252) b!831479))

(assert (= (and d!106095 (not c!90252)) b!831480))

(assert (= (and d!106095 (not res!565922)) b!831481))

(assert (=> d!106095 m!773859))

(declare-fun m!775271 () Bool)

(assert (=> d!106095 m!775271))

(assert (=> b!831479 m!773859))

(declare-fun m!775273 () Bool)

(assert (=> b!831479 m!775273))

(assert (=> b!831479 m!773859))

(declare-fun m!775275 () Bool)

(assert (=> b!831479 m!775275))

(assert (=> b!831479 m!775275))

(declare-fun m!775277 () Bool)

(assert (=> b!831479 m!775277))

(assert (=> b!831481 m!773859))

(assert (=> b!831481 m!775275))

(assert (=> b!831481 m!775275))

(assert (=> b!831481 m!775277))

(assert (=> b!830583 d!106095))

(declare-fun d!106097 () Bool)

(declare-fun res!565923 () Bool)

(declare-fun e!463644 () Bool)

(assert (=> d!106097 (=> res!565923 e!463644)))

(assert (=> d!106097 (= res!565923 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34)))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))))) lt!376805)))))

(assert (=> d!106097 (= (containsKey!401 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))) lt!376805) e!463644)))

(declare-fun b!831482 () Bool)

(declare-fun e!463645 () Bool)

(assert (=> b!831482 (= e!463644 e!463645)))

(declare-fun res!565924 () Bool)

(assert (=> b!831482 (=> (not res!565924) (not e!463645))))

(assert (=> b!831482 (= res!565924 (and (or (not ((_ is Cons!15941) (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))))) (bvsle (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))))) lt!376805)) ((_ is Cons!15941) (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34)))) (bvslt (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34))))) lt!376805)))))

(declare-fun b!831483 () Bool)

(assert (=> b!831483 (= e!463645 (containsKey!401 (t!22310 (toList!4502 (+!1980 lt!376824 (tuple2!10151 lt!376810 zeroValueAfter!34)))) lt!376805))))

(assert (= (and d!106097 (not res!565923)) b!831482))

(assert (= (and b!831482 res!565924) b!831483))

(declare-fun m!775279 () Bool)

(assert (=> b!831483 m!775279))

(assert (=> d!105445 d!106097))

(declare-fun d!106099 () Bool)

(declare-fun res!565925 () Bool)

(declare-fun e!463646 () Bool)

(assert (=> d!106099 (=> res!565925 e!463646)))

(assert (=> d!106099 (= res!565925 (and ((_ is Cons!15941) lt!376713) (= (_1!5086 (h!17070 lt!376713)) (_1!5086 lt!376677))))))

(assert (=> d!106099 (= (containsKey!401 lt!376713 (_1!5086 lt!376677)) e!463646)))

(declare-fun b!831484 () Bool)

(declare-fun e!463647 () Bool)

(assert (=> b!831484 (= e!463646 e!463647)))

(declare-fun res!565926 () Bool)

(assert (=> b!831484 (=> (not res!565926) (not e!463647))))

(assert (=> b!831484 (= res!565926 (and (or (not ((_ is Cons!15941) lt!376713)) (bvsle (_1!5086 (h!17070 lt!376713)) (_1!5086 lt!376677))) ((_ is Cons!15941) lt!376713) (bvslt (_1!5086 (h!17070 lt!376713)) (_1!5086 lt!376677))))))

(declare-fun b!831485 () Bool)

(assert (=> b!831485 (= e!463647 (containsKey!401 (t!22310 lt!376713) (_1!5086 lt!376677)))))

(assert (= (and d!106099 (not res!565925)) b!831484))

(assert (= (and b!831484 res!565926) b!831485))

(declare-fun m!775281 () Bool)

(assert (=> b!831485 m!775281))

(assert (=> b!830491 d!106099))

(declare-fun b!831487 () Bool)

(declare-fun e!463648 () Option!421)

(declare-fun e!463649 () Option!421)

(assert (=> b!831487 (= e!463648 e!463649)))

(declare-fun c!90254 () Bool)

(assert (=> b!831487 (= c!90254 (and ((_ is Cons!15941) (toList!4502 lt!376949)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376949))) (_1!5086 (tuple2!10151 lt!376804 minValue!754))))))))

(declare-fun b!831488 () Bool)

(assert (=> b!831488 (= e!463649 (getValueByKey!415 (t!22310 (toList!4502 lt!376949)) (_1!5086 (tuple2!10151 lt!376804 minValue!754))))))

(declare-fun b!831489 () Bool)

(assert (=> b!831489 (= e!463649 None!419)))

(declare-fun b!831486 () Bool)

(assert (=> b!831486 (= e!463648 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376949)))))))

(declare-fun c!90253 () Bool)

(declare-fun d!106101 () Bool)

(assert (=> d!106101 (= c!90253 (and ((_ is Cons!15941) (toList!4502 lt!376949)) (= (_1!5086 (h!17070 (toList!4502 lt!376949))) (_1!5086 (tuple2!10151 lt!376804 minValue!754)))))))

(assert (=> d!106101 (= (getValueByKey!415 (toList!4502 lt!376949) (_1!5086 (tuple2!10151 lt!376804 minValue!754))) e!463648)))

(assert (= (and d!106101 c!90253) b!831486))

(assert (= (and d!106101 (not c!90253)) b!831487))

(assert (= (and b!831487 c!90254) b!831488))

(assert (= (and b!831487 (not c!90254)) b!831489))

(declare-fun m!775283 () Bool)

(assert (=> b!831488 m!775283))

(assert (=> b!830552 d!106101))

(declare-fun d!106103 () Bool)

(declare-fun c!90255 () Bool)

(assert (=> d!106103 (= c!90255 ((_ is Nil!15942) (toList!4502 lt!376733)))))

(declare-fun e!463650 () (InoxSet tuple2!10150))

(assert (=> d!106103 (= (content!386 (toList!4502 lt!376733)) e!463650)))

(declare-fun b!831490 () Bool)

(assert (=> b!831490 (= e!463650 ((as const (Array tuple2!10150 Bool)) false))))

(declare-fun b!831491 () Bool)

(assert (=> b!831491 (= e!463650 ((_ map or) (store ((as const (Array tuple2!10150 Bool)) false) (h!17070 (toList!4502 lt!376733)) true) (content!386 (t!22310 (toList!4502 lt!376733)))))))

(assert (= (and d!106103 c!90255) b!831490))

(assert (= (and d!106103 (not c!90255)) b!831491))

(declare-fun m!775285 () Bool)

(assert (=> b!831491 m!775285))

(assert (=> b!831491 m!774921))

(assert (=> d!105391 d!106103))

(declare-fun d!106105 () Bool)

(assert (=> d!106105 (= (get!11818 (getValueByKey!415 (toList!4502 (+!1980 lt!376794 (tuple2!10151 lt!376782 minValue!754))) lt!376796)) (v!10095 (getValueByKey!415 (toList!4502 (+!1980 lt!376794 (tuple2!10151 lt!376782 minValue!754))) lt!376796)))))

(assert (=> d!105465 d!106105))

(declare-fun b!831493 () Bool)

(declare-fun e!463651 () Option!421)

(declare-fun e!463652 () Option!421)

(assert (=> b!831493 (= e!463651 e!463652)))

(declare-fun c!90257 () Bool)

(assert (=> b!831493 (= c!90257 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376794 (tuple2!10151 lt!376782 minValue!754)))) (not (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376794 (tuple2!10151 lt!376782 minValue!754))))) lt!376796))))))

(declare-fun b!831494 () Bool)

(assert (=> b!831494 (= e!463652 (getValueByKey!415 (t!22310 (toList!4502 (+!1980 lt!376794 (tuple2!10151 lt!376782 minValue!754)))) lt!376796))))

(declare-fun b!831495 () Bool)

(assert (=> b!831495 (= e!463652 None!419)))

(declare-fun b!831492 () Bool)

(assert (=> b!831492 (= e!463651 (Some!420 (_2!5086 (h!17070 (toList!4502 (+!1980 lt!376794 (tuple2!10151 lt!376782 minValue!754)))))))))

(declare-fun c!90256 () Bool)

(declare-fun d!106107 () Bool)

(assert (=> d!106107 (= c!90256 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376794 (tuple2!10151 lt!376782 minValue!754)))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376794 (tuple2!10151 lt!376782 minValue!754))))) lt!376796)))))

(assert (=> d!106107 (= (getValueByKey!415 (toList!4502 (+!1980 lt!376794 (tuple2!10151 lt!376782 minValue!754))) lt!376796) e!463651)))

(assert (= (and d!106107 c!90256) b!831492))

(assert (= (and d!106107 (not c!90256)) b!831493))

(assert (= (and b!831493 c!90257) b!831494))

(assert (= (and b!831493 (not c!90257)) b!831495))

(declare-fun m!775287 () Bool)

(assert (=> b!831494 m!775287))

(assert (=> d!105465 d!106107))

(declare-fun d!106109 () Bool)

(declare-fun e!463653 () Bool)

(assert (=> d!106109 e!463653))

(declare-fun res!565927 () Bool)

(assert (=> d!106109 (=> res!565927 e!463653)))

(declare-fun lt!377303 () Bool)

(assert (=> d!106109 (= res!565927 (not lt!377303))))

(declare-fun lt!377305 () Bool)

(assert (=> d!106109 (= lt!377303 lt!377305)))

(declare-fun lt!377304 () Unit!28429)

(declare-fun e!463654 () Unit!28429)

(assert (=> d!106109 (= lt!377304 e!463654)))

(declare-fun c!90258 () Bool)

(assert (=> d!106109 (= c!90258 lt!377305)))

(assert (=> d!106109 (= lt!377305 (containsKey!401 (toList!4502 lt!376949) (_1!5086 (tuple2!10151 lt!376804 minValue!754))))))

(assert (=> d!106109 (= (contains!4208 lt!376949 (_1!5086 (tuple2!10151 lt!376804 minValue!754))) lt!377303)))

(declare-fun b!831496 () Bool)

(declare-fun lt!377306 () Unit!28429)

(assert (=> b!831496 (= e!463654 lt!377306)))

(assert (=> b!831496 (= lt!377306 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376949) (_1!5086 (tuple2!10151 lt!376804 minValue!754))))))

(assert (=> b!831496 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376949) (_1!5086 (tuple2!10151 lt!376804 minValue!754))))))

(declare-fun b!831497 () Bool)

(declare-fun Unit!28479 () Unit!28429)

(assert (=> b!831497 (= e!463654 Unit!28479)))

(declare-fun b!831498 () Bool)

(assert (=> b!831498 (= e!463653 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376949) (_1!5086 (tuple2!10151 lt!376804 minValue!754)))))))

(assert (= (and d!106109 c!90258) b!831496))

(assert (= (and d!106109 (not c!90258)) b!831497))

(assert (= (and d!106109 (not res!565927)) b!831498))

(declare-fun m!775289 () Bool)

(assert (=> d!106109 m!775289))

(declare-fun m!775291 () Bool)

(assert (=> b!831496 m!775291))

(assert (=> b!831496 m!773783))

(assert (=> b!831496 m!773783))

(declare-fun m!775293 () Bool)

(assert (=> b!831496 m!775293))

(assert (=> b!831498 m!773783))

(assert (=> b!831498 m!773783))

(assert (=> b!831498 m!775293))

(assert (=> d!105435 d!106109))

(declare-fun b!831500 () Bool)

(declare-fun e!463655 () Option!421)

(declare-fun e!463656 () Option!421)

(assert (=> b!831500 (= e!463655 e!463656)))

(declare-fun c!90260 () Bool)

(assert (=> b!831500 (= c!90260 (and ((_ is Cons!15941) lt!376946) (not (= (_1!5086 (h!17070 lt!376946)) (_1!5086 (tuple2!10151 lt!376804 minValue!754))))))))

(declare-fun b!831501 () Bool)

(assert (=> b!831501 (= e!463656 (getValueByKey!415 (t!22310 lt!376946) (_1!5086 (tuple2!10151 lt!376804 minValue!754))))))

(declare-fun b!831502 () Bool)

(assert (=> b!831502 (= e!463656 None!419)))

(declare-fun b!831499 () Bool)

(assert (=> b!831499 (= e!463655 (Some!420 (_2!5086 (h!17070 lt!376946))))))

(declare-fun c!90259 () Bool)

(declare-fun d!106111 () Bool)

(assert (=> d!106111 (= c!90259 (and ((_ is Cons!15941) lt!376946) (= (_1!5086 (h!17070 lt!376946)) (_1!5086 (tuple2!10151 lt!376804 minValue!754)))))))

(assert (=> d!106111 (= (getValueByKey!415 lt!376946 (_1!5086 (tuple2!10151 lt!376804 minValue!754))) e!463655)))

(assert (= (and d!106111 c!90259) b!831499))

(assert (= (and d!106111 (not c!90259)) b!831500))

(assert (= (and b!831500 c!90260) b!831501))

(assert (= (and b!831500 (not c!90260)) b!831502))

(declare-fun m!775295 () Bool)

(assert (=> b!831501 m!775295))

(assert (=> d!105435 d!106111))

(declare-fun d!106113 () Bool)

(assert (=> d!106113 (= (getValueByKey!415 lt!376946 (_1!5086 (tuple2!10151 lt!376804 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 lt!376804 minValue!754))))))

(declare-fun lt!377307 () Unit!28429)

(assert (=> d!106113 (= lt!377307 (choose!1418 lt!376946 (_1!5086 (tuple2!10151 lt!376804 minValue!754)) (_2!5086 (tuple2!10151 lt!376804 minValue!754))))))

(declare-fun e!463657 () Bool)

(assert (=> d!106113 e!463657))

(declare-fun res!565928 () Bool)

(assert (=> d!106113 (=> (not res!565928) (not e!463657))))

(assert (=> d!106113 (= res!565928 (isStrictlySorted!441 lt!376946))))

(assert (=> d!106113 (= (lemmaContainsTupThenGetReturnValue!229 lt!376946 (_1!5086 (tuple2!10151 lt!376804 minValue!754)) (_2!5086 (tuple2!10151 lt!376804 minValue!754))) lt!377307)))

(declare-fun b!831503 () Bool)

(declare-fun res!565929 () Bool)

(assert (=> b!831503 (=> (not res!565929) (not e!463657))))

(assert (=> b!831503 (= res!565929 (containsKey!401 lt!376946 (_1!5086 (tuple2!10151 lt!376804 minValue!754))))))

(declare-fun b!831504 () Bool)

(assert (=> b!831504 (= e!463657 (contains!4209 lt!376946 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376804 minValue!754)) (_2!5086 (tuple2!10151 lt!376804 minValue!754)))))))

(assert (= (and d!106113 res!565928) b!831503))

(assert (= (and b!831503 res!565929) b!831504))

(assert (=> d!106113 m!773777))

(declare-fun m!775297 () Bool)

(assert (=> d!106113 m!775297))

(declare-fun m!775299 () Bool)

(assert (=> d!106113 m!775299))

(declare-fun m!775301 () Bool)

(assert (=> b!831503 m!775301))

(declare-fun m!775303 () Bool)

(assert (=> b!831504 m!775303))

(assert (=> d!105435 d!106113))

(declare-fun d!106115 () Bool)

(declare-fun e!463660 () Bool)

(assert (=> d!106115 e!463660))

(declare-fun res!565931 () Bool)

(assert (=> d!106115 (=> (not res!565931) (not e!463660))))

(declare-fun lt!377308 () List!15945)

(assert (=> d!106115 (= res!565931 (isStrictlySorted!441 lt!377308))))

(declare-fun e!463661 () List!15945)

(assert (=> d!106115 (= lt!377308 e!463661)))

(declare-fun c!90264 () Bool)

(assert (=> d!106115 (= c!90264 (and ((_ is Cons!15941) (toList!4502 lt!376816)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376816))) (_1!5086 (tuple2!10151 lt!376804 minValue!754)))))))

(assert (=> d!106115 (isStrictlySorted!441 (toList!4502 lt!376816))))

(assert (=> d!106115 (= (insertStrictlySorted!268 (toList!4502 lt!376816) (_1!5086 (tuple2!10151 lt!376804 minValue!754)) (_2!5086 (tuple2!10151 lt!376804 minValue!754))) lt!377308)))

(declare-fun b!831505 () Bool)

(declare-fun res!565930 () Bool)

(assert (=> b!831505 (=> (not res!565930) (not e!463660))))

(assert (=> b!831505 (= res!565930 (containsKey!401 lt!377308 (_1!5086 (tuple2!10151 lt!376804 minValue!754))))))

(declare-fun b!831506 () Bool)

(declare-fun e!463659 () List!15945)

(assert (=> b!831506 (= e!463659 (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376816)) (_1!5086 (tuple2!10151 lt!376804 minValue!754)) (_2!5086 (tuple2!10151 lt!376804 minValue!754))))))

(declare-fun bm!36339 () Bool)

(declare-fun call!36344 () List!15945)

(assert (=> bm!36339 (= call!36344 ($colon$colon!536 e!463659 (ite c!90264 (h!17070 (toList!4502 lt!376816)) (tuple2!10151 (_1!5086 (tuple2!10151 lt!376804 minValue!754)) (_2!5086 (tuple2!10151 lt!376804 minValue!754))))))))

(declare-fun c!90263 () Bool)

(assert (=> bm!36339 (= c!90263 c!90264)))

(declare-fun b!831507 () Bool)

(assert (=> b!831507 (= e!463660 (contains!4209 lt!377308 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376804 minValue!754)) (_2!5086 (tuple2!10151 lt!376804 minValue!754)))))))

(declare-fun c!90261 () Bool)

(declare-fun c!90262 () Bool)

(declare-fun b!831508 () Bool)

(assert (=> b!831508 (= e!463659 (ite c!90261 (t!22310 (toList!4502 lt!376816)) (ite c!90262 (Cons!15941 (h!17070 (toList!4502 lt!376816)) (t!22310 (toList!4502 lt!376816))) Nil!15942)))))

(declare-fun b!831509 () Bool)

(declare-fun e!463658 () List!15945)

(declare-fun call!36343 () List!15945)

(assert (=> b!831509 (= e!463658 call!36343)))

(declare-fun bm!36340 () Bool)

(declare-fun call!36342 () List!15945)

(assert (=> bm!36340 (= call!36343 call!36342)))

(declare-fun bm!36341 () Bool)

(assert (=> bm!36341 (= call!36342 call!36344)))

(declare-fun b!831510 () Bool)

(assert (=> b!831510 (= e!463658 call!36343)))

(declare-fun b!831511 () Bool)

(assert (=> b!831511 (= e!463661 call!36344)))

(declare-fun b!831512 () Bool)

(declare-fun e!463662 () List!15945)

(assert (=> b!831512 (= e!463662 call!36342)))

(declare-fun b!831513 () Bool)

(assert (=> b!831513 (= c!90262 (and ((_ is Cons!15941) (toList!4502 lt!376816)) (bvsgt (_1!5086 (h!17070 (toList!4502 lt!376816))) (_1!5086 (tuple2!10151 lt!376804 minValue!754)))))))

(assert (=> b!831513 (= e!463662 e!463658)))

(declare-fun b!831514 () Bool)

(assert (=> b!831514 (= e!463661 e!463662)))

(assert (=> b!831514 (= c!90261 (and ((_ is Cons!15941) (toList!4502 lt!376816)) (= (_1!5086 (h!17070 (toList!4502 lt!376816))) (_1!5086 (tuple2!10151 lt!376804 minValue!754)))))))

(assert (= (and d!106115 c!90264) b!831511))

(assert (= (and d!106115 (not c!90264)) b!831514))

(assert (= (and b!831514 c!90261) b!831512))

(assert (= (and b!831514 (not c!90261)) b!831513))

(assert (= (and b!831513 c!90262) b!831510))

(assert (= (and b!831513 (not c!90262)) b!831509))

(assert (= (or b!831510 b!831509) bm!36340))

(assert (= (or b!831512 bm!36340) bm!36341))

(assert (= (or b!831511 bm!36341) bm!36339))

(assert (= (and bm!36339 c!90263) b!831506))

(assert (= (and bm!36339 (not c!90263)) b!831508))

(assert (= (and d!106115 res!565931) b!831505))

(assert (= (and b!831505 res!565930) b!831507))

(declare-fun m!775305 () Bool)

(assert (=> bm!36339 m!775305))

(declare-fun m!775307 () Bool)

(assert (=> b!831505 m!775307))

(declare-fun m!775309 () Bool)

(assert (=> b!831507 m!775309))

(declare-fun m!775311 () Bool)

(assert (=> d!106115 m!775311))

(declare-fun m!775313 () Bool)

(assert (=> d!106115 m!775313))

(declare-fun m!775315 () Bool)

(assert (=> b!831506 m!775315))

(assert (=> d!105435 d!106115))

(declare-fun d!106117 () Bool)

(declare-fun e!463663 () Bool)

(assert (=> d!106117 e!463663))

(declare-fun res!565932 () Bool)

(assert (=> d!106117 (=> res!565932 e!463663)))

(declare-fun lt!377309 () Bool)

(assert (=> d!106117 (= res!565932 (not lt!377309))))

(declare-fun lt!377311 () Bool)

(assert (=> d!106117 (= lt!377309 lt!377311)))

(declare-fun lt!377310 () Unit!28429)

(declare-fun e!463664 () Unit!28429)

(assert (=> d!106117 (= lt!377310 e!463664)))

(declare-fun c!90265 () Bool)

(assert (=> d!106117 (= c!90265 lt!377311)))

(assert (=> d!106117 (= lt!377311 (containsKey!401 (toList!4502 lt!376975) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106117 (= (contains!4208 lt!376975 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377309)))

(declare-fun b!831515 () Bool)

(declare-fun lt!377312 () Unit!28429)

(assert (=> b!831515 (= e!463664 lt!377312)))

(assert (=> b!831515 (= lt!377312 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376975) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831515 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376975) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831516 () Bool)

(declare-fun Unit!28480 () Unit!28429)

(assert (=> b!831516 (= e!463664 Unit!28480)))

(declare-fun b!831517 () Bool)

(assert (=> b!831517 (= e!463663 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106117 c!90265) b!831515))

(assert (= (and d!106117 (not c!90265)) b!831516))

(assert (= (and d!106117 (not res!565932)) b!831517))

(declare-fun m!775317 () Bool)

(assert (=> d!106117 m!775317))

(declare-fun m!775319 () Bool)

(assert (=> b!831515 m!775319))

(declare-fun m!775321 () Bool)

(assert (=> b!831515 m!775321))

(assert (=> b!831515 m!775321))

(declare-fun m!775323 () Bool)

(assert (=> b!831515 m!775323))

(assert (=> b!831517 m!775321))

(assert (=> b!831517 m!775321))

(assert (=> b!831517 m!775323))

(assert (=> b!830569 d!106117))

(declare-fun d!106119 () Bool)

(assert (=> d!106119 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376795) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377313 () Unit!28429)

(assert (=> d!106119 (= lt!377313 (choose!1421 (toList!4502 lt!376795) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463665 () Bool)

(assert (=> d!106119 e!463665))

(declare-fun res!565933 () Bool)

(assert (=> d!106119 (=> (not res!565933) (not e!463665))))

(assert (=> d!106119 (= res!565933 (isStrictlySorted!441 (toList!4502 lt!376795)))))

(assert (=> d!106119 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376795) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377313)))

(declare-fun b!831518 () Bool)

(assert (=> b!831518 (= e!463665 (containsKey!401 (toList!4502 lt!376795) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106119 res!565933) b!831518))

(assert (=> d!106119 m!773723))

(assert (=> d!106119 m!773723))

(assert (=> d!106119 m!773725))

(declare-fun m!775325 () Bool)

(assert (=> d!106119 m!775325))

(assert (=> d!106119 m!774621))

(assert (=> b!831518 m!773719))

(assert (=> b!830525 d!106119))

(assert (=> b!830525 d!105615))

(assert (=> b!830525 d!105617))

(declare-fun d!106121 () Bool)

(declare-fun e!463666 () Bool)

(assert (=> d!106121 e!463666))

(declare-fun res!565934 () Bool)

(assert (=> d!106121 (=> res!565934 e!463666)))

(declare-fun lt!377314 () Bool)

(assert (=> d!106121 (= res!565934 (not lt!377314))))

(declare-fun lt!377316 () Bool)

(assert (=> d!106121 (= lt!377314 lt!377316)))

(declare-fun lt!377315 () Unit!28429)

(declare-fun e!463667 () Unit!28429)

(assert (=> d!106121 (= lt!377315 e!463667)))

(declare-fun c!90266 () Bool)

(assert (=> d!106121 (= c!90266 lt!377316)))

(assert (=> d!106121 (= lt!377316 (containsKey!401 (toList!4502 lt!376966) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))

(assert (=> d!106121 (= (contains!4208 lt!376966 (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))) lt!377314)))

(declare-fun b!831519 () Bool)

(declare-fun lt!377317 () Unit!28429)

(assert (=> b!831519 (= e!463667 lt!377317)))

(assert (=> b!831519 (= lt!377317 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376966) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))

(assert (=> b!831519 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376966) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))

(declare-fun b!831520 () Bool)

(declare-fun Unit!28481 () Unit!28429)

(assert (=> b!831520 (= e!463667 Unit!28481)))

(declare-fun b!831521 () Bool)

(assert (=> b!831521 (= e!463666 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376966) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)))))))

(assert (= (and d!106121 c!90266) b!831519))

(assert (= (and d!106121 (not c!90266)) b!831520))

(assert (= (and d!106121 (not res!565934)) b!831521))

(declare-fun m!775327 () Bool)

(assert (=> d!106121 m!775327))

(declare-fun m!775329 () Bool)

(assert (=> b!831519 m!775329))

(assert (=> b!831519 m!773843))

(assert (=> b!831519 m!773843))

(declare-fun m!775331 () Bool)

(assert (=> b!831519 m!775331))

(assert (=> b!831521 m!773843))

(assert (=> b!831521 m!773843))

(assert (=> b!831521 m!775331))

(assert (=> d!105451 d!106121))

(declare-fun b!831523 () Bool)

(declare-fun e!463668 () Option!421)

(declare-fun e!463669 () Option!421)

(assert (=> b!831523 (= e!463668 e!463669)))

(declare-fun c!90268 () Bool)

(assert (=> b!831523 (= c!90268 (and ((_ is Cons!15941) lt!376963) (not (= (_1!5086 (h!17070 lt!376963)) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))))

(declare-fun b!831524 () Bool)

(assert (=> b!831524 (= e!463669 (getValueByKey!415 (t!22310 lt!376963) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))

(declare-fun b!831525 () Bool)

(assert (=> b!831525 (= e!463669 None!419)))

(declare-fun b!831522 () Bool)

(assert (=> b!831522 (= e!463668 (Some!420 (_2!5086 (h!17070 lt!376963))))))

(declare-fun c!90267 () Bool)

(declare-fun d!106123 () Bool)

(assert (=> d!106123 (= c!90267 (and ((_ is Cons!15941) lt!376963) (= (_1!5086 (h!17070 lt!376963)) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)))))))

(assert (=> d!106123 (= (getValueByKey!415 lt!376963 (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))) e!463668)))

(assert (= (and d!106123 c!90267) b!831522))

(assert (= (and d!106123 (not c!90267)) b!831523))

(assert (= (and b!831523 c!90268) b!831524))

(assert (= (and b!831523 (not c!90268)) b!831525))

(declare-fun m!775333 () Bool)

(assert (=> b!831524 m!775333))

(assert (=> d!105451 d!106123))

(declare-fun d!106125 () Bool)

(assert (=> d!106125 (= (getValueByKey!415 lt!376963 (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))) (Some!420 (_2!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))

(declare-fun lt!377318 () Unit!28429)

(assert (=> d!106125 (= lt!377318 (choose!1418 lt!376963 (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))

(declare-fun e!463670 () Bool)

(assert (=> d!106125 e!463670))

(declare-fun res!565935 () Bool)

(assert (=> d!106125 (=> (not res!565935) (not e!463670))))

(assert (=> d!106125 (= res!565935 (isStrictlySorted!441 lt!376963))))

(assert (=> d!106125 (= (lemmaContainsTupThenGetReturnValue!229 lt!376963 (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))) lt!377318)))

(declare-fun b!831526 () Bool)

(declare-fun res!565936 () Bool)

(assert (=> b!831526 (=> (not res!565936) (not e!463670))))

(assert (=> b!831526 (= res!565936 (containsKey!401 lt!376963 (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))

(declare-fun b!831527 () Bool)

(assert (=> b!831527 (= e!463670 (contains!4209 lt!376963 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)))))))

(assert (= (and d!106125 res!565935) b!831526))

(assert (= (and b!831526 res!565936) b!831527))

(assert (=> d!106125 m!773837))

(declare-fun m!775335 () Bool)

(assert (=> d!106125 m!775335))

(declare-fun m!775337 () Bool)

(assert (=> d!106125 m!775337))

(declare-fun m!775339 () Bool)

(assert (=> b!831526 m!775339))

(declare-fun m!775341 () Bool)

(assert (=> b!831527 m!775341))

(assert (=> d!105451 d!106125))

(declare-fun d!106127 () Bool)

(declare-fun e!463673 () Bool)

(assert (=> d!106127 e!463673))

(declare-fun res!565938 () Bool)

(assert (=> d!106127 (=> (not res!565938) (not e!463673))))

(declare-fun lt!377319 () List!15945)

(assert (=> d!106127 (= res!565938 (isStrictlySorted!441 lt!377319))))

(declare-fun e!463674 () List!15945)

(assert (=> d!106127 (= lt!377319 e!463674)))

(declare-fun c!90272 () Bool)

(assert (=> d!106127 (= c!90272 (and ((_ is Cons!15941) (toList!4502 lt!376825)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376825))) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)))))))

(assert (=> d!106127 (isStrictlySorted!441 (toList!4502 lt!376825))))

(assert (=> d!106127 (= (insertStrictlySorted!268 (toList!4502 lt!376825) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))) lt!377319)))

(declare-fun b!831528 () Bool)

(declare-fun res!565937 () Bool)

(assert (=> b!831528 (=> (not res!565937) (not e!463673))))

(assert (=> b!831528 (= res!565937 (containsKey!401 lt!377319 (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))

(declare-fun e!463672 () List!15945)

(declare-fun b!831529 () Bool)

(assert (=> b!831529 (= e!463672 (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376825)) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))

(declare-fun call!36347 () List!15945)

(declare-fun bm!36342 () Bool)

(assert (=> bm!36342 (= call!36347 ($colon$colon!536 e!463672 (ite c!90272 (h!17070 (toList!4502 lt!376825)) (tuple2!10151 (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))))

(declare-fun c!90271 () Bool)

(assert (=> bm!36342 (= c!90271 c!90272)))

(declare-fun b!831530 () Bool)

(assert (=> b!831530 (= e!463673 (contains!4209 lt!377319 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)) (_2!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)))))))

(declare-fun c!90270 () Bool)

(declare-fun b!831531 () Bool)

(declare-fun c!90269 () Bool)

(assert (=> b!831531 (= e!463672 (ite c!90269 (t!22310 (toList!4502 lt!376825)) (ite c!90270 (Cons!15941 (h!17070 (toList!4502 lt!376825)) (t!22310 (toList!4502 lt!376825))) Nil!15942)))))

(declare-fun b!831532 () Bool)

(declare-fun e!463671 () List!15945)

(declare-fun call!36346 () List!15945)

(assert (=> b!831532 (= e!463671 call!36346)))

(declare-fun bm!36343 () Bool)

(declare-fun call!36345 () List!15945)

(assert (=> bm!36343 (= call!36346 call!36345)))

(declare-fun bm!36344 () Bool)

(assert (=> bm!36344 (= call!36345 call!36347)))

(declare-fun b!831533 () Bool)

(assert (=> b!831533 (= e!463671 call!36346)))

(declare-fun b!831534 () Bool)

(assert (=> b!831534 (= e!463674 call!36347)))

(declare-fun b!831535 () Bool)

(declare-fun e!463675 () List!15945)

(assert (=> b!831535 (= e!463675 call!36345)))

(declare-fun b!831536 () Bool)

(assert (=> b!831536 (= c!90270 (and ((_ is Cons!15941) (toList!4502 lt!376825)) (bvsgt (_1!5086 (h!17070 (toList!4502 lt!376825))) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)))))))

(assert (=> b!831536 (= e!463675 e!463671)))

(declare-fun b!831537 () Bool)

(assert (=> b!831537 (= e!463674 e!463675)))

(assert (=> b!831537 (= c!90269 (and ((_ is Cons!15941) (toList!4502 lt!376825)) (= (_1!5086 (h!17070 (toList!4502 lt!376825))) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)))))))

(assert (= (and d!106127 c!90272) b!831534))

(assert (= (and d!106127 (not c!90272)) b!831537))

(assert (= (and b!831537 c!90269) b!831535))

(assert (= (and b!831537 (not c!90269)) b!831536))

(assert (= (and b!831536 c!90270) b!831533))

(assert (= (and b!831536 (not c!90270)) b!831532))

(assert (= (or b!831533 b!831532) bm!36343))

(assert (= (or b!831535 bm!36343) bm!36344))

(assert (= (or b!831534 bm!36344) bm!36342))

(assert (= (and bm!36342 c!90271) b!831529))

(assert (= (and bm!36342 (not c!90271)) b!831531))

(assert (= (and d!106127 res!565938) b!831528))

(assert (= (and b!831528 res!565937) b!831530))

(declare-fun m!775343 () Bool)

(assert (=> bm!36342 m!775343))

(declare-fun m!775345 () Bool)

(assert (=> b!831528 m!775345))

(declare-fun m!775347 () Bool)

(assert (=> b!831530 m!775347))

(declare-fun m!775349 () Bool)

(assert (=> d!106127 m!775349))

(declare-fun m!775351 () Bool)

(assert (=> d!106127 m!775351))

(declare-fun m!775353 () Bool)

(assert (=> b!831529 m!775353))

(assert (=> d!105451 d!106127))

(declare-fun b!831538 () Bool)

(assert (=> b!831538 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(assert (=> b!831538 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22750 _values!788)))))

(declare-fun lt!377325 () ListLongMap!8973)

(declare-fun e!463676 () Bool)

(assert (=> b!831538 (= e!463676 (= (apply!372 lt!377325 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831539 () Bool)

(declare-fun lt!377326 () Unit!28429)

(declare-fun lt!377320 () Unit!28429)

(assert (=> b!831539 (= lt!377326 lt!377320)))

(declare-fun lt!377322 () (_ BitVec 64))

(declare-fun lt!377324 () ListLongMap!8973)

(declare-fun lt!377323 () (_ BitVec 64))

(declare-fun lt!377321 () V!25277)

(assert (=> b!831539 (not (contains!4208 (+!1980 lt!377324 (tuple2!10151 lt!377323 lt!377321)) lt!377322))))

(assert (=> b!831539 (= lt!377320 (addStillNotContains!197 lt!377324 lt!377323 lt!377321 lt!377322))))

(assert (=> b!831539 (= lt!377322 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!831539 (= lt!377321 (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!831539 (= lt!377323 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun call!36348 () ListLongMap!8973)

(assert (=> b!831539 (= lt!377324 call!36348)))

(declare-fun e!463682 () ListLongMap!8973)

(assert (=> b!831539 (= e!463682 (+!1980 call!36348 (tuple2!10151 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!11817 (select (arr!22329 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!831540 () Bool)

(declare-fun e!463677 () Bool)

(declare-fun e!463678 () Bool)

(assert (=> b!831540 (= e!463677 e!463678)))

(declare-fun c!90276 () Bool)

(declare-fun e!463680 () Bool)

(assert (=> b!831540 (= c!90276 e!463680)))

(declare-fun res!565941 () Bool)

(assert (=> b!831540 (=> (not res!565941) (not e!463680))))

(assert (=> b!831540 (= res!565941 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(declare-fun b!831541 () Bool)

(declare-fun e!463681 () ListLongMap!8973)

(assert (=> b!831541 (= e!463681 (ListLongMap!8974 Nil!15942))))

(declare-fun b!831542 () Bool)

(declare-fun res!565939 () Bool)

(assert (=> b!831542 (=> (not res!565939) (not e!463677))))

(assert (=> b!831542 (= res!565939 (not (contains!4208 lt!377325 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831543 () Bool)

(declare-fun e!463679 () Bool)

(assert (=> b!831543 (= e!463679 (isEmpty!654 lt!377325))))

(declare-fun d!106129 () Bool)

(assert (=> d!106129 e!463677))

(declare-fun res!565940 () Bool)

(assert (=> d!106129 (=> (not res!565940) (not e!463677))))

(assert (=> d!106129 (= res!565940 (not (contains!4208 lt!377325 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106129 (= lt!377325 e!463681)))

(declare-fun c!90274 () Bool)

(assert (=> d!106129 (= c!90274 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(assert (=> d!106129 (validMask!0 mask!1312)))

(assert (=> d!106129 (= (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796) lt!377325)))

(declare-fun b!831544 () Bool)

(assert (=> b!831544 (= e!463678 e!463676)))

(assert (=> b!831544 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(declare-fun res!565942 () Bool)

(assert (=> b!831544 (= res!565942 (contains!4208 lt!377325 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!831544 (=> (not res!565942) (not e!463676))))

(declare-fun b!831545 () Bool)

(assert (=> b!831545 (= e!463682 call!36348)))

(declare-fun b!831546 () Bool)

(assert (=> b!831546 (= e!463679 (= lt!377325 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!36345 () Bool)

(assert (=> bm!36345 (= call!36348 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!831547 () Bool)

(assert (=> b!831547 (= e!463678 e!463679)))

(declare-fun c!90275 () Bool)

(assert (=> b!831547 (= c!90275 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(declare-fun b!831548 () Bool)

(assert (=> b!831548 (= e!463680 (validKeyInArray!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!831548 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!831549 () Bool)

(assert (=> b!831549 (= e!463681 e!463682)))

(declare-fun c!90273 () Bool)

(assert (=> b!831549 (= c!90273 (validKeyInArray!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!106129 c!90274) b!831541))

(assert (= (and d!106129 (not c!90274)) b!831549))

(assert (= (and b!831549 c!90273) b!831539))

(assert (= (and b!831549 (not c!90273)) b!831545))

(assert (= (or b!831539 b!831545) bm!36345))

(assert (= (and d!106129 res!565940) b!831542))

(assert (= (and b!831542 res!565939) b!831540))

(assert (= (and b!831540 res!565941) b!831548))

(assert (= (and b!831540 c!90276) b!831544))

(assert (= (and b!831540 (not c!90276)) b!831547))

(assert (= (and b!831544 res!565942) b!831538))

(assert (= (and b!831547 c!90275) b!831546))

(assert (= (and b!831547 (not c!90275)) b!831543))

(declare-fun b_lambda!11391 () Bool)

(assert (=> (not b_lambda!11391) (not b!831538)))

(assert (=> b!831538 t!22314))

(declare-fun b_and!22555 () Bool)

(assert (= b_and!22553 (and (=> t!22314 result!8015) b_and!22555)))

(declare-fun b_lambda!11393 () Bool)

(assert (=> (not b_lambda!11393) (not b!831539)))

(assert (=> b!831539 t!22314))

(declare-fun b_and!22557 () Bool)

(assert (= b_and!22555 (and (=> t!22314 result!8015) b_and!22557)))

(declare-fun m!775355 () Bool)

(assert (=> bm!36345 m!775355))

(assert (=> b!831538 m!774501))

(assert (=> b!831538 m!774501))

(assert (=> b!831538 m!773433))

(assert (=> b!831538 m!774503))

(assert (=> b!831538 m!773433))

(assert (=> b!831538 m!774505))

(declare-fun m!775357 () Bool)

(assert (=> b!831538 m!775357))

(assert (=> b!831538 m!774505))

(declare-fun m!775359 () Bool)

(assert (=> b!831543 m!775359))

(assert (=> b!831544 m!774505))

(assert (=> b!831544 m!774505))

(declare-fun m!775361 () Bool)

(assert (=> b!831544 m!775361))

(assert (=> b!831549 m!774505))

(assert (=> b!831549 m!774505))

(assert (=> b!831549 m!774513))

(assert (=> b!831539 m!774501))

(declare-fun m!775363 () Bool)

(assert (=> b!831539 m!775363))

(assert (=> b!831539 m!773433))

(declare-fun m!775365 () Bool)

(assert (=> b!831539 m!775365))

(assert (=> b!831539 m!774501))

(assert (=> b!831539 m!773433))

(assert (=> b!831539 m!774503))

(assert (=> b!831539 m!775363))

(declare-fun m!775367 () Bool)

(assert (=> b!831539 m!775367))

(declare-fun m!775369 () Bool)

(assert (=> b!831539 m!775369))

(assert (=> b!831539 m!774505))

(declare-fun m!775371 () Bool)

(assert (=> b!831542 m!775371))

(assert (=> b!831548 m!774505))

(assert (=> b!831548 m!774505))

(assert (=> b!831548 m!774513))

(assert (=> b!831546 m!775355))

(declare-fun m!775373 () Bool)

(assert (=> d!106129 m!775373))

(assert (=> d!106129 m!773289))

(assert (=> bm!36271 d!106129))

(declare-fun d!106131 () Bool)

(assert (=> d!106131 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376817) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377327 () Unit!28429)

(assert (=> d!106131 (= lt!377327 (choose!1421 (toList!4502 lt!376817) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463683 () Bool)

(assert (=> d!106131 e!463683))

(declare-fun res!565943 () Bool)

(assert (=> d!106131 (=> (not res!565943) (not e!463683))))

(assert (=> d!106131 (= res!565943 (isStrictlySorted!441 (toList!4502 lt!376817)))))

(assert (=> d!106131 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376817) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377327)))

(declare-fun b!831550 () Bool)

(assert (=> b!831550 (= e!463683 (containsKey!401 (toList!4502 lt!376817) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106131 res!565943) b!831550))

(assert (=> d!106131 m!774089))

(assert (=> d!106131 m!774089))

(assert (=> d!106131 m!774185))

(declare-fun m!775375 () Bool)

(assert (=> d!106131 m!775375))

(assert (=> d!106131 m!774859))

(assert (=> b!831550 m!774181))

(assert (=> b!830705 d!106131))

(assert (=> b!830705 d!105621))

(assert (=> b!830705 d!105623))

(declare-fun d!106133 () Bool)

(assert (=> d!106133 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377328 () Unit!28429)

(assert (=> d!106133 (= lt!377328 (choose!1421 (toList!4502 lt!376856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463684 () Bool)

(assert (=> d!106133 e!463684))

(declare-fun res!565944 () Bool)

(assert (=> d!106133 (=> (not res!565944) (not e!463684))))

(assert (=> d!106133 (= res!565944 (isStrictlySorted!441 (toList!4502 lt!376856)))))

(assert (=> d!106133 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376856) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377328)))

(declare-fun b!831551 () Bool)

(assert (=> b!831551 (= e!463684 (containsKey!401 (toList!4502 lt!376856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106133 res!565944) b!831551))

(assert (=> d!106133 m!774085))

(assert (=> d!106133 m!774085))

(assert (=> d!106133 m!774087))

(declare-fun m!775377 () Bool)

(assert (=> d!106133 m!775377))

(assert (=> d!106133 m!774839))

(assert (=> b!831551 m!774081))

(assert (=> b!830658 d!106133))

(assert (=> b!830658 d!105633))

(assert (=> b!830658 d!105635))

(declare-fun d!106135 () Bool)

(declare-fun res!565945 () Bool)

(declare-fun e!463685 () Bool)

(assert (=> d!106135 (=> res!565945 e!463685)))

(assert (=> d!106135 (= res!565945 (and ((_ is Cons!15941) (toList!4502 lt!376795)) (= (_1!5086 (h!17070 (toList!4502 lt!376795))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106135 (= (containsKey!401 (toList!4502 lt!376795) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) e!463685)))

(declare-fun b!831552 () Bool)

(declare-fun e!463686 () Bool)

(assert (=> b!831552 (= e!463685 e!463686)))

(declare-fun res!565946 () Bool)

(assert (=> b!831552 (=> (not res!565946) (not e!463686))))

(assert (=> b!831552 (= res!565946 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376795))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376795))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15941) (toList!4502 lt!376795)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376795))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!831553 () Bool)

(assert (=> b!831553 (= e!463686 (containsKey!401 (t!22310 (toList!4502 lt!376795)) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106135 (not res!565945)) b!831552))

(assert (= (and b!831552 res!565946) b!831553))

(assert (=> b!831553 m!773353))

(declare-fun m!775379 () Bool)

(assert (=> b!831553 m!775379))

(assert (=> d!105389 d!106135))

(declare-fun d!106137 () Bool)

(declare-fun lt!377329 () Bool)

(assert (=> d!106137 (= lt!377329 (select (content!386 lt!376717) (tuple2!10151 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!463688 () Bool)

(assert (=> d!106137 (= lt!377329 e!463688)))

(declare-fun res!565947 () Bool)

(assert (=> d!106137 (=> (not res!565947) (not e!463688))))

(assert (=> d!106137 (= res!565947 ((_ is Cons!15941) lt!376717))))

(assert (=> d!106137 (= (contains!4209 lt!376717 (tuple2!10151 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!377329)))

(declare-fun b!831554 () Bool)

(declare-fun e!463687 () Bool)

(assert (=> b!831554 (= e!463688 e!463687)))

(declare-fun res!565948 () Bool)

(assert (=> b!831554 (=> res!565948 e!463687)))

(assert (=> b!831554 (= res!565948 (= (h!17070 lt!376717) (tuple2!10151 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831555 () Bool)

(assert (=> b!831555 (= e!463687 (contains!4209 (t!22310 lt!376717) (tuple2!10151 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106137 res!565947) b!831554))

(assert (= (and b!831554 (not res!565948)) b!831555))

(declare-fun m!775381 () Bool)

(assert (=> d!106137 m!775381))

(declare-fun m!775383 () Bool)

(assert (=> d!106137 m!775383))

(declare-fun m!775385 () Bool)

(assert (=> b!831555 m!775385))

(assert (=> b!830740 d!106137))

(declare-fun d!106139 () Bool)

(declare-fun lt!377330 () Bool)

(assert (=> d!106139 (= lt!377330 (select (content!386 (toList!4502 lt!377003)) (tuple2!10151 lt!376792 zeroValueBefore!34)))))

(declare-fun e!463690 () Bool)

(assert (=> d!106139 (= lt!377330 e!463690)))

(declare-fun res!565949 () Bool)

(assert (=> d!106139 (=> (not res!565949) (not e!463690))))

(assert (=> d!106139 (= res!565949 ((_ is Cons!15941) (toList!4502 lt!377003)))))

(assert (=> d!106139 (= (contains!4209 (toList!4502 lt!377003) (tuple2!10151 lt!376792 zeroValueBefore!34)) lt!377330)))

(declare-fun b!831556 () Bool)

(declare-fun e!463689 () Bool)

(assert (=> b!831556 (= e!463690 e!463689)))

(declare-fun res!565950 () Bool)

(assert (=> b!831556 (=> res!565950 e!463689)))

(assert (=> b!831556 (= res!565950 (= (h!17070 (toList!4502 lt!377003)) (tuple2!10151 lt!376792 zeroValueBefore!34)))))

(declare-fun b!831557 () Bool)

(assert (=> b!831557 (= e!463689 (contains!4209 (t!22310 (toList!4502 lt!377003)) (tuple2!10151 lt!376792 zeroValueBefore!34)))))

(assert (= (and d!106139 res!565949) b!831556))

(assert (= (and b!831556 (not res!565950)) b!831557))

(declare-fun m!775387 () Bool)

(assert (=> d!106139 m!775387))

(declare-fun m!775389 () Bool)

(assert (=> d!106139 m!775389))

(declare-fun m!775391 () Bool)

(assert (=> b!831557 m!775391))

(assert (=> b!830603 d!106139))

(declare-fun d!106141 () Bool)

(assert (=> d!106141 (= (apply!372 (+!1980 lt!376816 (tuple2!10151 lt!376804 minValue!754)) lt!376818) (apply!372 lt!376816 lt!376818))))

(assert (=> d!106141 true))

(declare-fun _$34!1144 () Unit!28429)

(assert (=> d!106141 (= (choose!1419 lt!376816 lt!376804 minValue!754 lt!376818) _$34!1144)))

(declare-fun bs!23248 () Bool)

(assert (= bs!23248 d!106141))

(assert (=> bs!23248 m!773453))

(assert (=> bs!23248 m!773453))

(assert (=> bs!23248 m!773455))

(assert (=> bs!23248 m!773467))

(assert (=> d!105425 d!106141))

(assert (=> d!105425 d!105431))

(assert (=> d!105425 d!105433))

(assert (=> d!105425 d!105435))

(declare-fun d!106143 () Bool)

(declare-fun e!463691 () Bool)

(assert (=> d!106143 e!463691))

(declare-fun res!565951 () Bool)

(assert (=> d!106143 (=> res!565951 e!463691)))

(declare-fun lt!377331 () Bool)

(assert (=> d!106143 (= res!565951 (not lt!377331))))

(declare-fun lt!377333 () Bool)

(assert (=> d!106143 (= lt!377331 lt!377333)))

(declare-fun lt!377332 () Unit!28429)

(declare-fun e!463692 () Unit!28429)

(assert (=> d!106143 (= lt!377332 e!463692)))

(declare-fun c!90277 () Bool)

(assert (=> d!106143 (= c!90277 lt!377333)))

(assert (=> d!106143 (= lt!377333 (containsKey!401 (toList!4502 lt!376816) lt!376818))))

(assert (=> d!106143 (= (contains!4208 lt!376816 lt!376818) lt!377331)))

(declare-fun b!831558 () Bool)

(declare-fun lt!377334 () Unit!28429)

(assert (=> b!831558 (= e!463692 lt!377334)))

(assert (=> b!831558 (= lt!377334 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376816) lt!376818))))

(assert (=> b!831558 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376816) lt!376818))))

(declare-fun b!831559 () Bool)

(declare-fun Unit!28482 () Unit!28429)

(assert (=> b!831559 (= e!463692 Unit!28482)))

(declare-fun b!831560 () Bool)

(assert (=> b!831560 (= e!463691 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376816) lt!376818)))))

(assert (= (and d!106143 c!90277) b!831558))

(assert (= (and d!106143 (not c!90277)) b!831559))

(assert (= (and d!106143 (not res!565951)) b!831560))

(declare-fun m!775393 () Bool)

(assert (=> d!106143 m!775393))

(declare-fun m!775395 () Bool)

(assert (=> b!831558 m!775395))

(assert (=> b!831558 m!773767))

(assert (=> b!831558 m!773767))

(declare-fun m!775397 () Bool)

(assert (=> b!831558 m!775397))

(assert (=> b!831560 m!773767))

(assert (=> b!831560 m!773767))

(assert (=> b!831560 m!775397))

(assert (=> d!105425 d!106143))

(declare-fun d!106145 () Bool)

(assert (=> d!106145 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376863) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377335 () Unit!28429)

(assert (=> d!106145 (= lt!377335 (choose!1421 (toList!4502 lt!376863) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463693 () Bool)

(assert (=> d!106145 e!463693))

(declare-fun res!565952 () Bool)

(assert (=> d!106145 (=> (not res!565952) (not e!463693))))

(assert (=> d!106145 (= res!565952 (isStrictlySorted!441 (toList!4502 lt!376863)))))

(assert (=> d!106145 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376863) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377335)))

(declare-fun b!831561 () Bool)

(assert (=> b!831561 (= e!463693 (containsKey!401 (toList!4502 lt!376863) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106145 res!565952) b!831561))

(assert (=> d!106145 m!773581))

(assert (=> d!106145 m!773581))

(assert (=> d!106145 m!773583))

(declare-fun m!775399 () Bool)

(assert (=> d!106145 m!775399))

(assert (=> d!106145 m!774461))

(assert (=> b!831561 m!773577))

(assert (=> b!830434 d!106145))

(assert (=> b!830434 d!105665))

(assert (=> b!830434 d!105667))

(declare-fun d!106147 () Bool)

(declare-fun lt!377336 () Bool)

(assert (=> d!106147 (= lt!377336 (select (content!386 lt!376830) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun e!463695 () Bool)

(assert (=> d!106147 (= lt!377336 e!463695)))

(declare-fun res!565953 () Bool)

(assert (=> d!106147 (=> (not res!565953) (not e!463695))))

(assert (=> d!106147 (= res!565953 ((_ is Cons!15941) lt!376830))))

(assert (=> d!106147 (= (contains!4209 lt!376830 (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))) lt!377336)))

(declare-fun b!831562 () Bool)

(declare-fun e!463694 () Bool)

(assert (=> b!831562 (= e!463695 e!463694)))

(declare-fun res!565954 () Bool)

(assert (=> b!831562 (=> res!565954 e!463694)))

(assert (=> b!831562 (= res!565954 (= (h!17070 lt!376830) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun b!831563 () Bool)

(assert (=> b!831563 (= e!463694 (contains!4209 (t!22310 lt!376830) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(assert (= (and d!106147 res!565953) b!831562))

(assert (= (and b!831562 (not res!565954)) b!831563))

(declare-fun m!775401 () Bool)

(assert (=> d!106147 m!775401))

(declare-fun m!775403 () Bool)

(assert (=> d!106147 m!775403))

(declare-fun m!775405 () Bool)

(assert (=> b!831563 m!775405))

(assert (=> b!830681 d!106147))

(declare-fun d!106149 () Bool)

(declare-fun res!565955 () Bool)

(declare-fun e!463696 () Bool)

(assert (=> d!106149 (=> res!565955 e!463696)))

(assert (=> d!106149 (= res!565955 (or ((_ is Nil!15942) lt!376941) ((_ is Nil!15942) (t!22310 lt!376941))))))

(assert (=> d!106149 (= (isStrictlySorted!441 lt!376941) e!463696)))

(declare-fun b!831564 () Bool)

(declare-fun e!463697 () Bool)

(assert (=> b!831564 (= e!463696 e!463697)))

(declare-fun res!565956 () Bool)

(assert (=> b!831564 (=> (not res!565956) (not e!463697))))

(assert (=> b!831564 (= res!565956 (bvslt (_1!5086 (h!17070 lt!376941)) (_1!5086 (h!17070 (t!22310 lt!376941)))))))

(declare-fun b!831565 () Bool)

(assert (=> b!831565 (= e!463697 (isStrictlySorted!441 (t!22310 lt!376941)))))

(assert (= (and d!106149 (not res!565955)) b!831564))

(assert (= (and b!831564 res!565956) b!831565))

(declare-fun m!775407 () Bool)

(assert (=> b!831565 m!775407))

(assert (=> d!105423 d!106149))

(assert (=> d!105423 d!106069))

(declare-fun d!106151 () Bool)

(declare-fun res!565957 () Bool)

(declare-fun e!463698 () Bool)

(assert (=> d!106151 (=> res!565957 e!463698)))

(assert (=> d!106151 (= res!565957 (and ((_ is Cons!15941) (toList!4502 lt!376737)) (= (_1!5086 (h!17070 (toList!4502 lt!376737))) (_1!5086 lt!376679))))))

(assert (=> d!106151 (= (containsKey!401 (toList!4502 lt!376737) (_1!5086 lt!376679)) e!463698)))

(declare-fun b!831566 () Bool)

(declare-fun e!463699 () Bool)

(assert (=> b!831566 (= e!463698 e!463699)))

(declare-fun res!565958 () Bool)

(assert (=> b!831566 (=> (not res!565958) (not e!463699))))

(assert (=> b!831566 (= res!565958 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376737))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376737))) (_1!5086 lt!376679))) ((_ is Cons!15941) (toList!4502 lt!376737)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376737))) (_1!5086 lt!376679))))))

(declare-fun b!831567 () Bool)

(assert (=> b!831567 (= e!463699 (containsKey!401 (t!22310 (toList!4502 lt!376737)) (_1!5086 lt!376679)))))

(assert (= (and d!106151 (not res!565957)) b!831566))

(assert (= (and b!831566 res!565958) b!831567))

(declare-fun m!775409 () Bool)

(assert (=> b!831567 m!775409))

(assert (=> d!105505 d!106151))

(declare-fun b!831569 () Bool)

(declare-fun e!463700 () Option!421)

(declare-fun e!463701 () Option!421)

(assert (=> b!831569 (= e!463700 e!463701)))

(declare-fun c!90279 () Bool)

(assert (=> b!831569 (= c!90279 (and ((_ is Cons!15941) (toList!4502 lt!376961)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376961))) (_1!5086 (tuple2!10151 lt!376813 minValue!754))))))))

(declare-fun b!831570 () Bool)

(assert (=> b!831570 (= e!463701 (getValueByKey!415 (t!22310 (toList!4502 lt!376961)) (_1!5086 (tuple2!10151 lt!376813 minValue!754))))))

(declare-fun b!831571 () Bool)

(assert (=> b!831571 (= e!463701 None!419)))

(declare-fun b!831568 () Bool)

(assert (=> b!831568 (= e!463700 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376961)))))))

(declare-fun c!90278 () Bool)

(declare-fun d!106153 () Bool)

(assert (=> d!106153 (= c!90278 (and ((_ is Cons!15941) (toList!4502 lt!376961)) (= (_1!5086 (h!17070 (toList!4502 lt!376961))) (_1!5086 (tuple2!10151 lt!376813 minValue!754)))))))

(assert (=> d!106153 (= (getValueByKey!415 (toList!4502 lt!376961) (_1!5086 (tuple2!10151 lt!376813 minValue!754))) e!463700)))

(assert (= (and d!106153 c!90278) b!831568))

(assert (= (and d!106153 (not c!90278)) b!831569))

(assert (= (and b!831569 c!90279) b!831570))

(assert (= (and b!831569 (not c!90279)) b!831571))

(declare-fun m!775411 () Bool)

(assert (=> b!831570 m!775411))

(assert (=> b!830559 d!106153))

(declare-fun d!106155 () Bool)

(declare-fun res!565959 () Bool)

(declare-fun e!463702 () Bool)

(assert (=> d!106155 (=> res!565959 e!463702)))

(assert (=> d!106155 (= res!565959 (or ((_ is Nil!15942) lt!377018) ((_ is Nil!15942) (t!22310 lt!377018))))))

(assert (=> d!106155 (= (isStrictlySorted!441 lt!377018) e!463702)))

(declare-fun b!831572 () Bool)

(declare-fun e!463703 () Bool)

(assert (=> b!831572 (= e!463702 e!463703)))

(declare-fun res!565960 () Bool)

(assert (=> b!831572 (=> (not res!565960) (not e!463703))))

(assert (=> b!831572 (= res!565960 (bvslt (_1!5086 (h!17070 lt!377018)) (_1!5086 (h!17070 (t!22310 lt!377018)))))))

(declare-fun b!831573 () Bool)

(assert (=> b!831573 (= e!463703 (isStrictlySorted!441 (t!22310 lt!377018)))))

(assert (= (and d!106155 (not res!565959)) b!831572))

(assert (= (and b!831572 res!565960) b!831573))

(declare-fun m!775413 () Bool)

(assert (=> b!831573 m!775413))

(assert (=> d!105503 d!106155))

(declare-fun d!106157 () Bool)

(declare-fun res!565961 () Bool)

(declare-fun e!463704 () Bool)

(assert (=> d!106157 (=> res!565961 e!463704)))

(assert (=> d!106157 (= res!565961 (or ((_ is Nil!15942) (toList!4502 (+!1980 lt!376683 lt!376677))) ((_ is Nil!15942) (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677))))))))

(assert (=> d!106157 (= (isStrictlySorted!441 (toList!4502 (+!1980 lt!376683 lt!376677))) e!463704)))

(declare-fun b!831574 () Bool)

(declare-fun e!463705 () Bool)

(assert (=> b!831574 (= e!463704 e!463705)))

(declare-fun res!565962 () Bool)

(assert (=> b!831574 (=> (not res!565962) (not e!463705))))

(assert (=> b!831574 (= res!565962 (bvslt (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376683 lt!376677)))) (_1!5086 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677)))))))))

(declare-fun b!831575 () Bool)

(assert (=> b!831575 (= e!463705 (isStrictlySorted!441 (t!22310 (toList!4502 (+!1980 lt!376683 lt!376677)))))))

(assert (= (and d!106157 (not res!565961)) b!831574))

(assert (= (and b!831574 res!565962) b!831575))

(assert (=> b!831575 m!774693))

(assert (=> d!105503 d!106157))

(declare-fun d!106159 () Bool)

(declare-fun e!463706 () Bool)

(assert (=> d!106159 e!463706))

(declare-fun res!565963 () Bool)

(assert (=> d!106159 (=> res!565963 e!463706)))

(declare-fun lt!377337 () Bool)

(assert (=> d!106159 (= res!565963 (not lt!377337))))

(declare-fun lt!377339 () Bool)

(assert (=> d!106159 (= lt!377337 lt!377339)))

(declare-fun lt!377338 () Unit!28429)

(declare-fun e!463707 () Unit!28429)

(assert (=> d!106159 (= lt!377338 e!463707)))

(declare-fun c!90280 () Bool)

(assert (=> d!106159 (= c!90280 lt!377339)))

(assert (=> d!106159 (= lt!377339 (containsKey!401 (toList!4502 lt!376909) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106159 (= (contains!4208 lt!376909 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377337)))

(declare-fun b!831576 () Bool)

(declare-fun lt!377340 () Unit!28429)

(assert (=> b!831576 (= e!463707 lt!377340)))

(assert (=> b!831576 (= lt!377340 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376909) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!831576 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376909) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!831577 () Bool)

(declare-fun Unit!28483 () Unit!28429)

(assert (=> b!831577 (= e!463707 Unit!28483)))

(declare-fun b!831578 () Bool)

(assert (=> b!831578 (= e!463706 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376909) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!106159 c!90280) b!831576))

(assert (= (and d!106159 (not c!90280)) b!831577))

(assert (= (and d!106159 (not res!565963)) b!831578))

(declare-fun m!775415 () Bool)

(assert (=> d!106159 m!775415))

(declare-fun m!775417 () Bool)

(assert (=> b!831576 m!775417))

(assert (=> b!831576 m!773657))

(assert (=> b!831576 m!773657))

(declare-fun m!775419 () Bool)

(assert (=> b!831576 m!775419))

(assert (=> b!831578 m!773657))

(assert (=> b!831578 m!773657))

(assert (=> b!831578 m!775419))

(assert (=> d!105397 d!106159))

(declare-fun b!831580 () Bool)

(declare-fun e!463708 () Option!421)

(declare-fun e!463709 () Option!421)

(assert (=> b!831580 (= e!463708 e!463709)))

(declare-fun c!90282 () Bool)

(assert (=> b!831580 (= c!90282 (and ((_ is Cons!15941) lt!376906) (not (= (_1!5086 (h!17070 lt!376906)) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!831581 () Bool)

(assert (=> b!831581 (= e!463709 (getValueByKey!415 (t!22310 lt!376906) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!831582 () Bool)

(assert (=> b!831582 (= e!463709 None!419)))

(declare-fun b!831579 () Bool)

(assert (=> b!831579 (= e!463708 (Some!420 (_2!5086 (h!17070 lt!376906))))))

(declare-fun c!90281 () Bool)

(declare-fun d!106161 () Bool)

(assert (=> d!106161 (= c!90281 (and ((_ is Cons!15941) lt!376906) (= (_1!5086 (h!17070 lt!376906)) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!106161 (= (getValueByKey!415 lt!376906 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!463708)))

(assert (= (and d!106161 c!90281) b!831579))

(assert (= (and d!106161 (not c!90281)) b!831580))

(assert (= (and b!831580 c!90282) b!831581))

(assert (= (and b!831580 (not c!90282)) b!831582))

(declare-fun m!775421 () Bool)

(assert (=> b!831581 m!775421))

(assert (=> d!105397 d!106161))

(declare-fun d!106163 () Bool)

(assert (=> d!106163 (= (getValueByKey!415 lt!376906 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!420 (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377341 () Unit!28429)

(assert (=> d!106163 (= lt!377341 (choose!1418 lt!376906 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!463710 () Bool)

(assert (=> d!106163 e!463710))

(declare-fun res!565964 () Bool)

(assert (=> d!106163 (=> (not res!565964) (not e!463710))))

(assert (=> d!106163 (= res!565964 (isStrictlySorted!441 lt!376906))))

(assert (=> d!106163 (= (lemmaContainsTupThenGetReturnValue!229 lt!376906 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377341)))

(declare-fun b!831583 () Bool)

(declare-fun res!565965 () Bool)

(assert (=> b!831583 (=> (not res!565965) (not e!463710))))

(assert (=> b!831583 (= res!565965 (containsKey!401 lt!376906 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!831584 () Bool)

(assert (=> b!831584 (= e!463710 (contains!4209 lt!376906 (tuple2!10151 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!106163 res!565964) b!831583))

(assert (= (and b!831583 res!565965) b!831584))

(assert (=> d!106163 m!773651))

(declare-fun m!775423 () Bool)

(assert (=> d!106163 m!775423))

(declare-fun m!775425 () Bool)

(assert (=> d!106163 m!775425))

(declare-fun m!775427 () Bool)

(assert (=> b!831583 m!775427))

(declare-fun m!775429 () Bool)

(assert (=> b!831584 m!775429))

(assert (=> d!105397 d!106163))

(declare-fun d!106165 () Bool)

(declare-fun e!463713 () Bool)

(assert (=> d!106165 e!463713))

(declare-fun res!565967 () Bool)

(assert (=> d!106165 (=> (not res!565967) (not e!463713))))

(declare-fun lt!377342 () List!15945)

(assert (=> d!106165 (= res!565967 (isStrictlySorted!441 lt!377342))))

(declare-fun e!463714 () List!15945)

(assert (=> d!106165 (= lt!377342 e!463714)))

(declare-fun c!90286 () Bool)

(assert (=> d!106165 (= c!90286 (and ((_ is Cons!15941) (toList!4502 call!36259)) (bvslt (_1!5086 (h!17070 (toList!4502 call!36259))) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!106165 (isStrictlySorted!441 (toList!4502 call!36259))))

(assert (=> d!106165 (= (insertStrictlySorted!268 (toList!4502 call!36259) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377342)))

(declare-fun b!831585 () Bool)

(declare-fun res!565966 () Bool)

(assert (=> b!831585 (=> (not res!565966) (not e!463713))))

(assert (=> b!831585 (= res!565966 (containsKey!401 lt!377342 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!831586 () Bool)

(declare-fun e!463712 () List!15945)

(assert (=> b!831586 (= e!463712 (insertStrictlySorted!268 (t!22310 (toList!4502 call!36259)) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun call!36351 () List!15945)

(declare-fun bm!36346 () Bool)

(assert (=> bm!36346 (= call!36351 ($colon$colon!536 e!463712 (ite c!90286 (h!17070 (toList!4502 call!36259)) (tuple2!10151 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!90285 () Bool)

(assert (=> bm!36346 (= c!90285 c!90286)))

(declare-fun b!831587 () Bool)

(assert (=> b!831587 (= e!463713 (contains!4209 lt!377342 (tuple2!10151 (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun c!90283 () Bool)

(declare-fun c!90284 () Bool)

(declare-fun b!831588 () Bool)

(assert (=> b!831588 (= e!463712 (ite c!90283 (t!22310 (toList!4502 call!36259)) (ite c!90284 (Cons!15941 (h!17070 (toList!4502 call!36259)) (t!22310 (toList!4502 call!36259))) Nil!15942)))))

(declare-fun b!831589 () Bool)

(declare-fun e!463711 () List!15945)

(declare-fun call!36350 () List!15945)

(assert (=> b!831589 (= e!463711 call!36350)))

(declare-fun bm!36347 () Bool)

(declare-fun call!36349 () List!15945)

(assert (=> bm!36347 (= call!36350 call!36349)))

(declare-fun bm!36348 () Bool)

(assert (=> bm!36348 (= call!36349 call!36351)))

(declare-fun b!831590 () Bool)

(assert (=> b!831590 (= e!463711 call!36350)))

(declare-fun b!831591 () Bool)

(assert (=> b!831591 (= e!463714 call!36351)))

(declare-fun b!831592 () Bool)

(declare-fun e!463715 () List!15945)

(assert (=> b!831592 (= e!463715 call!36349)))

(declare-fun b!831593 () Bool)

(assert (=> b!831593 (= c!90284 (and ((_ is Cons!15941) (toList!4502 call!36259)) (bvsgt (_1!5086 (h!17070 (toList!4502 call!36259))) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!831593 (= e!463715 e!463711)))

(declare-fun b!831594 () Bool)

(assert (=> b!831594 (= e!463714 e!463715)))

(assert (=> b!831594 (= c!90283 (and ((_ is Cons!15941) (toList!4502 call!36259)) (= (_1!5086 (h!17070 (toList!4502 call!36259))) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!106165 c!90286) b!831591))

(assert (= (and d!106165 (not c!90286)) b!831594))

(assert (= (and b!831594 c!90283) b!831592))

(assert (= (and b!831594 (not c!90283)) b!831593))

(assert (= (and b!831593 c!90284) b!831590))

(assert (= (and b!831593 (not c!90284)) b!831589))

(assert (= (or b!831590 b!831589) bm!36347))

(assert (= (or b!831592 bm!36347) bm!36348))

(assert (= (or b!831591 bm!36348) bm!36346))

(assert (= (and bm!36346 c!90285) b!831586))

(assert (= (and bm!36346 (not c!90285)) b!831588))

(assert (= (and d!106165 res!565967) b!831585))

(assert (= (and b!831585 res!565966) b!831587))

(declare-fun m!775431 () Bool)

(assert (=> bm!36346 m!775431))

(declare-fun m!775433 () Bool)

(assert (=> b!831585 m!775433))

(declare-fun m!775435 () Bool)

(assert (=> b!831587 m!775435))

(declare-fun m!775437 () Bool)

(assert (=> d!106165 m!775437))

(declare-fun m!775439 () Bool)

(assert (=> d!106165 m!775439))

(declare-fun m!775441 () Bool)

(assert (=> b!831586 m!775441))

(assert (=> d!105397 d!106165))

(declare-fun d!106167 () Bool)

(assert (=> d!106167 (= (get!11818 (getValueByKey!415 (toList!4502 (+!1980 lt!376803 (tuple2!10151 lt!376792 zeroValueBefore!34))) lt!376787)) (v!10095 (getValueByKey!415 (toList!4502 (+!1980 lt!376803 (tuple2!10151 lt!376792 zeroValueBefore!34))) lt!376787)))))

(assert (=> d!105491 d!106167))

(declare-fun b!831596 () Bool)

(declare-fun e!463716 () Option!421)

(declare-fun e!463717 () Option!421)

(assert (=> b!831596 (= e!463716 e!463717)))

(declare-fun c!90288 () Bool)

(assert (=> b!831596 (= c!90288 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376803 (tuple2!10151 lt!376792 zeroValueBefore!34)))) (not (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376803 (tuple2!10151 lt!376792 zeroValueBefore!34))))) lt!376787))))))

(declare-fun b!831597 () Bool)

(assert (=> b!831597 (= e!463717 (getValueByKey!415 (t!22310 (toList!4502 (+!1980 lt!376803 (tuple2!10151 lt!376792 zeroValueBefore!34)))) lt!376787))))

(declare-fun b!831598 () Bool)

(assert (=> b!831598 (= e!463717 None!419)))

(declare-fun b!831595 () Bool)

(assert (=> b!831595 (= e!463716 (Some!420 (_2!5086 (h!17070 (toList!4502 (+!1980 lt!376803 (tuple2!10151 lt!376792 zeroValueBefore!34)))))))))

(declare-fun c!90287 () Bool)

(declare-fun d!106169 () Bool)

(assert (=> d!106169 (= c!90287 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376803 (tuple2!10151 lt!376792 zeroValueBefore!34)))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376803 (tuple2!10151 lt!376792 zeroValueBefore!34))))) lt!376787)))))

(assert (=> d!106169 (= (getValueByKey!415 (toList!4502 (+!1980 lt!376803 (tuple2!10151 lt!376792 zeroValueBefore!34))) lt!376787) e!463716)))

(assert (= (and d!106169 c!90287) b!831595))

(assert (= (and d!106169 (not c!90287)) b!831596))

(assert (= (and b!831596 c!90288) b!831597))

(assert (= (and b!831596 (not c!90288)) b!831598))

(declare-fun m!775443 () Bool)

(assert (=> b!831597 m!775443))

(assert (=> d!105491 d!106169))

(assert (=> d!105409 d!105407))

(declare-fun d!106171 () Bool)

(assert (=> d!106171 (= (getValueByKey!415 lt!376713 (_1!5086 lt!376677)) (Some!420 (_2!5086 lt!376677)))))

(assert (=> d!106171 true))

(declare-fun _$22!573 () Unit!28429)

(assert (=> d!106171 (= (choose!1418 lt!376713 (_1!5086 lt!376677) (_2!5086 lt!376677)) _$22!573)))

(declare-fun bs!23249 () Bool)

(assert (= bs!23249 d!106171))

(assert (=> bs!23249 m!773331))

(assert (=> d!105409 d!106171))

(declare-fun d!106173 () Bool)

(declare-fun res!565968 () Bool)

(declare-fun e!463718 () Bool)

(assert (=> d!106173 (=> res!565968 e!463718)))

(assert (=> d!106173 (= res!565968 (or ((_ is Nil!15942) lt!376713) ((_ is Nil!15942) (t!22310 lt!376713))))))

(assert (=> d!106173 (= (isStrictlySorted!441 lt!376713) e!463718)))

(declare-fun b!831599 () Bool)

(declare-fun e!463719 () Bool)

(assert (=> b!831599 (= e!463718 e!463719)))

(declare-fun res!565969 () Bool)

(assert (=> b!831599 (=> (not res!565969) (not e!463719))))

(assert (=> b!831599 (= res!565969 (bvslt (_1!5086 (h!17070 lt!376713)) (_1!5086 (h!17070 (t!22310 lt!376713)))))))

(declare-fun b!831600 () Bool)

(assert (=> b!831600 (= e!463719 (isStrictlySorted!441 (t!22310 lt!376713)))))

(assert (= (and d!106173 (not res!565968)) b!831599))

(assert (= (and b!831599 res!565969) b!831600))

(declare-fun m!775445 () Bool)

(assert (=> b!831600 m!775445))

(assert (=> d!105409 d!106173))

(assert (=> b!830734 d!106063))

(assert (=> b!830734 d!105587))

(declare-fun d!106175 () Bool)

(assert (=> d!106175 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376716) (_1!5086 lt!376677)))))

(declare-fun lt!377343 () Unit!28429)

(assert (=> d!106175 (= lt!377343 (choose!1421 (toList!4502 lt!376716) (_1!5086 lt!376677)))))

(declare-fun e!463720 () Bool)

(assert (=> d!106175 e!463720))

(declare-fun res!565970 () Bool)

(assert (=> d!106175 (=> (not res!565970) (not e!463720))))

(assert (=> d!106175 (= res!565970 (isStrictlySorted!441 (toList!4502 lt!376716)))))

(assert (=> d!106175 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376716) (_1!5086 lt!376677)) lt!377343)))

(declare-fun b!831601 () Bool)

(assert (=> b!831601 (= e!463720 (containsKey!401 (toList!4502 lt!376716) (_1!5086 lt!376677)))))

(assert (= (and d!106175 res!565970) b!831601))

(assert (=> d!106175 m!773337))

(assert (=> d!106175 m!773337))

(assert (=> d!106175 m!773689))

(declare-fun m!775447 () Bool)

(assert (=> d!106175 m!775447))

(declare-fun m!775449 () Bool)

(assert (=> d!106175 m!775449))

(assert (=> b!831601 m!773685))

(assert (=> b!830472 d!106175))

(assert (=> b!830472 d!105693))

(assert (=> b!830472 d!105585))

(declare-fun d!106177 () Bool)

(declare-fun res!565971 () Bool)

(declare-fun e!463721 () Bool)

(assert (=> d!106177 (=> res!565971 e!463721)))

(assert (=> d!106177 (= res!565971 (and ((_ is Cons!15941) lt!376941) (= (_1!5086 (h!17070 lt!376941)) (_1!5086 lt!376677))))))

(assert (=> d!106177 (= (containsKey!401 lt!376941 (_1!5086 lt!376677)) e!463721)))

(declare-fun b!831602 () Bool)

(declare-fun e!463722 () Bool)

(assert (=> b!831602 (= e!463721 e!463722)))

(declare-fun res!565972 () Bool)

(assert (=> b!831602 (=> (not res!565972) (not e!463722))))

(assert (=> b!831602 (= res!565972 (and (or (not ((_ is Cons!15941) lt!376941)) (bvsle (_1!5086 (h!17070 lt!376941)) (_1!5086 lt!376677))) ((_ is Cons!15941) lt!376941) (bvslt (_1!5086 (h!17070 lt!376941)) (_1!5086 lt!376677))))))

(declare-fun b!831603 () Bool)

(assert (=> b!831603 (= e!463722 (containsKey!401 (t!22310 lt!376941) (_1!5086 lt!376677)))))

(assert (= (and d!106177 (not res!565971)) b!831602))

(assert (= (and b!831602 res!565972) b!831603))

(declare-fun m!775451 () Bool)

(assert (=> b!831603 m!775451))

(assert (=> b!830537 d!106177))

(assert (=> b!830675 d!106025))

(assert (=> b!830675 d!105531))

(assert (=> d!105473 d!105475))

(assert (=> d!105473 d!105489))

(declare-fun d!106179 () Bool)

(assert (=> d!106179 (contains!4208 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34)) lt!376783)))

(assert (=> d!106179 true))

(declare-fun _$35!425 () Unit!28429)

(assert (=> d!106179 (= (choose!1420 lt!376802 lt!376788 zeroValueBefore!34 lt!376783) _$35!425)))

(declare-fun bs!23250 () Bool)

(assert (= bs!23250 d!106179))

(assert (=> bs!23250 m!773425))

(assert (=> bs!23250 m!773425))

(assert (=> bs!23250 m!773427))

(assert (=> d!105473 d!106179))

(declare-fun d!106181 () Bool)

(declare-fun e!463723 () Bool)

(assert (=> d!106181 e!463723))

(declare-fun res!565973 () Bool)

(assert (=> d!106181 (=> res!565973 e!463723)))

(declare-fun lt!377344 () Bool)

(assert (=> d!106181 (= res!565973 (not lt!377344))))

(declare-fun lt!377346 () Bool)

(assert (=> d!106181 (= lt!377344 lt!377346)))

(declare-fun lt!377345 () Unit!28429)

(declare-fun e!463724 () Unit!28429)

(assert (=> d!106181 (= lt!377345 e!463724)))

(declare-fun c!90289 () Bool)

(assert (=> d!106181 (= c!90289 lt!377346)))

(assert (=> d!106181 (= lt!377346 (containsKey!401 (toList!4502 lt!376802) lt!376783))))

(assert (=> d!106181 (= (contains!4208 lt!376802 lt!376783) lt!377344)))

(declare-fun b!831604 () Bool)

(declare-fun lt!377347 () Unit!28429)

(assert (=> b!831604 (= e!463724 lt!377347)))

(assert (=> b!831604 (= lt!377347 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376802) lt!376783))))

(assert (=> b!831604 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376802) lt!376783))))

(declare-fun b!831605 () Bool)

(declare-fun Unit!28484 () Unit!28429)

(assert (=> b!831605 (= e!463724 Unit!28484)))

(declare-fun b!831606 () Bool)

(assert (=> b!831606 (= e!463723 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376802) lt!376783)))))

(assert (= (and d!106181 c!90289) b!831604))

(assert (= (and d!106181 (not c!90289)) b!831605))

(assert (= (and d!106181 (not res!565973)) b!831606))

(declare-fun m!775453 () Bool)

(assert (=> d!106181 m!775453))

(declare-fun m!775455 () Bool)

(assert (=> b!831604 m!775455))

(declare-fun m!775457 () Bool)

(assert (=> b!831604 m!775457))

(assert (=> b!831604 m!775457))

(declare-fun m!775459 () Bool)

(assert (=> b!831604 m!775459))

(assert (=> b!831606 m!775457))

(assert (=> b!831606 m!775457))

(assert (=> b!831606 m!775459))

(assert (=> d!105473 d!106181))

(declare-fun d!106183 () Bool)

(declare-fun res!565974 () Bool)

(declare-fun e!463725 () Bool)

(assert (=> d!106183 (=> res!565974 e!463725)))

(assert (=> d!106183 (= res!565974 (= (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!376728))))

(assert (=> d!106183 (= (arrayContainsKey!0 _keys!976 lt!376728 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!463725)))

(declare-fun b!831607 () Bool)

(declare-fun e!463726 () Bool)

(assert (=> b!831607 (= e!463725 e!463726)))

(declare-fun res!565975 () Bool)

(assert (=> b!831607 (=> (not res!565975) (not e!463726))))

(assert (=> b!831607 (= res!565975 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(declare-fun b!831608 () Bool)

(assert (=> b!831608 (= e!463726 (arrayContainsKey!0 _keys!976 lt!376728 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!106183 (not res!565974)) b!831607))

(assert (= (and b!831607 res!565975) b!831608))

(assert (=> d!106183 m!773859))

(declare-fun m!775461 () Bool)

(assert (=> b!831608 m!775461))

(assert (=> b!830713 d!106183))

(declare-fun d!106185 () Bool)

(declare-fun res!565976 () Bool)

(declare-fun e!463727 () Bool)

(assert (=> d!106185 (=> res!565976 e!463727)))

(assert (=> d!106185 (= res!565976 (and ((_ is Cons!15941) lt!377018) (= (_1!5086 (h!17070 lt!377018)) (_1!5086 lt!376679))))))

(assert (=> d!106185 (= (containsKey!401 lt!377018 (_1!5086 lt!376679)) e!463727)))

(declare-fun b!831609 () Bool)

(declare-fun e!463728 () Bool)

(assert (=> b!831609 (= e!463727 e!463728)))

(declare-fun res!565977 () Bool)

(assert (=> b!831609 (=> (not res!565977) (not e!463728))))

(assert (=> b!831609 (= res!565977 (and (or (not ((_ is Cons!15941) lt!377018)) (bvsle (_1!5086 (h!17070 lt!377018)) (_1!5086 lt!376679))) ((_ is Cons!15941) lt!377018) (bvslt (_1!5086 (h!17070 lt!377018)) (_1!5086 lt!376679))))))

(declare-fun b!831610 () Bool)

(assert (=> b!831610 (= e!463728 (containsKey!401 (t!22310 lt!377018) (_1!5086 lt!376679)))))

(assert (= (and d!106185 (not res!565976)) b!831609))

(assert (= (and b!831609 res!565977) b!831610))

(declare-fun m!775463 () Bool)

(assert (=> b!831610 m!775463))

(assert (=> b!830622 d!106185))

(declare-fun d!106187 () Bool)

(declare-fun c!90290 () Bool)

(assert (=> d!106187 (= c!90290 ((_ is Nil!15942) (toList!4502 lt!376829)))))

(declare-fun e!463729 () (InoxSet tuple2!10150))

(assert (=> d!106187 (= (content!386 (toList!4502 lt!376829)) e!463729)))

(declare-fun b!831611 () Bool)

(assert (=> b!831611 (= e!463729 ((as const (Array tuple2!10150 Bool)) false))))

(declare-fun b!831612 () Bool)

(assert (=> b!831612 (= e!463729 ((_ map or) (store ((as const (Array tuple2!10150 Bool)) false) (h!17070 (toList!4502 lt!376829)) true) (content!386 (t!22310 (toList!4502 lt!376829)))))))

(assert (= (and d!106187 c!90290) b!831611))

(assert (= (and d!106187 (not c!90290)) b!831612))

(declare-fun m!775465 () Bool)

(assert (=> b!831612 m!775465))

(declare-fun m!775467 () Bool)

(assert (=> b!831612 m!775467))

(assert (=> d!105371 d!106187))

(declare-fun lt!377348 () Bool)

(declare-fun d!106189 () Bool)

(assert (=> d!106189 (= lt!377348 (select (content!386 (toList!4502 lt!376990)) (tuple2!10151 lt!376791 minValue!754)))))

(declare-fun e!463731 () Bool)

(assert (=> d!106189 (= lt!377348 e!463731)))

(declare-fun res!565978 () Bool)

(assert (=> d!106189 (=> (not res!565978) (not e!463731))))

(assert (=> d!106189 (= res!565978 ((_ is Cons!15941) (toList!4502 lt!376990)))))

(assert (=> d!106189 (= (contains!4209 (toList!4502 lt!376990) (tuple2!10151 lt!376791 minValue!754)) lt!377348)))

(declare-fun b!831613 () Bool)

(declare-fun e!463730 () Bool)

(assert (=> b!831613 (= e!463731 e!463730)))

(declare-fun res!565979 () Bool)

(assert (=> b!831613 (=> res!565979 e!463730)))

(assert (=> b!831613 (= res!565979 (= (h!17070 (toList!4502 lt!376990)) (tuple2!10151 lt!376791 minValue!754)))))

(declare-fun b!831614 () Bool)

(assert (=> b!831614 (= e!463730 (contains!4209 (t!22310 (toList!4502 lt!376990)) (tuple2!10151 lt!376791 minValue!754)))))

(assert (= (and d!106189 res!565978) b!831613))

(assert (= (and b!831613 (not res!565979)) b!831614))

(declare-fun m!775469 () Bool)

(assert (=> d!106189 m!775469))

(declare-fun m!775471 () Bool)

(assert (=> d!106189 m!775471))

(declare-fun m!775473 () Bool)

(assert (=> b!831614 m!775473))

(assert (=> b!830596 d!106189))

(declare-fun d!106191 () Bool)

(declare-fun res!565980 () Bool)

(declare-fun e!463732 () Bool)

(assert (=> d!106191 (=> res!565980 e!463732)))

(assert (=> d!106191 (= res!565980 (and ((_ is Cons!15941) (toList!4502 lt!376795)) (= (_1!5086 (h!17070 (toList!4502 lt!376795))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106191 (= (containsKey!401 (toList!4502 lt!376795) #b1000000000000000000000000000000000000000000000000000000000000000) e!463732)))

(declare-fun b!831615 () Bool)

(declare-fun e!463733 () Bool)

(assert (=> b!831615 (= e!463732 e!463733)))

(declare-fun res!565981 () Bool)

(assert (=> b!831615 (=> (not res!565981) (not e!463733))))

(assert (=> b!831615 (= res!565981 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376795))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376795))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15941) (toList!4502 lt!376795)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376795))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831616 () Bool)

(assert (=> b!831616 (= e!463733 (containsKey!401 (t!22310 (toList!4502 lt!376795)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106191 (not res!565980)) b!831615))

(assert (= (and b!831615 res!565981) b!831616))

(declare-fun m!775475 () Bool)

(assert (=> b!831616 m!775475))

(assert (=> d!105415 d!106191))

(declare-fun d!106193 () Bool)

(assert (=> d!106193 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376856) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377349 () Unit!28429)

(assert (=> d!106193 (= lt!377349 (choose!1421 (toList!4502 lt!376856) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!463734 () Bool)

(assert (=> d!106193 e!463734))

(declare-fun res!565982 () Bool)

(assert (=> d!106193 (=> (not res!565982) (not e!463734))))

(assert (=> d!106193 (= res!565982 (isStrictlySorted!441 (toList!4502 lt!376856)))))

(assert (=> d!106193 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376856) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) lt!377349)))

(declare-fun b!831617 () Bool)

(assert (=> b!831617 (= e!463734 (containsKey!401 (toList!4502 lt!376856) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106193 res!565982) b!831617))

(assert (=> d!106193 m!773353))

(assert (=> d!106193 m!774099))

(assert (=> d!106193 m!774099))

(assert (=> d!106193 m!774101))

(assert (=> d!106193 m!773353))

(declare-fun m!775477 () Bool)

(assert (=> d!106193 m!775477))

(assert (=> d!106193 m!774839))

(assert (=> b!831617 m!773353))

(assert (=> b!831617 m!774095))

(assert (=> b!830661 d!106193))

(assert (=> b!830661 d!105759))

(assert (=> b!830661 d!105677))

(declare-fun d!106195 () Bool)

(assert (=> d!106195 (= (content!387 Nil!15941) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!105461 d!106195))

(declare-fun d!106197 () Bool)

(declare-fun res!565983 () Bool)

(declare-fun e!463735 () Bool)

(assert (=> d!106197 (=> res!565983 e!463735)))

(assert (=> d!106197 (= res!565983 (and ((_ is Cons!15941) (toList!4502 lt!376817)) (= (_1!5086 (h!17070 (toList!4502 lt!376817))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106197 (= (containsKey!401 (toList!4502 lt!376817) #b1000000000000000000000000000000000000000000000000000000000000000) e!463735)))

(declare-fun b!831618 () Bool)

(declare-fun e!463736 () Bool)

(assert (=> b!831618 (= e!463735 e!463736)))

(declare-fun res!565984 () Bool)

(assert (=> b!831618 (=> (not res!565984) (not e!463736))))

(assert (=> b!831618 (= res!565984 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376817))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376817))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15941) (toList!4502 lt!376817)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376817))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831619 () Bool)

(assert (=> b!831619 (= e!463736 (containsKey!401 (t!22310 (toList!4502 lt!376817)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106197 (not res!565983)) b!831618))

(assert (= (and b!831618 res!565984) b!831619))

(declare-fun m!775479 () Bool)

(assert (=> b!831619 m!775479))

(assert (=> d!105553 d!106197))

(declare-fun d!106199 () Bool)

(assert (=> d!106199 (= (get!11818 (getValueByKey!415 (toList!4502 lt!376816) lt!376818)) (v!10095 (getValueByKey!415 (toList!4502 lt!376816) lt!376818)))))

(assert (=> d!105431 d!106199))

(declare-fun b!831621 () Bool)

(declare-fun e!463737 () Option!421)

(declare-fun e!463738 () Option!421)

(assert (=> b!831621 (= e!463737 e!463738)))

(declare-fun c!90292 () Bool)

(assert (=> b!831621 (= c!90292 (and ((_ is Cons!15941) (toList!4502 lt!376816)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376816))) lt!376818))))))

(declare-fun b!831622 () Bool)

(assert (=> b!831622 (= e!463738 (getValueByKey!415 (t!22310 (toList!4502 lt!376816)) lt!376818))))

(declare-fun b!831623 () Bool)

(assert (=> b!831623 (= e!463738 None!419)))

(declare-fun b!831620 () Bool)

(assert (=> b!831620 (= e!463737 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376816)))))))

(declare-fun d!106201 () Bool)

(declare-fun c!90291 () Bool)

(assert (=> d!106201 (= c!90291 (and ((_ is Cons!15941) (toList!4502 lt!376816)) (= (_1!5086 (h!17070 (toList!4502 lt!376816))) lt!376818)))))

(assert (=> d!106201 (= (getValueByKey!415 (toList!4502 lt!376816) lt!376818) e!463737)))

(assert (= (and d!106201 c!90291) b!831620))

(assert (= (and d!106201 (not c!90291)) b!831621))

(assert (= (and b!831621 c!90292) b!831622))

(assert (= (and b!831621 (not c!90292)) b!831623))

(declare-fun m!775481 () Bool)

(assert (=> b!831622 m!775481))

(assert (=> d!105431 d!106201))

(declare-fun d!106203 () Bool)

(declare-fun res!565985 () Bool)

(declare-fun e!463739 () Bool)

(assert (=> d!106203 (=> res!565985 e!463739)))

(assert (=> d!106203 (= res!565985 (and ((_ is Cons!15941) (toList!4502 lt!376856)) (= (_1!5086 (h!17070 (toList!4502 lt!376856))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106203 (= (containsKey!401 (toList!4502 lt!376856) #b1000000000000000000000000000000000000000000000000000000000000000) e!463739)))

(declare-fun b!831624 () Bool)

(declare-fun e!463740 () Bool)

(assert (=> b!831624 (= e!463739 e!463740)))

(declare-fun res!565986 () Bool)

(assert (=> b!831624 (=> (not res!565986) (not e!463740))))

(assert (=> b!831624 (= res!565986 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376856))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376856))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15941) (toList!4502 lt!376856)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376856))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831625 () Bool)

(assert (=> b!831625 (= e!463740 (containsKey!401 (t!22310 (toList!4502 lt!376856)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106203 (not res!565985)) b!831624))

(assert (= (and b!831624 res!565986) b!831625))

(declare-fun m!775483 () Bool)

(assert (=> b!831625 m!775483))

(assert (=> d!105519 d!106203))

(declare-fun d!106205 () Bool)

(assert (=> d!106205 (= (apply!372 lt!376982 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11818 (getValueByKey!415 (toList!4502 lt!376982) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun bs!23251 () Bool)

(assert (= bs!23251 d!106205))

(assert (=> bs!23251 m!773859))

(assert (=> bs!23251 m!775275))

(assert (=> bs!23251 m!775275))

(declare-fun m!775485 () Bool)

(assert (=> bs!23251 m!775485))

(assert (=> b!830577 d!106205))

(assert (=> b!830577 d!105705))

(declare-fun b!831627 () Bool)

(declare-fun e!463741 () Option!421)

(declare-fun e!463742 () Option!421)

(assert (=> b!831627 (= e!463741 e!463742)))

(declare-fun c!90294 () Bool)

(assert (=> b!831627 (= c!90294 (and ((_ is Cons!15941) (toList!4502 lt!377003)) (not (= (_1!5086 (h!17070 (toList!4502 lt!377003))) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))))

(declare-fun b!831628 () Bool)

(assert (=> b!831628 (= e!463742 (getValueByKey!415 (t!22310 (toList!4502 lt!377003)) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))

(declare-fun b!831629 () Bool)

(assert (=> b!831629 (= e!463742 None!419)))

(declare-fun b!831626 () Bool)

(assert (=> b!831626 (= e!463741 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!377003)))))))

(declare-fun d!106207 () Bool)

(declare-fun c!90293 () Bool)

(assert (=> d!106207 (= c!90293 (and ((_ is Cons!15941) (toList!4502 lt!377003)) (= (_1!5086 (h!17070 (toList!4502 lt!377003))) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)))))))

(assert (=> d!106207 (= (getValueByKey!415 (toList!4502 lt!377003) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))) e!463741)))

(assert (= (and d!106207 c!90293) b!831626))

(assert (= (and d!106207 (not c!90293)) b!831627))

(assert (= (and b!831627 c!90294) b!831628))

(assert (= (and b!831627 (not c!90294)) b!831629))

(declare-fun m!775487 () Bool)

(assert (=> b!831628 m!775487))

(assert (=> b!830602 d!106207))

(declare-fun d!106209 () Bool)

(declare-fun res!565987 () Bool)

(declare-fun e!463743 () Bool)

(assert (=> d!106209 (=> res!565987 e!463743)))

(assert (=> d!106209 (= res!565987 (and ((_ is Cons!15941) lt!376717) (= (_1!5086 (h!17070 lt!376717)) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106209 (= (containsKey!401 lt!376717 (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463743)))

(declare-fun b!831630 () Bool)

(declare-fun e!463744 () Bool)

(assert (=> b!831630 (= e!463743 e!463744)))

(declare-fun res!565988 () Bool)

(assert (=> b!831630 (=> (not res!565988) (not e!463744))))

(assert (=> b!831630 (= res!565988 (and (or (not ((_ is Cons!15941) lt!376717)) (bvsle (_1!5086 (h!17070 lt!376717)) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15941) lt!376717) (bvslt (_1!5086 (h!17070 lt!376717)) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831631 () Bool)

(assert (=> b!831631 (= e!463744 (containsKey!401 (t!22310 lt!376717) (_1!5086 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106209 (not res!565987)) b!831630))

(assert (= (and b!831630 res!565988) b!831631))

(declare-fun m!775489 () Bool)

(assert (=> b!831631 m!775489))

(assert (=> b!830739 d!106209))

(declare-fun b!831633 () Bool)

(declare-fun e!463745 () Option!421)

(declare-fun e!463746 () Option!421)

(assert (=> b!831633 (= e!463745 e!463746)))

(declare-fun c!90296 () Bool)

(assert (=> b!831633 (= c!90296 (and ((_ is Cons!15941) (toList!4502 lt!376909)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376909))) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!831634 () Bool)

(assert (=> b!831634 (= e!463746 (getValueByKey!415 (t!22310 (toList!4502 lt!376909)) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!831635 () Bool)

(assert (=> b!831635 (= e!463746 None!419)))

(declare-fun b!831632 () Bool)

(assert (=> b!831632 (= e!463745 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376909)))))))

(declare-fun c!90295 () Bool)

(declare-fun d!106211 () Bool)

(assert (=> d!106211 (= c!90295 (and ((_ is Cons!15941) (toList!4502 lt!376909)) (= (_1!5086 (h!17070 (toList!4502 lt!376909))) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!106211 (= (getValueByKey!415 (toList!4502 lt!376909) (_1!5086 (tuple2!10151 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22329 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!463745)))

(assert (= (and d!106211 c!90295) b!831632))

(assert (= (and d!106211 (not c!90295)) b!831633))

(assert (= (and b!831633 c!90296) b!831634))

(assert (= (and b!831633 (not c!90296)) b!831635))

(declare-fun m!775491 () Bool)

(assert (=> b!831634 m!775491))

(assert (=> b!830461 d!106211))

(declare-fun d!106213 () Bool)

(declare-fun lt!377350 () Bool)

(assert (=> d!106213 (= lt!377350 (select (content!386 (t!22310 (toList!4502 lt!376737))) lt!376679))))

(declare-fun e!463748 () Bool)

(assert (=> d!106213 (= lt!377350 e!463748)))

(declare-fun res!565989 () Bool)

(assert (=> d!106213 (=> (not res!565989) (not e!463748))))

(assert (=> d!106213 (= res!565989 ((_ is Cons!15941) (t!22310 (toList!4502 lt!376737))))))

(assert (=> d!106213 (= (contains!4209 (t!22310 (toList!4502 lt!376737)) lt!376679) lt!377350)))

(declare-fun b!831636 () Bool)

(declare-fun e!463747 () Bool)

(assert (=> b!831636 (= e!463748 e!463747)))

(declare-fun res!565990 () Bool)

(assert (=> b!831636 (=> res!565990 e!463747)))

(assert (=> b!831636 (= res!565990 (= (h!17070 (t!22310 (toList!4502 lt!376737))) lt!376679))))

(declare-fun b!831637 () Bool)

(assert (=> b!831637 (= e!463747 (contains!4209 (t!22310 (t!22310 (toList!4502 lt!376737))) lt!376679))))

(assert (= (and d!106213 res!565989) b!831636))

(assert (= (and b!831636 (not res!565990)) b!831637))

(assert (=> d!106213 m!774651))

(declare-fun m!775493 () Bool)

(assert (=> d!106213 m!775493))

(declare-fun m!775495 () Bool)

(assert (=> b!831637 m!775495))

(assert (=> b!830524 d!106213))

(declare-fun d!106215 () Bool)

(declare-fun res!565991 () Bool)

(declare-fun e!463749 () Bool)

(assert (=> d!106215 (=> res!565991 e!463749)))

(assert (=> d!106215 (= res!565991 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859)))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))))) lt!376860)))))

(assert (=> d!106215 (= (containsKey!401 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))) lt!376860) e!463749)))

(declare-fun b!831638 () Bool)

(declare-fun e!463750 () Bool)

(assert (=> b!831638 (= e!463749 e!463750)))

(declare-fun res!565992 () Bool)

(assert (=> b!831638 (=> (not res!565992) (not e!463750))))

(assert (=> b!831638 (= res!565992 (and (or (not ((_ is Cons!15941) (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))))) (bvsle (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))))) lt!376860)) ((_ is Cons!15941) (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859)))) (bvslt (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859))))) lt!376860)))))

(declare-fun b!831639 () Bool)

(assert (=> b!831639 (= e!463750 (containsKey!401 (t!22310 (toList!4502 (+!1980 lt!376862 (tuple2!10151 lt!376861 lt!376859)))) lt!376860))))

(assert (= (and d!106215 (not res!565991)) b!831638))

(assert (= (and b!831638 res!565992) b!831639))

(declare-fun m!775497 () Bool)

(assert (=> b!831639 m!775497))

(assert (=> d!105577 d!106215))

(declare-fun d!106217 () Bool)

(declare-fun e!463751 () Bool)

(assert (=> d!106217 e!463751))

(declare-fun res!565993 () Bool)

(assert (=> d!106217 (=> res!565993 e!463751)))

(declare-fun lt!377351 () Bool)

(assert (=> d!106217 (= res!565993 (not lt!377351))))

(declare-fun lt!377353 () Bool)

(assert (=> d!106217 (= lt!377351 lt!377353)))

(declare-fun lt!377352 () Unit!28429)

(declare-fun e!463752 () Unit!28429)

(assert (=> d!106217 (= lt!377352 e!463752)))

(declare-fun c!90297 () Bool)

(assert (=> d!106217 (= c!90297 lt!377353)))

(assert (=> d!106217 (= lt!377353 (containsKey!401 (toList!4502 lt!377003) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))

(assert (=> d!106217 (= (contains!4208 lt!377003 (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))) lt!377351)))

(declare-fun b!831640 () Bool)

(declare-fun lt!377354 () Unit!28429)

(assert (=> b!831640 (= e!463752 lt!377354)))

(assert (=> b!831640 (= lt!377354 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!377003) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))

(assert (=> b!831640 (isDefined!311 (getValueByKey!415 (toList!4502 lt!377003) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))

(declare-fun b!831641 () Bool)

(declare-fun Unit!28485 () Unit!28429)

(assert (=> b!831641 (= e!463752 Unit!28485)))

(declare-fun b!831642 () Bool)

(assert (=> b!831642 (= e!463751 (isDefined!311 (getValueByKey!415 (toList!4502 lt!377003) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)))))))

(assert (= (and d!106217 c!90297) b!831640))

(assert (= (and d!106217 (not c!90297)) b!831641))

(assert (= (and d!106217 (not res!565993)) b!831642))

(declare-fun m!775499 () Bool)

(assert (=> d!106217 m!775499))

(declare-fun m!775501 () Bool)

(assert (=> b!831640 m!775501))

(assert (=> b!831640 m!773971))

(assert (=> b!831640 m!773971))

(declare-fun m!775503 () Bool)

(assert (=> b!831640 m!775503))

(assert (=> b!831642 m!773971))

(assert (=> b!831642 m!773971))

(assert (=> b!831642 m!775503))

(assert (=> d!105481 d!106217))

(declare-fun b!831644 () Bool)

(declare-fun e!463753 () Option!421)

(declare-fun e!463754 () Option!421)

(assert (=> b!831644 (= e!463753 e!463754)))

(declare-fun c!90299 () Bool)

(assert (=> b!831644 (= c!90299 (and ((_ is Cons!15941) lt!377000) (not (= (_1!5086 (h!17070 lt!377000)) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))))

(declare-fun b!831645 () Bool)

(assert (=> b!831645 (= e!463754 (getValueByKey!415 (t!22310 lt!377000) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))

(declare-fun b!831646 () Bool)

(assert (=> b!831646 (= e!463754 None!419)))

(declare-fun b!831643 () Bool)

(assert (=> b!831643 (= e!463753 (Some!420 (_2!5086 (h!17070 lt!377000))))))

(declare-fun d!106219 () Bool)

(declare-fun c!90298 () Bool)

(assert (=> d!106219 (= c!90298 (and ((_ is Cons!15941) lt!377000) (= (_1!5086 (h!17070 lt!377000)) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)))))))

(assert (=> d!106219 (= (getValueByKey!415 lt!377000 (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))) e!463753)))

(assert (= (and d!106219 c!90298) b!831643))

(assert (= (and d!106219 (not c!90298)) b!831644))

(assert (= (and b!831644 c!90299) b!831645))

(assert (= (and b!831644 (not c!90299)) b!831646))

(declare-fun m!775505 () Bool)

(assert (=> b!831645 m!775505))

(assert (=> d!105481 d!106219))

(declare-fun d!106221 () Bool)

(assert (=> d!106221 (= (getValueByKey!415 lt!377000 (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))) (Some!420 (_2!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))

(declare-fun lt!377355 () Unit!28429)

(assert (=> d!106221 (= lt!377355 (choose!1418 lt!377000 (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))

(declare-fun e!463755 () Bool)

(assert (=> d!106221 e!463755))

(declare-fun res!565994 () Bool)

(assert (=> d!106221 (=> (not res!565994) (not e!463755))))

(assert (=> d!106221 (= res!565994 (isStrictlySorted!441 lt!377000))))

(assert (=> d!106221 (= (lemmaContainsTupThenGetReturnValue!229 lt!377000 (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))) lt!377355)))

(declare-fun b!831647 () Bool)

(declare-fun res!565995 () Bool)

(assert (=> b!831647 (=> (not res!565995) (not e!463755))))

(assert (=> b!831647 (= res!565995 (containsKey!401 lt!377000 (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))

(declare-fun b!831648 () Bool)

(assert (=> b!831648 (= e!463755 (contains!4209 lt!377000 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)))))))

(assert (= (and d!106221 res!565994) b!831647))

(assert (= (and b!831647 res!565995) b!831648))

(assert (=> d!106221 m!773965))

(declare-fun m!775507 () Bool)

(assert (=> d!106221 m!775507))

(declare-fun m!775509 () Bool)

(assert (=> d!106221 m!775509))

(declare-fun m!775511 () Bool)

(assert (=> b!831647 m!775511))

(declare-fun m!775513 () Bool)

(assert (=> b!831648 m!775513))

(assert (=> d!105481 d!106221))

(declare-fun d!106223 () Bool)

(declare-fun e!463758 () Bool)

(assert (=> d!106223 e!463758))

(declare-fun res!565997 () Bool)

(assert (=> d!106223 (=> (not res!565997) (not e!463758))))

(declare-fun lt!377356 () List!15945)

(assert (=> d!106223 (= res!565997 (isStrictlySorted!441 lt!377356))))

(declare-fun e!463759 () List!15945)

(assert (=> d!106223 (= lt!377356 e!463759)))

(declare-fun c!90303 () Bool)

(assert (=> d!106223 (= c!90303 (and ((_ is Cons!15941) (toList!4502 lt!376803)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376803))) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)))))))

(assert (=> d!106223 (isStrictlySorted!441 (toList!4502 lt!376803))))

(assert (=> d!106223 (= (insertStrictlySorted!268 (toList!4502 lt!376803) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))) lt!377356)))

(declare-fun b!831649 () Bool)

(declare-fun res!565996 () Bool)

(assert (=> b!831649 (=> (not res!565996) (not e!463758))))

(assert (=> b!831649 (= res!565996 (containsKey!401 lt!377356 (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))

(declare-fun b!831650 () Bool)

(declare-fun e!463757 () List!15945)

(assert (=> b!831650 (= e!463757 (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376803)) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))

(declare-fun bm!36349 () Bool)

(declare-fun call!36354 () List!15945)

(assert (=> bm!36349 (= call!36354 ($colon$colon!536 e!463757 (ite c!90303 (h!17070 (toList!4502 lt!376803)) (tuple2!10151 (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376792 zeroValueBefore!34))))))))

(declare-fun c!90302 () Bool)

(assert (=> bm!36349 (= c!90302 c!90303)))

(declare-fun b!831651 () Bool)

(assert (=> b!831651 (= e!463758 (contains!4209 lt!377356 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)) (_2!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)))))))

(declare-fun c!90300 () Bool)

(declare-fun b!831652 () Bool)

(declare-fun c!90301 () Bool)

(assert (=> b!831652 (= e!463757 (ite c!90300 (t!22310 (toList!4502 lt!376803)) (ite c!90301 (Cons!15941 (h!17070 (toList!4502 lt!376803)) (t!22310 (toList!4502 lt!376803))) Nil!15942)))))

(declare-fun b!831653 () Bool)

(declare-fun e!463756 () List!15945)

(declare-fun call!36353 () List!15945)

(assert (=> b!831653 (= e!463756 call!36353)))

(declare-fun bm!36350 () Bool)

(declare-fun call!36352 () List!15945)

(assert (=> bm!36350 (= call!36353 call!36352)))

(declare-fun bm!36351 () Bool)

(assert (=> bm!36351 (= call!36352 call!36354)))

(declare-fun b!831654 () Bool)

(assert (=> b!831654 (= e!463756 call!36353)))

(declare-fun b!831655 () Bool)

(assert (=> b!831655 (= e!463759 call!36354)))

(declare-fun b!831656 () Bool)

(declare-fun e!463760 () List!15945)

(assert (=> b!831656 (= e!463760 call!36352)))

(declare-fun b!831657 () Bool)

(assert (=> b!831657 (= c!90301 (and ((_ is Cons!15941) (toList!4502 lt!376803)) (bvsgt (_1!5086 (h!17070 (toList!4502 lt!376803))) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)))))))

(assert (=> b!831657 (= e!463760 e!463756)))

(declare-fun b!831658 () Bool)

(assert (=> b!831658 (= e!463759 e!463760)))

(assert (=> b!831658 (= c!90300 (and ((_ is Cons!15941) (toList!4502 lt!376803)) (= (_1!5086 (h!17070 (toList!4502 lt!376803))) (_1!5086 (tuple2!10151 lt!376792 zeroValueBefore!34)))))))

(assert (= (and d!106223 c!90303) b!831655))

(assert (= (and d!106223 (not c!90303)) b!831658))

(assert (= (and b!831658 c!90300) b!831656))

(assert (= (and b!831658 (not c!90300)) b!831657))

(assert (= (and b!831657 c!90301) b!831654))

(assert (= (and b!831657 (not c!90301)) b!831653))

(assert (= (or b!831654 b!831653) bm!36350))

(assert (= (or b!831656 bm!36350) bm!36351))

(assert (= (or b!831655 bm!36351) bm!36349))

(assert (= (and bm!36349 c!90302) b!831650))

(assert (= (and bm!36349 (not c!90302)) b!831652))

(assert (= (and d!106223 res!565997) b!831649))

(assert (= (and b!831649 res!565996) b!831651))

(declare-fun m!775515 () Bool)

(assert (=> bm!36349 m!775515))

(declare-fun m!775517 () Bool)

(assert (=> b!831649 m!775517))

(declare-fun m!775519 () Bool)

(assert (=> b!831651 m!775519))

(declare-fun m!775521 () Bool)

(assert (=> d!106223 m!775521))

(declare-fun m!775523 () Bool)

(assert (=> d!106223 m!775523))

(declare-fun m!775525 () Bool)

(assert (=> b!831650 m!775525))

(assert (=> d!105481 d!106223))

(declare-fun d!106225 () Bool)

(assert (=> d!106225 (isDefined!311 (getValueByKey!415 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))) lt!376783))))

(declare-fun lt!377357 () Unit!28429)

(assert (=> d!106225 (= lt!377357 (choose!1421 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))) lt!376783))))

(declare-fun e!463761 () Bool)

(assert (=> d!106225 e!463761))

(declare-fun res!565998 () Bool)

(assert (=> d!106225 (=> (not res!565998) (not e!463761))))

(assert (=> d!106225 (= res!565998 (isStrictlySorted!441 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34)))))))

(assert (=> d!106225 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))) lt!376783) lt!377357)))

(declare-fun b!831659 () Bool)

(assert (=> b!831659 (= e!463761 (containsKey!401 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))) lt!376783))))

(assert (= (and d!106225 res!565998) b!831659))

(assert (=> d!106225 m!773943))

(assert (=> d!106225 m!773943))

(assert (=> d!106225 m!773945))

(declare-fun m!775527 () Bool)

(assert (=> d!106225 m!775527))

(declare-fun m!775529 () Bool)

(assert (=> d!106225 m!775529))

(assert (=> b!831659 m!773939))

(assert (=> b!830597 d!106225))

(assert (=> b!830597 d!105729))

(assert (=> b!830597 d!105731))

(declare-fun b!831661 () Bool)

(declare-fun e!463762 () Option!421)

(declare-fun e!463763 () Option!421)

(assert (=> b!831661 (= e!463762 e!463763)))

(declare-fun c!90305 () Bool)

(assert (=> b!831661 (= c!90305 (and ((_ is Cons!15941) (toList!4502 lt!376966)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376966))) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))))

(declare-fun b!831662 () Bool)

(assert (=> b!831662 (= e!463763 (getValueByKey!415 (t!22310 (toList!4502 lt!376966)) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))))))

(declare-fun b!831663 () Bool)

(assert (=> b!831663 (= e!463763 None!419)))

(declare-fun b!831660 () Bool)

(assert (=> b!831660 (= e!463762 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376966)))))))

(declare-fun c!90304 () Bool)

(declare-fun d!106227 () Bool)

(assert (=> d!106227 (= c!90304 (and ((_ is Cons!15941) (toList!4502 lt!376966)) (= (_1!5086 (h!17070 (toList!4502 lt!376966))) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34)))))))

(assert (=> d!106227 (= (getValueByKey!415 (toList!4502 lt!376966) (_1!5086 (tuple2!10151 lt!376814 zeroValueAfter!34))) e!463762)))

(assert (= (and d!106227 c!90304) b!831660))

(assert (= (and d!106227 (not c!90304)) b!831661))

(assert (= (and b!831661 c!90305) b!831662))

(assert (= (and b!831661 (not c!90305)) b!831663))

(declare-fun m!775531 () Bool)

(assert (=> b!831662 m!775531))

(assert (=> b!830562 d!106227))

(assert (=> b!830760 d!105619))

(assert (=> b!830558 d!106087))

(assert (=> b!830558 d!106089))

(assert (=> b!830585 d!106129))

(declare-fun d!106229 () Bool)

(assert (=> d!106229 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376863) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377358 () Unit!28429)

(assert (=> d!106229 (= lt!377358 (choose!1421 (toList!4502 lt!376863) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!463764 () Bool)

(assert (=> d!106229 e!463764))

(declare-fun res!565999 () Bool)

(assert (=> d!106229 (=> (not res!565999) (not e!463764))))

(assert (=> d!106229 (= res!565999 (isStrictlySorted!441 (toList!4502 lt!376863)))))

(assert (=> d!106229 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376863) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) lt!377358)))

(declare-fun b!831664 () Bool)

(assert (=> b!831664 (= e!463764 (containsKey!401 (toList!4502 lt!376863) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106229 res!565999) b!831664))

(assert (=> d!106229 m!773353))

(assert (=> d!106229 m!773613))

(assert (=> d!106229 m!773613))

(assert (=> d!106229 m!773615))

(assert (=> d!106229 m!773353))

(declare-fun m!775533 () Bool)

(assert (=> d!106229 m!775533))

(assert (=> d!106229 m!774461))

(assert (=> b!831664 m!773353))

(assert (=> b!831664 m!773609))

(assert (=> b!830445 d!106229))

(assert (=> b!830445 d!105753))

(assert (=> b!830445 d!105755))

(declare-fun d!106231 () Bool)

(declare-fun res!566000 () Bool)

(declare-fun e!463765 () Bool)

(assert (=> d!106231 (=> res!566000 e!463765)))

(assert (=> d!106231 (= res!566000 (or ((_ is Nil!15942) lt!376930) ((_ is Nil!15942) (t!22310 lt!376930))))))

(assert (=> d!106231 (= (isStrictlySorted!441 lt!376930) e!463765)))

(declare-fun b!831665 () Bool)

(declare-fun e!463766 () Bool)

(assert (=> b!831665 (= e!463765 e!463766)))

(declare-fun res!566001 () Bool)

(assert (=> b!831665 (=> (not res!566001) (not e!463766))))

(assert (=> b!831665 (= res!566001 (bvslt (_1!5086 (h!17070 lt!376930)) (_1!5086 (h!17070 (t!22310 lt!376930)))))))

(declare-fun b!831666 () Bool)

(assert (=> b!831666 (= e!463766 (isStrictlySorted!441 (t!22310 lt!376930)))))

(assert (= (and d!106231 (not res!566000)) b!831665))

(assert (= (and b!831665 res!566001) b!831666))

(declare-fun m!775535 () Bool)

(assert (=> b!831666 m!775535))

(assert (=> d!105411 d!106231))

(declare-fun d!106233 () Bool)

(declare-fun res!566002 () Bool)

(declare-fun e!463767 () Bool)

(assert (=> d!106233 (=> res!566002 e!463767)))

(assert (=> d!106233 (= res!566002 (or ((_ is Nil!15942) (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Nil!15942) (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))))

(assert (=> d!106233 (= (isStrictlySorted!441 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) e!463767)))

(declare-fun b!831667 () Bool)

(declare-fun e!463768 () Bool)

(assert (=> b!831667 (= e!463767 e!463768)))

(declare-fun res!566003 () Bool)

(assert (=> b!831667 (=> (not res!566003) (not e!463768))))

(assert (=> b!831667 (= res!566003 (bvslt (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5086 (h!17070 (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))))

(declare-fun b!831668 () Bool)

(assert (=> b!831668 (= e!463768 (isStrictlySorted!441 (t!22310 (toList!4502 (+!1980 lt!376681 (tuple2!10151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(assert (= (and d!106233 (not res!566002)) b!831667))

(assert (= (and b!831667 res!566003) b!831668))

(assert (=> b!831668 m!774645))

(assert (=> d!105411 d!106233))

(declare-fun d!106235 () Bool)

(declare-fun res!566004 () Bool)

(declare-fun e!463769 () Bool)

(assert (=> d!106235 (=> res!566004 e!463769)))

(assert (=> d!106235 (= res!566004 (and ((_ is Cons!15941) (toList!4502 lt!376716)) (= (_1!5086 (h!17070 (toList!4502 lt!376716))) (_1!5086 lt!376677))))))

(assert (=> d!106235 (= (containsKey!401 (toList!4502 lt!376716) (_1!5086 lt!376677)) e!463769)))

(declare-fun b!831669 () Bool)

(declare-fun e!463770 () Bool)

(assert (=> b!831669 (= e!463769 e!463770)))

(declare-fun res!566005 () Bool)

(assert (=> b!831669 (=> (not res!566005) (not e!463770))))

(assert (=> b!831669 (= res!566005 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376716))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376716))) (_1!5086 lt!376677))) ((_ is Cons!15941) (toList!4502 lt!376716)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376716))) (_1!5086 lt!376677))))))

(declare-fun b!831670 () Bool)

(assert (=> b!831670 (= e!463770 (containsKey!401 (t!22310 (toList!4502 lt!376716)) (_1!5086 lt!376677)))))

(assert (= (and d!106235 (not res!566004)) b!831669))

(assert (= (and b!831669 res!566005) b!831670))

(declare-fun m!775537 () Bool)

(assert (=> b!831670 m!775537))

(assert (=> d!105405 d!106235))

(declare-fun d!106237 () Bool)

(declare-fun e!463771 () Bool)

(assert (=> d!106237 e!463771))

(declare-fun res!566006 () Bool)

(assert (=> d!106237 (=> res!566006 e!463771)))

(declare-fun lt!377359 () Bool)

(assert (=> d!106237 (= res!566006 (not lt!377359))))

(declare-fun lt!377361 () Bool)

(assert (=> d!106237 (= lt!377359 lt!377361)))

(declare-fun lt!377360 () Unit!28429)

(declare-fun e!463772 () Unit!28429)

(assert (=> d!106237 (= lt!377360 e!463772)))

(declare-fun c!90306 () Bool)

(assert (=> d!106237 (= c!90306 lt!377361)))

(assert (=> d!106237 (= lt!377361 (containsKey!401 (toList!4502 lt!376990) (_1!5086 (tuple2!10151 lt!376791 minValue!754))))))

(assert (=> d!106237 (= (contains!4208 lt!376990 (_1!5086 (tuple2!10151 lt!376791 minValue!754))) lt!377359)))

(declare-fun b!831671 () Bool)

(declare-fun lt!377362 () Unit!28429)

(assert (=> b!831671 (= e!463772 lt!377362)))

(assert (=> b!831671 (= lt!377362 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376990) (_1!5086 (tuple2!10151 lt!376791 minValue!754))))))

(assert (=> b!831671 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376990) (_1!5086 (tuple2!10151 lt!376791 minValue!754))))))

(declare-fun b!831672 () Bool)

(declare-fun Unit!28486 () Unit!28429)

(assert (=> b!831672 (= e!463772 Unit!28486)))

(declare-fun b!831673 () Bool)

(assert (=> b!831673 (= e!463771 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376990) (_1!5086 (tuple2!10151 lt!376791 minValue!754)))))))

(assert (= (and d!106237 c!90306) b!831671))

(assert (= (and d!106237 (not c!90306)) b!831672))

(assert (= (and d!106237 (not res!566006)) b!831673))

(declare-fun m!775539 () Bool)

(assert (=> d!106237 m!775539))

(declare-fun m!775541 () Bool)

(assert (=> b!831671 m!775541))

(assert (=> b!831671 m!773915))

(assert (=> b!831671 m!773915))

(declare-fun m!775543 () Bool)

(assert (=> b!831671 m!775543))

(assert (=> b!831673 m!773915))

(assert (=> b!831673 m!773915))

(assert (=> b!831673 m!775543))

(assert (=> d!105463 d!106237))

(declare-fun b!831675 () Bool)

(declare-fun e!463773 () Option!421)

(declare-fun e!463774 () Option!421)

(assert (=> b!831675 (= e!463773 e!463774)))

(declare-fun c!90308 () Bool)

(assert (=> b!831675 (= c!90308 (and ((_ is Cons!15941) lt!376987) (not (= (_1!5086 (h!17070 lt!376987)) (_1!5086 (tuple2!10151 lt!376791 minValue!754))))))))

(declare-fun b!831676 () Bool)

(assert (=> b!831676 (= e!463774 (getValueByKey!415 (t!22310 lt!376987) (_1!5086 (tuple2!10151 lt!376791 minValue!754))))))

(declare-fun b!831677 () Bool)

(assert (=> b!831677 (= e!463774 None!419)))

(declare-fun b!831674 () Bool)

(assert (=> b!831674 (= e!463773 (Some!420 (_2!5086 (h!17070 lt!376987))))))

(declare-fun d!106239 () Bool)

(declare-fun c!90307 () Bool)

(assert (=> d!106239 (= c!90307 (and ((_ is Cons!15941) lt!376987) (= (_1!5086 (h!17070 lt!376987)) (_1!5086 (tuple2!10151 lt!376791 minValue!754)))))))

(assert (=> d!106239 (= (getValueByKey!415 lt!376987 (_1!5086 (tuple2!10151 lt!376791 minValue!754))) e!463773)))

(assert (= (and d!106239 c!90307) b!831674))

(assert (= (and d!106239 (not c!90307)) b!831675))

(assert (= (and b!831675 c!90308) b!831676))

(assert (= (and b!831675 (not c!90308)) b!831677))

(declare-fun m!775545 () Bool)

(assert (=> b!831676 m!775545))

(assert (=> d!105463 d!106239))

(declare-fun d!106241 () Bool)

(assert (=> d!106241 (= (getValueByKey!415 lt!376987 (_1!5086 (tuple2!10151 lt!376791 minValue!754))) (Some!420 (_2!5086 (tuple2!10151 lt!376791 minValue!754))))))

(declare-fun lt!377363 () Unit!28429)

(assert (=> d!106241 (= lt!377363 (choose!1418 lt!376987 (_1!5086 (tuple2!10151 lt!376791 minValue!754)) (_2!5086 (tuple2!10151 lt!376791 minValue!754))))))

(declare-fun e!463775 () Bool)

(assert (=> d!106241 e!463775))

(declare-fun res!566007 () Bool)

(assert (=> d!106241 (=> (not res!566007) (not e!463775))))

(assert (=> d!106241 (= res!566007 (isStrictlySorted!441 lt!376987))))

(assert (=> d!106241 (= (lemmaContainsTupThenGetReturnValue!229 lt!376987 (_1!5086 (tuple2!10151 lt!376791 minValue!754)) (_2!5086 (tuple2!10151 lt!376791 minValue!754))) lt!377363)))

(declare-fun b!831678 () Bool)

(declare-fun res!566008 () Bool)

(assert (=> b!831678 (=> (not res!566008) (not e!463775))))

(assert (=> b!831678 (= res!566008 (containsKey!401 lt!376987 (_1!5086 (tuple2!10151 lt!376791 minValue!754))))))

(declare-fun b!831679 () Bool)

(assert (=> b!831679 (= e!463775 (contains!4209 lt!376987 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376791 minValue!754)) (_2!5086 (tuple2!10151 lt!376791 minValue!754)))))))

(assert (= (and d!106241 res!566007) b!831678))

(assert (= (and b!831678 res!566008) b!831679))

(assert (=> d!106241 m!773909))

(declare-fun m!775547 () Bool)

(assert (=> d!106241 m!775547))

(declare-fun m!775549 () Bool)

(assert (=> d!106241 m!775549))

(declare-fun m!775551 () Bool)

(assert (=> b!831678 m!775551))

(declare-fun m!775553 () Bool)

(assert (=> b!831679 m!775553))

(assert (=> d!105463 d!106241))

(declare-fun d!106243 () Bool)

(declare-fun e!463778 () Bool)

(assert (=> d!106243 e!463778))

(declare-fun res!566010 () Bool)

(assert (=> d!106243 (=> (not res!566010) (not e!463778))))

(declare-fun lt!377364 () List!15945)

(assert (=> d!106243 (= res!566010 (isStrictlySorted!441 lt!377364))))

(declare-fun e!463779 () List!15945)

(assert (=> d!106243 (= lt!377364 e!463779)))

(declare-fun c!90312 () Bool)

(assert (=> d!106243 (= c!90312 (and ((_ is Cons!15941) (toList!4502 lt!376790)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376790))) (_1!5086 (tuple2!10151 lt!376791 minValue!754)))))))

(assert (=> d!106243 (isStrictlySorted!441 (toList!4502 lt!376790))))

(assert (=> d!106243 (= (insertStrictlySorted!268 (toList!4502 lt!376790) (_1!5086 (tuple2!10151 lt!376791 minValue!754)) (_2!5086 (tuple2!10151 lt!376791 minValue!754))) lt!377364)))

(declare-fun b!831680 () Bool)

(declare-fun res!566009 () Bool)

(assert (=> b!831680 (=> (not res!566009) (not e!463778))))

(assert (=> b!831680 (= res!566009 (containsKey!401 lt!377364 (_1!5086 (tuple2!10151 lt!376791 minValue!754))))))

(declare-fun b!831681 () Bool)

(declare-fun e!463777 () List!15945)

(assert (=> b!831681 (= e!463777 (insertStrictlySorted!268 (t!22310 (toList!4502 lt!376790)) (_1!5086 (tuple2!10151 lt!376791 minValue!754)) (_2!5086 (tuple2!10151 lt!376791 minValue!754))))))

(declare-fun bm!36352 () Bool)

(declare-fun call!36357 () List!15945)

(assert (=> bm!36352 (= call!36357 ($colon$colon!536 e!463777 (ite c!90312 (h!17070 (toList!4502 lt!376790)) (tuple2!10151 (_1!5086 (tuple2!10151 lt!376791 minValue!754)) (_2!5086 (tuple2!10151 lt!376791 minValue!754))))))))

(declare-fun c!90311 () Bool)

(assert (=> bm!36352 (= c!90311 c!90312)))

(declare-fun b!831682 () Bool)

(assert (=> b!831682 (= e!463778 (contains!4209 lt!377364 (tuple2!10151 (_1!5086 (tuple2!10151 lt!376791 minValue!754)) (_2!5086 (tuple2!10151 lt!376791 minValue!754)))))))

(declare-fun c!90309 () Bool)

(declare-fun b!831683 () Bool)

(declare-fun c!90310 () Bool)

(assert (=> b!831683 (= e!463777 (ite c!90309 (t!22310 (toList!4502 lt!376790)) (ite c!90310 (Cons!15941 (h!17070 (toList!4502 lt!376790)) (t!22310 (toList!4502 lt!376790))) Nil!15942)))))

(declare-fun b!831684 () Bool)

(declare-fun e!463776 () List!15945)

(declare-fun call!36356 () List!15945)

(assert (=> b!831684 (= e!463776 call!36356)))

(declare-fun bm!36353 () Bool)

(declare-fun call!36355 () List!15945)

(assert (=> bm!36353 (= call!36356 call!36355)))

(declare-fun bm!36354 () Bool)

(assert (=> bm!36354 (= call!36355 call!36357)))

(declare-fun b!831685 () Bool)

(assert (=> b!831685 (= e!463776 call!36356)))

(declare-fun b!831686 () Bool)

(assert (=> b!831686 (= e!463779 call!36357)))

(declare-fun b!831687 () Bool)

(declare-fun e!463780 () List!15945)

(assert (=> b!831687 (= e!463780 call!36355)))

(declare-fun b!831688 () Bool)

(assert (=> b!831688 (= c!90310 (and ((_ is Cons!15941) (toList!4502 lt!376790)) (bvsgt (_1!5086 (h!17070 (toList!4502 lt!376790))) (_1!5086 (tuple2!10151 lt!376791 minValue!754)))))))

(assert (=> b!831688 (= e!463780 e!463776)))

(declare-fun b!831689 () Bool)

(assert (=> b!831689 (= e!463779 e!463780)))

(assert (=> b!831689 (= c!90309 (and ((_ is Cons!15941) (toList!4502 lt!376790)) (= (_1!5086 (h!17070 (toList!4502 lt!376790))) (_1!5086 (tuple2!10151 lt!376791 minValue!754)))))))

(assert (= (and d!106243 c!90312) b!831686))

(assert (= (and d!106243 (not c!90312)) b!831689))

(assert (= (and b!831689 c!90309) b!831687))

(assert (= (and b!831689 (not c!90309)) b!831688))

(assert (= (and b!831688 c!90310) b!831685))

(assert (= (and b!831688 (not c!90310)) b!831684))

(assert (= (or b!831685 b!831684) bm!36353))

(assert (= (or b!831687 bm!36353) bm!36354))

(assert (= (or b!831686 bm!36354) bm!36352))

(assert (= (and bm!36352 c!90311) b!831681))

(assert (= (and bm!36352 (not c!90311)) b!831683))

(assert (= (and d!106243 res!566010) b!831680))

(assert (= (and b!831680 res!566009) b!831682))

(declare-fun m!775555 () Bool)

(assert (=> bm!36352 m!775555))

(declare-fun m!775557 () Bool)

(assert (=> b!831680 m!775557))

(declare-fun m!775559 () Bool)

(assert (=> b!831682 m!775559))

(declare-fun m!775561 () Bool)

(assert (=> d!106243 m!775561))

(declare-fun m!775563 () Bool)

(assert (=> d!106243 m!775563))

(declare-fun m!775565 () Bool)

(assert (=> b!831681 m!775565))

(assert (=> d!105463 d!106243))

(declare-fun d!106245 () Bool)

(declare-fun res!566011 () Bool)

(declare-fun e!463781 () Bool)

(assert (=> d!106245 (=> res!566011 e!463781)))

(assert (=> d!106245 (= res!566011 (and ((_ is Cons!15941) (toList!4502 lt!376863)) (= (_1!5086 (h!17070 (toList!4502 lt!376863))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106245 (= (containsKey!401 (toList!4502 lt!376863) #b1000000000000000000000000000000000000000000000000000000000000000) e!463781)))

(declare-fun b!831690 () Bool)

(declare-fun e!463782 () Bool)

(assert (=> b!831690 (= e!463781 e!463782)))

(declare-fun res!566012 () Bool)

(assert (=> b!831690 (=> (not res!566012) (not e!463782))))

(assert (=> b!831690 (= res!566012 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376863))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376863))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15941) (toList!4502 lt!376863)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376863))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831691 () Bool)

(assert (=> b!831691 (= e!463782 (containsKey!401 (t!22310 (toList!4502 lt!376863)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106245 (not res!566011)) b!831690))

(assert (= (and b!831690 res!566012) b!831691))

(declare-fun m!775567 () Bool)

(assert (=> b!831691 m!775567))

(assert (=> d!105373 d!106245))

(declare-fun d!106247 () Bool)

(declare-fun res!566013 () Bool)

(declare-fun e!463783 () Bool)

(assert (=> d!106247 (=> res!566013 e!463783)))

(assert (=> d!106247 (= res!566013 (and ((_ is Cons!15941) (toList!4502 lt!376856)) (= (_1!5086 (h!17070 (toList!4502 lt!376856))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106247 (= (containsKey!401 (toList!4502 lt!376856) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) e!463783)))

(declare-fun b!831692 () Bool)

(declare-fun e!463784 () Bool)

(assert (=> b!831692 (= e!463783 e!463784)))

(declare-fun res!566014 () Bool)

(assert (=> b!831692 (=> (not res!566014) (not e!463784))))

(assert (=> b!831692 (= res!566014 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376856))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376856))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15941) (toList!4502 lt!376856)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376856))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!831693 () Bool)

(assert (=> b!831693 (= e!463784 (containsKey!401 (t!22310 (toList!4502 lt!376856)) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106247 (not res!566013)) b!831692))

(assert (= (and b!831692 res!566014) b!831693))

(assert (=> b!831693 m!773353))

(declare-fun m!775569 () Bool)

(assert (=> b!831693 m!775569))

(assert (=> d!105525 d!106247))

(declare-fun d!106249 () Bool)

(declare-fun lt!377365 () Bool)

(assert (=> d!106249 (= lt!377365 (select (content!387 (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941)) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!463785 () Bool)

(assert (=> d!106249 (= lt!377365 e!463785)))

(declare-fun res!566015 () Bool)

(assert (=> d!106249 (=> (not res!566015) (not e!463785))))

(assert (=> d!106249 (= res!566015 ((_ is Cons!15940) (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941)))))

(assert (=> d!106249 (= (contains!4210 (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!377365)))

(declare-fun b!831694 () Bool)

(declare-fun e!463786 () Bool)

(assert (=> b!831694 (= e!463785 e!463786)))

(declare-fun res!566016 () Bool)

(assert (=> b!831694 (=> res!566016 e!463786)))

(assert (=> b!831694 (= res!566016 (= (h!17069 (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941)) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!831695 () Bool)

(assert (=> b!831695 (= e!463786 (contains!4210 (t!22309 (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941)) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!106249 res!566015) b!831694))

(assert (= (and b!831694 (not res!566016)) b!831695))

(declare-fun m!775571 () Bool)

(assert (=> d!106249 m!775571))

(assert (=> d!106249 m!773859))

(declare-fun m!775573 () Bool)

(assert (=> d!106249 m!775573))

(assert (=> b!831695 m!773859))

(declare-fun m!775575 () Bool)

(assert (=> b!831695 m!775575))

(assert (=> b!830774 d!106249))

(declare-fun d!106251 () Bool)

(declare-fun res!566017 () Bool)

(declare-fun e!463787 () Bool)

(assert (=> d!106251 (=> res!566017 e!463787)))

(assert (=> d!106251 (= res!566017 (and ((_ is Cons!15941) lt!376830) (= (_1!5086 (h!17070 lt!376830)) (_1!5086 lt!376677))))))

(assert (=> d!106251 (= (containsKey!401 lt!376830 (_1!5086 lt!376677)) e!463787)))

(declare-fun b!831696 () Bool)

(declare-fun e!463788 () Bool)

(assert (=> b!831696 (= e!463787 e!463788)))

(declare-fun res!566018 () Bool)

(assert (=> b!831696 (=> (not res!566018) (not e!463788))))

(assert (=> b!831696 (= res!566018 (and (or (not ((_ is Cons!15941) lt!376830)) (bvsle (_1!5086 (h!17070 lt!376830)) (_1!5086 lt!376677))) ((_ is Cons!15941) lt!376830) (bvslt (_1!5086 (h!17070 lt!376830)) (_1!5086 lt!376677))))))

(declare-fun b!831697 () Bool)

(assert (=> b!831697 (= e!463788 (containsKey!401 (t!22310 lt!376830) (_1!5086 lt!376677)))))

(assert (= (and d!106251 (not res!566017)) b!831696))

(assert (= (and b!831696 res!566018) b!831697))

(declare-fun m!775577 () Bool)

(assert (=> b!831697 m!775577))

(assert (=> b!830680 d!106251))

(declare-fun d!106253 () Bool)

(assert (not d!106253))

(assert (=> b!830594 d!106253))

(declare-fun d!106255 () Bool)

(declare-fun lt!377366 () Bool)

(assert (=> d!106255 (= lt!377366 (select (content!386 (t!22310 (toList!4502 lt!376829))) lt!376677))))

(declare-fun e!463790 () Bool)

(assert (=> d!106255 (= lt!377366 e!463790)))

(declare-fun res!566019 () Bool)

(assert (=> d!106255 (=> (not res!566019) (not e!463790))))

(assert (=> d!106255 (= res!566019 ((_ is Cons!15941) (t!22310 (toList!4502 lt!376829))))))

(assert (=> d!106255 (= (contains!4209 (t!22310 (toList!4502 lt!376829)) lt!376677) lt!377366)))

(declare-fun b!831698 () Bool)

(declare-fun e!463789 () Bool)

(assert (=> b!831698 (= e!463790 e!463789)))

(declare-fun res!566020 () Bool)

(assert (=> b!831698 (=> res!566020 e!463789)))

(assert (=> b!831698 (= res!566020 (= (h!17070 (t!22310 (toList!4502 lt!376829))) lt!376677))))

(declare-fun b!831699 () Bool)

(assert (=> b!831699 (= e!463789 (contains!4209 (t!22310 (t!22310 (toList!4502 lt!376829))) lt!376677))))

(assert (= (and d!106255 res!566019) b!831698))

(assert (= (and b!831698 (not res!566020)) b!831699))

(assert (=> d!106255 m!775467))

(declare-fun m!775579 () Bool)

(assert (=> d!106255 m!775579))

(declare-fun m!775581 () Bool)

(assert (=> b!831699 m!775581))

(assert (=> b!830427 d!106255))

(declare-fun d!106257 () Bool)

(assert (=> d!106257 (= (get!11818 (getValueByKey!415 (toList!4502 (+!1980 lt!376825 (tuple2!10151 lt!376814 zeroValueAfter!34))) lt!376809)) (v!10095 (getValueByKey!415 (toList!4502 (+!1980 lt!376825 (tuple2!10151 lt!376814 zeroValueAfter!34))) lt!376809)))))

(assert (=> d!105441 d!106257))

(declare-fun b!831701 () Bool)

(declare-fun e!463791 () Option!421)

(declare-fun e!463792 () Option!421)

(assert (=> b!831701 (= e!463791 e!463792)))

(declare-fun c!90314 () Bool)

(assert (=> b!831701 (= c!90314 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376825 (tuple2!10151 lt!376814 zeroValueAfter!34)))) (not (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376825 (tuple2!10151 lt!376814 zeroValueAfter!34))))) lt!376809))))))

(declare-fun b!831702 () Bool)

(assert (=> b!831702 (= e!463792 (getValueByKey!415 (t!22310 (toList!4502 (+!1980 lt!376825 (tuple2!10151 lt!376814 zeroValueAfter!34)))) lt!376809))))

(declare-fun b!831703 () Bool)

(assert (=> b!831703 (= e!463792 None!419)))

(declare-fun b!831700 () Bool)

(assert (=> b!831700 (= e!463791 (Some!420 (_2!5086 (h!17070 (toList!4502 (+!1980 lt!376825 (tuple2!10151 lt!376814 zeroValueAfter!34)))))))))

(declare-fun c!90313 () Bool)

(declare-fun d!106259 () Bool)

(assert (=> d!106259 (= c!90313 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376825 (tuple2!10151 lt!376814 zeroValueAfter!34)))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376825 (tuple2!10151 lt!376814 zeroValueAfter!34))))) lt!376809)))))

(assert (=> d!106259 (= (getValueByKey!415 (toList!4502 (+!1980 lt!376825 (tuple2!10151 lt!376814 zeroValueAfter!34))) lt!376809) e!463791)))

(assert (= (and d!106259 c!90313) b!831700))

(assert (= (and d!106259 (not c!90313)) b!831701))

(assert (= (and b!831701 c!90314) b!831702))

(assert (= (and b!831701 (not c!90314)) b!831703))

(declare-fun m!775583 () Bool)

(assert (=> b!831702 m!775583))

(assert (=> d!105441 d!106259))

(assert (=> d!105485 d!105481))

(assert (=> d!105485 d!105467))

(declare-fun d!106261 () Bool)

(declare-fun e!463793 () Bool)

(assert (=> d!106261 e!463793))

(declare-fun res!566021 () Bool)

(assert (=> d!106261 (=> res!566021 e!463793)))

(declare-fun lt!377367 () Bool)

(assert (=> d!106261 (= res!566021 (not lt!377367))))

(declare-fun lt!377369 () Bool)

(assert (=> d!106261 (= lt!377367 lt!377369)))

(declare-fun lt!377368 () Unit!28429)

(declare-fun e!463794 () Unit!28429)

(assert (=> d!106261 (= lt!377368 e!463794)))

(declare-fun c!90315 () Bool)

(assert (=> d!106261 (= c!90315 lt!377369)))

(assert (=> d!106261 (= lt!377369 (containsKey!401 (toList!4502 lt!376803) lt!376787))))

(assert (=> d!106261 (= (contains!4208 lt!376803 lt!376787) lt!377367)))

(declare-fun b!831704 () Bool)

(declare-fun lt!377370 () Unit!28429)

(assert (=> b!831704 (= e!463794 lt!377370)))

(assert (=> b!831704 (= lt!377370 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376803) lt!376787))))

(assert (=> b!831704 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376803) lt!376787))))

(declare-fun b!831705 () Bool)

(declare-fun Unit!28487 () Unit!28429)

(assert (=> b!831705 (= e!463794 Unit!28487)))

(declare-fun b!831706 () Bool)

(assert (=> b!831706 (= e!463793 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376803) lt!376787)))))

(assert (= (and d!106261 c!90315) b!831704))

(assert (= (and d!106261 (not c!90315)) b!831705))

(assert (= (and d!106261 (not res!566021)) b!831706))

(declare-fun m!775585 () Bool)

(assert (=> d!106261 m!775585))

(declare-fun m!775587 () Bool)

(assert (=> b!831704 m!775587))

(assert (=> b!831704 m!773923))

(assert (=> b!831704 m!773923))

(declare-fun m!775589 () Bool)

(assert (=> b!831704 m!775589))

(assert (=> b!831706 m!773923))

(assert (=> b!831706 m!773923))

(assert (=> b!831706 m!775589))

(assert (=> d!105485 d!106261))

(declare-fun d!106263 () Bool)

(assert (=> d!106263 (= (apply!372 (+!1980 lt!376803 (tuple2!10151 lt!376792 zeroValueBefore!34)) lt!376787) (apply!372 lt!376803 lt!376787))))

(assert (=> d!106263 true))

(declare-fun _$34!1145 () Unit!28429)

(assert (=> d!106263 (= (choose!1419 lt!376803 lt!376792 zeroValueBefore!34 lt!376787) _$34!1145)))

(declare-fun bs!23252 () Bool)

(assert (= bs!23252 d!106263))

(assert (=> bs!23252 m!773405))

(assert (=> bs!23252 m!773405))

(assert (=> bs!23252 m!773407))

(assert (=> bs!23252 m!773417))

(assert (=> d!105485 d!106263))

(assert (=> d!105485 d!105491))

(assert (=> d!105427 d!105429))

(assert (=> d!105427 d!105447))

(declare-fun d!106265 () Bool)

(declare-fun e!463795 () Bool)

(assert (=> d!106265 e!463795))

(declare-fun res!566022 () Bool)

(assert (=> d!106265 (=> res!566022 e!463795)))

(declare-fun lt!377371 () Bool)

(assert (=> d!106265 (= res!566022 (not lt!377371))))

(declare-fun lt!377373 () Bool)

(assert (=> d!106265 (= lt!377371 lt!377373)))

(declare-fun lt!377372 () Unit!28429)

(declare-fun e!463796 () Unit!28429)

(assert (=> d!106265 (= lt!377372 e!463796)))

(declare-fun c!90316 () Bool)

(assert (=> d!106265 (= c!90316 lt!377373)))

(assert (=> d!106265 (= lt!377373 (containsKey!401 (toList!4502 lt!376812) lt!376821))))

(assert (=> d!106265 (= (contains!4208 lt!376812 lt!376821) lt!377371)))

(declare-fun b!831707 () Bool)

(declare-fun lt!377374 () Unit!28429)

(assert (=> b!831707 (= e!463796 lt!377374)))

(assert (=> b!831707 (= lt!377374 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376812) lt!376821))))

(assert (=> b!831707 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376812) lt!376821))))

(declare-fun b!831708 () Bool)

(declare-fun Unit!28488 () Unit!28429)

(assert (=> b!831708 (= e!463796 Unit!28488)))

(declare-fun b!831709 () Bool)

(assert (=> b!831709 (= e!463795 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376812) lt!376821)))))

(assert (= (and d!106265 c!90316) b!831707))

(assert (= (and d!106265 (not c!90316)) b!831708))

(assert (= (and d!106265 (not res!566022)) b!831709))

(declare-fun m!775591 () Bool)

(assert (=> d!106265 m!775591))

(declare-fun m!775593 () Bool)

(assert (=> b!831707 m!775593))

(assert (=> b!831707 m!773799))

(assert (=> b!831707 m!773799))

(declare-fun m!775595 () Bool)

(assert (=> b!831707 m!775595))

(assert (=> b!831709 m!773799))

(assert (=> b!831709 m!773799))

(assert (=> b!831709 m!775595))

(assert (=> d!105427 d!106265))

(assert (=> d!105427 d!105439))

(declare-fun d!106267 () Bool)

(assert (=> d!106267 (= (apply!372 (+!1980 lt!376812 (tuple2!10151 lt!376813 minValue!754)) lt!376821) (apply!372 lt!376812 lt!376821))))

(assert (=> d!106267 true))

(declare-fun _$34!1146 () Unit!28429)

(assert (=> d!106267 (= (choose!1419 lt!376812 lt!376813 minValue!754 lt!376821) _$34!1146)))

(declare-fun bs!23253 () Bool)

(assert (= bs!23253 d!106267))

(assert (=> bs!23253 m!773465))

(assert (=> bs!23253 m!773465))

(assert (=> bs!23253 m!773471))

(assert (=> bs!23253 m!773451))

(assert (=> d!105427 d!106267))

(declare-fun d!106269 () Bool)

(declare-fun lt!377375 () Bool)

(assert (=> d!106269 (= lt!377375 (select (content!386 lt!377024) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(declare-fun e!463798 () Bool)

(assert (=> d!106269 (= lt!377375 e!463798)))

(declare-fun res!566023 () Bool)

(assert (=> d!106269 (=> (not res!566023) (not e!463798))))

(assert (=> d!106269 (= res!566023 ((_ is Cons!15941) lt!377024))))

(assert (=> d!106269 (= (contains!4209 lt!377024 (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))) lt!377375)))

(declare-fun b!831710 () Bool)

(declare-fun e!463797 () Bool)

(assert (=> b!831710 (= e!463798 e!463797)))

(declare-fun res!566024 () Bool)

(assert (=> b!831710 (=> res!566024 e!463797)))

(assert (=> b!831710 (= res!566024 (= (h!17070 lt!377024) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(declare-fun b!831711 () Bool)

(assert (=> b!831711 (= e!463797 (contains!4209 (t!22310 lt!377024) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(assert (= (and d!106269 res!566023) b!831710))

(assert (= (and b!831710 (not res!566024)) b!831711))

(declare-fun m!775597 () Bool)

(assert (=> d!106269 m!775597))

(declare-fun m!775599 () Bool)

(assert (=> d!106269 m!775599))

(declare-fun m!775601 () Bool)

(assert (=> b!831711 m!775601))

(assert (=> b!830643 d!106269))

(declare-fun d!106271 () Bool)

(declare-fun res!566025 () Bool)

(declare-fun e!463799 () Bool)

(assert (=> d!106271 (=> res!566025 e!463799)))

(assert (=> d!106271 (= res!566025 (and ((_ is Cons!15941) (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34)))) (= (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))))) lt!376783)))))

(assert (=> d!106271 (= (containsKey!401 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))) lt!376783) e!463799)))

(declare-fun b!831712 () Bool)

(declare-fun e!463800 () Bool)

(assert (=> b!831712 (= e!463799 e!463800)))

(declare-fun res!566026 () Bool)

(assert (=> b!831712 (=> (not res!566026) (not e!463800))))

(assert (=> b!831712 (= res!566026 (and (or (not ((_ is Cons!15941) (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))))) (bvsle (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))))) lt!376783)) ((_ is Cons!15941) (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34)))) (bvslt (_1!5086 (h!17070 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34))))) lt!376783)))))

(declare-fun b!831713 () Bool)

(assert (=> b!831713 (= e!463800 (containsKey!401 (t!22310 (toList!4502 (+!1980 lt!376802 (tuple2!10151 lt!376788 zeroValueBefore!34)))) lt!376783))))

(assert (= (and d!106271 (not res!566025)) b!831712))

(assert (= (and b!831712 res!566026) b!831713))

(declare-fun m!775603 () Bool)

(assert (=> b!831713 m!775603))

(assert (=> d!105475 d!106271))

(declare-fun d!106273 () Bool)

(declare-fun e!463801 () Bool)

(assert (=> d!106273 e!463801))

(declare-fun res!566027 () Bool)

(assert (=> d!106273 (=> res!566027 e!463801)))

(declare-fun lt!377376 () Bool)

(assert (=> d!106273 (= res!566027 (not lt!377376))))

(declare-fun lt!377378 () Bool)

(assert (=> d!106273 (= lt!377376 lt!377378)))

(declare-fun lt!377377 () Unit!28429)

(declare-fun e!463802 () Unit!28429)

(assert (=> d!106273 (= lt!377377 e!463802)))

(declare-fun c!90317 () Bool)

(assert (=> d!106273 (= c!90317 lt!377378)))

(assert (=> d!106273 (= lt!377378 (containsKey!401 (toList!4502 lt!376975) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!106273 (= (contains!4208 lt!376975 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!377376)))

(declare-fun b!831714 () Bool)

(declare-fun lt!377379 () Unit!28429)

(assert (=> b!831714 (= e!463802 lt!377379)))

(assert (=> b!831714 (= lt!377379 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376975) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!831714 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376975) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!831715 () Bool)

(declare-fun Unit!28489 () Unit!28429)

(assert (=> b!831715 (= e!463802 Unit!28489)))

(declare-fun b!831716 () Bool)

(assert (=> b!831716 (= e!463801 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376975) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(assert (= (and d!106273 c!90317) b!831714))

(assert (= (and d!106273 (not c!90317)) b!831715))

(assert (= (and d!106273 (not res!566027)) b!831716))

(assert (=> d!106273 m!773859))

(declare-fun m!775605 () Bool)

(assert (=> d!106273 m!775605))

(assert (=> b!831714 m!773859))

(declare-fun m!775607 () Bool)

(assert (=> b!831714 m!775607))

(assert (=> b!831714 m!773859))

(assert (=> b!831714 m!774631))

(assert (=> b!831714 m!774631))

(declare-fun m!775609 () Bool)

(assert (=> b!831714 m!775609))

(assert (=> b!831716 m!773859))

(assert (=> b!831716 m!774631))

(assert (=> b!831716 m!774631))

(assert (=> b!831716 m!775609))

(assert (=> b!830571 d!106273))

(declare-fun b!831718 () Bool)

(declare-fun e!463803 () Option!421)

(declare-fun e!463804 () Option!421)

(assert (=> b!831718 (= e!463803 e!463804)))

(declare-fun c!90319 () Bool)

(assert (=> b!831718 (= c!90319 (and ((_ is Cons!15941) (toList!4502 lt!376990)) (not (= (_1!5086 (h!17070 (toList!4502 lt!376990))) (_1!5086 (tuple2!10151 lt!376791 minValue!754))))))))

(declare-fun b!831719 () Bool)

(assert (=> b!831719 (= e!463804 (getValueByKey!415 (t!22310 (toList!4502 lt!376990)) (_1!5086 (tuple2!10151 lt!376791 minValue!754))))))

(declare-fun b!831720 () Bool)

(assert (=> b!831720 (= e!463804 None!419)))

(declare-fun b!831717 () Bool)

(assert (=> b!831717 (= e!463803 (Some!420 (_2!5086 (h!17070 (toList!4502 lt!376990)))))))

(declare-fun c!90318 () Bool)

(declare-fun d!106275 () Bool)

(assert (=> d!106275 (= c!90318 (and ((_ is Cons!15941) (toList!4502 lt!376990)) (= (_1!5086 (h!17070 (toList!4502 lt!376990))) (_1!5086 (tuple2!10151 lt!376791 minValue!754)))))))

(assert (=> d!106275 (= (getValueByKey!415 (toList!4502 lt!376990) (_1!5086 (tuple2!10151 lt!376791 minValue!754))) e!463803)))

(assert (= (and d!106275 c!90318) b!831717))

(assert (= (and d!106275 (not c!90318)) b!831718))

(assert (= (and b!831718 c!90319) b!831719))

(assert (= (and b!831718 (not c!90319)) b!831720))

(declare-fun m!775611 () Bool)

(assert (=> b!831719 m!775611))

(assert (=> b!830595 d!106275))

(declare-fun d!106277 () Bool)

(assert (=> d!106277 (= (apply!372 (+!1980 lt!376825 (tuple2!10151 lt!376814 zeroValueAfter!34)) lt!376809) (apply!372 lt!376825 lt!376809))))

(assert (=> d!106277 true))

(declare-fun _$34!1147 () Unit!28429)

(assert (=> d!106277 (= (choose!1419 lt!376825 lt!376814 zeroValueAfter!34 lt!376809) _$34!1147)))

(declare-fun bs!23254 () Bool)

(assert (= bs!23254 d!106277))

(assert (=> bs!23254 m!773457))

(assert (=> bs!23254 m!773457))

(assert (=> bs!23254 m!773459))

(assert (=> bs!23254 m!773469))

(assert (=> d!105449 d!106277))

(declare-fun d!106279 () Bool)

(declare-fun e!463805 () Bool)

(assert (=> d!106279 e!463805))

(declare-fun res!566028 () Bool)

(assert (=> d!106279 (=> res!566028 e!463805)))

(declare-fun lt!377380 () Bool)

(assert (=> d!106279 (= res!566028 (not lt!377380))))

(declare-fun lt!377382 () Bool)

(assert (=> d!106279 (= lt!377380 lt!377382)))

(declare-fun lt!377381 () Unit!28429)

(declare-fun e!463806 () Unit!28429)

(assert (=> d!106279 (= lt!377381 e!463806)))

(declare-fun c!90320 () Bool)

(assert (=> d!106279 (= c!90320 lt!377382)))

(assert (=> d!106279 (= lt!377382 (containsKey!401 (toList!4502 lt!376825) lt!376809))))

(assert (=> d!106279 (= (contains!4208 lt!376825 lt!376809) lt!377380)))

(declare-fun b!831721 () Bool)

(declare-fun lt!377383 () Unit!28429)

(assert (=> b!831721 (= e!463806 lt!377383)))

(assert (=> b!831721 (= lt!377383 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4502 lt!376825) lt!376809))))

(assert (=> b!831721 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376825) lt!376809))))

(declare-fun b!831722 () Bool)

(declare-fun Unit!28490 () Unit!28429)

(assert (=> b!831722 (= e!463806 Unit!28490)))

(declare-fun b!831723 () Bool)

(assert (=> b!831723 (= e!463805 (isDefined!311 (getValueByKey!415 (toList!4502 lt!376825) lt!376809)))))

(assert (= (and d!106279 c!90320) b!831721))

(assert (= (and d!106279 (not c!90320)) b!831722))

(assert (= (and d!106279 (not res!566028)) b!831723))

(declare-fun m!775613 () Bool)

(assert (=> d!106279 m!775613))

(declare-fun m!775615 () Bool)

(assert (=> b!831721 m!775615))

(assert (=> b!831721 m!773807))

(assert (=> b!831721 m!773807))

(declare-fun m!775617 () Bool)

(assert (=> b!831721 m!775617))

(assert (=> b!831723 m!773807))

(assert (=> b!831723 m!773807))

(assert (=> b!831723 m!775617))

(assert (=> d!105449 d!106279))

(assert (=> d!105449 d!105441))

(assert (=> d!105449 d!105443))

(assert (=> d!105449 d!105451))

(declare-fun d!106281 () Bool)

(declare-fun res!566029 () Bool)

(declare-fun e!463807 () Bool)

(assert (=> d!106281 (=> res!566029 e!463807)))

(assert (=> d!106281 (= res!566029 (and ((_ is Cons!15941) (toList!4502 lt!376863)) (= (_1!5086 (h!17070 (toList!4502 lt!376863))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106281 (= (containsKey!401 (toList!4502 lt!376863) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)) e!463807)))

(declare-fun b!831724 () Bool)

(declare-fun e!463808 () Bool)

(assert (=> b!831724 (= e!463807 e!463808)))

(declare-fun res!566030 () Bool)

(assert (=> b!831724 (=> (not res!566030) (not e!463808))))

(assert (=> b!831724 (= res!566030 (and (or (not ((_ is Cons!15941) (toList!4502 lt!376863))) (bvsle (_1!5086 (h!17070 (toList!4502 lt!376863))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15941) (toList!4502 lt!376863)) (bvslt (_1!5086 (h!17070 (toList!4502 lt!376863))) (select (arr!22328 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!831725 () Bool)

(assert (=> b!831725 (= e!463808 (containsKey!401 (t!22310 (toList!4502 lt!376863)) (select (arr!22328 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106281 (not res!566029)) b!831724))

(assert (= (and b!831724 res!566030) b!831725))

(assert (=> b!831725 m!773353))

(declare-fun m!775619 () Bool)

(assert (=> b!831725 m!775619))

(assert (=> d!105385 d!106281))

(declare-fun b!831726 () Bool)

(declare-fun e!463809 () Bool)

(declare-fun e!463812 () Bool)

(assert (=> b!831726 (= e!463809 e!463812)))

(declare-fun c!90321 () Bool)

(assert (=> b!831726 (= c!90321 (validKeyInArray!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!831727 () Bool)

(declare-fun call!36358 () Bool)

(assert (=> b!831727 (= e!463812 call!36358)))

(declare-fun b!831728 () Bool)

(declare-fun e!463810 () Bool)

(assert (=> b!831728 (= e!463810 e!463809)))

(declare-fun res!566032 () Bool)

(assert (=> b!831728 (=> (not res!566032) (not e!463809))))

(declare-fun e!463811 () Bool)

(assert (=> b!831728 (= res!566032 (not e!463811))))

(declare-fun res!566031 () Bool)

(assert (=> b!831728 (=> (not res!566031) (not e!463811))))

(assert (=> b!831728 (= res!566031 (validKeyInArray!0 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!36355 () Bool)

(assert (=> bm!36355 (= call!36358 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90321 (Cons!15940 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!90018 (Cons!15940 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941)) (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941))) (ite c!90018 (Cons!15940 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941)) (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941)))))))

(declare-fun d!106283 () Bool)

(declare-fun res!566033 () Bool)

(assert (=> d!106283 (=> res!566033 e!463810)))

(assert (=> d!106283 (= res!566033 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22749 _keys!976)))))

(assert (=> d!106283 (= (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90018 (Cons!15940 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941)) (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941))) e!463810)))

(declare-fun b!831729 () Bool)

(assert (=> b!831729 (= e!463811 (contains!4210 (ite c!90018 (Cons!15940 (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941)) (ite c!89869 (Cons!15940 (select (arr!22328 _keys!976) #b00000000000000000000000000000000) Nil!15941) Nil!15941)) (select (arr!22328 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!831730 () Bool)

(assert (=> b!831730 (= e!463812 call!36358)))

(assert (= (and d!106283 (not res!566033)) b!831728))

(assert (= (and b!831728 res!566031) b!831729))

(assert (= (and b!831728 res!566032) b!831726))

(assert (= (and b!831726 c!90321) b!831730))

(assert (= (and b!831726 (not c!90321)) b!831727))

(assert (= (or b!831730 b!831727) bm!36355))

(assert (=> b!831726 m!774505))

(assert (=> b!831726 m!774505))

(assert (=> b!831726 m!774513))

(assert (=> b!831728 m!774505))

(assert (=> b!831728 m!774505))

(assert (=> b!831728 m!774513))

(assert (=> bm!36355 m!774505))

(declare-fun m!775621 () Bool)

(assert (=> bm!36355 m!775621))

(assert (=> b!831729 m!774505))

(assert (=> b!831729 m!774505))

(declare-fun m!775623 () Bool)

(assert (=> b!831729 m!775623))

(assert (=> bm!36285 d!106283))

(declare-fun d!106285 () Bool)

(declare-fun c!90322 () Bool)

(assert (=> d!106285 (= c!90322 ((_ is Nil!15942) (toList!4502 lt!376716)))))

(declare-fun e!463813 () (InoxSet tuple2!10150))

(assert (=> d!106285 (= (content!386 (toList!4502 lt!376716)) e!463813)))

(declare-fun b!831731 () Bool)

(assert (=> b!831731 (= e!463813 ((as const (Array tuple2!10150 Bool)) false))))

(declare-fun b!831732 () Bool)

(assert (=> b!831732 (= e!463813 ((_ map or) (store ((as const (Array tuple2!10150 Bool)) false) (h!17070 (toList!4502 lt!376716)) true) (content!386 (t!22310 (toList!4502 lt!376716)))))))

(assert (= (and d!106285 c!90322) b!831731))

(assert (= (and d!106285 (not c!90322)) b!831732))

(declare-fun m!775625 () Bool)

(assert (=> b!831732 m!775625))

(assert (=> b!831732 m!775159))

(assert (=> d!105493 d!106285))

(declare-fun d!106287 () Bool)

(declare-fun lt!377384 () Bool)

(assert (=> d!106287 (= lt!377384 (select (content!386 lt!376826) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun e!463815 () Bool)

(assert (=> d!106287 (= lt!377384 e!463815)))

(declare-fun res!566034 () Bool)

(assert (=> d!106287 (=> (not res!566034) (not e!463815))))

(assert (=> d!106287 (= res!566034 ((_ is Cons!15941) lt!376826))))

(assert (=> d!106287 (= (contains!4209 lt!376826 (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))) lt!377384)))

(declare-fun b!831733 () Bool)

(declare-fun e!463814 () Bool)

(assert (=> b!831733 (= e!463815 e!463814)))

(declare-fun res!566035 () Bool)

(assert (=> b!831733 (=> res!566035 e!463814)))

(assert (=> b!831733 (= res!566035 (= (h!17070 lt!376826) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(declare-fun b!831734 () Bool)

(assert (=> b!831734 (= e!463814 (contains!4209 (t!22310 lt!376826) (tuple2!10151 (_1!5086 lt!376677) (_2!5086 lt!376677))))))

(assert (= (and d!106287 res!566034) b!831733))

(assert (= (and b!831733 (not res!566035)) b!831734))

(declare-fun m!775627 () Bool)

(assert (=> d!106287 m!775627))

(declare-fun m!775629 () Bool)

(assert (=> d!106287 m!775629))

(declare-fun m!775631 () Bool)

(assert (=> b!831734 m!775631))

(assert (=> b!830536 d!106287))

(declare-fun lt!377385 () Bool)

(declare-fun d!106289 () Bool)

(assert (=> d!106289 (= lt!377385 (select (content!386 (toList!4502 lt!376913)) (tuple2!10151 lt!376854 lt!376852)))))

(declare-fun e!463817 () Bool)

(assert (=> d!106289 (= lt!377385 e!463817)))

(declare-fun res!566036 () Bool)

(assert (=> d!106289 (=> (not res!566036) (not e!463817))))

(assert (=> d!106289 (= res!566036 ((_ is Cons!15941) (toList!4502 lt!376913)))))

(assert (=> d!106289 (= (contains!4209 (toList!4502 lt!376913) (tuple2!10151 lt!376854 lt!376852)) lt!377385)))

(declare-fun b!831735 () Bool)

(declare-fun e!463816 () Bool)

(assert (=> b!831735 (= e!463817 e!463816)))

(declare-fun res!566037 () Bool)

(assert (=> b!831735 (=> res!566037 e!463816)))

(assert (=> b!831735 (= res!566037 (= (h!17070 (toList!4502 lt!376913)) (tuple2!10151 lt!376854 lt!376852)))))

(declare-fun b!831736 () Bool)

(assert (=> b!831736 (= e!463816 (contains!4209 (t!22310 (toList!4502 lt!376913)) (tuple2!10151 lt!376854 lt!376852)))))

(assert (= (and d!106289 res!566036) b!831735))

(assert (= (and b!831735 (not res!566037)) b!831736))

(declare-fun m!775633 () Bool)

(assert (=> d!106289 m!775633))

(declare-fun m!775635 () Bool)

(assert (=> d!106289 m!775635))

(declare-fun m!775637 () Bool)

(assert (=> b!831736 m!775637))

(assert (=> b!830464 d!106289))

(declare-fun d!106291 () Bool)

(declare-fun lt!377386 () Bool)

(assert (=> d!106291 (= lt!377386 (select (content!386 lt!376730) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(declare-fun e!463819 () Bool)

(assert (=> d!106291 (= lt!377386 e!463819)))

(declare-fun res!566038 () Bool)

(assert (=> d!106291 (=> (not res!566038) (not e!463819))))

(assert (=> d!106291 (= res!566038 ((_ is Cons!15941) lt!376730))))

(assert (=> d!106291 (= (contains!4209 lt!376730 (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))) lt!377386)))

(declare-fun b!831737 () Bool)

(declare-fun e!463818 () Bool)

(assert (=> b!831737 (= e!463819 e!463818)))

(declare-fun res!566039 () Bool)

(assert (=> b!831737 (=> res!566039 e!463818)))

(assert (=> b!831737 (= res!566039 (= (h!17070 lt!376730) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(declare-fun b!831738 () Bool)

(assert (=> b!831738 (= e!463818 (contains!4209 (t!22310 lt!376730) (tuple2!10151 (_1!5086 lt!376679) (_2!5086 lt!376679))))))

(assert (= (and d!106291 res!566038) b!831737))

(assert (= (and b!831737 (not res!566039)) b!831738))

(declare-fun m!775639 () Bool)

(assert (=> d!106291 m!775639))

(declare-fun m!775641 () Bool)

(assert (=> d!106291 m!775641))

(declare-fun m!775643 () Bool)

(assert (=> b!831738 m!775643))

(assert (=> b!830621 d!106291))

(declare-fun b!831740 () Bool)

(declare-fun e!463820 () Option!421)

(declare-fun e!463821 () Option!421)

(assert (=> b!831740 (= e!463820 e!463821)))

(declare-fun c!90324 () Bool)

(assert (=> b!831740 (= c!90324 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376737))) (not (= (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376737)))) (_1!5086 lt!376679)))))))

(declare-fun b!831741 () Bool)

(assert (=> b!831741 (= e!463821 (getValueByKey!415 (t!22310 (t!22310 (toList!4502 lt!376737))) (_1!5086 lt!376679)))))

(declare-fun b!831742 () Bool)

(assert (=> b!831742 (= e!463821 None!419)))

(declare-fun b!831739 () Bool)

(assert (=> b!831739 (= e!463820 (Some!420 (_2!5086 (h!17070 (t!22310 (toList!4502 lt!376737))))))))

(declare-fun d!106293 () Bool)

(declare-fun c!90323 () Bool)

(assert (=> d!106293 (= c!90323 (and ((_ is Cons!15941) (t!22310 (toList!4502 lt!376737))) (= (_1!5086 (h!17070 (t!22310 (toList!4502 lt!376737)))) (_1!5086 lt!376679))))))

(assert (=> d!106293 (= (getValueByKey!415 (t!22310 (toList!4502 lt!376737)) (_1!5086 lt!376679)) e!463820)))

(assert (= (and d!106293 c!90323) b!831739))

(assert (= (and d!106293 (not c!90323)) b!831740))

(assert (= (and b!831740 c!90324) b!831741))

(assert (= (and b!831740 (not c!90324)) b!831742))

(declare-fun m!775645 () Bool)

(assert (=> b!831741 m!775645))

(assert (=> b!830700 d!106293))

(declare-fun b!831743 () Bool)

(declare-fun e!463823 () Bool)

(assert (=> b!831743 (= e!463823 tp_is_empty!15207)))

(declare-fun mapIsEmpty!24471 () Bool)

(declare-fun mapRes!24471 () Bool)

(assert (=> mapIsEmpty!24471 mapRes!24471))

(declare-fun b!831744 () Bool)

(declare-fun e!463822 () Bool)

(assert (=> b!831744 (= e!463822 tp_is_empty!15207)))

(declare-fun condMapEmpty!24471 () Bool)

(declare-fun mapDefault!24471 () ValueCell!7188)

(assert (=> mapNonEmpty!24470 (= condMapEmpty!24471 (= mapRest!24470 ((as const (Array (_ BitVec 32) ValueCell!7188)) mapDefault!24471)))))

(assert (=> mapNonEmpty!24470 (= tp!47288 (and e!463822 mapRes!24471))))

(declare-fun mapNonEmpty!24471 () Bool)

(declare-fun tp!47289 () Bool)

(assert (=> mapNonEmpty!24471 (= mapRes!24471 (and tp!47289 e!463823))))

(declare-fun mapKey!24471 () (_ BitVec 32))

(declare-fun mapRest!24471 () (Array (_ BitVec 32) ValueCell!7188))

(declare-fun mapValue!24471 () ValueCell!7188)

(assert (=> mapNonEmpty!24471 (= mapRest!24470 (store mapRest!24471 mapKey!24471 mapValue!24471))))

(assert (= (and mapNonEmpty!24470 condMapEmpty!24471) mapIsEmpty!24471))

(assert (= (and mapNonEmpty!24470 (not condMapEmpty!24471)) mapNonEmpty!24471))

(assert (= (and mapNonEmpty!24471 ((_ is ValueCellFull!7188) mapValue!24471)) b!831743))

(assert (= (and mapNonEmpty!24470 ((_ is ValueCellFull!7188) mapDefault!24471)) b!831744))

(declare-fun m!775647 () Bool)

(assert (=> mapNonEmpty!24471 m!775647))

(declare-fun b_lambda!11395 () Bool)

(assert (= b_lambda!11387 (or (and start!71488 b_free!13497) b_lambda!11395)))

(declare-fun b_lambda!11397 () Bool)

(assert (= b_lambda!11393 (or (and start!71488 b_free!13497) b_lambda!11397)))

(declare-fun b_lambda!11399 () Bool)

(assert (= b_lambda!11391 (or (and start!71488 b_free!13497) b_lambda!11399)))

(declare-fun b_lambda!11401 () Bool)

(assert (= b_lambda!11389 (or (and start!71488 b_free!13497) b_lambda!11401)))

(check-sat (not b!831296) (not b!831546) (not b!831293) (not b!831137) (not d!105609) (not b!831162) (not b!831173) (not b!831194) (not d!106055) (not d!105925) (not b!831341) (not b!831168) (not b!831402) (not b!830850) (not d!105791) (not b!831491) (not b!831551) (not d!105599) (not b_lambda!11401) (not b!831108) (not b!831049) (not b!831741) (not b!831339) (not b!831416) (not b!831171) (not b!831565) (not b!831662) (not d!105935) (not d!106159) (not b!830968) (not b!831456) (not d!106117) (not b_lambda!11385) (not d!106141) (not b!831147) (not b!831132) (not b!831680) (not b!831606) (not d!105693) (not b!830863) (not b!831578) (not b!831403) (not b!831317) (not b!831612) (not d!105823) (not d!106031) (not bm!36352) (not b!831126) (not b!831649) (not bm!36308) (not b!830983) (not d!106273) (not b!831184) (not d!106025) (not b!830937) (not d!105595) (not b!830790) (not b!831267) (not b!831421) (not b!831604) (not b!830817) (not d!105753) (not d!105845) (not b!831378) (not bm!36320) (not d!105647) (not b!830800) (not d!105927) (not b!831507) (not d!105963) (not d!106121) (not d!105897) (not d!105877) (not b!831063) (not b!831637) (not b!831079) (not b!830807) (not d!105625) (not b!831371) (not b!831548) (not b!831304) (not b!830909) (not b!831734) (not d!106015) (not b!831202) (not d!106267) (not bm!36339) (not b!831530) (not b!831673) (not b!831193) (not b!831205) (not b!831576) (not d!105757) (not d!105777) (not b!831704) (not b!831233) (not b!831528) (not d!105959) (not b!830780) (not b!831597) (not b!830948) (not b!831517) (not b!830803) (not d!105931) (not d!105687) (not b!830970) (not b!830997) (not d!106133) (not d!106279) (not d!106193) (not b!831136) (not d!106129) (not b!831506) (not b_lambda!11397) (not b!831709) (not b!831071) (not b!831570) (not b!831567) (not b!831719) (not d!105841) (not b!830979) (not d!106179) (not b!831380) (not b!831352) (not d!106163) (not b!831695) (not b!831076) (not d!105621) (not d!106075) (not d!106119) (not b!831738) (not b!831558) (not b!831431) (not d!106113) (not b!831226) (not b!831207) (not b!831676) (not b!831498) (not b_lambda!11369) (not b!831307) (not d!105799) (not b!830987) (not d!105723) (not b!831681) (not d!106249) (not b!831581) (not b!831308) (not b!831400) (not d!106261) (not b!831732) (not b!831237) (not d!105611) (not b!831234) (not b!831176) (not d!105629) (not b!831515) (not d!106087) (not d!105657) (not d!105869) (not b!831042) (not b!831050) (not b!830856) (not b!831204) (not bm!36289) (not d!105765) (not b!831105) (not b!830881) (not b_lambda!11381) (not b!830978) (not d!106265) (not b!831187) (not b!831603) (not d!106037) (not b!831090) (not b!831209) (not b!831706) (not b!831475) (not b!830798) (not b!831519) (not d!106023) (not b!831447) (not d!105701) (not d!106189) (not d!106143) (not d!105879) (not d!105893) (not b!831441) (not d!105779) (not d!105671) (not d!106079) (not b!831725) (not b_lambda!11365) (not b!830809) (not b!831650) (not b!831350) (not d!106263) (not d!105851) (not b!831670) (not d!105957) (not b!831521) (not b!831573) (not b!830943) (not b!830858) (not d!105721) (not b!830989) (not b!831379) tp_is_empty!15207 (not b_next!13497) (not b!831518) (not d!106139) (not b!830786) (not b!831526) (not b!831165) (not b!831460) (not b!831031) (not b!831068) (not d!105601) (not d!105985) (not b!830953) (not b!830950) (not b!831600) (not b!831104) (not b!831587) (not b!830818) (not b!830788) (not b!831625) (not d!105729) (not b!831225) (not b!831496) (not b!830895) (not b!831450) (not d!106003) (not d!105949) (not d!106225) (not d!106237) (not b!831102) (not b!831001) (not b!831036) (not b!831235) (not d!105759) (not d!105973) (not d!106287) (not b!831363) (not bm!36342) (not bm!36329) (not b!831116) (not b!831584) (not b!830992) (not b!831332) (not b!831729) (not b!831323) (not b!831216) (not b!831645) (not d!105809) (not d!105991) (not b!831543) (not b!830783) (not b!831651) (not b!831563) (not d!106137) (not d!106175) (not b!831280) (not b!830864) (not b!831524) (not b!831622) (not b!831434) (not bm!36298) (not b!831091) (not b!830890) (not b!831438) (not b!830892) (not b!830789) (not b!831542) (not bm!36295) (not b!831585) (not b_lambda!11367) (not b!831666) (not d!106221) (not b!831197) (not b_lambda!11359) (not b!831000) (not b!830841) (not d!106001) (not b!831479) (not b!831369) (not b!831119) (not d!106127) (not d!105905) (not d!106027) (not b!831678) (not d!106165) (not bm!36332) (not b!831246) (not b!830963) (not b!831699) (not d!106289) (not b!831394) (not b!831081) (not b!831494) (not b!831472) (not b!830912) (not b!831628) (not d!105837) (not b!831424) (not b!830854) (not b!831149) (not d!106217) (not d!105817) (not d!105787) (not b!831470) (not b!830866) (not b!830877) (not d!105977) (not b!831616) (not b_lambda!11361) (not d!105789) (not d!105631) (not b!830901) (not b!831326) (not d!105979) (not d!106035) (not d!105801) (not b!831697) (not b!831277) (not b!831275) (not b!831282) (not b!830967) (not b!830861) (not b!831302) (not d!105833) (not d!105913) (not b!831138) (not b!831392) (not b!831436) (not d!105855) (not d!105737) (not d!105717) (not b!831021) b_and!22557 (not d!106125) (not b!830985) (not d!106145) (not b!831210) (not d!105775) (not b!831360) (not b!831100) (not b!831046) (not b!830865) (not b!830805) (not b!831527) (not b!831406) (not bm!36326) (not d!106091) (not b!831560) (not b!831078) (not b!830903) (not bm!36335) (not b_lambda!11363) (not b_lambda!11379) (not d!105821) (not b!831634) (not b!830806) (not b!831034) (not b!831714) (not b!831419) (not b!831200) (not d!105909) (not b!831481) (not b!831306) (not d!105829) (not b!830999) (not b!831668) (not b!830945) (not b!830976) (not d!105747) (not d!105613) (not b!831691) (not b!831278) (not d!105743) (not b!831504) (not d!105805) (not b!830906) (not b!831358) (not b!830911) (not b!831013) (not b!831127) (not bm!36349) (not d!105867) (not b!830867) (not bm!36304) (not b!830933) (not b!831319) (not b!830972) (not d!105993) (not d!105615) (not d!105643) (not b!831538) (not d!106029) (not b!831716) (not b!831561) (not b!831048) (not d!106277) (not bm!36346) (not b!830952) (not b!831610) (not b!831114) (not d!106019) (not b!831231) (not d!105793) (not b!831671) (not d!105709) (not d!106255) (not b!831219) (not b!831453) (not b!830980) (not d!105665) (not b!831608) (not b!831134) (not b!831321) (not b!831002) (not d!105891) (not b!831553) (not d!106057) (not b!831539) (not d!105857) (not d!105633) (not b!831586) (not b!831485) (not d!105691) (not d!106043) (not b!831123) (not b_lambda!11399) (not d!105703) (not b!831702) (not b!831299) (not b!831427) (not b!831617) (not b!830981) (not d!105843) (not d!105815) (not b!831390) (not b!830926) (not b!831550) (not bm!36317) (not d!106205) (not b!831395) (not d!105659) (not b!831529) (not d!106063) (not b!831642) (not b!831338) (not b!830908) (not d!106181) (not b!831074) (not b!830991) (not d!106059) (not b!831713) (not d!105967) (not b!831639) (not b!831659) (not b!831170) (not b!831117) (not d!105895) (not bm!36323) (not b!830808) (not bm!36305) (not b_lambda!11395) (not d!106115) (not d!106223) (not d!106291) (not b!831501) (not b!831109) (not b!831017) (not b!831089) (not b!831366) (not d!105835) (not d!105669) (not b!831381) (not d!106095) (not d!106243) (not b!830954) (not bm!36311) (not b!831631) (not b!831488) (not d!105883) (not b!830962) (not b!831101) (not b!831728) (not b!831459) (not b!831161) (not d!106229) (not d!105939) (not b!830930) (not d!105853) (not b!831180) (not b!831445) (not b!831190) (not d!106085) (not d!106021) (not d!105785) (not b!831228) (not b!830951) (not d!106171) (not b!831397) (not bm!36292) (not b!830845) (not b!831135) (not d!105937) (not b!830888) (not b!830966) (not b!831679) (not d!105983) (not d!106061) (not b!831428) (not d!105683) (not b!830847) (not b!831483) (not mapNonEmpty!24471) (not b!831218) (not b!831038) (not d!106109) (not b!831003) (not b!831640) (not b!831478) (not d!106009) (not b!831614) (not b!831159) (not d!105689) (not b!831112) (not b!830973) (not b!831693) (not b!831723) (not b!831544) (not b!831458) (not d!105707) (not b!830994) (not b!831028) (not d!105847) (not b!831290) (not d!106269) (not b!831721) (not b!831583) (not b!831288) (not d!105607) (not b!830922) (not d!105899) (not b!831664) (not b!831648) (not bm!36314) (not b!831129) (not b!831355) (not b!831601) (not d!105839) (not d!106131) (not b!831337) (not b!831443) (not b!831382) (not b!831335) (not b!831329) (not b!831330) (not b!831065) (not d!105807) (not b!831157) (not b!831213) (not bm!36345) (not b!831726) (not b!831285) (not b!831222) (not bm!36301) (not b!831439) (not d!106241) (not d!106147) (not b!831297) (not b!831373) (not b!831682) (not b!830899) (not b!831711) (not b!831039) (not b!831405) (not b!831505) (not b!831619) (not d!105921) (not b!831404) (not bm!36336) (not d!105969) (not d!105653) (not b!831707) (not d!106213) (not d!105965) (not d!105749) (not bm!36355) (not b!830982) (not b!831555) (not b!831236) (not b!830941) (not b!831160) (not d!105605) (not b!831557) (not b!831647) (not b!831376) (not b!831340) (not d!105825) (not b!831305) (not d!105761) (not b_lambda!11383) (not b!831736) (not b!831503) (not b!831575) (not b!831106) (not b!831549) (not b!831155) (not b!831080) (not d!105915) (not bm!36286) (not b!830819) (not b!830910))
(check-sat b_and!22557 (not b_next!13497))
