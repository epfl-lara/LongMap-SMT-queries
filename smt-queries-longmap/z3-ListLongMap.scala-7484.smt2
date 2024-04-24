; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95088 () Bool)

(assert start!95088)

(declare-fun b_free!22081 () Bool)

(declare-fun b_next!22081 () Bool)

(assert (=> start!95088 (= b_free!22081 (not b_next!22081))))

(declare-fun tp!77704 () Bool)

(declare-fun b_and!34933 () Bool)

(assert (=> start!95088 (= tp!77704 b_and!34933)))

(declare-fun b!1073919 () Bool)

(declare-fun res!715993 () Bool)

(declare-fun e!613520 () Bool)

(assert (=> b!1073919 (=> (not res!715993) (not e!613520))))

(declare-datatypes ((array!68791 0))(
  ( (array!68792 (arr!33084 (Array (_ BitVec 32) (_ BitVec 64))) (size!33621 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68791)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68791 (_ BitVec 32)) Bool)

(assert (=> b!1073919 (= res!715993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073920 () Bool)

(declare-fun e!613522 () Bool)

(declare-fun tp_is_empty!25891 () Bool)

(assert (=> b!1073920 (= e!613522 tp_is_empty!25891)))

(declare-fun b!1073921 () Bool)

(declare-fun e!613523 () Bool)

(assert (=> b!1073921 (= e!613523 (bvsle #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(declare-fun mapNonEmpty!40546 () Bool)

(declare-fun mapRes!40546 () Bool)

(declare-fun tp!77705 () Bool)

(assert (=> mapNonEmpty!40546 (= mapRes!40546 (and tp!77705 e!613522))))

(declare-datatypes ((V!39657 0))(
  ( (V!39658 (val!12996 Int)) )
))
(declare-datatypes ((ValueCell!12242 0))(
  ( (ValueCellFull!12242 (v!15609 V!39657)) (EmptyCell!12242) )
))
(declare-fun mapValue!40546 () ValueCell!12242)

(declare-datatypes ((array!68793 0))(
  ( (array!68794 (arr!33085 (Array (_ BitVec 32) ValueCell!12242)) (size!33622 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68793)

(declare-fun mapRest!40546 () (Array (_ BitVec 32) ValueCell!12242))

(declare-fun mapKey!40546 () (_ BitVec 32))

(assert (=> mapNonEmpty!40546 (= (arr!33085 _values!955) (store mapRest!40546 mapKey!40546 mapValue!40546))))

(declare-fun res!715996 () Bool)

(assert (=> start!95088 (=> (not res!715996) (not e!613520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95088 (= res!715996 (validMask!0 mask!1515))))

(assert (=> start!95088 e!613520))

(assert (=> start!95088 true))

(assert (=> start!95088 tp_is_empty!25891))

(declare-fun e!613524 () Bool)

(declare-fun array_inv!25608 (array!68793) Bool)

(assert (=> start!95088 (and (array_inv!25608 _values!955) e!613524)))

(assert (=> start!95088 tp!77704))

(declare-fun array_inv!25609 (array!68791) Bool)

(assert (=> start!95088 (array_inv!25609 _keys!1163)))

(declare-fun b!1073922 () Bool)

(declare-fun e!613521 () Bool)

(assert (=> b!1073922 (= e!613524 (and e!613521 mapRes!40546))))

(declare-fun condMapEmpty!40546 () Bool)

(declare-fun mapDefault!40546 () ValueCell!12242)

(assert (=> b!1073922 (= condMapEmpty!40546 (= (arr!33085 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12242)) mapDefault!40546)))))

(declare-fun b!1073923 () Bool)

(declare-fun res!715997 () Bool)

(assert (=> b!1073923 (=> (not res!715997) (not e!613520))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073923 (= res!715997 (and (= (size!33622 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33621 _keys!1163) (size!33622 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073924 () Bool)

(assert (=> b!1073924 (= e!613521 tp_is_empty!25891)))

(declare-fun mapIsEmpty!40546 () Bool)

(assert (=> mapIsEmpty!40546 mapRes!40546))

(declare-fun b!1073925 () Bool)

(declare-fun e!613519 () Bool)

(assert (=> b!1073925 (= e!613520 (not e!613519))))

(declare-fun res!715998 () Bool)

(assert (=> b!1073925 (=> res!715998 e!613519)))

(assert (=> b!1073925 (= res!715998 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16528 0))(
  ( (tuple2!16529 (_1!8275 (_ BitVec 64)) (_2!8275 V!39657)) )
))
(declare-datatypes ((List!23085 0))(
  ( (Nil!23082) (Cons!23081 (h!24299 tuple2!16528) (t!32412 List!23085)) )
))
(declare-datatypes ((ListLongMap!14505 0))(
  ( (ListLongMap!14506 (toList!7268 List!23085)) )
))
(declare-fun lt!476134 () ListLongMap!14505)

(declare-fun lt!476133 () ListLongMap!14505)

(assert (=> b!1073925 (= lt!476134 lt!476133)))

(declare-fun zeroValueBefore!47 () V!39657)

(declare-datatypes ((Unit!35315 0))(
  ( (Unit!35316) )
))
(declare-fun lt!476143 () Unit!35315)

(declare-fun minValue!907 () V!39657)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39657)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!870 (array!68791 array!68793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39657 V!39657 V!39657 V!39657 (_ BitVec 32) Int) Unit!35315)

(assert (=> b!1073925 (= lt!476143 (lemmaNoChangeToArrayThenSameMapNoExtras!870 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3867 (array!68791 array!68793 (_ BitVec 32) (_ BitVec 32) V!39657 V!39657 (_ BitVec 32) Int) ListLongMap!14505)

(assert (=> b!1073925 (= lt!476133 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073925 (= lt!476134 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073926 () Bool)

(assert (=> b!1073926 (= e!613519 e!613523)))

(declare-fun res!715999 () Bool)

(assert (=> b!1073926 (=> res!715999 e!613523)))

(declare-fun lt!476140 () ListLongMap!14505)

(declare-fun lt!476136 () ListLongMap!14505)

(declare-fun -!696 (ListLongMap!14505 (_ BitVec 64)) ListLongMap!14505)

(assert (=> b!1073926 (= res!715999 (not (= (-!696 lt!476140 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476136)))))

(declare-fun lt!476139 () ListLongMap!14505)

(declare-fun lt!476144 () ListLongMap!14505)

(assert (=> b!1073926 (= lt!476139 lt!476144)))

(declare-fun lt!476138 () Unit!35315)

(declare-fun addCommutativeForDiffKeys!753 (ListLongMap!14505 (_ BitVec 64) V!39657 (_ BitVec 64) V!39657) Unit!35315)

(assert (=> b!1073926 (= lt!476138 (addCommutativeForDiffKeys!753 lt!476134 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!476142 () ListLongMap!14505)

(assert (=> b!1073926 (= (-!696 lt!476144 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476142)))

(declare-fun lt!476135 () tuple2!16528)

(declare-fun +!3231 (ListLongMap!14505 tuple2!16528) ListLongMap!14505)

(assert (=> b!1073926 (= lt!476144 (+!3231 lt!476142 lt!476135))))

(declare-fun lt!476141 () Unit!35315)

(declare-fun addThenRemoveForNewKeyIsSame!71 (ListLongMap!14505 (_ BitVec 64) V!39657) Unit!35315)

(assert (=> b!1073926 (= lt!476141 (addThenRemoveForNewKeyIsSame!71 lt!476142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!476137 () tuple2!16528)

(assert (=> b!1073926 (= lt!476142 (+!3231 lt!476134 lt!476137))))

(declare-fun e!613526 () Bool)

(assert (=> b!1073926 e!613526))

(declare-fun res!715995 () Bool)

(assert (=> b!1073926 (=> (not res!715995) (not e!613526))))

(assert (=> b!1073926 (= res!715995 (= lt!476140 lt!476139))))

(assert (=> b!1073926 (= lt!476139 (+!3231 (+!3231 lt!476134 lt!476135) lt!476137))))

(assert (=> b!1073926 (= lt!476137 (tuple2!16529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1073926 (= lt!476135 (tuple2!16529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4157 (array!68791 array!68793 (_ BitVec 32) (_ BitVec 32) V!39657 V!39657 (_ BitVec 32) Int) ListLongMap!14505)

(assert (=> b!1073926 (= lt!476136 (getCurrentListMap!4157 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073926 (= lt!476140 (getCurrentListMap!4157 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073927 () Bool)

(assert (=> b!1073927 (= e!613526 (= lt!476136 (+!3231 lt!476133 lt!476137)))))

(declare-fun b!1073928 () Bool)

(declare-fun res!715994 () Bool)

(assert (=> b!1073928 (=> (not res!715994) (not e!613520))))

(declare-datatypes ((List!23086 0))(
  ( (Nil!23083) (Cons!23082 (h!24300 (_ BitVec 64)) (t!32413 List!23086)) )
))
(declare-fun arrayNoDuplicates!0 (array!68791 (_ BitVec 32) List!23086) Bool)

(assert (=> b!1073928 (= res!715994 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23083))))

(assert (= (and start!95088 res!715996) b!1073923))

(assert (= (and b!1073923 res!715997) b!1073919))

(assert (= (and b!1073919 res!715993) b!1073928))

(assert (= (and b!1073928 res!715994) b!1073925))

(assert (= (and b!1073925 (not res!715998)) b!1073926))

(assert (= (and b!1073926 res!715995) b!1073927))

(assert (= (and b!1073926 (not res!715999)) b!1073921))

(assert (= (and b!1073922 condMapEmpty!40546) mapIsEmpty!40546))

(assert (= (and b!1073922 (not condMapEmpty!40546)) mapNonEmpty!40546))

(get-info :version)

(assert (= (and mapNonEmpty!40546 ((_ is ValueCellFull!12242) mapValue!40546)) b!1073920))

(assert (= (and b!1073922 ((_ is ValueCellFull!12242) mapDefault!40546)) b!1073924))

(assert (= start!95088 b!1073922))

(declare-fun m!993285 () Bool)

(assert (=> b!1073919 m!993285))

(declare-fun m!993287 () Bool)

(assert (=> b!1073928 m!993287))

(declare-fun m!993289 () Bool)

(assert (=> b!1073927 m!993289))

(declare-fun m!993291 () Bool)

(assert (=> mapNonEmpty!40546 m!993291))

(declare-fun m!993293 () Bool)

(assert (=> start!95088 m!993293))

(declare-fun m!993295 () Bool)

(assert (=> start!95088 m!993295))

(declare-fun m!993297 () Bool)

(assert (=> start!95088 m!993297))

(declare-fun m!993299 () Bool)

(assert (=> b!1073926 m!993299))

(declare-fun m!993301 () Bool)

(assert (=> b!1073926 m!993301))

(declare-fun m!993303 () Bool)

(assert (=> b!1073926 m!993303))

(declare-fun m!993305 () Bool)

(assert (=> b!1073926 m!993305))

(declare-fun m!993307 () Bool)

(assert (=> b!1073926 m!993307))

(declare-fun m!993309 () Bool)

(assert (=> b!1073926 m!993309))

(declare-fun m!993311 () Bool)

(assert (=> b!1073926 m!993311))

(declare-fun m!993313 () Bool)

(assert (=> b!1073926 m!993313))

(assert (=> b!1073926 m!993301))

(declare-fun m!993315 () Bool)

(assert (=> b!1073926 m!993315))

(declare-fun m!993317 () Bool)

(assert (=> b!1073926 m!993317))

(declare-fun m!993319 () Bool)

(assert (=> b!1073925 m!993319))

(declare-fun m!993321 () Bool)

(assert (=> b!1073925 m!993321))

(declare-fun m!993323 () Bool)

(assert (=> b!1073925 m!993323))

(check-sat b_and!34933 (not b!1073919) tp_is_empty!25891 (not start!95088) (not mapNonEmpty!40546) (not b!1073927) (not b!1073928) (not b!1073926) (not b_next!22081) (not b!1073925))
(check-sat b_and!34933 (not b_next!22081))
(get-model)

(declare-fun d!129825 () Bool)

(assert (=> d!129825 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95088 d!129825))

(declare-fun d!129827 () Bool)

(assert (=> d!129827 (= (array_inv!25608 _values!955) (bvsge (size!33622 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95088 d!129827))

(declare-fun d!129829 () Bool)

(assert (=> d!129829 (= (array_inv!25609 _keys!1163) (bvsge (size!33621 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95088 d!129829))

(declare-fun d!129831 () Bool)

(declare-fun e!613577 () Bool)

(assert (=> d!129831 e!613577))

(declare-fun res!716046 () Bool)

(assert (=> d!129831 (=> (not res!716046) (not e!613577))))

(declare-fun lt!476227 () ListLongMap!14505)

(declare-fun contains!6349 (ListLongMap!14505 (_ BitVec 64)) Bool)

(assert (=> d!129831 (= res!716046 (contains!6349 lt!476227 (_1!8275 lt!476137)))))

(declare-fun lt!476225 () List!23085)

(assert (=> d!129831 (= lt!476227 (ListLongMap!14506 lt!476225))))

(declare-fun lt!476228 () Unit!35315)

(declare-fun lt!476226 () Unit!35315)

(assert (=> d!129831 (= lt!476228 lt!476226)))

(declare-datatypes ((Option!651 0))(
  ( (Some!650 (v!15612 V!39657)) (None!649) )
))
(declare-fun getValueByKey!600 (List!23085 (_ BitVec 64)) Option!651)

(assert (=> d!129831 (= (getValueByKey!600 lt!476225 (_1!8275 lt!476137)) (Some!650 (_2!8275 lt!476137)))))

(declare-fun lemmaContainsTupThenGetReturnValue!286 (List!23085 (_ BitVec 64) V!39657) Unit!35315)

(assert (=> d!129831 (= lt!476226 (lemmaContainsTupThenGetReturnValue!286 lt!476225 (_1!8275 lt!476137) (_2!8275 lt!476137)))))

(declare-fun insertStrictlySorted!379 (List!23085 (_ BitVec 64) V!39657) List!23085)

(assert (=> d!129831 (= lt!476225 (insertStrictlySorted!379 (toList!7268 lt!476134) (_1!8275 lt!476137) (_2!8275 lt!476137)))))

(assert (=> d!129831 (= (+!3231 lt!476134 lt!476137) lt!476227)))

(declare-fun b!1073993 () Bool)

(declare-fun res!716047 () Bool)

(assert (=> b!1073993 (=> (not res!716047) (not e!613577))))

(assert (=> b!1073993 (= res!716047 (= (getValueByKey!600 (toList!7268 lt!476227) (_1!8275 lt!476137)) (Some!650 (_2!8275 lt!476137))))))

(declare-fun b!1073994 () Bool)

(declare-fun contains!6350 (List!23085 tuple2!16528) Bool)

(assert (=> b!1073994 (= e!613577 (contains!6350 (toList!7268 lt!476227) lt!476137))))

(assert (= (and d!129831 res!716046) b!1073993))

(assert (= (and b!1073993 res!716047) b!1073994))

(declare-fun m!993405 () Bool)

(assert (=> d!129831 m!993405))

(declare-fun m!993407 () Bool)

(assert (=> d!129831 m!993407))

(declare-fun m!993409 () Bool)

(assert (=> d!129831 m!993409))

(declare-fun m!993411 () Bool)

(assert (=> d!129831 m!993411))

(declare-fun m!993413 () Bool)

(assert (=> b!1073993 m!993413))

(declare-fun m!993415 () Bool)

(assert (=> b!1073994 m!993415))

(assert (=> b!1073926 d!129831))

(declare-fun d!129833 () Bool)

(declare-fun lt!476231 () ListLongMap!14505)

(assert (=> d!129833 (not (contains!6349 lt!476231 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!73 (List!23085 (_ BitVec 64)) List!23085)

(assert (=> d!129833 (= lt!476231 (ListLongMap!14506 (removeStrictlySorted!73 (toList!7268 lt!476144) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129833 (= (-!696 lt!476144 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476231)))

(declare-fun bs!31627 () Bool)

(assert (= bs!31627 d!129833))

(declare-fun m!993417 () Bool)

(assert (=> bs!31627 m!993417))

(declare-fun m!993419 () Bool)

(assert (=> bs!31627 m!993419))

(assert (=> b!1073926 d!129833))

(declare-fun b!1074037 () Bool)

(declare-fun e!613606 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1074037 (= e!613606 (validKeyInArray!0 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45318 () Bool)

(declare-fun call!45324 () Bool)

(declare-fun lt!476292 () ListLongMap!14505)

(assert (=> bm!45318 (= call!45324 (contains!6349 lt!476292 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074038 () Bool)

(declare-fun e!613608 () ListLongMap!14505)

(declare-fun call!45327 () ListLongMap!14505)

(assert (=> b!1074038 (= e!613608 call!45327)))

(declare-fun bm!45319 () Bool)

(declare-fun call!45322 () ListLongMap!14505)

(assert (=> bm!45319 (= call!45322 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074039 () Bool)

(declare-fun res!716074 () Bool)

(declare-fun e!613613 () Bool)

(assert (=> b!1074039 (=> (not res!716074) (not e!613613))))

(declare-fun e!613604 () Bool)

(assert (=> b!1074039 (= res!716074 e!613604)))

(declare-fun c!108118 () Bool)

(assert (=> b!1074039 (= c!108118 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45320 () Bool)

(declare-fun call!45326 () Bool)

(assert (=> bm!45320 (= call!45326 (contains!6349 lt!476292 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45321 () Bool)

(declare-fun call!45323 () ListLongMap!14505)

(assert (=> bm!45321 (= call!45327 call!45323)))

(declare-fun b!1074041 () Bool)

(declare-fun e!613605 () Unit!35315)

(declare-fun Unit!35321 () Unit!35315)

(assert (=> b!1074041 (= e!613605 Unit!35321)))

(declare-fun b!1074042 () Bool)

(declare-fun e!613609 () Bool)

(declare-fun e!613614 () Bool)

(assert (=> b!1074042 (= e!613609 e!613614)))

(declare-fun res!716067 () Bool)

(assert (=> b!1074042 (= res!716067 call!45324)))

(assert (=> b!1074042 (=> (not res!716067) (not e!613614))))

(declare-fun b!1074043 () Bool)

(declare-fun lt!476290 () Unit!35315)

(assert (=> b!1074043 (= e!613605 lt!476290)))

(declare-fun lt!476291 () ListLongMap!14505)

(assert (=> b!1074043 (= lt!476291 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476293 () (_ BitVec 64))

(assert (=> b!1074043 (= lt!476293 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476289 () (_ BitVec 64))

(assert (=> b!1074043 (= lt!476289 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476297 () Unit!35315)

(declare-fun addStillContains!645 (ListLongMap!14505 (_ BitVec 64) V!39657 (_ BitVec 64)) Unit!35315)

(assert (=> b!1074043 (= lt!476297 (addStillContains!645 lt!476291 lt!476293 zeroValueAfter!47 lt!476289))))

(assert (=> b!1074043 (contains!6349 (+!3231 lt!476291 (tuple2!16529 lt!476293 zeroValueAfter!47)) lt!476289)))

(declare-fun lt!476285 () Unit!35315)

(assert (=> b!1074043 (= lt!476285 lt!476297)))

(declare-fun lt!476286 () ListLongMap!14505)

(assert (=> b!1074043 (= lt!476286 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476296 () (_ BitVec 64))

(assert (=> b!1074043 (= lt!476296 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476279 () (_ BitVec 64))

(assert (=> b!1074043 (= lt!476279 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476288 () Unit!35315)

(declare-fun addApplyDifferent!501 (ListLongMap!14505 (_ BitVec 64) V!39657 (_ BitVec 64)) Unit!35315)

(assert (=> b!1074043 (= lt!476288 (addApplyDifferent!501 lt!476286 lt!476296 minValue!907 lt!476279))))

(declare-fun apply!940 (ListLongMap!14505 (_ BitVec 64)) V!39657)

(assert (=> b!1074043 (= (apply!940 (+!3231 lt!476286 (tuple2!16529 lt!476296 minValue!907)) lt!476279) (apply!940 lt!476286 lt!476279))))

(declare-fun lt!476287 () Unit!35315)

(assert (=> b!1074043 (= lt!476287 lt!476288)))

(declare-fun lt!476278 () ListLongMap!14505)

(assert (=> b!1074043 (= lt!476278 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476277 () (_ BitVec 64))

(assert (=> b!1074043 (= lt!476277 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476295 () (_ BitVec 64))

(assert (=> b!1074043 (= lt!476295 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476276 () Unit!35315)

(assert (=> b!1074043 (= lt!476276 (addApplyDifferent!501 lt!476278 lt!476277 zeroValueAfter!47 lt!476295))))

(assert (=> b!1074043 (= (apply!940 (+!3231 lt!476278 (tuple2!16529 lt!476277 zeroValueAfter!47)) lt!476295) (apply!940 lt!476278 lt!476295))))

(declare-fun lt!476294 () Unit!35315)

(assert (=> b!1074043 (= lt!476294 lt!476276)))

(declare-fun lt!476284 () ListLongMap!14505)

(assert (=> b!1074043 (= lt!476284 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476281 () (_ BitVec 64))

(assert (=> b!1074043 (= lt!476281 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476283 () (_ BitVec 64))

(assert (=> b!1074043 (= lt!476283 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074043 (= lt!476290 (addApplyDifferent!501 lt!476284 lt!476281 minValue!907 lt!476283))))

(assert (=> b!1074043 (= (apply!940 (+!3231 lt!476284 (tuple2!16529 lt!476281 minValue!907)) lt!476283) (apply!940 lt!476284 lt!476283))))

(declare-fun b!1074044 () Bool)

(assert (=> b!1074044 (= e!613613 e!613609)))

(declare-fun c!108119 () Bool)

(assert (=> b!1074044 (= c!108119 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074045 () Bool)

(declare-fun call!45321 () ListLongMap!14505)

(assert (=> b!1074045 (= e!613608 call!45321)))

(declare-fun b!1074046 () Bool)

(assert (=> b!1074046 (= e!613604 (not call!45326))))

(declare-fun b!1074047 () Bool)

(declare-fun e!613615 () ListLongMap!14505)

(declare-fun e!613612 () ListLongMap!14505)

(assert (=> b!1074047 (= e!613615 e!613612)))

(declare-fun c!108123 () Bool)

(assert (=> b!1074047 (= c!108123 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45322 () Bool)

(declare-fun call!45325 () ListLongMap!14505)

(assert (=> bm!45322 (= call!45321 call!45325)))

(declare-fun b!1074048 () Bool)

(assert (=> b!1074048 (= e!613612 call!45327)))

(declare-fun bm!45323 () Bool)

(declare-fun c!108121 () Bool)

(assert (=> bm!45323 (= call!45323 (+!3231 (ite c!108121 call!45322 (ite c!108123 call!45325 call!45321)) (ite (or c!108121 c!108123) (tuple2!16529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1074049 () Bool)

(declare-fun e!613616 () Bool)

(declare-fun get!17216 (ValueCell!12242 V!39657) V!39657)

(declare-fun dynLambda!2055 (Int (_ BitVec 64)) V!39657)

(assert (=> b!1074049 (= e!613616 (= (apply!940 lt!476292 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)) (get!17216 (select (arr!33085 _values!955) #b00000000000000000000000000000000) (dynLambda!2055 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074049 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33622 _values!955)))))

(assert (=> b!1074049 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(declare-fun bm!45324 () Bool)

(assert (=> bm!45324 (= call!45325 call!45322)))

(declare-fun b!1074040 () Bool)

(declare-fun e!613607 () Bool)

(assert (=> b!1074040 (= e!613604 e!613607)))

(declare-fun res!716071 () Bool)

(assert (=> b!1074040 (= res!716071 call!45326)))

(assert (=> b!1074040 (=> (not res!716071) (not e!613607))))

(declare-fun d!129835 () Bool)

(assert (=> d!129835 e!613613))

(declare-fun res!716073 () Bool)

(assert (=> d!129835 (=> (not res!716073) (not e!613613))))

(assert (=> d!129835 (= res!716073 (or (bvsge #b00000000000000000000000000000000 (size!33621 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))))

(declare-fun lt!476282 () ListLongMap!14505)

(assert (=> d!129835 (= lt!476292 lt!476282)))

(declare-fun lt!476280 () Unit!35315)

(assert (=> d!129835 (= lt!476280 e!613605)))

(declare-fun c!108120 () Bool)

(assert (=> d!129835 (= c!108120 e!613606)))

(declare-fun res!716068 () Bool)

(assert (=> d!129835 (=> (not res!716068) (not e!613606))))

(assert (=> d!129835 (= res!716068 (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(assert (=> d!129835 (= lt!476282 e!613615)))

(assert (=> d!129835 (= c!108121 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129835 (validMask!0 mask!1515)))

(assert (=> d!129835 (= (getCurrentListMap!4157 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476292)))

(declare-fun b!1074050 () Bool)

(declare-fun e!613611 () Bool)

(assert (=> b!1074050 (= e!613611 e!613616)))

(declare-fun res!716069 () Bool)

(assert (=> b!1074050 (=> (not res!716069) (not e!613616))))

(assert (=> b!1074050 (= res!716069 (contains!6349 lt!476292 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074050 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(declare-fun b!1074051 () Bool)

(declare-fun e!613610 () Bool)

(assert (=> b!1074051 (= e!613610 (validKeyInArray!0 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074052 () Bool)

(assert (=> b!1074052 (= e!613614 (= (apply!940 lt!476292 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1074053 () Bool)

(assert (=> b!1074053 (= e!613607 (= (apply!940 lt!476292 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1074054 () Bool)

(declare-fun res!716066 () Bool)

(assert (=> b!1074054 (=> (not res!716066) (not e!613613))))

(assert (=> b!1074054 (= res!716066 e!613611)))

(declare-fun res!716072 () Bool)

(assert (=> b!1074054 (=> res!716072 e!613611)))

(assert (=> b!1074054 (= res!716072 (not e!613610))))

(declare-fun res!716070 () Bool)

(assert (=> b!1074054 (=> (not res!716070) (not e!613610))))

(assert (=> b!1074054 (= res!716070 (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(declare-fun b!1074055 () Bool)

(declare-fun c!108122 () Bool)

(assert (=> b!1074055 (= c!108122 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1074055 (= e!613612 e!613608)))

(declare-fun b!1074056 () Bool)

(assert (=> b!1074056 (= e!613615 (+!3231 call!45323 (tuple2!16529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1074057 () Bool)

(assert (=> b!1074057 (= e!613609 (not call!45324))))

(assert (= (and d!129835 c!108121) b!1074056))

(assert (= (and d!129835 (not c!108121)) b!1074047))

(assert (= (and b!1074047 c!108123) b!1074048))

(assert (= (and b!1074047 (not c!108123)) b!1074055))

(assert (= (and b!1074055 c!108122) b!1074038))

(assert (= (and b!1074055 (not c!108122)) b!1074045))

(assert (= (or b!1074038 b!1074045) bm!45322))

(assert (= (or b!1074048 bm!45322) bm!45324))

(assert (= (or b!1074048 b!1074038) bm!45321))

(assert (= (or b!1074056 bm!45324) bm!45319))

(assert (= (or b!1074056 bm!45321) bm!45323))

(assert (= (and d!129835 res!716068) b!1074037))

(assert (= (and d!129835 c!108120) b!1074043))

(assert (= (and d!129835 (not c!108120)) b!1074041))

(assert (= (and d!129835 res!716073) b!1074054))

(assert (= (and b!1074054 res!716070) b!1074051))

(assert (= (and b!1074054 (not res!716072)) b!1074050))

(assert (= (and b!1074050 res!716069) b!1074049))

(assert (= (and b!1074054 res!716066) b!1074039))

(assert (= (and b!1074039 c!108118) b!1074040))

(assert (= (and b!1074039 (not c!108118)) b!1074046))

(assert (= (and b!1074040 res!716071) b!1074053))

(assert (= (or b!1074040 b!1074046) bm!45320))

(assert (= (and b!1074039 res!716074) b!1074044))

(assert (= (and b!1074044 c!108119) b!1074042))

(assert (= (and b!1074044 (not c!108119)) b!1074057))

(assert (= (and b!1074042 res!716067) b!1074052))

(assert (= (or b!1074042 b!1074057) bm!45318))

(declare-fun b_lambda!16711 () Bool)

(assert (=> (not b_lambda!16711) (not b!1074049)))

(declare-fun t!32417 () Bool)

(declare-fun tb!7149 () Bool)

(assert (=> (and start!95088 (= defaultEntry!963 defaultEntry!963) t!32417) tb!7149))

(declare-fun result!14771 () Bool)

(assert (=> tb!7149 (= result!14771 tp_is_empty!25891)))

(assert (=> b!1074049 t!32417))

(declare-fun b_and!34939 () Bool)

(assert (= b_and!34933 (and (=> t!32417 result!14771) b_and!34939)))

(assert (=> bm!45319 m!993321))

(declare-fun m!993421 () Bool)

(assert (=> b!1074052 m!993421))

(declare-fun m!993423 () Bool)

(assert (=> bm!45320 m!993423))

(declare-fun m!993425 () Bool)

(assert (=> b!1074053 m!993425))

(declare-fun m!993427 () Bool)

(assert (=> b!1074049 m!993427))

(declare-fun m!993429 () Bool)

(assert (=> b!1074049 m!993429))

(declare-fun m!993431 () Bool)

(assert (=> b!1074049 m!993431))

(declare-fun m!993433 () Bool)

(assert (=> b!1074049 m!993433))

(assert (=> b!1074049 m!993427))

(assert (=> b!1074049 m!993429))

(assert (=> b!1074049 m!993433))

(declare-fun m!993435 () Bool)

(assert (=> b!1074049 m!993435))

(assert (=> b!1074051 m!993433))

(assert (=> b!1074051 m!993433))

(declare-fun m!993437 () Bool)

(assert (=> b!1074051 m!993437))

(declare-fun m!993439 () Bool)

(assert (=> bm!45318 m!993439))

(declare-fun m!993441 () Bool)

(assert (=> bm!45323 m!993441))

(declare-fun m!993443 () Bool)

(assert (=> b!1074043 m!993443))

(declare-fun m!993445 () Bool)

(assert (=> b!1074043 m!993445))

(declare-fun m!993447 () Bool)

(assert (=> b!1074043 m!993447))

(declare-fun m!993449 () Bool)

(assert (=> b!1074043 m!993449))

(declare-fun m!993451 () Bool)

(assert (=> b!1074043 m!993451))

(declare-fun m!993453 () Bool)

(assert (=> b!1074043 m!993453))

(declare-fun m!993455 () Bool)

(assert (=> b!1074043 m!993455))

(declare-fun m!993457 () Bool)

(assert (=> b!1074043 m!993457))

(declare-fun m!993459 () Bool)

(assert (=> b!1074043 m!993459))

(assert (=> b!1074043 m!993443))

(assert (=> b!1074043 m!993447))

(declare-fun m!993461 () Bool)

(assert (=> b!1074043 m!993461))

(declare-fun m!993463 () Bool)

(assert (=> b!1074043 m!993463))

(declare-fun m!993465 () Bool)

(assert (=> b!1074043 m!993465))

(declare-fun m!993467 () Bool)

(assert (=> b!1074043 m!993467))

(declare-fun m!993469 () Bool)

(assert (=> b!1074043 m!993469))

(declare-fun m!993471 () Bool)

(assert (=> b!1074043 m!993471))

(assert (=> b!1074043 m!993433))

(assert (=> b!1074043 m!993465))

(assert (=> b!1074043 m!993457))

(assert (=> b!1074043 m!993321))

(assert (=> d!129835 m!993293))

(declare-fun m!993473 () Bool)

(assert (=> b!1074056 m!993473))

(assert (=> b!1074037 m!993433))

(assert (=> b!1074037 m!993433))

(assert (=> b!1074037 m!993437))

(assert (=> b!1074050 m!993433))

(assert (=> b!1074050 m!993433))

(declare-fun m!993475 () Bool)

(assert (=> b!1074050 m!993475))

(assert (=> b!1073926 d!129835))

(declare-fun b!1074060 () Bool)

(declare-fun e!613619 () Bool)

(assert (=> b!1074060 (= e!613619 (validKeyInArray!0 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45325 () Bool)

(declare-fun call!45331 () Bool)

(declare-fun lt!476314 () ListLongMap!14505)

(assert (=> bm!45325 (= call!45331 (contains!6349 lt!476314 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074061 () Bool)

(declare-fun e!613621 () ListLongMap!14505)

(declare-fun call!45334 () ListLongMap!14505)

(assert (=> b!1074061 (= e!613621 call!45334)))

(declare-fun bm!45326 () Bool)

(declare-fun call!45329 () ListLongMap!14505)

(assert (=> bm!45326 (= call!45329 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074062 () Bool)

(declare-fun res!716083 () Bool)

(declare-fun e!613626 () Bool)

(assert (=> b!1074062 (=> (not res!716083) (not e!613626))))

(declare-fun e!613617 () Bool)

(assert (=> b!1074062 (= res!716083 e!613617)))

(declare-fun c!108124 () Bool)

(assert (=> b!1074062 (= c!108124 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45327 () Bool)

(declare-fun call!45333 () Bool)

(assert (=> bm!45327 (= call!45333 (contains!6349 lt!476314 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45328 () Bool)

(declare-fun call!45330 () ListLongMap!14505)

(assert (=> bm!45328 (= call!45334 call!45330)))

(declare-fun b!1074064 () Bool)

(declare-fun e!613618 () Unit!35315)

(declare-fun Unit!35322 () Unit!35315)

(assert (=> b!1074064 (= e!613618 Unit!35322)))

(declare-fun b!1074065 () Bool)

(declare-fun e!613622 () Bool)

(declare-fun e!613627 () Bool)

(assert (=> b!1074065 (= e!613622 e!613627)))

(declare-fun res!716076 () Bool)

(assert (=> b!1074065 (= res!716076 call!45331)))

(assert (=> b!1074065 (=> (not res!716076) (not e!613627))))

(declare-fun b!1074066 () Bool)

(declare-fun lt!476312 () Unit!35315)

(assert (=> b!1074066 (= e!613618 lt!476312)))

(declare-fun lt!476313 () ListLongMap!14505)

(assert (=> b!1074066 (= lt!476313 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476315 () (_ BitVec 64))

(assert (=> b!1074066 (= lt!476315 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476311 () (_ BitVec 64))

(assert (=> b!1074066 (= lt!476311 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476319 () Unit!35315)

(assert (=> b!1074066 (= lt!476319 (addStillContains!645 lt!476313 lt!476315 zeroValueBefore!47 lt!476311))))

(assert (=> b!1074066 (contains!6349 (+!3231 lt!476313 (tuple2!16529 lt!476315 zeroValueBefore!47)) lt!476311)))

(declare-fun lt!476307 () Unit!35315)

(assert (=> b!1074066 (= lt!476307 lt!476319)))

(declare-fun lt!476308 () ListLongMap!14505)

(assert (=> b!1074066 (= lt!476308 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476318 () (_ BitVec 64))

(assert (=> b!1074066 (= lt!476318 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476301 () (_ BitVec 64))

(assert (=> b!1074066 (= lt!476301 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476310 () Unit!35315)

(assert (=> b!1074066 (= lt!476310 (addApplyDifferent!501 lt!476308 lt!476318 minValue!907 lt!476301))))

(assert (=> b!1074066 (= (apply!940 (+!3231 lt!476308 (tuple2!16529 lt!476318 minValue!907)) lt!476301) (apply!940 lt!476308 lt!476301))))

(declare-fun lt!476309 () Unit!35315)

(assert (=> b!1074066 (= lt!476309 lt!476310)))

(declare-fun lt!476300 () ListLongMap!14505)

(assert (=> b!1074066 (= lt!476300 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476299 () (_ BitVec 64))

(assert (=> b!1074066 (= lt!476299 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476317 () (_ BitVec 64))

(assert (=> b!1074066 (= lt!476317 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476298 () Unit!35315)

(assert (=> b!1074066 (= lt!476298 (addApplyDifferent!501 lt!476300 lt!476299 zeroValueBefore!47 lt!476317))))

(assert (=> b!1074066 (= (apply!940 (+!3231 lt!476300 (tuple2!16529 lt!476299 zeroValueBefore!47)) lt!476317) (apply!940 lt!476300 lt!476317))))

(declare-fun lt!476316 () Unit!35315)

(assert (=> b!1074066 (= lt!476316 lt!476298)))

(declare-fun lt!476306 () ListLongMap!14505)

(assert (=> b!1074066 (= lt!476306 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476303 () (_ BitVec 64))

(assert (=> b!1074066 (= lt!476303 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476305 () (_ BitVec 64))

(assert (=> b!1074066 (= lt!476305 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074066 (= lt!476312 (addApplyDifferent!501 lt!476306 lt!476303 minValue!907 lt!476305))))

(assert (=> b!1074066 (= (apply!940 (+!3231 lt!476306 (tuple2!16529 lt!476303 minValue!907)) lt!476305) (apply!940 lt!476306 lt!476305))))

(declare-fun b!1074067 () Bool)

(assert (=> b!1074067 (= e!613626 e!613622)))

(declare-fun c!108125 () Bool)

(assert (=> b!1074067 (= c!108125 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074068 () Bool)

(declare-fun call!45328 () ListLongMap!14505)

(assert (=> b!1074068 (= e!613621 call!45328)))

(declare-fun b!1074069 () Bool)

(assert (=> b!1074069 (= e!613617 (not call!45333))))

(declare-fun b!1074070 () Bool)

(declare-fun e!613628 () ListLongMap!14505)

(declare-fun e!613625 () ListLongMap!14505)

(assert (=> b!1074070 (= e!613628 e!613625)))

(declare-fun c!108129 () Bool)

(assert (=> b!1074070 (= c!108129 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45329 () Bool)

(declare-fun call!45332 () ListLongMap!14505)

(assert (=> bm!45329 (= call!45328 call!45332)))

(declare-fun b!1074071 () Bool)

(assert (=> b!1074071 (= e!613625 call!45334)))

(declare-fun bm!45330 () Bool)

(declare-fun c!108127 () Bool)

(assert (=> bm!45330 (= call!45330 (+!3231 (ite c!108127 call!45329 (ite c!108129 call!45332 call!45328)) (ite (or c!108127 c!108129) (tuple2!16529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun e!613629 () Bool)

(declare-fun b!1074072 () Bool)

(assert (=> b!1074072 (= e!613629 (= (apply!940 lt!476314 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)) (get!17216 (select (arr!33085 _values!955) #b00000000000000000000000000000000) (dynLambda!2055 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074072 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33622 _values!955)))))

(assert (=> b!1074072 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(declare-fun bm!45331 () Bool)

(assert (=> bm!45331 (= call!45332 call!45329)))

(declare-fun b!1074063 () Bool)

(declare-fun e!613620 () Bool)

(assert (=> b!1074063 (= e!613617 e!613620)))

(declare-fun res!716080 () Bool)

(assert (=> b!1074063 (= res!716080 call!45333)))

(assert (=> b!1074063 (=> (not res!716080) (not e!613620))))

(declare-fun d!129837 () Bool)

(assert (=> d!129837 e!613626))

(declare-fun res!716082 () Bool)

(assert (=> d!129837 (=> (not res!716082) (not e!613626))))

(assert (=> d!129837 (= res!716082 (or (bvsge #b00000000000000000000000000000000 (size!33621 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))))

(declare-fun lt!476304 () ListLongMap!14505)

(assert (=> d!129837 (= lt!476314 lt!476304)))

(declare-fun lt!476302 () Unit!35315)

(assert (=> d!129837 (= lt!476302 e!613618)))

(declare-fun c!108126 () Bool)

(assert (=> d!129837 (= c!108126 e!613619)))

(declare-fun res!716077 () Bool)

(assert (=> d!129837 (=> (not res!716077) (not e!613619))))

(assert (=> d!129837 (= res!716077 (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(assert (=> d!129837 (= lt!476304 e!613628)))

(assert (=> d!129837 (= c!108127 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129837 (validMask!0 mask!1515)))

(assert (=> d!129837 (= (getCurrentListMap!4157 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476314)))

(declare-fun b!1074073 () Bool)

(declare-fun e!613624 () Bool)

(assert (=> b!1074073 (= e!613624 e!613629)))

(declare-fun res!716078 () Bool)

(assert (=> b!1074073 (=> (not res!716078) (not e!613629))))

(assert (=> b!1074073 (= res!716078 (contains!6349 lt!476314 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074073 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(declare-fun b!1074074 () Bool)

(declare-fun e!613623 () Bool)

(assert (=> b!1074074 (= e!613623 (validKeyInArray!0 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074075 () Bool)

(assert (=> b!1074075 (= e!613627 (= (apply!940 lt!476314 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1074076 () Bool)

(assert (=> b!1074076 (= e!613620 (= (apply!940 lt!476314 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1074077 () Bool)

(declare-fun res!716075 () Bool)

(assert (=> b!1074077 (=> (not res!716075) (not e!613626))))

(assert (=> b!1074077 (= res!716075 e!613624)))

(declare-fun res!716081 () Bool)

(assert (=> b!1074077 (=> res!716081 e!613624)))

(assert (=> b!1074077 (= res!716081 (not e!613623))))

(declare-fun res!716079 () Bool)

(assert (=> b!1074077 (=> (not res!716079) (not e!613623))))

(assert (=> b!1074077 (= res!716079 (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(declare-fun b!1074078 () Bool)

(declare-fun c!108128 () Bool)

(assert (=> b!1074078 (= c!108128 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1074078 (= e!613625 e!613621)))

(declare-fun b!1074079 () Bool)

(assert (=> b!1074079 (= e!613628 (+!3231 call!45330 (tuple2!16529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1074080 () Bool)

(assert (=> b!1074080 (= e!613622 (not call!45331))))

(assert (= (and d!129837 c!108127) b!1074079))

(assert (= (and d!129837 (not c!108127)) b!1074070))

(assert (= (and b!1074070 c!108129) b!1074071))

(assert (= (and b!1074070 (not c!108129)) b!1074078))

(assert (= (and b!1074078 c!108128) b!1074061))

(assert (= (and b!1074078 (not c!108128)) b!1074068))

(assert (= (or b!1074061 b!1074068) bm!45329))

(assert (= (or b!1074071 bm!45329) bm!45331))

(assert (= (or b!1074071 b!1074061) bm!45328))

(assert (= (or b!1074079 bm!45331) bm!45326))

(assert (= (or b!1074079 bm!45328) bm!45330))

(assert (= (and d!129837 res!716077) b!1074060))

(assert (= (and d!129837 c!108126) b!1074066))

(assert (= (and d!129837 (not c!108126)) b!1074064))

(assert (= (and d!129837 res!716082) b!1074077))

(assert (= (and b!1074077 res!716079) b!1074074))

(assert (= (and b!1074077 (not res!716081)) b!1074073))

(assert (= (and b!1074073 res!716078) b!1074072))

(assert (= (and b!1074077 res!716075) b!1074062))

(assert (= (and b!1074062 c!108124) b!1074063))

(assert (= (and b!1074062 (not c!108124)) b!1074069))

(assert (= (and b!1074063 res!716080) b!1074076))

(assert (= (or b!1074063 b!1074069) bm!45327))

(assert (= (and b!1074062 res!716083) b!1074067))

(assert (= (and b!1074067 c!108125) b!1074065))

(assert (= (and b!1074067 (not c!108125)) b!1074080))

(assert (= (and b!1074065 res!716076) b!1074075))

(assert (= (or b!1074065 b!1074080) bm!45325))

(declare-fun b_lambda!16713 () Bool)

(assert (=> (not b_lambda!16713) (not b!1074072)))

(assert (=> b!1074072 t!32417))

(declare-fun b_and!34941 () Bool)

(assert (= b_and!34939 (and (=> t!32417 result!14771) b_and!34941)))

(assert (=> bm!45326 m!993323))

(declare-fun m!993477 () Bool)

(assert (=> b!1074075 m!993477))

(declare-fun m!993479 () Bool)

(assert (=> bm!45327 m!993479))

(declare-fun m!993481 () Bool)

(assert (=> b!1074076 m!993481))

(assert (=> b!1074072 m!993427))

(assert (=> b!1074072 m!993429))

(assert (=> b!1074072 m!993431))

(assert (=> b!1074072 m!993433))

(assert (=> b!1074072 m!993427))

(assert (=> b!1074072 m!993429))

(assert (=> b!1074072 m!993433))

(declare-fun m!993483 () Bool)

(assert (=> b!1074072 m!993483))

(assert (=> b!1074074 m!993433))

(assert (=> b!1074074 m!993433))

(assert (=> b!1074074 m!993437))

(declare-fun m!993485 () Bool)

(assert (=> bm!45325 m!993485))

(declare-fun m!993487 () Bool)

(assert (=> bm!45330 m!993487))

(declare-fun m!993489 () Bool)

(assert (=> b!1074066 m!993489))

(declare-fun m!993491 () Bool)

(assert (=> b!1074066 m!993491))

(declare-fun m!993493 () Bool)

(assert (=> b!1074066 m!993493))

(declare-fun m!993495 () Bool)

(assert (=> b!1074066 m!993495))

(declare-fun m!993497 () Bool)

(assert (=> b!1074066 m!993497))

(declare-fun m!993499 () Bool)

(assert (=> b!1074066 m!993499))

(declare-fun m!993501 () Bool)

(assert (=> b!1074066 m!993501))

(declare-fun m!993503 () Bool)

(assert (=> b!1074066 m!993503))

(declare-fun m!993505 () Bool)

(assert (=> b!1074066 m!993505))

(assert (=> b!1074066 m!993489))

(assert (=> b!1074066 m!993493))

(declare-fun m!993507 () Bool)

(assert (=> b!1074066 m!993507))

(declare-fun m!993509 () Bool)

(assert (=> b!1074066 m!993509))

(declare-fun m!993511 () Bool)

(assert (=> b!1074066 m!993511))

(declare-fun m!993513 () Bool)

(assert (=> b!1074066 m!993513))

(declare-fun m!993515 () Bool)

(assert (=> b!1074066 m!993515))

(declare-fun m!993517 () Bool)

(assert (=> b!1074066 m!993517))

(assert (=> b!1074066 m!993433))

(assert (=> b!1074066 m!993511))

(assert (=> b!1074066 m!993503))

(assert (=> b!1074066 m!993323))

(assert (=> d!129837 m!993293))

(declare-fun m!993519 () Bool)

(assert (=> b!1074079 m!993519))

(assert (=> b!1074060 m!993433))

(assert (=> b!1074060 m!993433))

(assert (=> b!1074060 m!993437))

(assert (=> b!1074073 m!993433))

(assert (=> b!1074073 m!993433))

(declare-fun m!993521 () Bool)

(assert (=> b!1074073 m!993521))

(assert (=> b!1073926 d!129837))

(declare-fun d!129839 () Bool)

(assert (=> d!129839 (= (+!3231 (+!3231 lt!476134 (tuple2!16529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (+!3231 (+!3231 lt!476134 (tuple2!16529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (tuple2!16529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun lt!476322 () Unit!35315)

(declare-fun choose!1748 (ListLongMap!14505 (_ BitVec 64) V!39657 (_ BitVec 64) V!39657) Unit!35315)

(assert (=> d!129839 (= lt!476322 (choose!1748 lt!476134 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> d!129839 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129839 (= (addCommutativeForDiffKeys!753 lt!476134 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907) lt!476322)))

(declare-fun bs!31628 () Bool)

(assert (= bs!31628 d!129839))

(declare-fun m!993523 () Bool)

(assert (=> bs!31628 m!993523))

(declare-fun m!993525 () Bool)

(assert (=> bs!31628 m!993525))

(declare-fun m!993527 () Bool)

(assert (=> bs!31628 m!993527))

(declare-fun m!993529 () Bool)

(assert (=> bs!31628 m!993529))

(assert (=> bs!31628 m!993523))

(assert (=> bs!31628 m!993529))

(declare-fun m!993531 () Bool)

(assert (=> bs!31628 m!993531))

(assert (=> b!1073926 d!129839))

(declare-fun d!129841 () Bool)

(assert (=> d!129841 (= (-!696 (+!3231 lt!476142 (tuple2!16529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!476142)))

(declare-fun lt!476325 () Unit!35315)

(declare-fun choose!1749 (ListLongMap!14505 (_ BitVec 64) V!39657) Unit!35315)

(assert (=> d!129841 (= lt!476325 (choose!1749 lt!476142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> d!129841 (not (contains!6349 lt!476142 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129841 (= (addThenRemoveForNewKeyIsSame!71 lt!476142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) lt!476325)))

(declare-fun bs!31629 () Bool)

(assert (= bs!31629 d!129841))

(declare-fun m!993533 () Bool)

(assert (=> bs!31629 m!993533))

(assert (=> bs!31629 m!993533))

(declare-fun m!993535 () Bool)

(assert (=> bs!31629 m!993535))

(declare-fun m!993537 () Bool)

(assert (=> bs!31629 m!993537))

(declare-fun m!993539 () Bool)

(assert (=> bs!31629 m!993539))

(assert (=> b!1073926 d!129841))

(declare-fun d!129843 () Bool)

(declare-fun e!613630 () Bool)

(assert (=> d!129843 e!613630))

(declare-fun res!716084 () Bool)

(assert (=> d!129843 (=> (not res!716084) (not e!613630))))

(declare-fun lt!476328 () ListLongMap!14505)

(assert (=> d!129843 (= res!716084 (contains!6349 lt!476328 (_1!8275 lt!476135)))))

(declare-fun lt!476326 () List!23085)

(assert (=> d!129843 (= lt!476328 (ListLongMap!14506 lt!476326))))

(declare-fun lt!476329 () Unit!35315)

(declare-fun lt!476327 () Unit!35315)

(assert (=> d!129843 (= lt!476329 lt!476327)))

(assert (=> d!129843 (= (getValueByKey!600 lt!476326 (_1!8275 lt!476135)) (Some!650 (_2!8275 lt!476135)))))

(assert (=> d!129843 (= lt!476327 (lemmaContainsTupThenGetReturnValue!286 lt!476326 (_1!8275 lt!476135) (_2!8275 lt!476135)))))

(assert (=> d!129843 (= lt!476326 (insertStrictlySorted!379 (toList!7268 lt!476142) (_1!8275 lt!476135) (_2!8275 lt!476135)))))

(assert (=> d!129843 (= (+!3231 lt!476142 lt!476135) lt!476328)))

(declare-fun b!1074081 () Bool)

(declare-fun res!716085 () Bool)

(assert (=> b!1074081 (=> (not res!716085) (not e!613630))))

(assert (=> b!1074081 (= res!716085 (= (getValueByKey!600 (toList!7268 lt!476328) (_1!8275 lt!476135)) (Some!650 (_2!8275 lt!476135))))))

(declare-fun b!1074082 () Bool)

(assert (=> b!1074082 (= e!613630 (contains!6350 (toList!7268 lt!476328) lt!476135))))

(assert (= (and d!129843 res!716084) b!1074081))

(assert (= (and b!1074081 res!716085) b!1074082))

(declare-fun m!993541 () Bool)

(assert (=> d!129843 m!993541))

(declare-fun m!993543 () Bool)

(assert (=> d!129843 m!993543))

(declare-fun m!993545 () Bool)

(assert (=> d!129843 m!993545))

(declare-fun m!993547 () Bool)

(assert (=> d!129843 m!993547))

(declare-fun m!993549 () Bool)

(assert (=> b!1074081 m!993549))

(declare-fun m!993551 () Bool)

(assert (=> b!1074082 m!993551))

(assert (=> b!1073926 d!129843))

(declare-fun d!129845 () Bool)

(declare-fun e!613631 () Bool)

(assert (=> d!129845 e!613631))

(declare-fun res!716086 () Bool)

(assert (=> d!129845 (=> (not res!716086) (not e!613631))))

(declare-fun lt!476332 () ListLongMap!14505)

(assert (=> d!129845 (= res!716086 (contains!6349 lt!476332 (_1!8275 lt!476137)))))

(declare-fun lt!476330 () List!23085)

(assert (=> d!129845 (= lt!476332 (ListLongMap!14506 lt!476330))))

(declare-fun lt!476333 () Unit!35315)

(declare-fun lt!476331 () Unit!35315)

(assert (=> d!129845 (= lt!476333 lt!476331)))

(assert (=> d!129845 (= (getValueByKey!600 lt!476330 (_1!8275 lt!476137)) (Some!650 (_2!8275 lt!476137)))))

(assert (=> d!129845 (= lt!476331 (lemmaContainsTupThenGetReturnValue!286 lt!476330 (_1!8275 lt!476137) (_2!8275 lt!476137)))))

(assert (=> d!129845 (= lt!476330 (insertStrictlySorted!379 (toList!7268 (+!3231 lt!476134 lt!476135)) (_1!8275 lt!476137) (_2!8275 lt!476137)))))

(assert (=> d!129845 (= (+!3231 (+!3231 lt!476134 lt!476135) lt!476137) lt!476332)))

(declare-fun b!1074083 () Bool)

(declare-fun res!716087 () Bool)

(assert (=> b!1074083 (=> (not res!716087) (not e!613631))))

(assert (=> b!1074083 (= res!716087 (= (getValueByKey!600 (toList!7268 lt!476332) (_1!8275 lt!476137)) (Some!650 (_2!8275 lt!476137))))))

(declare-fun b!1074084 () Bool)

(assert (=> b!1074084 (= e!613631 (contains!6350 (toList!7268 lt!476332) lt!476137))))

(assert (= (and d!129845 res!716086) b!1074083))

(assert (= (and b!1074083 res!716087) b!1074084))

(declare-fun m!993553 () Bool)

(assert (=> d!129845 m!993553))

(declare-fun m!993555 () Bool)

(assert (=> d!129845 m!993555))

(declare-fun m!993557 () Bool)

(assert (=> d!129845 m!993557))

(declare-fun m!993559 () Bool)

(assert (=> d!129845 m!993559))

(declare-fun m!993561 () Bool)

(assert (=> b!1074083 m!993561))

(declare-fun m!993563 () Bool)

(assert (=> b!1074084 m!993563))

(assert (=> b!1073926 d!129845))

(declare-fun d!129847 () Bool)

(declare-fun e!613632 () Bool)

(assert (=> d!129847 e!613632))

(declare-fun res!716088 () Bool)

(assert (=> d!129847 (=> (not res!716088) (not e!613632))))

(declare-fun lt!476336 () ListLongMap!14505)

(assert (=> d!129847 (= res!716088 (contains!6349 lt!476336 (_1!8275 lt!476135)))))

(declare-fun lt!476334 () List!23085)

(assert (=> d!129847 (= lt!476336 (ListLongMap!14506 lt!476334))))

(declare-fun lt!476337 () Unit!35315)

(declare-fun lt!476335 () Unit!35315)

(assert (=> d!129847 (= lt!476337 lt!476335)))

(assert (=> d!129847 (= (getValueByKey!600 lt!476334 (_1!8275 lt!476135)) (Some!650 (_2!8275 lt!476135)))))

(assert (=> d!129847 (= lt!476335 (lemmaContainsTupThenGetReturnValue!286 lt!476334 (_1!8275 lt!476135) (_2!8275 lt!476135)))))

(assert (=> d!129847 (= lt!476334 (insertStrictlySorted!379 (toList!7268 lt!476134) (_1!8275 lt!476135) (_2!8275 lt!476135)))))

(assert (=> d!129847 (= (+!3231 lt!476134 lt!476135) lt!476336)))

(declare-fun b!1074085 () Bool)

(declare-fun res!716089 () Bool)

(assert (=> b!1074085 (=> (not res!716089) (not e!613632))))

(assert (=> b!1074085 (= res!716089 (= (getValueByKey!600 (toList!7268 lt!476336) (_1!8275 lt!476135)) (Some!650 (_2!8275 lt!476135))))))

(declare-fun b!1074086 () Bool)

(assert (=> b!1074086 (= e!613632 (contains!6350 (toList!7268 lt!476336) lt!476135))))

(assert (= (and d!129847 res!716088) b!1074085))

(assert (= (and b!1074085 res!716089) b!1074086))

(declare-fun m!993565 () Bool)

(assert (=> d!129847 m!993565))

(declare-fun m!993567 () Bool)

(assert (=> d!129847 m!993567))

(declare-fun m!993569 () Bool)

(assert (=> d!129847 m!993569))

(declare-fun m!993571 () Bool)

(assert (=> d!129847 m!993571))

(declare-fun m!993573 () Bool)

(assert (=> b!1074085 m!993573))

(declare-fun m!993575 () Bool)

(assert (=> b!1074086 m!993575))

(assert (=> b!1073926 d!129847))

(declare-fun d!129849 () Bool)

(declare-fun lt!476338 () ListLongMap!14505)

(assert (=> d!129849 (not (contains!6349 lt!476338 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129849 (= lt!476338 (ListLongMap!14506 (removeStrictlySorted!73 (toList!7268 lt!476140) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129849 (= (-!696 lt!476140 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476338)))

(declare-fun bs!31630 () Bool)

(assert (= bs!31630 d!129849))

(declare-fun m!993577 () Bool)

(assert (=> bs!31630 m!993577))

(declare-fun m!993579 () Bool)

(assert (=> bs!31630 m!993579))

(assert (=> b!1073926 d!129849))

(declare-fun d!129851 () Bool)

(assert (=> d!129851 (= (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476341 () Unit!35315)

(declare-fun choose!1750 (array!68791 array!68793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39657 V!39657 V!39657 V!39657 (_ BitVec 32) Int) Unit!35315)

(assert (=> d!129851 (= lt!476341 (choose!1750 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129851 (validMask!0 mask!1515)))

(assert (=> d!129851 (= (lemmaNoChangeToArrayThenSameMapNoExtras!870 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476341)))

(declare-fun bs!31631 () Bool)

(assert (= bs!31631 d!129851))

(assert (=> bs!31631 m!993323))

(assert (=> bs!31631 m!993321))

(declare-fun m!993581 () Bool)

(assert (=> bs!31631 m!993581))

(assert (=> bs!31631 m!993293))

(assert (=> b!1073925 d!129851))

(declare-fun b!1074111 () Bool)

(declare-fun e!613648 () ListLongMap!14505)

(assert (=> b!1074111 (= e!613648 (ListLongMap!14506 Nil!23082))))

(declare-fun d!129853 () Bool)

(declare-fun e!613652 () Bool)

(assert (=> d!129853 e!613652))

(declare-fun res!716101 () Bool)

(assert (=> d!129853 (=> (not res!716101) (not e!613652))))

(declare-fun lt!476359 () ListLongMap!14505)

(assert (=> d!129853 (= res!716101 (not (contains!6349 lt!476359 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129853 (= lt!476359 e!613648)))

(declare-fun c!108141 () Bool)

(assert (=> d!129853 (= c!108141 (bvsge #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(assert (=> d!129853 (validMask!0 mask!1515)))

(assert (=> d!129853 (= (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476359)))

(declare-fun call!45337 () ListLongMap!14505)

(declare-fun bm!45334 () Bool)

(assert (=> bm!45334 (= call!45337 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun e!613647 () Bool)

(declare-fun b!1074112 () Bool)

(assert (=> b!1074112 (= e!613647 (= lt!476359 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074113 () Bool)

(declare-fun lt!476358 () Unit!35315)

(declare-fun lt!476356 () Unit!35315)

(assert (=> b!1074113 (= lt!476358 lt!476356)))

(declare-fun lt!476361 () (_ BitVec 64))

(declare-fun lt!476357 () ListLongMap!14505)

(declare-fun lt!476360 () V!39657)

(declare-fun lt!476362 () (_ BitVec 64))

(assert (=> b!1074113 (not (contains!6349 (+!3231 lt!476357 (tuple2!16529 lt!476362 lt!476360)) lt!476361))))

(declare-fun addStillNotContains!261 (ListLongMap!14505 (_ BitVec 64) V!39657 (_ BitVec 64)) Unit!35315)

(assert (=> b!1074113 (= lt!476356 (addStillNotContains!261 lt!476357 lt!476362 lt!476360 lt!476361))))

(assert (=> b!1074113 (= lt!476361 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074113 (= lt!476360 (get!17216 (select (arr!33085 _values!955) #b00000000000000000000000000000000) (dynLambda!2055 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074113 (= lt!476362 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074113 (= lt!476357 call!45337)))

(declare-fun e!613651 () ListLongMap!14505)

(assert (=> b!1074113 (= e!613651 (+!3231 call!45337 (tuple2!16529 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000) (get!17216 (select (arr!33085 _values!955) #b00000000000000000000000000000000) (dynLambda!2055 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074114 () Bool)

(declare-fun isEmpty!953 (ListLongMap!14505) Bool)

(assert (=> b!1074114 (= e!613647 (isEmpty!953 lt!476359))))

(declare-fun b!1074115 () Bool)

(assert (=> b!1074115 (= e!613651 call!45337)))

(declare-fun b!1074116 () Bool)

(assert (=> b!1074116 (= e!613648 e!613651)))

(declare-fun c!108140 () Bool)

(assert (=> b!1074116 (= c!108140 (validKeyInArray!0 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074117 () Bool)

(declare-fun e!613653 () Bool)

(declare-fun e!613650 () Bool)

(assert (=> b!1074117 (= e!613653 e!613650)))

(assert (=> b!1074117 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(declare-fun res!716099 () Bool)

(assert (=> b!1074117 (= res!716099 (contains!6349 lt!476359 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074117 (=> (not res!716099) (not e!613650))))

(declare-fun b!1074118 () Bool)

(assert (=> b!1074118 (= e!613653 e!613647)))

(declare-fun c!108138 () Bool)

(assert (=> b!1074118 (= c!108138 (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(declare-fun b!1074119 () Bool)

(declare-fun e!613649 () Bool)

(assert (=> b!1074119 (= e!613649 (validKeyInArray!0 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074119 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074120 () Bool)

(assert (=> b!1074120 (= e!613652 e!613653)))

(declare-fun c!108139 () Bool)

(assert (=> b!1074120 (= c!108139 e!613649)))

(declare-fun res!716100 () Bool)

(assert (=> b!1074120 (=> (not res!716100) (not e!613649))))

(assert (=> b!1074120 (= res!716100 (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(declare-fun b!1074121 () Bool)

(declare-fun res!716098 () Bool)

(assert (=> b!1074121 (=> (not res!716098) (not e!613652))))

(assert (=> b!1074121 (= res!716098 (not (contains!6349 lt!476359 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1074122 () Bool)

(assert (=> b!1074122 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(assert (=> b!1074122 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33622 _values!955)))))

(assert (=> b!1074122 (= e!613650 (= (apply!940 lt!476359 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)) (get!17216 (select (arr!33085 _values!955) #b00000000000000000000000000000000) (dynLambda!2055 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!129853 c!108141) b!1074111))

(assert (= (and d!129853 (not c!108141)) b!1074116))

(assert (= (and b!1074116 c!108140) b!1074113))

(assert (= (and b!1074116 (not c!108140)) b!1074115))

(assert (= (or b!1074113 b!1074115) bm!45334))

(assert (= (and d!129853 res!716101) b!1074121))

(assert (= (and b!1074121 res!716098) b!1074120))

(assert (= (and b!1074120 res!716100) b!1074119))

(assert (= (and b!1074120 c!108139) b!1074117))

(assert (= (and b!1074120 (not c!108139)) b!1074118))

(assert (= (and b!1074117 res!716099) b!1074122))

(assert (= (and b!1074118 c!108138) b!1074112))

(assert (= (and b!1074118 (not c!108138)) b!1074114))

(declare-fun b_lambda!16715 () Bool)

(assert (=> (not b_lambda!16715) (not b!1074113)))

(assert (=> b!1074113 t!32417))

(declare-fun b_and!34943 () Bool)

(assert (= b_and!34941 (and (=> t!32417 result!14771) b_and!34943)))

(declare-fun b_lambda!16717 () Bool)

(assert (=> (not b_lambda!16717) (not b!1074122)))

(assert (=> b!1074122 t!32417))

(declare-fun b_and!34945 () Bool)

(assert (= b_and!34943 (and (=> t!32417 result!14771) b_and!34945)))

(declare-fun m!993583 () Bool)

(assert (=> b!1074121 m!993583))

(declare-fun m!993585 () Bool)

(assert (=> bm!45334 m!993585))

(declare-fun m!993587 () Bool)

(assert (=> b!1074114 m!993587))

(assert (=> b!1074116 m!993433))

(assert (=> b!1074116 m!993433))

(assert (=> b!1074116 m!993437))

(assert (=> b!1074113 m!993427))

(assert (=> b!1074113 m!993429))

(assert (=> b!1074113 m!993431))

(assert (=> b!1074113 m!993427))

(declare-fun m!993589 () Bool)

(assert (=> b!1074113 m!993589))

(declare-fun m!993591 () Bool)

(assert (=> b!1074113 m!993591))

(assert (=> b!1074113 m!993433))

(declare-fun m!993593 () Bool)

(assert (=> b!1074113 m!993593))

(declare-fun m!993595 () Bool)

(assert (=> b!1074113 m!993595))

(assert (=> b!1074113 m!993429))

(assert (=> b!1074113 m!993593))

(declare-fun m!993597 () Bool)

(assert (=> d!129853 m!993597))

(assert (=> d!129853 m!993293))

(assert (=> b!1074119 m!993433))

(assert (=> b!1074119 m!993433))

(assert (=> b!1074119 m!993437))

(assert (=> b!1074122 m!993427))

(assert (=> b!1074122 m!993429))

(assert (=> b!1074122 m!993431))

(assert (=> b!1074122 m!993427))

(assert (=> b!1074122 m!993433))

(assert (=> b!1074122 m!993429))

(assert (=> b!1074122 m!993433))

(declare-fun m!993599 () Bool)

(assert (=> b!1074122 m!993599))

(assert (=> b!1074112 m!993585))

(assert (=> b!1074117 m!993433))

(assert (=> b!1074117 m!993433))

(declare-fun m!993601 () Bool)

(assert (=> b!1074117 m!993601))

(assert (=> b!1073925 d!129853))

(declare-fun b!1074123 () Bool)

(declare-fun e!613655 () ListLongMap!14505)

(assert (=> b!1074123 (= e!613655 (ListLongMap!14506 Nil!23082))))

(declare-fun d!129855 () Bool)

(declare-fun e!613659 () Bool)

(assert (=> d!129855 e!613659))

(declare-fun res!716105 () Bool)

(assert (=> d!129855 (=> (not res!716105) (not e!613659))))

(declare-fun lt!476366 () ListLongMap!14505)

(assert (=> d!129855 (= res!716105 (not (contains!6349 lt!476366 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129855 (= lt!476366 e!613655)))

(declare-fun c!108145 () Bool)

(assert (=> d!129855 (= c!108145 (bvsge #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(assert (=> d!129855 (validMask!0 mask!1515)))

(assert (=> d!129855 (= (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476366)))

(declare-fun call!45338 () ListLongMap!14505)

(declare-fun bm!45335 () Bool)

(assert (=> bm!45335 (= call!45338 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074124 () Bool)

(declare-fun e!613654 () Bool)

(assert (=> b!1074124 (= e!613654 (= lt!476366 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074125 () Bool)

(declare-fun lt!476365 () Unit!35315)

(declare-fun lt!476363 () Unit!35315)

(assert (=> b!1074125 (= lt!476365 lt!476363)))

(declare-fun lt!476364 () ListLongMap!14505)

(declare-fun lt!476368 () (_ BitVec 64))

(declare-fun lt!476367 () V!39657)

(declare-fun lt!476369 () (_ BitVec 64))

(assert (=> b!1074125 (not (contains!6349 (+!3231 lt!476364 (tuple2!16529 lt!476369 lt!476367)) lt!476368))))

(assert (=> b!1074125 (= lt!476363 (addStillNotContains!261 lt!476364 lt!476369 lt!476367 lt!476368))))

(assert (=> b!1074125 (= lt!476368 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074125 (= lt!476367 (get!17216 (select (arr!33085 _values!955) #b00000000000000000000000000000000) (dynLambda!2055 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074125 (= lt!476369 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074125 (= lt!476364 call!45338)))

(declare-fun e!613658 () ListLongMap!14505)

(assert (=> b!1074125 (= e!613658 (+!3231 call!45338 (tuple2!16529 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000) (get!17216 (select (arr!33085 _values!955) #b00000000000000000000000000000000) (dynLambda!2055 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074126 () Bool)

(assert (=> b!1074126 (= e!613654 (isEmpty!953 lt!476366))))

(declare-fun b!1074127 () Bool)

(assert (=> b!1074127 (= e!613658 call!45338)))

(declare-fun b!1074128 () Bool)

(assert (=> b!1074128 (= e!613655 e!613658)))

(declare-fun c!108144 () Bool)

(assert (=> b!1074128 (= c!108144 (validKeyInArray!0 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074129 () Bool)

(declare-fun e!613660 () Bool)

(declare-fun e!613657 () Bool)

(assert (=> b!1074129 (= e!613660 e!613657)))

(assert (=> b!1074129 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(declare-fun res!716103 () Bool)

(assert (=> b!1074129 (= res!716103 (contains!6349 lt!476366 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074129 (=> (not res!716103) (not e!613657))))

(declare-fun b!1074130 () Bool)

(assert (=> b!1074130 (= e!613660 e!613654)))

(declare-fun c!108142 () Bool)

(assert (=> b!1074130 (= c!108142 (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(declare-fun b!1074131 () Bool)

(declare-fun e!613656 () Bool)

(assert (=> b!1074131 (= e!613656 (validKeyInArray!0 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074131 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074132 () Bool)

(assert (=> b!1074132 (= e!613659 e!613660)))

(declare-fun c!108143 () Bool)

(assert (=> b!1074132 (= c!108143 e!613656)))

(declare-fun res!716104 () Bool)

(assert (=> b!1074132 (=> (not res!716104) (not e!613656))))

(assert (=> b!1074132 (= res!716104 (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(declare-fun b!1074133 () Bool)

(declare-fun res!716102 () Bool)

(assert (=> b!1074133 (=> (not res!716102) (not e!613659))))

(assert (=> b!1074133 (= res!716102 (not (contains!6349 lt!476366 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1074134 () Bool)

(assert (=> b!1074134 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(assert (=> b!1074134 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33622 _values!955)))))

(assert (=> b!1074134 (= e!613657 (= (apply!940 lt!476366 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)) (get!17216 (select (arr!33085 _values!955) #b00000000000000000000000000000000) (dynLambda!2055 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!129855 c!108145) b!1074123))

(assert (= (and d!129855 (not c!108145)) b!1074128))

(assert (= (and b!1074128 c!108144) b!1074125))

(assert (= (and b!1074128 (not c!108144)) b!1074127))

(assert (= (or b!1074125 b!1074127) bm!45335))

(assert (= (and d!129855 res!716105) b!1074133))

(assert (= (and b!1074133 res!716102) b!1074132))

(assert (= (and b!1074132 res!716104) b!1074131))

(assert (= (and b!1074132 c!108143) b!1074129))

(assert (= (and b!1074132 (not c!108143)) b!1074130))

(assert (= (and b!1074129 res!716103) b!1074134))

(assert (= (and b!1074130 c!108142) b!1074124))

(assert (= (and b!1074130 (not c!108142)) b!1074126))

(declare-fun b_lambda!16719 () Bool)

(assert (=> (not b_lambda!16719) (not b!1074125)))

(assert (=> b!1074125 t!32417))

(declare-fun b_and!34947 () Bool)

(assert (= b_and!34945 (and (=> t!32417 result!14771) b_and!34947)))

(declare-fun b_lambda!16721 () Bool)

(assert (=> (not b_lambda!16721) (not b!1074134)))

(assert (=> b!1074134 t!32417))

(declare-fun b_and!34949 () Bool)

(assert (= b_and!34947 (and (=> t!32417 result!14771) b_and!34949)))

(declare-fun m!993603 () Bool)

(assert (=> b!1074133 m!993603))

(declare-fun m!993605 () Bool)

(assert (=> bm!45335 m!993605))

(declare-fun m!993607 () Bool)

(assert (=> b!1074126 m!993607))

(assert (=> b!1074128 m!993433))

(assert (=> b!1074128 m!993433))

(assert (=> b!1074128 m!993437))

(assert (=> b!1074125 m!993427))

(assert (=> b!1074125 m!993429))

(assert (=> b!1074125 m!993431))

(assert (=> b!1074125 m!993427))

(declare-fun m!993609 () Bool)

(assert (=> b!1074125 m!993609))

(declare-fun m!993611 () Bool)

(assert (=> b!1074125 m!993611))

(assert (=> b!1074125 m!993433))

(declare-fun m!993613 () Bool)

(assert (=> b!1074125 m!993613))

(declare-fun m!993615 () Bool)

(assert (=> b!1074125 m!993615))

(assert (=> b!1074125 m!993429))

(assert (=> b!1074125 m!993613))

(declare-fun m!993617 () Bool)

(assert (=> d!129855 m!993617))

(assert (=> d!129855 m!993293))

(assert (=> b!1074131 m!993433))

(assert (=> b!1074131 m!993433))

(assert (=> b!1074131 m!993437))

(assert (=> b!1074134 m!993427))

(assert (=> b!1074134 m!993429))

(assert (=> b!1074134 m!993431))

(assert (=> b!1074134 m!993427))

(assert (=> b!1074134 m!993433))

(assert (=> b!1074134 m!993429))

(assert (=> b!1074134 m!993433))

(declare-fun m!993619 () Bool)

(assert (=> b!1074134 m!993619))

(assert (=> b!1074124 m!993605))

(assert (=> b!1074129 m!993433))

(assert (=> b!1074129 m!993433))

(declare-fun m!993621 () Bool)

(assert (=> b!1074129 m!993621))

(assert (=> b!1073925 d!129855))

(declare-fun d!129857 () Bool)

(declare-fun e!613661 () Bool)

(assert (=> d!129857 e!613661))

(declare-fun res!716106 () Bool)

(assert (=> d!129857 (=> (not res!716106) (not e!613661))))

(declare-fun lt!476372 () ListLongMap!14505)

(assert (=> d!129857 (= res!716106 (contains!6349 lt!476372 (_1!8275 lt!476137)))))

(declare-fun lt!476370 () List!23085)

(assert (=> d!129857 (= lt!476372 (ListLongMap!14506 lt!476370))))

(declare-fun lt!476373 () Unit!35315)

(declare-fun lt!476371 () Unit!35315)

(assert (=> d!129857 (= lt!476373 lt!476371)))

(assert (=> d!129857 (= (getValueByKey!600 lt!476370 (_1!8275 lt!476137)) (Some!650 (_2!8275 lt!476137)))))

(assert (=> d!129857 (= lt!476371 (lemmaContainsTupThenGetReturnValue!286 lt!476370 (_1!8275 lt!476137) (_2!8275 lt!476137)))))

(assert (=> d!129857 (= lt!476370 (insertStrictlySorted!379 (toList!7268 lt!476133) (_1!8275 lt!476137) (_2!8275 lt!476137)))))

(assert (=> d!129857 (= (+!3231 lt!476133 lt!476137) lt!476372)))

(declare-fun b!1074135 () Bool)

(declare-fun res!716107 () Bool)

(assert (=> b!1074135 (=> (not res!716107) (not e!613661))))

(assert (=> b!1074135 (= res!716107 (= (getValueByKey!600 (toList!7268 lt!476372) (_1!8275 lt!476137)) (Some!650 (_2!8275 lt!476137))))))

(declare-fun b!1074136 () Bool)

(assert (=> b!1074136 (= e!613661 (contains!6350 (toList!7268 lt!476372) lt!476137))))

(assert (= (and d!129857 res!716106) b!1074135))

(assert (= (and b!1074135 res!716107) b!1074136))

(declare-fun m!993623 () Bool)

(assert (=> d!129857 m!993623))

(declare-fun m!993625 () Bool)

(assert (=> d!129857 m!993625))

(declare-fun m!993627 () Bool)

(assert (=> d!129857 m!993627))

(declare-fun m!993629 () Bool)

(assert (=> d!129857 m!993629))

(declare-fun m!993631 () Bool)

(assert (=> b!1074135 m!993631))

(declare-fun m!993633 () Bool)

(assert (=> b!1074136 m!993633))

(assert (=> b!1073927 d!129857))

(declare-fun b!1074145 () Bool)

(declare-fun e!613669 () Bool)

(declare-fun call!45341 () Bool)

(assert (=> b!1074145 (= e!613669 call!45341)))

(declare-fun b!1074146 () Bool)

(declare-fun e!613670 () Bool)

(assert (=> b!1074146 (= e!613670 e!613669)))

(declare-fun lt!476382 () (_ BitVec 64))

(assert (=> b!1074146 (= lt!476382 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476380 () Unit!35315)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68791 (_ BitVec 64) (_ BitVec 32)) Unit!35315)

(assert (=> b!1074146 (= lt!476380 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!476382 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1074146 (arrayContainsKey!0 _keys!1163 lt!476382 #b00000000000000000000000000000000)))

(declare-fun lt!476381 () Unit!35315)

(assert (=> b!1074146 (= lt!476381 lt!476380)))

(declare-fun res!716112 () Bool)

(declare-datatypes ((SeekEntryResult!9840 0))(
  ( (MissingZero!9840 (index!41731 (_ BitVec 32))) (Found!9840 (index!41732 (_ BitVec 32))) (Intermediate!9840 (undefined!10652 Bool) (index!41733 (_ BitVec 32)) (x!96096 (_ BitVec 32))) (Undefined!9840) (MissingVacant!9840 (index!41734 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68791 (_ BitVec 32)) SeekEntryResult!9840)

(assert (=> b!1074146 (= res!716112 (= (seekEntryOrOpen!0 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9840 #b00000000000000000000000000000000)))))

(assert (=> b!1074146 (=> (not res!716112) (not e!613669))))

(declare-fun b!1074147 () Bool)

(assert (=> b!1074147 (= e!613670 call!45341)))

(declare-fun d!129859 () Bool)

(declare-fun res!716113 () Bool)

(declare-fun e!613668 () Bool)

(assert (=> d!129859 (=> res!716113 e!613668)))

(assert (=> d!129859 (= res!716113 (bvsge #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(assert (=> d!129859 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!613668)))

(declare-fun bm!45338 () Bool)

(assert (=> bm!45338 (= call!45341 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1074148 () Bool)

(assert (=> b!1074148 (= e!613668 e!613670)))

(declare-fun c!108148 () Bool)

(assert (=> b!1074148 (= c!108148 (validKeyInArray!0 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129859 (not res!716113)) b!1074148))

(assert (= (and b!1074148 c!108148) b!1074146))

(assert (= (and b!1074148 (not c!108148)) b!1074147))

(assert (= (and b!1074146 res!716112) b!1074145))

(assert (= (or b!1074145 b!1074147) bm!45338))

(assert (=> b!1074146 m!993433))

(declare-fun m!993635 () Bool)

(assert (=> b!1074146 m!993635))

(declare-fun m!993637 () Bool)

(assert (=> b!1074146 m!993637))

(assert (=> b!1074146 m!993433))

(declare-fun m!993639 () Bool)

(assert (=> b!1074146 m!993639))

(declare-fun m!993641 () Bool)

(assert (=> bm!45338 m!993641))

(assert (=> b!1074148 m!993433))

(assert (=> b!1074148 m!993433))

(assert (=> b!1074148 m!993437))

(assert (=> b!1073919 d!129859))

(declare-fun b!1074159 () Bool)

(declare-fun e!613679 () Bool)

(declare-fun e!613681 () Bool)

(assert (=> b!1074159 (= e!613679 e!613681)))

(declare-fun res!716120 () Bool)

(assert (=> b!1074159 (=> (not res!716120) (not e!613681))))

(declare-fun e!613680 () Bool)

(assert (=> b!1074159 (= res!716120 (not e!613680))))

(declare-fun res!716121 () Bool)

(assert (=> b!1074159 (=> (not res!716121) (not e!613680))))

(assert (=> b!1074159 (= res!716121 (validKeyInArray!0 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074160 () Bool)

(declare-fun e!613682 () Bool)

(declare-fun call!45344 () Bool)

(assert (=> b!1074160 (= e!613682 call!45344)))

(declare-fun b!1074161 () Bool)

(assert (=> b!1074161 (= e!613682 call!45344)))

(declare-fun b!1074162 () Bool)

(declare-fun contains!6351 (List!23086 (_ BitVec 64)) Bool)

(assert (=> b!1074162 (= e!613680 (contains!6351 Nil!23083 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074163 () Bool)

(assert (=> b!1074163 (= e!613681 e!613682)))

(declare-fun c!108151 () Bool)

(assert (=> b!1074163 (= c!108151 (validKeyInArray!0 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45341 () Bool)

(assert (=> bm!45341 (= call!45344 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108151 (Cons!23082 (select (arr!33084 _keys!1163) #b00000000000000000000000000000000) Nil!23083) Nil!23083)))))

(declare-fun d!129861 () Bool)

(declare-fun res!716122 () Bool)

(assert (=> d!129861 (=> res!716122 e!613679)))

(assert (=> d!129861 (= res!716122 (bvsge #b00000000000000000000000000000000 (size!33621 _keys!1163)))))

(assert (=> d!129861 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23083) e!613679)))

(assert (= (and d!129861 (not res!716122)) b!1074159))

(assert (= (and b!1074159 res!716121) b!1074162))

(assert (= (and b!1074159 res!716120) b!1074163))

(assert (= (and b!1074163 c!108151) b!1074160))

(assert (= (and b!1074163 (not c!108151)) b!1074161))

(assert (= (or b!1074160 b!1074161) bm!45341))

(assert (=> b!1074159 m!993433))

(assert (=> b!1074159 m!993433))

(assert (=> b!1074159 m!993437))

(assert (=> b!1074162 m!993433))

(assert (=> b!1074162 m!993433))

(declare-fun m!993643 () Bool)

(assert (=> b!1074162 m!993643))

(assert (=> b!1074163 m!993433))

(assert (=> b!1074163 m!993433))

(assert (=> b!1074163 m!993437))

(assert (=> bm!45341 m!993433))

(declare-fun m!993645 () Bool)

(assert (=> bm!45341 m!993645))

(assert (=> b!1073928 d!129861))

(declare-fun condMapEmpty!40555 () Bool)

(declare-fun mapDefault!40555 () ValueCell!12242)

(assert (=> mapNonEmpty!40546 (= condMapEmpty!40555 (= mapRest!40546 ((as const (Array (_ BitVec 32) ValueCell!12242)) mapDefault!40555)))))

(declare-fun e!613688 () Bool)

(declare-fun mapRes!40555 () Bool)

(assert (=> mapNonEmpty!40546 (= tp!77705 (and e!613688 mapRes!40555))))

(declare-fun mapIsEmpty!40555 () Bool)

(assert (=> mapIsEmpty!40555 mapRes!40555))

(declare-fun b!1074170 () Bool)

(declare-fun e!613687 () Bool)

(assert (=> b!1074170 (= e!613687 tp_is_empty!25891)))

(declare-fun b!1074171 () Bool)

(assert (=> b!1074171 (= e!613688 tp_is_empty!25891)))

(declare-fun mapNonEmpty!40555 () Bool)

(declare-fun tp!77720 () Bool)

(assert (=> mapNonEmpty!40555 (= mapRes!40555 (and tp!77720 e!613687))))

(declare-fun mapValue!40555 () ValueCell!12242)

(declare-fun mapKey!40555 () (_ BitVec 32))

(declare-fun mapRest!40555 () (Array (_ BitVec 32) ValueCell!12242))

(assert (=> mapNonEmpty!40555 (= mapRest!40546 (store mapRest!40555 mapKey!40555 mapValue!40555))))

(assert (= (and mapNonEmpty!40546 condMapEmpty!40555) mapIsEmpty!40555))

(assert (= (and mapNonEmpty!40546 (not condMapEmpty!40555)) mapNonEmpty!40555))

(assert (= (and mapNonEmpty!40555 ((_ is ValueCellFull!12242) mapValue!40555)) b!1074170))

(assert (= (and mapNonEmpty!40546 ((_ is ValueCellFull!12242) mapDefault!40555)) b!1074171))

(declare-fun m!993647 () Bool)

(assert (=> mapNonEmpty!40555 m!993647))

(declare-fun b_lambda!16723 () Bool)

(assert (= b_lambda!16721 (or (and start!95088 b_free!22081) b_lambda!16723)))

(declare-fun b_lambda!16725 () Bool)

(assert (= b_lambda!16715 (or (and start!95088 b_free!22081) b_lambda!16725)))

(declare-fun b_lambda!16727 () Bool)

(assert (= b_lambda!16711 (or (and start!95088 b_free!22081) b_lambda!16727)))

(declare-fun b_lambda!16729 () Bool)

(assert (= b_lambda!16713 (or (and start!95088 b_free!22081) b_lambda!16729)))

(declare-fun b_lambda!16731 () Bool)

(assert (= b_lambda!16717 (or (and start!95088 b_free!22081) b_lambda!16731)))

(declare-fun b_lambda!16733 () Bool)

(assert (= b_lambda!16719 (or (and start!95088 b_free!22081) b_lambda!16733)))

(check-sat (not bm!45318) tp_is_empty!25891 (not b!1074131) (not d!129841) (not b!1074083) (not b_lambda!16731) (not d!129839) (not b!1074043) (not b!1074037) (not d!129837) (not b_lambda!16727) (not d!129847) (not b!1074117) (not b!1074125) (not bm!45323) (not b!1074086) (not d!129845) (not d!129851) (not b!1074084) (not b!1074053) (not bm!45320) (not bm!45327) (not b!1074129) (not d!129849) (not b_lambda!16725) (not b!1074073) (not b!1074134) (not b!1074113) (not b!1074121) (not bm!45319) (not b!1074116) (not d!129857) (not bm!45335) (not bm!45326) (not b!1074114) (not b!1074081) (not b!1074079) (not bm!45341) (not b_lambda!16729) (not d!129853) (not d!129835) (not d!129831) (not b!1074159) (not b!1074074) (not b!1074162) (not bm!45334) (not b!1074056) (not b!1074060) (not b!1074072) (not b_lambda!16723) (not b!1074135) (not b!1074066) (not b!1074119) (not b_lambda!16733) (not b_next!22081) (not b!1074126) (not b!1074051) (not b!1074076) (not b!1074148) (not b!1074082) (not b!1074163) (not d!129855) (not b!1074128) (not b!1074085) (not bm!45338) (not b!1074146) (not b!1074052) (not b!1074112) (not bm!45325) (not b!1074075) (not b!1074049) (not b!1073993) (not d!129843) (not b!1074136) (not bm!45330) (not mapNonEmpty!40555) (not d!129833) (not b!1074133) (not b!1074050) b_and!34949 (not b!1074124) (not b!1074122) (not b!1073994))
(check-sat b_and!34949 (not b_next!22081))
