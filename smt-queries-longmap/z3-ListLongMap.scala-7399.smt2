; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94406 () Bool)

(assert start!94406)

(declare-fun b_free!21571 () Bool)

(declare-fun b_next!21571 () Bool)

(assert (=> start!94406 (= b_free!21571 (not b_next!21571))))

(declare-fun tp!76147 () Bool)

(declare-fun b_and!34331 () Bool)

(assert (=> start!94406 (= tp!76147 b_and!34331)))

(declare-fun b!1066275 () Bool)

(declare-fun e!607891 () Bool)

(declare-fun tp_is_empty!25381 () Bool)

(assert (=> b!1066275 (= e!607891 tp_is_empty!25381)))

(declare-fun b!1066276 () Bool)

(declare-fun e!607886 () Bool)

(declare-datatypes ((array!67801 0))(
  ( (array!67802 (arr!32598 (Array (_ BitVec 32) (_ BitVec 64))) (size!33135 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67801)

(assert (=> b!1066276 (= e!607886 (bvsle #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38977 0))(
  ( (V!38978 (val!12741 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38977)

(declare-datatypes ((tuple2!16130 0))(
  ( (tuple2!16131 (_1!8076 (_ BitVec 64)) (_2!8076 V!38977)) )
))
(declare-datatypes ((List!22703 0))(
  ( (Nil!22700) (Cons!22699 (h!23917 tuple2!16130) (t!32012 List!22703)) )
))
(declare-datatypes ((ListLongMap!14107 0))(
  ( (ListLongMap!14108 (toList!7069 List!22703)) )
))
(declare-fun lt!469969 () ListLongMap!14107)

(declare-datatypes ((ValueCell!11987 0))(
  ( (ValueCellFull!11987 (v!15349 V!38977)) (EmptyCell!11987) )
))
(declare-datatypes ((array!67803 0))(
  ( (array!67804 (arr!32599 (Array (_ BitVec 32) ValueCell!11987)) (size!33136 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67803)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38977)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4023 (array!67801 array!67803 (_ BitVec 32) (_ BitVec 32) V!38977 V!38977 (_ BitVec 32) Int) ListLongMap!14107)

(assert (=> b!1066276 (= lt!469969 (getCurrentListMap!4023 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066277 () Bool)

(declare-fun e!607889 () Bool)

(assert (=> b!1066277 (= e!607889 (not e!607886))))

(declare-fun res!711434 () Bool)

(assert (=> b!1066277 (=> res!711434 e!607886)))

(assert (=> b!1066277 (= res!711434 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469970 () ListLongMap!14107)

(declare-fun lt!469971 () ListLongMap!14107)

(assert (=> b!1066277 (= lt!469970 lt!469971)))

(declare-datatypes ((Unit!34931 0))(
  ( (Unit!34932) )
))
(declare-fun lt!469972 () Unit!34931)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38977)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!701 (array!67801 array!67803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38977 V!38977 V!38977 V!38977 (_ BitVec 32) Int) Unit!34931)

(assert (=> b!1066277 (= lt!469972 (lemmaNoChangeToArrayThenSameMapNoExtras!701 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3698 (array!67801 array!67803 (_ BitVec 32) (_ BitVec 32) V!38977 V!38977 (_ BitVec 32) Int) ListLongMap!14107)

(assert (=> b!1066277 (= lt!469971 (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066277 (= lt!469970 (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066278 () Bool)

(declare-fun e!607888 () Bool)

(assert (=> b!1066278 (= e!607888 tp_is_empty!25381)))

(declare-fun b!1066279 () Bool)

(declare-fun res!711433 () Bool)

(assert (=> b!1066279 (=> (not res!711433) (not e!607889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67801 (_ BitVec 32)) Bool)

(assert (=> b!1066279 (= res!711433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066280 () Bool)

(declare-fun res!711432 () Bool)

(assert (=> b!1066280 (=> (not res!711432) (not e!607889))))

(declare-datatypes ((List!22704 0))(
  ( (Nil!22701) (Cons!22700 (h!23918 (_ BitVec 64)) (t!32013 List!22704)) )
))
(declare-fun arrayNoDuplicates!0 (array!67801 (_ BitVec 32) List!22704) Bool)

(assert (=> b!1066280 (= res!711432 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22701))))

(declare-fun mapNonEmpty!39754 () Bool)

(declare-fun mapRes!39754 () Bool)

(declare-fun tp!76148 () Bool)

(assert (=> mapNonEmpty!39754 (= mapRes!39754 (and tp!76148 e!607888))))

(declare-fun mapKey!39754 () (_ BitVec 32))

(declare-fun mapValue!39754 () ValueCell!11987)

(declare-fun mapRest!39754 () (Array (_ BitVec 32) ValueCell!11987))

(assert (=> mapNonEmpty!39754 (= (arr!32599 _values!955) (store mapRest!39754 mapKey!39754 mapValue!39754))))

(declare-fun res!711431 () Bool)

(assert (=> start!94406 (=> (not res!711431) (not e!607889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94406 (= res!711431 (validMask!0 mask!1515))))

(assert (=> start!94406 e!607889))

(assert (=> start!94406 true))

(assert (=> start!94406 tp_is_empty!25381))

(declare-fun e!607887 () Bool)

(declare-fun array_inv!25268 (array!67803) Bool)

(assert (=> start!94406 (and (array_inv!25268 _values!955) e!607887)))

(assert (=> start!94406 tp!76147))

(declare-fun array_inv!25269 (array!67801) Bool)

(assert (=> start!94406 (array_inv!25269 _keys!1163)))

(declare-fun b!1066281 () Bool)

(declare-fun res!711430 () Bool)

(assert (=> b!1066281 (=> (not res!711430) (not e!607889))))

(assert (=> b!1066281 (= res!711430 (and (= (size!33136 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33135 _keys!1163) (size!33136 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39754 () Bool)

(assert (=> mapIsEmpty!39754 mapRes!39754))

(declare-fun b!1066282 () Bool)

(assert (=> b!1066282 (= e!607887 (and e!607891 mapRes!39754))))

(declare-fun condMapEmpty!39754 () Bool)

(declare-fun mapDefault!39754 () ValueCell!11987)

(assert (=> b!1066282 (= condMapEmpty!39754 (= (arr!32599 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11987)) mapDefault!39754)))))

(assert (= (and start!94406 res!711431) b!1066281))

(assert (= (and b!1066281 res!711430) b!1066279))

(assert (= (and b!1066279 res!711433) b!1066280))

(assert (= (and b!1066280 res!711432) b!1066277))

(assert (= (and b!1066277 (not res!711434)) b!1066276))

(assert (= (and b!1066282 condMapEmpty!39754) mapIsEmpty!39754))

(assert (= (and b!1066282 (not condMapEmpty!39754)) mapNonEmpty!39754))

(get-info :version)

(assert (= (and mapNonEmpty!39754 ((_ is ValueCellFull!11987) mapValue!39754)) b!1066278))

(assert (= (and b!1066282 ((_ is ValueCellFull!11987) mapDefault!39754)) b!1066275))

(assert (= start!94406 b!1066282))

(declare-fun m!985081 () Bool)

(assert (=> b!1066277 m!985081))

(declare-fun m!985083 () Bool)

(assert (=> b!1066277 m!985083))

(declare-fun m!985085 () Bool)

(assert (=> b!1066277 m!985085))

(declare-fun m!985087 () Bool)

(assert (=> b!1066280 m!985087))

(declare-fun m!985089 () Bool)

(assert (=> b!1066276 m!985089))

(declare-fun m!985091 () Bool)

(assert (=> b!1066279 m!985091))

(declare-fun m!985093 () Bool)

(assert (=> start!94406 m!985093))

(declare-fun m!985095 () Bool)

(assert (=> start!94406 m!985095))

(declare-fun m!985097 () Bool)

(assert (=> start!94406 m!985097))

(declare-fun m!985099 () Bool)

(assert (=> mapNonEmpty!39754 m!985099))

(check-sat (not b!1066277) b_and!34331 (not b!1066276) (not b!1066279) tp_is_empty!25381 (not b!1066280) (not mapNonEmpty!39754) (not start!94406) (not b_next!21571))
(check-sat b_and!34331 (not b_next!21571))
(get-model)

(declare-fun b!1066373 () Bool)

(declare-fun e!607954 () Bool)

(declare-fun e!607956 () Bool)

(assert (=> b!1066373 (= e!607954 e!607956)))

(declare-fun res!711490 () Bool)

(declare-fun call!45066 () Bool)

(assert (=> b!1066373 (= res!711490 call!45066)))

(assert (=> b!1066373 (=> (not res!711490) (not e!607956))))

(declare-fun b!1066374 () Bool)

(declare-fun e!607966 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1066374 (= e!607966 (validKeyInArray!0 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066375 () Bool)

(declare-fun e!607959 () Bool)

(declare-fun e!607963 () Bool)

(assert (=> b!1066375 (= e!607959 e!607963)))

(declare-fun c!107770 () Bool)

(assert (=> b!1066375 (= c!107770 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1066376 () Bool)

(declare-fun e!607958 () Bool)

(declare-fun lt!470043 () ListLongMap!14107)

(declare-fun apply!931 (ListLongMap!14107 (_ BitVec 64)) V!38977)

(declare-fun get!17037 (ValueCell!11987 V!38977) V!38977)

(declare-fun dynLambda!2046 (Int (_ BitVec 64)) V!38977)

(assert (=> b!1066376 (= e!607958 (= (apply!931 lt!470043 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)) (get!17037 (select (arr!32599 _values!955) #b00000000000000000000000000000000) (dynLambda!2046 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1066376 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33136 _values!955)))))

(assert (=> b!1066376 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(declare-fun bm!45060 () Bool)

(declare-fun call!45068 () ListLongMap!14107)

(assert (=> bm!45060 (= call!45068 (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066377 () Bool)

(declare-fun e!607965 () ListLongMap!14107)

(declare-fun call!45065 () ListLongMap!14107)

(declare-fun +!3142 (ListLongMap!14107 tuple2!16130) ListLongMap!14107)

(assert (=> b!1066377 (= e!607965 (+!3142 call!45065 (tuple2!16131 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1066378 () Bool)

(declare-fun e!607962 () Bool)

(assert (=> b!1066378 (= e!607962 (validKeyInArray!0 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45061 () Bool)

(declare-fun call!45064 () Bool)

(declare-fun contains!6285 (ListLongMap!14107 (_ BitVec 64)) Bool)

(assert (=> bm!45061 (= call!45064 (contains!6285 lt!470043 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1066379 () Bool)

(declare-fun res!711486 () Bool)

(assert (=> b!1066379 (=> (not res!711486) (not e!607959))))

(assert (=> b!1066379 (= res!711486 e!607954)))

(declare-fun c!107771 () Bool)

(assert (=> b!1066379 (= c!107771 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066380 () Bool)

(declare-fun e!607964 () Unit!34931)

(declare-fun lt!470046 () Unit!34931)

(assert (=> b!1066380 (= e!607964 lt!470046)))

(declare-fun lt!470055 () ListLongMap!14107)

(assert (=> b!1066380 (= lt!470055 (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470060 () (_ BitVec 64))

(assert (=> b!1066380 (= lt!470060 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470050 () (_ BitVec 64))

(assert (=> b!1066380 (= lt!470050 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470057 () Unit!34931)

(declare-fun addStillContains!638 (ListLongMap!14107 (_ BitVec 64) V!38977 (_ BitVec 64)) Unit!34931)

(assert (=> b!1066380 (= lt!470057 (addStillContains!638 lt!470055 lt!470060 zeroValueBefore!47 lt!470050))))

(assert (=> b!1066380 (contains!6285 (+!3142 lt!470055 (tuple2!16131 lt!470060 zeroValueBefore!47)) lt!470050)))

(declare-fun lt!470059 () Unit!34931)

(assert (=> b!1066380 (= lt!470059 lt!470057)))

(declare-fun lt!470041 () ListLongMap!14107)

(assert (=> b!1066380 (= lt!470041 (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470044 () (_ BitVec 64))

(assert (=> b!1066380 (= lt!470044 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470054 () (_ BitVec 64))

(assert (=> b!1066380 (= lt!470054 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470056 () Unit!34931)

(declare-fun addApplyDifferent!494 (ListLongMap!14107 (_ BitVec 64) V!38977 (_ BitVec 64)) Unit!34931)

(assert (=> b!1066380 (= lt!470056 (addApplyDifferent!494 lt!470041 lt!470044 minValue!907 lt!470054))))

(assert (=> b!1066380 (= (apply!931 (+!3142 lt!470041 (tuple2!16131 lt!470044 minValue!907)) lt!470054) (apply!931 lt!470041 lt!470054))))

(declare-fun lt!470048 () Unit!34931)

(assert (=> b!1066380 (= lt!470048 lt!470056)))

(declare-fun lt!470061 () ListLongMap!14107)

(assert (=> b!1066380 (= lt!470061 (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470045 () (_ BitVec 64))

(assert (=> b!1066380 (= lt!470045 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470052 () (_ BitVec 64))

(assert (=> b!1066380 (= lt!470052 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470042 () Unit!34931)

(assert (=> b!1066380 (= lt!470042 (addApplyDifferent!494 lt!470061 lt!470045 zeroValueBefore!47 lt!470052))))

(assert (=> b!1066380 (= (apply!931 (+!3142 lt!470061 (tuple2!16131 lt!470045 zeroValueBefore!47)) lt!470052) (apply!931 lt!470061 lt!470052))))

(declare-fun lt!470062 () Unit!34931)

(assert (=> b!1066380 (= lt!470062 lt!470042)))

(declare-fun lt!470051 () ListLongMap!14107)

(assert (=> b!1066380 (= lt!470051 (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470053 () (_ BitVec 64))

(assert (=> b!1066380 (= lt!470053 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470049 () (_ BitVec 64))

(assert (=> b!1066380 (= lt!470049 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1066380 (= lt!470046 (addApplyDifferent!494 lt!470051 lt!470053 minValue!907 lt!470049))))

(assert (=> b!1066380 (= (apply!931 (+!3142 lt!470051 (tuple2!16131 lt!470053 minValue!907)) lt!470049) (apply!931 lt!470051 lt!470049))))

(declare-fun b!1066381 () Bool)

(declare-fun e!607957 () ListLongMap!14107)

(declare-fun call!45063 () ListLongMap!14107)

(assert (=> b!1066381 (= e!607957 call!45063)))

(declare-fun b!1066382 () Bool)

(declare-fun res!711488 () Bool)

(assert (=> b!1066382 (=> (not res!711488) (not e!607959))))

(declare-fun e!607960 () Bool)

(assert (=> b!1066382 (= res!711488 e!607960)))

(declare-fun res!711487 () Bool)

(assert (=> b!1066382 (=> res!711487 e!607960)))

(assert (=> b!1066382 (= res!711487 (not e!607966))))

(declare-fun res!711491 () Bool)

(assert (=> b!1066382 (=> (not res!711491) (not e!607966))))

(assert (=> b!1066382 (= res!711491 (bvslt #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(declare-fun bm!45062 () Bool)

(declare-fun call!45069 () ListLongMap!14107)

(assert (=> bm!45062 (= call!45069 call!45068)))

(declare-fun bm!45063 () Bool)

(declare-fun c!107775 () Bool)

(declare-fun call!45067 () ListLongMap!14107)

(declare-fun c!107773 () Bool)

(assert (=> bm!45063 (= call!45065 (+!3142 (ite c!107773 call!45068 (ite c!107775 call!45069 call!45067)) (ite (or c!107773 c!107775) (tuple2!16131 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16131 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1066383 () Bool)

(assert (=> b!1066383 (= e!607960 e!607958)))

(declare-fun res!711489 () Bool)

(assert (=> b!1066383 (=> (not res!711489) (not e!607958))))

(assert (=> b!1066383 (= res!711489 (contains!6285 lt!470043 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066383 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(declare-fun b!1066384 () Bool)

(declare-fun e!607961 () ListLongMap!14107)

(assert (=> b!1066384 (= e!607961 call!45063)))

(declare-fun b!1066385 () Bool)

(assert (=> b!1066385 (= e!607961 call!45067)))

(declare-fun b!1066386 () Bool)

(assert (=> b!1066386 (= e!607963 (not call!45064))))

(declare-fun b!1066387 () Bool)

(declare-fun e!607955 () Bool)

(assert (=> b!1066387 (= e!607955 (= (apply!931 lt!470043 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1066388 () Bool)

(assert (=> b!1066388 (= e!607954 (not call!45066))))

(declare-fun b!1066389 () Bool)

(declare-fun c!107772 () Bool)

(assert (=> b!1066389 (= c!107772 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066389 (= e!607957 e!607961)))

(declare-fun b!1066390 () Bool)

(declare-fun Unit!34933 () Unit!34931)

(assert (=> b!1066390 (= e!607964 Unit!34933)))

(declare-fun bm!45064 () Bool)

(assert (=> bm!45064 (= call!45063 call!45065)))

(declare-fun b!1066391 () Bool)

(assert (=> b!1066391 (= e!607963 e!607955)))

(declare-fun res!711485 () Bool)

(assert (=> b!1066391 (= res!711485 call!45064)))

(assert (=> b!1066391 (=> (not res!711485) (not e!607955))))

(declare-fun b!1066392 () Bool)

(assert (=> b!1066392 (= e!607965 e!607957)))

(assert (=> b!1066392 (= c!107775 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!129445 () Bool)

(assert (=> d!129445 e!607959))

(declare-fun res!711483 () Bool)

(assert (=> d!129445 (=> (not res!711483) (not e!607959))))

(assert (=> d!129445 (= res!711483 (or (bvsge #b00000000000000000000000000000000 (size!33135 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33135 _keys!1163)))))))

(declare-fun lt!470058 () ListLongMap!14107)

(assert (=> d!129445 (= lt!470043 lt!470058)))

(declare-fun lt!470047 () Unit!34931)

(assert (=> d!129445 (= lt!470047 e!607964)))

(declare-fun c!107774 () Bool)

(assert (=> d!129445 (= c!107774 e!607962)))

(declare-fun res!711484 () Bool)

(assert (=> d!129445 (=> (not res!711484) (not e!607962))))

(assert (=> d!129445 (= res!711484 (bvslt #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(assert (=> d!129445 (= lt!470058 e!607965)))

(assert (=> d!129445 (= c!107773 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129445 (validMask!0 mask!1515)))

(assert (=> d!129445 (= (getCurrentListMap!4023 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470043)))

(declare-fun bm!45065 () Bool)

(assert (=> bm!45065 (= call!45067 call!45069)))

(declare-fun bm!45066 () Bool)

(assert (=> bm!45066 (= call!45066 (contains!6285 lt!470043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1066393 () Bool)

(assert (=> b!1066393 (= e!607956 (= (apply!931 lt!470043 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(assert (= (and d!129445 c!107773) b!1066377))

(assert (= (and d!129445 (not c!107773)) b!1066392))

(assert (= (and b!1066392 c!107775) b!1066381))

(assert (= (and b!1066392 (not c!107775)) b!1066389))

(assert (= (and b!1066389 c!107772) b!1066384))

(assert (= (and b!1066389 (not c!107772)) b!1066385))

(assert (= (or b!1066384 b!1066385) bm!45065))

(assert (= (or b!1066381 bm!45065) bm!45062))

(assert (= (or b!1066381 b!1066384) bm!45064))

(assert (= (or b!1066377 bm!45062) bm!45060))

(assert (= (or b!1066377 bm!45064) bm!45063))

(assert (= (and d!129445 res!711484) b!1066378))

(assert (= (and d!129445 c!107774) b!1066380))

(assert (= (and d!129445 (not c!107774)) b!1066390))

(assert (= (and d!129445 res!711483) b!1066382))

(assert (= (and b!1066382 res!711491) b!1066374))

(assert (= (and b!1066382 (not res!711487)) b!1066383))

(assert (= (and b!1066383 res!711489) b!1066376))

(assert (= (and b!1066382 res!711488) b!1066379))

(assert (= (and b!1066379 c!107771) b!1066373))

(assert (= (and b!1066379 (not c!107771)) b!1066388))

(assert (= (and b!1066373 res!711490) b!1066393))

(assert (= (or b!1066373 b!1066388) bm!45066))

(assert (= (and b!1066379 res!711486) b!1066375))

(assert (= (and b!1066375 c!107770) b!1066391))

(assert (= (and b!1066375 (not c!107770)) b!1066386))

(assert (= (and b!1066391 res!711485) b!1066387))

(assert (= (or b!1066391 b!1066386) bm!45061))

(declare-fun b_lambda!16527 () Bool)

(assert (=> (not b_lambda!16527) (not b!1066376)))

(declare-fun t!32015 () Bool)

(declare-fun tb!7131 () Bool)

(assert (=> (and start!94406 (= defaultEntry!963 defaultEntry!963) t!32015) tb!7131))

(declare-fun result!14717 () Bool)

(assert (=> tb!7131 (= result!14717 tp_is_empty!25381)))

(assert (=> b!1066376 t!32015))

(declare-fun b_and!34337 () Bool)

(assert (= b_and!34331 (and (=> t!32015 result!14717) b_and!34337)))

(declare-fun m!985141 () Bool)

(assert (=> bm!45066 m!985141))

(declare-fun m!985143 () Bool)

(assert (=> bm!45061 m!985143))

(declare-fun m!985145 () Bool)

(assert (=> b!1066383 m!985145))

(assert (=> b!1066383 m!985145))

(declare-fun m!985147 () Bool)

(assert (=> b!1066383 m!985147))

(declare-fun m!985149 () Bool)

(assert (=> bm!45063 m!985149))

(declare-fun m!985151 () Bool)

(assert (=> b!1066377 m!985151))

(declare-fun m!985153 () Bool)

(assert (=> b!1066387 m!985153))

(declare-fun m!985155 () Bool)

(assert (=> b!1066376 m!985155))

(declare-fun m!985157 () Bool)

(assert (=> b!1066376 m!985157))

(declare-fun m!985159 () Bool)

(assert (=> b!1066376 m!985159))

(assert (=> b!1066376 m!985157))

(assert (=> b!1066376 m!985155))

(assert (=> b!1066376 m!985145))

(declare-fun m!985161 () Bool)

(assert (=> b!1066376 m!985161))

(assert (=> b!1066376 m!985145))

(assert (=> b!1066378 m!985145))

(assert (=> b!1066378 m!985145))

(declare-fun m!985163 () Bool)

(assert (=> b!1066378 m!985163))

(assert (=> b!1066374 m!985145))

(assert (=> b!1066374 m!985145))

(assert (=> b!1066374 m!985163))

(declare-fun m!985165 () Bool)

(assert (=> b!1066380 m!985165))

(declare-fun m!985167 () Bool)

(assert (=> b!1066380 m!985167))

(declare-fun m!985169 () Bool)

(assert (=> b!1066380 m!985169))

(declare-fun m!985171 () Bool)

(assert (=> b!1066380 m!985171))

(declare-fun m!985173 () Bool)

(assert (=> b!1066380 m!985173))

(declare-fun m!985175 () Bool)

(assert (=> b!1066380 m!985175))

(declare-fun m!985177 () Bool)

(assert (=> b!1066380 m!985177))

(declare-fun m!985179 () Bool)

(assert (=> b!1066380 m!985179))

(declare-fun m!985181 () Bool)

(assert (=> b!1066380 m!985181))

(declare-fun m!985183 () Bool)

(assert (=> b!1066380 m!985183))

(assert (=> b!1066380 m!985145))

(declare-fun m!985185 () Bool)

(assert (=> b!1066380 m!985185))

(assert (=> b!1066380 m!985167))

(assert (=> b!1066380 m!985175))

(declare-fun m!985187 () Bool)

(assert (=> b!1066380 m!985187))

(declare-fun m!985189 () Bool)

(assert (=> b!1066380 m!985189))

(assert (=> b!1066380 m!985085))

(assert (=> b!1066380 m!985187))

(assert (=> b!1066380 m!985179))

(declare-fun m!985191 () Bool)

(assert (=> b!1066380 m!985191))

(declare-fun m!985193 () Bool)

(assert (=> b!1066380 m!985193))

(assert (=> bm!45060 m!985085))

(declare-fun m!985195 () Bool)

(assert (=> b!1066393 m!985195))

(assert (=> d!129445 m!985093))

(assert (=> b!1066276 d!129445))

(declare-fun b!1066406 () Bool)

(declare-fun e!607976 () Bool)

(declare-fun e!607977 () Bool)

(assert (=> b!1066406 (= e!607976 e!607977)))

(declare-fun res!711498 () Bool)

(assert (=> b!1066406 (=> (not res!711498) (not e!607977))))

(declare-fun e!607975 () Bool)

(assert (=> b!1066406 (= res!711498 (not e!607975))))

(declare-fun res!711499 () Bool)

(assert (=> b!1066406 (=> (not res!711499) (not e!607975))))

(assert (=> b!1066406 (= res!711499 (validKeyInArray!0 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066407 () Bool)

(declare-fun e!607978 () Bool)

(declare-fun call!45072 () Bool)

(assert (=> b!1066407 (= e!607978 call!45072)))

(declare-fun d!129447 () Bool)

(declare-fun res!711500 () Bool)

(assert (=> d!129447 (=> res!711500 e!607976)))

(assert (=> d!129447 (= res!711500 (bvsge #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(assert (=> d!129447 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22701) e!607976)))

(declare-fun bm!45069 () Bool)

(declare-fun c!107778 () Bool)

(assert (=> bm!45069 (= call!45072 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107778 (Cons!22700 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000) Nil!22701) Nil!22701)))))

(declare-fun b!1066408 () Bool)

(assert (=> b!1066408 (= e!607978 call!45072)))

(declare-fun b!1066409 () Bool)

(declare-fun contains!6286 (List!22704 (_ BitVec 64)) Bool)

(assert (=> b!1066409 (= e!607975 (contains!6286 Nil!22701 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066410 () Bool)

(assert (=> b!1066410 (= e!607977 e!607978)))

(assert (=> b!1066410 (= c!107778 (validKeyInArray!0 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129447 (not res!711500)) b!1066406))

(assert (= (and b!1066406 res!711499) b!1066409))

(assert (= (and b!1066406 res!711498) b!1066410))

(assert (= (and b!1066410 c!107778) b!1066408))

(assert (= (and b!1066410 (not c!107778)) b!1066407))

(assert (= (or b!1066408 b!1066407) bm!45069))

(assert (=> b!1066406 m!985145))

(assert (=> b!1066406 m!985145))

(assert (=> b!1066406 m!985163))

(assert (=> bm!45069 m!985145))

(declare-fun m!985197 () Bool)

(assert (=> bm!45069 m!985197))

(assert (=> b!1066409 m!985145))

(assert (=> b!1066409 m!985145))

(declare-fun m!985199 () Bool)

(assert (=> b!1066409 m!985199))

(assert (=> b!1066410 m!985145))

(assert (=> b!1066410 m!985145))

(assert (=> b!1066410 m!985163))

(assert (=> b!1066280 d!129447))

(declare-fun d!129449 () Bool)

(assert (=> d!129449 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94406 d!129449))

(declare-fun d!129451 () Bool)

(assert (=> d!129451 (= (array_inv!25268 _values!955) (bvsge (size!33136 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94406 d!129451))

(declare-fun d!129453 () Bool)

(assert (=> d!129453 (= (array_inv!25269 _keys!1163) (bvsge (size!33135 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94406 d!129453))

(declare-fun b!1066419 () Bool)

(declare-fun e!607986 () Bool)

(declare-fun call!45075 () Bool)

(assert (=> b!1066419 (= e!607986 call!45075)))

(declare-fun b!1066420 () Bool)

(declare-fun e!607985 () Bool)

(assert (=> b!1066420 (= e!607985 e!607986)))

(declare-fun lt!470069 () (_ BitVec 64))

(assert (=> b!1066420 (= lt!470069 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470071 () Unit!34931)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67801 (_ BitVec 64) (_ BitVec 32)) Unit!34931)

(assert (=> b!1066420 (= lt!470071 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!470069 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1066420 (arrayContainsKey!0 _keys!1163 lt!470069 #b00000000000000000000000000000000)))

(declare-fun lt!470070 () Unit!34931)

(assert (=> b!1066420 (= lt!470070 lt!470071)))

(declare-fun res!711506 () Bool)

(declare-datatypes ((SeekEntryResult!9831 0))(
  ( (MissingZero!9831 (index!41695 (_ BitVec 32))) (Found!9831 (index!41696 (_ BitVec 32))) (Intermediate!9831 (undefined!10643 Bool) (index!41697 (_ BitVec 32)) (x!95308 (_ BitVec 32))) (Undefined!9831) (MissingVacant!9831 (index!41698 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67801 (_ BitVec 32)) SeekEntryResult!9831)

(assert (=> b!1066420 (= res!711506 (= (seekEntryOrOpen!0 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9831 #b00000000000000000000000000000000)))))

(assert (=> b!1066420 (=> (not res!711506) (not e!607986))))

(declare-fun b!1066421 () Bool)

(declare-fun e!607987 () Bool)

(assert (=> b!1066421 (= e!607987 e!607985)))

(declare-fun c!107781 () Bool)

(assert (=> b!1066421 (= c!107781 (validKeyInArray!0 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066422 () Bool)

(assert (=> b!1066422 (= e!607985 call!45075)))

(declare-fun d!129455 () Bool)

(declare-fun res!711505 () Bool)

(assert (=> d!129455 (=> res!711505 e!607987)))

(assert (=> d!129455 (= res!711505 (bvsge #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(assert (=> d!129455 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!607987)))

(declare-fun bm!45072 () Bool)

(assert (=> bm!45072 (= call!45075 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!129455 (not res!711505)) b!1066421))

(assert (= (and b!1066421 c!107781) b!1066420))

(assert (= (and b!1066421 (not c!107781)) b!1066422))

(assert (= (and b!1066420 res!711506) b!1066419))

(assert (= (or b!1066419 b!1066422) bm!45072))

(assert (=> b!1066420 m!985145))

(declare-fun m!985201 () Bool)

(assert (=> b!1066420 m!985201))

(declare-fun m!985203 () Bool)

(assert (=> b!1066420 m!985203))

(assert (=> b!1066420 m!985145))

(declare-fun m!985205 () Bool)

(assert (=> b!1066420 m!985205))

(assert (=> b!1066421 m!985145))

(assert (=> b!1066421 m!985145))

(assert (=> b!1066421 m!985163))

(declare-fun m!985207 () Bool)

(assert (=> bm!45072 m!985207))

(assert (=> b!1066279 d!129455))

(declare-fun d!129457 () Bool)

(assert (=> d!129457 (= (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470074 () Unit!34931)

(declare-fun choose!1733 (array!67801 array!67803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38977 V!38977 V!38977 V!38977 (_ BitVec 32) Int) Unit!34931)

(assert (=> d!129457 (= lt!470074 (choose!1733 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129457 (validMask!0 mask!1515)))

(assert (=> d!129457 (= (lemmaNoChangeToArrayThenSameMapNoExtras!701 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470074)))

(declare-fun bs!31349 () Bool)

(assert (= bs!31349 d!129457))

(assert (=> bs!31349 m!985085))

(assert (=> bs!31349 m!985083))

(declare-fun m!985209 () Bool)

(assert (=> bs!31349 m!985209))

(assert (=> bs!31349 m!985093))

(assert (=> b!1066277 d!129457))

(declare-fun b!1066447 () Bool)

(declare-fun e!608008 () Bool)

(declare-fun e!608003 () Bool)

(assert (=> b!1066447 (= e!608008 e!608003)))

(assert (=> b!1066447 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(declare-fun res!711518 () Bool)

(declare-fun lt!470090 () ListLongMap!14107)

(assert (=> b!1066447 (= res!711518 (contains!6285 lt!470090 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066447 (=> (not res!711518) (not e!608003))))

(declare-fun b!1066448 () Bool)

(declare-fun e!608007 () Bool)

(declare-fun isEmpty!944 (ListLongMap!14107) Bool)

(assert (=> b!1066448 (= e!608007 (isEmpty!944 lt!470090))))

(declare-fun b!1066449 () Bool)

(assert (=> b!1066449 (= e!608008 e!608007)))

(declare-fun c!107791 () Bool)

(assert (=> b!1066449 (= c!107791 (bvslt #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(declare-fun b!1066450 () Bool)

(declare-fun e!608004 () Bool)

(assert (=> b!1066450 (= e!608004 e!608008)))

(declare-fun c!107792 () Bool)

(declare-fun e!608005 () Bool)

(assert (=> b!1066450 (= c!107792 e!608005)))

(declare-fun res!711517 () Bool)

(assert (=> b!1066450 (=> (not res!711517) (not e!608005))))

(assert (=> b!1066450 (= res!711517 (bvslt #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(declare-fun b!1066451 () Bool)

(assert (=> b!1066451 (= e!608005 (validKeyInArray!0 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066451 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1066452 () Bool)

(declare-fun e!608006 () ListLongMap!14107)

(declare-fun call!45078 () ListLongMap!14107)

(assert (=> b!1066452 (= e!608006 call!45078)))

(declare-fun b!1066453 () Bool)

(declare-fun e!608002 () ListLongMap!14107)

(assert (=> b!1066453 (= e!608002 e!608006)))

(declare-fun c!107793 () Bool)

(assert (=> b!1066453 (= c!107793 (validKeyInArray!0 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066454 () Bool)

(declare-fun res!711515 () Bool)

(assert (=> b!1066454 (=> (not res!711515) (not e!608004))))

(assert (=> b!1066454 (= res!711515 (not (contains!6285 lt!470090 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1066455 () Bool)

(declare-fun lt!470094 () Unit!34931)

(declare-fun lt!470092 () Unit!34931)

(assert (=> b!1066455 (= lt!470094 lt!470092)))

(declare-fun lt!470089 () (_ BitVec 64))

(declare-fun lt!470095 () ListLongMap!14107)

(declare-fun lt!470091 () (_ BitVec 64))

(declare-fun lt!470093 () V!38977)

(assert (=> b!1066455 (not (contains!6285 (+!3142 lt!470095 (tuple2!16131 lt!470091 lt!470093)) lt!470089))))

(declare-fun addStillNotContains!252 (ListLongMap!14107 (_ BitVec 64) V!38977 (_ BitVec 64)) Unit!34931)

(assert (=> b!1066455 (= lt!470092 (addStillNotContains!252 lt!470095 lt!470091 lt!470093 lt!470089))))

(assert (=> b!1066455 (= lt!470089 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1066455 (= lt!470093 (get!17037 (select (arr!32599 _values!955) #b00000000000000000000000000000000) (dynLambda!2046 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1066455 (= lt!470091 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1066455 (= lt!470095 call!45078)))

(assert (=> b!1066455 (= e!608006 (+!3142 call!45078 (tuple2!16131 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000) (get!17037 (select (arr!32599 _values!955) #b00000000000000000000000000000000) (dynLambda!2046 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1066456 () Bool)

(assert (=> b!1066456 (= e!608007 (= lt!470090 (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1066457 () Bool)

(assert (=> b!1066457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(assert (=> b!1066457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33136 _values!955)))))

(assert (=> b!1066457 (= e!608003 (= (apply!931 lt!470090 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)) (get!17037 (select (arr!32599 _values!955) #b00000000000000000000000000000000) (dynLambda!2046 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!129459 () Bool)

(assert (=> d!129459 e!608004))

(declare-fun res!711516 () Bool)

(assert (=> d!129459 (=> (not res!711516) (not e!608004))))

(assert (=> d!129459 (= res!711516 (not (contains!6285 lt!470090 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129459 (= lt!470090 e!608002)))

(declare-fun c!107790 () Bool)

(assert (=> d!129459 (= c!107790 (bvsge #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(assert (=> d!129459 (validMask!0 mask!1515)))

(assert (=> d!129459 (= (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470090)))

(declare-fun b!1066458 () Bool)

(assert (=> b!1066458 (= e!608002 (ListLongMap!14108 Nil!22700))))

(declare-fun bm!45075 () Bool)

(assert (=> bm!45075 (= call!45078 (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(assert (= (and d!129459 c!107790) b!1066458))

(assert (= (and d!129459 (not c!107790)) b!1066453))

(assert (= (and b!1066453 c!107793) b!1066455))

(assert (= (and b!1066453 (not c!107793)) b!1066452))

(assert (= (or b!1066455 b!1066452) bm!45075))

(assert (= (and d!129459 res!711516) b!1066454))

(assert (= (and b!1066454 res!711515) b!1066450))

(assert (= (and b!1066450 res!711517) b!1066451))

(assert (= (and b!1066450 c!107792) b!1066447))

(assert (= (and b!1066450 (not c!107792)) b!1066449))

(assert (= (and b!1066447 res!711518) b!1066457))

(assert (= (and b!1066449 c!107791) b!1066456))

(assert (= (and b!1066449 (not c!107791)) b!1066448))

(declare-fun b_lambda!16529 () Bool)

(assert (=> (not b_lambda!16529) (not b!1066455)))

(assert (=> b!1066455 t!32015))

(declare-fun b_and!34339 () Bool)

(assert (= b_and!34337 (and (=> t!32015 result!14717) b_and!34339)))

(declare-fun b_lambda!16531 () Bool)

(assert (=> (not b_lambda!16531) (not b!1066457)))

(assert (=> b!1066457 t!32015))

(declare-fun b_and!34341 () Bool)

(assert (= b_and!34339 (and (=> t!32015 result!14717) b_and!34341)))

(assert (=> b!1066447 m!985145))

(assert (=> b!1066447 m!985145))

(declare-fun m!985211 () Bool)

(assert (=> b!1066447 m!985211))

(assert (=> b!1066457 m!985155))

(assert (=> b!1066457 m!985155))

(assert (=> b!1066457 m!985157))

(assert (=> b!1066457 m!985159))

(assert (=> b!1066457 m!985157))

(assert (=> b!1066457 m!985145))

(assert (=> b!1066457 m!985145))

(declare-fun m!985213 () Bool)

(assert (=> b!1066457 m!985213))

(declare-fun m!985215 () Bool)

(assert (=> b!1066455 m!985215))

(assert (=> b!1066455 m!985155))

(assert (=> b!1066455 m!985157))

(assert (=> b!1066455 m!985159))

(assert (=> b!1066455 m!985157))

(assert (=> b!1066455 m!985145))

(assert (=> b!1066455 m!985155))

(declare-fun m!985217 () Bool)

(assert (=> b!1066455 m!985217))

(declare-fun m!985219 () Bool)

(assert (=> b!1066455 m!985219))

(assert (=> b!1066455 m!985217))

(declare-fun m!985221 () Bool)

(assert (=> b!1066455 m!985221))

(assert (=> b!1066453 m!985145))

(assert (=> b!1066453 m!985145))

(assert (=> b!1066453 m!985163))

(declare-fun m!985223 () Bool)

(assert (=> bm!45075 m!985223))

(assert (=> b!1066456 m!985223))

(declare-fun m!985225 () Bool)

(assert (=> d!129459 m!985225))

(assert (=> d!129459 m!985093))

(assert (=> b!1066451 m!985145))

(assert (=> b!1066451 m!985145))

(assert (=> b!1066451 m!985163))

(declare-fun m!985227 () Bool)

(assert (=> b!1066454 m!985227))

(declare-fun m!985229 () Bool)

(assert (=> b!1066448 m!985229))

(assert (=> b!1066277 d!129459))

(declare-fun b!1066459 () Bool)

(declare-fun e!608015 () Bool)

(declare-fun e!608010 () Bool)

(assert (=> b!1066459 (= e!608015 e!608010)))

(assert (=> b!1066459 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(declare-fun res!711522 () Bool)

(declare-fun lt!470097 () ListLongMap!14107)

(assert (=> b!1066459 (= res!711522 (contains!6285 lt!470097 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066459 (=> (not res!711522) (not e!608010))))

(declare-fun b!1066460 () Bool)

(declare-fun e!608014 () Bool)

(assert (=> b!1066460 (= e!608014 (isEmpty!944 lt!470097))))

(declare-fun b!1066461 () Bool)

(assert (=> b!1066461 (= e!608015 e!608014)))

(declare-fun c!107795 () Bool)

(assert (=> b!1066461 (= c!107795 (bvslt #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(declare-fun b!1066462 () Bool)

(declare-fun e!608011 () Bool)

(assert (=> b!1066462 (= e!608011 e!608015)))

(declare-fun c!107796 () Bool)

(declare-fun e!608012 () Bool)

(assert (=> b!1066462 (= c!107796 e!608012)))

(declare-fun res!711521 () Bool)

(assert (=> b!1066462 (=> (not res!711521) (not e!608012))))

(assert (=> b!1066462 (= res!711521 (bvslt #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(declare-fun b!1066463 () Bool)

(assert (=> b!1066463 (= e!608012 (validKeyInArray!0 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066463 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1066464 () Bool)

(declare-fun e!608013 () ListLongMap!14107)

(declare-fun call!45079 () ListLongMap!14107)

(assert (=> b!1066464 (= e!608013 call!45079)))

(declare-fun b!1066465 () Bool)

(declare-fun e!608009 () ListLongMap!14107)

(assert (=> b!1066465 (= e!608009 e!608013)))

(declare-fun c!107797 () Bool)

(assert (=> b!1066465 (= c!107797 (validKeyInArray!0 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066466 () Bool)

(declare-fun res!711519 () Bool)

(assert (=> b!1066466 (=> (not res!711519) (not e!608011))))

(assert (=> b!1066466 (= res!711519 (not (contains!6285 lt!470097 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1066467 () Bool)

(declare-fun lt!470101 () Unit!34931)

(declare-fun lt!470099 () Unit!34931)

(assert (=> b!1066467 (= lt!470101 lt!470099)))

(declare-fun lt!470096 () (_ BitVec 64))

(declare-fun lt!470102 () ListLongMap!14107)

(declare-fun lt!470100 () V!38977)

(declare-fun lt!470098 () (_ BitVec 64))

(assert (=> b!1066467 (not (contains!6285 (+!3142 lt!470102 (tuple2!16131 lt!470098 lt!470100)) lt!470096))))

(assert (=> b!1066467 (= lt!470099 (addStillNotContains!252 lt!470102 lt!470098 lt!470100 lt!470096))))

(assert (=> b!1066467 (= lt!470096 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1066467 (= lt!470100 (get!17037 (select (arr!32599 _values!955) #b00000000000000000000000000000000) (dynLambda!2046 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1066467 (= lt!470098 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1066467 (= lt!470102 call!45079)))

(assert (=> b!1066467 (= e!608013 (+!3142 call!45079 (tuple2!16131 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000) (get!17037 (select (arr!32599 _values!955) #b00000000000000000000000000000000) (dynLambda!2046 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1066468 () Bool)

(assert (=> b!1066468 (= e!608014 (= lt!470097 (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1066469 () Bool)

(assert (=> b!1066469 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(assert (=> b!1066469 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33136 _values!955)))))

(assert (=> b!1066469 (= e!608010 (= (apply!931 lt!470097 (select (arr!32598 _keys!1163) #b00000000000000000000000000000000)) (get!17037 (select (arr!32599 _values!955) #b00000000000000000000000000000000) (dynLambda!2046 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!129461 () Bool)

(assert (=> d!129461 e!608011))

(declare-fun res!711520 () Bool)

(assert (=> d!129461 (=> (not res!711520) (not e!608011))))

(assert (=> d!129461 (= res!711520 (not (contains!6285 lt!470097 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129461 (= lt!470097 e!608009)))

(declare-fun c!107794 () Bool)

(assert (=> d!129461 (= c!107794 (bvsge #b00000000000000000000000000000000 (size!33135 _keys!1163)))))

(assert (=> d!129461 (validMask!0 mask!1515)))

(assert (=> d!129461 (= (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470097)))

(declare-fun b!1066470 () Bool)

(assert (=> b!1066470 (= e!608009 (ListLongMap!14108 Nil!22700))))

(declare-fun bm!45076 () Bool)

(assert (=> bm!45076 (= call!45079 (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(assert (= (and d!129461 c!107794) b!1066470))

(assert (= (and d!129461 (not c!107794)) b!1066465))

(assert (= (and b!1066465 c!107797) b!1066467))

(assert (= (and b!1066465 (not c!107797)) b!1066464))

(assert (= (or b!1066467 b!1066464) bm!45076))

(assert (= (and d!129461 res!711520) b!1066466))

(assert (= (and b!1066466 res!711519) b!1066462))

(assert (= (and b!1066462 res!711521) b!1066463))

(assert (= (and b!1066462 c!107796) b!1066459))

(assert (= (and b!1066462 (not c!107796)) b!1066461))

(assert (= (and b!1066459 res!711522) b!1066469))

(assert (= (and b!1066461 c!107795) b!1066468))

(assert (= (and b!1066461 (not c!107795)) b!1066460))

(declare-fun b_lambda!16533 () Bool)

(assert (=> (not b_lambda!16533) (not b!1066467)))

(assert (=> b!1066467 t!32015))

(declare-fun b_and!34343 () Bool)

(assert (= b_and!34341 (and (=> t!32015 result!14717) b_and!34343)))

(declare-fun b_lambda!16535 () Bool)

(assert (=> (not b_lambda!16535) (not b!1066469)))

(assert (=> b!1066469 t!32015))

(declare-fun b_and!34345 () Bool)

(assert (= b_and!34343 (and (=> t!32015 result!14717) b_and!34345)))

(assert (=> b!1066459 m!985145))

(assert (=> b!1066459 m!985145))

(declare-fun m!985231 () Bool)

(assert (=> b!1066459 m!985231))

(assert (=> b!1066469 m!985155))

(assert (=> b!1066469 m!985155))

(assert (=> b!1066469 m!985157))

(assert (=> b!1066469 m!985159))

(assert (=> b!1066469 m!985157))

(assert (=> b!1066469 m!985145))

(assert (=> b!1066469 m!985145))

(declare-fun m!985233 () Bool)

(assert (=> b!1066469 m!985233))

(declare-fun m!985235 () Bool)

(assert (=> b!1066467 m!985235))

(assert (=> b!1066467 m!985155))

(assert (=> b!1066467 m!985157))

(assert (=> b!1066467 m!985159))

(assert (=> b!1066467 m!985157))

(assert (=> b!1066467 m!985145))

(assert (=> b!1066467 m!985155))

(declare-fun m!985237 () Bool)

(assert (=> b!1066467 m!985237))

(declare-fun m!985239 () Bool)

(assert (=> b!1066467 m!985239))

(assert (=> b!1066467 m!985237))

(declare-fun m!985241 () Bool)

(assert (=> b!1066467 m!985241))

(assert (=> b!1066465 m!985145))

(assert (=> b!1066465 m!985145))

(assert (=> b!1066465 m!985163))

(declare-fun m!985243 () Bool)

(assert (=> bm!45076 m!985243))

(assert (=> b!1066468 m!985243))

(declare-fun m!985245 () Bool)

(assert (=> d!129461 m!985245))

(assert (=> d!129461 m!985093))

(assert (=> b!1066463 m!985145))

(assert (=> b!1066463 m!985145))

(assert (=> b!1066463 m!985163))

(declare-fun m!985247 () Bool)

(assert (=> b!1066466 m!985247))

(declare-fun m!985249 () Bool)

(assert (=> b!1066460 m!985249))

(assert (=> b!1066277 d!129461))

(declare-fun mapNonEmpty!39763 () Bool)

(declare-fun mapRes!39763 () Bool)

(declare-fun tp!76163 () Bool)

(declare-fun e!608020 () Bool)

(assert (=> mapNonEmpty!39763 (= mapRes!39763 (and tp!76163 e!608020))))

(declare-fun mapRest!39763 () (Array (_ BitVec 32) ValueCell!11987))

(declare-fun mapValue!39763 () ValueCell!11987)

(declare-fun mapKey!39763 () (_ BitVec 32))

(assert (=> mapNonEmpty!39763 (= mapRest!39754 (store mapRest!39763 mapKey!39763 mapValue!39763))))

(declare-fun b!1066477 () Bool)

(assert (=> b!1066477 (= e!608020 tp_is_empty!25381)))

(declare-fun mapIsEmpty!39763 () Bool)

(assert (=> mapIsEmpty!39763 mapRes!39763))

(declare-fun b!1066478 () Bool)

(declare-fun e!608021 () Bool)

(assert (=> b!1066478 (= e!608021 tp_is_empty!25381)))

(declare-fun condMapEmpty!39763 () Bool)

(declare-fun mapDefault!39763 () ValueCell!11987)

(assert (=> mapNonEmpty!39754 (= condMapEmpty!39763 (= mapRest!39754 ((as const (Array (_ BitVec 32) ValueCell!11987)) mapDefault!39763)))))

(assert (=> mapNonEmpty!39754 (= tp!76148 (and e!608021 mapRes!39763))))

(assert (= (and mapNonEmpty!39754 condMapEmpty!39763) mapIsEmpty!39763))

(assert (= (and mapNonEmpty!39754 (not condMapEmpty!39763)) mapNonEmpty!39763))

(assert (= (and mapNonEmpty!39763 ((_ is ValueCellFull!11987) mapValue!39763)) b!1066477))

(assert (= (and mapNonEmpty!39754 ((_ is ValueCellFull!11987) mapDefault!39763)) b!1066478))

(declare-fun m!985251 () Bool)

(assert (=> mapNonEmpty!39763 m!985251))

(declare-fun b_lambda!16537 () Bool)

(assert (= b_lambda!16529 (or (and start!94406 b_free!21571) b_lambda!16537)))

(declare-fun b_lambda!16539 () Bool)

(assert (= b_lambda!16527 (or (and start!94406 b_free!21571) b_lambda!16539)))

(declare-fun b_lambda!16541 () Bool)

(assert (= b_lambda!16535 (or (and start!94406 b_free!21571) b_lambda!16541)))

(declare-fun b_lambda!16543 () Bool)

(assert (= b_lambda!16531 (or (and start!94406 b_free!21571) b_lambda!16543)))

(declare-fun b_lambda!16545 () Bool)

(assert (= b_lambda!16533 (or (and start!94406 b_free!21571) b_lambda!16545)))

(check-sat (not b!1066467) (not bm!45061) (not b!1066374) (not b!1066421) (not b!1066460) (not b_lambda!16539) (not b!1066456) (not b!1066406) (not b!1066454) (not bm!45069) (not b_next!21571) (not bm!45060) (not b!1066377) (not b!1066451) (not bm!45066) (not b!1066455) (not b!1066453) (not d!129461) (not d!129445) (not d!129459) (not b!1066393) (not b!1066459) (not b_lambda!16541) (not b!1066469) (not mapNonEmpty!39763) (not b!1066380) (not b!1066468) b_and!34345 (not b!1066448) (not b!1066420) (not d!129457) tp_is_empty!25381 (not b!1066457) (not b_lambda!16543) (not b!1066383) (not b!1066465) (not b!1066410) (not b_lambda!16537) (not bm!45075) (not bm!45072) (not b!1066378) (not b!1066466) (not b!1066463) (not bm!45076) (not bm!45063) (not b!1066387) (not b!1066447) (not b!1066376) (not b!1066409) (not b_lambda!16545))
(check-sat b_and!34345 (not b_next!21571))
