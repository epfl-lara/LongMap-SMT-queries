; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95302 () Bool)

(assert start!95302)

(declare-fun b_free!22183 () Bool)

(declare-fun b_next!22183 () Bool)

(assert (=> start!95302 (= b_free!22183 (not b_next!22183))))

(declare-fun tp!78028 () Bool)

(declare-fun b_and!35101 () Bool)

(assert (=> start!95302 (= tp!78028 b_and!35101)))

(declare-fun b!1076031 () Bool)

(declare-fun e!614976 () Bool)

(declare-fun e!614980 () Bool)

(assert (=> b!1076031 (= e!614976 (not e!614980))))

(declare-fun res!717087 () Bool)

(assert (=> b!1076031 (=> res!717087 e!614980)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1076031 (= res!717087 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39793 0))(
  ( (V!39794 (val!13047 Int)) )
))
(declare-datatypes ((tuple2!16604 0))(
  ( (tuple2!16605 (_1!8313 (_ BitVec 64)) (_2!8313 V!39793)) )
))
(declare-datatypes ((List!23159 0))(
  ( (Nil!23156) (Cons!23155 (h!24373 tuple2!16604) (t!32498 List!23159)) )
))
(declare-datatypes ((ListLongMap!14581 0))(
  ( (ListLongMap!14582 (toList!7306 List!23159)) )
))
(declare-fun lt!477343 () ListLongMap!14581)

(declare-fun lt!477346 () ListLongMap!14581)

