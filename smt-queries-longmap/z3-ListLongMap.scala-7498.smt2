; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94992 () Bool)

(assert start!94992)

(declare-fun b_free!22167 () Bool)

(declare-fun b_next!22167 () Bool)

(assert (=> start!94992 (= b_free!22167 (not b_next!22167))))

(declare-fun tp!77972 () Bool)

(declare-fun b_and!35039 () Bool)

(assert (=> start!94992 (= tp!77972 b_and!35039)))

(declare-fun b!1073960 () Bool)

(declare-fun e!613618 () Bool)

(declare-fun e!613619 () Bool)

(assert (=> b!1073960 (= e!613618 e!613619)))

(declare-fun res!716204 () Bool)

(assert (=> b!1073960 (=> res!716204 e!613619)))

(declare-datatypes ((V!39771 0))(
  ( (V!39772 (val!13039 Int)) )
))
(declare-datatypes ((tuple2!16606 0))(
  ( (tuple2!16607 (_1!8314 (_ BitVec 64)) (_2!8314 V!39771)) )
))
(declare-datatypes ((List!23143 0))(
  ( (Nil!23140) (Cons!23139 (h!24348 tuple2!16606) (t!32484 List!23143)) )
))
(declare-datatypes ((ListLongMap!14575 0))(
  ( (ListLongMap!14576 (toList!7303 List!23143)) )
))
(declare-fun lt!476308 () ListLongMap!14575)

(declare-fun contains!6333 (ListLongMap!14575 (_ BitVec 64)) Bool)

