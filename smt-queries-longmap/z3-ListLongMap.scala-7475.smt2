; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95010 () Bool)

(assert start!95010)

(declare-fun b_free!22027 () Bool)

(declare-fun b_next!22027 () Bool)

(assert (=> start!95010 (= b_free!22027 (not b_next!22027))))

(declare-fun tp!77540 () Bool)

(declare-fun b_and!34867 () Bool)

(assert (=> start!95010 (= tp!77540 b_and!34867)))

(declare-fun b!1072998 () Bool)

(declare-fun res!715420 () Bool)

(declare-fun e!612836 () Bool)

(assert (=> b!1072998 (=> (not res!715420) (not e!612836))))

(declare-datatypes ((array!68687 0))(
  ( (array!68688 (arr!33033 (Array (_ BitVec 32) (_ BitVec 64))) (size!33570 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68687)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68687 (_ BitVec 32)) Bool)

(assert (=> b!1072998 (= res!715420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072999 () Bool)

(declare-fun e!612831 () Bool)

(declare-fun e!612832 () Bool)

(assert (=> b!1072999 (= e!612831 e!612832)))

(declare-fun res!715419 () Bool)

(assert (=> b!1072999 (=> res!715419 e!612832)))

(declare-datatypes ((V!39585 0))(
  ( (V!39586 (val!12969 Int)) )
))
(declare-datatypes ((tuple2!16482 0))(
  ( (tuple2!16483 (_1!8252 (_ BitVec 64)) (_2!8252 V!39585)) )
))
(declare-datatypes ((List!23041 0))(
  ( (Nil!23038) (Cons!23037 (h!24255 tuple2!16482) (t!32366 List!23041)) )
))
(declare-datatypes ((ListLongMap!14459 0))(
  ( (ListLongMap!14460 (toList!7245 List!23041)) )
))
(declare-fun lt!474932 () ListLongMap!14459)

(declare-fun lt!474929 () ListLongMap!14459)

(declare-fun -!678 (ListLongMap!14459 (_ BitVec 64)) ListLongMap!14459)

(assert (=> b!1072999 (= res!715419 (not (= (-!678 lt!474932 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474929)))))

(declare-fun lt!474926 () ListLongMap!14459)

(declare-fun lt!474923 () ListLongMap!14459)

(assert (=> b!1072999 (= lt!474926 lt!474923)))

(declare-fun zeroValueBefore!47 () V!39585)

(declare-datatypes ((Unit!35273 0))(
  ( (Unit!35274) )
))
(declare-fun lt!474924 () Unit!35273)

(declare-fun lt!474933 () ListLongMap!14459)

(declare-fun minValue!907 () V!39585)

(declare-fun addCommutativeForDiffKeys!735 (ListLongMap!14459 (_ BitVec 64) V!39585 (_ BitVec 64) V!39585) Unit!35273)

(assert (=> b!1072999 (= lt!474924 (addCommutativeForDiffKeys!735 lt!474933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474927 () ListLongMap!14459)

(assert (=> b!1072999 (= (-!678 lt!474923 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474927)))

(declare-fun lt!474934 () tuple2!16482)

(declare-fun +!3208 (ListLongMap!14459 tuple2!16482) ListLongMap!14459)

(assert (=> b!1072999 (= lt!474923 (+!3208 lt!474927 lt!474934))))

(declare-fun lt!474925 () Unit!35273)

(declare-fun addThenRemoveForNewKeyIsSame!53 (ListLongMap!14459 (_ BitVec 64) V!39585) Unit!35273)

(assert (=> b!1072999 (= lt!474925 (addThenRemoveForNewKeyIsSame!53 lt!474927 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474928 () tuple2!16482)

(assert (=> b!1072999 (= lt!474927 (+!3208 lt!474933 lt!474928))))

(declare-fun e!612834 () Bool)

(assert (=> b!1072999 e!612834))

(declare-fun res!715422 () Bool)

(assert (=> b!1072999 (=> (not res!715422) (not e!612834))))

(assert (=> b!1072999 (= res!715422 (= lt!474932 lt!474926))))

(assert (=> b!1072999 (= lt!474926 (+!3208 (+!3208 lt!474933 lt!474934) lt!474928))))

(assert (=> b!1072999 (= lt!474928 (tuple2!16483 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072999 (= lt!474934 (tuple2!16483 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-datatypes ((ValueCell!12215 0))(
  ( (ValueCellFull!12215 (v!15581 V!39585)) (EmptyCell!12215) )
))
(declare-datatypes ((array!68689 0))(
  ( (array!68690 (arr!33034 (Array (_ BitVec 32) ValueCell!12215)) (size!33571 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68689)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39585)

(declare-fun getCurrentListMap!4139 (array!68687 array!68689 (_ BitVec 32) (_ BitVec 32) V!39585 V!39585 (_ BitVec 32) Int) ListLongMap!14459)

(assert (=> b!1072999 (= lt!474929 (getCurrentListMap!4139 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072999 (= lt!474932 (getCurrentListMap!4139 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40462 () Bool)

(declare-fun mapRes!40462 () Bool)

(assert (=> mapIsEmpty!40462 mapRes!40462))

(declare-fun b!1073000 () Bool)

(declare-fun e!612833 () Bool)

(declare-fun tp_is_empty!25837 () Bool)

(assert (=> b!1073000 (= e!612833 tp_is_empty!25837)))

(declare-fun b!1073001 () Bool)

(declare-fun res!715418 () Bool)

(assert (=> b!1073001 (=> (not res!715418) (not e!612836))))

(declare-datatypes ((List!23042 0))(
  ( (Nil!23039) (Cons!23038 (h!24256 (_ BitVec 64)) (t!32367 List!23042)) )
))
(declare-fun arrayNoDuplicates!0 (array!68687 (_ BitVec 32) List!23042) Bool)

(assert (=> b!1073001 (= res!715418 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23039))))

(declare-fun b!1073002 () Bool)

(declare-fun lt!474930 () ListLongMap!14459)

(assert (=> b!1073002 (= e!612834 (= lt!474929 (+!3208 lt!474930 lt!474928)))))

(declare-fun b!1073003 () Bool)

(assert (=> b!1073003 (= e!612836 (not e!612831))))

(declare-fun res!715423 () Bool)

(assert (=> b!1073003 (=> res!715423 e!612831)))

(assert (=> b!1073003 (= res!715423 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1073003 (= lt!474933 lt!474930)))

(declare-fun lt!474931 () Unit!35273)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!852 (array!68687 array!68689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39585 V!39585 V!39585 V!39585 (_ BitVec 32) Int) Unit!35273)

(assert (=> b!1073003 (= lt!474931 (lemmaNoChangeToArrayThenSameMapNoExtras!852 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3849 (array!68687 array!68689 (_ BitVec 32) (_ BitVec 32) V!39585 V!39585 (_ BitVec 32) Int) ListLongMap!14459)

(assert (=> b!1073003 (= lt!474930 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073003 (= lt!474933 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40462 () Bool)

(declare-fun tp!77539 () Bool)

(assert (=> mapNonEmpty!40462 (= mapRes!40462 (and tp!77539 e!612833))))

(declare-fun mapRest!40462 () (Array (_ BitVec 32) ValueCell!12215))

(declare-fun mapKey!40462 () (_ BitVec 32))

(declare-fun mapValue!40462 () ValueCell!12215)

(assert (=> mapNonEmpty!40462 (= (arr!33034 _values!955) (store mapRest!40462 mapKey!40462 mapValue!40462))))

(declare-fun res!715417 () Bool)

(assert (=> start!95010 (=> (not res!715417) (not e!612836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95010 (= res!715417 (validMask!0 mask!1515))))

(assert (=> start!95010 e!612836))

(assert (=> start!95010 true))

(assert (=> start!95010 tp_is_empty!25837))

(declare-fun e!612829 () Bool)

(declare-fun array_inv!25572 (array!68689) Bool)

(assert (=> start!95010 (and (array_inv!25572 _values!955) e!612829)))

(assert (=> start!95010 tp!77540))

(declare-fun array_inv!25573 (array!68687) Bool)

(assert (=> start!95010 (array_inv!25573 _keys!1163)))

(declare-fun b!1073004 () Bool)

(declare-fun e!612835 () Bool)

(assert (=> b!1073004 (= e!612829 (and e!612835 mapRes!40462))))

(declare-fun condMapEmpty!40462 () Bool)

(declare-fun mapDefault!40462 () ValueCell!12215)

(assert (=> b!1073004 (= condMapEmpty!40462 (= (arr!33034 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12215)) mapDefault!40462)))))

(declare-fun b!1073005 () Bool)

(assert (=> b!1073005 (= e!612832 (bvsle #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(declare-fun b!1073006 () Bool)

(assert (=> b!1073006 (= e!612835 tp_is_empty!25837)))

(declare-fun b!1073007 () Bool)

(declare-fun res!715421 () Bool)

(assert (=> b!1073007 (=> (not res!715421) (not e!612836))))

(assert (=> b!1073007 (= res!715421 (and (= (size!33571 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33570 _keys!1163) (size!33571 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!95010 res!715417) b!1073007))

(assert (= (and b!1073007 res!715421) b!1072998))

(assert (= (and b!1072998 res!715420) b!1073001))

(assert (= (and b!1073001 res!715418) b!1073003))

(assert (= (and b!1073003 (not res!715423)) b!1072999))

(assert (= (and b!1072999 res!715422) b!1073002))

(assert (= (and b!1072999 (not res!715419)) b!1073005))

(assert (= (and b!1073004 condMapEmpty!40462) mapIsEmpty!40462))

(assert (= (and b!1073004 (not condMapEmpty!40462)) mapNonEmpty!40462))

(get-info :version)

(assert (= (and mapNonEmpty!40462 ((_ is ValueCellFull!12215) mapValue!40462)) b!1073000))

(assert (= (and b!1073004 ((_ is ValueCellFull!12215) mapDefault!40462)) b!1073006))

(assert (= start!95010 b!1073004))

(declare-fun m!991961 () Bool)

(assert (=> mapNonEmpty!40462 m!991961))

(declare-fun m!991963 () Bool)

(assert (=> start!95010 m!991963))

(declare-fun m!991965 () Bool)

(assert (=> start!95010 m!991965))

(declare-fun m!991967 () Bool)

(assert (=> start!95010 m!991967))

(declare-fun m!991969 () Bool)

(assert (=> b!1072998 m!991969))

(declare-fun m!991971 () Bool)

(assert (=> b!1073001 m!991971))

(declare-fun m!991973 () Bool)

(assert (=> b!1073003 m!991973))

(declare-fun m!991975 () Bool)

(assert (=> b!1073003 m!991975))

(declare-fun m!991977 () Bool)

(assert (=> b!1073003 m!991977))

(declare-fun m!991979 () Bool)

(assert (=> b!1072999 m!991979))

(declare-fun m!991981 () Bool)

(assert (=> b!1072999 m!991981))

(declare-fun m!991983 () Bool)

(assert (=> b!1072999 m!991983))

(declare-fun m!991985 () Bool)

(assert (=> b!1072999 m!991985))

(declare-fun m!991987 () Bool)

(assert (=> b!1072999 m!991987))

(declare-fun m!991989 () Bool)

(assert (=> b!1072999 m!991989))

(declare-fun m!991991 () Bool)

(assert (=> b!1072999 m!991991))

(declare-fun m!991993 () Bool)

(assert (=> b!1072999 m!991993))

(assert (=> b!1072999 m!991979))

(declare-fun m!991995 () Bool)

(assert (=> b!1072999 m!991995))

(declare-fun m!991997 () Bool)

(assert (=> b!1072999 m!991997))

(declare-fun m!991999 () Bool)

(assert (=> b!1073002 m!991999))

(check-sat (not mapNonEmpty!40462) tp_is_empty!25837 (not b!1073001) (not b!1073003) (not b!1072999) b_and!34867 (not start!95010) (not b!1072998) (not b_next!22027) (not b!1073002))
(check-sat b_and!34867 (not b_next!22027))
(get-model)

(declare-fun d!129769 () Bool)

(assert (=> d!129769 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95010 d!129769))

(declare-fun d!129771 () Bool)

(assert (=> d!129771 (= (array_inv!25572 _values!955) (bvsge (size!33571 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95010 d!129771))

(declare-fun d!129773 () Bool)

(assert (=> d!129773 (= (array_inv!25573 _keys!1163) (bvsge (size!33570 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95010 d!129773))

(declare-fun d!129775 () Bool)

(assert (=> d!129775 (= (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475009 () Unit!35273)

(declare-fun choose!1745 (array!68687 array!68689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39585 V!39585 V!39585 V!39585 (_ BitVec 32) Int) Unit!35273)

(assert (=> d!129775 (= lt!475009 (choose!1745 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129775 (validMask!0 mask!1515)))

(assert (=> d!129775 (= (lemmaNoChangeToArrayThenSameMapNoExtras!852 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475009)))

(declare-fun bs!31595 () Bool)

(assert (= bs!31595 d!129775))

(assert (=> bs!31595 m!991977))

(assert (=> bs!31595 m!991975))

(declare-fun m!992081 () Bool)

(assert (=> bs!31595 m!992081))

(assert (=> bs!31595 m!991963))

(assert (=> b!1073003 d!129775))

(declare-fun b!1073092 () Bool)

(declare-fun e!612900 () Bool)

(declare-fun e!612899 () Bool)

(assert (=> b!1073092 (= e!612900 e!612899)))

(assert (=> b!1073092 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(declare-fun res!715474 () Bool)

(declare-fun lt!475028 () ListLongMap!14459)

(declare-fun contains!6346 (ListLongMap!14459 (_ BitVec 64)) Bool)

(assert (=> b!1073092 (= res!715474 (contains!6346 lt!475028 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073092 (=> (not res!715474) (not e!612899))))

(declare-fun b!1073093 () Bool)

(declare-fun e!612901 () ListLongMap!14459)

(declare-fun e!612905 () ListLongMap!14459)

(assert (=> b!1073093 (= e!612901 e!612905)))

(declare-fun c!108071 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1073093 (= c!108071 (validKeyInArray!0 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun e!612904 () Bool)

(declare-fun b!1073094 () Bool)

(assert (=> b!1073094 (= e!612904 (= lt!475028 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1073095 () Bool)

(declare-fun call!45271 () ListLongMap!14459)

(assert (=> b!1073095 (= e!612905 call!45271)))

(declare-fun b!1073096 () Bool)

(declare-fun lt!475027 () Unit!35273)

(declare-fun lt!475026 () Unit!35273)

(assert (=> b!1073096 (= lt!475027 lt!475026)))

(declare-fun lt!475030 () (_ BitVec 64))

(declare-fun lt!475025 () (_ BitVec 64))

(declare-fun lt!475029 () ListLongMap!14459)

(declare-fun lt!475024 () V!39585)

(assert (=> b!1073096 (not (contains!6346 (+!3208 lt!475029 (tuple2!16483 lt!475025 lt!475024)) lt!475030))))

(declare-fun addStillNotContains!260 (ListLongMap!14459 (_ BitVec 64) V!39585 (_ BitVec 64)) Unit!35273)

(assert (=> b!1073096 (= lt!475026 (addStillNotContains!260 lt!475029 lt!475025 lt!475024 lt!475030))))

(assert (=> b!1073096 (= lt!475030 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17197 (ValueCell!12215 V!39585) V!39585)

(declare-fun dynLambda!2054 (Int (_ BitVec 64)) V!39585)

(assert (=> b!1073096 (= lt!475024 (get!17197 (select (arr!33034 _values!955) #b00000000000000000000000000000000) (dynLambda!2054 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1073096 (= lt!475025 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1073096 (= lt!475029 call!45271)))

(assert (=> b!1073096 (= e!612905 (+!3208 call!45271 (tuple2!16483 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000) (get!17197 (select (arr!33034 _values!955) #b00000000000000000000000000000000) (dynLambda!2054 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1073098 () Bool)

(declare-fun e!612902 () Bool)

(assert (=> b!1073098 (= e!612902 e!612900)))

(declare-fun c!108069 () Bool)

(declare-fun e!612903 () Bool)

(assert (=> b!1073098 (= c!108069 e!612903)))

(declare-fun res!715476 () Bool)

(assert (=> b!1073098 (=> (not res!715476) (not e!612903))))

(assert (=> b!1073098 (= res!715476 (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(declare-fun b!1073099 () Bool)

(declare-fun isEmpty!952 (ListLongMap!14459) Bool)

(assert (=> b!1073099 (= e!612904 (isEmpty!952 lt!475028))))

(declare-fun bm!45268 () Bool)

(assert (=> bm!45268 (= call!45271 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1073100 () Bool)

(assert (=> b!1073100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(assert (=> b!1073100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33571 _values!955)))))

(declare-fun apply!939 (ListLongMap!14459 (_ BitVec 64)) V!39585)

(assert (=> b!1073100 (= e!612899 (= (apply!939 lt!475028 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)) (get!17197 (select (arr!33034 _values!955) #b00000000000000000000000000000000) (dynLambda!2054 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1073101 () Bool)

(assert (=> b!1073101 (= e!612901 (ListLongMap!14460 Nil!23038))))

(declare-fun b!1073102 () Bool)

(assert (=> b!1073102 (= e!612900 e!612904)))

(declare-fun c!108068 () Bool)

(assert (=> b!1073102 (= c!108068 (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(declare-fun b!1073103 () Bool)

(assert (=> b!1073103 (= e!612903 (validKeyInArray!0 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073103 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1073097 () Bool)

(declare-fun res!715475 () Bool)

(assert (=> b!1073097 (=> (not res!715475) (not e!612902))))

(assert (=> b!1073097 (= res!715475 (not (contains!6346 lt!475028 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129777 () Bool)

(assert (=> d!129777 e!612902))

(declare-fun res!715477 () Bool)

(assert (=> d!129777 (=> (not res!715477) (not e!612902))))

(assert (=> d!129777 (= res!715477 (not (contains!6346 lt!475028 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129777 (= lt!475028 e!612901)))

(declare-fun c!108070 () Bool)

(assert (=> d!129777 (= c!108070 (bvsge #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(assert (=> d!129777 (validMask!0 mask!1515)))

(assert (=> d!129777 (= (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475028)))

(assert (= (and d!129777 c!108070) b!1073101))

(assert (= (and d!129777 (not c!108070)) b!1073093))

(assert (= (and b!1073093 c!108071) b!1073096))

(assert (= (and b!1073093 (not c!108071)) b!1073095))

(assert (= (or b!1073096 b!1073095) bm!45268))

(assert (= (and d!129777 res!715477) b!1073097))

(assert (= (and b!1073097 res!715475) b!1073098))

(assert (= (and b!1073098 res!715476) b!1073103))

(assert (= (and b!1073098 c!108069) b!1073092))

(assert (= (and b!1073098 (not c!108069)) b!1073102))

(assert (= (and b!1073092 res!715474) b!1073100))

(assert (= (and b!1073102 c!108068) b!1073094))

(assert (= (and b!1073102 (not c!108068)) b!1073099))

(declare-fun b_lambda!16687 () Bool)

(assert (=> (not b_lambda!16687) (not b!1073096)))

(declare-fun t!32371 () Bool)

(declare-fun tb!7147 () Bool)

(assert (=> (and start!95010 (= defaultEntry!963 defaultEntry!963) t!32371) tb!7147))

(declare-fun result!14765 () Bool)

(assert (=> tb!7147 (= result!14765 tp_is_empty!25837)))

(assert (=> b!1073096 t!32371))

(declare-fun b_and!34873 () Bool)

(assert (= b_and!34867 (and (=> t!32371 result!14765) b_and!34873)))

(declare-fun b_lambda!16689 () Bool)

(assert (=> (not b_lambda!16689) (not b!1073100)))

(assert (=> b!1073100 t!32371))

(declare-fun b_and!34875 () Bool)

(assert (= b_and!34873 (and (=> t!32371 result!14765) b_and!34875)))

(declare-fun m!992083 () Bool)

(assert (=> b!1073097 m!992083))

(declare-fun m!992085 () Bool)

(assert (=> d!129777 m!992085))

(assert (=> d!129777 m!991963))

(declare-fun m!992087 () Bool)

(assert (=> b!1073103 m!992087))

(assert (=> b!1073103 m!992087))

(declare-fun m!992089 () Bool)

(assert (=> b!1073103 m!992089))

(declare-fun m!992091 () Bool)

(assert (=> b!1073100 m!992091))

(declare-fun m!992093 () Bool)

(assert (=> b!1073100 m!992093))

(declare-fun m!992095 () Bool)

(assert (=> b!1073100 m!992095))

(assert (=> b!1073100 m!992093))

(assert (=> b!1073100 m!992087))

(assert (=> b!1073100 m!992091))

(assert (=> b!1073100 m!992087))

(declare-fun m!992097 () Bool)

(assert (=> b!1073100 m!992097))

(assert (=> b!1073096 m!992091))

(assert (=> b!1073096 m!992093))

(assert (=> b!1073096 m!992095))

(declare-fun m!992099 () Bool)

(assert (=> b!1073096 m!992099))

(assert (=> b!1073096 m!992087))

(declare-fun m!992101 () Bool)

(assert (=> b!1073096 m!992101))

(declare-fun m!992103 () Bool)

(assert (=> b!1073096 m!992103))

(assert (=> b!1073096 m!992091))

(assert (=> b!1073096 m!992101))

(declare-fun m!992105 () Bool)

(assert (=> b!1073096 m!992105))

(assert (=> b!1073096 m!992093))

(declare-fun m!992107 () Bool)

(assert (=> b!1073099 m!992107))

(declare-fun m!992109 () Bool)

(assert (=> bm!45268 m!992109))

(assert (=> b!1073092 m!992087))

(assert (=> b!1073092 m!992087))

(declare-fun m!992111 () Bool)

(assert (=> b!1073092 m!992111))

(assert (=> b!1073094 m!992109))

(assert (=> b!1073093 m!992087))

(assert (=> b!1073093 m!992087))

(assert (=> b!1073093 m!992089))

(assert (=> b!1073003 d!129777))

(declare-fun b!1073106 () Bool)

(declare-fun e!612907 () Bool)

(declare-fun e!612906 () Bool)

(assert (=> b!1073106 (= e!612907 e!612906)))

(assert (=> b!1073106 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(declare-fun res!715478 () Bool)

(declare-fun lt!475035 () ListLongMap!14459)

(assert (=> b!1073106 (= res!715478 (contains!6346 lt!475035 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073106 (=> (not res!715478) (not e!612906))))

(declare-fun b!1073107 () Bool)

(declare-fun e!612908 () ListLongMap!14459)

(declare-fun e!612912 () ListLongMap!14459)

(assert (=> b!1073107 (= e!612908 e!612912)))

(declare-fun c!108075 () Bool)

(assert (=> b!1073107 (= c!108075 (validKeyInArray!0 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun e!612911 () Bool)

(declare-fun b!1073108 () Bool)

(assert (=> b!1073108 (= e!612911 (= lt!475035 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1073109 () Bool)

(declare-fun call!45272 () ListLongMap!14459)

(assert (=> b!1073109 (= e!612912 call!45272)))

(declare-fun b!1073110 () Bool)

(declare-fun lt!475034 () Unit!35273)

(declare-fun lt!475033 () Unit!35273)

(assert (=> b!1073110 (= lt!475034 lt!475033)))

(declare-fun lt!475031 () V!39585)

(declare-fun lt!475036 () ListLongMap!14459)

(declare-fun lt!475032 () (_ BitVec 64))

(declare-fun lt!475037 () (_ BitVec 64))

(assert (=> b!1073110 (not (contains!6346 (+!3208 lt!475036 (tuple2!16483 lt!475032 lt!475031)) lt!475037))))

(assert (=> b!1073110 (= lt!475033 (addStillNotContains!260 lt!475036 lt!475032 lt!475031 lt!475037))))

(assert (=> b!1073110 (= lt!475037 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1073110 (= lt!475031 (get!17197 (select (arr!33034 _values!955) #b00000000000000000000000000000000) (dynLambda!2054 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1073110 (= lt!475032 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1073110 (= lt!475036 call!45272)))

(assert (=> b!1073110 (= e!612912 (+!3208 call!45272 (tuple2!16483 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000) (get!17197 (select (arr!33034 _values!955) #b00000000000000000000000000000000) (dynLambda!2054 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1073112 () Bool)

(declare-fun e!612909 () Bool)

(assert (=> b!1073112 (= e!612909 e!612907)))

(declare-fun c!108073 () Bool)

(declare-fun e!612910 () Bool)

(assert (=> b!1073112 (= c!108073 e!612910)))

(declare-fun res!715480 () Bool)

(assert (=> b!1073112 (=> (not res!715480) (not e!612910))))

(assert (=> b!1073112 (= res!715480 (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(declare-fun b!1073113 () Bool)

(assert (=> b!1073113 (= e!612911 (isEmpty!952 lt!475035))))

(declare-fun bm!45269 () Bool)

(assert (=> bm!45269 (= call!45272 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1073114 () Bool)

(assert (=> b!1073114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(assert (=> b!1073114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33571 _values!955)))))

(assert (=> b!1073114 (= e!612906 (= (apply!939 lt!475035 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)) (get!17197 (select (arr!33034 _values!955) #b00000000000000000000000000000000) (dynLambda!2054 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1073115 () Bool)

(assert (=> b!1073115 (= e!612908 (ListLongMap!14460 Nil!23038))))

(declare-fun b!1073116 () Bool)

(assert (=> b!1073116 (= e!612907 e!612911)))

(declare-fun c!108072 () Bool)

(assert (=> b!1073116 (= c!108072 (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(declare-fun b!1073117 () Bool)

(assert (=> b!1073117 (= e!612910 (validKeyInArray!0 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073117 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1073111 () Bool)

(declare-fun res!715479 () Bool)

(assert (=> b!1073111 (=> (not res!715479) (not e!612909))))

(assert (=> b!1073111 (= res!715479 (not (contains!6346 lt!475035 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129779 () Bool)

(assert (=> d!129779 e!612909))

(declare-fun res!715481 () Bool)

(assert (=> d!129779 (=> (not res!715481) (not e!612909))))

(assert (=> d!129779 (= res!715481 (not (contains!6346 lt!475035 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129779 (= lt!475035 e!612908)))

(declare-fun c!108074 () Bool)

(assert (=> d!129779 (= c!108074 (bvsge #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(assert (=> d!129779 (validMask!0 mask!1515)))

(assert (=> d!129779 (= (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475035)))

(assert (= (and d!129779 c!108074) b!1073115))

(assert (= (and d!129779 (not c!108074)) b!1073107))

(assert (= (and b!1073107 c!108075) b!1073110))

(assert (= (and b!1073107 (not c!108075)) b!1073109))

(assert (= (or b!1073110 b!1073109) bm!45269))

(assert (= (and d!129779 res!715481) b!1073111))

(assert (= (and b!1073111 res!715479) b!1073112))

(assert (= (and b!1073112 res!715480) b!1073117))

(assert (= (and b!1073112 c!108073) b!1073106))

(assert (= (and b!1073112 (not c!108073)) b!1073116))

(assert (= (and b!1073106 res!715478) b!1073114))

(assert (= (and b!1073116 c!108072) b!1073108))

(assert (= (and b!1073116 (not c!108072)) b!1073113))

(declare-fun b_lambda!16691 () Bool)

(assert (=> (not b_lambda!16691) (not b!1073110)))

(assert (=> b!1073110 t!32371))

(declare-fun b_and!34877 () Bool)

(assert (= b_and!34875 (and (=> t!32371 result!14765) b_and!34877)))

(declare-fun b_lambda!16693 () Bool)

(assert (=> (not b_lambda!16693) (not b!1073114)))

(assert (=> b!1073114 t!32371))

(declare-fun b_and!34879 () Bool)

(assert (= b_and!34877 (and (=> t!32371 result!14765) b_and!34879)))

(declare-fun m!992113 () Bool)

(assert (=> b!1073111 m!992113))

(declare-fun m!992115 () Bool)

(assert (=> d!129779 m!992115))

(assert (=> d!129779 m!991963))

(assert (=> b!1073117 m!992087))

(assert (=> b!1073117 m!992087))

(assert (=> b!1073117 m!992089))

(assert (=> b!1073114 m!992091))

(assert (=> b!1073114 m!992093))

(assert (=> b!1073114 m!992095))

(assert (=> b!1073114 m!992093))

(assert (=> b!1073114 m!992087))

(assert (=> b!1073114 m!992091))

(assert (=> b!1073114 m!992087))

(declare-fun m!992117 () Bool)

(assert (=> b!1073114 m!992117))

(assert (=> b!1073110 m!992091))

(assert (=> b!1073110 m!992093))

(assert (=> b!1073110 m!992095))

(declare-fun m!992119 () Bool)

(assert (=> b!1073110 m!992119))

(assert (=> b!1073110 m!992087))

(declare-fun m!992121 () Bool)

(assert (=> b!1073110 m!992121))

(declare-fun m!992123 () Bool)

(assert (=> b!1073110 m!992123))

(assert (=> b!1073110 m!992091))

(assert (=> b!1073110 m!992121))

(declare-fun m!992125 () Bool)

(assert (=> b!1073110 m!992125))

(assert (=> b!1073110 m!992093))

(declare-fun m!992127 () Bool)

(assert (=> b!1073113 m!992127))

(declare-fun m!992129 () Bool)

(assert (=> bm!45269 m!992129))

(assert (=> b!1073106 m!992087))

(assert (=> b!1073106 m!992087))

(declare-fun m!992131 () Bool)

(assert (=> b!1073106 m!992131))

(assert (=> b!1073108 m!992129))

(assert (=> b!1073107 m!992087))

(assert (=> b!1073107 m!992087))

(assert (=> b!1073107 m!992089))

(assert (=> b!1073003 d!129779))

(declare-fun d!129781 () Bool)

(declare-fun e!612915 () Bool)

(assert (=> d!129781 e!612915))

(declare-fun res!715487 () Bool)

(assert (=> d!129781 (=> (not res!715487) (not e!612915))))

(declare-fun lt!475046 () ListLongMap!14459)

(assert (=> d!129781 (= res!715487 (contains!6346 lt!475046 (_1!8252 lt!474928)))))

(declare-fun lt!475049 () List!23041)

(assert (=> d!129781 (= lt!475046 (ListLongMap!14460 lt!475049))))

(declare-fun lt!475048 () Unit!35273)

(declare-fun lt!475047 () Unit!35273)

(assert (=> d!129781 (= lt!475048 lt!475047)))

(declare-datatypes ((Option!650 0))(
  ( (Some!649 (v!15584 V!39585)) (None!648) )
))
(declare-fun getValueByKey!599 (List!23041 (_ BitVec 64)) Option!650)

(assert (=> d!129781 (= (getValueByKey!599 lt!475049 (_1!8252 lt!474928)) (Some!649 (_2!8252 lt!474928)))))

(declare-fun lemmaContainsTupThenGetReturnValue!285 (List!23041 (_ BitVec 64) V!39585) Unit!35273)

(assert (=> d!129781 (= lt!475047 (lemmaContainsTupThenGetReturnValue!285 lt!475049 (_1!8252 lt!474928) (_2!8252 lt!474928)))))

(declare-fun insertStrictlySorted!378 (List!23041 (_ BitVec 64) V!39585) List!23041)

(assert (=> d!129781 (= lt!475049 (insertStrictlySorted!378 (toList!7245 lt!474930) (_1!8252 lt!474928) (_2!8252 lt!474928)))))

(assert (=> d!129781 (= (+!3208 lt!474930 lt!474928) lt!475046)))

(declare-fun b!1073122 () Bool)

(declare-fun res!715486 () Bool)

(assert (=> b!1073122 (=> (not res!715486) (not e!612915))))

(assert (=> b!1073122 (= res!715486 (= (getValueByKey!599 (toList!7245 lt!475046) (_1!8252 lt!474928)) (Some!649 (_2!8252 lt!474928))))))

(declare-fun b!1073123 () Bool)

(declare-fun contains!6347 (List!23041 tuple2!16482) Bool)

(assert (=> b!1073123 (= e!612915 (contains!6347 (toList!7245 lt!475046) lt!474928))))

(assert (= (and d!129781 res!715487) b!1073122))

(assert (= (and b!1073122 res!715486) b!1073123))

(declare-fun m!992133 () Bool)

(assert (=> d!129781 m!992133))

(declare-fun m!992135 () Bool)

(assert (=> d!129781 m!992135))

(declare-fun m!992137 () Bool)

(assert (=> d!129781 m!992137))

(declare-fun m!992139 () Bool)

(assert (=> d!129781 m!992139))

(declare-fun m!992141 () Bool)

(assert (=> b!1073122 m!992141))

(declare-fun m!992143 () Bool)

(assert (=> b!1073123 m!992143))

(assert (=> b!1073002 d!129781))

(declare-fun d!129783 () Bool)

(declare-fun e!612916 () Bool)

(assert (=> d!129783 e!612916))

(declare-fun res!715489 () Bool)

(assert (=> d!129783 (=> (not res!715489) (not e!612916))))

(declare-fun lt!475050 () ListLongMap!14459)

(assert (=> d!129783 (= res!715489 (contains!6346 lt!475050 (_1!8252 lt!474928)))))

(declare-fun lt!475053 () List!23041)

(assert (=> d!129783 (= lt!475050 (ListLongMap!14460 lt!475053))))

(declare-fun lt!475052 () Unit!35273)

(declare-fun lt!475051 () Unit!35273)

(assert (=> d!129783 (= lt!475052 lt!475051)))

(assert (=> d!129783 (= (getValueByKey!599 lt!475053 (_1!8252 lt!474928)) (Some!649 (_2!8252 lt!474928)))))

(assert (=> d!129783 (= lt!475051 (lemmaContainsTupThenGetReturnValue!285 lt!475053 (_1!8252 lt!474928) (_2!8252 lt!474928)))))

(assert (=> d!129783 (= lt!475053 (insertStrictlySorted!378 (toList!7245 lt!474933) (_1!8252 lt!474928) (_2!8252 lt!474928)))))

(assert (=> d!129783 (= (+!3208 lt!474933 lt!474928) lt!475050)))

(declare-fun b!1073124 () Bool)

(declare-fun res!715488 () Bool)

(assert (=> b!1073124 (=> (not res!715488) (not e!612916))))

(assert (=> b!1073124 (= res!715488 (= (getValueByKey!599 (toList!7245 lt!475050) (_1!8252 lt!474928)) (Some!649 (_2!8252 lt!474928))))))

(declare-fun b!1073125 () Bool)

(assert (=> b!1073125 (= e!612916 (contains!6347 (toList!7245 lt!475050) lt!474928))))

(assert (= (and d!129783 res!715489) b!1073124))

(assert (= (and b!1073124 res!715488) b!1073125))

(declare-fun m!992145 () Bool)

(assert (=> d!129783 m!992145))

(declare-fun m!992147 () Bool)

(assert (=> d!129783 m!992147))

(declare-fun m!992149 () Bool)

(assert (=> d!129783 m!992149))

(declare-fun m!992151 () Bool)

(assert (=> d!129783 m!992151))

(declare-fun m!992153 () Bool)

(assert (=> b!1073124 m!992153))

(declare-fun m!992155 () Bool)

(assert (=> b!1073125 m!992155))

(assert (=> b!1072999 d!129783))

(declare-fun b!1073168 () Bool)

(declare-fun e!612946 () Bool)

(declare-fun call!45287 () Bool)

(assert (=> b!1073168 (= e!612946 (not call!45287))))

(declare-fun b!1073169 () Bool)

(declare-fun e!612943 () ListLongMap!14459)

(declare-fun call!45289 () ListLongMap!14459)

(assert (=> b!1073169 (= e!612943 call!45289)))

(declare-fun b!1073170 () Bool)

(declare-fun e!612945 () Bool)

(declare-fun e!612947 () Bool)

(assert (=> b!1073170 (= e!612945 e!612947)))

(declare-fun res!715515 () Bool)

(declare-fun call!45291 () Bool)

(assert (=> b!1073170 (= res!715515 call!45291)))

(assert (=> b!1073170 (=> (not res!715515) (not e!612947))))

(declare-fun b!1073171 () Bool)

(declare-fun e!612951 () ListLongMap!14459)

(declare-fun call!45292 () ListLongMap!14459)

(assert (=> b!1073171 (= e!612951 call!45292)))

(declare-fun b!1073172 () Bool)

(declare-fun e!612948 () Bool)

(assert (=> b!1073172 (= e!612948 (validKeyInArray!0 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073173 () Bool)

(declare-fun e!612949 () Bool)

(declare-fun lt!475102 () ListLongMap!14459)

(assert (=> b!1073173 (= e!612949 (= (apply!939 lt!475102 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45284 () Bool)

(declare-fun call!45293 () ListLongMap!14459)

(declare-fun call!45288 () ListLongMap!14459)

(assert (=> bm!45284 (= call!45293 call!45288)))

(declare-fun b!1073174 () Bool)

(declare-fun e!612944 () Unit!35273)

(declare-fun lt!475117 () Unit!35273)

(assert (=> b!1073174 (= e!612944 lt!475117)))

(declare-fun lt!475105 () ListLongMap!14459)

(assert (=> b!1073174 (= lt!475105 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475113 () (_ BitVec 64))

(assert (=> b!1073174 (= lt!475113 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475112 () (_ BitVec 64))

(assert (=> b!1073174 (= lt!475112 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475104 () Unit!35273)

(declare-fun addStillContains!644 (ListLongMap!14459 (_ BitVec 64) V!39585 (_ BitVec 64)) Unit!35273)

(assert (=> b!1073174 (= lt!475104 (addStillContains!644 lt!475105 lt!475113 zeroValueAfter!47 lt!475112))))

(assert (=> b!1073174 (contains!6346 (+!3208 lt!475105 (tuple2!16483 lt!475113 zeroValueAfter!47)) lt!475112)))

(declare-fun lt!475106 () Unit!35273)

(assert (=> b!1073174 (= lt!475106 lt!475104)))

(declare-fun lt!475108 () ListLongMap!14459)

(assert (=> b!1073174 (= lt!475108 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475119 () (_ BitVec 64))

(assert (=> b!1073174 (= lt!475119 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475111 () (_ BitVec 64))

(assert (=> b!1073174 (= lt!475111 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475098 () Unit!35273)

(declare-fun addApplyDifferent!500 (ListLongMap!14459 (_ BitVec 64) V!39585 (_ BitVec 64)) Unit!35273)

(assert (=> b!1073174 (= lt!475098 (addApplyDifferent!500 lt!475108 lt!475119 minValue!907 lt!475111))))

(assert (=> b!1073174 (= (apply!939 (+!3208 lt!475108 (tuple2!16483 lt!475119 minValue!907)) lt!475111) (apply!939 lt!475108 lt!475111))))

(declare-fun lt!475101 () Unit!35273)

(assert (=> b!1073174 (= lt!475101 lt!475098)))

(declare-fun lt!475110 () ListLongMap!14459)

(assert (=> b!1073174 (= lt!475110 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475103 () (_ BitVec 64))

(assert (=> b!1073174 (= lt!475103 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475118 () (_ BitVec 64))

(assert (=> b!1073174 (= lt!475118 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475100 () Unit!35273)

(assert (=> b!1073174 (= lt!475100 (addApplyDifferent!500 lt!475110 lt!475103 zeroValueAfter!47 lt!475118))))

(assert (=> b!1073174 (= (apply!939 (+!3208 lt!475110 (tuple2!16483 lt!475103 zeroValueAfter!47)) lt!475118) (apply!939 lt!475110 lt!475118))))

(declare-fun lt!475109 () Unit!35273)

(assert (=> b!1073174 (= lt!475109 lt!475100)))

(declare-fun lt!475099 () ListLongMap!14459)

(assert (=> b!1073174 (= lt!475099 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475116 () (_ BitVec 64))

(assert (=> b!1073174 (= lt!475116 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475115 () (_ BitVec 64))

(assert (=> b!1073174 (= lt!475115 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1073174 (= lt!475117 (addApplyDifferent!500 lt!475099 lt!475116 minValue!907 lt!475115))))

(assert (=> b!1073174 (= (apply!939 (+!3208 lt!475099 (tuple2!16483 lt!475116 minValue!907)) lt!475115) (apply!939 lt!475099 lt!475115))))

(declare-fun b!1073175 () Bool)

(declare-fun Unit!35277 () Unit!35273)

(assert (=> b!1073175 (= e!612944 Unit!35277)))

(declare-fun b!1073176 () Bool)

(assert (=> b!1073176 (= e!612946 e!612949)))

(declare-fun res!715516 () Bool)

(assert (=> b!1073176 (= res!715516 call!45287)))

(assert (=> b!1073176 (=> (not res!715516) (not e!612949))))

(declare-fun b!1073177 () Bool)

(declare-fun e!612954 () ListLongMap!14459)

(assert (=> b!1073177 (= e!612954 e!612951)))

(declare-fun c!108090 () Bool)

(assert (=> b!1073177 (= c!108090 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1073178 () Bool)

(assert (=> b!1073178 (= e!612945 (not call!45291))))

(declare-fun bm!45285 () Bool)

(assert (=> bm!45285 (= call!45291 (contains!6346 lt!475102 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!129785 () Bool)

(declare-fun e!612952 () Bool)

(assert (=> d!129785 e!612952))

(declare-fun res!715514 () Bool)

(assert (=> d!129785 (=> (not res!715514) (not e!612952))))

(assert (=> d!129785 (= res!715514 (or (bvsge #b00000000000000000000000000000000 (size!33570 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))))

(declare-fun lt!475114 () ListLongMap!14459)

(assert (=> d!129785 (= lt!475102 lt!475114)))

(declare-fun lt!475107 () Unit!35273)

(assert (=> d!129785 (= lt!475107 e!612944)))

(declare-fun c!108092 () Bool)

(declare-fun e!612953 () Bool)

(assert (=> d!129785 (= c!108092 e!612953)))

(declare-fun res!715511 () Bool)

(assert (=> d!129785 (=> (not res!715511) (not e!612953))))

(assert (=> d!129785 (= res!715511 (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(assert (=> d!129785 (= lt!475114 e!612954)))

(declare-fun c!108091 () Bool)

(assert (=> d!129785 (= c!108091 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129785 (validMask!0 mask!1515)))

(assert (=> d!129785 (= (getCurrentListMap!4139 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475102)))

(declare-fun call!45290 () ListLongMap!14459)

(declare-fun bm!45286 () Bool)

(assert (=> bm!45286 (= call!45290 (+!3208 (ite c!108091 call!45288 (ite c!108090 call!45293 call!45289)) (ite (or c!108091 c!108090) (tuple2!16483 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16483 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1073179 () Bool)

(declare-fun e!612955 () Bool)

(declare-fun e!612950 () Bool)

(assert (=> b!1073179 (= e!612955 e!612950)))

(declare-fun res!715512 () Bool)

(assert (=> b!1073179 (=> (not res!715512) (not e!612950))))

(assert (=> b!1073179 (= res!715512 (contains!6346 lt!475102 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073179 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(declare-fun b!1073180 () Bool)

(assert (=> b!1073180 (= e!612950 (= (apply!939 lt!475102 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)) (get!17197 (select (arr!33034 _values!955) #b00000000000000000000000000000000) (dynLambda!2054 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1073180 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33571 _values!955)))))

(assert (=> b!1073180 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(declare-fun bm!45287 () Bool)

(assert (=> bm!45287 (= call!45292 call!45290)))

(declare-fun b!1073181 () Bool)

(assert (=> b!1073181 (= e!612953 (validKeyInArray!0 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45288 () Bool)

(assert (=> bm!45288 (= call!45289 call!45293)))

(declare-fun b!1073182 () Bool)

(assert (=> b!1073182 (= e!612952 e!612946)))

(declare-fun c!108089 () Bool)

(assert (=> b!1073182 (= c!108089 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1073183 () Bool)

(assert (=> b!1073183 (= e!612954 (+!3208 call!45290 (tuple2!16483 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1073184 () Bool)

(declare-fun res!715508 () Bool)

(assert (=> b!1073184 (=> (not res!715508) (not e!612952))))

(assert (=> b!1073184 (= res!715508 e!612945)))

(declare-fun c!108093 () Bool)

(assert (=> b!1073184 (= c!108093 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073185 () Bool)

(assert (=> b!1073185 (= e!612943 call!45292)))

(declare-fun b!1073186 () Bool)

(assert (=> b!1073186 (= e!612947 (= (apply!939 lt!475102 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1073187 () Bool)

(declare-fun res!715509 () Bool)

(assert (=> b!1073187 (=> (not res!715509) (not e!612952))))

(assert (=> b!1073187 (= res!715509 e!612955)))

(declare-fun res!715513 () Bool)

(assert (=> b!1073187 (=> res!715513 e!612955)))

(assert (=> b!1073187 (= res!715513 (not e!612948))))

(declare-fun res!715510 () Bool)

(assert (=> b!1073187 (=> (not res!715510) (not e!612948))))

(assert (=> b!1073187 (= res!715510 (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(declare-fun bm!45289 () Bool)

(assert (=> bm!45289 (= call!45287 (contains!6346 lt!475102 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45290 () Bool)

(assert (=> bm!45290 (= call!45288 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073188 () Bool)

(declare-fun c!108088 () Bool)

(assert (=> b!1073188 (= c!108088 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1073188 (= e!612951 e!612943)))

(assert (= (and d!129785 c!108091) b!1073183))

(assert (= (and d!129785 (not c!108091)) b!1073177))

(assert (= (and b!1073177 c!108090) b!1073171))

(assert (= (and b!1073177 (not c!108090)) b!1073188))

(assert (= (and b!1073188 c!108088) b!1073185))

(assert (= (and b!1073188 (not c!108088)) b!1073169))

(assert (= (or b!1073185 b!1073169) bm!45288))

(assert (= (or b!1073171 bm!45288) bm!45284))

(assert (= (or b!1073171 b!1073185) bm!45287))

(assert (= (or b!1073183 bm!45284) bm!45290))

(assert (= (or b!1073183 bm!45287) bm!45286))

(assert (= (and d!129785 res!715511) b!1073181))

(assert (= (and d!129785 c!108092) b!1073174))

(assert (= (and d!129785 (not c!108092)) b!1073175))

(assert (= (and d!129785 res!715514) b!1073187))

(assert (= (and b!1073187 res!715510) b!1073172))

(assert (= (and b!1073187 (not res!715513)) b!1073179))

(assert (= (and b!1073179 res!715512) b!1073180))

(assert (= (and b!1073187 res!715509) b!1073184))

(assert (= (and b!1073184 c!108093) b!1073170))

(assert (= (and b!1073184 (not c!108093)) b!1073178))

(assert (= (and b!1073170 res!715515) b!1073186))

(assert (= (or b!1073170 b!1073178) bm!45285))

(assert (= (and b!1073184 res!715508) b!1073182))

(assert (= (and b!1073182 c!108089) b!1073176))

(assert (= (and b!1073182 (not c!108089)) b!1073168))

(assert (= (and b!1073176 res!715516) b!1073173))

(assert (= (or b!1073176 b!1073168) bm!45289))

(declare-fun b_lambda!16695 () Bool)

(assert (=> (not b_lambda!16695) (not b!1073180)))

(assert (=> b!1073180 t!32371))

(declare-fun b_and!34881 () Bool)

(assert (= b_and!34879 (and (=> t!32371 result!14765) b_and!34881)))

(assert (=> b!1073172 m!992087))

(assert (=> b!1073172 m!992087))

(assert (=> b!1073172 m!992089))

(declare-fun m!992157 () Bool)

(assert (=> b!1073173 m!992157))

(assert (=> d!129785 m!991963))

(assert (=> bm!45290 m!991975))

(assert (=> b!1073174 m!992087))

(declare-fun m!992159 () Bool)

(assert (=> b!1073174 m!992159))

(declare-fun m!992161 () Bool)

(assert (=> b!1073174 m!992161))

(declare-fun m!992163 () Bool)

(assert (=> b!1073174 m!992163))

(declare-fun m!992165 () Bool)

(assert (=> b!1073174 m!992165))

(assert (=> b!1073174 m!992159))

(declare-fun m!992167 () Bool)

(assert (=> b!1073174 m!992167))

(declare-fun m!992169 () Bool)

(assert (=> b!1073174 m!992169))

(assert (=> b!1073174 m!992163))

(declare-fun m!992171 () Bool)

(assert (=> b!1073174 m!992171))

(declare-fun m!992173 () Bool)

(assert (=> b!1073174 m!992173))

(declare-fun m!992175 () Bool)

(assert (=> b!1073174 m!992175))

(declare-fun m!992177 () Bool)

(assert (=> b!1073174 m!992177))

(declare-fun m!992179 () Bool)

(assert (=> b!1073174 m!992179))

(declare-fun m!992181 () Bool)

(assert (=> b!1073174 m!992181))

(declare-fun m!992183 () Bool)

(assert (=> b!1073174 m!992183))

(assert (=> b!1073174 m!992177))

(assert (=> b!1073174 m!992183))

(declare-fun m!992185 () Bool)

(assert (=> b!1073174 m!992185))

(declare-fun m!992187 () Bool)

(assert (=> b!1073174 m!992187))

(assert (=> b!1073174 m!991975))

(assert (=> b!1073179 m!992087))

(assert (=> b!1073179 m!992087))

(declare-fun m!992189 () Bool)

(assert (=> b!1073179 m!992189))

(declare-fun m!992191 () Bool)

(assert (=> bm!45289 m!992191))

(assert (=> b!1073181 m!992087))

(assert (=> b!1073181 m!992087))

(assert (=> b!1073181 m!992089))

(declare-fun m!992193 () Bool)

(assert (=> bm!45286 m!992193))

(declare-fun m!992195 () Bool)

(assert (=> bm!45285 m!992195))

(declare-fun m!992197 () Bool)

(assert (=> b!1073183 m!992197))

(declare-fun m!992199 () Bool)

(assert (=> b!1073186 m!992199))

(assert (=> b!1073180 m!992087))

(declare-fun m!992201 () Bool)

(assert (=> b!1073180 m!992201))

(assert (=> b!1073180 m!992087))

(assert (=> b!1073180 m!992091))

(assert (=> b!1073180 m!992091))

(assert (=> b!1073180 m!992093))

(assert (=> b!1073180 m!992095))

(assert (=> b!1073180 m!992093))

(assert (=> b!1072999 d!129785))

(declare-fun d!129787 () Bool)

(declare-fun e!612956 () Bool)

(assert (=> d!129787 e!612956))

(declare-fun res!715518 () Bool)

(assert (=> d!129787 (=> (not res!715518) (not e!612956))))

(declare-fun lt!475120 () ListLongMap!14459)

(assert (=> d!129787 (= res!715518 (contains!6346 lt!475120 (_1!8252 lt!474934)))))

(declare-fun lt!475123 () List!23041)

(assert (=> d!129787 (= lt!475120 (ListLongMap!14460 lt!475123))))

(declare-fun lt!475122 () Unit!35273)

(declare-fun lt!475121 () Unit!35273)

(assert (=> d!129787 (= lt!475122 lt!475121)))

(assert (=> d!129787 (= (getValueByKey!599 lt!475123 (_1!8252 lt!474934)) (Some!649 (_2!8252 lt!474934)))))

(assert (=> d!129787 (= lt!475121 (lemmaContainsTupThenGetReturnValue!285 lt!475123 (_1!8252 lt!474934) (_2!8252 lt!474934)))))

(assert (=> d!129787 (= lt!475123 (insertStrictlySorted!378 (toList!7245 lt!474927) (_1!8252 lt!474934) (_2!8252 lt!474934)))))

(assert (=> d!129787 (= (+!3208 lt!474927 lt!474934) lt!475120)))

(declare-fun b!1073189 () Bool)

(declare-fun res!715517 () Bool)

(assert (=> b!1073189 (=> (not res!715517) (not e!612956))))

(assert (=> b!1073189 (= res!715517 (= (getValueByKey!599 (toList!7245 lt!475120) (_1!8252 lt!474934)) (Some!649 (_2!8252 lt!474934))))))

(declare-fun b!1073190 () Bool)

(assert (=> b!1073190 (= e!612956 (contains!6347 (toList!7245 lt!475120) lt!474934))))

(assert (= (and d!129787 res!715518) b!1073189))

(assert (= (and b!1073189 res!715517) b!1073190))

(declare-fun m!992203 () Bool)

(assert (=> d!129787 m!992203))

(declare-fun m!992205 () Bool)

(assert (=> d!129787 m!992205))

(declare-fun m!992207 () Bool)

(assert (=> d!129787 m!992207))

(declare-fun m!992209 () Bool)

(assert (=> d!129787 m!992209))

(declare-fun m!992211 () Bool)

(assert (=> b!1073189 m!992211))

(declare-fun m!992213 () Bool)

(assert (=> b!1073190 m!992213))

(assert (=> b!1072999 d!129787))

(declare-fun d!129789 () Bool)

(declare-fun e!612957 () Bool)

(assert (=> d!129789 e!612957))

(declare-fun res!715520 () Bool)

(assert (=> d!129789 (=> (not res!715520) (not e!612957))))

(declare-fun lt!475124 () ListLongMap!14459)

(assert (=> d!129789 (= res!715520 (contains!6346 lt!475124 (_1!8252 lt!474928)))))

(declare-fun lt!475127 () List!23041)

(assert (=> d!129789 (= lt!475124 (ListLongMap!14460 lt!475127))))

(declare-fun lt!475126 () Unit!35273)

(declare-fun lt!475125 () Unit!35273)

(assert (=> d!129789 (= lt!475126 lt!475125)))

(assert (=> d!129789 (= (getValueByKey!599 lt!475127 (_1!8252 lt!474928)) (Some!649 (_2!8252 lt!474928)))))

(assert (=> d!129789 (= lt!475125 (lemmaContainsTupThenGetReturnValue!285 lt!475127 (_1!8252 lt!474928) (_2!8252 lt!474928)))))

(assert (=> d!129789 (= lt!475127 (insertStrictlySorted!378 (toList!7245 (+!3208 lt!474933 lt!474934)) (_1!8252 lt!474928) (_2!8252 lt!474928)))))

(assert (=> d!129789 (= (+!3208 (+!3208 lt!474933 lt!474934) lt!474928) lt!475124)))

(declare-fun b!1073191 () Bool)

(declare-fun res!715519 () Bool)

(assert (=> b!1073191 (=> (not res!715519) (not e!612957))))

(assert (=> b!1073191 (= res!715519 (= (getValueByKey!599 (toList!7245 lt!475124) (_1!8252 lt!474928)) (Some!649 (_2!8252 lt!474928))))))

(declare-fun b!1073192 () Bool)

(assert (=> b!1073192 (= e!612957 (contains!6347 (toList!7245 lt!475124) lt!474928))))

(assert (= (and d!129789 res!715520) b!1073191))

(assert (= (and b!1073191 res!715519) b!1073192))

(declare-fun m!992215 () Bool)

(assert (=> d!129789 m!992215))

(declare-fun m!992217 () Bool)

(assert (=> d!129789 m!992217))

(declare-fun m!992219 () Bool)

(assert (=> d!129789 m!992219))

(declare-fun m!992221 () Bool)

(assert (=> d!129789 m!992221))

(declare-fun m!992223 () Bool)

(assert (=> b!1073191 m!992223))

(declare-fun m!992225 () Bool)

(assert (=> b!1073192 m!992225))

(assert (=> b!1072999 d!129789))

(declare-fun d!129791 () Bool)

(declare-fun lt!475130 () ListLongMap!14459)

(assert (=> d!129791 (not (contains!6346 lt!475130 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!72 (List!23041 (_ BitVec 64)) List!23041)

(assert (=> d!129791 (= lt!475130 (ListLongMap!14460 (removeStrictlySorted!72 (toList!7245 lt!474923) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129791 (= (-!678 lt!474923 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475130)))

(declare-fun bs!31596 () Bool)

(assert (= bs!31596 d!129791))

(declare-fun m!992227 () Bool)

(assert (=> bs!31596 m!992227))

(declare-fun m!992229 () Bool)

(assert (=> bs!31596 m!992229))

(assert (=> b!1072999 d!129791))

(declare-fun d!129793 () Bool)

(declare-fun lt!475131 () ListLongMap!14459)

(assert (=> d!129793 (not (contains!6346 lt!475131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129793 (= lt!475131 (ListLongMap!14460 (removeStrictlySorted!72 (toList!7245 lt!474932) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129793 (= (-!678 lt!474932 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475131)))

(declare-fun bs!31597 () Bool)

(assert (= bs!31597 d!129793))

(declare-fun m!992231 () Bool)

(assert (=> bs!31597 m!992231))

(declare-fun m!992233 () Bool)

(assert (=> bs!31597 m!992233))

(assert (=> b!1072999 d!129793))

(declare-fun d!129795 () Bool)

(declare-fun e!612958 () Bool)

(assert (=> d!129795 e!612958))

(declare-fun res!715522 () Bool)

(assert (=> d!129795 (=> (not res!715522) (not e!612958))))

(declare-fun lt!475132 () ListLongMap!14459)

(assert (=> d!129795 (= res!715522 (contains!6346 lt!475132 (_1!8252 lt!474934)))))

(declare-fun lt!475135 () List!23041)

(assert (=> d!129795 (= lt!475132 (ListLongMap!14460 lt!475135))))

(declare-fun lt!475134 () Unit!35273)

(declare-fun lt!475133 () Unit!35273)

(assert (=> d!129795 (= lt!475134 lt!475133)))

(assert (=> d!129795 (= (getValueByKey!599 lt!475135 (_1!8252 lt!474934)) (Some!649 (_2!8252 lt!474934)))))

(assert (=> d!129795 (= lt!475133 (lemmaContainsTupThenGetReturnValue!285 lt!475135 (_1!8252 lt!474934) (_2!8252 lt!474934)))))

(assert (=> d!129795 (= lt!475135 (insertStrictlySorted!378 (toList!7245 lt!474933) (_1!8252 lt!474934) (_2!8252 lt!474934)))))

(assert (=> d!129795 (= (+!3208 lt!474933 lt!474934) lt!475132)))

(declare-fun b!1073193 () Bool)

(declare-fun res!715521 () Bool)

(assert (=> b!1073193 (=> (not res!715521) (not e!612958))))

(assert (=> b!1073193 (= res!715521 (= (getValueByKey!599 (toList!7245 lt!475132) (_1!8252 lt!474934)) (Some!649 (_2!8252 lt!474934))))))

(declare-fun b!1073194 () Bool)

(assert (=> b!1073194 (= e!612958 (contains!6347 (toList!7245 lt!475132) lt!474934))))

(assert (= (and d!129795 res!715522) b!1073193))

(assert (= (and b!1073193 res!715521) b!1073194))

(declare-fun m!992235 () Bool)

(assert (=> d!129795 m!992235))

(declare-fun m!992237 () Bool)

(assert (=> d!129795 m!992237))

(declare-fun m!992239 () Bool)

(assert (=> d!129795 m!992239))

(declare-fun m!992241 () Bool)

(assert (=> d!129795 m!992241))

(declare-fun m!992243 () Bool)

(assert (=> b!1073193 m!992243))

(declare-fun m!992245 () Bool)

(assert (=> b!1073194 m!992245))

(assert (=> b!1072999 d!129795))

(declare-fun d!129797 () Bool)

(assert (=> d!129797 (= (-!678 (+!3208 lt!474927 (tuple2!16483 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!474927)))

(declare-fun lt!475138 () Unit!35273)

(declare-fun choose!1746 (ListLongMap!14459 (_ BitVec 64) V!39585) Unit!35273)

(assert (=> d!129797 (= lt!475138 (choose!1746 lt!474927 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> d!129797 (not (contains!6346 lt!474927 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129797 (= (addThenRemoveForNewKeyIsSame!53 lt!474927 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) lt!475138)))

(declare-fun bs!31598 () Bool)

(assert (= bs!31598 d!129797))

(declare-fun m!992247 () Bool)

(assert (=> bs!31598 m!992247))

(assert (=> bs!31598 m!992247))

(declare-fun m!992249 () Bool)

(assert (=> bs!31598 m!992249))

(declare-fun m!992251 () Bool)

(assert (=> bs!31598 m!992251))

(declare-fun m!992253 () Bool)

(assert (=> bs!31598 m!992253))

(assert (=> b!1072999 d!129797))

(declare-fun b!1073195 () Bool)

(declare-fun e!612962 () Bool)

(declare-fun call!45294 () Bool)

(assert (=> b!1073195 (= e!612962 (not call!45294))))

(declare-fun b!1073196 () Bool)

(declare-fun e!612959 () ListLongMap!14459)

(declare-fun call!45296 () ListLongMap!14459)

(assert (=> b!1073196 (= e!612959 call!45296)))

(declare-fun b!1073197 () Bool)

(declare-fun e!612961 () Bool)

(declare-fun e!612963 () Bool)

(assert (=> b!1073197 (= e!612961 e!612963)))

(declare-fun res!715530 () Bool)

(declare-fun call!45298 () Bool)

(assert (=> b!1073197 (= res!715530 call!45298)))

(assert (=> b!1073197 (=> (not res!715530) (not e!612963))))

(declare-fun b!1073198 () Bool)

(declare-fun e!612967 () ListLongMap!14459)

(declare-fun call!45299 () ListLongMap!14459)

(assert (=> b!1073198 (= e!612967 call!45299)))

(declare-fun b!1073199 () Bool)

(declare-fun e!612964 () Bool)

(assert (=> b!1073199 (= e!612964 (validKeyInArray!0 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073200 () Bool)

(declare-fun e!612965 () Bool)

(declare-fun lt!475143 () ListLongMap!14459)

(assert (=> b!1073200 (= e!612965 (= (apply!939 lt!475143 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45291 () Bool)

(declare-fun call!45300 () ListLongMap!14459)

(declare-fun call!45295 () ListLongMap!14459)

(assert (=> bm!45291 (= call!45300 call!45295)))

(declare-fun b!1073201 () Bool)

(declare-fun e!612960 () Unit!35273)

(declare-fun lt!475158 () Unit!35273)

(assert (=> b!1073201 (= e!612960 lt!475158)))

(declare-fun lt!475146 () ListLongMap!14459)

(assert (=> b!1073201 (= lt!475146 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475154 () (_ BitVec 64))

(assert (=> b!1073201 (= lt!475154 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475153 () (_ BitVec 64))

(assert (=> b!1073201 (= lt!475153 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475145 () Unit!35273)

(assert (=> b!1073201 (= lt!475145 (addStillContains!644 lt!475146 lt!475154 zeroValueBefore!47 lt!475153))))

(assert (=> b!1073201 (contains!6346 (+!3208 lt!475146 (tuple2!16483 lt!475154 zeroValueBefore!47)) lt!475153)))

(declare-fun lt!475147 () Unit!35273)

(assert (=> b!1073201 (= lt!475147 lt!475145)))

(declare-fun lt!475149 () ListLongMap!14459)

(assert (=> b!1073201 (= lt!475149 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475160 () (_ BitVec 64))

(assert (=> b!1073201 (= lt!475160 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475152 () (_ BitVec 64))

(assert (=> b!1073201 (= lt!475152 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475139 () Unit!35273)

(assert (=> b!1073201 (= lt!475139 (addApplyDifferent!500 lt!475149 lt!475160 minValue!907 lt!475152))))

(assert (=> b!1073201 (= (apply!939 (+!3208 lt!475149 (tuple2!16483 lt!475160 minValue!907)) lt!475152) (apply!939 lt!475149 lt!475152))))

(declare-fun lt!475142 () Unit!35273)

(assert (=> b!1073201 (= lt!475142 lt!475139)))

(declare-fun lt!475151 () ListLongMap!14459)

(assert (=> b!1073201 (= lt!475151 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475144 () (_ BitVec 64))

(assert (=> b!1073201 (= lt!475144 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475159 () (_ BitVec 64))

(assert (=> b!1073201 (= lt!475159 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475141 () Unit!35273)

(assert (=> b!1073201 (= lt!475141 (addApplyDifferent!500 lt!475151 lt!475144 zeroValueBefore!47 lt!475159))))

(assert (=> b!1073201 (= (apply!939 (+!3208 lt!475151 (tuple2!16483 lt!475144 zeroValueBefore!47)) lt!475159) (apply!939 lt!475151 lt!475159))))

(declare-fun lt!475150 () Unit!35273)

(assert (=> b!1073201 (= lt!475150 lt!475141)))

(declare-fun lt!475140 () ListLongMap!14459)

(assert (=> b!1073201 (= lt!475140 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475157 () (_ BitVec 64))

(assert (=> b!1073201 (= lt!475157 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475156 () (_ BitVec 64))

(assert (=> b!1073201 (= lt!475156 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1073201 (= lt!475158 (addApplyDifferent!500 lt!475140 lt!475157 minValue!907 lt!475156))))

(assert (=> b!1073201 (= (apply!939 (+!3208 lt!475140 (tuple2!16483 lt!475157 minValue!907)) lt!475156) (apply!939 lt!475140 lt!475156))))

(declare-fun b!1073202 () Bool)

(declare-fun Unit!35278 () Unit!35273)

(assert (=> b!1073202 (= e!612960 Unit!35278)))

(declare-fun b!1073203 () Bool)

(assert (=> b!1073203 (= e!612962 e!612965)))

(declare-fun res!715531 () Bool)

(assert (=> b!1073203 (= res!715531 call!45294)))

(assert (=> b!1073203 (=> (not res!715531) (not e!612965))))

(declare-fun b!1073204 () Bool)

(declare-fun e!612970 () ListLongMap!14459)

(assert (=> b!1073204 (= e!612970 e!612967)))

(declare-fun c!108096 () Bool)

(assert (=> b!1073204 (= c!108096 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1073205 () Bool)

(assert (=> b!1073205 (= e!612961 (not call!45298))))

(declare-fun bm!45292 () Bool)

(assert (=> bm!45292 (= call!45298 (contains!6346 lt!475143 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!129799 () Bool)

(declare-fun e!612968 () Bool)

(assert (=> d!129799 e!612968))

(declare-fun res!715529 () Bool)

(assert (=> d!129799 (=> (not res!715529) (not e!612968))))

(assert (=> d!129799 (= res!715529 (or (bvsge #b00000000000000000000000000000000 (size!33570 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))))

(declare-fun lt!475155 () ListLongMap!14459)

(assert (=> d!129799 (= lt!475143 lt!475155)))

(declare-fun lt!475148 () Unit!35273)

(assert (=> d!129799 (= lt!475148 e!612960)))

(declare-fun c!108098 () Bool)

(declare-fun e!612969 () Bool)

(assert (=> d!129799 (= c!108098 e!612969)))

(declare-fun res!715526 () Bool)

(assert (=> d!129799 (=> (not res!715526) (not e!612969))))

(assert (=> d!129799 (= res!715526 (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(assert (=> d!129799 (= lt!475155 e!612970)))

(declare-fun c!108097 () Bool)

(assert (=> d!129799 (= c!108097 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129799 (validMask!0 mask!1515)))

(assert (=> d!129799 (= (getCurrentListMap!4139 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475143)))

(declare-fun call!45297 () ListLongMap!14459)

(declare-fun bm!45293 () Bool)

(assert (=> bm!45293 (= call!45297 (+!3208 (ite c!108097 call!45295 (ite c!108096 call!45300 call!45296)) (ite (or c!108097 c!108096) (tuple2!16483 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16483 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1073206 () Bool)

(declare-fun e!612971 () Bool)

(declare-fun e!612966 () Bool)

(assert (=> b!1073206 (= e!612971 e!612966)))

(declare-fun res!715527 () Bool)

(assert (=> b!1073206 (=> (not res!715527) (not e!612966))))

(assert (=> b!1073206 (= res!715527 (contains!6346 lt!475143 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073206 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(declare-fun b!1073207 () Bool)

(assert (=> b!1073207 (= e!612966 (= (apply!939 lt!475143 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)) (get!17197 (select (arr!33034 _values!955) #b00000000000000000000000000000000) (dynLambda!2054 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1073207 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33571 _values!955)))))

(assert (=> b!1073207 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(declare-fun bm!45294 () Bool)

(assert (=> bm!45294 (= call!45299 call!45297)))

(declare-fun b!1073208 () Bool)

(assert (=> b!1073208 (= e!612969 (validKeyInArray!0 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45295 () Bool)

(assert (=> bm!45295 (= call!45296 call!45300)))

(declare-fun b!1073209 () Bool)

(assert (=> b!1073209 (= e!612968 e!612962)))

(declare-fun c!108095 () Bool)

(assert (=> b!1073209 (= c!108095 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1073210 () Bool)

(assert (=> b!1073210 (= e!612970 (+!3208 call!45297 (tuple2!16483 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1073211 () Bool)

(declare-fun res!715523 () Bool)

(assert (=> b!1073211 (=> (not res!715523) (not e!612968))))

(assert (=> b!1073211 (= res!715523 e!612961)))

(declare-fun c!108099 () Bool)

(assert (=> b!1073211 (= c!108099 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073212 () Bool)

(assert (=> b!1073212 (= e!612959 call!45299)))

(declare-fun b!1073213 () Bool)

(assert (=> b!1073213 (= e!612963 (= (apply!939 lt!475143 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1073214 () Bool)

(declare-fun res!715524 () Bool)

(assert (=> b!1073214 (=> (not res!715524) (not e!612968))))

(assert (=> b!1073214 (= res!715524 e!612971)))

(declare-fun res!715528 () Bool)

(assert (=> b!1073214 (=> res!715528 e!612971)))

(assert (=> b!1073214 (= res!715528 (not e!612964))))

(declare-fun res!715525 () Bool)

(assert (=> b!1073214 (=> (not res!715525) (not e!612964))))

(assert (=> b!1073214 (= res!715525 (bvslt #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(declare-fun bm!45296 () Bool)

(assert (=> bm!45296 (= call!45294 (contains!6346 lt!475143 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45297 () Bool)

(assert (=> bm!45297 (= call!45295 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073215 () Bool)

(declare-fun c!108094 () Bool)

(assert (=> b!1073215 (= c!108094 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1073215 (= e!612967 e!612959)))

(assert (= (and d!129799 c!108097) b!1073210))

(assert (= (and d!129799 (not c!108097)) b!1073204))

(assert (= (and b!1073204 c!108096) b!1073198))

(assert (= (and b!1073204 (not c!108096)) b!1073215))

(assert (= (and b!1073215 c!108094) b!1073212))

(assert (= (and b!1073215 (not c!108094)) b!1073196))

(assert (= (or b!1073212 b!1073196) bm!45295))

(assert (= (or b!1073198 bm!45295) bm!45291))

(assert (= (or b!1073198 b!1073212) bm!45294))

(assert (= (or b!1073210 bm!45291) bm!45297))

(assert (= (or b!1073210 bm!45294) bm!45293))

(assert (= (and d!129799 res!715526) b!1073208))

(assert (= (and d!129799 c!108098) b!1073201))

(assert (= (and d!129799 (not c!108098)) b!1073202))

(assert (= (and d!129799 res!715529) b!1073214))

(assert (= (and b!1073214 res!715525) b!1073199))

(assert (= (and b!1073214 (not res!715528)) b!1073206))

(assert (= (and b!1073206 res!715527) b!1073207))

(assert (= (and b!1073214 res!715524) b!1073211))

(assert (= (and b!1073211 c!108099) b!1073197))

(assert (= (and b!1073211 (not c!108099)) b!1073205))

(assert (= (and b!1073197 res!715530) b!1073213))

(assert (= (or b!1073197 b!1073205) bm!45292))

(assert (= (and b!1073211 res!715523) b!1073209))

(assert (= (and b!1073209 c!108095) b!1073203))

(assert (= (and b!1073209 (not c!108095)) b!1073195))

(assert (= (and b!1073203 res!715531) b!1073200))

(assert (= (or b!1073203 b!1073195) bm!45296))

(declare-fun b_lambda!16697 () Bool)

(assert (=> (not b_lambda!16697) (not b!1073207)))

(assert (=> b!1073207 t!32371))

(declare-fun b_and!34883 () Bool)

(assert (= b_and!34881 (and (=> t!32371 result!14765) b_and!34883)))

(assert (=> b!1073199 m!992087))

(assert (=> b!1073199 m!992087))

(assert (=> b!1073199 m!992089))

(declare-fun m!992255 () Bool)

(assert (=> b!1073200 m!992255))

(assert (=> d!129799 m!991963))

(assert (=> bm!45297 m!991977))

(assert (=> b!1073201 m!992087))

(declare-fun m!992257 () Bool)

(assert (=> b!1073201 m!992257))

(declare-fun m!992259 () Bool)

(assert (=> b!1073201 m!992259))

(declare-fun m!992261 () Bool)

(assert (=> b!1073201 m!992261))

(declare-fun m!992263 () Bool)

(assert (=> b!1073201 m!992263))

(assert (=> b!1073201 m!992257))

(declare-fun m!992265 () Bool)

(assert (=> b!1073201 m!992265))

(declare-fun m!992267 () Bool)

(assert (=> b!1073201 m!992267))

(assert (=> b!1073201 m!992261))

(declare-fun m!992269 () Bool)

(assert (=> b!1073201 m!992269))

(declare-fun m!992271 () Bool)

(assert (=> b!1073201 m!992271))

(declare-fun m!992273 () Bool)

(assert (=> b!1073201 m!992273))

(declare-fun m!992275 () Bool)

(assert (=> b!1073201 m!992275))

(declare-fun m!992277 () Bool)

(assert (=> b!1073201 m!992277))

(declare-fun m!992279 () Bool)

(assert (=> b!1073201 m!992279))

(declare-fun m!992281 () Bool)

(assert (=> b!1073201 m!992281))

(assert (=> b!1073201 m!992275))

(assert (=> b!1073201 m!992281))

(declare-fun m!992283 () Bool)

(assert (=> b!1073201 m!992283))

(declare-fun m!992285 () Bool)

(assert (=> b!1073201 m!992285))

(assert (=> b!1073201 m!991977))

(assert (=> b!1073206 m!992087))

(assert (=> b!1073206 m!992087))

(declare-fun m!992287 () Bool)

(assert (=> b!1073206 m!992287))

(declare-fun m!992289 () Bool)

(assert (=> bm!45296 m!992289))

(assert (=> b!1073208 m!992087))

(assert (=> b!1073208 m!992087))

(assert (=> b!1073208 m!992089))

(declare-fun m!992291 () Bool)

(assert (=> bm!45293 m!992291))

(declare-fun m!992293 () Bool)

(assert (=> bm!45292 m!992293))

(declare-fun m!992295 () Bool)

(assert (=> b!1073210 m!992295))

(declare-fun m!992297 () Bool)

(assert (=> b!1073213 m!992297))

(assert (=> b!1073207 m!992087))

(declare-fun m!992299 () Bool)

(assert (=> b!1073207 m!992299))

(assert (=> b!1073207 m!992087))

(assert (=> b!1073207 m!992091))

(assert (=> b!1073207 m!992091))

(assert (=> b!1073207 m!992093))

(assert (=> b!1073207 m!992095))

(assert (=> b!1073207 m!992093))

(assert (=> b!1072999 d!129799))

(declare-fun d!129801 () Bool)

(assert (=> d!129801 (= (+!3208 (+!3208 lt!474933 (tuple2!16483 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16483 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (+!3208 (+!3208 lt!474933 (tuple2!16483 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (tuple2!16483 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun lt!475163 () Unit!35273)

(declare-fun choose!1747 (ListLongMap!14459 (_ BitVec 64) V!39585 (_ BitVec 64) V!39585) Unit!35273)

(assert (=> d!129801 (= lt!475163 (choose!1747 lt!474933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> d!129801 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129801 (= (addCommutativeForDiffKeys!735 lt!474933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907) lt!475163)))

(declare-fun bs!31599 () Bool)

(assert (= bs!31599 d!129801))

(declare-fun m!992301 () Bool)

(assert (=> bs!31599 m!992301))

(declare-fun m!992303 () Bool)

(assert (=> bs!31599 m!992303))

(declare-fun m!992305 () Bool)

(assert (=> bs!31599 m!992305))

(assert (=> bs!31599 m!992303))

(declare-fun m!992307 () Bool)

(assert (=> bs!31599 m!992307))

(assert (=> bs!31599 m!992301))

(declare-fun m!992309 () Bool)

(assert (=> bs!31599 m!992309))

(assert (=> b!1072999 d!129801))

(declare-fun b!1073224 () Bool)

(declare-fun e!612980 () Bool)

(declare-fun call!45303 () Bool)

(assert (=> b!1073224 (= e!612980 call!45303)))

(declare-fun d!129803 () Bool)

(declare-fun res!715537 () Bool)

(declare-fun e!612979 () Bool)

(assert (=> d!129803 (=> res!715537 e!612979)))

(assert (=> d!129803 (= res!715537 (bvsge #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(assert (=> d!129803 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!612979)))

(declare-fun b!1073225 () Bool)

(assert (=> b!1073225 (= e!612979 e!612980)))

(declare-fun c!108102 () Bool)

(assert (=> b!1073225 (= c!108102 (validKeyInArray!0 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45300 () Bool)

(assert (=> bm!45300 (= call!45303 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1073226 () Bool)

(declare-fun e!612978 () Bool)

(assert (=> b!1073226 (= e!612980 e!612978)))

(declare-fun lt!475170 () (_ BitVec 64))

(assert (=> b!1073226 (= lt!475170 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475171 () Unit!35273)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68687 (_ BitVec 64) (_ BitVec 32)) Unit!35273)

(assert (=> b!1073226 (= lt!475171 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!475170 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1073226 (arrayContainsKey!0 _keys!1163 lt!475170 #b00000000000000000000000000000000)))

(declare-fun lt!475172 () Unit!35273)

(assert (=> b!1073226 (= lt!475172 lt!475171)))

(declare-fun res!715536 () Bool)

(declare-datatypes ((SeekEntryResult!9839 0))(
  ( (MissingZero!9839 (index!41727 (_ BitVec 32))) (Found!9839 (index!41728 (_ BitVec 32))) (Intermediate!9839 (undefined!10651 Bool) (index!41729 (_ BitVec 32)) (x!96012 (_ BitVec 32))) (Undefined!9839) (MissingVacant!9839 (index!41730 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68687 (_ BitVec 32)) SeekEntryResult!9839)

(assert (=> b!1073226 (= res!715536 (= (seekEntryOrOpen!0 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9839 #b00000000000000000000000000000000)))))

(assert (=> b!1073226 (=> (not res!715536) (not e!612978))))

(declare-fun b!1073227 () Bool)

(assert (=> b!1073227 (= e!612978 call!45303)))

(assert (= (and d!129803 (not res!715537)) b!1073225))

(assert (= (and b!1073225 c!108102) b!1073226))

(assert (= (and b!1073225 (not c!108102)) b!1073224))

(assert (= (and b!1073226 res!715536) b!1073227))

(assert (= (or b!1073227 b!1073224) bm!45300))

(assert (=> b!1073225 m!992087))

(assert (=> b!1073225 m!992087))

(assert (=> b!1073225 m!992089))

(declare-fun m!992311 () Bool)

(assert (=> bm!45300 m!992311))

(assert (=> b!1073226 m!992087))

(declare-fun m!992313 () Bool)

(assert (=> b!1073226 m!992313))

(declare-fun m!992315 () Bool)

(assert (=> b!1073226 m!992315))

(assert (=> b!1073226 m!992087))

(declare-fun m!992317 () Bool)

(assert (=> b!1073226 m!992317))

(assert (=> b!1072998 d!129803))

(declare-fun b!1073238 () Bool)

(declare-fun e!612991 () Bool)

(declare-fun call!45306 () Bool)

(assert (=> b!1073238 (= e!612991 call!45306)))

(declare-fun b!1073239 () Bool)

(declare-fun e!612989 () Bool)

(assert (=> b!1073239 (= e!612989 e!612991)))

(declare-fun c!108105 () Bool)

(assert (=> b!1073239 (= c!108105 (validKeyInArray!0 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073240 () Bool)

(declare-fun e!612992 () Bool)

(declare-fun contains!6348 (List!23042 (_ BitVec 64)) Bool)

(assert (=> b!1073240 (= e!612992 (contains!6348 Nil!23039 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073241 () Bool)

(declare-fun e!612990 () Bool)

(assert (=> b!1073241 (= e!612990 e!612989)))

(declare-fun res!715546 () Bool)

(assert (=> b!1073241 (=> (not res!715546) (not e!612989))))

(assert (=> b!1073241 (= res!715546 (not e!612992))))

(declare-fun res!715544 () Bool)

(assert (=> b!1073241 (=> (not res!715544) (not e!612992))))

(assert (=> b!1073241 (= res!715544 (validKeyInArray!0 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073242 () Bool)

(assert (=> b!1073242 (= e!612991 call!45306)))

(declare-fun d!129805 () Bool)

(declare-fun res!715545 () Bool)

(assert (=> d!129805 (=> res!715545 e!612990)))

(assert (=> d!129805 (= res!715545 (bvsge #b00000000000000000000000000000000 (size!33570 _keys!1163)))))

(assert (=> d!129805 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23039) e!612990)))

(declare-fun bm!45303 () Bool)

(assert (=> bm!45303 (= call!45306 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108105 (Cons!23038 (select (arr!33033 _keys!1163) #b00000000000000000000000000000000) Nil!23039) Nil!23039)))))

(assert (= (and d!129805 (not res!715545)) b!1073241))

(assert (= (and b!1073241 res!715544) b!1073240))

(assert (= (and b!1073241 res!715546) b!1073239))

(assert (= (and b!1073239 c!108105) b!1073242))

(assert (= (and b!1073239 (not c!108105)) b!1073238))

(assert (= (or b!1073242 b!1073238) bm!45303))

(assert (=> b!1073239 m!992087))

(assert (=> b!1073239 m!992087))

(assert (=> b!1073239 m!992089))

(assert (=> b!1073240 m!992087))

(assert (=> b!1073240 m!992087))

(declare-fun m!992319 () Bool)

(assert (=> b!1073240 m!992319))

(assert (=> b!1073241 m!992087))

(assert (=> b!1073241 m!992087))

(assert (=> b!1073241 m!992089))

(assert (=> bm!45303 m!992087))

(declare-fun m!992321 () Bool)

(assert (=> bm!45303 m!992321))

(assert (=> b!1073001 d!129805))

(declare-fun mapNonEmpty!40471 () Bool)

(declare-fun mapRes!40471 () Bool)

(declare-fun tp!77555 () Bool)

(declare-fun e!612998 () Bool)

(assert (=> mapNonEmpty!40471 (= mapRes!40471 (and tp!77555 e!612998))))

(declare-fun mapKey!40471 () (_ BitVec 32))

(declare-fun mapValue!40471 () ValueCell!12215)

(declare-fun mapRest!40471 () (Array (_ BitVec 32) ValueCell!12215))

(assert (=> mapNonEmpty!40471 (= mapRest!40462 (store mapRest!40471 mapKey!40471 mapValue!40471))))

(declare-fun condMapEmpty!40471 () Bool)

(declare-fun mapDefault!40471 () ValueCell!12215)

(assert (=> mapNonEmpty!40462 (= condMapEmpty!40471 (= mapRest!40462 ((as const (Array (_ BitVec 32) ValueCell!12215)) mapDefault!40471)))))

(declare-fun e!612997 () Bool)

(assert (=> mapNonEmpty!40462 (= tp!77539 (and e!612997 mapRes!40471))))

(declare-fun b!1073249 () Bool)

(assert (=> b!1073249 (= e!612998 tp_is_empty!25837)))

(declare-fun mapIsEmpty!40471 () Bool)

(assert (=> mapIsEmpty!40471 mapRes!40471))

(declare-fun b!1073250 () Bool)

(assert (=> b!1073250 (= e!612997 tp_is_empty!25837)))

(assert (= (and mapNonEmpty!40462 condMapEmpty!40471) mapIsEmpty!40471))

(assert (= (and mapNonEmpty!40462 (not condMapEmpty!40471)) mapNonEmpty!40471))

(assert (= (and mapNonEmpty!40471 ((_ is ValueCellFull!12215) mapValue!40471)) b!1073249))

(assert (= (and mapNonEmpty!40462 ((_ is ValueCellFull!12215) mapDefault!40471)) b!1073250))

(declare-fun m!992323 () Bool)

(assert (=> mapNonEmpty!40471 m!992323))

(declare-fun b_lambda!16699 () Bool)

(assert (= b_lambda!16689 (or (and start!95010 b_free!22027) b_lambda!16699)))

(declare-fun b_lambda!16701 () Bool)

(assert (= b_lambda!16687 (or (and start!95010 b_free!22027) b_lambda!16701)))

(declare-fun b_lambda!16703 () Bool)

(assert (= b_lambda!16695 (or (and start!95010 b_free!22027) b_lambda!16703)))

(declare-fun b_lambda!16705 () Bool)

(assert (= b_lambda!16693 (or (and start!95010 b_free!22027) b_lambda!16705)))

(declare-fun b_lambda!16707 () Bool)

(assert (= b_lambda!16691 (or (and start!95010 b_free!22027) b_lambda!16707)))

(declare-fun b_lambda!16709 () Bool)

(assert (= b_lambda!16697 (or (and start!95010 b_free!22027) b_lambda!16709)))

(check-sat (not b!1073240) (not b!1073113) (not b!1073122) (not b!1073174) (not b!1073189) (not bm!45285) (not b!1073191) (not bm!45290) (not b_lambda!16703) (not b!1073201) (not b_lambda!16709) (not b!1073183) (not bm!45296) (not b!1073190) (not b!1073208) (not b!1073117) (not b!1073241) (not bm!45303) (not b!1073173) (not d!129779) (not b!1073093) (not b!1073239) (not b!1073226) (not b!1073110) (not b!1073225) (not b!1073111) (not d!129791) (not b!1073172) (not d!129781) (not d!129799) (not b!1073193) (not b!1073125) (not bm!45286) (not b!1073123) (not b!1073097) (not d!129787) (not b!1073194) (not b!1073180) (not b!1073206) tp_is_empty!25837 (not b!1073199) (not b_lambda!16705) (not b!1073213) (not b!1073108) (not b!1073179) (not bm!45292) (not d!129797) (not b!1073106) (not b_lambda!16707) (not b!1073092) (not b!1073186) (not bm!45289) (not d!129801) (not d!129795) (not d!129793) (not bm!45300) (not b!1073181) (not b!1073099) (not b!1073210) (not b!1073094) (not d!129783) (not mapNonEmpty!40471) (not b!1073100) (not b!1073124) (not b_lambda!16701) (not bm!45269) (not bm!45268) (not b_lambda!16699) (not d!129775) b_and!34883 (not b!1073114) (not bm!45293) (not d!129785) (not b_next!22027) (not b!1073107) (not d!129789) (not d!129777) (not b!1073096) (not b!1073207) (not b!1073200) (not b!1073192) (not bm!45297) (not b!1073103))
(check-sat b_and!34883 (not b_next!22027))
