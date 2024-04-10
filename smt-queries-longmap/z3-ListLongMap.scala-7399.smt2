; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94172 () Bool)

(assert start!94172)

(declare-fun b_free!21573 () Bool)

(declare-fun b_next!21573 () Bool)

(assert (=> start!94172 (= b_free!21573 (not b_next!21573))))

(declare-fun tp!76154 () Bool)

(declare-fun b_and!34323 () Bool)

(assert (=> start!94172 (= tp!76154 b_and!34323)))

(declare-fun b!1064972 () Bool)

(declare-fun e!607054 () Bool)

(declare-datatypes ((array!67751 0))(
  ( (array!67752 (arr!32579 (Array (_ BitVec 32) (_ BitVec 64))) (size!33115 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67751)

(assert (=> b!1064972 (= e!607054 (bvsle #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38979 0))(
  ( (V!38980 (val!12742 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38979)

(declare-datatypes ((ValueCell!11988 0))(
  ( (ValueCellFull!11988 (v!15354 V!38979)) (EmptyCell!11988) )
))
(declare-datatypes ((array!67753 0))(
  ( (array!67754 (arr!32580 (Array (_ BitVec 32) ValueCell!11988)) (size!33116 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67753)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38979)

(declare-datatypes ((tuple2!16144 0))(
  ( (tuple2!16145 (_1!8083 (_ BitVec 64)) (_2!8083 V!38979)) )
))
(declare-datatypes ((List!22712 0))(
  ( (Nil!22709) (Cons!22708 (h!23917 tuple2!16144) (t!32029 List!22712)) )
))
(declare-datatypes ((ListLongMap!14113 0))(
  ( (ListLongMap!14114 (toList!7072 List!22712)) )
))
(declare-fun lt!469466 () ListLongMap!14113)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4032 (array!67751 array!67753 (_ BitVec 32) (_ BitVec 32) V!38979 V!38979 (_ BitVec 32) Int) ListLongMap!14113)

(assert (=> b!1064972 (= lt!469466 (getCurrentListMap!4032 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064973 () Bool)

(declare-fun e!607049 () Bool)

(declare-fun tp_is_empty!25383 () Bool)

(assert (=> b!1064973 (= e!607049 tp_is_empty!25383)))

(declare-fun b!1064974 () Bool)

(declare-fun e!607051 () Bool)

(assert (=> b!1064974 (= e!607051 tp_is_empty!25383)))

(declare-fun b!1064975 () Bool)

(declare-fun e!607050 () Bool)

(declare-fun mapRes!39757 () Bool)

(assert (=> b!1064975 (= e!607050 (and e!607049 mapRes!39757))))

(declare-fun condMapEmpty!39757 () Bool)

(declare-fun mapDefault!39757 () ValueCell!11988)

(assert (=> b!1064975 (= condMapEmpty!39757 (= (arr!32580 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11988)) mapDefault!39757)))))

(declare-fun res!710927 () Bool)

(declare-fun e!607053 () Bool)

(assert (=> start!94172 (=> (not res!710927) (not e!607053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94172 (= res!710927 (validMask!0 mask!1515))))

(assert (=> start!94172 e!607053))

(assert (=> start!94172 true))

(assert (=> start!94172 tp_is_empty!25383))

(declare-fun array_inv!25228 (array!67753) Bool)

(assert (=> start!94172 (and (array_inv!25228 _values!955) e!607050)))

(assert (=> start!94172 tp!76154))

(declare-fun array_inv!25229 (array!67751) Bool)

(assert (=> start!94172 (array_inv!25229 _keys!1163)))

(declare-fun b!1064976 () Bool)

(declare-fun res!710923 () Bool)

(assert (=> b!1064976 (=> (not res!710923) (not e!607053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67751 (_ BitVec 32)) Bool)

(assert (=> b!1064976 (= res!710923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39757 () Bool)

(declare-fun tp!76153 () Bool)

(assert (=> mapNonEmpty!39757 (= mapRes!39757 (and tp!76153 e!607051))))

(declare-fun mapKey!39757 () (_ BitVec 32))

(declare-fun mapValue!39757 () ValueCell!11988)

(declare-fun mapRest!39757 () (Array (_ BitVec 32) ValueCell!11988))

(assert (=> mapNonEmpty!39757 (= (arr!32580 _values!955) (store mapRest!39757 mapKey!39757 mapValue!39757))))

(declare-fun b!1064977 () Bool)

(declare-fun res!710924 () Bool)

(assert (=> b!1064977 (=> (not res!710924) (not e!607053))))

(declare-datatypes ((List!22713 0))(
  ( (Nil!22710) (Cons!22709 (h!23918 (_ BitVec 64)) (t!32030 List!22713)) )
))
(declare-fun arrayNoDuplicates!0 (array!67751 (_ BitVec 32) List!22713) Bool)

(assert (=> b!1064977 (= res!710924 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22710))))

(declare-fun b!1064978 () Bool)

(assert (=> b!1064978 (= e!607053 (not e!607054))))

(declare-fun res!710925 () Bool)

(assert (=> b!1064978 (=> res!710925 e!607054)))

(assert (=> b!1064978 (= res!710925 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469468 () ListLongMap!14113)

(declare-fun lt!469467 () ListLongMap!14113)

(assert (=> b!1064978 (= lt!469468 lt!469467)))

(declare-datatypes ((Unit!34938 0))(
  ( (Unit!34939) )
))
(declare-fun lt!469469 () Unit!34938)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38979)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!698 (array!67751 array!67753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38979 V!38979 V!38979 V!38979 (_ BitVec 32) Int) Unit!34938)

(assert (=> b!1064978 (= lt!469469 (lemmaNoChangeToArrayThenSameMapNoExtras!698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3661 (array!67751 array!67753 (_ BitVec 32) (_ BitVec 32) V!38979 V!38979 (_ BitVec 32) Int) ListLongMap!14113)

(assert (=> b!1064978 (= lt!469467 (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064978 (= lt!469468 (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39757 () Bool)

(assert (=> mapIsEmpty!39757 mapRes!39757))

(declare-fun b!1064979 () Bool)

(declare-fun res!710926 () Bool)

(assert (=> b!1064979 (=> (not res!710926) (not e!607053))))

(assert (=> b!1064979 (= res!710926 (and (= (size!33116 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33115 _keys!1163) (size!33116 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94172 res!710927) b!1064979))

(assert (= (and b!1064979 res!710926) b!1064976))

(assert (= (and b!1064976 res!710923) b!1064977))

(assert (= (and b!1064977 res!710924) b!1064978))

(assert (= (and b!1064978 (not res!710925)) b!1064972))

(assert (= (and b!1064975 condMapEmpty!39757) mapIsEmpty!39757))

(assert (= (and b!1064975 (not condMapEmpty!39757)) mapNonEmpty!39757))

(get-info :version)

(assert (= (and mapNonEmpty!39757 ((_ is ValueCellFull!11988) mapValue!39757)) b!1064974))

(assert (= (and b!1064975 ((_ is ValueCellFull!11988) mapDefault!39757)) b!1064973))

(assert (= start!94172 b!1064975))

(declare-fun m!983429 () Bool)

(assert (=> b!1064972 m!983429))

(declare-fun m!983431 () Bool)

(assert (=> start!94172 m!983431))

(declare-fun m!983433 () Bool)

(assert (=> start!94172 m!983433))

(declare-fun m!983435 () Bool)

(assert (=> start!94172 m!983435))

(declare-fun m!983437 () Bool)

(assert (=> b!1064976 m!983437))

(declare-fun m!983439 () Bool)

(assert (=> b!1064977 m!983439))

(declare-fun m!983441 () Bool)

(assert (=> mapNonEmpty!39757 m!983441))

(declare-fun m!983443 () Bool)

(assert (=> b!1064978 m!983443))

(declare-fun m!983445 () Bool)

(assert (=> b!1064978 m!983445))

(declare-fun m!983447 () Bool)

(assert (=> b!1064978 m!983447))

(check-sat (not b!1064972) (not start!94172) (not mapNonEmpty!39757) (not b!1064976) b_and!34323 tp_is_empty!25383 (not b!1064978) (not b_next!21573) (not b!1064977))
(check-sat b_and!34323 (not b_next!21573))
(get-model)

(declare-fun b!1065014 () Bool)

(declare-fun e!607084 () Bool)

(declare-fun call!44984 () Bool)

(assert (=> b!1065014 (= e!607084 call!44984)))

(declare-fun b!1065015 () Bool)

(declare-fun e!607082 () Bool)

(assert (=> b!1065015 (= e!607082 e!607084)))

(declare-fun c!107350 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1065015 (= c!107350 (validKeyInArray!0 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!128981 () Bool)

(declare-fun res!710951 () Bool)

(declare-fun e!607083 () Bool)

(assert (=> d!128981 (=> res!710951 e!607083)))

(assert (=> d!128981 (= res!710951 (bvsge #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(assert (=> d!128981 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22710) e!607083)))

(declare-fun bm!44981 () Bool)

(assert (=> bm!44981 (= call!44984 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107350 (Cons!22709 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000) Nil!22710) Nil!22710)))))

(declare-fun b!1065016 () Bool)

(declare-fun e!607081 () Bool)

(declare-fun contains!6264 (List!22713 (_ BitVec 64)) Bool)

(assert (=> b!1065016 (= e!607081 (contains!6264 Nil!22710 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065017 () Bool)

(assert (=> b!1065017 (= e!607083 e!607082)))

(declare-fun res!710950 () Bool)

(assert (=> b!1065017 (=> (not res!710950) (not e!607082))))

(assert (=> b!1065017 (= res!710950 (not e!607081))))

(declare-fun res!710949 () Bool)

(assert (=> b!1065017 (=> (not res!710949) (not e!607081))))

(assert (=> b!1065017 (= res!710949 (validKeyInArray!0 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065018 () Bool)

(assert (=> b!1065018 (= e!607084 call!44984)))

(assert (= (and d!128981 (not res!710951)) b!1065017))

(assert (= (and b!1065017 res!710949) b!1065016))

(assert (= (and b!1065017 res!710950) b!1065015))

(assert (= (and b!1065015 c!107350) b!1065018))

(assert (= (and b!1065015 (not c!107350)) b!1065014))

(assert (= (or b!1065018 b!1065014) bm!44981))

(declare-fun m!983469 () Bool)

(assert (=> b!1065015 m!983469))

(assert (=> b!1065015 m!983469))

(declare-fun m!983471 () Bool)

(assert (=> b!1065015 m!983471))

(assert (=> bm!44981 m!983469))

(declare-fun m!983473 () Bool)

(assert (=> bm!44981 m!983473))

(assert (=> b!1065016 m!983469))

(assert (=> b!1065016 m!983469))

(declare-fun m!983475 () Bool)

(assert (=> b!1065016 m!983475))

(assert (=> b!1065017 m!983469))

(assert (=> b!1065017 m!983469))

(assert (=> b!1065017 m!983471))

(assert (=> b!1064977 d!128981))

(declare-fun d!128983 () Bool)

(assert (=> d!128983 (= (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469484 () Unit!34938)

(declare-fun choose!1729 (array!67751 array!67753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38979 V!38979 V!38979 V!38979 (_ BitVec 32) Int) Unit!34938)

(assert (=> d!128983 (= lt!469484 (choose!1729 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!128983 (validMask!0 mask!1515)))

(assert (=> d!128983 (= (lemmaNoChangeToArrayThenSameMapNoExtras!698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469484)))

(declare-fun bs!31329 () Bool)

(assert (= bs!31329 d!128983))

(assert (=> bs!31329 m!983447))

(assert (=> bs!31329 m!983445))

(declare-fun m!983477 () Bool)

(assert (=> bs!31329 m!983477))

(assert (=> bs!31329 m!983431))

(assert (=> b!1064978 d!128983))

(declare-fun b!1065043 () Bool)

(declare-fun e!607101 () ListLongMap!14113)

(declare-fun e!607100 () ListLongMap!14113)

(assert (=> b!1065043 (= e!607101 e!607100)))

(declare-fun c!107359 () Bool)

(assert (=> b!1065043 (= c!107359 (validKeyInArray!0 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065045 () Bool)

(declare-fun call!44987 () ListLongMap!14113)

(assert (=> b!1065045 (= e!607100 call!44987)))

(declare-fun b!1065046 () Bool)

(declare-fun e!607104 () Bool)

(declare-fun e!607105 () Bool)

(assert (=> b!1065046 (= e!607104 e!607105)))

(declare-fun c!107362 () Bool)

(declare-fun e!607103 () Bool)

(assert (=> b!1065046 (= c!107362 e!607103)))

(declare-fun res!710961 () Bool)

(assert (=> b!1065046 (=> (not res!710961) (not e!607103))))

(assert (=> b!1065046 (= res!710961 (bvslt #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(declare-fun b!1065047 () Bool)

(declare-fun lt!469499 () Unit!34938)

(declare-fun lt!469501 () Unit!34938)

(assert (=> b!1065047 (= lt!469499 lt!469501)))

(declare-fun lt!469502 () (_ BitVec 64))

(declare-fun lt!469503 () ListLongMap!14113)

(declare-fun lt!469505 () V!38979)

(declare-fun lt!469500 () (_ BitVec 64))

(declare-fun contains!6265 (ListLongMap!14113 (_ BitVec 64)) Bool)

(declare-fun +!3120 (ListLongMap!14113 tuple2!16144) ListLongMap!14113)

(assert (=> b!1065047 (not (contains!6265 (+!3120 lt!469503 (tuple2!16145 lt!469502 lt!469505)) lt!469500))))

(declare-fun addStillNotContains!250 (ListLongMap!14113 (_ BitVec 64) V!38979 (_ BitVec 64)) Unit!34938)

(assert (=> b!1065047 (= lt!469501 (addStillNotContains!250 lt!469503 lt!469502 lt!469505 lt!469500))))

(assert (=> b!1065047 (= lt!469500 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17008 (ValueCell!11988 V!38979) V!38979)

(declare-fun dynLambda!2029 (Int (_ BitVec 64)) V!38979)

(assert (=> b!1065047 (= lt!469505 (get!17008 (select (arr!32580 _values!955) #b00000000000000000000000000000000) (dynLambda!2029 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1065047 (= lt!469502 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1065047 (= lt!469503 call!44987)))

(assert (=> b!1065047 (= e!607100 (+!3120 call!44987 (tuple2!16145 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000) (get!17008 (select (arr!32580 _values!955) #b00000000000000000000000000000000) (dynLambda!2029 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1065048 () Bool)

(assert (=> b!1065048 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(assert (=> b!1065048 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33116 _values!955)))))

(declare-fun e!607099 () Bool)

(declare-fun lt!469504 () ListLongMap!14113)

(declare-fun apply!922 (ListLongMap!14113 (_ BitVec 64)) V!38979)

(assert (=> b!1065048 (= e!607099 (= (apply!922 lt!469504 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)) (get!17008 (select (arr!32580 _values!955) #b00000000000000000000000000000000) (dynLambda!2029 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1065049 () Bool)

(assert (=> b!1065049 (= e!607101 (ListLongMap!14114 Nil!22709))))

(declare-fun b!1065050 () Bool)

(declare-fun e!607102 () Bool)

(assert (=> b!1065050 (= e!607105 e!607102)))

(declare-fun c!107361 () Bool)

(assert (=> b!1065050 (= c!107361 (bvslt #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(declare-fun b!1065051 () Bool)

(declare-fun isEmpty!940 (ListLongMap!14113) Bool)

(assert (=> b!1065051 (= e!607102 (isEmpty!940 lt!469504))))

(declare-fun bm!44984 () Bool)

(assert (=> bm!44984 (= call!44987 (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1065052 () Bool)

(assert (=> b!1065052 (= e!607103 (validKeyInArray!0 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065052 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1065053 () Bool)

(assert (=> b!1065053 (= e!607105 e!607099)))

(assert (=> b!1065053 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(declare-fun res!710962 () Bool)

(assert (=> b!1065053 (= res!710962 (contains!6265 lt!469504 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065053 (=> (not res!710962) (not e!607099))))

(declare-fun b!1065054 () Bool)

(assert (=> b!1065054 (= e!607102 (= lt!469504 (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun d!128985 () Bool)

(assert (=> d!128985 e!607104))

(declare-fun res!710960 () Bool)

(assert (=> d!128985 (=> (not res!710960) (not e!607104))))

(assert (=> d!128985 (= res!710960 (not (contains!6265 lt!469504 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128985 (= lt!469504 e!607101)))

(declare-fun c!107360 () Bool)

(assert (=> d!128985 (= c!107360 (bvsge #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(assert (=> d!128985 (validMask!0 mask!1515)))

(assert (=> d!128985 (= (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469504)))

(declare-fun b!1065044 () Bool)

(declare-fun res!710963 () Bool)

(assert (=> b!1065044 (=> (not res!710963) (not e!607104))))

(assert (=> b!1065044 (= res!710963 (not (contains!6265 lt!469504 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!128985 c!107360) b!1065049))

(assert (= (and d!128985 (not c!107360)) b!1065043))

(assert (= (and b!1065043 c!107359) b!1065047))

(assert (= (and b!1065043 (not c!107359)) b!1065045))

(assert (= (or b!1065047 b!1065045) bm!44984))

(assert (= (and d!128985 res!710960) b!1065044))

(assert (= (and b!1065044 res!710963) b!1065046))

(assert (= (and b!1065046 res!710961) b!1065052))

(assert (= (and b!1065046 c!107362) b!1065053))

(assert (= (and b!1065046 (not c!107362)) b!1065050))

(assert (= (and b!1065053 res!710962) b!1065048))

(assert (= (and b!1065050 c!107361) b!1065054))

(assert (= (and b!1065050 (not c!107361)) b!1065051))

(declare-fun b_lambda!16517 () Bool)

(assert (=> (not b_lambda!16517) (not b!1065047)))

(declare-fun t!32034 () Bool)

(declare-fun tb!7139 () Bool)

(assert (=> (and start!94172 (= defaultEntry!963 defaultEntry!963) t!32034) tb!7139))

(declare-fun result!14725 () Bool)

(assert (=> tb!7139 (= result!14725 tp_is_empty!25383)))

(assert (=> b!1065047 t!32034))

(declare-fun b_and!34327 () Bool)

(assert (= b_and!34323 (and (=> t!32034 result!14725) b_and!34327)))

(declare-fun b_lambda!16519 () Bool)

(assert (=> (not b_lambda!16519) (not b!1065048)))

(assert (=> b!1065048 t!32034))

(declare-fun b_and!34329 () Bool)

(assert (= b_and!34327 (and (=> t!32034 result!14725) b_and!34329)))

(declare-fun m!983479 () Bool)

(assert (=> b!1065051 m!983479))

(assert (=> b!1065053 m!983469))

(assert (=> b!1065053 m!983469))

(declare-fun m!983481 () Bool)

(assert (=> b!1065053 m!983481))

(assert (=> b!1065052 m!983469))

(assert (=> b!1065052 m!983469))

(assert (=> b!1065052 m!983471))

(declare-fun m!983483 () Bool)

(assert (=> b!1065048 m!983483))

(declare-fun m!983485 () Bool)

(assert (=> b!1065048 m!983485))

(declare-fun m!983487 () Bool)

(assert (=> b!1065048 m!983487))

(assert (=> b!1065048 m!983483))

(assert (=> b!1065048 m!983469))

(assert (=> b!1065048 m!983469))

(declare-fun m!983489 () Bool)

(assert (=> b!1065048 m!983489))

(assert (=> b!1065048 m!983485))

(declare-fun m!983491 () Bool)

(assert (=> b!1065044 m!983491))

(declare-fun m!983493 () Bool)

(assert (=> d!128985 m!983493))

(assert (=> d!128985 m!983431))

(declare-fun m!983495 () Bool)

(assert (=> b!1065054 m!983495))

(declare-fun m!983497 () Bool)

(assert (=> b!1065047 m!983497))

(declare-fun m!983499 () Bool)

(assert (=> b!1065047 m!983499))

(assert (=> b!1065047 m!983485))

(assert (=> b!1065047 m!983483))

(assert (=> b!1065047 m!983469))

(declare-fun m!983501 () Bool)

(assert (=> b!1065047 m!983501))

(declare-fun m!983503 () Bool)

(assert (=> b!1065047 m!983503))

(assert (=> b!1065047 m!983483))

(assert (=> b!1065047 m!983485))

(assert (=> b!1065047 m!983487))

(assert (=> b!1065047 m!983497))

(assert (=> b!1065043 m!983469))

(assert (=> b!1065043 m!983469))

(assert (=> b!1065043 m!983471))

(assert (=> bm!44984 m!983495))

(assert (=> b!1064978 d!128985))

(declare-fun b!1065057 () Bool)

(declare-fun e!607108 () ListLongMap!14113)

(declare-fun e!607107 () ListLongMap!14113)

(assert (=> b!1065057 (= e!607108 e!607107)))

(declare-fun c!107363 () Bool)

(assert (=> b!1065057 (= c!107363 (validKeyInArray!0 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065059 () Bool)

(declare-fun call!44988 () ListLongMap!14113)

(assert (=> b!1065059 (= e!607107 call!44988)))

(declare-fun b!1065060 () Bool)

(declare-fun e!607111 () Bool)

(declare-fun e!607112 () Bool)

(assert (=> b!1065060 (= e!607111 e!607112)))

(declare-fun c!107366 () Bool)

(declare-fun e!607110 () Bool)

(assert (=> b!1065060 (= c!107366 e!607110)))

(declare-fun res!710965 () Bool)

(assert (=> b!1065060 (=> (not res!710965) (not e!607110))))

(assert (=> b!1065060 (= res!710965 (bvslt #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(declare-fun b!1065061 () Bool)

(declare-fun lt!469506 () Unit!34938)

(declare-fun lt!469508 () Unit!34938)

(assert (=> b!1065061 (= lt!469506 lt!469508)))

(declare-fun lt!469509 () (_ BitVec 64))

(declare-fun lt!469510 () ListLongMap!14113)

(declare-fun lt!469507 () (_ BitVec 64))

(declare-fun lt!469512 () V!38979)

(assert (=> b!1065061 (not (contains!6265 (+!3120 lt!469510 (tuple2!16145 lt!469509 lt!469512)) lt!469507))))

(assert (=> b!1065061 (= lt!469508 (addStillNotContains!250 lt!469510 lt!469509 lt!469512 lt!469507))))

(assert (=> b!1065061 (= lt!469507 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1065061 (= lt!469512 (get!17008 (select (arr!32580 _values!955) #b00000000000000000000000000000000) (dynLambda!2029 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1065061 (= lt!469509 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1065061 (= lt!469510 call!44988)))

(assert (=> b!1065061 (= e!607107 (+!3120 call!44988 (tuple2!16145 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000) (get!17008 (select (arr!32580 _values!955) #b00000000000000000000000000000000) (dynLambda!2029 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1065062 () Bool)

(assert (=> b!1065062 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(assert (=> b!1065062 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33116 _values!955)))))

(declare-fun lt!469511 () ListLongMap!14113)

(declare-fun e!607106 () Bool)

(assert (=> b!1065062 (= e!607106 (= (apply!922 lt!469511 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)) (get!17008 (select (arr!32580 _values!955) #b00000000000000000000000000000000) (dynLambda!2029 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1065063 () Bool)

(assert (=> b!1065063 (= e!607108 (ListLongMap!14114 Nil!22709))))

(declare-fun b!1065064 () Bool)

(declare-fun e!607109 () Bool)

(assert (=> b!1065064 (= e!607112 e!607109)))

(declare-fun c!107365 () Bool)

(assert (=> b!1065064 (= c!107365 (bvslt #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(declare-fun b!1065065 () Bool)

(assert (=> b!1065065 (= e!607109 (isEmpty!940 lt!469511))))

(declare-fun bm!44985 () Bool)

(assert (=> bm!44985 (= call!44988 (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1065066 () Bool)

(assert (=> b!1065066 (= e!607110 (validKeyInArray!0 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065066 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1065067 () Bool)

(assert (=> b!1065067 (= e!607112 e!607106)))

(assert (=> b!1065067 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(declare-fun res!710966 () Bool)

(assert (=> b!1065067 (= res!710966 (contains!6265 lt!469511 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065067 (=> (not res!710966) (not e!607106))))

(declare-fun b!1065068 () Bool)

(assert (=> b!1065068 (= e!607109 (= lt!469511 (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun d!128987 () Bool)

(assert (=> d!128987 e!607111))

(declare-fun res!710964 () Bool)

(assert (=> d!128987 (=> (not res!710964) (not e!607111))))

(assert (=> d!128987 (= res!710964 (not (contains!6265 lt!469511 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128987 (= lt!469511 e!607108)))

(declare-fun c!107364 () Bool)

(assert (=> d!128987 (= c!107364 (bvsge #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(assert (=> d!128987 (validMask!0 mask!1515)))

(assert (=> d!128987 (= (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469511)))

(declare-fun b!1065058 () Bool)

(declare-fun res!710967 () Bool)

(assert (=> b!1065058 (=> (not res!710967) (not e!607111))))

(assert (=> b!1065058 (= res!710967 (not (contains!6265 lt!469511 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!128987 c!107364) b!1065063))

(assert (= (and d!128987 (not c!107364)) b!1065057))

(assert (= (and b!1065057 c!107363) b!1065061))

(assert (= (and b!1065057 (not c!107363)) b!1065059))

(assert (= (or b!1065061 b!1065059) bm!44985))

(assert (= (and d!128987 res!710964) b!1065058))

(assert (= (and b!1065058 res!710967) b!1065060))

(assert (= (and b!1065060 res!710965) b!1065066))

(assert (= (and b!1065060 c!107366) b!1065067))

(assert (= (and b!1065060 (not c!107366)) b!1065064))

(assert (= (and b!1065067 res!710966) b!1065062))

(assert (= (and b!1065064 c!107365) b!1065068))

(assert (= (and b!1065064 (not c!107365)) b!1065065))

(declare-fun b_lambda!16521 () Bool)

(assert (=> (not b_lambda!16521) (not b!1065061)))

(assert (=> b!1065061 t!32034))

(declare-fun b_and!34331 () Bool)

(assert (= b_and!34329 (and (=> t!32034 result!14725) b_and!34331)))

(declare-fun b_lambda!16523 () Bool)

(assert (=> (not b_lambda!16523) (not b!1065062)))

(assert (=> b!1065062 t!32034))

(declare-fun b_and!34333 () Bool)

(assert (= b_and!34331 (and (=> t!32034 result!14725) b_and!34333)))

(declare-fun m!983505 () Bool)

(assert (=> b!1065065 m!983505))

(assert (=> b!1065067 m!983469))

(assert (=> b!1065067 m!983469))

(declare-fun m!983507 () Bool)

(assert (=> b!1065067 m!983507))

(assert (=> b!1065066 m!983469))

(assert (=> b!1065066 m!983469))

(assert (=> b!1065066 m!983471))

(assert (=> b!1065062 m!983483))

(assert (=> b!1065062 m!983485))

(assert (=> b!1065062 m!983487))

(assert (=> b!1065062 m!983483))

(assert (=> b!1065062 m!983469))

(assert (=> b!1065062 m!983469))

(declare-fun m!983509 () Bool)

(assert (=> b!1065062 m!983509))

(assert (=> b!1065062 m!983485))

(declare-fun m!983511 () Bool)

(assert (=> b!1065058 m!983511))

(declare-fun m!983513 () Bool)

(assert (=> d!128987 m!983513))

(assert (=> d!128987 m!983431))

(declare-fun m!983515 () Bool)

(assert (=> b!1065068 m!983515))

(declare-fun m!983517 () Bool)

(assert (=> b!1065061 m!983517))

(declare-fun m!983519 () Bool)

(assert (=> b!1065061 m!983519))

(assert (=> b!1065061 m!983485))

(assert (=> b!1065061 m!983483))

(assert (=> b!1065061 m!983469))

(declare-fun m!983521 () Bool)

(assert (=> b!1065061 m!983521))

(declare-fun m!983523 () Bool)

(assert (=> b!1065061 m!983523))

(assert (=> b!1065061 m!983483))

(assert (=> b!1065061 m!983485))

(assert (=> b!1065061 m!983487))

(assert (=> b!1065061 m!983517))

(assert (=> b!1065057 m!983469))

(assert (=> b!1065057 m!983469))

(assert (=> b!1065057 m!983471))

(assert (=> bm!44985 m!983515))

(assert (=> b!1064978 d!128987))

(declare-fun b!1065111 () Bool)

(declare-fun e!607143 () Bool)

(declare-fun e!607147 () Bool)

(assert (=> b!1065111 (= e!607143 e!607147)))

(declare-fun res!710986 () Bool)

(declare-fun call!45006 () Bool)

(assert (=> b!1065111 (= res!710986 call!45006)))

(assert (=> b!1065111 (=> (not res!710986) (not e!607147))))

(declare-fun b!1065112 () Bool)

(declare-fun e!607148 () Bool)

(assert (=> b!1065112 (= e!607148 (validKeyInArray!0 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45000 () Bool)

(declare-fun call!45007 () ListLongMap!14113)

(declare-fun call!45003 () ListLongMap!14113)

(assert (=> bm!45000 (= call!45007 call!45003)))

(declare-fun b!1065113 () Bool)

(assert (=> b!1065113 (= e!607143 (not call!45006))))

(declare-fun b!1065114 () Bool)

(declare-fun e!607142 () Bool)

(declare-fun lt!469560 () ListLongMap!14113)

(assert (=> b!1065114 (= e!607142 (= (apply!922 lt!469560 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1065115 () Bool)

(declare-fun e!607139 () Bool)

(declare-fun call!45008 () Bool)

(assert (=> b!1065115 (= e!607139 (not call!45008))))

(declare-fun bm!45002 () Bool)

(declare-fun call!45005 () ListLongMap!14113)

(declare-fun call!45009 () ListLongMap!14113)

(declare-fun c!107380 () Bool)

(declare-fun c!107384 () Bool)

(declare-fun call!45004 () ListLongMap!14113)

(assert (=> bm!45002 (= call!45003 (+!3120 (ite c!107384 call!45009 (ite c!107380 call!45005 call!45004)) (ite (or c!107384 c!107380) (tuple2!16145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45003 () Bool)

(assert (=> bm!45003 (= call!45008 (contains!6265 lt!469560 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1065116 () Bool)

(declare-fun e!607146 () ListLongMap!14113)

(assert (=> b!1065116 (= e!607146 (+!3120 call!45003 (tuple2!16145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1065117 () Bool)

(declare-fun e!607150 () ListLongMap!14113)

(assert (=> b!1065117 (= e!607150 call!45004)))

(declare-fun bm!45004 () Bool)

(assert (=> bm!45004 (= call!45006 (contains!6265 lt!469560 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1065118 () Bool)

(assert (=> b!1065118 (= e!607147 (= (apply!922 lt!469560 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1065119 () Bool)

(declare-fun e!607149 () ListLongMap!14113)

(assert (=> b!1065119 (= e!607149 call!45007)))

(declare-fun b!1065120 () Bool)

(declare-fun e!607145 () Bool)

(declare-fun e!607144 () Bool)

(assert (=> b!1065120 (= e!607145 e!607144)))

(declare-fun res!710989 () Bool)

(assert (=> b!1065120 (=> (not res!710989) (not e!607144))))

(assert (=> b!1065120 (= res!710989 (contains!6265 lt!469560 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065120 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(declare-fun b!1065121 () Bool)

(declare-fun res!710994 () Bool)

(declare-fun e!607141 () Bool)

(assert (=> b!1065121 (=> (not res!710994) (not e!607141))))

(assert (=> b!1065121 (= res!710994 e!607145)))

(declare-fun res!710991 () Bool)

(assert (=> b!1065121 (=> res!710991 e!607145)))

(assert (=> b!1065121 (= res!710991 (not e!607148))))

(declare-fun res!710992 () Bool)

(assert (=> b!1065121 (=> (not res!710992) (not e!607148))))

(assert (=> b!1065121 (= res!710992 (bvslt #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(declare-fun b!1065122 () Bool)

(assert (=> b!1065122 (= e!607139 e!607142)))

(declare-fun res!710990 () Bool)

(assert (=> b!1065122 (= res!710990 call!45008)))

(assert (=> b!1065122 (=> (not res!710990) (not e!607142))))

(declare-fun b!1065123 () Bool)

(declare-fun c!107383 () Bool)

(assert (=> b!1065123 (= c!107383 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1065123 (= e!607149 e!607150)))

(declare-fun b!1065124 () Bool)

(declare-fun res!710987 () Bool)

(assert (=> b!1065124 (=> (not res!710987) (not e!607141))))

(assert (=> b!1065124 (= res!710987 e!607139)))

(declare-fun c!107379 () Bool)

(assert (=> b!1065124 (= c!107379 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065125 () Bool)

(assert (=> b!1065125 (= e!607150 call!45007)))

(declare-fun bm!45005 () Bool)

(assert (=> bm!45005 (= call!45005 call!45009)))

(declare-fun bm!45006 () Bool)

(assert (=> bm!45006 (= call!45009 (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065126 () Bool)

(assert (=> b!1065126 (= e!607141 e!607143)))

(declare-fun c!107381 () Bool)

(assert (=> b!1065126 (= c!107381 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1065127 () Bool)

(declare-fun e!607151 () Unit!34938)

(declare-fun Unit!34942 () Unit!34938)

(assert (=> b!1065127 (= e!607151 Unit!34942)))

(declare-fun d!128989 () Bool)

(assert (=> d!128989 e!607141))

(declare-fun res!710993 () Bool)

(assert (=> d!128989 (=> (not res!710993) (not e!607141))))

(assert (=> d!128989 (= res!710993 (or (bvsge #b00000000000000000000000000000000 (size!33115 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33115 _keys!1163)))))))

(declare-fun lt!469561 () ListLongMap!14113)

(assert (=> d!128989 (= lt!469560 lt!469561)))

(declare-fun lt!469568 () Unit!34938)

(assert (=> d!128989 (= lt!469568 e!607151)))

(declare-fun c!107382 () Bool)

(declare-fun e!607140 () Bool)

(assert (=> d!128989 (= c!107382 e!607140)))

(declare-fun res!710988 () Bool)

(assert (=> d!128989 (=> (not res!710988) (not e!607140))))

(assert (=> d!128989 (= res!710988 (bvslt #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(assert (=> d!128989 (= lt!469561 e!607146)))

(assert (=> d!128989 (= c!107384 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!128989 (validMask!0 mask!1515)))

(assert (=> d!128989 (= (getCurrentListMap!4032 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469560)))

(declare-fun bm!45001 () Bool)

(assert (=> bm!45001 (= call!45004 call!45005)))

(declare-fun b!1065128 () Bool)

(assert (=> b!1065128 (= e!607144 (= (apply!922 lt!469560 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)) (get!17008 (select (arr!32580 _values!955) #b00000000000000000000000000000000) (dynLambda!2029 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1065128 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33116 _values!955)))))

(assert (=> b!1065128 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(declare-fun b!1065129 () Bool)

(assert (=> b!1065129 (= e!607140 (validKeyInArray!0 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065130 () Bool)

(assert (=> b!1065130 (= e!607146 e!607149)))

(assert (=> b!1065130 (= c!107380 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1065131 () Bool)

(declare-fun lt!469559 () Unit!34938)

(assert (=> b!1065131 (= e!607151 lt!469559)))

(declare-fun lt!469569 () ListLongMap!14113)

(assert (=> b!1065131 (= lt!469569 (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469578 () (_ BitVec 64))

(assert (=> b!1065131 (= lt!469578 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!469564 () (_ BitVec 64))

(assert (=> b!1065131 (= lt!469564 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!469571 () Unit!34938)

(declare-fun addStillContains!638 (ListLongMap!14113 (_ BitVec 64) V!38979 (_ BitVec 64)) Unit!34938)

(assert (=> b!1065131 (= lt!469571 (addStillContains!638 lt!469569 lt!469578 zeroValueBefore!47 lt!469564))))

(assert (=> b!1065131 (contains!6265 (+!3120 lt!469569 (tuple2!16145 lt!469578 zeroValueBefore!47)) lt!469564)))

(declare-fun lt!469577 () Unit!34938)

(assert (=> b!1065131 (= lt!469577 lt!469571)))

(declare-fun lt!469570 () ListLongMap!14113)

(assert (=> b!1065131 (= lt!469570 (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469567 () (_ BitVec 64))

(assert (=> b!1065131 (= lt!469567 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!469574 () (_ BitVec 64))

(assert (=> b!1065131 (= lt!469574 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!469573 () Unit!34938)

(declare-fun addApplyDifferent!498 (ListLongMap!14113 (_ BitVec 64) V!38979 (_ BitVec 64)) Unit!34938)

(assert (=> b!1065131 (= lt!469573 (addApplyDifferent!498 lt!469570 lt!469567 minValue!907 lt!469574))))

(assert (=> b!1065131 (= (apply!922 (+!3120 lt!469570 (tuple2!16145 lt!469567 minValue!907)) lt!469574) (apply!922 lt!469570 lt!469574))))

(declare-fun lt!469565 () Unit!34938)

(assert (=> b!1065131 (= lt!469565 lt!469573)))

(declare-fun lt!469558 () ListLongMap!14113)

(assert (=> b!1065131 (= lt!469558 (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469572 () (_ BitVec 64))

(assert (=> b!1065131 (= lt!469572 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!469563 () (_ BitVec 64))

(assert (=> b!1065131 (= lt!469563 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!469562 () Unit!34938)

(assert (=> b!1065131 (= lt!469562 (addApplyDifferent!498 lt!469558 lt!469572 zeroValueBefore!47 lt!469563))))

(assert (=> b!1065131 (= (apply!922 (+!3120 lt!469558 (tuple2!16145 lt!469572 zeroValueBefore!47)) lt!469563) (apply!922 lt!469558 lt!469563))))

(declare-fun lt!469576 () Unit!34938)

(assert (=> b!1065131 (= lt!469576 lt!469562)))

(declare-fun lt!469566 () ListLongMap!14113)

(assert (=> b!1065131 (= lt!469566 (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469575 () (_ BitVec 64))

(assert (=> b!1065131 (= lt!469575 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!469557 () (_ BitVec 64))

(assert (=> b!1065131 (= lt!469557 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1065131 (= lt!469559 (addApplyDifferent!498 lt!469566 lt!469575 minValue!907 lt!469557))))

(assert (=> b!1065131 (= (apply!922 (+!3120 lt!469566 (tuple2!16145 lt!469575 minValue!907)) lt!469557) (apply!922 lt!469566 lt!469557))))

(assert (= (and d!128989 c!107384) b!1065116))

(assert (= (and d!128989 (not c!107384)) b!1065130))

(assert (= (and b!1065130 c!107380) b!1065119))

(assert (= (and b!1065130 (not c!107380)) b!1065123))

(assert (= (and b!1065123 c!107383) b!1065125))

(assert (= (and b!1065123 (not c!107383)) b!1065117))

(assert (= (or b!1065125 b!1065117) bm!45001))

(assert (= (or b!1065119 bm!45001) bm!45005))

(assert (= (or b!1065119 b!1065125) bm!45000))

(assert (= (or b!1065116 bm!45005) bm!45006))

(assert (= (or b!1065116 bm!45000) bm!45002))

(assert (= (and d!128989 res!710988) b!1065129))

(assert (= (and d!128989 c!107382) b!1065131))

(assert (= (and d!128989 (not c!107382)) b!1065127))

(assert (= (and d!128989 res!710993) b!1065121))

(assert (= (and b!1065121 res!710992) b!1065112))

(assert (= (and b!1065121 (not res!710991)) b!1065120))

(assert (= (and b!1065120 res!710989) b!1065128))

(assert (= (and b!1065121 res!710994) b!1065124))

(assert (= (and b!1065124 c!107379) b!1065122))

(assert (= (and b!1065124 (not c!107379)) b!1065115))

(assert (= (and b!1065122 res!710990) b!1065114))

(assert (= (or b!1065122 b!1065115) bm!45003))

(assert (= (and b!1065124 res!710987) b!1065126))

(assert (= (and b!1065126 c!107381) b!1065111))

(assert (= (and b!1065126 (not c!107381)) b!1065113))

(assert (= (and b!1065111 res!710986) b!1065118))

(assert (= (or b!1065111 b!1065113) bm!45004))

(declare-fun b_lambda!16525 () Bool)

(assert (=> (not b_lambda!16525) (not b!1065128)))

(assert (=> b!1065128 t!32034))

(declare-fun b_and!34335 () Bool)

(assert (= b_and!34333 (and (=> t!32034 result!14725) b_and!34335)))

(declare-fun m!983525 () Bool)

(assert (=> b!1065114 m!983525))

(declare-fun m!983527 () Bool)

(assert (=> bm!45002 m!983527))

(assert (=> b!1065112 m!983469))

(assert (=> b!1065112 m!983469))

(assert (=> b!1065112 m!983471))

(assert (=> bm!45006 m!983447))

(assert (=> b!1065128 m!983483))

(assert (=> b!1065128 m!983483))

(assert (=> b!1065128 m!983485))

(assert (=> b!1065128 m!983487))

(assert (=> b!1065128 m!983485))

(assert (=> b!1065128 m!983469))

(declare-fun m!983529 () Bool)

(assert (=> b!1065128 m!983529))

(assert (=> b!1065128 m!983469))

(declare-fun m!983531 () Bool)

(assert (=> b!1065118 m!983531))

(assert (=> b!1065129 m!983469))

(assert (=> b!1065129 m!983469))

(assert (=> b!1065129 m!983471))

(assert (=> b!1065120 m!983469))

(assert (=> b!1065120 m!983469))

(declare-fun m!983533 () Bool)

(assert (=> b!1065120 m!983533))

(declare-fun m!983535 () Bool)

(assert (=> bm!45003 m!983535))

(declare-fun m!983537 () Bool)

(assert (=> b!1065116 m!983537))

(declare-fun m!983539 () Bool)

(assert (=> bm!45004 m!983539))

(declare-fun m!983541 () Bool)

(assert (=> b!1065131 m!983541))

(declare-fun m!983543 () Bool)

(assert (=> b!1065131 m!983543))

(declare-fun m!983545 () Bool)

(assert (=> b!1065131 m!983545))

(assert (=> b!1065131 m!983447))

(declare-fun m!983547 () Bool)

(assert (=> b!1065131 m!983547))

(declare-fun m!983549 () Bool)

(assert (=> b!1065131 m!983549))

(assert (=> b!1065131 m!983469))

(declare-fun m!983551 () Bool)

(assert (=> b!1065131 m!983551))

(declare-fun m!983553 () Bool)

(assert (=> b!1065131 m!983553))

(declare-fun m!983555 () Bool)

(assert (=> b!1065131 m!983555))

(declare-fun m!983557 () Bool)

(assert (=> b!1065131 m!983557))

(declare-fun m!983559 () Bool)

(assert (=> b!1065131 m!983559))

(declare-fun m!983561 () Bool)

(assert (=> b!1065131 m!983561))

(assert (=> b!1065131 m!983557))

(declare-fun m!983563 () Bool)

(assert (=> b!1065131 m!983563))

(assert (=> b!1065131 m!983547))

(assert (=> b!1065131 m!983543))

(declare-fun m!983565 () Bool)

(assert (=> b!1065131 m!983565))

(declare-fun m!983567 () Bool)

(assert (=> b!1065131 m!983567))

(assert (=> b!1065131 m!983551))

(declare-fun m!983569 () Bool)

(assert (=> b!1065131 m!983569))

(assert (=> d!128989 m!983431))

(assert (=> b!1064972 d!128989))

(declare-fun d!128991 () Bool)

(assert (=> d!128991 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94172 d!128991))

(declare-fun d!128993 () Bool)

(assert (=> d!128993 (= (array_inv!25228 _values!955) (bvsge (size!33116 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94172 d!128993))

(declare-fun d!128995 () Bool)

(assert (=> d!128995 (= (array_inv!25229 _keys!1163) (bvsge (size!33115 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94172 d!128995))

(declare-fun b!1065140 () Bool)

(declare-fun e!607159 () Bool)

(declare-fun call!45012 () Bool)

(assert (=> b!1065140 (= e!607159 call!45012)))

(declare-fun d!128997 () Bool)

(declare-fun res!710999 () Bool)

(declare-fun e!607158 () Bool)

(assert (=> d!128997 (=> res!710999 e!607158)))

(assert (=> d!128997 (= res!710999 (bvsge #b00000000000000000000000000000000 (size!33115 _keys!1163)))))

(assert (=> d!128997 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!607158)))

(declare-fun b!1065141 () Bool)

(declare-fun e!607160 () Bool)

(assert (=> b!1065141 (= e!607158 e!607160)))

(declare-fun c!107387 () Bool)

(assert (=> b!1065141 (= c!107387 (validKeyInArray!0 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065142 () Bool)

(assert (=> b!1065142 (= e!607160 e!607159)))

(declare-fun lt!469585 () (_ BitVec 64))

(assert (=> b!1065142 (= lt!469585 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!469587 () Unit!34938)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67751 (_ BitVec 64) (_ BitVec 32)) Unit!34938)

(assert (=> b!1065142 (= lt!469587 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!469585 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1065142 (arrayContainsKey!0 _keys!1163 lt!469585 #b00000000000000000000000000000000)))

(declare-fun lt!469586 () Unit!34938)

(assert (=> b!1065142 (= lt!469586 lt!469587)))

(declare-fun res!711000 () Bool)

(declare-datatypes ((SeekEntryResult!9875 0))(
  ( (MissingZero!9875 (index!41871 (_ BitVec 32))) (Found!9875 (index!41872 (_ BitVec 32))) (Intermediate!9875 (undefined!10687 Bool) (index!41873 (_ BitVec 32)) (x!95330 (_ BitVec 32))) (Undefined!9875) (MissingVacant!9875 (index!41874 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67751 (_ BitVec 32)) SeekEntryResult!9875)

(assert (=> b!1065142 (= res!711000 (= (seekEntryOrOpen!0 (select (arr!32579 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9875 #b00000000000000000000000000000000)))))

(assert (=> b!1065142 (=> (not res!711000) (not e!607159))))

(declare-fun b!1065143 () Bool)

(assert (=> b!1065143 (= e!607160 call!45012)))

(declare-fun bm!45009 () Bool)

(assert (=> bm!45009 (= call!45012 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!128997 (not res!710999)) b!1065141))

(assert (= (and b!1065141 c!107387) b!1065142))

(assert (= (and b!1065141 (not c!107387)) b!1065143))

(assert (= (and b!1065142 res!711000) b!1065140))

(assert (= (or b!1065140 b!1065143) bm!45009))

(assert (=> b!1065141 m!983469))

(assert (=> b!1065141 m!983469))

(assert (=> b!1065141 m!983471))

(assert (=> b!1065142 m!983469))

(declare-fun m!983571 () Bool)

(assert (=> b!1065142 m!983571))

(declare-fun m!983573 () Bool)

(assert (=> b!1065142 m!983573))

(assert (=> b!1065142 m!983469))

(declare-fun m!983575 () Bool)

(assert (=> b!1065142 m!983575))

(declare-fun m!983577 () Bool)

(assert (=> bm!45009 m!983577))

(assert (=> b!1064976 d!128997))

(declare-fun b!1065150 () Bool)

(declare-fun e!607166 () Bool)

(assert (=> b!1065150 (= e!607166 tp_is_empty!25383)))

(declare-fun mapIsEmpty!39763 () Bool)

(declare-fun mapRes!39763 () Bool)

(assert (=> mapIsEmpty!39763 mapRes!39763))

(declare-fun mapNonEmpty!39763 () Bool)

(declare-fun tp!76163 () Bool)

(assert (=> mapNonEmpty!39763 (= mapRes!39763 (and tp!76163 e!607166))))

(declare-fun mapRest!39763 () (Array (_ BitVec 32) ValueCell!11988))

(declare-fun mapKey!39763 () (_ BitVec 32))

(declare-fun mapValue!39763 () ValueCell!11988)

(assert (=> mapNonEmpty!39763 (= mapRest!39757 (store mapRest!39763 mapKey!39763 mapValue!39763))))

(declare-fun b!1065151 () Bool)

(declare-fun e!607165 () Bool)

(assert (=> b!1065151 (= e!607165 tp_is_empty!25383)))

(declare-fun condMapEmpty!39763 () Bool)

(declare-fun mapDefault!39763 () ValueCell!11988)

(assert (=> mapNonEmpty!39757 (= condMapEmpty!39763 (= mapRest!39757 ((as const (Array (_ BitVec 32) ValueCell!11988)) mapDefault!39763)))))

(assert (=> mapNonEmpty!39757 (= tp!76153 (and e!607165 mapRes!39763))))

(assert (= (and mapNonEmpty!39757 condMapEmpty!39763) mapIsEmpty!39763))

(assert (= (and mapNonEmpty!39757 (not condMapEmpty!39763)) mapNonEmpty!39763))

(assert (= (and mapNonEmpty!39763 ((_ is ValueCellFull!11988) mapValue!39763)) b!1065150))

(assert (= (and mapNonEmpty!39757 ((_ is ValueCellFull!11988) mapDefault!39763)) b!1065151))

(declare-fun m!983579 () Bool)

(assert (=> mapNonEmpty!39763 m!983579))

(declare-fun b_lambda!16527 () Bool)

(assert (= b_lambda!16523 (or (and start!94172 b_free!21573) b_lambda!16527)))

(declare-fun b_lambda!16529 () Bool)

(assert (= b_lambda!16521 (or (and start!94172 b_free!21573) b_lambda!16529)))

(declare-fun b_lambda!16531 () Bool)

(assert (= b_lambda!16517 (or (and start!94172 b_free!21573) b_lambda!16531)))

(declare-fun b_lambda!16533 () Bool)

(assert (= b_lambda!16525 (or (and start!94172 b_free!21573) b_lambda!16533)))

(declare-fun b_lambda!16535 () Bool)

(assert (= b_lambda!16519 (or (and start!94172 b_free!21573) b_lambda!16535)))

(check-sat (not bm!45009) (not b!1065116) (not d!128987) (not bm!45004) (not b!1065016) (not b!1065131) tp_is_empty!25383 (not b!1065043) (not b!1065057) (not b!1065054) (not bm!44981) (not b!1065048) (not b!1065120) (not b!1065114) (not b!1065061) (not b!1065118) (not b!1065017) (not b!1065052) (not b!1065065) (not b!1065128) (not d!128985) (not b_lambda!16533) (not b!1065068) b_and!34335 (not d!128983) (not b_lambda!16527) (not b!1065051) (not b!1065047) (not b_lambda!16535) (not b!1065015) (not bm!45003) (not d!128989) (not bm!45002) (not bm!44984) (not b!1065067) (not b!1065062) (not b!1065066) (not b!1065142) (not b!1065129) (not b!1065112) (not b_lambda!16531) (not b_lambda!16529) (not b!1065141) (not bm!44985) (not b!1065053) (not b_next!21573) (not bm!45006) (not b!1065044) (not mapNonEmpty!39763) (not b!1065058))
(check-sat b_and!34335 (not b_next!21573))
