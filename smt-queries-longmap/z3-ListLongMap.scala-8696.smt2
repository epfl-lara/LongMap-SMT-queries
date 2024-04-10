; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105598 () Bool)

(assert start!105598)

(declare-fun b_free!27213 () Bool)

(declare-fun b_next!27213 () Bool)

(assert (=> start!105598 (= b_free!27213 (not b_next!27213))))

(declare-fun tp!95159 () Bool)

(declare-fun b_and!45079 () Bool)

(assert (=> start!105598 (= tp!95159 b_and!45079)))

(declare-fun b!1257952 () Bool)

(declare-fun res!838487 () Bool)

(declare-fun e!715381 () Bool)

(assert (=> b!1257952 (=> (not res!838487) (not e!715381))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81858 0))(
  ( (array!81859 (arr!39486 (Array (_ BitVec 32) (_ BitVec 64))) (size!40022 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81858)

(declare-datatypes ((V!48185 0))(
  ( (V!48186 (val!16120 Int)) )
))
(declare-datatypes ((ValueCell!15294 0))(
  ( (ValueCellFull!15294 (v!18822 V!48185)) (EmptyCell!15294) )
))
(declare-datatypes ((array!81860 0))(
  ( (array!81861 (arr!39487 (Array (_ BitVec 32) ValueCell!15294)) (size!40023 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81860)

(assert (=> b!1257952 (= res!838487 (and (= (size!40023 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40022 _keys!1118) (size!40023 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49963 () Bool)

(declare-fun mapRes!49963 () Bool)

(assert (=> mapIsEmpty!49963 mapRes!49963))

(declare-fun b!1257953 () Bool)

(declare-fun e!715380 () Bool)

(declare-fun tp_is_empty!32115 () Bool)

(assert (=> b!1257953 (= e!715380 tp_is_empty!32115)))

(declare-fun mapNonEmpty!49963 () Bool)

(declare-fun tp!95158 () Bool)

(declare-fun e!715379 () Bool)

(assert (=> mapNonEmpty!49963 (= mapRes!49963 (and tp!95158 e!715379))))

(declare-fun mapRest!49963 () (Array (_ BitVec 32) ValueCell!15294))

(declare-fun mapKey!49963 () (_ BitVec 32))

(declare-fun mapValue!49963 () ValueCell!15294)

(assert (=> mapNonEmpty!49963 (= (arr!39487 _values!914) (store mapRest!49963 mapKey!49963 mapValue!49963))))

(declare-fun res!838488 () Bool)

(assert (=> start!105598 (=> (not res!838488) (not e!715381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105598 (= res!838488 (validMask!0 mask!1466))))

(assert (=> start!105598 e!715381))

(assert (=> start!105598 true))

(assert (=> start!105598 tp!95159))

(assert (=> start!105598 tp_is_empty!32115))

(declare-fun array_inv!30077 (array!81858) Bool)

(assert (=> start!105598 (array_inv!30077 _keys!1118)))

(declare-fun e!715377 () Bool)

(declare-fun array_inv!30078 (array!81860) Bool)

(assert (=> start!105598 (and (array_inv!30078 _values!914) e!715377)))

(declare-fun b!1257954 () Bool)

(declare-fun res!838489 () Bool)

(assert (=> b!1257954 (=> (not res!838489) (not e!715381))))

(declare-datatypes ((List!28039 0))(
  ( (Nil!28036) (Cons!28035 (h!29244 (_ BitVec 64)) (t!41530 List!28039)) )
))
(declare-fun arrayNoDuplicates!0 (array!81858 (_ BitVec 32) List!28039) Bool)

(assert (=> b!1257954 (= res!838489 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28036))))

(declare-fun b!1257955 () Bool)

(assert (=> b!1257955 (= e!715381 (not (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!40022 _keys!1118)))))))

(declare-datatypes ((tuple2!20824 0))(
  ( (tuple2!20825 (_1!10423 (_ BitVec 64)) (_2!10423 V!48185)) )
))
(declare-datatypes ((List!28040 0))(
  ( (Nil!28037) (Cons!28036 (h!29245 tuple2!20824) (t!41531 List!28040)) )
))
(declare-datatypes ((ListLongMap!18697 0))(
  ( (ListLongMap!18698 (toList!9364 List!28040)) )
))
(declare-fun lt!568965 () ListLongMap!18697)

(declare-fun lt!568964 () ListLongMap!18697)

(assert (=> b!1257955 (= lt!568965 lt!568964)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48185)

(declare-fun zeroValue!871 () V!48185)

(declare-datatypes ((Unit!41912 0))(
  ( (Unit!41913) )
))
(declare-fun lt!568963 () Unit!41912)

(declare-fun minValueBefore!43 () V!48185)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1106 (array!81858 array!81860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48185 V!48185 V!48185 V!48185 (_ BitVec 32) Int) Unit!41912)

(assert (=> b!1257955 (= lt!568963 (lemmaNoChangeToArrayThenSameMapNoExtras!1106 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5742 (array!81858 array!81860 (_ BitVec 32) (_ BitVec 32) V!48185 V!48185 (_ BitVec 32) Int) ListLongMap!18697)

(assert (=> b!1257955 (= lt!568964 (getCurrentListMapNoExtraKeys!5742 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257955 (= lt!568965 (getCurrentListMapNoExtraKeys!5742 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257956 () Bool)

(assert (=> b!1257956 (= e!715377 (and e!715380 mapRes!49963))))

(declare-fun condMapEmpty!49963 () Bool)

(declare-fun mapDefault!49963 () ValueCell!15294)

(assert (=> b!1257956 (= condMapEmpty!49963 (= (arr!39487 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15294)) mapDefault!49963)))))

(declare-fun b!1257957 () Bool)

(declare-fun res!838486 () Bool)

(assert (=> b!1257957 (=> (not res!838486) (not e!715381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81858 (_ BitVec 32)) Bool)

(assert (=> b!1257957 (= res!838486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257958 () Bool)

(assert (=> b!1257958 (= e!715379 tp_is_empty!32115)))

(assert (= (and start!105598 res!838488) b!1257952))

(assert (= (and b!1257952 res!838487) b!1257957))

(assert (= (and b!1257957 res!838486) b!1257954))

(assert (= (and b!1257954 res!838489) b!1257955))

(assert (= (and b!1257956 condMapEmpty!49963) mapIsEmpty!49963))

(assert (= (and b!1257956 (not condMapEmpty!49963)) mapNonEmpty!49963))

(get-info :version)

(assert (= (and mapNonEmpty!49963 ((_ is ValueCellFull!15294) mapValue!49963)) b!1257958))

(assert (= (and b!1257956 ((_ is ValueCellFull!15294) mapDefault!49963)) b!1257953))

(assert (= start!105598 b!1257956))

(declare-fun m!1158467 () Bool)

(assert (=> start!105598 m!1158467))

(declare-fun m!1158469 () Bool)

(assert (=> start!105598 m!1158469))

(declare-fun m!1158471 () Bool)

(assert (=> start!105598 m!1158471))

(declare-fun m!1158473 () Bool)

(assert (=> b!1257955 m!1158473))

(declare-fun m!1158475 () Bool)

(assert (=> b!1257955 m!1158475))

(declare-fun m!1158477 () Bool)

(assert (=> b!1257955 m!1158477))

(declare-fun m!1158479 () Bool)

(assert (=> mapNonEmpty!49963 m!1158479))

(declare-fun m!1158481 () Bool)

(assert (=> b!1257957 m!1158481))

(declare-fun m!1158483 () Bool)

(assert (=> b!1257954 m!1158483))

(check-sat (not b!1257954) (not start!105598) b_and!45079 tp_is_empty!32115 (not b!1257957) (not b_next!27213) (not mapNonEmpty!49963) (not b!1257955))
(check-sat b_and!45079 (not b_next!27213))
(get-model)

(declare-fun d!138269 () Bool)

(assert (=> d!138269 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105598 d!138269))

(declare-fun d!138271 () Bool)

(assert (=> d!138271 (= (array_inv!30077 _keys!1118) (bvsge (size!40022 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105598 d!138271))

(declare-fun d!138273 () Bool)

(assert (=> d!138273 (= (array_inv!30078 _values!914) (bvsge (size!40023 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105598 d!138273))

(declare-fun d!138275 () Bool)

(assert (=> d!138275 (= (getCurrentListMapNoExtraKeys!5742 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5742 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568977 () Unit!41912)

(declare-fun choose!1862 (array!81858 array!81860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48185 V!48185 V!48185 V!48185 (_ BitVec 32) Int) Unit!41912)

(assert (=> d!138275 (= lt!568977 (choose!1862 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138275 (validMask!0 mask!1466)))

(assert (=> d!138275 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1106 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568977)))

(declare-fun bs!35579 () Bool)

(assert (= bs!35579 d!138275))

(assert (=> bs!35579 m!1158477))

(assert (=> bs!35579 m!1158475))

(declare-fun m!1158503 () Bool)

(assert (=> bs!35579 m!1158503))

(assert (=> bs!35579 m!1158467))

(assert (=> b!1257955 d!138275))

(declare-fun b!1258004 () Bool)

(declare-fun e!715414 () Bool)

(declare-fun e!715411 () Bool)

(assert (=> b!1258004 (= e!715414 e!715411)))

(assert (=> b!1258004 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40022 _keys!1118)))))

(declare-fun res!838513 () Bool)

(declare-fun lt!568997 () ListLongMap!18697)

(declare-fun contains!7567 (ListLongMap!18697 (_ BitVec 64)) Bool)

(assert (=> b!1258004 (= res!838513 (contains!7567 lt!568997 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258004 (=> (not res!838513) (not e!715411))))

(declare-fun b!1258005 () Bool)

(declare-fun e!715412 () ListLongMap!18697)

(declare-fun call!61842 () ListLongMap!18697)

(assert (=> b!1258005 (= e!715412 call!61842)))

(declare-fun b!1258006 () Bool)

(declare-fun res!838512 () Bool)

(declare-fun e!715417 () Bool)

(assert (=> b!1258006 (=> (not res!838512) (not e!715417))))

(assert (=> b!1258006 (= res!838512 (not (contains!7567 lt!568997 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1258007 () Bool)

(declare-fun e!715415 () Bool)

(declare-fun isEmpty!1032 (ListLongMap!18697) Bool)

(assert (=> b!1258007 (= e!715415 (isEmpty!1032 lt!568997))))

(declare-fun b!1258008 () Bool)

(declare-fun e!715413 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1258008 (= e!715413 (validKeyInArray!0 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258008 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!138277 () Bool)

(assert (=> d!138277 e!715417))

(declare-fun res!838511 () Bool)

(assert (=> d!138277 (=> (not res!838511) (not e!715417))))

(assert (=> d!138277 (= res!838511 (not (contains!7567 lt!568997 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!715416 () ListLongMap!18697)

(assert (=> d!138277 (= lt!568997 e!715416)))

(declare-fun c!122504 () Bool)

(assert (=> d!138277 (= c!122504 (bvsge #b00000000000000000000000000000000 (size!40022 _keys!1118)))))

(assert (=> d!138277 (validMask!0 mask!1466)))

(assert (=> d!138277 (= (getCurrentListMapNoExtraKeys!5742 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568997)))

(declare-fun b!1258009 () Bool)

(declare-fun lt!568995 () Unit!41912)

(declare-fun lt!568992 () Unit!41912)

(assert (=> b!1258009 (= lt!568995 lt!568992)))

(declare-fun lt!568998 () V!48185)

(declare-fun lt!568994 () (_ BitVec 64))

(declare-fun lt!568993 () ListLongMap!18697)

(declare-fun lt!568996 () (_ BitVec 64))

(declare-fun +!4189 (ListLongMap!18697 tuple2!20824) ListLongMap!18697)

(assert (=> b!1258009 (not (contains!7567 (+!4189 lt!568993 (tuple2!20825 lt!568996 lt!568998)) lt!568994))))

(declare-fun addStillNotContains!318 (ListLongMap!18697 (_ BitVec 64) V!48185 (_ BitVec 64)) Unit!41912)

(assert (=> b!1258009 (= lt!568992 (addStillNotContains!318 lt!568993 lt!568996 lt!568998 lt!568994))))

(assert (=> b!1258009 (= lt!568994 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20179 (ValueCell!15294 V!48185) V!48185)

(declare-fun dynLambda!3388 (Int (_ BitVec 64)) V!48185)

(assert (=> b!1258009 (= lt!568998 (get!20179 (select (arr!39487 _values!914) #b00000000000000000000000000000000) (dynLambda!3388 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1258009 (= lt!568996 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1258009 (= lt!568993 call!61842)))

(assert (=> b!1258009 (= e!715412 (+!4189 call!61842 (tuple2!20825 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000) (get!20179 (select (arr!39487 _values!914) #b00000000000000000000000000000000) (dynLambda!3388 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1258010 () Bool)

(assert (=> b!1258010 (= e!715415 (= lt!568997 (getCurrentListMapNoExtraKeys!5742 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1258011 () Bool)

(assert (=> b!1258011 (= e!715417 e!715414)))

(declare-fun c!122506 () Bool)

(assert (=> b!1258011 (= c!122506 e!715413)))

(declare-fun res!838510 () Bool)

(assert (=> b!1258011 (=> (not res!838510) (not e!715413))))

(assert (=> b!1258011 (= res!838510 (bvslt #b00000000000000000000000000000000 (size!40022 _keys!1118)))))

(declare-fun b!1258012 () Bool)

(assert (=> b!1258012 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40022 _keys!1118)))))

(assert (=> b!1258012 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40023 _values!914)))))

(declare-fun apply!990 (ListLongMap!18697 (_ BitVec 64)) V!48185)

(assert (=> b!1258012 (= e!715411 (= (apply!990 lt!568997 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000)) (get!20179 (select (arr!39487 _values!914) #b00000000000000000000000000000000) (dynLambda!3388 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1258013 () Bool)

(assert (=> b!1258013 (= e!715416 e!715412)))

(declare-fun c!122503 () Bool)

(assert (=> b!1258013 (= c!122503 (validKeyInArray!0 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1258014 () Bool)

(assert (=> b!1258014 (= e!715414 e!715415)))

(declare-fun c!122505 () Bool)

(assert (=> b!1258014 (= c!122505 (bvslt #b00000000000000000000000000000000 (size!40022 _keys!1118)))))

(declare-fun bm!61839 () Bool)

(assert (=> bm!61839 (= call!61842 (getCurrentListMapNoExtraKeys!5742 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1258015 () Bool)

(assert (=> b!1258015 (= e!715416 (ListLongMap!18698 Nil!28037))))

(assert (= (and d!138277 c!122504) b!1258015))

(assert (= (and d!138277 (not c!122504)) b!1258013))

(assert (= (and b!1258013 c!122503) b!1258009))

(assert (= (and b!1258013 (not c!122503)) b!1258005))

(assert (= (or b!1258009 b!1258005) bm!61839))

(assert (= (and d!138277 res!838511) b!1258006))

(assert (= (and b!1258006 res!838512) b!1258011))

(assert (= (and b!1258011 res!838510) b!1258008))

(assert (= (and b!1258011 c!122506) b!1258004))

(assert (= (and b!1258011 (not c!122506)) b!1258014))

(assert (= (and b!1258004 res!838513) b!1258012))

(assert (= (and b!1258014 c!122505) b!1258010))

(assert (= (and b!1258014 (not c!122505)) b!1258007))

(declare-fun b_lambda!22707 () Bool)

(assert (=> (not b_lambda!22707) (not b!1258009)))

(declare-fun t!41535 () Bool)

(declare-fun tb!11307 () Bool)

(assert (=> (and start!105598 (= defaultEntry!922 defaultEntry!922) t!41535) tb!11307))

(declare-fun result!23329 () Bool)

(assert (=> tb!11307 (= result!23329 tp_is_empty!32115)))

(assert (=> b!1258009 t!41535))

(declare-fun b_and!45083 () Bool)

(assert (= b_and!45079 (and (=> t!41535 result!23329) b_and!45083)))

(declare-fun b_lambda!22709 () Bool)

(assert (=> (not b_lambda!22709) (not b!1258012)))

(assert (=> b!1258012 t!41535))

(declare-fun b_and!45085 () Bool)

(assert (= b_and!45083 (and (=> t!41535 result!23329) b_and!45085)))

(declare-fun m!1158505 () Bool)

(assert (=> b!1258009 m!1158505))

(declare-fun m!1158507 () Bool)

(assert (=> b!1258009 m!1158507))

(declare-fun m!1158509 () Bool)

(assert (=> b!1258009 m!1158509))

(declare-fun m!1158511 () Bool)

(assert (=> b!1258009 m!1158511))

(assert (=> b!1258009 m!1158507))

(declare-fun m!1158513 () Bool)

(assert (=> b!1258009 m!1158513))

(assert (=> b!1258009 m!1158511))

(declare-fun m!1158515 () Bool)

(assert (=> b!1258009 m!1158515))

(declare-fun m!1158517 () Bool)

(assert (=> b!1258009 m!1158517))

(assert (=> b!1258009 m!1158517))

(declare-fun m!1158519 () Bool)

(assert (=> b!1258009 m!1158519))

(declare-fun m!1158521 () Bool)

(assert (=> d!138277 m!1158521))

(assert (=> d!138277 m!1158467))

(assert (=> b!1258013 m!1158515))

(assert (=> b!1258013 m!1158515))

(declare-fun m!1158523 () Bool)

(assert (=> b!1258013 m!1158523))

(declare-fun m!1158525 () Bool)

(assert (=> b!1258007 m!1158525))

(declare-fun m!1158527 () Bool)

(assert (=> b!1258006 m!1158527))

(assert (=> b!1258012 m!1158515))

(declare-fun m!1158529 () Bool)

(assert (=> b!1258012 m!1158529))

(assert (=> b!1258012 m!1158507))

(assert (=> b!1258012 m!1158511))

(assert (=> b!1258012 m!1158507))

(assert (=> b!1258012 m!1158513))

(assert (=> b!1258012 m!1158511))

(assert (=> b!1258012 m!1158515))

(assert (=> b!1258008 m!1158515))

(assert (=> b!1258008 m!1158515))

(assert (=> b!1258008 m!1158523))

(assert (=> b!1258004 m!1158515))

(assert (=> b!1258004 m!1158515))

(declare-fun m!1158531 () Bool)

(assert (=> b!1258004 m!1158531))

(declare-fun m!1158533 () Bool)

(assert (=> bm!61839 m!1158533))

(assert (=> b!1258010 m!1158533))

(assert (=> b!1257955 d!138277))

(declare-fun b!1258018 () Bool)

(declare-fun e!715421 () Bool)

(declare-fun e!715418 () Bool)

(assert (=> b!1258018 (= e!715421 e!715418)))

(assert (=> b!1258018 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40022 _keys!1118)))))

(declare-fun res!838517 () Bool)

(declare-fun lt!569004 () ListLongMap!18697)

(assert (=> b!1258018 (= res!838517 (contains!7567 lt!569004 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258018 (=> (not res!838517) (not e!715418))))

(declare-fun b!1258019 () Bool)

(declare-fun e!715419 () ListLongMap!18697)

(declare-fun call!61843 () ListLongMap!18697)

(assert (=> b!1258019 (= e!715419 call!61843)))

(declare-fun b!1258020 () Bool)

(declare-fun res!838516 () Bool)

(declare-fun e!715424 () Bool)

(assert (=> b!1258020 (=> (not res!838516) (not e!715424))))

(assert (=> b!1258020 (= res!838516 (not (contains!7567 lt!569004 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1258021 () Bool)

(declare-fun e!715422 () Bool)

(assert (=> b!1258021 (= e!715422 (isEmpty!1032 lt!569004))))

(declare-fun b!1258022 () Bool)

(declare-fun e!715420 () Bool)

(assert (=> b!1258022 (= e!715420 (validKeyInArray!0 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258022 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!138279 () Bool)

(assert (=> d!138279 e!715424))

(declare-fun res!838515 () Bool)

(assert (=> d!138279 (=> (not res!838515) (not e!715424))))

(assert (=> d!138279 (= res!838515 (not (contains!7567 lt!569004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!715423 () ListLongMap!18697)

(assert (=> d!138279 (= lt!569004 e!715423)))

(declare-fun c!122508 () Bool)

(assert (=> d!138279 (= c!122508 (bvsge #b00000000000000000000000000000000 (size!40022 _keys!1118)))))

(assert (=> d!138279 (validMask!0 mask!1466)))

(assert (=> d!138279 (= (getCurrentListMapNoExtraKeys!5742 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569004)))

(declare-fun b!1258023 () Bool)

(declare-fun lt!569002 () Unit!41912)

(declare-fun lt!568999 () Unit!41912)

(assert (=> b!1258023 (= lt!569002 lt!568999)))

(declare-fun lt!569003 () (_ BitVec 64))

(declare-fun lt!569001 () (_ BitVec 64))

(declare-fun lt!569005 () V!48185)

(declare-fun lt!569000 () ListLongMap!18697)

(assert (=> b!1258023 (not (contains!7567 (+!4189 lt!569000 (tuple2!20825 lt!569003 lt!569005)) lt!569001))))

(assert (=> b!1258023 (= lt!568999 (addStillNotContains!318 lt!569000 lt!569003 lt!569005 lt!569001))))

(assert (=> b!1258023 (= lt!569001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1258023 (= lt!569005 (get!20179 (select (arr!39487 _values!914) #b00000000000000000000000000000000) (dynLambda!3388 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1258023 (= lt!569003 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1258023 (= lt!569000 call!61843)))

(assert (=> b!1258023 (= e!715419 (+!4189 call!61843 (tuple2!20825 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000) (get!20179 (select (arr!39487 _values!914) #b00000000000000000000000000000000) (dynLambda!3388 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1258024 () Bool)

(assert (=> b!1258024 (= e!715422 (= lt!569004 (getCurrentListMapNoExtraKeys!5742 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1258025 () Bool)

(assert (=> b!1258025 (= e!715424 e!715421)))

(declare-fun c!122510 () Bool)

(assert (=> b!1258025 (= c!122510 e!715420)))

(declare-fun res!838514 () Bool)

(assert (=> b!1258025 (=> (not res!838514) (not e!715420))))

(assert (=> b!1258025 (= res!838514 (bvslt #b00000000000000000000000000000000 (size!40022 _keys!1118)))))

(declare-fun b!1258026 () Bool)

(assert (=> b!1258026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40022 _keys!1118)))))

(assert (=> b!1258026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40023 _values!914)))))

(assert (=> b!1258026 (= e!715418 (= (apply!990 lt!569004 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000)) (get!20179 (select (arr!39487 _values!914) #b00000000000000000000000000000000) (dynLambda!3388 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1258027 () Bool)

(assert (=> b!1258027 (= e!715423 e!715419)))

(declare-fun c!122507 () Bool)

(assert (=> b!1258027 (= c!122507 (validKeyInArray!0 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1258028 () Bool)

(assert (=> b!1258028 (= e!715421 e!715422)))

(declare-fun c!122509 () Bool)

(assert (=> b!1258028 (= c!122509 (bvslt #b00000000000000000000000000000000 (size!40022 _keys!1118)))))

(declare-fun bm!61840 () Bool)

(assert (=> bm!61840 (= call!61843 (getCurrentListMapNoExtraKeys!5742 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1258029 () Bool)

(assert (=> b!1258029 (= e!715423 (ListLongMap!18698 Nil!28037))))

(assert (= (and d!138279 c!122508) b!1258029))

(assert (= (and d!138279 (not c!122508)) b!1258027))

(assert (= (and b!1258027 c!122507) b!1258023))

(assert (= (and b!1258027 (not c!122507)) b!1258019))

(assert (= (or b!1258023 b!1258019) bm!61840))

(assert (= (and d!138279 res!838515) b!1258020))

(assert (= (and b!1258020 res!838516) b!1258025))

(assert (= (and b!1258025 res!838514) b!1258022))

(assert (= (and b!1258025 c!122510) b!1258018))

(assert (= (and b!1258025 (not c!122510)) b!1258028))

(assert (= (and b!1258018 res!838517) b!1258026))

(assert (= (and b!1258028 c!122509) b!1258024))

(assert (= (and b!1258028 (not c!122509)) b!1258021))

(declare-fun b_lambda!22711 () Bool)

(assert (=> (not b_lambda!22711) (not b!1258023)))

(assert (=> b!1258023 t!41535))

(declare-fun b_and!45087 () Bool)

(assert (= b_and!45085 (and (=> t!41535 result!23329) b_and!45087)))

(declare-fun b_lambda!22713 () Bool)

(assert (=> (not b_lambda!22713) (not b!1258026)))

(assert (=> b!1258026 t!41535))

(declare-fun b_and!45089 () Bool)

(assert (= b_and!45087 (and (=> t!41535 result!23329) b_and!45089)))

(declare-fun m!1158535 () Bool)

(assert (=> b!1258023 m!1158535))

(assert (=> b!1258023 m!1158507))

(declare-fun m!1158537 () Bool)

(assert (=> b!1258023 m!1158537))

(assert (=> b!1258023 m!1158511))

(assert (=> b!1258023 m!1158507))

(assert (=> b!1258023 m!1158513))

(assert (=> b!1258023 m!1158511))

(assert (=> b!1258023 m!1158515))

(declare-fun m!1158539 () Bool)

(assert (=> b!1258023 m!1158539))

(assert (=> b!1258023 m!1158539))

(declare-fun m!1158541 () Bool)

(assert (=> b!1258023 m!1158541))

(declare-fun m!1158543 () Bool)

(assert (=> d!138279 m!1158543))

(assert (=> d!138279 m!1158467))

(assert (=> b!1258027 m!1158515))

(assert (=> b!1258027 m!1158515))

(assert (=> b!1258027 m!1158523))

(declare-fun m!1158545 () Bool)

(assert (=> b!1258021 m!1158545))

(declare-fun m!1158547 () Bool)

(assert (=> b!1258020 m!1158547))

(assert (=> b!1258026 m!1158515))

(declare-fun m!1158549 () Bool)

(assert (=> b!1258026 m!1158549))

(assert (=> b!1258026 m!1158507))

(assert (=> b!1258026 m!1158511))

(assert (=> b!1258026 m!1158507))

(assert (=> b!1258026 m!1158513))

(assert (=> b!1258026 m!1158511))

(assert (=> b!1258026 m!1158515))

(assert (=> b!1258022 m!1158515))

(assert (=> b!1258022 m!1158515))

(assert (=> b!1258022 m!1158523))

(assert (=> b!1258018 m!1158515))

(assert (=> b!1258018 m!1158515))

(declare-fun m!1158551 () Bool)

(assert (=> b!1258018 m!1158551))

(declare-fun m!1158553 () Bool)

(assert (=> bm!61840 m!1158553))

(assert (=> b!1258024 m!1158553))

(assert (=> b!1257955 d!138279))

(declare-fun bm!61843 () Bool)

(declare-fun call!61846 () Bool)

(assert (=> bm!61843 (= call!61846 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1258038 () Bool)

(declare-fun e!715431 () Bool)

(declare-fun e!715433 () Bool)

(assert (=> b!1258038 (= e!715431 e!715433)))

(declare-fun c!122513 () Bool)

(assert (=> b!1258038 (= c!122513 (validKeyInArray!0 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138281 () Bool)

(declare-fun res!838523 () Bool)

(assert (=> d!138281 (=> res!838523 e!715431)))

(assert (=> d!138281 (= res!838523 (bvsge #b00000000000000000000000000000000 (size!40022 _keys!1118)))))

(assert (=> d!138281 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!715431)))

(declare-fun b!1258039 () Bool)

(assert (=> b!1258039 (= e!715433 call!61846)))

(declare-fun b!1258040 () Bool)

(declare-fun e!715432 () Bool)

(assert (=> b!1258040 (= e!715432 call!61846)))

(declare-fun b!1258041 () Bool)

(assert (=> b!1258041 (= e!715433 e!715432)))

(declare-fun lt!569013 () (_ BitVec 64))

(assert (=> b!1258041 (= lt!569013 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569012 () Unit!41912)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81858 (_ BitVec 64) (_ BitVec 32)) Unit!41912)

(assert (=> b!1258041 (= lt!569012 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!569013 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1258041 (arrayContainsKey!0 _keys!1118 lt!569013 #b00000000000000000000000000000000)))

(declare-fun lt!569014 () Unit!41912)

(assert (=> b!1258041 (= lt!569014 lt!569012)))

(declare-fun res!838522 () Bool)

(declare-datatypes ((SeekEntryResult!9968 0))(
  ( (MissingZero!9968 (index!42243 (_ BitVec 32))) (Found!9968 (index!42244 (_ BitVec 32))) (Intermediate!9968 (undefined!10780 Bool) (index!42245 (_ BitVec 32)) (x!110801 (_ BitVec 32))) (Undefined!9968) (MissingVacant!9968 (index!42246 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81858 (_ BitVec 32)) SeekEntryResult!9968)

(assert (=> b!1258041 (= res!838522 (= (seekEntryOrOpen!0 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9968 #b00000000000000000000000000000000)))))

(assert (=> b!1258041 (=> (not res!838522) (not e!715432))))

(assert (= (and d!138281 (not res!838523)) b!1258038))

(assert (= (and b!1258038 c!122513) b!1258041))

(assert (= (and b!1258038 (not c!122513)) b!1258039))

(assert (= (and b!1258041 res!838522) b!1258040))

(assert (= (or b!1258040 b!1258039) bm!61843))

(declare-fun m!1158555 () Bool)

(assert (=> bm!61843 m!1158555))

(assert (=> b!1258038 m!1158515))

(assert (=> b!1258038 m!1158515))

(assert (=> b!1258038 m!1158523))

(assert (=> b!1258041 m!1158515))

(declare-fun m!1158557 () Bool)

(assert (=> b!1258041 m!1158557))

(declare-fun m!1158559 () Bool)

(assert (=> b!1258041 m!1158559))

(assert (=> b!1258041 m!1158515))

(declare-fun m!1158561 () Bool)

(assert (=> b!1258041 m!1158561))

(assert (=> b!1257957 d!138281))

(declare-fun bm!61846 () Bool)

(declare-fun call!61849 () Bool)

(declare-fun c!122516 () Bool)

(assert (=> bm!61846 (= call!61849 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122516 (Cons!28035 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000) Nil!28036) Nil!28036)))))

(declare-fun d!138283 () Bool)

(declare-fun res!838532 () Bool)

(declare-fun e!715442 () Bool)

(assert (=> d!138283 (=> res!838532 e!715442)))

(assert (=> d!138283 (= res!838532 (bvsge #b00000000000000000000000000000000 (size!40022 _keys!1118)))))

(assert (=> d!138283 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28036) e!715442)))

(declare-fun b!1258052 () Bool)

(declare-fun e!715444 () Bool)

(declare-fun contains!7568 (List!28039 (_ BitVec 64)) Bool)

(assert (=> b!1258052 (= e!715444 (contains!7568 Nil!28036 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1258053 () Bool)

(declare-fun e!715445 () Bool)

(assert (=> b!1258053 (= e!715445 call!61849)))

(declare-fun b!1258054 () Bool)

(declare-fun e!715443 () Bool)

(assert (=> b!1258054 (= e!715443 e!715445)))

(assert (=> b!1258054 (= c!122516 (validKeyInArray!0 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1258055 () Bool)

(assert (=> b!1258055 (= e!715445 call!61849)))

(declare-fun b!1258056 () Bool)

(assert (=> b!1258056 (= e!715442 e!715443)))

(declare-fun res!838530 () Bool)

(assert (=> b!1258056 (=> (not res!838530) (not e!715443))))

(assert (=> b!1258056 (= res!838530 (not e!715444))))

(declare-fun res!838531 () Bool)

(assert (=> b!1258056 (=> (not res!838531) (not e!715444))))

(assert (=> b!1258056 (= res!838531 (validKeyInArray!0 (select (arr!39486 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138283 (not res!838532)) b!1258056))

(assert (= (and b!1258056 res!838531) b!1258052))

(assert (= (and b!1258056 res!838530) b!1258054))

(assert (= (and b!1258054 c!122516) b!1258053))

(assert (= (and b!1258054 (not c!122516)) b!1258055))

(assert (= (or b!1258053 b!1258055) bm!61846))

(assert (=> bm!61846 m!1158515))

(declare-fun m!1158563 () Bool)

(assert (=> bm!61846 m!1158563))

(assert (=> b!1258052 m!1158515))

(assert (=> b!1258052 m!1158515))

(declare-fun m!1158565 () Bool)

(assert (=> b!1258052 m!1158565))

(assert (=> b!1258054 m!1158515))

(assert (=> b!1258054 m!1158515))

(assert (=> b!1258054 m!1158523))

(assert (=> b!1258056 m!1158515))

(assert (=> b!1258056 m!1158515))

(assert (=> b!1258056 m!1158523))

(assert (=> b!1257954 d!138283))

(declare-fun mapNonEmpty!49969 () Bool)

(declare-fun mapRes!49969 () Bool)

(declare-fun tp!95168 () Bool)

(declare-fun e!715451 () Bool)

(assert (=> mapNonEmpty!49969 (= mapRes!49969 (and tp!95168 e!715451))))

(declare-fun mapValue!49969 () ValueCell!15294)

(declare-fun mapRest!49969 () (Array (_ BitVec 32) ValueCell!15294))

(declare-fun mapKey!49969 () (_ BitVec 32))

(assert (=> mapNonEmpty!49969 (= mapRest!49963 (store mapRest!49969 mapKey!49969 mapValue!49969))))

(declare-fun mapIsEmpty!49969 () Bool)

(assert (=> mapIsEmpty!49969 mapRes!49969))

(declare-fun condMapEmpty!49969 () Bool)

(declare-fun mapDefault!49969 () ValueCell!15294)

(assert (=> mapNonEmpty!49963 (= condMapEmpty!49969 (= mapRest!49963 ((as const (Array (_ BitVec 32) ValueCell!15294)) mapDefault!49969)))))

(declare-fun e!715450 () Bool)

(assert (=> mapNonEmpty!49963 (= tp!95158 (and e!715450 mapRes!49969))))

(declare-fun b!1258064 () Bool)

(assert (=> b!1258064 (= e!715450 tp_is_empty!32115)))

(declare-fun b!1258063 () Bool)

(assert (=> b!1258063 (= e!715451 tp_is_empty!32115)))

(assert (= (and mapNonEmpty!49963 condMapEmpty!49969) mapIsEmpty!49969))

(assert (= (and mapNonEmpty!49963 (not condMapEmpty!49969)) mapNonEmpty!49969))

(assert (= (and mapNonEmpty!49969 ((_ is ValueCellFull!15294) mapValue!49969)) b!1258063))

(assert (= (and mapNonEmpty!49963 ((_ is ValueCellFull!15294) mapDefault!49969)) b!1258064))

(declare-fun m!1158567 () Bool)

(assert (=> mapNonEmpty!49969 m!1158567))

(declare-fun b_lambda!22715 () Bool)

(assert (= b_lambda!22713 (or (and start!105598 b_free!27213) b_lambda!22715)))

(declare-fun b_lambda!22717 () Bool)

(assert (= b_lambda!22707 (or (and start!105598 b_free!27213) b_lambda!22717)))

(declare-fun b_lambda!22719 () Bool)

(assert (= b_lambda!22709 (or (and start!105598 b_free!27213) b_lambda!22719)))

(declare-fun b_lambda!22721 () Bool)

(assert (= b_lambda!22711 (or (and start!105598 b_free!27213) b_lambda!22721)))

(check-sat (not d!138277) (not b!1258007) (not d!138279) (not b!1258022) (not b!1258018) (not bm!61843) (not b!1258021) (not b!1258009) (not bm!61839) (not bm!61846) (not b_lambda!22717) b_and!45089 tp_is_empty!32115 (not mapNonEmpty!49969) (not b_lambda!22715) (not b!1258024) (not b!1258006) (not b!1258004) (not b!1258056) (not b!1258026) (not b!1258013) (not b!1258023) (not b!1258041) (not b!1258008) (not b!1258054) (not b!1258038) (not b!1258010) (not b_next!27213) (not d!138275) (not b!1258012) (not b!1258020) (not b_lambda!22721) (not b!1258027) (not b!1258052) (not b_lambda!22719) (not bm!61840))
(check-sat b_and!45089 (not b_next!27213))