(assert (=> b!1073960 (= res!716204 (contains!6333 lt!476308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39771)

(declare-datatypes ((ValueCell!12285 0))(
  ( (ValueCellFull!12285 (v!15658 V!39771)) (EmptyCell!12285) )
))
(declare-datatypes ((array!68917 0))(
  ( (array!68918 (arr!33150 (Array (_ BitVec 32) ValueCell!12285)) (size!33686 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68917)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39771)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68919 0))(
  ( (array!68920 (arr!33151 (Array (_ BitVec 32) (_ BitVec 64))) (size!33687 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68919)

(declare-fun getCurrentListMap!4174 (array!68919 array!68917 (_ BitVec 32) (_ BitVec 32) V!39771 V!39771 (_ BitVec 32) Int) ListLongMap!14575)

(assert (=> b!1073960 (= lt!476308 (getCurrentListMap!4174 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40684 () Bool)

(declare-fun mapRes!40684 () Bool)

(assert (=> mapIsEmpty!40684 mapRes!40684))

(declare-fun mapNonEmpty!40684 () Bool)

(declare-fun tp!77971 () Bool)

(declare-fun e!613621 () Bool)

(assert (=> mapNonEmpty!40684 (= mapRes!40684 (and tp!77971 e!613621))))

(declare-fun mapValue!40684 () ValueCell!12285)

(declare-fun mapKey!40684 () (_ BitVec 32))

(declare-fun mapRest!40684 () (Array (_ BitVec 32) ValueCell!12285))

(assert (=> mapNonEmpty!40684 (= (arr!33150 _values!955) (store mapRest!40684 mapKey!40684 mapValue!40684))))

(declare-fun b!1073961 () Bool)

(declare-fun e!613623 () Bool)

(assert (=> b!1073961 (= e!613623 (not e!613618))))

(declare-fun res!716205 () Bool)

(assert (=> b!1073961 (=> res!716205 e!613618)))

(assert (=> b!1073961 (= res!716205 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!476310 () ListLongMap!14575)

(declare-fun lt!476305 () ListLongMap!14575)

(assert (=> b!1073961 (= lt!476310 lt!476305)))

(declare-datatypes ((Unit!35364 0))(
  ( (Unit!35365) )
))
(declare-fun lt!476309 () Unit!35364)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39771)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!882 (array!68919 array!68917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39771 V!39771 V!39771 V!39771 (_ BitVec 32) Int) Unit!35364)

(assert (=> b!1073961 (= lt!476309 (lemmaNoChangeToArrayThenSameMapNoExtras!882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3866 (array!68919 array!68917 (_ BitVec 32) (_ BitVec 32) V!39771 V!39771 (_ BitVec 32) Int) ListLongMap!14575)

(assert (=> b!1073961 (= lt!476305 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073961 (= lt!476310 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073962 () Bool)

(declare-fun e!613624 () Bool)

(declare-fun e!613622 () Bool)

(assert (=> b!1073962 (= e!613624 (and e!613622 mapRes!40684))))

(declare-fun condMapEmpty!40684 () Bool)

(declare-fun mapDefault!40684 () ValueCell!12285)

(assert (=> b!1073962 (= condMapEmpty!40684 (= (arr!33150 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12285)) mapDefault!40684)))))

(declare-fun lt!476307 () ListLongMap!14575)

(declare-fun b!1073964 () Bool)

(assert (=> b!1073964 (= e!613619 (= lt!476307 (getCurrentListMap!4174 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)))))

(assert (=> b!1073964 (= lt!476307 lt!476308)))

(declare-fun -!707 (ListLongMap!14575 (_ BitVec 64)) ListLongMap!14575)

(assert (=> b!1073964 (= lt!476307 (-!707 lt!476308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!476306 () Unit!35364)

(declare-fun removeNotPresentStillSame!79 (ListLongMap!14575 (_ BitVec 64)) Unit!35364)

(assert (=> b!1073964 (= lt!476306 (removeNotPresentStillSame!79 lt!476308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1073965 () Bool)

(declare-fun tp_is_empty!25977 () Bool)

(assert (=> b!1073965 (= e!613621 tp_is_empty!25977)))

(declare-fun b!1073966 () Bool)

(declare-fun res!716200 () Bool)

(assert (=> b!1073966 (=> (not res!716200) (not e!613623))))

(declare-datatypes ((List!23144 0))(
  ( (Nil!23141) (Cons!23140 (h!24349 (_ BitVec 64)) (t!32485 List!23144)) )
))
(declare-fun arrayNoDuplicates!0 (array!68919 (_ BitVec 32) List!23144) Bool)

(assert (=> b!1073966 (= res!716200 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23141))))

(declare-fun b!1073967 () Bool)

(declare-fun res!716202 () Bool)

(assert (=> b!1073967 (=> (not res!716202) (not e!613623))))

(assert (=> b!1073967 (= res!716202 (and (= (size!33686 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33687 _keys!1163) (size!33686 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073968 () Bool)

(declare-fun res!716201 () Bool)

(assert (=> b!1073968 (=> (not res!716201) (not e!613623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68919 (_ BitVec 32)) Bool)

(assert (=> b!1073968 (= res!716201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!716203 () Bool)

(assert (=> start!94992 (=> (not res!716203) (not e!613623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94992 (= res!716203 (validMask!0 mask!1515))))

(assert (=> start!94992 e!613623))

(assert (=> start!94992 true))

(assert (=> start!94992 tp_is_empty!25977))

(declare-fun array_inv!25620 (array!68917) Bool)

(assert (=> start!94992 (and (array_inv!25620 _values!955) e!613624)))

(assert (=> start!94992 tp!77972))

(declare-fun array_inv!25621 (array!68919) Bool)

(assert (=> start!94992 (array_inv!25621 _keys!1163)))

(declare-fun b!1073963 () Bool)

(assert (=> b!1073963 (= e!613622 tp_is_empty!25977)))

(assert (= (and start!94992 res!716203) b!1073967))

(assert (= (and b!1073967 res!716202) b!1073968))

(assert (= (and b!1073968 res!716201) b!1073966))

(assert (= (and b!1073966 res!716200) b!1073961))

(assert (= (and b!1073961 (not res!716205)) b!1073960))

(assert (= (and b!1073960 (not res!716204)) b!1073964))

(assert (= (and b!1073962 condMapEmpty!40684) mapIsEmpty!40684))

(assert (= (and b!1073962 (not condMapEmpty!40684)) mapNonEmpty!40684))

(get-info :version)

(assert (= (and mapNonEmpty!40684 ((_ is ValueCellFull!12285) mapValue!40684)) b!1073965))

(assert (= (and b!1073962 ((_ is ValueCellFull!12285) mapDefault!40684)) b!1073963))

(assert (= start!94992 b!1073962))

(declare-fun m!992837 () Bool)

(assert (=> b!1073961 m!992837))

(declare-fun m!992839 () Bool)

(assert (=> b!1073961 m!992839))

(declare-fun m!992841 () Bool)

(assert (=> b!1073961 m!992841))

(declare-fun m!992843 () Bool)

(assert (=> b!1073964 m!992843))

(declare-fun m!992845 () Bool)

(assert (=> b!1073964 m!992845))

(declare-fun m!992847 () Bool)

(assert (=> b!1073964 m!992847))

(declare-fun m!992849 () Bool)

(assert (=> b!1073966 m!992849))

(declare-fun m!992851 () Bool)

(assert (=> b!1073960 m!992851))

(declare-fun m!992853 () Bool)

(assert (=> b!1073960 m!992853))

(declare-fun m!992855 () Bool)

(assert (=> mapNonEmpty!40684 m!992855))

(declare-fun m!992857 () Bool)

(assert (=> b!1073968 m!992857))

(declare-fun m!992859 () Bool)

(assert (=> start!94992 m!992859))

(declare-fun m!992861 () Bool)

(assert (=> start!94992 m!992861))

(declare-fun m!992863 () Bool)

(assert (=> start!94992 m!992863))

(check-sat (not b!1073968) (not b!1073964) (not start!94992) b_and!35039 (not b!1073966) (not b!1073961) tp_is_empty!25977 (not mapNonEmpty!40684) (not b_next!22167) (not b!1073960))
(check-sat b_and!35039 (not b_next!22167))
(get-model)

(declare-fun d!129461 () Bool)

(declare-fun e!613651 () Bool)

(assert (=> d!129461 e!613651))

(declare-fun res!716226 () Bool)

(assert (=> d!129461 (=> res!716226 e!613651)))

(declare-fun lt!476339 () Bool)

(assert (=> d!129461 (= res!716226 (not lt!476339))))

(declare-fun lt!476337 () Bool)

(assert (=> d!129461 (= lt!476339 lt!476337)))

(declare-fun lt!476338 () Unit!35364)

(declare-fun e!613650 () Unit!35364)

(assert (=> d!129461 (= lt!476338 e!613650)))

(declare-fun c!107809 () Bool)

(assert (=> d!129461 (= c!107809 lt!476337)))

(declare-fun containsKey!577 (List!23143 (_ BitVec 64)) Bool)

(assert (=> d!129461 (= lt!476337 (containsKey!577 (toList!7303 lt!476308) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129461 (= (contains!6333 lt!476308 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476339)))

(declare-fun b!1074002 () Bool)

(declare-fun lt!476340 () Unit!35364)

(assert (=> b!1074002 (= e!613650 lt!476340)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!410 (List!23143 (_ BitVec 64)) Unit!35364)

(assert (=> b!1074002 (= lt!476340 (lemmaContainsKeyImpliesGetValueByKeyDefined!410 (toList!7303 lt!476308) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!657 0))(
  ( (Some!656 (v!15660 V!39771)) (None!655) )
))
(declare-fun isDefined!449 (Option!657) Bool)

(declare-fun getValueByKey!606 (List!23143 (_ BitVec 64)) Option!657)

(assert (=> b!1074002 (isDefined!449 (getValueByKey!606 (toList!7303 lt!476308) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074003 () Bool)

(declare-fun Unit!35368 () Unit!35364)

(assert (=> b!1074003 (= e!613650 Unit!35368)))

(declare-fun b!1074004 () Bool)

(assert (=> b!1074004 (= e!613651 (isDefined!449 (getValueByKey!606 (toList!7303 lt!476308) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129461 c!107809) b!1074002))

(assert (= (and d!129461 (not c!107809)) b!1074003))

(assert (= (and d!129461 (not res!716226)) b!1074004))

(declare-fun m!992893 () Bool)

(assert (=> d!129461 m!992893))

(declare-fun m!992895 () Bool)

(assert (=> b!1074002 m!992895))

(declare-fun m!992897 () Bool)

(assert (=> b!1074002 m!992897))

(assert (=> b!1074002 m!992897))

(declare-fun m!992899 () Bool)

(assert (=> b!1074002 m!992899))

(assert (=> b!1074004 m!992897))

(assert (=> b!1074004 m!992897))

(assert (=> b!1074004 m!992899))

(assert (=> b!1073960 d!129461))

(declare-fun b!1074047 () Bool)

(declare-fun e!613684 () Bool)

(declare-fun lt!476399 () ListLongMap!14575)

(declare-fun apply!934 (ListLongMap!14575 (_ BitVec 64)) V!39771)

(assert (=> b!1074047 (= e!613684 (= (apply!934 lt!476399 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1074048 () Bool)

(declare-fun e!613688 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1074048 (= e!613688 (validKeyInArray!0 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074049 () Bool)

(declare-fun e!613687 () Bool)

(assert (=> b!1074049 (= e!613687 e!613684)))

(declare-fun res!716250 () Bool)

(declare-fun call!45335 () Bool)

(assert (=> b!1074049 (= res!716250 call!45335)))

(assert (=> b!1074049 (=> (not res!716250) (not e!613684))))

(declare-fun b!1074050 () Bool)

(declare-fun res!716249 () Bool)

(declare-fun e!613686 () Bool)

(assert (=> b!1074050 (=> (not res!716249) (not e!613686))))

(declare-fun e!613690 () Bool)

(assert (=> b!1074050 (= res!716249 e!613690)))

(declare-fun c!107823 () Bool)

(assert (=> b!1074050 (= c!107823 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074051 () Bool)

(declare-fun e!613680 () ListLongMap!14575)

(declare-fun call!45334 () ListLongMap!14575)

(assert (=> b!1074051 (= e!613680 call!45334)))

(declare-fun b!1074052 () Bool)

(declare-fun e!613681 () Bool)

(assert (=> b!1074052 (= e!613681 (= (apply!934 lt!476399 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun d!129463 () Bool)

(assert (=> d!129463 e!613686))

(declare-fun res!716251 () Bool)

(assert (=> d!129463 (=> (not res!716251) (not e!613686))))

(assert (=> d!129463 (= res!716251 (or (bvsge #b00000000000000000000000000000000 (size!33687 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))))

(declare-fun lt!476400 () ListLongMap!14575)

(assert (=> d!129463 (= lt!476399 lt!476400)))

(declare-fun lt!476387 () Unit!35364)

(declare-fun e!613683 () Unit!35364)

(assert (=> d!129463 (= lt!476387 e!613683)))

(declare-fun c!107827 () Bool)

(assert (=> d!129463 (= c!107827 e!613688)))

(declare-fun res!716248 () Bool)

(assert (=> d!129463 (=> (not res!716248) (not e!613688))))

(assert (=> d!129463 (= res!716248 (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun e!613679 () ListLongMap!14575)

(assert (=> d!129463 (= lt!476400 e!613679)))

(declare-fun c!107822 () Bool)

(assert (=> d!129463 (= c!107822 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129463 (validMask!0 mask!1515)))

(assert (=> d!129463 (= (getCurrentListMap!4174 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476399)))

(declare-fun b!1074053 () Bool)

(declare-fun res!716247 () Bool)

(assert (=> b!1074053 (=> (not res!716247) (not e!613686))))

(declare-fun e!613689 () Bool)

(assert (=> b!1074053 (= res!716247 e!613689)))

(declare-fun res!716246 () Bool)

(assert (=> b!1074053 (=> res!716246 e!613689)))

(declare-fun e!613678 () Bool)

(assert (=> b!1074053 (= res!716246 (not e!613678))))

(declare-fun res!716253 () Bool)

(assert (=> b!1074053 (=> (not res!716253) (not e!613678))))

(assert (=> b!1074053 (= res!716253 (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun b!1074054 () Bool)

(declare-fun e!613682 () ListLongMap!14575)

(assert (=> b!1074054 (= e!613679 e!613682)))

(declare-fun c!107826 () Bool)

(assert (=> b!1074054 (= c!107826 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074055 () Bool)

(assert (=> b!1074055 (= e!613678 (validKeyInArray!0 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45330 () Bool)

(declare-fun call!45333 () ListLongMap!14575)

(assert (=> bm!45330 (= call!45333 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074056 () Bool)

(assert (=> b!1074056 (= e!613682 call!45334)))

(declare-fun bm!45331 () Bool)

(declare-fun call!45339 () ListLongMap!14575)

(assert (=> bm!45331 (= call!45339 call!45333)))

(declare-fun b!1074057 () Bool)

(declare-fun call!45337 () Bool)

(assert (=> b!1074057 (= e!613690 (not call!45337))))

(declare-fun bm!45332 () Bool)

(declare-fun call!45338 () ListLongMap!14575)

(assert (=> bm!45332 (= call!45338 call!45339)))

(declare-fun bm!45333 () Bool)

(declare-fun call!45336 () ListLongMap!14575)

(declare-fun +!3214 (ListLongMap!14575 tuple2!16606) ListLongMap!14575)

(assert (=> bm!45333 (= call!45336 (+!3214 (ite c!107822 call!45333 (ite c!107826 call!45339 call!45338)) (ite (or c!107822 c!107826) (tuple2!16607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1074058 () Bool)

(assert (=> b!1074058 (= e!613690 e!613681)))

(declare-fun res!716245 () Bool)

(assert (=> b!1074058 (= res!716245 call!45337)))

(assert (=> b!1074058 (=> (not res!716245) (not e!613681))))

(declare-fun b!1074059 () Bool)

(assert (=> b!1074059 (= e!613680 call!45338)))

(declare-fun b!1074060 () Bool)

(assert (=> b!1074060 (= e!613687 (not call!45335))))

(declare-fun b!1074061 () Bool)

(assert (=> b!1074061 (= e!613679 (+!3214 call!45336 (tuple2!16607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1074062 () Bool)

(declare-fun Unit!35369 () Unit!35364)

(assert (=> b!1074062 (= e!613683 Unit!35369)))

(declare-fun bm!45334 () Bool)

(assert (=> bm!45334 (= call!45337 (contains!6333 lt!476399 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45335 () Bool)

(assert (=> bm!45335 (= call!45335 (contains!6333 lt!476399 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!613685 () Bool)

(declare-fun b!1074063 () Bool)

(declare-fun get!17218 (ValueCell!12285 V!39771) V!39771)

(declare-fun dynLambda!2041 (Int (_ BitVec 64)) V!39771)

(assert (=> b!1074063 (= e!613685 (= (apply!934 lt!476399 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)) (get!17218 (select (arr!33150 _values!955) #b00000000000000000000000000000000) (dynLambda!2041 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33686 _values!955)))))

(assert (=> b!1074063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun b!1074064 () Bool)

(declare-fun lt!476393 () Unit!35364)

(assert (=> b!1074064 (= e!613683 lt!476393)))

(declare-fun lt!476403 () ListLongMap!14575)

(assert (=> b!1074064 (= lt!476403 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476402 () (_ BitVec 64))

(assert (=> b!1074064 (= lt!476402 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476401 () (_ BitVec 64))

(assert (=> b!1074064 (= lt!476401 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476406 () Unit!35364)

(declare-fun addStillContains!647 (ListLongMap!14575 (_ BitVec 64) V!39771 (_ BitVec 64)) Unit!35364)

(assert (=> b!1074064 (= lt!476406 (addStillContains!647 lt!476403 lt!476402 zeroValueBefore!47 lt!476401))))

(assert (=> b!1074064 (contains!6333 (+!3214 lt!476403 (tuple2!16607 lt!476402 zeroValueBefore!47)) lt!476401)))

(declare-fun lt!476390 () Unit!35364)

(assert (=> b!1074064 (= lt!476390 lt!476406)))

(declare-fun lt!476391 () ListLongMap!14575)

(assert (=> b!1074064 (= lt!476391 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476386 () (_ BitVec 64))

(assert (=> b!1074064 (= lt!476386 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476392 () (_ BitVec 64))

(assert (=> b!1074064 (= lt!476392 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476397 () Unit!35364)

(declare-fun addApplyDifferent!507 (ListLongMap!14575 (_ BitVec 64) V!39771 (_ BitVec 64)) Unit!35364)

(assert (=> b!1074064 (= lt!476397 (addApplyDifferent!507 lt!476391 lt!476386 minValue!907 lt!476392))))

(assert (=> b!1074064 (= (apply!934 (+!3214 lt!476391 (tuple2!16607 lt!476386 minValue!907)) lt!476392) (apply!934 lt!476391 lt!476392))))

(declare-fun lt!476394 () Unit!35364)

(assert (=> b!1074064 (= lt!476394 lt!476397)))

(declare-fun lt!476396 () ListLongMap!14575)

(assert (=> b!1074064 (= lt!476396 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476388 () (_ BitVec 64))

(assert (=> b!1074064 (= lt!476388 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476398 () (_ BitVec 64))

(assert (=> b!1074064 (= lt!476398 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476405 () Unit!35364)

(assert (=> b!1074064 (= lt!476405 (addApplyDifferent!507 lt!476396 lt!476388 zeroValueBefore!47 lt!476398))))

(assert (=> b!1074064 (= (apply!934 (+!3214 lt!476396 (tuple2!16607 lt!476388 zeroValueBefore!47)) lt!476398) (apply!934 lt!476396 lt!476398))))

(declare-fun lt!476385 () Unit!35364)

(assert (=> b!1074064 (= lt!476385 lt!476405)))

(declare-fun lt!476404 () ListLongMap!14575)

(assert (=> b!1074064 (= lt!476404 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476395 () (_ BitVec 64))

(assert (=> b!1074064 (= lt!476395 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476389 () (_ BitVec 64))

(assert (=> b!1074064 (= lt!476389 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074064 (= lt!476393 (addApplyDifferent!507 lt!476404 lt!476395 minValue!907 lt!476389))))

(assert (=> b!1074064 (= (apply!934 (+!3214 lt!476404 (tuple2!16607 lt!476395 minValue!907)) lt!476389) (apply!934 lt!476404 lt!476389))))

(declare-fun b!1074065 () Bool)

(assert (=> b!1074065 (= e!613689 e!613685)))

(declare-fun res!716252 () Bool)

(assert (=> b!1074065 (=> (not res!716252) (not e!613685))))

(assert (=> b!1074065 (= res!716252 (contains!6333 lt!476399 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun b!1074066 () Bool)

(declare-fun c!107824 () Bool)

(assert (=> b!1074066 (= c!107824 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1074066 (= e!613682 e!613680)))

(declare-fun bm!45336 () Bool)

(assert (=> bm!45336 (= call!45334 call!45336)))

(declare-fun b!1074067 () Bool)

(assert (=> b!1074067 (= e!613686 e!613687)))

(declare-fun c!107825 () Bool)

(assert (=> b!1074067 (= c!107825 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!129463 c!107822) b!1074061))

(assert (= (and d!129463 (not c!107822)) b!1074054))

(assert (= (and b!1074054 c!107826) b!1074056))

(assert (= (and b!1074054 (not c!107826)) b!1074066))

(assert (= (and b!1074066 c!107824) b!1074051))

(assert (= (and b!1074066 (not c!107824)) b!1074059))

(assert (= (or b!1074051 b!1074059) bm!45332))

(assert (= (or b!1074056 bm!45332) bm!45331))

(assert (= (or b!1074056 b!1074051) bm!45336))

(assert (= (or b!1074061 bm!45331) bm!45330))

(assert (= (or b!1074061 bm!45336) bm!45333))

(assert (= (and d!129463 res!716248) b!1074048))

(assert (= (and d!129463 c!107827) b!1074064))

(assert (= (and d!129463 (not c!107827)) b!1074062))

(assert (= (and d!129463 res!716251) b!1074053))

(assert (= (and b!1074053 res!716253) b!1074055))

(assert (= (and b!1074053 (not res!716246)) b!1074065))

(assert (= (and b!1074065 res!716252) b!1074063))

(assert (= (and b!1074053 res!716247) b!1074050))

(assert (= (and b!1074050 c!107823) b!1074058))

(assert (= (and b!1074050 (not c!107823)) b!1074057))

(assert (= (and b!1074058 res!716245) b!1074052))

(assert (= (or b!1074058 b!1074057) bm!45334))

(assert (= (and b!1074050 res!716249) b!1074067))

(assert (= (and b!1074067 c!107825) b!1074049))

(assert (= (and b!1074067 (not c!107825)) b!1074060))

(assert (= (and b!1074049 res!716250) b!1074047))

(assert (= (or b!1074049 b!1074060) bm!45335))

(declare-fun b_lambda!16761 () Bool)

(assert (=> (not b_lambda!16761) (not b!1074063)))

(declare-fun t!32488 () Bool)

(declare-fun tb!7163 () Bool)

(assert (=> (and start!94992 (= defaultEntry!963 defaultEntry!963) t!32488) tb!7163))

(declare-fun result!14797 () Bool)

(assert (=> tb!7163 (= result!14797 tp_is_empty!25977)))

(assert (=> b!1074063 t!32488))

(declare-fun b_and!35043 () Bool)

(assert (= b_and!35039 (and (=> t!32488 result!14797) b_and!35043)))

(declare-fun m!992901 () Bool)

(assert (=> b!1074065 m!992901))

(assert (=> b!1074065 m!992901))

(declare-fun m!992903 () Bool)

(assert (=> b!1074065 m!992903))

(declare-fun m!992905 () Bool)

(assert (=> bm!45334 m!992905))

(assert (=> d!129463 m!992859))

(assert (=> b!1074063 m!992901))

(declare-fun m!992907 () Bool)

(assert (=> b!1074063 m!992907))

(assert (=> b!1074063 m!992901))

(declare-fun m!992909 () Bool)

(assert (=> b!1074063 m!992909))

(declare-fun m!992911 () Bool)

(assert (=> b!1074063 m!992911))

(assert (=> b!1074063 m!992907))

(declare-fun m!992913 () Bool)

(assert (=> b!1074063 m!992913))

(assert (=> b!1074063 m!992911))

(declare-fun m!992915 () Bool)

(assert (=> bm!45333 m!992915))

(declare-fun m!992917 () Bool)

(assert (=> b!1074064 m!992917))

(declare-fun m!992919 () Bool)

(assert (=> b!1074064 m!992919))

(declare-fun m!992921 () Bool)

(assert (=> b!1074064 m!992921))

(assert (=> b!1074064 m!992901))

(declare-fun m!992923 () Bool)

(assert (=> b!1074064 m!992923))

(declare-fun m!992925 () Bool)

(assert (=> b!1074064 m!992925))

(declare-fun m!992927 () Bool)

(assert (=> b!1074064 m!992927))

(assert (=> b!1074064 m!992841))

(declare-fun m!992929 () Bool)

(assert (=> b!1074064 m!992929))

(declare-fun m!992931 () Bool)

(assert (=> b!1074064 m!992931))

(declare-fun m!992933 () Bool)

(assert (=> b!1074064 m!992933))

(declare-fun m!992935 () Bool)

(assert (=> b!1074064 m!992935))

(declare-fun m!992937 () Bool)

(assert (=> b!1074064 m!992937))

(declare-fun m!992939 () Bool)

(assert (=> b!1074064 m!992939))

(declare-fun m!992941 () Bool)

(assert (=> b!1074064 m!992941))

(assert (=> b!1074064 m!992923))

(declare-fun m!992943 () Bool)

(assert (=> b!1074064 m!992943))

(assert (=> b!1074064 m!992919))

(assert (=> b!1074064 m!992935))

(declare-fun m!992945 () Bool)

(assert (=> b!1074064 m!992945))

(assert (=> b!1074064 m!992925))

(declare-fun m!992947 () Bool)

(assert (=> b!1074061 m!992947))

(declare-fun m!992949 () Bool)

(assert (=> bm!45335 m!992949))

(assert (=> b!1074055 m!992901))

(assert (=> b!1074055 m!992901))

(declare-fun m!992951 () Bool)

(assert (=> b!1074055 m!992951))

(assert (=> b!1074048 m!992901))

(assert (=> b!1074048 m!992901))

(assert (=> b!1074048 m!992951))

(assert (=> bm!45330 m!992841))

(declare-fun m!992953 () Bool)

(assert (=> b!1074047 m!992953))

(declare-fun m!992955 () Bool)

(assert (=> b!1074052 m!992955))

(assert (=> b!1073960 d!129463))

(declare-fun d!129465 () Bool)

(assert (=> d!129465 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94992 d!129465))

(declare-fun d!129467 () Bool)

(assert (=> d!129467 (= (array_inv!25620 _values!955) (bvsge (size!33686 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94992 d!129467))

(declare-fun d!129469 () Bool)

(assert (=> d!129469 (= (array_inv!25621 _keys!1163) (bvsge (size!33687 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94992 d!129469))

(declare-fun b!1074070 () Bool)

(declare-fun e!613697 () Bool)

(declare-fun lt!476421 () ListLongMap!14575)

(assert (=> b!1074070 (= e!613697 (= (apply!934 lt!476421 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1074071 () Bool)

(declare-fun e!613701 () Bool)

(assert (=> b!1074071 (= e!613701 (validKeyInArray!0 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074072 () Bool)

(declare-fun e!613700 () Bool)

(assert (=> b!1074072 (= e!613700 e!613697)))

(declare-fun res!716259 () Bool)

(declare-fun call!45342 () Bool)

(assert (=> b!1074072 (= res!716259 call!45342)))

(assert (=> b!1074072 (=> (not res!716259) (not e!613697))))

(declare-fun b!1074073 () Bool)

(declare-fun res!716258 () Bool)

(declare-fun e!613699 () Bool)

(assert (=> b!1074073 (=> (not res!716258) (not e!613699))))

(declare-fun e!613703 () Bool)

(assert (=> b!1074073 (= res!716258 e!613703)))

(declare-fun c!107829 () Bool)

(assert (=> b!1074073 (= c!107829 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074074 () Bool)

(declare-fun e!613693 () ListLongMap!14575)

(declare-fun call!45341 () ListLongMap!14575)

(assert (=> b!1074074 (= e!613693 call!45341)))

(declare-fun b!1074075 () Bool)

(declare-fun e!613694 () Bool)

(assert (=> b!1074075 (= e!613694 (= (apply!934 lt!476421 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun d!129471 () Bool)

(assert (=> d!129471 e!613699))

(declare-fun res!716260 () Bool)

(assert (=> d!129471 (=> (not res!716260) (not e!613699))))

(assert (=> d!129471 (= res!716260 (or (bvsge #b00000000000000000000000000000000 (size!33687 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))))

(declare-fun lt!476422 () ListLongMap!14575)

(assert (=> d!129471 (= lt!476421 lt!476422)))

(declare-fun lt!476409 () Unit!35364)

(declare-fun e!613696 () Unit!35364)

(assert (=> d!129471 (= lt!476409 e!613696)))

(declare-fun c!107833 () Bool)

(assert (=> d!129471 (= c!107833 e!613701)))

(declare-fun res!716257 () Bool)

(assert (=> d!129471 (=> (not res!716257) (not e!613701))))

(assert (=> d!129471 (= res!716257 (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun e!613692 () ListLongMap!14575)

(assert (=> d!129471 (= lt!476422 e!613692)))

(declare-fun c!107828 () Bool)

(assert (=> d!129471 (= c!107828 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129471 (validMask!0 mask!1515)))

(assert (=> d!129471 (= (getCurrentListMap!4174 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476421)))

(declare-fun b!1074076 () Bool)

(declare-fun res!716256 () Bool)

(assert (=> b!1074076 (=> (not res!716256) (not e!613699))))

(declare-fun e!613702 () Bool)

(assert (=> b!1074076 (= res!716256 e!613702)))

(declare-fun res!716255 () Bool)

(assert (=> b!1074076 (=> res!716255 e!613702)))

(declare-fun e!613691 () Bool)

(assert (=> b!1074076 (= res!716255 (not e!613691))))

(declare-fun res!716262 () Bool)

(assert (=> b!1074076 (=> (not res!716262) (not e!613691))))

(assert (=> b!1074076 (= res!716262 (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun b!1074077 () Bool)

(declare-fun e!613695 () ListLongMap!14575)

(assert (=> b!1074077 (= e!613692 e!613695)))

(declare-fun c!107832 () Bool)

(assert (=> b!1074077 (= c!107832 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074078 () Bool)

(assert (=> b!1074078 (= e!613691 (validKeyInArray!0 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun call!45340 () ListLongMap!14575)

(declare-fun bm!45337 () Bool)

(assert (=> bm!45337 (= call!45340 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074079 () Bool)

(assert (=> b!1074079 (= e!613695 call!45341)))

(declare-fun bm!45338 () Bool)

(declare-fun call!45346 () ListLongMap!14575)

(assert (=> bm!45338 (= call!45346 call!45340)))

(declare-fun b!1074080 () Bool)

(declare-fun call!45344 () Bool)

(assert (=> b!1074080 (= e!613703 (not call!45344))))

(declare-fun bm!45339 () Bool)

(declare-fun call!45345 () ListLongMap!14575)

(assert (=> bm!45339 (= call!45345 call!45346)))

(declare-fun bm!45340 () Bool)

(declare-fun call!45343 () ListLongMap!14575)

(assert (=> bm!45340 (= call!45343 (+!3214 (ite c!107828 call!45340 (ite c!107832 call!45346 call!45345)) (ite (or c!107828 c!107832) (tuple2!16607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1074081 () Bool)

(assert (=> b!1074081 (= e!613703 e!613694)))

(declare-fun res!716254 () Bool)

(assert (=> b!1074081 (= res!716254 call!45344)))

(assert (=> b!1074081 (=> (not res!716254) (not e!613694))))

(declare-fun b!1074082 () Bool)

(assert (=> b!1074082 (= e!613693 call!45345)))

(declare-fun b!1074083 () Bool)

(assert (=> b!1074083 (= e!613700 (not call!45342))))

(declare-fun b!1074084 () Bool)

(assert (=> b!1074084 (= e!613692 (+!3214 call!45343 (tuple2!16607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1074085 () Bool)

(declare-fun Unit!35370 () Unit!35364)

(assert (=> b!1074085 (= e!613696 Unit!35370)))

(declare-fun bm!45341 () Bool)

(assert (=> bm!45341 (= call!45344 (contains!6333 lt!476421 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45342 () Bool)

(assert (=> bm!45342 (= call!45342 (contains!6333 lt!476421 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!613698 () Bool)

(declare-fun b!1074086 () Bool)

(assert (=> b!1074086 (= e!613698 (= (apply!934 lt!476421 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)) (get!17218 (select (arr!33150 _values!955) #b00000000000000000000000000000000) (dynLambda!2041 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074086 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33686 _values!955)))))

(assert (=> b!1074086 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun b!1074087 () Bool)

(declare-fun lt!476415 () Unit!35364)

(assert (=> b!1074087 (= e!613696 lt!476415)))

(declare-fun lt!476425 () ListLongMap!14575)

(assert (=> b!1074087 (= lt!476425 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476424 () (_ BitVec 64))

(assert (=> b!1074087 (= lt!476424 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476423 () (_ BitVec 64))

(assert (=> b!1074087 (= lt!476423 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476428 () Unit!35364)

(assert (=> b!1074087 (= lt!476428 (addStillContains!647 lt!476425 lt!476424 zeroValueAfter!47 lt!476423))))

(assert (=> b!1074087 (contains!6333 (+!3214 lt!476425 (tuple2!16607 lt!476424 zeroValueAfter!47)) lt!476423)))

(declare-fun lt!476412 () Unit!35364)

(assert (=> b!1074087 (= lt!476412 lt!476428)))

(declare-fun lt!476413 () ListLongMap!14575)

(assert (=> b!1074087 (= lt!476413 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476408 () (_ BitVec 64))

(assert (=> b!1074087 (= lt!476408 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476414 () (_ BitVec 64))

(assert (=> b!1074087 (= lt!476414 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476419 () Unit!35364)

(assert (=> b!1074087 (= lt!476419 (addApplyDifferent!507 lt!476413 lt!476408 minValue!907 lt!476414))))

(assert (=> b!1074087 (= (apply!934 (+!3214 lt!476413 (tuple2!16607 lt!476408 minValue!907)) lt!476414) (apply!934 lt!476413 lt!476414))))

(declare-fun lt!476416 () Unit!35364)

(assert (=> b!1074087 (= lt!476416 lt!476419)))

(declare-fun lt!476418 () ListLongMap!14575)

(assert (=> b!1074087 (= lt!476418 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476410 () (_ BitVec 64))

(assert (=> b!1074087 (= lt!476410 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476420 () (_ BitVec 64))

(assert (=> b!1074087 (= lt!476420 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476427 () Unit!35364)

(assert (=> b!1074087 (= lt!476427 (addApplyDifferent!507 lt!476418 lt!476410 zeroValueAfter!47 lt!476420))))

(assert (=> b!1074087 (= (apply!934 (+!3214 lt!476418 (tuple2!16607 lt!476410 zeroValueAfter!47)) lt!476420) (apply!934 lt!476418 lt!476420))))

(declare-fun lt!476407 () Unit!35364)

(assert (=> b!1074087 (= lt!476407 lt!476427)))

(declare-fun lt!476426 () ListLongMap!14575)

(assert (=> b!1074087 (= lt!476426 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476417 () (_ BitVec 64))

(assert (=> b!1074087 (= lt!476417 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476411 () (_ BitVec 64))

(assert (=> b!1074087 (= lt!476411 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074087 (= lt!476415 (addApplyDifferent!507 lt!476426 lt!476417 minValue!907 lt!476411))))

(assert (=> b!1074087 (= (apply!934 (+!3214 lt!476426 (tuple2!16607 lt!476417 minValue!907)) lt!476411) (apply!934 lt!476426 lt!476411))))

(declare-fun b!1074088 () Bool)

(assert (=> b!1074088 (= e!613702 e!613698)))

(declare-fun res!716261 () Bool)

(assert (=> b!1074088 (=> (not res!716261) (not e!613698))))

(assert (=> b!1074088 (= res!716261 (contains!6333 lt!476421 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074088 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun b!1074089 () Bool)

(declare-fun c!107830 () Bool)

(assert (=> b!1074089 (= c!107830 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1074089 (= e!613695 e!613693)))

(declare-fun bm!45343 () Bool)

(assert (=> bm!45343 (= call!45341 call!45343)))

(declare-fun b!1074090 () Bool)

(assert (=> b!1074090 (= e!613699 e!613700)))

(declare-fun c!107831 () Bool)

(assert (=> b!1074090 (= c!107831 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!129471 c!107828) b!1074084))

(assert (= (and d!129471 (not c!107828)) b!1074077))

(assert (= (and b!1074077 c!107832) b!1074079))

(assert (= (and b!1074077 (not c!107832)) b!1074089))

(assert (= (and b!1074089 c!107830) b!1074074))

(assert (= (and b!1074089 (not c!107830)) b!1074082))

(assert (= (or b!1074074 b!1074082) bm!45339))

(assert (= (or b!1074079 bm!45339) bm!45338))

(assert (= (or b!1074079 b!1074074) bm!45343))

(assert (= (or b!1074084 bm!45338) bm!45337))

(assert (= (or b!1074084 bm!45343) bm!45340))

(assert (= (and d!129471 res!716257) b!1074071))

(assert (= (and d!129471 c!107833) b!1074087))

(assert (= (and d!129471 (not c!107833)) b!1074085))

(assert (= (and d!129471 res!716260) b!1074076))

(assert (= (and b!1074076 res!716262) b!1074078))

(assert (= (and b!1074076 (not res!716255)) b!1074088))

(assert (= (and b!1074088 res!716261) b!1074086))

(assert (= (and b!1074076 res!716256) b!1074073))

(assert (= (and b!1074073 c!107829) b!1074081))

(assert (= (and b!1074073 (not c!107829)) b!1074080))

(assert (= (and b!1074081 res!716254) b!1074075))

(assert (= (or b!1074081 b!1074080) bm!45341))

(assert (= (and b!1074073 res!716258) b!1074090))

(assert (= (and b!1074090 c!107831) b!1074072))

(assert (= (and b!1074090 (not c!107831)) b!1074083))

(assert (= (and b!1074072 res!716259) b!1074070))

(assert (= (or b!1074072 b!1074083) bm!45342))

(declare-fun b_lambda!16763 () Bool)

(assert (=> (not b_lambda!16763) (not b!1074086)))

(assert (=> b!1074086 t!32488))

(declare-fun b_and!35045 () Bool)

(assert (= b_and!35043 (and (=> t!32488 result!14797) b_and!35045)))

(assert (=> b!1074088 m!992901))

(assert (=> b!1074088 m!992901))

(declare-fun m!992957 () Bool)

(assert (=> b!1074088 m!992957))

(declare-fun m!992959 () Bool)

(assert (=> bm!45341 m!992959))

(assert (=> d!129471 m!992859))

(assert (=> b!1074086 m!992901))

(assert (=> b!1074086 m!992907))

(assert (=> b!1074086 m!992901))

(declare-fun m!992961 () Bool)

(assert (=> b!1074086 m!992961))

(assert (=> b!1074086 m!992911))

(assert (=> b!1074086 m!992907))

(assert (=> b!1074086 m!992913))

(assert (=> b!1074086 m!992911))

(declare-fun m!992963 () Bool)

(assert (=> bm!45340 m!992963))

(declare-fun m!992965 () Bool)

(assert (=> b!1074087 m!992965))

(declare-fun m!992967 () Bool)

(assert (=> b!1074087 m!992967))

(declare-fun m!992969 () Bool)

(assert (=> b!1074087 m!992969))

(assert (=> b!1074087 m!992901))

(declare-fun m!992971 () Bool)

(assert (=> b!1074087 m!992971))

(declare-fun m!992973 () Bool)

(assert (=> b!1074087 m!992973))

(declare-fun m!992975 () Bool)

(assert (=> b!1074087 m!992975))

(assert (=> b!1074087 m!992839))

(declare-fun m!992977 () Bool)

(assert (=> b!1074087 m!992977))

(declare-fun m!992979 () Bool)

(assert (=> b!1074087 m!992979))

(declare-fun m!992981 () Bool)

(assert (=> b!1074087 m!992981))

(declare-fun m!992983 () Bool)

(assert (=> b!1074087 m!992983))

(declare-fun m!992985 () Bool)

(assert (=> b!1074087 m!992985))

(declare-fun m!992987 () Bool)

(assert (=> b!1074087 m!992987))

(declare-fun m!992989 () Bool)

(assert (=> b!1074087 m!992989))

(assert (=> b!1074087 m!992971))

(declare-fun m!992991 () Bool)

(assert (=> b!1074087 m!992991))

(assert (=> b!1074087 m!992967))

(assert (=> b!1074087 m!992983))

(declare-fun m!992993 () Bool)

(assert (=> b!1074087 m!992993))

(assert (=> b!1074087 m!992973))

(declare-fun m!992995 () Bool)

(assert (=> b!1074084 m!992995))

(declare-fun m!992997 () Bool)

(assert (=> bm!45342 m!992997))

(assert (=> b!1074078 m!992901))

(assert (=> b!1074078 m!992901))

(assert (=> b!1074078 m!992951))

(assert (=> b!1074071 m!992901))

(assert (=> b!1074071 m!992901))

(assert (=> b!1074071 m!992951))

(assert (=> bm!45337 m!992839))

(declare-fun m!992999 () Bool)

(assert (=> b!1074070 m!992999))

(declare-fun m!993001 () Bool)

(assert (=> b!1074075 m!993001))

(assert (=> b!1073964 d!129471))

(declare-fun d!129473 () Bool)

(declare-fun lt!476431 () ListLongMap!14575)

(assert (=> d!129473 (not (contains!6333 lt!476431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!75 (List!23143 (_ BitVec 64)) List!23143)

(assert (=> d!129473 (= lt!476431 (ListLongMap!14576 (removeStrictlySorted!75 (toList!7303 lt!476308) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129473 (= (-!707 lt!476308 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476431)))

(declare-fun bs!31655 () Bool)

(assert (= bs!31655 d!129473))

(declare-fun m!993003 () Bool)

(assert (=> bs!31655 m!993003))

(declare-fun m!993005 () Bool)

(assert (=> bs!31655 m!993005))

(assert (=> b!1073964 d!129473))

(declare-fun d!129475 () Bool)

(assert (=> d!129475 (= (-!707 lt!476308 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476308)))

(declare-fun lt!476434 () Unit!35364)

(declare-fun choose!1748 (ListLongMap!14575 (_ BitVec 64)) Unit!35364)

(assert (=> d!129475 (= lt!476434 (choose!1748 lt!476308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129475 (not (contains!6333 lt!476308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129475 (= (removeNotPresentStillSame!79 lt!476308 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476434)))

(declare-fun bs!31656 () Bool)

(assert (= bs!31656 d!129475))

(assert (=> bs!31656 m!992845))

(declare-fun m!993007 () Bool)

(assert (=> bs!31656 m!993007))

(assert (=> bs!31656 m!992851))

(assert (=> b!1073964 d!129475))

(declare-fun b!1074099 () Bool)

(declare-fun e!613712 () Bool)

(declare-fun e!613710 () Bool)

(assert (=> b!1074099 (= e!613712 e!613710)))

(declare-fun c!107836 () Bool)

(assert (=> b!1074099 (= c!107836 (validKeyInArray!0 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129477 () Bool)

(declare-fun res!716268 () Bool)

(assert (=> d!129477 (=> res!716268 e!613712)))

(assert (=> d!129477 (= res!716268 (bvsge #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (=> d!129477 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!613712)))

(declare-fun b!1074100 () Bool)

(declare-fun call!45349 () Bool)

(assert (=> b!1074100 (= e!613710 call!45349)))

(declare-fun bm!45346 () Bool)

(assert (=> bm!45346 (= call!45349 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1074101 () Bool)

(declare-fun e!613711 () Bool)

(assert (=> b!1074101 (= e!613711 call!45349)))

(declare-fun b!1074102 () Bool)

(assert (=> b!1074102 (= e!613710 e!613711)))

(declare-fun lt!476441 () (_ BitVec 64))

(assert (=> b!1074102 (= lt!476441 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476442 () Unit!35364)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68919 (_ BitVec 64) (_ BitVec 32)) Unit!35364)

(assert (=> b!1074102 (= lt!476442 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!476441 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1074102 (arrayContainsKey!0 _keys!1163 lt!476441 #b00000000000000000000000000000000)))

(declare-fun lt!476443 () Unit!35364)

(assert (=> b!1074102 (= lt!476443 lt!476442)))

(declare-fun res!716267 () Bool)

(declare-datatypes ((SeekEntryResult!9887 0))(
  ( (MissingZero!9887 (index!41919 (_ BitVec 32))) (Found!9887 (index!41920 (_ BitVec 32))) (Intermediate!9887 (undefined!10699 Bool) (index!41921 (_ BitVec 32)) (x!96266 (_ BitVec 32))) (Undefined!9887) (MissingVacant!9887 (index!41922 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68919 (_ BitVec 32)) SeekEntryResult!9887)

(assert (=> b!1074102 (= res!716267 (= (seekEntryOrOpen!0 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9887 #b00000000000000000000000000000000)))))

(assert (=> b!1074102 (=> (not res!716267) (not e!613711))))

(assert (= (and d!129477 (not res!716268)) b!1074099))

(assert (= (and b!1074099 c!107836) b!1074102))

(assert (= (and b!1074099 (not c!107836)) b!1074100))

(assert (= (and b!1074102 res!716267) b!1074101))

(assert (= (or b!1074101 b!1074100) bm!45346))

(assert (=> b!1074099 m!992901))

(assert (=> b!1074099 m!992901))

(assert (=> b!1074099 m!992951))

(declare-fun m!993009 () Bool)

(assert (=> bm!45346 m!993009))

(assert (=> b!1074102 m!992901))

(declare-fun m!993011 () Bool)

(assert (=> b!1074102 m!993011))

(declare-fun m!993013 () Bool)

(assert (=> b!1074102 m!993013))

(assert (=> b!1074102 m!992901))

(declare-fun m!993015 () Bool)

(assert (=> b!1074102 m!993015))

(assert (=> b!1073968 d!129477))

(declare-fun b!1074113 () Bool)

(declare-fun e!613721 () Bool)

(declare-fun call!45352 () Bool)

(assert (=> b!1074113 (= e!613721 call!45352)))

(declare-fun b!1074115 () Bool)

(assert (=> b!1074115 (= e!613721 call!45352)))

(declare-fun b!1074116 () Bool)

(declare-fun e!613722 () Bool)

(declare-fun contains!6334 (List!23144 (_ BitVec 64)) Bool)

(assert (=> b!1074116 (= e!613722 (contains!6334 Nil!23141 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45349 () Bool)

(declare-fun c!107839 () Bool)

(assert (=> bm!45349 (= call!45352 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107839 (Cons!23140 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000) Nil!23141) Nil!23141)))))

(declare-fun b!1074117 () Bool)

(declare-fun e!613724 () Bool)

(declare-fun e!613723 () Bool)

(assert (=> b!1074117 (= e!613724 e!613723)))

(declare-fun res!716275 () Bool)

(assert (=> b!1074117 (=> (not res!716275) (not e!613723))))

(assert (=> b!1074117 (= res!716275 (not e!613722))))

(declare-fun res!716277 () Bool)

(assert (=> b!1074117 (=> (not res!716277) (not e!613722))))

(assert (=> b!1074117 (= res!716277 (validKeyInArray!0 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129479 () Bool)

(declare-fun res!716276 () Bool)

(assert (=> d!129479 (=> res!716276 e!613724)))

(assert (=> d!129479 (= res!716276 (bvsge #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (=> d!129479 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23141) e!613724)))

(declare-fun b!1074114 () Bool)

(assert (=> b!1074114 (= e!613723 e!613721)))

(assert (=> b!1074114 (= c!107839 (validKeyInArray!0 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129479 (not res!716276)) b!1074117))

(assert (= (and b!1074117 res!716277) b!1074116))

(assert (= (and b!1074117 res!716275) b!1074114))

(assert (= (and b!1074114 c!107839) b!1074115))

(assert (= (and b!1074114 (not c!107839)) b!1074113))

(assert (= (or b!1074115 b!1074113) bm!45349))

(assert (=> b!1074116 m!992901))

(assert (=> b!1074116 m!992901))

(declare-fun m!993017 () Bool)

(assert (=> b!1074116 m!993017))

(assert (=> bm!45349 m!992901))

(declare-fun m!993019 () Bool)

(assert (=> bm!45349 m!993019))

(assert (=> b!1074117 m!992901))

(assert (=> b!1074117 m!992901))

(assert (=> b!1074117 m!992951))

(assert (=> b!1074114 m!992901))

(assert (=> b!1074114 m!992901))

(assert (=> b!1074114 m!992951))

(assert (=> b!1073966 d!129479))

(declare-fun d!129481 () Bool)

(assert (=> d!129481 (= (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476446 () Unit!35364)

(declare-fun choose!1749 (array!68919 array!68917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39771 V!39771 V!39771 V!39771 (_ BitVec 32) Int) Unit!35364)

(assert (=> d!129481 (= lt!476446 (choose!1749 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129481 (validMask!0 mask!1515)))

(assert (=> d!129481 (= (lemmaNoChangeToArrayThenSameMapNoExtras!882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476446)))

(declare-fun bs!31657 () Bool)

(assert (= bs!31657 d!129481))

(assert (=> bs!31657 m!992841))

(assert (=> bs!31657 m!992839))

(declare-fun m!993021 () Bool)

(assert (=> bs!31657 m!993021))

(assert (=> bs!31657 m!992859))

(assert (=> b!1073961 d!129481))

(declare-fun b!1074142 () Bool)

(declare-fun e!613743 () Bool)

(declare-fun lt!476466 () ListLongMap!14575)

(assert (=> b!1074142 (= e!613743 (= lt!476466 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074143 () Bool)

(declare-fun e!613740 () ListLongMap!14575)

(declare-fun e!613745 () ListLongMap!14575)

(assert (=> b!1074143 (= e!613740 e!613745)))

(declare-fun c!107850 () Bool)

(assert (=> b!1074143 (= c!107850 (validKeyInArray!0 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45352 () Bool)

(declare-fun call!45355 () ListLongMap!14575)

(assert (=> bm!45352 (= call!45355 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074144 () Bool)

(assert (=> b!1074144 (= e!613740 (ListLongMap!14576 Nil!23140))))

(declare-fun b!1074145 () Bool)

(declare-fun isEmpty!952 (ListLongMap!14575) Bool)

(assert (=> b!1074145 (= e!613743 (isEmpty!952 lt!476466))))

(declare-fun d!129483 () Bool)

(declare-fun e!613741 () Bool)

(assert (=> d!129483 e!613741))

(declare-fun res!716288 () Bool)

(assert (=> d!129483 (=> (not res!716288) (not e!613741))))

(assert (=> d!129483 (= res!716288 (not (contains!6333 lt!476466 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129483 (= lt!476466 e!613740)))

(declare-fun c!107851 () Bool)

(assert (=> d!129483 (= c!107851 (bvsge #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (=> d!129483 (validMask!0 mask!1515)))

(assert (=> d!129483 (= (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476466)))

(declare-fun b!1074146 () Bool)

(assert (=> b!1074146 (= e!613745 call!45355)))

(declare-fun b!1074147 () Bool)

(declare-fun e!613742 () Bool)

(assert (=> b!1074147 (= e!613741 e!613742)))

(declare-fun c!107849 () Bool)

(declare-fun e!613744 () Bool)

(assert (=> b!1074147 (= c!107849 e!613744)))

(declare-fun res!716287 () Bool)

(assert (=> b!1074147 (=> (not res!716287) (not e!613744))))

(assert (=> b!1074147 (= res!716287 (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun b!1074148 () Bool)

(assert (=> b!1074148 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (=> b!1074148 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33686 _values!955)))))

(declare-fun e!613739 () Bool)

(assert (=> b!1074148 (= e!613739 (= (apply!934 lt!476466 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)) (get!17218 (select (arr!33150 _values!955) #b00000000000000000000000000000000) (dynLambda!2041 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1074149 () Bool)

(assert (=> b!1074149 (= e!613744 (validKeyInArray!0 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074149 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074150 () Bool)

(declare-fun lt!476462 () Unit!35364)

(declare-fun lt!476465 () Unit!35364)

(assert (=> b!1074150 (= lt!476462 lt!476465)))

(declare-fun lt!476463 () (_ BitVec 64))

(declare-fun lt!476461 () V!39771)

(declare-fun lt!476464 () ListLongMap!14575)

(declare-fun lt!476467 () (_ BitVec 64))

(assert (=> b!1074150 (not (contains!6333 (+!3214 lt!476464 (tuple2!16607 lt!476463 lt!476461)) lt!476467))))

(declare-fun addStillNotContains!262 (ListLongMap!14575 (_ BitVec 64) V!39771 (_ BitVec 64)) Unit!35364)

(assert (=> b!1074150 (= lt!476465 (addStillNotContains!262 lt!476464 lt!476463 lt!476461 lt!476467))))

(assert (=> b!1074150 (= lt!476467 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074150 (= lt!476461 (get!17218 (select (arr!33150 _values!955) #b00000000000000000000000000000000) (dynLambda!2041 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074150 (= lt!476463 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074150 (= lt!476464 call!45355)))

(assert (=> b!1074150 (= e!613745 (+!3214 call!45355 (tuple2!16607 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000) (get!17218 (select (arr!33150 _values!955) #b00000000000000000000000000000000) (dynLambda!2041 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074151 () Bool)

(declare-fun res!716286 () Bool)

(assert (=> b!1074151 (=> (not res!716286) (not e!613741))))

(assert (=> b!1074151 (= res!716286 (not (contains!6333 lt!476466 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1074152 () Bool)

(assert (=> b!1074152 (= e!613742 e!613739)))

(assert (=> b!1074152 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun res!716289 () Bool)

(assert (=> b!1074152 (= res!716289 (contains!6333 lt!476466 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074152 (=> (not res!716289) (not e!613739))))

(declare-fun b!1074153 () Bool)

(assert (=> b!1074153 (= e!613742 e!613743)))

(declare-fun c!107848 () Bool)

(assert (=> b!1074153 (= c!107848 (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (= (and d!129483 c!107851) b!1074144))

(assert (= (and d!129483 (not c!107851)) b!1074143))

(assert (= (and b!1074143 c!107850) b!1074150))

(assert (= (and b!1074143 (not c!107850)) b!1074146))

(assert (= (or b!1074150 b!1074146) bm!45352))

(assert (= (and d!129483 res!716288) b!1074151))

(assert (= (and b!1074151 res!716286) b!1074147))

(assert (= (and b!1074147 res!716287) b!1074149))

(assert (= (and b!1074147 c!107849) b!1074152))

(assert (= (and b!1074147 (not c!107849)) b!1074153))

(assert (= (and b!1074152 res!716289) b!1074148))

(assert (= (and b!1074153 c!107848) b!1074142))

(assert (= (and b!1074153 (not c!107848)) b!1074145))

(declare-fun b_lambda!16765 () Bool)

(assert (=> (not b_lambda!16765) (not b!1074148)))

(assert (=> b!1074148 t!32488))

(declare-fun b_and!35047 () Bool)

(assert (= b_and!35045 (and (=> t!32488 result!14797) b_and!35047)))

(declare-fun b_lambda!16767 () Bool)

(assert (=> (not b_lambda!16767) (not b!1074150)))

(assert (=> b!1074150 t!32488))

(declare-fun b_and!35049 () Bool)

(assert (= b_and!35047 (and (=> t!32488 result!14797) b_and!35049)))

(assert (=> b!1074149 m!992901))

(assert (=> b!1074149 m!992901))

(assert (=> b!1074149 m!992951))

(declare-fun m!993023 () Bool)

(assert (=> b!1074142 m!993023))

(declare-fun m!993025 () Bool)

(assert (=> d!129483 m!993025))

(assert (=> d!129483 m!992859))

(declare-fun m!993027 () Bool)

(assert (=> b!1074150 m!993027))

(declare-fun m!993029 () Bool)

(assert (=> b!1074150 m!993029))

(assert (=> b!1074150 m!992907))

(assert (=> b!1074150 m!993027))

(declare-fun m!993031 () Bool)

(assert (=> b!1074150 m!993031))

(assert (=> b!1074150 m!992901))

(declare-fun m!993033 () Bool)

(assert (=> b!1074150 m!993033))

(assert (=> b!1074150 m!992911))

(assert (=> b!1074150 m!992911))

(assert (=> b!1074150 m!992907))

(assert (=> b!1074150 m!992913))

(declare-fun m!993035 () Bool)

(assert (=> b!1074145 m!993035))

(assert (=> b!1074152 m!992901))

(assert (=> b!1074152 m!992901))

(declare-fun m!993037 () Bool)

(assert (=> b!1074152 m!993037))

(assert (=> bm!45352 m!993023))

(assert (=> b!1074143 m!992901))

(assert (=> b!1074143 m!992901))

(assert (=> b!1074143 m!992951))

(declare-fun m!993039 () Bool)

(assert (=> b!1074151 m!993039))

(assert (=> b!1074148 m!992907))

(assert (=> b!1074148 m!992901))

(declare-fun m!993041 () Bool)

(assert (=> b!1074148 m!993041))

(assert (=> b!1074148 m!992901))

(assert (=> b!1074148 m!992911))

(assert (=> b!1074148 m!992911))

(assert (=> b!1074148 m!992907))

(assert (=> b!1074148 m!992913))

(assert (=> b!1073961 d!129483))

(declare-fun lt!476473 () ListLongMap!14575)

(declare-fun e!613750 () Bool)

(declare-fun b!1074154 () Bool)

(assert (=> b!1074154 (= e!613750 (= lt!476473 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074155 () Bool)

(declare-fun e!613747 () ListLongMap!14575)

(declare-fun e!613752 () ListLongMap!14575)

(assert (=> b!1074155 (= e!613747 e!613752)))

(declare-fun c!107854 () Bool)

(assert (=> b!1074155 (= c!107854 (validKeyInArray!0 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun call!45356 () ListLongMap!14575)

(declare-fun bm!45353 () Bool)

(assert (=> bm!45353 (= call!45356 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074156 () Bool)

(assert (=> b!1074156 (= e!613747 (ListLongMap!14576 Nil!23140))))

(declare-fun b!1074157 () Bool)

(assert (=> b!1074157 (= e!613750 (isEmpty!952 lt!476473))))

(declare-fun d!129485 () Bool)

(declare-fun e!613748 () Bool)

(assert (=> d!129485 e!613748))

(declare-fun res!716292 () Bool)

(assert (=> d!129485 (=> (not res!716292) (not e!613748))))

(assert (=> d!129485 (= res!716292 (not (contains!6333 lt!476473 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129485 (= lt!476473 e!613747)))

(declare-fun c!107855 () Bool)

(assert (=> d!129485 (= c!107855 (bvsge #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (=> d!129485 (validMask!0 mask!1515)))

(assert (=> d!129485 (= (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476473)))

(declare-fun b!1074158 () Bool)

(assert (=> b!1074158 (= e!613752 call!45356)))

(declare-fun b!1074159 () Bool)

(declare-fun e!613749 () Bool)

(assert (=> b!1074159 (= e!613748 e!613749)))

(declare-fun c!107853 () Bool)

(declare-fun e!613751 () Bool)

(assert (=> b!1074159 (= c!107853 e!613751)))

(declare-fun res!716291 () Bool)

(assert (=> b!1074159 (=> (not res!716291) (not e!613751))))

(assert (=> b!1074159 (= res!716291 (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun b!1074160 () Bool)

(assert (=> b!1074160 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (=> b!1074160 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33686 _values!955)))))

(declare-fun e!613746 () Bool)

(assert (=> b!1074160 (= e!613746 (= (apply!934 lt!476473 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)) (get!17218 (select (arr!33150 _values!955) #b00000000000000000000000000000000) (dynLambda!2041 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1074161 () Bool)

(assert (=> b!1074161 (= e!613751 (validKeyInArray!0 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074161 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074162 () Bool)

(declare-fun lt!476469 () Unit!35364)

(declare-fun lt!476472 () Unit!35364)

(assert (=> b!1074162 (= lt!476469 lt!476472)))

(declare-fun lt!476470 () (_ BitVec 64))

(declare-fun lt!476471 () ListLongMap!14575)

(declare-fun lt!476474 () (_ BitVec 64))

(declare-fun lt!476468 () V!39771)

(assert (=> b!1074162 (not (contains!6333 (+!3214 lt!476471 (tuple2!16607 lt!476470 lt!476468)) lt!476474))))

(assert (=> b!1074162 (= lt!476472 (addStillNotContains!262 lt!476471 lt!476470 lt!476468 lt!476474))))

(assert (=> b!1074162 (= lt!476474 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074162 (= lt!476468 (get!17218 (select (arr!33150 _values!955) #b00000000000000000000000000000000) (dynLambda!2041 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074162 (= lt!476470 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074162 (= lt!476471 call!45356)))

(assert (=> b!1074162 (= e!613752 (+!3214 call!45356 (tuple2!16607 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000) (get!17218 (select (arr!33150 _values!955) #b00000000000000000000000000000000) (dynLambda!2041 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074163 () Bool)

(declare-fun res!716290 () Bool)

(assert (=> b!1074163 (=> (not res!716290) (not e!613748))))

(assert (=> b!1074163 (= res!716290 (not (contains!6333 lt!476473 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1074164 () Bool)

(assert (=> b!1074164 (= e!613749 e!613746)))

(assert (=> b!1074164 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun res!716293 () Bool)

(assert (=> b!1074164 (= res!716293 (contains!6333 lt!476473 (select (arr!33151 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074164 (=> (not res!716293) (not e!613746))))

(declare-fun b!1074165 () Bool)

(assert (=> b!1074165 (= e!613749 e!613750)))

(declare-fun c!107852 () Bool)

(assert (=> b!1074165 (= c!107852 (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (= (and d!129485 c!107855) b!1074156))

(assert (= (and d!129485 (not c!107855)) b!1074155))

(assert (= (and b!1074155 c!107854) b!1074162))

(assert (= (and b!1074155 (not c!107854)) b!1074158))

(assert (= (or b!1074162 b!1074158) bm!45353))

(assert (= (and d!129485 res!716292) b!1074163))

(assert (= (and b!1074163 res!716290) b!1074159))

(assert (= (and b!1074159 res!716291) b!1074161))

(assert (= (and b!1074159 c!107853) b!1074164))

(assert (= (and b!1074159 (not c!107853)) b!1074165))

(assert (= (and b!1074164 res!716293) b!1074160))

(assert (= (and b!1074165 c!107852) b!1074154))

(assert (= (and b!1074165 (not c!107852)) b!1074157))

(declare-fun b_lambda!16769 () Bool)

(assert (=> (not b_lambda!16769) (not b!1074160)))

(assert (=> b!1074160 t!32488))

(declare-fun b_and!35051 () Bool)

(assert (= b_and!35049 (and (=> t!32488 result!14797) b_and!35051)))

(declare-fun b_lambda!16771 () Bool)

(assert (=> (not b_lambda!16771) (not b!1074162)))

(assert (=> b!1074162 t!32488))

(declare-fun b_and!35053 () Bool)

(assert (= b_and!35051 (and (=> t!32488 result!14797) b_and!35053)))

(assert (=> b!1074161 m!992901))

(assert (=> b!1074161 m!992901))

(assert (=> b!1074161 m!992951))

(declare-fun m!993043 () Bool)

(assert (=> b!1074154 m!993043))

(declare-fun m!993045 () Bool)

(assert (=> d!129485 m!993045))

(assert (=> d!129485 m!992859))

(declare-fun m!993047 () Bool)

(assert (=> b!1074162 m!993047))

(declare-fun m!993049 () Bool)

(assert (=> b!1074162 m!993049))

(assert (=> b!1074162 m!992907))

(assert (=> b!1074162 m!993047))

(declare-fun m!993051 () Bool)

(assert (=> b!1074162 m!993051))

(assert (=> b!1074162 m!992901))

(declare-fun m!993053 () Bool)

(assert (=> b!1074162 m!993053))

(assert (=> b!1074162 m!992911))

(assert (=> b!1074162 m!992911))

(assert (=> b!1074162 m!992907))

(assert (=> b!1074162 m!992913))

(declare-fun m!993055 () Bool)

(assert (=> b!1074157 m!993055))

(assert (=> b!1074164 m!992901))

(assert (=> b!1074164 m!992901))

(declare-fun m!993057 () Bool)

(assert (=> b!1074164 m!993057))

(assert (=> bm!45353 m!993043))

(assert (=> b!1074155 m!992901))

(assert (=> b!1074155 m!992901))

(assert (=> b!1074155 m!992951))

(declare-fun m!993059 () Bool)

(assert (=> b!1074163 m!993059))

(assert (=> b!1074160 m!992907))

(assert (=> b!1074160 m!992901))

(declare-fun m!993061 () Bool)

(assert (=> b!1074160 m!993061))

(assert (=> b!1074160 m!992901))

(assert (=> b!1074160 m!992911))

(assert (=> b!1074160 m!992911))

(assert (=> b!1074160 m!992907))

(assert (=> b!1074160 m!992913))

(assert (=> b!1073961 d!129485))

(declare-fun b!1074172 () Bool)

(declare-fun e!613758 () Bool)

(assert (=> b!1074172 (= e!613758 tp_is_empty!25977)))

(declare-fun mapIsEmpty!40690 () Bool)

(declare-fun mapRes!40690 () Bool)

(assert (=> mapIsEmpty!40690 mapRes!40690))

(declare-fun condMapEmpty!40690 () Bool)

(declare-fun mapDefault!40690 () ValueCell!12285)

(assert (=> mapNonEmpty!40684 (= condMapEmpty!40690 (= mapRest!40684 ((as const (Array (_ BitVec 32) ValueCell!12285)) mapDefault!40690)))))

(declare-fun e!613757 () Bool)

(assert (=> mapNonEmpty!40684 (= tp!77971 (and e!613757 mapRes!40690))))

(declare-fun mapNonEmpty!40690 () Bool)

(declare-fun tp!77981 () Bool)

(assert (=> mapNonEmpty!40690 (= mapRes!40690 (and tp!77981 e!613758))))

(declare-fun mapRest!40690 () (Array (_ BitVec 32) ValueCell!12285))

(declare-fun mapKey!40690 () (_ BitVec 32))

(declare-fun mapValue!40690 () ValueCell!12285)

(assert (=> mapNonEmpty!40690 (= mapRest!40684 (store mapRest!40690 mapKey!40690 mapValue!40690))))

(declare-fun b!1074173 () Bool)

(assert (=> b!1074173 (= e!613757 tp_is_empty!25977)))

(assert (= (and mapNonEmpty!40684 condMapEmpty!40690) mapIsEmpty!40690))

(assert (= (and mapNonEmpty!40684 (not condMapEmpty!40690)) mapNonEmpty!40690))

(assert (= (and mapNonEmpty!40690 ((_ is ValueCellFull!12285) mapValue!40690)) b!1074172))

(assert (= (and mapNonEmpty!40684 ((_ is ValueCellFull!12285) mapDefault!40690)) b!1074173))

(declare-fun m!993063 () Bool)

(assert (=> mapNonEmpty!40690 m!993063))

(declare-fun b_lambda!16773 () Bool)

(assert (= b_lambda!16765 (or (and start!94992 b_free!22167) b_lambda!16773)))

(declare-fun b_lambda!16775 () Bool)

(assert (= b_lambda!16761 (or (and start!94992 b_free!22167) b_lambda!16775)))

(declare-fun b_lambda!16777 () Bool)

(assert (= b_lambda!16769 (or (and start!94992 b_free!22167) b_lambda!16777)))

(declare-fun b_lambda!16779 () Bool)

(assert (= b_lambda!16763 (or (and start!94992 b_free!22167) b_lambda!16779)))

(declare-fun b_lambda!16781 () Bool)

(assert (= b_lambda!16771 (or (and start!94992 b_free!22167) b_lambda!16781)))

(declare-fun b_lambda!16783 () Bool)

(assert (= b_lambda!16767 (or (and start!94992 b_free!22167) b_lambda!16783)))

(check-sat (not bm!45330) (not b!1074048) (not b!1074164) (not b!1074102) (not bm!45353) (not d!129473) (not b!1074065) (not bm!45352) (not d!129463) (not d!129461) (not d!129475) (not b!1074154) (not d!129481) (not b!1074116) (not b!1074117) (not bm!45335) (not d!129471) (not b!1074148) (not b!1074155) (not b_lambda!16773) (not b_lambda!16779) (not b!1074143) (not bm!45346) (not bm!45341) (not mapNonEmpty!40690) (not b!1074114) (not b!1074145) (not b_lambda!16777) (not bm!45342) (not b!1074099) (not bm!45333) (not d!129483) (not b!1074070) (not b_lambda!16781) (not b!1074142) (not b!1074002) (not b!1074078) (not b!1074047) (not b_lambda!16775) (not bm!45337) (not d!129485) (not b!1074152) (not b!1074151) (not b_lambda!16783) tp_is_empty!25977 (not b!1074087) (not b!1074088) b_and!35053 (not b!1074055) (not b!1074084) (not b!1074160) (not b!1074052) (not bm!45334) (not b!1074161) (not b_next!22167) (not b!1074061) (not b!1074150) (not b!1074064) (not b!1074063) (not bm!45340) (not b!1074071) (not b!1074149) (not b!1074086) (not b!1074075) (not b!1074162) (not b!1074157) (not b!1074004) (not bm!45349) (not b!1074163))
(check-sat b_and!35053 (not b_next!22167))
