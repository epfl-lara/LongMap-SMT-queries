; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71404 () Bool)

(assert start!71404)

(declare-fun b_free!13467 () Bool)

(declare-fun b_next!13467 () Bool)

(assert (=> start!71404 (= b_free!13467 (not b_next!13467))))

(declare-fun tp!47178 () Bool)

(declare-fun b_and!22461 () Bool)

(assert (=> start!71404 (= tp!47178 b_and!22461)))

(declare-fun b!829262 () Bool)

(declare-fun e!462215 () Bool)

(declare-fun tp_is_empty!15177 () Bool)

(assert (=> b!829262 (= e!462215 tp_is_empty!15177)))

(declare-fun e!462212 () Bool)

(declare-datatypes ((array!46518 0))(
  ( (array!46519 (arr!22298 (Array (_ BitVec 32) (_ BitVec 64))) (size!22719 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46518)

(declare-datatypes ((V!25237 0))(
  ( (V!25238 (val!7636 Int)) )
))
(declare-fun zeroValueAfter!34 () V!25237)

(declare-fun minValue!754 () V!25237)

(declare-datatypes ((ValueCell!7173 0))(
  ( (ValueCellFull!7173 (v!10075 V!25237)) (EmptyCell!7173) )
))
(declare-datatypes ((array!46520 0))(
  ( (array!46521 (arr!22299 (Array (_ BitVec 32) ValueCell!7173)) (size!22720 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46520)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun b!829263 () Bool)

(declare-datatypes ((tuple2!10126 0))(
  ( (tuple2!10127 (_1!5074 (_ BitVec 64)) (_2!5074 V!25237)) )
))
(declare-datatypes ((List!15919 0))(
  ( (Nil!15916) (Cons!15915 (h!17044 tuple2!10126) (t!22278 List!15919)) )
))
(declare-datatypes ((ListLongMap!8949 0))(
  ( (ListLongMap!8950 (toList!4490 List!15919)) )
))
(declare-fun lt!375980 () ListLongMap!8949)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2590 (array!46518 array!46520 (_ BitVec 32) (_ BitVec 32) V!25237 V!25237 (_ BitVec 32) Int) ListLongMap!8949)

(declare-fun +!1971 (ListLongMap!8949 tuple2!10126) ListLongMap!8949)

(assert (=> b!829263 (= e!462212 (= (getCurrentListMap!2590 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1971 (+!1971 lt!375980 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829264 () Bool)

(declare-fun e!462209 () Bool)

(declare-fun e!462216 () Bool)

(assert (=> b!829264 (= e!462209 e!462216)))

(declare-fun res!564945 () Bool)

(assert (=> b!829264 (=> res!564945 e!462216)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!829264 (= res!564945 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829265 () Bool)

(declare-fun e!462213 () Bool)

(assert (=> b!829265 (= e!462213 (not e!462212))))

(declare-fun res!564949 () Bool)

(assert (=> b!829265 (=> res!564949 e!462212)))

(assert (=> b!829265 (= res!564949 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> b!829265 e!462209))

(declare-fun res!564950 () Bool)

(assert (=> b!829265 (=> (not res!564950) (not e!462209))))

(declare-fun lt!375981 () ListLongMap!8949)

(assert (=> b!829265 (= res!564950 (= lt!375980 lt!375981))))

(declare-fun zeroValueBefore!34 () V!25237)

(declare-datatypes ((Unit!28401 0))(
  ( (Unit!28402) )
))
(declare-fun lt!375979 () Unit!28401)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!578 (array!46518 array!46520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25237 V!25237 V!25237 V!25237 (_ BitVec 32) Int) Unit!28401)

(assert (=> b!829265 (= lt!375979 (lemmaNoChangeToArrayThenSameMapNoExtras!578 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2490 (array!46518 array!46520 (_ BitVec 32) (_ BitVec 32) V!25237 V!25237 (_ BitVec 32) Int) ListLongMap!8949)

(assert (=> b!829265 (= lt!375981 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829265 (= lt!375980 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829266 () Bool)

(declare-fun e!462211 () Bool)

(assert (=> b!829266 (= e!462211 tp_is_empty!15177)))

(declare-fun b!829267 () Bool)

(declare-fun res!564947 () Bool)

(assert (=> b!829267 (=> (not res!564947) (not e!462213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46518 (_ BitVec 32)) Bool)

(assert (=> b!829267 (= res!564947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!829268 () Bool)

(declare-fun res!564946 () Bool)

(assert (=> b!829268 (=> (not res!564946) (not e!462213))))

(assert (=> b!829268 (= res!564946 (and (= (size!22720 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22719 _keys!976) (size!22720 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829269 () Bool)

(assert (=> b!829269 (= e!462216 (= (getCurrentListMap!2590 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1971 lt!375980 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun mapNonEmpty!24409 () Bool)

(declare-fun mapRes!24409 () Bool)

(declare-fun tp!47179 () Bool)

(assert (=> mapNonEmpty!24409 (= mapRes!24409 (and tp!47179 e!462215))))

(declare-fun mapValue!24409 () ValueCell!7173)

(declare-fun mapKey!24409 () (_ BitVec 32))

(declare-fun mapRest!24409 () (Array (_ BitVec 32) ValueCell!7173))

(assert (=> mapNonEmpty!24409 (= (arr!22299 _values!788) (store mapRest!24409 mapKey!24409 mapValue!24409))))

(declare-fun b!829271 () Bool)

(declare-fun res!564948 () Bool)

(assert (=> b!829271 (=> (not res!564948) (not e!462213))))

(declare-datatypes ((List!15920 0))(
  ( (Nil!15917) (Cons!15916 (h!17045 (_ BitVec 64)) (t!22279 List!15920)) )
))
(declare-fun arrayNoDuplicates!0 (array!46518 (_ BitVec 32) List!15920) Bool)

(assert (=> b!829271 (= res!564948 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15917))))

(declare-fun mapIsEmpty!24409 () Bool)

(assert (=> mapIsEmpty!24409 mapRes!24409))

(declare-fun b!829270 () Bool)

(declare-fun e!462210 () Bool)

(assert (=> b!829270 (= e!462210 (and e!462211 mapRes!24409))))

(declare-fun condMapEmpty!24409 () Bool)

(declare-fun mapDefault!24409 () ValueCell!7173)

(assert (=> b!829270 (= condMapEmpty!24409 (= (arr!22299 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7173)) mapDefault!24409)))))

(declare-fun res!564951 () Bool)

(assert (=> start!71404 (=> (not res!564951) (not e!462213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71404 (= res!564951 (validMask!0 mask!1312))))

(assert (=> start!71404 e!462213))

(assert (=> start!71404 tp_is_empty!15177))

(declare-fun array_inv!17761 (array!46518) Bool)

(assert (=> start!71404 (array_inv!17761 _keys!976)))

(assert (=> start!71404 true))

(declare-fun array_inv!17762 (array!46520) Bool)

(assert (=> start!71404 (and (array_inv!17762 _values!788) e!462210)))

(assert (=> start!71404 tp!47178))

(assert (= (and start!71404 res!564951) b!829268))

(assert (= (and b!829268 res!564946) b!829267))

(assert (= (and b!829267 res!564947) b!829271))

(assert (= (and b!829271 res!564948) b!829265))

(assert (= (and b!829265 res!564950) b!829264))

(assert (= (and b!829264 (not res!564945)) b!829269))

(assert (= (and b!829265 (not res!564949)) b!829263))

(assert (= (and b!829270 condMapEmpty!24409) mapIsEmpty!24409))

(assert (= (and b!829270 (not condMapEmpty!24409)) mapNonEmpty!24409))

(get-info :version)

(assert (= (and mapNonEmpty!24409 ((_ is ValueCellFull!7173) mapValue!24409)) b!829262))

(assert (= (and b!829270 ((_ is ValueCellFull!7173) mapDefault!24409)) b!829266))

(assert (= start!71404 b!829270))

(declare-fun m!772235 () Bool)

(assert (=> mapNonEmpty!24409 m!772235))

(declare-fun m!772237 () Bool)

(assert (=> b!829271 m!772237))

(declare-fun m!772239 () Bool)

(assert (=> b!829263 m!772239))

(declare-fun m!772241 () Bool)

(assert (=> b!829263 m!772241))

(assert (=> b!829263 m!772241))

(declare-fun m!772243 () Bool)

(assert (=> b!829263 m!772243))

(declare-fun m!772245 () Bool)

(assert (=> b!829267 m!772245))

(declare-fun m!772247 () Bool)

(assert (=> b!829265 m!772247))

(declare-fun m!772249 () Bool)

(assert (=> b!829265 m!772249))

(declare-fun m!772251 () Bool)

(assert (=> b!829265 m!772251))

(declare-fun m!772253 () Bool)

(assert (=> start!71404 m!772253))

(declare-fun m!772255 () Bool)

(assert (=> start!71404 m!772255))

(declare-fun m!772257 () Bool)

(assert (=> start!71404 m!772257))

(declare-fun m!772259 () Bool)

(assert (=> b!829269 m!772259))

(declare-fun m!772261 () Bool)

(assert (=> b!829269 m!772261))

(check-sat (not b!829269) (not mapNonEmpty!24409) (not b!829263) (not start!71404) (not b!829265) tp_is_empty!15177 (not b!829267) (not b_next!13467) (not b!829271) b_and!22461)
(check-sat b_and!22461 (not b_next!13467))
(get-model)

(declare-fun b!829310 () Bool)

(declare-fun e!462247 () Bool)

(declare-fun e!462248 () Bool)

(assert (=> b!829310 (= e!462247 e!462248)))

(declare-fun c!89731 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!829310 (= c!89731 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36108 () Bool)

(declare-fun call!36111 () Bool)

(assert (=> bm!36108 (= call!36111 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!829311 () Bool)

(assert (=> b!829311 (= e!462248 call!36111)))

(declare-fun b!829312 () Bool)

(declare-fun e!462249 () Bool)

(assert (=> b!829312 (= e!462248 e!462249)))

(declare-fun lt!375999 () (_ BitVec 64))

(assert (=> b!829312 (= lt!375999 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375997 () Unit!28401)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46518 (_ BitVec 64) (_ BitVec 32)) Unit!28401)

(assert (=> b!829312 (= lt!375997 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!375999 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!829312 (arrayContainsKey!0 _keys!976 lt!375999 #b00000000000000000000000000000000)))

(declare-fun lt!375998 () Unit!28401)

(assert (=> b!829312 (= lt!375998 lt!375997)))

(declare-fun res!564977 () Bool)

(declare-datatypes ((SeekEntryResult!8741 0))(
  ( (MissingZero!8741 (index!37335 (_ BitVec 32))) (Found!8741 (index!37336 (_ BitVec 32))) (Intermediate!8741 (undefined!9553 Bool) (index!37337 (_ BitVec 32)) (x!70033 (_ BitVec 32))) (Undefined!8741) (MissingVacant!8741 (index!37338 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46518 (_ BitVec 32)) SeekEntryResult!8741)

(assert (=> b!829312 (= res!564977 (= (seekEntryOrOpen!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8741 #b00000000000000000000000000000000)))))

(assert (=> b!829312 (=> (not res!564977) (not e!462249))))

(declare-fun d!105249 () Bool)

(declare-fun res!564978 () Bool)

(assert (=> d!105249 (=> res!564978 e!462247)))

(assert (=> d!105249 (= res!564978 (bvsge #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(assert (=> d!105249 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!462247)))

(declare-fun b!829313 () Bool)

(assert (=> b!829313 (= e!462249 call!36111)))

(assert (= (and d!105249 (not res!564978)) b!829310))

(assert (= (and b!829310 c!89731) b!829312))

(assert (= (and b!829310 (not c!89731)) b!829311))

(assert (= (and b!829312 res!564977) b!829313))

(assert (= (or b!829313 b!829311) bm!36108))

(declare-fun m!772291 () Bool)

(assert (=> b!829310 m!772291))

(assert (=> b!829310 m!772291))

(declare-fun m!772293 () Bool)

(assert (=> b!829310 m!772293))

(declare-fun m!772295 () Bool)

(assert (=> bm!36108 m!772295))

(assert (=> b!829312 m!772291))

(declare-fun m!772297 () Bool)

(assert (=> b!829312 m!772297))

(declare-fun m!772299 () Bool)

(assert (=> b!829312 m!772299))

(assert (=> b!829312 m!772291))

(declare-fun m!772301 () Bool)

(assert (=> b!829312 m!772301))

(assert (=> b!829267 d!105249))

(declare-fun b!829324 () Bool)

(declare-fun e!462259 () Bool)

(declare-fun e!462261 () Bool)

(assert (=> b!829324 (= e!462259 e!462261)))

(declare-fun c!89734 () Bool)

(assert (=> b!829324 (= c!89734 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829325 () Bool)

(declare-fun call!36114 () Bool)

(assert (=> b!829325 (= e!462261 call!36114)))

(declare-fun b!829327 () Bool)

(declare-fun e!462260 () Bool)

(declare-fun contains!4199 (List!15920 (_ BitVec 64)) Bool)

(assert (=> b!829327 (= e!462260 (contains!4199 Nil!15917 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829326 () Bool)

(declare-fun e!462258 () Bool)

(assert (=> b!829326 (= e!462258 e!462259)))

(declare-fun res!564985 () Bool)

(assert (=> b!829326 (=> (not res!564985) (not e!462259))))

(assert (=> b!829326 (= res!564985 (not e!462260))))

(declare-fun res!564987 () Bool)

(assert (=> b!829326 (=> (not res!564987) (not e!462260))))

(assert (=> b!829326 (= res!564987 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105251 () Bool)

(declare-fun res!564986 () Bool)

(assert (=> d!105251 (=> res!564986 e!462258)))

(assert (=> d!105251 (= res!564986 (bvsge #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(assert (=> d!105251 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15917) e!462258)))

(declare-fun bm!36111 () Bool)

(assert (=> bm!36111 (= call!36114 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89734 (Cons!15916 (select (arr!22298 _keys!976) #b00000000000000000000000000000000) Nil!15917) Nil!15917)))))

(declare-fun b!829328 () Bool)

(assert (=> b!829328 (= e!462261 call!36114)))

(assert (= (and d!105251 (not res!564986)) b!829326))

(assert (= (and b!829326 res!564987) b!829327))

(assert (= (and b!829326 res!564985) b!829324))

(assert (= (and b!829324 c!89734) b!829328))

(assert (= (and b!829324 (not c!89734)) b!829325))

(assert (= (or b!829328 b!829325) bm!36111))

(assert (=> b!829324 m!772291))

(assert (=> b!829324 m!772291))

(assert (=> b!829324 m!772293))

(assert (=> b!829327 m!772291))

(assert (=> b!829327 m!772291))

(declare-fun m!772303 () Bool)

(assert (=> b!829327 m!772303))

(assert (=> b!829326 m!772291))

(assert (=> b!829326 m!772291))

(assert (=> b!829326 m!772293))

(assert (=> bm!36111 m!772291))

(declare-fun m!772305 () Bool)

(assert (=> bm!36111 m!772305))

(assert (=> b!829271 d!105251))

(declare-fun b!829371 () Bool)

(declare-fun e!462294 () Bool)

(declare-fun e!462292 () Bool)

(assert (=> b!829371 (= e!462294 e!462292)))

(declare-fun res!565014 () Bool)

(assert (=> b!829371 (=> (not res!565014) (not e!462292))))

(declare-fun lt!376049 () ListLongMap!8949)

(declare-fun contains!4200 (ListLongMap!8949 (_ BitVec 64)) Bool)

(assert (=> b!829371 (= res!565014 (contains!4200 lt!376049 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829371 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(declare-fun b!829372 () Bool)

(declare-fun e!462297 () ListLongMap!8949)

(declare-fun e!462299 () ListLongMap!8949)

(assert (=> b!829372 (= e!462297 e!462299)))

(declare-fun c!89747 () Bool)

(assert (=> b!829372 (= c!89747 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!36126 () Bool)

(declare-fun call!36134 () ListLongMap!8949)

(assert (=> bm!36126 (= call!36134 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!36127 () Bool)

(declare-fun call!36130 () ListLongMap!8949)

(declare-fun call!36133 () ListLongMap!8949)

(assert (=> bm!36127 (= call!36130 call!36133)))

(declare-fun bm!36128 () Bool)

(declare-fun call!36135 () ListLongMap!8949)

(assert (=> bm!36128 (= call!36135 call!36134)))

(declare-fun b!829373 () Bool)

(assert (=> b!829373 (= e!462299 call!36130)))

(declare-fun b!829374 () Bool)

(declare-fun apply!369 (ListLongMap!8949 (_ BitVec 64)) V!25237)

(declare-fun get!11804 (ValueCell!7173 V!25237) V!25237)

(declare-fun dynLambda!980 (Int (_ BitVec 64)) V!25237)

(assert (=> b!829374 (= e!462292 (= (apply!369 lt!376049 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)) (get!11804 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829374 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22720 _values!788)))))

(assert (=> b!829374 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(declare-fun b!829375 () Bool)

(declare-fun e!462288 () Bool)

(assert (=> b!829375 (= e!462288 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829376 () Bool)

(declare-fun res!565011 () Bool)

(declare-fun e!462291 () Bool)

(assert (=> b!829376 (=> (not res!565011) (not e!462291))))

(assert (=> b!829376 (= res!565011 e!462294)))

(declare-fun res!565013 () Bool)

(assert (=> b!829376 (=> res!565013 e!462294)))

(declare-fun e!462295 () Bool)

(assert (=> b!829376 (= res!565013 (not e!462295))))

(declare-fun res!565006 () Bool)

(assert (=> b!829376 (=> (not res!565006) (not e!462295))))

(assert (=> b!829376 (= res!565006 (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(declare-fun b!829377 () Bool)

(declare-fun e!462293 () Bool)

(assert (=> b!829377 (= e!462293 (= (apply!369 lt!376049 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!829378 () Bool)

(declare-fun e!462300 () Bool)

(assert (=> b!829378 (= e!462291 e!462300)))

(declare-fun c!89749 () Bool)

(assert (=> b!829378 (= c!89749 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!105253 () Bool)

(assert (=> d!105253 e!462291))

(declare-fun res!565007 () Bool)

(assert (=> d!105253 (=> (not res!565007) (not e!462291))))

(assert (=> d!105253 (= res!565007 (or (bvsge #b00000000000000000000000000000000 (size!22719 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))))

(declare-fun lt!376054 () ListLongMap!8949)

(assert (=> d!105253 (= lt!376049 lt!376054)))

(declare-fun lt!376048 () Unit!28401)

(declare-fun e!462296 () Unit!28401)

(assert (=> d!105253 (= lt!376048 e!462296)))

(declare-fun c!89752 () Bool)

(assert (=> d!105253 (= c!89752 e!462288)))

(declare-fun res!565012 () Bool)

(assert (=> d!105253 (=> (not res!565012) (not e!462288))))

(assert (=> d!105253 (= res!565012 (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(assert (=> d!105253 (= lt!376054 e!462297)))

(declare-fun c!89751 () Bool)

(assert (=> d!105253 (= c!89751 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105253 (validMask!0 mask!1312)))

(assert (=> d!105253 (= (getCurrentListMap!2590 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376049)))

(declare-fun b!829379 () Bool)

(declare-fun c!89748 () Bool)

(assert (=> b!829379 (= c!89748 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!462298 () ListLongMap!8949)

(assert (=> b!829379 (= e!462299 e!462298)))

(declare-fun bm!36129 () Bool)

(declare-fun call!36131 () Bool)

(assert (=> bm!36129 (= call!36131 (contains!4200 lt!376049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829380 () Bool)

(declare-fun Unit!28405 () Unit!28401)

(assert (=> b!829380 (= e!462296 Unit!28405)))

(declare-fun b!829381 () Bool)

(assert (=> b!829381 (= e!462297 (+!1971 call!36133 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!829382 () Bool)

(assert (=> b!829382 (= e!462295 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829383 () Bool)

(declare-fun call!36132 () ListLongMap!8949)

(assert (=> b!829383 (= e!462298 call!36132)))

(declare-fun b!829384 () Bool)

(declare-fun e!462289 () Bool)

(assert (=> b!829384 (= e!462289 e!462293)))

(declare-fun res!565009 () Bool)

(assert (=> b!829384 (= res!565009 call!36131)))

(assert (=> b!829384 (=> (not res!565009) (not e!462293))))

(declare-fun b!829385 () Bool)

(declare-fun e!462290 () Bool)

(assert (=> b!829385 (= e!462300 e!462290)))

(declare-fun res!565008 () Bool)

(declare-fun call!36129 () Bool)

(assert (=> b!829385 (= res!565008 call!36129)))

(assert (=> b!829385 (=> (not res!565008) (not e!462290))))

(declare-fun bm!36130 () Bool)

(assert (=> bm!36130 (= call!36129 (contains!4200 lt!376049 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829386 () Bool)

(declare-fun res!565010 () Bool)

(assert (=> b!829386 (=> (not res!565010) (not e!462291))))

(assert (=> b!829386 (= res!565010 e!462289)))

(declare-fun c!89750 () Bool)

(assert (=> b!829386 (= c!89750 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!829387 () Bool)

(assert (=> b!829387 (= e!462300 (not call!36129))))

(declare-fun b!829388 () Bool)

(declare-fun lt!376062 () Unit!28401)

(assert (=> b!829388 (= e!462296 lt!376062)))

(declare-fun lt!376060 () ListLongMap!8949)

(assert (=> b!829388 (= lt!376060 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376047 () (_ BitVec 64))

(assert (=> b!829388 (= lt!376047 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376059 () (_ BitVec 64))

(assert (=> b!829388 (= lt!376059 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376053 () Unit!28401)

(declare-fun addStillContains!320 (ListLongMap!8949 (_ BitVec 64) V!25237 (_ BitVec 64)) Unit!28401)

(assert (=> b!829388 (= lt!376053 (addStillContains!320 lt!376060 lt!376047 zeroValueAfter!34 lt!376059))))

(assert (=> b!829388 (contains!4200 (+!1971 lt!376060 (tuple2!10127 lt!376047 zeroValueAfter!34)) lt!376059)))

(declare-fun lt!376044 () Unit!28401)

(assert (=> b!829388 (= lt!376044 lt!376053)))

(declare-fun lt!376065 () ListLongMap!8949)

(assert (=> b!829388 (= lt!376065 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376051 () (_ BitVec 64))

(assert (=> b!829388 (= lt!376051 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376045 () (_ BitVec 64))

(assert (=> b!829388 (= lt!376045 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376063 () Unit!28401)

(declare-fun addApplyDifferent!320 (ListLongMap!8949 (_ BitVec 64) V!25237 (_ BitVec 64)) Unit!28401)

(assert (=> b!829388 (= lt!376063 (addApplyDifferent!320 lt!376065 lt!376051 minValue!754 lt!376045))))

(assert (=> b!829388 (= (apply!369 (+!1971 lt!376065 (tuple2!10127 lt!376051 minValue!754)) lt!376045) (apply!369 lt!376065 lt!376045))))

(declare-fun lt!376050 () Unit!28401)

(assert (=> b!829388 (= lt!376050 lt!376063)))

(declare-fun lt!376064 () ListLongMap!8949)

(assert (=> b!829388 (= lt!376064 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376046 () (_ BitVec 64))

(assert (=> b!829388 (= lt!376046 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376061 () (_ BitVec 64))

(assert (=> b!829388 (= lt!376061 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376058 () Unit!28401)

(assert (=> b!829388 (= lt!376058 (addApplyDifferent!320 lt!376064 lt!376046 zeroValueAfter!34 lt!376061))))

(assert (=> b!829388 (= (apply!369 (+!1971 lt!376064 (tuple2!10127 lt!376046 zeroValueAfter!34)) lt!376061) (apply!369 lt!376064 lt!376061))))

(declare-fun lt!376057 () Unit!28401)

(assert (=> b!829388 (= lt!376057 lt!376058)))

(declare-fun lt!376052 () ListLongMap!8949)

(assert (=> b!829388 (= lt!376052 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376055 () (_ BitVec 64))

(assert (=> b!829388 (= lt!376055 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376056 () (_ BitVec 64))

(assert (=> b!829388 (= lt!376056 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829388 (= lt!376062 (addApplyDifferent!320 lt!376052 lt!376055 minValue!754 lt!376056))))

(assert (=> b!829388 (= (apply!369 (+!1971 lt!376052 (tuple2!10127 lt!376055 minValue!754)) lt!376056) (apply!369 lt!376052 lt!376056))))

(declare-fun b!829389 () Bool)

(assert (=> b!829389 (= e!462290 (= (apply!369 lt!376049 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829390 () Bool)

(assert (=> b!829390 (= e!462289 (not call!36131))))

(declare-fun bm!36131 () Bool)

(assert (=> bm!36131 (= call!36132 call!36135)))

(declare-fun bm!36132 () Bool)

(assert (=> bm!36132 (= call!36133 (+!1971 (ite c!89751 call!36134 (ite c!89747 call!36135 call!36132)) (ite (or c!89751 c!89747) (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829391 () Bool)

(assert (=> b!829391 (= e!462298 call!36130)))

(assert (= (and d!105253 c!89751) b!829381))

(assert (= (and d!105253 (not c!89751)) b!829372))

(assert (= (and b!829372 c!89747) b!829373))

(assert (= (and b!829372 (not c!89747)) b!829379))

(assert (= (and b!829379 c!89748) b!829391))

(assert (= (and b!829379 (not c!89748)) b!829383))

(assert (= (or b!829391 b!829383) bm!36131))

(assert (= (or b!829373 bm!36131) bm!36128))

(assert (= (or b!829373 b!829391) bm!36127))

(assert (= (or b!829381 bm!36128) bm!36126))

(assert (= (or b!829381 bm!36127) bm!36132))

(assert (= (and d!105253 res!565012) b!829375))

(assert (= (and d!105253 c!89752) b!829388))

(assert (= (and d!105253 (not c!89752)) b!829380))

(assert (= (and d!105253 res!565007) b!829376))

(assert (= (and b!829376 res!565006) b!829382))

(assert (= (and b!829376 (not res!565013)) b!829371))

(assert (= (and b!829371 res!565014) b!829374))

(assert (= (and b!829376 res!565011) b!829386))

(assert (= (and b!829386 c!89750) b!829384))

(assert (= (and b!829386 (not c!89750)) b!829390))

(assert (= (and b!829384 res!565009) b!829377))

(assert (= (or b!829384 b!829390) bm!36129))

(assert (= (and b!829386 res!565010) b!829378))

(assert (= (and b!829378 c!89749) b!829385))

(assert (= (and b!829378 (not c!89749)) b!829387))

(assert (= (and b!829385 res!565008) b!829389))

(assert (= (or b!829385 b!829387) bm!36130))

(declare-fun b_lambda!11275 () Bool)

(assert (=> (not b_lambda!11275) (not b!829374)))

(declare-fun t!22282 () Bool)

(declare-fun tb!4219 () Bool)

(assert (=> (and start!71404 (= defaultEntry!796 defaultEntry!796) t!22282) tb!4219))

(declare-fun result!7997 () Bool)

(assert (=> tb!4219 (= result!7997 tp_is_empty!15177)))

(assert (=> b!829374 t!22282))

(declare-fun b_and!22465 () Bool)

(assert (= b_and!22461 (and (=> t!22282 result!7997) b_and!22465)))

(declare-fun m!772307 () Bool)

(assert (=> b!829374 m!772307))

(declare-fun m!772309 () Bool)

(assert (=> b!829374 m!772309))

(declare-fun m!772311 () Bool)

(assert (=> b!829374 m!772311))

(assert (=> b!829374 m!772309))

(assert (=> b!829374 m!772291))

(assert (=> b!829374 m!772307))

(assert (=> b!829374 m!772291))

(declare-fun m!772313 () Bool)

(assert (=> b!829374 m!772313))

(declare-fun m!772315 () Bool)

(assert (=> bm!36132 m!772315))

(assert (=> b!829371 m!772291))

(assert (=> b!829371 m!772291))

(declare-fun m!772317 () Bool)

(assert (=> b!829371 m!772317))

(assert (=> b!829375 m!772291))

(assert (=> b!829375 m!772291))

(assert (=> b!829375 m!772293))

(assert (=> d!105253 m!772253))

(declare-fun m!772319 () Bool)

(assert (=> bm!36130 m!772319))

(assert (=> bm!36126 m!772249))

(declare-fun m!772321 () Bool)

(assert (=> b!829389 m!772321))

(declare-fun m!772323 () Bool)

(assert (=> bm!36129 m!772323))

(declare-fun m!772325 () Bool)

(assert (=> b!829377 m!772325))

(assert (=> b!829382 m!772291))

(assert (=> b!829382 m!772291))

(assert (=> b!829382 m!772293))

(declare-fun m!772327 () Bool)

(assert (=> b!829381 m!772327))

(declare-fun m!772329 () Bool)

(assert (=> b!829388 m!772329))

(declare-fun m!772331 () Bool)

(assert (=> b!829388 m!772331))

(declare-fun m!772333 () Bool)

(assert (=> b!829388 m!772333))

(declare-fun m!772335 () Bool)

(assert (=> b!829388 m!772335))

(declare-fun m!772337 () Bool)

(assert (=> b!829388 m!772337))

(declare-fun m!772339 () Bool)

(assert (=> b!829388 m!772339))

(declare-fun m!772341 () Bool)

(assert (=> b!829388 m!772341))

(assert (=> b!829388 m!772291))

(declare-fun m!772343 () Bool)

(assert (=> b!829388 m!772343))

(declare-fun m!772345 () Bool)

(assert (=> b!829388 m!772345))

(assert (=> b!829388 m!772339))

(declare-fun m!772347 () Bool)

(assert (=> b!829388 m!772347))

(declare-fun m!772349 () Bool)

(assert (=> b!829388 m!772349))

(declare-fun m!772351 () Bool)

(assert (=> b!829388 m!772351))

(declare-fun m!772353 () Bool)

(assert (=> b!829388 m!772353))

(declare-fun m!772355 () Bool)

(assert (=> b!829388 m!772355))

(assert (=> b!829388 m!772343))

(assert (=> b!829388 m!772335))

(declare-fun m!772357 () Bool)

(assert (=> b!829388 m!772357))

(assert (=> b!829388 m!772329))

(assert (=> b!829388 m!772249))

(assert (=> b!829263 d!105253))

(declare-fun d!105255 () Bool)

(declare-fun e!462303 () Bool)

(assert (=> d!105255 e!462303))

(declare-fun res!565019 () Bool)

(assert (=> d!105255 (=> (not res!565019) (not e!462303))))

(declare-fun lt!376076 () ListLongMap!8949)

(assert (=> d!105255 (= res!565019 (contains!4200 lt!376076 (_1!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376074 () List!15919)

(assert (=> d!105255 (= lt!376076 (ListLongMap!8950 lt!376074))))

(declare-fun lt!376075 () Unit!28401)

(declare-fun lt!376077 () Unit!28401)

(assert (=> d!105255 (= lt!376075 lt!376077)))

(declare-datatypes ((Option!418 0))(
  ( (Some!417 (v!10077 V!25237)) (None!416) )
))
(declare-fun getValueByKey!412 (List!15919 (_ BitVec 64)) Option!418)

(assert (=> d!105255 (= (getValueByKey!412 lt!376074 (_1!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!417 (_2!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lemmaContainsTupThenGetReturnValue!226 (List!15919 (_ BitVec 64) V!25237) Unit!28401)

(assert (=> d!105255 (= lt!376077 (lemmaContainsTupThenGetReturnValue!226 lt!376074 (_1!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun insertStrictlySorted!265 (List!15919 (_ BitVec 64) V!25237) List!15919)

(assert (=> d!105255 (= lt!376074 (insertStrictlySorted!265 (toList!4490 (+!1971 lt!375980 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105255 (= (+!1971 (+!1971 lt!375980 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376076)))

(declare-fun b!829398 () Bool)

(declare-fun res!565020 () Bool)

(assert (=> b!829398 (=> (not res!565020) (not e!462303))))

(assert (=> b!829398 (= res!565020 (= (getValueByKey!412 (toList!4490 lt!376076) (_1!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!417 (_2!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!829399 () Bool)

(declare-fun contains!4201 (List!15919 tuple2!10126) Bool)

(assert (=> b!829399 (= e!462303 (contains!4201 (toList!4490 lt!376076) (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105255 res!565019) b!829398))

(assert (= (and b!829398 res!565020) b!829399))

(declare-fun m!772359 () Bool)

(assert (=> d!105255 m!772359))

(declare-fun m!772361 () Bool)

(assert (=> d!105255 m!772361))

(declare-fun m!772363 () Bool)

(assert (=> d!105255 m!772363))

(declare-fun m!772365 () Bool)

(assert (=> d!105255 m!772365))

(declare-fun m!772367 () Bool)

(assert (=> b!829398 m!772367))

(declare-fun m!772369 () Bool)

(assert (=> b!829399 m!772369))

(assert (=> b!829263 d!105255))

(declare-fun d!105257 () Bool)

(declare-fun e!462304 () Bool)

(assert (=> d!105257 e!462304))

(declare-fun res!565021 () Bool)

(assert (=> d!105257 (=> (not res!565021) (not e!462304))))

(declare-fun lt!376080 () ListLongMap!8949)

(assert (=> d!105257 (= res!565021 (contains!4200 lt!376080 (_1!5074 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!376078 () List!15919)

(assert (=> d!105257 (= lt!376080 (ListLongMap!8950 lt!376078))))

(declare-fun lt!376079 () Unit!28401)

(declare-fun lt!376081 () Unit!28401)

(assert (=> d!105257 (= lt!376079 lt!376081)))

(assert (=> d!105257 (= (getValueByKey!412 lt!376078 (_1!5074 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!417 (_2!5074 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105257 (= lt!376081 (lemmaContainsTupThenGetReturnValue!226 lt!376078 (_1!5074 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5074 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105257 (= lt!376078 (insertStrictlySorted!265 (toList!4490 lt!375980) (_1!5074 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5074 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105257 (= (+!1971 lt!375980 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376080)))

(declare-fun b!829400 () Bool)

(declare-fun res!565022 () Bool)

(assert (=> b!829400 (=> (not res!565022) (not e!462304))))

(assert (=> b!829400 (= res!565022 (= (getValueByKey!412 (toList!4490 lt!376080) (_1!5074 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!417 (_2!5074 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!829401 () Bool)

(assert (=> b!829401 (= e!462304 (contains!4201 (toList!4490 lt!376080) (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105257 res!565021) b!829400))

(assert (= (and b!829400 res!565022) b!829401))

(declare-fun m!772371 () Bool)

(assert (=> d!105257 m!772371))

(declare-fun m!772373 () Bool)

(assert (=> d!105257 m!772373))

(declare-fun m!772375 () Bool)

(assert (=> d!105257 m!772375))

(declare-fun m!772377 () Bool)

(assert (=> d!105257 m!772377))

(declare-fun m!772379 () Bool)

(assert (=> b!829400 m!772379))

(declare-fun m!772381 () Bool)

(assert (=> b!829401 m!772381))

(assert (=> b!829263 d!105257))

(declare-fun d!105259 () Bool)

(assert (=> d!105259 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71404 d!105259))

(declare-fun d!105261 () Bool)

(assert (=> d!105261 (= (array_inv!17761 _keys!976) (bvsge (size!22719 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71404 d!105261))

(declare-fun d!105263 () Bool)

(assert (=> d!105263 (= (array_inv!17762 _values!788) (bvsge (size!22720 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71404 d!105263))

(declare-fun b!829402 () Bool)

(declare-fun e!462311 () Bool)

(declare-fun e!462309 () Bool)

(assert (=> b!829402 (= e!462311 e!462309)))

(declare-fun res!565031 () Bool)

(assert (=> b!829402 (=> (not res!565031) (not e!462309))))

(declare-fun lt!376087 () ListLongMap!8949)

(assert (=> b!829402 (= res!565031 (contains!4200 lt!376087 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829402 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(declare-fun b!829403 () Bool)

(declare-fun e!462314 () ListLongMap!8949)

(declare-fun e!462316 () ListLongMap!8949)

(assert (=> b!829403 (= e!462314 e!462316)))

(declare-fun c!89753 () Bool)

(assert (=> b!829403 (= c!89753 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!36141 () ListLongMap!8949)

(declare-fun bm!36133 () Bool)

(assert (=> bm!36133 (= call!36141 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!36134 () Bool)

(declare-fun call!36137 () ListLongMap!8949)

(declare-fun call!36140 () ListLongMap!8949)

(assert (=> bm!36134 (= call!36137 call!36140)))

(declare-fun bm!36135 () Bool)

(declare-fun call!36142 () ListLongMap!8949)

(assert (=> bm!36135 (= call!36142 call!36141)))

(declare-fun b!829404 () Bool)

(assert (=> b!829404 (= e!462316 call!36137)))

(declare-fun b!829405 () Bool)

(assert (=> b!829405 (= e!462309 (= (apply!369 lt!376087 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)) (get!11804 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829405 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22720 _values!788)))))

(assert (=> b!829405 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(declare-fun b!829406 () Bool)

(declare-fun e!462305 () Bool)

(assert (=> b!829406 (= e!462305 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829407 () Bool)

(declare-fun res!565028 () Bool)

(declare-fun e!462308 () Bool)

(assert (=> b!829407 (=> (not res!565028) (not e!462308))))

(assert (=> b!829407 (= res!565028 e!462311)))

(declare-fun res!565030 () Bool)

(assert (=> b!829407 (=> res!565030 e!462311)))

(declare-fun e!462312 () Bool)

(assert (=> b!829407 (= res!565030 (not e!462312))))

(declare-fun res!565023 () Bool)

(assert (=> b!829407 (=> (not res!565023) (not e!462312))))

(assert (=> b!829407 (= res!565023 (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(declare-fun b!829408 () Bool)

(declare-fun e!462310 () Bool)

(assert (=> b!829408 (= e!462310 (= (apply!369 lt!376087 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!829409 () Bool)

(declare-fun e!462317 () Bool)

(assert (=> b!829409 (= e!462308 e!462317)))

(declare-fun c!89755 () Bool)

(assert (=> b!829409 (= c!89755 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!105265 () Bool)

(assert (=> d!105265 e!462308))

(declare-fun res!565024 () Bool)

(assert (=> d!105265 (=> (not res!565024) (not e!462308))))

(assert (=> d!105265 (= res!565024 (or (bvsge #b00000000000000000000000000000000 (size!22719 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))))

(declare-fun lt!376092 () ListLongMap!8949)

(assert (=> d!105265 (= lt!376087 lt!376092)))

(declare-fun lt!376086 () Unit!28401)

(declare-fun e!462313 () Unit!28401)

(assert (=> d!105265 (= lt!376086 e!462313)))

(declare-fun c!89758 () Bool)

(assert (=> d!105265 (= c!89758 e!462305)))

(declare-fun res!565029 () Bool)

(assert (=> d!105265 (=> (not res!565029) (not e!462305))))

(assert (=> d!105265 (= res!565029 (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(assert (=> d!105265 (= lt!376092 e!462314)))

(declare-fun c!89757 () Bool)

(assert (=> d!105265 (= c!89757 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105265 (validMask!0 mask!1312)))

(assert (=> d!105265 (= (getCurrentListMap!2590 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376087)))

(declare-fun b!829410 () Bool)

(declare-fun c!89754 () Bool)

(assert (=> b!829410 (= c!89754 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!462315 () ListLongMap!8949)

(assert (=> b!829410 (= e!462316 e!462315)))

(declare-fun bm!36136 () Bool)

(declare-fun call!36138 () Bool)

(assert (=> bm!36136 (= call!36138 (contains!4200 lt!376087 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829411 () Bool)

(declare-fun Unit!28406 () Unit!28401)

(assert (=> b!829411 (= e!462313 Unit!28406)))

(declare-fun b!829412 () Bool)

(assert (=> b!829412 (= e!462314 (+!1971 call!36140 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!829413 () Bool)

(assert (=> b!829413 (= e!462312 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829414 () Bool)

(declare-fun call!36139 () ListLongMap!8949)

(assert (=> b!829414 (= e!462315 call!36139)))

(declare-fun b!829415 () Bool)

(declare-fun e!462306 () Bool)

(assert (=> b!829415 (= e!462306 e!462310)))

(declare-fun res!565026 () Bool)

(assert (=> b!829415 (= res!565026 call!36138)))

(assert (=> b!829415 (=> (not res!565026) (not e!462310))))

(declare-fun b!829416 () Bool)

(declare-fun e!462307 () Bool)

(assert (=> b!829416 (= e!462317 e!462307)))

(declare-fun res!565025 () Bool)

(declare-fun call!36136 () Bool)

(assert (=> b!829416 (= res!565025 call!36136)))

(assert (=> b!829416 (=> (not res!565025) (not e!462307))))

(declare-fun bm!36137 () Bool)

(assert (=> bm!36137 (= call!36136 (contains!4200 lt!376087 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829417 () Bool)

(declare-fun res!565027 () Bool)

(assert (=> b!829417 (=> (not res!565027) (not e!462308))))

(assert (=> b!829417 (= res!565027 e!462306)))

(declare-fun c!89756 () Bool)

(assert (=> b!829417 (= c!89756 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!829418 () Bool)

(assert (=> b!829418 (= e!462317 (not call!36136))))

(declare-fun b!829419 () Bool)

(declare-fun lt!376100 () Unit!28401)

(assert (=> b!829419 (= e!462313 lt!376100)))

(declare-fun lt!376098 () ListLongMap!8949)

(assert (=> b!829419 (= lt!376098 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376085 () (_ BitVec 64))

(assert (=> b!829419 (= lt!376085 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376097 () (_ BitVec 64))

(assert (=> b!829419 (= lt!376097 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376091 () Unit!28401)

(assert (=> b!829419 (= lt!376091 (addStillContains!320 lt!376098 lt!376085 zeroValueBefore!34 lt!376097))))

(assert (=> b!829419 (contains!4200 (+!1971 lt!376098 (tuple2!10127 lt!376085 zeroValueBefore!34)) lt!376097)))

(declare-fun lt!376082 () Unit!28401)

(assert (=> b!829419 (= lt!376082 lt!376091)))

(declare-fun lt!376103 () ListLongMap!8949)

(assert (=> b!829419 (= lt!376103 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376089 () (_ BitVec 64))

(assert (=> b!829419 (= lt!376089 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376083 () (_ BitVec 64))

(assert (=> b!829419 (= lt!376083 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376101 () Unit!28401)

(assert (=> b!829419 (= lt!376101 (addApplyDifferent!320 lt!376103 lt!376089 minValue!754 lt!376083))))

(assert (=> b!829419 (= (apply!369 (+!1971 lt!376103 (tuple2!10127 lt!376089 minValue!754)) lt!376083) (apply!369 lt!376103 lt!376083))))

(declare-fun lt!376088 () Unit!28401)

(assert (=> b!829419 (= lt!376088 lt!376101)))

(declare-fun lt!376102 () ListLongMap!8949)

(assert (=> b!829419 (= lt!376102 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376084 () (_ BitVec 64))

(assert (=> b!829419 (= lt!376084 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376099 () (_ BitVec 64))

(assert (=> b!829419 (= lt!376099 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376096 () Unit!28401)

(assert (=> b!829419 (= lt!376096 (addApplyDifferent!320 lt!376102 lt!376084 zeroValueBefore!34 lt!376099))))

(assert (=> b!829419 (= (apply!369 (+!1971 lt!376102 (tuple2!10127 lt!376084 zeroValueBefore!34)) lt!376099) (apply!369 lt!376102 lt!376099))))

(declare-fun lt!376095 () Unit!28401)

(assert (=> b!829419 (= lt!376095 lt!376096)))

(declare-fun lt!376090 () ListLongMap!8949)

(assert (=> b!829419 (= lt!376090 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376093 () (_ BitVec 64))

(assert (=> b!829419 (= lt!376093 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376094 () (_ BitVec 64))

(assert (=> b!829419 (= lt!376094 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829419 (= lt!376100 (addApplyDifferent!320 lt!376090 lt!376093 minValue!754 lt!376094))))

(assert (=> b!829419 (= (apply!369 (+!1971 lt!376090 (tuple2!10127 lt!376093 minValue!754)) lt!376094) (apply!369 lt!376090 lt!376094))))

(declare-fun b!829420 () Bool)

(assert (=> b!829420 (= e!462307 (= (apply!369 lt!376087 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829421 () Bool)

(assert (=> b!829421 (= e!462306 (not call!36138))))

(declare-fun bm!36138 () Bool)

(assert (=> bm!36138 (= call!36139 call!36142)))

(declare-fun bm!36139 () Bool)

(assert (=> bm!36139 (= call!36140 (+!1971 (ite c!89757 call!36141 (ite c!89753 call!36142 call!36139)) (ite (or c!89757 c!89753) (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829422 () Bool)

(assert (=> b!829422 (= e!462315 call!36137)))

(assert (= (and d!105265 c!89757) b!829412))

(assert (= (and d!105265 (not c!89757)) b!829403))

(assert (= (and b!829403 c!89753) b!829404))

(assert (= (and b!829403 (not c!89753)) b!829410))

(assert (= (and b!829410 c!89754) b!829422))

(assert (= (and b!829410 (not c!89754)) b!829414))

(assert (= (or b!829422 b!829414) bm!36138))

(assert (= (or b!829404 bm!36138) bm!36135))

(assert (= (or b!829404 b!829422) bm!36134))

(assert (= (or b!829412 bm!36135) bm!36133))

(assert (= (or b!829412 bm!36134) bm!36139))

(assert (= (and d!105265 res!565029) b!829406))

(assert (= (and d!105265 c!89758) b!829419))

(assert (= (and d!105265 (not c!89758)) b!829411))

(assert (= (and d!105265 res!565024) b!829407))

(assert (= (and b!829407 res!565023) b!829413))

(assert (= (and b!829407 (not res!565030)) b!829402))

(assert (= (and b!829402 res!565031) b!829405))

(assert (= (and b!829407 res!565028) b!829417))

(assert (= (and b!829417 c!89756) b!829415))

(assert (= (and b!829417 (not c!89756)) b!829421))

(assert (= (and b!829415 res!565026) b!829408))

(assert (= (or b!829415 b!829421) bm!36136))

(assert (= (and b!829417 res!565027) b!829409))

(assert (= (and b!829409 c!89755) b!829416))

(assert (= (and b!829409 (not c!89755)) b!829418))

(assert (= (and b!829416 res!565025) b!829420))

(assert (= (or b!829416 b!829418) bm!36137))

(declare-fun b_lambda!11277 () Bool)

(assert (=> (not b_lambda!11277) (not b!829405)))

(assert (=> b!829405 t!22282))

(declare-fun b_and!22467 () Bool)

(assert (= b_and!22465 (and (=> t!22282 result!7997) b_and!22467)))

(assert (=> b!829405 m!772307))

(assert (=> b!829405 m!772309))

(assert (=> b!829405 m!772311))

(assert (=> b!829405 m!772309))

(assert (=> b!829405 m!772291))

(assert (=> b!829405 m!772307))

(assert (=> b!829405 m!772291))

(declare-fun m!772383 () Bool)

(assert (=> b!829405 m!772383))

(declare-fun m!772385 () Bool)

(assert (=> bm!36139 m!772385))

(assert (=> b!829402 m!772291))

(assert (=> b!829402 m!772291))

(declare-fun m!772387 () Bool)

(assert (=> b!829402 m!772387))

(assert (=> b!829406 m!772291))

(assert (=> b!829406 m!772291))

(assert (=> b!829406 m!772293))

(assert (=> d!105265 m!772253))

(declare-fun m!772389 () Bool)

(assert (=> bm!36137 m!772389))

(assert (=> bm!36133 m!772251))

(declare-fun m!772391 () Bool)

(assert (=> b!829420 m!772391))

(declare-fun m!772393 () Bool)

(assert (=> bm!36136 m!772393))

(declare-fun m!772395 () Bool)

(assert (=> b!829408 m!772395))

(assert (=> b!829413 m!772291))

(assert (=> b!829413 m!772291))

(assert (=> b!829413 m!772293))

(declare-fun m!772397 () Bool)

(assert (=> b!829412 m!772397))

(declare-fun m!772399 () Bool)

(assert (=> b!829419 m!772399))

(declare-fun m!772401 () Bool)

(assert (=> b!829419 m!772401))

(declare-fun m!772403 () Bool)

(assert (=> b!829419 m!772403))

(declare-fun m!772405 () Bool)

(assert (=> b!829419 m!772405))

(declare-fun m!772407 () Bool)

(assert (=> b!829419 m!772407))

(declare-fun m!772409 () Bool)

(assert (=> b!829419 m!772409))

(declare-fun m!772411 () Bool)

(assert (=> b!829419 m!772411))

(assert (=> b!829419 m!772291))

(declare-fun m!772413 () Bool)

(assert (=> b!829419 m!772413))

(declare-fun m!772415 () Bool)

(assert (=> b!829419 m!772415))

(assert (=> b!829419 m!772409))

(declare-fun m!772417 () Bool)

(assert (=> b!829419 m!772417))

(declare-fun m!772419 () Bool)

(assert (=> b!829419 m!772419))

(declare-fun m!772421 () Bool)

(assert (=> b!829419 m!772421))

(declare-fun m!772423 () Bool)

(assert (=> b!829419 m!772423))

(declare-fun m!772425 () Bool)

(assert (=> b!829419 m!772425))

(assert (=> b!829419 m!772413))

(assert (=> b!829419 m!772405))

(declare-fun m!772427 () Bool)

(assert (=> b!829419 m!772427))

(assert (=> b!829419 m!772399))

(assert (=> b!829419 m!772251))

(assert (=> b!829269 d!105265))

(declare-fun d!105267 () Bool)

(declare-fun e!462318 () Bool)

(assert (=> d!105267 e!462318))

(declare-fun res!565032 () Bool)

(assert (=> d!105267 (=> (not res!565032) (not e!462318))))

(declare-fun lt!376106 () ListLongMap!8949)

(assert (=> d!105267 (= res!565032 (contains!4200 lt!376106 (_1!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376104 () List!15919)

(assert (=> d!105267 (= lt!376106 (ListLongMap!8950 lt!376104))))

(declare-fun lt!376105 () Unit!28401)

(declare-fun lt!376107 () Unit!28401)

(assert (=> d!105267 (= lt!376105 lt!376107)))

(assert (=> d!105267 (= (getValueByKey!412 lt!376104 (_1!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!417 (_2!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105267 (= lt!376107 (lemmaContainsTupThenGetReturnValue!226 lt!376104 (_1!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105267 (= lt!376104 (insertStrictlySorted!265 (toList!4490 lt!375980) (_1!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105267 (= (+!1971 lt!375980 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376106)))

(declare-fun b!829423 () Bool)

(declare-fun res!565033 () Bool)

(assert (=> b!829423 (=> (not res!565033) (not e!462318))))

(assert (=> b!829423 (= res!565033 (= (getValueByKey!412 (toList!4490 lt!376106) (_1!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!417 (_2!5074 (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!829424 () Bool)

(assert (=> b!829424 (= e!462318 (contains!4201 (toList!4490 lt!376106) (tuple2!10127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105267 res!565032) b!829423))

(assert (= (and b!829423 res!565033) b!829424))

(declare-fun m!772429 () Bool)

(assert (=> d!105267 m!772429))

(declare-fun m!772431 () Bool)

(assert (=> d!105267 m!772431))

(declare-fun m!772433 () Bool)

(assert (=> d!105267 m!772433))

(declare-fun m!772435 () Bool)

(assert (=> d!105267 m!772435))

(declare-fun m!772437 () Bool)

(assert (=> b!829423 m!772437))

(declare-fun m!772439 () Bool)

(assert (=> b!829424 m!772439))

(assert (=> b!829269 d!105267))

(declare-fun d!105269 () Bool)

(assert (=> d!105269 (= (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376110 () Unit!28401)

(declare-fun choose!1413 (array!46518 array!46520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25237 V!25237 V!25237 V!25237 (_ BitVec 32) Int) Unit!28401)

(assert (=> d!105269 (= lt!376110 (choose!1413 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105269 (validMask!0 mask!1312)))

(assert (=> d!105269 (= (lemmaNoChangeToArrayThenSameMapNoExtras!578 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376110)))

(declare-fun bs!23166 () Bool)

(assert (= bs!23166 d!105269))

(assert (=> bs!23166 m!772251))

(assert (=> bs!23166 m!772249))

(declare-fun m!772441 () Bool)

(assert (=> bs!23166 m!772441))

(assert (=> bs!23166 m!772253))

(assert (=> b!829265 d!105269))

(declare-fun bm!36142 () Bool)

(declare-fun call!36145 () ListLongMap!8949)

(assert (=> bm!36142 (= call!36145 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!829450 () Bool)

(declare-fun e!462339 () ListLongMap!8949)

(declare-fun e!462337 () ListLongMap!8949)

(assert (=> b!829450 (= e!462339 e!462337)))

(declare-fun c!89769 () Bool)

(assert (=> b!829450 (= c!89769 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829451 () Bool)

(declare-fun lt!376131 () Unit!28401)

(declare-fun lt!376128 () Unit!28401)

(assert (=> b!829451 (= lt!376131 lt!376128)))

(declare-fun lt!376127 () ListLongMap!8949)

(declare-fun lt!376130 () (_ BitVec 64))

(declare-fun lt!376129 () V!25237)

(declare-fun lt!376125 () (_ BitVec 64))

(assert (=> b!829451 (not (contains!4200 (+!1971 lt!376127 (tuple2!10127 lt!376130 lt!376129)) lt!376125))))

(declare-fun addStillNotContains!194 (ListLongMap!8949 (_ BitVec 64) V!25237 (_ BitVec 64)) Unit!28401)

(assert (=> b!829451 (= lt!376128 (addStillNotContains!194 lt!376127 lt!376130 lt!376129 lt!376125))))

(assert (=> b!829451 (= lt!376125 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!829451 (= lt!376129 (get!11804 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829451 (= lt!376130 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829451 (= lt!376127 call!36145)))

(assert (=> b!829451 (= e!462337 (+!1971 call!36145 (tuple2!10127 (select (arr!22298 _keys!976) #b00000000000000000000000000000000) (get!11804 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829452 () Bool)

(assert (=> b!829452 (= e!462337 call!36145)))

(declare-fun b!829453 () Bool)

(declare-fun e!462336 () Bool)

(assert (=> b!829453 (= e!462336 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829453 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829454 () Bool)

(assert (=> b!829454 (= e!462339 (ListLongMap!8950 Nil!15916))))

(declare-fun lt!376126 () ListLongMap!8949)

(declare-fun b!829455 () Bool)

(declare-fun e!462333 () Bool)

(assert (=> b!829455 (= e!462333 (= lt!376126 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829456 () Bool)

(declare-fun e!462338 () Bool)

(assert (=> b!829456 (= e!462338 e!462333)))

(declare-fun c!89768 () Bool)

(assert (=> b!829456 (= c!89768 (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(declare-fun b!829449 () Bool)

(assert (=> b!829449 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(assert (=> b!829449 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22720 _values!788)))))

(declare-fun e!462335 () Bool)

(assert (=> b!829449 (= e!462335 (= (apply!369 lt!376126 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)) (get!11804 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!105271 () Bool)

(declare-fun e!462334 () Bool)

(assert (=> d!105271 e!462334))

(declare-fun res!565045 () Bool)

(assert (=> d!105271 (=> (not res!565045) (not e!462334))))

(assert (=> d!105271 (= res!565045 (not (contains!4200 lt!376126 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105271 (= lt!376126 e!462339)))

(declare-fun c!89770 () Bool)

(assert (=> d!105271 (= c!89770 (bvsge #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(assert (=> d!105271 (validMask!0 mask!1312)))

(assert (=> d!105271 (= (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376126)))

(declare-fun b!829457 () Bool)

(declare-fun isEmpty!651 (ListLongMap!8949) Bool)

(assert (=> b!829457 (= e!462333 (isEmpty!651 lt!376126))))

(declare-fun b!829458 () Bool)

(assert (=> b!829458 (= e!462338 e!462335)))

(assert (=> b!829458 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(declare-fun res!565042 () Bool)

(assert (=> b!829458 (= res!565042 (contains!4200 lt!376126 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829458 (=> (not res!565042) (not e!462335))))

(declare-fun b!829459 () Bool)

(declare-fun res!565044 () Bool)

(assert (=> b!829459 (=> (not res!565044) (not e!462334))))

(assert (=> b!829459 (= res!565044 (not (contains!4200 lt!376126 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!829460 () Bool)

(assert (=> b!829460 (= e!462334 e!462338)))

(declare-fun c!89767 () Bool)

(assert (=> b!829460 (= c!89767 e!462336)))

(declare-fun res!565043 () Bool)

(assert (=> b!829460 (=> (not res!565043) (not e!462336))))

(assert (=> b!829460 (= res!565043 (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(assert (= (and d!105271 c!89770) b!829454))

(assert (= (and d!105271 (not c!89770)) b!829450))

(assert (= (and b!829450 c!89769) b!829451))

(assert (= (and b!829450 (not c!89769)) b!829452))

(assert (= (or b!829451 b!829452) bm!36142))

(assert (= (and d!105271 res!565045) b!829459))

(assert (= (and b!829459 res!565044) b!829460))

(assert (= (and b!829460 res!565043) b!829453))

(assert (= (and b!829460 c!89767) b!829458))

(assert (= (and b!829460 (not c!89767)) b!829456))

(assert (= (and b!829458 res!565042) b!829449))

(assert (= (and b!829456 c!89768) b!829455))

(assert (= (and b!829456 (not c!89768)) b!829457))

(declare-fun b_lambda!11279 () Bool)

(assert (=> (not b_lambda!11279) (not b!829451)))

(assert (=> b!829451 t!22282))

(declare-fun b_and!22469 () Bool)

(assert (= b_and!22467 (and (=> t!22282 result!7997) b_and!22469)))

(declare-fun b_lambda!11281 () Bool)

(assert (=> (not b_lambda!11281) (not b!829449)))

(assert (=> b!829449 t!22282))

(declare-fun b_and!22471 () Bool)

(assert (= b_and!22469 (and (=> t!22282 result!7997) b_and!22471)))

(declare-fun m!772443 () Bool)

(assert (=> b!829457 m!772443))

(declare-fun m!772445 () Bool)

(assert (=> b!829455 m!772445))

(assert (=> b!829450 m!772291))

(assert (=> b!829450 m!772291))

(assert (=> b!829450 m!772293))

(declare-fun m!772447 () Bool)

(assert (=> b!829459 m!772447))

(assert (=> b!829453 m!772291))

(assert (=> b!829453 m!772291))

(assert (=> b!829453 m!772293))

(declare-fun m!772449 () Bool)

(assert (=> d!105271 m!772449))

(assert (=> d!105271 m!772253))

(assert (=> b!829449 m!772307))

(assert (=> b!829449 m!772291))

(assert (=> b!829449 m!772309))

(assert (=> b!829449 m!772307))

(assert (=> b!829449 m!772309))

(assert (=> b!829449 m!772311))

(assert (=> b!829449 m!772291))

(declare-fun m!772451 () Bool)

(assert (=> b!829449 m!772451))

(assert (=> bm!36142 m!772445))

(assert (=> b!829458 m!772291))

(assert (=> b!829458 m!772291))

(declare-fun m!772453 () Bool)

(assert (=> b!829458 m!772453))

(assert (=> b!829451 m!772291))

(declare-fun m!772455 () Bool)

(assert (=> b!829451 m!772455))

(declare-fun m!772457 () Bool)

(assert (=> b!829451 m!772457))

(assert (=> b!829451 m!772307))

(assert (=> b!829451 m!772309))

(declare-fun m!772459 () Bool)

(assert (=> b!829451 m!772459))

(assert (=> b!829451 m!772307))

(assert (=> b!829451 m!772309))

(assert (=> b!829451 m!772311))

(assert (=> b!829451 m!772457))

(declare-fun m!772461 () Bool)

(assert (=> b!829451 m!772461))

(assert (=> b!829265 d!105271))

(declare-fun call!36146 () ListLongMap!8949)

(declare-fun bm!36143 () Bool)

(assert (=> bm!36143 (= call!36146 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!829462 () Bool)

(declare-fun e!462346 () ListLongMap!8949)

(declare-fun e!462344 () ListLongMap!8949)

(assert (=> b!829462 (= e!462346 e!462344)))

(declare-fun c!89773 () Bool)

(assert (=> b!829462 (= c!89773 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829463 () Bool)

(declare-fun lt!376138 () Unit!28401)

(declare-fun lt!376135 () Unit!28401)

(assert (=> b!829463 (= lt!376138 lt!376135)))

(declare-fun lt!376137 () (_ BitVec 64))

(declare-fun lt!376134 () ListLongMap!8949)

(declare-fun lt!376136 () V!25237)

(declare-fun lt!376132 () (_ BitVec 64))

(assert (=> b!829463 (not (contains!4200 (+!1971 lt!376134 (tuple2!10127 lt!376137 lt!376136)) lt!376132))))

(assert (=> b!829463 (= lt!376135 (addStillNotContains!194 lt!376134 lt!376137 lt!376136 lt!376132))))

(assert (=> b!829463 (= lt!376132 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!829463 (= lt!376136 (get!11804 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829463 (= lt!376137 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829463 (= lt!376134 call!36146)))

(assert (=> b!829463 (= e!462344 (+!1971 call!36146 (tuple2!10127 (select (arr!22298 _keys!976) #b00000000000000000000000000000000) (get!11804 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829464 () Bool)

(assert (=> b!829464 (= e!462344 call!36146)))

(declare-fun b!829465 () Bool)

(declare-fun e!462343 () Bool)

(assert (=> b!829465 (= e!462343 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829465 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829466 () Bool)

(assert (=> b!829466 (= e!462346 (ListLongMap!8950 Nil!15916))))

(declare-fun lt!376133 () ListLongMap!8949)

(declare-fun b!829467 () Bool)

(declare-fun e!462340 () Bool)

(assert (=> b!829467 (= e!462340 (= lt!376133 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829468 () Bool)

(declare-fun e!462345 () Bool)

(assert (=> b!829468 (= e!462345 e!462340)))

(declare-fun c!89772 () Bool)

(assert (=> b!829468 (= c!89772 (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(declare-fun b!829461 () Bool)

(assert (=> b!829461 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(assert (=> b!829461 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22720 _values!788)))))

(declare-fun e!462342 () Bool)

(assert (=> b!829461 (= e!462342 (= (apply!369 lt!376133 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)) (get!11804 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!105273 () Bool)

(declare-fun e!462341 () Bool)

(assert (=> d!105273 e!462341))

(declare-fun res!565049 () Bool)

(assert (=> d!105273 (=> (not res!565049) (not e!462341))))

(assert (=> d!105273 (= res!565049 (not (contains!4200 lt!376133 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105273 (= lt!376133 e!462346)))

(declare-fun c!89774 () Bool)

(assert (=> d!105273 (= c!89774 (bvsge #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(assert (=> d!105273 (validMask!0 mask!1312)))

(assert (=> d!105273 (= (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376133)))

(declare-fun b!829469 () Bool)

(assert (=> b!829469 (= e!462340 (isEmpty!651 lt!376133))))

(declare-fun b!829470 () Bool)

(assert (=> b!829470 (= e!462345 e!462342)))

(assert (=> b!829470 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(declare-fun res!565046 () Bool)

(assert (=> b!829470 (= res!565046 (contains!4200 lt!376133 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829470 (=> (not res!565046) (not e!462342))))

(declare-fun b!829471 () Bool)

(declare-fun res!565048 () Bool)

(assert (=> b!829471 (=> (not res!565048) (not e!462341))))

(assert (=> b!829471 (= res!565048 (not (contains!4200 lt!376133 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!829472 () Bool)

(assert (=> b!829472 (= e!462341 e!462345)))

(declare-fun c!89771 () Bool)

(assert (=> b!829472 (= c!89771 e!462343)))

(declare-fun res!565047 () Bool)

(assert (=> b!829472 (=> (not res!565047) (not e!462343))))

(assert (=> b!829472 (= res!565047 (bvslt #b00000000000000000000000000000000 (size!22719 _keys!976)))))

(assert (= (and d!105273 c!89774) b!829466))

(assert (= (and d!105273 (not c!89774)) b!829462))

(assert (= (and b!829462 c!89773) b!829463))

(assert (= (and b!829462 (not c!89773)) b!829464))

(assert (= (or b!829463 b!829464) bm!36143))

(assert (= (and d!105273 res!565049) b!829471))

(assert (= (and b!829471 res!565048) b!829472))

(assert (= (and b!829472 res!565047) b!829465))

(assert (= (and b!829472 c!89771) b!829470))

(assert (= (and b!829472 (not c!89771)) b!829468))

(assert (= (and b!829470 res!565046) b!829461))

(assert (= (and b!829468 c!89772) b!829467))

(assert (= (and b!829468 (not c!89772)) b!829469))

(declare-fun b_lambda!11283 () Bool)

(assert (=> (not b_lambda!11283) (not b!829463)))

(assert (=> b!829463 t!22282))

(declare-fun b_and!22473 () Bool)

(assert (= b_and!22471 (and (=> t!22282 result!7997) b_and!22473)))

(declare-fun b_lambda!11285 () Bool)

(assert (=> (not b_lambda!11285) (not b!829461)))

(assert (=> b!829461 t!22282))

(declare-fun b_and!22475 () Bool)

(assert (= b_and!22473 (and (=> t!22282 result!7997) b_and!22475)))

(declare-fun m!772463 () Bool)

(assert (=> b!829469 m!772463))

(declare-fun m!772465 () Bool)

(assert (=> b!829467 m!772465))

(assert (=> b!829462 m!772291))

(assert (=> b!829462 m!772291))

(assert (=> b!829462 m!772293))

(declare-fun m!772467 () Bool)

(assert (=> b!829471 m!772467))

(assert (=> b!829465 m!772291))

(assert (=> b!829465 m!772291))

(assert (=> b!829465 m!772293))

(declare-fun m!772469 () Bool)

(assert (=> d!105273 m!772469))

(assert (=> d!105273 m!772253))

(assert (=> b!829461 m!772307))

(assert (=> b!829461 m!772291))

(assert (=> b!829461 m!772309))

(assert (=> b!829461 m!772307))

(assert (=> b!829461 m!772309))

(assert (=> b!829461 m!772311))

(assert (=> b!829461 m!772291))

(declare-fun m!772471 () Bool)

(assert (=> b!829461 m!772471))

(assert (=> bm!36143 m!772465))

(assert (=> b!829470 m!772291))

(assert (=> b!829470 m!772291))

(declare-fun m!772473 () Bool)

(assert (=> b!829470 m!772473))

(assert (=> b!829463 m!772291))

(declare-fun m!772475 () Bool)

(assert (=> b!829463 m!772475))

(declare-fun m!772477 () Bool)

(assert (=> b!829463 m!772477))

(assert (=> b!829463 m!772307))

(assert (=> b!829463 m!772309))

(declare-fun m!772479 () Bool)

(assert (=> b!829463 m!772479))

(assert (=> b!829463 m!772307))

(assert (=> b!829463 m!772309))

(assert (=> b!829463 m!772311))

(assert (=> b!829463 m!772477))

(declare-fun m!772481 () Bool)

(assert (=> b!829463 m!772481))

(assert (=> b!829265 d!105273))

(declare-fun mapIsEmpty!24415 () Bool)

(declare-fun mapRes!24415 () Bool)

(assert (=> mapIsEmpty!24415 mapRes!24415))

(declare-fun b!829480 () Bool)

(declare-fun e!462352 () Bool)

(assert (=> b!829480 (= e!462352 tp_is_empty!15177)))

(declare-fun mapNonEmpty!24415 () Bool)

(declare-fun tp!47188 () Bool)

(declare-fun e!462351 () Bool)

(assert (=> mapNonEmpty!24415 (= mapRes!24415 (and tp!47188 e!462351))))

(declare-fun mapRest!24415 () (Array (_ BitVec 32) ValueCell!7173))

(declare-fun mapKey!24415 () (_ BitVec 32))

(declare-fun mapValue!24415 () ValueCell!7173)

(assert (=> mapNonEmpty!24415 (= mapRest!24409 (store mapRest!24415 mapKey!24415 mapValue!24415))))

(declare-fun condMapEmpty!24415 () Bool)

(declare-fun mapDefault!24415 () ValueCell!7173)

(assert (=> mapNonEmpty!24409 (= condMapEmpty!24415 (= mapRest!24409 ((as const (Array (_ BitVec 32) ValueCell!7173)) mapDefault!24415)))))

(assert (=> mapNonEmpty!24409 (= tp!47179 (and e!462352 mapRes!24415))))

(declare-fun b!829479 () Bool)

(assert (=> b!829479 (= e!462351 tp_is_empty!15177)))

(assert (= (and mapNonEmpty!24409 condMapEmpty!24415) mapIsEmpty!24415))

(assert (= (and mapNonEmpty!24409 (not condMapEmpty!24415)) mapNonEmpty!24415))

(assert (= (and mapNonEmpty!24415 ((_ is ValueCellFull!7173) mapValue!24415)) b!829479))

(assert (= (and mapNonEmpty!24409 ((_ is ValueCellFull!7173) mapDefault!24415)) b!829480))

(declare-fun m!772483 () Bool)

(assert (=> mapNonEmpty!24415 m!772483))

(declare-fun b_lambda!11287 () Bool)

(assert (= b_lambda!11281 (or (and start!71404 b_free!13467) b_lambda!11287)))

(declare-fun b_lambda!11289 () Bool)

(assert (= b_lambda!11277 (or (and start!71404 b_free!13467) b_lambda!11289)))

(declare-fun b_lambda!11291 () Bool)

(assert (= b_lambda!11279 (or (and start!71404 b_free!13467) b_lambda!11291)))

(declare-fun b_lambda!11293 () Bool)

(assert (= b_lambda!11275 (or (and start!71404 b_free!13467) b_lambda!11293)))

(declare-fun b_lambda!11295 () Bool)

(assert (= b_lambda!11283 (or (and start!71404 b_free!13467) b_lambda!11295)))

(declare-fun b_lambda!11297 () Bool)

(assert (= b_lambda!11285 (or (and start!71404 b_free!13467) b_lambda!11297)))

(check-sat (not b!829467) (not b!829326) (not b!829324) (not b!829412) (not d!105253) (not d!105257) (not b!829458) (not b!829457) (not b!829455) b_and!22475 (not bm!36143) (not b!829469) (not b!829423) (not b!829327) (not b!829453) (not b!829377) (not b!829420) (not bm!36142) (not b!829310) (not bm!36133) (not b!829451) (not b!829389) (not d!105255) (not b!829419) (not b!829402) (not b_lambda!11287) (not d!105273) (not b!829449) (not b!829381) (not bm!36130) (not b!829406) (not b_lambda!11295) (not b!829371) (not b!829312) (not d!105265) (not b!829405) (not b!829382) (not d!105267) (not bm!36137) (not bm!36111) (not bm!36139) (not b!829450) (not b!829424) (not b!829400) (not b!829401) (not b!829471) (not b!829465) (not b_lambda!11291) (not b!829388) (not b!829398) (not b!829399) (not bm!36136) (not d!105269) (not b!829463) (not b!829462) (not b_next!13467) (not b!829459) (not b!829461) (not bm!36132) (not b_lambda!11297) (not bm!36129) (not b_lambda!11293) (not d!105271) (not bm!36108) (not b!829374) (not b!829375) tp_is_empty!15177 (not b!829408) (not mapNonEmpty!24415) (not b!829470) (not b_lambda!11289) (not bm!36126) (not b!829413))
(check-sat b_and!22475 (not b_next!13467))
