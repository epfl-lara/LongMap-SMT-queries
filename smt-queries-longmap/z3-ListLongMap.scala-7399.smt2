; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94164 () Bool)

(assert start!94164)

(declare-fun b_free!21571 () Bool)

(declare-fun b_next!21571 () Bool)

(assert (=> start!94164 (= b_free!21571 (not b_next!21571))))

(declare-fun tp!76147 () Bool)

(declare-fun b_and!34295 () Bool)

(assert (=> start!94164 (= tp!76147 b_and!34295)))

(declare-fun b!1064795 () Bool)

(declare-fun e!606943 () Bool)

(declare-datatypes ((array!67694 0))(
  ( (array!67695 (arr!32551 (Array (_ BitVec 32) (_ BitVec 64))) (size!33089 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67694)

(assert (=> b!1064795 (= e!606943 (bvsle #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38977 0))(
  ( (V!38978 (val!12741 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38977)

(declare-datatypes ((tuple2!16200 0))(
  ( (tuple2!16201 (_1!8111 (_ BitVec 64)) (_2!8111 V!38977)) )
))
(declare-datatypes ((List!22749 0))(
  ( (Nil!22746) (Cons!22745 (h!23954 tuple2!16200) (t!32057 List!22749)) )
))
(declare-datatypes ((ListLongMap!14169 0))(
  ( (ListLongMap!14170 (toList!7100 List!22749)) )
))
(declare-fun lt!469257 () ListLongMap!14169)

(declare-datatypes ((ValueCell!11987 0))(
  ( (ValueCellFull!11987 (v!15352 V!38977)) (EmptyCell!11987) )
))
(declare-datatypes ((array!67696 0))(
  ( (array!67697 (arr!32552 (Array (_ BitVec 32) ValueCell!11987)) (size!33090 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67696)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38977)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!3978 (array!67694 array!67696 (_ BitVec 32) (_ BitVec 32) V!38977 V!38977 (_ BitVec 32) Int) ListLongMap!14169)

(assert (=> b!1064795 (= lt!469257 (getCurrentListMap!3978 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!710839 () Bool)

(declare-fun e!606938 () Bool)

(assert (=> start!94164 (=> (not res!710839) (not e!606938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94164 (= res!710839 (validMask!0 mask!1515))))

(assert (=> start!94164 e!606938))

(assert (=> start!94164 true))

(declare-fun tp_is_empty!25381 () Bool)

(assert (=> start!94164 tp_is_empty!25381))

(declare-fun e!606939 () Bool)

(declare-fun array_inv!25206 (array!67696) Bool)

(assert (=> start!94164 (and (array_inv!25206 _values!955) e!606939)))

(assert (=> start!94164 tp!76147))

(declare-fun array_inv!25207 (array!67694) Bool)

(assert (=> start!94164 (array_inv!25207 _keys!1163)))

(declare-fun mapNonEmpty!39754 () Bool)

(declare-fun mapRes!39754 () Bool)

(declare-fun tp!76148 () Bool)

(declare-fun e!606942 () Bool)

(assert (=> mapNonEmpty!39754 (= mapRes!39754 (and tp!76148 e!606942))))

(declare-fun mapKey!39754 () (_ BitVec 32))

(declare-fun mapRest!39754 () (Array (_ BitVec 32) ValueCell!11987))

(declare-fun mapValue!39754 () ValueCell!11987)

(assert (=> mapNonEmpty!39754 (= (arr!32552 _values!955) (store mapRest!39754 mapKey!39754 mapValue!39754))))

(declare-fun b!1064796 () Bool)

(declare-fun res!710842 () Bool)

(assert (=> b!1064796 (=> (not res!710842) (not e!606938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67694 (_ BitVec 32)) Bool)

(assert (=> b!1064796 (= res!710842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064797 () Bool)

(assert (=> b!1064797 (= e!606938 (not e!606943))))

(declare-fun res!710840 () Bool)

(assert (=> b!1064797 (=> res!710840 e!606943)))

(assert (=> b!1064797 (= res!710840 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469256 () ListLongMap!14169)

(declare-fun lt!469254 () ListLongMap!14169)

(assert (=> b!1064797 (= lt!469256 lt!469254)))

(declare-datatypes ((Unit!34787 0))(
  ( (Unit!34788) )
))
(declare-fun lt!469255 () Unit!34787)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38977)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!698 (array!67694 array!67696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38977 V!38977 V!38977 V!38977 (_ BitVec 32) Int) Unit!34787)

(assert (=> b!1064797 (= lt!469255 (lemmaNoChangeToArrayThenSameMapNoExtras!698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3704 (array!67694 array!67696 (_ BitVec 32) (_ BitVec 32) V!38977 V!38977 (_ BitVec 32) Int) ListLongMap!14169)

(assert (=> b!1064797 (= lt!469254 (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064797 (= lt!469256 (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064798 () Bool)

(assert (=> b!1064798 (= e!606942 tp_is_empty!25381)))

(declare-fun mapIsEmpty!39754 () Bool)

(assert (=> mapIsEmpty!39754 mapRes!39754))

(declare-fun b!1064799 () Bool)

(declare-fun res!710843 () Bool)

(assert (=> b!1064799 (=> (not res!710843) (not e!606938))))

(declare-datatypes ((List!22750 0))(
  ( (Nil!22747) (Cons!22746 (h!23955 (_ BitVec 64)) (t!32058 List!22750)) )
))
(declare-fun arrayNoDuplicates!0 (array!67694 (_ BitVec 32) List!22750) Bool)

(assert (=> b!1064799 (= res!710843 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22747))))

(declare-fun b!1064800 () Bool)

(declare-fun res!710841 () Bool)

(assert (=> b!1064800 (=> (not res!710841) (not e!606938))))

(assert (=> b!1064800 (= res!710841 (and (= (size!33090 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33089 _keys!1163) (size!33090 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064801 () Bool)

(declare-fun e!606940 () Bool)

(assert (=> b!1064801 (= e!606940 tp_is_empty!25381)))

(declare-fun b!1064802 () Bool)

(assert (=> b!1064802 (= e!606939 (and e!606940 mapRes!39754))))

(declare-fun condMapEmpty!39754 () Bool)

(declare-fun mapDefault!39754 () ValueCell!11987)

(assert (=> b!1064802 (= condMapEmpty!39754 (= (arr!32552 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11987)) mapDefault!39754)))))

(assert (= (and start!94164 res!710839) b!1064800))

(assert (= (and b!1064800 res!710841) b!1064796))

(assert (= (and b!1064796 res!710842) b!1064799))

(assert (= (and b!1064799 res!710843) b!1064797))

(assert (= (and b!1064797 (not res!710840)) b!1064795))

(assert (= (and b!1064802 condMapEmpty!39754) mapIsEmpty!39754))

(assert (= (and b!1064802 (not condMapEmpty!39754)) mapNonEmpty!39754))

(get-info :version)

(assert (= (and mapNonEmpty!39754 ((_ is ValueCellFull!11987) mapValue!39754)) b!1064798))

(assert (= (and b!1064802 ((_ is ValueCellFull!11987) mapDefault!39754)) b!1064801))

(assert (= start!94164 b!1064802))

(declare-fun m!982783 () Bool)

(assert (=> b!1064796 m!982783))

(declare-fun m!982785 () Bool)

(assert (=> b!1064799 m!982785))

(declare-fun m!982787 () Bool)

(assert (=> mapNonEmpty!39754 m!982787))

(declare-fun m!982789 () Bool)

(assert (=> b!1064795 m!982789))

(declare-fun m!982791 () Bool)

(assert (=> b!1064797 m!982791))

(declare-fun m!982793 () Bool)

(assert (=> b!1064797 m!982793))

(declare-fun m!982795 () Bool)

(assert (=> b!1064797 m!982795))

(declare-fun m!982797 () Bool)

(assert (=> start!94164 m!982797))

(declare-fun m!982799 () Bool)

(assert (=> start!94164 m!982799))

(declare-fun m!982801 () Bool)

(assert (=> start!94164 m!982801))

(check-sat b_and!34295 (not b!1064795) (not start!94164) (not b!1064796) (not b_next!21571) (not b!1064797) (not mapNonEmpty!39754) tp_is_empty!25381 (not b!1064799))
(check-sat b_and!34295 (not b_next!21571))
(get-model)

(declare-fun bm!44970 () Bool)

(declare-fun call!44974 () ListLongMap!14169)

(declare-fun call!44973 () ListLongMap!14169)

(assert (=> bm!44970 (= call!44974 call!44973)))

(declare-fun b!1064893 () Bool)

(declare-fun e!607009 () Unit!34787)

(declare-fun Unit!34789 () Unit!34787)

(assert (=> b!1064893 (= e!607009 Unit!34789)))

(declare-fun b!1064894 () Bool)

(declare-fun e!607008 () Bool)

(declare-fun lt!469338 () ListLongMap!14169)

(declare-fun apply!915 (ListLongMap!14169 (_ BitVec 64)) V!38977)

(assert (=> b!1064894 (= e!607008 (= (apply!915 lt!469338 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1064895 () Bool)

(declare-fun e!607017 () Bool)

(assert (=> b!1064895 (= e!607017 e!607008)))

(declare-fun res!710900 () Bool)

(declare-fun call!44978 () Bool)

(assert (=> b!1064895 (= res!710900 call!44978)))

(assert (=> b!1064895 (=> (not res!710900) (not e!607008))))

(declare-fun b!1064896 () Bool)

(declare-fun e!607010 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1064896 (= e!607010 (validKeyInArray!0 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064897 () Bool)

(declare-fun res!710895 () Bool)

(declare-fun e!607013 () Bool)

(assert (=> b!1064897 (=> (not res!710895) (not e!607013))))

(declare-fun e!607011 () Bool)

(assert (=> b!1064897 (= res!710895 e!607011)))

(declare-fun res!710899 () Bool)

(assert (=> b!1064897 (=> res!710899 e!607011)))

(assert (=> b!1064897 (= res!710899 (not e!607010))))

(declare-fun res!710893 () Bool)

(assert (=> b!1064897 (=> (not res!710893) (not e!607010))))

(assert (=> b!1064897 (= res!710893 (bvslt #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(declare-fun b!1064898 () Bool)

(declare-fun c!107321 () Bool)

(assert (=> b!1064898 (= c!107321 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!607014 () ListLongMap!14169)

(declare-fun e!607012 () ListLongMap!14169)

(assert (=> b!1064898 (= e!607014 e!607012)))

(declare-fun bm!44971 () Bool)

(declare-fun call!44977 () ListLongMap!14169)

(assert (=> bm!44971 (= call!44977 (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064899 () Bool)

(declare-fun e!607006 () Bool)

(assert (=> b!1064899 (= e!607013 e!607006)))

(declare-fun c!107325 () Bool)

(assert (=> b!1064899 (= c!107325 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1064900 () Bool)

(declare-fun e!607018 () Bool)

(assert (=> b!1064900 (= e!607006 e!607018)))

(declare-fun res!710896 () Bool)

(declare-fun call!44975 () Bool)

(assert (=> b!1064900 (= res!710896 call!44975)))

(assert (=> b!1064900 (=> (not res!710896) (not e!607018))))

(declare-fun b!1064901 () Bool)

(assert (=> b!1064901 (= e!607006 (not call!44975))))

(declare-fun b!1064902 () Bool)

(declare-fun call!44979 () ListLongMap!14169)

(assert (=> b!1064902 (= e!607012 call!44979)))

(declare-fun b!1064903 () Bool)

(declare-fun res!710898 () Bool)

(assert (=> b!1064903 (=> (not res!710898) (not e!607013))))

(assert (=> b!1064903 (= res!710898 e!607017)))

(declare-fun c!107326 () Bool)

(assert (=> b!1064903 (= c!107326 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064904 () Bool)

(assert (=> b!1064904 (= e!607018 (= (apply!915 lt!469338 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!44972 () Bool)

(declare-fun call!44976 () ListLongMap!14169)

(assert (=> bm!44972 (= call!44979 call!44976)))

(declare-fun c!107322 () Bool)

(declare-fun c!107323 () Bool)

(declare-fun bm!44973 () Bool)

(declare-fun +!3146 (ListLongMap!14169 tuple2!16200) ListLongMap!14169)

(assert (=> bm!44973 (= call!44976 (+!3146 (ite c!107323 call!44977 (ite c!107322 call!44973 call!44974)) (ite (or c!107323 c!107322) (tuple2!16201 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16201 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!44974 () Bool)

(assert (=> bm!44974 (= call!44973 call!44977)))

(declare-fun bm!44975 () Bool)

(declare-fun contains!6235 (ListLongMap!14169 (_ BitVec 64)) Bool)

(assert (=> bm!44975 (= call!44975 (contains!6235 lt!469338 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064906 () Bool)

(declare-fun lt!469328 () Unit!34787)

(assert (=> b!1064906 (= e!607009 lt!469328)))

(declare-fun lt!469341 () ListLongMap!14169)

(assert (=> b!1064906 (= lt!469341 (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469335 () (_ BitVec 64))

(assert (=> b!1064906 (= lt!469335 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!469342 () (_ BitVec 64))

(assert (=> b!1064906 (= lt!469342 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!469347 () Unit!34787)

(declare-fun addStillContains!631 (ListLongMap!14169 (_ BitVec 64) V!38977 (_ BitVec 64)) Unit!34787)

(assert (=> b!1064906 (= lt!469347 (addStillContains!631 lt!469341 lt!469335 zeroValueBefore!47 lt!469342))))

(assert (=> b!1064906 (contains!6235 (+!3146 lt!469341 (tuple2!16201 lt!469335 zeroValueBefore!47)) lt!469342)))

(declare-fun lt!469340 () Unit!34787)

(assert (=> b!1064906 (= lt!469340 lt!469347)))

(declare-fun lt!469333 () ListLongMap!14169)

(assert (=> b!1064906 (= lt!469333 (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469337 () (_ BitVec 64))

(assert (=> b!1064906 (= lt!469337 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!469331 () (_ BitVec 64))

(assert (=> b!1064906 (= lt!469331 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!469332 () Unit!34787)

(declare-fun addApplyDifferent!487 (ListLongMap!14169 (_ BitVec 64) V!38977 (_ BitVec 64)) Unit!34787)

(assert (=> b!1064906 (= lt!469332 (addApplyDifferent!487 lt!469333 lt!469337 minValue!907 lt!469331))))

(assert (=> b!1064906 (= (apply!915 (+!3146 lt!469333 (tuple2!16201 lt!469337 minValue!907)) lt!469331) (apply!915 lt!469333 lt!469331))))

(declare-fun lt!469327 () Unit!34787)

(assert (=> b!1064906 (= lt!469327 lt!469332)))

(declare-fun lt!469346 () ListLongMap!14169)

(assert (=> b!1064906 (= lt!469346 (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469336 () (_ BitVec 64))

(assert (=> b!1064906 (= lt!469336 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!469326 () (_ BitVec 64))

(assert (=> b!1064906 (= lt!469326 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!469344 () Unit!34787)

(assert (=> b!1064906 (= lt!469344 (addApplyDifferent!487 lt!469346 lt!469336 zeroValueBefore!47 lt!469326))))

(assert (=> b!1064906 (= (apply!915 (+!3146 lt!469346 (tuple2!16201 lt!469336 zeroValueBefore!47)) lt!469326) (apply!915 lt!469346 lt!469326))))

(declare-fun lt!469339 () Unit!34787)

(assert (=> b!1064906 (= lt!469339 lt!469344)))

(declare-fun lt!469330 () ListLongMap!14169)

(assert (=> b!1064906 (= lt!469330 (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469345 () (_ BitVec 64))

(assert (=> b!1064906 (= lt!469345 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!469343 () (_ BitVec 64))

(assert (=> b!1064906 (= lt!469343 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1064906 (= lt!469328 (addApplyDifferent!487 lt!469330 lt!469345 minValue!907 lt!469343))))

(assert (=> b!1064906 (= (apply!915 (+!3146 lt!469330 (tuple2!16201 lt!469345 minValue!907)) lt!469343) (apply!915 lt!469330 lt!469343))))

(declare-fun b!1064907 () Bool)

(declare-fun e!607015 () Bool)

(assert (=> b!1064907 (= e!607011 e!607015)))

(declare-fun res!710897 () Bool)

(assert (=> b!1064907 (=> (not res!710897) (not e!607015))))

(assert (=> b!1064907 (= res!710897 (contains!6235 lt!469338 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064907 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(declare-fun b!1064908 () Bool)

(assert (=> b!1064908 (= e!607014 call!44979)))

(declare-fun b!1064909 () Bool)

(assert (=> b!1064909 (= e!607012 call!44974)))

(declare-fun b!1064910 () Bool)

(assert (=> b!1064910 (= e!607017 (not call!44978))))

(declare-fun b!1064911 () Bool)

(declare-fun e!607016 () Bool)

(assert (=> b!1064911 (= e!607016 (validKeyInArray!0 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064912 () Bool)

(declare-fun get!17003 (ValueCell!11987 V!38977) V!38977)

(declare-fun dynLambda!2014 (Int (_ BitVec 64)) V!38977)

(assert (=> b!1064912 (= e!607015 (= (apply!915 lt!469338 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)) (get!17003 (select (arr!32552 _values!955) #b00000000000000000000000000000000) (dynLambda!2014 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1064912 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33090 _values!955)))))

(assert (=> b!1064912 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(declare-fun bm!44976 () Bool)

(assert (=> bm!44976 (= call!44978 (contains!6235 lt!469338 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064913 () Bool)

(declare-fun e!607007 () ListLongMap!14169)

(assert (=> b!1064913 (= e!607007 (+!3146 call!44976 (tuple2!16201 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1064905 () Bool)

(assert (=> b!1064905 (= e!607007 e!607014)))

(assert (=> b!1064905 (= c!107322 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!128825 () Bool)

(assert (=> d!128825 e!607013))

(declare-fun res!710894 () Bool)

(assert (=> d!128825 (=> (not res!710894) (not e!607013))))

(assert (=> d!128825 (= res!710894 (or (bvsge #b00000000000000000000000000000000 (size!33089 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33089 _keys!1163)))))))

(declare-fun lt!469334 () ListLongMap!14169)

(assert (=> d!128825 (= lt!469338 lt!469334)))

(declare-fun lt!469329 () Unit!34787)

(assert (=> d!128825 (= lt!469329 e!607009)))

(declare-fun c!107324 () Bool)

(assert (=> d!128825 (= c!107324 e!607016)))

(declare-fun res!710892 () Bool)

(assert (=> d!128825 (=> (not res!710892) (not e!607016))))

(assert (=> d!128825 (= res!710892 (bvslt #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(assert (=> d!128825 (= lt!469334 e!607007)))

(assert (=> d!128825 (= c!107323 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!128825 (validMask!0 mask!1515)))

(assert (=> d!128825 (= (getCurrentListMap!3978 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469338)))

(assert (= (and d!128825 c!107323) b!1064913))

(assert (= (and d!128825 (not c!107323)) b!1064905))

(assert (= (and b!1064905 c!107322) b!1064908))

(assert (= (and b!1064905 (not c!107322)) b!1064898))

(assert (= (and b!1064898 c!107321) b!1064902))

(assert (= (and b!1064898 (not c!107321)) b!1064909))

(assert (= (or b!1064902 b!1064909) bm!44970))

(assert (= (or b!1064908 bm!44970) bm!44974))

(assert (= (or b!1064908 b!1064902) bm!44972))

(assert (= (or b!1064913 bm!44974) bm!44971))

(assert (= (or b!1064913 bm!44972) bm!44973))

(assert (= (and d!128825 res!710892) b!1064911))

(assert (= (and d!128825 c!107324) b!1064906))

(assert (= (and d!128825 (not c!107324)) b!1064893))

(assert (= (and d!128825 res!710894) b!1064897))

(assert (= (and b!1064897 res!710893) b!1064896))

(assert (= (and b!1064897 (not res!710899)) b!1064907))

(assert (= (and b!1064907 res!710897) b!1064912))

(assert (= (and b!1064897 res!710895) b!1064903))

(assert (= (and b!1064903 c!107326) b!1064895))

(assert (= (and b!1064903 (not c!107326)) b!1064910))

(assert (= (and b!1064895 res!710900) b!1064894))

(assert (= (or b!1064895 b!1064910) bm!44976))

(assert (= (and b!1064903 res!710898) b!1064899))

(assert (= (and b!1064899 c!107325) b!1064900))

(assert (= (and b!1064899 (not c!107325)) b!1064901))

(assert (= (and b!1064900 res!710896) b!1064904))

(assert (= (or b!1064900 b!1064901) bm!44975))

(declare-fun b_lambda!16495 () Bool)

(assert (=> (not b_lambda!16495) (not b!1064912)))

(declare-fun t!32061 () Bool)

(declare-fun tb!7131 () Bool)

(assert (=> (and start!94164 (= defaultEntry!963 defaultEntry!963) t!32061) tb!7131))

(declare-fun result!14717 () Bool)

(assert (=> tb!7131 (= result!14717 tp_is_empty!25381)))

(assert (=> b!1064912 t!32061))

(declare-fun b_and!34301 () Bool)

(assert (= b_and!34295 (and (=> t!32061 result!14717) b_and!34301)))

(declare-fun m!982843 () Bool)

(assert (=> b!1064894 m!982843))

(assert (=> bm!44971 m!982795))

(declare-fun m!982845 () Bool)

(assert (=> b!1064906 m!982845))

(declare-fun m!982847 () Bool)

(assert (=> b!1064906 m!982847))

(declare-fun m!982849 () Bool)

(assert (=> b!1064906 m!982849))

(declare-fun m!982851 () Bool)

(assert (=> b!1064906 m!982851))

(declare-fun m!982853 () Bool)

(assert (=> b!1064906 m!982853))

(declare-fun m!982855 () Bool)

(assert (=> b!1064906 m!982855))

(declare-fun m!982857 () Bool)

(assert (=> b!1064906 m!982857))

(assert (=> b!1064906 m!982853))

(declare-fun m!982859 () Bool)

(assert (=> b!1064906 m!982859))

(declare-fun m!982861 () Bool)

(assert (=> b!1064906 m!982861))

(declare-fun m!982863 () Bool)

(assert (=> b!1064906 m!982863))

(assert (=> b!1064906 m!982847))

(assert (=> b!1064906 m!982859))

(declare-fun m!982865 () Bool)

(assert (=> b!1064906 m!982865))

(assert (=> b!1064906 m!982845))

(declare-fun m!982867 () Bool)

(assert (=> b!1064906 m!982867))

(declare-fun m!982869 () Bool)

(assert (=> b!1064906 m!982869))

(declare-fun m!982871 () Bool)

(assert (=> b!1064906 m!982871))

(declare-fun m!982873 () Bool)

(assert (=> b!1064906 m!982873))

(declare-fun m!982875 () Bool)

(assert (=> b!1064906 m!982875))

(assert (=> b!1064906 m!982795))

(assert (=> b!1064911 m!982857))

(assert (=> b!1064911 m!982857))

(declare-fun m!982877 () Bool)

(assert (=> b!1064911 m!982877))

(declare-fun m!982879 () Bool)

(assert (=> bm!44976 m!982879))

(assert (=> d!128825 m!982797))

(declare-fun m!982881 () Bool)

(assert (=> b!1064913 m!982881))

(declare-fun m!982883 () Bool)

(assert (=> bm!44973 m!982883))

(assert (=> b!1064907 m!982857))

(assert (=> b!1064907 m!982857))

(declare-fun m!982885 () Bool)

(assert (=> b!1064907 m!982885))

(declare-fun m!982887 () Bool)

(assert (=> b!1064912 m!982887))

(declare-fun m!982889 () Bool)

(assert (=> b!1064912 m!982889))

(declare-fun m!982891 () Bool)

(assert (=> b!1064912 m!982891))

(assert (=> b!1064912 m!982889))

(assert (=> b!1064912 m!982857))

(assert (=> b!1064912 m!982887))

(assert (=> b!1064912 m!982857))

(declare-fun m!982893 () Bool)

(assert (=> b!1064912 m!982893))

(assert (=> b!1064896 m!982857))

(assert (=> b!1064896 m!982857))

(assert (=> b!1064896 m!982877))

(declare-fun m!982895 () Bool)

(assert (=> b!1064904 m!982895))

(declare-fun m!982897 () Bool)

(assert (=> bm!44975 m!982897))

(assert (=> b!1064795 d!128825))

(declare-fun d!128827 () Bool)

(assert (=> d!128827 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94164 d!128827))

(declare-fun d!128829 () Bool)

(assert (=> d!128829 (= (array_inv!25206 _values!955) (bvsge (size!33090 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94164 d!128829))

(declare-fun d!128831 () Bool)

(assert (=> d!128831 (= (array_inv!25207 _keys!1163) (bvsge (size!33089 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94164 d!128831))

(declare-fun d!128833 () Bool)

(assert (=> d!128833 (= (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469350 () Unit!34787)

(declare-fun choose!1736 (array!67694 array!67696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38977 V!38977 V!38977 V!38977 (_ BitVec 32) Int) Unit!34787)

(assert (=> d!128833 (= lt!469350 (choose!1736 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!128833 (validMask!0 mask!1515)))

(assert (=> d!128833 (= (lemmaNoChangeToArrayThenSameMapNoExtras!698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469350)))

(declare-fun bs!31300 () Bool)

(assert (= bs!31300 d!128833))

(assert (=> bs!31300 m!982795))

(assert (=> bs!31300 m!982793))

(declare-fun m!982899 () Bool)

(assert (=> bs!31300 m!982899))

(assert (=> bs!31300 m!982797))

(assert (=> b!1064797 d!128833))

(declare-fun lt!469368 () ListLongMap!14169)

(declare-fun b!1064940 () Bool)

(declare-fun e!607033 () Bool)

(assert (=> b!1064940 (= e!607033 (= lt!469368 (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1064941 () Bool)

(declare-fun e!607038 () ListLongMap!14169)

(declare-fun e!607035 () ListLongMap!14169)

(assert (=> b!1064941 (= e!607038 e!607035)))

(declare-fun c!107335 () Bool)

(assert (=> b!1064941 (= c!107335 (validKeyInArray!0 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064942 () Bool)

(declare-fun e!607036 () Bool)

(assert (=> b!1064942 (= e!607036 e!607033)))

(declare-fun c!107338 () Bool)

(assert (=> b!1064942 (= c!107338 (bvslt #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(declare-fun b!1064943 () Bool)

(declare-fun e!607037 () Bool)

(assert (=> b!1064943 (= e!607037 (validKeyInArray!0 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064943 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!128835 () Bool)

(declare-fun e!607039 () Bool)

(assert (=> d!128835 e!607039))

(declare-fun res!710911 () Bool)

(assert (=> d!128835 (=> (not res!710911) (not e!607039))))

(assert (=> d!128835 (= res!710911 (not (contains!6235 lt!469368 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128835 (= lt!469368 e!607038)))

(declare-fun c!107336 () Bool)

(assert (=> d!128835 (= c!107336 (bvsge #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(assert (=> d!128835 (validMask!0 mask!1515)))

(assert (=> d!128835 (= (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469368)))

(declare-fun bm!44979 () Bool)

(declare-fun call!44982 () ListLongMap!14169)

(assert (=> bm!44979 (= call!44982 (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1064944 () Bool)

(declare-fun lt!469366 () Unit!34787)

(declare-fun lt!469371 () Unit!34787)

(assert (=> b!1064944 (= lt!469366 lt!469371)))

(declare-fun lt!469365 () (_ BitVec 64))

(declare-fun lt!469369 () ListLongMap!14169)

(declare-fun lt!469370 () V!38977)

(declare-fun lt!469367 () (_ BitVec 64))

(assert (=> b!1064944 (not (contains!6235 (+!3146 lt!469369 (tuple2!16201 lt!469365 lt!469370)) lt!469367))))

(declare-fun addStillNotContains!251 (ListLongMap!14169 (_ BitVec 64) V!38977 (_ BitVec 64)) Unit!34787)

(assert (=> b!1064944 (= lt!469371 (addStillNotContains!251 lt!469369 lt!469365 lt!469370 lt!469367))))

(assert (=> b!1064944 (= lt!469367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1064944 (= lt!469370 (get!17003 (select (arr!32552 _values!955) #b00000000000000000000000000000000) (dynLambda!2014 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1064944 (= lt!469365 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1064944 (= lt!469369 call!44982)))

(assert (=> b!1064944 (= e!607035 (+!3146 call!44982 (tuple2!16201 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000) (get!17003 (select (arr!32552 _values!955) #b00000000000000000000000000000000) (dynLambda!2014 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1064945 () Bool)

(assert (=> b!1064945 (= e!607035 call!44982)))

(declare-fun b!1064946 () Bool)

(assert (=> b!1064946 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(assert (=> b!1064946 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33090 _values!955)))))

(declare-fun e!607034 () Bool)

(assert (=> b!1064946 (= e!607034 (= (apply!915 lt!469368 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)) (get!17003 (select (arr!32552 _values!955) #b00000000000000000000000000000000) (dynLambda!2014 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1064947 () Bool)

(declare-fun isEmpty!945 (ListLongMap!14169) Bool)

(assert (=> b!1064947 (= e!607033 (isEmpty!945 lt!469368))))

(declare-fun b!1064948 () Bool)

(declare-fun res!710912 () Bool)

(assert (=> b!1064948 (=> (not res!710912) (not e!607039))))

(assert (=> b!1064948 (= res!710912 (not (contains!6235 lt!469368 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1064949 () Bool)

(assert (=> b!1064949 (= e!607038 (ListLongMap!14170 Nil!22746))))

(declare-fun b!1064950 () Bool)

(assert (=> b!1064950 (= e!607036 e!607034)))

(assert (=> b!1064950 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(declare-fun res!710910 () Bool)

(assert (=> b!1064950 (= res!710910 (contains!6235 lt!469368 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064950 (=> (not res!710910) (not e!607034))))

(declare-fun b!1064951 () Bool)

(assert (=> b!1064951 (= e!607039 e!607036)))

(declare-fun c!107337 () Bool)

(assert (=> b!1064951 (= c!107337 e!607037)))

(declare-fun res!710909 () Bool)

(assert (=> b!1064951 (=> (not res!710909) (not e!607037))))

(assert (=> b!1064951 (= res!710909 (bvslt #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(assert (= (and d!128835 c!107336) b!1064949))

(assert (= (and d!128835 (not c!107336)) b!1064941))

(assert (= (and b!1064941 c!107335) b!1064944))

(assert (= (and b!1064941 (not c!107335)) b!1064945))

(assert (= (or b!1064944 b!1064945) bm!44979))

(assert (= (and d!128835 res!710911) b!1064948))

(assert (= (and b!1064948 res!710912) b!1064951))

(assert (= (and b!1064951 res!710909) b!1064943))

(assert (= (and b!1064951 c!107337) b!1064950))

(assert (= (and b!1064951 (not c!107337)) b!1064942))

(assert (= (and b!1064950 res!710910) b!1064946))

(assert (= (and b!1064942 c!107338) b!1064940))

(assert (= (and b!1064942 (not c!107338)) b!1064947))

(declare-fun b_lambda!16497 () Bool)

(assert (=> (not b_lambda!16497) (not b!1064944)))

(assert (=> b!1064944 t!32061))

(declare-fun b_and!34303 () Bool)

(assert (= b_and!34301 (and (=> t!32061 result!14717) b_and!34303)))

(declare-fun b_lambda!16499 () Bool)

(assert (=> (not b_lambda!16499) (not b!1064946)))

(assert (=> b!1064946 t!32061))

(declare-fun b_and!34305 () Bool)

(assert (= b_and!34303 (and (=> t!32061 result!14717) b_and!34305)))

(assert (=> b!1064941 m!982857))

(assert (=> b!1064941 m!982857))

(assert (=> b!1064941 m!982877))

(assert (=> b!1064946 m!982887))

(assert (=> b!1064946 m!982889))

(assert (=> b!1064946 m!982891))

(assert (=> b!1064946 m!982887))

(assert (=> b!1064946 m!982857))

(assert (=> b!1064946 m!982857))

(declare-fun m!982901 () Bool)

(assert (=> b!1064946 m!982901))

(assert (=> b!1064946 m!982889))

(assert (=> b!1064950 m!982857))

(assert (=> b!1064950 m!982857))

(declare-fun m!982903 () Bool)

(assert (=> b!1064950 m!982903))

(declare-fun m!982905 () Bool)

(assert (=> b!1064948 m!982905))

(assert (=> b!1064943 m!982857))

(assert (=> b!1064943 m!982857))

(assert (=> b!1064943 m!982877))

(declare-fun m!982907 () Bool)

(assert (=> b!1064940 m!982907))

(declare-fun m!982909 () Bool)

(assert (=> b!1064947 m!982909))

(declare-fun m!982911 () Bool)

(assert (=> b!1064944 m!982911))

(assert (=> b!1064944 m!982911))

(declare-fun m!982913 () Bool)

(assert (=> b!1064944 m!982913))

(assert (=> b!1064944 m!982887))

(assert (=> b!1064944 m!982889))

(assert (=> b!1064944 m!982891))

(assert (=> b!1064944 m!982887))

(declare-fun m!982915 () Bool)

(assert (=> b!1064944 m!982915))

(assert (=> b!1064944 m!982857))

(declare-fun m!982917 () Bool)

(assert (=> b!1064944 m!982917))

(assert (=> b!1064944 m!982889))

(assert (=> bm!44979 m!982907))

(declare-fun m!982919 () Bool)

(assert (=> d!128835 m!982919))

(assert (=> d!128835 m!982797))

(assert (=> b!1064797 d!128835))

(declare-fun e!607040 () Bool)

(declare-fun b!1064952 () Bool)

(declare-fun lt!469375 () ListLongMap!14169)

(assert (=> b!1064952 (= e!607040 (= lt!469375 (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1064953 () Bool)

(declare-fun e!607045 () ListLongMap!14169)

(declare-fun e!607042 () ListLongMap!14169)

(assert (=> b!1064953 (= e!607045 e!607042)))

(declare-fun c!107339 () Bool)

(assert (=> b!1064953 (= c!107339 (validKeyInArray!0 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064954 () Bool)

(declare-fun e!607043 () Bool)

(assert (=> b!1064954 (= e!607043 e!607040)))

(declare-fun c!107342 () Bool)

(assert (=> b!1064954 (= c!107342 (bvslt #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(declare-fun b!1064955 () Bool)

(declare-fun e!607044 () Bool)

(assert (=> b!1064955 (= e!607044 (validKeyInArray!0 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064955 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!128837 () Bool)

(declare-fun e!607046 () Bool)

(assert (=> d!128837 e!607046))

(declare-fun res!710915 () Bool)

(assert (=> d!128837 (=> (not res!710915) (not e!607046))))

(assert (=> d!128837 (= res!710915 (not (contains!6235 lt!469375 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128837 (= lt!469375 e!607045)))

(declare-fun c!107340 () Bool)

(assert (=> d!128837 (= c!107340 (bvsge #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(assert (=> d!128837 (validMask!0 mask!1515)))

(assert (=> d!128837 (= (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469375)))

(declare-fun call!44983 () ListLongMap!14169)

(declare-fun bm!44980 () Bool)

(assert (=> bm!44980 (= call!44983 (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1064956 () Bool)

(declare-fun lt!469373 () Unit!34787)

(declare-fun lt!469378 () Unit!34787)

(assert (=> b!1064956 (= lt!469373 lt!469378)))

(declare-fun lt!469376 () ListLongMap!14169)

(declare-fun lt!469374 () (_ BitVec 64))

(declare-fun lt!469377 () V!38977)

(declare-fun lt!469372 () (_ BitVec 64))

(assert (=> b!1064956 (not (contains!6235 (+!3146 lt!469376 (tuple2!16201 lt!469372 lt!469377)) lt!469374))))

(assert (=> b!1064956 (= lt!469378 (addStillNotContains!251 lt!469376 lt!469372 lt!469377 lt!469374))))

(assert (=> b!1064956 (= lt!469374 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1064956 (= lt!469377 (get!17003 (select (arr!32552 _values!955) #b00000000000000000000000000000000) (dynLambda!2014 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1064956 (= lt!469372 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1064956 (= lt!469376 call!44983)))

(assert (=> b!1064956 (= e!607042 (+!3146 call!44983 (tuple2!16201 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000) (get!17003 (select (arr!32552 _values!955) #b00000000000000000000000000000000) (dynLambda!2014 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1064957 () Bool)

(assert (=> b!1064957 (= e!607042 call!44983)))

(declare-fun b!1064958 () Bool)

(assert (=> b!1064958 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(assert (=> b!1064958 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33090 _values!955)))))

(declare-fun e!607041 () Bool)

(assert (=> b!1064958 (= e!607041 (= (apply!915 lt!469375 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)) (get!17003 (select (arr!32552 _values!955) #b00000000000000000000000000000000) (dynLambda!2014 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1064959 () Bool)

(assert (=> b!1064959 (= e!607040 (isEmpty!945 lt!469375))))

(declare-fun b!1064960 () Bool)

(declare-fun res!710916 () Bool)

(assert (=> b!1064960 (=> (not res!710916) (not e!607046))))

(assert (=> b!1064960 (= res!710916 (not (contains!6235 lt!469375 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1064961 () Bool)

(assert (=> b!1064961 (= e!607045 (ListLongMap!14170 Nil!22746))))

(declare-fun b!1064962 () Bool)

(assert (=> b!1064962 (= e!607043 e!607041)))

(assert (=> b!1064962 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(declare-fun res!710914 () Bool)

(assert (=> b!1064962 (= res!710914 (contains!6235 lt!469375 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064962 (=> (not res!710914) (not e!607041))))

(declare-fun b!1064963 () Bool)

(assert (=> b!1064963 (= e!607046 e!607043)))

(declare-fun c!107341 () Bool)

(assert (=> b!1064963 (= c!107341 e!607044)))

(declare-fun res!710913 () Bool)

(assert (=> b!1064963 (=> (not res!710913) (not e!607044))))

(assert (=> b!1064963 (= res!710913 (bvslt #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(assert (= (and d!128837 c!107340) b!1064961))

(assert (= (and d!128837 (not c!107340)) b!1064953))

(assert (= (and b!1064953 c!107339) b!1064956))

(assert (= (and b!1064953 (not c!107339)) b!1064957))

(assert (= (or b!1064956 b!1064957) bm!44980))

(assert (= (and d!128837 res!710915) b!1064960))

(assert (= (and b!1064960 res!710916) b!1064963))

(assert (= (and b!1064963 res!710913) b!1064955))

(assert (= (and b!1064963 c!107341) b!1064962))

(assert (= (and b!1064963 (not c!107341)) b!1064954))

(assert (= (and b!1064962 res!710914) b!1064958))

(assert (= (and b!1064954 c!107342) b!1064952))

(assert (= (and b!1064954 (not c!107342)) b!1064959))

(declare-fun b_lambda!16501 () Bool)

(assert (=> (not b_lambda!16501) (not b!1064956)))

(assert (=> b!1064956 t!32061))

(declare-fun b_and!34307 () Bool)

(assert (= b_and!34305 (and (=> t!32061 result!14717) b_and!34307)))

(declare-fun b_lambda!16503 () Bool)

(assert (=> (not b_lambda!16503) (not b!1064958)))

(assert (=> b!1064958 t!32061))

(declare-fun b_and!34309 () Bool)

(assert (= b_and!34307 (and (=> t!32061 result!14717) b_and!34309)))

(assert (=> b!1064953 m!982857))

(assert (=> b!1064953 m!982857))

(assert (=> b!1064953 m!982877))

(assert (=> b!1064958 m!982887))

(assert (=> b!1064958 m!982889))

(assert (=> b!1064958 m!982891))

(assert (=> b!1064958 m!982887))

(assert (=> b!1064958 m!982857))

(assert (=> b!1064958 m!982857))

(declare-fun m!982921 () Bool)

(assert (=> b!1064958 m!982921))

(assert (=> b!1064958 m!982889))

(assert (=> b!1064962 m!982857))

(assert (=> b!1064962 m!982857))

(declare-fun m!982923 () Bool)

(assert (=> b!1064962 m!982923))

(declare-fun m!982925 () Bool)

(assert (=> b!1064960 m!982925))

(assert (=> b!1064955 m!982857))

(assert (=> b!1064955 m!982857))

(assert (=> b!1064955 m!982877))

(declare-fun m!982927 () Bool)

(assert (=> b!1064952 m!982927))

(declare-fun m!982929 () Bool)

(assert (=> b!1064959 m!982929))

(declare-fun m!982931 () Bool)

(assert (=> b!1064956 m!982931))

(assert (=> b!1064956 m!982931))

(declare-fun m!982933 () Bool)

(assert (=> b!1064956 m!982933))

(assert (=> b!1064956 m!982887))

(assert (=> b!1064956 m!982889))

(assert (=> b!1064956 m!982891))

(assert (=> b!1064956 m!982887))

(declare-fun m!982935 () Bool)

(assert (=> b!1064956 m!982935))

(assert (=> b!1064956 m!982857))

(declare-fun m!982937 () Bool)

(assert (=> b!1064956 m!982937))

(assert (=> b!1064956 m!982889))

(assert (=> bm!44980 m!982927))

(declare-fun m!982939 () Bool)

(assert (=> d!128837 m!982939))

(assert (=> d!128837 m!982797))

(assert (=> b!1064797 d!128837))

(declare-fun b!1064972 () Bool)

(declare-fun e!607054 () Bool)

(declare-fun call!44986 () Bool)

(assert (=> b!1064972 (= e!607054 call!44986)))

(declare-fun b!1064973 () Bool)

(declare-fun e!607053 () Bool)

(declare-fun e!607055 () Bool)

(assert (=> b!1064973 (= e!607053 e!607055)))

(declare-fun c!107345 () Bool)

(assert (=> b!1064973 (= c!107345 (validKeyInArray!0 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064974 () Bool)

(assert (=> b!1064974 (= e!607055 call!44986)))

(declare-fun b!1064975 () Bool)

(assert (=> b!1064975 (= e!607055 e!607054)))

(declare-fun lt!469385 () (_ BitVec 64))

(assert (=> b!1064975 (= lt!469385 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!469387 () Unit!34787)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67694 (_ BitVec 64) (_ BitVec 32)) Unit!34787)

(assert (=> b!1064975 (= lt!469387 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!469385 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1064975 (arrayContainsKey!0 _keys!1163 lt!469385 #b00000000000000000000000000000000)))

(declare-fun lt!469386 () Unit!34787)

(assert (=> b!1064975 (= lt!469386 lt!469387)))

(declare-fun res!710921 () Bool)

(declare-datatypes ((SeekEntryResult!9874 0))(
  ( (MissingZero!9874 (index!41867 (_ BitVec 32))) (Found!9874 (index!41868 (_ BitVec 32))) (Intermediate!9874 (undefined!10686 Bool) (index!41869 (_ BitVec 32)) (x!95326 (_ BitVec 32))) (Undefined!9874) (MissingVacant!9874 (index!41870 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67694 (_ BitVec 32)) SeekEntryResult!9874)

(assert (=> b!1064975 (= res!710921 (= (seekEntryOrOpen!0 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9874 #b00000000000000000000000000000000)))))

(assert (=> b!1064975 (=> (not res!710921) (not e!607054))))

(declare-fun bm!44983 () Bool)

(assert (=> bm!44983 (= call!44986 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun d!128839 () Bool)

(declare-fun res!710922 () Bool)

(assert (=> d!128839 (=> res!710922 e!607053)))

(assert (=> d!128839 (= res!710922 (bvsge #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(assert (=> d!128839 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!607053)))

(assert (= (and d!128839 (not res!710922)) b!1064973))

(assert (= (and b!1064973 c!107345) b!1064975))

(assert (= (and b!1064973 (not c!107345)) b!1064974))

(assert (= (and b!1064975 res!710921) b!1064972))

(assert (= (or b!1064972 b!1064974) bm!44983))

(assert (=> b!1064973 m!982857))

(assert (=> b!1064973 m!982857))

(assert (=> b!1064973 m!982877))

(assert (=> b!1064975 m!982857))

(declare-fun m!982941 () Bool)

(assert (=> b!1064975 m!982941))

(declare-fun m!982943 () Bool)

(assert (=> b!1064975 m!982943))

(assert (=> b!1064975 m!982857))

(declare-fun m!982945 () Bool)

(assert (=> b!1064975 m!982945))

(declare-fun m!982947 () Bool)

(assert (=> bm!44983 m!982947))

(assert (=> b!1064796 d!128839))

(declare-fun b!1064986 () Bool)

(declare-fun e!607065 () Bool)

(declare-fun contains!6236 (List!22750 (_ BitVec 64)) Bool)

(assert (=> b!1064986 (= e!607065 (contains!6236 Nil!22747 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064987 () Bool)

(declare-fun e!607067 () Bool)

(declare-fun e!607066 () Bool)

(assert (=> b!1064987 (= e!607067 e!607066)))

(declare-fun c!107348 () Bool)

(assert (=> b!1064987 (= c!107348 (validKeyInArray!0 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064988 () Bool)

(declare-fun call!44989 () Bool)

(assert (=> b!1064988 (= e!607066 call!44989)))

(declare-fun b!1064989 () Bool)

(assert (=> b!1064989 (= e!607066 call!44989)))

(declare-fun b!1064990 () Bool)

(declare-fun e!607064 () Bool)

(assert (=> b!1064990 (= e!607064 e!607067)))

(declare-fun res!710931 () Bool)

(assert (=> b!1064990 (=> (not res!710931) (not e!607067))))

(assert (=> b!1064990 (= res!710931 (not e!607065))))

(declare-fun res!710929 () Bool)

(assert (=> b!1064990 (=> (not res!710929) (not e!607065))))

(assert (=> b!1064990 (= res!710929 (validKeyInArray!0 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!128841 () Bool)

(declare-fun res!710930 () Bool)

(assert (=> d!128841 (=> res!710930 e!607064)))

(assert (=> d!128841 (= res!710930 (bvsge #b00000000000000000000000000000000 (size!33089 _keys!1163)))))

(assert (=> d!128841 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22747) e!607064)))

(declare-fun bm!44986 () Bool)

(assert (=> bm!44986 (= call!44989 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107348 (Cons!22746 (select (arr!32551 _keys!1163) #b00000000000000000000000000000000) Nil!22747) Nil!22747)))))

(assert (= (and d!128841 (not res!710930)) b!1064990))

(assert (= (and b!1064990 res!710929) b!1064986))

(assert (= (and b!1064990 res!710931) b!1064987))

(assert (= (and b!1064987 c!107348) b!1064989))

(assert (= (and b!1064987 (not c!107348)) b!1064988))

(assert (= (or b!1064989 b!1064988) bm!44986))

(assert (=> b!1064986 m!982857))

(assert (=> b!1064986 m!982857))

(declare-fun m!982949 () Bool)

(assert (=> b!1064986 m!982949))

(assert (=> b!1064987 m!982857))

(assert (=> b!1064987 m!982857))

(assert (=> b!1064987 m!982877))

(assert (=> b!1064990 m!982857))

(assert (=> b!1064990 m!982857))

(assert (=> b!1064990 m!982877))

(assert (=> bm!44986 m!982857))

(declare-fun m!982951 () Bool)

(assert (=> bm!44986 m!982951))

(assert (=> b!1064799 d!128841))

(declare-fun b!1064998 () Bool)

(declare-fun e!607073 () Bool)

(assert (=> b!1064998 (= e!607073 tp_is_empty!25381)))

(declare-fun b!1064997 () Bool)

(declare-fun e!607072 () Bool)

(assert (=> b!1064997 (= e!607072 tp_is_empty!25381)))

(declare-fun mapNonEmpty!39763 () Bool)

(declare-fun mapRes!39763 () Bool)

(declare-fun tp!76163 () Bool)

(assert (=> mapNonEmpty!39763 (= mapRes!39763 (and tp!76163 e!607072))))

(declare-fun mapRest!39763 () (Array (_ BitVec 32) ValueCell!11987))

(declare-fun mapValue!39763 () ValueCell!11987)

(declare-fun mapKey!39763 () (_ BitVec 32))

(assert (=> mapNonEmpty!39763 (= mapRest!39754 (store mapRest!39763 mapKey!39763 mapValue!39763))))

(declare-fun condMapEmpty!39763 () Bool)

(declare-fun mapDefault!39763 () ValueCell!11987)

(assert (=> mapNonEmpty!39754 (= condMapEmpty!39763 (= mapRest!39754 ((as const (Array (_ BitVec 32) ValueCell!11987)) mapDefault!39763)))))

(assert (=> mapNonEmpty!39754 (= tp!76148 (and e!607073 mapRes!39763))))

(declare-fun mapIsEmpty!39763 () Bool)

(assert (=> mapIsEmpty!39763 mapRes!39763))

(assert (= (and mapNonEmpty!39754 condMapEmpty!39763) mapIsEmpty!39763))

(assert (= (and mapNonEmpty!39754 (not condMapEmpty!39763)) mapNonEmpty!39763))

(assert (= (and mapNonEmpty!39763 ((_ is ValueCellFull!11987) mapValue!39763)) b!1064997))

(assert (= (and mapNonEmpty!39754 ((_ is ValueCellFull!11987) mapDefault!39763)) b!1064998))

(declare-fun m!982953 () Bool)

(assert (=> mapNonEmpty!39763 m!982953))

(declare-fun b_lambda!16505 () Bool)

(assert (= b_lambda!16495 (or (and start!94164 b_free!21571) b_lambda!16505)))

(declare-fun b_lambda!16507 () Bool)

(assert (= b_lambda!16499 (or (and start!94164 b_free!21571) b_lambda!16507)))

(declare-fun b_lambda!16509 () Bool)

(assert (= b_lambda!16503 (or (and start!94164 b_free!21571) b_lambda!16509)))

(declare-fun b_lambda!16511 () Bool)

(assert (= b_lambda!16497 (or (and start!94164 b_free!21571) b_lambda!16511)))

(declare-fun b_lambda!16513 () Bool)

(assert (= b_lambda!16501 (or (and start!94164 b_free!21571) b_lambda!16513)))

(check-sat (not bm!44973) (not bm!44983) (not b_lambda!16507) (not b!1064986) (not bm!44976) (not b!1064990) (not b!1064896) (not b!1064953) (not b_lambda!16505) (not b!1064958) (not bm!44971) (not d!128833) (not bm!44986) (not b!1064944) (not b!1064912) (not d!128835) (not b!1064973) (not b!1064955) (not b_lambda!16513) (not b!1064940) (not d!128837) (not b!1064962) (not bm!44980) (not b!1064956) (not b!1064960) (not mapNonEmpty!39763) (not b!1064911) (not b!1064907) (not b!1064975) (not b!1064987) (not b_lambda!16511) (not b!1064952) (not b!1064906) (not b!1064904) (not b!1064941) (not b_next!21571) (not bm!44975) b_and!34309 (not b!1064913) (not b_lambda!16509) (not b!1064943) (not b!1064950) (not b!1064959) (not b!1064946) tp_is_empty!25381 (not b!1064948) (not bm!44979) (not b!1064894) (not d!128825) (not b!1064947))
(check-sat b_and!34309 (not b_next!21571))
