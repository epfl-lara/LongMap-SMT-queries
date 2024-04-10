; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71290 () Bool)

(assert start!71290)

(declare-fun b_free!13425 () Bool)

(declare-fun b_next!13425 () Bool)

(assert (=> start!71290 (= b_free!13425 (not b_next!13425))))

(declare-fun tp!47041 () Bool)

(declare-fun b_and!22371 () Bool)

(assert (=> start!71290 (= tp!47041 b_and!22371)))

(declare-fun b!828002 () Bool)

(declare-fun e!461337 () Bool)

(declare-fun e!461339 () Bool)

(assert (=> b!828002 (= e!461337 (not e!461339))))

(declare-fun res!564281 () Bool)

(assert (=> b!828002 (=> res!564281 e!461339)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!828002 (= res!564281 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!25181 0))(
  ( (V!25182 (val!7615 Int)) )
))
(declare-datatypes ((tuple2!10096 0))(
  ( (tuple2!10097 (_1!5059 (_ BitVec 64)) (_2!5059 V!25181)) )
))
(declare-datatypes ((List!15888 0))(
  ( (Nil!15885) (Cons!15884 (h!17013 tuple2!10096) (t!22239 List!15888)) )
))
(declare-datatypes ((ListLongMap!8919 0))(
  ( (ListLongMap!8920 (toList!4475 List!15888)) )
))
(declare-fun lt!375082 () ListLongMap!8919)

(declare-fun lt!375083 () ListLongMap!8919)

(assert (=> b!828002 (= lt!375082 lt!375083)))

(declare-fun zeroValueBefore!34 () V!25181)

