; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94474 () Bool)

(assert start!94474)

(declare-fun b_free!21801 () Bool)

(declare-fun b_next!21801 () Bool)

(assert (=> start!94474 (= b_free!21801 (not b_next!21801))))

(declare-fun tp!76849 () Bool)

(declare-fun b_and!34593 () Bool)

(assert (=> start!94474 (= tp!76849 b_and!34593)))

(declare-fun mapNonEmpty!40111 () Bool)

(declare-fun mapRes!40111 () Bool)

(declare-fun tp!76850 () Bool)

(declare-fun e!609499 () Bool)

(assert (=> mapNonEmpty!40111 (= mapRes!40111 (and tp!76850 e!609499))))

(declare-datatypes ((V!39283 0))(
  ( (V!39284 (val!12856 Int)) )
))
(declare-datatypes ((ValueCell!12102 0))(
  ( (ValueCellFull!12102 (v!15470 V!39283)) (EmptyCell!12102) )
))
(declare-fun mapRest!40111 () (Array (_ BitVec 32) ValueCell!12102))

(declare-datatypes ((array!68201 0))(
  ( (array!68202 (arr!32800 (Array (_ BitVec 32) ValueCell!12102)) (size!33336 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68201)

(declare-fun mapValue!40111 () ValueCell!12102)

(declare-fun mapKey!40111 () (_ BitVec 32))

(assert (=> mapNonEmpty!40111 (= (arr!32800 _values!955) (store mapRest!40111 mapKey!40111 mapValue!40111))))

(declare-fun b!1068314 () Bool)

(declare-fun res!712893 () Bool)

(declare-fun e!609494 () Bool)

(assert (=> b!1068314 (=> (not res!712893) (not e!609494))))

(declare-datatypes ((array!68203 0))(
  ( (array!68204 (arr!32801 (Array (_ BitVec 32) (_ BitVec 64))) (size!33337 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68203)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68203 (_ BitVec 32)) Bool)

(assert (=> b!1068314 (= res!712893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40111 () Bool)

(assert (=> mapIsEmpty!40111 mapRes!40111))

(declare-fun b!1068315 () Bool)

(declare-fun e!609495 () Bool)

(declare-fun e!609493 () Bool)

(assert (=> b!1068315 (= e!609495 (and e!609493 mapRes!40111))))

(declare-fun condMapEmpty!40111 () Bool)

(declare-fun mapDefault!40111 () ValueCell!12102)

(assert (=> b!1068315 (= condMapEmpty!40111 (= (arr!32800 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12102)) mapDefault!40111)))))

(declare-fun b!1068316 () Bool)

(declare-fun e!609498 () Bool)

(declare-fun e!609497 () Bool)

(assert (=> b!1068316 (= e!609498 e!609497)))

(declare-fun res!712896 () Bool)

(assert (=> b!1068316 (=> res!712896 e!609497)))

(declare-datatypes ((tuple2!16328 0))(
  ( (tuple2!16329 (_1!8175 (_ BitVec 64)) (_2!8175 V!39283)) )
))
(declare-datatypes ((List!22879 0))(
  ( (Nil!22876) (Cons!22875 (h!24084 tuple2!16328) (t!32204 List!22879)) )
))
(declare-datatypes ((ListLongMap!14297 0))(
  ( (ListLongMap!14298 (toList!7164 List!22879)) )
))
(declare-fun lt!471920 () ListLongMap!14297)

(declare-fun contains!6295 (ListLongMap!14297 (_ BitVec 64)) Bool)

(assert (=> b!1068316 (= res!712896 (contains!6295 lt!471920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39283)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39283)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4092 (array!68203 array!68201 (_ BitVec 32) (_ BitVec 32) V!39283 V!39283 (_ BitVec 32) Int) ListLongMap!14297)

(assert (=> b!1068316 (= lt!471920 (getCurrentListMap!4092 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068317 () Bool)

(declare-fun tp_is_empty!25611 () Bool)

(assert (=> b!1068317 (= e!609493 tp_is_empty!25611)))

(declare-fun b!1068318 () Bool)

(declare-fun res!712894 () Bool)

(assert (=> b!1068318 (=> (not res!712894) (not e!609494))))

(declare-datatypes ((List!22880 0))(
  ( (Nil!22877) (Cons!22876 (h!24085 (_ BitVec 64)) (t!32205 List!22880)) )
))
(declare-fun arrayNoDuplicates!0 (array!68203 (_ BitVec 32) List!22880) Bool)

(assert (=> b!1068318 (= res!712894 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22877))))

(declare-fun res!712895 () Bool)

(assert (=> start!94474 (=> (not res!712895) (not e!609494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94474 (= res!712895 (validMask!0 mask!1515))))

(assert (=> start!94474 e!609494))

(assert (=> start!94474 true))

(assert (=> start!94474 tp_is_empty!25611))

(declare-fun array_inv!25390 (array!68201) Bool)

(assert (=> start!94474 (and (array_inv!25390 _values!955) e!609495)))

(assert (=> start!94474 tp!76849))

(declare-fun array_inv!25391 (array!68203) Bool)

(assert (=> start!94474 (array_inv!25391 _keys!1163)))

(declare-fun b!1068319 () Bool)

(assert (=> b!1068319 (= e!609499 tp_is_empty!25611)))

(declare-fun b!1068320 () Bool)

(assert (=> b!1068320 (= e!609494 (not e!609498))))

(declare-fun res!712891 () Bool)

(assert (=> b!1068320 (=> res!712891 e!609498)))

(assert (=> b!1068320 (= res!712891 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471918 () ListLongMap!14297)

(declare-fun lt!471921 () ListLongMap!14297)

(assert (=> b!1068320 (= lt!471918 lt!471921)))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((Unit!35125 0))(
  ( (Unit!35126) )
))
(declare-fun lt!471919 () Unit!35125)

(declare-fun zeroValueAfter!47 () V!39283)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!781 (array!68203 array!68201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39283 V!39283 V!39283 V!39283 (_ BitVec 32) Int) Unit!35125)

(assert (=> b!1068320 (= lt!471919 (lemmaNoChangeToArrayThenSameMapNoExtras!781 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3744 (array!68203 array!68201 (_ BitVec 32) (_ BitVec 32) V!39283 V!39283 (_ BitVec 32) Int) ListLongMap!14297)

(assert (=> b!1068320 (= lt!471921 (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068320 (= lt!471918 (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068321 () Bool)

(declare-fun res!712892 () Bool)

(assert (=> b!1068321 (=> (not res!712892) (not e!609494))))

(assert (=> b!1068321 (= res!712892 (and (= (size!33336 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33337 _keys!1163) (size!33336 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068322 () Bool)

(assert (=> b!1068322 (= e!609497 (bvsle #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(declare-fun -!647 (ListLongMap!14297 (_ BitVec 64)) ListLongMap!14297)

(assert (=> b!1068322 (= (-!647 lt!471920 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471920)))

(declare-fun lt!471922 () Unit!35125)

(declare-fun removeNotPresentStillSame!57 (ListLongMap!14297 (_ BitVec 64)) Unit!35125)

(assert (=> b!1068322 (= lt!471922 (removeNotPresentStillSame!57 lt!471920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!94474 res!712895) b!1068321))

(assert (= (and b!1068321 res!712892) b!1068314))

(assert (= (and b!1068314 res!712893) b!1068318))

(assert (= (and b!1068318 res!712894) b!1068320))

(assert (= (and b!1068320 (not res!712891)) b!1068316))

(assert (= (and b!1068316 (not res!712896)) b!1068322))

(assert (= (and b!1068315 condMapEmpty!40111) mapIsEmpty!40111))

(assert (= (and b!1068315 (not condMapEmpty!40111)) mapNonEmpty!40111))

(get-info :version)

(assert (= (and mapNonEmpty!40111 ((_ is ValueCellFull!12102) mapValue!40111)) b!1068319))

(assert (= (and b!1068315 ((_ is ValueCellFull!12102) mapDefault!40111)) b!1068317))

(assert (= start!94474 b!1068315))

(declare-fun m!986915 () Bool)

(assert (=> b!1068318 m!986915))

(declare-fun m!986917 () Bool)

(assert (=> mapNonEmpty!40111 m!986917))

(declare-fun m!986919 () Bool)

(assert (=> b!1068322 m!986919))

(declare-fun m!986921 () Bool)

(assert (=> b!1068322 m!986921))

(declare-fun m!986923 () Bool)

(assert (=> start!94474 m!986923))

(declare-fun m!986925 () Bool)

(assert (=> start!94474 m!986925))

(declare-fun m!986927 () Bool)

(assert (=> start!94474 m!986927))

(declare-fun m!986929 () Bool)

(assert (=> b!1068320 m!986929))

(declare-fun m!986931 () Bool)

(assert (=> b!1068320 m!986931))

(declare-fun m!986933 () Bool)

(assert (=> b!1068320 m!986933))

(declare-fun m!986935 () Bool)

(assert (=> b!1068314 m!986935))

(declare-fun m!986937 () Bool)

(assert (=> b!1068316 m!986937))

(declare-fun m!986939 () Bool)

(assert (=> b!1068316 m!986939))

(check-sat (not b!1068322) (not start!94474) tp_is_empty!25611 (not b!1068320) (not b!1068316) (not mapNonEmpty!40111) (not b!1068314) (not b_next!21801) b_and!34593 (not b!1068318))
(check-sat b_and!34593 (not b_next!21801))
(get-model)

(declare-fun d!129147 () Bool)

(assert (=> d!129147 (= (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471940 () Unit!35125)

(declare-fun choose!1735 (array!68203 array!68201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39283 V!39283 V!39283 V!39283 (_ BitVec 32) Int) Unit!35125)

(assert (=> d!129147 (= lt!471940 (choose!1735 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129147 (validMask!0 mask!1515)))

(assert (=> d!129147 (= (lemmaNoChangeToArrayThenSameMapNoExtras!781 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471940)))

(declare-fun bs!31453 () Bool)

(assert (= bs!31453 d!129147))

(assert (=> bs!31453 m!986933))

(assert (=> bs!31453 m!986931))

(declare-fun m!986967 () Bool)

(assert (=> bs!31453 m!986967))

(assert (=> bs!31453 m!986923))

(assert (=> b!1068320 d!129147))

(declare-fun b!1068374 () Bool)

(declare-fun e!609537 () Bool)

(declare-fun e!609539 () Bool)

(assert (=> b!1068374 (= e!609537 e!609539)))

(assert (=> b!1068374 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(declare-fun res!712923 () Bool)

(declare-fun lt!471959 () ListLongMap!14297)

(assert (=> b!1068374 (= res!712923 (contains!6295 lt!471959 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068374 (=> (not res!712923) (not e!609539))))

(declare-fun b!1068375 () Bool)

(declare-fun e!609541 () ListLongMap!14297)

(assert (=> b!1068375 (= e!609541 (ListLongMap!14298 Nil!22876))))

(declare-fun b!1068376 () Bool)

(declare-fun e!609538 () ListLongMap!14297)

(declare-fun call!45101 () ListLongMap!14297)

(assert (=> b!1068376 (= e!609538 call!45101)))

(declare-fun b!1068377 () Bool)

(assert (=> b!1068377 (= e!609541 e!609538)))

(declare-fun c!107512 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1068377 (= c!107512 (validKeyInArray!0 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068378 () Bool)

(declare-fun e!609540 () Bool)

(assert (=> b!1068378 (= e!609540 (validKeyInArray!0 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068378 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1068380 () Bool)

(declare-fun res!712925 () Bool)

(declare-fun e!609535 () Bool)

(assert (=> b!1068380 (=> (not res!712925) (not e!609535))))

(assert (=> b!1068380 (= res!712925 (not (contains!6295 lt!471959 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1068381 () Bool)

(declare-fun e!609536 () Bool)

(declare-fun isEmpty!944 (ListLongMap!14297) Bool)

(assert (=> b!1068381 (= e!609536 (isEmpty!944 lt!471959))))

(declare-fun b!1068382 () Bool)

(assert (=> b!1068382 (= e!609536 (= lt!471959 (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1068383 () Bool)

(assert (=> b!1068383 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(assert (=> b!1068383 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33336 _values!955)))))

(declare-fun apply!926 (ListLongMap!14297 (_ BitVec 64)) V!39283)

(declare-fun get!17088 (ValueCell!12102 V!39283) V!39283)

(declare-fun dynLambda!2033 (Int (_ BitVec 64)) V!39283)

(assert (=> b!1068383 (= e!609539 (= (apply!926 lt!471959 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)) (get!17088 (select (arr!32800 _values!955) #b00000000000000000000000000000000) (dynLambda!2033 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!45098 () Bool)

(assert (=> bm!45098 (= call!45101 (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1068379 () Bool)

(assert (=> b!1068379 (= e!609537 e!609536)))

(declare-fun c!107510 () Bool)

(assert (=> b!1068379 (= c!107510 (bvslt #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(declare-fun d!129149 () Bool)

(assert (=> d!129149 e!609535))

(declare-fun res!712924 () Bool)

(assert (=> d!129149 (=> (not res!712924) (not e!609535))))

(assert (=> d!129149 (= res!712924 (not (contains!6295 lt!471959 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129149 (= lt!471959 e!609541)))

(declare-fun c!107513 () Bool)

(assert (=> d!129149 (= c!107513 (bvsge #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(assert (=> d!129149 (validMask!0 mask!1515)))

(assert (=> d!129149 (= (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471959)))

(declare-fun b!1068384 () Bool)

(assert (=> b!1068384 (= e!609535 e!609537)))

(declare-fun c!107511 () Bool)

(assert (=> b!1068384 (= c!107511 e!609540)))

(declare-fun res!712926 () Bool)

(assert (=> b!1068384 (=> (not res!712926) (not e!609540))))

(assert (=> b!1068384 (= res!712926 (bvslt #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(declare-fun b!1068385 () Bool)

(declare-fun lt!471961 () Unit!35125)

(declare-fun lt!471955 () Unit!35125)

(assert (=> b!1068385 (= lt!471961 lt!471955)))

(declare-fun lt!471958 () (_ BitVec 64))

(declare-fun lt!471956 () ListLongMap!14297)

(declare-fun lt!471957 () (_ BitVec 64))

(declare-fun lt!471960 () V!39283)

(declare-fun +!3161 (ListLongMap!14297 tuple2!16328) ListLongMap!14297)

(assert (=> b!1068385 (not (contains!6295 (+!3161 lt!471956 (tuple2!16329 lt!471958 lt!471960)) lt!471957))))

(declare-fun addStillNotContains!254 (ListLongMap!14297 (_ BitVec 64) V!39283 (_ BitVec 64)) Unit!35125)

(assert (=> b!1068385 (= lt!471955 (addStillNotContains!254 lt!471956 lt!471958 lt!471960 lt!471957))))

(assert (=> b!1068385 (= lt!471957 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1068385 (= lt!471960 (get!17088 (select (arr!32800 _values!955) #b00000000000000000000000000000000) (dynLambda!2033 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1068385 (= lt!471958 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1068385 (= lt!471956 call!45101)))

(assert (=> b!1068385 (= e!609538 (+!3161 call!45101 (tuple2!16329 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000) (get!17088 (select (arr!32800 _values!955) #b00000000000000000000000000000000) (dynLambda!2033 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!129149 c!107513) b!1068375))

(assert (= (and d!129149 (not c!107513)) b!1068377))

(assert (= (and b!1068377 c!107512) b!1068385))

(assert (= (and b!1068377 (not c!107512)) b!1068376))

(assert (= (or b!1068385 b!1068376) bm!45098))

(assert (= (and d!129149 res!712924) b!1068380))

(assert (= (and b!1068380 res!712925) b!1068384))

(assert (= (and b!1068384 res!712926) b!1068378))

(assert (= (and b!1068384 c!107511) b!1068374))

(assert (= (and b!1068384 (not c!107511)) b!1068379))

(assert (= (and b!1068374 res!712923) b!1068383))

(assert (= (and b!1068379 c!107510) b!1068382))

(assert (= (and b!1068379 (not c!107510)) b!1068381))

(declare-fun b_lambda!16601 () Bool)

(assert (=> (not b_lambda!16601) (not b!1068383)))

(declare-fun t!32208 () Bool)

(declare-fun tb!7147 () Bool)

(assert (=> (and start!94474 (= defaultEntry!963 defaultEntry!963) t!32208) tb!7147))

(declare-fun result!14749 () Bool)

(assert (=> tb!7147 (= result!14749 tp_is_empty!25611)))

(assert (=> b!1068383 t!32208))

(declare-fun b_and!34597 () Bool)

(assert (= b_and!34593 (and (=> t!32208 result!14749) b_and!34597)))

(declare-fun b_lambda!16603 () Bool)

(assert (=> (not b_lambda!16603) (not b!1068385)))

(assert (=> b!1068385 t!32208))

(declare-fun b_and!34599 () Bool)

(assert (= b_and!34597 (and (=> t!32208 result!14749) b_and!34599)))

(declare-fun m!986969 () Bool)

(assert (=> b!1068382 m!986969))

(declare-fun m!986971 () Bool)

(assert (=> b!1068380 m!986971))

(declare-fun m!986973 () Bool)

(assert (=> b!1068383 m!986973))

(declare-fun m!986975 () Bool)

(assert (=> b!1068383 m!986975))

(declare-fun m!986977 () Bool)

(assert (=> b!1068383 m!986977))

(declare-fun m!986979 () Bool)

(assert (=> b!1068383 m!986979))

(assert (=> b!1068383 m!986975))

(assert (=> b!1068383 m!986973))

(declare-fun m!986981 () Bool)

(assert (=> b!1068383 m!986981))

(assert (=> b!1068383 m!986977))

(declare-fun m!986983 () Bool)

(assert (=> d!129149 m!986983))

(assert (=> d!129149 m!986923))

(assert (=> b!1068378 m!986977))

(assert (=> b!1068378 m!986977))

(declare-fun m!986985 () Bool)

(assert (=> b!1068378 m!986985))

(assert (=> b!1068377 m!986977))

(assert (=> b!1068377 m!986977))

(assert (=> b!1068377 m!986985))

(declare-fun m!986987 () Bool)

(assert (=> b!1068381 m!986987))

(assert (=> b!1068385 m!986973))

(declare-fun m!986989 () Bool)

(assert (=> b!1068385 m!986989))

(assert (=> b!1068385 m!986975))

(declare-fun m!986991 () Bool)

(assert (=> b!1068385 m!986991))

(assert (=> b!1068385 m!986975))

(assert (=> b!1068385 m!986973))

(assert (=> b!1068385 m!986981))

(assert (=> b!1068385 m!986977))

(assert (=> b!1068385 m!986991))

(declare-fun m!986993 () Bool)

(assert (=> b!1068385 m!986993))

(declare-fun m!986995 () Bool)

(assert (=> b!1068385 m!986995))

(assert (=> bm!45098 m!986969))

(assert (=> b!1068374 m!986977))

(assert (=> b!1068374 m!986977))

(declare-fun m!986997 () Bool)

(assert (=> b!1068374 m!986997))

(assert (=> b!1068320 d!129149))

(declare-fun b!1068388 () Bool)

(declare-fun e!609544 () Bool)

(declare-fun e!609546 () Bool)

(assert (=> b!1068388 (= e!609544 e!609546)))

(assert (=> b!1068388 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(declare-fun res!712927 () Bool)

(declare-fun lt!471966 () ListLongMap!14297)

(assert (=> b!1068388 (= res!712927 (contains!6295 lt!471966 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068388 (=> (not res!712927) (not e!609546))))

(declare-fun b!1068389 () Bool)

(declare-fun e!609548 () ListLongMap!14297)

(assert (=> b!1068389 (= e!609548 (ListLongMap!14298 Nil!22876))))

(declare-fun b!1068390 () Bool)

(declare-fun e!609545 () ListLongMap!14297)

(declare-fun call!45102 () ListLongMap!14297)

(assert (=> b!1068390 (= e!609545 call!45102)))

(declare-fun b!1068391 () Bool)

(assert (=> b!1068391 (= e!609548 e!609545)))

(declare-fun c!107516 () Bool)

(assert (=> b!1068391 (= c!107516 (validKeyInArray!0 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068392 () Bool)

(declare-fun e!609547 () Bool)

(assert (=> b!1068392 (= e!609547 (validKeyInArray!0 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068392 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1068394 () Bool)

(declare-fun res!712929 () Bool)

(declare-fun e!609542 () Bool)

(assert (=> b!1068394 (=> (not res!712929) (not e!609542))))

(assert (=> b!1068394 (= res!712929 (not (contains!6295 lt!471966 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1068395 () Bool)

(declare-fun e!609543 () Bool)

(assert (=> b!1068395 (= e!609543 (isEmpty!944 lt!471966))))

(declare-fun b!1068396 () Bool)

(assert (=> b!1068396 (= e!609543 (= lt!471966 (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1068397 () Bool)

(assert (=> b!1068397 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(assert (=> b!1068397 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33336 _values!955)))))

(assert (=> b!1068397 (= e!609546 (= (apply!926 lt!471966 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)) (get!17088 (select (arr!32800 _values!955) #b00000000000000000000000000000000) (dynLambda!2033 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!45099 () Bool)

(assert (=> bm!45099 (= call!45102 (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1068393 () Bool)

(assert (=> b!1068393 (= e!609544 e!609543)))

(declare-fun c!107514 () Bool)

(assert (=> b!1068393 (= c!107514 (bvslt #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(declare-fun d!129151 () Bool)

(assert (=> d!129151 e!609542))

(declare-fun res!712928 () Bool)

(assert (=> d!129151 (=> (not res!712928) (not e!609542))))

(assert (=> d!129151 (= res!712928 (not (contains!6295 lt!471966 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129151 (= lt!471966 e!609548)))

(declare-fun c!107517 () Bool)

(assert (=> d!129151 (= c!107517 (bvsge #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(assert (=> d!129151 (validMask!0 mask!1515)))

(assert (=> d!129151 (= (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471966)))

(declare-fun b!1068398 () Bool)

(assert (=> b!1068398 (= e!609542 e!609544)))

(declare-fun c!107515 () Bool)

(assert (=> b!1068398 (= c!107515 e!609547)))

(declare-fun res!712930 () Bool)

(assert (=> b!1068398 (=> (not res!712930) (not e!609547))))

(assert (=> b!1068398 (= res!712930 (bvslt #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(declare-fun b!1068399 () Bool)

(declare-fun lt!471968 () Unit!35125)

(declare-fun lt!471962 () Unit!35125)

(assert (=> b!1068399 (= lt!471968 lt!471962)))

(declare-fun lt!471964 () (_ BitVec 64))

(declare-fun lt!471965 () (_ BitVec 64))

(declare-fun lt!471967 () V!39283)

(declare-fun lt!471963 () ListLongMap!14297)

(assert (=> b!1068399 (not (contains!6295 (+!3161 lt!471963 (tuple2!16329 lt!471965 lt!471967)) lt!471964))))

(assert (=> b!1068399 (= lt!471962 (addStillNotContains!254 lt!471963 lt!471965 lt!471967 lt!471964))))

(assert (=> b!1068399 (= lt!471964 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1068399 (= lt!471967 (get!17088 (select (arr!32800 _values!955) #b00000000000000000000000000000000) (dynLambda!2033 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1068399 (= lt!471965 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1068399 (= lt!471963 call!45102)))

(assert (=> b!1068399 (= e!609545 (+!3161 call!45102 (tuple2!16329 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000) (get!17088 (select (arr!32800 _values!955) #b00000000000000000000000000000000) (dynLambda!2033 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!129151 c!107517) b!1068389))

(assert (= (and d!129151 (not c!107517)) b!1068391))

(assert (= (and b!1068391 c!107516) b!1068399))

(assert (= (and b!1068391 (not c!107516)) b!1068390))

(assert (= (or b!1068399 b!1068390) bm!45099))

(assert (= (and d!129151 res!712928) b!1068394))

(assert (= (and b!1068394 res!712929) b!1068398))

(assert (= (and b!1068398 res!712930) b!1068392))

(assert (= (and b!1068398 c!107515) b!1068388))

(assert (= (and b!1068398 (not c!107515)) b!1068393))

(assert (= (and b!1068388 res!712927) b!1068397))

(assert (= (and b!1068393 c!107514) b!1068396))

(assert (= (and b!1068393 (not c!107514)) b!1068395))

(declare-fun b_lambda!16605 () Bool)

(assert (=> (not b_lambda!16605) (not b!1068397)))

(assert (=> b!1068397 t!32208))

(declare-fun b_and!34601 () Bool)

(assert (= b_and!34599 (and (=> t!32208 result!14749) b_and!34601)))

(declare-fun b_lambda!16607 () Bool)

(assert (=> (not b_lambda!16607) (not b!1068399)))

(assert (=> b!1068399 t!32208))

(declare-fun b_and!34603 () Bool)

(assert (= b_and!34601 (and (=> t!32208 result!14749) b_and!34603)))

(declare-fun m!986999 () Bool)

(assert (=> b!1068396 m!986999))

(declare-fun m!987001 () Bool)

(assert (=> b!1068394 m!987001))

(assert (=> b!1068397 m!986973))

(assert (=> b!1068397 m!986975))

(assert (=> b!1068397 m!986977))

(declare-fun m!987003 () Bool)

(assert (=> b!1068397 m!987003))

(assert (=> b!1068397 m!986975))

(assert (=> b!1068397 m!986973))

(assert (=> b!1068397 m!986981))

(assert (=> b!1068397 m!986977))

(declare-fun m!987005 () Bool)

(assert (=> d!129151 m!987005))

(assert (=> d!129151 m!986923))

(assert (=> b!1068392 m!986977))

(assert (=> b!1068392 m!986977))

(assert (=> b!1068392 m!986985))

(assert (=> b!1068391 m!986977))

(assert (=> b!1068391 m!986977))

(assert (=> b!1068391 m!986985))

(declare-fun m!987007 () Bool)

(assert (=> b!1068395 m!987007))

(assert (=> b!1068399 m!986973))

(declare-fun m!987009 () Bool)

(assert (=> b!1068399 m!987009))

(assert (=> b!1068399 m!986975))

(declare-fun m!987011 () Bool)

(assert (=> b!1068399 m!987011))

(assert (=> b!1068399 m!986975))

(assert (=> b!1068399 m!986973))

(assert (=> b!1068399 m!986981))

(assert (=> b!1068399 m!986977))

(assert (=> b!1068399 m!987011))

(declare-fun m!987013 () Bool)

(assert (=> b!1068399 m!987013))

(declare-fun m!987015 () Bool)

(assert (=> b!1068399 m!987015))

(assert (=> bm!45099 m!986999))

(assert (=> b!1068388 m!986977))

(assert (=> b!1068388 m!986977))

(declare-fun m!987017 () Bool)

(assert (=> b!1068388 m!987017))

(assert (=> b!1068320 d!129151))

(declare-fun d!129153 () Bool)

(assert (=> d!129153 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94474 d!129153))

(declare-fun d!129155 () Bool)

(assert (=> d!129155 (= (array_inv!25390 _values!955) (bvsge (size!33336 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94474 d!129155))

(declare-fun d!129157 () Bool)

(assert (=> d!129157 (= (array_inv!25391 _keys!1163) (bvsge (size!33337 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94474 d!129157))

(declare-fun d!129159 () Bool)

(declare-fun e!609554 () Bool)

(assert (=> d!129159 e!609554))

(declare-fun res!712933 () Bool)

(assert (=> d!129159 (=> res!712933 e!609554)))

(declare-fun lt!471979 () Bool)

(assert (=> d!129159 (= res!712933 (not lt!471979))))

(declare-fun lt!471978 () Bool)

(assert (=> d!129159 (= lt!471979 lt!471978)))

(declare-fun lt!471980 () Unit!35125)

(declare-fun e!609553 () Unit!35125)

(assert (=> d!129159 (= lt!471980 e!609553)))

(declare-fun c!107520 () Bool)

(assert (=> d!129159 (= c!107520 lt!471978)))

(declare-fun containsKey!574 (List!22879 (_ BitVec 64)) Bool)

(assert (=> d!129159 (= lt!471978 (containsKey!574 (toList!7164 lt!471920) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129159 (= (contains!6295 lt!471920 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471979)))

(declare-fun b!1068406 () Bool)

(declare-fun lt!471977 () Unit!35125)

(assert (=> b!1068406 (= e!609553 lt!471977)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!407 (List!22879 (_ BitVec 64)) Unit!35125)

(assert (=> b!1068406 (= lt!471977 (lemmaContainsKeyImpliesGetValueByKeyDefined!407 (toList!7164 lt!471920) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!652 0))(
  ( (Some!651 (v!15472 V!39283)) (None!650) )
))
(declare-fun isDefined!446 (Option!652) Bool)

(declare-fun getValueByKey!601 (List!22879 (_ BitVec 64)) Option!652)

(assert (=> b!1068406 (isDefined!446 (getValueByKey!601 (toList!7164 lt!471920) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068407 () Bool)

(declare-fun Unit!35129 () Unit!35125)

(assert (=> b!1068407 (= e!609553 Unit!35129)))

(declare-fun b!1068408 () Bool)

(assert (=> b!1068408 (= e!609554 (isDefined!446 (getValueByKey!601 (toList!7164 lt!471920) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129159 c!107520) b!1068406))

(assert (= (and d!129159 (not c!107520)) b!1068407))

(assert (= (and d!129159 (not res!712933)) b!1068408))

(declare-fun m!987019 () Bool)

(assert (=> d!129159 m!987019))

(declare-fun m!987021 () Bool)

(assert (=> b!1068406 m!987021))

(declare-fun m!987023 () Bool)

(assert (=> b!1068406 m!987023))

(assert (=> b!1068406 m!987023))

(declare-fun m!987025 () Bool)

(assert (=> b!1068406 m!987025))

(assert (=> b!1068408 m!987023))

(assert (=> b!1068408 m!987023))

(assert (=> b!1068408 m!987025))

(assert (=> b!1068316 d!129159))

(declare-fun b!1068451 () Bool)

(declare-fun e!609593 () Bool)

(assert (=> b!1068451 (= e!609593 (validKeyInArray!0 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068452 () Bool)

(declare-fun e!609587 () Bool)

(declare-fun e!609585 () Bool)

(assert (=> b!1068452 (= e!609587 e!609585)))

(declare-fun res!712960 () Bool)

(assert (=> b!1068452 (=> (not res!712960) (not e!609585))))

(declare-fun lt!472037 () ListLongMap!14297)

(assert (=> b!1068452 (= res!712960 (contains!6295 lt!472037 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(declare-fun b!1068453 () Bool)

(declare-fun e!609583 () Unit!35125)

(declare-fun lt!472041 () Unit!35125)

(assert (=> b!1068453 (= e!609583 lt!472041)))

(declare-fun lt!472045 () ListLongMap!14297)

(assert (=> b!1068453 (= lt!472045 (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472033 () (_ BitVec 64))

(assert (=> b!1068453 (= lt!472033 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472035 () (_ BitVec 64))

(assert (=> b!1068453 (= lt!472035 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472036 () Unit!35125)

(declare-fun addStillContains!641 (ListLongMap!14297 (_ BitVec 64) V!39283 (_ BitVec 64)) Unit!35125)

(assert (=> b!1068453 (= lt!472036 (addStillContains!641 lt!472045 lt!472033 zeroValueBefore!47 lt!472035))))

(assert (=> b!1068453 (contains!6295 (+!3161 lt!472045 (tuple2!16329 lt!472033 zeroValueBefore!47)) lt!472035)))

(declare-fun lt!472029 () Unit!35125)

(assert (=> b!1068453 (= lt!472029 lt!472036)))

(declare-fun lt!472046 () ListLongMap!14297)

(assert (=> b!1068453 (= lt!472046 (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472026 () (_ BitVec 64))

(assert (=> b!1068453 (= lt!472026 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472044 () (_ BitVec 64))

(assert (=> b!1068453 (= lt!472044 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472042 () Unit!35125)

(declare-fun addApplyDifferent!501 (ListLongMap!14297 (_ BitVec 64) V!39283 (_ BitVec 64)) Unit!35125)

(assert (=> b!1068453 (= lt!472042 (addApplyDifferent!501 lt!472046 lt!472026 minValue!907 lt!472044))))

(assert (=> b!1068453 (= (apply!926 (+!3161 lt!472046 (tuple2!16329 lt!472026 minValue!907)) lt!472044) (apply!926 lt!472046 lt!472044))))

(declare-fun lt!472040 () Unit!35125)

(assert (=> b!1068453 (= lt!472040 lt!472042)))

(declare-fun lt!472032 () ListLongMap!14297)

(assert (=> b!1068453 (= lt!472032 (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472031 () (_ BitVec 64))

(assert (=> b!1068453 (= lt!472031 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472038 () (_ BitVec 64))

(assert (=> b!1068453 (= lt!472038 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472039 () Unit!35125)

(assert (=> b!1068453 (= lt!472039 (addApplyDifferent!501 lt!472032 lt!472031 zeroValueBefore!47 lt!472038))))

(assert (=> b!1068453 (= (apply!926 (+!3161 lt!472032 (tuple2!16329 lt!472031 zeroValueBefore!47)) lt!472038) (apply!926 lt!472032 lt!472038))))

(declare-fun lt!472027 () Unit!35125)

(assert (=> b!1068453 (= lt!472027 lt!472039)))

(declare-fun lt!472028 () ListLongMap!14297)

(assert (=> b!1068453 (= lt!472028 (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472034 () (_ BitVec 64))

(assert (=> b!1068453 (= lt!472034 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472030 () (_ BitVec 64))

(assert (=> b!1068453 (= lt!472030 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1068453 (= lt!472041 (addApplyDifferent!501 lt!472028 lt!472034 minValue!907 lt!472030))))

(assert (=> b!1068453 (= (apply!926 (+!3161 lt!472028 (tuple2!16329 lt!472034 minValue!907)) lt!472030) (apply!926 lt!472028 lt!472030))))

(declare-fun b!1068454 () Bool)

(declare-fun e!609591 () Bool)

(declare-fun e!609581 () Bool)

(assert (=> b!1068454 (= e!609591 e!609581)))

(declare-fun c!107536 () Bool)

(assert (=> b!1068454 (= c!107536 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45114 () Bool)

(declare-fun call!45121 () Bool)

(assert (=> bm!45114 (= call!45121 (contains!6295 lt!472037 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068455 () Bool)

(declare-fun e!609582 () Bool)

(assert (=> b!1068455 (= e!609581 e!609582)))

(declare-fun res!712954 () Bool)

(assert (=> b!1068455 (= res!712954 call!45121)))

(assert (=> b!1068455 (=> (not res!712954) (not e!609582))))

(declare-fun bm!45115 () Bool)

(declare-fun call!45118 () Bool)

(assert (=> bm!45115 (= call!45118 (contains!6295 lt!472037 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45116 () Bool)

(declare-fun call!45119 () ListLongMap!14297)

(declare-fun call!45122 () ListLongMap!14297)

(assert (=> bm!45116 (= call!45119 call!45122)))

(declare-fun b!1068456 () Bool)

(declare-fun e!609590 () ListLongMap!14297)

(declare-fun e!609592 () ListLongMap!14297)

(assert (=> b!1068456 (= e!609590 e!609592)))

(declare-fun c!107535 () Bool)

(assert (=> b!1068456 (= c!107535 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1068457 () Bool)

(assert (=> b!1068457 (= e!609582 (= (apply!926 lt!472037 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1068458 () Bool)

(declare-fun e!609588 () Bool)

(declare-fun e!609584 () Bool)

(assert (=> b!1068458 (= e!609588 e!609584)))

(declare-fun res!712958 () Bool)

(assert (=> b!1068458 (= res!712958 call!45118)))

(assert (=> b!1068458 (=> (not res!712958) (not e!609584))))

(declare-fun b!1068459 () Bool)

(assert (=> b!1068459 (= e!609581 (not call!45121))))

(declare-fun b!1068461 () Bool)

(declare-fun res!712953 () Bool)

(assert (=> b!1068461 (=> (not res!712953) (not e!609591))))

(assert (=> b!1068461 (= res!712953 e!609587)))

(declare-fun res!712959 () Bool)

(assert (=> b!1068461 (=> res!712959 e!609587)))

(declare-fun e!609589 () Bool)

(assert (=> b!1068461 (= res!712959 (not e!609589))))

(declare-fun res!712957 () Bool)

(assert (=> b!1068461 (=> (not res!712957) (not e!609589))))

(assert (=> b!1068461 (= res!712957 (bvslt #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(declare-fun b!1068462 () Bool)

(declare-fun e!609586 () ListLongMap!14297)

(assert (=> b!1068462 (= e!609586 call!45119)))

(declare-fun b!1068463 () Bool)

(declare-fun call!45117 () ListLongMap!14297)

(assert (=> b!1068463 (= e!609586 call!45117)))

(declare-fun b!1068464 () Bool)

(assert (=> b!1068464 (= e!609592 call!45117)))

(declare-fun b!1068465 () Bool)

(declare-fun c!107538 () Bool)

(assert (=> b!1068465 (= c!107538 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1068465 (= e!609592 e!609586)))

(declare-fun bm!45117 () Bool)

(declare-fun call!45123 () ListLongMap!14297)

(assert (=> bm!45117 (= call!45117 call!45123)))

(declare-fun b!1068466 () Bool)

(assert (=> b!1068466 (= e!609588 (not call!45118))))

(declare-fun bm!45118 () Bool)

(declare-fun call!45120 () ListLongMap!14297)

(assert (=> bm!45118 (= call!45122 call!45120)))

(declare-fun b!1068467 () Bool)

(assert (=> b!1068467 (= e!609590 (+!3161 call!45123 (tuple2!16329 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun c!107534 () Bool)

(declare-fun bm!45119 () Bool)

(assert (=> bm!45119 (= call!45123 (+!3161 (ite c!107534 call!45120 (ite c!107535 call!45122 call!45119)) (ite (or c!107534 c!107535) (tuple2!16329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16329 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45120 () Bool)

(assert (=> bm!45120 (= call!45120 (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068468 () Bool)

(declare-fun Unit!35130 () Unit!35125)

(assert (=> b!1068468 (= e!609583 Unit!35130)))

(declare-fun b!1068469 () Bool)

(assert (=> b!1068469 (= e!609589 (validKeyInArray!0 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068470 () Bool)

(assert (=> b!1068470 (= e!609584 (= (apply!926 lt!472037 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1068471 () Bool)

(assert (=> b!1068471 (= e!609585 (= (apply!926 lt!472037 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)) (get!17088 (select (arr!32800 _values!955) #b00000000000000000000000000000000) (dynLambda!2033 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1068471 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33336 _values!955)))))

(assert (=> b!1068471 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(declare-fun b!1068460 () Bool)

(declare-fun res!712952 () Bool)

(assert (=> b!1068460 (=> (not res!712952) (not e!609591))))

(assert (=> b!1068460 (= res!712952 e!609588)))

(declare-fun c!107537 () Bool)

(assert (=> b!1068460 (= c!107537 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!129161 () Bool)

(assert (=> d!129161 e!609591))

(declare-fun res!712956 () Bool)

(assert (=> d!129161 (=> (not res!712956) (not e!609591))))

(assert (=> d!129161 (= res!712956 (or (bvsge #b00000000000000000000000000000000 (size!33337 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33337 _keys!1163)))))))

(declare-fun lt!472043 () ListLongMap!14297)

(assert (=> d!129161 (= lt!472037 lt!472043)))

(declare-fun lt!472025 () Unit!35125)

(assert (=> d!129161 (= lt!472025 e!609583)))

(declare-fun c!107533 () Bool)

(assert (=> d!129161 (= c!107533 e!609593)))

(declare-fun res!712955 () Bool)

(assert (=> d!129161 (=> (not res!712955) (not e!609593))))

(assert (=> d!129161 (= res!712955 (bvslt #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(assert (=> d!129161 (= lt!472043 e!609590)))

(assert (=> d!129161 (= c!107534 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129161 (validMask!0 mask!1515)))

(assert (=> d!129161 (= (getCurrentListMap!4092 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472037)))

(assert (= (and d!129161 c!107534) b!1068467))

(assert (= (and d!129161 (not c!107534)) b!1068456))

(assert (= (and b!1068456 c!107535) b!1068464))

(assert (= (and b!1068456 (not c!107535)) b!1068465))

(assert (= (and b!1068465 c!107538) b!1068463))

(assert (= (and b!1068465 (not c!107538)) b!1068462))

(assert (= (or b!1068463 b!1068462) bm!45116))

(assert (= (or b!1068464 bm!45116) bm!45118))

(assert (= (or b!1068464 b!1068463) bm!45117))

(assert (= (or b!1068467 bm!45118) bm!45120))

(assert (= (or b!1068467 bm!45117) bm!45119))

(assert (= (and d!129161 res!712955) b!1068451))

(assert (= (and d!129161 c!107533) b!1068453))

(assert (= (and d!129161 (not c!107533)) b!1068468))

(assert (= (and d!129161 res!712956) b!1068461))

(assert (= (and b!1068461 res!712957) b!1068469))

(assert (= (and b!1068461 (not res!712959)) b!1068452))

(assert (= (and b!1068452 res!712960) b!1068471))

(assert (= (and b!1068461 res!712953) b!1068460))

(assert (= (and b!1068460 c!107537) b!1068458))

(assert (= (and b!1068460 (not c!107537)) b!1068466))

(assert (= (and b!1068458 res!712958) b!1068470))

(assert (= (or b!1068458 b!1068466) bm!45115))

(assert (= (and b!1068460 res!712952) b!1068454))

(assert (= (and b!1068454 c!107536) b!1068455))

(assert (= (and b!1068454 (not c!107536)) b!1068459))

(assert (= (and b!1068455 res!712954) b!1068457))

(assert (= (or b!1068455 b!1068459) bm!45114))

(declare-fun b_lambda!16609 () Bool)

(assert (=> (not b_lambda!16609) (not b!1068471)))

(assert (=> b!1068471 t!32208))

(declare-fun b_and!34605 () Bool)

(assert (= b_and!34603 (and (=> t!32208 result!14749) b_and!34605)))

(assert (=> b!1068471 m!986977))

(assert (=> b!1068471 m!986973))

(assert (=> b!1068471 m!986975))

(assert (=> b!1068471 m!986977))

(declare-fun m!987027 () Bool)

(assert (=> b!1068471 m!987027))

(assert (=> b!1068471 m!986975))

(assert (=> b!1068471 m!986973))

(assert (=> b!1068471 m!986981))

(declare-fun m!987029 () Bool)

(assert (=> b!1068453 m!987029))

(declare-fun m!987031 () Bool)

(assert (=> b!1068453 m!987031))

(declare-fun m!987033 () Bool)

(assert (=> b!1068453 m!987033))

(assert (=> b!1068453 m!987031))

(declare-fun m!987035 () Bool)

(assert (=> b!1068453 m!987035))

(declare-fun m!987037 () Bool)

(assert (=> b!1068453 m!987037))

(declare-fun m!987039 () Bool)

(assert (=> b!1068453 m!987039))

(declare-fun m!987041 () Bool)

(assert (=> b!1068453 m!987041))

(declare-fun m!987043 () Bool)

(assert (=> b!1068453 m!987043))

(assert (=> b!1068453 m!986977))

(declare-fun m!987045 () Bool)

(assert (=> b!1068453 m!987045))

(declare-fun m!987047 () Bool)

(assert (=> b!1068453 m!987047))

(assert (=> b!1068453 m!987043))

(declare-fun m!987049 () Bool)

(assert (=> b!1068453 m!987049))

(assert (=> b!1068453 m!987045))

(declare-fun m!987051 () Bool)

(assert (=> b!1068453 m!987051))

(assert (=> b!1068453 m!987029))

(declare-fun m!987053 () Bool)

(assert (=> b!1068453 m!987053))

(declare-fun m!987055 () Bool)

(assert (=> b!1068453 m!987055))

(assert (=> b!1068453 m!986933))

(declare-fun m!987057 () Bool)

(assert (=> b!1068453 m!987057))

(assert (=> b!1068469 m!986977))

(assert (=> b!1068469 m!986977))

(assert (=> b!1068469 m!986985))

(assert (=> b!1068451 m!986977))

(assert (=> b!1068451 m!986977))

(assert (=> b!1068451 m!986985))

(declare-fun m!987059 () Bool)

(assert (=> b!1068457 m!987059))

(assert (=> d!129161 m!986923))

(assert (=> b!1068452 m!986977))

(assert (=> b!1068452 m!986977))

(declare-fun m!987061 () Bool)

(assert (=> b!1068452 m!987061))

(assert (=> bm!45120 m!986933))

(declare-fun m!987063 () Bool)

(assert (=> bm!45114 m!987063))

(declare-fun m!987065 () Bool)

(assert (=> b!1068470 m!987065))

(declare-fun m!987067 () Bool)

(assert (=> b!1068467 m!987067))

(declare-fun m!987069 () Bool)

(assert (=> bm!45119 m!987069))

(declare-fun m!987071 () Bool)

(assert (=> bm!45115 m!987071))

(assert (=> b!1068316 d!129161))

(declare-fun d!129163 () Bool)

(declare-fun lt!472049 () ListLongMap!14297)

(assert (=> d!129163 (not (contains!6295 lt!472049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!71 (List!22879 (_ BitVec 64)) List!22879)

(assert (=> d!129163 (= lt!472049 (ListLongMap!14298 (removeStrictlySorted!71 (toList!7164 lt!471920) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129163 (= (-!647 lt!471920 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472049)))

(declare-fun bs!31454 () Bool)

(assert (= bs!31454 d!129163))

(declare-fun m!987073 () Bool)

(assert (=> bs!31454 m!987073))

(declare-fun m!987075 () Bool)

(assert (=> bs!31454 m!987075))

(assert (=> b!1068322 d!129163))

(declare-fun d!129165 () Bool)

(assert (=> d!129165 (= (-!647 lt!471920 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471920)))

(declare-fun lt!472052 () Unit!35125)

(declare-fun choose!1736 (ListLongMap!14297 (_ BitVec 64)) Unit!35125)

(assert (=> d!129165 (= lt!472052 (choose!1736 lt!471920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129165 (not (contains!6295 lt!471920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129165 (= (removeNotPresentStillSame!57 lt!471920 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472052)))

(declare-fun bs!31455 () Bool)

(assert (= bs!31455 d!129165))

(assert (=> bs!31455 m!986919))

(declare-fun m!987077 () Bool)

(assert (=> bs!31455 m!987077))

(assert (=> bs!31455 m!986937))

(assert (=> b!1068322 d!129165))

(declare-fun b!1068480 () Bool)

(declare-fun e!609600 () Bool)

(declare-fun e!609601 () Bool)

(assert (=> b!1068480 (= e!609600 e!609601)))

(declare-fun lt!472060 () (_ BitVec 64))

(assert (=> b!1068480 (= lt!472060 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472059 () Unit!35125)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68203 (_ BitVec 64) (_ BitVec 32)) Unit!35125)

(assert (=> b!1068480 (= lt!472059 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!472060 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1068480 (arrayContainsKey!0 _keys!1163 lt!472060 #b00000000000000000000000000000000)))

(declare-fun lt!472061 () Unit!35125)

(assert (=> b!1068480 (= lt!472061 lt!472059)))

(declare-fun res!712966 () Bool)

(declare-datatypes ((SeekEntryResult!9879 0))(
  ( (MissingZero!9879 (index!41887 (_ BitVec 32))) (Found!9879 (index!41888 (_ BitVec 32))) (Intermediate!9879 (undefined!10691 Bool) (index!41889 (_ BitVec 32)) (x!95682 (_ BitVec 32))) (Undefined!9879) (MissingVacant!9879 (index!41890 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68203 (_ BitVec 32)) SeekEntryResult!9879)

(assert (=> b!1068480 (= res!712966 (= (seekEntryOrOpen!0 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9879 #b00000000000000000000000000000000)))))

(assert (=> b!1068480 (=> (not res!712966) (not e!609601))))

(declare-fun d!129167 () Bool)

(declare-fun res!712965 () Bool)

(declare-fun e!609602 () Bool)

(assert (=> d!129167 (=> res!712965 e!609602)))

(assert (=> d!129167 (= res!712965 (bvsge #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(assert (=> d!129167 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!609602)))

(declare-fun b!1068481 () Bool)

(assert (=> b!1068481 (= e!609602 e!609600)))

(declare-fun c!107541 () Bool)

(assert (=> b!1068481 (= c!107541 (validKeyInArray!0 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068482 () Bool)

(declare-fun call!45126 () Bool)

(assert (=> b!1068482 (= e!609601 call!45126)))

(declare-fun b!1068483 () Bool)

(assert (=> b!1068483 (= e!609600 call!45126)))

(declare-fun bm!45123 () Bool)

(assert (=> bm!45123 (= call!45126 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!129167 (not res!712965)) b!1068481))

(assert (= (and b!1068481 c!107541) b!1068480))

(assert (= (and b!1068481 (not c!107541)) b!1068483))

(assert (= (and b!1068480 res!712966) b!1068482))

(assert (= (or b!1068482 b!1068483) bm!45123))

(assert (=> b!1068480 m!986977))

(declare-fun m!987079 () Bool)

(assert (=> b!1068480 m!987079))

(declare-fun m!987081 () Bool)

(assert (=> b!1068480 m!987081))

(assert (=> b!1068480 m!986977))

(declare-fun m!987083 () Bool)

(assert (=> b!1068480 m!987083))

(assert (=> b!1068481 m!986977))

(assert (=> b!1068481 m!986977))

(assert (=> b!1068481 m!986985))

(declare-fun m!987085 () Bool)

(assert (=> bm!45123 m!987085))

(assert (=> b!1068314 d!129167))

(declare-fun d!129169 () Bool)

(declare-fun res!712975 () Bool)

(declare-fun e!609611 () Bool)

(assert (=> d!129169 (=> res!712975 e!609611)))

(assert (=> d!129169 (= res!712975 (bvsge #b00000000000000000000000000000000 (size!33337 _keys!1163)))))

(assert (=> d!129169 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22877) e!609611)))

(declare-fun b!1068494 () Bool)

(declare-fun e!609613 () Bool)

(declare-fun e!609612 () Bool)

(assert (=> b!1068494 (= e!609613 e!609612)))

(declare-fun c!107544 () Bool)

(assert (=> b!1068494 (= c!107544 (validKeyInArray!0 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068495 () Bool)

(assert (=> b!1068495 (= e!609611 e!609613)))

(declare-fun res!712974 () Bool)

(assert (=> b!1068495 (=> (not res!712974) (not e!609613))))

(declare-fun e!609614 () Bool)

(assert (=> b!1068495 (= res!712974 (not e!609614))))

(declare-fun res!712973 () Bool)

(assert (=> b!1068495 (=> (not res!712973) (not e!609614))))

(assert (=> b!1068495 (= res!712973 (validKeyInArray!0 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068496 () Bool)

(declare-fun contains!6297 (List!22880 (_ BitVec 64)) Bool)

(assert (=> b!1068496 (= e!609614 (contains!6297 Nil!22877 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45126 () Bool)

(declare-fun call!45129 () Bool)

(assert (=> bm!45126 (= call!45129 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107544 (Cons!22876 (select (arr!32801 _keys!1163) #b00000000000000000000000000000000) Nil!22877) Nil!22877)))))

(declare-fun b!1068497 () Bool)

(assert (=> b!1068497 (= e!609612 call!45129)))

(declare-fun b!1068498 () Bool)

(assert (=> b!1068498 (= e!609612 call!45129)))

(assert (= (and d!129169 (not res!712975)) b!1068495))

(assert (= (and b!1068495 res!712973) b!1068496))

(assert (= (and b!1068495 res!712974) b!1068494))

(assert (= (and b!1068494 c!107544) b!1068497))

(assert (= (and b!1068494 (not c!107544)) b!1068498))

(assert (= (or b!1068497 b!1068498) bm!45126))

(assert (=> b!1068494 m!986977))

(assert (=> b!1068494 m!986977))

(assert (=> b!1068494 m!986985))

(assert (=> b!1068495 m!986977))

(assert (=> b!1068495 m!986977))

(assert (=> b!1068495 m!986985))

(assert (=> b!1068496 m!986977))

(assert (=> b!1068496 m!986977))

(declare-fun m!987087 () Bool)

(assert (=> b!1068496 m!987087))

(assert (=> bm!45126 m!986977))

(declare-fun m!987089 () Bool)

(assert (=> bm!45126 m!987089))

(assert (=> b!1068318 d!129169))

(declare-fun mapNonEmpty!40117 () Bool)

(declare-fun mapRes!40117 () Bool)

(declare-fun tp!76859 () Bool)

(declare-fun e!609619 () Bool)

(assert (=> mapNonEmpty!40117 (= mapRes!40117 (and tp!76859 e!609619))))

(declare-fun mapValue!40117 () ValueCell!12102)

(declare-fun mapRest!40117 () (Array (_ BitVec 32) ValueCell!12102))

(declare-fun mapKey!40117 () (_ BitVec 32))

(assert (=> mapNonEmpty!40117 (= mapRest!40111 (store mapRest!40117 mapKey!40117 mapValue!40117))))

(declare-fun mapIsEmpty!40117 () Bool)

(assert (=> mapIsEmpty!40117 mapRes!40117))

(declare-fun b!1068506 () Bool)

(declare-fun e!609620 () Bool)

(assert (=> b!1068506 (= e!609620 tp_is_empty!25611)))

(declare-fun b!1068505 () Bool)

(assert (=> b!1068505 (= e!609619 tp_is_empty!25611)))

(declare-fun condMapEmpty!40117 () Bool)

(declare-fun mapDefault!40117 () ValueCell!12102)

(assert (=> mapNonEmpty!40111 (= condMapEmpty!40117 (= mapRest!40111 ((as const (Array (_ BitVec 32) ValueCell!12102)) mapDefault!40117)))))

(assert (=> mapNonEmpty!40111 (= tp!76850 (and e!609620 mapRes!40117))))

(assert (= (and mapNonEmpty!40111 condMapEmpty!40117) mapIsEmpty!40117))

(assert (= (and mapNonEmpty!40111 (not condMapEmpty!40117)) mapNonEmpty!40117))

(assert (= (and mapNonEmpty!40117 ((_ is ValueCellFull!12102) mapValue!40117)) b!1068505))

(assert (= (and mapNonEmpty!40111 ((_ is ValueCellFull!12102) mapDefault!40117)) b!1068506))

(declare-fun m!987091 () Bool)

(assert (=> mapNonEmpty!40117 m!987091))

(declare-fun b_lambda!16611 () Bool)

(assert (= b_lambda!16609 (or (and start!94474 b_free!21801) b_lambda!16611)))

(declare-fun b_lambda!16613 () Bool)

(assert (= b_lambda!16603 (or (and start!94474 b_free!21801) b_lambda!16613)))

(declare-fun b_lambda!16615 () Bool)

(assert (= b_lambda!16601 (or (and start!94474 b_free!21801) b_lambda!16615)))

(declare-fun b_lambda!16617 () Bool)

(assert (= b_lambda!16605 (or (and start!94474 b_free!21801) b_lambda!16617)))

(declare-fun b_lambda!16619 () Bool)

(assert (= b_lambda!16607 (or (and start!94474 b_free!21801) b_lambda!16619)))

(check-sat (not b!1068495) (not b_lambda!16619) (not b!1068391) (not bm!45098) (not b!1068383) (not b!1068378) (not bm!45114) (not bm!45120) (not b!1068396) (not b_lambda!16613) (not b!1068469) (not b!1068395) (not b!1068494) (not b!1068394) (not mapNonEmpty!40117) (not b!1068470) (not bm!45099) (not b_lambda!16615) (not b!1068380) (not d!129147) (not b!1068467) (not bm!45115) (not b!1068451) (not bm!45119) (not b!1068406) (not d!129151) tp_is_empty!25611 (not d!129163) (not b_lambda!16611) (not b!1068382) (not b!1068453) (not b!1068374) (not d!129161) (not b!1068377) (not b!1068408) (not b!1068385) (not bm!45126) (not b_lambda!16617) (not b!1068399) (not d!129149) (not b!1068397) b_and!34605 (not b!1068457) (not bm!45123) (not b!1068480) (not b!1068471) (not b!1068452) (not d!129159) (not b!1068392) (not b!1068388) (not b!1068481) (not b_next!21801) (not b!1068381) (not b!1068496) (not d!129165))
(check-sat b_and!34605 (not b_next!21801))
