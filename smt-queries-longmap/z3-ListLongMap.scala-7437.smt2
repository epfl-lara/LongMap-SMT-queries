; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94466 () Bool)

(assert start!94466)

(declare-fun b_free!21799 () Bool)

(declare-fun b_next!21799 () Bool)

(assert (=> start!94466 (= b_free!21799 (not b_next!21799))))

(declare-fun tp!76844 () Bool)

(declare-fun b_and!34565 () Bool)

(assert (=> start!94466 (= tp!76844 b_and!34565)))

(declare-fun mapIsEmpty!40108 () Bool)

(declare-fun mapRes!40108 () Bool)

(assert (=> mapIsEmpty!40108 mapRes!40108))

(declare-fun b!1068134 () Bool)

(declare-fun res!712806 () Bool)

(declare-fun e!609383 () Bool)

(assert (=> b!1068134 (=> (not res!712806) (not e!609383))))

(declare-datatypes ((array!68140 0))(
  ( (array!68141 (arr!32770 (Array (_ BitVec 32) (_ BitVec 64))) (size!33308 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68140)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68140 (_ BitVec 32)) Bool)

(assert (=> b!1068134 (= res!712806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068135 () Bool)

(declare-fun e!609379 () Bool)

(assert (=> b!1068135 (= e!609379 (bvsle #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(declare-datatypes ((V!39281 0))(
  ( (V!39282 (val!12855 Int)) )
))
(declare-datatypes ((tuple2!16380 0))(
  ( (tuple2!16381 (_1!8201 (_ BitVec 64)) (_2!8201 V!39281)) )
))
(declare-datatypes ((List!22918 0))(
  ( (Nil!22915) (Cons!22914 (h!24123 tuple2!16380) (t!32234 List!22918)) )
))
(declare-datatypes ((ListLongMap!14349 0))(
  ( (ListLongMap!14350 (toList!7190 List!22918)) )
))
(declare-fun lt!471705 () ListLongMap!14349)

(declare-fun -!635 (ListLongMap!14349 (_ BitVec 64)) ListLongMap!14349)

(assert (=> b!1068135 (= (-!635 lt!471705 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471705)))

(declare-datatypes ((Unit!34968 0))(
  ( (Unit!34969) )
))
(declare-fun lt!471704 () Unit!34968)

(declare-fun removeNotPresentStillSame!52 (ListLongMap!14349 (_ BitVec 64)) Unit!34968)

(assert (=> b!1068135 (= lt!471704 (removeNotPresentStillSame!52 lt!471705 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!40108 () Bool)

(declare-fun tp!76843 () Bool)

(declare-fun e!609380 () Bool)

(assert (=> mapNonEmpty!40108 (= mapRes!40108 (and tp!76843 e!609380))))

(declare-datatypes ((ValueCell!12101 0))(
  ( (ValueCellFull!12101 (v!15468 V!39281)) (EmptyCell!12101) )
))
(declare-fun mapRest!40108 () (Array (_ BitVec 32) ValueCell!12101))

(declare-fun mapValue!40108 () ValueCell!12101)

(declare-fun mapKey!40108 () (_ BitVec 32))

(declare-datatypes ((array!68142 0))(
  ( (array!68143 (arr!32771 (Array (_ BitVec 32) ValueCell!12101)) (size!33309 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68142)

(assert (=> mapNonEmpty!40108 (= (arr!32771 _values!955) (store mapRest!40108 mapKey!40108 mapValue!40108))))

(declare-fun b!1068136 () Bool)

(declare-fun tp_is_empty!25609 () Bool)

(assert (=> b!1068136 (= e!609380 tp_is_empty!25609)))

(declare-fun b!1068137 () Bool)

(declare-fun res!712807 () Bool)

(assert (=> b!1068137 (=> (not res!712807) (not e!609383))))

(declare-datatypes ((List!22919 0))(
  ( (Nil!22916) (Cons!22915 (h!24124 (_ BitVec 64)) (t!32235 List!22919)) )
))
(declare-fun arrayNoDuplicates!0 (array!68140 (_ BitVec 32) List!22919) Bool)

(assert (=> b!1068137 (= res!712807 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22916))))

(declare-fun b!1068138 () Bool)

(declare-fun e!609384 () Bool)

(assert (=> b!1068138 (= e!609384 e!609379)))

(declare-fun res!712809 () Bool)

(assert (=> b!1068138 (=> res!712809 e!609379)))

(declare-fun contains!6263 (ListLongMap!14349 (_ BitVec 64)) Bool)

(assert (=> b!1068138 (= res!712809 (contains!6263 lt!471705 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39281)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39281)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4032 (array!68140 array!68142 (_ BitVec 32) (_ BitVec 32) V!39281 V!39281 (_ BitVec 32) Int) ListLongMap!14349)

(assert (=> b!1068138 (= lt!471705 (getCurrentListMap!4032 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068139 () Bool)

(assert (=> b!1068139 (= e!609383 (not e!609384))))

(declare-fun res!712808 () Bool)

(assert (=> b!1068139 (=> res!712808 e!609384)))

(assert (=> b!1068139 (= res!712808 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471707 () ListLongMap!14349)

(declare-fun lt!471706 () ListLongMap!14349)

(assert (=> b!1068139 (= lt!471707 lt!471706)))

(declare-fun lt!471703 () Unit!34968)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39281)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!776 (array!68140 array!68142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39281 V!39281 V!39281 V!39281 (_ BitVec 32) Int) Unit!34968)

(assert (=> b!1068139 (= lt!471703 (lemmaNoChangeToArrayThenSameMapNoExtras!776 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3782 (array!68140 array!68142 (_ BitVec 32) (_ BitVec 32) V!39281 V!39281 (_ BitVec 32) Int) ListLongMap!14349)

(assert (=> b!1068139 (= lt!471706 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068139 (= lt!471707 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068140 () Bool)

(declare-fun e!609385 () Bool)

(assert (=> b!1068140 (= e!609385 tp_is_empty!25609)))

(declare-fun res!712804 () Bool)

(assert (=> start!94466 (=> (not res!712804) (not e!609383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94466 (= res!712804 (validMask!0 mask!1515))))

(assert (=> start!94466 e!609383))

(assert (=> start!94466 true))

(assert (=> start!94466 tp_is_empty!25609))

(declare-fun e!609381 () Bool)

(declare-fun array_inv!25368 (array!68142) Bool)

(assert (=> start!94466 (and (array_inv!25368 _values!955) e!609381)))

(assert (=> start!94466 tp!76844))

(declare-fun array_inv!25369 (array!68140) Bool)

(assert (=> start!94466 (array_inv!25369 _keys!1163)))

(declare-fun b!1068141 () Bool)

(declare-fun res!712805 () Bool)

(assert (=> b!1068141 (=> (not res!712805) (not e!609383))))

(assert (=> b!1068141 (= res!712805 (and (= (size!33309 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33308 _keys!1163) (size!33309 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068142 () Bool)

(assert (=> b!1068142 (= e!609381 (and e!609385 mapRes!40108))))

(declare-fun condMapEmpty!40108 () Bool)

(declare-fun mapDefault!40108 () ValueCell!12101)

(assert (=> b!1068142 (= condMapEmpty!40108 (= (arr!32771 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12101)) mapDefault!40108)))))

(assert (= (and start!94466 res!712804) b!1068141))

(assert (= (and b!1068141 res!712805) b!1068134))

(assert (= (and b!1068134 res!712806) b!1068137))

(assert (= (and b!1068137 res!712807) b!1068139))

(assert (= (and b!1068139 (not res!712808)) b!1068138))

(assert (= (and b!1068138 (not res!712809)) b!1068135))

(assert (= (and b!1068142 condMapEmpty!40108) mapIsEmpty!40108))

(assert (= (and b!1068142 (not condMapEmpty!40108)) mapNonEmpty!40108))

(get-info :version)

(assert (= (and mapNonEmpty!40108 ((_ is ValueCellFull!12101) mapValue!40108)) b!1068136))

(assert (= (and b!1068142 ((_ is ValueCellFull!12101) mapDefault!40108)) b!1068140))

(assert (= start!94466 b!1068142))

(declare-fun m!986263 () Bool)

(assert (=> mapNonEmpty!40108 m!986263))

(declare-fun m!986265 () Bool)

(assert (=> b!1068138 m!986265))

(declare-fun m!986267 () Bool)

(assert (=> b!1068138 m!986267))

(declare-fun m!986269 () Bool)

(assert (=> b!1068139 m!986269))

(declare-fun m!986271 () Bool)

(assert (=> b!1068139 m!986271))

(declare-fun m!986273 () Bool)

(assert (=> b!1068139 m!986273))

(declare-fun m!986275 () Bool)

(assert (=> b!1068135 m!986275))

(declare-fun m!986277 () Bool)

(assert (=> b!1068135 m!986277))

(declare-fun m!986279 () Bool)

(assert (=> b!1068137 m!986279))

(declare-fun m!986281 () Bool)

(assert (=> b!1068134 m!986281))

(declare-fun m!986283 () Bool)

(assert (=> start!94466 m!986283))

(declare-fun m!986285 () Bool)

(assert (=> start!94466 m!986285))

(declare-fun m!986287 () Bool)

(assert (=> start!94466 m!986287))

(check-sat b_and!34565 tp_is_empty!25609 (not start!94466) (not b!1068137) (not b_next!21799) (not b!1068134) (not mapNonEmpty!40108) (not b!1068139) (not b!1068138) (not b!1068135))
(check-sat b_and!34565 (not b_next!21799))
(get-model)

(declare-fun d!128991 () Bool)

(declare-fun res!712853 () Bool)

(declare-fun e!609439 () Bool)

(assert (=> d!128991 (=> res!712853 e!609439)))

(assert (=> d!128991 (= res!712853 (bvsge #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(assert (=> d!128991 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22916) e!609439)))

(declare-fun b!1068207 () Bool)

(declare-fun e!609438 () Bool)

(declare-fun e!609437 () Bool)

(assert (=> b!1068207 (= e!609438 e!609437)))

(declare-fun c!107465 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1068207 (= c!107465 (validKeyInArray!0 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45075 () Bool)

(declare-fun call!45078 () Bool)

(assert (=> bm!45075 (= call!45078 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107465 (Cons!22915 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000) Nil!22916) Nil!22916)))))

(declare-fun b!1068208 () Bool)

(assert (=> b!1068208 (= e!609437 call!45078)))

(declare-fun b!1068209 () Bool)

(assert (=> b!1068209 (= e!609439 e!609438)))

(declare-fun res!712852 () Bool)

(assert (=> b!1068209 (=> (not res!712852) (not e!609438))))

(declare-fun e!609436 () Bool)

(assert (=> b!1068209 (= res!712852 (not e!609436))))

(declare-fun res!712854 () Bool)

(assert (=> b!1068209 (=> (not res!712854) (not e!609436))))

(assert (=> b!1068209 (= res!712854 (validKeyInArray!0 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068210 () Bool)

(assert (=> b!1068210 (= e!609437 call!45078)))

(declare-fun b!1068211 () Bool)

(declare-fun contains!6265 (List!22919 (_ BitVec 64)) Bool)

(assert (=> b!1068211 (= e!609436 (contains!6265 Nil!22916 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!128991 (not res!712853)) b!1068209))

(assert (= (and b!1068209 res!712854) b!1068211))

(assert (= (and b!1068209 res!712852) b!1068207))

(assert (= (and b!1068207 c!107465) b!1068208))

(assert (= (and b!1068207 (not c!107465)) b!1068210))

(assert (= (or b!1068208 b!1068210) bm!45075))

(declare-fun m!986341 () Bool)

(assert (=> b!1068207 m!986341))

(assert (=> b!1068207 m!986341))

(declare-fun m!986343 () Bool)

(assert (=> b!1068207 m!986343))

(assert (=> bm!45075 m!986341))

(declare-fun m!986345 () Bool)

(assert (=> bm!45075 m!986345))

(assert (=> b!1068209 m!986341))

(assert (=> b!1068209 m!986341))

(assert (=> b!1068209 m!986343))

(assert (=> b!1068211 m!986341))

(assert (=> b!1068211 m!986341))

(declare-fun m!986347 () Bool)

(assert (=> b!1068211 m!986347))

(assert (=> b!1068137 d!128991))

(declare-fun d!128993 () Bool)

(assert (=> d!128993 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94466 d!128993))

(declare-fun d!128995 () Bool)

(assert (=> d!128995 (= (array_inv!25368 _values!955) (bvsge (size!33309 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94466 d!128995))

(declare-fun d!128997 () Bool)

(assert (=> d!128997 (= (array_inv!25369 _keys!1163) (bvsge (size!33308 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94466 d!128997))

(declare-fun b!1068220 () Bool)

(declare-fun e!609446 () Bool)

(declare-fun e!609448 () Bool)

(assert (=> b!1068220 (= e!609446 e!609448)))

(declare-fun lt!471744 () (_ BitVec 64))

(assert (=> b!1068220 (= lt!471744 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471745 () Unit!34968)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68140 (_ BitVec 64) (_ BitVec 32)) Unit!34968)

(assert (=> b!1068220 (= lt!471745 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!471744 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1068220 (arrayContainsKey!0 _keys!1163 lt!471744 #b00000000000000000000000000000000)))

(declare-fun lt!471746 () Unit!34968)

(assert (=> b!1068220 (= lt!471746 lt!471745)))

(declare-fun res!712860 () Bool)

(declare-datatypes ((SeekEntryResult!9878 0))(
  ( (MissingZero!9878 (index!41883 (_ BitVec 32))) (Found!9878 (index!41884 (_ BitVec 32))) (Intermediate!9878 (undefined!10690 Bool) (index!41885 (_ BitVec 32)) (x!95678 (_ BitVec 32))) (Undefined!9878) (MissingVacant!9878 (index!41886 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68140 (_ BitVec 32)) SeekEntryResult!9878)

(assert (=> b!1068220 (= res!712860 (= (seekEntryOrOpen!0 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9878 #b00000000000000000000000000000000)))))

(assert (=> b!1068220 (=> (not res!712860) (not e!609448))))

(declare-fun b!1068221 () Bool)

(declare-fun call!45081 () Bool)

(assert (=> b!1068221 (= e!609448 call!45081)))

(declare-fun b!1068222 () Bool)

(declare-fun e!609447 () Bool)

(assert (=> b!1068222 (= e!609447 e!609446)))

(declare-fun c!107468 () Bool)

(assert (=> b!1068222 (= c!107468 (validKeyInArray!0 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45078 () Bool)

(assert (=> bm!45078 (= call!45081 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun d!128999 () Bool)

(declare-fun res!712859 () Bool)

(assert (=> d!128999 (=> res!712859 e!609447)))

(assert (=> d!128999 (= res!712859 (bvsge #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(assert (=> d!128999 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!609447)))

(declare-fun b!1068223 () Bool)

(assert (=> b!1068223 (= e!609446 call!45081)))

(assert (= (and d!128999 (not res!712859)) b!1068222))

(assert (= (and b!1068222 c!107468) b!1068220))

(assert (= (and b!1068222 (not c!107468)) b!1068223))

(assert (= (and b!1068220 res!712860) b!1068221))

(assert (= (or b!1068221 b!1068223) bm!45078))

(assert (=> b!1068220 m!986341))

(declare-fun m!986349 () Bool)

(assert (=> b!1068220 m!986349))

(declare-fun m!986351 () Bool)

(assert (=> b!1068220 m!986351))

(assert (=> b!1068220 m!986341))

(declare-fun m!986353 () Bool)

(assert (=> b!1068220 m!986353))

(assert (=> b!1068222 m!986341))

(assert (=> b!1068222 m!986341))

(assert (=> b!1068222 m!986343))

(declare-fun m!986355 () Bool)

(assert (=> bm!45078 m!986355))

(assert (=> b!1068134 d!128999))

(declare-fun d!129001 () Bool)

(declare-fun e!609454 () Bool)

(assert (=> d!129001 e!609454))

(declare-fun res!712863 () Bool)

(assert (=> d!129001 (=> res!712863 e!609454)))

(declare-fun lt!471756 () Bool)

(assert (=> d!129001 (= res!712863 (not lt!471756))))

(declare-fun lt!471757 () Bool)

(assert (=> d!129001 (= lt!471756 lt!471757)))

(declare-fun lt!471758 () Unit!34968)

(declare-fun e!609453 () Unit!34968)

(assert (=> d!129001 (= lt!471758 e!609453)))

(declare-fun c!107471 () Bool)

(assert (=> d!129001 (= c!107471 lt!471757)))

(declare-fun containsKey!574 (List!22918 (_ BitVec 64)) Bool)

(assert (=> d!129001 (= lt!471757 (containsKey!574 (toList!7190 lt!471705) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129001 (= (contains!6263 lt!471705 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471756)))

(declare-fun b!1068230 () Bool)

(declare-fun lt!471755 () Unit!34968)

(assert (=> b!1068230 (= e!609453 lt!471755)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!406 (List!22918 (_ BitVec 64)) Unit!34968)

(assert (=> b!1068230 (= lt!471755 (lemmaContainsKeyImpliesGetValueByKeyDefined!406 (toList!7190 lt!471705) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!654 0))(
  ( (Some!653 (v!15471 V!39281)) (None!652) )
))
(declare-fun isDefined!449 (Option!654) Bool)

(declare-fun getValueByKey!603 (List!22918 (_ BitVec 64)) Option!654)

(assert (=> b!1068230 (isDefined!449 (getValueByKey!603 (toList!7190 lt!471705) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068231 () Bool)

(declare-fun Unit!34972 () Unit!34968)

(assert (=> b!1068231 (= e!609453 Unit!34972)))

(declare-fun b!1068232 () Bool)

(assert (=> b!1068232 (= e!609454 (isDefined!449 (getValueByKey!603 (toList!7190 lt!471705) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129001 c!107471) b!1068230))

(assert (= (and d!129001 (not c!107471)) b!1068231))

(assert (= (and d!129001 (not res!712863)) b!1068232))

(declare-fun m!986357 () Bool)

(assert (=> d!129001 m!986357))

(declare-fun m!986359 () Bool)

(assert (=> b!1068230 m!986359))

(declare-fun m!986361 () Bool)

(assert (=> b!1068230 m!986361))

(assert (=> b!1068230 m!986361))

(declare-fun m!986363 () Bool)

(assert (=> b!1068230 m!986363))

(assert (=> b!1068232 m!986361))

(assert (=> b!1068232 m!986361))

(assert (=> b!1068232 m!986363))

(assert (=> b!1068138 d!129001))

(declare-fun b!1068275 () Bool)

(declare-fun e!609490 () Bool)

(declare-fun e!609489 () Bool)

(assert (=> b!1068275 (= e!609490 e!609489)))

(declare-fun res!712884 () Bool)

(assert (=> b!1068275 (=> (not res!712884) (not e!609489))))

(declare-fun lt!471803 () ListLongMap!14349)

(assert (=> b!1068275 (= res!712884 (contains!6263 lt!471803 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068275 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(declare-fun bm!45093 () Bool)

(declare-fun call!45098 () ListLongMap!14349)

(declare-fun call!45100 () ListLongMap!14349)

(assert (=> bm!45093 (= call!45098 call!45100)))

(declare-fun c!107489 () Bool)

(declare-fun c!107485 () Bool)

(declare-fun call!45096 () ListLongMap!14349)

(declare-fun bm!45094 () Bool)

(declare-fun call!45101 () ListLongMap!14349)

(declare-fun call!45099 () ListLongMap!14349)

(declare-fun +!3185 (ListLongMap!14349 tuple2!16380) ListLongMap!14349)

(assert (=> bm!45094 (= call!45100 (+!3185 (ite c!107489 call!45101 (ite c!107485 call!45099 call!45096)) (ite (or c!107489 c!107485) (tuple2!16381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1068276 () Bool)

(declare-fun e!609486 () ListLongMap!14349)

(assert (=> b!1068276 (= e!609486 call!45098)))

(declare-fun b!1068277 () Bool)

(declare-fun res!712885 () Bool)

(declare-fun e!609484 () Bool)

(assert (=> b!1068277 (=> (not res!712885) (not e!609484))))

(assert (=> b!1068277 (= res!712885 e!609490)))

(declare-fun res!712889 () Bool)

(assert (=> b!1068277 (=> res!712889 e!609490)))

(declare-fun e!609491 () Bool)

(assert (=> b!1068277 (= res!712889 (not e!609491))))

(declare-fun res!712887 () Bool)

(assert (=> b!1068277 (=> (not res!712887) (not e!609491))))

(assert (=> b!1068277 (= res!712887 (bvslt #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(declare-fun bm!45095 () Bool)

(declare-fun call!45102 () Bool)

(assert (=> bm!45095 (= call!45102 (contains!6263 lt!471803 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068279 () Bool)

(declare-fun e!609488 () Bool)

(declare-fun apply!919 (ListLongMap!14349 (_ BitVec 64)) V!39281)

(assert (=> b!1068279 (= e!609488 (= (apply!919 lt!471803 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1068280 () Bool)

(declare-fun e!609493 () Bool)

(assert (=> b!1068280 (= e!609493 (not call!45102))))

(declare-fun b!1068281 () Bool)

(declare-fun e!609482 () Bool)

(assert (=> b!1068281 (= e!609484 e!609482)))

(declare-fun c!107486 () Bool)

(assert (=> b!1068281 (= c!107486 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1068282 () Bool)

(declare-fun e!609481 () ListLongMap!14349)

(assert (=> b!1068282 (= e!609481 call!45098)))

(declare-fun b!1068283 () Bool)

(declare-fun e!609483 () ListLongMap!14349)

(assert (=> b!1068283 (= e!609483 e!609486)))

(assert (=> b!1068283 (= c!107485 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1068284 () Bool)

(declare-fun call!45097 () Bool)

(assert (=> b!1068284 (= e!609482 (not call!45097))))

(declare-fun b!1068285 () Bool)

(declare-fun e!609485 () Unit!34968)

(declare-fun Unit!34973 () Unit!34968)

(assert (=> b!1068285 (= e!609485 Unit!34973)))

(declare-fun bm!45096 () Bool)

(assert (=> bm!45096 (= call!45099 call!45101)))

(declare-fun b!1068286 () Bool)

(declare-fun e!609487 () Bool)

(assert (=> b!1068286 (= e!609487 (= (apply!919 lt!471803 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1068287 () Bool)

(declare-fun get!17083 (ValueCell!12101 V!39281) V!39281)

(declare-fun dynLambda!2018 (Int (_ BitVec 64)) V!39281)

(assert (=> b!1068287 (= e!609489 (= (apply!919 lt!471803 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)) (get!17083 (select (arr!32771 _values!955) #b00000000000000000000000000000000) (dynLambda!2018 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1068287 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33309 _values!955)))))

(assert (=> b!1068287 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(declare-fun b!1068288 () Bool)

(assert (=> b!1068288 (= e!609491 (validKeyInArray!0 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068289 () Bool)

(assert (=> b!1068289 (= e!609493 e!609488)))

(declare-fun res!712882 () Bool)

(assert (=> b!1068289 (= res!712882 call!45102)))

(assert (=> b!1068289 (=> (not res!712882) (not e!609488))))

(declare-fun b!1068290 () Bool)

(assert (=> b!1068290 (= e!609481 call!45096)))

(declare-fun b!1068291 () Bool)

(declare-fun lt!471818 () Unit!34968)

(assert (=> b!1068291 (= e!609485 lt!471818)))

(declare-fun lt!471807 () ListLongMap!14349)

(assert (=> b!1068291 (= lt!471807 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471824 () (_ BitVec 64))

(assert (=> b!1068291 (= lt!471824 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471814 () (_ BitVec 64))

(assert (=> b!1068291 (= lt!471814 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471819 () Unit!34968)

(declare-fun addStillContains!634 (ListLongMap!14349 (_ BitVec 64) V!39281 (_ BitVec 64)) Unit!34968)

(assert (=> b!1068291 (= lt!471819 (addStillContains!634 lt!471807 lt!471824 zeroValueBefore!47 lt!471814))))

(assert (=> b!1068291 (contains!6263 (+!3185 lt!471807 (tuple2!16381 lt!471824 zeroValueBefore!47)) lt!471814)))

(declare-fun lt!471810 () Unit!34968)

(assert (=> b!1068291 (= lt!471810 lt!471819)))

(declare-fun lt!471815 () ListLongMap!14349)

(assert (=> b!1068291 (= lt!471815 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471812 () (_ BitVec 64))

(assert (=> b!1068291 (= lt!471812 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471804 () (_ BitVec 64))

(assert (=> b!1068291 (= lt!471804 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471813 () Unit!34968)

(declare-fun addApplyDifferent!490 (ListLongMap!14349 (_ BitVec 64) V!39281 (_ BitVec 64)) Unit!34968)

(assert (=> b!1068291 (= lt!471813 (addApplyDifferent!490 lt!471815 lt!471812 minValue!907 lt!471804))))

(assert (=> b!1068291 (= (apply!919 (+!3185 lt!471815 (tuple2!16381 lt!471812 minValue!907)) lt!471804) (apply!919 lt!471815 lt!471804))))

(declare-fun lt!471822 () Unit!34968)

(assert (=> b!1068291 (= lt!471822 lt!471813)))

(declare-fun lt!471820 () ListLongMap!14349)

(assert (=> b!1068291 (= lt!471820 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471809 () (_ BitVec 64))

(assert (=> b!1068291 (= lt!471809 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471816 () (_ BitVec 64))

(assert (=> b!1068291 (= lt!471816 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471806 () Unit!34968)

(assert (=> b!1068291 (= lt!471806 (addApplyDifferent!490 lt!471820 lt!471809 zeroValueBefore!47 lt!471816))))

(assert (=> b!1068291 (= (apply!919 (+!3185 lt!471820 (tuple2!16381 lt!471809 zeroValueBefore!47)) lt!471816) (apply!919 lt!471820 lt!471816))))

(declare-fun lt!471817 () Unit!34968)

(assert (=> b!1068291 (= lt!471817 lt!471806)))

(declare-fun lt!471823 () ListLongMap!14349)

(assert (=> b!1068291 (= lt!471823 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471808 () (_ BitVec 64))

(assert (=> b!1068291 (= lt!471808 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471811 () (_ BitVec 64))

(assert (=> b!1068291 (= lt!471811 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1068291 (= lt!471818 (addApplyDifferent!490 lt!471823 lt!471808 minValue!907 lt!471811))))

(assert (=> b!1068291 (= (apply!919 (+!3185 lt!471823 (tuple2!16381 lt!471808 minValue!907)) lt!471811) (apply!919 lt!471823 lt!471811))))

(declare-fun bm!45097 () Bool)

(assert (=> bm!45097 (= call!45096 call!45099)))

(declare-fun b!1068292 () Bool)

(assert (=> b!1068292 (= e!609482 e!609487)))

(declare-fun res!712886 () Bool)

(assert (=> b!1068292 (= res!712886 call!45097)))

(assert (=> b!1068292 (=> (not res!712886) (not e!609487))))

(declare-fun b!1068293 () Bool)

(declare-fun e!609492 () Bool)

(assert (=> b!1068293 (= e!609492 (validKeyInArray!0 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068278 () Bool)

(declare-fun c!107488 () Bool)

(assert (=> b!1068278 (= c!107488 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1068278 (= e!609486 e!609481)))

(declare-fun d!129003 () Bool)

(assert (=> d!129003 e!609484))

(declare-fun res!712890 () Bool)

(assert (=> d!129003 (=> (not res!712890) (not e!609484))))

(assert (=> d!129003 (= res!712890 (or (bvsge #b00000000000000000000000000000000 (size!33308 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33308 _keys!1163)))))))

(declare-fun lt!471821 () ListLongMap!14349)

(assert (=> d!129003 (= lt!471803 lt!471821)))

(declare-fun lt!471805 () Unit!34968)

(assert (=> d!129003 (= lt!471805 e!609485)))

(declare-fun c!107487 () Bool)

(assert (=> d!129003 (= c!107487 e!609492)))

(declare-fun res!712883 () Bool)

(assert (=> d!129003 (=> (not res!712883) (not e!609492))))

(assert (=> d!129003 (= res!712883 (bvslt #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(assert (=> d!129003 (= lt!471821 e!609483)))

(assert (=> d!129003 (= c!107489 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129003 (validMask!0 mask!1515)))

(assert (=> d!129003 (= (getCurrentListMap!4032 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471803)))

(declare-fun b!1068294 () Bool)

(declare-fun res!712888 () Bool)

(assert (=> b!1068294 (=> (not res!712888) (not e!609484))))

(assert (=> b!1068294 (= res!712888 e!609493)))

(declare-fun c!107484 () Bool)

(assert (=> b!1068294 (= c!107484 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45098 () Bool)

(assert (=> bm!45098 (= call!45101 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068295 () Bool)

(assert (=> b!1068295 (= e!609483 (+!3185 call!45100 (tuple2!16381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45099 () Bool)

(assert (=> bm!45099 (= call!45097 (contains!6263 lt!471803 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!129003 c!107489) b!1068295))

(assert (= (and d!129003 (not c!107489)) b!1068283))

(assert (= (and b!1068283 c!107485) b!1068276))

(assert (= (and b!1068283 (not c!107485)) b!1068278))

(assert (= (and b!1068278 c!107488) b!1068282))

(assert (= (and b!1068278 (not c!107488)) b!1068290))

(assert (= (or b!1068282 b!1068290) bm!45097))

(assert (= (or b!1068276 bm!45097) bm!45096))

(assert (= (or b!1068276 b!1068282) bm!45093))

(assert (= (or b!1068295 bm!45096) bm!45098))

(assert (= (or b!1068295 bm!45093) bm!45094))

(assert (= (and d!129003 res!712883) b!1068293))

(assert (= (and d!129003 c!107487) b!1068291))

(assert (= (and d!129003 (not c!107487)) b!1068285))

(assert (= (and d!129003 res!712890) b!1068277))

(assert (= (and b!1068277 res!712887) b!1068288))

(assert (= (and b!1068277 (not res!712889)) b!1068275))

(assert (= (and b!1068275 res!712884) b!1068287))

(assert (= (and b!1068277 res!712885) b!1068294))

(assert (= (and b!1068294 c!107484) b!1068289))

(assert (= (and b!1068294 (not c!107484)) b!1068280))

(assert (= (and b!1068289 res!712882) b!1068279))

(assert (= (or b!1068289 b!1068280) bm!45095))

(assert (= (and b!1068294 res!712888) b!1068281))

(assert (= (and b!1068281 c!107486) b!1068292))

(assert (= (and b!1068281 (not c!107486)) b!1068284))

(assert (= (and b!1068292 res!712886) b!1068286))

(assert (= (or b!1068292 b!1068284) bm!45099))

(declare-fun b_lambda!16579 () Bool)

(assert (=> (not b_lambda!16579) (not b!1068287)))

(declare-fun t!32239 () Bool)

(declare-fun tb!7139 () Bool)

(assert (=> (and start!94466 (= defaultEntry!963 defaultEntry!963) t!32239) tb!7139))

(declare-fun result!14741 () Bool)

(assert (=> tb!7139 (= result!14741 tp_is_empty!25609)))

(assert (=> b!1068287 t!32239))

(declare-fun b_and!34571 () Bool)

(assert (= b_and!34565 (and (=> t!32239 result!14741) b_and!34571)))

(declare-fun m!986365 () Bool)

(assert (=> bm!45099 m!986365))

(declare-fun m!986367 () Bool)

(assert (=> b!1068295 m!986367))

(assert (=> b!1068293 m!986341))

(assert (=> b!1068293 m!986341))

(assert (=> b!1068293 m!986343))

(declare-fun m!986369 () Bool)

(assert (=> b!1068291 m!986369))

(declare-fun m!986371 () Bool)

(assert (=> b!1068291 m!986371))

(assert (=> b!1068291 m!986341))

(declare-fun m!986373 () Bool)

(assert (=> b!1068291 m!986373))

(declare-fun m!986375 () Bool)

(assert (=> b!1068291 m!986375))

(declare-fun m!986377 () Bool)

(assert (=> b!1068291 m!986377))

(assert (=> b!1068291 m!986273))

(declare-fun m!986379 () Bool)

(assert (=> b!1068291 m!986379))

(declare-fun m!986381 () Bool)

(assert (=> b!1068291 m!986381))

(declare-fun m!986383 () Bool)

(assert (=> b!1068291 m!986383))

(declare-fun m!986385 () Bool)

(assert (=> b!1068291 m!986385))

(declare-fun m!986387 () Bool)

(assert (=> b!1068291 m!986387))

(declare-fun m!986389 () Bool)

(assert (=> b!1068291 m!986389))

(declare-fun m!986391 () Bool)

(assert (=> b!1068291 m!986391))

(assert (=> b!1068291 m!986369))

(assert (=> b!1068291 m!986381))

(declare-fun m!986393 () Bool)

(assert (=> b!1068291 m!986393))

(assert (=> b!1068291 m!986387))

(declare-fun m!986395 () Bool)

(assert (=> b!1068291 m!986395))

(assert (=> b!1068291 m!986385))

(declare-fun m!986397 () Bool)

(assert (=> b!1068291 m!986397))

(declare-fun m!986399 () Bool)

(assert (=> b!1068279 m!986399))

(declare-fun m!986401 () Bool)

(assert (=> bm!45094 m!986401))

(assert (=> d!129003 m!986283))

(assert (=> b!1068287 m!986341))

(assert (=> b!1068287 m!986341))

(declare-fun m!986403 () Bool)

(assert (=> b!1068287 m!986403))

(declare-fun m!986405 () Bool)

(assert (=> b!1068287 m!986405))

(declare-fun m!986407 () Bool)

(assert (=> b!1068287 m!986407))

(declare-fun m!986409 () Bool)

(assert (=> b!1068287 m!986409))

(assert (=> b!1068287 m!986407))

(assert (=> b!1068287 m!986405))

(declare-fun m!986411 () Bool)

(assert (=> bm!45095 m!986411))

(assert (=> bm!45098 m!986273))

(assert (=> b!1068275 m!986341))

(assert (=> b!1068275 m!986341))

(declare-fun m!986413 () Bool)

(assert (=> b!1068275 m!986413))

(declare-fun m!986415 () Bool)

(assert (=> b!1068286 m!986415))

(assert (=> b!1068288 m!986341))

(assert (=> b!1068288 m!986341))

(assert (=> b!1068288 m!986343))

(assert (=> b!1068138 d!129003))

(declare-fun d!129005 () Bool)

(declare-fun lt!471827 () ListLongMap!14349)

(assert (=> d!129005 (not (contains!6263 lt!471827 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!71 (List!22918 (_ BitVec 64)) List!22918)

(assert (=> d!129005 (= lt!471827 (ListLongMap!14350 (removeStrictlySorted!71 (toList!7190 lt!471705) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129005 (= (-!635 lt!471705 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471827)))

(declare-fun bs!31424 () Bool)

(assert (= bs!31424 d!129005))

(declare-fun m!986417 () Bool)

(assert (=> bs!31424 m!986417))

(declare-fun m!986419 () Bool)

(assert (=> bs!31424 m!986419))

(assert (=> b!1068135 d!129005))

(declare-fun d!129007 () Bool)

(assert (=> d!129007 (= (-!635 lt!471705 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471705)))

(declare-fun lt!471830 () Unit!34968)

(declare-fun choose!1742 (ListLongMap!14349 (_ BitVec 64)) Unit!34968)

(assert (=> d!129007 (= lt!471830 (choose!1742 lt!471705 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129007 (not (contains!6263 lt!471705 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129007 (= (removeNotPresentStillSame!52 lt!471705 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471830)))

(declare-fun bs!31425 () Bool)

(assert (= bs!31425 d!129007))

(assert (=> bs!31425 m!986275))

(declare-fun m!986421 () Bool)

(assert (=> bs!31425 m!986421))

(assert (=> bs!31425 m!986265))

(assert (=> b!1068135 d!129007))

(declare-fun d!129009 () Bool)

(assert (=> d!129009 (= (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471833 () Unit!34968)

(declare-fun choose!1743 (array!68140 array!68142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39281 V!39281 V!39281 V!39281 (_ BitVec 32) Int) Unit!34968)

(assert (=> d!129009 (= lt!471833 (choose!1743 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129009 (validMask!0 mask!1515)))

(assert (=> d!129009 (= (lemmaNoChangeToArrayThenSameMapNoExtras!776 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471833)))

(declare-fun bs!31426 () Bool)

(assert (= bs!31426 d!129009))

(assert (=> bs!31426 m!986273))

(assert (=> bs!31426 m!986271))

(declare-fun m!986423 () Bool)

(assert (=> bs!31426 m!986423))

(assert (=> bs!31426 m!986283))

(assert (=> b!1068139 d!129009))

(declare-fun bm!45102 () Bool)

(declare-fun call!45105 () ListLongMap!14349)

(assert (=> bm!45102 (= call!45105 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1068322 () Bool)

(declare-fun e!609510 () Bool)

(declare-fun e!609512 () Bool)

(assert (=> b!1068322 (= e!609510 e!609512)))

(declare-fun c!107499 () Bool)

(declare-fun e!609509 () Bool)

(assert (=> b!1068322 (= c!107499 e!609509)))

(declare-fun res!712899 () Bool)

(assert (=> b!1068322 (=> (not res!712899) (not e!609509))))

(assert (=> b!1068322 (= res!712899 (bvslt #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(declare-fun lt!471849 () ListLongMap!14349)

(declare-fun b!1068323 () Bool)

(declare-fun e!609508 () Bool)

(assert (=> b!1068323 (= e!609508 (= lt!471849 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1068325 () Bool)

(declare-fun e!609511 () Bool)

(assert (=> b!1068325 (= e!609512 e!609511)))

(assert (=> b!1068325 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(declare-fun res!712900 () Bool)

(assert (=> b!1068325 (= res!712900 (contains!6263 lt!471849 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068325 (=> (not res!712900) (not e!609511))))

(declare-fun b!1068326 () Bool)

(assert (=> b!1068326 (= e!609512 e!609508)))

(declare-fun c!107500 () Bool)

(assert (=> b!1068326 (= c!107500 (bvslt #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(declare-fun b!1068327 () Bool)

(declare-fun e!609514 () ListLongMap!14349)

(assert (=> b!1068327 (= e!609514 call!45105)))

(declare-fun b!1068328 () Bool)

(declare-fun e!609513 () ListLongMap!14349)

(assert (=> b!1068328 (= e!609513 (ListLongMap!14350 Nil!22915))))

(declare-fun b!1068329 () Bool)

(assert (=> b!1068329 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(assert (=> b!1068329 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33309 _values!955)))))

(assert (=> b!1068329 (= e!609511 (= (apply!919 lt!471849 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)) (get!17083 (select (arr!32771 _values!955) #b00000000000000000000000000000000) (dynLambda!2018 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1068330 () Bool)

(assert (=> b!1068330 (= e!609513 e!609514)))

(declare-fun c!107498 () Bool)

(assert (=> b!1068330 (= c!107498 (validKeyInArray!0 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068331 () Bool)

(declare-fun res!712902 () Bool)

(assert (=> b!1068331 (=> (not res!712902) (not e!609510))))

(assert (=> b!1068331 (= res!712902 (not (contains!6263 lt!471849 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1068332 () Bool)

(assert (=> b!1068332 (= e!609509 (validKeyInArray!0 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068332 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1068333 () Bool)

(declare-fun lt!471848 () Unit!34968)

(declare-fun lt!471851 () Unit!34968)

(assert (=> b!1068333 (= lt!471848 lt!471851)))

(declare-fun lt!471852 () ListLongMap!14349)

(declare-fun lt!471854 () V!39281)

(declare-fun lt!471853 () (_ BitVec 64))

(declare-fun lt!471850 () (_ BitVec 64))

(assert (=> b!1068333 (not (contains!6263 (+!3185 lt!471852 (tuple2!16381 lt!471850 lt!471854)) lt!471853))))

(declare-fun addStillNotContains!255 (ListLongMap!14349 (_ BitVec 64) V!39281 (_ BitVec 64)) Unit!34968)

(assert (=> b!1068333 (= lt!471851 (addStillNotContains!255 lt!471852 lt!471850 lt!471854 lt!471853))))

(assert (=> b!1068333 (= lt!471853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1068333 (= lt!471854 (get!17083 (select (arr!32771 _values!955) #b00000000000000000000000000000000) (dynLambda!2018 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1068333 (= lt!471850 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1068333 (= lt!471852 call!45105)))

(assert (=> b!1068333 (= e!609514 (+!3185 call!45105 (tuple2!16381 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000) (get!17083 (select (arr!32771 _values!955) #b00000000000000000000000000000000) (dynLambda!2018 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1068324 () Bool)

(declare-fun isEmpty!949 (ListLongMap!14349) Bool)

(assert (=> b!1068324 (= e!609508 (isEmpty!949 lt!471849))))

(declare-fun d!129011 () Bool)

(assert (=> d!129011 e!609510))

(declare-fun res!712901 () Bool)

(assert (=> d!129011 (=> (not res!712901) (not e!609510))))

(assert (=> d!129011 (= res!712901 (not (contains!6263 lt!471849 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129011 (= lt!471849 e!609513)))

(declare-fun c!107501 () Bool)

(assert (=> d!129011 (= c!107501 (bvsge #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(assert (=> d!129011 (validMask!0 mask!1515)))

(assert (=> d!129011 (= (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471849)))

(assert (= (and d!129011 c!107501) b!1068328))

(assert (= (and d!129011 (not c!107501)) b!1068330))

(assert (= (and b!1068330 c!107498) b!1068333))

(assert (= (and b!1068330 (not c!107498)) b!1068327))

(assert (= (or b!1068333 b!1068327) bm!45102))

(assert (= (and d!129011 res!712901) b!1068331))

(assert (= (and b!1068331 res!712902) b!1068322))

(assert (= (and b!1068322 res!712899) b!1068332))

(assert (= (and b!1068322 c!107499) b!1068325))

(assert (= (and b!1068322 (not c!107499)) b!1068326))

(assert (= (and b!1068325 res!712900) b!1068329))

(assert (= (and b!1068326 c!107500) b!1068323))

(assert (= (and b!1068326 (not c!107500)) b!1068324))

(declare-fun b_lambda!16581 () Bool)

(assert (=> (not b_lambda!16581) (not b!1068329)))

(assert (=> b!1068329 t!32239))

(declare-fun b_and!34573 () Bool)

(assert (= b_and!34571 (and (=> t!32239 result!14741) b_and!34573)))

(declare-fun b_lambda!16583 () Bool)

(assert (=> (not b_lambda!16583) (not b!1068333)))

(assert (=> b!1068333 t!32239))

(declare-fun b_and!34575 () Bool)

(assert (= b_and!34573 (and (=> t!32239 result!14741) b_and!34575)))

(declare-fun m!986425 () Bool)

(assert (=> b!1068323 m!986425))

(assert (=> b!1068325 m!986341))

(assert (=> b!1068325 m!986341))

(declare-fun m!986427 () Bool)

(assert (=> b!1068325 m!986427))

(assert (=> b!1068329 m!986341))

(declare-fun m!986429 () Bool)

(assert (=> b!1068329 m!986429))

(assert (=> b!1068329 m!986405))

(assert (=> b!1068329 m!986407))

(assert (=> b!1068329 m!986409))

(assert (=> b!1068329 m!986407))

(assert (=> b!1068329 m!986405))

(assert (=> b!1068329 m!986341))

(declare-fun m!986431 () Bool)

(assert (=> b!1068333 m!986431))

(declare-fun m!986433 () Bool)

(assert (=> b!1068333 m!986433))

(assert (=> b!1068333 m!986407))

(assert (=> b!1068333 m!986431))

(assert (=> b!1068333 m!986405))

(assert (=> b!1068333 m!986341))

(declare-fun m!986435 () Bool)

(assert (=> b!1068333 m!986435))

(declare-fun m!986437 () Bool)

(assert (=> b!1068333 m!986437))

(assert (=> b!1068333 m!986405))

(assert (=> b!1068333 m!986407))

(assert (=> b!1068333 m!986409))

(assert (=> b!1068330 m!986341))

(assert (=> b!1068330 m!986341))

(assert (=> b!1068330 m!986343))

(assert (=> b!1068332 m!986341))

(assert (=> b!1068332 m!986341))

(assert (=> b!1068332 m!986343))

(declare-fun m!986439 () Bool)

(assert (=> d!129011 m!986439))

(assert (=> d!129011 m!986283))

(declare-fun m!986441 () Bool)

(assert (=> b!1068324 m!986441))

(assert (=> bm!45102 m!986425))

(declare-fun m!986443 () Bool)

(assert (=> b!1068331 m!986443))

(assert (=> b!1068139 d!129011))

(declare-fun call!45106 () ListLongMap!14349)

(declare-fun bm!45103 () Bool)

(assert (=> bm!45103 (= call!45106 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1068334 () Bool)

(declare-fun e!609517 () Bool)

(declare-fun e!609519 () Bool)

(assert (=> b!1068334 (= e!609517 e!609519)))

(declare-fun c!107503 () Bool)

(declare-fun e!609516 () Bool)

(assert (=> b!1068334 (= c!107503 e!609516)))

(declare-fun res!712903 () Bool)

(assert (=> b!1068334 (=> (not res!712903) (not e!609516))))

(assert (=> b!1068334 (= res!712903 (bvslt #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(declare-fun lt!471856 () ListLongMap!14349)

(declare-fun e!609515 () Bool)

(declare-fun b!1068335 () Bool)

(assert (=> b!1068335 (= e!609515 (= lt!471856 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1068337 () Bool)

(declare-fun e!609518 () Bool)

(assert (=> b!1068337 (= e!609519 e!609518)))

(assert (=> b!1068337 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(declare-fun res!712904 () Bool)

(assert (=> b!1068337 (= res!712904 (contains!6263 lt!471856 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068337 (=> (not res!712904) (not e!609518))))

(declare-fun b!1068338 () Bool)

(assert (=> b!1068338 (= e!609519 e!609515)))

(declare-fun c!107504 () Bool)

(assert (=> b!1068338 (= c!107504 (bvslt #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(declare-fun b!1068339 () Bool)

(declare-fun e!609521 () ListLongMap!14349)

(assert (=> b!1068339 (= e!609521 call!45106)))

(declare-fun b!1068340 () Bool)

(declare-fun e!609520 () ListLongMap!14349)

(assert (=> b!1068340 (= e!609520 (ListLongMap!14350 Nil!22915))))

(declare-fun b!1068341 () Bool)

(assert (=> b!1068341 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(assert (=> b!1068341 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33309 _values!955)))))

(assert (=> b!1068341 (= e!609518 (= (apply!919 lt!471856 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)) (get!17083 (select (arr!32771 _values!955) #b00000000000000000000000000000000) (dynLambda!2018 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1068342 () Bool)

(assert (=> b!1068342 (= e!609520 e!609521)))

(declare-fun c!107502 () Bool)

(assert (=> b!1068342 (= c!107502 (validKeyInArray!0 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068343 () Bool)

(declare-fun res!712906 () Bool)

(assert (=> b!1068343 (=> (not res!712906) (not e!609517))))

(assert (=> b!1068343 (= res!712906 (not (contains!6263 lt!471856 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1068344 () Bool)

(assert (=> b!1068344 (= e!609516 (validKeyInArray!0 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068344 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1068345 () Bool)

(declare-fun lt!471855 () Unit!34968)

(declare-fun lt!471858 () Unit!34968)

(assert (=> b!1068345 (= lt!471855 lt!471858)))

(declare-fun lt!471857 () (_ BitVec 64))

(declare-fun lt!471859 () ListLongMap!14349)

(declare-fun lt!471860 () (_ BitVec 64))

(declare-fun lt!471861 () V!39281)

(assert (=> b!1068345 (not (contains!6263 (+!3185 lt!471859 (tuple2!16381 lt!471857 lt!471861)) lt!471860))))

(assert (=> b!1068345 (= lt!471858 (addStillNotContains!255 lt!471859 lt!471857 lt!471861 lt!471860))))

(assert (=> b!1068345 (= lt!471860 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1068345 (= lt!471861 (get!17083 (select (arr!32771 _values!955) #b00000000000000000000000000000000) (dynLambda!2018 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1068345 (= lt!471857 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1068345 (= lt!471859 call!45106)))

(assert (=> b!1068345 (= e!609521 (+!3185 call!45106 (tuple2!16381 (select (arr!32770 _keys!1163) #b00000000000000000000000000000000) (get!17083 (select (arr!32771 _values!955) #b00000000000000000000000000000000) (dynLambda!2018 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1068336 () Bool)

(assert (=> b!1068336 (= e!609515 (isEmpty!949 lt!471856))))

(declare-fun d!129013 () Bool)

(assert (=> d!129013 e!609517))

(declare-fun res!712905 () Bool)

(assert (=> d!129013 (=> (not res!712905) (not e!609517))))

(assert (=> d!129013 (= res!712905 (not (contains!6263 lt!471856 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129013 (= lt!471856 e!609520)))

(declare-fun c!107505 () Bool)

(assert (=> d!129013 (= c!107505 (bvsge #b00000000000000000000000000000000 (size!33308 _keys!1163)))))

(assert (=> d!129013 (validMask!0 mask!1515)))

(assert (=> d!129013 (= (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471856)))

(assert (= (and d!129013 c!107505) b!1068340))

(assert (= (and d!129013 (not c!107505)) b!1068342))

(assert (= (and b!1068342 c!107502) b!1068345))

(assert (= (and b!1068342 (not c!107502)) b!1068339))

(assert (= (or b!1068345 b!1068339) bm!45103))

(assert (= (and d!129013 res!712905) b!1068343))

(assert (= (and b!1068343 res!712906) b!1068334))

(assert (= (and b!1068334 res!712903) b!1068344))

(assert (= (and b!1068334 c!107503) b!1068337))

(assert (= (and b!1068334 (not c!107503)) b!1068338))

(assert (= (and b!1068337 res!712904) b!1068341))

(assert (= (and b!1068338 c!107504) b!1068335))

(assert (= (and b!1068338 (not c!107504)) b!1068336))

(declare-fun b_lambda!16585 () Bool)

(assert (=> (not b_lambda!16585) (not b!1068341)))

(assert (=> b!1068341 t!32239))

(declare-fun b_and!34577 () Bool)

(assert (= b_and!34575 (and (=> t!32239 result!14741) b_and!34577)))

(declare-fun b_lambda!16587 () Bool)

(assert (=> (not b_lambda!16587) (not b!1068345)))

(assert (=> b!1068345 t!32239))

(declare-fun b_and!34579 () Bool)

(assert (= b_and!34577 (and (=> t!32239 result!14741) b_and!34579)))

(declare-fun m!986445 () Bool)

(assert (=> b!1068335 m!986445))

(assert (=> b!1068337 m!986341))

(assert (=> b!1068337 m!986341))

(declare-fun m!986447 () Bool)

(assert (=> b!1068337 m!986447))

(assert (=> b!1068341 m!986341))

(declare-fun m!986449 () Bool)

(assert (=> b!1068341 m!986449))

(assert (=> b!1068341 m!986405))

(assert (=> b!1068341 m!986407))

(assert (=> b!1068341 m!986409))

(assert (=> b!1068341 m!986407))

(assert (=> b!1068341 m!986405))

(assert (=> b!1068341 m!986341))

(declare-fun m!986451 () Bool)

(assert (=> b!1068345 m!986451))

(declare-fun m!986453 () Bool)

(assert (=> b!1068345 m!986453))

(assert (=> b!1068345 m!986407))

(assert (=> b!1068345 m!986451))

(assert (=> b!1068345 m!986405))

(assert (=> b!1068345 m!986341))

(declare-fun m!986455 () Bool)

(assert (=> b!1068345 m!986455))

(declare-fun m!986457 () Bool)

(assert (=> b!1068345 m!986457))

(assert (=> b!1068345 m!986405))

(assert (=> b!1068345 m!986407))

(assert (=> b!1068345 m!986409))

(assert (=> b!1068342 m!986341))

(assert (=> b!1068342 m!986341))

(assert (=> b!1068342 m!986343))

(assert (=> b!1068344 m!986341))

(assert (=> b!1068344 m!986341))

(assert (=> b!1068344 m!986343))

(declare-fun m!986459 () Bool)

(assert (=> d!129013 m!986459))

(assert (=> d!129013 m!986283))

(declare-fun m!986461 () Bool)

(assert (=> b!1068336 m!986461))

(assert (=> bm!45103 m!986445))

(declare-fun m!986463 () Bool)

(assert (=> b!1068343 m!986463))

(assert (=> b!1068139 d!129013))

(declare-fun b!1068352 () Bool)

(declare-fun e!609527 () Bool)

(assert (=> b!1068352 (= e!609527 tp_is_empty!25609)))

(declare-fun condMapEmpty!40117 () Bool)

(declare-fun mapDefault!40117 () ValueCell!12101)

(assert (=> mapNonEmpty!40108 (= condMapEmpty!40117 (= mapRest!40108 ((as const (Array (_ BitVec 32) ValueCell!12101)) mapDefault!40117)))))

(declare-fun e!609526 () Bool)

(declare-fun mapRes!40117 () Bool)

(assert (=> mapNonEmpty!40108 (= tp!76843 (and e!609526 mapRes!40117))))

(declare-fun b!1068353 () Bool)

(assert (=> b!1068353 (= e!609526 tp_is_empty!25609)))

(declare-fun mapNonEmpty!40117 () Bool)

(declare-fun tp!76859 () Bool)

(assert (=> mapNonEmpty!40117 (= mapRes!40117 (and tp!76859 e!609527))))

(declare-fun mapValue!40117 () ValueCell!12101)

(declare-fun mapRest!40117 () (Array (_ BitVec 32) ValueCell!12101))

(declare-fun mapKey!40117 () (_ BitVec 32))

(assert (=> mapNonEmpty!40117 (= mapRest!40108 (store mapRest!40117 mapKey!40117 mapValue!40117))))

(declare-fun mapIsEmpty!40117 () Bool)

(assert (=> mapIsEmpty!40117 mapRes!40117))

(assert (= (and mapNonEmpty!40108 condMapEmpty!40117) mapIsEmpty!40117))

(assert (= (and mapNonEmpty!40108 (not condMapEmpty!40117)) mapNonEmpty!40117))

(assert (= (and mapNonEmpty!40117 ((_ is ValueCellFull!12101) mapValue!40117)) b!1068352))

(assert (= (and mapNonEmpty!40108 ((_ is ValueCellFull!12101) mapDefault!40117)) b!1068353))

(declare-fun m!986465 () Bool)

(assert (=> mapNonEmpty!40117 m!986465))

(declare-fun b_lambda!16589 () Bool)

(assert (= b_lambda!16579 (or (and start!94466 b_free!21799) b_lambda!16589)))

(declare-fun b_lambda!16591 () Bool)

(assert (= b_lambda!16585 (or (and start!94466 b_free!21799) b_lambda!16591)))

(declare-fun b_lambda!16593 () Bool)

(assert (= b_lambda!16581 (or (and start!94466 b_free!21799) b_lambda!16593)))

(declare-fun b_lambda!16595 () Bool)

(assert (= b_lambda!16587 (or (and start!94466 b_free!21799) b_lambda!16595)))

(declare-fun b_lambda!16597 () Bool)

(assert (= b_lambda!16583 (or (and start!94466 b_free!21799) b_lambda!16597)))

(check-sat (not b!1068286) (not mapNonEmpty!40117) (not d!129003) (not b!1068343) (not b!1068287) (not b_lambda!16597) (not b!1068209) (not b!1068220) (not d!129013) (not b_lambda!16591) (not bm!45075) (not b!1068211) (not b!1068344) (not bm!45094) (not b!1068275) (not d!129001) (not b!1068329) (not b!1068230) (not bm!45098) (not bm!45095) tp_is_empty!25609 b_and!34579 (not d!129007) (not b!1068330) (not b!1068291) (not b!1068293) (not d!129009) (not d!129011) (not b_lambda!16589) (not b_lambda!16593) (not b!1068207) (not b!1068345) (not b!1068337) (not b!1068342) (not b!1068222) (not b!1068331) (not b!1068332) (not d!129005) (not b!1068336) (not b_next!21799) (not b_lambda!16595) (not b!1068325) (not b!1068324) (not b!1068341) (not bm!45102) (not bm!45099) (not b!1068295) (not bm!45103) (not b!1068232) (not b!1068288) (not b!1068333) (not bm!45078) (not b!1068279) (not b!1068323) (not b!1068335))
(check-sat b_and!34579 (not b_next!21799))
