; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93738 () Bool)

(assert start!93738)

(declare-fun b_free!21229 () Bool)

(declare-fun b_next!21229 () Bool)

(assert (=> start!93738 (= b_free!21229 (not b_next!21229))))

(declare-fun tp!75106 () Bool)

(declare-fun b_and!33913 () Bool)

(assert (=> start!93738 (= tp!75106 b_and!33913)))

(declare-fun b!1060240 () Bool)

(declare-fun res!708171 () Bool)

(declare-fun e!603612 () Bool)

(assert (=> b!1060240 (=> (not res!708171) (not e!603612))))

(declare-datatypes ((array!67036 0))(
  ( (array!67037 (arr!32227 (Array (_ BitVec 32) (_ BitVec 64))) (size!32765 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67036)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67036 (_ BitVec 32)) Bool)

(assert (=> b!1060240 (= res!708171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060241 () Bool)

(declare-fun res!708172 () Bool)

(assert (=> b!1060241 (=> (not res!708172) (not e!603612))))

(declare-datatypes ((V!38521 0))(
  ( (V!38522 (val!12570 Int)) )
))
(declare-datatypes ((ValueCell!11816 0))(
  ( (ValueCellFull!11816 (v!15179 V!38521)) (EmptyCell!11816) )
))
(declare-datatypes ((array!67038 0))(
  ( (array!67039 (arr!32228 (Array (_ BitVec 32) ValueCell!11816)) (size!32766 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67038)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060241 (= res!708172 (and (= (size!32766 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32765 _keys!1163) (size!32766 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39226 () Bool)

(declare-fun mapRes!39226 () Bool)

(declare-fun tp!75107 () Bool)

(declare-fun e!603609 () Bool)

(assert (=> mapNonEmpty!39226 (= mapRes!39226 (and tp!75107 e!603609))))

(declare-fun mapKey!39226 () (_ BitVec 32))

(declare-fun mapValue!39226 () ValueCell!11816)

(declare-fun mapRest!39226 () (Array (_ BitVec 32) ValueCell!11816))

(assert (=> mapNonEmpty!39226 (= (arr!32228 _values!955) (store mapRest!39226 mapKey!39226 mapValue!39226))))

(declare-fun mapIsEmpty!39226 () Bool)

(assert (=> mapIsEmpty!39226 mapRes!39226))

(declare-fun b!1060242 () Bool)

(assert (=> b!1060242 (= e!603612 (bvsgt #b00000000000000000000000000000000 (size!32765 _keys!1163)))))

(declare-fun zeroValueBefore!47 () V!38521)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38521)

(declare-datatypes ((tuple2!15948 0))(
  ( (tuple2!15949 (_1!7985 (_ BitVec 64)) (_2!7985 V!38521)) )
))
(declare-datatypes ((List!22502 0))(
  ( (Nil!22499) (Cons!22498 (h!23707 tuple2!15948) (t!31800 List!22502)) )
))
(declare-datatypes ((ListLongMap!13917 0))(
  ( (ListLongMap!13918 (toList!6974 List!22502)) )
))
(declare-fun lt!467063 () ListLongMap!13917)

(declare-fun getCurrentListMapNoExtraKeys!3591 (array!67036 array!67038 (_ BitVec 32) (_ BitVec 32) V!38521 V!38521 (_ BitVec 32) Int) ListLongMap!13917)

(assert (=> b!1060242 (= lt!467063 (getCurrentListMapNoExtraKeys!3591 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060243 () Bool)

(declare-fun res!708170 () Bool)

(assert (=> b!1060243 (=> (not res!708170) (not e!603612))))

(declare-datatypes ((List!22503 0))(
  ( (Nil!22500) (Cons!22499 (h!23708 (_ BitVec 64)) (t!31801 List!22503)) )
))
(declare-fun arrayNoDuplicates!0 (array!67036 (_ BitVec 32) List!22503) Bool)

(assert (=> b!1060243 (= res!708170 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22500))))

(declare-fun b!1060244 () Bool)

(declare-fun e!603610 () Bool)

(declare-fun tp_is_empty!25039 () Bool)

(assert (=> b!1060244 (= e!603610 tp_is_empty!25039)))

(declare-fun b!1060245 () Bool)

(assert (=> b!1060245 (= e!603609 tp_is_empty!25039)))

(declare-fun res!708169 () Bool)

(assert (=> start!93738 (=> (not res!708169) (not e!603612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93738 (= res!708169 (validMask!0 mask!1515))))

(assert (=> start!93738 e!603612))

(assert (=> start!93738 true))

(assert (=> start!93738 tp_is_empty!25039))

(declare-fun e!603608 () Bool)

(declare-fun array_inv!24978 (array!67038) Bool)

(assert (=> start!93738 (and (array_inv!24978 _values!955) e!603608)))

(assert (=> start!93738 tp!75106))

(declare-fun array_inv!24979 (array!67036) Bool)

(assert (=> start!93738 (array_inv!24979 _keys!1163)))

(declare-fun b!1060246 () Bool)

(assert (=> b!1060246 (= e!603608 (and e!603610 mapRes!39226))))

(declare-fun condMapEmpty!39226 () Bool)

(declare-fun mapDefault!39226 () ValueCell!11816)

(assert (=> b!1060246 (= condMapEmpty!39226 (= (arr!32228 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11816)) mapDefault!39226)))))

(assert (= (and start!93738 res!708169) b!1060241))

(assert (= (and b!1060241 res!708172) b!1060240))

(assert (= (and b!1060240 res!708171) b!1060243))

(assert (= (and b!1060243 res!708170) b!1060242))

(assert (= (and b!1060246 condMapEmpty!39226) mapIsEmpty!39226))

(assert (= (and b!1060246 (not condMapEmpty!39226)) mapNonEmpty!39226))

(get-info :version)

(assert (= (and mapNonEmpty!39226 ((_ is ValueCellFull!11816) mapValue!39226)) b!1060245))

(assert (= (and b!1060246 ((_ is ValueCellFull!11816) mapDefault!39226)) b!1060244))

(assert (= start!93738 b!1060246))

(declare-fun m!978863 () Bool)

(assert (=> b!1060243 m!978863))

(declare-fun m!978865 () Bool)

(assert (=> b!1060240 m!978865))

(declare-fun m!978867 () Bool)

(assert (=> mapNonEmpty!39226 m!978867))

(declare-fun m!978869 () Bool)

(assert (=> b!1060242 m!978869))

(declare-fun m!978871 () Bool)

(assert (=> start!93738 m!978871))

(declare-fun m!978873 () Bool)

(assert (=> start!93738 m!978873))

(declare-fun m!978875 () Bool)

(assert (=> start!93738 m!978875))

(check-sat (not b_next!21229) tp_is_empty!25039 (not mapNonEmpty!39226) (not start!93738) (not b!1060243) b_and!33913 (not b!1060240) (not b!1060242))
(check-sat b_and!33913 (not b_next!21229))
(get-model)

(declare-fun b!1060314 () Bool)

(declare-fun e!603662 () ListLongMap!13917)

(declare-fun e!603657 () ListLongMap!13917)

(assert (=> b!1060314 (= e!603662 e!603657)))

(declare-fun c!107172 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1060314 (= c!107172 (validKeyInArray!0 (select (arr!32227 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1060315 () Bool)

(declare-fun e!603659 () Bool)

(declare-fun e!603663 () Bool)

(assert (=> b!1060315 (= e!603659 e!603663)))

(assert (=> b!1060315 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32765 _keys!1163)))))

(declare-fun res!708206 () Bool)

(declare-fun lt!467088 () ListLongMap!13917)

(declare-fun contains!6186 (ListLongMap!13917 (_ BitVec 64)) Bool)

(assert (=> b!1060315 (= res!708206 (contains!6186 lt!467088 (select (arr!32227 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1060315 (=> (not res!708206) (not e!603663))))

(declare-fun b!1060316 () Bool)

(declare-fun e!603661 () Bool)

(declare-fun isEmpty!940 (ListLongMap!13917) Bool)

(assert (=> b!1060316 (= e!603661 (isEmpty!940 lt!467088))))

(declare-fun b!1060317 () Bool)

(assert (=> b!1060317 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32765 _keys!1163)))))

(assert (=> b!1060317 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32766 _values!955)))))

(declare-fun apply!910 (ListLongMap!13917 (_ BitVec 64)) V!38521)

(declare-fun get!16884 (ValueCell!11816 V!38521) V!38521)

(declare-fun dynLambda!2009 (Int (_ BitVec 64)) V!38521)

(assert (=> b!1060317 (= e!603663 (= (apply!910 lt!467088 (select (arr!32227 _keys!1163) #b00000000000000000000000000000000)) (get!16884 (select (arr!32228 _values!955) #b00000000000000000000000000000000) (dynLambda!2009 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1060318 () Bool)

(declare-fun e!603658 () Bool)

(assert (=> b!1060318 (= e!603658 e!603659)))

(declare-fun c!107171 () Bool)

(declare-fun e!603660 () Bool)

(assert (=> b!1060318 (= c!107171 e!603660)))

(declare-fun res!708207 () Bool)

(assert (=> b!1060318 (=> (not res!708207) (not e!603660))))

(assert (=> b!1060318 (= res!708207 (bvslt #b00000000000000000000000000000000 (size!32765 _keys!1163)))))

(declare-fun b!1060319 () Bool)

(assert (=> b!1060319 (= e!603660 (validKeyInArray!0 (select (arr!32227 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1060319 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!44867 () Bool)

(declare-fun call!44870 () ListLongMap!13917)

(assert (=> bm!44867 (= call!44870 (getCurrentListMapNoExtraKeys!3591 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1060313 () Bool)

(assert (=> b!1060313 (= e!603662 (ListLongMap!13918 Nil!22499))))

(declare-fun d!128619 () Bool)

(assert (=> d!128619 e!603658))

(declare-fun res!708205 () Bool)

(assert (=> d!128619 (=> (not res!708205) (not e!603658))))

(assert (=> d!128619 (= res!708205 (not (contains!6186 lt!467088 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128619 (= lt!467088 e!603662)))

(declare-fun c!107169 () Bool)

(assert (=> d!128619 (= c!107169 (bvsge #b00000000000000000000000000000000 (size!32765 _keys!1163)))))

(assert (=> d!128619 (validMask!0 mask!1515)))

(assert (=> d!128619 (= (getCurrentListMapNoExtraKeys!3591 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!467088)))

(declare-fun b!1060320 () Bool)

(assert (=> b!1060320 (= e!603661 (= lt!467088 (getCurrentListMapNoExtraKeys!3591 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1060321 () Bool)

(assert (=> b!1060321 (= e!603659 e!603661)))

(declare-fun c!107170 () Bool)

(assert (=> b!1060321 (= c!107170 (bvslt #b00000000000000000000000000000000 (size!32765 _keys!1163)))))

(declare-fun b!1060322 () Bool)

(assert (=> b!1060322 (= e!603657 call!44870)))

(declare-fun b!1060323 () Bool)

(declare-datatypes ((Unit!34599 0))(
  ( (Unit!34600) )
))
(declare-fun lt!467090 () Unit!34599)

(declare-fun lt!467085 () Unit!34599)

(assert (=> b!1060323 (= lt!467090 lt!467085)))

(declare-fun lt!467084 () ListLongMap!13917)

(declare-fun lt!467087 () (_ BitVec 64))

(declare-fun lt!467086 () (_ BitVec 64))

(declare-fun lt!467089 () V!38521)

(declare-fun +!3141 (ListLongMap!13917 tuple2!15948) ListLongMap!13917)

(assert (=> b!1060323 (not (contains!6186 (+!3141 lt!467084 (tuple2!15949 lt!467086 lt!467089)) lt!467087))))

(declare-fun addStillNotContains!246 (ListLongMap!13917 (_ BitVec 64) V!38521 (_ BitVec 64)) Unit!34599)

(assert (=> b!1060323 (= lt!467085 (addStillNotContains!246 lt!467084 lt!467086 lt!467089 lt!467087))))

(assert (=> b!1060323 (= lt!467087 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1060323 (= lt!467089 (get!16884 (select (arr!32228 _values!955) #b00000000000000000000000000000000) (dynLambda!2009 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1060323 (= lt!467086 (select (arr!32227 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1060323 (= lt!467084 call!44870)))

(assert (=> b!1060323 (= e!603657 (+!3141 call!44870 (tuple2!15949 (select (arr!32227 _keys!1163) #b00000000000000000000000000000000) (get!16884 (select (arr!32228 _values!955) #b00000000000000000000000000000000) (dynLambda!2009 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1060324 () Bool)

(declare-fun res!708208 () Bool)

(assert (=> b!1060324 (=> (not res!708208) (not e!603658))))

(assert (=> b!1060324 (= res!708208 (not (contains!6186 lt!467088 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!128619 c!107169) b!1060313))

(assert (= (and d!128619 (not c!107169)) b!1060314))

(assert (= (and b!1060314 c!107172) b!1060323))

(assert (= (and b!1060314 (not c!107172)) b!1060322))

(assert (= (or b!1060323 b!1060322) bm!44867))

(assert (= (and d!128619 res!708205) b!1060324))

(assert (= (and b!1060324 res!708208) b!1060318))

(assert (= (and b!1060318 res!708207) b!1060319))

(assert (= (and b!1060318 c!107171) b!1060315))

(assert (= (and b!1060318 (not c!107171)) b!1060321))

(assert (= (and b!1060315 res!708206) b!1060317))

(assert (= (and b!1060321 c!107170) b!1060320))

(assert (= (and b!1060321 (not c!107170)) b!1060316))

(declare-fun b_lambda!16415 () Bool)

(assert (=> (not b_lambda!16415) (not b!1060317)))

(declare-fun t!31804 () Bool)

(declare-fun tb!7121 () Bool)

(assert (=> (and start!93738 (= defaultEntry!963 defaultEntry!963) t!31804) tb!7121))

(declare-fun result!14687 () Bool)

(assert (=> tb!7121 (= result!14687 tp_is_empty!25039)))

(assert (=> b!1060317 t!31804))

(declare-fun b_and!33919 () Bool)

(assert (= b_and!33913 (and (=> t!31804 result!14687) b_and!33919)))

(declare-fun b_lambda!16417 () Bool)

(assert (=> (not b_lambda!16417) (not b!1060323)))

(assert (=> b!1060323 t!31804))

(declare-fun b_and!33921 () Bool)

(assert (= b_and!33919 (and (=> t!31804 result!14687) b_and!33921)))

(declare-fun m!978905 () Bool)

(assert (=> b!1060317 m!978905))

(declare-fun m!978907 () Bool)

(assert (=> b!1060317 m!978907))

(declare-fun m!978909 () Bool)

(assert (=> b!1060317 m!978909))

(declare-fun m!978911 () Bool)

(assert (=> b!1060317 m!978911))

(assert (=> b!1060317 m!978907))

(assert (=> b!1060317 m!978905))

(assert (=> b!1060317 m!978911))

(declare-fun m!978913 () Bool)

(assert (=> b!1060317 m!978913))

(assert (=> b!1060319 m!978907))

(assert (=> b!1060319 m!978907))

(declare-fun m!978915 () Bool)

(assert (=> b!1060319 m!978915))

(assert (=> b!1060315 m!978907))

(assert (=> b!1060315 m!978907))

(declare-fun m!978917 () Bool)

(assert (=> b!1060315 m!978917))

(declare-fun m!978919 () Bool)

(assert (=> bm!44867 m!978919))

(assert (=> b!1060320 m!978919))

(declare-fun m!978921 () Bool)

(assert (=> d!128619 m!978921))

(assert (=> d!128619 m!978871))

(assert (=> b!1060314 m!978907))

(assert (=> b!1060314 m!978907))

(assert (=> b!1060314 m!978915))

(declare-fun m!978923 () Bool)

(assert (=> b!1060324 m!978923))

(assert (=> b!1060323 m!978905))

(declare-fun m!978925 () Bool)

(assert (=> b!1060323 m!978925))

(declare-fun m!978927 () Bool)

(assert (=> b!1060323 m!978927))

(assert (=> b!1060323 m!978907))

(declare-fun m!978929 () Bool)

(assert (=> b!1060323 m!978929))

(assert (=> b!1060323 m!978905))

(assert (=> b!1060323 m!978911))

(assert (=> b!1060323 m!978913))

(assert (=> b!1060323 m!978911))

(assert (=> b!1060323 m!978925))

(declare-fun m!978931 () Bool)

(assert (=> b!1060323 m!978931))

(declare-fun m!978933 () Bool)

(assert (=> b!1060316 m!978933))

(assert (=> b!1060242 d!128619))

(declare-fun d!128621 () Bool)

(assert (=> d!128621 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93738 d!128621))

(declare-fun d!128623 () Bool)

(assert (=> d!128623 (= (array_inv!24978 _values!955) (bvsge (size!32766 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93738 d!128623))

(declare-fun d!128625 () Bool)

(assert (=> d!128625 (= (array_inv!24979 _keys!1163) (bvsge (size!32765 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93738 d!128625))

(declare-fun b!1060337 () Bool)

(declare-fun e!603675 () Bool)

(declare-fun e!603672 () Bool)

(assert (=> b!1060337 (= e!603675 e!603672)))

(declare-fun res!708217 () Bool)

(assert (=> b!1060337 (=> (not res!708217) (not e!603672))))

(declare-fun e!603673 () Bool)

(assert (=> b!1060337 (= res!708217 (not e!603673))))

(declare-fun res!708216 () Bool)

(assert (=> b!1060337 (=> (not res!708216) (not e!603673))))

(assert (=> b!1060337 (= res!708216 (validKeyInArray!0 (select (arr!32227 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1060338 () Bool)

(declare-fun contains!6187 (List!22503 (_ BitVec 64)) Bool)

(assert (=> b!1060338 (= e!603673 (contains!6187 Nil!22500 (select (arr!32227 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1060339 () Bool)

(declare-fun e!603674 () Bool)

(declare-fun call!44873 () Bool)

(assert (=> b!1060339 (= e!603674 call!44873)))

(declare-fun b!1060341 () Bool)

(assert (=> b!1060341 (= e!603672 e!603674)))

(declare-fun c!107175 () Bool)

(assert (=> b!1060341 (= c!107175 (validKeyInArray!0 (select (arr!32227 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44870 () Bool)

(assert (=> bm!44870 (= call!44873 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107175 (Cons!22499 (select (arr!32227 _keys!1163) #b00000000000000000000000000000000) Nil!22500) Nil!22500)))))

(declare-fun b!1060340 () Bool)

(assert (=> b!1060340 (= e!603674 call!44873)))

(declare-fun d!128627 () Bool)

(declare-fun res!708215 () Bool)

(assert (=> d!128627 (=> res!708215 e!603675)))

(assert (=> d!128627 (= res!708215 (bvsge #b00000000000000000000000000000000 (size!32765 _keys!1163)))))

(assert (=> d!128627 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22500) e!603675)))

(assert (= (and d!128627 (not res!708215)) b!1060337))

(assert (= (and b!1060337 res!708216) b!1060338))

(assert (= (and b!1060337 res!708217) b!1060341))

(assert (= (and b!1060341 c!107175) b!1060340))

(assert (= (and b!1060341 (not c!107175)) b!1060339))

(assert (= (or b!1060340 b!1060339) bm!44870))

(assert (=> b!1060337 m!978907))

(assert (=> b!1060337 m!978907))

(assert (=> b!1060337 m!978915))

(assert (=> b!1060338 m!978907))

(assert (=> b!1060338 m!978907))

(declare-fun m!978935 () Bool)

(assert (=> b!1060338 m!978935))

(assert (=> b!1060341 m!978907))

(assert (=> b!1060341 m!978907))

(assert (=> b!1060341 m!978915))

(assert (=> bm!44870 m!978907))

(declare-fun m!978937 () Bool)

(assert (=> bm!44870 m!978937))

(assert (=> b!1060243 d!128627))

(declare-fun d!128629 () Bool)

(declare-fun res!708222 () Bool)

(declare-fun e!603683 () Bool)

(assert (=> d!128629 (=> res!708222 e!603683)))

(assert (=> d!128629 (= res!708222 (bvsge #b00000000000000000000000000000000 (size!32765 _keys!1163)))))

(assert (=> d!128629 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!603683)))

(declare-fun b!1060350 () Bool)

(declare-fun e!603682 () Bool)

(declare-fun e!603684 () Bool)

(assert (=> b!1060350 (= e!603682 e!603684)))

(declare-fun lt!467097 () (_ BitVec 64))

(assert (=> b!1060350 (= lt!467097 (select (arr!32227 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!467098 () Unit!34599)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67036 (_ BitVec 64) (_ BitVec 32)) Unit!34599)

(assert (=> b!1060350 (= lt!467098 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!467097 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1060350 (arrayContainsKey!0 _keys!1163 lt!467097 #b00000000000000000000000000000000)))

(declare-fun lt!467099 () Unit!34599)

(assert (=> b!1060350 (= lt!467099 lt!467098)))

(declare-fun res!708223 () Bool)

(declare-datatypes ((SeekEntryResult!9869 0))(
  ( (MissingZero!9869 (index!41847 (_ BitVec 32))) (Found!9869 (index!41848 (_ BitVec 32))) (Intermediate!9869 (undefined!10681 Bool) (index!41849 (_ BitVec 32)) (x!94810 (_ BitVec 32))) (Undefined!9869) (MissingVacant!9869 (index!41850 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67036 (_ BitVec 32)) SeekEntryResult!9869)

(assert (=> b!1060350 (= res!708223 (= (seekEntryOrOpen!0 (select (arr!32227 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9869 #b00000000000000000000000000000000)))))

(assert (=> b!1060350 (=> (not res!708223) (not e!603684))))

(declare-fun b!1060351 () Bool)

(declare-fun call!44876 () Bool)

(assert (=> b!1060351 (= e!603684 call!44876)))

(declare-fun b!1060352 () Bool)

(assert (=> b!1060352 (= e!603683 e!603682)))

(declare-fun c!107178 () Bool)

(assert (=> b!1060352 (= c!107178 (validKeyInArray!0 (select (arr!32227 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44873 () Bool)

(assert (=> bm!44873 (= call!44876 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1060353 () Bool)

(assert (=> b!1060353 (= e!603682 call!44876)))

(assert (= (and d!128629 (not res!708222)) b!1060352))

(assert (= (and b!1060352 c!107178) b!1060350))

(assert (= (and b!1060352 (not c!107178)) b!1060353))

(assert (= (and b!1060350 res!708223) b!1060351))

(assert (= (or b!1060351 b!1060353) bm!44873))

(assert (=> b!1060350 m!978907))

(declare-fun m!978939 () Bool)

(assert (=> b!1060350 m!978939))

(declare-fun m!978941 () Bool)

(assert (=> b!1060350 m!978941))

(assert (=> b!1060350 m!978907))

(declare-fun m!978943 () Bool)

(assert (=> b!1060350 m!978943))

(assert (=> b!1060352 m!978907))

(assert (=> b!1060352 m!978907))

(assert (=> b!1060352 m!978915))

(declare-fun m!978945 () Bool)

(assert (=> bm!44873 m!978945))

(assert (=> b!1060240 d!128629))

(declare-fun mapNonEmpty!39235 () Bool)

(declare-fun mapRes!39235 () Bool)

(declare-fun tp!75122 () Bool)

(declare-fun e!603690 () Bool)

(assert (=> mapNonEmpty!39235 (= mapRes!39235 (and tp!75122 e!603690))))

(declare-fun mapRest!39235 () (Array (_ BitVec 32) ValueCell!11816))

(declare-fun mapKey!39235 () (_ BitVec 32))

(declare-fun mapValue!39235 () ValueCell!11816)

(assert (=> mapNonEmpty!39235 (= mapRest!39226 (store mapRest!39235 mapKey!39235 mapValue!39235))))

(declare-fun b!1060360 () Bool)

(assert (=> b!1060360 (= e!603690 tp_is_empty!25039)))

(declare-fun b!1060361 () Bool)

(declare-fun e!603689 () Bool)

(assert (=> b!1060361 (= e!603689 tp_is_empty!25039)))

(declare-fun condMapEmpty!39235 () Bool)

(declare-fun mapDefault!39235 () ValueCell!11816)

(assert (=> mapNonEmpty!39226 (= condMapEmpty!39235 (= mapRest!39226 ((as const (Array (_ BitVec 32) ValueCell!11816)) mapDefault!39235)))))

(assert (=> mapNonEmpty!39226 (= tp!75107 (and e!603689 mapRes!39235))))

(declare-fun mapIsEmpty!39235 () Bool)

(assert (=> mapIsEmpty!39235 mapRes!39235))

(assert (= (and mapNonEmpty!39226 condMapEmpty!39235) mapIsEmpty!39235))

(assert (= (and mapNonEmpty!39226 (not condMapEmpty!39235)) mapNonEmpty!39235))

(assert (= (and mapNonEmpty!39235 ((_ is ValueCellFull!11816) mapValue!39235)) b!1060360))

(assert (= (and mapNonEmpty!39226 ((_ is ValueCellFull!11816) mapDefault!39235)) b!1060361))

(declare-fun m!978947 () Bool)

(assert (=> mapNonEmpty!39235 m!978947))

(declare-fun b_lambda!16419 () Bool)

(assert (= b_lambda!16417 (or (and start!93738 b_free!21229) b_lambda!16419)))

(declare-fun b_lambda!16421 () Bool)

(assert (= b_lambda!16415 (or (and start!93738 b_free!21229) b_lambda!16421)))

(check-sat b_and!33921 (not b_next!21229) tp_is_empty!25039 (not b_lambda!16421) (not b!1060337) (not b!1060316) (not b!1060341) (not bm!44867) (not b!1060324) (not b!1060317) (not b!1060350) (not b!1060352) (not b!1060320) (not bm!44870) (not d!128619) (not mapNonEmpty!39235) (not b_lambda!16419) (not b!1060314) (not b!1060319) (not b!1060323) (not b!1060338) (not bm!44873) (not b!1060315))
(check-sat b_and!33921 (not b_next!21229))
