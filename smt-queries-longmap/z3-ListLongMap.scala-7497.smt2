; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94960 () Bool)

(assert start!94960)

(declare-fun b_free!22159 () Bool)

(declare-fun b_next!22159 () Bool)

(assert (=> start!94960 (= b_free!22159 (not b_next!22159))))

(declare-fun tp!77944 () Bool)

(declare-fun b_and!34995 () Bool)

(assert (=> start!94960 (= tp!77944 b_and!34995)))

(declare-fun mapNonEmpty!40669 () Bool)

(declare-fun mapRes!40669 () Bool)

(declare-fun tp!77945 () Bool)

(declare-fun e!613350 () Bool)

(assert (=> mapNonEmpty!40669 (= mapRes!40669 (and tp!77945 e!613350))))

(declare-datatypes ((V!39761 0))(
  ( (V!39762 (val!13035 Int)) )
))
(declare-datatypes ((ValueCell!12281 0))(
  ( (ValueCellFull!12281 (v!15652 V!39761)) (EmptyCell!12281) )
))
(declare-fun mapRest!40669 () (Array (_ BitVec 32) ValueCell!12281))

(declare-datatypes ((array!68832 0))(
  ( (array!68833 (arr!33109 (Array (_ BitVec 32) ValueCell!12281)) (size!33647 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68832)

(declare-fun mapKey!40669 () (_ BitVec 32))

(declare-fun mapValue!40669 () ValueCell!12281)

(assert (=> mapNonEmpty!40669 (= (arr!33109 _values!955) (store mapRest!40669 mapKey!40669 mapValue!40669))))

(declare-fun b!1073549 () Bool)

(declare-fun e!613351 () Bool)

(declare-fun e!613348 () Bool)

(assert (=> b!1073549 (= e!613351 (not e!613348))))

(declare-fun res!716009 () Bool)

(assert (=> b!1073549 (=> res!716009 e!613348)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073549 (= res!716009 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16660 0))(
  ( (tuple2!16661 (_1!8341 (_ BitVec 64)) (_2!8341 V!39761)) )
))
(declare-datatypes ((List!23185 0))(
  ( (Nil!23182) (Cons!23181 (h!24390 tuple2!16660) (t!32515 List!23185)) )
))
(declare-datatypes ((ListLongMap!14629 0))(
  ( (ListLongMap!14630 (toList!7330 List!23185)) )
))
(declare-fun lt!475937 () ListLongMap!14629)

(declare-fun lt!475936 () ListLongMap!14629)

(assert (=> b!1073549 (= lt!475937 lt!475936)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((Unit!35195 0))(
  ( (Unit!35196) )
))
(declare-fun lt!475938 () Unit!35195)

(declare-fun zeroValueBefore!47 () V!39761)

(declare-fun minValue!907 () V!39761)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39761)

(declare-datatypes ((array!68834 0))(
  ( (array!68835 (arr!33110 (Array (_ BitVec 32) (_ BitVec 64))) (size!33648 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68834)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!882 (array!68834 array!68832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39761 V!39761 V!39761 V!39761 (_ BitVec 32) Int) Unit!35195)

(assert (=> b!1073549 (= lt!475938 (lemmaNoChangeToArrayThenSameMapNoExtras!882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3910 (array!68834 array!68832 (_ BitVec 32) (_ BitVec 32) V!39761 V!39761 (_ BitVec 32) Int) ListLongMap!14629)

(assert (=> b!1073549 (= lt!475936 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073549 (= lt!475937 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073550 () Bool)

(declare-fun contains!6298 (ListLongMap!14629 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4104 (array!68834 array!68832 (_ BitVec 32) (_ BitVec 32) V!39761 V!39761 (_ BitVec 32) Int) ListLongMap!14629)

(assert (=> b!1073550 (= e!613348 (not (contains!6298 (getCurrentListMap!4104 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1073552 () Bool)

(declare-fun e!613349 () Bool)

(declare-fun tp_is_empty!25969 () Bool)

(assert (=> b!1073552 (= e!613349 tp_is_empty!25969)))

(declare-fun b!1073553 () Bool)

(declare-fun e!613352 () Bool)

(assert (=> b!1073553 (= e!613352 (and e!613349 mapRes!40669))))

(declare-fun condMapEmpty!40669 () Bool)

(declare-fun mapDefault!40669 () ValueCell!12281)

(assert (=> b!1073553 (= condMapEmpty!40669 (= (arr!33109 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12281)) mapDefault!40669)))))

(declare-fun b!1073554 () Bool)

(declare-fun res!716005 () Bool)

(assert (=> b!1073554 (=> (not res!716005) (not e!613351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68834 (_ BitVec 32)) Bool)

(assert (=> b!1073554 (= res!716005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073555 () Bool)

(declare-fun res!716008 () Bool)

(assert (=> b!1073555 (=> (not res!716008) (not e!613351))))

(declare-datatypes ((List!23186 0))(
  ( (Nil!23183) (Cons!23182 (h!24391 (_ BitVec 64)) (t!32516 List!23186)) )
))
(declare-fun arrayNoDuplicates!0 (array!68834 (_ BitVec 32) List!23186) Bool)

(assert (=> b!1073555 (= res!716008 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23183))))

(declare-fun mapIsEmpty!40669 () Bool)

(assert (=> mapIsEmpty!40669 mapRes!40669))

(declare-fun b!1073556 () Bool)

(assert (=> b!1073556 (= e!613350 tp_is_empty!25969)))

(declare-fun res!716006 () Bool)

(assert (=> start!94960 (=> (not res!716006) (not e!613351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94960 (= res!716006 (validMask!0 mask!1515))))

(assert (=> start!94960 e!613351))

(assert (=> start!94960 true))

(assert (=> start!94960 tp_is_empty!25969))

(declare-fun array_inv!25616 (array!68832) Bool)

(assert (=> start!94960 (and (array_inv!25616 _values!955) e!613352)))

(assert (=> start!94960 tp!77944))

(declare-fun array_inv!25617 (array!68834) Bool)

(assert (=> start!94960 (array_inv!25617 _keys!1163)))

(declare-fun b!1073551 () Bool)

(declare-fun res!716007 () Bool)

(assert (=> b!1073551 (=> (not res!716007) (not e!613351))))

(assert (=> b!1073551 (= res!716007 (and (= (size!33647 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33648 _keys!1163) (size!33647 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94960 res!716006) b!1073551))

(assert (= (and b!1073551 res!716007) b!1073554))

(assert (= (and b!1073554 res!716005) b!1073555))

(assert (= (and b!1073555 res!716008) b!1073549))

(assert (= (and b!1073549 (not res!716009)) b!1073550))

(assert (= (and b!1073553 condMapEmpty!40669) mapIsEmpty!40669))

(assert (= (and b!1073553 (not condMapEmpty!40669)) mapNonEmpty!40669))

(get-info :version)

(assert (= (and mapNonEmpty!40669 ((_ is ValueCellFull!12281) mapValue!40669)) b!1073556))

(assert (= (and b!1073553 ((_ is ValueCellFull!12281) mapDefault!40669)) b!1073552))

(assert (= start!94960 b!1073553))

(declare-fun m!991997 () Bool)

(assert (=> b!1073555 m!991997))

(declare-fun m!991999 () Bool)

(assert (=> mapNonEmpty!40669 m!991999))

(declare-fun m!992001 () Bool)

(assert (=> b!1073554 m!992001))

(declare-fun m!992003 () Bool)

(assert (=> b!1073550 m!992003))

(assert (=> b!1073550 m!992003))

(declare-fun m!992005 () Bool)

(assert (=> b!1073550 m!992005))

(declare-fun m!992007 () Bool)

(assert (=> start!94960 m!992007))

(declare-fun m!992009 () Bool)

(assert (=> start!94960 m!992009))

(declare-fun m!992011 () Bool)

(assert (=> start!94960 m!992011))

(declare-fun m!992013 () Bool)

(assert (=> b!1073549 m!992013))

(declare-fun m!992015 () Bool)

(assert (=> b!1073549 m!992015))

(declare-fun m!992017 () Bool)

(assert (=> b!1073549 m!992017))

(check-sat b_and!34995 (not b_next!22159) (not b!1073549) (not start!94960) (not mapNonEmpty!40669) (not b!1073554) tp_is_empty!25969 (not b!1073555) (not b!1073550))
(check-sat b_and!34995 (not b_next!22159))
(get-model)

(declare-fun d!129283 () Bool)

(declare-fun res!716044 () Bool)

(declare-fun e!613398 () Bool)

(assert (=> d!129283 (=> res!716044 e!613398)))

(assert (=> d!129283 (= res!716044 (bvsge #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(assert (=> d!129283 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!613398)))

(declare-fun b!1073613 () Bool)

(declare-fun e!613396 () Bool)

(assert (=> b!1073613 (= e!613398 e!613396)))

(declare-fun c!107727 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1073613 (= c!107727 (validKeyInArray!0 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45264 () Bool)

(declare-fun call!45267 () Bool)

(assert (=> bm!45264 (= call!45267 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1073614 () Bool)

(assert (=> b!1073614 (= e!613396 call!45267)))

(declare-fun b!1073615 () Bool)

(declare-fun e!613397 () Bool)

(assert (=> b!1073615 (= e!613396 e!613397)))

(declare-fun lt!475965 () (_ BitVec 64))

(assert (=> b!1073615 (= lt!475965 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475964 () Unit!35195)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68834 (_ BitVec 64) (_ BitVec 32)) Unit!35195)

(assert (=> b!1073615 (= lt!475964 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!475965 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1073615 (arrayContainsKey!0 _keys!1163 lt!475965 #b00000000000000000000000000000000)))

(declare-fun lt!475963 () Unit!35195)

(assert (=> b!1073615 (= lt!475963 lt!475964)))

(declare-fun res!716045 () Bool)

(declare-datatypes ((SeekEntryResult!9885 0))(
  ( (MissingZero!9885 (index!41911 (_ BitVec 32))) (Found!9885 (index!41912 (_ BitVec 32))) (Intermediate!9885 (undefined!10697 Bool) (index!41913 (_ BitVec 32)) (x!96242 (_ BitVec 32))) (Undefined!9885) (MissingVacant!9885 (index!41914 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68834 (_ BitVec 32)) SeekEntryResult!9885)

(assert (=> b!1073615 (= res!716045 (= (seekEntryOrOpen!0 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9885 #b00000000000000000000000000000000)))))

(assert (=> b!1073615 (=> (not res!716045) (not e!613397))))

(declare-fun b!1073616 () Bool)

(assert (=> b!1073616 (= e!613397 call!45267)))

(assert (= (and d!129283 (not res!716044)) b!1073613))

(assert (= (and b!1073613 c!107727) b!1073615))

(assert (= (and b!1073613 (not c!107727)) b!1073614))

(assert (= (and b!1073615 res!716045) b!1073616))

(assert (= (or b!1073616 b!1073614) bm!45264))

(declare-fun m!992063 () Bool)

(assert (=> b!1073613 m!992063))

(assert (=> b!1073613 m!992063))

(declare-fun m!992065 () Bool)

(assert (=> b!1073613 m!992065))

(declare-fun m!992067 () Bool)

(assert (=> bm!45264 m!992067))

(assert (=> b!1073615 m!992063))

(declare-fun m!992069 () Bool)

(assert (=> b!1073615 m!992069))

(declare-fun m!992071 () Bool)

(assert (=> b!1073615 m!992071))

(assert (=> b!1073615 m!992063))

(declare-fun m!992073 () Bool)

(assert (=> b!1073615 m!992073))

(assert (=> b!1073554 d!129283))

(declare-fun d!129285 () Bool)

(assert (=> d!129285 (= (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475968 () Unit!35195)

(declare-fun choose!1754 (array!68834 array!68832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39761 V!39761 V!39761 V!39761 (_ BitVec 32) Int) Unit!35195)

(assert (=> d!129285 (= lt!475968 (choose!1754 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129285 (validMask!0 mask!1515)))

(assert (=> d!129285 (= (lemmaNoChangeToArrayThenSameMapNoExtras!882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475968)))

(declare-fun bs!31622 () Bool)

(assert (= bs!31622 d!129285))

(assert (=> bs!31622 m!992017))

(assert (=> bs!31622 m!992015))

(declare-fun m!992075 () Bool)

(assert (=> bs!31622 m!992075))

(assert (=> bs!31622 m!992007))

(assert (=> b!1073549 d!129285))

(declare-fun e!613413 () Bool)

(declare-fun b!1073641 () Bool)

(declare-fun lt!475987 () ListLongMap!14629)

(assert (=> b!1073641 (= e!613413 (= lt!475987 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1073642 () Bool)

(assert (=> b!1073642 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(assert (=> b!1073642 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33647 _values!955)))))

(declare-fun e!613415 () Bool)

(declare-fun apply!926 (ListLongMap!14629 (_ BitVec 64)) V!39761)

(declare-fun get!17210 (ValueCell!12281 V!39761) V!39761)

(declare-fun dynLambda!2025 (Int (_ BitVec 64)) V!39761)

(assert (=> b!1073642 (= e!613415 (= (apply!926 lt!475987 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)) (get!17210 (select (arr!33109 _values!955) #b00000000000000000000000000000000) (dynLambda!2025 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1073643 () Bool)

(declare-fun e!613414 () Bool)

(assert (=> b!1073643 (= e!613414 e!613413)))

(declare-fun c!107739 () Bool)

(assert (=> b!1073643 (= c!107739 (bvslt #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(declare-fun b!1073644 () Bool)

(declare-fun res!716054 () Bool)

(declare-fun e!613417 () Bool)

(assert (=> b!1073644 (=> (not res!716054) (not e!613417))))

(assert (=> b!1073644 (= res!716054 (not (contains!6298 lt!475987 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!45270 () ListLongMap!14629)

(declare-fun bm!45267 () Bool)

(assert (=> bm!45267 (= call!45270 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1073645 () Bool)

(declare-fun lt!475988 () Unit!35195)

(declare-fun lt!475984 () Unit!35195)

(assert (=> b!1073645 (= lt!475988 lt!475984)))

(declare-fun lt!475983 () (_ BitVec 64))

(declare-fun lt!475989 () V!39761)

(declare-fun lt!475985 () (_ BitVec 64))

(declare-fun lt!475986 () ListLongMap!14629)

(declare-fun +!3238 (ListLongMap!14629 tuple2!16660) ListLongMap!14629)

(assert (=> b!1073645 (not (contains!6298 (+!3238 lt!475986 (tuple2!16661 lt!475983 lt!475989)) lt!475985))))

(declare-fun addStillNotContains!262 (ListLongMap!14629 (_ BitVec 64) V!39761 (_ BitVec 64)) Unit!35195)

(assert (=> b!1073645 (= lt!475984 (addStillNotContains!262 lt!475986 lt!475983 lt!475989 lt!475985))))

(assert (=> b!1073645 (= lt!475985 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1073645 (= lt!475989 (get!17210 (select (arr!33109 _values!955) #b00000000000000000000000000000000) (dynLambda!2025 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1073645 (= lt!475983 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1073645 (= lt!475986 call!45270)))

(declare-fun e!613419 () ListLongMap!14629)

(assert (=> b!1073645 (= e!613419 (+!3238 call!45270 (tuple2!16661 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000) (get!17210 (select (arr!33109 _values!955) #b00000000000000000000000000000000) (dynLambda!2025 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1073646 () Bool)

(declare-fun e!613418 () ListLongMap!14629)

(assert (=> b!1073646 (= e!613418 (ListLongMap!14630 Nil!23182))))

(declare-fun b!1073647 () Bool)

(declare-fun e!613416 () Bool)

(assert (=> b!1073647 (= e!613416 (validKeyInArray!0 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073647 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1073648 () Bool)

(assert (=> b!1073648 (= e!613419 call!45270)))

(declare-fun b!1073649 () Bool)

(assert (=> b!1073649 (= e!613414 e!613415)))

(assert (=> b!1073649 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(declare-fun res!716057 () Bool)

(assert (=> b!1073649 (= res!716057 (contains!6298 lt!475987 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073649 (=> (not res!716057) (not e!613415))))

(declare-fun b!1073650 () Bool)

(assert (=> b!1073650 (= e!613418 e!613419)))

(declare-fun c!107737 () Bool)

(assert (=> b!1073650 (= c!107737 (validKeyInArray!0 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129287 () Bool)

(assert (=> d!129287 e!613417))

(declare-fun res!716055 () Bool)

(assert (=> d!129287 (=> (not res!716055) (not e!613417))))

(assert (=> d!129287 (= res!716055 (not (contains!6298 lt!475987 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129287 (= lt!475987 e!613418)))

(declare-fun c!107738 () Bool)

(assert (=> d!129287 (= c!107738 (bvsge #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(assert (=> d!129287 (validMask!0 mask!1515)))

(assert (=> d!129287 (= (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475987)))

(declare-fun b!1073651 () Bool)

(declare-fun isEmpty!956 (ListLongMap!14629) Bool)

(assert (=> b!1073651 (= e!613413 (isEmpty!956 lt!475987))))

(declare-fun b!1073652 () Bool)

(assert (=> b!1073652 (= e!613417 e!613414)))

(declare-fun c!107736 () Bool)

(assert (=> b!1073652 (= c!107736 e!613416)))

(declare-fun res!716056 () Bool)

(assert (=> b!1073652 (=> (not res!716056) (not e!613416))))

(assert (=> b!1073652 (= res!716056 (bvslt #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(assert (= (and d!129287 c!107738) b!1073646))

(assert (= (and d!129287 (not c!107738)) b!1073650))

(assert (= (and b!1073650 c!107737) b!1073645))

(assert (= (and b!1073650 (not c!107737)) b!1073648))

(assert (= (or b!1073645 b!1073648) bm!45267))

(assert (= (and d!129287 res!716055) b!1073644))

(assert (= (and b!1073644 res!716054) b!1073652))

(assert (= (and b!1073652 res!716056) b!1073647))

(assert (= (and b!1073652 c!107736) b!1073649))

(assert (= (and b!1073652 (not c!107736)) b!1073643))

(assert (= (and b!1073649 res!716057) b!1073642))

(assert (= (and b!1073643 c!107739) b!1073641))

(assert (= (and b!1073643 (not c!107739)) b!1073651))

(declare-fun b_lambda!16719 () Bool)

(assert (=> (not b_lambda!16719) (not b!1073642)))

(declare-fun t!32522 () Bool)

(declare-fun tb!7153 () Bool)

(assert (=> (and start!94960 (= defaultEntry!963 defaultEntry!963) t!32522) tb!7153))

(declare-fun result!14783 () Bool)

(assert (=> tb!7153 (= result!14783 tp_is_empty!25969)))

(assert (=> b!1073642 t!32522))

(declare-fun b_and!35001 () Bool)

(assert (= b_and!34995 (and (=> t!32522 result!14783) b_and!35001)))

(declare-fun b_lambda!16721 () Bool)

(assert (=> (not b_lambda!16721) (not b!1073645)))

(assert (=> b!1073645 t!32522))

(declare-fun b_and!35003 () Bool)

(assert (= b_and!35001 (and (=> t!32522 result!14783) b_and!35003)))

(declare-fun m!992077 () Bool)

(assert (=> b!1073645 m!992077))

(declare-fun m!992079 () Bool)

(assert (=> b!1073645 m!992079))

(declare-fun m!992081 () Bool)

(assert (=> b!1073645 m!992081))

(declare-fun m!992083 () Bool)

(assert (=> b!1073645 m!992083))

(assert (=> b!1073645 m!992077))

(declare-fun m!992085 () Bool)

(assert (=> b!1073645 m!992085))

(assert (=> b!1073645 m!992083))

(assert (=> b!1073645 m!992063))

(declare-fun m!992087 () Bool)

(assert (=> b!1073645 m!992087))

(assert (=> b!1073645 m!992079))

(declare-fun m!992089 () Bool)

(assert (=> b!1073645 m!992089))

(assert (=> b!1073650 m!992063))

(assert (=> b!1073650 m!992063))

(assert (=> b!1073650 m!992065))

(assert (=> b!1073647 m!992063))

(assert (=> b!1073647 m!992063))

(assert (=> b!1073647 m!992065))

(declare-fun m!992091 () Bool)

(assert (=> bm!45267 m!992091))

(assert (=> b!1073649 m!992063))

(assert (=> b!1073649 m!992063))

(declare-fun m!992093 () Bool)

(assert (=> b!1073649 m!992093))

(declare-fun m!992095 () Bool)

(assert (=> b!1073644 m!992095))

(declare-fun m!992097 () Bool)

(assert (=> b!1073651 m!992097))

(assert (=> b!1073641 m!992091))

(assert (=> b!1073642 m!992063))

(declare-fun m!992099 () Bool)

(assert (=> b!1073642 m!992099))

(assert (=> b!1073642 m!992077))

(assert (=> b!1073642 m!992083))

(assert (=> b!1073642 m!992077))

(assert (=> b!1073642 m!992085))

(assert (=> b!1073642 m!992083))

(assert (=> b!1073642 m!992063))

(declare-fun m!992101 () Bool)

(assert (=> d!129287 m!992101))

(assert (=> d!129287 m!992007))

(assert (=> b!1073549 d!129287))

(declare-fun e!613420 () Bool)

(declare-fun b!1073655 () Bool)

(declare-fun lt!475994 () ListLongMap!14629)

(assert (=> b!1073655 (= e!613420 (= lt!475994 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1073656 () Bool)

(assert (=> b!1073656 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(assert (=> b!1073656 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33647 _values!955)))))

(declare-fun e!613422 () Bool)

(assert (=> b!1073656 (= e!613422 (= (apply!926 lt!475994 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)) (get!17210 (select (arr!33109 _values!955) #b00000000000000000000000000000000) (dynLambda!2025 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1073657 () Bool)

(declare-fun e!613421 () Bool)

(assert (=> b!1073657 (= e!613421 e!613420)))

(declare-fun c!107743 () Bool)

(assert (=> b!1073657 (= c!107743 (bvslt #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(declare-fun b!1073658 () Bool)

(declare-fun res!716058 () Bool)

(declare-fun e!613424 () Bool)

(assert (=> b!1073658 (=> (not res!716058) (not e!613424))))

(assert (=> b!1073658 (= res!716058 (not (contains!6298 lt!475994 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!45268 () Bool)

(declare-fun call!45271 () ListLongMap!14629)

(assert (=> bm!45268 (= call!45271 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1073659 () Bool)

(declare-fun lt!475995 () Unit!35195)

(declare-fun lt!475991 () Unit!35195)

(assert (=> b!1073659 (= lt!475995 lt!475991)))

(declare-fun lt!475992 () (_ BitVec 64))

(declare-fun lt!475993 () ListLongMap!14629)

(declare-fun lt!475990 () (_ BitVec 64))

(declare-fun lt!475996 () V!39761)

(assert (=> b!1073659 (not (contains!6298 (+!3238 lt!475993 (tuple2!16661 lt!475990 lt!475996)) lt!475992))))

(assert (=> b!1073659 (= lt!475991 (addStillNotContains!262 lt!475993 lt!475990 lt!475996 lt!475992))))

(assert (=> b!1073659 (= lt!475992 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1073659 (= lt!475996 (get!17210 (select (arr!33109 _values!955) #b00000000000000000000000000000000) (dynLambda!2025 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1073659 (= lt!475990 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1073659 (= lt!475993 call!45271)))

(declare-fun e!613426 () ListLongMap!14629)

(assert (=> b!1073659 (= e!613426 (+!3238 call!45271 (tuple2!16661 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000) (get!17210 (select (arr!33109 _values!955) #b00000000000000000000000000000000) (dynLambda!2025 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1073660 () Bool)

(declare-fun e!613425 () ListLongMap!14629)

(assert (=> b!1073660 (= e!613425 (ListLongMap!14630 Nil!23182))))

(declare-fun b!1073661 () Bool)

(declare-fun e!613423 () Bool)

(assert (=> b!1073661 (= e!613423 (validKeyInArray!0 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073661 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1073662 () Bool)

(assert (=> b!1073662 (= e!613426 call!45271)))

(declare-fun b!1073663 () Bool)

(assert (=> b!1073663 (= e!613421 e!613422)))

(assert (=> b!1073663 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(declare-fun res!716061 () Bool)

(assert (=> b!1073663 (= res!716061 (contains!6298 lt!475994 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073663 (=> (not res!716061) (not e!613422))))

(declare-fun b!1073664 () Bool)

(assert (=> b!1073664 (= e!613425 e!613426)))

(declare-fun c!107741 () Bool)

(assert (=> b!1073664 (= c!107741 (validKeyInArray!0 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129289 () Bool)

(assert (=> d!129289 e!613424))

(declare-fun res!716059 () Bool)

(assert (=> d!129289 (=> (not res!716059) (not e!613424))))

(assert (=> d!129289 (= res!716059 (not (contains!6298 lt!475994 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129289 (= lt!475994 e!613425)))

(declare-fun c!107742 () Bool)

(assert (=> d!129289 (= c!107742 (bvsge #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(assert (=> d!129289 (validMask!0 mask!1515)))

(assert (=> d!129289 (= (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475994)))

(declare-fun b!1073665 () Bool)

(assert (=> b!1073665 (= e!613420 (isEmpty!956 lt!475994))))

(declare-fun b!1073666 () Bool)

(assert (=> b!1073666 (= e!613424 e!613421)))

(declare-fun c!107740 () Bool)

(assert (=> b!1073666 (= c!107740 e!613423)))

(declare-fun res!716060 () Bool)

(assert (=> b!1073666 (=> (not res!716060) (not e!613423))))

(assert (=> b!1073666 (= res!716060 (bvslt #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(assert (= (and d!129289 c!107742) b!1073660))

(assert (= (and d!129289 (not c!107742)) b!1073664))

(assert (= (and b!1073664 c!107741) b!1073659))

(assert (= (and b!1073664 (not c!107741)) b!1073662))

(assert (= (or b!1073659 b!1073662) bm!45268))

(assert (= (and d!129289 res!716059) b!1073658))

(assert (= (and b!1073658 res!716058) b!1073666))

(assert (= (and b!1073666 res!716060) b!1073661))

(assert (= (and b!1073666 c!107740) b!1073663))

(assert (= (and b!1073666 (not c!107740)) b!1073657))

(assert (= (and b!1073663 res!716061) b!1073656))

(assert (= (and b!1073657 c!107743) b!1073655))

(assert (= (and b!1073657 (not c!107743)) b!1073665))

(declare-fun b_lambda!16723 () Bool)

(assert (=> (not b_lambda!16723) (not b!1073656)))

(assert (=> b!1073656 t!32522))

(declare-fun b_and!35005 () Bool)

(assert (= b_and!35003 (and (=> t!32522 result!14783) b_and!35005)))

(declare-fun b_lambda!16725 () Bool)

(assert (=> (not b_lambda!16725) (not b!1073659)))

(assert (=> b!1073659 t!32522))

(declare-fun b_and!35007 () Bool)

(assert (= b_and!35005 (and (=> t!32522 result!14783) b_and!35007)))

(assert (=> b!1073659 m!992077))

(declare-fun m!992103 () Bool)

(assert (=> b!1073659 m!992103))

(declare-fun m!992105 () Bool)

(assert (=> b!1073659 m!992105))

(assert (=> b!1073659 m!992083))

(assert (=> b!1073659 m!992077))

(assert (=> b!1073659 m!992085))

(assert (=> b!1073659 m!992083))

(assert (=> b!1073659 m!992063))

(declare-fun m!992107 () Bool)

(assert (=> b!1073659 m!992107))

(assert (=> b!1073659 m!992103))

(declare-fun m!992109 () Bool)

(assert (=> b!1073659 m!992109))

(assert (=> b!1073664 m!992063))

(assert (=> b!1073664 m!992063))

(assert (=> b!1073664 m!992065))

(assert (=> b!1073661 m!992063))

(assert (=> b!1073661 m!992063))

(assert (=> b!1073661 m!992065))

(declare-fun m!992111 () Bool)

(assert (=> bm!45268 m!992111))

(assert (=> b!1073663 m!992063))

(assert (=> b!1073663 m!992063))

(declare-fun m!992113 () Bool)

(assert (=> b!1073663 m!992113))

(declare-fun m!992115 () Bool)

(assert (=> b!1073658 m!992115))

(declare-fun m!992117 () Bool)

(assert (=> b!1073665 m!992117))

(assert (=> b!1073655 m!992111))

(assert (=> b!1073656 m!992063))

(declare-fun m!992119 () Bool)

(assert (=> b!1073656 m!992119))

(assert (=> b!1073656 m!992077))

(assert (=> b!1073656 m!992083))

(assert (=> b!1073656 m!992077))

(assert (=> b!1073656 m!992085))

(assert (=> b!1073656 m!992083))

(assert (=> b!1073656 m!992063))

(declare-fun m!992121 () Bool)

(assert (=> d!129289 m!992121))

(assert (=> d!129289 m!992007))

(assert (=> b!1073549 d!129289))

(declare-fun d!129291 () Bool)

(assert (=> d!129291 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94960 d!129291))

(declare-fun d!129293 () Bool)

(assert (=> d!129293 (= (array_inv!25616 _values!955) (bvsge (size!33647 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94960 d!129293))

(declare-fun d!129295 () Bool)

(assert (=> d!129295 (= (array_inv!25617 _keys!1163) (bvsge (size!33648 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94960 d!129295))

(declare-fun b!1073677 () Bool)

(declare-fun e!613438 () Bool)

(declare-fun call!45274 () Bool)

(assert (=> b!1073677 (= e!613438 call!45274)))

(declare-fun b!1073678 () Bool)

(assert (=> b!1073678 (= e!613438 call!45274)))

(declare-fun b!1073679 () Bool)

(declare-fun e!613435 () Bool)

(declare-fun e!613436 () Bool)

(assert (=> b!1073679 (= e!613435 e!613436)))

(declare-fun res!716069 () Bool)

(assert (=> b!1073679 (=> (not res!716069) (not e!613436))))

(declare-fun e!613437 () Bool)

(assert (=> b!1073679 (= res!716069 (not e!613437))))

(declare-fun res!716068 () Bool)

(assert (=> b!1073679 (=> (not res!716068) (not e!613437))))

(assert (=> b!1073679 (= res!716068 (validKeyInArray!0 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129297 () Bool)

(declare-fun res!716070 () Bool)

(assert (=> d!129297 (=> res!716070 e!613435)))

(assert (=> d!129297 (= res!716070 (bvsge #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(assert (=> d!129297 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23183) e!613435)))

(declare-fun b!1073680 () Bool)

(declare-fun contains!6300 (List!23186 (_ BitVec 64)) Bool)

(assert (=> b!1073680 (= e!613437 (contains!6300 Nil!23183 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45271 () Bool)

(declare-fun c!107746 () Bool)

(assert (=> bm!45271 (= call!45274 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107746 (Cons!23182 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000) Nil!23183) Nil!23183)))))

(declare-fun b!1073681 () Bool)

(assert (=> b!1073681 (= e!613436 e!613438)))

(assert (=> b!1073681 (= c!107746 (validKeyInArray!0 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129297 (not res!716070)) b!1073679))

(assert (= (and b!1073679 res!716068) b!1073680))

(assert (= (and b!1073679 res!716069) b!1073681))

(assert (= (and b!1073681 c!107746) b!1073677))

(assert (= (and b!1073681 (not c!107746)) b!1073678))

(assert (= (or b!1073677 b!1073678) bm!45271))

(assert (=> b!1073679 m!992063))

(assert (=> b!1073679 m!992063))

(assert (=> b!1073679 m!992065))

(assert (=> b!1073680 m!992063))

(assert (=> b!1073680 m!992063))

(declare-fun m!992123 () Bool)

(assert (=> b!1073680 m!992123))

(assert (=> bm!45271 m!992063))

(declare-fun m!992125 () Bool)

(assert (=> bm!45271 m!992125))

(assert (=> b!1073681 m!992063))

(assert (=> b!1073681 m!992063))

(assert (=> b!1073681 m!992065))

(assert (=> b!1073555 d!129297))

(declare-fun d!129299 () Bool)

(declare-fun e!613443 () Bool)

(assert (=> d!129299 e!613443))

(declare-fun res!716073 () Bool)

(assert (=> d!129299 (=> res!716073 e!613443)))

(declare-fun lt!476007 () Bool)

(assert (=> d!129299 (= res!716073 (not lt!476007))))

(declare-fun lt!476006 () Bool)

(assert (=> d!129299 (= lt!476007 lt!476006)))

(declare-fun lt!476005 () Unit!35195)

(declare-fun e!613444 () Unit!35195)

(assert (=> d!129299 (= lt!476005 e!613444)))

(declare-fun c!107749 () Bool)

(assert (=> d!129299 (= c!107749 lt!476006)))

(declare-fun containsKey!576 (List!23185 (_ BitVec 64)) Bool)

(assert (=> d!129299 (= lt!476006 (containsKey!576 (toList!7330 (getCurrentListMap!4104 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129299 (= (contains!6298 (getCurrentListMap!4104 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000) lt!476007)))

(declare-fun b!1073688 () Bool)

(declare-fun lt!476008 () Unit!35195)

(assert (=> b!1073688 (= e!613444 lt!476008)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!408 (List!23185 (_ BitVec 64)) Unit!35195)

(assert (=> b!1073688 (= lt!476008 (lemmaContainsKeyImpliesGetValueByKeyDefined!408 (toList!7330 (getCurrentListMap!4104 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!658 0))(
  ( (Some!657 (v!15655 V!39761)) (None!656) )
))
(declare-fun isDefined!451 (Option!658) Bool)

(declare-fun getValueByKey!607 (List!23185 (_ BitVec 64)) Option!658)

(assert (=> b!1073688 (isDefined!451 (getValueByKey!607 (toList!7330 (getCurrentListMap!4104 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1073689 () Bool)

(declare-fun Unit!35201 () Unit!35195)

(assert (=> b!1073689 (= e!613444 Unit!35201)))

(declare-fun b!1073690 () Bool)

(assert (=> b!1073690 (= e!613443 (isDefined!451 (getValueByKey!607 (toList!7330 (getCurrentListMap!4104 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129299 c!107749) b!1073688))

(assert (= (and d!129299 (not c!107749)) b!1073689))

(assert (= (and d!129299 (not res!716073)) b!1073690))

(declare-fun m!992127 () Bool)

(assert (=> d!129299 m!992127))

(declare-fun m!992129 () Bool)

(assert (=> b!1073688 m!992129))

(declare-fun m!992131 () Bool)

(assert (=> b!1073688 m!992131))

(assert (=> b!1073688 m!992131))

(declare-fun m!992133 () Bool)

(assert (=> b!1073688 m!992133))

(assert (=> b!1073690 m!992131))

(assert (=> b!1073690 m!992131))

(assert (=> b!1073690 m!992133))

(assert (=> b!1073550 d!129299))

(declare-fun bm!45286 () Bool)

(declare-fun call!45294 () ListLongMap!14629)

(declare-fun call!45291 () ListLongMap!14629)

(assert (=> bm!45286 (= call!45294 call!45291)))

(declare-fun b!1073733 () Bool)

(declare-fun e!613483 () Unit!35195)

(declare-fun Unit!35202 () Unit!35195)

(assert (=> b!1073733 (= e!613483 Unit!35202)))

(declare-fun b!1073734 () Bool)

(declare-fun e!613471 () Bool)

(declare-fun lt!476058 () ListLongMap!14629)

(assert (=> b!1073734 (= e!613471 (= (apply!926 lt!476058 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1073735 () Bool)

(declare-fun e!613472 () Bool)

(declare-fun e!613481 () Bool)

(assert (=> b!1073735 (= e!613472 e!613481)))

(declare-fun c!107763 () Bool)

(assert (=> b!1073735 (= c!107763 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45287 () Bool)

(declare-fun call!45295 () Bool)

(assert (=> bm!45287 (= call!45295 (contains!6298 lt!476058 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1073736 () Bool)

(declare-fun e!613479 () Bool)

(assert (=> b!1073736 (= e!613479 (validKeyInArray!0 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073737 () Bool)

(declare-fun e!613474 () ListLongMap!14629)

(declare-fun call!45289 () ListLongMap!14629)

(assert (=> b!1073737 (= e!613474 (+!3238 call!45289 (tuple2!16661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1073738 () Bool)

(declare-fun e!613480 () Bool)

(assert (=> b!1073738 (= e!613480 (validKeyInArray!0 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073739 () Bool)

(declare-fun e!613478 () Bool)

(declare-fun call!45290 () Bool)

(assert (=> b!1073739 (= e!613478 (not call!45290))))

(declare-fun b!1073740 () Bool)

(declare-fun e!613475 () Bool)

(declare-fun e!613477 () Bool)

(assert (=> b!1073740 (= e!613475 e!613477)))

(declare-fun res!716096 () Bool)

(assert (=> b!1073740 (=> (not res!716096) (not e!613477))))

(assert (=> b!1073740 (= res!716096 (contains!6298 lt!476058 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(declare-fun b!1073741 () Bool)

(declare-fun lt!476059 () Unit!35195)

(assert (=> b!1073741 (= e!613483 lt!476059)))

(declare-fun lt!476069 () ListLongMap!14629)

(assert (=> b!1073741 (= lt!476069 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476053 () (_ BitVec 64))

(assert (=> b!1073741 (= lt!476053 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476066 () (_ BitVec 64))

(assert (=> b!1073741 (= lt!476066 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476073 () Unit!35195)

(declare-fun addStillContains!639 (ListLongMap!14629 (_ BitVec 64) V!39761 (_ BitVec 64)) Unit!35195)

(assert (=> b!1073741 (= lt!476073 (addStillContains!639 lt!476069 lt!476053 zeroValueBefore!47 lt!476066))))

(assert (=> b!1073741 (contains!6298 (+!3238 lt!476069 (tuple2!16661 lt!476053 zeroValueBefore!47)) lt!476066)))

(declare-fun lt!476072 () Unit!35195)

(assert (=> b!1073741 (= lt!476072 lt!476073)))

(declare-fun lt!476061 () ListLongMap!14629)

(assert (=> b!1073741 (= lt!476061 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476068 () (_ BitVec 64))

(assert (=> b!1073741 (= lt!476068 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476063 () (_ BitVec 64))

(assert (=> b!1073741 (= lt!476063 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476055 () Unit!35195)

(declare-fun addApplyDifferent!495 (ListLongMap!14629 (_ BitVec 64) V!39761 (_ BitVec 64)) Unit!35195)

(assert (=> b!1073741 (= lt!476055 (addApplyDifferent!495 lt!476061 lt!476068 minValue!907 lt!476063))))

(assert (=> b!1073741 (= (apply!926 (+!3238 lt!476061 (tuple2!16661 lt!476068 minValue!907)) lt!476063) (apply!926 lt!476061 lt!476063))))

(declare-fun lt!476054 () Unit!35195)

(assert (=> b!1073741 (= lt!476054 lt!476055)))

(declare-fun lt!476057 () ListLongMap!14629)

(assert (=> b!1073741 (= lt!476057 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476067 () (_ BitVec 64))

(assert (=> b!1073741 (= lt!476067 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476056 () (_ BitVec 64))

(assert (=> b!1073741 (= lt!476056 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476074 () Unit!35195)

(assert (=> b!1073741 (= lt!476074 (addApplyDifferent!495 lt!476057 lt!476067 zeroValueBefore!47 lt!476056))))

(assert (=> b!1073741 (= (apply!926 (+!3238 lt!476057 (tuple2!16661 lt!476067 zeroValueBefore!47)) lt!476056) (apply!926 lt!476057 lt!476056))))

(declare-fun lt!476064 () Unit!35195)

(assert (=> b!1073741 (= lt!476064 lt!476074)))

(declare-fun lt!476065 () ListLongMap!14629)

(assert (=> b!1073741 (= lt!476065 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476062 () (_ BitVec 64))

(assert (=> b!1073741 (= lt!476062 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476060 () (_ BitVec 64))

(assert (=> b!1073741 (= lt!476060 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1073741 (= lt!476059 (addApplyDifferent!495 lt!476065 lt!476062 minValue!907 lt!476060))))

(assert (=> b!1073741 (= (apply!926 (+!3238 lt!476065 (tuple2!16661 lt!476062 minValue!907)) lt!476060) (apply!926 lt!476065 lt!476060))))

(declare-fun b!1073742 () Bool)

(declare-fun c!107767 () Bool)

(assert (=> b!1073742 (= c!107767 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!613476 () ListLongMap!14629)

(declare-fun e!613482 () ListLongMap!14629)

(assert (=> b!1073742 (= e!613476 e!613482)))

(declare-fun b!1073743 () Bool)

(declare-fun call!45292 () ListLongMap!14629)

(assert (=> b!1073743 (= e!613482 call!45292)))

(declare-fun b!1073744 () Bool)

(declare-fun call!45293 () ListLongMap!14629)

(assert (=> b!1073744 (= e!613476 call!45293)))

(declare-fun b!1073745 () Bool)

(assert (=> b!1073745 (= e!613481 (not call!45295))))

(declare-fun b!1073746 () Bool)

(assert (=> b!1073746 (= e!613477 (= (apply!926 lt!476058 (select (arr!33110 _keys!1163) #b00000000000000000000000000000000)) (get!17210 (select (arr!33109 _values!955) #b00000000000000000000000000000000) (dynLambda!2025 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1073746 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33647 _values!955)))))

(assert (=> b!1073746 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(declare-fun b!1073747 () Bool)

(declare-fun e!613473 () Bool)

(assert (=> b!1073747 (= e!613473 (= (apply!926 lt!476058 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1073748 () Bool)

(declare-fun res!716097 () Bool)

(assert (=> b!1073748 (=> (not res!716097) (not e!613472))))

(assert (=> b!1073748 (= res!716097 e!613478)))

(declare-fun c!107762 () Bool)

(assert (=> b!1073748 (= c!107762 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073749 () Bool)

(assert (=> b!1073749 (= e!613478 e!613471)))

(declare-fun res!716094 () Bool)

(assert (=> b!1073749 (= res!716094 call!45290)))

(assert (=> b!1073749 (=> (not res!716094) (not e!613471))))

(declare-fun b!1073750 () Bool)

(assert (=> b!1073750 (= e!613482 call!45293)))

(declare-fun bm!45288 () Bool)

(assert (=> bm!45288 (= call!45293 call!45289)))

(declare-fun bm!45289 () Bool)

(assert (=> bm!45289 (= call!45290 (contains!6298 lt!476058 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!107765 () Bool)

(declare-fun bm!45290 () Bool)

(declare-fun c!107766 () Bool)

(assert (=> bm!45290 (= call!45289 (+!3238 (ite c!107766 call!45291 (ite c!107765 call!45294 call!45292)) (ite (or c!107766 c!107765) (tuple2!16661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45291 () Bool)

(assert (=> bm!45291 (= call!45292 call!45294)))

(declare-fun b!1073751 () Bool)

(assert (=> b!1073751 (= e!613481 e!613473)))

(declare-fun res!716100 () Bool)

(assert (=> b!1073751 (= res!716100 call!45295)))

(assert (=> b!1073751 (=> (not res!716100) (not e!613473))))

(declare-fun b!1073752 () Bool)

(assert (=> b!1073752 (= e!613474 e!613476)))

(assert (=> b!1073752 (= c!107765 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!129301 () Bool)

(assert (=> d!129301 e!613472))

(declare-fun res!716095 () Bool)

(assert (=> d!129301 (=> (not res!716095) (not e!613472))))

(assert (=> d!129301 (= res!716095 (or (bvsge #b00000000000000000000000000000000 (size!33648 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33648 _keys!1163)))))))

(declare-fun lt!476070 () ListLongMap!14629)

(assert (=> d!129301 (= lt!476058 lt!476070)))

(declare-fun lt!476071 () Unit!35195)

(assert (=> d!129301 (= lt!476071 e!613483)))

(declare-fun c!107764 () Bool)

(assert (=> d!129301 (= c!107764 e!613480)))

(declare-fun res!716092 () Bool)

(assert (=> d!129301 (=> (not res!716092) (not e!613480))))

(assert (=> d!129301 (= res!716092 (bvslt #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(assert (=> d!129301 (= lt!476070 e!613474)))

(assert (=> d!129301 (= c!107766 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129301 (validMask!0 mask!1515)))

(assert (=> d!129301 (= (getCurrentListMap!4104 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476058)))

(declare-fun bm!45292 () Bool)

(assert (=> bm!45292 (= call!45291 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073753 () Bool)

(declare-fun res!716098 () Bool)

(assert (=> b!1073753 (=> (not res!716098) (not e!613472))))

(assert (=> b!1073753 (= res!716098 e!613475)))

(declare-fun res!716093 () Bool)

(assert (=> b!1073753 (=> res!716093 e!613475)))

(assert (=> b!1073753 (= res!716093 (not e!613479))))

(declare-fun res!716099 () Bool)

(assert (=> b!1073753 (=> (not res!716099) (not e!613479))))

(assert (=> b!1073753 (= res!716099 (bvslt #b00000000000000000000000000000000 (size!33648 _keys!1163)))))

(assert (= (and d!129301 c!107766) b!1073737))

(assert (= (and d!129301 (not c!107766)) b!1073752))

(assert (= (and b!1073752 c!107765) b!1073744))

(assert (= (and b!1073752 (not c!107765)) b!1073742))

(assert (= (and b!1073742 c!107767) b!1073750))

(assert (= (and b!1073742 (not c!107767)) b!1073743))

(assert (= (or b!1073750 b!1073743) bm!45291))

(assert (= (or b!1073744 bm!45291) bm!45286))

(assert (= (or b!1073744 b!1073750) bm!45288))

(assert (= (or b!1073737 bm!45286) bm!45292))

(assert (= (or b!1073737 bm!45288) bm!45290))

(assert (= (and d!129301 res!716092) b!1073738))

(assert (= (and d!129301 c!107764) b!1073741))

(assert (= (and d!129301 (not c!107764)) b!1073733))

(assert (= (and d!129301 res!716095) b!1073753))

(assert (= (and b!1073753 res!716099) b!1073736))

(assert (= (and b!1073753 (not res!716093)) b!1073740))

(assert (= (and b!1073740 res!716096) b!1073746))

(assert (= (and b!1073753 res!716098) b!1073748))

(assert (= (and b!1073748 c!107762) b!1073749))

(assert (= (and b!1073748 (not c!107762)) b!1073739))

(assert (= (and b!1073749 res!716094) b!1073734))

(assert (= (or b!1073749 b!1073739) bm!45289))

(assert (= (and b!1073748 res!716097) b!1073735))

(assert (= (and b!1073735 c!107763) b!1073751))

(assert (= (and b!1073735 (not c!107763)) b!1073745))

(assert (= (and b!1073751 res!716100) b!1073747))

(assert (= (or b!1073751 b!1073745) bm!45287))

(declare-fun b_lambda!16727 () Bool)

(assert (=> (not b_lambda!16727) (not b!1073746)))

(assert (=> b!1073746 t!32522))

(declare-fun b_and!35009 () Bool)

(assert (= b_and!35007 (and (=> t!32522 result!14783) b_and!35009)))

(declare-fun m!992135 () Bool)

(assert (=> b!1073734 m!992135))

(assert (=> b!1073738 m!992063))

(assert (=> b!1073738 m!992063))

(assert (=> b!1073738 m!992065))

(assert (=> b!1073740 m!992063))

(assert (=> b!1073740 m!992063))

(declare-fun m!992137 () Bool)

(assert (=> b!1073740 m!992137))

(declare-fun m!992139 () Bool)

(assert (=> bm!45289 m!992139))

(declare-fun m!992141 () Bool)

(assert (=> bm!45290 m!992141))

(assert (=> b!1073736 m!992063))

(assert (=> b!1073736 m!992063))

(assert (=> b!1073736 m!992065))

(assert (=> d!129301 m!992007))

(declare-fun m!992143 () Bool)

(assert (=> b!1073747 m!992143))

(assert (=> b!1073746 m!992063))

(assert (=> b!1073746 m!992063))

(declare-fun m!992145 () Bool)

(assert (=> b!1073746 m!992145))

(assert (=> b!1073746 m!992077))

(assert (=> b!1073746 m!992083))

(assert (=> b!1073746 m!992083))

(assert (=> b!1073746 m!992077))

(assert (=> b!1073746 m!992085))

(assert (=> bm!45292 m!992017))

(declare-fun m!992147 () Bool)

(assert (=> b!1073737 m!992147))

(declare-fun m!992149 () Bool)

(assert (=> b!1073741 m!992149))

(declare-fun m!992151 () Bool)

(assert (=> b!1073741 m!992151))

(declare-fun m!992153 () Bool)

(assert (=> b!1073741 m!992153))

(declare-fun m!992155 () Bool)

(assert (=> b!1073741 m!992155))

(declare-fun m!992157 () Bool)

(assert (=> b!1073741 m!992157))

(declare-fun m!992159 () Bool)

(assert (=> b!1073741 m!992159))

(declare-fun m!992161 () Bool)

(assert (=> b!1073741 m!992161))

(assert (=> b!1073741 m!992157))

(declare-fun m!992163 () Bool)

(assert (=> b!1073741 m!992163))

(declare-fun m!992165 () Bool)

(assert (=> b!1073741 m!992165))

(declare-fun m!992167 () Bool)

(assert (=> b!1073741 m!992167))

(declare-fun m!992169 () Bool)

(assert (=> b!1073741 m!992169))

(declare-fun m!992171 () Bool)

(assert (=> b!1073741 m!992171))

(assert (=> b!1073741 m!992017))

(assert (=> b!1073741 m!992063))

(declare-fun m!992173 () Bool)

(assert (=> b!1073741 m!992173))

(declare-fun m!992175 () Bool)

(assert (=> b!1073741 m!992175))

(assert (=> b!1073741 m!992159))

(assert (=> b!1073741 m!992153))

(declare-fun m!992177 () Bool)

(assert (=> b!1073741 m!992177))

(assert (=> b!1073741 m!992173))

(declare-fun m!992179 () Bool)

(assert (=> bm!45287 m!992179))

(assert (=> b!1073550 d!129301))

(declare-fun mapIsEmpty!40678 () Bool)

(declare-fun mapRes!40678 () Bool)

(assert (=> mapIsEmpty!40678 mapRes!40678))

(declare-fun condMapEmpty!40678 () Bool)

(declare-fun mapDefault!40678 () ValueCell!12281)

(assert (=> mapNonEmpty!40669 (= condMapEmpty!40678 (= mapRest!40669 ((as const (Array (_ BitVec 32) ValueCell!12281)) mapDefault!40678)))))

(declare-fun e!613488 () Bool)

(assert (=> mapNonEmpty!40669 (= tp!77945 (and e!613488 mapRes!40678))))

(declare-fun mapNonEmpty!40678 () Bool)

(declare-fun tp!77960 () Bool)

(declare-fun e!613489 () Bool)

(assert (=> mapNonEmpty!40678 (= mapRes!40678 (and tp!77960 e!613489))))

(declare-fun mapKey!40678 () (_ BitVec 32))

(declare-fun mapRest!40678 () (Array (_ BitVec 32) ValueCell!12281))

(declare-fun mapValue!40678 () ValueCell!12281)

(assert (=> mapNonEmpty!40678 (= mapRest!40669 (store mapRest!40678 mapKey!40678 mapValue!40678))))

(declare-fun b!1073760 () Bool)

(assert (=> b!1073760 (= e!613489 tp_is_empty!25969)))

(declare-fun b!1073761 () Bool)

(assert (=> b!1073761 (= e!613488 tp_is_empty!25969)))

(assert (= (and mapNonEmpty!40669 condMapEmpty!40678) mapIsEmpty!40678))

(assert (= (and mapNonEmpty!40669 (not condMapEmpty!40678)) mapNonEmpty!40678))

(assert (= (and mapNonEmpty!40678 ((_ is ValueCellFull!12281) mapValue!40678)) b!1073760))

(assert (= (and mapNonEmpty!40669 ((_ is ValueCellFull!12281) mapDefault!40678)) b!1073761))

(declare-fun m!992181 () Bool)

(assert (=> mapNonEmpty!40678 m!992181))

(declare-fun b_lambda!16729 () Bool)

(assert (= b_lambda!16721 (or (and start!94960 b_free!22159) b_lambda!16729)))

(declare-fun b_lambda!16731 () Bool)

(assert (= b_lambda!16727 (or (and start!94960 b_free!22159) b_lambda!16731)))

(declare-fun b_lambda!16733 () Bool)

(assert (= b_lambda!16719 (or (and start!94960 b_free!22159) b_lambda!16733)))

(declare-fun b_lambda!16735 () Bool)

(assert (= b_lambda!16725 (or (and start!94960 b_free!22159) b_lambda!16735)))

(declare-fun b_lambda!16737 () Bool)

(assert (= b_lambda!16723 (or (and start!94960 b_free!22159) b_lambda!16737)))

(check-sat (not b!1073641) (not bm!45292) (not b_lambda!16733) (not b!1073665) (not b!1073736) (not b!1073738) (not b_lambda!16731) (not bm!45271) (not b!1073655) (not b!1073734) (not b!1073658) (not d!129287) (not b!1073656) (not bm!45267) (not d!129289) (not b!1073737) (not bm!45289) (not bm!45264) (not b!1073690) (not d!129299) (not b_next!22159) (not b!1073649) (not b!1073746) (not b!1073747) (not b!1073679) (not b!1073651) (not d!129301) (not b_lambda!16735) (not b!1073659) (not b!1073688) (not b!1073615) (not bm!45268) (not b!1073680) (not bm!45290) (not mapNonEmpty!40678) (not b!1073740) b_and!35009 tp_is_empty!25969 (not b!1073613) (not d!129285) (not b_lambda!16729) (not b!1073642) (not b!1073650) (not b!1073663) (not b_lambda!16737) (not b!1073647) (not b!1073645) (not b!1073681) (not bm!45287) (not b!1073644) (not b!1073664) (not b!1073661) (not b!1073741))
(check-sat b_and!35009 (not b_next!22159))