(assert (=> b!1076031 (= lt!477343 lt!477346)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39793)

(declare-datatypes ((ValueCell!12293 0))(
  ( (ValueCellFull!12293 (v!15665 V!39793)) (EmptyCell!12293) )
))
(declare-datatypes ((array!68997 0))(
  ( (array!68998 (arr!33181 (Array (_ BitVec 32) ValueCell!12293)) (size!33718 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68997)

(declare-fun minValue!907 () V!39793)

(declare-datatypes ((Unit!35354 0))(
  ( (Unit!35355) )
))
(declare-fun lt!477344 () Unit!35354)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39793)

(declare-datatypes ((array!68999 0))(
  ( (array!69000 (arr!33182 (Array (_ BitVec 32) (_ BitVec 64))) (size!33719 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68999)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!882 (array!68999 array!68997 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39793 V!39793 V!39793 V!39793 (_ BitVec 32) Int) Unit!35354)

(assert (=> b!1076031 (= lt!477344 (lemmaNoChangeToArrayThenSameMapNoExtras!882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3902 (array!68999 array!68997 (_ BitVec 32) (_ BitVec 32) V!39793 V!39793 (_ BitVec 32) Int) ListLongMap!14581)

(assert (=> b!1076031 (= lt!477346 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076031 (= lt!477343 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40717 () Bool)

(declare-fun mapRes!40717 () Bool)

(declare-fun tp!78029 () Bool)

(declare-fun e!614975 () Bool)

(assert (=> mapNonEmpty!40717 (= mapRes!40717 (and tp!78029 e!614975))))

(declare-fun mapRest!40717 () (Array (_ BitVec 32) ValueCell!12293))

(declare-fun mapKey!40717 () (_ BitVec 32))

(declare-fun mapValue!40717 () ValueCell!12293)

(assert (=> mapNonEmpty!40717 (= (arr!33181 _values!955) (store mapRest!40717 mapKey!40717 mapValue!40717))))

(declare-fun b!1076032 () Bool)

(declare-fun e!614978 () Bool)

(declare-fun tp_is_empty!25993 () Bool)

(assert (=> b!1076032 (= e!614978 tp_is_empty!25993)))

(declare-fun b!1076033 () Bool)

(declare-fun e!614974 () Bool)

(assert (=> b!1076033 (= e!614974 (and e!614978 mapRes!40717))))

(declare-fun condMapEmpty!40717 () Bool)

(declare-fun mapDefault!40717 () ValueCell!12293)

(assert (=> b!1076033 (= condMapEmpty!40717 (= (arr!33181 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12293)) mapDefault!40717)))))

(declare-fun b!1076034 () Bool)

(declare-fun res!717082 () Bool)

(assert (=> b!1076034 (=> (not res!717082) (not e!614976))))

(assert (=> b!1076034 (= res!717082 (and (= (size!33718 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33719 _keys!1163) (size!33718 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076035 () Bool)

(declare-fun res!717085 () Bool)

(assert (=> b!1076035 (=> (not res!717085) (not e!614976))))

(declare-datatypes ((List!23160 0))(
  ( (Nil!23157) (Cons!23156 (h!24374 (_ BitVec 64)) (t!32499 List!23160)) )
))
(declare-fun arrayNoDuplicates!0 (array!68999 (_ BitVec 32) List!23160) Bool)

(assert (=> b!1076035 (= res!717085 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23157))))

(declare-fun b!1076036 () Bool)

(declare-fun e!614977 () Bool)

(declare-fun lt!477345 () ListLongMap!14581)

(assert (=> b!1076036 (= e!614977 (= lt!477345 lt!477346))))

(declare-fun res!717084 () Bool)

(assert (=> start!95302 (=> (not res!717084) (not e!614976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95302 (= res!717084 (validMask!0 mask!1515))))

(assert (=> start!95302 e!614976))

(assert (=> start!95302 true))

(assert (=> start!95302 tp_is_empty!25993))

(declare-fun array_inv!25682 (array!68997) Bool)

(assert (=> start!95302 (and (array_inv!25682 _values!955) e!614974)))

(assert (=> start!95302 tp!78028))

(declare-fun array_inv!25683 (array!68999) Bool)

(assert (=> start!95302 (array_inv!25683 _keys!1163)))

(declare-fun b!1076037 () Bool)

(declare-fun res!717083 () Bool)

(assert (=> b!1076037 (=> (not res!717083) (not e!614976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68999 (_ BitVec 32)) Bool)

(assert (=> b!1076037 (= res!717083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1076038 () Bool)

(declare-fun contains!6365 (ListLongMap!14581 (_ BitVec 64)) Bool)

(assert (=> b!1076038 (= e!614980 (not (contains!6365 lt!477343 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1076038 e!614977))

(declare-fun res!717086 () Bool)

(assert (=> b!1076038 (=> (not res!717086) (not e!614977))))

(declare-fun lt!477347 () ListLongMap!14581)

(declare-fun +!3240 (ListLongMap!14581 tuple2!16604) ListLongMap!14581)

(assert (=> b!1076038 (= res!717086 (= lt!477347 (+!3240 lt!477343 (tuple2!16605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun getCurrentListMap!4167 (array!68999 array!68997 (_ BitVec 32) (_ BitVec 32) V!39793 V!39793 (_ BitVec 32) Int) ListLongMap!14581)

(assert (=> b!1076038 (= lt!477345 (getCurrentListMap!4167 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076038 (= lt!477347 (getCurrentListMap!4167 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076039 () Bool)

(assert (=> b!1076039 (= e!614975 tp_is_empty!25993)))

(declare-fun mapIsEmpty!40717 () Bool)

(assert (=> mapIsEmpty!40717 mapRes!40717))

(assert (= (and start!95302 res!717084) b!1076034))

(assert (= (and b!1076034 res!717082) b!1076037))

(assert (= (and b!1076037 res!717083) b!1076035))

(assert (= (and b!1076035 res!717085) b!1076031))

(assert (= (and b!1076031 (not res!717087)) b!1076038))

(assert (= (and b!1076038 res!717086) b!1076036))

(assert (= (and b!1076033 condMapEmpty!40717) mapIsEmpty!40717))

(assert (= (and b!1076033 (not condMapEmpty!40717)) mapNonEmpty!40717))

(get-info :version)

(assert (= (and mapNonEmpty!40717 ((_ is ValueCellFull!12293) mapValue!40717)) b!1076039))

(assert (= (and b!1076033 ((_ is ValueCellFull!12293) mapDefault!40717)) b!1076032))

(assert (= start!95302 b!1076033))

(declare-fun m!995221 () Bool)

(assert (=> start!95302 m!995221))

(declare-fun m!995223 () Bool)

(assert (=> start!95302 m!995223))

(declare-fun m!995225 () Bool)

(assert (=> start!95302 m!995225))

(declare-fun m!995227 () Bool)

(assert (=> b!1076031 m!995227))

(declare-fun m!995229 () Bool)

(assert (=> b!1076031 m!995229))

(declare-fun m!995231 () Bool)

(assert (=> b!1076031 m!995231))

(declare-fun m!995233 () Bool)

(assert (=> mapNonEmpty!40717 m!995233))

(declare-fun m!995235 () Bool)

(assert (=> b!1076035 m!995235))

(declare-fun m!995237 () Bool)

(assert (=> b!1076037 m!995237))

(declare-fun m!995239 () Bool)

(assert (=> b!1076038 m!995239))

(declare-fun m!995241 () Bool)

(assert (=> b!1076038 m!995241))

(declare-fun m!995243 () Bool)

(assert (=> b!1076038 m!995243))

(declare-fun m!995245 () Bool)

(assert (=> b!1076038 m!995245))

(check-sat b_and!35101 (not mapNonEmpty!40717) (not b!1076038) (not b_next!22183) (not b!1076037) (not b!1076031) (not start!95302) tp_is_empty!25993 (not b!1076035))
(check-sat b_and!35101 (not b_next!22183))
(get-model)

(declare-fun d!130001 () Bool)

(assert (=> d!130001 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95302 d!130001))

(declare-fun d!130003 () Bool)

(assert (=> d!130003 (= (array_inv!25682 _values!955) (bvsge (size!33718 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95302 d!130003))

(declare-fun d!130005 () Bool)

(assert (=> d!130005 (= (array_inv!25683 _keys!1163) (bvsge (size!33719 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95302 d!130005))

(declare-fun d!130007 () Bool)

(assert (=> d!130007 (= (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477380 () Unit!35354)

(declare-fun choose!1756 (array!68999 array!68997 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39793 V!39793 V!39793 V!39793 (_ BitVec 32) Int) Unit!35354)

(assert (=> d!130007 (= lt!477380 (choose!1756 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!130007 (validMask!0 mask!1515)))

(assert (=> d!130007 (= (lemmaNoChangeToArrayThenSameMapNoExtras!882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477380)))

(declare-fun bs!31689 () Bool)

(assert (= bs!31689 d!130007))

(assert (=> bs!31689 m!995231))

(assert (=> bs!31689 m!995229))

(declare-fun m!995299 () Bool)

(assert (=> bs!31689 m!995299))

(assert (=> bs!31689 m!995221))

(assert (=> b!1076031 d!130007))

(declare-fun e!615040 () Bool)

(declare-fun lt!477401 () ListLongMap!14581)

(declare-fun b!1076118 () Bool)

(assert (=> b!1076118 (= e!615040 (= lt!477401 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1076119 () Bool)

(declare-fun lt!477395 () Unit!35354)

(declare-fun lt!477396 () Unit!35354)

(assert (=> b!1076119 (= lt!477395 lt!477396)))

(declare-fun lt!477399 () (_ BitVec 64))

(declare-fun lt!477397 () V!39793)

(declare-fun lt!477398 () (_ BitVec 64))

(declare-fun lt!477400 () ListLongMap!14581)

(assert (=> b!1076119 (not (contains!6365 (+!3240 lt!477400 (tuple2!16605 lt!477399 lt!477397)) lt!477398))))

(declare-fun addStillNotContains!267 (ListLongMap!14581 (_ BitVec 64) V!39793 (_ BitVec 64)) Unit!35354)

(assert (=> b!1076119 (= lt!477396 (addStillNotContains!267 lt!477400 lt!477399 lt!477397 lt!477398))))

(assert (=> b!1076119 (= lt!477398 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17256 (ValueCell!12293 V!39793) V!39793)

(declare-fun dynLambda!2061 (Int (_ BitVec 64)) V!39793)

(assert (=> b!1076119 (= lt!477397 (get!17256 (select (arr!33181 _values!955) #b00000000000000000000000000000000) (dynLambda!2061 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1076119 (= lt!477399 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45502 () ListLongMap!14581)

(assert (=> b!1076119 (= lt!477400 call!45502)))

(declare-fun e!615037 () ListLongMap!14581)

(assert (=> b!1076119 (= e!615037 (+!3240 call!45502 (tuple2!16605 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000) (get!17256 (select (arr!33181 _values!955) #b00000000000000000000000000000000) (dynLambda!2061 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1076120 () Bool)

(declare-fun e!615041 () Bool)

(declare-fun e!615038 () Bool)

(assert (=> b!1076120 (= e!615041 e!615038)))

(declare-fun c!108368 () Bool)

(declare-fun e!615039 () Bool)

(assert (=> b!1076120 (= c!108368 e!615039)))

(declare-fun res!717133 () Bool)

(assert (=> b!1076120 (=> (not res!717133) (not e!615039))))

(assert (=> b!1076120 (= res!717133 (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(declare-fun b!1076121 () Bool)

(declare-fun e!615043 () ListLongMap!14581)

(assert (=> b!1076121 (= e!615043 e!615037)))

(declare-fun c!108369 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1076121 (= c!108369 (validKeyInArray!0 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076122 () Bool)

(assert (=> b!1076122 (= e!615037 call!45502)))

(declare-fun b!1076123 () Bool)

(assert (=> b!1076123 (= e!615038 e!615040)))

(declare-fun c!108366 () Bool)

(assert (=> b!1076123 (= c!108366 (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(declare-fun b!1076124 () Bool)

(declare-fun res!717132 () Bool)

(assert (=> b!1076124 (=> (not res!717132) (not e!615041))))

(assert (=> b!1076124 (= res!717132 (not (contains!6365 lt!477401 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1076125 () Bool)

(declare-fun e!615042 () Bool)

(assert (=> b!1076125 (= e!615038 e!615042)))

(assert (=> b!1076125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(declare-fun res!717135 () Bool)

(assert (=> b!1076125 (= res!717135 (contains!6365 lt!477401 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076125 (=> (not res!717135) (not e!615042))))

(declare-fun b!1076126 () Bool)

(assert (=> b!1076126 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(assert (=> b!1076126 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33718 _values!955)))))

(declare-fun apply!946 (ListLongMap!14581 (_ BitVec 64)) V!39793)

(assert (=> b!1076126 (= e!615042 (= (apply!946 lt!477401 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)) (get!17256 (select (arr!33181 _values!955) #b00000000000000000000000000000000) (dynLambda!2061 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1076127 () Bool)

(assert (=> b!1076127 (= e!615039 (validKeyInArray!0 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076127 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!130009 () Bool)

(assert (=> d!130009 e!615041))

(declare-fun res!717134 () Bool)

(assert (=> d!130009 (=> (not res!717134) (not e!615041))))

(assert (=> d!130009 (= res!717134 (not (contains!6365 lt!477401 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130009 (= lt!477401 e!615043)))

(declare-fun c!108367 () Bool)

(assert (=> d!130009 (= c!108367 (bvsge #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(assert (=> d!130009 (validMask!0 mask!1515)))

(assert (=> d!130009 (= (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477401)))

(declare-fun bm!45499 () Bool)

(assert (=> bm!45499 (= call!45502 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1076128 () Bool)

(declare-fun isEmpty!959 (ListLongMap!14581) Bool)

(assert (=> b!1076128 (= e!615040 (isEmpty!959 lt!477401))))

(declare-fun b!1076129 () Bool)

(assert (=> b!1076129 (= e!615043 (ListLongMap!14582 Nil!23156))))

(assert (= (and d!130009 c!108367) b!1076129))

(assert (= (and d!130009 (not c!108367)) b!1076121))

(assert (= (and b!1076121 c!108369) b!1076119))

(assert (= (and b!1076121 (not c!108369)) b!1076122))

(assert (= (or b!1076119 b!1076122) bm!45499))

(assert (= (and d!130009 res!717134) b!1076124))

(assert (= (and b!1076124 res!717132) b!1076120))

(assert (= (and b!1076120 res!717133) b!1076127))

(assert (= (and b!1076120 c!108368) b!1076125))

(assert (= (and b!1076120 (not c!108368)) b!1076123))

(assert (= (and b!1076125 res!717135) b!1076126))

(assert (= (and b!1076123 c!108366) b!1076118))

(assert (= (and b!1076123 (not c!108366)) b!1076128))

(declare-fun b_lambda!16843 () Bool)

(assert (=> (not b_lambda!16843) (not b!1076119)))

(declare-fun t!32503 () Bool)

(declare-fun tb!7161 () Bool)

(assert (=> (and start!95302 (= defaultEntry!963 defaultEntry!963) t!32503) tb!7161))

(declare-fun result!14807 () Bool)

(assert (=> tb!7161 (= result!14807 tp_is_empty!25993)))

(assert (=> b!1076119 t!32503))

(declare-fun b_and!35107 () Bool)

(assert (= b_and!35101 (and (=> t!32503 result!14807) b_and!35107)))

(declare-fun b_lambda!16845 () Bool)

(assert (=> (not b_lambda!16845) (not b!1076126)))

(assert (=> b!1076126 t!32503))

(declare-fun b_and!35109 () Bool)

(assert (= b_and!35107 (and (=> t!32503 result!14807) b_and!35109)))

(declare-fun m!995301 () Bool)

(assert (=> b!1076124 m!995301))

(declare-fun m!995303 () Bool)

(assert (=> bm!45499 m!995303))

(declare-fun m!995305 () Bool)

(assert (=> b!1076121 m!995305))

(assert (=> b!1076121 m!995305))

(declare-fun m!995307 () Bool)

(assert (=> b!1076121 m!995307))

(declare-fun m!995309 () Bool)

(assert (=> b!1076119 m!995309))

(declare-fun m!995311 () Bool)

(assert (=> b!1076119 m!995311))

(declare-fun m!995313 () Bool)

(assert (=> b!1076119 m!995313))

(declare-fun m!995315 () Bool)

(assert (=> b!1076119 m!995315))

(assert (=> b!1076119 m!995311))

(assert (=> b!1076119 m!995309))

(declare-fun m!995317 () Bool)

(assert (=> b!1076119 m!995317))

(declare-fun m!995319 () Bool)

(assert (=> b!1076119 m!995319))

(assert (=> b!1076119 m!995305))

(declare-fun m!995321 () Bool)

(assert (=> b!1076119 m!995321))

(assert (=> b!1076119 m!995317))

(assert (=> b!1076126 m!995309))

(assert (=> b!1076126 m!995311))

(assert (=> b!1076126 m!995313))

(assert (=> b!1076126 m!995311))

(assert (=> b!1076126 m!995309))

(assert (=> b!1076126 m!995305))

(declare-fun m!995323 () Bool)

(assert (=> b!1076126 m!995323))

(assert (=> b!1076126 m!995305))

(declare-fun m!995325 () Bool)

(assert (=> b!1076128 m!995325))

(assert (=> b!1076118 m!995303))

(declare-fun m!995327 () Bool)

(assert (=> d!130009 m!995327))

(assert (=> d!130009 m!995221))

(assert (=> b!1076127 m!995305))

(assert (=> b!1076127 m!995305))

(assert (=> b!1076127 m!995307))

(assert (=> b!1076125 m!995305))

(assert (=> b!1076125 m!995305))

(declare-fun m!995329 () Bool)

(assert (=> b!1076125 m!995329))

(assert (=> b!1076031 d!130009))

(declare-fun e!615047 () Bool)

(declare-fun b!1076132 () Bool)

(declare-fun lt!477408 () ListLongMap!14581)

(assert (=> b!1076132 (= e!615047 (= lt!477408 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1076133 () Bool)

(declare-fun lt!477402 () Unit!35354)

(declare-fun lt!477403 () Unit!35354)

(assert (=> b!1076133 (= lt!477402 lt!477403)))

(declare-fun lt!477407 () ListLongMap!14581)

(declare-fun lt!477406 () (_ BitVec 64))

(declare-fun lt!477404 () V!39793)

(declare-fun lt!477405 () (_ BitVec 64))

(assert (=> b!1076133 (not (contains!6365 (+!3240 lt!477407 (tuple2!16605 lt!477406 lt!477404)) lt!477405))))

(assert (=> b!1076133 (= lt!477403 (addStillNotContains!267 lt!477407 lt!477406 lt!477404 lt!477405))))

(assert (=> b!1076133 (= lt!477405 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1076133 (= lt!477404 (get!17256 (select (arr!33181 _values!955) #b00000000000000000000000000000000) (dynLambda!2061 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1076133 (= lt!477406 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45503 () ListLongMap!14581)

(assert (=> b!1076133 (= lt!477407 call!45503)))

(declare-fun e!615044 () ListLongMap!14581)

(assert (=> b!1076133 (= e!615044 (+!3240 call!45503 (tuple2!16605 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000) (get!17256 (select (arr!33181 _values!955) #b00000000000000000000000000000000) (dynLambda!2061 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1076134 () Bool)

(declare-fun e!615048 () Bool)

(declare-fun e!615045 () Bool)

(assert (=> b!1076134 (= e!615048 e!615045)))

(declare-fun c!108372 () Bool)

(declare-fun e!615046 () Bool)

(assert (=> b!1076134 (= c!108372 e!615046)))

(declare-fun res!717137 () Bool)

(assert (=> b!1076134 (=> (not res!717137) (not e!615046))))

(assert (=> b!1076134 (= res!717137 (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(declare-fun b!1076135 () Bool)

(declare-fun e!615050 () ListLongMap!14581)

(assert (=> b!1076135 (= e!615050 e!615044)))

(declare-fun c!108373 () Bool)

(assert (=> b!1076135 (= c!108373 (validKeyInArray!0 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076136 () Bool)

(assert (=> b!1076136 (= e!615044 call!45503)))

(declare-fun b!1076137 () Bool)

(assert (=> b!1076137 (= e!615045 e!615047)))

(declare-fun c!108370 () Bool)

(assert (=> b!1076137 (= c!108370 (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(declare-fun b!1076138 () Bool)

(declare-fun res!717136 () Bool)

(assert (=> b!1076138 (=> (not res!717136) (not e!615048))))

(assert (=> b!1076138 (= res!717136 (not (contains!6365 lt!477408 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1076139 () Bool)

(declare-fun e!615049 () Bool)

(assert (=> b!1076139 (= e!615045 e!615049)))

(assert (=> b!1076139 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(declare-fun res!717139 () Bool)

(assert (=> b!1076139 (= res!717139 (contains!6365 lt!477408 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076139 (=> (not res!717139) (not e!615049))))

(declare-fun b!1076140 () Bool)

(assert (=> b!1076140 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(assert (=> b!1076140 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33718 _values!955)))))

(assert (=> b!1076140 (= e!615049 (= (apply!946 lt!477408 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)) (get!17256 (select (arr!33181 _values!955) #b00000000000000000000000000000000) (dynLambda!2061 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1076141 () Bool)

(assert (=> b!1076141 (= e!615046 (validKeyInArray!0 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076141 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!130011 () Bool)

(assert (=> d!130011 e!615048))

(declare-fun res!717138 () Bool)

(assert (=> d!130011 (=> (not res!717138) (not e!615048))))

(assert (=> d!130011 (= res!717138 (not (contains!6365 lt!477408 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130011 (= lt!477408 e!615050)))

(declare-fun c!108371 () Bool)

(assert (=> d!130011 (= c!108371 (bvsge #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(assert (=> d!130011 (validMask!0 mask!1515)))

(assert (=> d!130011 (= (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477408)))

(declare-fun bm!45500 () Bool)

(assert (=> bm!45500 (= call!45503 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1076142 () Bool)

(assert (=> b!1076142 (= e!615047 (isEmpty!959 lt!477408))))

(declare-fun b!1076143 () Bool)

(assert (=> b!1076143 (= e!615050 (ListLongMap!14582 Nil!23156))))

(assert (= (and d!130011 c!108371) b!1076143))

(assert (= (and d!130011 (not c!108371)) b!1076135))

(assert (= (and b!1076135 c!108373) b!1076133))

(assert (= (and b!1076135 (not c!108373)) b!1076136))

(assert (= (or b!1076133 b!1076136) bm!45500))

(assert (= (and d!130011 res!717138) b!1076138))

(assert (= (and b!1076138 res!717136) b!1076134))

(assert (= (and b!1076134 res!717137) b!1076141))

(assert (= (and b!1076134 c!108372) b!1076139))

(assert (= (and b!1076134 (not c!108372)) b!1076137))

(assert (= (and b!1076139 res!717139) b!1076140))

(assert (= (and b!1076137 c!108370) b!1076132))

(assert (= (and b!1076137 (not c!108370)) b!1076142))

(declare-fun b_lambda!16847 () Bool)

(assert (=> (not b_lambda!16847) (not b!1076133)))

(assert (=> b!1076133 t!32503))

(declare-fun b_and!35111 () Bool)

(assert (= b_and!35109 (and (=> t!32503 result!14807) b_and!35111)))

(declare-fun b_lambda!16849 () Bool)

(assert (=> (not b_lambda!16849) (not b!1076140)))

(assert (=> b!1076140 t!32503))

(declare-fun b_and!35113 () Bool)

(assert (= b_and!35111 (and (=> t!32503 result!14807) b_and!35113)))

(declare-fun m!995331 () Bool)

(assert (=> b!1076138 m!995331))

(declare-fun m!995333 () Bool)

(assert (=> bm!45500 m!995333))

(assert (=> b!1076135 m!995305))

(assert (=> b!1076135 m!995305))

(assert (=> b!1076135 m!995307))

(assert (=> b!1076133 m!995309))

(assert (=> b!1076133 m!995311))

(assert (=> b!1076133 m!995313))

(declare-fun m!995335 () Bool)

(assert (=> b!1076133 m!995335))

(assert (=> b!1076133 m!995311))

(assert (=> b!1076133 m!995309))

(declare-fun m!995337 () Bool)

(assert (=> b!1076133 m!995337))

(declare-fun m!995339 () Bool)

(assert (=> b!1076133 m!995339))

(assert (=> b!1076133 m!995305))

(declare-fun m!995341 () Bool)

(assert (=> b!1076133 m!995341))

(assert (=> b!1076133 m!995337))

(assert (=> b!1076140 m!995309))

(assert (=> b!1076140 m!995311))

(assert (=> b!1076140 m!995313))

(assert (=> b!1076140 m!995311))

(assert (=> b!1076140 m!995309))

(assert (=> b!1076140 m!995305))

(declare-fun m!995343 () Bool)

(assert (=> b!1076140 m!995343))

(assert (=> b!1076140 m!995305))

(declare-fun m!995345 () Bool)

(assert (=> b!1076142 m!995345))

(assert (=> b!1076132 m!995333))

(declare-fun m!995347 () Bool)

(assert (=> d!130011 m!995347))

(assert (=> d!130011 m!995221))

(assert (=> b!1076141 m!995305))

(assert (=> b!1076141 m!995305))

(assert (=> b!1076141 m!995307))

(assert (=> b!1076139 m!995305))

(assert (=> b!1076139 m!995305))

(declare-fun m!995349 () Bool)

(assert (=> b!1076139 m!995349))

(assert (=> b!1076031 d!130011))

(declare-fun bm!45503 () Bool)

(declare-fun call!45506 () Bool)

(declare-fun c!108376 () Bool)

(assert (=> bm!45503 (= call!45506 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108376 (Cons!23156 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000) Nil!23157) Nil!23157)))))

(declare-fun b!1076154 () Bool)

(declare-fun e!615060 () Bool)

(declare-fun e!615062 () Bool)

(assert (=> b!1076154 (= e!615060 e!615062)))

(declare-fun res!717147 () Bool)

(assert (=> b!1076154 (=> (not res!717147) (not e!615062))))

(declare-fun e!615061 () Bool)

(assert (=> b!1076154 (= res!717147 (not e!615061))))

(declare-fun res!717146 () Bool)

(assert (=> b!1076154 (=> (not res!717146) (not e!615061))))

(assert (=> b!1076154 (= res!717146 (validKeyInArray!0 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076155 () Bool)

(declare-fun e!615059 () Bool)

(assert (=> b!1076155 (= e!615062 e!615059)))

(assert (=> b!1076155 (= c!108376 (validKeyInArray!0 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!130013 () Bool)

(declare-fun res!717148 () Bool)

(assert (=> d!130013 (=> res!717148 e!615060)))

(assert (=> d!130013 (= res!717148 (bvsge #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(assert (=> d!130013 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23157) e!615060)))

(declare-fun b!1076156 () Bool)

(declare-fun contains!6366 (List!23160 (_ BitVec 64)) Bool)

(assert (=> b!1076156 (= e!615061 (contains!6366 Nil!23157 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076157 () Bool)

(assert (=> b!1076157 (= e!615059 call!45506)))

(declare-fun b!1076158 () Bool)

(assert (=> b!1076158 (= e!615059 call!45506)))

(assert (= (and d!130013 (not res!717148)) b!1076154))

(assert (= (and b!1076154 res!717146) b!1076156))

(assert (= (and b!1076154 res!717147) b!1076155))

(assert (= (and b!1076155 c!108376) b!1076158))

(assert (= (and b!1076155 (not c!108376)) b!1076157))

(assert (= (or b!1076158 b!1076157) bm!45503))

(assert (=> bm!45503 m!995305))

(declare-fun m!995351 () Bool)

(assert (=> bm!45503 m!995351))

(assert (=> b!1076154 m!995305))

(assert (=> b!1076154 m!995305))

(assert (=> b!1076154 m!995307))

(assert (=> b!1076155 m!995305))

(assert (=> b!1076155 m!995305))

(assert (=> b!1076155 m!995307))

(assert (=> b!1076156 m!995305))

(assert (=> b!1076156 m!995305))

(declare-fun m!995353 () Bool)

(assert (=> b!1076156 m!995353))

(assert (=> b!1076035 d!130013))

(declare-fun d!130015 () Bool)

(declare-fun e!615067 () Bool)

(assert (=> d!130015 e!615067))

(declare-fun res!717151 () Bool)

(assert (=> d!130015 (=> res!717151 e!615067)))

(declare-fun lt!477417 () Bool)

(assert (=> d!130015 (= res!717151 (not lt!477417))))

(declare-fun lt!477420 () Bool)

(assert (=> d!130015 (= lt!477417 lt!477420)))

(declare-fun lt!477418 () Unit!35354)

(declare-fun e!615068 () Unit!35354)

(assert (=> d!130015 (= lt!477418 e!615068)))

(declare-fun c!108379 () Bool)

(assert (=> d!130015 (= c!108379 lt!477420)))

(declare-fun containsKey!580 (List!23159 (_ BitVec 64)) Bool)

(assert (=> d!130015 (= lt!477420 (containsKey!580 (toList!7306 lt!477343) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!130015 (= (contains!6365 lt!477343 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477417)))

(declare-fun b!1076165 () Bool)

(declare-fun lt!477419 () Unit!35354)

(assert (=> b!1076165 (= e!615068 lt!477419)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!411 (List!23159 (_ BitVec 64)) Unit!35354)

(assert (=> b!1076165 (= lt!477419 (lemmaContainsKeyImpliesGetValueByKeyDefined!411 (toList!7306 lt!477343) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!656 0))(
  ( (Some!655 (v!15668 V!39793)) (None!654) )
))
(declare-fun isDefined!449 (Option!656) Bool)

(declare-fun getValueByKey!605 (List!23159 (_ BitVec 64)) Option!656)

(assert (=> b!1076165 (isDefined!449 (getValueByKey!605 (toList!7306 lt!477343) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076166 () Bool)

(declare-fun Unit!35358 () Unit!35354)

(assert (=> b!1076166 (= e!615068 Unit!35358)))

(declare-fun b!1076167 () Bool)

(assert (=> b!1076167 (= e!615067 (isDefined!449 (getValueByKey!605 (toList!7306 lt!477343) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!130015 c!108379) b!1076165))

(assert (= (and d!130015 (not c!108379)) b!1076166))

(assert (= (and d!130015 (not res!717151)) b!1076167))

(declare-fun m!995355 () Bool)

(assert (=> d!130015 m!995355))

(declare-fun m!995357 () Bool)

(assert (=> b!1076165 m!995357))

(declare-fun m!995359 () Bool)

(assert (=> b!1076165 m!995359))

(assert (=> b!1076165 m!995359))

(declare-fun m!995361 () Bool)

(assert (=> b!1076165 m!995361))

(assert (=> b!1076167 m!995359))

(assert (=> b!1076167 m!995359))

(assert (=> b!1076167 m!995361))

(assert (=> b!1076038 d!130015))

(declare-fun d!130017 () Bool)

(declare-fun e!615071 () Bool)

(assert (=> d!130017 e!615071))

(declare-fun res!717157 () Bool)

(assert (=> d!130017 (=> (not res!717157) (not e!615071))))

(declare-fun lt!477431 () ListLongMap!14581)

(assert (=> d!130017 (= res!717157 (contains!6365 lt!477431 (_1!8313 (tuple2!16605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!477430 () List!23159)

(assert (=> d!130017 (= lt!477431 (ListLongMap!14582 lt!477430))))

(declare-fun lt!477429 () Unit!35354)

(declare-fun lt!477432 () Unit!35354)

(assert (=> d!130017 (= lt!477429 lt!477432)))

(assert (=> d!130017 (= (getValueByKey!605 lt!477430 (_1!8313 (tuple2!16605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!655 (_2!8313 (tuple2!16605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!289 (List!23159 (_ BitVec 64) V!39793) Unit!35354)

(assert (=> d!130017 (= lt!477432 (lemmaContainsTupThenGetReturnValue!289 lt!477430 (_1!8313 (tuple2!16605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8313 (tuple2!16605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!382 (List!23159 (_ BitVec 64) V!39793) List!23159)

(assert (=> d!130017 (= lt!477430 (insertStrictlySorted!382 (toList!7306 lt!477343) (_1!8313 (tuple2!16605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8313 (tuple2!16605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!130017 (= (+!3240 lt!477343 (tuple2!16605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!477431)))

(declare-fun b!1076172 () Bool)

(declare-fun res!717156 () Bool)

(assert (=> b!1076172 (=> (not res!717156) (not e!615071))))

(assert (=> b!1076172 (= res!717156 (= (getValueByKey!605 (toList!7306 lt!477431) (_1!8313 (tuple2!16605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!655 (_2!8313 (tuple2!16605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1076173 () Bool)

(declare-fun contains!6367 (List!23159 tuple2!16604) Bool)

(assert (=> b!1076173 (= e!615071 (contains!6367 (toList!7306 lt!477431) (tuple2!16605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!130017 res!717157) b!1076172))

(assert (= (and b!1076172 res!717156) b!1076173))

(declare-fun m!995363 () Bool)

(assert (=> d!130017 m!995363))

(declare-fun m!995365 () Bool)

(assert (=> d!130017 m!995365))

(declare-fun m!995367 () Bool)

(assert (=> d!130017 m!995367))

(declare-fun m!995369 () Bool)

(assert (=> d!130017 m!995369))

(declare-fun m!995371 () Bool)

(assert (=> b!1076172 m!995371))

(declare-fun m!995373 () Bool)

(assert (=> b!1076173 m!995373))

(assert (=> b!1076038 d!130017))

(declare-fun bm!45518 () Bool)

(declare-fun call!45523 () ListLongMap!14581)

(declare-fun call!45526 () ListLongMap!14581)

(assert (=> bm!45518 (= call!45523 call!45526)))

(declare-fun b!1076216 () Bool)

(declare-fun res!717177 () Bool)

(declare-fun e!615110 () Bool)

(assert (=> b!1076216 (=> (not res!717177) (not e!615110))))

(declare-fun e!615099 () Bool)

(assert (=> b!1076216 (= res!717177 e!615099)))

(declare-fun c!108393 () Bool)

(assert (=> b!1076216 (= c!108393 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076217 () Bool)

(declare-fun e!615108 () Bool)

(assert (=> b!1076217 (= e!615108 (validKeyInArray!0 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076218 () Bool)

(declare-fun e!615104 () ListLongMap!14581)

(declare-fun call!45527 () ListLongMap!14581)

(assert (=> b!1076218 (= e!615104 call!45527)))

(declare-fun b!1076219 () Bool)

(declare-fun e!615105 () Bool)

(assert (=> b!1076219 (= e!615105 (validKeyInArray!0 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45519 () Bool)

(declare-fun call!45522 () ListLongMap!14581)

(declare-fun c!108392 () Bool)

(declare-fun c!108394 () Bool)

(assert (=> bm!45519 (= call!45522 (+!3240 (ite c!108394 call!45526 (ite c!108392 call!45523 call!45527)) (ite (or c!108394 c!108392) (tuple2!16605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45520 () Bool)

(declare-fun call!45525 () Bool)

(declare-fun lt!477482 () ListLongMap!14581)

(assert (=> bm!45520 (= call!45525 (contains!6365 lt!477482 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076220 () Bool)

(declare-fun e!615107 () Bool)

(assert (=> b!1076220 (= e!615107 (= (apply!946 lt!477482 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1076222 () Bool)

(declare-fun e!615109 () ListLongMap!14581)

(assert (=> b!1076222 (= e!615109 (+!3240 call!45522 (tuple2!16605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1076223 () Bool)

(declare-fun e!615102 () Bool)

(assert (=> b!1076223 (= e!615110 e!615102)))

(declare-fun c!108397 () Bool)

(assert (=> b!1076223 (= c!108397 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1076224 () Bool)

(declare-fun call!45524 () ListLongMap!14581)

(assert (=> b!1076224 (= e!615104 call!45524)))

(declare-fun bm!45521 () Bool)

(assert (=> bm!45521 (= call!45527 call!45523)))

(declare-fun b!1076225 () Bool)

(declare-fun c!108396 () Bool)

(assert (=> b!1076225 (= c!108396 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!615106 () ListLongMap!14581)

(assert (=> b!1076225 (= e!615106 e!615104)))

(declare-fun b!1076226 () Bool)

(declare-fun e!615100 () Unit!35354)

(declare-fun lt!477481 () Unit!35354)

(assert (=> b!1076226 (= e!615100 lt!477481)))

(declare-fun lt!477488 () ListLongMap!14581)

(assert (=> b!1076226 (= lt!477488 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477477 () (_ BitVec 64))

(assert (=> b!1076226 (= lt!477477 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477480 () (_ BitVec 64))

(assert (=> b!1076226 (= lt!477480 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477492 () Unit!35354)

(declare-fun addStillContains!650 (ListLongMap!14581 (_ BitVec 64) V!39793 (_ BitVec 64)) Unit!35354)

(assert (=> b!1076226 (= lt!477492 (addStillContains!650 lt!477488 lt!477477 zeroValueAfter!47 lt!477480))))

(assert (=> b!1076226 (contains!6365 (+!3240 lt!477488 (tuple2!16605 lt!477477 zeroValueAfter!47)) lt!477480)))

(declare-fun lt!477479 () Unit!35354)

(assert (=> b!1076226 (= lt!477479 lt!477492)))

(declare-fun lt!477498 () ListLongMap!14581)

(assert (=> b!1076226 (= lt!477498 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477489 () (_ BitVec 64))

(assert (=> b!1076226 (= lt!477489 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477497 () (_ BitVec 64))

(assert (=> b!1076226 (= lt!477497 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477486 () Unit!35354)

(declare-fun addApplyDifferent!506 (ListLongMap!14581 (_ BitVec 64) V!39793 (_ BitVec 64)) Unit!35354)

(assert (=> b!1076226 (= lt!477486 (addApplyDifferent!506 lt!477498 lt!477489 minValue!907 lt!477497))))

(assert (=> b!1076226 (= (apply!946 (+!3240 lt!477498 (tuple2!16605 lt!477489 minValue!907)) lt!477497) (apply!946 lt!477498 lt!477497))))

(declare-fun lt!477494 () Unit!35354)

(assert (=> b!1076226 (= lt!477494 lt!477486)))

(declare-fun lt!477493 () ListLongMap!14581)

(assert (=> b!1076226 (= lt!477493 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477483 () (_ BitVec 64))

(assert (=> b!1076226 (= lt!477483 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477491 () (_ BitVec 64))

(assert (=> b!1076226 (= lt!477491 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477487 () Unit!35354)

(assert (=> b!1076226 (= lt!477487 (addApplyDifferent!506 lt!477493 lt!477483 zeroValueAfter!47 lt!477491))))

(assert (=> b!1076226 (= (apply!946 (+!3240 lt!477493 (tuple2!16605 lt!477483 zeroValueAfter!47)) lt!477491) (apply!946 lt!477493 lt!477491))))

(declare-fun lt!477496 () Unit!35354)

(assert (=> b!1076226 (= lt!477496 lt!477487)))

(declare-fun lt!477485 () ListLongMap!14581)

(assert (=> b!1076226 (= lt!477485 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477478 () (_ BitVec 64))

(assert (=> b!1076226 (= lt!477478 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477484 () (_ BitVec 64))

(assert (=> b!1076226 (= lt!477484 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076226 (= lt!477481 (addApplyDifferent!506 lt!477485 lt!477478 minValue!907 lt!477484))))

(assert (=> b!1076226 (= (apply!946 (+!3240 lt!477485 (tuple2!16605 lt!477478 minValue!907)) lt!477484) (apply!946 lt!477485 lt!477484))))

(declare-fun b!1076227 () Bool)

(assert (=> b!1076227 (= e!615106 call!45524)))

(declare-fun b!1076228 () Bool)

(assert (=> b!1076228 (= e!615109 e!615106)))

(assert (=> b!1076228 (= c!108392 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45522 () Bool)

(declare-fun call!45521 () Bool)

(assert (=> bm!45522 (= call!45521 (contains!6365 lt!477482 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076229 () Bool)

(declare-fun Unit!35359 () Unit!35354)

(assert (=> b!1076229 (= e!615100 Unit!35359)))

(declare-fun b!1076230 () Bool)

(declare-fun e!615098 () Bool)

(assert (=> b!1076230 (= e!615102 e!615098)))

(declare-fun res!717183 () Bool)

(assert (=> b!1076230 (= res!717183 call!45525)))

(assert (=> b!1076230 (=> (not res!717183) (not e!615098))))

(declare-fun b!1076231 () Bool)

(assert (=> b!1076231 (= e!615102 (not call!45525))))

(declare-fun b!1076232 () Bool)

(declare-fun e!615103 () Bool)

(declare-fun e!615101 () Bool)

(assert (=> b!1076232 (= e!615103 e!615101)))

(declare-fun res!717184 () Bool)

(assert (=> b!1076232 (=> (not res!717184) (not e!615101))))

(assert (=> b!1076232 (= res!717184 (contains!6365 lt!477482 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076232 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(declare-fun b!1076221 () Bool)

(assert (=> b!1076221 (= e!615101 (= (apply!946 lt!477482 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)) (get!17256 (select (arr!33181 _values!955) #b00000000000000000000000000000000) (dynLambda!2061 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1076221 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33718 _values!955)))))

(assert (=> b!1076221 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(declare-fun d!130019 () Bool)

(assert (=> d!130019 e!615110))

(declare-fun res!717180 () Bool)

(assert (=> d!130019 (=> (not res!717180) (not e!615110))))

(assert (=> d!130019 (= res!717180 (or (bvsge #b00000000000000000000000000000000 (size!33719 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))))

(declare-fun lt!477495 () ListLongMap!14581)

(assert (=> d!130019 (= lt!477482 lt!477495)))

(declare-fun lt!477490 () Unit!35354)

(assert (=> d!130019 (= lt!477490 e!615100)))

(declare-fun c!108395 () Bool)

(assert (=> d!130019 (= c!108395 e!615108)))

(declare-fun res!717178 () Bool)

(assert (=> d!130019 (=> (not res!717178) (not e!615108))))

(assert (=> d!130019 (= res!717178 (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(assert (=> d!130019 (= lt!477495 e!615109)))

(assert (=> d!130019 (= c!108394 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130019 (validMask!0 mask!1515)))

(assert (=> d!130019 (= (getCurrentListMap!4167 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477482)))

(declare-fun b!1076233 () Bool)

(assert (=> b!1076233 (= e!615099 e!615107)))

(declare-fun res!717181 () Bool)

(assert (=> b!1076233 (= res!717181 call!45521)))

(assert (=> b!1076233 (=> (not res!717181) (not e!615107))))

(declare-fun bm!45523 () Bool)

(assert (=> bm!45523 (= call!45526 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076234 () Bool)

(assert (=> b!1076234 (= e!615099 (not call!45521))))

(declare-fun b!1076235 () Bool)

(declare-fun res!717179 () Bool)

(assert (=> b!1076235 (=> (not res!717179) (not e!615110))))

(assert (=> b!1076235 (= res!717179 e!615103)))

(declare-fun res!717182 () Bool)

(assert (=> b!1076235 (=> res!717182 e!615103)))

(assert (=> b!1076235 (= res!717182 (not e!615105))))

(declare-fun res!717176 () Bool)

(assert (=> b!1076235 (=> (not res!717176) (not e!615105))))

(assert (=> b!1076235 (= res!717176 (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(declare-fun b!1076236 () Bool)

(assert (=> b!1076236 (= e!615098 (= (apply!946 lt!477482 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45524 () Bool)

(assert (=> bm!45524 (= call!45524 call!45522)))

(assert (= (and d!130019 c!108394) b!1076222))

(assert (= (and d!130019 (not c!108394)) b!1076228))

(assert (= (and b!1076228 c!108392) b!1076227))

(assert (= (and b!1076228 (not c!108392)) b!1076225))

(assert (= (and b!1076225 c!108396) b!1076224))

(assert (= (and b!1076225 (not c!108396)) b!1076218))

(assert (= (or b!1076224 b!1076218) bm!45521))

(assert (= (or b!1076227 bm!45521) bm!45518))

(assert (= (or b!1076227 b!1076224) bm!45524))

(assert (= (or b!1076222 bm!45518) bm!45523))

(assert (= (or b!1076222 bm!45524) bm!45519))

(assert (= (and d!130019 res!717178) b!1076217))

(assert (= (and d!130019 c!108395) b!1076226))

(assert (= (and d!130019 (not c!108395)) b!1076229))

(assert (= (and d!130019 res!717180) b!1076235))

(assert (= (and b!1076235 res!717176) b!1076219))

(assert (= (and b!1076235 (not res!717182)) b!1076232))

(assert (= (and b!1076232 res!717184) b!1076221))

(assert (= (and b!1076235 res!717179) b!1076216))

(assert (= (and b!1076216 c!108393) b!1076233))

(assert (= (and b!1076216 (not c!108393)) b!1076234))

(assert (= (and b!1076233 res!717181) b!1076220))

(assert (= (or b!1076233 b!1076234) bm!45522))

(assert (= (and b!1076216 res!717177) b!1076223))

(assert (= (and b!1076223 c!108397) b!1076230))

(assert (= (and b!1076223 (not c!108397)) b!1076231))

(assert (= (and b!1076230 res!717183) b!1076236))

(assert (= (or b!1076230 b!1076231) bm!45520))

(declare-fun b_lambda!16851 () Bool)

(assert (=> (not b_lambda!16851) (not b!1076221)))

(assert (=> b!1076221 t!32503))

(declare-fun b_and!35115 () Bool)

(assert (= b_and!35113 (and (=> t!32503 result!14807) b_and!35115)))

(declare-fun m!995375 () Bool)

(assert (=> b!1076222 m!995375))

(declare-fun m!995377 () Bool)

(assert (=> bm!45519 m!995377))

(assert (=> bm!45523 m!995229))

(declare-fun m!995379 () Bool)

(assert (=> bm!45520 m!995379))

(declare-fun m!995381 () Bool)

(assert (=> bm!45522 m!995381))

(assert (=> d!130019 m!995221))

(declare-fun m!995383 () Bool)

(assert (=> b!1076220 m!995383))

(declare-fun m!995385 () Bool)

(assert (=> b!1076236 m!995385))

(assert (=> b!1076219 m!995305))

(assert (=> b!1076219 m!995305))

(assert (=> b!1076219 m!995307))

(assert (=> b!1076232 m!995305))

(assert (=> b!1076232 m!995305))

(declare-fun m!995387 () Bool)

(assert (=> b!1076232 m!995387))

(assert (=> b!1076221 m!995305))

(assert (=> b!1076221 m!995309))

(assert (=> b!1076221 m!995311))

(assert (=> b!1076221 m!995305))

(declare-fun m!995389 () Bool)

(assert (=> b!1076221 m!995389))

(assert (=> b!1076221 m!995309))

(assert (=> b!1076221 m!995311))

(assert (=> b!1076221 m!995313))

(declare-fun m!995391 () Bool)

(assert (=> b!1076226 m!995391))

(declare-fun m!995393 () Bool)

(assert (=> b!1076226 m!995393))

(declare-fun m!995395 () Bool)

(assert (=> b!1076226 m!995395))

(declare-fun m!995397 () Bool)

(assert (=> b!1076226 m!995397))

(declare-fun m!995399 () Bool)

(assert (=> b!1076226 m!995399))

(declare-fun m!995401 () Bool)

(assert (=> b!1076226 m!995401))

(declare-fun m!995403 () Bool)

(assert (=> b!1076226 m!995403))

(assert (=> b!1076226 m!995229))

(declare-fun m!995405 () Bool)

(assert (=> b!1076226 m!995405))

(declare-fun m!995407 () Bool)

(assert (=> b!1076226 m!995407))

(declare-fun m!995409 () Bool)

(assert (=> b!1076226 m!995409))

(declare-fun m!995411 () Bool)

(assert (=> b!1076226 m!995411))

(assert (=> b!1076226 m!995399))

(declare-fun m!995413 () Bool)

(assert (=> b!1076226 m!995413))

(assert (=> b!1076226 m!995305))

(declare-fun m!995415 () Bool)

(assert (=> b!1076226 m!995415))

(assert (=> b!1076226 m!995415))

(declare-fun m!995417 () Bool)

(assert (=> b!1076226 m!995417))

(assert (=> b!1076226 m!995405))

(declare-fun m!995419 () Bool)

(assert (=> b!1076226 m!995419))

(assert (=> b!1076226 m!995393))

(assert (=> b!1076217 m!995305))

(assert (=> b!1076217 m!995305))

(assert (=> b!1076217 m!995307))

(assert (=> b!1076038 d!130019))

(declare-fun bm!45525 () Bool)

(declare-fun call!45530 () ListLongMap!14581)

(declare-fun call!45533 () ListLongMap!14581)

(assert (=> bm!45525 (= call!45530 call!45533)))

(declare-fun b!1076237 () Bool)

(declare-fun res!717186 () Bool)

(declare-fun e!615123 () Bool)

(assert (=> b!1076237 (=> (not res!717186) (not e!615123))))

(declare-fun e!615112 () Bool)

(assert (=> b!1076237 (= res!717186 e!615112)))

(declare-fun c!108399 () Bool)

(assert (=> b!1076237 (= c!108399 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076238 () Bool)

(declare-fun e!615121 () Bool)

(assert (=> b!1076238 (= e!615121 (validKeyInArray!0 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076239 () Bool)

(declare-fun e!615117 () ListLongMap!14581)

(declare-fun call!45534 () ListLongMap!14581)

(assert (=> b!1076239 (= e!615117 call!45534)))

(declare-fun b!1076240 () Bool)

(declare-fun e!615118 () Bool)

(assert (=> b!1076240 (= e!615118 (validKeyInArray!0 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun c!108400 () Bool)

(declare-fun call!45529 () ListLongMap!14581)

(declare-fun c!108398 () Bool)

(declare-fun bm!45526 () Bool)

(assert (=> bm!45526 (= call!45529 (+!3240 (ite c!108400 call!45533 (ite c!108398 call!45530 call!45534)) (ite (or c!108400 c!108398) (tuple2!16605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45527 () Bool)

(declare-fun call!45532 () Bool)

(declare-fun lt!477504 () ListLongMap!14581)

(assert (=> bm!45527 (= call!45532 (contains!6365 lt!477504 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076241 () Bool)

(declare-fun e!615120 () Bool)

(assert (=> b!1076241 (= e!615120 (= (apply!946 lt!477504 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1076243 () Bool)

(declare-fun e!615122 () ListLongMap!14581)

(assert (=> b!1076243 (= e!615122 (+!3240 call!45529 (tuple2!16605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1076244 () Bool)

(declare-fun e!615115 () Bool)

(assert (=> b!1076244 (= e!615123 e!615115)))

(declare-fun c!108403 () Bool)

(assert (=> b!1076244 (= c!108403 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1076245 () Bool)

(declare-fun call!45531 () ListLongMap!14581)

(assert (=> b!1076245 (= e!615117 call!45531)))

(declare-fun bm!45528 () Bool)

(assert (=> bm!45528 (= call!45534 call!45530)))

(declare-fun b!1076246 () Bool)

(declare-fun c!108402 () Bool)

(assert (=> b!1076246 (= c!108402 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!615119 () ListLongMap!14581)

(assert (=> b!1076246 (= e!615119 e!615117)))

(declare-fun b!1076247 () Bool)

(declare-fun e!615113 () Unit!35354)

(declare-fun lt!477503 () Unit!35354)

(assert (=> b!1076247 (= e!615113 lt!477503)))

(declare-fun lt!477510 () ListLongMap!14581)

(assert (=> b!1076247 (= lt!477510 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477499 () (_ BitVec 64))

(assert (=> b!1076247 (= lt!477499 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477502 () (_ BitVec 64))

(assert (=> b!1076247 (= lt!477502 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477514 () Unit!35354)

(assert (=> b!1076247 (= lt!477514 (addStillContains!650 lt!477510 lt!477499 zeroValueBefore!47 lt!477502))))

(assert (=> b!1076247 (contains!6365 (+!3240 lt!477510 (tuple2!16605 lt!477499 zeroValueBefore!47)) lt!477502)))

(declare-fun lt!477501 () Unit!35354)

(assert (=> b!1076247 (= lt!477501 lt!477514)))

(declare-fun lt!477520 () ListLongMap!14581)

(assert (=> b!1076247 (= lt!477520 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477511 () (_ BitVec 64))

(assert (=> b!1076247 (= lt!477511 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477519 () (_ BitVec 64))

(assert (=> b!1076247 (= lt!477519 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477508 () Unit!35354)

(assert (=> b!1076247 (= lt!477508 (addApplyDifferent!506 lt!477520 lt!477511 minValue!907 lt!477519))))

(assert (=> b!1076247 (= (apply!946 (+!3240 lt!477520 (tuple2!16605 lt!477511 minValue!907)) lt!477519) (apply!946 lt!477520 lt!477519))))

(declare-fun lt!477516 () Unit!35354)

(assert (=> b!1076247 (= lt!477516 lt!477508)))

(declare-fun lt!477515 () ListLongMap!14581)

(assert (=> b!1076247 (= lt!477515 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477505 () (_ BitVec 64))

(assert (=> b!1076247 (= lt!477505 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477513 () (_ BitVec 64))

(assert (=> b!1076247 (= lt!477513 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477509 () Unit!35354)

(assert (=> b!1076247 (= lt!477509 (addApplyDifferent!506 lt!477515 lt!477505 zeroValueBefore!47 lt!477513))))

(assert (=> b!1076247 (= (apply!946 (+!3240 lt!477515 (tuple2!16605 lt!477505 zeroValueBefore!47)) lt!477513) (apply!946 lt!477515 lt!477513))))

(declare-fun lt!477518 () Unit!35354)

(assert (=> b!1076247 (= lt!477518 lt!477509)))

(declare-fun lt!477507 () ListLongMap!14581)

(assert (=> b!1076247 (= lt!477507 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477500 () (_ BitVec 64))

(assert (=> b!1076247 (= lt!477500 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477506 () (_ BitVec 64))

(assert (=> b!1076247 (= lt!477506 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076247 (= lt!477503 (addApplyDifferent!506 lt!477507 lt!477500 minValue!907 lt!477506))))

(assert (=> b!1076247 (= (apply!946 (+!3240 lt!477507 (tuple2!16605 lt!477500 minValue!907)) lt!477506) (apply!946 lt!477507 lt!477506))))

(declare-fun b!1076248 () Bool)

(assert (=> b!1076248 (= e!615119 call!45531)))

(declare-fun b!1076249 () Bool)

(assert (=> b!1076249 (= e!615122 e!615119)))

(assert (=> b!1076249 (= c!108398 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45529 () Bool)

(declare-fun call!45528 () Bool)

(assert (=> bm!45529 (= call!45528 (contains!6365 lt!477504 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076250 () Bool)

(declare-fun Unit!35360 () Unit!35354)

(assert (=> b!1076250 (= e!615113 Unit!35360)))

(declare-fun b!1076251 () Bool)

(declare-fun e!615111 () Bool)

(assert (=> b!1076251 (= e!615115 e!615111)))

(declare-fun res!717192 () Bool)

(assert (=> b!1076251 (= res!717192 call!45532)))

(assert (=> b!1076251 (=> (not res!717192) (not e!615111))))

(declare-fun b!1076252 () Bool)

(assert (=> b!1076252 (= e!615115 (not call!45532))))

(declare-fun b!1076253 () Bool)

(declare-fun e!615116 () Bool)

(declare-fun e!615114 () Bool)

(assert (=> b!1076253 (= e!615116 e!615114)))

(declare-fun res!717193 () Bool)

(assert (=> b!1076253 (=> (not res!717193) (not e!615114))))

(assert (=> b!1076253 (= res!717193 (contains!6365 lt!477504 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076253 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(declare-fun b!1076242 () Bool)

(assert (=> b!1076242 (= e!615114 (= (apply!946 lt!477504 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)) (get!17256 (select (arr!33181 _values!955) #b00000000000000000000000000000000) (dynLambda!2061 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1076242 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33718 _values!955)))))

(assert (=> b!1076242 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(declare-fun d!130021 () Bool)

(assert (=> d!130021 e!615123))

(declare-fun res!717189 () Bool)

(assert (=> d!130021 (=> (not res!717189) (not e!615123))))

(assert (=> d!130021 (= res!717189 (or (bvsge #b00000000000000000000000000000000 (size!33719 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))))

(declare-fun lt!477517 () ListLongMap!14581)

(assert (=> d!130021 (= lt!477504 lt!477517)))

(declare-fun lt!477512 () Unit!35354)

(assert (=> d!130021 (= lt!477512 e!615113)))

(declare-fun c!108401 () Bool)

(assert (=> d!130021 (= c!108401 e!615121)))

(declare-fun res!717187 () Bool)

(assert (=> d!130021 (=> (not res!717187) (not e!615121))))

(assert (=> d!130021 (= res!717187 (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(assert (=> d!130021 (= lt!477517 e!615122)))

(assert (=> d!130021 (= c!108400 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130021 (validMask!0 mask!1515)))

(assert (=> d!130021 (= (getCurrentListMap!4167 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477504)))

(declare-fun b!1076254 () Bool)

(assert (=> b!1076254 (= e!615112 e!615120)))

(declare-fun res!717190 () Bool)

(assert (=> b!1076254 (= res!717190 call!45528)))

(assert (=> b!1076254 (=> (not res!717190) (not e!615120))))

(declare-fun bm!45530 () Bool)

(assert (=> bm!45530 (= call!45533 (getCurrentListMapNoExtraKeys!3902 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076255 () Bool)

(assert (=> b!1076255 (= e!615112 (not call!45528))))

(declare-fun b!1076256 () Bool)

(declare-fun res!717188 () Bool)

(assert (=> b!1076256 (=> (not res!717188) (not e!615123))))

(assert (=> b!1076256 (= res!717188 e!615116)))

(declare-fun res!717191 () Bool)

(assert (=> b!1076256 (=> res!717191 e!615116)))

(assert (=> b!1076256 (= res!717191 (not e!615118))))

(declare-fun res!717185 () Bool)

(assert (=> b!1076256 (=> (not res!717185) (not e!615118))))

(assert (=> b!1076256 (= res!717185 (bvslt #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(declare-fun b!1076257 () Bool)

(assert (=> b!1076257 (= e!615111 (= (apply!946 lt!477504 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45531 () Bool)

(assert (=> bm!45531 (= call!45531 call!45529)))

(assert (= (and d!130021 c!108400) b!1076243))

(assert (= (and d!130021 (not c!108400)) b!1076249))

(assert (= (and b!1076249 c!108398) b!1076248))

(assert (= (and b!1076249 (not c!108398)) b!1076246))

(assert (= (and b!1076246 c!108402) b!1076245))

(assert (= (and b!1076246 (not c!108402)) b!1076239))

(assert (= (or b!1076245 b!1076239) bm!45528))

(assert (= (or b!1076248 bm!45528) bm!45525))

(assert (= (or b!1076248 b!1076245) bm!45531))

(assert (= (or b!1076243 bm!45525) bm!45530))

(assert (= (or b!1076243 bm!45531) bm!45526))

(assert (= (and d!130021 res!717187) b!1076238))

(assert (= (and d!130021 c!108401) b!1076247))

(assert (= (and d!130021 (not c!108401)) b!1076250))

(assert (= (and d!130021 res!717189) b!1076256))

(assert (= (and b!1076256 res!717185) b!1076240))

(assert (= (and b!1076256 (not res!717191)) b!1076253))

(assert (= (and b!1076253 res!717193) b!1076242))

(assert (= (and b!1076256 res!717188) b!1076237))

(assert (= (and b!1076237 c!108399) b!1076254))

(assert (= (and b!1076237 (not c!108399)) b!1076255))

(assert (= (and b!1076254 res!717190) b!1076241))

(assert (= (or b!1076254 b!1076255) bm!45529))

(assert (= (and b!1076237 res!717186) b!1076244))

(assert (= (and b!1076244 c!108403) b!1076251))

(assert (= (and b!1076244 (not c!108403)) b!1076252))

(assert (= (and b!1076251 res!717192) b!1076257))

(assert (= (or b!1076251 b!1076252) bm!45527))

(declare-fun b_lambda!16853 () Bool)

(assert (=> (not b_lambda!16853) (not b!1076242)))

(assert (=> b!1076242 t!32503))

(declare-fun b_and!35117 () Bool)

(assert (= b_and!35115 (and (=> t!32503 result!14807) b_and!35117)))

(declare-fun m!995421 () Bool)

(assert (=> b!1076243 m!995421))

(declare-fun m!995423 () Bool)

(assert (=> bm!45526 m!995423))

(assert (=> bm!45530 m!995231))

(declare-fun m!995425 () Bool)

(assert (=> bm!45527 m!995425))

(declare-fun m!995427 () Bool)

(assert (=> bm!45529 m!995427))

(assert (=> d!130021 m!995221))

(declare-fun m!995429 () Bool)

(assert (=> b!1076241 m!995429))

(declare-fun m!995431 () Bool)

(assert (=> b!1076257 m!995431))

(assert (=> b!1076240 m!995305))

(assert (=> b!1076240 m!995305))

(assert (=> b!1076240 m!995307))

(assert (=> b!1076253 m!995305))

(assert (=> b!1076253 m!995305))

(declare-fun m!995433 () Bool)

(assert (=> b!1076253 m!995433))

(assert (=> b!1076242 m!995305))

(assert (=> b!1076242 m!995309))

(assert (=> b!1076242 m!995311))

(assert (=> b!1076242 m!995305))

(declare-fun m!995435 () Bool)

(assert (=> b!1076242 m!995435))

(assert (=> b!1076242 m!995309))

(assert (=> b!1076242 m!995311))

(assert (=> b!1076242 m!995313))

(declare-fun m!995437 () Bool)

(assert (=> b!1076247 m!995437))

(declare-fun m!995439 () Bool)

(assert (=> b!1076247 m!995439))

(declare-fun m!995441 () Bool)

(assert (=> b!1076247 m!995441))

(declare-fun m!995443 () Bool)

(assert (=> b!1076247 m!995443))

(declare-fun m!995445 () Bool)

(assert (=> b!1076247 m!995445))

(declare-fun m!995447 () Bool)

(assert (=> b!1076247 m!995447))

(declare-fun m!995449 () Bool)

(assert (=> b!1076247 m!995449))

(assert (=> b!1076247 m!995231))

(declare-fun m!995451 () Bool)

(assert (=> b!1076247 m!995451))

(declare-fun m!995453 () Bool)

(assert (=> b!1076247 m!995453))

(declare-fun m!995455 () Bool)

(assert (=> b!1076247 m!995455))

(declare-fun m!995457 () Bool)

(assert (=> b!1076247 m!995457))

(assert (=> b!1076247 m!995445))

(declare-fun m!995459 () Bool)

(assert (=> b!1076247 m!995459))

(assert (=> b!1076247 m!995305))

(declare-fun m!995461 () Bool)

(assert (=> b!1076247 m!995461))

(assert (=> b!1076247 m!995461))

(declare-fun m!995463 () Bool)

(assert (=> b!1076247 m!995463))

(assert (=> b!1076247 m!995451))

(declare-fun m!995465 () Bool)

(assert (=> b!1076247 m!995465))

(assert (=> b!1076247 m!995439))

(assert (=> b!1076238 m!995305))

(assert (=> b!1076238 m!995305))

(assert (=> b!1076238 m!995307))

(assert (=> b!1076038 d!130021))

(declare-fun b!1076266 () Bool)

(declare-fun e!615131 () Bool)

(declare-fun e!615132 () Bool)

(assert (=> b!1076266 (= e!615131 e!615132)))

(declare-fun lt!477528 () (_ BitVec 64))

(assert (=> b!1076266 (= lt!477528 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477529 () Unit!35354)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68999 (_ BitVec 64) (_ BitVec 32)) Unit!35354)

(assert (=> b!1076266 (= lt!477529 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!477528 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1076266 (arrayContainsKey!0 _keys!1163 lt!477528 #b00000000000000000000000000000000)))

(declare-fun lt!477527 () Unit!35354)

(assert (=> b!1076266 (= lt!477527 lt!477529)))

(declare-fun res!717199 () Bool)

(declare-datatypes ((SeekEntryResult!9846 0))(
  ( (MissingZero!9846 (index!41755 (_ BitVec 32))) (Found!9846 (index!41756 (_ BitVec 32))) (Intermediate!9846 (undefined!10658 Bool) (index!41757 (_ BitVec 32)) (x!96304 (_ BitVec 32))) (Undefined!9846) (MissingVacant!9846 (index!41758 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68999 (_ BitVec 32)) SeekEntryResult!9846)

(assert (=> b!1076266 (= res!717199 (= (seekEntryOrOpen!0 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9846 #b00000000000000000000000000000000)))))

(assert (=> b!1076266 (=> (not res!717199) (not e!615132))))

(declare-fun bm!45534 () Bool)

(declare-fun call!45537 () Bool)

(assert (=> bm!45534 (= call!45537 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1076268 () Bool)

(assert (=> b!1076268 (= e!615132 call!45537)))

(declare-fun b!1076269 () Bool)

(assert (=> b!1076269 (= e!615131 call!45537)))

(declare-fun d!130023 () Bool)

(declare-fun res!717198 () Bool)

(declare-fun e!615130 () Bool)

(assert (=> d!130023 (=> res!717198 e!615130)))

(assert (=> d!130023 (= res!717198 (bvsge #b00000000000000000000000000000000 (size!33719 _keys!1163)))))

(assert (=> d!130023 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!615130)))

(declare-fun b!1076267 () Bool)

(assert (=> b!1076267 (= e!615130 e!615131)))

(declare-fun c!108406 () Bool)

(assert (=> b!1076267 (= c!108406 (validKeyInArray!0 (select (arr!33182 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!130023 (not res!717198)) b!1076267))

(assert (= (and b!1076267 c!108406) b!1076266))

(assert (= (and b!1076267 (not c!108406)) b!1076269))

(assert (= (and b!1076266 res!717199) b!1076268))

(assert (= (or b!1076268 b!1076269) bm!45534))

(assert (=> b!1076266 m!995305))

(declare-fun m!995467 () Bool)

(assert (=> b!1076266 m!995467))

(declare-fun m!995469 () Bool)

(assert (=> b!1076266 m!995469))

(assert (=> b!1076266 m!995305))

(declare-fun m!995471 () Bool)

(assert (=> b!1076266 m!995471))

(declare-fun m!995473 () Bool)

(assert (=> bm!45534 m!995473))

(assert (=> b!1076267 m!995305))

(assert (=> b!1076267 m!995305))

(assert (=> b!1076267 m!995307))

(assert (=> b!1076037 d!130023))

(declare-fun condMapEmpty!40726 () Bool)

(declare-fun mapDefault!40726 () ValueCell!12293)

(assert (=> mapNonEmpty!40717 (= condMapEmpty!40726 (= mapRest!40717 ((as const (Array (_ BitVec 32) ValueCell!12293)) mapDefault!40726)))))

(declare-fun e!615138 () Bool)

(declare-fun mapRes!40726 () Bool)

(assert (=> mapNonEmpty!40717 (= tp!78029 (and e!615138 mapRes!40726))))

(declare-fun b!1076277 () Bool)

(assert (=> b!1076277 (= e!615138 tp_is_empty!25993)))

(declare-fun b!1076276 () Bool)

(declare-fun e!615137 () Bool)

(assert (=> b!1076276 (= e!615137 tp_is_empty!25993)))

(declare-fun mapIsEmpty!40726 () Bool)

(assert (=> mapIsEmpty!40726 mapRes!40726))

(declare-fun mapNonEmpty!40726 () Bool)

(declare-fun tp!78044 () Bool)

(assert (=> mapNonEmpty!40726 (= mapRes!40726 (and tp!78044 e!615137))))

(declare-fun mapValue!40726 () ValueCell!12293)

(declare-fun mapRest!40726 () (Array (_ BitVec 32) ValueCell!12293))

(declare-fun mapKey!40726 () (_ BitVec 32))

(assert (=> mapNonEmpty!40726 (= mapRest!40717 (store mapRest!40726 mapKey!40726 mapValue!40726))))

(assert (= (and mapNonEmpty!40717 condMapEmpty!40726) mapIsEmpty!40726))

(assert (= (and mapNonEmpty!40717 (not condMapEmpty!40726)) mapNonEmpty!40726))

(assert (= (and mapNonEmpty!40726 ((_ is ValueCellFull!12293) mapValue!40726)) b!1076276))

(assert (= (and mapNonEmpty!40717 ((_ is ValueCellFull!12293) mapDefault!40726)) b!1076277))

(declare-fun m!995475 () Bool)

(assert (=> mapNonEmpty!40726 m!995475))

(declare-fun b_lambda!16855 () Bool)

(assert (= b_lambda!16847 (or (and start!95302 b_free!22183) b_lambda!16855)))

(declare-fun b_lambda!16857 () Bool)

(assert (= b_lambda!16845 (or (and start!95302 b_free!22183) b_lambda!16857)))

(declare-fun b_lambda!16859 () Bool)

(assert (= b_lambda!16853 (or (and start!95302 b_free!22183) b_lambda!16859)))

(declare-fun b_lambda!16861 () Bool)

(assert (= b_lambda!16851 (or (and start!95302 b_free!22183) b_lambda!16861)))

(declare-fun b_lambda!16863 () Bool)

(assert (= b_lambda!16849 (or (and start!95302 b_free!22183) b_lambda!16863)))

(declare-fun b_lambda!16865 () Bool)

(assert (= b_lambda!16843 (or (and start!95302 b_free!22183) b_lambda!16865)))

(check-sat (not b!1076139) (not b!1076128) (not bm!45534) (not b!1076140) (not b!1076238) (not mapNonEmpty!40726) (not bm!45529) (not b!1076154) (not bm!45522) (not b!1076118) (not bm!45527) (not b!1076156) (not b!1076267) (not b_lambda!16863) (not b!1076155) (not b!1076266) (not b!1076167) (not b_lambda!16859) (not d!130007) (not b!1076172) (not b!1076221) (not d!130011) (not d!130017) (not bm!45526) (not b!1076226) (not b_next!22183) (not b!1076121) (not bm!45520) (not b!1076241) (not b!1076126) (not bm!45499) (not d!130015) (not b!1076141) (not b!1076219) (not b!1076220) (not b!1076242) (not d!130009) (not b!1076138) (not b!1076257) (not bm!45530) (not b!1076253) (not b!1076236) (not b!1076217) (not b_lambda!16855) (not bm!45503) (not b!1076247) (not d!130019) (not b!1076125) (not b_lambda!16857) (not bm!45523) (not b!1076124) (not b!1076173) (not b!1076165) (not b_lambda!16865) tp_is_empty!25993 (not b_lambda!16861) (not b!1076232) (not d!130021) (not b!1076135) (not bm!45519) (not b!1076240) (not b!1076119) (not b!1076127) (not b!1076133) (not b!1076132) b_and!35117 (not bm!45500) (not b!1076142) (not b!1076222) (not b!1076243))
(check-sat b_and!35117 (not b_next!22183))
