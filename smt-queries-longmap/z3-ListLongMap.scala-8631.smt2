; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105070 () Bool)

(assert start!105070)

(declare-fun b_free!26821 () Bool)

(declare-fun b_next!26821 () Bool)

(assert (=> start!105070 (= b_free!26821 (not b_next!26821))))

(declare-fun tp!93961 () Bool)

(declare-fun b_and!44599 () Bool)

(assert (=> start!105070 (= tp!93961 b_and!44599)))

(declare-fun b!1252160 () Bool)

(declare-fun e!711156 () Bool)

(declare-fun tp_is_empty!31723 () Bool)

(assert (=> b!1252160 (= e!711156 tp_is_empty!31723)))

(declare-fun b!1252161 () Bool)

(declare-fun res!835094 () Bool)

(declare-fun e!711157 () Bool)

(assert (=> b!1252161 (=> (not res!835094) (not e!711157))))

(declare-datatypes ((array!81031 0))(
  ( (array!81032 (arr!39080 (Array (_ BitVec 32) (_ BitVec 64))) (size!39618 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81031)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81031 (_ BitVec 32)) Bool)

(assert (=> b!1252161 (= res!835094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49354 () Bool)

(declare-fun mapRes!49354 () Bool)

(assert (=> mapIsEmpty!49354 mapRes!49354))

(declare-fun b!1252162 () Bool)

(declare-fun res!835097 () Bool)

(assert (=> b!1252162 (=> (not res!835097) (not e!711157))))

(declare-datatypes ((List!27842 0))(
  ( (Nil!27839) (Cons!27838 (h!29047 (_ BitVec 64)) (t!41310 List!27842)) )
))
(declare-fun arrayNoDuplicates!0 (array!81031 (_ BitVec 32) List!27842) Bool)

(assert (=> b!1252162 (= res!835097 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27839))))

(declare-fun b!1252163 () Bool)

(declare-fun res!835095 () Bool)

(assert (=> b!1252163 (=> (not res!835095) (not e!711157))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47663 0))(
  ( (V!47664 (val!15924 Int)) )
))
(declare-datatypes ((ValueCell!15098 0))(
  ( (ValueCellFull!15098 (v!18621 V!47663)) (EmptyCell!15098) )
))
(declare-datatypes ((array!81033 0))(
  ( (array!81034 (arr!39081 (Array (_ BitVec 32) ValueCell!15098)) (size!39619 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81033)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252163 (= res!835095 (and (= (size!39619 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39618 _keys!1118) (size!39619 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!835096 () Bool)

(assert (=> start!105070 (=> (not res!835096) (not e!711157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105070 (= res!835096 (validMask!0 mask!1466))))

(assert (=> start!105070 e!711157))

(assert (=> start!105070 true))

(assert (=> start!105070 tp!93961))

(assert (=> start!105070 tp_is_empty!31723))

(declare-fun array_inv!29933 (array!81031) Bool)

(assert (=> start!105070 (array_inv!29933 _keys!1118)))

(declare-fun e!711160 () Bool)

(declare-fun array_inv!29934 (array!81033) Bool)

(assert (=> start!105070 (and (array_inv!29934 _values!914) e!711160)))

(declare-fun b!1252164 () Bool)

(declare-fun e!711159 () Bool)

(assert (=> b!1252164 (= e!711159 tp_is_empty!31723)))

(declare-fun b!1252165 () Bool)

(assert (=> b!1252165 (= e!711160 (and e!711159 mapRes!49354))))

(declare-fun condMapEmpty!49354 () Bool)

(declare-fun mapDefault!49354 () ValueCell!15098)

(assert (=> b!1252165 (= condMapEmpty!49354 (= (arr!39081 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15098)) mapDefault!49354)))))

(declare-fun mapNonEmpty!49354 () Bool)

(declare-fun tp!93962 () Bool)

(assert (=> mapNonEmpty!49354 (= mapRes!49354 (and tp!93962 e!711156))))

(declare-fun mapRest!49354 () (Array (_ BitVec 32) ValueCell!15098))

(declare-fun mapKey!49354 () (_ BitVec 32))

(declare-fun mapValue!49354 () ValueCell!15098)

(assert (=> mapNonEmpty!49354 (= (arr!39081 _values!914) (store mapRest!49354 mapKey!49354 mapValue!49354))))

(declare-fun b!1252166 () Bool)

(assert (=> b!1252166 (= e!711157 (not (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!39618 _keys!1118)))))))

(declare-datatypes ((tuple2!20628 0))(
  ( (tuple2!20629 (_1!10325 (_ BitVec 64)) (_2!10325 V!47663)) )
))
(declare-datatypes ((List!27843 0))(
  ( (Nil!27840) (Cons!27839 (h!29048 tuple2!20628) (t!41311 List!27843)) )
))
(declare-datatypes ((ListLongMap!18501 0))(
  ( (ListLongMap!18502 (toList!9266 List!27843)) )
))
(declare-fun lt!565060 () ListLongMap!18501)

(declare-fun lt!565059 () ListLongMap!18501)

(assert (=> b!1252166 (= lt!565060 lt!565059)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47663)

(declare-datatypes ((Unit!41498 0))(
  ( (Unit!41499) )
))
(declare-fun lt!565061 () Unit!41498)

(declare-fun zeroValue!871 () V!47663)

(declare-fun minValueBefore!43 () V!47663)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!992 (array!81031 array!81033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47663 V!47663 V!47663 V!47663 (_ BitVec 32) Int) Unit!41498)

(assert (=> b!1252166 (= lt!565061 (lemmaNoChangeToArrayThenSameMapNoExtras!992 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5670 (array!81031 array!81033 (_ BitVec 32) (_ BitVec 32) V!47663 V!47663 (_ BitVec 32) Int) ListLongMap!18501)

(assert (=> b!1252166 (= lt!565059 (getCurrentListMapNoExtraKeys!5670 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252166 (= lt!565060 (getCurrentListMapNoExtraKeys!5670 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105070 res!835096) b!1252163))

(assert (= (and b!1252163 res!835095) b!1252161))

(assert (= (and b!1252161 res!835094) b!1252162))

(assert (= (and b!1252162 res!835097) b!1252166))

(assert (= (and b!1252165 condMapEmpty!49354) mapIsEmpty!49354))

(assert (= (and b!1252165 (not condMapEmpty!49354)) mapNonEmpty!49354))

(get-info :version)

(assert (= (and mapNonEmpty!49354 ((_ is ValueCellFull!15098) mapValue!49354)) b!1252160))

(assert (= (and b!1252165 ((_ is ValueCellFull!15098) mapDefault!49354)) b!1252164))

(assert (= start!105070 b!1252165))

(declare-fun m!1152385 () Bool)

(assert (=> b!1252161 m!1152385))

(declare-fun m!1152387 () Bool)

(assert (=> mapNonEmpty!49354 m!1152387))

(declare-fun m!1152389 () Bool)

(assert (=> b!1252166 m!1152389))

(declare-fun m!1152391 () Bool)

(assert (=> b!1252166 m!1152391))

(declare-fun m!1152393 () Bool)

(assert (=> b!1252166 m!1152393))

(declare-fun m!1152395 () Bool)

(assert (=> start!105070 m!1152395))

(declare-fun m!1152397 () Bool)

(assert (=> start!105070 m!1152397))

(declare-fun m!1152399 () Bool)

(assert (=> start!105070 m!1152399))

(declare-fun m!1152401 () Bool)

(assert (=> b!1252162 m!1152401))

(check-sat tp_is_empty!31723 (not b!1252166) (not b!1252161) (not mapNonEmpty!49354) (not b!1252162) b_and!44599 (not b_next!26821) (not start!105070))
(check-sat b_and!44599 (not b_next!26821))
(get-model)

(declare-fun d!137853 () Bool)

(assert (=> d!137853 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105070 d!137853))

(declare-fun d!137855 () Bool)

(assert (=> d!137855 (= (array_inv!29933 _keys!1118) (bvsge (size!39618 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105070 d!137855))

(declare-fun d!137857 () Bool)

(assert (=> d!137857 (= (array_inv!29934 _values!914) (bvsge (size!39619 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105070 d!137857))

(declare-fun b!1252219 () Bool)

(declare-fun e!711201 () Bool)

(declare-fun contains!7486 (List!27842 (_ BitVec 64)) Bool)

(assert (=> b!1252219 (= e!711201 (contains!7486 Nil!27839 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252220 () Bool)

(declare-fun e!711199 () Bool)

(declare-fun call!61634 () Bool)

(assert (=> b!1252220 (= e!711199 call!61634)))

(declare-fun bm!61631 () Bool)

(declare-fun c!122217 () Bool)

(assert (=> bm!61631 (= call!61634 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122217 (Cons!27838 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000) Nil!27839) Nil!27839)))))

(declare-fun b!1252221 () Bool)

(declare-fun e!711202 () Bool)

(declare-fun e!711200 () Bool)

(assert (=> b!1252221 (= e!711202 e!711200)))

(declare-fun res!835129 () Bool)

(assert (=> b!1252221 (=> (not res!835129) (not e!711200))))

(assert (=> b!1252221 (= res!835129 (not e!711201))))

(declare-fun res!835130 () Bool)

(assert (=> b!1252221 (=> (not res!835130) (not e!711201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1252221 (= res!835130 (validKeyInArray!0 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252222 () Bool)

(assert (=> b!1252222 (= e!711200 e!711199)))

(assert (=> b!1252222 (= c!122217 (validKeyInArray!0 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252223 () Bool)

(assert (=> b!1252223 (= e!711199 call!61634)))

(declare-fun d!137859 () Bool)

(declare-fun res!835128 () Bool)

(assert (=> d!137859 (=> res!835128 e!711202)))

(assert (=> d!137859 (= res!835128 (bvsge #b00000000000000000000000000000000 (size!39618 _keys!1118)))))

(assert (=> d!137859 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27839) e!711202)))

(assert (= (and d!137859 (not res!835128)) b!1252221))

(assert (= (and b!1252221 res!835130) b!1252219))

(assert (= (and b!1252221 res!835129) b!1252222))

(assert (= (and b!1252222 c!122217) b!1252223))

(assert (= (and b!1252222 (not c!122217)) b!1252220))

(assert (= (or b!1252223 b!1252220) bm!61631))

(declare-fun m!1152439 () Bool)

(assert (=> b!1252219 m!1152439))

(assert (=> b!1252219 m!1152439))

(declare-fun m!1152441 () Bool)

(assert (=> b!1252219 m!1152441))

(assert (=> bm!61631 m!1152439))

(declare-fun m!1152443 () Bool)

(assert (=> bm!61631 m!1152443))

(assert (=> b!1252221 m!1152439))

(assert (=> b!1252221 m!1152439))

(declare-fun m!1152445 () Bool)

(assert (=> b!1252221 m!1152445))

(assert (=> b!1252222 m!1152439))

(assert (=> b!1252222 m!1152439))

(assert (=> b!1252222 m!1152445))

(assert (=> b!1252162 d!137859))

(declare-fun d!137861 () Bool)

(assert (=> d!137861 (= (getCurrentListMapNoExtraKeys!5670 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5670 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565082 () Unit!41498)

(declare-fun choose!1860 (array!81031 array!81033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47663 V!47663 V!47663 V!47663 (_ BitVec 32) Int) Unit!41498)

(assert (=> d!137861 (= lt!565082 (choose!1860 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!137861 (validMask!0 mask!1466)))

(assert (=> d!137861 (= (lemmaNoChangeToArrayThenSameMapNoExtras!992 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565082)))

(declare-fun bs!35339 () Bool)

(assert (= bs!35339 d!137861))

(assert (=> bs!35339 m!1152393))

(assert (=> bs!35339 m!1152391))

(declare-fun m!1152447 () Bool)

(assert (=> bs!35339 m!1152447))

(assert (=> bs!35339 m!1152395))

(assert (=> b!1252166 d!137861))

(declare-fun b!1252248 () Bool)

(declare-fun e!711222 () Bool)

(declare-fun lt!565099 () ListLongMap!18501)

(assert (=> b!1252248 (= e!711222 (= lt!565099 (getCurrentListMapNoExtraKeys!5670 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1252249 () Bool)

(declare-fun isEmpty!1031 (ListLongMap!18501) Bool)

(assert (=> b!1252249 (= e!711222 (isEmpty!1031 lt!565099))))

(declare-fun b!1252250 () Bool)

(declare-fun e!711223 () Bool)

(assert (=> b!1252250 (= e!711223 (validKeyInArray!0 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252250 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1252252 () Bool)

(declare-fun e!711220 () Bool)

(declare-fun e!711219 () Bool)

(assert (=> b!1252252 (= e!711220 e!711219)))

(declare-fun c!122228 () Bool)

(assert (=> b!1252252 (= c!122228 e!711223)))

(declare-fun res!835141 () Bool)

(assert (=> b!1252252 (=> (not res!835141) (not e!711223))))

(assert (=> b!1252252 (= res!835141 (bvslt #b00000000000000000000000000000000 (size!39618 _keys!1118)))))

(declare-fun b!1252253 () Bool)

(declare-fun e!711221 () ListLongMap!18501)

(declare-fun e!711218 () ListLongMap!18501)

(assert (=> b!1252253 (= e!711221 e!711218)))

(declare-fun c!122226 () Bool)

(assert (=> b!1252253 (= c!122226 (validKeyInArray!0 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252254 () Bool)

(declare-fun res!835142 () Bool)

(assert (=> b!1252254 (=> (not res!835142) (not e!711220))))

(declare-fun contains!7487 (ListLongMap!18501 (_ BitVec 64)) Bool)

(assert (=> b!1252254 (= res!835142 (not (contains!7487 lt!565099 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!61637 () ListLongMap!18501)

(declare-fun bm!61634 () Bool)

(assert (=> bm!61634 (= call!61637 (getCurrentListMapNoExtraKeys!5670 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1252255 () Bool)

(assert (=> b!1252255 (= e!711221 (ListLongMap!18502 Nil!27840))))

(declare-fun b!1252256 () Bool)

(declare-fun lt!565098 () Unit!41498)

(declare-fun lt!565100 () Unit!41498)

(assert (=> b!1252256 (= lt!565098 lt!565100)))

(declare-fun lt!565097 () (_ BitVec 64))

(declare-fun lt!565102 () ListLongMap!18501)

(declare-fun lt!565101 () (_ BitVec 64))

(declare-fun lt!565103 () V!47663)

(declare-fun +!4187 (ListLongMap!18501 tuple2!20628) ListLongMap!18501)

(assert (=> b!1252256 (not (contains!7487 (+!4187 lt!565102 (tuple2!20629 lt!565101 lt!565103)) lt!565097))))

(declare-fun addStillNotContains!312 (ListLongMap!18501 (_ BitVec 64) V!47663 (_ BitVec 64)) Unit!41498)

(assert (=> b!1252256 (= lt!565100 (addStillNotContains!312 lt!565102 lt!565101 lt!565103 lt!565097))))

(assert (=> b!1252256 (= lt!565097 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20043 (ValueCell!15098 V!47663) V!47663)

(declare-fun dynLambda!3406 (Int (_ BitVec 64)) V!47663)

(assert (=> b!1252256 (= lt!565103 (get!20043 (select (arr!39081 _values!914) #b00000000000000000000000000000000) (dynLambda!3406 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1252256 (= lt!565101 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1252256 (= lt!565102 call!61637)))

(assert (=> b!1252256 (= e!711218 (+!4187 call!61637 (tuple2!20629 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000) (get!20043 (select (arr!39081 _values!914) #b00000000000000000000000000000000) (dynLambda!3406 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1252257 () Bool)

(declare-fun e!711217 () Bool)

(assert (=> b!1252257 (= e!711219 e!711217)))

(assert (=> b!1252257 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39618 _keys!1118)))))

(declare-fun res!835140 () Bool)

(assert (=> b!1252257 (= res!835140 (contains!7487 lt!565099 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252257 (=> (not res!835140) (not e!711217))))

(declare-fun b!1252258 () Bool)

(assert (=> b!1252258 (= e!711218 call!61637)))

(declare-fun b!1252259 () Bool)

(assert (=> b!1252259 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39618 _keys!1118)))))

(assert (=> b!1252259 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39619 _values!914)))))

(declare-fun apply!976 (ListLongMap!18501 (_ BitVec 64)) V!47663)

(assert (=> b!1252259 (= e!711217 (= (apply!976 lt!565099 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000)) (get!20043 (select (arr!39081 _values!914) #b00000000000000000000000000000000) (dynLambda!3406 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1252251 () Bool)

(assert (=> b!1252251 (= e!711219 e!711222)))

(declare-fun c!122227 () Bool)

(assert (=> b!1252251 (= c!122227 (bvslt #b00000000000000000000000000000000 (size!39618 _keys!1118)))))

(declare-fun d!137863 () Bool)

(assert (=> d!137863 e!711220))

(declare-fun res!835139 () Bool)

(assert (=> d!137863 (=> (not res!835139) (not e!711220))))

(assert (=> d!137863 (= res!835139 (not (contains!7487 lt!565099 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137863 (= lt!565099 e!711221)))

(declare-fun c!122229 () Bool)

(assert (=> d!137863 (= c!122229 (bvsge #b00000000000000000000000000000000 (size!39618 _keys!1118)))))

(assert (=> d!137863 (validMask!0 mask!1466)))

(assert (=> d!137863 (= (getCurrentListMapNoExtraKeys!5670 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565099)))

(assert (= (and d!137863 c!122229) b!1252255))

(assert (= (and d!137863 (not c!122229)) b!1252253))

(assert (= (and b!1252253 c!122226) b!1252256))

(assert (= (and b!1252253 (not c!122226)) b!1252258))

(assert (= (or b!1252256 b!1252258) bm!61634))

(assert (= (and d!137863 res!835139) b!1252254))

(assert (= (and b!1252254 res!835142) b!1252252))

(assert (= (and b!1252252 res!835141) b!1252250))

(assert (= (and b!1252252 c!122228) b!1252257))

(assert (= (and b!1252252 (not c!122228)) b!1252251))

(assert (= (and b!1252257 res!835140) b!1252259))

(assert (= (and b!1252251 c!122227) b!1252248))

(assert (= (and b!1252251 (not c!122227)) b!1252249))

(declare-fun b_lambda!22557 () Bool)

(assert (=> (not b_lambda!22557) (not b!1252256)))

(declare-fun t!41315 () Bool)

(declare-fun tb!11285 () Bool)

(assert (=> (and start!105070 (= defaultEntry!922 defaultEntry!922) t!41315) tb!11285))

(declare-fun result!23279 () Bool)

(assert (=> tb!11285 (= result!23279 tp_is_empty!31723)))

(assert (=> b!1252256 t!41315))

(declare-fun b_and!44605 () Bool)

(assert (= b_and!44599 (and (=> t!41315 result!23279) b_and!44605)))

(declare-fun b_lambda!22559 () Bool)

(assert (=> (not b_lambda!22559) (not b!1252259)))

(assert (=> b!1252259 t!41315))

(declare-fun b_and!44607 () Bool)

(assert (= b_and!44605 (and (=> t!41315 result!23279) b_and!44607)))

(declare-fun m!1152449 () Bool)

(assert (=> bm!61634 m!1152449))

(assert (=> b!1252259 m!1152439))

(declare-fun m!1152451 () Bool)

(assert (=> b!1252259 m!1152451))

(declare-fun m!1152453 () Bool)

(assert (=> b!1252259 m!1152453))

(declare-fun m!1152455 () Bool)

(assert (=> b!1252259 m!1152455))

(assert (=> b!1252259 m!1152439))

(declare-fun m!1152457 () Bool)

(assert (=> b!1252259 m!1152457))

(assert (=> b!1252259 m!1152453))

(assert (=> b!1252259 m!1152451))

(declare-fun m!1152459 () Bool)

(assert (=> d!137863 m!1152459))

(assert (=> d!137863 m!1152395))

(assert (=> b!1252253 m!1152439))

(assert (=> b!1252253 m!1152439))

(assert (=> b!1252253 m!1152445))

(declare-fun m!1152461 () Bool)

(assert (=> b!1252256 m!1152461))

(declare-fun m!1152463 () Bool)

(assert (=> b!1252256 m!1152463))

(assert (=> b!1252256 m!1152439))

(declare-fun m!1152465 () Bool)

(assert (=> b!1252256 m!1152465))

(assert (=> b!1252256 m!1152451))

(assert (=> b!1252256 m!1152453))

(assert (=> b!1252256 m!1152455))

(assert (=> b!1252256 m!1152461))

(assert (=> b!1252256 m!1152451))

(declare-fun m!1152467 () Bool)

(assert (=> b!1252256 m!1152467))

(assert (=> b!1252256 m!1152453))

(assert (=> b!1252248 m!1152449))

(declare-fun m!1152469 () Bool)

(assert (=> b!1252249 m!1152469))

(assert (=> b!1252250 m!1152439))

(assert (=> b!1252250 m!1152439))

(assert (=> b!1252250 m!1152445))

(assert (=> b!1252257 m!1152439))

(assert (=> b!1252257 m!1152439))

(declare-fun m!1152471 () Bool)

(assert (=> b!1252257 m!1152471))

(declare-fun m!1152473 () Bool)

(assert (=> b!1252254 m!1152473))

(assert (=> b!1252166 d!137863))

(declare-fun lt!565106 () ListLongMap!18501)

(declare-fun b!1252262 () Bool)

(declare-fun e!711229 () Bool)

(assert (=> b!1252262 (= e!711229 (= lt!565106 (getCurrentListMapNoExtraKeys!5670 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1252263 () Bool)

(assert (=> b!1252263 (= e!711229 (isEmpty!1031 lt!565106))))

(declare-fun b!1252264 () Bool)

(declare-fun e!711230 () Bool)

(assert (=> b!1252264 (= e!711230 (validKeyInArray!0 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252264 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1252266 () Bool)

(declare-fun e!711227 () Bool)

(declare-fun e!711226 () Bool)

(assert (=> b!1252266 (= e!711227 e!711226)))

(declare-fun c!122232 () Bool)

(assert (=> b!1252266 (= c!122232 e!711230)))

(declare-fun res!835145 () Bool)

(assert (=> b!1252266 (=> (not res!835145) (not e!711230))))

(assert (=> b!1252266 (= res!835145 (bvslt #b00000000000000000000000000000000 (size!39618 _keys!1118)))))

(declare-fun b!1252267 () Bool)

(declare-fun e!711228 () ListLongMap!18501)

(declare-fun e!711225 () ListLongMap!18501)

(assert (=> b!1252267 (= e!711228 e!711225)))

(declare-fun c!122230 () Bool)

(assert (=> b!1252267 (= c!122230 (validKeyInArray!0 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252268 () Bool)

(declare-fun res!835146 () Bool)

(assert (=> b!1252268 (=> (not res!835146) (not e!711227))))

(assert (=> b!1252268 (= res!835146 (not (contains!7487 lt!565106 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!61638 () ListLongMap!18501)

(declare-fun bm!61635 () Bool)

(assert (=> bm!61635 (= call!61638 (getCurrentListMapNoExtraKeys!5670 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1252269 () Bool)

(assert (=> b!1252269 (= e!711228 (ListLongMap!18502 Nil!27840))))

(declare-fun b!1252270 () Bool)

(declare-fun lt!565105 () Unit!41498)

(declare-fun lt!565107 () Unit!41498)

(assert (=> b!1252270 (= lt!565105 lt!565107)))

(declare-fun lt!565110 () V!47663)

(declare-fun lt!565109 () ListLongMap!18501)

(declare-fun lt!565104 () (_ BitVec 64))

(declare-fun lt!565108 () (_ BitVec 64))

(assert (=> b!1252270 (not (contains!7487 (+!4187 lt!565109 (tuple2!20629 lt!565108 lt!565110)) lt!565104))))

(assert (=> b!1252270 (= lt!565107 (addStillNotContains!312 lt!565109 lt!565108 lt!565110 lt!565104))))

(assert (=> b!1252270 (= lt!565104 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1252270 (= lt!565110 (get!20043 (select (arr!39081 _values!914) #b00000000000000000000000000000000) (dynLambda!3406 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1252270 (= lt!565108 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1252270 (= lt!565109 call!61638)))

(assert (=> b!1252270 (= e!711225 (+!4187 call!61638 (tuple2!20629 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000) (get!20043 (select (arr!39081 _values!914) #b00000000000000000000000000000000) (dynLambda!3406 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1252271 () Bool)

(declare-fun e!711224 () Bool)

(assert (=> b!1252271 (= e!711226 e!711224)))

(assert (=> b!1252271 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39618 _keys!1118)))))

(declare-fun res!835144 () Bool)

(assert (=> b!1252271 (= res!835144 (contains!7487 lt!565106 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252271 (=> (not res!835144) (not e!711224))))

(declare-fun b!1252272 () Bool)

(assert (=> b!1252272 (= e!711225 call!61638)))

(declare-fun b!1252273 () Bool)

(assert (=> b!1252273 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39618 _keys!1118)))))

(assert (=> b!1252273 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39619 _values!914)))))

(assert (=> b!1252273 (= e!711224 (= (apply!976 lt!565106 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000)) (get!20043 (select (arr!39081 _values!914) #b00000000000000000000000000000000) (dynLambda!3406 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1252265 () Bool)

(assert (=> b!1252265 (= e!711226 e!711229)))

(declare-fun c!122231 () Bool)

(assert (=> b!1252265 (= c!122231 (bvslt #b00000000000000000000000000000000 (size!39618 _keys!1118)))))

(declare-fun d!137865 () Bool)

(assert (=> d!137865 e!711227))

(declare-fun res!835143 () Bool)

(assert (=> d!137865 (=> (not res!835143) (not e!711227))))

(assert (=> d!137865 (= res!835143 (not (contains!7487 lt!565106 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137865 (= lt!565106 e!711228)))

(declare-fun c!122233 () Bool)

(assert (=> d!137865 (= c!122233 (bvsge #b00000000000000000000000000000000 (size!39618 _keys!1118)))))

(assert (=> d!137865 (validMask!0 mask!1466)))

(assert (=> d!137865 (= (getCurrentListMapNoExtraKeys!5670 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565106)))

(assert (= (and d!137865 c!122233) b!1252269))

(assert (= (and d!137865 (not c!122233)) b!1252267))

(assert (= (and b!1252267 c!122230) b!1252270))

(assert (= (and b!1252267 (not c!122230)) b!1252272))

(assert (= (or b!1252270 b!1252272) bm!61635))

(assert (= (and d!137865 res!835143) b!1252268))

(assert (= (and b!1252268 res!835146) b!1252266))

(assert (= (and b!1252266 res!835145) b!1252264))

(assert (= (and b!1252266 c!122232) b!1252271))

(assert (= (and b!1252266 (not c!122232)) b!1252265))

(assert (= (and b!1252271 res!835144) b!1252273))

(assert (= (and b!1252265 c!122231) b!1252262))

(assert (= (and b!1252265 (not c!122231)) b!1252263))

(declare-fun b_lambda!22561 () Bool)

(assert (=> (not b_lambda!22561) (not b!1252270)))

(assert (=> b!1252270 t!41315))

(declare-fun b_and!44609 () Bool)

(assert (= b_and!44607 (and (=> t!41315 result!23279) b_and!44609)))

(declare-fun b_lambda!22563 () Bool)

(assert (=> (not b_lambda!22563) (not b!1252273)))

(assert (=> b!1252273 t!41315))

(declare-fun b_and!44611 () Bool)

(assert (= b_and!44609 (and (=> t!41315 result!23279) b_and!44611)))

(declare-fun m!1152475 () Bool)

(assert (=> bm!61635 m!1152475))

(assert (=> b!1252273 m!1152439))

(assert (=> b!1252273 m!1152451))

(assert (=> b!1252273 m!1152453))

(assert (=> b!1252273 m!1152455))

(assert (=> b!1252273 m!1152439))

(declare-fun m!1152477 () Bool)

(assert (=> b!1252273 m!1152477))

(assert (=> b!1252273 m!1152453))

(assert (=> b!1252273 m!1152451))

(declare-fun m!1152479 () Bool)

(assert (=> d!137865 m!1152479))

(assert (=> d!137865 m!1152395))

(assert (=> b!1252267 m!1152439))

(assert (=> b!1252267 m!1152439))

(assert (=> b!1252267 m!1152445))

(declare-fun m!1152481 () Bool)

(assert (=> b!1252270 m!1152481))

(declare-fun m!1152483 () Bool)

(assert (=> b!1252270 m!1152483))

(assert (=> b!1252270 m!1152439))

(declare-fun m!1152485 () Bool)

(assert (=> b!1252270 m!1152485))

(assert (=> b!1252270 m!1152451))

(assert (=> b!1252270 m!1152453))

(assert (=> b!1252270 m!1152455))

(assert (=> b!1252270 m!1152481))

(assert (=> b!1252270 m!1152451))

(declare-fun m!1152487 () Bool)

(assert (=> b!1252270 m!1152487))

(assert (=> b!1252270 m!1152453))

(assert (=> b!1252262 m!1152475))

(declare-fun m!1152489 () Bool)

(assert (=> b!1252263 m!1152489))

(assert (=> b!1252264 m!1152439))

(assert (=> b!1252264 m!1152439))

(assert (=> b!1252264 m!1152445))

(assert (=> b!1252271 m!1152439))

(assert (=> b!1252271 m!1152439))

(declare-fun m!1152491 () Bool)

(assert (=> b!1252271 m!1152491))

(declare-fun m!1152493 () Bool)

(assert (=> b!1252268 m!1152493))

(assert (=> b!1252166 d!137865))

(declare-fun b!1252282 () Bool)

(declare-fun e!711237 () Bool)

(declare-fun e!711238 () Bool)

(assert (=> b!1252282 (= e!711237 e!711238)))

(declare-fun c!122236 () Bool)

(assert (=> b!1252282 (= c!122236 (validKeyInArray!0 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252283 () Bool)

(declare-fun e!711239 () Bool)

(declare-fun call!61641 () Bool)

(assert (=> b!1252283 (= e!711239 call!61641)))

(declare-fun d!137867 () Bool)

(declare-fun res!835152 () Bool)

(assert (=> d!137867 (=> res!835152 e!711237)))

(assert (=> d!137867 (= res!835152 (bvsge #b00000000000000000000000000000000 (size!39618 _keys!1118)))))

(assert (=> d!137867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!711237)))

(declare-fun b!1252284 () Bool)

(assert (=> b!1252284 (= e!711238 e!711239)))

(declare-fun lt!565118 () (_ BitVec 64))

(assert (=> b!1252284 (= lt!565118 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565117 () Unit!41498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81031 (_ BitVec 64) (_ BitVec 32)) Unit!41498)

(assert (=> b!1252284 (= lt!565117 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!565118 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1252284 (arrayContainsKey!0 _keys!1118 lt!565118 #b00000000000000000000000000000000)))

(declare-fun lt!565119 () Unit!41498)

(assert (=> b!1252284 (= lt!565119 lt!565117)))

(declare-fun res!835151 () Bool)

(declare-datatypes ((SeekEntryResult!9960 0))(
  ( (MissingZero!9960 (index!42211 (_ BitVec 32))) (Found!9960 (index!42212 (_ BitVec 32))) (Intermediate!9960 (undefined!10772 Bool) (index!42213 (_ BitVec 32)) (x!110193 (_ BitVec 32))) (Undefined!9960) (MissingVacant!9960 (index!42214 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81031 (_ BitVec 32)) SeekEntryResult!9960)

(assert (=> b!1252284 (= res!835151 (= (seekEntryOrOpen!0 (select (arr!39080 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9960 #b00000000000000000000000000000000)))))

(assert (=> b!1252284 (=> (not res!835151) (not e!711239))))

(declare-fun b!1252285 () Bool)

(assert (=> b!1252285 (= e!711238 call!61641)))

(declare-fun bm!61638 () Bool)

(assert (=> bm!61638 (= call!61641 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!137867 (not res!835152)) b!1252282))

(assert (= (and b!1252282 c!122236) b!1252284))

(assert (= (and b!1252282 (not c!122236)) b!1252285))

(assert (= (and b!1252284 res!835151) b!1252283))

(assert (= (or b!1252283 b!1252285) bm!61638))

(assert (=> b!1252282 m!1152439))

(assert (=> b!1252282 m!1152439))

(assert (=> b!1252282 m!1152445))

(assert (=> b!1252284 m!1152439))

(declare-fun m!1152495 () Bool)

(assert (=> b!1252284 m!1152495))

(declare-fun m!1152497 () Bool)

(assert (=> b!1252284 m!1152497))

(assert (=> b!1252284 m!1152439))

(declare-fun m!1152499 () Bool)

(assert (=> b!1252284 m!1152499))

(declare-fun m!1152501 () Bool)

(assert (=> bm!61638 m!1152501))

(assert (=> b!1252161 d!137867))

(declare-fun b!1252293 () Bool)

(declare-fun e!711245 () Bool)

(assert (=> b!1252293 (= e!711245 tp_is_empty!31723)))

(declare-fun mapIsEmpty!49363 () Bool)

(declare-fun mapRes!49363 () Bool)

(assert (=> mapIsEmpty!49363 mapRes!49363))

(declare-fun mapNonEmpty!49363 () Bool)

(declare-fun tp!93977 () Bool)

(declare-fun e!711244 () Bool)

(assert (=> mapNonEmpty!49363 (= mapRes!49363 (and tp!93977 e!711244))))

(declare-fun mapKey!49363 () (_ BitVec 32))

(declare-fun mapRest!49363 () (Array (_ BitVec 32) ValueCell!15098))

(declare-fun mapValue!49363 () ValueCell!15098)

(assert (=> mapNonEmpty!49363 (= mapRest!49354 (store mapRest!49363 mapKey!49363 mapValue!49363))))

(declare-fun b!1252292 () Bool)

(assert (=> b!1252292 (= e!711244 tp_is_empty!31723)))

(declare-fun condMapEmpty!49363 () Bool)

(declare-fun mapDefault!49363 () ValueCell!15098)

(assert (=> mapNonEmpty!49354 (= condMapEmpty!49363 (= mapRest!49354 ((as const (Array (_ BitVec 32) ValueCell!15098)) mapDefault!49363)))))

(assert (=> mapNonEmpty!49354 (= tp!93962 (and e!711245 mapRes!49363))))

(assert (= (and mapNonEmpty!49354 condMapEmpty!49363) mapIsEmpty!49363))

(assert (= (and mapNonEmpty!49354 (not condMapEmpty!49363)) mapNonEmpty!49363))

(assert (= (and mapNonEmpty!49363 ((_ is ValueCellFull!15098) mapValue!49363)) b!1252292))

(assert (= (and mapNonEmpty!49354 ((_ is ValueCellFull!15098) mapDefault!49363)) b!1252293))

(declare-fun m!1152503 () Bool)

(assert (=> mapNonEmpty!49363 m!1152503))

(declare-fun b_lambda!22565 () Bool)

(assert (= b_lambda!22559 (or (and start!105070 b_free!26821) b_lambda!22565)))

(declare-fun b_lambda!22567 () Bool)

(assert (= b_lambda!22563 (or (and start!105070 b_free!26821) b_lambda!22567)))

(declare-fun b_lambda!22569 () Bool)

(assert (= b_lambda!22557 (or (and start!105070 b_free!26821) b_lambda!22569)))

(declare-fun b_lambda!22571 () Bool)

(assert (= b_lambda!22561 (or (and start!105070 b_free!26821) b_lambda!22571)))

(check-sat (not bm!61635) (not b!1252254) (not b_next!26821) (not b!1252256) (not b!1252282) (not b_lambda!22571) (not b!1252273) (not d!137863) (not b!1252249) (not b_lambda!22569) (not b!1252284) (not d!137865) (not b_lambda!22567) (not bm!61638) (not b!1252262) (not bm!61634) (not b!1252271) (not b!1252264) (not b!1252253) (not bm!61631) tp_is_empty!31723 (not b!1252221) (not b!1252248) (not b!1252267) (not d!137861) (not b!1252219) (not b_lambda!22565) (not b!1252257) (not b!1252263) (not b!1252259) (not mapNonEmpty!49363) (not b!1252268) b_and!44611 (not b!1252222) (not b!1252250) (not b!1252270))
(check-sat b_and!44611 (not b_next!26821))