(declare-datatypes ((array!46434 0))(
  ( (array!46435 (arr!22260 (Array (_ BitVec 32) (_ BitVec 64))) (size!22681 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46434)

(declare-fun zeroValueAfter!34 () V!25181)

(declare-fun minValue!754 () V!25181)

(declare-datatypes ((ValueCell!7152 0))(
  ( (ValueCellFull!7152 (v!10050 V!25181)) (EmptyCell!7152) )
))
(declare-datatypes ((array!46436 0))(
  ( (array!46437 (arr!22261 (Array (_ BitVec 32) ValueCell!7152)) (size!22682 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46436)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28367 0))(
  ( (Unit!28368) )
))
(declare-fun lt!375084 () Unit!28367)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!565 (array!46434 array!46436 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25181 V!25181 V!25181 V!25181 (_ BitVec 32) Int) Unit!28367)

(assert (=> b!828002 (= lt!375084 (lemmaNoChangeToArrayThenSameMapNoExtras!565 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2477 (array!46434 array!46436 (_ BitVec 32) (_ BitVec 32) V!25181 V!25181 (_ BitVec 32) Int) ListLongMap!8919)

(assert (=> b!828002 (= lt!375083 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828002 (= lt!375082 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828003 () Bool)

(declare-fun +!1959 (ListLongMap!8919 tuple2!10096) ListLongMap!8919)

(declare-fun getCurrentListMap!2578 (array!46434 array!46436 (_ BitVec 32) (_ BitVec 32) V!25181 V!25181 (_ BitVec 32) Int) ListLongMap!8919)

(assert (=> b!828003 (= e!461339 (= (+!1959 (getCurrentListMap!2578 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!10097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (getCurrentListMap!2578 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796)))))

(declare-fun b!828004 () Bool)

(declare-fun e!461335 () Bool)

(declare-fun e!461338 () Bool)

(declare-fun mapRes!24334 () Bool)

(assert (=> b!828004 (= e!461335 (and e!461338 mapRes!24334))))

(declare-fun condMapEmpty!24334 () Bool)

(declare-fun mapDefault!24334 () ValueCell!7152)

(assert (=> b!828004 (= condMapEmpty!24334 (= (arr!22261 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7152)) mapDefault!24334)))))

(declare-fun b!828005 () Bool)

(declare-fun res!564282 () Bool)

(assert (=> b!828005 (=> (not res!564282) (not e!461337))))

(assert (=> b!828005 (= res!564282 (and (= (size!22682 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22681 _keys!976) (size!22682 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828006 () Bool)

(declare-fun tp_is_empty!15135 () Bool)

(assert (=> b!828006 (= e!461338 tp_is_empty!15135)))

(declare-fun b!828007 () Bool)

(declare-fun e!461336 () Bool)

(assert (=> b!828007 (= e!461336 tp_is_empty!15135)))

(declare-fun mapNonEmpty!24334 () Bool)

(declare-fun tp!47040 () Bool)

(assert (=> mapNonEmpty!24334 (= mapRes!24334 (and tp!47040 e!461336))))

(declare-fun mapRest!24334 () (Array (_ BitVec 32) ValueCell!7152))

(declare-fun mapValue!24334 () ValueCell!7152)

(declare-fun mapKey!24334 () (_ BitVec 32))

(assert (=> mapNonEmpty!24334 (= (arr!22261 _values!788) (store mapRest!24334 mapKey!24334 mapValue!24334))))

(declare-fun res!564283 () Bool)

(assert (=> start!71290 (=> (not res!564283) (not e!461337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71290 (= res!564283 (validMask!0 mask!1312))))

(assert (=> start!71290 e!461337))

(assert (=> start!71290 tp_is_empty!15135))

(declare-fun array_inv!17735 (array!46434) Bool)

(assert (=> start!71290 (array_inv!17735 _keys!976)))

(assert (=> start!71290 true))

(declare-fun array_inv!17736 (array!46436) Bool)

(assert (=> start!71290 (and (array_inv!17736 _values!788) e!461335)))

(assert (=> start!71290 tp!47041))

(declare-fun b!828001 () Bool)

(declare-fun res!564284 () Bool)

(assert (=> b!828001 (=> (not res!564284) (not e!461337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46434 (_ BitVec 32)) Bool)

(assert (=> b!828001 (= res!564284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24334 () Bool)

(assert (=> mapIsEmpty!24334 mapRes!24334))

(declare-fun b!828008 () Bool)

(declare-fun res!564285 () Bool)

(assert (=> b!828008 (=> (not res!564285) (not e!461337))))

(declare-datatypes ((List!15889 0))(
  ( (Nil!15886) (Cons!15885 (h!17014 (_ BitVec 64)) (t!22240 List!15889)) )
))
(declare-fun arrayNoDuplicates!0 (array!46434 (_ BitVec 32) List!15889) Bool)

(assert (=> b!828008 (= res!564285 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15886))))

(assert (= (and start!71290 res!564283) b!828005))

(assert (= (and b!828005 res!564282) b!828001))

(assert (= (and b!828001 res!564284) b!828008))

(assert (= (and b!828008 res!564285) b!828002))

(assert (= (and b!828002 (not res!564281)) b!828003))

(assert (= (and b!828004 condMapEmpty!24334) mapIsEmpty!24334))

(assert (= (and b!828004 (not condMapEmpty!24334)) mapNonEmpty!24334))

(get-info :version)

(assert (= (and mapNonEmpty!24334 ((_ is ValueCellFull!7152) mapValue!24334)) b!828007))

(assert (= (and b!828004 ((_ is ValueCellFull!7152) mapDefault!24334)) b!828006))

(assert (= start!71290 b!828004))

(declare-fun m!770951 () Bool)

(assert (=> mapNonEmpty!24334 m!770951))

(declare-fun m!770953 () Bool)

(assert (=> start!71290 m!770953))

(declare-fun m!770955 () Bool)

(assert (=> start!71290 m!770955))

(declare-fun m!770957 () Bool)

(assert (=> start!71290 m!770957))

(declare-fun m!770959 () Bool)

(assert (=> b!828001 m!770959))

(declare-fun m!770961 () Bool)

(assert (=> b!828002 m!770961))

(declare-fun m!770963 () Bool)

(assert (=> b!828002 m!770963))

(declare-fun m!770965 () Bool)

(assert (=> b!828002 m!770965))

(declare-fun m!770967 () Bool)

(assert (=> b!828008 m!770967))

(declare-fun m!770969 () Bool)

(assert (=> b!828003 m!770969))

(assert (=> b!828003 m!770969))

(declare-fun m!770971 () Bool)

(assert (=> b!828003 m!770971))

(declare-fun m!770973 () Bool)

(assert (=> b!828003 m!770973))

(check-sat tp_is_empty!15135 (not b_next!13425) (not mapNonEmpty!24334) (not b!828008) (not b!828001) (not b!828002) (not start!71290) b_and!22371 (not b!828003))
(check-sat b_and!22371 (not b_next!13425))
(get-model)

(declare-fun d!105145 () Bool)

(assert (=> d!105145 (= (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375096 () Unit!28367)

(declare-fun choose!1409 (array!46434 array!46436 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25181 V!25181 V!25181 V!25181 (_ BitVec 32) Int) Unit!28367)

(assert (=> d!105145 (= lt!375096 (choose!1409 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105145 (validMask!0 mask!1312)))

(assert (=> d!105145 (= (lemmaNoChangeToArrayThenSameMapNoExtras!565 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375096)))

(declare-fun bs!23141 () Bool)

(assert (= bs!23141 d!105145))

(assert (=> bs!23141 m!770965))

(assert (=> bs!23141 m!770963))

(declare-fun m!770999 () Bool)

(assert (=> bs!23141 m!770999))

(assert (=> bs!23141 m!770953))

(assert (=> b!828002 d!105145))

(declare-fun b!828057 () Bool)

(declare-fun e!461376 () ListLongMap!8919)

(declare-fun e!461373 () ListLongMap!8919)

(assert (=> b!828057 (= e!461376 e!461373)))

(declare-fun c!89555 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!828057 (= c!89555 (validKeyInArray!0 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828058 () Bool)

(declare-fun lt!375116 () Unit!28367)

(declare-fun lt!375115 () Unit!28367)

(assert (=> b!828058 (= lt!375116 lt!375115)))

(declare-fun lt!375111 () (_ BitVec 64))

(declare-fun lt!375112 () ListLongMap!8919)

(declare-fun lt!375114 () (_ BitVec 64))

(declare-fun lt!375117 () V!25181)

(declare-fun contains!4187 (ListLongMap!8919 (_ BitVec 64)) Bool)

(assert (=> b!828058 (not (contains!4187 (+!1959 lt!375112 (tuple2!10097 lt!375111 lt!375117)) lt!375114))))

(declare-fun addStillNotContains!190 (ListLongMap!8919 (_ BitVec 64) V!25181 (_ BitVec 64)) Unit!28367)

(assert (=> b!828058 (= lt!375115 (addStillNotContains!190 lt!375112 lt!375111 lt!375117 lt!375114))))

(assert (=> b!828058 (= lt!375114 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11786 (ValueCell!7152 V!25181) V!25181)

(declare-fun dynLambda!976 (Int (_ BitVec 64)) V!25181)

(assert (=> b!828058 (= lt!375117 (get!11786 (select (arr!22261 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!828058 (= lt!375111 (select (arr!22260 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35959 () ListLongMap!8919)

(assert (=> b!828058 (= lt!375112 call!35959)))

(assert (=> b!828058 (= e!461373 (+!1959 call!35959 (tuple2!10097 (select (arr!22260 _keys!976) #b00000000000000000000000000000000) (get!11786 (select (arr!22261 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!828059 () Bool)

(declare-fun e!461375 () Bool)

(declare-fun e!461378 () Bool)

(assert (=> b!828059 (= e!461375 e!461378)))

(declare-fun c!89553 () Bool)

(assert (=> b!828059 (= c!89553 (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(declare-fun b!828060 () Bool)

(declare-fun lt!375113 () ListLongMap!8919)

(declare-fun isEmpty!647 (ListLongMap!8919) Bool)

(assert (=> b!828060 (= e!461378 (isEmpty!647 lt!375113))))

(declare-fun b!828061 () Bool)

(declare-fun e!461374 () Bool)

(assert (=> b!828061 (= e!461374 e!461375)))

(declare-fun c!89556 () Bool)

(declare-fun e!461377 () Bool)

(assert (=> b!828061 (= c!89556 e!461377)))

(declare-fun res!564311 () Bool)

(assert (=> b!828061 (=> (not res!564311) (not e!461377))))

(assert (=> b!828061 (= res!564311 (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(declare-fun b!828062 () Bool)

(assert (=> b!828062 (= e!461373 call!35959)))

(declare-fun b!828063 () Bool)

(assert (=> b!828063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(assert (=> b!828063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22682 _values!788)))))

(declare-fun e!461379 () Bool)

(declare-fun apply!365 (ListLongMap!8919 (_ BitVec 64)) V!25181)

(assert (=> b!828063 (= e!461379 (= (apply!365 lt!375113 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)) (get!11786 (select (arr!22261 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!105147 () Bool)

(assert (=> d!105147 e!461374))

(declare-fun res!564310 () Bool)

(assert (=> d!105147 (=> (not res!564310) (not e!461374))))

(assert (=> d!105147 (= res!564310 (not (contains!4187 lt!375113 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105147 (= lt!375113 e!461376)))

(declare-fun c!89554 () Bool)

(assert (=> d!105147 (= c!89554 (bvsge #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(assert (=> d!105147 (validMask!0 mask!1312)))

(assert (=> d!105147 (= (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375113)))

(declare-fun b!828064 () Bool)

(assert (=> b!828064 (= e!461376 (ListLongMap!8920 Nil!15885))))

(declare-fun b!828065 () Bool)

(assert (=> b!828065 (= e!461377 (validKeyInArray!0 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828065 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!828066 () Bool)

(assert (=> b!828066 (= e!461375 e!461379)))

(assert (=> b!828066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(declare-fun res!564309 () Bool)

(assert (=> b!828066 (= res!564309 (contains!4187 lt!375113 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828066 (=> (not res!564309) (not e!461379))))

(declare-fun b!828067 () Bool)

(assert (=> b!828067 (= e!461378 (= lt!375113 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!828068 () Bool)

(declare-fun res!564312 () Bool)

(assert (=> b!828068 (=> (not res!564312) (not e!461374))))

(assert (=> b!828068 (= res!564312 (not (contains!4187 lt!375113 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!35956 () Bool)

(assert (=> bm!35956 (= call!35959 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!105147 c!89554) b!828064))

(assert (= (and d!105147 (not c!89554)) b!828057))

(assert (= (and b!828057 c!89555) b!828058))

(assert (= (and b!828057 (not c!89555)) b!828062))

(assert (= (or b!828058 b!828062) bm!35956))

(assert (= (and d!105147 res!564310) b!828068))

(assert (= (and b!828068 res!564312) b!828061))

(assert (= (and b!828061 res!564311) b!828065))

(assert (= (and b!828061 c!89556) b!828066))

(assert (= (and b!828061 (not c!89556)) b!828059))

(assert (= (and b!828066 res!564309) b!828063))

(assert (= (and b!828059 c!89553) b!828067))

(assert (= (and b!828059 (not c!89553)) b!828060))

(declare-fun b_lambda!11179 () Bool)

(assert (=> (not b_lambda!11179) (not b!828058)))

(declare-fun t!22243 () Bool)

(declare-fun tb!4211 () Bool)

(assert (=> (and start!71290 (= defaultEntry!796 defaultEntry!796) t!22243) tb!4211))

(declare-fun result!7973 () Bool)

(assert (=> tb!4211 (= result!7973 tp_is_empty!15135)))

(assert (=> b!828058 t!22243))

(declare-fun b_and!22375 () Bool)

(assert (= b_and!22371 (and (=> t!22243 result!7973) b_and!22375)))

(declare-fun b_lambda!11181 () Bool)

(assert (=> (not b_lambda!11181) (not b!828063)))

(assert (=> b!828063 t!22243))

(declare-fun b_and!22377 () Bool)

(assert (= b_and!22375 (and (=> t!22243 result!7973) b_and!22377)))

(declare-fun m!771001 () Bool)

(assert (=> b!828066 m!771001))

(assert (=> b!828066 m!771001))

(declare-fun m!771003 () Bool)

(assert (=> b!828066 m!771003))

(declare-fun m!771005 () Bool)

(assert (=> d!105147 m!771005))

(assert (=> d!105147 m!770953))

(assert (=> b!828057 m!771001))

(assert (=> b!828057 m!771001))

(declare-fun m!771007 () Bool)

(assert (=> b!828057 m!771007))

(declare-fun m!771009 () Bool)

(assert (=> bm!35956 m!771009))

(assert (=> b!828065 m!771001))

(assert (=> b!828065 m!771001))

(assert (=> b!828065 m!771007))

(declare-fun m!771011 () Bool)

(assert (=> b!828060 m!771011))

(declare-fun m!771013 () Bool)

(assert (=> b!828058 m!771013))

(assert (=> b!828058 m!771013))

(declare-fun m!771015 () Bool)

(assert (=> b!828058 m!771015))

(declare-fun m!771017 () Bool)

(assert (=> b!828058 m!771017))

(declare-fun m!771019 () Bool)

(assert (=> b!828058 m!771019))

(declare-fun m!771021 () Bool)

(assert (=> b!828058 m!771021))

(assert (=> b!828058 m!771015))

(declare-fun m!771023 () Bool)

(assert (=> b!828058 m!771023))

(declare-fun m!771025 () Bool)

(assert (=> b!828058 m!771025))

(assert (=> b!828058 m!771019))

(assert (=> b!828058 m!771001))

(declare-fun m!771027 () Bool)

(assert (=> b!828068 m!771027))

(assert (=> b!828067 m!771009))

(assert (=> b!828063 m!771013))

(assert (=> b!828063 m!771013))

(assert (=> b!828063 m!771015))

(assert (=> b!828063 m!771017))

(assert (=> b!828063 m!771015))

(assert (=> b!828063 m!771001))

(declare-fun m!771029 () Bool)

(assert (=> b!828063 m!771029))

(assert (=> b!828063 m!771001))

(assert (=> b!828002 d!105147))

(declare-fun b!828071 () Bool)

(declare-fun e!461383 () ListLongMap!8919)

(declare-fun e!461380 () ListLongMap!8919)

(assert (=> b!828071 (= e!461383 e!461380)))

(declare-fun c!89559 () Bool)

(assert (=> b!828071 (= c!89559 (validKeyInArray!0 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828072 () Bool)

(declare-fun lt!375123 () Unit!28367)

(declare-fun lt!375122 () Unit!28367)

(assert (=> b!828072 (= lt!375123 lt!375122)))

(declare-fun lt!375121 () (_ BitVec 64))

(declare-fun lt!375118 () (_ BitVec 64))

(declare-fun lt!375119 () ListLongMap!8919)

(declare-fun lt!375124 () V!25181)

(assert (=> b!828072 (not (contains!4187 (+!1959 lt!375119 (tuple2!10097 lt!375118 lt!375124)) lt!375121))))

(assert (=> b!828072 (= lt!375122 (addStillNotContains!190 lt!375119 lt!375118 lt!375124 lt!375121))))

(assert (=> b!828072 (= lt!375121 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!828072 (= lt!375124 (get!11786 (select (arr!22261 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!828072 (= lt!375118 (select (arr!22260 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35960 () ListLongMap!8919)

(assert (=> b!828072 (= lt!375119 call!35960)))

(assert (=> b!828072 (= e!461380 (+!1959 call!35960 (tuple2!10097 (select (arr!22260 _keys!976) #b00000000000000000000000000000000) (get!11786 (select (arr!22261 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!828073 () Bool)

(declare-fun e!461382 () Bool)

(declare-fun e!461385 () Bool)

(assert (=> b!828073 (= e!461382 e!461385)))

(declare-fun c!89557 () Bool)

(assert (=> b!828073 (= c!89557 (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(declare-fun b!828074 () Bool)

(declare-fun lt!375120 () ListLongMap!8919)

(assert (=> b!828074 (= e!461385 (isEmpty!647 lt!375120))))

(declare-fun b!828075 () Bool)

(declare-fun e!461381 () Bool)

(assert (=> b!828075 (= e!461381 e!461382)))

(declare-fun c!89560 () Bool)

(declare-fun e!461384 () Bool)

(assert (=> b!828075 (= c!89560 e!461384)))

(declare-fun res!564315 () Bool)

(assert (=> b!828075 (=> (not res!564315) (not e!461384))))

(assert (=> b!828075 (= res!564315 (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(declare-fun b!828076 () Bool)

(assert (=> b!828076 (= e!461380 call!35960)))

(declare-fun b!828077 () Bool)

(assert (=> b!828077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(assert (=> b!828077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22682 _values!788)))))

(declare-fun e!461386 () Bool)

(assert (=> b!828077 (= e!461386 (= (apply!365 lt!375120 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)) (get!11786 (select (arr!22261 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!105149 () Bool)

(assert (=> d!105149 e!461381))

(declare-fun res!564314 () Bool)

(assert (=> d!105149 (=> (not res!564314) (not e!461381))))

(assert (=> d!105149 (= res!564314 (not (contains!4187 lt!375120 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105149 (= lt!375120 e!461383)))

(declare-fun c!89558 () Bool)

(assert (=> d!105149 (= c!89558 (bvsge #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(assert (=> d!105149 (validMask!0 mask!1312)))

(assert (=> d!105149 (= (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375120)))

(declare-fun b!828078 () Bool)

(assert (=> b!828078 (= e!461383 (ListLongMap!8920 Nil!15885))))

(declare-fun b!828079 () Bool)

(assert (=> b!828079 (= e!461384 (validKeyInArray!0 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828079 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!828080 () Bool)

(assert (=> b!828080 (= e!461382 e!461386)))

(assert (=> b!828080 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(declare-fun res!564313 () Bool)

(assert (=> b!828080 (= res!564313 (contains!4187 lt!375120 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828080 (=> (not res!564313) (not e!461386))))

(declare-fun b!828081 () Bool)

(assert (=> b!828081 (= e!461385 (= lt!375120 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!828082 () Bool)

(declare-fun res!564316 () Bool)

(assert (=> b!828082 (=> (not res!564316) (not e!461381))))

(assert (=> b!828082 (= res!564316 (not (contains!4187 lt!375120 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!35957 () Bool)

(assert (=> bm!35957 (= call!35960 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!105149 c!89558) b!828078))

(assert (= (and d!105149 (not c!89558)) b!828071))

(assert (= (and b!828071 c!89559) b!828072))

(assert (= (and b!828071 (not c!89559)) b!828076))

(assert (= (or b!828072 b!828076) bm!35957))

(assert (= (and d!105149 res!564314) b!828082))

(assert (= (and b!828082 res!564316) b!828075))

(assert (= (and b!828075 res!564315) b!828079))

(assert (= (and b!828075 c!89560) b!828080))

(assert (= (and b!828075 (not c!89560)) b!828073))

(assert (= (and b!828080 res!564313) b!828077))

(assert (= (and b!828073 c!89557) b!828081))

(assert (= (and b!828073 (not c!89557)) b!828074))

(declare-fun b_lambda!11183 () Bool)

(assert (=> (not b_lambda!11183) (not b!828072)))

(assert (=> b!828072 t!22243))

(declare-fun b_and!22379 () Bool)

(assert (= b_and!22377 (and (=> t!22243 result!7973) b_and!22379)))

(declare-fun b_lambda!11185 () Bool)

(assert (=> (not b_lambda!11185) (not b!828077)))

(assert (=> b!828077 t!22243))

(declare-fun b_and!22381 () Bool)

(assert (= b_and!22379 (and (=> t!22243 result!7973) b_and!22381)))

(assert (=> b!828080 m!771001))

(assert (=> b!828080 m!771001))

(declare-fun m!771031 () Bool)

(assert (=> b!828080 m!771031))

(declare-fun m!771033 () Bool)

(assert (=> d!105149 m!771033))

(assert (=> d!105149 m!770953))

(assert (=> b!828071 m!771001))

(assert (=> b!828071 m!771001))

(assert (=> b!828071 m!771007))

(declare-fun m!771035 () Bool)

(assert (=> bm!35957 m!771035))

(assert (=> b!828079 m!771001))

(assert (=> b!828079 m!771001))

(assert (=> b!828079 m!771007))

(declare-fun m!771037 () Bool)

(assert (=> b!828074 m!771037))

(assert (=> b!828072 m!771013))

(assert (=> b!828072 m!771013))

(assert (=> b!828072 m!771015))

(assert (=> b!828072 m!771017))

(declare-fun m!771039 () Bool)

(assert (=> b!828072 m!771039))

(declare-fun m!771041 () Bool)

(assert (=> b!828072 m!771041))

(assert (=> b!828072 m!771015))

(declare-fun m!771043 () Bool)

(assert (=> b!828072 m!771043))

(declare-fun m!771045 () Bool)

(assert (=> b!828072 m!771045))

(assert (=> b!828072 m!771039))

(assert (=> b!828072 m!771001))

(declare-fun m!771047 () Bool)

(assert (=> b!828082 m!771047))

(assert (=> b!828081 m!771035))

(assert (=> b!828077 m!771013))

(assert (=> b!828077 m!771013))

(assert (=> b!828077 m!771015))

(assert (=> b!828077 m!771017))

(assert (=> b!828077 m!771015))

(assert (=> b!828077 m!771001))

(declare-fun m!771049 () Bool)

(assert (=> b!828077 m!771049))

(assert (=> b!828077 m!771001))

(assert (=> b!828002 d!105149))

(declare-fun d!105151 () Bool)

(assert (=> d!105151 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71290 d!105151))

(declare-fun d!105153 () Bool)

(assert (=> d!105153 (= (array_inv!17735 _keys!976) (bvsge (size!22681 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71290 d!105153))

(declare-fun d!105155 () Bool)

(assert (=> d!105155 (= (array_inv!17736 _values!788) (bvsge (size!22682 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71290 d!105155))

(declare-fun d!105157 () Bool)

(declare-fun e!461389 () Bool)

(assert (=> d!105157 e!461389))

(declare-fun res!564322 () Bool)

(assert (=> d!105157 (=> (not res!564322) (not e!461389))))

(declare-fun lt!375136 () ListLongMap!8919)

(assert (=> d!105157 (= res!564322 (contains!4187 lt!375136 (_1!5059 (tuple2!10097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!375135 () List!15888)

(assert (=> d!105157 (= lt!375136 (ListLongMap!8920 lt!375135))))

(declare-fun lt!375133 () Unit!28367)

(declare-fun lt!375134 () Unit!28367)

(assert (=> d!105157 (= lt!375133 lt!375134)))

(declare-datatypes ((Option!414 0))(
  ( (Some!413 (v!10052 V!25181)) (None!412) )
))
(declare-fun getValueByKey!408 (List!15888 (_ BitVec 64)) Option!414)

(assert (=> d!105157 (= (getValueByKey!408 lt!375135 (_1!5059 (tuple2!10097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!413 (_2!5059 (tuple2!10097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!222 (List!15888 (_ BitVec 64) V!25181) Unit!28367)

(assert (=> d!105157 (= lt!375134 (lemmaContainsTupThenGetReturnValue!222 lt!375135 (_1!5059 (tuple2!10097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5059 (tuple2!10097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun insertStrictlySorted!261 (List!15888 (_ BitVec 64) V!25181) List!15888)

(assert (=> d!105157 (= lt!375135 (insertStrictlySorted!261 (toList!4475 (getCurrentListMap!2578 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796)) (_1!5059 (tuple2!10097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5059 (tuple2!10097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105157 (= (+!1959 (getCurrentListMap!2578 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!10097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!375136)))

(declare-fun b!828087 () Bool)

(declare-fun res!564321 () Bool)

(assert (=> b!828087 (=> (not res!564321) (not e!461389))))

(assert (=> b!828087 (= res!564321 (= (getValueByKey!408 (toList!4475 lt!375136) (_1!5059 (tuple2!10097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!413 (_2!5059 (tuple2!10097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!828088 () Bool)

(declare-fun contains!4188 (List!15888 tuple2!10096) Bool)

(assert (=> b!828088 (= e!461389 (contains!4188 (toList!4475 lt!375136) (tuple2!10097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105157 res!564322) b!828087))

(assert (= (and b!828087 res!564321) b!828088))

(declare-fun m!771051 () Bool)

(assert (=> d!105157 m!771051))

(declare-fun m!771053 () Bool)

(assert (=> d!105157 m!771053))

(declare-fun m!771055 () Bool)

(assert (=> d!105157 m!771055))

(declare-fun m!771057 () Bool)

(assert (=> d!105157 m!771057))

(declare-fun m!771059 () Bool)

(assert (=> b!828087 m!771059))

(declare-fun m!771061 () Bool)

(assert (=> b!828088 m!771061))

(assert (=> b!828003 d!105157))

(declare-fun b!828131 () Bool)

(declare-fun e!461420 () Bool)

(assert (=> b!828131 (= e!461420 (validKeyInArray!0 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828132 () Bool)

(declare-fun e!461418 () Unit!28367)

(declare-fun Unit!28371 () Unit!28367)

(assert (=> b!828132 (= e!461418 Unit!28371)))

(declare-fun b!828133 () Bool)

(declare-fun e!461422 () Bool)

(declare-fun e!461428 () Bool)

(assert (=> b!828133 (= e!461422 e!461428)))

(declare-fun c!89576 () Bool)

(assert (=> b!828133 (= c!89576 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828134 () Bool)

(declare-fun e!461424 () Bool)

(declare-fun lt!375190 () ListLongMap!8919)

(assert (=> b!828134 (= e!461424 (= (apply!365 lt!375190 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!828135 () Bool)

(declare-fun c!89578 () Bool)

(assert (=> b!828135 (= c!89578 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!461417 () ListLongMap!8919)

(declare-fun e!461426 () ListLongMap!8919)

(assert (=> b!828135 (= e!461417 e!461426)))

(declare-fun b!828136 () Bool)

(declare-fun e!461425 () Bool)

(assert (=> b!828136 (= e!461425 (validKeyInArray!0 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828137 () Bool)

(declare-fun e!461423 () ListLongMap!8919)

(assert (=> b!828137 (= e!461423 e!461417)))

(declare-fun c!89575 () Bool)

(assert (=> b!828137 (= c!89575 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35972 () Bool)

(declare-fun call!35979 () ListLongMap!8919)

(declare-fun call!35980 () ListLongMap!8919)

(assert (=> bm!35972 (= call!35979 call!35980)))

(declare-fun b!828138 () Bool)

(declare-fun lt!375193 () Unit!28367)

(assert (=> b!828138 (= e!461418 lt!375193)))

(declare-fun lt!375186 () ListLongMap!8919)

(assert (=> b!828138 (= lt!375186 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375202 () (_ BitVec 64))

(assert (=> b!828138 (= lt!375202 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375185 () (_ BitVec 64))

(assert (=> b!828138 (= lt!375185 (select (arr!22260 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375200 () Unit!28367)

(declare-fun addStillContains!316 (ListLongMap!8919 (_ BitVec 64) V!25181 (_ BitVec 64)) Unit!28367)

(assert (=> b!828138 (= lt!375200 (addStillContains!316 lt!375186 lt!375202 zeroValueBefore!34 lt!375185))))

(assert (=> b!828138 (contains!4187 (+!1959 lt!375186 (tuple2!10097 lt!375202 zeroValueBefore!34)) lt!375185)))

(declare-fun lt!375184 () Unit!28367)

(assert (=> b!828138 (= lt!375184 lt!375200)))

(declare-fun lt!375183 () ListLongMap!8919)

(assert (=> b!828138 (= lt!375183 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375199 () (_ BitVec 64))

(assert (=> b!828138 (= lt!375199 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375187 () (_ BitVec 64))

(assert (=> b!828138 (= lt!375187 (select (arr!22260 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375181 () Unit!28367)

(declare-fun addApplyDifferent!316 (ListLongMap!8919 (_ BitVec 64) V!25181 (_ BitVec 64)) Unit!28367)

(assert (=> b!828138 (= lt!375181 (addApplyDifferent!316 lt!375183 lt!375199 minValue!754 lt!375187))))

(assert (=> b!828138 (= (apply!365 (+!1959 lt!375183 (tuple2!10097 lt!375199 minValue!754)) lt!375187) (apply!365 lt!375183 lt!375187))))

(declare-fun lt!375182 () Unit!28367)

(assert (=> b!828138 (= lt!375182 lt!375181)))

(declare-fun lt!375201 () ListLongMap!8919)

(assert (=> b!828138 (= lt!375201 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375196 () (_ BitVec 64))

(assert (=> b!828138 (= lt!375196 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375195 () (_ BitVec 64))

(assert (=> b!828138 (= lt!375195 (select (arr!22260 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375194 () Unit!28367)

(assert (=> b!828138 (= lt!375194 (addApplyDifferent!316 lt!375201 lt!375196 zeroValueBefore!34 lt!375195))))

(assert (=> b!828138 (= (apply!365 (+!1959 lt!375201 (tuple2!10097 lt!375196 zeroValueBefore!34)) lt!375195) (apply!365 lt!375201 lt!375195))))

(declare-fun lt!375197 () Unit!28367)

(assert (=> b!828138 (= lt!375197 lt!375194)))

(declare-fun lt!375198 () ListLongMap!8919)

(assert (=> b!828138 (= lt!375198 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375189 () (_ BitVec 64))

(assert (=> b!828138 (= lt!375189 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375191 () (_ BitVec 64))

(assert (=> b!828138 (= lt!375191 (select (arr!22260 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828138 (= lt!375193 (addApplyDifferent!316 lt!375198 lt!375189 minValue!754 lt!375191))))

(assert (=> b!828138 (= (apply!365 (+!1959 lt!375198 (tuple2!10097 lt!375189 minValue!754)) lt!375191) (apply!365 lt!375198 lt!375191))))

(declare-fun bm!35973 () Bool)

(declare-fun call!35978 () ListLongMap!8919)

(declare-fun call!35975 () ListLongMap!8919)

(assert (=> bm!35973 (= call!35978 call!35975)))

(declare-fun b!828139 () Bool)

(declare-fun e!461419 () Bool)

(assert (=> b!828139 (= e!461419 (= (apply!365 lt!375190 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!828140 () Bool)

(assert (=> b!828140 (= e!461423 (+!1959 call!35980 (tuple2!10097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!828141 () Bool)

(assert (=> b!828141 (= e!461426 call!35979)))

(declare-fun d!105159 () Bool)

(assert (=> d!105159 e!461422))

(declare-fun res!564346 () Bool)

(assert (=> d!105159 (=> (not res!564346) (not e!461422))))

(assert (=> d!105159 (= res!564346 (or (bvsge #b00000000000000000000000000000000 (size!22681 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))))

(declare-fun lt!375192 () ListLongMap!8919)

(assert (=> d!105159 (= lt!375190 lt!375192)))

(declare-fun lt!375188 () Unit!28367)

(assert (=> d!105159 (= lt!375188 e!461418)))

(declare-fun c!89573 () Bool)

(assert (=> d!105159 (= c!89573 e!461420)))

(declare-fun res!564347 () Bool)

(assert (=> d!105159 (=> (not res!564347) (not e!461420))))

(assert (=> d!105159 (= res!564347 (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(assert (=> d!105159 (= lt!375192 e!461423)))

(declare-fun c!89574 () Bool)

(assert (=> d!105159 (= c!89574 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105159 (validMask!0 mask!1312)))

(assert (=> d!105159 (= (getCurrentListMap!2578 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375190)))

(declare-fun b!828142 () Bool)

(declare-fun call!35981 () ListLongMap!8919)

(assert (=> b!828142 (= e!461426 call!35981)))

(declare-fun b!828143 () Bool)

(declare-fun e!461421 () Bool)

(declare-fun call!35976 () Bool)

(assert (=> b!828143 (= e!461421 (not call!35976))))

(declare-fun b!828144 () Bool)

(declare-fun e!461416 () Bool)

(declare-fun e!461427 () Bool)

(assert (=> b!828144 (= e!461416 e!461427)))

(declare-fun res!564344 () Bool)

(assert (=> b!828144 (=> (not res!564344) (not e!461427))))

(assert (=> b!828144 (= res!564344 (contains!4187 lt!375190 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828144 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(declare-fun bm!35974 () Bool)

(assert (=> bm!35974 (= call!35975 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828145 () Bool)

(assert (=> b!828145 (= e!461428 e!461424)))

(declare-fun res!564345 () Bool)

(declare-fun call!35977 () Bool)

(assert (=> b!828145 (= res!564345 call!35977)))

(assert (=> b!828145 (=> (not res!564345) (not e!461424))))

(declare-fun b!828146 () Bool)

(assert (=> b!828146 (= e!461428 (not call!35977))))

(declare-fun bm!35975 () Bool)

(assert (=> bm!35975 (= call!35976 (contains!4187 lt!375190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35976 () Bool)

(assert (=> bm!35976 (= call!35977 (contains!4187 lt!375190 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35977 () Bool)

(assert (=> bm!35977 (= call!35980 (+!1959 (ite c!89574 call!35975 (ite c!89575 call!35978 call!35981)) (ite (or c!89574 c!89575) (tuple2!10097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!828147 () Bool)

(assert (=> b!828147 (= e!461427 (= (apply!365 lt!375190 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)) (get!11786 (select (arr!22261 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!828147 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22682 _values!788)))))

(assert (=> b!828147 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(declare-fun b!828148 () Bool)

(assert (=> b!828148 (= e!461417 call!35979)))

(declare-fun bm!35978 () Bool)

(assert (=> bm!35978 (= call!35981 call!35978)))

(declare-fun b!828149 () Bool)

(assert (=> b!828149 (= e!461421 e!461419)))

(declare-fun res!564348 () Bool)

(assert (=> b!828149 (= res!564348 call!35976)))

(assert (=> b!828149 (=> (not res!564348) (not e!461419))))

(declare-fun b!828150 () Bool)

(declare-fun res!564342 () Bool)

(assert (=> b!828150 (=> (not res!564342) (not e!461422))))

(assert (=> b!828150 (= res!564342 e!461421)))

(declare-fun c!89577 () Bool)

(assert (=> b!828150 (= c!89577 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!828151 () Bool)

(declare-fun res!564343 () Bool)

(assert (=> b!828151 (=> (not res!564343) (not e!461422))))

(assert (=> b!828151 (= res!564343 e!461416)))

(declare-fun res!564341 () Bool)

(assert (=> b!828151 (=> res!564341 e!461416)))

(assert (=> b!828151 (= res!564341 (not e!461425))))

(declare-fun res!564349 () Bool)

(assert (=> b!828151 (=> (not res!564349) (not e!461425))))

(assert (=> b!828151 (= res!564349 (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(assert (= (and d!105159 c!89574) b!828140))

(assert (= (and d!105159 (not c!89574)) b!828137))

(assert (= (and b!828137 c!89575) b!828148))

(assert (= (and b!828137 (not c!89575)) b!828135))

(assert (= (and b!828135 c!89578) b!828141))

(assert (= (and b!828135 (not c!89578)) b!828142))

(assert (= (or b!828141 b!828142) bm!35978))

(assert (= (or b!828148 bm!35978) bm!35973))

(assert (= (or b!828148 b!828141) bm!35972))

(assert (= (or b!828140 bm!35973) bm!35974))

(assert (= (or b!828140 bm!35972) bm!35977))

(assert (= (and d!105159 res!564347) b!828131))

(assert (= (and d!105159 c!89573) b!828138))

(assert (= (and d!105159 (not c!89573)) b!828132))

(assert (= (and d!105159 res!564346) b!828151))

(assert (= (and b!828151 res!564349) b!828136))

(assert (= (and b!828151 (not res!564341)) b!828144))

(assert (= (and b!828144 res!564344) b!828147))

(assert (= (and b!828151 res!564343) b!828150))

(assert (= (and b!828150 c!89577) b!828149))

(assert (= (and b!828150 (not c!89577)) b!828143))

(assert (= (and b!828149 res!564348) b!828139))

(assert (= (or b!828149 b!828143) bm!35975))

(assert (= (and b!828150 res!564342) b!828133))

(assert (= (and b!828133 c!89576) b!828145))

(assert (= (and b!828133 (not c!89576)) b!828146))

(assert (= (and b!828145 res!564345) b!828134))

(assert (= (or b!828145 b!828146) bm!35976))

(declare-fun b_lambda!11187 () Bool)

(assert (=> (not b_lambda!11187) (not b!828147)))

(assert (=> b!828147 t!22243))

(declare-fun b_and!22383 () Bool)

(assert (= b_and!22381 (and (=> t!22243 result!7973) b_and!22383)))

(assert (=> b!828136 m!771001))

(assert (=> b!828136 m!771001))

(assert (=> b!828136 m!771007))

(declare-fun m!771063 () Bool)

(assert (=> bm!35975 m!771063))

(assert (=> b!828144 m!771001))

(assert (=> b!828144 m!771001))

(declare-fun m!771065 () Bool)

(assert (=> b!828144 m!771065))

(declare-fun m!771067 () Bool)

(assert (=> b!828134 m!771067))

(declare-fun m!771069 () Bool)

(assert (=> bm!35977 m!771069))

(declare-fun m!771071 () Bool)

(assert (=> b!828140 m!771071))

(assert (=> bm!35974 m!770965))

(declare-fun m!771073 () Bool)

(assert (=> bm!35976 m!771073))

(declare-fun m!771075 () Bool)

(assert (=> b!828139 m!771075))

(declare-fun m!771077 () Bool)

(assert (=> b!828138 m!771077))

(declare-fun m!771079 () Bool)

(assert (=> b!828138 m!771079))

(assert (=> b!828138 m!771001))

(declare-fun m!771081 () Bool)

(assert (=> b!828138 m!771081))

(declare-fun m!771083 () Bool)

(assert (=> b!828138 m!771083))

(declare-fun m!771085 () Bool)

(assert (=> b!828138 m!771085))

(declare-fun m!771087 () Bool)

(assert (=> b!828138 m!771087))

(declare-fun m!771089 () Bool)

(assert (=> b!828138 m!771089))

(declare-fun m!771091 () Bool)

(assert (=> b!828138 m!771091))

(declare-fun m!771093 () Bool)

(assert (=> b!828138 m!771093))

(assert (=> b!828138 m!771085))

(declare-fun m!771095 () Bool)

(assert (=> b!828138 m!771095))

(assert (=> b!828138 m!771077))

(assert (=> b!828138 m!771091))

(declare-fun m!771097 () Bool)

(assert (=> b!828138 m!771097))

(assert (=> b!828138 m!770965))

(assert (=> b!828138 m!771097))

(declare-fun m!771099 () Bool)

(assert (=> b!828138 m!771099))

(declare-fun m!771101 () Bool)

(assert (=> b!828138 m!771101))

(declare-fun m!771103 () Bool)

(assert (=> b!828138 m!771103))

(declare-fun m!771105 () Bool)

(assert (=> b!828138 m!771105))

(assert (=> b!828147 m!771001))

(declare-fun m!771107 () Bool)

(assert (=> b!828147 m!771107))

(assert (=> b!828147 m!771013))

(assert (=> b!828147 m!771013))

(assert (=> b!828147 m!771015))

(assert (=> b!828147 m!771017))

(assert (=> b!828147 m!771015))

(assert (=> b!828147 m!771001))

(assert (=> b!828131 m!771001))

(assert (=> b!828131 m!771001))

(assert (=> b!828131 m!771007))

(assert (=> d!105159 m!770953))

(assert (=> b!828003 d!105159))

(declare-fun b!828152 () Bool)

(declare-fun e!461433 () Bool)

(assert (=> b!828152 (= e!461433 (validKeyInArray!0 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828153 () Bool)

(declare-fun e!461431 () Unit!28367)

(declare-fun Unit!28372 () Unit!28367)

(assert (=> b!828153 (= e!461431 Unit!28372)))

(declare-fun b!828154 () Bool)

(declare-fun e!461435 () Bool)

(declare-fun e!461441 () Bool)

(assert (=> b!828154 (= e!461435 e!461441)))

(declare-fun c!89582 () Bool)

(assert (=> b!828154 (= c!89582 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828155 () Bool)

(declare-fun e!461437 () Bool)

(declare-fun lt!375212 () ListLongMap!8919)

(assert (=> b!828155 (= e!461437 (= (apply!365 lt!375212 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!828156 () Bool)

(declare-fun c!89584 () Bool)

(assert (=> b!828156 (= c!89584 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!461430 () ListLongMap!8919)

(declare-fun e!461439 () ListLongMap!8919)

(assert (=> b!828156 (= e!461430 e!461439)))

(declare-fun b!828157 () Bool)

(declare-fun e!461438 () Bool)

(assert (=> b!828157 (= e!461438 (validKeyInArray!0 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828158 () Bool)

(declare-fun e!461436 () ListLongMap!8919)

(assert (=> b!828158 (= e!461436 e!461430)))

(declare-fun c!89581 () Bool)

(assert (=> b!828158 (= c!89581 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35979 () Bool)

(declare-fun call!35986 () ListLongMap!8919)

(declare-fun call!35987 () ListLongMap!8919)

(assert (=> bm!35979 (= call!35986 call!35987)))

(declare-fun b!828159 () Bool)

(declare-fun lt!375215 () Unit!28367)

(assert (=> b!828159 (= e!461431 lt!375215)))

(declare-fun lt!375208 () ListLongMap!8919)

(assert (=> b!828159 (= lt!375208 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375224 () (_ BitVec 64))

(assert (=> b!828159 (= lt!375224 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375207 () (_ BitVec 64))

(assert (=> b!828159 (= lt!375207 (select (arr!22260 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375222 () Unit!28367)

(assert (=> b!828159 (= lt!375222 (addStillContains!316 lt!375208 lt!375224 zeroValueAfter!34 lt!375207))))

(assert (=> b!828159 (contains!4187 (+!1959 lt!375208 (tuple2!10097 lt!375224 zeroValueAfter!34)) lt!375207)))

(declare-fun lt!375206 () Unit!28367)

(assert (=> b!828159 (= lt!375206 lt!375222)))

(declare-fun lt!375205 () ListLongMap!8919)

(assert (=> b!828159 (= lt!375205 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375221 () (_ BitVec 64))

(assert (=> b!828159 (= lt!375221 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375209 () (_ BitVec 64))

(assert (=> b!828159 (= lt!375209 (select (arr!22260 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375203 () Unit!28367)

(assert (=> b!828159 (= lt!375203 (addApplyDifferent!316 lt!375205 lt!375221 minValue!754 lt!375209))))

(assert (=> b!828159 (= (apply!365 (+!1959 lt!375205 (tuple2!10097 lt!375221 minValue!754)) lt!375209) (apply!365 lt!375205 lt!375209))))

(declare-fun lt!375204 () Unit!28367)

(assert (=> b!828159 (= lt!375204 lt!375203)))

(declare-fun lt!375223 () ListLongMap!8919)

(assert (=> b!828159 (= lt!375223 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375218 () (_ BitVec 64))

(assert (=> b!828159 (= lt!375218 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375217 () (_ BitVec 64))

(assert (=> b!828159 (= lt!375217 (select (arr!22260 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375216 () Unit!28367)

(assert (=> b!828159 (= lt!375216 (addApplyDifferent!316 lt!375223 lt!375218 zeroValueAfter!34 lt!375217))))

(assert (=> b!828159 (= (apply!365 (+!1959 lt!375223 (tuple2!10097 lt!375218 zeroValueAfter!34)) lt!375217) (apply!365 lt!375223 lt!375217))))

(declare-fun lt!375219 () Unit!28367)

(assert (=> b!828159 (= lt!375219 lt!375216)))

(declare-fun lt!375220 () ListLongMap!8919)

(assert (=> b!828159 (= lt!375220 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375211 () (_ BitVec 64))

(assert (=> b!828159 (= lt!375211 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375213 () (_ BitVec 64))

(assert (=> b!828159 (= lt!375213 (select (arr!22260 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828159 (= lt!375215 (addApplyDifferent!316 lt!375220 lt!375211 minValue!754 lt!375213))))

(assert (=> b!828159 (= (apply!365 (+!1959 lt!375220 (tuple2!10097 lt!375211 minValue!754)) lt!375213) (apply!365 lt!375220 lt!375213))))

(declare-fun bm!35980 () Bool)

(declare-fun call!35985 () ListLongMap!8919)

(declare-fun call!35982 () ListLongMap!8919)

(assert (=> bm!35980 (= call!35985 call!35982)))

(declare-fun b!828160 () Bool)

(declare-fun e!461432 () Bool)

(assert (=> b!828160 (= e!461432 (= (apply!365 lt!375212 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!828161 () Bool)

(assert (=> b!828161 (= e!461436 (+!1959 call!35987 (tuple2!10097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!828162 () Bool)

(assert (=> b!828162 (= e!461439 call!35986)))

(declare-fun d!105161 () Bool)

(assert (=> d!105161 e!461435))

(declare-fun res!564355 () Bool)

(assert (=> d!105161 (=> (not res!564355) (not e!461435))))

(assert (=> d!105161 (= res!564355 (or (bvsge #b00000000000000000000000000000000 (size!22681 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))))

(declare-fun lt!375214 () ListLongMap!8919)

(assert (=> d!105161 (= lt!375212 lt!375214)))

(declare-fun lt!375210 () Unit!28367)

(assert (=> d!105161 (= lt!375210 e!461431)))

(declare-fun c!89579 () Bool)

(assert (=> d!105161 (= c!89579 e!461433)))

(declare-fun res!564356 () Bool)

(assert (=> d!105161 (=> (not res!564356) (not e!461433))))

(assert (=> d!105161 (= res!564356 (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(assert (=> d!105161 (= lt!375214 e!461436)))

(declare-fun c!89580 () Bool)

(assert (=> d!105161 (= c!89580 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105161 (validMask!0 mask!1312)))

(assert (=> d!105161 (= (getCurrentListMap!2578 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375212)))

(declare-fun b!828163 () Bool)

(declare-fun call!35988 () ListLongMap!8919)

(assert (=> b!828163 (= e!461439 call!35988)))

(declare-fun b!828164 () Bool)

(declare-fun e!461434 () Bool)

(declare-fun call!35983 () Bool)

(assert (=> b!828164 (= e!461434 (not call!35983))))

(declare-fun b!828165 () Bool)

(declare-fun e!461429 () Bool)

(declare-fun e!461440 () Bool)

(assert (=> b!828165 (= e!461429 e!461440)))

(declare-fun res!564353 () Bool)

(assert (=> b!828165 (=> (not res!564353) (not e!461440))))

(assert (=> b!828165 (= res!564353 (contains!4187 lt!375212 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828165 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(declare-fun bm!35981 () Bool)

(assert (=> bm!35981 (= call!35982 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828166 () Bool)

(assert (=> b!828166 (= e!461441 e!461437)))

(declare-fun res!564354 () Bool)

(declare-fun call!35984 () Bool)

(assert (=> b!828166 (= res!564354 call!35984)))

(assert (=> b!828166 (=> (not res!564354) (not e!461437))))

(declare-fun b!828167 () Bool)

(assert (=> b!828167 (= e!461441 (not call!35984))))

(declare-fun bm!35982 () Bool)

(assert (=> bm!35982 (= call!35983 (contains!4187 lt!375212 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35983 () Bool)

(assert (=> bm!35983 (= call!35984 (contains!4187 lt!375212 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35984 () Bool)

(assert (=> bm!35984 (= call!35987 (+!1959 (ite c!89580 call!35982 (ite c!89581 call!35985 call!35988)) (ite (or c!89580 c!89581) (tuple2!10097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!828168 () Bool)

(assert (=> b!828168 (= e!461440 (= (apply!365 lt!375212 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)) (get!11786 (select (arr!22261 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!828168 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22682 _values!788)))))

(assert (=> b!828168 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(declare-fun b!828169 () Bool)

(assert (=> b!828169 (= e!461430 call!35986)))

(declare-fun bm!35985 () Bool)

(assert (=> bm!35985 (= call!35988 call!35985)))

(declare-fun b!828170 () Bool)

(assert (=> b!828170 (= e!461434 e!461432)))

(declare-fun res!564357 () Bool)

(assert (=> b!828170 (= res!564357 call!35983)))

(assert (=> b!828170 (=> (not res!564357) (not e!461432))))

(declare-fun b!828171 () Bool)

(declare-fun res!564351 () Bool)

(assert (=> b!828171 (=> (not res!564351) (not e!461435))))

(assert (=> b!828171 (= res!564351 e!461434)))

(declare-fun c!89583 () Bool)

(assert (=> b!828171 (= c!89583 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!828172 () Bool)

(declare-fun res!564352 () Bool)

(assert (=> b!828172 (=> (not res!564352) (not e!461435))))

(assert (=> b!828172 (= res!564352 e!461429)))

(declare-fun res!564350 () Bool)

(assert (=> b!828172 (=> res!564350 e!461429)))

(assert (=> b!828172 (= res!564350 (not e!461438))))

(declare-fun res!564358 () Bool)

(assert (=> b!828172 (=> (not res!564358) (not e!461438))))

(assert (=> b!828172 (= res!564358 (bvslt #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(assert (= (and d!105161 c!89580) b!828161))

(assert (= (and d!105161 (not c!89580)) b!828158))

(assert (= (and b!828158 c!89581) b!828169))

(assert (= (and b!828158 (not c!89581)) b!828156))

(assert (= (and b!828156 c!89584) b!828162))

(assert (= (and b!828156 (not c!89584)) b!828163))

(assert (= (or b!828162 b!828163) bm!35985))

(assert (= (or b!828169 bm!35985) bm!35980))

(assert (= (or b!828169 b!828162) bm!35979))

(assert (= (or b!828161 bm!35980) bm!35981))

(assert (= (or b!828161 bm!35979) bm!35984))

(assert (= (and d!105161 res!564356) b!828152))

(assert (= (and d!105161 c!89579) b!828159))

(assert (= (and d!105161 (not c!89579)) b!828153))

(assert (= (and d!105161 res!564355) b!828172))

(assert (= (and b!828172 res!564358) b!828157))

(assert (= (and b!828172 (not res!564350)) b!828165))

(assert (= (and b!828165 res!564353) b!828168))

(assert (= (and b!828172 res!564352) b!828171))

(assert (= (and b!828171 c!89583) b!828170))

(assert (= (and b!828171 (not c!89583)) b!828164))

(assert (= (and b!828170 res!564357) b!828160))

(assert (= (or b!828170 b!828164) bm!35982))

(assert (= (and b!828171 res!564351) b!828154))

(assert (= (and b!828154 c!89582) b!828166))

(assert (= (and b!828154 (not c!89582)) b!828167))

(assert (= (and b!828166 res!564354) b!828155))

(assert (= (or b!828166 b!828167) bm!35983))

(declare-fun b_lambda!11189 () Bool)

(assert (=> (not b_lambda!11189) (not b!828168)))

(assert (=> b!828168 t!22243))

(declare-fun b_and!22385 () Bool)

(assert (= b_and!22383 (and (=> t!22243 result!7973) b_and!22385)))

(assert (=> b!828157 m!771001))

(assert (=> b!828157 m!771001))

(assert (=> b!828157 m!771007))

(declare-fun m!771109 () Bool)

(assert (=> bm!35982 m!771109))

(assert (=> b!828165 m!771001))

(assert (=> b!828165 m!771001))

(declare-fun m!771111 () Bool)

(assert (=> b!828165 m!771111))

(declare-fun m!771113 () Bool)

(assert (=> b!828155 m!771113))

(declare-fun m!771115 () Bool)

(assert (=> bm!35984 m!771115))

(declare-fun m!771117 () Bool)

(assert (=> b!828161 m!771117))

(assert (=> bm!35981 m!770963))

(declare-fun m!771119 () Bool)

(assert (=> bm!35983 m!771119))

(declare-fun m!771121 () Bool)

(assert (=> b!828160 m!771121))

(declare-fun m!771123 () Bool)

(assert (=> b!828159 m!771123))

(declare-fun m!771125 () Bool)

(assert (=> b!828159 m!771125))

(assert (=> b!828159 m!771001))

(declare-fun m!771127 () Bool)

(assert (=> b!828159 m!771127))

(declare-fun m!771129 () Bool)

(assert (=> b!828159 m!771129))

(declare-fun m!771131 () Bool)

(assert (=> b!828159 m!771131))

(declare-fun m!771133 () Bool)

(assert (=> b!828159 m!771133))

(declare-fun m!771135 () Bool)

(assert (=> b!828159 m!771135))

(declare-fun m!771137 () Bool)

(assert (=> b!828159 m!771137))

(declare-fun m!771139 () Bool)

(assert (=> b!828159 m!771139))

(assert (=> b!828159 m!771131))

(declare-fun m!771141 () Bool)

(assert (=> b!828159 m!771141))

(assert (=> b!828159 m!771123))

(assert (=> b!828159 m!771137))

(declare-fun m!771143 () Bool)

(assert (=> b!828159 m!771143))

(assert (=> b!828159 m!770963))

(assert (=> b!828159 m!771143))

(declare-fun m!771145 () Bool)

(assert (=> b!828159 m!771145))

(declare-fun m!771147 () Bool)

(assert (=> b!828159 m!771147))

(declare-fun m!771149 () Bool)

(assert (=> b!828159 m!771149))

(declare-fun m!771151 () Bool)

(assert (=> b!828159 m!771151))

(assert (=> b!828168 m!771001))

(declare-fun m!771153 () Bool)

(assert (=> b!828168 m!771153))

(assert (=> b!828168 m!771013))

(assert (=> b!828168 m!771013))

(assert (=> b!828168 m!771015))

(assert (=> b!828168 m!771017))

(assert (=> b!828168 m!771015))

(assert (=> b!828168 m!771001))

(assert (=> b!828152 m!771001))

(assert (=> b!828152 m!771001))

(assert (=> b!828152 m!771007))

(assert (=> d!105161 m!770953))

(assert (=> b!828003 d!105161))

(declare-fun b!828183 () Bool)

(declare-fun e!461452 () Bool)

(declare-fun call!35991 () Bool)

(assert (=> b!828183 (= e!461452 call!35991)))

(declare-fun b!828184 () Bool)

(declare-fun e!461451 () Bool)

(declare-fun contains!4189 (List!15889 (_ BitVec 64)) Bool)

(assert (=> b!828184 (= e!461451 (contains!4189 Nil!15886 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828185 () Bool)

(declare-fun e!461453 () Bool)

(assert (=> b!828185 (= e!461453 e!461452)))

(declare-fun c!89587 () Bool)

(assert (=> b!828185 (= c!89587 (validKeyInArray!0 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105163 () Bool)

(declare-fun res!564367 () Bool)

(declare-fun e!461450 () Bool)

(assert (=> d!105163 (=> res!564367 e!461450)))

(assert (=> d!105163 (= res!564367 (bvsge #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(assert (=> d!105163 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15886) e!461450)))

(declare-fun b!828186 () Bool)

(assert (=> b!828186 (= e!461450 e!461453)))

(declare-fun res!564366 () Bool)

(assert (=> b!828186 (=> (not res!564366) (not e!461453))))

(assert (=> b!828186 (= res!564366 (not e!461451))))

(declare-fun res!564365 () Bool)

(assert (=> b!828186 (=> (not res!564365) (not e!461451))))

(assert (=> b!828186 (= res!564365 (validKeyInArray!0 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35988 () Bool)

(assert (=> bm!35988 (= call!35991 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89587 (Cons!15885 (select (arr!22260 _keys!976) #b00000000000000000000000000000000) Nil!15886) Nil!15886)))))

(declare-fun b!828187 () Bool)

(assert (=> b!828187 (= e!461452 call!35991)))

(assert (= (and d!105163 (not res!564367)) b!828186))

(assert (= (and b!828186 res!564365) b!828184))

(assert (= (and b!828186 res!564366) b!828185))

(assert (= (and b!828185 c!89587) b!828187))

(assert (= (and b!828185 (not c!89587)) b!828183))

(assert (= (or b!828187 b!828183) bm!35988))

(assert (=> b!828184 m!771001))

(assert (=> b!828184 m!771001))

(declare-fun m!771155 () Bool)

(assert (=> b!828184 m!771155))

(assert (=> b!828185 m!771001))

(assert (=> b!828185 m!771001))

(assert (=> b!828185 m!771007))

(assert (=> b!828186 m!771001))

(assert (=> b!828186 m!771001))

(assert (=> b!828186 m!771007))

(assert (=> bm!35988 m!771001))

(declare-fun m!771157 () Bool)

(assert (=> bm!35988 m!771157))

(assert (=> b!828008 d!105163))

(declare-fun bm!35991 () Bool)

(declare-fun call!35994 () Bool)

(assert (=> bm!35991 (= call!35994 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!828196 () Bool)

(declare-fun e!461461 () Bool)

(assert (=> b!828196 (= e!461461 call!35994)))

(declare-fun b!828197 () Bool)

(declare-fun e!461460 () Bool)

(assert (=> b!828197 (= e!461461 e!461460)))

(declare-fun lt!375232 () (_ BitVec 64))

(assert (=> b!828197 (= lt!375232 (select (arr!22260 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375233 () Unit!28367)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46434 (_ BitVec 64) (_ BitVec 32)) Unit!28367)

(assert (=> b!828197 (= lt!375233 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!375232 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!828197 (arrayContainsKey!0 _keys!976 lt!375232 #b00000000000000000000000000000000)))

(declare-fun lt!375231 () Unit!28367)

(assert (=> b!828197 (= lt!375231 lt!375233)))

(declare-fun res!564373 () Bool)

(declare-datatypes ((SeekEntryResult!8737 0))(
  ( (MissingZero!8737 (index!37319 (_ BitVec 32))) (Found!8737 (index!37320 (_ BitVec 32))) (Intermediate!8737 (undefined!9549 Bool) (index!37321 (_ BitVec 32)) (x!69929 (_ BitVec 32))) (Undefined!8737) (MissingVacant!8737 (index!37322 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46434 (_ BitVec 32)) SeekEntryResult!8737)

(assert (=> b!828197 (= res!564373 (= (seekEntryOrOpen!0 (select (arr!22260 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8737 #b00000000000000000000000000000000)))))

(assert (=> b!828197 (=> (not res!564373) (not e!461460))))

(declare-fun b!828198 () Bool)

(assert (=> b!828198 (= e!461460 call!35994)))

(declare-fun b!828199 () Bool)

(declare-fun e!461462 () Bool)

(assert (=> b!828199 (= e!461462 e!461461)))

(declare-fun c!89590 () Bool)

(assert (=> b!828199 (= c!89590 (validKeyInArray!0 (select (arr!22260 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105165 () Bool)

(declare-fun res!564372 () Bool)

(assert (=> d!105165 (=> res!564372 e!461462)))

(assert (=> d!105165 (= res!564372 (bvsge #b00000000000000000000000000000000 (size!22681 _keys!976)))))

(assert (=> d!105165 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!461462)))

(assert (= (and d!105165 (not res!564372)) b!828199))

(assert (= (and b!828199 c!89590) b!828197))

(assert (= (and b!828199 (not c!89590)) b!828196))

(assert (= (and b!828197 res!564373) b!828198))

(assert (= (or b!828198 b!828196) bm!35991))

(declare-fun m!771159 () Bool)

(assert (=> bm!35991 m!771159))

(assert (=> b!828197 m!771001))

(declare-fun m!771161 () Bool)

(assert (=> b!828197 m!771161))

(declare-fun m!771163 () Bool)

(assert (=> b!828197 m!771163))

(assert (=> b!828197 m!771001))

(declare-fun m!771165 () Bool)

(assert (=> b!828197 m!771165))

(assert (=> b!828199 m!771001))

(assert (=> b!828199 m!771001))

(assert (=> b!828199 m!771007))

(assert (=> b!828001 d!105165))

(declare-fun b!828207 () Bool)

(declare-fun e!461467 () Bool)

(assert (=> b!828207 (= e!461467 tp_is_empty!15135)))

(declare-fun mapIsEmpty!24340 () Bool)

(declare-fun mapRes!24340 () Bool)

(assert (=> mapIsEmpty!24340 mapRes!24340))

(declare-fun condMapEmpty!24340 () Bool)

(declare-fun mapDefault!24340 () ValueCell!7152)

(assert (=> mapNonEmpty!24334 (= condMapEmpty!24340 (= mapRest!24334 ((as const (Array (_ BitVec 32) ValueCell!7152)) mapDefault!24340)))))

(assert (=> mapNonEmpty!24334 (= tp!47040 (and e!461467 mapRes!24340))))

(declare-fun mapNonEmpty!24340 () Bool)

(declare-fun tp!47050 () Bool)

(declare-fun e!461468 () Bool)

(assert (=> mapNonEmpty!24340 (= mapRes!24340 (and tp!47050 e!461468))))

(declare-fun mapRest!24340 () (Array (_ BitVec 32) ValueCell!7152))

(declare-fun mapValue!24340 () ValueCell!7152)

(declare-fun mapKey!24340 () (_ BitVec 32))

(assert (=> mapNonEmpty!24340 (= mapRest!24334 (store mapRest!24340 mapKey!24340 mapValue!24340))))

(declare-fun b!828206 () Bool)

(assert (=> b!828206 (= e!461468 tp_is_empty!15135)))

(assert (= (and mapNonEmpty!24334 condMapEmpty!24340) mapIsEmpty!24340))

(assert (= (and mapNonEmpty!24334 (not condMapEmpty!24340)) mapNonEmpty!24340))

(assert (= (and mapNonEmpty!24340 ((_ is ValueCellFull!7152) mapValue!24340)) b!828206))

(assert (= (and mapNonEmpty!24334 ((_ is ValueCellFull!7152) mapDefault!24340)) b!828207))

(declare-fun m!771167 () Bool)

(assert (=> mapNonEmpty!24340 m!771167))

(declare-fun b_lambda!11191 () Bool)

(assert (= b_lambda!11185 (or (and start!71290 b_free!13425) b_lambda!11191)))

(declare-fun b_lambda!11193 () Bool)

(assert (= b_lambda!11183 (or (and start!71290 b_free!13425) b_lambda!11193)))

(declare-fun b_lambda!11195 () Bool)

(assert (= b_lambda!11181 (or (and start!71290 b_free!13425) b_lambda!11195)))

(declare-fun b_lambda!11197 () Bool)

(assert (= b_lambda!11189 (or (and start!71290 b_free!13425) b_lambda!11197)))

(declare-fun b_lambda!11199 () Bool)

(assert (= b_lambda!11187 (or (and start!71290 b_free!13425) b_lambda!11199)))

(declare-fun b_lambda!11201 () Bool)

(assert (= b_lambda!11179 (or (and start!71290 b_free!13425) b_lambda!11201)))

(check-sat (not b!828186) (not b!828157) (not b!828159) (not b!828057) (not b!828134) (not b!828077) (not b!828165) (not b!828147) (not b_lambda!11199) tp_is_empty!15135 (not b!828082) (not b_next!13425) (not b!828160) (not d!105161) (not b!828058) (not b_lambda!11201) b_and!22385 (not b!828072) (not b!828074) (not bm!35974) (not b!828068) (not bm!35983) (not b!828087) (not b!828144) (not bm!35956) (not b!828081) (not b!828139) (not b_lambda!11195) (not b_lambda!11197) (not b!828067) (not b!828063) (not b!828138) (not b!828079) (not b!828140) (not b_lambda!11193) (not d!105159) (not bm!35984) (not b!828065) (not b!828168) (not b!828080) (not d!105145) (not b!828184) (not b!828199) (not bm!35977) (not bm!35982) (not d!105147) (not b!828197) (not b!828060) (not bm!35991) (not b!828071) (not b!828155) (not b!828066) (not bm!35957) (not bm!35988) (not b!828161) (not b_lambda!11191) (not d!105149) (not d!105157) (not b!828152) (not mapNonEmpty!24340) (not bm!35981) (not b!828136) (not b!828131) (not b!828185) (not bm!35975) (not bm!35976) (not b!828088))
(check-sat b_and!22385 (not b_next!13425))
