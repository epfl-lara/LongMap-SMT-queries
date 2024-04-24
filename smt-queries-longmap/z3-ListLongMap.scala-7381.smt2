; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94262 () Bool)

(assert start!94262)

(declare-fun b_free!21463 () Bool)

(declare-fun b_next!21463 () Bool)

(assert (=> start!94262 (= b_free!21463 (not b_next!21463))))

(declare-fun tp!75817 () Bool)

(declare-fun b_and!34205 () Bool)

(assert (=> start!94262 (= tp!75817 b_and!34205)))

(declare-fun b!1064811 () Bool)

(declare-fun res!710603 () Bool)

(declare-fun e!606836 () Bool)

(assert (=> b!1064811 (=> (not res!710603) (not e!606836))))

(declare-datatypes ((array!67589 0))(
  ( (array!67590 (arr!32494 (Array (_ BitVec 32) (_ BitVec 64))) (size!33031 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67589)

(declare-datatypes ((List!22625 0))(
  ( (Nil!22622) (Cons!22621 (h!23839 (_ BitVec 64)) (t!31930 List!22625)) )
))
(declare-fun arrayNoDuplicates!0 (array!67589 (_ BitVec 32) List!22625) Bool)

(assert (=> b!1064811 (= res!710603 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22622))))

(declare-fun b!1064812 () Bool)

(declare-fun res!710606 () Bool)

(assert (=> b!1064812 (=> (not res!710606) (not e!606836))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67589 (_ BitVec 32)) Bool)

(assert (=> b!1064812 (= res!710606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064813 () Bool)

(declare-fun e!606838 () Bool)

(assert (=> b!1064813 (= e!606838 (bvsle #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(declare-datatypes ((V!38833 0))(
  ( (V!38834 (val!12687 Int)) )
))
(declare-datatypes ((tuple2!16052 0))(
  ( (tuple2!16053 (_1!8037 (_ BitVec 64)) (_2!8037 V!38833)) )
))
(declare-datatypes ((List!22626 0))(
  ( (Nil!22623) (Cons!22622 (h!23840 tuple2!16052) (t!31931 List!22626)) )
))
(declare-datatypes ((ListLongMap!14029 0))(
  ( (ListLongMap!14030 (toList!7030 List!22626)) )
))
(declare-fun lt!469231 () ListLongMap!14029)

(declare-fun -!589 (ListLongMap!14029 (_ BitVec 64)) ListLongMap!14029)

(assert (=> b!1064813 (= (-!589 lt!469231 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469231)))

(declare-datatypes ((Unit!34861 0))(
  ( (Unit!34862) )
))
(declare-fun lt!469232 () Unit!34861)

(declare-fun removeNotPresentStillSame!40 (ListLongMap!14029 (_ BitVec 64)) Unit!34861)

(assert (=> b!1064813 (= lt!469232 (removeNotPresentStillSame!40 lt!469231 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064814 () Bool)

(declare-fun e!606834 () Bool)

(declare-fun e!606835 () Bool)

(declare-fun mapRes!39586 () Bool)

(assert (=> b!1064814 (= e!606834 (and e!606835 mapRes!39586))))

(declare-fun condMapEmpty!39586 () Bool)

(declare-datatypes ((ValueCell!11933 0))(
  ( (ValueCellFull!11933 (v!15294 V!38833)) (EmptyCell!11933) )
))
(declare-datatypes ((array!67591 0))(
  ( (array!67592 (arr!32495 (Array (_ BitVec 32) ValueCell!11933)) (size!33032 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67591)

(declare-fun mapDefault!39586 () ValueCell!11933)

(assert (=> b!1064814 (= condMapEmpty!39586 (= (arr!32495 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11933)) mapDefault!39586)))))

(declare-fun b!1064815 () Bool)

(declare-fun tp_is_empty!25273 () Bool)

(assert (=> b!1064815 (= e!606835 tp_is_empty!25273)))

(declare-fun b!1064816 () Bool)

(declare-fun res!710605 () Bool)

(assert (=> b!1064816 (=> (not res!710605) (not e!606836))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064816 (= res!710605 (and (= (size!33032 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33031 _keys!1163) (size!33032 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064817 () Bool)

(declare-fun e!606833 () Bool)

(assert (=> b!1064817 (= e!606836 (not e!606833))))

(declare-fun res!710602 () Bool)

(assert (=> b!1064817 (=> res!710602 e!606833)))

(assert (=> b!1064817 (= res!710602 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!469235 () ListLongMap!14029)

(declare-fun lt!469234 () ListLongMap!14029)

(assert (=> b!1064817 (= lt!469235 lt!469234)))

(declare-fun zeroValueBefore!47 () V!38833)

(declare-fun lt!469233 () Unit!34861)

(declare-fun minValue!907 () V!38833)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38833)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!668 (array!67589 array!67591 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38833 V!38833 V!38833 V!38833 (_ BitVec 32) Int) Unit!34861)

(assert (=> b!1064817 (= lt!469233 (lemmaNoChangeToArrayThenSameMapNoExtras!668 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3665 (array!67589 array!67591 (_ BitVec 32) (_ BitVec 32) V!38833 V!38833 (_ BitVec 32) Int) ListLongMap!14029)

(assert (=> b!1064817 (= lt!469234 (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064817 (= lt!469235 (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39586 () Bool)

(assert (=> mapIsEmpty!39586 mapRes!39586))

(declare-fun mapNonEmpty!39586 () Bool)

(declare-fun tp!75818 () Bool)

(declare-fun e!606837 () Bool)

(assert (=> mapNonEmpty!39586 (= mapRes!39586 (and tp!75818 e!606837))))

(declare-fun mapRest!39586 () (Array (_ BitVec 32) ValueCell!11933))

(declare-fun mapValue!39586 () ValueCell!11933)

(declare-fun mapKey!39586 () (_ BitVec 32))

(assert (=> mapNonEmpty!39586 (= (arr!32495 _values!955) (store mapRest!39586 mapKey!39586 mapValue!39586))))

(declare-fun res!710604 () Bool)

(assert (=> start!94262 (=> (not res!710604) (not e!606836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94262 (= res!710604 (validMask!0 mask!1515))))

(assert (=> start!94262 e!606836))

(assert (=> start!94262 true))

(assert (=> start!94262 tp_is_empty!25273))

(declare-fun array_inv!25190 (array!67591) Bool)

(assert (=> start!94262 (and (array_inv!25190 _values!955) e!606834)))

(assert (=> start!94262 tp!75817))

(declare-fun array_inv!25191 (array!67589) Bool)

(assert (=> start!94262 (array_inv!25191 _keys!1163)))

(declare-fun b!1064818 () Bool)

(assert (=> b!1064818 (= e!606833 e!606838)))

(declare-fun res!710607 () Bool)

(assert (=> b!1064818 (=> res!710607 e!606838)))

(declare-fun contains!6280 (ListLongMap!14029 (_ BitVec 64)) Bool)

(assert (=> b!1064818 (= res!710607 (contains!6280 lt!469231 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4005 (array!67589 array!67591 (_ BitVec 32) (_ BitVec 32) V!38833 V!38833 (_ BitVec 32) Int) ListLongMap!14029)

(assert (=> b!1064818 (= lt!469231 (getCurrentListMap!4005 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064819 () Bool)

(assert (=> b!1064819 (= e!606837 tp_is_empty!25273)))

(assert (= (and start!94262 res!710604) b!1064816))

(assert (= (and b!1064816 res!710605) b!1064812))

(assert (= (and b!1064812 res!710606) b!1064811))

(assert (= (and b!1064811 res!710603) b!1064817))

(assert (= (and b!1064817 (not res!710602)) b!1064818))

(assert (= (and b!1064818 (not res!710607)) b!1064813))

(assert (= (and b!1064814 condMapEmpty!39586) mapIsEmpty!39586))

(assert (= (and b!1064814 (not condMapEmpty!39586)) mapNonEmpty!39586))

(get-info :version)

(assert (= (and mapNonEmpty!39586 ((_ is ValueCellFull!11933) mapValue!39586)) b!1064819))

(assert (= (and b!1064814 ((_ is ValueCellFull!11933) mapDefault!39586)) b!1064815))

(assert (= start!94262 b!1064814))

(declare-fun m!983845 () Bool)

(assert (=> mapNonEmpty!39586 m!983845))

(declare-fun m!983847 () Bool)

(assert (=> b!1064817 m!983847))

(declare-fun m!983849 () Bool)

(assert (=> b!1064817 m!983849))

(declare-fun m!983851 () Bool)

(assert (=> b!1064817 m!983851))

(declare-fun m!983853 () Bool)

(assert (=> b!1064811 m!983853))

(declare-fun m!983855 () Bool)

(assert (=> b!1064818 m!983855))

(declare-fun m!983857 () Bool)

(assert (=> b!1064818 m!983857))

(declare-fun m!983859 () Bool)

(assert (=> start!94262 m!983859))

(declare-fun m!983861 () Bool)

(assert (=> start!94262 m!983861))

(declare-fun m!983863 () Bool)

(assert (=> start!94262 m!983863))

(declare-fun m!983865 () Bool)

(assert (=> b!1064812 m!983865))

(declare-fun m!983867 () Bool)

(assert (=> b!1064813 m!983867))

(declare-fun m!983869 () Bool)

(assert (=> b!1064813 m!983869))

(check-sat (not start!94262) (not b!1064818) b_and!34205 (not b!1064817) (not b!1064813) (not mapNonEmpty!39586) (not b!1064811) (not b!1064812) tp_is_empty!25273 (not b_next!21463))
(check-sat b_and!34205 (not b_next!21463))
(get-model)

(declare-fun d!129369 () Bool)

(declare-fun lt!469268 () ListLongMap!14029)

(assert (=> d!129369 (not (contains!6280 lt!469268 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!67 (List!22626 (_ BitVec 64)) List!22626)

(assert (=> d!129369 (= lt!469268 (ListLongMap!14030 (removeStrictlySorted!67 (toList!7030 lt!469231) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129369 (= (-!589 lt!469231 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469268)))

(declare-fun bs!31291 () Bool)

(assert (= bs!31291 d!129369))

(declare-fun m!983923 () Bool)

(assert (=> bs!31291 m!983923))

(declare-fun m!983925 () Bool)

(assert (=> bs!31291 m!983925))

(assert (=> b!1064813 d!129369))

(declare-fun d!129371 () Bool)

(assert (=> d!129371 (= (-!589 lt!469231 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469231)))

(declare-fun lt!469271 () Unit!34861)

(declare-fun choose!1730 (ListLongMap!14029 (_ BitVec 64)) Unit!34861)

(assert (=> d!129371 (= lt!469271 (choose!1730 lt!469231 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129371 (not (contains!6280 lt!469231 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129371 (= (removeNotPresentStillSame!40 lt!469231 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469271)))

(declare-fun bs!31292 () Bool)

(assert (= bs!31292 d!129371))

(assert (=> bs!31292 m!983867))

(declare-fun m!983927 () Bool)

(assert (=> bs!31292 m!983927))

(assert (=> bs!31292 m!983855))

(assert (=> b!1064813 d!129371))

(declare-fun d!129373 () Bool)

(assert (=> d!129373 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94262 d!129373))

(declare-fun d!129375 () Bool)

(assert (=> d!129375 (= (array_inv!25190 _values!955) (bvsge (size!33032 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94262 d!129375))

(declare-fun d!129377 () Bool)

(assert (=> d!129377 (= (array_inv!25191 _keys!1163) (bvsge (size!33031 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94262 d!129377))

(declare-fun d!129379 () Bool)

(declare-fun e!606887 () Bool)

(assert (=> d!129379 e!606887))

(declare-fun res!710646 () Bool)

(assert (=> d!129379 (=> res!710646 e!606887)))

(declare-fun lt!469281 () Bool)

(assert (=> d!129379 (= res!710646 (not lt!469281))))

(declare-fun lt!469280 () Bool)

(assert (=> d!129379 (= lt!469281 lt!469280)))

(declare-fun lt!469283 () Unit!34861)

(declare-fun e!606886 () Unit!34861)

(assert (=> d!129379 (= lt!469283 e!606886)))

(declare-fun c!107695 () Bool)

(assert (=> d!129379 (= c!107695 lt!469280)))

(declare-fun containsKey!575 (List!22626 (_ BitVec 64)) Bool)

(assert (=> d!129379 (= lt!469280 (containsKey!575 (toList!7030 lt!469231) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129379 (= (contains!6280 lt!469231 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469281)))

(declare-fun b!1064880 () Bool)

(declare-fun lt!469282 () Unit!34861)

(assert (=> b!1064880 (= e!606886 lt!469282)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!406 (List!22626 (_ BitVec 64)) Unit!34861)

(assert (=> b!1064880 (= lt!469282 (lemmaContainsKeyImpliesGetValueByKeyDefined!406 (toList!7030 lt!469231) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!645 0))(
  ( (Some!644 (v!15297 V!38833)) (None!643) )
))
(declare-fun isDefined!444 (Option!645) Bool)

(declare-fun getValueByKey!594 (List!22626 (_ BitVec 64)) Option!645)

(assert (=> b!1064880 (isDefined!444 (getValueByKey!594 (toList!7030 lt!469231) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064881 () Bool)

(declare-fun Unit!34867 () Unit!34861)

(assert (=> b!1064881 (= e!606886 Unit!34867)))

(declare-fun b!1064882 () Bool)

(assert (=> b!1064882 (= e!606887 (isDefined!444 (getValueByKey!594 (toList!7030 lt!469231) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129379 c!107695) b!1064880))

(assert (= (and d!129379 (not c!107695)) b!1064881))

(assert (= (and d!129379 (not res!710646)) b!1064882))

(declare-fun m!983929 () Bool)

(assert (=> d!129379 m!983929))

(declare-fun m!983931 () Bool)

(assert (=> b!1064880 m!983931))

(declare-fun m!983933 () Bool)

(assert (=> b!1064880 m!983933))

(assert (=> b!1064880 m!983933))

(declare-fun m!983935 () Bool)

(assert (=> b!1064880 m!983935))

(assert (=> b!1064882 m!983933))

(assert (=> b!1064882 m!983933))

(assert (=> b!1064882 m!983935))

(assert (=> b!1064818 d!129379))

(declare-fun call!45028 () ListLongMap!14029)

(declare-fun bm!45019 () Bool)

(assert (=> bm!45019 (= call!45028 (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064925 () Bool)

(declare-fun e!606926 () Bool)

(declare-fun lt!469335 () ListLongMap!14029)

(declare-fun apply!929 (ListLongMap!14029 (_ BitVec 64)) V!38833)

(assert (=> b!1064925 (= e!606926 (= (apply!929 lt!469335 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1064926 () Bool)

(declare-fun e!606924 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1064926 (= e!606924 (validKeyInArray!0 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064927 () Bool)

(declare-fun e!606918 () ListLongMap!14029)

(declare-fun call!45026 () ListLongMap!14029)

(assert (=> b!1064927 (= e!606918 call!45026)))

(declare-fun b!1064928 () Bool)

(declare-fun e!606919 () ListLongMap!14029)

(declare-fun call!45022 () ListLongMap!14029)

(assert (=> b!1064928 (= e!606919 call!45022)))

(declare-fun b!1064929 () Bool)

(declare-fun e!606915 () Bool)

(declare-fun e!606925 () Bool)

(assert (=> b!1064929 (= e!606915 e!606925)))

(declare-fun res!710673 () Bool)

(assert (=> b!1064929 (=> (not res!710673) (not e!606925))))

(assert (=> b!1064929 (= res!710673 (contains!6280 lt!469335 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064929 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(declare-fun b!1064930 () Bool)

(assert (=> b!1064930 (= e!606918 call!45022)))

(declare-fun b!1064931 () Bool)

(declare-fun e!606920 () Bool)

(declare-fun e!606914 () Bool)

(assert (=> b!1064931 (= e!606920 e!606914)))

(declare-fun c!107710 () Bool)

(assert (=> b!1064931 (= c!107710 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1064932 () Bool)

(declare-fun res!710666 () Bool)

(assert (=> b!1064932 (=> (not res!710666) (not e!606920))))

(assert (=> b!1064932 (= res!710666 e!606915)))

(declare-fun res!710670 () Bool)

(assert (=> b!1064932 (=> res!710670 e!606915)))

(declare-fun e!606921 () Bool)

(assert (=> b!1064932 (= res!710670 (not e!606921))))

(declare-fun res!710671 () Bool)

(assert (=> b!1064932 (=> (not res!710671) (not e!606921))))

(assert (=> b!1064932 (= res!710671 (bvslt #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(declare-fun b!1064933 () Bool)

(declare-fun e!606922 () Unit!34861)

(declare-fun lt!469341 () Unit!34861)

(assert (=> b!1064933 (= e!606922 lt!469341)))

(declare-fun lt!469349 () ListLongMap!14029)

(assert (=> b!1064933 (= lt!469349 (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469337 () (_ BitVec 64))

(assert (=> b!1064933 (= lt!469337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!469348 () (_ BitVec 64))

(assert (=> b!1064933 (= lt!469348 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!469334 () Unit!34861)

(declare-fun addStillContains!637 (ListLongMap!14029 (_ BitVec 64) V!38833 (_ BitVec 64)) Unit!34861)

(assert (=> b!1064933 (= lt!469334 (addStillContains!637 lt!469349 lt!469337 zeroValueBefore!47 lt!469348))))

(declare-fun +!3140 (ListLongMap!14029 tuple2!16052) ListLongMap!14029)

(assert (=> b!1064933 (contains!6280 (+!3140 lt!469349 (tuple2!16053 lt!469337 zeroValueBefore!47)) lt!469348)))

(declare-fun lt!469340 () Unit!34861)

(assert (=> b!1064933 (= lt!469340 lt!469334)))

(declare-fun lt!469333 () ListLongMap!14029)

(assert (=> b!1064933 (= lt!469333 (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469336 () (_ BitVec 64))

(assert (=> b!1064933 (= lt!469336 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!469347 () (_ BitVec 64))

(assert (=> b!1064933 (= lt!469347 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!469330 () Unit!34861)

(declare-fun addApplyDifferent!493 (ListLongMap!14029 (_ BitVec 64) V!38833 (_ BitVec 64)) Unit!34861)

(assert (=> b!1064933 (= lt!469330 (addApplyDifferent!493 lt!469333 lt!469336 minValue!907 lt!469347))))

(assert (=> b!1064933 (= (apply!929 (+!3140 lt!469333 (tuple2!16053 lt!469336 minValue!907)) lt!469347) (apply!929 lt!469333 lt!469347))))

(declare-fun lt!469331 () Unit!34861)

(assert (=> b!1064933 (= lt!469331 lt!469330)))

(declare-fun lt!469338 () ListLongMap!14029)

(assert (=> b!1064933 (= lt!469338 (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469346 () (_ BitVec 64))

(assert (=> b!1064933 (= lt!469346 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!469328 () (_ BitVec 64))

(assert (=> b!1064933 (= lt!469328 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!469342 () Unit!34861)

(assert (=> b!1064933 (= lt!469342 (addApplyDifferent!493 lt!469338 lt!469346 zeroValueBefore!47 lt!469328))))

(assert (=> b!1064933 (= (apply!929 (+!3140 lt!469338 (tuple2!16053 lt!469346 zeroValueBefore!47)) lt!469328) (apply!929 lt!469338 lt!469328))))

(declare-fun lt!469344 () Unit!34861)

(assert (=> b!1064933 (= lt!469344 lt!469342)))

(declare-fun lt!469339 () ListLongMap!14029)

(assert (=> b!1064933 (= lt!469339 (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469343 () (_ BitVec 64))

(assert (=> b!1064933 (= lt!469343 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!469345 () (_ BitVec 64))

(assert (=> b!1064933 (= lt!469345 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1064933 (= lt!469341 (addApplyDifferent!493 lt!469339 lt!469343 minValue!907 lt!469345))))

(assert (=> b!1064933 (= (apply!929 (+!3140 lt!469339 (tuple2!16053 lt!469343 minValue!907)) lt!469345) (apply!929 lt!469339 lt!469345))))

(declare-fun bm!45021 () Bool)

(declare-fun call!45025 () ListLongMap!14029)

(assert (=> bm!45021 (= call!45025 call!45028)))

(declare-fun bm!45022 () Bool)

(declare-fun call!45024 () Bool)

(assert (=> bm!45022 (= call!45024 (contains!6280 lt!469335 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064934 () Bool)

(declare-fun e!606916 () ListLongMap!14029)

(assert (=> b!1064934 (= e!606916 e!606919)))

(declare-fun c!107708 () Bool)

(assert (=> b!1064934 (= c!107708 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1064935 () Bool)

(declare-fun e!606923 () Bool)

(assert (=> b!1064935 (= e!606923 (= (apply!929 lt!469335 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun d!129381 () Bool)

(assert (=> d!129381 e!606920))

(declare-fun res!710668 () Bool)

(assert (=> d!129381 (=> (not res!710668) (not e!606920))))

(assert (=> d!129381 (= res!710668 (or (bvsge #b00000000000000000000000000000000 (size!33031 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33031 _keys!1163)))))))

(declare-fun lt!469329 () ListLongMap!14029)

(assert (=> d!129381 (= lt!469335 lt!469329)))

(declare-fun lt!469332 () Unit!34861)

(assert (=> d!129381 (= lt!469332 e!606922)))

(declare-fun c!107711 () Bool)

(assert (=> d!129381 (= c!107711 e!606924)))

(declare-fun res!710669 () Bool)

(assert (=> d!129381 (=> (not res!710669) (not e!606924))))

(assert (=> d!129381 (= res!710669 (bvslt #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(assert (=> d!129381 (= lt!469329 e!606916)))

(declare-fun c!107712 () Bool)

(assert (=> d!129381 (= c!107712 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129381 (validMask!0 mask!1515)))

(assert (=> d!129381 (= (getCurrentListMap!4005 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469335)))

(declare-fun bm!45020 () Bool)

(assert (=> bm!45020 (= call!45026 call!45025)))

(declare-fun b!1064936 () Bool)

(declare-fun e!606917 () Bool)

(assert (=> b!1064936 (= e!606917 e!606923)))

(declare-fun res!710665 () Bool)

(declare-fun call!45023 () Bool)

(assert (=> b!1064936 (= res!710665 call!45023)))

(assert (=> b!1064936 (=> (not res!710665) (not e!606923))))

(declare-fun b!1064937 () Bool)

(assert (=> b!1064937 (= e!606914 e!606926)))

(declare-fun res!710667 () Bool)

(assert (=> b!1064937 (= res!710667 call!45024)))

(assert (=> b!1064937 (=> (not res!710667) (not e!606926))))

(declare-fun bm!45023 () Bool)

(assert (=> bm!45023 (= call!45023 (contains!6280 lt!469335 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064938 () Bool)

(assert (=> b!1064938 (= e!606917 (not call!45023))))

(declare-fun b!1064939 () Bool)

(declare-fun get!16999 (ValueCell!11933 V!38833) V!38833)

(declare-fun dynLambda!2044 (Int (_ BitVec 64)) V!38833)

(assert (=> b!1064939 (= e!606925 (= (apply!929 lt!469335 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)) (get!16999 (select (arr!32495 _values!955) #b00000000000000000000000000000000) (dynLambda!2044 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1064939 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33032 _values!955)))))

(assert (=> b!1064939 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(declare-fun call!45027 () ListLongMap!14029)

(declare-fun bm!45024 () Bool)

(assert (=> bm!45024 (= call!45027 (+!3140 (ite c!107712 call!45028 (ite c!107708 call!45025 call!45026)) (ite (or c!107712 c!107708) (tuple2!16053 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16053 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45025 () Bool)

(assert (=> bm!45025 (= call!45022 call!45027)))

(declare-fun b!1064940 () Bool)

(assert (=> b!1064940 (= e!606921 (validKeyInArray!0 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064941 () Bool)

(declare-fun res!710672 () Bool)

(assert (=> b!1064941 (=> (not res!710672) (not e!606920))))

(assert (=> b!1064941 (= res!710672 e!606917)))

(declare-fun c!107713 () Bool)

(assert (=> b!1064941 (= c!107713 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064942 () Bool)

(assert (=> b!1064942 (= e!606916 (+!3140 call!45027 (tuple2!16053 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1064943 () Bool)

(declare-fun c!107709 () Bool)

(assert (=> b!1064943 (= c!107709 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1064943 (= e!606919 e!606918)))

(declare-fun b!1064944 () Bool)

(declare-fun Unit!34868 () Unit!34861)

(assert (=> b!1064944 (= e!606922 Unit!34868)))

(declare-fun b!1064945 () Bool)

(assert (=> b!1064945 (= e!606914 (not call!45024))))

(assert (= (and d!129381 c!107712) b!1064942))

(assert (= (and d!129381 (not c!107712)) b!1064934))

(assert (= (and b!1064934 c!107708) b!1064928))

(assert (= (and b!1064934 (not c!107708)) b!1064943))

(assert (= (and b!1064943 c!107709) b!1064930))

(assert (= (and b!1064943 (not c!107709)) b!1064927))

(assert (= (or b!1064930 b!1064927) bm!45020))

(assert (= (or b!1064928 bm!45020) bm!45021))

(assert (= (or b!1064928 b!1064930) bm!45025))

(assert (= (or b!1064942 bm!45021) bm!45019))

(assert (= (or b!1064942 bm!45025) bm!45024))

(assert (= (and d!129381 res!710669) b!1064926))

(assert (= (and d!129381 c!107711) b!1064933))

(assert (= (and d!129381 (not c!107711)) b!1064944))

(assert (= (and d!129381 res!710668) b!1064932))

(assert (= (and b!1064932 res!710671) b!1064940))

(assert (= (and b!1064932 (not res!710670)) b!1064929))

(assert (= (and b!1064929 res!710673) b!1064939))

(assert (= (and b!1064932 res!710666) b!1064941))

(assert (= (and b!1064941 c!107713) b!1064936))

(assert (= (and b!1064941 (not c!107713)) b!1064938))

(assert (= (and b!1064936 res!710665) b!1064935))

(assert (= (or b!1064936 b!1064938) bm!45023))

(assert (= (and b!1064941 res!710672) b!1064931))

(assert (= (and b!1064931 c!107710) b!1064937))

(assert (= (and b!1064931 (not c!107710)) b!1064945))

(assert (= (and b!1064937 res!710667) b!1064925))

(assert (= (or b!1064937 b!1064945) bm!45022))

(declare-fun b_lambda!16491 () Bool)

(assert (=> (not b_lambda!16491) (not b!1064939)))

(declare-fun t!31936 () Bool)

(declare-fun tb!7127 () Bool)

(assert (=> (and start!94262 (= defaultEntry!963 defaultEntry!963) t!31936) tb!7127))

(declare-fun result!14705 () Bool)

(assert (=> tb!7127 (= result!14705 tp_is_empty!25273)))

(assert (=> b!1064939 t!31936))

(declare-fun b_and!34211 () Bool)

(assert (= b_and!34205 (and (=> t!31936 result!14705) b_and!34211)))

(declare-fun m!983937 () Bool)

(assert (=> b!1064940 m!983937))

(assert (=> b!1064940 m!983937))

(declare-fun m!983939 () Bool)

(assert (=> b!1064940 m!983939))

(declare-fun m!983941 () Bool)

(assert (=> b!1064933 m!983941))

(declare-fun m!983943 () Bool)

(assert (=> b!1064933 m!983943))

(declare-fun m!983945 () Bool)

(assert (=> b!1064933 m!983945))

(declare-fun m!983947 () Bool)

(assert (=> b!1064933 m!983947))

(declare-fun m!983949 () Bool)

(assert (=> b!1064933 m!983949))

(assert (=> b!1064933 m!983851))

(declare-fun m!983951 () Bool)

(assert (=> b!1064933 m!983951))

(declare-fun m!983953 () Bool)

(assert (=> b!1064933 m!983953))

(declare-fun m!983955 () Bool)

(assert (=> b!1064933 m!983955))

(assert (=> b!1064933 m!983943))

(declare-fun m!983957 () Bool)

(assert (=> b!1064933 m!983957))

(declare-fun m!983959 () Bool)

(assert (=> b!1064933 m!983959))

(declare-fun m!983961 () Bool)

(assert (=> b!1064933 m!983961))

(declare-fun m!983963 () Bool)

(assert (=> b!1064933 m!983963))

(declare-fun m!983965 () Bool)

(assert (=> b!1064933 m!983965))

(assert (=> b!1064933 m!983937))

(assert (=> b!1064933 m!983961))

(declare-fun m!983967 () Bool)

(assert (=> b!1064933 m!983967))

(assert (=> b!1064933 m!983945))

(assert (=> b!1064933 m!983941))

(declare-fun m!983969 () Bool)

(assert (=> b!1064933 m!983969))

(declare-fun m!983971 () Bool)

(assert (=> bm!45024 m!983971))

(assert (=> b!1064926 m!983937))

(assert (=> b!1064926 m!983937))

(assert (=> b!1064926 m!983939))

(assert (=> d!129381 m!983859))

(declare-fun m!983973 () Bool)

(assert (=> bm!45023 m!983973))

(declare-fun m!983975 () Bool)

(assert (=> b!1064935 m!983975))

(declare-fun m!983977 () Bool)

(assert (=> b!1064942 m!983977))

(declare-fun m!983979 () Bool)

(assert (=> b!1064925 m!983979))

(assert (=> bm!45019 m!983851))

(assert (=> b!1064929 m!983937))

(assert (=> b!1064929 m!983937))

(declare-fun m!983981 () Bool)

(assert (=> b!1064929 m!983981))

(declare-fun m!983983 () Bool)

(assert (=> b!1064939 m!983983))

(declare-fun m!983985 () Bool)

(assert (=> b!1064939 m!983985))

(assert (=> b!1064939 m!983937))

(declare-fun m!983987 () Bool)

(assert (=> b!1064939 m!983987))

(assert (=> b!1064939 m!983937))

(assert (=> b!1064939 m!983985))

(assert (=> b!1064939 m!983983))

(declare-fun m!983989 () Bool)

(assert (=> b!1064939 m!983989))

(declare-fun m!983991 () Bool)

(assert (=> bm!45022 m!983991))

(assert (=> b!1064818 d!129381))

(declare-fun b!1064958 () Bool)

(declare-fun e!606935 () Bool)

(declare-fun e!606937 () Bool)

(assert (=> b!1064958 (= e!606935 e!606937)))

(declare-fun c!107716 () Bool)

(assert (=> b!1064958 (= c!107716 (validKeyInArray!0 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064959 () Bool)

(declare-fun call!45031 () Bool)

(assert (=> b!1064959 (= e!606937 call!45031)))

(declare-fun bm!45028 () Bool)

(assert (=> bm!45028 (= call!45031 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107716 (Cons!22621 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000) Nil!22622) Nil!22622)))))

(declare-fun b!1064961 () Bool)

(declare-fun e!606938 () Bool)

(declare-fun contains!6282 (List!22625 (_ BitVec 64)) Bool)

(assert (=> b!1064961 (= e!606938 (contains!6282 Nil!22622 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064962 () Bool)

(assert (=> b!1064962 (= e!606937 call!45031)))

(declare-fun d!129383 () Bool)

(declare-fun res!710680 () Bool)

(declare-fun e!606936 () Bool)

(assert (=> d!129383 (=> res!710680 e!606936)))

(assert (=> d!129383 (= res!710680 (bvsge #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(assert (=> d!129383 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22622) e!606936)))

(declare-fun b!1064960 () Bool)

(assert (=> b!1064960 (= e!606936 e!606935)))

(declare-fun res!710682 () Bool)

(assert (=> b!1064960 (=> (not res!710682) (not e!606935))))

(assert (=> b!1064960 (= res!710682 (not e!606938))))

(declare-fun res!710681 () Bool)

(assert (=> b!1064960 (=> (not res!710681) (not e!606938))))

(assert (=> b!1064960 (= res!710681 (validKeyInArray!0 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129383 (not res!710680)) b!1064960))

(assert (= (and b!1064960 res!710681) b!1064961))

(assert (= (and b!1064960 res!710682) b!1064958))

(assert (= (and b!1064958 c!107716) b!1064959))

(assert (= (and b!1064958 (not c!107716)) b!1064962))

(assert (= (or b!1064959 b!1064962) bm!45028))

(assert (=> b!1064958 m!983937))

(assert (=> b!1064958 m!983937))

(assert (=> b!1064958 m!983939))

(assert (=> bm!45028 m!983937))

(declare-fun m!983993 () Bool)

(assert (=> bm!45028 m!983993))

(assert (=> b!1064961 m!983937))

(assert (=> b!1064961 m!983937))

(declare-fun m!983995 () Bool)

(assert (=> b!1064961 m!983995))

(assert (=> b!1064960 m!983937))

(assert (=> b!1064960 m!983937))

(assert (=> b!1064960 m!983939))

(assert (=> b!1064811 d!129383))

(declare-fun d!129385 () Bool)

(assert (=> d!129385 (= (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469352 () Unit!34861)

(declare-fun choose!1731 (array!67589 array!67591 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38833 V!38833 V!38833 V!38833 (_ BitVec 32) Int) Unit!34861)

(assert (=> d!129385 (= lt!469352 (choose!1731 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129385 (validMask!0 mask!1515)))

(assert (=> d!129385 (= (lemmaNoChangeToArrayThenSameMapNoExtras!668 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469352)))

(declare-fun bs!31293 () Bool)

(assert (= bs!31293 d!129385))

(assert (=> bs!31293 m!983851))

(assert (=> bs!31293 m!983849))

(declare-fun m!983997 () Bool)

(assert (=> bs!31293 m!983997))

(assert (=> bs!31293 m!983859))

(assert (=> b!1064817 d!129385))

(declare-fun b!1064987 () Bool)

(declare-fun e!606956 () Bool)

(declare-fun e!606959 () Bool)

(assert (=> b!1064987 (= e!606956 e!606959)))

(declare-fun c!107728 () Bool)

(declare-fun e!606955 () Bool)

(assert (=> b!1064987 (= c!107728 e!606955)))

(declare-fun res!710694 () Bool)

(assert (=> b!1064987 (=> (not res!710694) (not e!606955))))

(assert (=> b!1064987 (= res!710694 (bvslt #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(declare-fun b!1064988 () Bool)

(declare-fun e!606953 () Bool)

(declare-fun lt!469371 () ListLongMap!14029)

(assert (=> b!1064988 (= e!606953 (= lt!469371 (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1064989 () Bool)

(declare-fun e!606958 () ListLongMap!14029)

(assert (=> b!1064989 (= e!606958 (ListLongMap!14030 Nil!22623))))

(declare-fun d!129387 () Bool)

(assert (=> d!129387 e!606956))

(declare-fun res!710691 () Bool)

(assert (=> d!129387 (=> (not res!710691) (not e!606956))))

(assert (=> d!129387 (= res!710691 (not (contains!6280 lt!469371 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129387 (= lt!469371 e!606958)))

(declare-fun c!107726 () Bool)

(assert (=> d!129387 (= c!107726 (bvsge #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(assert (=> d!129387 (validMask!0 mask!1515)))

(assert (=> d!129387 (= (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469371)))

(declare-fun b!1064990 () Bool)

(assert (=> b!1064990 (= e!606955 (validKeyInArray!0 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064990 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1064991 () Bool)

(declare-fun res!710693 () Bool)

(assert (=> b!1064991 (=> (not res!710693) (not e!606956))))

(assert (=> b!1064991 (= res!710693 (not (contains!6280 lt!469371 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1064992 () Bool)

(declare-fun e!606954 () ListLongMap!14029)

(declare-fun call!45034 () ListLongMap!14029)

(assert (=> b!1064992 (= e!606954 call!45034)))

(declare-fun b!1064993 () Bool)

(declare-fun isEmpty!942 (ListLongMap!14029) Bool)

(assert (=> b!1064993 (= e!606953 (isEmpty!942 lt!469371))))

(declare-fun b!1064994 () Bool)

(declare-fun lt!469367 () Unit!34861)

(declare-fun lt!469368 () Unit!34861)

(assert (=> b!1064994 (= lt!469367 lt!469368)))

(declare-fun lt!469372 () (_ BitVec 64))

(declare-fun lt!469373 () (_ BitVec 64))

(declare-fun lt!469369 () ListLongMap!14029)

(declare-fun lt!469370 () V!38833)

(assert (=> b!1064994 (not (contains!6280 (+!3140 lt!469369 (tuple2!16053 lt!469373 lt!469370)) lt!469372))))

(declare-fun addStillNotContains!250 (ListLongMap!14029 (_ BitVec 64) V!38833 (_ BitVec 64)) Unit!34861)

(assert (=> b!1064994 (= lt!469368 (addStillNotContains!250 lt!469369 lt!469373 lt!469370 lt!469372))))

(assert (=> b!1064994 (= lt!469372 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1064994 (= lt!469370 (get!16999 (select (arr!32495 _values!955) #b00000000000000000000000000000000) (dynLambda!2044 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1064994 (= lt!469373 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1064994 (= lt!469369 call!45034)))

(assert (=> b!1064994 (= e!606954 (+!3140 call!45034 (tuple2!16053 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000) (get!16999 (select (arr!32495 _values!955) #b00000000000000000000000000000000) (dynLambda!2044 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1064995 () Bool)

(declare-fun e!606957 () Bool)

(assert (=> b!1064995 (= e!606959 e!606957)))

(assert (=> b!1064995 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(declare-fun res!710692 () Bool)

(assert (=> b!1064995 (= res!710692 (contains!6280 lt!469371 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064995 (=> (not res!710692) (not e!606957))))

(declare-fun bm!45031 () Bool)

(assert (=> bm!45031 (= call!45034 (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1064996 () Bool)

(assert (=> b!1064996 (= e!606958 e!606954)))

(declare-fun c!107725 () Bool)

(assert (=> b!1064996 (= c!107725 (validKeyInArray!0 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064997 () Bool)

(assert (=> b!1064997 (= e!606959 e!606953)))

(declare-fun c!107727 () Bool)

(assert (=> b!1064997 (= c!107727 (bvslt #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(declare-fun b!1064998 () Bool)

(assert (=> b!1064998 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(assert (=> b!1064998 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33032 _values!955)))))

(assert (=> b!1064998 (= e!606957 (= (apply!929 lt!469371 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)) (get!16999 (select (arr!32495 _values!955) #b00000000000000000000000000000000) (dynLambda!2044 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!129387 c!107726) b!1064989))

(assert (= (and d!129387 (not c!107726)) b!1064996))

(assert (= (and b!1064996 c!107725) b!1064994))

(assert (= (and b!1064996 (not c!107725)) b!1064992))

(assert (= (or b!1064994 b!1064992) bm!45031))

(assert (= (and d!129387 res!710691) b!1064991))

(assert (= (and b!1064991 res!710693) b!1064987))

(assert (= (and b!1064987 res!710694) b!1064990))

(assert (= (and b!1064987 c!107728) b!1064995))

(assert (= (and b!1064987 (not c!107728)) b!1064997))

(assert (= (and b!1064995 res!710692) b!1064998))

(assert (= (and b!1064997 c!107727) b!1064988))

(assert (= (and b!1064997 (not c!107727)) b!1064993))

(declare-fun b_lambda!16493 () Bool)

(assert (=> (not b_lambda!16493) (not b!1064994)))

(assert (=> b!1064994 t!31936))

(declare-fun b_and!34213 () Bool)

(assert (= b_and!34211 (and (=> t!31936 result!14705) b_and!34213)))

(declare-fun b_lambda!16495 () Bool)

(assert (=> (not b_lambda!16495) (not b!1064998)))

(assert (=> b!1064998 t!31936))

(declare-fun b_and!34215 () Bool)

(assert (= b_and!34213 (and (=> t!31936 result!14705) b_and!34215)))

(assert (=> b!1064996 m!983937))

(assert (=> b!1064996 m!983937))

(assert (=> b!1064996 m!983939))

(declare-fun m!983999 () Bool)

(assert (=> b!1064988 m!983999))

(assert (=> bm!45031 m!983999))

(declare-fun m!984001 () Bool)

(assert (=> b!1064994 m!984001))

(assert (=> b!1064994 m!983985))

(assert (=> b!1064994 m!983983))

(assert (=> b!1064994 m!983989))

(assert (=> b!1064994 m!983937))

(assert (=> b!1064994 m!983985))

(declare-fun m!984003 () Bool)

(assert (=> b!1064994 m!984003))

(declare-fun m!984005 () Bool)

(assert (=> b!1064994 m!984005))

(declare-fun m!984007 () Bool)

(assert (=> b!1064994 m!984007))

(assert (=> b!1064994 m!984005))

(assert (=> b!1064994 m!983983))

(assert (=> b!1064995 m!983937))

(assert (=> b!1064995 m!983937))

(declare-fun m!984009 () Bool)

(assert (=> b!1064995 m!984009))

(assert (=> b!1064998 m!983985))

(assert (=> b!1064998 m!983983))

(assert (=> b!1064998 m!983989))

(assert (=> b!1064998 m!983983))

(assert (=> b!1064998 m!983937))

(assert (=> b!1064998 m!983937))

(declare-fun m!984011 () Bool)

(assert (=> b!1064998 m!984011))

(assert (=> b!1064998 m!983985))

(declare-fun m!984013 () Bool)

(assert (=> b!1064993 m!984013))

(declare-fun m!984015 () Bool)

(assert (=> b!1064991 m!984015))

(assert (=> b!1064990 m!983937))

(assert (=> b!1064990 m!983937))

(assert (=> b!1064990 m!983939))

(declare-fun m!984017 () Bool)

(assert (=> d!129387 m!984017))

(assert (=> d!129387 m!983859))

(assert (=> b!1064817 d!129387))

(declare-fun b!1064999 () Bool)

(declare-fun e!606963 () Bool)

(declare-fun e!606966 () Bool)

(assert (=> b!1064999 (= e!606963 e!606966)))

(declare-fun c!107732 () Bool)

(declare-fun e!606962 () Bool)

(assert (=> b!1064999 (= c!107732 e!606962)))

(declare-fun res!710698 () Bool)

(assert (=> b!1064999 (=> (not res!710698) (not e!606962))))

(assert (=> b!1064999 (= res!710698 (bvslt #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(declare-fun b!1065000 () Bool)

(declare-fun e!606960 () Bool)

(declare-fun lt!469378 () ListLongMap!14029)

(assert (=> b!1065000 (= e!606960 (= lt!469378 (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1065001 () Bool)

(declare-fun e!606965 () ListLongMap!14029)

(assert (=> b!1065001 (= e!606965 (ListLongMap!14030 Nil!22623))))

(declare-fun d!129389 () Bool)

(assert (=> d!129389 e!606963))

(declare-fun res!710695 () Bool)

(assert (=> d!129389 (=> (not res!710695) (not e!606963))))

(assert (=> d!129389 (= res!710695 (not (contains!6280 lt!469378 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129389 (= lt!469378 e!606965)))

(declare-fun c!107730 () Bool)

(assert (=> d!129389 (= c!107730 (bvsge #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(assert (=> d!129389 (validMask!0 mask!1515)))

(assert (=> d!129389 (= (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469378)))

(declare-fun b!1065002 () Bool)

(assert (=> b!1065002 (= e!606962 (validKeyInArray!0 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065002 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1065003 () Bool)

(declare-fun res!710697 () Bool)

(assert (=> b!1065003 (=> (not res!710697) (not e!606963))))

(assert (=> b!1065003 (= res!710697 (not (contains!6280 lt!469378 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1065004 () Bool)

(declare-fun e!606961 () ListLongMap!14029)

(declare-fun call!45035 () ListLongMap!14029)

(assert (=> b!1065004 (= e!606961 call!45035)))

(declare-fun b!1065005 () Bool)

(assert (=> b!1065005 (= e!606960 (isEmpty!942 lt!469378))))

(declare-fun b!1065006 () Bool)

(declare-fun lt!469374 () Unit!34861)

(declare-fun lt!469375 () Unit!34861)

(assert (=> b!1065006 (= lt!469374 lt!469375)))

(declare-fun lt!469379 () (_ BitVec 64))

(declare-fun lt!469380 () (_ BitVec 64))

(declare-fun lt!469376 () ListLongMap!14029)

(declare-fun lt!469377 () V!38833)

(assert (=> b!1065006 (not (contains!6280 (+!3140 lt!469376 (tuple2!16053 lt!469380 lt!469377)) lt!469379))))

(assert (=> b!1065006 (= lt!469375 (addStillNotContains!250 lt!469376 lt!469380 lt!469377 lt!469379))))

(assert (=> b!1065006 (= lt!469379 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1065006 (= lt!469377 (get!16999 (select (arr!32495 _values!955) #b00000000000000000000000000000000) (dynLambda!2044 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1065006 (= lt!469380 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1065006 (= lt!469376 call!45035)))

(assert (=> b!1065006 (= e!606961 (+!3140 call!45035 (tuple2!16053 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000) (get!16999 (select (arr!32495 _values!955) #b00000000000000000000000000000000) (dynLambda!2044 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1065007 () Bool)

(declare-fun e!606964 () Bool)

(assert (=> b!1065007 (= e!606966 e!606964)))

(assert (=> b!1065007 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(declare-fun res!710696 () Bool)

(assert (=> b!1065007 (= res!710696 (contains!6280 lt!469378 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065007 (=> (not res!710696) (not e!606964))))

(declare-fun bm!45032 () Bool)

(assert (=> bm!45032 (= call!45035 (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1065008 () Bool)

(assert (=> b!1065008 (= e!606965 e!606961)))

(declare-fun c!107729 () Bool)

(assert (=> b!1065008 (= c!107729 (validKeyInArray!0 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065009 () Bool)

(assert (=> b!1065009 (= e!606966 e!606960)))

(declare-fun c!107731 () Bool)

(assert (=> b!1065009 (= c!107731 (bvslt #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(declare-fun b!1065010 () Bool)

(assert (=> b!1065010 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(assert (=> b!1065010 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33032 _values!955)))))

(assert (=> b!1065010 (= e!606964 (= (apply!929 lt!469378 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)) (get!16999 (select (arr!32495 _values!955) #b00000000000000000000000000000000) (dynLambda!2044 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!129389 c!107730) b!1065001))

(assert (= (and d!129389 (not c!107730)) b!1065008))

(assert (= (and b!1065008 c!107729) b!1065006))

(assert (= (and b!1065008 (not c!107729)) b!1065004))

(assert (= (or b!1065006 b!1065004) bm!45032))

(assert (= (and d!129389 res!710695) b!1065003))

(assert (= (and b!1065003 res!710697) b!1064999))

(assert (= (and b!1064999 res!710698) b!1065002))

(assert (= (and b!1064999 c!107732) b!1065007))

(assert (= (and b!1064999 (not c!107732)) b!1065009))

(assert (= (and b!1065007 res!710696) b!1065010))

(assert (= (and b!1065009 c!107731) b!1065000))

(assert (= (and b!1065009 (not c!107731)) b!1065005))

(declare-fun b_lambda!16497 () Bool)

(assert (=> (not b_lambda!16497) (not b!1065006)))

(assert (=> b!1065006 t!31936))

(declare-fun b_and!34217 () Bool)

(assert (= b_and!34215 (and (=> t!31936 result!14705) b_and!34217)))

(declare-fun b_lambda!16499 () Bool)

(assert (=> (not b_lambda!16499) (not b!1065010)))

(assert (=> b!1065010 t!31936))

(declare-fun b_and!34219 () Bool)

(assert (= b_and!34217 (and (=> t!31936 result!14705) b_and!34219)))

(assert (=> b!1065008 m!983937))

(assert (=> b!1065008 m!983937))

(assert (=> b!1065008 m!983939))

(declare-fun m!984019 () Bool)

(assert (=> b!1065000 m!984019))

(assert (=> bm!45032 m!984019))

(declare-fun m!984021 () Bool)

(assert (=> b!1065006 m!984021))

(assert (=> b!1065006 m!983985))

(assert (=> b!1065006 m!983983))

(assert (=> b!1065006 m!983989))

(assert (=> b!1065006 m!983937))

(assert (=> b!1065006 m!983985))

(declare-fun m!984023 () Bool)

(assert (=> b!1065006 m!984023))

(declare-fun m!984025 () Bool)

(assert (=> b!1065006 m!984025))

(declare-fun m!984027 () Bool)

(assert (=> b!1065006 m!984027))

(assert (=> b!1065006 m!984025))

(assert (=> b!1065006 m!983983))

(assert (=> b!1065007 m!983937))

(assert (=> b!1065007 m!983937))

(declare-fun m!984029 () Bool)

(assert (=> b!1065007 m!984029))

(assert (=> b!1065010 m!983985))

(assert (=> b!1065010 m!983983))

(assert (=> b!1065010 m!983989))

(assert (=> b!1065010 m!983983))

(assert (=> b!1065010 m!983937))

(assert (=> b!1065010 m!983937))

(declare-fun m!984031 () Bool)

(assert (=> b!1065010 m!984031))

(assert (=> b!1065010 m!983985))

(declare-fun m!984033 () Bool)

(assert (=> b!1065005 m!984033))

(declare-fun m!984035 () Bool)

(assert (=> b!1065003 m!984035))

(assert (=> b!1065002 m!983937))

(assert (=> b!1065002 m!983937))

(assert (=> b!1065002 m!983939))

(declare-fun m!984037 () Bool)

(assert (=> d!129389 m!984037))

(assert (=> d!129389 m!983859))

(assert (=> b!1064817 d!129389))

(declare-fun b!1065019 () Bool)

(declare-fun e!606973 () Bool)

(declare-fun call!45038 () Bool)

(assert (=> b!1065019 (= e!606973 call!45038)))

(declare-fun b!1065020 () Bool)

(declare-fun e!606974 () Bool)

(assert (=> b!1065020 (= e!606973 e!606974)))

(declare-fun lt!469389 () (_ BitVec 64))

(assert (=> b!1065020 (= lt!469389 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!469388 () Unit!34861)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67589 (_ BitVec 64) (_ BitVec 32)) Unit!34861)

(assert (=> b!1065020 (= lt!469388 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!469389 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1065020 (arrayContainsKey!0 _keys!1163 lt!469389 #b00000000000000000000000000000000)))

(declare-fun lt!469387 () Unit!34861)

(assert (=> b!1065020 (= lt!469387 lt!469388)))

(declare-fun res!710704 () Bool)

(declare-datatypes ((SeekEntryResult!9829 0))(
  ( (MissingZero!9829 (index!41687 (_ BitVec 32))) (Found!9829 (index!41688 (_ BitVec 32))) (Intermediate!9829 (undefined!10641 Bool) (index!41689 (_ BitVec 32)) (x!95140 (_ BitVec 32))) (Undefined!9829) (MissingVacant!9829 (index!41690 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67589 (_ BitVec 32)) SeekEntryResult!9829)

(assert (=> b!1065020 (= res!710704 (= (seekEntryOrOpen!0 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9829 #b00000000000000000000000000000000)))))

(assert (=> b!1065020 (=> (not res!710704) (not e!606974))))

(declare-fun b!1065021 () Bool)

(assert (=> b!1065021 (= e!606974 call!45038)))

(declare-fun d!129391 () Bool)

(declare-fun res!710703 () Bool)

(declare-fun e!606975 () Bool)

(assert (=> d!129391 (=> res!710703 e!606975)))

(assert (=> d!129391 (= res!710703 (bvsge #b00000000000000000000000000000000 (size!33031 _keys!1163)))))

(assert (=> d!129391 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!606975)))

(declare-fun b!1065022 () Bool)

(assert (=> b!1065022 (= e!606975 e!606973)))

(declare-fun c!107735 () Bool)

(assert (=> b!1065022 (= c!107735 (validKeyInArray!0 (select (arr!32494 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45035 () Bool)

(assert (=> bm!45035 (= call!45038 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!129391 (not res!710703)) b!1065022))

(assert (= (and b!1065022 c!107735) b!1065020))

(assert (= (and b!1065022 (not c!107735)) b!1065019))

(assert (= (and b!1065020 res!710704) b!1065021))

(assert (= (or b!1065021 b!1065019) bm!45035))

(assert (=> b!1065020 m!983937))

(declare-fun m!984039 () Bool)

(assert (=> b!1065020 m!984039))

(declare-fun m!984041 () Bool)

(assert (=> b!1065020 m!984041))

(assert (=> b!1065020 m!983937))

(declare-fun m!984043 () Bool)

(assert (=> b!1065020 m!984043))

(assert (=> b!1065022 m!983937))

(assert (=> b!1065022 m!983937))

(assert (=> b!1065022 m!983939))

(declare-fun m!984045 () Bool)

(assert (=> bm!45035 m!984045))

(assert (=> b!1064812 d!129391))

(declare-fun condMapEmpty!39595 () Bool)

(declare-fun mapDefault!39595 () ValueCell!11933)

(assert (=> mapNonEmpty!39586 (= condMapEmpty!39595 (= mapRest!39586 ((as const (Array (_ BitVec 32) ValueCell!11933)) mapDefault!39595)))))

(declare-fun e!606981 () Bool)

(declare-fun mapRes!39595 () Bool)

(assert (=> mapNonEmpty!39586 (= tp!75818 (and e!606981 mapRes!39595))))

(declare-fun b!1065029 () Bool)

(declare-fun e!606980 () Bool)

(assert (=> b!1065029 (= e!606980 tp_is_empty!25273)))

(declare-fun mapIsEmpty!39595 () Bool)

(assert (=> mapIsEmpty!39595 mapRes!39595))

(declare-fun b!1065030 () Bool)

(assert (=> b!1065030 (= e!606981 tp_is_empty!25273)))

(declare-fun mapNonEmpty!39595 () Bool)

(declare-fun tp!75833 () Bool)

(assert (=> mapNonEmpty!39595 (= mapRes!39595 (and tp!75833 e!606980))))

(declare-fun mapKey!39595 () (_ BitVec 32))

(declare-fun mapValue!39595 () ValueCell!11933)

(declare-fun mapRest!39595 () (Array (_ BitVec 32) ValueCell!11933))

(assert (=> mapNonEmpty!39595 (= mapRest!39586 (store mapRest!39595 mapKey!39595 mapValue!39595))))

(assert (= (and mapNonEmpty!39586 condMapEmpty!39595) mapIsEmpty!39595))

(assert (= (and mapNonEmpty!39586 (not condMapEmpty!39595)) mapNonEmpty!39595))

(assert (= (and mapNonEmpty!39595 ((_ is ValueCellFull!11933) mapValue!39595)) b!1065029))

(assert (= (and mapNonEmpty!39586 ((_ is ValueCellFull!11933) mapDefault!39595)) b!1065030))

(declare-fun m!984047 () Bool)

(assert (=> mapNonEmpty!39595 m!984047))

(declare-fun b_lambda!16501 () Bool)

(assert (= b_lambda!16499 (or (and start!94262 b_free!21463) b_lambda!16501)))

(declare-fun b_lambda!16503 () Bool)

(assert (= b_lambda!16495 (or (and start!94262 b_free!21463) b_lambda!16503)))

(declare-fun b_lambda!16505 () Bool)

(assert (= b_lambda!16491 (or (and start!94262 b_free!21463) b_lambda!16505)))

(declare-fun b_lambda!16507 () Bool)

(assert (= b_lambda!16493 (or (and start!94262 b_free!21463) b_lambda!16507)))

(declare-fun b_lambda!16509 () Bool)

(assert (= b_lambda!16497 (or (and start!94262 b_free!21463) b_lambda!16509)))

(check-sat (not b!1064960) (not b!1064995) (not b!1064991) (not bm!45028) (not b!1065010) (not b!1064933) (not b!1064993) (not bm!45023) (not d!129389) (not bm!45024) (not b!1064994) (not bm!45032) (not d!129369) (not b_lambda!16507) (not bm!45019) (not b!1064958) (not b!1065007) (not b!1064996) (not d!129385) (not b!1065020) (not mapNonEmpty!39595) (not d!129371) (not b!1064942) (not b_lambda!16509) (not b!1064935) (not bm!45031) (not b_lambda!16505) (not b!1065003) (not b!1064961) (not b!1065002) (not b!1065008) (not b!1064940) (not b!1064998) (not d!129387) tp_is_empty!25273 (not b_next!21463) b_and!34219 (not b!1065022) (not d!129379) (not b_lambda!16503) (not b!1064926) (not b!1064880) (not b!1064925) (not bm!45022) (not b!1064990) (not b!1065005) (not b!1064988) (not b!1064882) (not b!1065000) (not b!1064929) (not b!1064939) (not b_lambda!16501) (not b!1065006) (not bm!45035) (not d!129381))
(check-sat b_and!34219 (not b_next!21463))
