; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94104 () Bool)

(assert start!94104)

(declare-fun b_free!21519 () Bool)

(declare-fun b_next!21519 () Bool)

(assert (=> start!94104 (= b_free!21519 (not b_next!21519))))

(declare-fun tp!75989 () Bool)

(declare-fun b_and!34261 () Bool)

(assert (=> start!94104 (= tp!75989 b_and!34261)))

(declare-fun b!1064243 () Bool)

(declare-fun e!606513 () Bool)

(declare-fun tp_is_empty!25329 () Bool)

(assert (=> b!1064243 (= e!606513 tp_is_empty!25329)))

(declare-fun b!1064244 () Bool)

(declare-fun e!606516 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67649 0))(
  ( (array!67650 (arr!32529 (Array (_ BitVec 32) (_ BitVec 64))) (size!33065 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67649)

(assert (=> b!1064244 (= e!606516 (not (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!33065 _keys!1163)))))))

(declare-datatypes ((V!38907 0))(
  ( (V!38908 (val!12715 Int)) )
))
(declare-datatypes ((tuple2!16100 0))(
  ( (tuple2!16101 (_1!8061 (_ BitVec 64)) (_2!8061 V!38907)) )
))
(declare-datatypes ((List!22674 0))(
  ( (Nil!22671) (Cons!22670 (h!23879 tuple2!16100) (t!31989 List!22674)) )
))
(declare-datatypes ((ListLongMap!14069 0))(
  ( (ListLongMap!14070 (toList!7050 List!22674)) )
))
(declare-fun lt!469106 () ListLongMap!14069)

(declare-fun lt!469107 () ListLongMap!14069)

(assert (=> b!1064244 (= lt!469106 lt!469107)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38907)

(declare-datatypes ((ValueCell!11961 0))(
  ( (ValueCellFull!11961 (v!15327 V!38907)) (EmptyCell!11961) )
))
(declare-datatypes ((array!67651 0))(
  ( (array!67652 (arr!32530 (Array (_ BitVec 32) ValueCell!11961)) (size!33066 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67651)

(declare-fun minValue!907 () V!38907)

(declare-datatypes ((Unit!34900 0))(
  ( (Unit!34901) )
))
(declare-fun lt!469108 () Unit!34900)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38907)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!679 (array!67649 array!67651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38907 V!38907 V!38907 V!38907 (_ BitVec 32) Int) Unit!34900)

(assert (=> b!1064244 (= lt!469108 (lemmaNoChangeToArrayThenSameMapNoExtras!679 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3642 (array!67649 array!67651 (_ BitVec 32) (_ BitVec 32) V!38907 V!38907 (_ BitVec 32) Int) ListLongMap!14069)

(assert (=> b!1064244 (= lt!469107 (getCurrentListMapNoExtraKeys!3642 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064244 (= lt!469106 (getCurrentListMapNoExtraKeys!3642 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064245 () Bool)

(declare-fun e!606515 () Bool)

(declare-fun e!606512 () Bool)

(declare-fun mapRes!39673 () Bool)

(assert (=> b!1064245 (= e!606515 (and e!606512 mapRes!39673))))

(declare-fun condMapEmpty!39673 () Bool)

(declare-fun mapDefault!39673 () ValueCell!11961)

(assert (=> b!1064245 (= condMapEmpty!39673 (= (arr!32530 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11961)) mapDefault!39673)))))

(declare-fun mapIsEmpty!39673 () Bool)

(assert (=> mapIsEmpty!39673 mapRes!39673))

(declare-fun b!1064246 () Bool)

(declare-fun res!710492 () Bool)

(assert (=> b!1064246 (=> (not res!710492) (not e!606516))))

(assert (=> b!1064246 (= res!710492 (and (= (size!33066 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33065 _keys!1163) (size!33066 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064247 () Bool)

(declare-fun res!710494 () Bool)

(assert (=> b!1064247 (=> (not res!710494) (not e!606516))))

(declare-datatypes ((List!22675 0))(
  ( (Nil!22672) (Cons!22671 (h!23880 (_ BitVec 64)) (t!31990 List!22675)) )
))
(declare-fun arrayNoDuplicates!0 (array!67649 (_ BitVec 32) List!22675) Bool)

(assert (=> b!1064247 (= res!710494 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22672))))

(declare-fun res!710493 () Bool)

(assert (=> start!94104 (=> (not res!710493) (not e!606516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94104 (= res!710493 (validMask!0 mask!1515))))

(assert (=> start!94104 e!606516))

(assert (=> start!94104 true))

(assert (=> start!94104 tp_is_empty!25329))

(declare-fun array_inv!25190 (array!67651) Bool)

(assert (=> start!94104 (and (array_inv!25190 _values!955) e!606515)))

(assert (=> start!94104 tp!75989))

(declare-fun array_inv!25191 (array!67649) Bool)

(assert (=> start!94104 (array_inv!25191 _keys!1163)))

(declare-fun b!1064248 () Bool)

(declare-fun res!710491 () Bool)

(assert (=> b!1064248 (=> (not res!710491) (not e!606516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67649 (_ BitVec 32)) Bool)

(assert (=> b!1064248 (= res!710491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064249 () Bool)

(assert (=> b!1064249 (= e!606512 tp_is_empty!25329)))

(declare-fun mapNonEmpty!39673 () Bool)

(declare-fun tp!75988 () Bool)

(assert (=> mapNonEmpty!39673 (= mapRes!39673 (and tp!75988 e!606513))))

(declare-fun mapRest!39673 () (Array (_ BitVec 32) ValueCell!11961))

(declare-fun mapKey!39673 () (_ BitVec 32))

(declare-fun mapValue!39673 () ValueCell!11961)

(assert (=> mapNonEmpty!39673 (= (arr!32530 _values!955) (store mapRest!39673 mapKey!39673 mapValue!39673))))

(assert (= (and start!94104 res!710493) b!1064246))

(assert (= (and b!1064246 res!710492) b!1064248))

(assert (= (and b!1064248 res!710491) b!1064247))

(assert (= (and b!1064247 res!710494) b!1064244))

(assert (= (and b!1064245 condMapEmpty!39673) mapIsEmpty!39673))

(assert (= (and b!1064245 (not condMapEmpty!39673)) mapNonEmpty!39673))

(get-info :version)

(assert (= (and mapNonEmpty!39673 ((_ is ValueCellFull!11961) mapValue!39673)) b!1064243))

(assert (= (and b!1064245 ((_ is ValueCellFull!11961) mapDefault!39673)) b!1064249))

(assert (= start!94104 b!1064245))

(declare-fun m!982827 () Bool)

(assert (=> start!94104 m!982827))

(declare-fun m!982829 () Bool)

(assert (=> start!94104 m!982829))

(declare-fun m!982831 () Bool)

(assert (=> start!94104 m!982831))

(declare-fun m!982833 () Bool)

(assert (=> b!1064244 m!982833))

(declare-fun m!982835 () Bool)

(assert (=> b!1064244 m!982835))

(declare-fun m!982837 () Bool)

(assert (=> b!1064244 m!982837))

(declare-fun m!982839 () Bool)

(assert (=> mapNonEmpty!39673 m!982839))

(declare-fun m!982841 () Bool)

(assert (=> b!1064248 m!982841))

(declare-fun m!982843 () Bool)

(assert (=> b!1064247 m!982843))

(check-sat tp_is_empty!25329 b_and!34261 (not b!1064248) (not start!94104) (not b_next!21519) (not b!1064247) (not b!1064244) (not mapNonEmpty!39673))
(check-sat b_and!34261 (not b_next!21519))
(get-model)

(declare-fun d!128947 () Bool)

(assert (=> d!128947 (= (getCurrentListMapNoExtraKeys!3642 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3642 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469120 () Unit!34900)

(declare-fun choose!1728 (array!67649 array!67651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38907 V!38907 V!38907 V!38907 (_ BitVec 32) Int) Unit!34900)

(assert (=> d!128947 (= lt!469120 (choose!1728 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!128947 (validMask!0 mask!1515)))

(assert (=> d!128947 (= (lemmaNoChangeToArrayThenSameMapNoExtras!679 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469120)))

(declare-fun bs!31301 () Bool)

(assert (= bs!31301 d!128947))

(assert (=> bs!31301 m!982837))

(assert (=> bs!31301 m!982835))

(declare-fun m!982863 () Bool)

(assert (=> bs!31301 m!982863))

(assert (=> bs!31301 m!982827))

(assert (=> b!1064244 d!128947))

(declare-fun b!1064295 () Bool)

(declare-fun lt!469140 () Unit!34900)

(declare-fun lt!469137 () Unit!34900)

(assert (=> b!1064295 (= lt!469140 lt!469137)))

(declare-fun lt!469138 () ListLongMap!14069)

(declare-fun lt!469141 () (_ BitVec 64))

(declare-fun lt!469139 () V!38907)

(declare-fun lt!469135 () (_ BitVec 64))

(declare-fun contains!6262 (ListLongMap!14069 (_ BitVec 64)) Bool)

(declare-fun +!3119 (ListLongMap!14069 tuple2!16100) ListLongMap!14069)

(assert (=> b!1064295 (not (contains!6262 (+!3119 lt!469138 (tuple2!16101 lt!469135 lt!469139)) lt!469141))))

(declare-fun addStillNotContains!249 (ListLongMap!14069 (_ BitVec 64) V!38907 (_ BitVec 64)) Unit!34900)

(assert (=> b!1064295 (= lt!469137 (addStillNotContains!249 lt!469138 lt!469135 lt!469139 lt!469141))))

(assert (=> b!1064295 (= lt!469141 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!16989 (ValueCell!11961 V!38907) V!38907)

(declare-fun dynLambda!2028 (Int (_ BitVec 64)) V!38907)

(assert (=> b!1064295 (= lt!469139 (get!16989 (select (arr!32530 _values!955) #b00000000000000000000000000000000) (dynLambda!2028 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1064295 (= lt!469135 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!44974 () ListLongMap!14069)

(assert (=> b!1064295 (= lt!469138 call!44974)))

(declare-fun e!606551 () ListLongMap!14069)

(assert (=> b!1064295 (= e!606551 (+!3119 call!44974 (tuple2!16101 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000) (get!16989 (select (arr!32530 _values!955) #b00000000000000000000000000000000) (dynLambda!2028 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1064296 () Bool)

(declare-fun e!606550 () ListLongMap!14069)

(assert (=> b!1064296 (= e!606550 (ListLongMap!14070 Nil!22671))))

(declare-fun b!1064297 () Bool)

(declare-fun e!606552 () Bool)

(declare-fun e!606546 () Bool)

(assert (=> b!1064297 (= e!606552 e!606546)))

(declare-fun c!107334 () Bool)

(declare-fun e!606549 () Bool)

(assert (=> b!1064297 (= c!107334 e!606549)))

(declare-fun res!710516 () Bool)

(assert (=> b!1064297 (=> (not res!710516) (not e!606549))))

(assert (=> b!1064297 (= res!710516 (bvslt #b00000000000000000000000000000000 (size!33065 _keys!1163)))))

(declare-fun b!1064298 () Bool)

(assert (=> b!1064298 (= e!606550 e!606551)))

(declare-fun c!107337 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1064298 (= c!107337 (validKeyInArray!0 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064299 () Bool)

(declare-fun e!606548 () Bool)

(declare-fun lt!469136 () ListLongMap!14069)

(declare-fun isEmpty!939 (ListLongMap!14069) Bool)

(assert (=> b!1064299 (= e!606548 (isEmpty!939 lt!469136))))

(declare-fun b!1064300 () Bool)

(assert (=> b!1064300 (= e!606548 (= lt!469136 (getCurrentListMapNoExtraKeys!3642 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1064301 () Bool)

(assert (=> b!1064301 (= e!606549 (validKeyInArray!0 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064301 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1064302 () Bool)

(assert (=> b!1064302 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33065 _keys!1163)))))

(assert (=> b!1064302 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33066 _values!955)))))

(declare-fun e!606547 () Bool)

(declare-fun apply!921 (ListLongMap!14069 (_ BitVec 64)) V!38907)

(assert (=> b!1064302 (= e!606547 (= (apply!921 lt!469136 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000)) (get!16989 (select (arr!32530 _values!955) #b00000000000000000000000000000000) (dynLambda!2028 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1064303 () Bool)

(assert (=> b!1064303 (= e!606551 call!44974)))

(declare-fun b!1064304 () Bool)

(assert (=> b!1064304 (= e!606546 e!606547)))

(assert (=> b!1064304 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33065 _keys!1163)))))

(declare-fun res!710517 () Bool)

(assert (=> b!1064304 (= res!710517 (contains!6262 lt!469136 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064304 (=> (not res!710517) (not e!606547))))

(declare-fun d!128949 () Bool)

(assert (=> d!128949 e!606552))

(declare-fun res!710515 () Bool)

(assert (=> d!128949 (=> (not res!710515) (not e!606552))))

(assert (=> d!128949 (= res!710515 (not (contains!6262 lt!469136 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128949 (= lt!469136 e!606550)))

(declare-fun c!107336 () Bool)

(assert (=> d!128949 (= c!107336 (bvsge #b00000000000000000000000000000000 (size!33065 _keys!1163)))))

(assert (=> d!128949 (validMask!0 mask!1515)))

(assert (=> d!128949 (= (getCurrentListMapNoExtraKeys!3642 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469136)))

(declare-fun bm!44971 () Bool)

(assert (=> bm!44971 (= call!44974 (getCurrentListMapNoExtraKeys!3642 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1064305 () Bool)

(assert (=> b!1064305 (= e!606546 e!606548)))

(declare-fun c!107335 () Bool)

(assert (=> b!1064305 (= c!107335 (bvslt #b00000000000000000000000000000000 (size!33065 _keys!1163)))))

(declare-fun b!1064306 () Bool)

(declare-fun res!710518 () Bool)

(assert (=> b!1064306 (=> (not res!710518) (not e!606552))))

(assert (=> b!1064306 (= res!710518 (not (contains!6262 lt!469136 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!128949 c!107336) b!1064296))

(assert (= (and d!128949 (not c!107336)) b!1064298))

(assert (= (and b!1064298 c!107337) b!1064295))

(assert (= (and b!1064298 (not c!107337)) b!1064303))

(assert (= (or b!1064295 b!1064303) bm!44971))

(assert (= (and d!128949 res!710515) b!1064306))

(assert (= (and b!1064306 res!710518) b!1064297))

(assert (= (and b!1064297 res!710516) b!1064301))

(assert (= (and b!1064297 c!107334) b!1064304))

(assert (= (and b!1064297 (not c!107334)) b!1064305))

(assert (= (and b!1064304 res!710517) b!1064302))

(assert (= (and b!1064305 c!107335) b!1064300))

(assert (= (and b!1064305 (not c!107335)) b!1064299))

(declare-fun b_lambda!16501 () Bool)

(assert (=> (not b_lambda!16501) (not b!1064295)))

(declare-fun t!31992 () Bool)

(declare-fun tb!7137 () Bool)

(assert (=> (and start!94104 (= defaultEntry!963 defaultEntry!963) t!31992) tb!7137))

(declare-fun result!14719 () Bool)

(assert (=> tb!7137 (= result!14719 tp_is_empty!25329)))

(assert (=> b!1064295 t!31992))

(declare-fun b_and!34265 () Bool)

(assert (= b_and!34261 (and (=> t!31992 result!14719) b_and!34265)))

(declare-fun b_lambda!16503 () Bool)

(assert (=> (not b_lambda!16503) (not b!1064302)))

(assert (=> b!1064302 t!31992))

(declare-fun b_and!34267 () Bool)

(assert (= b_and!34265 (and (=> t!31992 result!14719) b_and!34267)))

(declare-fun m!982865 () Bool)

(assert (=> b!1064298 m!982865))

(assert (=> b!1064298 m!982865))

(declare-fun m!982867 () Bool)

(assert (=> b!1064298 m!982867))

(declare-fun m!982869 () Bool)

(assert (=> d!128949 m!982869))

(assert (=> d!128949 m!982827))

(declare-fun m!982871 () Bool)

(assert (=> b!1064300 m!982871))

(declare-fun m!982873 () Bool)

(assert (=> b!1064302 m!982873))

(declare-fun m!982875 () Bool)

(assert (=> b!1064302 m!982875))

(assert (=> b!1064302 m!982875))

(assert (=> b!1064302 m!982873))

(declare-fun m!982877 () Bool)

(assert (=> b!1064302 m!982877))

(assert (=> b!1064302 m!982865))

(assert (=> b!1064302 m!982865))

(declare-fun m!982879 () Bool)

(assert (=> b!1064302 m!982879))

(declare-fun m!982881 () Bool)

(assert (=> b!1064299 m!982881))

(assert (=> b!1064304 m!982865))

(assert (=> b!1064304 m!982865))

(declare-fun m!982883 () Bool)

(assert (=> b!1064304 m!982883))

(assert (=> bm!44971 m!982871))

(assert (=> b!1064301 m!982865))

(assert (=> b!1064301 m!982865))

(assert (=> b!1064301 m!982867))

(declare-fun m!982885 () Bool)

(assert (=> b!1064306 m!982885))

(assert (=> b!1064295 m!982873))

(assert (=> b!1064295 m!982875))

(assert (=> b!1064295 m!982865))

(declare-fun m!982887 () Bool)

(assert (=> b!1064295 m!982887))

(declare-fun m!982889 () Bool)

(assert (=> b!1064295 m!982889))

(declare-fun m!982891 () Bool)

(assert (=> b!1064295 m!982891))

(declare-fun m!982893 () Bool)

(assert (=> b!1064295 m!982893))

(assert (=> b!1064295 m!982887))

(assert (=> b!1064295 m!982875))

(assert (=> b!1064295 m!982873))

(assert (=> b!1064295 m!982877))

(assert (=> b!1064244 d!128949))

(declare-fun b!1064309 () Bool)

(declare-fun lt!469147 () Unit!34900)

(declare-fun lt!469144 () Unit!34900)

(assert (=> b!1064309 (= lt!469147 lt!469144)))

(declare-fun lt!469145 () ListLongMap!14069)

(declare-fun lt!469142 () (_ BitVec 64))

(declare-fun lt!469148 () (_ BitVec 64))

(declare-fun lt!469146 () V!38907)

(assert (=> b!1064309 (not (contains!6262 (+!3119 lt!469145 (tuple2!16101 lt!469142 lt!469146)) lt!469148))))

(assert (=> b!1064309 (= lt!469144 (addStillNotContains!249 lt!469145 lt!469142 lt!469146 lt!469148))))

(assert (=> b!1064309 (= lt!469148 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1064309 (= lt!469146 (get!16989 (select (arr!32530 _values!955) #b00000000000000000000000000000000) (dynLambda!2028 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1064309 (= lt!469142 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!44975 () ListLongMap!14069)

(assert (=> b!1064309 (= lt!469145 call!44975)))

(declare-fun e!606558 () ListLongMap!14069)

(assert (=> b!1064309 (= e!606558 (+!3119 call!44975 (tuple2!16101 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000) (get!16989 (select (arr!32530 _values!955) #b00000000000000000000000000000000) (dynLambda!2028 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1064310 () Bool)

(declare-fun e!606557 () ListLongMap!14069)

(assert (=> b!1064310 (= e!606557 (ListLongMap!14070 Nil!22671))))

(declare-fun b!1064311 () Bool)

(declare-fun e!606559 () Bool)

(declare-fun e!606553 () Bool)

(assert (=> b!1064311 (= e!606559 e!606553)))

(declare-fun c!107338 () Bool)

(declare-fun e!606556 () Bool)

(assert (=> b!1064311 (= c!107338 e!606556)))

(declare-fun res!710520 () Bool)

(assert (=> b!1064311 (=> (not res!710520) (not e!606556))))

(assert (=> b!1064311 (= res!710520 (bvslt #b00000000000000000000000000000000 (size!33065 _keys!1163)))))

(declare-fun b!1064312 () Bool)

(assert (=> b!1064312 (= e!606557 e!606558)))

(declare-fun c!107341 () Bool)

(assert (=> b!1064312 (= c!107341 (validKeyInArray!0 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064313 () Bool)

(declare-fun e!606555 () Bool)

(declare-fun lt!469143 () ListLongMap!14069)

(assert (=> b!1064313 (= e!606555 (isEmpty!939 lt!469143))))

(declare-fun b!1064314 () Bool)

(assert (=> b!1064314 (= e!606555 (= lt!469143 (getCurrentListMapNoExtraKeys!3642 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1064315 () Bool)

(assert (=> b!1064315 (= e!606556 (validKeyInArray!0 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064315 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1064316 () Bool)

(assert (=> b!1064316 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33065 _keys!1163)))))

(assert (=> b!1064316 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33066 _values!955)))))

(declare-fun e!606554 () Bool)

(assert (=> b!1064316 (= e!606554 (= (apply!921 lt!469143 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000)) (get!16989 (select (arr!32530 _values!955) #b00000000000000000000000000000000) (dynLambda!2028 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1064317 () Bool)

(assert (=> b!1064317 (= e!606558 call!44975)))

(declare-fun b!1064318 () Bool)

(assert (=> b!1064318 (= e!606553 e!606554)))

(assert (=> b!1064318 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33065 _keys!1163)))))

(declare-fun res!710521 () Bool)

(assert (=> b!1064318 (= res!710521 (contains!6262 lt!469143 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064318 (=> (not res!710521) (not e!606554))))

(declare-fun d!128951 () Bool)

(assert (=> d!128951 e!606559))

(declare-fun res!710519 () Bool)

(assert (=> d!128951 (=> (not res!710519) (not e!606559))))

(assert (=> d!128951 (= res!710519 (not (contains!6262 lt!469143 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128951 (= lt!469143 e!606557)))

(declare-fun c!107340 () Bool)

(assert (=> d!128951 (= c!107340 (bvsge #b00000000000000000000000000000000 (size!33065 _keys!1163)))))

(assert (=> d!128951 (validMask!0 mask!1515)))

(assert (=> d!128951 (= (getCurrentListMapNoExtraKeys!3642 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469143)))

(declare-fun bm!44972 () Bool)

(assert (=> bm!44972 (= call!44975 (getCurrentListMapNoExtraKeys!3642 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1064319 () Bool)

(assert (=> b!1064319 (= e!606553 e!606555)))

(declare-fun c!107339 () Bool)

(assert (=> b!1064319 (= c!107339 (bvslt #b00000000000000000000000000000000 (size!33065 _keys!1163)))))

(declare-fun b!1064320 () Bool)

(declare-fun res!710522 () Bool)

(assert (=> b!1064320 (=> (not res!710522) (not e!606559))))

(assert (=> b!1064320 (= res!710522 (not (contains!6262 lt!469143 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!128951 c!107340) b!1064310))

(assert (= (and d!128951 (not c!107340)) b!1064312))

(assert (= (and b!1064312 c!107341) b!1064309))

(assert (= (and b!1064312 (not c!107341)) b!1064317))

(assert (= (or b!1064309 b!1064317) bm!44972))

(assert (= (and d!128951 res!710519) b!1064320))

(assert (= (and b!1064320 res!710522) b!1064311))

(assert (= (and b!1064311 res!710520) b!1064315))

(assert (= (and b!1064311 c!107338) b!1064318))

(assert (= (and b!1064311 (not c!107338)) b!1064319))

(assert (= (and b!1064318 res!710521) b!1064316))

(assert (= (and b!1064319 c!107339) b!1064314))

(assert (= (and b!1064319 (not c!107339)) b!1064313))

(declare-fun b_lambda!16505 () Bool)

(assert (=> (not b_lambda!16505) (not b!1064309)))

(assert (=> b!1064309 t!31992))

(declare-fun b_and!34269 () Bool)

(assert (= b_and!34267 (and (=> t!31992 result!14719) b_and!34269)))

(declare-fun b_lambda!16507 () Bool)

(assert (=> (not b_lambda!16507) (not b!1064316)))

(assert (=> b!1064316 t!31992))

(declare-fun b_and!34271 () Bool)

(assert (= b_and!34269 (and (=> t!31992 result!14719) b_and!34271)))

(assert (=> b!1064312 m!982865))

(assert (=> b!1064312 m!982865))

(assert (=> b!1064312 m!982867))

(declare-fun m!982895 () Bool)

(assert (=> d!128951 m!982895))

(assert (=> d!128951 m!982827))

(declare-fun m!982897 () Bool)

(assert (=> b!1064314 m!982897))

(assert (=> b!1064316 m!982873))

(assert (=> b!1064316 m!982875))

(assert (=> b!1064316 m!982875))

(assert (=> b!1064316 m!982873))

(assert (=> b!1064316 m!982877))

(assert (=> b!1064316 m!982865))

(assert (=> b!1064316 m!982865))

(declare-fun m!982899 () Bool)

(assert (=> b!1064316 m!982899))

(declare-fun m!982901 () Bool)

(assert (=> b!1064313 m!982901))

(assert (=> b!1064318 m!982865))

(assert (=> b!1064318 m!982865))

(declare-fun m!982903 () Bool)

(assert (=> b!1064318 m!982903))

(assert (=> bm!44972 m!982897))

(assert (=> b!1064315 m!982865))

(assert (=> b!1064315 m!982865))

(assert (=> b!1064315 m!982867))

(declare-fun m!982905 () Bool)

(assert (=> b!1064320 m!982905))

(assert (=> b!1064309 m!982873))

(assert (=> b!1064309 m!982875))

(assert (=> b!1064309 m!982865))

(declare-fun m!982907 () Bool)

(assert (=> b!1064309 m!982907))

(declare-fun m!982909 () Bool)

(assert (=> b!1064309 m!982909))

(declare-fun m!982911 () Bool)

(assert (=> b!1064309 m!982911))

(declare-fun m!982913 () Bool)

(assert (=> b!1064309 m!982913))

(assert (=> b!1064309 m!982907))

(assert (=> b!1064309 m!982875))

(assert (=> b!1064309 m!982873))

(assert (=> b!1064309 m!982877))

(assert (=> b!1064244 d!128951))

(declare-fun d!128953 () Bool)

(assert (=> d!128953 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94104 d!128953))

(declare-fun d!128955 () Bool)

(assert (=> d!128955 (= (array_inv!25190 _values!955) (bvsge (size!33066 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94104 d!128955))

(declare-fun d!128957 () Bool)

(assert (=> d!128957 (= (array_inv!25191 _keys!1163) (bvsge (size!33065 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94104 d!128957))

(declare-fun b!1064329 () Bool)

(declare-fun e!606568 () Bool)

(declare-fun e!606566 () Bool)

(assert (=> b!1064329 (= e!606568 e!606566)))

(declare-fun c!107344 () Bool)

(assert (=> b!1064329 (= c!107344 (validKeyInArray!0 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!128959 () Bool)

(declare-fun res!710527 () Bool)

(assert (=> d!128959 (=> res!710527 e!606568)))

(assert (=> d!128959 (= res!710527 (bvsge #b00000000000000000000000000000000 (size!33065 _keys!1163)))))

(assert (=> d!128959 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!606568)))

(declare-fun bm!44975 () Bool)

(declare-fun call!44978 () Bool)

(assert (=> bm!44975 (= call!44978 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1064330 () Bool)

(assert (=> b!1064330 (= e!606566 call!44978)))

(declare-fun b!1064331 () Bool)

(declare-fun e!606567 () Bool)

(assert (=> b!1064331 (= e!606566 e!606567)))

(declare-fun lt!469157 () (_ BitVec 64))

(assert (=> b!1064331 (= lt!469157 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!469155 () Unit!34900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67649 (_ BitVec 64) (_ BitVec 32)) Unit!34900)

(assert (=> b!1064331 (= lt!469155 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!469157 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1064331 (arrayContainsKey!0 _keys!1163 lt!469157 #b00000000000000000000000000000000)))

(declare-fun lt!469156 () Unit!34900)

(assert (=> b!1064331 (= lt!469156 lt!469155)))

(declare-fun res!710528 () Bool)

(declare-datatypes ((SeekEntryResult!9874 0))(
  ( (MissingZero!9874 (index!41867 (_ BitVec 32))) (Found!9874 (index!41868 (_ BitVec 32))) (Intermediate!9874 (undefined!10686 Bool) (index!41869 (_ BitVec 32)) (x!95246 (_ BitVec 32))) (Undefined!9874) (MissingVacant!9874 (index!41870 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67649 (_ BitVec 32)) SeekEntryResult!9874)

(assert (=> b!1064331 (= res!710528 (= (seekEntryOrOpen!0 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9874 #b00000000000000000000000000000000)))))

(assert (=> b!1064331 (=> (not res!710528) (not e!606567))))

(declare-fun b!1064332 () Bool)

(assert (=> b!1064332 (= e!606567 call!44978)))

(assert (= (and d!128959 (not res!710527)) b!1064329))

(assert (= (and b!1064329 c!107344) b!1064331))

(assert (= (and b!1064329 (not c!107344)) b!1064330))

(assert (= (and b!1064331 res!710528) b!1064332))

(assert (= (or b!1064332 b!1064330) bm!44975))

(assert (=> b!1064329 m!982865))

(assert (=> b!1064329 m!982865))

(assert (=> b!1064329 m!982867))

(declare-fun m!982915 () Bool)

(assert (=> bm!44975 m!982915))

(assert (=> b!1064331 m!982865))

(declare-fun m!982917 () Bool)

(assert (=> b!1064331 m!982917))

(declare-fun m!982919 () Bool)

(assert (=> b!1064331 m!982919))

(assert (=> b!1064331 m!982865))

(declare-fun m!982921 () Bool)

(assert (=> b!1064331 m!982921))

(assert (=> b!1064248 d!128959))

(declare-fun d!128961 () Bool)

(declare-fun res!710537 () Bool)

(declare-fun e!606577 () Bool)

(assert (=> d!128961 (=> res!710537 e!606577)))

(assert (=> d!128961 (= res!710537 (bvsge #b00000000000000000000000000000000 (size!33065 _keys!1163)))))

(assert (=> d!128961 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22672) e!606577)))

(declare-fun b!1064343 () Bool)

(declare-fun e!606579 () Bool)

(declare-fun call!44981 () Bool)

(assert (=> b!1064343 (= e!606579 call!44981)))

(declare-fun b!1064344 () Bool)

(declare-fun e!606580 () Bool)

(declare-fun contains!6263 (List!22675 (_ BitVec 64)) Bool)

(assert (=> b!1064344 (= e!606580 (contains!6263 Nil!22672 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064345 () Bool)

(declare-fun e!606578 () Bool)

(assert (=> b!1064345 (= e!606578 e!606579)))

(declare-fun c!107347 () Bool)

(assert (=> b!1064345 (= c!107347 (validKeyInArray!0 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064346 () Bool)

(assert (=> b!1064346 (= e!606579 call!44981)))

(declare-fun b!1064347 () Bool)

(assert (=> b!1064347 (= e!606577 e!606578)))

(declare-fun res!710536 () Bool)

(assert (=> b!1064347 (=> (not res!710536) (not e!606578))))

(assert (=> b!1064347 (= res!710536 (not e!606580))))

(declare-fun res!710535 () Bool)

(assert (=> b!1064347 (=> (not res!710535) (not e!606580))))

(assert (=> b!1064347 (= res!710535 (validKeyInArray!0 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44978 () Bool)

(assert (=> bm!44978 (= call!44981 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107347 (Cons!22671 (select (arr!32529 _keys!1163) #b00000000000000000000000000000000) Nil!22672) Nil!22672)))))

(assert (= (and d!128961 (not res!710537)) b!1064347))

(assert (= (and b!1064347 res!710535) b!1064344))

(assert (= (and b!1064347 res!710536) b!1064345))

(assert (= (and b!1064345 c!107347) b!1064346))

(assert (= (and b!1064345 (not c!107347)) b!1064343))

(assert (= (or b!1064346 b!1064343) bm!44978))

(assert (=> b!1064344 m!982865))

(assert (=> b!1064344 m!982865))

(declare-fun m!982923 () Bool)

(assert (=> b!1064344 m!982923))

(assert (=> b!1064345 m!982865))

(assert (=> b!1064345 m!982865))

(assert (=> b!1064345 m!982867))

(assert (=> b!1064347 m!982865))

(assert (=> b!1064347 m!982865))

(assert (=> b!1064347 m!982867))

(assert (=> bm!44978 m!982865))

(declare-fun m!982925 () Bool)

(assert (=> bm!44978 m!982925))

(assert (=> b!1064247 d!128961))

(declare-fun b!1064354 () Bool)

(declare-fun e!606586 () Bool)

(assert (=> b!1064354 (= e!606586 tp_is_empty!25329)))

(declare-fun condMapEmpty!39679 () Bool)

(declare-fun mapDefault!39679 () ValueCell!11961)

(assert (=> mapNonEmpty!39673 (= condMapEmpty!39679 (= mapRest!39673 ((as const (Array (_ BitVec 32) ValueCell!11961)) mapDefault!39679)))))

(declare-fun e!606585 () Bool)

(declare-fun mapRes!39679 () Bool)

(assert (=> mapNonEmpty!39673 (= tp!75988 (and e!606585 mapRes!39679))))

(declare-fun b!1064355 () Bool)

(assert (=> b!1064355 (= e!606585 tp_is_empty!25329)))

(declare-fun mapIsEmpty!39679 () Bool)

(assert (=> mapIsEmpty!39679 mapRes!39679))

(declare-fun mapNonEmpty!39679 () Bool)

(declare-fun tp!75998 () Bool)

(assert (=> mapNonEmpty!39679 (= mapRes!39679 (and tp!75998 e!606586))))

(declare-fun mapValue!39679 () ValueCell!11961)

(declare-fun mapKey!39679 () (_ BitVec 32))

(declare-fun mapRest!39679 () (Array (_ BitVec 32) ValueCell!11961))

(assert (=> mapNonEmpty!39679 (= mapRest!39673 (store mapRest!39679 mapKey!39679 mapValue!39679))))

(assert (= (and mapNonEmpty!39673 condMapEmpty!39679) mapIsEmpty!39679))

(assert (= (and mapNonEmpty!39673 (not condMapEmpty!39679)) mapNonEmpty!39679))

(assert (= (and mapNonEmpty!39679 ((_ is ValueCellFull!11961) mapValue!39679)) b!1064354))

(assert (= (and mapNonEmpty!39673 ((_ is ValueCellFull!11961) mapDefault!39679)) b!1064355))

(declare-fun m!982927 () Bool)

(assert (=> mapNonEmpty!39679 m!982927))

(declare-fun b_lambda!16509 () Bool)

(assert (= b_lambda!16501 (or (and start!94104 b_free!21519) b_lambda!16509)))

(declare-fun b_lambda!16511 () Bool)

(assert (= b_lambda!16507 (or (and start!94104 b_free!21519) b_lambda!16511)))

(declare-fun b_lambda!16513 () Bool)

(assert (= b_lambda!16503 (or (and start!94104 b_free!21519) b_lambda!16513)))

(declare-fun b_lambda!16515 () Bool)

(assert (= b_lambda!16505 (or (and start!94104 b_free!21519) b_lambda!16515)))

(check-sat (not b!1064314) (not b!1064302) (not b!1064300) (not bm!44971) (not b!1064316) (not b!1064299) (not b_lambda!16513) (not b_lambda!16511) (not b!1064347) (not b!1064309) (not mapNonEmpty!39679) (not d!128947) (not d!128951) (not b!1064318) tp_is_empty!25329 (not b!1064344) (not b!1064312) (not b!1064331) (not b!1064329) (not b_lambda!16515) (not bm!44975) (not d!128949) (not b!1064301) (not b!1064304) (not b!1064295) (not b!1064306) (not bm!44978) b_and!34271 (not b!1064313) (not b!1064320) (not b!1064298) (not b_lambda!16509) (not b!1064315) (not bm!44972) (not b_next!21519) (not b!1064345))
(check-sat b_and!34271 (not b_next!21519))
