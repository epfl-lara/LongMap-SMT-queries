; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105372 () Bool)

(assert start!105372)

(declare-fun b_free!27045 () Bool)

(declare-fun b_next!27045 () Bool)

(assert (=> start!105372 (= b_free!27045 (not b_next!27045))))

(declare-fun tp!94645 () Bool)

(declare-fun b_and!44883 () Bool)

(assert (=> start!105372 (= tp!94645 b_and!44883)))

(declare-fun res!836995 () Bool)

(declare-fun e!713531 () Bool)

(assert (=> start!105372 (=> (not res!836995) (not e!713531))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105372 (= res!836995 (validMask!0 mask!1466))))

(assert (=> start!105372 e!713531))

(assert (=> start!105372 true))

(assert (=> start!105372 tp!94645))

(declare-fun tp_is_empty!31947 () Bool)

(assert (=> start!105372 tp_is_empty!31947))

(declare-datatypes ((array!81538 0))(
  ( (array!81539 (arr!39329 (Array (_ BitVec 32) (_ BitVec 64))) (size!39865 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81538)

(declare-fun array_inv!29967 (array!81538) Bool)

(assert (=> start!105372 (array_inv!29967 _keys!1118)))

(declare-datatypes ((V!47961 0))(
  ( (V!47962 (val!16036 Int)) )
))
(declare-datatypes ((ValueCell!15210 0))(
  ( (ValueCellFull!15210 (v!18736 V!47961)) (EmptyCell!15210) )
))
(declare-datatypes ((array!81540 0))(
  ( (array!81541 (arr!39330 (Array (_ BitVec 32) ValueCell!15210)) (size!39866 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81540)

(declare-fun e!713533 () Bool)

(declare-fun array_inv!29968 (array!81540) Bool)

(assert (=> start!105372 (and (array_inv!29968 _values!914) e!713533)))

(declare-fun b!1255456 () Bool)

(declare-fun res!836994 () Bool)

(assert (=> b!1255456 (=> (not res!836994) (not e!713531))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1255456 (= res!836994 (and (= (size!39866 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39865 _keys!1118) (size!39866 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255457 () Bool)

(declare-fun e!713532 () Bool)

(assert (=> b!1255457 (= e!713532 tp_is_empty!31947)))

(declare-fun b!1255458 () Bool)

(declare-fun res!836993 () Bool)

(assert (=> b!1255458 (=> (not res!836993) (not e!713531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81538 (_ BitVec 32)) Bool)

(assert (=> b!1255458 (= res!836993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49702 () Bool)

(declare-fun mapRes!49702 () Bool)

(declare-fun tp!94646 () Bool)

(assert (=> mapNonEmpty!49702 (= mapRes!49702 (and tp!94646 e!713532))))

(declare-fun mapValue!49702 () ValueCell!15210)

(declare-fun mapKey!49702 () (_ BitVec 32))

(declare-fun mapRest!49702 () (Array (_ BitVec 32) ValueCell!15210))

(assert (=> mapNonEmpty!49702 (= (arr!39330 _values!914) (store mapRest!49702 mapKey!49702 mapValue!49702))))

(declare-fun b!1255459 () Bool)

(declare-fun e!713529 () Bool)

(assert (=> b!1255459 (= e!713533 (and e!713529 mapRes!49702))))

(declare-fun condMapEmpty!49702 () Bool)

(declare-fun mapDefault!49702 () ValueCell!15210)

(assert (=> b!1255459 (= condMapEmpty!49702 (= (arr!39330 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15210)) mapDefault!49702)))))

(declare-fun b!1255460 () Bool)

(declare-fun res!836992 () Bool)

(assert (=> b!1255460 (=> (not res!836992) (not e!713531))))

(declare-datatypes ((List!27930 0))(
  ( (Nil!27927) (Cons!27926 (h!29135 (_ BitVec 64)) (t!41415 List!27930)) )
))
(declare-fun arrayNoDuplicates!0 (array!81538 (_ BitVec 32) List!27930) Bool)

(assert (=> b!1255460 (= res!836992 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27927))))

(declare-fun mapIsEmpty!49702 () Bool)

(assert (=> mapIsEmpty!49702 mapRes!49702))

(declare-fun b!1255461 () Bool)

(assert (=> b!1255461 (= e!713531 (not (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!39865 _keys!1118)))))))

(declare-datatypes ((tuple2!20708 0))(
  ( (tuple2!20709 (_1!10365 (_ BitVec 64)) (_2!10365 V!47961)) )
))
(declare-datatypes ((List!27931 0))(
  ( (Nil!27928) (Cons!27927 (h!29136 tuple2!20708) (t!41416 List!27931)) )
))
(declare-datatypes ((ListLongMap!18581 0))(
  ( (ListLongMap!18582 (toList!9306 List!27931)) )
))
(declare-fun lt!567587 () ListLongMap!18581)

(declare-fun lt!567588 () ListLongMap!18581)

(assert (=> b!1255461 (= lt!567587 lt!567588)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47961)

(declare-datatypes ((Unit!41798 0))(
  ( (Unit!41799) )
))
(declare-fun lt!567586 () Unit!41798)

(declare-fun zeroValue!871 () V!47961)

(declare-fun minValueBefore!43 () V!47961)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1055 (array!81538 array!81540 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47961 V!47961 V!47961 V!47961 (_ BitVec 32) Int) Unit!41798)

(assert (=> b!1255461 (= lt!567586 (lemmaNoChangeToArrayThenSameMapNoExtras!1055 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5691 (array!81538 array!81540 (_ BitVec 32) (_ BitVec 32) V!47961 V!47961 (_ BitVec 32) Int) ListLongMap!18581)

(assert (=> b!1255461 (= lt!567588 (getCurrentListMapNoExtraKeys!5691 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255461 (= lt!567587 (getCurrentListMapNoExtraKeys!5691 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255462 () Bool)

(assert (=> b!1255462 (= e!713529 tp_is_empty!31947)))

(assert (= (and start!105372 res!836995) b!1255456))

(assert (= (and b!1255456 res!836994) b!1255458))

(assert (= (and b!1255458 res!836993) b!1255460))

(assert (= (and b!1255460 res!836992) b!1255461))

(assert (= (and b!1255459 condMapEmpty!49702) mapIsEmpty!49702))

(assert (= (and b!1255459 (not condMapEmpty!49702)) mapNonEmpty!49702))

(get-info :version)

(assert (= (and mapNonEmpty!49702 ((_ is ValueCellFull!15210) mapValue!49702)) b!1255457))

(assert (= (and b!1255459 ((_ is ValueCellFull!15210) mapDefault!49702)) b!1255462))

(assert (= start!105372 b!1255459))

(declare-fun m!1156193 () Bool)

(assert (=> b!1255461 m!1156193))

(declare-fun m!1156195 () Bool)

(assert (=> b!1255461 m!1156195))

(declare-fun m!1156197 () Bool)

(assert (=> b!1255461 m!1156197))

(declare-fun m!1156199 () Bool)

(assert (=> start!105372 m!1156199))

(declare-fun m!1156201 () Bool)

(assert (=> start!105372 m!1156201))

(declare-fun m!1156203 () Bool)

(assert (=> start!105372 m!1156203))

(declare-fun m!1156205 () Bool)

(assert (=> b!1255460 m!1156205))

(declare-fun m!1156207 () Bool)

(assert (=> b!1255458 m!1156207))

(declare-fun m!1156209 () Bool)

(assert (=> mapNonEmpty!49702 m!1156209))

(check-sat (not b!1255461) (not b!1255460) tp_is_empty!31947 (not b_next!27045) (not start!105372) (not mapNonEmpty!49702) b_and!44883 (not b!1255458))
(check-sat b_and!44883 (not b_next!27045))
(get-model)

(declare-fun d!138149 () Bool)

(assert (=> d!138149 (= (getCurrentListMapNoExtraKeys!5691 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5691 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567600 () Unit!41798)

(declare-fun choose!1857 (array!81538 array!81540 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47961 V!47961 V!47961 V!47961 (_ BitVec 32) Int) Unit!41798)

(assert (=> d!138149 (= lt!567600 (choose!1857 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138149 (validMask!0 mask!1466)))

(assert (=> d!138149 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1055 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567600)))

(declare-fun bs!35488 () Bool)

(assert (= bs!35488 d!138149))

(assert (=> bs!35488 m!1156197))

(assert (=> bs!35488 m!1156195))

(declare-fun m!1156229 () Bool)

(assert (=> bs!35488 m!1156229))

(assert (=> bs!35488 m!1156199))

(assert (=> b!1255461 d!138149))

(declare-fun b!1255508 () Bool)

(declare-fun e!713563 () Bool)

(declare-fun e!713568 () Bool)

(assert (=> b!1255508 (= e!713563 e!713568)))

(assert (=> b!1255508 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39865 _keys!1118)))))

(declare-fun res!837016 () Bool)

(declare-fun lt!567618 () ListLongMap!18581)

(declare-fun contains!7526 (ListLongMap!18581 (_ BitVec 64)) Bool)

(assert (=> b!1255508 (= res!837016 (contains!7526 lt!567618 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1255508 (=> (not res!837016) (not e!713568))))

(declare-fun b!1255510 () Bool)

(declare-fun e!713566 () ListLongMap!18581)

(declare-fun e!713567 () ListLongMap!18581)

(assert (=> b!1255510 (= e!713566 e!713567)))

(declare-fun c!122398 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1255510 (= c!122398 (validKeyInArray!0 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1255511 () Bool)

(assert (=> b!1255511 (= e!713566 (ListLongMap!18582 Nil!27928))))

(declare-fun bm!61767 () Bool)

(declare-fun call!61770 () ListLongMap!18581)

(assert (=> bm!61767 (= call!61770 (getCurrentListMapNoExtraKeys!5691 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun e!713565 () Bool)

(declare-fun b!1255512 () Bool)

(assert (=> b!1255512 (= e!713565 (= lt!567618 (getCurrentListMapNoExtraKeys!5691 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1255513 () Bool)

(declare-fun res!837019 () Bool)

(declare-fun e!713564 () Bool)

(assert (=> b!1255513 (=> (not res!837019) (not e!713564))))

(assert (=> b!1255513 (= res!837019 (not (contains!7526 lt!567618 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1255514 () Bool)

(assert (=> b!1255514 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39865 _keys!1118)))))

(assert (=> b!1255514 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39866 _values!914)))))

(declare-fun apply!987 (ListLongMap!18581 (_ BitVec 64)) V!47961)

(declare-fun get!20120 (ValueCell!15210 V!47961) V!47961)

(declare-fun dynLambda!3385 (Int (_ BitVec 64)) V!47961)

(assert (=> b!1255514 (= e!713568 (= (apply!987 lt!567618 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000)) (get!20120 (select (arr!39330 _values!914) #b00000000000000000000000000000000) (dynLambda!3385 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1255515 () Bool)

(declare-fun e!713569 () Bool)

(assert (=> b!1255515 (= e!713569 (validKeyInArray!0 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1255515 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1255516 () Bool)

(declare-fun isEmpty!1029 (ListLongMap!18581) Bool)

(assert (=> b!1255516 (= e!713565 (isEmpty!1029 lt!567618))))

(declare-fun b!1255517 () Bool)

(assert (=> b!1255517 (= e!713564 e!713563)))

(declare-fun c!122397 () Bool)

(assert (=> b!1255517 (= c!122397 e!713569)))

(declare-fun res!837018 () Bool)

(assert (=> b!1255517 (=> (not res!837018) (not e!713569))))

(assert (=> b!1255517 (= res!837018 (bvslt #b00000000000000000000000000000000 (size!39865 _keys!1118)))))

(declare-fun d!138151 () Bool)

(assert (=> d!138151 e!713564))

(declare-fun res!837017 () Bool)

(assert (=> d!138151 (=> (not res!837017) (not e!713564))))

(assert (=> d!138151 (= res!837017 (not (contains!7526 lt!567618 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138151 (= lt!567618 e!713566)))

(declare-fun c!122395 () Bool)

(assert (=> d!138151 (= c!122395 (bvsge #b00000000000000000000000000000000 (size!39865 _keys!1118)))))

(assert (=> d!138151 (validMask!0 mask!1466)))

(assert (=> d!138151 (= (getCurrentListMapNoExtraKeys!5691 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567618)))

(declare-fun b!1255509 () Bool)

(declare-fun lt!567615 () Unit!41798)

(declare-fun lt!567621 () Unit!41798)

(assert (=> b!1255509 (= lt!567615 lt!567621)))

(declare-fun lt!567617 () V!47961)

(declare-fun lt!567616 () (_ BitVec 64))

(declare-fun lt!567620 () (_ BitVec 64))

(declare-fun lt!567619 () ListLongMap!18581)

(declare-fun +!4186 (ListLongMap!18581 tuple2!20708) ListLongMap!18581)

(assert (=> b!1255509 (not (contains!7526 (+!4186 lt!567619 (tuple2!20709 lt!567616 lt!567617)) lt!567620))))

(declare-fun addStillNotContains!315 (ListLongMap!18581 (_ BitVec 64) V!47961 (_ BitVec 64)) Unit!41798)

(assert (=> b!1255509 (= lt!567621 (addStillNotContains!315 lt!567619 lt!567616 lt!567617 lt!567620))))

(assert (=> b!1255509 (= lt!567620 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1255509 (= lt!567617 (get!20120 (select (arr!39330 _values!914) #b00000000000000000000000000000000) (dynLambda!3385 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1255509 (= lt!567616 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1255509 (= lt!567619 call!61770)))

(assert (=> b!1255509 (= e!713567 (+!4186 call!61770 (tuple2!20709 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000) (get!20120 (select (arr!39330 _values!914) #b00000000000000000000000000000000) (dynLambda!3385 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1255518 () Bool)

(assert (=> b!1255518 (= e!713563 e!713565)))

(declare-fun c!122396 () Bool)

(assert (=> b!1255518 (= c!122396 (bvslt #b00000000000000000000000000000000 (size!39865 _keys!1118)))))

(declare-fun b!1255519 () Bool)

(assert (=> b!1255519 (= e!713567 call!61770)))

(assert (= (and d!138151 c!122395) b!1255511))

(assert (= (and d!138151 (not c!122395)) b!1255510))

(assert (= (and b!1255510 c!122398) b!1255509))

(assert (= (and b!1255510 (not c!122398)) b!1255519))

(assert (= (or b!1255509 b!1255519) bm!61767))

(assert (= (and d!138151 res!837017) b!1255513))

(assert (= (and b!1255513 res!837019) b!1255517))

(assert (= (and b!1255517 res!837018) b!1255515))

(assert (= (and b!1255517 c!122397) b!1255508))

(assert (= (and b!1255517 (not c!122397)) b!1255518))

(assert (= (and b!1255508 res!837016) b!1255514))

(assert (= (and b!1255518 c!122396) b!1255512))

(assert (= (and b!1255518 (not c!122396)) b!1255516))

(declare-fun b_lambda!22651 () Bool)

(assert (=> (not b_lambda!22651) (not b!1255514)))

(declare-fun t!41419 () Bool)

(declare-fun tb!11301 () Bool)

(assert (=> (and start!105372 (= defaultEntry!922 defaultEntry!922) t!41419) tb!11301))

(declare-fun result!23311 () Bool)

(assert (=> tb!11301 (= result!23311 tp_is_empty!31947)))

(assert (=> b!1255514 t!41419))

(declare-fun b_and!44887 () Bool)

(assert (= b_and!44883 (and (=> t!41419 result!23311) b_and!44887)))

(declare-fun b_lambda!22653 () Bool)

(assert (=> (not b_lambda!22653) (not b!1255509)))

(assert (=> b!1255509 t!41419))

(declare-fun b_and!44889 () Bool)

(assert (= b_and!44887 (and (=> t!41419 result!23311) b_and!44889)))

(declare-fun m!1156231 () Bool)

(assert (=> b!1255515 m!1156231))

(assert (=> b!1255515 m!1156231))

(declare-fun m!1156233 () Bool)

(assert (=> b!1255515 m!1156233))

(assert (=> b!1255508 m!1156231))

(assert (=> b!1255508 m!1156231))

(declare-fun m!1156235 () Bool)

(assert (=> b!1255508 m!1156235))

(declare-fun m!1156237 () Bool)

(assert (=> b!1255509 m!1156237))

(declare-fun m!1156239 () Bool)

(assert (=> b!1255509 m!1156239))

(declare-fun m!1156241 () Bool)

(assert (=> b!1255509 m!1156241))

(assert (=> b!1255509 m!1156231))

(declare-fun m!1156243 () Bool)

(assert (=> b!1255509 m!1156243))

(assert (=> b!1255509 m!1156237))

(declare-fun m!1156245 () Bool)

(assert (=> b!1255509 m!1156245))

(declare-fun m!1156247 () Bool)

(assert (=> b!1255509 m!1156247))

(assert (=> b!1255509 m!1156247))

(assert (=> b!1255509 m!1156243))

(declare-fun m!1156249 () Bool)

(assert (=> b!1255509 m!1156249))

(declare-fun m!1156251 () Bool)

(assert (=> d!138151 m!1156251))

(assert (=> d!138151 m!1156199))

(declare-fun m!1156253 () Bool)

(assert (=> b!1255512 m!1156253))

(assert (=> b!1255510 m!1156231))

(assert (=> b!1255510 m!1156231))

(assert (=> b!1255510 m!1156233))

(declare-fun m!1156255 () Bool)

(assert (=> b!1255513 m!1156255))

(assert (=> b!1255514 m!1156231))

(assert (=> b!1255514 m!1156231))

(declare-fun m!1156257 () Bool)

(assert (=> b!1255514 m!1156257))

(assert (=> b!1255514 m!1156243))

(assert (=> b!1255514 m!1156247))

(assert (=> b!1255514 m!1156247))

(assert (=> b!1255514 m!1156243))

(assert (=> b!1255514 m!1156249))

(assert (=> bm!61767 m!1156253))

(declare-fun m!1156259 () Bool)

(assert (=> b!1255516 m!1156259))

(assert (=> b!1255461 d!138151))

(declare-fun b!1255522 () Bool)

(declare-fun e!713570 () Bool)

(declare-fun e!713575 () Bool)

(assert (=> b!1255522 (= e!713570 e!713575)))

(assert (=> b!1255522 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39865 _keys!1118)))))

(declare-fun res!837020 () Bool)

(declare-fun lt!567625 () ListLongMap!18581)

(assert (=> b!1255522 (= res!837020 (contains!7526 lt!567625 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1255522 (=> (not res!837020) (not e!713575))))

(declare-fun b!1255524 () Bool)

(declare-fun e!713573 () ListLongMap!18581)

(declare-fun e!713574 () ListLongMap!18581)

(assert (=> b!1255524 (= e!713573 e!713574)))

(declare-fun c!122402 () Bool)

(assert (=> b!1255524 (= c!122402 (validKeyInArray!0 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1255525 () Bool)

(assert (=> b!1255525 (= e!713573 (ListLongMap!18582 Nil!27928))))

(declare-fun call!61771 () ListLongMap!18581)

(declare-fun bm!61768 () Bool)

(assert (=> bm!61768 (= call!61771 (getCurrentListMapNoExtraKeys!5691 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1255526 () Bool)

(declare-fun e!713572 () Bool)

(assert (=> b!1255526 (= e!713572 (= lt!567625 (getCurrentListMapNoExtraKeys!5691 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1255527 () Bool)

(declare-fun res!837023 () Bool)

(declare-fun e!713571 () Bool)

(assert (=> b!1255527 (=> (not res!837023) (not e!713571))))

(assert (=> b!1255527 (= res!837023 (not (contains!7526 lt!567625 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1255528 () Bool)

(assert (=> b!1255528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39865 _keys!1118)))))

(assert (=> b!1255528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39866 _values!914)))))

(assert (=> b!1255528 (= e!713575 (= (apply!987 lt!567625 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000)) (get!20120 (select (arr!39330 _values!914) #b00000000000000000000000000000000) (dynLambda!3385 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1255529 () Bool)

(declare-fun e!713576 () Bool)

(assert (=> b!1255529 (= e!713576 (validKeyInArray!0 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1255529 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1255530 () Bool)

(assert (=> b!1255530 (= e!713572 (isEmpty!1029 lt!567625))))

(declare-fun b!1255531 () Bool)

(assert (=> b!1255531 (= e!713571 e!713570)))

(declare-fun c!122401 () Bool)

(assert (=> b!1255531 (= c!122401 e!713576)))

(declare-fun res!837022 () Bool)

(assert (=> b!1255531 (=> (not res!837022) (not e!713576))))

(assert (=> b!1255531 (= res!837022 (bvslt #b00000000000000000000000000000000 (size!39865 _keys!1118)))))

(declare-fun d!138153 () Bool)

(assert (=> d!138153 e!713571))

(declare-fun res!837021 () Bool)

(assert (=> d!138153 (=> (not res!837021) (not e!713571))))

(assert (=> d!138153 (= res!837021 (not (contains!7526 lt!567625 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138153 (= lt!567625 e!713573)))

(declare-fun c!122399 () Bool)

(assert (=> d!138153 (= c!122399 (bvsge #b00000000000000000000000000000000 (size!39865 _keys!1118)))))

(assert (=> d!138153 (validMask!0 mask!1466)))

(assert (=> d!138153 (= (getCurrentListMapNoExtraKeys!5691 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567625)))

(declare-fun b!1255523 () Bool)

(declare-fun lt!567622 () Unit!41798)

(declare-fun lt!567628 () Unit!41798)

(assert (=> b!1255523 (= lt!567622 lt!567628)))

(declare-fun lt!567626 () ListLongMap!18581)

(declare-fun lt!567624 () V!47961)

(declare-fun lt!567623 () (_ BitVec 64))

(declare-fun lt!567627 () (_ BitVec 64))

(assert (=> b!1255523 (not (contains!7526 (+!4186 lt!567626 (tuple2!20709 lt!567623 lt!567624)) lt!567627))))

(assert (=> b!1255523 (= lt!567628 (addStillNotContains!315 lt!567626 lt!567623 lt!567624 lt!567627))))

(assert (=> b!1255523 (= lt!567627 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1255523 (= lt!567624 (get!20120 (select (arr!39330 _values!914) #b00000000000000000000000000000000) (dynLambda!3385 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1255523 (= lt!567623 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1255523 (= lt!567626 call!61771)))

(assert (=> b!1255523 (= e!713574 (+!4186 call!61771 (tuple2!20709 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000) (get!20120 (select (arr!39330 _values!914) #b00000000000000000000000000000000) (dynLambda!3385 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1255532 () Bool)

(assert (=> b!1255532 (= e!713570 e!713572)))

(declare-fun c!122400 () Bool)

(assert (=> b!1255532 (= c!122400 (bvslt #b00000000000000000000000000000000 (size!39865 _keys!1118)))))

(declare-fun b!1255533 () Bool)

(assert (=> b!1255533 (= e!713574 call!61771)))

(assert (= (and d!138153 c!122399) b!1255525))

(assert (= (and d!138153 (not c!122399)) b!1255524))

(assert (= (and b!1255524 c!122402) b!1255523))

(assert (= (and b!1255524 (not c!122402)) b!1255533))

(assert (= (or b!1255523 b!1255533) bm!61768))

(assert (= (and d!138153 res!837021) b!1255527))

(assert (= (and b!1255527 res!837023) b!1255531))

(assert (= (and b!1255531 res!837022) b!1255529))

(assert (= (and b!1255531 c!122401) b!1255522))

(assert (= (and b!1255531 (not c!122401)) b!1255532))

(assert (= (and b!1255522 res!837020) b!1255528))

(assert (= (and b!1255532 c!122400) b!1255526))

(assert (= (and b!1255532 (not c!122400)) b!1255530))

(declare-fun b_lambda!22655 () Bool)

(assert (=> (not b_lambda!22655) (not b!1255528)))

(assert (=> b!1255528 t!41419))

(declare-fun b_and!44891 () Bool)

(assert (= b_and!44889 (and (=> t!41419 result!23311) b_and!44891)))

(declare-fun b_lambda!22657 () Bool)

(assert (=> (not b_lambda!22657) (not b!1255523)))

(assert (=> b!1255523 t!41419))

(declare-fun b_and!44893 () Bool)

(assert (= b_and!44891 (and (=> t!41419 result!23311) b_and!44893)))

(assert (=> b!1255529 m!1156231))

(assert (=> b!1255529 m!1156231))

(assert (=> b!1255529 m!1156233))

(assert (=> b!1255522 m!1156231))

(assert (=> b!1255522 m!1156231))

(declare-fun m!1156261 () Bool)

(assert (=> b!1255522 m!1156261))

(declare-fun m!1156263 () Bool)

(assert (=> b!1255523 m!1156263))

(declare-fun m!1156265 () Bool)

(assert (=> b!1255523 m!1156265))

(declare-fun m!1156267 () Bool)

(assert (=> b!1255523 m!1156267))

(assert (=> b!1255523 m!1156231))

(assert (=> b!1255523 m!1156243))

(assert (=> b!1255523 m!1156263))

(declare-fun m!1156269 () Bool)

(assert (=> b!1255523 m!1156269))

(assert (=> b!1255523 m!1156247))

(assert (=> b!1255523 m!1156247))

(assert (=> b!1255523 m!1156243))

(assert (=> b!1255523 m!1156249))

(declare-fun m!1156271 () Bool)

(assert (=> d!138153 m!1156271))

(assert (=> d!138153 m!1156199))

(declare-fun m!1156273 () Bool)

(assert (=> b!1255526 m!1156273))

(assert (=> b!1255524 m!1156231))

(assert (=> b!1255524 m!1156231))

(assert (=> b!1255524 m!1156233))

(declare-fun m!1156275 () Bool)

(assert (=> b!1255527 m!1156275))

(assert (=> b!1255528 m!1156231))

(assert (=> b!1255528 m!1156231))

(declare-fun m!1156277 () Bool)

(assert (=> b!1255528 m!1156277))

(assert (=> b!1255528 m!1156243))

(assert (=> b!1255528 m!1156247))

(assert (=> b!1255528 m!1156247))

(assert (=> b!1255528 m!1156243))

(assert (=> b!1255528 m!1156249))

(assert (=> bm!61768 m!1156273))

(declare-fun m!1156279 () Bool)

(assert (=> b!1255530 m!1156279))

(assert (=> b!1255461 d!138153))

(declare-fun b!1255542 () Bool)

(declare-fun e!713583 () Bool)

(declare-fun e!713585 () Bool)

(assert (=> b!1255542 (= e!713583 e!713585)))

(declare-fun c!122405 () Bool)

(assert (=> b!1255542 (= c!122405 (validKeyInArray!0 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138155 () Bool)

(declare-fun res!837029 () Bool)

(assert (=> d!138155 (=> res!837029 e!713583)))

(assert (=> d!138155 (= res!837029 (bvsge #b00000000000000000000000000000000 (size!39865 _keys!1118)))))

(assert (=> d!138155 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!713583)))

(declare-fun b!1255543 () Bool)

(declare-fun call!61774 () Bool)

(assert (=> b!1255543 (= e!713585 call!61774)))

(declare-fun b!1255544 () Bool)

(declare-fun e!713584 () Bool)

(assert (=> b!1255544 (= e!713585 e!713584)))

(declare-fun lt!567636 () (_ BitVec 64))

(assert (=> b!1255544 (= lt!567636 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567637 () Unit!41798)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81538 (_ BitVec 64) (_ BitVec 32)) Unit!41798)

(assert (=> b!1255544 (= lt!567637 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!567636 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1255544 (arrayContainsKey!0 _keys!1118 lt!567636 #b00000000000000000000000000000000)))

(declare-fun lt!567635 () Unit!41798)

(assert (=> b!1255544 (= lt!567635 lt!567637)))

(declare-fun res!837028 () Bool)

(declare-datatypes ((SeekEntryResult!9965 0))(
  ( (MissingZero!9965 (index!42231 (_ BitVec 32))) (Found!9965 (index!42232 (_ BitVec 32))) (Intermediate!9965 (undefined!10777 Bool) (index!42233 (_ BitVec 32)) (x!110541 (_ BitVec 32))) (Undefined!9965) (MissingVacant!9965 (index!42234 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81538 (_ BitVec 32)) SeekEntryResult!9965)

(assert (=> b!1255544 (= res!837028 (= (seekEntryOrOpen!0 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9965 #b00000000000000000000000000000000)))))

(assert (=> b!1255544 (=> (not res!837028) (not e!713584))))

(declare-fun b!1255545 () Bool)

(assert (=> b!1255545 (= e!713584 call!61774)))

(declare-fun bm!61771 () Bool)

(assert (=> bm!61771 (= call!61774 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!138155 (not res!837029)) b!1255542))

(assert (= (and b!1255542 c!122405) b!1255544))

(assert (= (and b!1255542 (not c!122405)) b!1255543))

(assert (= (and b!1255544 res!837028) b!1255545))

(assert (= (or b!1255545 b!1255543) bm!61771))

(assert (=> b!1255542 m!1156231))

(assert (=> b!1255542 m!1156231))

(assert (=> b!1255542 m!1156233))

(assert (=> b!1255544 m!1156231))

(declare-fun m!1156281 () Bool)

(assert (=> b!1255544 m!1156281))

(declare-fun m!1156283 () Bool)

(assert (=> b!1255544 m!1156283))

(assert (=> b!1255544 m!1156231))

(declare-fun m!1156285 () Bool)

(assert (=> b!1255544 m!1156285))

(declare-fun m!1156287 () Bool)

(assert (=> bm!61771 m!1156287))

(assert (=> b!1255458 d!138155))

(declare-fun d!138157 () Bool)

(assert (=> d!138157 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105372 d!138157))

(declare-fun d!138159 () Bool)

(assert (=> d!138159 (= (array_inv!29967 _keys!1118) (bvsge (size!39865 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105372 d!138159))

(declare-fun d!138161 () Bool)

(assert (=> d!138161 (= (array_inv!29968 _values!914) (bvsge (size!39866 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105372 d!138161))

(declare-fun b!1255556 () Bool)

(declare-fun e!713597 () Bool)

(declare-fun call!61777 () Bool)

(assert (=> b!1255556 (= e!713597 call!61777)))

(declare-fun b!1255557 () Bool)

(declare-fun e!713595 () Bool)

(assert (=> b!1255557 (= e!713595 e!713597)))

(declare-fun c!122408 () Bool)

(assert (=> b!1255557 (= c!122408 (validKeyInArray!0 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138163 () Bool)

(declare-fun res!837038 () Bool)

(declare-fun e!713596 () Bool)

(assert (=> d!138163 (=> res!837038 e!713596)))

(assert (=> d!138163 (= res!837038 (bvsge #b00000000000000000000000000000000 (size!39865 _keys!1118)))))

(assert (=> d!138163 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27927) e!713596)))

(declare-fun b!1255558 () Bool)

(declare-fun e!713594 () Bool)

(declare-fun contains!7527 (List!27930 (_ BitVec 64)) Bool)

(assert (=> b!1255558 (= e!713594 (contains!7527 Nil!27927 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1255559 () Bool)

(assert (=> b!1255559 (= e!713596 e!713595)))

(declare-fun res!837036 () Bool)

(assert (=> b!1255559 (=> (not res!837036) (not e!713595))))

(assert (=> b!1255559 (= res!837036 (not e!713594))))

(declare-fun res!837037 () Bool)

(assert (=> b!1255559 (=> (not res!837037) (not e!713594))))

(assert (=> b!1255559 (= res!837037 (validKeyInArray!0 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61774 () Bool)

(assert (=> bm!61774 (= call!61777 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122408 (Cons!27926 (select (arr!39329 _keys!1118) #b00000000000000000000000000000000) Nil!27927) Nil!27927)))))

(declare-fun b!1255560 () Bool)

(assert (=> b!1255560 (= e!713597 call!61777)))

(assert (= (and d!138163 (not res!837038)) b!1255559))

(assert (= (and b!1255559 res!837037) b!1255558))

(assert (= (and b!1255559 res!837036) b!1255557))

(assert (= (and b!1255557 c!122408) b!1255556))

(assert (= (and b!1255557 (not c!122408)) b!1255560))

(assert (= (or b!1255556 b!1255560) bm!61774))

(assert (=> b!1255557 m!1156231))

(assert (=> b!1255557 m!1156231))

(assert (=> b!1255557 m!1156233))

(assert (=> b!1255558 m!1156231))

(assert (=> b!1255558 m!1156231))

(declare-fun m!1156289 () Bool)

(assert (=> b!1255558 m!1156289))

(assert (=> b!1255559 m!1156231))

(assert (=> b!1255559 m!1156231))

(assert (=> b!1255559 m!1156233))

(assert (=> bm!61774 m!1156231))

(declare-fun m!1156291 () Bool)

(assert (=> bm!61774 m!1156291))

(assert (=> b!1255460 d!138163))

(declare-fun mapNonEmpty!49708 () Bool)

(declare-fun mapRes!49708 () Bool)

(declare-fun tp!94655 () Bool)

(declare-fun e!713602 () Bool)

(assert (=> mapNonEmpty!49708 (= mapRes!49708 (and tp!94655 e!713602))))

(declare-fun mapKey!49708 () (_ BitVec 32))

(declare-fun mapValue!49708 () ValueCell!15210)

(declare-fun mapRest!49708 () (Array (_ BitVec 32) ValueCell!15210))

(assert (=> mapNonEmpty!49708 (= mapRest!49702 (store mapRest!49708 mapKey!49708 mapValue!49708))))

(declare-fun b!1255568 () Bool)

(declare-fun e!713603 () Bool)

(assert (=> b!1255568 (= e!713603 tp_is_empty!31947)))

(declare-fun b!1255567 () Bool)

(assert (=> b!1255567 (= e!713602 tp_is_empty!31947)))

(declare-fun condMapEmpty!49708 () Bool)

(declare-fun mapDefault!49708 () ValueCell!15210)

(assert (=> mapNonEmpty!49702 (= condMapEmpty!49708 (= mapRest!49702 ((as const (Array (_ BitVec 32) ValueCell!15210)) mapDefault!49708)))))

(assert (=> mapNonEmpty!49702 (= tp!94646 (and e!713603 mapRes!49708))))

(declare-fun mapIsEmpty!49708 () Bool)

(assert (=> mapIsEmpty!49708 mapRes!49708))

(assert (= (and mapNonEmpty!49702 condMapEmpty!49708) mapIsEmpty!49708))

(assert (= (and mapNonEmpty!49702 (not condMapEmpty!49708)) mapNonEmpty!49708))

(assert (= (and mapNonEmpty!49708 ((_ is ValueCellFull!15210) mapValue!49708)) b!1255567))

(assert (= (and mapNonEmpty!49702 ((_ is ValueCellFull!15210) mapDefault!49708)) b!1255568))

(declare-fun m!1156293 () Bool)

(assert (=> mapNonEmpty!49708 m!1156293))

(declare-fun b_lambda!22659 () Bool)

(assert (= b_lambda!22651 (or (and start!105372 b_free!27045) b_lambda!22659)))

(declare-fun b_lambda!22661 () Bool)

(assert (= b_lambda!22655 (or (and start!105372 b_free!27045) b_lambda!22661)))

(declare-fun b_lambda!22663 () Bool)

(assert (= b_lambda!22657 (or (and start!105372 b_free!27045) b_lambda!22663)))

(declare-fun b_lambda!22665 () Bool)

(assert (= b_lambda!22653 (or (and start!105372 b_free!27045) b_lambda!22665)))

(check-sat (not b!1255508) (not bm!61768) (not b!1255530) (not b_lambda!22661) (not b_lambda!22659) (not b_lambda!22665) (not b!1255528) (not d!138149) (not b!1255557) (not b!1255529) (not b!1255522) (not bm!61774) (not b!1255542) (not b!1255509) (not b!1255524) (not b_lambda!22663) (not d!138151) (not b!1255512) (not b!1255544) (not b!1255516) (not b!1255559) (not b!1255527) (not b!1255523) (not b_next!27045) b_and!44893 (not b!1255515) (not mapNonEmpty!49708) (not d!138153) (not b!1255510) (not b!1255558) tp_is_empty!31947 (not b!1255513) (not bm!61771) (not b!1255514) (not bm!61767) (not b!1255526))
(check-sat b_and!44893 (not b_next!27045))
