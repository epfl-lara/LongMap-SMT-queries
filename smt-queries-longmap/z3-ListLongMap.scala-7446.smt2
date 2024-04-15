; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94542 () Bool)

(assert start!94542)

(declare-fun b_free!21853 () Bool)

(declare-fun b_next!21853 () Bool)

(assert (=> start!94542 (= b_free!21853 (not b_next!21853))))

(declare-fun tp!77008 () Bool)

(declare-fun b_and!34629 () Bool)

(assert (=> start!94542 (= tp!77008 b_and!34629)))

(declare-fun b!1069020 () Bool)

(declare-fun res!713353 () Bool)

(declare-fun e!610049 () Bool)

(assert (=> b!1069020 (=> (not res!713353) (not e!610049))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39353 0))(
  ( (V!39354 (val!12882 Int)) )
))
(declare-datatypes ((ValueCell!12128 0))(
  ( (ValueCellFull!12128 (v!15496 V!39353)) (EmptyCell!12128) )
))
(declare-datatypes ((array!68246 0))(
  ( (array!68247 (arr!32822 (Array (_ BitVec 32) ValueCell!12128)) (size!33360 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68246)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68248 0))(
  ( (array!68249 (arr!32823 (Array (_ BitVec 32) (_ BitVec 64))) (size!33361 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68248)

(assert (=> b!1069020 (= res!713353 (and (= (size!33360 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33361 _keys!1163) (size!33360 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069021 () Bool)

(declare-fun e!610048 () Bool)

(assert (=> b!1069021 (= e!610048 (bvsle #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(declare-datatypes ((tuple2!16426 0))(
  ( (tuple2!16427 (_1!8224 (_ BitVec 64)) (_2!8224 V!39353)) )
))
(declare-datatypes ((List!22960 0))(
  ( (Nil!22957) (Cons!22956 (h!24165 tuple2!16426) (t!32278 List!22960)) )
))
(declare-datatypes ((ListLongMap!14395 0))(
  ( (ListLongMap!14396 (toList!7213 List!22960)) )
))
(declare-fun lt!472232 () ListLongMap!14395)

(declare-fun -!653 (ListLongMap!14395 (_ BitVec 64)) ListLongMap!14395)

(assert (=> b!1069021 (= (-!653 lt!472232 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472232)))

(declare-datatypes ((Unit!35014 0))(
  ( (Unit!35015) )
))
(declare-fun lt!472236 () Unit!35014)

(declare-fun removeNotPresentStillSame!70 (ListLongMap!14395 (_ BitVec 64)) Unit!35014)

(assert (=> b!1069021 (= lt!472236 (removeNotPresentStillSame!70 lt!472232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!713351 () Bool)

(assert (=> start!94542 (=> (not res!713351) (not e!610049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94542 (= res!713351 (validMask!0 mask!1515))))

(assert (=> start!94542 e!610049))

(assert (=> start!94542 true))

(declare-fun tp_is_empty!25663 () Bool)

(assert (=> start!94542 tp_is_empty!25663))

(declare-fun e!610052 () Bool)

(declare-fun array_inv!25404 (array!68246) Bool)

(assert (=> start!94542 (and (array_inv!25404 _values!955) e!610052)))

(assert (=> start!94542 tp!77008))

(declare-fun array_inv!25405 (array!68248) Bool)

(assert (=> start!94542 (array_inv!25405 _keys!1163)))

(declare-fun mapNonEmpty!40192 () Bool)

(declare-fun mapRes!40192 () Bool)

(declare-fun tp!77009 () Bool)

(declare-fun e!610050 () Bool)

(assert (=> mapNonEmpty!40192 (= mapRes!40192 (and tp!77009 e!610050))))

(declare-fun mapKey!40192 () (_ BitVec 32))

(declare-fun mapRest!40192 () (Array (_ BitVec 32) ValueCell!12128))

(declare-fun mapValue!40192 () ValueCell!12128)

(assert (=> mapNonEmpty!40192 (= (arr!32822 _values!955) (store mapRest!40192 mapKey!40192 mapValue!40192))))

(declare-fun b!1069022 () Bool)

(declare-fun res!713356 () Bool)

(assert (=> b!1069022 (=> (not res!713356) (not e!610049))))

(declare-datatypes ((List!22961 0))(
  ( (Nil!22958) (Cons!22957 (h!24166 (_ BitVec 64)) (t!32279 List!22961)) )
))
(declare-fun arrayNoDuplicates!0 (array!68248 (_ BitVec 32) List!22961) Bool)

(assert (=> b!1069022 (= res!713356 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22958))))

(declare-fun b!1069023 () Bool)

(assert (=> b!1069023 (= e!610050 tp_is_empty!25663)))

(declare-fun mapIsEmpty!40192 () Bool)

(assert (=> mapIsEmpty!40192 mapRes!40192))

(declare-fun b!1069024 () Bool)

(declare-fun e!610047 () Bool)

(assert (=> b!1069024 (= e!610052 (and e!610047 mapRes!40192))))

(declare-fun condMapEmpty!40192 () Bool)

(declare-fun mapDefault!40192 () ValueCell!12128)

(assert (=> b!1069024 (= condMapEmpty!40192 (= (arr!32822 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12128)) mapDefault!40192)))))

(declare-fun b!1069025 () Bool)

(declare-fun e!610046 () Bool)

(assert (=> b!1069025 (= e!610049 (not e!610046))))

(declare-fun res!713355 () Bool)

(assert (=> b!1069025 (=> res!713355 e!610046)))

(assert (=> b!1069025 (= res!713355 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472234 () ListLongMap!14395)

(declare-fun lt!472235 () ListLongMap!14395)

(assert (=> b!1069025 (= lt!472234 lt!472235)))

(declare-fun zeroValueBefore!47 () V!39353)

(declare-fun minValue!907 () V!39353)

(declare-fun lt!472233 () Unit!35014)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39353)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!797 (array!68248 array!68246 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39353 V!39353 V!39353 V!39353 (_ BitVec 32) Int) Unit!35014)

(assert (=> b!1069025 (= lt!472233 (lemmaNoChangeToArrayThenSameMapNoExtras!797 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3803 (array!68248 array!68246 (_ BitVec 32) (_ BitVec 32) V!39353 V!39353 (_ BitVec 32) Int) ListLongMap!14395)

(assert (=> b!1069025 (= lt!472235 (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069025 (= lt!472234 (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069026 () Bool)

(assert (=> b!1069026 (= e!610046 e!610048)))

(declare-fun res!713352 () Bool)

(assert (=> b!1069026 (=> res!713352 e!610048)))

(declare-fun contains!6281 (ListLongMap!14395 (_ BitVec 64)) Bool)

(assert (=> b!1069026 (= res!713352 (contains!6281 lt!472232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4049 (array!68248 array!68246 (_ BitVec 32) (_ BitVec 32) V!39353 V!39353 (_ BitVec 32) Int) ListLongMap!14395)

(assert (=> b!1069026 (= lt!472232 (getCurrentListMap!4049 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069027 () Bool)

(declare-fun res!713354 () Bool)

(assert (=> b!1069027 (=> (not res!713354) (not e!610049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68248 (_ BitVec 32)) Bool)

(assert (=> b!1069027 (= res!713354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069028 () Bool)

(assert (=> b!1069028 (= e!610047 tp_is_empty!25663)))

(assert (= (and start!94542 res!713351) b!1069020))

(assert (= (and b!1069020 res!713353) b!1069027))

(assert (= (and b!1069027 res!713354) b!1069022))

(assert (= (and b!1069022 res!713356) b!1069025))

(assert (= (and b!1069025 (not res!713355)) b!1069026))

(assert (= (and b!1069026 (not res!713352)) b!1069021))

(assert (= (and b!1069024 condMapEmpty!40192) mapIsEmpty!40192))

(assert (= (and b!1069024 (not condMapEmpty!40192)) mapNonEmpty!40192))

(get-info :version)

(assert (= (and mapNonEmpty!40192 ((_ is ValueCellFull!12128) mapValue!40192)) b!1069023))

(assert (= (and b!1069024 ((_ is ValueCellFull!12128) mapDefault!40192)) b!1069028))

(assert (= start!94542 b!1069024))

(declare-fun m!987091 () Bool)

(assert (=> b!1069022 m!987091))

(declare-fun m!987093 () Bool)

(assert (=> b!1069021 m!987093))

(declare-fun m!987095 () Bool)

(assert (=> b!1069021 m!987095))

(declare-fun m!987097 () Bool)

(assert (=> start!94542 m!987097))

(declare-fun m!987099 () Bool)

(assert (=> start!94542 m!987099))

(declare-fun m!987101 () Bool)

(assert (=> start!94542 m!987101))

(declare-fun m!987103 () Bool)

(assert (=> mapNonEmpty!40192 m!987103))

(declare-fun m!987105 () Bool)

(assert (=> b!1069027 m!987105))

(declare-fun m!987107 () Bool)

(assert (=> b!1069025 m!987107))

(declare-fun m!987109 () Bool)

(assert (=> b!1069025 m!987109))

(declare-fun m!987111 () Bool)

(assert (=> b!1069025 m!987111))

(declare-fun m!987113 () Bool)

(assert (=> b!1069026 m!987113))

(declare-fun m!987115 () Bool)

(assert (=> b!1069026 m!987115))

(check-sat (not b!1069026) (not b_next!21853) b_and!34629 (not start!94542) (not mapNonEmpty!40192) (not b!1069025) (not b!1069027) (not b!1069022) tp_is_empty!25663 (not b!1069021))
(check-sat b_and!34629 (not b_next!21853))
(get-model)

(declare-fun d!129033 () Bool)

(declare-fun lt!472269 () ListLongMap!14395)

(assert (=> d!129033 (not (contains!6281 lt!472269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!72 (List!22960 (_ BitVec 64)) List!22960)

(assert (=> d!129033 (= lt!472269 (ListLongMap!14396 (removeStrictlySorted!72 (toList!7213 lt!472232) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129033 (= (-!653 lt!472232 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472269)))

(declare-fun bs!31454 () Bool)

(assert (= bs!31454 d!129033))

(declare-fun m!987169 () Bool)

(assert (=> bs!31454 m!987169))

(declare-fun m!987171 () Bool)

(assert (=> bs!31454 m!987171))

(assert (=> b!1069021 d!129033))

(declare-fun d!129035 () Bool)

(assert (=> d!129035 (= (-!653 lt!472232 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472232)))

(declare-fun lt!472272 () Unit!35014)

(declare-fun choose!1744 (ListLongMap!14395 (_ BitVec 64)) Unit!35014)

(assert (=> d!129035 (= lt!472272 (choose!1744 lt!472232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129035 (not (contains!6281 lt!472232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129035 (= (removeNotPresentStillSame!70 lt!472232 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472272)))

(declare-fun bs!31455 () Bool)

(assert (= bs!31455 d!129035))

(assert (=> bs!31455 m!987093))

(declare-fun m!987173 () Bool)

(assert (=> bs!31455 m!987173))

(assert (=> bs!31455 m!987113))

(assert (=> b!1069021 d!129035))

(declare-fun d!129037 () Bool)

(assert (=> d!129037 (= (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472275 () Unit!35014)

(declare-fun choose!1745 (array!68248 array!68246 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39353 V!39353 V!39353 V!39353 (_ BitVec 32) Int) Unit!35014)

(assert (=> d!129037 (= lt!472275 (choose!1745 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129037 (validMask!0 mask!1515)))

(assert (=> d!129037 (= (lemmaNoChangeToArrayThenSameMapNoExtras!797 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472275)))

(declare-fun bs!31456 () Bool)

(assert (= bs!31456 d!129037))

(assert (=> bs!31456 m!987111))

(assert (=> bs!31456 m!987109))

(declare-fun m!987175 () Bool)

(assert (=> bs!31456 m!987175))

(assert (=> bs!31456 m!987097))

(assert (=> b!1069025 d!129037))

(declare-fun b!1069107 () Bool)

(declare-fun e!610115 () Bool)

(declare-fun e!610111 () Bool)

(assert (=> b!1069107 (= e!610115 e!610111)))

(declare-fun c!107517 () Bool)

(assert (=> b!1069107 (= c!107517 (bvslt #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(declare-fun b!1069108 () Bool)

(assert (=> b!1069108 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(assert (=> b!1069108 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33360 _values!955)))))

(declare-fun lt!472291 () ListLongMap!14395)

(declare-fun e!610113 () Bool)

(declare-fun apply!920 (ListLongMap!14395 (_ BitVec 64)) V!39353)

(declare-fun get!17102 (ValueCell!12128 V!39353) V!39353)

(declare-fun dynLambda!2019 (Int (_ BitVec 64)) V!39353)

(assert (=> b!1069108 (= e!610113 (= (apply!920 lt!472291 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)) (get!17102 (select (arr!32822 _values!955) #b00000000000000000000000000000000) (dynLambda!2019 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1069109 () Bool)

(declare-fun e!610109 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1069109 (= e!610109 (validKeyInArray!0 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069109 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1069110 () Bool)

(declare-fun e!610110 () ListLongMap!14395)

(declare-fun e!610114 () ListLongMap!14395)

(assert (=> b!1069110 (= e!610110 e!610114)))

(declare-fun c!107516 () Bool)

(assert (=> b!1069110 (= c!107516 (validKeyInArray!0 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069111 () Bool)

(assert (=> b!1069111 (= e!610115 e!610113)))

(assert (=> b!1069111 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(declare-fun res!713404 () Bool)

(assert (=> b!1069111 (= res!713404 (contains!6281 lt!472291 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069111 (=> (not res!713404) (not e!610113))))

(declare-fun b!1069112 () Bool)

(assert (=> b!1069112 (= e!610111 (= lt!472291 (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1069113 () Bool)

(declare-fun isEmpty!950 (ListLongMap!14395) Bool)

(assert (=> b!1069113 (= e!610111 (isEmpty!950 lt!472291))))

(declare-fun b!1069114 () Bool)

(declare-fun e!610112 () Bool)

(assert (=> b!1069114 (= e!610112 e!610115)))

(declare-fun c!107514 () Bool)

(assert (=> b!1069114 (= c!107514 e!610109)))

(declare-fun res!713401 () Bool)

(assert (=> b!1069114 (=> (not res!713401) (not e!610109))))

(assert (=> b!1069114 (= res!713401 (bvslt #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(declare-fun b!1069115 () Bool)

(assert (=> b!1069115 (= e!610110 (ListLongMap!14396 Nil!22957))))

(declare-fun b!1069116 () Bool)

(declare-fun res!713402 () Bool)

(assert (=> b!1069116 (=> (not res!713402) (not e!610112))))

(assert (=> b!1069116 (= res!713402 (not (contains!6281 lt!472291 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129039 () Bool)

(assert (=> d!129039 e!610112))

(declare-fun res!713403 () Bool)

(assert (=> d!129039 (=> (not res!713403) (not e!610112))))

(assert (=> d!129039 (= res!713403 (not (contains!6281 lt!472291 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129039 (= lt!472291 e!610110)))

(declare-fun c!107515 () Bool)

(assert (=> d!129039 (= c!107515 (bvsge #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(assert (=> d!129039 (validMask!0 mask!1515)))

(assert (=> d!129039 (= (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472291)))

(declare-fun b!1069117 () Bool)

(declare-fun call!45109 () ListLongMap!14395)

(assert (=> b!1069117 (= e!610114 call!45109)))

(declare-fun b!1069118 () Bool)

(declare-fun lt!472292 () Unit!35014)

(declare-fun lt!472290 () Unit!35014)

(assert (=> b!1069118 (= lt!472292 lt!472290)))

(declare-fun lt!472294 () (_ BitVec 64))

(declare-fun lt!472295 () V!39353)

(declare-fun lt!472293 () (_ BitVec 64))

(declare-fun lt!472296 () ListLongMap!14395)

(declare-fun +!3186 (ListLongMap!14395 tuple2!16426) ListLongMap!14395)

(assert (=> b!1069118 (not (contains!6281 (+!3186 lt!472296 (tuple2!16427 lt!472293 lt!472295)) lt!472294))))

(declare-fun addStillNotContains!256 (ListLongMap!14395 (_ BitVec 64) V!39353 (_ BitVec 64)) Unit!35014)

(assert (=> b!1069118 (= lt!472290 (addStillNotContains!256 lt!472296 lt!472293 lt!472295 lt!472294))))

(assert (=> b!1069118 (= lt!472294 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1069118 (= lt!472295 (get!17102 (select (arr!32822 _values!955) #b00000000000000000000000000000000) (dynLambda!2019 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1069118 (= lt!472293 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1069118 (= lt!472296 call!45109)))

(assert (=> b!1069118 (= e!610114 (+!3186 call!45109 (tuple2!16427 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000) (get!17102 (select (arr!32822 _values!955) #b00000000000000000000000000000000) (dynLambda!2019 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!45106 () Bool)

(assert (=> bm!45106 (= call!45109 (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(assert (= (and d!129039 c!107515) b!1069115))

(assert (= (and d!129039 (not c!107515)) b!1069110))

(assert (= (and b!1069110 c!107516) b!1069118))

(assert (= (and b!1069110 (not c!107516)) b!1069117))

(assert (= (or b!1069118 b!1069117) bm!45106))

(assert (= (and d!129039 res!713403) b!1069116))

(assert (= (and b!1069116 res!713402) b!1069114))

(assert (= (and b!1069114 res!713401) b!1069109))

(assert (= (and b!1069114 c!107514) b!1069111))

(assert (= (and b!1069114 (not c!107514)) b!1069107))

(assert (= (and b!1069111 res!713404) b!1069108))

(assert (= (and b!1069107 c!107517) b!1069112))

(assert (= (and b!1069107 (not c!107517)) b!1069113))

(declare-fun b_lambda!16599 () Bool)

(assert (=> (not b_lambda!16599) (not b!1069108)))

(declare-fun t!32283 () Bool)

(declare-fun tb!7141 () Bool)

(assert (=> (and start!94542 (= defaultEntry!963 defaultEntry!963) t!32283) tb!7141))

(declare-fun result!14747 () Bool)

(assert (=> tb!7141 (= result!14747 tp_is_empty!25663)))

(assert (=> b!1069108 t!32283))

(declare-fun b_and!34635 () Bool)

(assert (= b_and!34629 (and (=> t!32283 result!14747) b_and!34635)))

(declare-fun b_lambda!16601 () Bool)

(assert (=> (not b_lambda!16601) (not b!1069118)))

(assert (=> b!1069118 t!32283))

(declare-fun b_and!34637 () Bool)

(assert (= b_and!34635 (and (=> t!32283 result!14747) b_and!34637)))

(declare-fun m!987177 () Bool)

(assert (=> d!129039 m!987177))

(assert (=> d!129039 m!987097))

(declare-fun m!987179 () Bool)

(assert (=> bm!45106 m!987179))

(declare-fun m!987181 () Bool)

(assert (=> b!1069110 m!987181))

(assert (=> b!1069110 m!987181))

(declare-fun m!987183 () Bool)

(assert (=> b!1069110 m!987183))

(assert (=> b!1069111 m!987181))

(assert (=> b!1069111 m!987181))

(declare-fun m!987185 () Bool)

(assert (=> b!1069111 m!987185))

(assert (=> b!1069109 m!987181))

(assert (=> b!1069109 m!987181))

(assert (=> b!1069109 m!987183))

(declare-fun m!987187 () Bool)

(assert (=> b!1069116 m!987187))

(assert (=> b!1069108 m!987181))

(declare-fun m!987189 () Bool)

(assert (=> b!1069108 m!987189))

(declare-fun m!987191 () Bool)

(assert (=> b!1069108 m!987191))

(assert (=> b!1069108 m!987181))

(declare-fun m!987193 () Bool)

(assert (=> b!1069108 m!987193))

(assert (=> b!1069108 m!987191))

(declare-fun m!987195 () Bool)

(assert (=> b!1069108 m!987195))

(assert (=> b!1069108 m!987193))

(declare-fun m!987197 () Bool)

(assert (=> b!1069118 m!987197))

(declare-fun m!987199 () Bool)

(assert (=> b!1069118 m!987199))

(assert (=> b!1069118 m!987191))

(assert (=> b!1069118 m!987181))

(assert (=> b!1069118 m!987197))

(assert (=> b!1069118 m!987193))

(assert (=> b!1069118 m!987191))

(assert (=> b!1069118 m!987195))

(declare-fun m!987201 () Bool)

(assert (=> b!1069118 m!987201))

(declare-fun m!987203 () Bool)

(assert (=> b!1069118 m!987203))

(assert (=> b!1069118 m!987193))

(assert (=> b!1069112 m!987179))

(declare-fun m!987205 () Bool)

(assert (=> b!1069113 m!987205))

(assert (=> b!1069025 d!129039))

(declare-fun b!1069121 () Bool)

(declare-fun e!610122 () Bool)

(declare-fun e!610118 () Bool)

(assert (=> b!1069121 (= e!610122 e!610118)))

(declare-fun c!107521 () Bool)

(assert (=> b!1069121 (= c!107521 (bvslt #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(declare-fun b!1069122 () Bool)

(assert (=> b!1069122 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(assert (=> b!1069122 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33360 _values!955)))))

(declare-fun lt!472298 () ListLongMap!14395)

(declare-fun e!610120 () Bool)

(assert (=> b!1069122 (= e!610120 (= (apply!920 lt!472298 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)) (get!17102 (select (arr!32822 _values!955) #b00000000000000000000000000000000) (dynLambda!2019 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1069123 () Bool)

(declare-fun e!610116 () Bool)

(assert (=> b!1069123 (= e!610116 (validKeyInArray!0 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069123 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1069124 () Bool)

(declare-fun e!610117 () ListLongMap!14395)

(declare-fun e!610121 () ListLongMap!14395)

(assert (=> b!1069124 (= e!610117 e!610121)))

(declare-fun c!107520 () Bool)

(assert (=> b!1069124 (= c!107520 (validKeyInArray!0 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069125 () Bool)

(assert (=> b!1069125 (= e!610122 e!610120)))

(assert (=> b!1069125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(declare-fun res!713408 () Bool)

(assert (=> b!1069125 (= res!713408 (contains!6281 lt!472298 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069125 (=> (not res!713408) (not e!610120))))

(declare-fun b!1069126 () Bool)

(assert (=> b!1069126 (= e!610118 (= lt!472298 (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1069127 () Bool)

(assert (=> b!1069127 (= e!610118 (isEmpty!950 lt!472298))))

(declare-fun b!1069128 () Bool)

(declare-fun e!610119 () Bool)

(assert (=> b!1069128 (= e!610119 e!610122)))

(declare-fun c!107518 () Bool)

(assert (=> b!1069128 (= c!107518 e!610116)))

(declare-fun res!713405 () Bool)

(assert (=> b!1069128 (=> (not res!713405) (not e!610116))))

(assert (=> b!1069128 (= res!713405 (bvslt #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(declare-fun b!1069129 () Bool)

(assert (=> b!1069129 (= e!610117 (ListLongMap!14396 Nil!22957))))

(declare-fun b!1069130 () Bool)

(declare-fun res!713406 () Bool)

(assert (=> b!1069130 (=> (not res!713406) (not e!610119))))

(assert (=> b!1069130 (= res!713406 (not (contains!6281 lt!472298 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129041 () Bool)

(assert (=> d!129041 e!610119))

(declare-fun res!713407 () Bool)

(assert (=> d!129041 (=> (not res!713407) (not e!610119))))

(assert (=> d!129041 (= res!713407 (not (contains!6281 lt!472298 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129041 (= lt!472298 e!610117)))

(declare-fun c!107519 () Bool)

(assert (=> d!129041 (= c!107519 (bvsge #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(assert (=> d!129041 (validMask!0 mask!1515)))

(assert (=> d!129041 (= (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472298)))

(declare-fun b!1069131 () Bool)

(declare-fun call!45110 () ListLongMap!14395)

(assert (=> b!1069131 (= e!610121 call!45110)))

(declare-fun b!1069132 () Bool)

(declare-fun lt!472299 () Unit!35014)

(declare-fun lt!472297 () Unit!35014)

(assert (=> b!1069132 (= lt!472299 lt!472297)))

(declare-fun lt!472301 () (_ BitVec 64))

(declare-fun lt!472302 () V!39353)

(declare-fun lt!472303 () ListLongMap!14395)

(declare-fun lt!472300 () (_ BitVec 64))

(assert (=> b!1069132 (not (contains!6281 (+!3186 lt!472303 (tuple2!16427 lt!472300 lt!472302)) lt!472301))))

(assert (=> b!1069132 (= lt!472297 (addStillNotContains!256 lt!472303 lt!472300 lt!472302 lt!472301))))

(assert (=> b!1069132 (= lt!472301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1069132 (= lt!472302 (get!17102 (select (arr!32822 _values!955) #b00000000000000000000000000000000) (dynLambda!2019 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1069132 (= lt!472300 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1069132 (= lt!472303 call!45110)))

(assert (=> b!1069132 (= e!610121 (+!3186 call!45110 (tuple2!16427 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000) (get!17102 (select (arr!32822 _values!955) #b00000000000000000000000000000000) (dynLambda!2019 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!45107 () Bool)

(assert (=> bm!45107 (= call!45110 (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(assert (= (and d!129041 c!107519) b!1069129))

(assert (= (and d!129041 (not c!107519)) b!1069124))

(assert (= (and b!1069124 c!107520) b!1069132))

(assert (= (and b!1069124 (not c!107520)) b!1069131))

(assert (= (or b!1069132 b!1069131) bm!45107))

(assert (= (and d!129041 res!713407) b!1069130))

(assert (= (and b!1069130 res!713406) b!1069128))

(assert (= (and b!1069128 res!713405) b!1069123))

(assert (= (and b!1069128 c!107518) b!1069125))

(assert (= (and b!1069128 (not c!107518)) b!1069121))

(assert (= (and b!1069125 res!713408) b!1069122))

(assert (= (and b!1069121 c!107521) b!1069126))

(assert (= (and b!1069121 (not c!107521)) b!1069127))

(declare-fun b_lambda!16603 () Bool)

(assert (=> (not b_lambda!16603) (not b!1069122)))

(assert (=> b!1069122 t!32283))

(declare-fun b_and!34639 () Bool)

(assert (= b_and!34637 (and (=> t!32283 result!14747) b_and!34639)))

(declare-fun b_lambda!16605 () Bool)

(assert (=> (not b_lambda!16605) (not b!1069132)))

(assert (=> b!1069132 t!32283))

(declare-fun b_and!34641 () Bool)

(assert (= b_and!34639 (and (=> t!32283 result!14747) b_and!34641)))

(declare-fun m!987207 () Bool)

(assert (=> d!129041 m!987207))

(assert (=> d!129041 m!987097))

(declare-fun m!987209 () Bool)

(assert (=> bm!45107 m!987209))

(assert (=> b!1069124 m!987181))

(assert (=> b!1069124 m!987181))

(assert (=> b!1069124 m!987183))

(assert (=> b!1069125 m!987181))

(assert (=> b!1069125 m!987181))

(declare-fun m!987211 () Bool)

(assert (=> b!1069125 m!987211))

(assert (=> b!1069123 m!987181))

(assert (=> b!1069123 m!987181))

(assert (=> b!1069123 m!987183))

(declare-fun m!987213 () Bool)

(assert (=> b!1069130 m!987213))

(assert (=> b!1069122 m!987181))

(declare-fun m!987215 () Bool)

(assert (=> b!1069122 m!987215))

(assert (=> b!1069122 m!987191))

(assert (=> b!1069122 m!987181))

(assert (=> b!1069122 m!987193))

(assert (=> b!1069122 m!987191))

(assert (=> b!1069122 m!987195))

(assert (=> b!1069122 m!987193))

(declare-fun m!987217 () Bool)

(assert (=> b!1069132 m!987217))

(declare-fun m!987219 () Bool)

(assert (=> b!1069132 m!987219))

(assert (=> b!1069132 m!987191))

(assert (=> b!1069132 m!987181))

(assert (=> b!1069132 m!987217))

(assert (=> b!1069132 m!987193))

(assert (=> b!1069132 m!987191))

(assert (=> b!1069132 m!987195))

(declare-fun m!987221 () Bool)

(assert (=> b!1069132 m!987221))

(declare-fun m!987223 () Bool)

(assert (=> b!1069132 m!987223))

(assert (=> b!1069132 m!987193))

(assert (=> b!1069126 m!987209))

(declare-fun m!987225 () Bool)

(assert (=> b!1069127 m!987225))

(assert (=> b!1069025 d!129041))

(declare-fun d!129043 () Bool)

(assert (=> d!129043 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94542 d!129043))

(declare-fun d!129045 () Bool)

(assert (=> d!129045 (= (array_inv!25404 _values!955) (bvsge (size!33360 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94542 d!129045))

(declare-fun d!129047 () Bool)

(assert (=> d!129047 (= (array_inv!25405 _keys!1163) (bvsge (size!33361 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94542 d!129047))

(declare-fun b!1069141 () Bool)

(declare-fun e!610130 () Bool)

(declare-fun call!45113 () Bool)

(assert (=> b!1069141 (= e!610130 call!45113)))

(declare-fun b!1069142 () Bool)

(declare-fun e!610131 () Bool)

(assert (=> b!1069142 (= e!610131 e!610130)))

(declare-fun lt!472311 () (_ BitVec 64))

(assert (=> b!1069142 (= lt!472311 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472310 () Unit!35014)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68248 (_ BitVec 64) (_ BitVec 32)) Unit!35014)

(assert (=> b!1069142 (= lt!472310 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!472311 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1069142 (arrayContainsKey!0 _keys!1163 lt!472311 #b00000000000000000000000000000000)))

(declare-fun lt!472312 () Unit!35014)

(assert (=> b!1069142 (= lt!472312 lt!472310)))

(declare-fun res!713413 () Bool)

(declare-datatypes ((SeekEntryResult!9879 0))(
  ( (MissingZero!9879 (index!41887 (_ BitVec 32))) (Found!9879 (index!41888 (_ BitVec 32))) (Intermediate!9879 (undefined!10691 Bool) (index!41889 (_ BitVec 32)) (x!95762 (_ BitVec 32))) (Undefined!9879) (MissingVacant!9879 (index!41890 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68248 (_ BitVec 32)) SeekEntryResult!9879)

(assert (=> b!1069142 (= res!713413 (= (seekEntryOrOpen!0 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9879 #b00000000000000000000000000000000)))))

(assert (=> b!1069142 (=> (not res!713413) (not e!610130))))

(declare-fun b!1069143 () Bool)

(assert (=> b!1069143 (= e!610131 call!45113)))

(declare-fun bm!45110 () Bool)

(assert (=> bm!45110 (= call!45113 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1069144 () Bool)

(declare-fun e!610129 () Bool)

(assert (=> b!1069144 (= e!610129 e!610131)))

(declare-fun c!107524 () Bool)

(assert (=> b!1069144 (= c!107524 (validKeyInArray!0 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129049 () Bool)

(declare-fun res!713414 () Bool)

(assert (=> d!129049 (=> res!713414 e!610129)))

(assert (=> d!129049 (= res!713414 (bvsge #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(assert (=> d!129049 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!610129)))

(assert (= (and d!129049 (not res!713414)) b!1069144))

(assert (= (and b!1069144 c!107524) b!1069142))

(assert (= (and b!1069144 (not c!107524)) b!1069143))

(assert (= (and b!1069142 res!713413) b!1069141))

(assert (= (or b!1069141 b!1069143) bm!45110))

(assert (=> b!1069142 m!987181))

(declare-fun m!987227 () Bool)

(assert (=> b!1069142 m!987227))

(declare-fun m!987229 () Bool)

(assert (=> b!1069142 m!987229))

(assert (=> b!1069142 m!987181))

(declare-fun m!987231 () Bool)

(assert (=> b!1069142 m!987231))

(declare-fun m!987233 () Bool)

(assert (=> bm!45110 m!987233))

(assert (=> b!1069144 m!987181))

(assert (=> b!1069144 m!987181))

(assert (=> b!1069144 m!987183))

(assert (=> b!1069027 d!129049))

(declare-fun d!129051 () Bool)

(declare-fun e!610137 () Bool)

(assert (=> d!129051 e!610137))

(declare-fun res!713417 () Bool)

(assert (=> d!129051 (=> res!713417 e!610137)))

(declare-fun lt!472324 () Bool)

(assert (=> d!129051 (= res!713417 (not lt!472324))))

(declare-fun lt!472322 () Bool)

(assert (=> d!129051 (= lt!472324 lt!472322)))

(declare-fun lt!472323 () Unit!35014)

(declare-fun e!610136 () Unit!35014)

(assert (=> d!129051 (= lt!472323 e!610136)))

(declare-fun c!107527 () Bool)

(assert (=> d!129051 (= c!107527 lt!472322)))

(declare-fun containsKey!575 (List!22960 (_ BitVec 64)) Bool)

(assert (=> d!129051 (= lt!472322 (containsKey!575 (toList!7213 lt!472232) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129051 (= (contains!6281 lt!472232 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472324)))

(declare-fun b!1069151 () Bool)

(declare-fun lt!472321 () Unit!35014)

(assert (=> b!1069151 (= e!610136 lt!472321)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!407 (List!22960 (_ BitVec 64)) Unit!35014)

(assert (=> b!1069151 (= lt!472321 (lemmaContainsKeyImpliesGetValueByKeyDefined!407 (toList!7213 lt!472232) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!655 0))(
  ( (Some!654 (v!15499 V!39353)) (None!653) )
))
(declare-fun isDefined!450 (Option!655) Bool)

(declare-fun getValueByKey!604 (List!22960 (_ BitVec 64)) Option!655)

(assert (=> b!1069151 (isDefined!450 (getValueByKey!604 (toList!7213 lt!472232) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069152 () Bool)

(declare-fun Unit!35018 () Unit!35014)

(assert (=> b!1069152 (= e!610136 Unit!35018)))

(declare-fun b!1069153 () Bool)

(assert (=> b!1069153 (= e!610137 (isDefined!450 (getValueByKey!604 (toList!7213 lt!472232) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129051 c!107527) b!1069151))

(assert (= (and d!129051 (not c!107527)) b!1069152))

(assert (= (and d!129051 (not res!713417)) b!1069153))

(declare-fun m!987235 () Bool)

(assert (=> d!129051 m!987235))

(declare-fun m!987237 () Bool)

(assert (=> b!1069151 m!987237))

(declare-fun m!987239 () Bool)

(assert (=> b!1069151 m!987239))

(assert (=> b!1069151 m!987239))

(declare-fun m!987241 () Bool)

(assert (=> b!1069151 m!987241))

(assert (=> b!1069153 m!987239))

(assert (=> b!1069153 m!987239))

(assert (=> b!1069153 m!987241))

(assert (=> b!1069026 d!129051))

(declare-fun b!1069196 () Bool)

(declare-fun c!107542 () Bool)

(assert (=> b!1069196 (= c!107542 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!610175 () ListLongMap!14395)

(declare-fun e!610167 () ListLongMap!14395)

(assert (=> b!1069196 (= e!610175 e!610167)))

(declare-fun call!45134 () ListLongMap!14395)

(declare-fun bm!45125 () Bool)

(assert (=> bm!45125 (= call!45134 (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069197 () Bool)

(declare-fun res!713436 () Bool)

(declare-fun e!610176 () Bool)

(assert (=> b!1069197 (=> (not res!713436) (not e!610176))))

(declare-fun e!610173 () Bool)

(assert (=> b!1069197 (= res!713436 e!610173)))

(declare-fun res!713439 () Bool)

(assert (=> b!1069197 (=> res!713439 e!610173)))

(declare-fun e!610172 () Bool)

(assert (=> b!1069197 (= res!713439 (not e!610172))))

(declare-fun res!713440 () Bool)

(assert (=> b!1069197 (=> (not res!713440) (not e!610172))))

(assert (=> b!1069197 (= res!713440 (bvslt #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(declare-fun b!1069198 () Bool)

(declare-fun e!610164 () Bool)

(assert (=> b!1069198 (= e!610173 e!610164)))

(declare-fun res!713444 () Bool)

(assert (=> b!1069198 (=> (not res!713444) (not e!610164))))

(declare-fun lt!472375 () ListLongMap!14395)

(assert (=> b!1069198 (= res!713444 (contains!6281 lt!472375 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069198 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(declare-fun call!45128 () ListLongMap!14395)

(declare-fun c!107544 () Bool)

(declare-fun call!45129 () ListLongMap!14395)

(declare-fun call!45131 () ListLongMap!14395)

(declare-fun c!107540 () Bool)

(declare-fun bm!45126 () Bool)

(assert (=> bm!45126 (= call!45131 (+!3186 (ite c!107544 call!45134 (ite c!107540 call!45128 call!45129)) (ite (or c!107544 c!107540) (tuple2!16427 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1069199 () Bool)

(declare-fun e!610169 () Bool)

(assert (=> b!1069199 (= e!610176 e!610169)))

(declare-fun c!107543 () Bool)

(assert (=> b!1069199 (= c!107543 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1069200 () Bool)

(declare-fun call!45133 () ListLongMap!14395)

(assert (=> b!1069200 (= e!610167 call!45133)))

(declare-fun bm!45127 () Bool)

(assert (=> bm!45127 (= call!45133 call!45131)))

(declare-fun b!1069201 () Bool)

(declare-fun e!610165 () ListLongMap!14395)

(assert (=> b!1069201 (= e!610165 e!610175)))

(assert (=> b!1069201 (= c!107540 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1069203 () Bool)

(declare-fun e!610168 () Unit!35014)

(declare-fun lt!472373 () Unit!35014)

(assert (=> b!1069203 (= e!610168 lt!472373)))

(declare-fun lt!472371 () ListLongMap!14395)

(assert (=> b!1069203 (= lt!472371 (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472382 () (_ BitVec 64))

(assert (=> b!1069203 (= lt!472382 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472377 () (_ BitVec 64))

(assert (=> b!1069203 (= lt!472377 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472379 () Unit!35014)

(declare-fun addStillContains!635 (ListLongMap!14395 (_ BitVec 64) V!39353 (_ BitVec 64)) Unit!35014)

(assert (=> b!1069203 (= lt!472379 (addStillContains!635 lt!472371 lt!472382 zeroValueBefore!47 lt!472377))))

(assert (=> b!1069203 (contains!6281 (+!3186 lt!472371 (tuple2!16427 lt!472382 zeroValueBefore!47)) lt!472377)))

(declare-fun lt!472390 () Unit!35014)

(assert (=> b!1069203 (= lt!472390 lt!472379)))

(declare-fun lt!472383 () ListLongMap!14395)

(assert (=> b!1069203 (= lt!472383 (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472385 () (_ BitVec 64))

(assert (=> b!1069203 (= lt!472385 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472372 () (_ BitVec 64))

(assert (=> b!1069203 (= lt!472372 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472374 () Unit!35014)

(declare-fun addApplyDifferent!491 (ListLongMap!14395 (_ BitVec 64) V!39353 (_ BitVec 64)) Unit!35014)

(assert (=> b!1069203 (= lt!472374 (addApplyDifferent!491 lt!472383 lt!472385 minValue!907 lt!472372))))

(assert (=> b!1069203 (= (apply!920 (+!3186 lt!472383 (tuple2!16427 lt!472385 minValue!907)) lt!472372) (apply!920 lt!472383 lt!472372))))

(declare-fun lt!472384 () Unit!35014)

(assert (=> b!1069203 (= lt!472384 lt!472374)))

(declare-fun lt!472378 () ListLongMap!14395)

(assert (=> b!1069203 (= lt!472378 (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472388 () (_ BitVec 64))

(assert (=> b!1069203 (= lt!472388 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472369 () (_ BitVec 64))

(assert (=> b!1069203 (= lt!472369 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472389 () Unit!35014)

(assert (=> b!1069203 (= lt!472389 (addApplyDifferent!491 lt!472378 lt!472388 zeroValueBefore!47 lt!472369))))

(assert (=> b!1069203 (= (apply!920 (+!3186 lt!472378 (tuple2!16427 lt!472388 zeroValueBefore!47)) lt!472369) (apply!920 lt!472378 lt!472369))))

(declare-fun lt!472370 () Unit!35014)

(assert (=> b!1069203 (= lt!472370 lt!472389)))

(declare-fun lt!472381 () ListLongMap!14395)

(assert (=> b!1069203 (= lt!472381 (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472380 () (_ BitVec 64))

(assert (=> b!1069203 (= lt!472380 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472386 () (_ BitVec 64))

(assert (=> b!1069203 (= lt!472386 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1069203 (= lt!472373 (addApplyDifferent!491 lt!472381 lt!472380 minValue!907 lt!472386))))

(assert (=> b!1069203 (= (apply!920 (+!3186 lt!472381 (tuple2!16427 lt!472380 minValue!907)) lt!472386) (apply!920 lt!472381 lt!472386))))

(declare-fun b!1069204 () Bool)

(assert (=> b!1069204 (= e!610172 (validKeyInArray!0 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069205 () Bool)

(declare-fun Unit!35019 () Unit!35014)

(assert (=> b!1069205 (= e!610168 Unit!35019)))

(declare-fun b!1069206 () Bool)

(assert (=> b!1069206 (= e!610167 call!45129)))

(declare-fun b!1069207 () Bool)

(declare-fun e!610174 () Bool)

(assert (=> b!1069207 (= e!610174 (= (apply!920 lt!472375 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun bm!45128 () Bool)

(assert (=> bm!45128 (= call!45129 call!45128)))

(declare-fun bm!45129 () Bool)

(assert (=> bm!45129 (= call!45128 call!45134)))

(declare-fun b!1069208 () Bool)

(assert (=> b!1069208 (= e!610165 (+!3186 call!45131 (tuple2!16427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45130 () Bool)

(declare-fun call!45130 () Bool)

(assert (=> bm!45130 (= call!45130 (contains!6281 lt!472375 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069209 () Bool)

(declare-fun e!610166 () Bool)

(assert (=> b!1069209 (= e!610166 e!610174)))

(declare-fun res!713441 () Bool)

(declare-fun call!45132 () Bool)

(assert (=> b!1069209 (= res!713441 call!45132)))

(assert (=> b!1069209 (=> (not res!713441) (not e!610174))))

(declare-fun b!1069210 () Bool)

(declare-fun e!610170 () Bool)

(assert (=> b!1069210 (= e!610170 (= (apply!920 lt!472375 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1069211 () Bool)

(declare-fun e!610171 () Bool)

(assert (=> b!1069211 (= e!610171 (validKeyInArray!0 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069212 () Bool)

(assert (=> b!1069212 (= e!610164 (= (apply!920 lt!472375 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)) (get!17102 (select (arr!32822 _values!955) #b00000000000000000000000000000000) (dynLambda!2019 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1069212 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33360 _values!955)))))

(assert (=> b!1069212 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(declare-fun bm!45131 () Bool)

(assert (=> bm!45131 (= call!45132 (contains!6281 lt!472375 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069213 () Bool)

(assert (=> b!1069213 (= e!610169 e!610170)))

(declare-fun res!713442 () Bool)

(assert (=> b!1069213 (= res!713442 call!45130)))

(assert (=> b!1069213 (=> (not res!713442) (not e!610170))))

(declare-fun b!1069214 () Bool)

(declare-fun res!713438 () Bool)

(assert (=> b!1069214 (=> (not res!713438) (not e!610176))))

(assert (=> b!1069214 (= res!713438 e!610166)))

(declare-fun c!107541 () Bool)

(assert (=> b!1069214 (= c!107541 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069202 () Bool)

(assert (=> b!1069202 (= e!610166 (not call!45132))))

(declare-fun d!129053 () Bool)

(assert (=> d!129053 e!610176))

(declare-fun res!713437 () Bool)

(assert (=> d!129053 (=> (not res!713437) (not e!610176))))

(assert (=> d!129053 (= res!713437 (or (bvsge #b00000000000000000000000000000000 (size!33361 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33361 _keys!1163)))))))

(declare-fun lt!472387 () ListLongMap!14395)

(assert (=> d!129053 (= lt!472375 lt!472387)))

(declare-fun lt!472376 () Unit!35014)

(assert (=> d!129053 (= lt!472376 e!610168)))

(declare-fun c!107545 () Bool)

(assert (=> d!129053 (= c!107545 e!610171)))

(declare-fun res!713443 () Bool)

(assert (=> d!129053 (=> (not res!713443) (not e!610171))))

(assert (=> d!129053 (= res!713443 (bvslt #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(assert (=> d!129053 (= lt!472387 e!610165)))

(assert (=> d!129053 (= c!107544 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129053 (validMask!0 mask!1515)))

(assert (=> d!129053 (= (getCurrentListMap!4049 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472375)))

(declare-fun b!1069215 () Bool)

(assert (=> b!1069215 (= e!610169 (not call!45130))))

(declare-fun b!1069216 () Bool)

(assert (=> b!1069216 (= e!610175 call!45133)))

(assert (= (and d!129053 c!107544) b!1069208))

(assert (= (and d!129053 (not c!107544)) b!1069201))

(assert (= (and b!1069201 c!107540) b!1069216))

(assert (= (and b!1069201 (not c!107540)) b!1069196))

(assert (= (and b!1069196 c!107542) b!1069200))

(assert (= (and b!1069196 (not c!107542)) b!1069206))

(assert (= (or b!1069200 b!1069206) bm!45128))

(assert (= (or b!1069216 bm!45128) bm!45129))

(assert (= (or b!1069216 b!1069200) bm!45127))

(assert (= (or b!1069208 bm!45129) bm!45125))

(assert (= (or b!1069208 bm!45127) bm!45126))

(assert (= (and d!129053 res!713443) b!1069211))

(assert (= (and d!129053 c!107545) b!1069203))

(assert (= (and d!129053 (not c!107545)) b!1069205))

(assert (= (and d!129053 res!713437) b!1069197))

(assert (= (and b!1069197 res!713440) b!1069204))

(assert (= (and b!1069197 (not res!713439)) b!1069198))

(assert (= (and b!1069198 res!713444) b!1069212))

(assert (= (and b!1069197 res!713436) b!1069214))

(assert (= (and b!1069214 c!107541) b!1069209))

(assert (= (and b!1069214 (not c!107541)) b!1069202))

(assert (= (and b!1069209 res!713441) b!1069207))

(assert (= (or b!1069209 b!1069202) bm!45131))

(assert (= (and b!1069214 res!713438) b!1069199))

(assert (= (and b!1069199 c!107543) b!1069213))

(assert (= (and b!1069199 (not c!107543)) b!1069215))

(assert (= (and b!1069213 res!713442) b!1069210))

(assert (= (or b!1069213 b!1069215) bm!45130))

(declare-fun b_lambda!16607 () Bool)

(assert (=> (not b_lambda!16607) (not b!1069212)))

(assert (=> b!1069212 t!32283))

(declare-fun b_and!34643 () Bool)

(assert (= b_and!34641 (and (=> t!32283 result!14747) b_and!34643)))

(declare-fun m!987243 () Bool)

(assert (=> b!1069207 m!987243))

(assert (=> b!1069204 m!987181))

(assert (=> b!1069204 m!987181))

(assert (=> b!1069204 m!987183))

(declare-fun m!987245 () Bool)

(assert (=> b!1069210 m!987245))

(assert (=> bm!45125 m!987111))

(declare-fun m!987247 () Bool)

(assert (=> bm!45126 m!987247))

(declare-fun m!987249 () Bool)

(assert (=> bm!45131 m!987249))

(assert (=> b!1069212 m!987193))

(assert (=> b!1069212 m!987181))

(assert (=> b!1069212 m!987181))

(declare-fun m!987251 () Bool)

(assert (=> b!1069212 m!987251))

(assert (=> b!1069212 m!987193))

(assert (=> b!1069212 m!987191))

(assert (=> b!1069212 m!987195))

(assert (=> b!1069212 m!987191))

(assert (=> d!129053 m!987097))

(declare-fun m!987253 () Bool)

(assert (=> bm!45130 m!987253))

(assert (=> b!1069203 m!987181))

(declare-fun m!987255 () Bool)

(assert (=> b!1069203 m!987255))

(declare-fun m!987257 () Bool)

(assert (=> b!1069203 m!987257))

(declare-fun m!987259 () Bool)

(assert (=> b!1069203 m!987259))

(declare-fun m!987261 () Bool)

(assert (=> b!1069203 m!987261))

(assert (=> b!1069203 m!987111))

(declare-fun m!987263 () Bool)

(assert (=> b!1069203 m!987263))

(assert (=> b!1069203 m!987255))

(declare-fun m!987265 () Bool)

(assert (=> b!1069203 m!987265))

(declare-fun m!987267 () Bool)

(assert (=> b!1069203 m!987267))

(assert (=> b!1069203 m!987263))

(declare-fun m!987269 () Bool)

(assert (=> b!1069203 m!987269))

(declare-fun m!987271 () Bool)

(assert (=> b!1069203 m!987271))

(declare-fun m!987273 () Bool)

(assert (=> b!1069203 m!987273))

(assert (=> b!1069203 m!987267))

(declare-fun m!987275 () Bool)

(assert (=> b!1069203 m!987275))

(declare-fun m!987277 () Bool)

(assert (=> b!1069203 m!987277))

(declare-fun m!987279 () Bool)

(assert (=> b!1069203 m!987279))

(assert (=> b!1069203 m!987273))

(declare-fun m!987281 () Bool)

(assert (=> b!1069203 m!987281))

(declare-fun m!987283 () Bool)

(assert (=> b!1069203 m!987283))

(declare-fun m!987285 () Bool)

(assert (=> b!1069208 m!987285))

(assert (=> b!1069211 m!987181))

(assert (=> b!1069211 m!987181))

(assert (=> b!1069211 m!987183))

(assert (=> b!1069198 m!987181))

(assert (=> b!1069198 m!987181))

(declare-fun m!987287 () Bool)

(assert (=> b!1069198 m!987287))

(assert (=> b!1069026 d!129053))

(declare-fun bm!45134 () Bool)

(declare-fun call!45137 () Bool)

(declare-fun c!107548 () Bool)

(assert (=> bm!45134 (= call!45137 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107548 (Cons!22957 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000) Nil!22958) Nil!22958)))))

(declare-fun d!129055 () Bool)

(declare-fun res!713451 () Bool)

(declare-fun e!610186 () Bool)

(assert (=> d!129055 (=> res!713451 e!610186)))

(assert (=> d!129055 (= res!713451 (bvsge #b00000000000000000000000000000000 (size!33361 _keys!1163)))))

(assert (=> d!129055 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22958) e!610186)))

(declare-fun b!1069227 () Bool)

(declare-fun e!610187 () Bool)

(assert (=> b!1069227 (= e!610186 e!610187)))

(declare-fun res!713453 () Bool)

(assert (=> b!1069227 (=> (not res!713453) (not e!610187))))

(declare-fun e!610188 () Bool)

(assert (=> b!1069227 (= res!713453 (not e!610188))))

(declare-fun res!713452 () Bool)

(assert (=> b!1069227 (=> (not res!713452) (not e!610188))))

(assert (=> b!1069227 (= res!713452 (validKeyInArray!0 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069228 () Bool)

(declare-fun contains!6283 (List!22961 (_ BitVec 64)) Bool)

(assert (=> b!1069228 (= e!610188 (contains!6283 Nil!22958 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069229 () Bool)

(declare-fun e!610185 () Bool)

(assert (=> b!1069229 (= e!610187 e!610185)))

(assert (=> b!1069229 (= c!107548 (validKeyInArray!0 (select (arr!32823 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069230 () Bool)

(assert (=> b!1069230 (= e!610185 call!45137)))

(declare-fun b!1069231 () Bool)

(assert (=> b!1069231 (= e!610185 call!45137)))

(assert (= (and d!129055 (not res!713451)) b!1069227))

(assert (= (and b!1069227 res!713452) b!1069228))

(assert (= (and b!1069227 res!713453) b!1069229))

(assert (= (and b!1069229 c!107548) b!1069231))

(assert (= (and b!1069229 (not c!107548)) b!1069230))

(assert (= (or b!1069231 b!1069230) bm!45134))

(assert (=> bm!45134 m!987181))

(declare-fun m!987289 () Bool)

(assert (=> bm!45134 m!987289))

(assert (=> b!1069227 m!987181))

(assert (=> b!1069227 m!987181))

(assert (=> b!1069227 m!987183))

(assert (=> b!1069228 m!987181))

(assert (=> b!1069228 m!987181))

(declare-fun m!987291 () Bool)

(assert (=> b!1069228 m!987291))

(assert (=> b!1069229 m!987181))

(assert (=> b!1069229 m!987181))

(assert (=> b!1069229 m!987183))

(assert (=> b!1069022 d!129055))

(declare-fun mapIsEmpty!40201 () Bool)

(declare-fun mapRes!40201 () Bool)

(assert (=> mapIsEmpty!40201 mapRes!40201))

(declare-fun b!1069238 () Bool)

(declare-fun e!610193 () Bool)

(assert (=> b!1069238 (= e!610193 tp_is_empty!25663)))

(declare-fun b!1069239 () Bool)

(declare-fun e!610194 () Bool)

(assert (=> b!1069239 (= e!610194 tp_is_empty!25663)))

(declare-fun mapNonEmpty!40201 () Bool)

(declare-fun tp!77024 () Bool)

(assert (=> mapNonEmpty!40201 (= mapRes!40201 (and tp!77024 e!610193))))

(declare-fun mapRest!40201 () (Array (_ BitVec 32) ValueCell!12128))

(declare-fun mapKey!40201 () (_ BitVec 32))

(declare-fun mapValue!40201 () ValueCell!12128)

(assert (=> mapNonEmpty!40201 (= mapRest!40192 (store mapRest!40201 mapKey!40201 mapValue!40201))))

(declare-fun condMapEmpty!40201 () Bool)

(declare-fun mapDefault!40201 () ValueCell!12128)

(assert (=> mapNonEmpty!40192 (= condMapEmpty!40201 (= mapRest!40192 ((as const (Array (_ BitVec 32) ValueCell!12128)) mapDefault!40201)))))

(assert (=> mapNonEmpty!40192 (= tp!77009 (and e!610194 mapRes!40201))))

(assert (= (and mapNonEmpty!40192 condMapEmpty!40201) mapIsEmpty!40201))

(assert (= (and mapNonEmpty!40192 (not condMapEmpty!40201)) mapNonEmpty!40201))

(assert (= (and mapNonEmpty!40201 ((_ is ValueCellFull!12128) mapValue!40201)) b!1069238))

(assert (= (and mapNonEmpty!40192 ((_ is ValueCellFull!12128) mapDefault!40201)) b!1069239))

(declare-fun m!987293 () Bool)

(assert (=> mapNonEmpty!40201 m!987293))

(declare-fun b_lambda!16609 () Bool)

(assert (= b_lambda!16603 (or (and start!94542 b_free!21853) b_lambda!16609)))

(declare-fun b_lambda!16611 () Bool)

(assert (= b_lambda!16605 (or (and start!94542 b_free!21853) b_lambda!16611)))

(declare-fun b_lambda!16613 () Bool)

(assert (= b_lambda!16607 (or (and start!94542 b_free!21853) b_lambda!16613)))

(declare-fun b_lambda!16615 () Bool)

(assert (= b_lambda!16601 (or (and start!94542 b_free!21853) b_lambda!16615)))

(declare-fun b_lambda!16617 () Bool)

(assert (= b_lambda!16599 (or (and start!94542 b_free!21853) b_lambda!16617)))

(check-sat (not mapNonEmpty!40201) (not b!1069109) (not b!1069229) (not b_lambda!16613) (not b!1069144) (not bm!45131) (not bm!45107) (not bm!45130) (not d!129033) (not b!1069112) (not b!1069132) (not d!129035) (not d!129051) (not b!1069228) (not b!1069153) (not b!1069111) (not b_next!21853) (not b_lambda!16611) (not b_lambda!16617) (not b!1069126) (not b!1069124) (not b!1069208) (not d!129053) (not d!129037) (not bm!45125) (not b!1069151) (not b!1069113) (not bm!45134) (not b!1069203) (not b!1069130) (not b!1069118) (not b!1069210) (not b!1069212) (not b!1069125) (not b_lambda!16609) (not bm!45110) (not bm!45126) (not b!1069211) tp_is_empty!25663 (not b!1069122) (not b!1069108) (not b_lambda!16615) b_and!34643 (not bm!45106) (not d!129041) (not b!1069110) (not b!1069142) (not b!1069207) (not b!1069227) (not b!1069198) (not d!129039) (not b!1069127) (not b!1069116) (not b!1069204) (not b!1069123))
(check-sat b_and!34643 (not b_next!21853))
