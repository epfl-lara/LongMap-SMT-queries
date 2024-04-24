; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105820 () Bool)

(assert start!105820)

(declare-fun b_free!27211 () Bool)

(declare-fun b_next!27211 () Bool)

(assert (=> start!105820 (= b_free!27211 (not b_next!27211))))

(declare-fun tp!95153 () Bool)

(declare-fun b_and!45079 () Bool)

(assert (=> start!105820 (= tp!95153 b_and!45079)))

(declare-fun b!1259236 () Bool)

(declare-fun e!716210 () Bool)

(declare-fun tp_is_empty!32113 () Bool)

(assert (=> b!1259236 (= e!716210 tp_is_empty!32113)))

(declare-fun b!1259237 () Bool)

(declare-fun res!838997 () Bool)

(declare-fun e!716209 () Bool)

(assert (=> b!1259237 (=> (not res!838997) (not e!716209))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81903 0))(
  ( (array!81904 (arr!39504 (Array (_ BitVec 32) (_ BitVec 64))) (size!40041 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81903)

(declare-datatypes ((V!48183 0))(
  ( (V!48184 (val!16119 Int)) )
))
(declare-datatypes ((ValueCell!15293 0))(
  ( (ValueCellFull!15293 (v!18817 V!48183)) (EmptyCell!15293) )
))
(declare-datatypes ((array!81905 0))(
  ( (array!81906 (arr!39505 (Array (_ BitVec 32) ValueCell!15293)) (size!40042 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81905)

(assert (=> b!1259237 (= res!838997 (and (= (size!40042 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40041 _keys!1118) (size!40042 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259238 () Bool)

(declare-fun res!838996 () Bool)

(assert (=> b!1259238 (=> (not res!838996) (not e!716209))))

(declare-datatypes ((List!28074 0))(
  ( (Nil!28071) (Cons!28070 (h!29288 (_ BitVec 64)) (t!41557 List!28074)) )
))
(declare-fun arrayNoDuplicates!0 (array!81903 (_ BitVec 32) List!28074) Bool)

(assert (=> b!1259238 (= res!838996 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28071))))

(declare-fun b!1259239 () Bool)

(declare-fun e!716211 () Bool)

(declare-fun mapRes!49960 () Bool)

(assert (=> b!1259239 (= e!716211 (and e!716210 mapRes!49960))))

(declare-fun condMapEmpty!49960 () Bool)

(declare-fun mapDefault!49960 () ValueCell!15293)

(assert (=> b!1259239 (= condMapEmpty!49960 (= (arr!39505 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15293)) mapDefault!49960)))))

(declare-fun mapNonEmpty!49960 () Bool)

(declare-fun tp!95152 () Bool)

(declare-fun e!716212 () Bool)

(assert (=> mapNonEmpty!49960 (= mapRes!49960 (and tp!95152 e!716212))))

(declare-fun mapKey!49960 () (_ BitVec 32))

(declare-fun mapRest!49960 () (Array (_ BitVec 32) ValueCell!15293))

(declare-fun mapValue!49960 () ValueCell!15293)

(assert (=> mapNonEmpty!49960 (= (arr!39505 _values!914) (store mapRest!49960 mapKey!49960 mapValue!49960))))

(declare-fun b!1259240 () Bool)

(assert (=> b!1259240 (= e!716209 (not (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!40041 _keys!1118)))))))

(declare-datatypes ((tuple2!20844 0))(
  ( (tuple2!20845 (_1!10433 (_ BitVec 64)) (_2!10433 V!48183)) )
))
(declare-datatypes ((List!28075 0))(
  ( (Nil!28072) (Cons!28071 (h!29289 tuple2!20844) (t!41558 List!28075)) )
))
(declare-datatypes ((ListLongMap!18725 0))(
  ( (ListLongMap!18726 (toList!9378 List!28075)) )
))
(declare-fun lt!569439 () ListLongMap!18725)

(declare-fun lt!569438 () ListLongMap!18725)

(assert (=> b!1259240 (= lt!569439 lt!569438)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48183)

(declare-fun zeroValue!871 () V!48183)

(declare-fun minValueBefore!43 () V!48183)

(declare-datatypes ((Unit!41899 0))(
  ( (Unit!41900) )
))
(declare-fun lt!569440 () Unit!41899)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1108 (array!81903 array!81905 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48183 V!48183 V!48183 V!48183 (_ BitVec 32) Int) Unit!41899)

(assert (=> b!1259240 (= lt!569440 (lemmaNoChangeToArrayThenSameMapNoExtras!1108 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5794 (array!81903 array!81905 (_ BitVec 32) (_ BitVec 32) V!48183 V!48183 (_ BitVec 32) Int) ListLongMap!18725)

(assert (=> b!1259240 (= lt!569438 (getCurrentListMapNoExtraKeys!5794 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259240 (= lt!569439 (getCurrentListMapNoExtraKeys!5794 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259241 () Bool)

(declare-fun res!838994 () Bool)

(assert (=> b!1259241 (=> (not res!838994) (not e!716209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81903 (_ BitVec 32)) Bool)

(assert (=> b!1259241 (= res!838994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259242 () Bool)

(assert (=> b!1259242 (= e!716212 tp_is_empty!32113)))

(declare-fun res!838995 () Bool)

(assert (=> start!105820 (=> (not res!838995) (not e!716209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105820 (= res!838995 (validMask!0 mask!1466))))

(assert (=> start!105820 e!716209))

(assert (=> start!105820 true))

(assert (=> start!105820 tp!95153))

(assert (=> start!105820 tp_is_empty!32113))

(declare-fun array_inv!30225 (array!81903) Bool)

(assert (=> start!105820 (array_inv!30225 _keys!1118)))

(declare-fun array_inv!30226 (array!81905) Bool)

(assert (=> start!105820 (and (array_inv!30226 _values!914) e!716211)))

(declare-fun mapIsEmpty!49960 () Bool)

(assert (=> mapIsEmpty!49960 mapRes!49960))

(assert (= (and start!105820 res!838995) b!1259237))

(assert (= (and b!1259237 res!838997) b!1259241))

(assert (= (and b!1259241 res!838994) b!1259238))

(assert (= (and b!1259238 res!838996) b!1259240))

(assert (= (and b!1259239 condMapEmpty!49960) mapIsEmpty!49960))

(assert (= (and b!1259239 (not condMapEmpty!49960)) mapNonEmpty!49960))

(get-info :version)

(assert (= (and mapNonEmpty!49960 ((_ is ValueCellFull!15293) mapValue!49960)) b!1259242))

(assert (= (and b!1259239 ((_ is ValueCellFull!15293) mapDefault!49960)) b!1259236))

(assert (= start!105820 b!1259239))

(declare-fun m!1160061 () Bool)

(assert (=> b!1259241 m!1160061))

(declare-fun m!1160063 () Bool)

(assert (=> b!1259238 m!1160063))

(declare-fun m!1160065 () Bool)

(assert (=> mapNonEmpty!49960 m!1160065))

(declare-fun m!1160067 () Bool)

(assert (=> b!1259240 m!1160067))

(declare-fun m!1160069 () Bool)

(assert (=> b!1259240 m!1160069))

(declare-fun m!1160071 () Bool)

(assert (=> b!1259240 m!1160071))

(declare-fun m!1160073 () Bool)

(assert (=> start!105820 m!1160073))

(declare-fun m!1160075 () Bool)

(assert (=> start!105820 m!1160075))

(declare-fun m!1160077 () Bool)

(assert (=> start!105820 m!1160077))

(check-sat (not mapNonEmpty!49960) tp_is_empty!32113 b_and!45079 (not b!1259240) (not b!1259238) (not b!1259241) (not b_next!27211) (not start!105820))
(check-sat b_and!45079 (not b_next!27211))
(get-model)

(declare-fun d!138717 () Bool)

(assert (=> d!138717 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105820 d!138717))

(declare-fun d!138719 () Bool)

(assert (=> d!138719 (= (array_inv!30225 _keys!1118) (bvsge (size!40041 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105820 d!138719))

(declare-fun d!138721 () Bool)

(assert (=> d!138721 (= (array_inv!30226 _values!914) (bvsge (size!40042 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105820 d!138721))

(declare-fun d!138723 () Bool)

(assert (=> d!138723 (= (getCurrentListMapNoExtraKeys!5794 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5794 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569461 () Unit!41899)

(declare-fun choose!1866 (array!81903 array!81905 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48183 V!48183 V!48183 V!48183 (_ BitVec 32) Int) Unit!41899)

(assert (=> d!138723 (= lt!569461 (choose!1866 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138723 (validMask!0 mask!1466)))

(assert (=> d!138723 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1108 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569461)))

(declare-fun bs!35595 () Bool)

(assert (= bs!35595 d!138723))

(assert (=> bs!35595 m!1160071))

(assert (=> bs!35595 m!1160069))

(declare-fun m!1160115 () Bool)

(assert (=> bs!35595 m!1160115))

(assert (=> bs!35595 m!1160073))

(assert (=> b!1259240 d!138723))

(declare-fun b!1259309 () Bool)

(declare-fun lt!569482 () Unit!41899)

(declare-fun lt!569481 () Unit!41899)

(assert (=> b!1259309 (= lt!569482 lt!569481)))

(declare-fun lt!569476 () (_ BitVec 64))

(declare-fun lt!569480 () ListLongMap!18725)

(declare-fun lt!569477 () (_ BitVec 64))

(declare-fun lt!569478 () V!48183)

(declare-fun contains!7594 (ListLongMap!18725 (_ BitVec 64)) Bool)

(declare-fun +!4240 (ListLongMap!18725 tuple2!20844) ListLongMap!18725)

(assert (=> b!1259309 (not (contains!7594 (+!4240 lt!569480 (tuple2!20845 lt!569477 lt!569478)) lt!569476))))

(declare-fun addStillNotContains!320 (ListLongMap!18725 (_ BitVec 64) V!48183 (_ BitVec 64)) Unit!41899)

(assert (=> b!1259309 (= lt!569481 (addStillNotContains!320 lt!569480 lt!569477 lt!569478 lt!569476))))

(assert (=> b!1259309 (= lt!569476 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20230 (ValueCell!15293 V!48183) V!48183)

(declare-fun dynLambda!3451 (Int (_ BitVec 64)) V!48183)

(assert (=> b!1259309 (= lt!569478 (get!20230 (select (arr!39505 _values!914) #b00000000000000000000000000000000) (dynLambda!3451 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1259309 (= lt!569477 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61907 () ListLongMap!18725)

(assert (=> b!1259309 (= lt!569480 call!61907)))

(declare-fun e!716260 () ListLongMap!18725)

(assert (=> b!1259309 (= e!716260 (+!4240 call!61907 (tuple2!20845 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000) (get!20230 (select (arr!39505 _values!914) #b00000000000000000000000000000000) (dynLambda!3451 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1259310 () Bool)

(declare-fun e!716264 () ListLongMap!18725)

(assert (=> b!1259310 (= e!716264 (ListLongMap!18726 Nil!28072))))

(declare-fun b!1259311 () Bool)

(declare-fun e!716258 () Bool)

(declare-fun e!716263 () Bool)

(assert (=> b!1259311 (= e!716258 e!716263)))

(declare-fun c!122904 () Bool)

(declare-fun e!716259 () Bool)

(assert (=> b!1259311 (= c!122904 e!716259)))

(declare-fun res!839031 () Bool)

(assert (=> b!1259311 (=> (not res!839031) (not e!716259))))

(assert (=> b!1259311 (= res!839031 (bvslt #b00000000000000000000000000000000 (size!40041 _keys!1118)))))

(declare-fun b!1259312 () Bool)

(assert (=> b!1259312 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40041 _keys!1118)))))

(assert (=> b!1259312 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40042 _values!914)))))

(declare-fun lt!569479 () ListLongMap!18725)

(declare-fun e!716262 () Bool)

(declare-fun apply!999 (ListLongMap!18725 (_ BitVec 64)) V!48183)

(assert (=> b!1259312 (= e!716262 (= (apply!999 lt!569479 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000)) (get!20230 (select (arr!39505 _values!914) #b00000000000000000000000000000000) (dynLambda!3451 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!716261 () Bool)

(declare-fun b!1259313 () Bool)

(assert (=> b!1259313 (= e!716261 (= lt!569479 (getCurrentListMapNoExtraKeys!5794 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1259314 () Bool)

(declare-fun res!839033 () Bool)

(assert (=> b!1259314 (=> (not res!839033) (not e!716258))))

(assert (=> b!1259314 (= res!839033 (not (contains!7594 lt!569479 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138725 () Bool)

(assert (=> d!138725 e!716258))

(declare-fun res!839030 () Bool)

(assert (=> d!138725 (=> (not res!839030) (not e!716258))))

(assert (=> d!138725 (= res!839030 (not (contains!7594 lt!569479 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138725 (= lt!569479 e!716264)))

(declare-fun c!122905 () Bool)

(assert (=> d!138725 (= c!122905 (bvsge #b00000000000000000000000000000000 (size!40041 _keys!1118)))))

(assert (=> d!138725 (validMask!0 mask!1466)))

(assert (=> d!138725 (= (getCurrentListMapNoExtraKeys!5794 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569479)))

(declare-fun b!1259315 () Bool)

(assert (=> b!1259315 (= e!716260 call!61907)))

(declare-fun b!1259316 () Bool)

(assert (=> b!1259316 (= e!716264 e!716260)))

(declare-fun c!122903 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1259316 (= c!122903 (validKeyInArray!0 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1259317 () Bool)

(assert (=> b!1259317 (= e!716263 e!716261)))

(declare-fun c!122906 () Bool)

(assert (=> b!1259317 (= c!122906 (bvslt #b00000000000000000000000000000000 (size!40041 _keys!1118)))))

(declare-fun b!1259318 () Bool)

(assert (=> b!1259318 (= e!716263 e!716262)))

(assert (=> b!1259318 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40041 _keys!1118)))))

(declare-fun res!839032 () Bool)

(assert (=> b!1259318 (= res!839032 (contains!7594 lt!569479 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259318 (=> (not res!839032) (not e!716262))))

(declare-fun bm!61904 () Bool)

(assert (=> bm!61904 (= call!61907 (getCurrentListMapNoExtraKeys!5794 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1259319 () Bool)

(declare-fun isEmpty!1036 (ListLongMap!18725) Bool)

(assert (=> b!1259319 (= e!716261 (isEmpty!1036 lt!569479))))

(declare-fun b!1259320 () Bool)

(assert (=> b!1259320 (= e!716259 (validKeyInArray!0 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259320 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!138725 c!122905) b!1259310))

(assert (= (and d!138725 (not c!122905)) b!1259316))

(assert (= (and b!1259316 c!122903) b!1259309))

(assert (= (and b!1259316 (not c!122903)) b!1259315))

(assert (= (or b!1259309 b!1259315) bm!61904))

(assert (= (and d!138725 res!839030) b!1259314))

(assert (= (and b!1259314 res!839033) b!1259311))

(assert (= (and b!1259311 res!839031) b!1259320))

(assert (= (and b!1259311 c!122904) b!1259318))

(assert (= (and b!1259311 (not c!122904)) b!1259317))

(assert (= (and b!1259318 res!839032) b!1259312))

(assert (= (and b!1259317 c!122906) b!1259313))

(assert (= (and b!1259317 (not c!122906)) b!1259319))

(declare-fun b_lambda!22701 () Bool)

(assert (=> (not b_lambda!22701) (not b!1259309)))

(declare-fun t!41563 () Bool)

(declare-fun tb!11299 () Bool)

(assert (=> (and start!105820 (= defaultEntry!922 defaultEntry!922) t!41563) tb!11299))

(declare-fun result!23321 () Bool)

(assert (=> tb!11299 (= result!23321 tp_is_empty!32113)))

(assert (=> b!1259309 t!41563))

(declare-fun b_and!45085 () Bool)

(assert (= b_and!45079 (and (=> t!41563 result!23321) b_and!45085)))

(declare-fun b_lambda!22703 () Bool)

(assert (=> (not b_lambda!22703) (not b!1259312)))

(assert (=> b!1259312 t!41563))

(declare-fun b_and!45087 () Bool)

(assert (= b_and!45085 (and (=> t!41563 result!23321) b_and!45087)))

(declare-fun m!1160117 () Bool)

(assert (=> b!1259316 m!1160117))

(assert (=> b!1259316 m!1160117))

(declare-fun m!1160119 () Bool)

(assert (=> b!1259316 m!1160119))

(declare-fun m!1160121 () Bool)

(assert (=> b!1259313 m!1160121))

(declare-fun m!1160123 () Bool)

(assert (=> b!1259319 m!1160123))

(assert (=> b!1259320 m!1160117))

(assert (=> b!1259320 m!1160117))

(assert (=> b!1259320 m!1160119))

(declare-fun m!1160125 () Bool)

(assert (=> d!138725 m!1160125))

(assert (=> d!138725 m!1160073))

(declare-fun m!1160127 () Bool)

(assert (=> b!1259314 m!1160127))

(declare-fun m!1160129 () Bool)

(assert (=> b!1259309 m!1160129))

(declare-fun m!1160131 () Bool)

(assert (=> b!1259309 m!1160131))

(declare-fun m!1160133 () Bool)

(assert (=> b!1259309 m!1160133))

(assert (=> b!1259309 m!1160117))

(declare-fun m!1160135 () Bool)

(assert (=> b!1259309 m!1160135))

(declare-fun m!1160137 () Bool)

(assert (=> b!1259309 m!1160137))

(assert (=> b!1259309 m!1160129))

(declare-fun m!1160139 () Bool)

(assert (=> b!1259309 m!1160139))

(assert (=> b!1259309 m!1160131))

(assert (=> b!1259309 m!1160135))

(declare-fun m!1160141 () Bool)

(assert (=> b!1259309 m!1160141))

(assert (=> bm!61904 m!1160121))

(assert (=> b!1259318 m!1160117))

(assert (=> b!1259318 m!1160117))

(declare-fun m!1160143 () Bool)

(assert (=> b!1259318 m!1160143))

(assert (=> b!1259312 m!1160117))

(declare-fun m!1160145 () Bool)

(assert (=> b!1259312 m!1160145))

(assert (=> b!1259312 m!1160131))

(assert (=> b!1259312 m!1160135))

(assert (=> b!1259312 m!1160131))

(assert (=> b!1259312 m!1160135))

(assert (=> b!1259312 m!1160141))

(assert (=> b!1259312 m!1160117))

(assert (=> b!1259240 d!138725))

(declare-fun b!1259323 () Bool)

(declare-fun lt!569489 () Unit!41899)

(declare-fun lt!569488 () Unit!41899)

(assert (=> b!1259323 (= lt!569489 lt!569488)))

(declare-fun lt!569484 () (_ BitVec 64))

(declare-fun lt!569485 () V!48183)

(declare-fun lt!569483 () (_ BitVec 64))

(declare-fun lt!569487 () ListLongMap!18725)

(assert (=> b!1259323 (not (contains!7594 (+!4240 lt!569487 (tuple2!20845 lt!569484 lt!569485)) lt!569483))))

(assert (=> b!1259323 (= lt!569488 (addStillNotContains!320 lt!569487 lt!569484 lt!569485 lt!569483))))

(assert (=> b!1259323 (= lt!569483 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1259323 (= lt!569485 (get!20230 (select (arr!39505 _values!914) #b00000000000000000000000000000000) (dynLambda!3451 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1259323 (= lt!569484 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61908 () ListLongMap!18725)

(assert (=> b!1259323 (= lt!569487 call!61908)))

(declare-fun e!716267 () ListLongMap!18725)

(assert (=> b!1259323 (= e!716267 (+!4240 call!61908 (tuple2!20845 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000) (get!20230 (select (arr!39505 _values!914) #b00000000000000000000000000000000) (dynLambda!3451 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1259324 () Bool)

(declare-fun e!716271 () ListLongMap!18725)

(assert (=> b!1259324 (= e!716271 (ListLongMap!18726 Nil!28072))))

(declare-fun b!1259325 () Bool)

(declare-fun e!716265 () Bool)

(declare-fun e!716270 () Bool)

(assert (=> b!1259325 (= e!716265 e!716270)))

(declare-fun c!122908 () Bool)

(declare-fun e!716266 () Bool)

(assert (=> b!1259325 (= c!122908 e!716266)))

(declare-fun res!839035 () Bool)

(assert (=> b!1259325 (=> (not res!839035) (not e!716266))))

(assert (=> b!1259325 (= res!839035 (bvslt #b00000000000000000000000000000000 (size!40041 _keys!1118)))))

(declare-fun b!1259326 () Bool)

(assert (=> b!1259326 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40041 _keys!1118)))))

(assert (=> b!1259326 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40042 _values!914)))))

(declare-fun lt!569486 () ListLongMap!18725)

(declare-fun e!716269 () Bool)

(assert (=> b!1259326 (= e!716269 (= (apply!999 lt!569486 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000)) (get!20230 (select (arr!39505 _values!914) #b00000000000000000000000000000000) (dynLambda!3451 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1259327 () Bool)

(declare-fun e!716268 () Bool)

(assert (=> b!1259327 (= e!716268 (= lt!569486 (getCurrentListMapNoExtraKeys!5794 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1259328 () Bool)

(declare-fun res!839037 () Bool)

(assert (=> b!1259328 (=> (not res!839037) (not e!716265))))

(assert (=> b!1259328 (= res!839037 (not (contains!7594 lt!569486 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138727 () Bool)

(assert (=> d!138727 e!716265))

(declare-fun res!839034 () Bool)

(assert (=> d!138727 (=> (not res!839034) (not e!716265))))

(assert (=> d!138727 (= res!839034 (not (contains!7594 lt!569486 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138727 (= lt!569486 e!716271)))

(declare-fun c!122909 () Bool)

(assert (=> d!138727 (= c!122909 (bvsge #b00000000000000000000000000000000 (size!40041 _keys!1118)))))

(assert (=> d!138727 (validMask!0 mask!1466)))

(assert (=> d!138727 (= (getCurrentListMapNoExtraKeys!5794 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569486)))

(declare-fun b!1259329 () Bool)

(assert (=> b!1259329 (= e!716267 call!61908)))

(declare-fun b!1259330 () Bool)

(assert (=> b!1259330 (= e!716271 e!716267)))

(declare-fun c!122907 () Bool)

(assert (=> b!1259330 (= c!122907 (validKeyInArray!0 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1259331 () Bool)

(assert (=> b!1259331 (= e!716270 e!716268)))

(declare-fun c!122910 () Bool)

(assert (=> b!1259331 (= c!122910 (bvslt #b00000000000000000000000000000000 (size!40041 _keys!1118)))))

(declare-fun b!1259332 () Bool)

(assert (=> b!1259332 (= e!716270 e!716269)))

(assert (=> b!1259332 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40041 _keys!1118)))))

(declare-fun res!839036 () Bool)

(assert (=> b!1259332 (= res!839036 (contains!7594 lt!569486 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259332 (=> (not res!839036) (not e!716269))))

(declare-fun bm!61905 () Bool)

(assert (=> bm!61905 (= call!61908 (getCurrentListMapNoExtraKeys!5794 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1259333 () Bool)

(assert (=> b!1259333 (= e!716268 (isEmpty!1036 lt!569486))))

(declare-fun b!1259334 () Bool)

(assert (=> b!1259334 (= e!716266 (validKeyInArray!0 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259334 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!138727 c!122909) b!1259324))

(assert (= (and d!138727 (not c!122909)) b!1259330))

(assert (= (and b!1259330 c!122907) b!1259323))

(assert (= (and b!1259330 (not c!122907)) b!1259329))

(assert (= (or b!1259323 b!1259329) bm!61905))

(assert (= (and d!138727 res!839034) b!1259328))

(assert (= (and b!1259328 res!839037) b!1259325))

(assert (= (and b!1259325 res!839035) b!1259334))

(assert (= (and b!1259325 c!122908) b!1259332))

(assert (= (and b!1259325 (not c!122908)) b!1259331))

(assert (= (and b!1259332 res!839036) b!1259326))

(assert (= (and b!1259331 c!122910) b!1259327))

(assert (= (and b!1259331 (not c!122910)) b!1259333))

(declare-fun b_lambda!22705 () Bool)

(assert (=> (not b_lambda!22705) (not b!1259323)))

(assert (=> b!1259323 t!41563))

(declare-fun b_and!45089 () Bool)

(assert (= b_and!45087 (and (=> t!41563 result!23321) b_and!45089)))

(declare-fun b_lambda!22707 () Bool)

(assert (=> (not b_lambda!22707) (not b!1259326)))

(assert (=> b!1259326 t!41563))

(declare-fun b_and!45091 () Bool)

(assert (= b_and!45089 (and (=> t!41563 result!23321) b_and!45091)))

(assert (=> b!1259330 m!1160117))

(assert (=> b!1259330 m!1160117))

(assert (=> b!1259330 m!1160119))

(declare-fun m!1160147 () Bool)

(assert (=> b!1259327 m!1160147))

(declare-fun m!1160149 () Bool)

(assert (=> b!1259333 m!1160149))

(assert (=> b!1259334 m!1160117))

(assert (=> b!1259334 m!1160117))

(assert (=> b!1259334 m!1160119))

(declare-fun m!1160151 () Bool)

(assert (=> d!138727 m!1160151))

(assert (=> d!138727 m!1160073))

(declare-fun m!1160153 () Bool)

(assert (=> b!1259328 m!1160153))

(declare-fun m!1160155 () Bool)

(assert (=> b!1259323 m!1160155))

(assert (=> b!1259323 m!1160131))

(declare-fun m!1160157 () Bool)

(assert (=> b!1259323 m!1160157))

(assert (=> b!1259323 m!1160117))

(assert (=> b!1259323 m!1160135))

(declare-fun m!1160159 () Bool)

(assert (=> b!1259323 m!1160159))

(assert (=> b!1259323 m!1160155))

(declare-fun m!1160161 () Bool)

(assert (=> b!1259323 m!1160161))

(assert (=> b!1259323 m!1160131))

(assert (=> b!1259323 m!1160135))

(assert (=> b!1259323 m!1160141))

(assert (=> bm!61905 m!1160147))

(assert (=> b!1259332 m!1160117))

(assert (=> b!1259332 m!1160117))

(declare-fun m!1160163 () Bool)

(assert (=> b!1259332 m!1160163))

(assert (=> b!1259326 m!1160117))

(declare-fun m!1160165 () Bool)

(assert (=> b!1259326 m!1160165))

(assert (=> b!1259326 m!1160131))

(assert (=> b!1259326 m!1160135))

(assert (=> b!1259326 m!1160131))

(assert (=> b!1259326 m!1160135))

(assert (=> b!1259326 m!1160141))

(assert (=> b!1259326 m!1160117))

(assert (=> b!1259240 d!138727))

(declare-fun b!1259343 () Bool)

(declare-fun e!716279 () Bool)

(declare-fun call!61911 () Bool)

(assert (=> b!1259343 (= e!716279 call!61911)))

(declare-fun b!1259344 () Bool)

(declare-fun e!716280 () Bool)

(assert (=> b!1259344 (= e!716280 call!61911)))

(declare-fun d!138729 () Bool)

(declare-fun res!839043 () Bool)

(declare-fun e!716278 () Bool)

(assert (=> d!138729 (=> res!839043 e!716278)))

(assert (=> d!138729 (= res!839043 (bvsge #b00000000000000000000000000000000 (size!40041 _keys!1118)))))

(assert (=> d!138729 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!716278)))

(declare-fun b!1259345 () Bool)

(assert (=> b!1259345 (= e!716279 e!716280)))

(declare-fun lt!569497 () (_ BitVec 64))

(assert (=> b!1259345 (= lt!569497 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569498 () Unit!41899)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81903 (_ BitVec 64) (_ BitVec 32)) Unit!41899)

(assert (=> b!1259345 (= lt!569498 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!569497 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1259345 (arrayContainsKey!0 _keys!1118 lt!569497 #b00000000000000000000000000000000)))

(declare-fun lt!569496 () Unit!41899)

(assert (=> b!1259345 (= lt!569496 lt!569498)))

(declare-fun res!839042 () Bool)

(declare-datatypes ((SeekEntryResult!9924 0))(
  ( (MissingZero!9924 (index!42067 (_ BitVec 32))) (Found!9924 (index!42068 (_ BitVec 32))) (Intermediate!9924 (undefined!10736 Bool) (index!42069 (_ BitVec 32)) (x!110779 (_ BitVec 32))) (Undefined!9924) (MissingVacant!9924 (index!42070 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81903 (_ BitVec 32)) SeekEntryResult!9924)

(assert (=> b!1259345 (= res!839042 (= (seekEntryOrOpen!0 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9924 #b00000000000000000000000000000000)))))

(assert (=> b!1259345 (=> (not res!839042) (not e!716280))))

(declare-fun b!1259346 () Bool)

(assert (=> b!1259346 (= e!716278 e!716279)))

(declare-fun c!122913 () Bool)

(assert (=> b!1259346 (= c!122913 (validKeyInArray!0 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61908 () Bool)

(assert (=> bm!61908 (= call!61911 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!138729 (not res!839043)) b!1259346))

(assert (= (and b!1259346 c!122913) b!1259345))

(assert (= (and b!1259346 (not c!122913)) b!1259343))

(assert (= (and b!1259345 res!839042) b!1259344))

(assert (= (or b!1259344 b!1259343) bm!61908))

(assert (=> b!1259345 m!1160117))

(declare-fun m!1160167 () Bool)

(assert (=> b!1259345 m!1160167))

(declare-fun m!1160169 () Bool)

(assert (=> b!1259345 m!1160169))

(assert (=> b!1259345 m!1160117))

(declare-fun m!1160171 () Bool)

(assert (=> b!1259345 m!1160171))

(assert (=> b!1259346 m!1160117))

(assert (=> b!1259346 m!1160117))

(assert (=> b!1259346 m!1160119))

(declare-fun m!1160173 () Bool)

(assert (=> bm!61908 m!1160173))

(assert (=> b!1259241 d!138729))

(declare-fun b!1259357 () Bool)

(declare-fun e!716289 () Bool)

(declare-fun e!716291 () Bool)

(assert (=> b!1259357 (= e!716289 e!716291)))

(declare-fun c!122916 () Bool)

(assert (=> b!1259357 (= c!122916 (validKeyInArray!0 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138731 () Bool)

(declare-fun res!839052 () Bool)

(declare-fun e!716292 () Bool)

(assert (=> d!138731 (=> res!839052 e!716292)))

(assert (=> d!138731 (= res!839052 (bvsge #b00000000000000000000000000000000 (size!40041 _keys!1118)))))

(assert (=> d!138731 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28071) e!716292)))

(declare-fun b!1259358 () Bool)

(declare-fun e!716290 () Bool)

(declare-fun contains!7595 (List!28074 (_ BitVec 64)) Bool)

(assert (=> b!1259358 (= e!716290 (contains!7595 Nil!28071 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61911 () Bool)

(declare-fun call!61914 () Bool)

(assert (=> bm!61911 (= call!61914 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122916 (Cons!28070 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000) Nil!28071) Nil!28071)))))

(declare-fun b!1259359 () Bool)

(assert (=> b!1259359 (= e!716291 call!61914)))

(declare-fun b!1259360 () Bool)

(assert (=> b!1259360 (= e!716291 call!61914)))

(declare-fun b!1259361 () Bool)

(assert (=> b!1259361 (= e!716292 e!716289)))

(declare-fun res!839050 () Bool)

(assert (=> b!1259361 (=> (not res!839050) (not e!716289))))

(assert (=> b!1259361 (= res!839050 (not e!716290))))

(declare-fun res!839051 () Bool)

(assert (=> b!1259361 (=> (not res!839051) (not e!716290))))

(assert (=> b!1259361 (= res!839051 (validKeyInArray!0 (select (arr!39504 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138731 (not res!839052)) b!1259361))

(assert (= (and b!1259361 res!839051) b!1259358))

(assert (= (and b!1259361 res!839050) b!1259357))

(assert (= (and b!1259357 c!122916) b!1259360))

(assert (= (and b!1259357 (not c!122916)) b!1259359))

(assert (= (or b!1259360 b!1259359) bm!61911))

(assert (=> b!1259357 m!1160117))

(assert (=> b!1259357 m!1160117))

(assert (=> b!1259357 m!1160119))

(assert (=> b!1259358 m!1160117))

(assert (=> b!1259358 m!1160117))

(declare-fun m!1160175 () Bool)

(assert (=> b!1259358 m!1160175))

(assert (=> bm!61911 m!1160117))

(declare-fun m!1160177 () Bool)

(assert (=> bm!61911 m!1160177))

(assert (=> b!1259361 m!1160117))

(assert (=> b!1259361 m!1160117))

(assert (=> b!1259361 m!1160119))

(assert (=> b!1259238 d!138731))

(declare-fun condMapEmpty!49969 () Bool)

(declare-fun mapDefault!49969 () ValueCell!15293)

(assert (=> mapNonEmpty!49960 (= condMapEmpty!49969 (= mapRest!49960 ((as const (Array (_ BitVec 32) ValueCell!15293)) mapDefault!49969)))))

(declare-fun e!716298 () Bool)

(declare-fun mapRes!49969 () Bool)

(assert (=> mapNonEmpty!49960 (= tp!95152 (and e!716298 mapRes!49969))))

(declare-fun b!1259368 () Bool)

(declare-fun e!716297 () Bool)

(assert (=> b!1259368 (= e!716297 tp_is_empty!32113)))

(declare-fun b!1259369 () Bool)

(assert (=> b!1259369 (= e!716298 tp_is_empty!32113)))

(declare-fun mapIsEmpty!49969 () Bool)

(assert (=> mapIsEmpty!49969 mapRes!49969))

(declare-fun mapNonEmpty!49969 () Bool)

(declare-fun tp!95168 () Bool)

(assert (=> mapNonEmpty!49969 (= mapRes!49969 (and tp!95168 e!716297))))

(declare-fun mapKey!49969 () (_ BitVec 32))

(declare-fun mapRest!49969 () (Array (_ BitVec 32) ValueCell!15293))

(declare-fun mapValue!49969 () ValueCell!15293)

(assert (=> mapNonEmpty!49969 (= mapRest!49960 (store mapRest!49969 mapKey!49969 mapValue!49969))))

(assert (= (and mapNonEmpty!49960 condMapEmpty!49969) mapIsEmpty!49969))

(assert (= (and mapNonEmpty!49960 (not condMapEmpty!49969)) mapNonEmpty!49969))

(assert (= (and mapNonEmpty!49969 ((_ is ValueCellFull!15293) mapValue!49969)) b!1259368))

(assert (= (and mapNonEmpty!49960 ((_ is ValueCellFull!15293) mapDefault!49969)) b!1259369))

(declare-fun m!1160179 () Bool)

(assert (=> mapNonEmpty!49969 m!1160179))

(declare-fun b_lambda!22709 () Bool)

(assert (= b_lambda!22705 (or (and start!105820 b_free!27211) b_lambda!22709)))

(declare-fun b_lambda!22711 () Bool)

(assert (= b_lambda!22707 (or (and start!105820 b_free!27211) b_lambda!22711)))

(declare-fun b_lambda!22713 () Bool)

(assert (= b_lambda!22701 (or (and start!105820 b_free!27211) b_lambda!22713)))

(declare-fun b_lambda!22715 () Bool)

(assert (= b_lambda!22703 (or (and start!105820 b_free!27211) b_lambda!22715)))

(check-sat (not b!1259332) (not b_lambda!22709) (not b!1259361) (not b!1259327) (not b_next!27211) (not b!1259314) (not b!1259312) (not b!1259328) (not b!1259333) (not bm!61904) (not b!1259320) (not b!1259313) (not bm!61911) (not d!138727) (not b!1259318) (not b_lambda!22711) (not bm!61905) tp_is_empty!32113 (not b!1259358) (not b!1259326) (not b_lambda!22715) (not b!1259319) (not b_lambda!22713) (not mapNonEmpty!49969) (not b!1259323) (not b!1259346) (not b!1259309) (not d!138725) (not b!1259330) (not b!1259334) b_and!45091 (not b!1259345) (not b!1259357) (not b!1259316) (not d!138723) (not bm!61908))
(check-sat b_and!45091 (not b_next!27211))
