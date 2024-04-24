; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94928 () Bool)

(assert start!94928)

(declare-fun b_free!21961 () Bool)

(declare-fun b_next!21961 () Bool)

(assert (=> start!94928 (= b_free!21961 (not b_next!21961))))

(declare-fun tp!77338 () Bool)

(declare-fun b_and!34791 () Bool)

(assert (=> start!94928 (= tp!77338 b_and!34791)))

(declare-fun b!1071964 () Bool)

(declare-fun res!714770 () Bool)

(declare-fun e!612050 () Bool)

(assert (=> b!1071964 (=> (not res!714770) (not e!612050))))

(declare-datatypes ((array!68557 0))(
  ( (array!68558 (arr!32969 (Array (_ BitVec 32) (_ BitVec 64))) (size!33506 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68557)

(declare-datatypes ((List!22992 0))(
  ( (Nil!22989) (Cons!22988 (h!24206 (_ BitVec 64)) (t!32315 List!22992)) )
))
(declare-fun arrayNoDuplicates!0 (array!68557 (_ BitVec 32) List!22992) Bool)

(assert (=> b!1071964 (= res!714770 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22989))))

(declare-fun mapIsEmpty!40360 () Bool)

(declare-fun mapRes!40360 () Bool)

(assert (=> mapIsEmpty!40360 mapRes!40360))

(declare-fun b!1071965 () Bool)

(declare-fun e!612049 () Bool)

(assert (=> b!1071965 (= e!612049 (bvsle #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39497 0))(
  ( (V!39498 (val!12936 Int)) )
))
(declare-fun zeroValueBefore!47 () V!39497)

(declare-datatypes ((tuple2!16426 0))(
  ( (tuple2!16427 (_1!8224 (_ BitVec 64)) (_2!8224 V!39497)) )
))
(declare-datatypes ((List!22993 0))(
  ( (Nil!22990) (Cons!22989 (h!24207 tuple2!16426) (t!32316 List!22993)) )
))
(declare-datatypes ((ListLongMap!14403 0))(
  ( (ListLongMap!14404 (toList!7217 List!22993)) )
))
(declare-fun lt!473688 () ListLongMap!14403)

(declare-datatypes ((ValueCell!12182 0))(
  ( (ValueCellFull!12182 (v!15548 V!39497)) (EmptyCell!12182) )
))
(declare-datatypes ((array!68559 0))(
  ( (array!68560 (arr!32970 (Array (_ BitVec 32) ValueCell!12182)) (size!33507 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68559)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39497)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4117 (array!68557 array!68559 (_ BitVec 32) (_ BitVec 32) V!39497 V!39497 (_ BitVec 32) Int) ListLongMap!14403)

(assert (=> b!1071965 (= lt!473688 (getCurrentListMap!4117 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40360 () Bool)

(declare-fun tp!77339 () Bool)

(declare-fun e!612052 () Bool)

(assert (=> mapNonEmpty!40360 (= mapRes!40360 (and tp!77339 e!612052))))

(declare-fun mapRest!40360 () (Array (_ BitVec 32) ValueCell!12182))

(declare-fun mapKey!40360 () (_ BitVec 32))

(declare-fun mapValue!40360 () ValueCell!12182)

(assert (=> mapNonEmpty!40360 (= (arr!32970 _values!955) (store mapRest!40360 mapKey!40360 mapValue!40360))))

(declare-fun res!714772 () Bool)

(assert (=> start!94928 (=> (not res!714772) (not e!612050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94928 (= res!714772 (validMask!0 mask!1515))))

(assert (=> start!94928 e!612050))

(assert (=> start!94928 true))

(declare-fun tp_is_empty!25771 () Bool)

(assert (=> start!94928 tp_is_empty!25771))

(declare-fun e!612047 () Bool)

(declare-fun array_inv!25530 (array!68559) Bool)

(assert (=> start!94928 (and (array_inv!25530 _values!955) e!612047)))

(assert (=> start!94928 tp!77338))

(declare-fun array_inv!25531 (array!68557) Bool)

(assert (=> start!94928 (array_inv!25531 _keys!1163)))

(declare-fun b!1071966 () Bool)

(assert (=> b!1071966 (= e!612052 tp_is_empty!25771)))

(declare-fun b!1071967 () Bool)

(declare-fun res!714774 () Bool)

(assert (=> b!1071967 (=> (not res!714774) (not e!612050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68557 (_ BitVec 32)) Bool)

(assert (=> b!1071967 (= res!714774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071968 () Bool)

(declare-fun res!714771 () Bool)

(assert (=> b!1071968 (=> (not res!714771) (not e!612050))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1071968 (= res!714771 (and (= (size!33507 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33506 _keys!1163) (size!33507 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071969 () Bool)

(assert (=> b!1071969 (= e!612050 (not e!612049))))

(declare-fun res!714773 () Bool)

(assert (=> b!1071969 (=> res!714773 e!612049)))

(assert (=> b!1071969 (= res!714773 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473687 () ListLongMap!14403)

(declare-fun lt!473686 () ListLongMap!14403)

(assert (=> b!1071969 (= lt!473687 lt!473686)))

(declare-datatypes ((Unit!35220 0))(
  ( (Unit!35221) )
))
(declare-fun lt!473685 () Unit!35220)

(declare-fun zeroValueAfter!47 () V!39497)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!828 (array!68557 array!68559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39497 V!39497 V!39497 V!39497 (_ BitVec 32) Int) Unit!35220)

(assert (=> b!1071969 (= lt!473685 (lemmaNoChangeToArrayThenSameMapNoExtras!828 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3825 (array!68557 array!68559 (_ BitVec 32) (_ BitVec 32) V!39497 V!39497 (_ BitVec 32) Int) ListLongMap!14403)

(assert (=> b!1071969 (= lt!473686 (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071969 (= lt!473687 (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071970 () Bool)

(declare-fun e!612051 () Bool)

(assert (=> b!1071970 (= e!612051 tp_is_empty!25771)))

(declare-fun b!1071971 () Bool)

(assert (=> b!1071971 (= e!612047 (and e!612051 mapRes!40360))))

(declare-fun condMapEmpty!40360 () Bool)

(declare-fun mapDefault!40360 () ValueCell!12182)

(assert (=> b!1071971 (= condMapEmpty!40360 (= (arr!32970 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12182)) mapDefault!40360)))))

(assert (= (and start!94928 res!714772) b!1071968))

(assert (= (and b!1071968 res!714771) b!1071967))

(assert (= (and b!1071967 res!714774) b!1071964))

(assert (= (and b!1071964 res!714770) b!1071969))

(assert (= (and b!1071969 (not res!714773)) b!1071965))

(assert (= (and b!1071971 condMapEmpty!40360) mapIsEmpty!40360))

(assert (= (and b!1071971 (not condMapEmpty!40360)) mapNonEmpty!40360))

(get-info :version)

(assert (= (and mapNonEmpty!40360 ((_ is ValueCellFull!12182) mapValue!40360)) b!1071966))

(assert (= (and b!1071971 ((_ is ValueCellFull!12182) mapDefault!40360)) b!1071970))

(assert (= start!94928 b!1071971))

(declare-fun m!990625 () Bool)

(assert (=> b!1071967 m!990625))

(declare-fun m!990627 () Bool)

(assert (=> mapNonEmpty!40360 m!990627))

(declare-fun m!990629 () Bool)

(assert (=> b!1071969 m!990629))

(declare-fun m!990631 () Bool)

(assert (=> b!1071969 m!990631))

(declare-fun m!990633 () Bool)

(assert (=> b!1071969 m!990633))

(declare-fun m!990635 () Bool)

(assert (=> start!94928 m!990635))

(declare-fun m!990637 () Bool)

(assert (=> start!94928 m!990637))

(declare-fun m!990639 () Bool)

(assert (=> start!94928 m!990639))

(declare-fun m!990641 () Bool)

(assert (=> b!1071965 m!990641))

(declare-fun m!990643 () Bool)

(assert (=> b!1071964 m!990643))

(check-sat (not b_next!21961) (not mapNonEmpty!40360) (not b!1071964) (not b!1071965) b_and!34791 (not b!1071969) (not b!1071967) (not start!94928) tp_is_empty!25771)
(check-sat b_and!34791 (not b_next!21961))
(get-model)

(declare-fun b!1072030 () Bool)

(declare-fun e!612098 () Bool)

(declare-fun call!45240 () Bool)

(assert (=> b!1072030 (= e!612098 call!45240)))

(declare-fun b!1072031 () Bool)

(declare-fun e!612099 () Bool)

(declare-fun contains!6341 (List!22992 (_ BitVec 64)) Bool)

(assert (=> b!1072031 (= e!612099 (contains!6341 Nil!22989 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072032 () Bool)

(declare-fun e!612100 () Bool)

(declare-fun e!612097 () Bool)

(assert (=> b!1072032 (= e!612100 e!612097)))

(declare-fun res!714812 () Bool)

(assert (=> b!1072032 (=> (not res!714812) (not e!612097))))

(assert (=> b!1072032 (= res!714812 (not e!612099))))

(declare-fun res!714811 () Bool)

(assert (=> b!1072032 (=> (not res!714811) (not e!612099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1072032 (= res!714811 (validKeyInArray!0 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129729 () Bool)

(declare-fun res!714813 () Bool)

(assert (=> d!129729 (=> res!714813 e!612100)))

(assert (=> d!129729 (= res!714813 (bvsge #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(assert (=> d!129729 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22989) e!612100)))

(declare-fun b!1072033 () Bool)

(assert (=> b!1072033 (= e!612097 e!612098)))

(declare-fun c!108022 () Bool)

(assert (=> b!1072033 (= c!108022 (validKeyInArray!0 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45237 () Bool)

(assert (=> bm!45237 (= call!45240 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108022 (Cons!22988 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000) Nil!22989) Nil!22989)))))

(declare-fun b!1072034 () Bool)

(assert (=> b!1072034 (= e!612098 call!45240)))

(assert (= (and d!129729 (not res!714813)) b!1072032))

(assert (= (and b!1072032 res!714811) b!1072031))

(assert (= (and b!1072032 res!714812) b!1072033))

(assert (= (and b!1072033 c!108022) b!1072034))

(assert (= (and b!1072033 (not c!108022)) b!1072030))

(assert (= (or b!1072034 b!1072030) bm!45237))

(declare-fun m!990685 () Bool)

(assert (=> b!1072031 m!990685))

(assert (=> b!1072031 m!990685))

(declare-fun m!990687 () Bool)

(assert (=> b!1072031 m!990687))

(assert (=> b!1072032 m!990685))

(assert (=> b!1072032 m!990685))

(declare-fun m!990689 () Bool)

(assert (=> b!1072032 m!990689))

(assert (=> b!1072033 m!990685))

(assert (=> b!1072033 m!990685))

(assert (=> b!1072033 m!990689))

(assert (=> bm!45237 m!990685))

(declare-fun m!990691 () Bool)

(assert (=> bm!45237 m!990691))

(assert (=> b!1071964 d!129729))

(declare-fun bm!45240 () Bool)

(declare-fun call!45243 () Bool)

(assert (=> bm!45240 (= call!45243 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1072043 () Bool)

(declare-fun e!612108 () Bool)

(assert (=> b!1072043 (= e!612108 call!45243)))

(declare-fun b!1072044 () Bool)

(declare-fun e!612109 () Bool)

(assert (=> b!1072044 (= e!612109 e!612108)))

(declare-fun c!108025 () Bool)

(assert (=> b!1072044 (= c!108025 (validKeyInArray!0 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072045 () Bool)

(declare-fun e!612107 () Bool)

(assert (=> b!1072045 (= e!612107 call!45243)))

(declare-fun d!129731 () Bool)

(declare-fun res!714818 () Bool)

(assert (=> d!129731 (=> res!714818 e!612109)))

(assert (=> d!129731 (= res!714818 (bvsge #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(assert (=> d!129731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!612109)))

(declare-fun b!1072046 () Bool)

(assert (=> b!1072046 (= e!612108 e!612107)))

(declare-fun lt!473720 () (_ BitVec 64))

(assert (=> b!1072046 (= lt!473720 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473721 () Unit!35220)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68557 (_ BitVec 64) (_ BitVec 32)) Unit!35220)

(assert (=> b!1072046 (= lt!473721 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!473720 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1072046 (arrayContainsKey!0 _keys!1163 lt!473720 #b00000000000000000000000000000000)))

(declare-fun lt!473719 () Unit!35220)

(assert (=> b!1072046 (= lt!473719 lt!473721)))

(declare-fun res!714819 () Bool)

(declare-datatypes ((SeekEntryResult!9838 0))(
  ( (MissingZero!9838 (index!41723 (_ BitVec 32))) (Found!9838 (index!41724 (_ BitVec 32))) (Intermediate!9838 (undefined!10650 Bool) (index!41725 (_ BitVec 32)) (x!95912 (_ BitVec 32))) (Undefined!9838) (MissingVacant!9838 (index!41726 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68557 (_ BitVec 32)) SeekEntryResult!9838)

(assert (=> b!1072046 (= res!714819 (= (seekEntryOrOpen!0 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9838 #b00000000000000000000000000000000)))))

(assert (=> b!1072046 (=> (not res!714819) (not e!612107))))

(assert (= (and d!129731 (not res!714818)) b!1072044))

(assert (= (and b!1072044 c!108025) b!1072046))

(assert (= (and b!1072044 (not c!108025)) b!1072043))

(assert (= (and b!1072046 res!714819) b!1072045))

(assert (= (or b!1072045 b!1072043) bm!45240))

(declare-fun m!990693 () Bool)

(assert (=> bm!45240 m!990693))

(assert (=> b!1072044 m!990685))

(assert (=> b!1072044 m!990685))

(assert (=> b!1072044 m!990689))

(assert (=> b!1072046 m!990685))

(declare-fun m!990695 () Bool)

(assert (=> b!1072046 m!990695))

(declare-fun m!990697 () Bool)

(assert (=> b!1072046 m!990697))

(assert (=> b!1072046 m!990685))

(declare-fun m!990699 () Bool)

(assert (=> b!1072046 m!990699))

(assert (=> b!1071967 d!129731))

(declare-fun d!129733 () Bool)

(assert (=> d!129733 (= (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473724 () Unit!35220)

(declare-fun choose!1744 (array!68557 array!68559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39497 V!39497 V!39497 V!39497 (_ BitVec 32) Int) Unit!35220)

(assert (=> d!129733 (= lt!473724 (choose!1744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129733 (validMask!0 mask!1515)))

(assert (=> d!129733 (= (lemmaNoChangeToArrayThenSameMapNoExtras!828 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473724)))

(declare-fun bs!31561 () Bool)

(assert (= bs!31561 d!129733))

(assert (=> bs!31561 m!990633))

(assert (=> bs!31561 m!990631))

(declare-fun m!990701 () Bool)

(assert (=> bs!31561 m!990701))

(assert (=> bs!31561 m!990635))

(assert (=> b!1071969 d!129733))

(declare-fun b!1072071 () Bool)

(declare-fun res!714830 () Bool)

(declare-fun e!612124 () Bool)

(assert (=> b!1072071 (=> (not res!714830) (not e!612124))))

(declare-fun lt!473740 () ListLongMap!14403)

(declare-fun contains!6342 (ListLongMap!14403 (_ BitVec 64)) Bool)

(assert (=> b!1072071 (= res!714830 (not (contains!6342 lt!473740 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1072072 () Bool)

(declare-fun lt!473741 () Unit!35220)

(declare-fun lt!473742 () Unit!35220)

(assert (=> b!1072072 (= lt!473741 lt!473742)))

(declare-fun lt!473743 () (_ BitVec 64))

(declare-fun lt!473739 () ListLongMap!14403)

(declare-fun lt!473745 () V!39497)

(declare-fun lt!473744 () (_ BitVec 64))

(declare-fun +!3182 (ListLongMap!14403 tuple2!16426) ListLongMap!14403)

(assert (=> b!1072072 (not (contains!6342 (+!3182 lt!473739 (tuple2!16427 lt!473743 lt!473745)) lt!473744))))

(declare-fun addStillNotContains!259 (ListLongMap!14403 (_ BitVec 64) V!39497 (_ BitVec 64)) Unit!35220)

(assert (=> b!1072072 (= lt!473742 (addStillNotContains!259 lt!473739 lt!473743 lt!473745 lt!473744))))

(assert (=> b!1072072 (= lt!473744 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17174 (ValueCell!12182 V!39497) V!39497)

(declare-fun dynLambda!2053 (Int (_ BitVec 64)) V!39497)

(assert (=> b!1072072 (= lt!473745 (get!17174 (select (arr!32970 _values!955) #b00000000000000000000000000000000) (dynLambda!2053 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1072072 (= lt!473743 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45246 () ListLongMap!14403)

(assert (=> b!1072072 (= lt!473739 call!45246)))

(declare-fun e!612128 () ListLongMap!14403)

(assert (=> b!1072072 (= e!612128 (+!3182 call!45246 (tuple2!16427 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000) (get!17174 (select (arr!32970 _values!955) #b00000000000000000000000000000000) (dynLambda!2053 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1072073 () Bool)

(declare-fun e!612126 () ListLongMap!14403)

(assert (=> b!1072073 (= e!612126 (ListLongMap!14404 Nil!22990))))

(declare-fun b!1072074 () Bool)

(declare-fun e!612127 () Bool)

(assert (=> b!1072074 (= e!612124 e!612127)))

(declare-fun c!108037 () Bool)

(declare-fun e!612125 () Bool)

(assert (=> b!1072074 (= c!108037 e!612125)))

(declare-fun res!714829 () Bool)

(assert (=> b!1072074 (=> (not res!714829) (not e!612125))))

(assert (=> b!1072074 (= res!714829 (bvslt #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(declare-fun b!1072075 () Bool)

(declare-fun e!612129 () Bool)

(assert (=> b!1072075 (= e!612127 e!612129)))

(declare-fun c!108035 () Bool)

(assert (=> b!1072075 (= c!108035 (bvslt #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(declare-fun b!1072076 () Bool)

(assert (=> b!1072076 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(assert (=> b!1072076 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33507 _values!955)))))

(declare-fun e!612130 () Bool)

(declare-fun apply!938 (ListLongMap!14403 (_ BitVec 64)) V!39497)

(assert (=> b!1072076 (= e!612130 (= (apply!938 lt!473740 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)) (get!17174 (select (arr!32970 _values!955) #b00000000000000000000000000000000) (dynLambda!2053 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1072077 () Bool)

(assert (=> b!1072077 (= e!612129 (= lt!473740 (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!45243 () Bool)

(assert (=> bm!45243 (= call!45246 (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1072078 () Bool)

(assert (=> b!1072078 (= e!612127 e!612130)))

(assert (=> b!1072078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(declare-fun res!714828 () Bool)

(assert (=> b!1072078 (= res!714828 (contains!6342 lt!473740 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072078 (=> (not res!714828) (not e!612130))))

(declare-fun d!129735 () Bool)

(assert (=> d!129735 e!612124))

(declare-fun res!714831 () Bool)

(assert (=> d!129735 (=> (not res!714831) (not e!612124))))

(assert (=> d!129735 (= res!714831 (not (contains!6342 lt!473740 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129735 (= lt!473740 e!612126)))

(declare-fun c!108034 () Bool)

(assert (=> d!129735 (= c!108034 (bvsge #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(assert (=> d!129735 (validMask!0 mask!1515)))

(assert (=> d!129735 (= (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473740)))

(declare-fun b!1072079 () Bool)

(declare-fun isEmpty!951 (ListLongMap!14403) Bool)

(assert (=> b!1072079 (= e!612129 (isEmpty!951 lt!473740))))

(declare-fun b!1072080 () Bool)

(assert (=> b!1072080 (= e!612126 e!612128)))

(declare-fun c!108036 () Bool)

(assert (=> b!1072080 (= c!108036 (validKeyInArray!0 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072081 () Bool)

(assert (=> b!1072081 (= e!612125 (validKeyInArray!0 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072081 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1072082 () Bool)

(assert (=> b!1072082 (= e!612128 call!45246)))

(assert (= (and d!129735 c!108034) b!1072073))

(assert (= (and d!129735 (not c!108034)) b!1072080))

(assert (= (and b!1072080 c!108036) b!1072072))

(assert (= (and b!1072080 (not c!108036)) b!1072082))

(assert (= (or b!1072072 b!1072082) bm!45243))

(assert (= (and d!129735 res!714831) b!1072071))

(assert (= (and b!1072071 res!714830) b!1072074))

(assert (= (and b!1072074 res!714829) b!1072081))

(assert (= (and b!1072074 c!108037) b!1072078))

(assert (= (and b!1072074 (not c!108037)) b!1072075))

(assert (= (and b!1072078 res!714828) b!1072076))

(assert (= (and b!1072075 c!108035) b!1072077))

(assert (= (and b!1072075 (not c!108035)) b!1072079))

(declare-fun b_lambda!16667 () Bool)

(assert (=> (not b_lambda!16667) (not b!1072072)))

(declare-fun t!32319 () Bool)

(declare-fun tb!7145 () Bool)

(assert (=> (and start!94928 (= defaultEntry!963 defaultEntry!963) t!32319) tb!7145))

(declare-fun result!14759 () Bool)

(assert (=> tb!7145 (= result!14759 tp_is_empty!25771)))

(assert (=> b!1072072 t!32319))

(declare-fun b_and!34797 () Bool)

(assert (= b_and!34791 (and (=> t!32319 result!14759) b_and!34797)))

(declare-fun b_lambda!16669 () Bool)

(assert (=> (not b_lambda!16669) (not b!1072076)))

(assert (=> b!1072076 t!32319))

(declare-fun b_and!34799 () Bool)

(assert (= b_and!34797 (and (=> t!32319 result!14759) b_and!34799)))

(declare-fun m!990703 () Bool)

(assert (=> bm!45243 m!990703))

(assert (=> b!1072080 m!990685))

(assert (=> b!1072080 m!990685))

(assert (=> b!1072080 m!990689))

(assert (=> b!1072081 m!990685))

(assert (=> b!1072081 m!990685))

(assert (=> b!1072081 m!990689))

(assert (=> b!1072078 m!990685))

(assert (=> b!1072078 m!990685))

(declare-fun m!990705 () Bool)

(assert (=> b!1072078 m!990705))

(assert (=> b!1072077 m!990703))

(declare-fun m!990707 () Bool)

(assert (=> b!1072076 m!990707))

(assert (=> b!1072076 m!990685))

(assert (=> b!1072076 m!990707))

(declare-fun m!990709 () Bool)

(assert (=> b!1072076 m!990709))

(declare-fun m!990711 () Bool)

(assert (=> b!1072076 m!990711))

(assert (=> b!1072076 m!990709))

(assert (=> b!1072076 m!990685))

(declare-fun m!990713 () Bool)

(assert (=> b!1072076 m!990713))

(declare-fun m!990715 () Bool)

(assert (=> d!129735 m!990715))

(assert (=> d!129735 m!990635))

(declare-fun m!990717 () Bool)

(assert (=> b!1072071 m!990717))

(declare-fun m!990719 () Bool)

(assert (=> b!1072079 m!990719))

(assert (=> b!1072072 m!990707))

(declare-fun m!990721 () Bool)

(assert (=> b!1072072 m!990721))

(assert (=> b!1072072 m!990685))

(assert (=> b!1072072 m!990707))

(assert (=> b!1072072 m!990709))

(assert (=> b!1072072 m!990711))

(declare-fun m!990723 () Bool)

(assert (=> b!1072072 m!990723))

(assert (=> b!1072072 m!990709))

(assert (=> b!1072072 m!990723))

(declare-fun m!990725 () Bool)

(assert (=> b!1072072 m!990725))

(declare-fun m!990727 () Bool)

(assert (=> b!1072072 m!990727))

(assert (=> b!1071969 d!129735))

(declare-fun b!1072085 () Bool)

(declare-fun res!714834 () Bool)

(declare-fun e!612131 () Bool)

(assert (=> b!1072085 (=> (not res!714834) (not e!612131))))

(declare-fun lt!473747 () ListLongMap!14403)

(assert (=> b!1072085 (= res!714834 (not (contains!6342 lt!473747 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1072086 () Bool)

(declare-fun lt!473748 () Unit!35220)

(declare-fun lt!473749 () Unit!35220)

(assert (=> b!1072086 (= lt!473748 lt!473749)))

(declare-fun lt!473746 () ListLongMap!14403)

(declare-fun lt!473750 () (_ BitVec 64))

(declare-fun lt!473752 () V!39497)

(declare-fun lt!473751 () (_ BitVec 64))

(assert (=> b!1072086 (not (contains!6342 (+!3182 lt!473746 (tuple2!16427 lt!473750 lt!473752)) lt!473751))))

(assert (=> b!1072086 (= lt!473749 (addStillNotContains!259 lt!473746 lt!473750 lt!473752 lt!473751))))

(assert (=> b!1072086 (= lt!473751 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1072086 (= lt!473752 (get!17174 (select (arr!32970 _values!955) #b00000000000000000000000000000000) (dynLambda!2053 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1072086 (= lt!473750 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45247 () ListLongMap!14403)

(assert (=> b!1072086 (= lt!473746 call!45247)))

(declare-fun e!612135 () ListLongMap!14403)

(assert (=> b!1072086 (= e!612135 (+!3182 call!45247 (tuple2!16427 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000) (get!17174 (select (arr!32970 _values!955) #b00000000000000000000000000000000) (dynLambda!2053 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1072087 () Bool)

(declare-fun e!612133 () ListLongMap!14403)

(assert (=> b!1072087 (= e!612133 (ListLongMap!14404 Nil!22990))))

(declare-fun b!1072088 () Bool)

(declare-fun e!612134 () Bool)

(assert (=> b!1072088 (= e!612131 e!612134)))

(declare-fun c!108041 () Bool)

(declare-fun e!612132 () Bool)

(assert (=> b!1072088 (= c!108041 e!612132)))

(declare-fun res!714833 () Bool)

(assert (=> b!1072088 (=> (not res!714833) (not e!612132))))

(assert (=> b!1072088 (= res!714833 (bvslt #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(declare-fun b!1072089 () Bool)

(declare-fun e!612136 () Bool)

(assert (=> b!1072089 (= e!612134 e!612136)))

(declare-fun c!108039 () Bool)

(assert (=> b!1072089 (= c!108039 (bvslt #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(declare-fun b!1072090 () Bool)

(assert (=> b!1072090 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(assert (=> b!1072090 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33507 _values!955)))))

(declare-fun e!612137 () Bool)

(assert (=> b!1072090 (= e!612137 (= (apply!938 lt!473747 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)) (get!17174 (select (arr!32970 _values!955) #b00000000000000000000000000000000) (dynLambda!2053 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1072091 () Bool)

(assert (=> b!1072091 (= e!612136 (= lt!473747 (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!45244 () Bool)

(assert (=> bm!45244 (= call!45247 (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1072092 () Bool)

(assert (=> b!1072092 (= e!612134 e!612137)))

(assert (=> b!1072092 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(declare-fun res!714832 () Bool)

(assert (=> b!1072092 (= res!714832 (contains!6342 lt!473747 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072092 (=> (not res!714832) (not e!612137))))

(declare-fun d!129737 () Bool)

(assert (=> d!129737 e!612131))

(declare-fun res!714835 () Bool)

(assert (=> d!129737 (=> (not res!714835) (not e!612131))))

(assert (=> d!129737 (= res!714835 (not (contains!6342 lt!473747 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129737 (= lt!473747 e!612133)))

(declare-fun c!108038 () Bool)

(assert (=> d!129737 (= c!108038 (bvsge #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(assert (=> d!129737 (validMask!0 mask!1515)))

(assert (=> d!129737 (= (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473747)))

(declare-fun b!1072093 () Bool)

(assert (=> b!1072093 (= e!612136 (isEmpty!951 lt!473747))))

(declare-fun b!1072094 () Bool)

(assert (=> b!1072094 (= e!612133 e!612135)))

(declare-fun c!108040 () Bool)

(assert (=> b!1072094 (= c!108040 (validKeyInArray!0 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072095 () Bool)

(assert (=> b!1072095 (= e!612132 (validKeyInArray!0 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072095 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1072096 () Bool)

(assert (=> b!1072096 (= e!612135 call!45247)))

(assert (= (and d!129737 c!108038) b!1072087))

(assert (= (and d!129737 (not c!108038)) b!1072094))

(assert (= (and b!1072094 c!108040) b!1072086))

(assert (= (and b!1072094 (not c!108040)) b!1072096))

(assert (= (or b!1072086 b!1072096) bm!45244))

(assert (= (and d!129737 res!714835) b!1072085))

(assert (= (and b!1072085 res!714834) b!1072088))

(assert (= (and b!1072088 res!714833) b!1072095))

(assert (= (and b!1072088 c!108041) b!1072092))

(assert (= (and b!1072088 (not c!108041)) b!1072089))

(assert (= (and b!1072092 res!714832) b!1072090))

(assert (= (and b!1072089 c!108039) b!1072091))

(assert (= (and b!1072089 (not c!108039)) b!1072093))

(declare-fun b_lambda!16671 () Bool)

(assert (=> (not b_lambda!16671) (not b!1072086)))

(assert (=> b!1072086 t!32319))

(declare-fun b_and!34801 () Bool)

(assert (= b_and!34799 (and (=> t!32319 result!14759) b_and!34801)))

(declare-fun b_lambda!16673 () Bool)

(assert (=> (not b_lambda!16673) (not b!1072090)))

(assert (=> b!1072090 t!32319))

(declare-fun b_and!34803 () Bool)

(assert (= b_and!34801 (and (=> t!32319 result!14759) b_and!34803)))

(declare-fun m!990729 () Bool)

(assert (=> bm!45244 m!990729))

(assert (=> b!1072094 m!990685))

(assert (=> b!1072094 m!990685))

(assert (=> b!1072094 m!990689))

(assert (=> b!1072095 m!990685))

(assert (=> b!1072095 m!990685))

(assert (=> b!1072095 m!990689))

(assert (=> b!1072092 m!990685))

(assert (=> b!1072092 m!990685))

(declare-fun m!990731 () Bool)

(assert (=> b!1072092 m!990731))

(assert (=> b!1072091 m!990729))

(assert (=> b!1072090 m!990707))

(assert (=> b!1072090 m!990685))

(assert (=> b!1072090 m!990707))

(assert (=> b!1072090 m!990709))

(assert (=> b!1072090 m!990711))

(assert (=> b!1072090 m!990709))

(assert (=> b!1072090 m!990685))

(declare-fun m!990733 () Bool)

(assert (=> b!1072090 m!990733))

(declare-fun m!990735 () Bool)

(assert (=> d!129737 m!990735))

(assert (=> d!129737 m!990635))

(declare-fun m!990737 () Bool)

(assert (=> b!1072085 m!990737))

(declare-fun m!990739 () Bool)

(assert (=> b!1072093 m!990739))

(assert (=> b!1072086 m!990707))

(declare-fun m!990741 () Bool)

(assert (=> b!1072086 m!990741))

(assert (=> b!1072086 m!990685))

(assert (=> b!1072086 m!990707))

(assert (=> b!1072086 m!990709))

(assert (=> b!1072086 m!990711))

(declare-fun m!990743 () Bool)

(assert (=> b!1072086 m!990743))

(assert (=> b!1072086 m!990709))

(assert (=> b!1072086 m!990743))

(declare-fun m!990745 () Bool)

(assert (=> b!1072086 m!990745))

(declare-fun m!990747 () Bool)

(assert (=> b!1072086 m!990747))

(assert (=> b!1071969 d!129737))

(declare-fun b!1072139 () Bool)

(declare-fun e!612168 () Bool)

(declare-fun e!612171 () Bool)

(assert (=> b!1072139 (= e!612168 e!612171)))

(declare-fun res!714858 () Bool)

(assert (=> b!1072139 (=> (not res!714858) (not e!612171))))

(declare-fun lt!473798 () ListLongMap!14403)

(assert (=> b!1072139 (= res!714858 (contains!6342 lt!473798 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072139 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(declare-fun b!1072140 () Bool)

(declare-fun e!612169 () ListLongMap!14403)

(declare-fun call!45263 () ListLongMap!14403)

(assert (=> b!1072140 (= e!612169 call!45263)))

(declare-fun b!1072141 () Bool)

(declare-fun res!714857 () Bool)

(declare-fun e!612174 () Bool)

(assert (=> b!1072141 (=> (not res!714857) (not e!612174))))

(declare-fun e!612176 () Bool)

(assert (=> b!1072141 (= res!714857 e!612176)))

(declare-fun c!108055 () Bool)

(assert (=> b!1072141 (= c!108055 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072142 () Bool)

(declare-fun call!45267 () Bool)

(assert (=> b!1072142 (= e!612176 (not call!45267))))

(declare-fun b!1072143 () Bool)

(declare-fun e!612173 () Bool)

(assert (=> b!1072143 (= e!612173 (validKeyInArray!0 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129739 () Bool)

(assert (=> d!129739 e!612174))

(declare-fun res!714859 () Bool)

(assert (=> d!129739 (=> (not res!714859) (not e!612174))))

(assert (=> d!129739 (= res!714859 (or (bvsge #b00000000000000000000000000000000 (size!33506 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33506 _keys!1163)))))))

(declare-fun lt!473799 () ListLongMap!14403)

(assert (=> d!129739 (= lt!473798 lt!473799)))

(declare-fun lt!473817 () Unit!35220)

(declare-fun e!612167 () Unit!35220)

(assert (=> d!129739 (= lt!473817 e!612167)))

(declare-fun c!108059 () Bool)

(assert (=> d!129739 (= c!108059 e!612173)))

(declare-fun res!714862 () Bool)

(assert (=> d!129739 (=> (not res!714862) (not e!612173))))

(assert (=> d!129739 (= res!714862 (bvslt #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(declare-fun e!612166 () ListLongMap!14403)

(assert (=> d!129739 (= lt!473799 e!612166)))

(declare-fun c!108058 () Bool)

(assert (=> d!129739 (= c!108058 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129739 (validMask!0 mask!1515)))

(assert (=> d!129739 (= (getCurrentListMap!4117 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473798)))

(declare-fun b!1072144 () Bool)

(declare-fun e!612175 () Bool)

(assert (=> b!1072144 (= e!612175 (= (apply!938 lt!473798 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1072145 () Bool)

(declare-fun e!612164 () Bool)

(assert (=> b!1072145 (= e!612174 e!612164)))

(declare-fun c!108054 () Bool)

(assert (=> b!1072145 (= c!108054 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45259 () Bool)

(declare-fun call!45268 () Bool)

(assert (=> bm!45259 (= call!45268 (contains!6342 lt!473798 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1072146 () Bool)

(assert (=> b!1072146 (= e!612164 (not call!45268))))

(declare-fun call!45266 () ListLongMap!14403)

(declare-fun c!108057 () Bool)

(declare-fun call!45265 () ListLongMap!14403)

(declare-fun call!45264 () ListLongMap!14403)

(declare-fun call!45262 () ListLongMap!14403)

(declare-fun bm!45260 () Bool)

(assert (=> bm!45260 (= call!45262 (+!3182 (ite c!108058 call!45264 (ite c!108057 call!45265 call!45266)) (ite (or c!108058 c!108057) (tuple2!16427 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45261 () Bool)

(assert (=> bm!45261 (= call!45265 call!45264)))

(declare-fun b!1072147 () Bool)

(declare-fun e!612170 () Bool)

(assert (=> b!1072147 (= e!612170 (validKeyInArray!0 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072148 () Bool)

(declare-fun e!612165 () ListLongMap!14403)

(assert (=> b!1072148 (= e!612166 e!612165)))

(assert (=> b!1072148 (= c!108057 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45262 () Bool)

(assert (=> bm!45262 (= call!45266 call!45265)))

(declare-fun b!1072149 () Bool)

(declare-fun res!714854 () Bool)

(assert (=> b!1072149 (=> (not res!714854) (not e!612174))))

(assert (=> b!1072149 (= res!714854 e!612168)))

(declare-fun res!714860 () Bool)

(assert (=> b!1072149 (=> res!714860 e!612168)))

(assert (=> b!1072149 (= res!714860 (not e!612170))))

(declare-fun res!714856 () Bool)

(assert (=> b!1072149 (=> (not res!714856) (not e!612170))))

(assert (=> b!1072149 (= res!714856 (bvslt #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(declare-fun bm!45263 () Bool)

(assert (=> bm!45263 (= call!45267 (contains!6342 lt!473798 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1072150 () Bool)

(assert (=> b!1072150 (= e!612171 (= (apply!938 lt!473798 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000)) (get!17174 (select (arr!32970 _values!955) #b00000000000000000000000000000000) (dynLambda!2053 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1072150 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33507 _values!955)))))

(assert (=> b!1072150 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33506 _keys!1163)))))

(declare-fun b!1072151 () Bool)

(assert (=> b!1072151 (= e!612164 e!612175)))

(declare-fun res!714861 () Bool)

(assert (=> b!1072151 (= res!714861 call!45268)))

(assert (=> b!1072151 (=> (not res!714861) (not e!612175))))

(declare-fun b!1072152 () Bool)

(declare-fun c!108056 () Bool)

(assert (=> b!1072152 (= c!108056 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1072152 (= e!612165 e!612169)))

(declare-fun bm!45264 () Bool)

(assert (=> bm!45264 (= call!45264 (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072153 () Bool)

(assert (=> b!1072153 (= e!612169 call!45266)))

(declare-fun b!1072154 () Bool)

(declare-fun e!612172 () Bool)

(assert (=> b!1072154 (= e!612172 (= (apply!938 lt!473798 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1072155 () Bool)

(declare-fun Unit!35224 () Unit!35220)

(assert (=> b!1072155 (= e!612167 Unit!35224)))

(declare-fun b!1072156 () Bool)

(assert (=> b!1072156 (= e!612166 (+!3182 call!45262 (tuple2!16427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45265 () Bool)

(assert (=> bm!45265 (= call!45263 call!45262)))

(declare-fun b!1072157 () Bool)

(assert (=> b!1072157 (= e!612165 call!45263)))

(declare-fun b!1072158 () Bool)

(declare-fun lt!473818 () Unit!35220)

(assert (=> b!1072158 (= e!612167 lt!473818)))

(declare-fun lt!473805 () ListLongMap!14403)

(assert (=> b!1072158 (= lt!473805 (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473803 () (_ BitVec 64))

(assert (=> b!1072158 (= lt!473803 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473800 () (_ BitVec 64))

(assert (=> b!1072158 (= lt!473800 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473814 () Unit!35220)

(declare-fun addStillContains!643 (ListLongMap!14403 (_ BitVec 64) V!39497 (_ BitVec 64)) Unit!35220)

(assert (=> b!1072158 (= lt!473814 (addStillContains!643 lt!473805 lt!473803 zeroValueBefore!47 lt!473800))))

(assert (=> b!1072158 (contains!6342 (+!3182 lt!473805 (tuple2!16427 lt!473803 zeroValueBefore!47)) lt!473800)))

(declare-fun lt!473808 () Unit!35220)

(assert (=> b!1072158 (= lt!473808 lt!473814)))

(declare-fun lt!473809 () ListLongMap!14403)

(assert (=> b!1072158 (= lt!473809 (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473812 () (_ BitVec 64))

(assert (=> b!1072158 (= lt!473812 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473813 () (_ BitVec 64))

(assert (=> b!1072158 (= lt!473813 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473801 () Unit!35220)

(declare-fun addApplyDifferent!499 (ListLongMap!14403 (_ BitVec 64) V!39497 (_ BitVec 64)) Unit!35220)

(assert (=> b!1072158 (= lt!473801 (addApplyDifferent!499 lt!473809 lt!473812 minValue!907 lt!473813))))

(assert (=> b!1072158 (= (apply!938 (+!3182 lt!473809 (tuple2!16427 lt!473812 minValue!907)) lt!473813) (apply!938 lt!473809 lt!473813))))

(declare-fun lt!473810 () Unit!35220)

(assert (=> b!1072158 (= lt!473810 lt!473801)))

(declare-fun lt!473807 () ListLongMap!14403)

(assert (=> b!1072158 (= lt!473807 (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473815 () (_ BitVec 64))

(assert (=> b!1072158 (= lt!473815 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473804 () (_ BitVec 64))

(assert (=> b!1072158 (= lt!473804 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473816 () Unit!35220)

(assert (=> b!1072158 (= lt!473816 (addApplyDifferent!499 lt!473807 lt!473815 zeroValueBefore!47 lt!473804))))

(assert (=> b!1072158 (= (apply!938 (+!3182 lt!473807 (tuple2!16427 lt!473815 zeroValueBefore!47)) lt!473804) (apply!938 lt!473807 lt!473804))))

(declare-fun lt!473806 () Unit!35220)

(assert (=> b!1072158 (= lt!473806 lt!473816)))

(declare-fun lt!473802 () ListLongMap!14403)

(assert (=> b!1072158 (= lt!473802 (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473797 () (_ BitVec 64))

(assert (=> b!1072158 (= lt!473797 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473811 () (_ BitVec 64))

(assert (=> b!1072158 (= lt!473811 (select (arr!32969 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1072158 (= lt!473818 (addApplyDifferent!499 lt!473802 lt!473797 minValue!907 lt!473811))))

(assert (=> b!1072158 (= (apply!938 (+!3182 lt!473802 (tuple2!16427 lt!473797 minValue!907)) lt!473811) (apply!938 lt!473802 lt!473811))))

(declare-fun b!1072159 () Bool)

(assert (=> b!1072159 (= e!612176 e!612172)))

(declare-fun res!714855 () Bool)

(assert (=> b!1072159 (= res!714855 call!45267)))

(assert (=> b!1072159 (=> (not res!714855) (not e!612172))))

(assert (= (and d!129739 c!108058) b!1072156))

(assert (= (and d!129739 (not c!108058)) b!1072148))

(assert (= (and b!1072148 c!108057) b!1072157))

(assert (= (and b!1072148 (not c!108057)) b!1072152))

(assert (= (and b!1072152 c!108056) b!1072140))

(assert (= (and b!1072152 (not c!108056)) b!1072153))

(assert (= (or b!1072140 b!1072153) bm!45262))

(assert (= (or b!1072157 bm!45262) bm!45261))

(assert (= (or b!1072157 b!1072140) bm!45265))

(assert (= (or b!1072156 bm!45261) bm!45264))

(assert (= (or b!1072156 bm!45265) bm!45260))

(assert (= (and d!129739 res!714862) b!1072143))

(assert (= (and d!129739 c!108059) b!1072158))

(assert (= (and d!129739 (not c!108059)) b!1072155))

(assert (= (and d!129739 res!714859) b!1072149))

(assert (= (and b!1072149 res!714856) b!1072147))

(assert (= (and b!1072149 (not res!714860)) b!1072139))

(assert (= (and b!1072139 res!714858) b!1072150))

(assert (= (and b!1072149 res!714854) b!1072141))

(assert (= (and b!1072141 c!108055) b!1072159))

(assert (= (and b!1072141 (not c!108055)) b!1072142))

(assert (= (and b!1072159 res!714855) b!1072154))

(assert (= (or b!1072159 b!1072142) bm!45263))

(assert (= (and b!1072141 res!714857) b!1072145))

(assert (= (and b!1072145 c!108054) b!1072151))

(assert (= (and b!1072145 (not c!108054)) b!1072146))

(assert (= (and b!1072151 res!714861) b!1072144))

(assert (= (or b!1072151 b!1072146) bm!45259))

(declare-fun b_lambda!16675 () Bool)

(assert (=> (not b_lambda!16675) (not b!1072150)))

(assert (=> b!1072150 t!32319))

(declare-fun b_and!34805 () Bool)

(assert (= b_and!34803 (and (=> t!32319 result!14759) b_and!34805)))

(declare-fun m!990749 () Bool)

(assert (=> b!1072144 m!990749))

(assert (=> b!1072139 m!990685))

(assert (=> b!1072139 m!990685))

(declare-fun m!990751 () Bool)

(assert (=> b!1072139 m!990751))

(declare-fun m!990753 () Bool)

(assert (=> b!1072154 m!990753))

(declare-fun m!990755 () Bool)

(assert (=> bm!45259 m!990755))

(assert (=> b!1072143 m!990685))

(assert (=> b!1072143 m!990685))

(assert (=> b!1072143 m!990689))

(declare-fun m!990757 () Bool)

(assert (=> b!1072156 m!990757))

(assert (=> b!1072147 m!990685))

(assert (=> b!1072147 m!990685))

(assert (=> b!1072147 m!990689))

(declare-fun m!990759 () Bool)

(assert (=> bm!45260 m!990759))

(assert (=> bm!45264 m!990633))

(assert (=> d!129739 m!990635))

(declare-fun m!990761 () Bool)

(assert (=> bm!45263 m!990761))

(assert (=> b!1072150 m!990707))

(assert (=> b!1072150 m!990685))

(declare-fun m!990763 () Bool)

(assert (=> b!1072150 m!990763))

(assert (=> b!1072150 m!990707))

(assert (=> b!1072150 m!990709))

(assert (=> b!1072150 m!990711))

(assert (=> b!1072150 m!990685))

(assert (=> b!1072150 m!990709))

(assert (=> b!1072158 m!990633))

(declare-fun m!990765 () Bool)

(assert (=> b!1072158 m!990765))

(assert (=> b!1072158 m!990685))

(declare-fun m!990767 () Bool)

(assert (=> b!1072158 m!990767))

(declare-fun m!990769 () Bool)

(assert (=> b!1072158 m!990769))

(assert (=> b!1072158 m!990767))

(declare-fun m!990771 () Bool)

(assert (=> b!1072158 m!990771))

(declare-fun m!990773 () Bool)

(assert (=> b!1072158 m!990773))

(declare-fun m!990775 () Bool)

(assert (=> b!1072158 m!990775))

(declare-fun m!990777 () Bool)

(assert (=> b!1072158 m!990777))

(declare-fun m!990779 () Bool)

(assert (=> b!1072158 m!990779))

(declare-fun m!990781 () Bool)

(assert (=> b!1072158 m!990781))

(declare-fun m!990783 () Bool)

(assert (=> b!1072158 m!990783))

(assert (=> b!1072158 m!990777))

(declare-fun m!990785 () Bool)

(assert (=> b!1072158 m!990785))

(assert (=> b!1072158 m!990775))

(declare-fun m!990787 () Bool)

(assert (=> b!1072158 m!990787))

(declare-fun m!990789 () Bool)

(assert (=> b!1072158 m!990789))

(declare-fun m!990791 () Bool)

(assert (=> b!1072158 m!990791))

(assert (=> b!1072158 m!990791))

(declare-fun m!990793 () Bool)

(assert (=> b!1072158 m!990793))

(assert (=> b!1071965 d!129739))

(declare-fun d!129741 () Bool)

(assert (=> d!129741 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94928 d!129741))

(declare-fun d!129743 () Bool)

(assert (=> d!129743 (= (array_inv!25530 _values!955) (bvsge (size!33507 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94928 d!129743))

(declare-fun d!129745 () Bool)

(assert (=> d!129745 (= (array_inv!25531 _keys!1163) (bvsge (size!33506 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94928 d!129745))

(declare-fun mapNonEmpty!40369 () Bool)

(declare-fun mapRes!40369 () Bool)

(declare-fun tp!77354 () Bool)

(declare-fun e!612181 () Bool)

(assert (=> mapNonEmpty!40369 (= mapRes!40369 (and tp!77354 e!612181))))

(declare-fun mapRest!40369 () (Array (_ BitVec 32) ValueCell!12182))

(declare-fun mapKey!40369 () (_ BitVec 32))

(declare-fun mapValue!40369 () ValueCell!12182)

(assert (=> mapNonEmpty!40369 (= mapRest!40360 (store mapRest!40369 mapKey!40369 mapValue!40369))))

(declare-fun b!1072167 () Bool)

(declare-fun e!612182 () Bool)

(assert (=> b!1072167 (= e!612182 tp_is_empty!25771)))

(declare-fun b!1072166 () Bool)

(assert (=> b!1072166 (= e!612181 tp_is_empty!25771)))

(declare-fun mapIsEmpty!40369 () Bool)

(assert (=> mapIsEmpty!40369 mapRes!40369))

(declare-fun condMapEmpty!40369 () Bool)

(declare-fun mapDefault!40369 () ValueCell!12182)

(assert (=> mapNonEmpty!40360 (= condMapEmpty!40369 (= mapRest!40360 ((as const (Array (_ BitVec 32) ValueCell!12182)) mapDefault!40369)))))

(assert (=> mapNonEmpty!40360 (= tp!77339 (and e!612182 mapRes!40369))))

(assert (= (and mapNonEmpty!40360 condMapEmpty!40369) mapIsEmpty!40369))

(assert (= (and mapNonEmpty!40360 (not condMapEmpty!40369)) mapNonEmpty!40369))

(assert (= (and mapNonEmpty!40369 ((_ is ValueCellFull!12182) mapValue!40369)) b!1072166))

(assert (= (and mapNonEmpty!40360 ((_ is ValueCellFull!12182) mapDefault!40369)) b!1072167))

(declare-fun m!990795 () Bool)

(assert (=> mapNonEmpty!40369 m!990795))

(declare-fun b_lambda!16677 () Bool)

(assert (= b_lambda!16675 (or (and start!94928 b_free!21961) b_lambda!16677)))

(declare-fun b_lambda!16679 () Bool)

(assert (= b_lambda!16669 (or (and start!94928 b_free!21961) b_lambda!16679)))

(declare-fun b_lambda!16681 () Bool)

(assert (= b_lambda!16671 (or (and start!94928 b_free!21961) b_lambda!16681)))

(declare-fun b_lambda!16683 () Bool)

(assert (= b_lambda!16667 (or (and start!94928 b_free!21961) b_lambda!16683)))

(declare-fun b_lambda!16685 () Bool)

(assert (= b_lambda!16673 (or (and start!94928 b_free!21961) b_lambda!16685)))

(check-sat (not b!1072081) (not b_lambda!16677) (not b!1072158) (not d!129737) (not bm!45244) (not b!1072076) (not b!1072150) (not b_lambda!16681) (not b!1072139) (not b!1072077) (not b!1072154) (not b!1072044) (not mapNonEmpty!40369) (not b_next!21961) (not b!1072080) (not b!1072086) (not b!1072144) (not b!1072046) (not b!1072093) (not d!129733) (not b!1072147) (not bm!45243) (not b!1072085) (not b!1072033) (not bm!45259) (not bm!45260) (not b!1072090) (not b!1072032) (not bm!45237) (not b!1072072) (not b_lambda!16679) (not b!1072071) (not b!1072031) (not bm!45263) (not b!1072091) (not bm!45240) (not b!1072156) b_and!34805 (not b_lambda!16683) (not b_lambda!16685) (not d!129739) (not bm!45264) (not b!1072092) (not d!129735) (not b!1072094) (not b!1072095) (not b!1072079) tp_is_empty!25771 (not b!1072078) (not b!1072143))
(check-sat b_and!34805 (not b_next!21961))
