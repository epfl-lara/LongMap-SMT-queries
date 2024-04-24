; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95202 () Bool)

(assert start!95202)

(declare-fun b_free!22159 () Bool)

(declare-fun b_next!22159 () Bool)

(assert (=> start!95202 (= b_free!22159 (not b_next!22159))))

(declare-fun tp!77944 () Bool)

(declare-fun b_and!35031 () Bool)

(assert (=> start!95202 (= tp!77944 b_and!35031)))

(declare-fun b!1075029 () Bool)

(declare-fun e!614298 () Bool)

(declare-fun e!614300 () Bool)

(declare-fun mapRes!40669 () Bool)

(assert (=> b!1075029 (= e!614298 (and e!614300 mapRes!40669))))

(declare-fun condMapEmpty!40669 () Bool)

(declare-datatypes ((V!39761 0))(
  ( (V!39762 (val!13035 Int)) )
))
(declare-datatypes ((ValueCell!12281 0))(
  ( (ValueCellFull!12281 (v!15649 V!39761)) (EmptyCell!12281) )
))
(declare-datatypes ((array!68945 0))(
  ( (array!68946 (arr!33159 (Array (_ BitVec 32) ValueCell!12281)) (size!33696 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68945)

(declare-fun mapDefault!40669 () ValueCell!12281)

(assert (=> b!1075029 (= condMapEmpty!40669 (= (arr!33159 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12281)) mapDefault!40669)))))

(declare-fun b!1075030 () Bool)

(declare-fun res!716600 () Bool)

(declare-fun e!614296 () Bool)

(assert (=> b!1075030 (=> (not res!716600) (not e!614296))))

(declare-datatypes ((array!68947 0))(
  ( (array!68948 (arr!33160 (Array (_ BitVec 32) (_ BitVec 64))) (size!33697 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68947)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68947 (_ BitVec 32)) Bool)

(assert (=> b!1075030 (= res!716600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun zeroValueBefore!47 () V!39761)

(declare-fun e!614297 () Bool)

(declare-fun b!1075031 () Bool)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39761)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((tuple2!16586 0))(
  ( (tuple2!16587 (_1!8304 (_ BitVec 64)) (_2!8304 V!39761)) )
))
(declare-datatypes ((List!23143 0))(
  ( (Nil!23140) (Cons!23139 (h!24357 tuple2!16586) (t!32474 List!23143)) )
))
(declare-datatypes ((ListLongMap!14563 0))(
  ( (ListLongMap!14564 (toList!7297 List!23143)) )
))
(declare-fun contains!6354 (ListLongMap!14563 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4160 (array!68947 array!68945 (_ BitVec 32) (_ BitVec 32) V!39761 V!39761 (_ BitVec 32) Int) ListLongMap!14563)

(assert (=> b!1075031 (= e!614297 (not (contains!6354 (getCurrentListMap!4160 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075032 () Bool)

(assert (=> b!1075032 (= e!614296 (not e!614297))))

(declare-fun res!716597 () Bool)

(assert (=> b!1075032 (=> res!716597 e!614297)))

(assert (=> b!1075032 (= res!716597 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!476651 () ListLongMap!14563)

(declare-fun lt!476653 () ListLongMap!14563)

(assert (=> b!1075032 (= lt!476651 lt!476653)))

(declare-datatypes ((Unit!35331 0))(
  ( (Unit!35332) )
))
(declare-fun lt!476652 () Unit!35331)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39761)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!875 (array!68947 array!68945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39761 V!39761 V!39761 V!39761 (_ BitVec 32) Int) Unit!35331)

(assert (=> b!1075032 (= lt!476652 (lemmaNoChangeToArrayThenSameMapNoExtras!875 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3895 (array!68947 array!68945 (_ BitVec 32) (_ BitVec 32) V!39761 V!39761 (_ BitVec 32) Int) ListLongMap!14563)

(assert (=> b!1075032 (= lt!476653 (getCurrentListMapNoExtraKeys!3895 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075032 (= lt!476651 (getCurrentListMapNoExtraKeys!3895 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40669 () Bool)

(assert (=> mapIsEmpty!40669 mapRes!40669))

(declare-fun mapNonEmpty!40669 () Bool)

(declare-fun tp!77945 () Bool)

(declare-fun e!614299 () Bool)

(assert (=> mapNonEmpty!40669 (= mapRes!40669 (and tp!77945 e!614299))))

(declare-fun mapValue!40669 () ValueCell!12281)

(declare-fun mapRest!40669 () (Array (_ BitVec 32) ValueCell!12281))

(declare-fun mapKey!40669 () (_ BitVec 32))

(assert (=> mapNonEmpty!40669 (= (arr!33159 _values!955) (store mapRest!40669 mapKey!40669 mapValue!40669))))

(declare-fun b!1075033 () Bool)

(declare-fun res!716599 () Bool)

(assert (=> b!1075033 (=> (not res!716599) (not e!614296))))

(declare-datatypes ((List!23144 0))(
  ( (Nil!23141) (Cons!23140 (h!24358 (_ BitVec 64)) (t!32475 List!23144)) )
))
(declare-fun arrayNoDuplicates!0 (array!68947 (_ BitVec 32) List!23144) Bool)

(assert (=> b!1075033 (= res!716599 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23141))))

(declare-fun res!716598 () Bool)

(assert (=> start!95202 (=> (not res!716598) (not e!614296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95202 (= res!716598 (validMask!0 mask!1515))))

(assert (=> start!95202 e!614296))

(assert (=> start!95202 true))

(declare-fun tp_is_empty!25969 () Bool)

(assert (=> start!95202 tp_is_empty!25969))

(declare-fun array_inv!25670 (array!68945) Bool)

(assert (=> start!95202 (and (array_inv!25670 _values!955) e!614298)))

(assert (=> start!95202 tp!77944))

(declare-fun array_inv!25671 (array!68947) Bool)

(assert (=> start!95202 (array_inv!25671 _keys!1163)))

(declare-fun b!1075034 () Bool)

(assert (=> b!1075034 (= e!614299 tp_is_empty!25969)))

(declare-fun b!1075035 () Bool)

(assert (=> b!1075035 (= e!614300 tp_is_empty!25969)))

(declare-fun b!1075036 () Bool)

(declare-fun res!716596 () Bool)

(assert (=> b!1075036 (=> (not res!716596) (not e!614296))))

(assert (=> b!1075036 (= res!716596 (and (= (size!33696 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33697 _keys!1163) (size!33696 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!95202 res!716598) b!1075036))

(assert (= (and b!1075036 res!716596) b!1075030))

(assert (= (and b!1075030 res!716600) b!1075033))

(assert (= (and b!1075033 res!716599) b!1075032))

(assert (= (and b!1075032 (not res!716597)) b!1075031))

(assert (= (and b!1075029 condMapEmpty!40669) mapIsEmpty!40669))

(assert (= (and b!1075029 (not condMapEmpty!40669)) mapNonEmpty!40669))

(get-info :version)

(assert (= (and mapNonEmpty!40669 ((_ is ValueCellFull!12281) mapValue!40669)) b!1075034))

(assert (= (and b!1075029 ((_ is ValueCellFull!12281) mapDefault!40669)) b!1075035))

(assert (= start!95202 b!1075029))

(declare-fun m!994295 () Bool)

(assert (=> b!1075031 m!994295))

(assert (=> b!1075031 m!994295))

(declare-fun m!994297 () Bool)

(assert (=> b!1075031 m!994297))

(declare-fun m!994299 () Bool)

(assert (=> b!1075030 m!994299))

(declare-fun m!994301 () Bool)

(assert (=> start!95202 m!994301))

(declare-fun m!994303 () Bool)

(assert (=> start!95202 m!994303))

(declare-fun m!994305 () Bool)

(assert (=> start!95202 m!994305))

(declare-fun m!994307 () Bool)

(assert (=> mapNonEmpty!40669 m!994307))

(declare-fun m!994309 () Bool)

(assert (=> b!1075033 m!994309))

(declare-fun m!994311 () Bool)

(assert (=> b!1075032 m!994311))

(declare-fun m!994313 () Bool)

(assert (=> b!1075032 m!994313))

(declare-fun m!994315 () Bool)

(assert (=> b!1075032 m!994315))

(check-sat (not b!1075033) (not b!1075031) (not start!95202) tp_is_empty!25969 (not mapNonEmpty!40669) b_and!35031 (not b!1075032) (not b_next!22159) (not b!1075030))
(check-sat b_and!35031 (not b_next!22159))
(get-model)

(declare-fun b!1075093 () Bool)

(declare-fun e!614345 () Bool)

(declare-fun call!45357 () Bool)

(assert (=> b!1075093 (= e!614345 call!45357)))

(declare-fun b!1075094 () Bool)

(declare-fun e!614346 () Bool)

(assert (=> b!1075094 (= e!614346 e!614345)))

(declare-fun lt!476678 () (_ BitVec 64))

(assert (=> b!1075094 (= lt!476678 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476680 () Unit!35331)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68947 (_ BitVec 64) (_ BitVec 32)) Unit!35331)

(assert (=> b!1075094 (= lt!476680 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!476678 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1075094 (arrayContainsKey!0 _keys!1163 lt!476678 #b00000000000000000000000000000000)))

(declare-fun lt!476679 () Unit!35331)

(assert (=> b!1075094 (= lt!476679 lt!476680)))

(declare-fun res!716635 () Bool)

(declare-datatypes ((SeekEntryResult!9842 0))(
  ( (MissingZero!9842 (index!41739 (_ BitVec 32))) (Found!9842 (index!41740 (_ BitVec 32))) (Intermediate!9842 (undefined!10654 Bool) (index!41741 (_ BitVec 32)) (x!96224 (_ BitVec 32))) (Undefined!9842) (MissingVacant!9842 (index!41742 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68947 (_ BitVec 32)) SeekEntryResult!9842)

(assert (=> b!1075094 (= res!716635 (= (seekEntryOrOpen!0 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9842 #b00000000000000000000000000000000)))))

(assert (=> b!1075094 (=> (not res!716635) (not e!614345))))

(declare-fun bm!45354 () Bool)

(assert (=> bm!45354 (= call!45357 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun d!129903 () Bool)

(declare-fun res!716636 () Bool)

(declare-fun e!614344 () Bool)

(assert (=> d!129903 (=> res!716636 e!614344)))

(assert (=> d!129903 (= res!716636 (bvsge #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(assert (=> d!129903 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614344)))

(declare-fun b!1075095 () Bool)

(assert (=> b!1075095 (= e!614346 call!45357)))

(declare-fun b!1075096 () Bool)

(assert (=> b!1075096 (= e!614344 e!614346)))

(declare-fun c!108176 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1075096 (= c!108176 (validKeyInArray!0 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129903 (not res!716636)) b!1075096))

(assert (= (and b!1075096 c!108176) b!1075094))

(assert (= (and b!1075096 (not c!108176)) b!1075095))

(assert (= (and b!1075094 res!716635) b!1075093))

(assert (= (or b!1075093 b!1075095) bm!45354))

(declare-fun m!994361 () Bool)

(assert (=> b!1075094 m!994361))

(declare-fun m!994363 () Bool)

(assert (=> b!1075094 m!994363))

(declare-fun m!994365 () Bool)

(assert (=> b!1075094 m!994365))

(assert (=> b!1075094 m!994361))

(declare-fun m!994367 () Bool)

(assert (=> b!1075094 m!994367))

(declare-fun m!994369 () Bool)

(assert (=> bm!45354 m!994369))

(assert (=> b!1075096 m!994361))

(assert (=> b!1075096 m!994361))

(declare-fun m!994371 () Bool)

(assert (=> b!1075096 m!994371))

(assert (=> b!1075030 d!129903))

(declare-fun bm!45357 () Bool)

(declare-fun call!45360 () Bool)

(declare-fun c!108179 () Bool)

(assert (=> bm!45357 (= call!45360 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108179 (Cons!23140 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000) Nil!23141) Nil!23141)))))

(declare-fun b!1075108 () Bool)

(declare-fun e!614356 () Bool)

(declare-fun contains!6356 (List!23144 (_ BitVec 64)) Bool)

(assert (=> b!1075108 (= e!614356 (contains!6356 Nil!23141 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075109 () Bool)

(declare-fun e!614355 () Bool)

(assert (=> b!1075109 (= e!614355 call!45360)))

(declare-fun b!1075110 () Bool)

(assert (=> b!1075110 (= e!614355 call!45360)))

(declare-fun b!1075111 () Bool)

(declare-fun e!614358 () Bool)

(declare-fun e!614357 () Bool)

(assert (=> b!1075111 (= e!614358 e!614357)))

(declare-fun res!716644 () Bool)

(assert (=> b!1075111 (=> (not res!716644) (not e!614357))))

(assert (=> b!1075111 (= res!716644 (not e!614356))))

(declare-fun res!716643 () Bool)

(assert (=> b!1075111 (=> (not res!716643) (not e!614356))))

(assert (=> b!1075111 (= res!716643 (validKeyInArray!0 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129905 () Bool)

(declare-fun res!716645 () Bool)

(assert (=> d!129905 (=> res!716645 e!614358)))

(assert (=> d!129905 (= res!716645 (bvsge #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(assert (=> d!129905 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23141) e!614358)))

(declare-fun b!1075107 () Bool)

(assert (=> b!1075107 (= e!614357 e!614355)))

(assert (=> b!1075107 (= c!108179 (validKeyInArray!0 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129905 (not res!716645)) b!1075111))

(assert (= (and b!1075111 res!716643) b!1075108))

(assert (= (and b!1075111 res!716644) b!1075107))

(assert (= (and b!1075107 c!108179) b!1075110))

(assert (= (and b!1075107 (not c!108179)) b!1075109))

(assert (= (or b!1075110 b!1075109) bm!45357))

(assert (=> bm!45357 m!994361))

(declare-fun m!994373 () Bool)

(assert (=> bm!45357 m!994373))

(assert (=> b!1075108 m!994361))

(assert (=> b!1075108 m!994361))

(declare-fun m!994375 () Bool)

(assert (=> b!1075108 m!994375))

(assert (=> b!1075111 m!994361))

(assert (=> b!1075111 m!994361))

(assert (=> b!1075111 m!994371))

(assert (=> b!1075107 m!994361))

(assert (=> b!1075107 m!994361))

(assert (=> b!1075107 m!994371))

(assert (=> b!1075033 d!129905))

(declare-fun d!129907 () Bool)

(assert (=> d!129907 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95202 d!129907))

(declare-fun d!129909 () Bool)

(assert (=> d!129909 (= (array_inv!25670 _values!955) (bvsge (size!33696 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95202 d!129909))

(declare-fun d!129911 () Bool)

(assert (=> d!129911 (= (array_inv!25671 _keys!1163) (bvsge (size!33697 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95202 d!129911))

(declare-fun d!129913 () Bool)

(declare-fun e!614364 () Bool)

(assert (=> d!129913 e!614364))

(declare-fun res!716648 () Bool)

(assert (=> d!129913 (=> res!716648 e!614364)))

(declare-fun lt!476691 () Bool)

(assert (=> d!129913 (= res!716648 (not lt!476691))))

(declare-fun lt!476689 () Bool)

(assert (=> d!129913 (= lt!476691 lt!476689)))

(declare-fun lt!476692 () Unit!35331)

(declare-fun e!614363 () Unit!35331)

(assert (=> d!129913 (= lt!476692 e!614363)))

(declare-fun c!108182 () Bool)

(assert (=> d!129913 (= c!108182 lt!476689)))

(declare-fun containsKey!578 (List!23143 (_ BitVec 64)) Bool)

(assert (=> d!129913 (= lt!476689 (containsKey!578 (toList!7297 (getCurrentListMap!4160 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129913 (= (contains!6354 (getCurrentListMap!4160 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000) lt!476691)))

(declare-fun b!1075118 () Bool)

(declare-fun lt!476690 () Unit!35331)

(assert (=> b!1075118 (= e!614363 lt!476690)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!409 (List!23143 (_ BitVec 64)) Unit!35331)

(assert (=> b!1075118 (= lt!476690 (lemmaContainsKeyImpliesGetValueByKeyDefined!409 (toList!7297 (getCurrentListMap!4160 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!652 0))(
  ( (Some!651 (v!15652 V!39761)) (None!650) )
))
(declare-fun isDefined!447 (Option!652) Bool)

(declare-fun getValueByKey!601 (List!23143 (_ BitVec 64)) Option!652)

(assert (=> b!1075118 (isDefined!447 (getValueByKey!601 (toList!7297 (getCurrentListMap!4160 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075119 () Bool)

(declare-fun Unit!35335 () Unit!35331)

(assert (=> b!1075119 (= e!614363 Unit!35335)))

(declare-fun b!1075120 () Bool)

(assert (=> b!1075120 (= e!614364 (isDefined!447 (getValueByKey!601 (toList!7297 (getCurrentListMap!4160 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129913 c!108182) b!1075118))

(assert (= (and d!129913 (not c!108182)) b!1075119))

(assert (= (and d!129913 (not res!716648)) b!1075120))

(declare-fun m!994377 () Bool)

(assert (=> d!129913 m!994377))

(declare-fun m!994379 () Bool)

(assert (=> b!1075118 m!994379))

(declare-fun m!994381 () Bool)

(assert (=> b!1075118 m!994381))

(assert (=> b!1075118 m!994381))

(declare-fun m!994383 () Bool)

(assert (=> b!1075118 m!994383))

(assert (=> b!1075120 m!994381))

(assert (=> b!1075120 m!994381))

(assert (=> b!1075120 m!994383))

(assert (=> b!1075031 d!129913))

(declare-fun lt!476740 () ListLongMap!14563)

(declare-fun b!1075163 () Bool)

(declare-fun e!614399 () Bool)

(declare-fun apply!942 (ListLongMap!14563 (_ BitVec 64)) V!39761)

(declare-fun get!17244 (ValueCell!12281 V!39761) V!39761)

(declare-fun dynLambda!2057 (Int (_ BitVec 64)) V!39761)

(assert (=> b!1075163 (= e!614399 (= (apply!942 lt!476740 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)) (get!17244 (select (arr!33159 _values!955) #b00000000000000000000000000000000) (dynLambda!2057 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33696 _values!955)))))

(assert (=> b!1075163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(declare-fun b!1075164 () Bool)

(declare-fun e!614401 () Bool)

(assert (=> b!1075164 (= e!614401 (validKeyInArray!0 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075165 () Bool)

(declare-fun e!614392 () Bool)

(declare-fun e!614393 () Bool)

(assert (=> b!1075165 (= e!614392 e!614393)))

(declare-fun c!108199 () Bool)

(assert (=> b!1075165 (= c!108199 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075166 () Bool)

(declare-fun res!716670 () Bool)

(assert (=> b!1075166 (=> (not res!716670) (not e!614392))))

(declare-fun e!614394 () Bool)

(assert (=> b!1075166 (= res!716670 e!614394)))

(declare-fun c!108200 () Bool)

(assert (=> b!1075166 (= c!108200 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075167 () Bool)

(declare-fun call!45380 () Bool)

(assert (=> b!1075167 (= e!614393 (not call!45380))))

(declare-fun b!1075168 () Bool)

(declare-fun e!614403 () Bool)

(assert (=> b!1075168 (= e!614393 e!614403)))

(declare-fun res!716673 () Bool)

(assert (=> b!1075168 (= res!716673 call!45380)))

(assert (=> b!1075168 (=> (not res!716673) (not e!614403))))

(declare-fun b!1075169 () Bool)

(declare-fun e!614402 () ListLongMap!14563)

(declare-fun call!45378 () ListLongMap!14563)

(assert (=> b!1075169 (= e!614402 call!45378)))

(declare-fun b!1075170 () Bool)

(declare-fun e!614395 () Unit!35331)

(declare-fun lt!476750 () Unit!35331)

(assert (=> b!1075170 (= e!614395 lt!476750)))

(declare-fun lt!476749 () ListLongMap!14563)

(assert (=> b!1075170 (= lt!476749 (getCurrentListMapNoExtraKeys!3895 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476758 () (_ BitVec 64))

(assert (=> b!1075170 (= lt!476758 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476747 () (_ BitVec 64))

(assert (=> b!1075170 (= lt!476747 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476745 () Unit!35331)

(declare-fun addStillContains!646 (ListLongMap!14563 (_ BitVec 64) V!39761 (_ BitVec 64)) Unit!35331)

(assert (=> b!1075170 (= lt!476745 (addStillContains!646 lt!476749 lt!476758 zeroValueBefore!47 lt!476747))))

(declare-fun +!3235 (ListLongMap!14563 tuple2!16586) ListLongMap!14563)

(assert (=> b!1075170 (contains!6354 (+!3235 lt!476749 (tuple2!16587 lt!476758 zeroValueBefore!47)) lt!476747)))

(declare-fun lt!476754 () Unit!35331)

(assert (=> b!1075170 (= lt!476754 lt!476745)))

(declare-fun lt!476751 () ListLongMap!14563)

(assert (=> b!1075170 (= lt!476751 (getCurrentListMapNoExtraKeys!3895 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476753 () (_ BitVec 64))

(assert (=> b!1075170 (= lt!476753 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476757 () (_ BitVec 64))

(assert (=> b!1075170 (= lt!476757 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476743 () Unit!35331)

(declare-fun addApplyDifferent!502 (ListLongMap!14563 (_ BitVec 64) V!39761 (_ BitVec 64)) Unit!35331)

(assert (=> b!1075170 (= lt!476743 (addApplyDifferent!502 lt!476751 lt!476753 minValue!907 lt!476757))))

(assert (=> b!1075170 (= (apply!942 (+!3235 lt!476751 (tuple2!16587 lt!476753 minValue!907)) lt!476757) (apply!942 lt!476751 lt!476757))))

(declare-fun lt!476738 () Unit!35331)

(assert (=> b!1075170 (= lt!476738 lt!476743)))

(declare-fun lt!476756 () ListLongMap!14563)

(assert (=> b!1075170 (= lt!476756 (getCurrentListMapNoExtraKeys!3895 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476748 () (_ BitVec 64))

(assert (=> b!1075170 (= lt!476748 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476746 () (_ BitVec 64))

(assert (=> b!1075170 (= lt!476746 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476755 () Unit!35331)

(assert (=> b!1075170 (= lt!476755 (addApplyDifferent!502 lt!476756 lt!476748 zeroValueBefore!47 lt!476746))))

(assert (=> b!1075170 (= (apply!942 (+!3235 lt!476756 (tuple2!16587 lt!476748 zeroValueBefore!47)) lt!476746) (apply!942 lt!476756 lt!476746))))

(declare-fun lt!476739 () Unit!35331)

(assert (=> b!1075170 (= lt!476739 lt!476755)))

(declare-fun lt!476741 () ListLongMap!14563)

(assert (=> b!1075170 (= lt!476741 (getCurrentListMapNoExtraKeys!3895 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476737 () (_ BitVec 64))

(assert (=> b!1075170 (= lt!476737 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476744 () (_ BitVec 64))

(assert (=> b!1075170 (= lt!476744 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075170 (= lt!476750 (addApplyDifferent!502 lt!476741 lt!476737 minValue!907 lt!476744))))

(assert (=> b!1075170 (= (apply!942 (+!3235 lt!476741 (tuple2!16587 lt!476737 minValue!907)) lt!476744) (apply!942 lt!476741 lt!476744))))

(declare-fun bm!45372 () Bool)

(declare-fun call!45375 () Bool)

(assert (=> bm!45372 (= call!45375 (contains!6354 lt!476740 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075171 () Bool)

(assert (=> b!1075171 (= e!614394 (not call!45375))))

(declare-fun b!1075172 () Bool)

(declare-fun c!108198 () Bool)

(assert (=> b!1075172 (= c!108198 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614391 () ListLongMap!14563)

(assert (=> b!1075172 (= e!614391 e!614402)))

(declare-fun b!1075173 () Bool)

(declare-fun e!614398 () ListLongMap!14563)

(assert (=> b!1075173 (= e!614398 e!614391)))

(declare-fun c!108197 () Bool)

(assert (=> b!1075173 (= c!108197 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075174 () Bool)

(declare-fun e!614397 () Bool)

(assert (=> b!1075174 (= e!614394 e!614397)))

(declare-fun res!716669 () Bool)

(assert (=> b!1075174 (= res!716669 call!45375)))

(assert (=> b!1075174 (=> (not res!716669) (not e!614397))))

(declare-fun bm!45374 () Bool)

(declare-fun call!45381 () ListLongMap!14563)

(declare-fun call!45377 () ListLongMap!14563)

(assert (=> bm!45374 (= call!45381 call!45377)))

(declare-fun b!1075175 () Bool)

(declare-fun e!614396 () Bool)

(assert (=> b!1075175 (= e!614396 (validKeyInArray!0 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45375 () Bool)

(declare-fun call!45376 () ListLongMap!14563)

(assert (=> bm!45375 (= call!45378 call!45376)))

(declare-fun d!129915 () Bool)

(assert (=> d!129915 e!614392))

(declare-fun res!716675 () Bool)

(assert (=> d!129915 (=> (not res!716675) (not e!614392))))

(assert (=> d!129915 (= res!716675 (or (bvsge #b00000000000000000000000000000000 (size!33697 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33697 _keys!1163)))))))

(declare-fun lt!476752 () ListLongMap!14563)

(assert (=> d!129915 (= lt!476740 lt!476752)))

(declare-fun lt!476742 () Unit!35331)

(assert (=> d!129915 (= lt!476742 e!614395)))

(declare-fun c!108195 () Bool)

(assert (=> d!129915 (= c!108195 e!614401)))

(declare-fun res!716674 () Bool)

(assert (=> d!129915 (=> (not res!716674) (not e!614401))))

(assert (=> d!129915 (= res!716674 (bvslt #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(assert (=> d!129915 (= lt!476752 e!614398)))

(declare-fun c!108196 () Bool)

(assert (=> d!129915 (= c!108196 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129915 (validMask!0 mask!1515)))

(assert (=> d!129915 (= (getCurrentListMap!4160 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476740)))

(declare-fun bm!45373 () Bool)

(assert (=> bm!45373 (= call!45380 (contains!6354 lt!476740 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075176 () Bool)

(declare-fun Unit!35336 () Unit!35331)

(assert (=> b!1075176 (= e!614395 Unit!35336)))

(declare-fun call!45379 () ListLongMap!14563)

(declare-fun bm!45376 () Bool)

(assert (=> bm!45376 (= call!45376 (+!3235 (ite c!108196 call!45379 (ite c!108197 call!45377 call!45381)) (ite (or c!108196 c!108197) (tuple2!16587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16587 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075177 () Bool)

(assert (=> b!1075177 (= e!614402 call!45381)))

(declare-fun b!1075178 () Bool)

(assert (=> b!1075178 (= e!614398 (+!3235 call!45376 (tuple2!16587 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45377 () Bool)

(assert (=> bm!45377 (= call!45377 call!45379)))

(declare-fun b!1075179 () Bool)

(declare-fun e!614400 () Bool)

(assert (=> b!1075179 (= e!614400 e!614399)))

(declare-fun res!716672 () Bool)

(assert (=> b!1075179 (=> (not res!716672) (not e!614399))))

(assert (=> b!1075179 (= res!716672 (contains!6354 lt!476740 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075179 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(declare-fun b!1075180 () Bool)

(assert (=> b!1075180 (= e!614403 (= (apply!942 lt!476740 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45378 () Bool)

(assert (=> bm!45378 (= call!45379 (getCurrentListMapNoExtraKeys!3895 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075181 () Bool)

(assert (=> b!1075181 (= e!614391 call!45378)))

(declare-fun b!1075182 () Bool)

(assert (=> b!1075182 (= e!614397 (= (apply!942 lt!476740 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1075183 () Bool)

(declare-fun res!716668 () Bool)

(assert (=> b!1075183 (=> (not res!716668) (not e!614392))))

(assert (=> b!1075183 (= res!716668 e!614400)))

(declare-fun res!716667 () Bool)

(assert (=> b!1075183 (=> res!716667 e!614400)))

(assert (=> b!1075183 (= res!716667 (not e!614396))))

(declare-fun res!716671 () Bool)

(assert (=> b!1075183 (=> (not res!716671) (not e!614396))))

(assert (=> b!1075183 (= res!716671 (bvslt #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(assert (= (and d!129915 c!108196) b!1075178))

(assert (= (and d!129915 (not c!108196)) b!1075173))

(assert (= (and b!1075173 c!108197) b!1075181))

(assert (= (and b!1075173 (not c!108197)) b!1075172))

(assert (= (and b!1075172 c!108198) b!1075169))

(assert (= (and b!1075172 (not c!108198)) b!1075177))

(assert (= (or b!1075169 b!1075177) bm!45374))

(assert (= (or b!1075181 bm!45374) bm!45377))

(assert (= (or b!1075181 b!1075169) bm!45375))

(assert (= (or b!1075178 bm!45377) bm!45378))

(assert (= (or b!1075178 bm!45375) bm!45376))

(assert (= (and d!129915 res!716674) b!1075164))

(assert (= (and d!129915 c!108195) b!1075170))

(assert (= (and d!129915 (not c!108195)) b!1075176))

(assert (= (and d!129915 res!716675) b!1075183))

(assert (= (and b!1075183 res!716671) b!1075175))

(assert (= (and b!1075183 (not res!716667)) b!1075179))

(assert (= (and b!1075179 res!716672) b!1075163))

(assert (= (and b!1075183 res!716668) b!1075166))

(assert (= (and b!1075166 c!108200) b!1075174))

(assert (= (and b!1075166 (not c!108200)) b!1075171))

(assert (= (and b!1075174 res!716669) b!1075182))

(assert (= (or b!1075174 b!1075171) bm!45372))

(assert (= (and b!1075166 res!716670) b!1075165))

(assert (= (and b!1075165 c!108199) b!1075168))

(assert (= (and b!1075165 (not c!108199)) b!1075167))

(assert (= (and b!1075168 res!716673) b!1075180))

(assert (= (or b!1075168 b!1075167) bm!45373))

(declare-fun b_lambda!16751 () Bool)

(assert (=> (not b_lambda!16751) (not b!1075163)))

(declare-fun t!32481 () Bool)

(declare-fun tb!7153 () Bool)

(assert (=> (and start!95202 (= defaultEntry!963 defaultEntry!963) t!32481) tb!7153))

(declare-fun result!14783 () Bool)

(assert (=> tb!7153 (= result!14783 tp_is_empty!25969)))

(assert (=> b!1075163 t!32481))

(declare-fun b_and!35037 () Bool)

(assert (= b_and!35031 (and (=> t!32481 result!14783) b_and!35037)))

(assert (=> b!1075175 m!994361))

(assert (=> b!1075175 m!994361))

(assert (=> b!1075175 m!994371))

(declare-fun m!994385 () Bool)

(assert (=> b!1075163 m!994385))

(assert (=> b!1075163 m!994361))

(declare-fun m!994387 () Bool)

(assert (=> b!1075163 m!994387))

(declare-fun m!994389 () Bool)

(assert (=> b!1075163 m!994389))

(assert (=> b!1075163 m!994385))

(declare-fun m!994391 () Bool)

(assert (=> b!1075163 m!994391))

(assert (=> b!1075163 m!994361))

(assert (=> b!1075163 m!994389))

(declare-fun m!994393 () Bool)

(assert (=> b!1075178 m!994393))

(declare-fun m!994395 () Bool)

(assert (=> bm!45376 m!994395))

(assert (=> b!1075179 m!994361))

(assert (=> b!1075179 m!994361))

(declare-fun m!994397 () Bool)

(assert (=> b!1075179 m!994397))

(declare-fun m!994399 () Bool)

(assert (=> b!1075180 m!994399))

(declare-fun m!994401 () Bool)

(assert (=> b!1075182 m!994401))

(assert (=> d!129915 m!994301))

(assert (=> b!1075164 m!994361))

(assert (=> b!1075164 m!994361))

(assert (=> b!1075164 m!994371))

(declare-fun m!994403 () Bool)

(assert (=> bm!45372 m!994403))

(assert (=> bm!45378 m!994315))

(declare-fun m!994405 () Bool)

(assert (=> bm!45373 m!994405))

(declare-fun m!994407 () Bool)

(assert (=> b!1075170 m!994407))

(declare-fun m!994409 () Bool)

(assert (=> b!1075170 m!994409))

(declare-fun m!994411 () Bool)

(assert (=> b!1075170 m!994411))

(declare-fun m!994413 () Bool)

(assert (=> b!1075170 m!994413))

(declare-fun m!994415 () Bool)

(assert (=> b!1075170 m!994415))

(declare-fun m!994417 () Bool)

(assert (=> b!1075170 m!994417))

(assert (=> b!1075170 m!994407))

(declare-fun m!994419 () Bool)

(assert (=> b!1075170 m!994419))

(declare-fun m!994421 () Bool)

(assert (=> b!1075170 m!994421))

(assert (=> b!1075170 m!994413))

(declare-fun m!994423 () Bool)

(assert (=> b!1075170 m!994423))

(declare-fun m!994425 () Bool)

(assert (=> b!1075170 m!994425))

(declare-fun m!994427 () Bool)

(assert (=> b!1075170 m!994427))

(assert (=> b!1075170 m!994315))

(declare-fun m!994429 () Bool)

(assert (=> b!1075170 m!994429))

(assert (=> b!1075170 m!994423))

(assert (=> b!1075170 m!994361))

(assert (=> b!1075170 m!994427))

(declare-fun m!994431 () Bool)

(assert (=> b!1075170 m!994431))

(declare-fun m!994433 () Bool)

(assert (=> b!1075170 m!994433))

(declare-fun m!994435 () Bool)

(assert (=> b!1075170 m!994435))

(assert (=> b!1075031 d!129915))

(declare-fun d!129917 () Bool)

(assert (=> d!129917 (= (getCurrentListMapNoExtraKeys!3895 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3895 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476761 () Unit!35331)

(declare-fun choose!1751 (array!68947 array!68945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39761 V!39761 V!39761 V!39761 (_ BitVec 32) Int) Unit!35331)

(assert (=> d!129917 (= lt!476761 (choose!1751 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129917 (validMask!0 mask!1515)))

(assert (=> d!129917 (= (lemmaNoChangeToArrayThenSameMapNoExtras!875 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476761)))

(declare-fun bs!31671 () Bool)

(assert (= bs!31671 d!129917))

(assert (=> bs!31671 m!994315))

(assert (=> bs!31671 m!994313))

(declare-fun m!994437 () Bool)

(assert (=> bs!31671 m!994437))

(assert (=> bs!31671 m!994301))

(assert (=> b!1075032 d!129917))

(declare-fun b!1075211 () Bool)

(declare-fun e!614422 () Bool)

(declare-fun lt!476778 () ListLongMap!14563)

(declare-fun isEmpty!955 (ListLongMap!14563) Bool)

(assert (=> b!1075211 (= e!614422 (isEmpty!955 lt!476778))))

(declare-fun b!1075212 () Bool)

(assert (=> b!1075212 (= e!614422 (= lt!476778 (getCurrentListMapNoExtraKeys!3895 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075213 () Bool)

(declare-fun e!614419 () ListLongMap!14563)

(declare-fun call!45384 () ListLongMap!14563)

(assert (=> b!1075213 (= e!614419 call!45384)))

(declare-fun b!1075214 () Bool)

(declare-fun e!614423 () ListLongMap!14563)

(assert (=> b!1075214 (= e!614423 e!614419)))

(declare-fun c!108211 () Bool)

(assert (=> b!1075214 (= c!108211 (validKeyInArray!0 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075215 () Bool)

(assert (=> b!1075215 (= e!614423 (ListLongMap!14564 Nil!23140))))

(declare-fun b!1075216 () Bool)

(declare-fun e!614418 () Bool)

(assert (=> b!1075216 (= e!614418 (validKeyInArray!0 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075216 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075217 () Bool)

(assert (=> b!1075217 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(assert (=> b!1075217 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33696 _values!955)))))

(declare-fun e!614421 () Bool)

(assert (=> b!1075217 (= e!614421 (= (apply!942 lt!476778 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)) (get!17244 (select (arr!33159 _values!955) #b00000000000000000000000000000000) (dynLambda!2057 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075218 () Bool)

(declare-fun res!716687 () Bool)

(declare-fun e!614424 () Bool)

(assert (=> b!1075218 (=> (not res!716687) (not e!614424))))

(assert (=> b!1075218 (= res!716687 (not (contains!6354 lt!476778 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129919 () Bool)

(assert (=> d!129919 e!614424))

(declare-fun res!716684 () Bool)

(assert (=> d!129919 (=> (not res!716684) (not e!614424))))

(assert (=> d!129919 (= res!716684 (not (contains!6354 lt!476778 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129919 (= lt!476778 e!614423)))

(declare-fun c!108209 () Bool)

(assert (=> d!129919 (= c!108209 (bvsge #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(assert (=> d!129919 (validMask!0 mask!1515)))

(assert (=> d!129919 (= (getCurrentListMapNoExtraKeys!3895 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476778)))

(declare-fun b!1075210 () Bool)

(declare-fun lt!476777 () Unit!35331)

(declare-fun lt!476781 () Unit!35331)

(assert (=> b!1075210 (= lt!476777 lt!476781)))

(declare-fun lt!476782 () V!39761)

(declare-fun lt!476779 () (_ BitVec 64))

(declare-fun lt!476780 () (_ BitVec 64))

(declare-fun lt!476776 () ListLongMap!14563)

(assert (=> b!1075210 (not (contains!6354 (+!3235 lt!476776 (tuple2!16587 lt!476780 lt!476782)) lt!476779))))

(declare-fun addStillNotContains!263 (ListLongMap!14563 (_ BitVec 64) V!39761 (_ BitVec 64)) Unit!35331)

(assert (=> b!1075210 (= lt!476781 (addStillNotContains!263 lt!476776 lt!476780 lt!476782 lt!476779))))

(assert (=> b!1075210 (= lt!476779 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075210 (= lt!476782 (get!17244 (select (arr!33159 _values!955) #b00000000000000000000000000000000) (dynLambda!2057 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075210 (= lt!476780 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075210 (= lt!476776 call!45384)))

(assert (=> b!1075210 (= e!614419 (+!3235 call!45384 (tuple2!16587 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000) (get!17244 (select (arr!33159 _values!955) #b00000000000000000000000000000000) (dynLambda!2057 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075219 () Bool)

(declare-fun e!614420 () Bool)

(assert (=> b!1075219 (= e!614420 e!614422)))

(declare-fun c!108212 () Bool)

(assert (=> b!1075219 (= c!108212 (bvslt #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(declare-fun b!1075220 () Bool)

(assert (=> b!1075220 (= e!614424 e!614420)))

(declare-fun c!108210 () Bool)

(assert (=> b!1075220 (= c!108210 e!614418)))

(declare-fun res!716686 () Bool)

(assert (=> b!1075220 (=> (not res!716686) (not e!614418))))

(assert (=> b!1075220 (= res!716686 (bvslt #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(declare-fun bm!45381 () Bool)

(assert (=> bm!45381 (= call!45384 (getCurrentListMapNoExtraKeys!3895 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075221 () Bool)

(assert (=> b!1075221 (= e!614420 e!614421)))

(assert (=> b!1075221 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(declare-fun res!716685 () Bool)

(assert (=> b!1075221 (= res!716685 (contains!6354 lt!476778 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075221 (=> (not res!716685) (not e!614421))))

(assert (= (and d!129919 c!108209) b!1075215))

(assert (= (and d!129919 (not c!108209)) b!1075214))

(assert (= (and b!1075214 c!108211) b!1075210))

(assert (= (and b!1075214 (not c!108211)) b!1075213))

(assert (= (or b!1075210 b!1075213) bm!45381))

(assert (= (and d!129919 res!716684) b!1075218))

(assert (= (and b!1075218 res!716687) b!1075220))

(assert (= (and b!1075220 res!716686) b!1075216))

(assert (= (and b!1075220 c!108210) b!1075221))

(assert (= (and b!1075220 (not c!108210)) b!1075219))

(assert (= (and b!1075221 res!716685) b!1075217))

(assert (= (and b!1075219 c!108212) b!1075212))

(assert (= (and b!1075219 (not c!108212)) b!1075211))

(declare-fun b_lambda!16753 () Bool)

(assert (=> (not b_lambda!16753) (not b!1075217)))

(assert (=> b!1075217 t!32481))

(declare-fun b_and!35039 () Bool)

(assert (= b_and!35037 (and (=> t!32481 result!14783) b_and!35039)))

(declare-fun b_lambda!16755 () Bool)

(assert (=> (not b_lambda!16755) (not b!1075210)))

(assert (=> b!1075210 t!32481))

(declare-fun b_and!35041 () Bool)

(assert (= b_and!35039 (and (=> t!32481 result!14783) b_and!35041)))

(declare-fun m!994439 () Bool)

(assert (=> d!129919 m!994439))

(assert (=> d!129919 m!994301))

(declare-fun m!994441 () Bool)

(assert (=> b!1075218 m!994441))

(assert (=> b!1075221 m!994361))

(assert (=> b!1075221 m!994361))

(declare-fun m!994443 () Bool)

(assert (=> b!1075221 m!994443))

(assert (=> b!1075217 m!994389))

(assert (=> b!1075217 m!994385))

(assert (=> b!1075217 m!994391))

(assert (=> b!1075217 m!994361))

(declare-fun m!994445 () Bool)

(assert (=> b!1075217 m!994445))

(assert (=> b!1075217 m!994361))

(assert (=> b!1075217 m!994385))

(assert (=> b!1075217 m!994389))

(declare-fun m!994447 () Bool)

(assert (=> b!1075212 m!994447))

(assert (=> bm!45381 m!994447))

(assert (=> b!1075214 m!994361))

(assert (=> b!1075214 m!994361))

(assert (=> b!1075214 m!994371))

(assert (=> b!1075210 m!994389))

(assert (=> b!1075210 m!994385))

(assert (=> b!1075210 m!994391))

(declare-fun m!994449 () Bool)

(assert (=> b!1075210 m!994449))

(declare-fun m!994451 () Bool)

(assert (=> b!1075210 m!994451))

(assert (=> b!1075210 m!994361))

(declare-fun m!994453 () Bool)

(assert (=> b!1075210 m!994453))

(assert (=> b!1075210 m!994385))

(assert (=> b!1075210 m!994449))

(declare-fun m!994455 () Bool)

(assert (=> b!1075210 m!994455))

(assert (=> b!1075210 m!994389))

(declare-fun m!994457 () Bool)

(assert (=> b!1075211 m!994457))

(assert (=> b!1075216 m!994361))

(assert (=> b!1075216 m!994361))

(assert (=> b!1075216 m!994371))

(assert (=> b!1075032 d!129919))

(declare-fun b!1075223 () Bool)

(declare-fun e!614429 () Bool)

(declare-fun lt!476785 () ListLongMap!14563)

(assert (=> b!1075223 (= e!614429 (isEmpty!955 lt!476785))))

(declare-fun b!1075224 () Bool)

(assert (=> b!1075224 (= e!614429 (= lt!476785 (getCurrentListMapNoExtraKeys!3895 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075225 () Bool)

(declare-fun e!614426 () ListLongMap!14563)

(declare-fun call!45385 () ListLongMap!14563)

(assert (=> b!1075225 (= e!614426 call!45385)))

(declare-fun b!1075226 () Bool)

(declare-fun e!614430 () ListLongMap!14563)

(assert (=> b!1075226 (= e!614430 e!614426)))

(declare-fun c!108215 () Bool)

(assert (=> b!1075226 (= c!108215 (validKeyInArray!0 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075227 () Bool)

(assert (=> b!1075227 (= e!614430 (ListLongMap!14564 Nil!23140))))

(declare-fun b!1075228 () Bool)

(declare-fun e!614425 () Bool)

(assert (=> b!1075228 (= e!614425 (validKeyInArray!0 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075228 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075229 () Bool)

(assert (=> b!1075229 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(assert (=> b!1075229 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33696 _values!955)))))

(declare-fun e!614428 () Bool)

(assert (=> b!1075229 (= e!614428 (= (apply!942 lt!476785 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)) (get!17244 (select (arr!33159 _values!955) #b00000000000000000000000000000000) (dynLambda!2057 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075230 () Bool)

(declare-fun res!716691 () Bool)

(declare-fun e!614431 () Bool)

(assert (=> b!1075230 (=> (not res!716691) (not e!614431))))

(assert (=> b!1075230 (= res!716691 (not (contains!6354 lt!476785 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129921 () Bool)

(assert (=> d!129921 e!614431))

(declare-fun res!716688 () Bool)

(assert (=> d!129921 (=> (not res!716688) (not e!614431))))

(assert (=> d!129921 (= res!716688 (not (contains!6354 lt!476785 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129921 (= lt!476785 e!614430)))

(declare-fun c!108213 () Bool)

(assert (=> d!129921 (= c!108213 (bvsge #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(assert (=> d!129921 (validMask!0 mask!1515)))

(assert (=> d!129921 (= (getCurrentListMapNoExtraKeys!3895 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476785)))

(declare-fun b!1075222 () Bool)

(declare-fun lt!476784 () Unit!35331)

(declare-fun lt!476788 () Unit!35331)

(assert (=> b!1075222 (= lt!476784 lt!476788)))

(declare-fun lt!476787 () (_ BitVec 64))

(declare-fun lt!476786 () (_ BitVec 64))

(declare-fun lt!476783 () ListLongMap!14563)

(declare-fun lt!476789 () V!39761)

(assert (=> b!1075222 (not (contains!6354 (+!3235 lt!476783 (tuple2!16587 lt!476787 lt!476789)) lt!476786))))

(assert (=> b!1075222 (= lt!476788 (addStillNotContains!263 lt!476783 lt!476787 lt!476789 lt!476786))))

(assert (=> b!1075222 (= lt!476786 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075222 (= lt!476789 (get!17244 (select (arr!33159 _values!955) #b00000000000000000000000000000000) (dynLambda!2057 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075222 (= lt!476787 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075222 (= lt!476783 call!45385)))

(assert (=> b!1075222 (= e!614426 (+!3235 call!45385 (tuple2!16587 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000) (get!17244 (select (arr!33159 _values!955) #b00000000000000000000000000000000) (dynLambda!2057 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075231 () Bool)

(declare-fun e!614427 () Bool)

(assert (=> b!1075231 (= e!614427 e!614429)))

(declare-fun c!108216 () Bool)

(assert (=> b!1075231 (= c!108216 (bvslt #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(declare-fun b!1075232 () Bool)

(assert (=> b!1075232 (= e!614431 e!614427)))

(declare-fun c!108214 () Bool)

(assert (=> b!1075232 (= c!108214 e!614425)))

(declare-fun res!716690 () Bool)

(assert (=> b!1075232 (=> (not res!716690) (not e!614425))))

(assert (=> b!1075232 (= res!716690 (bvslt #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(declare-fun bm!45382 () Bool)

(assert (=> bm!45382 (= call!45385 (getCurrentListMapNoExtraKeys!3895 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075233 () Bool)

(assert (=> b!1075233 (= e!614427 e!614428)))

(assert (=> b!1075233 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33697 _keys!1163)))))

(declare-fun res!716689 () Bool)

(assert (=> b!1075233 (= res!716689 (contains!6354 lt!476785 (select (arr!33160 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075233 (=> (not res!716689) (not e!614428))))

(assert (= (and d!129921 c!108213) b!1075227))

(assert (= (and d!129921 (not c!108213)) b!1075226))

(assert (= (and b!1075226 c!108215) b!1075222))

(assert (= (and b!1075226 (not c!108215)) b!1075225))

(assert (= (or b!1075222 b!1075225) bm!45382))

(assert (= (and d!129921 res!716688) b!1075230))

(assert (= (and b!1075230 res!716691) b!1075232))

(assert (= (and b!1075232 res!716690) b!1075228))

(assert (= (and b!1075232 c!108214) b!1075233))

(assert (= (and b!1075232 (not c!108214)) b!1075231))

(assert (= (and b!1075233 res!716689) b!1075229))

(assert (= (and b!1075231 c!108216) b!1075224))

(assert (= (and b!1075231 (not c!108216)) b!1075223))

(declare-fun b_lambda!16757 () Bool)

(assert (=> (not b_lambda!16757) (not b!1075229)))

(assert (=> b!1075229 t!32481))

(declare-fun b_and!35043 () Bool)

(assert (= b_and!35041 (and (=> t!32481 result!14783) b_and!35043)))

(declare-fun b_lambda!16759 () Bool)

(assert (=> (not b_lambda!16759) (not b!1075222)))

(assert (=> b!1075222 t!32481))

(declare-fun b_and!35045 () Bool)

(assert (= b_and!35043 (and (=> t!32481 result!14783) b_and!35045)))

(declare-fun m!994459 () Bool)

(assert (=> d!129921 m!994459))

(assert (=> d!129921 m!994301))

(declare-fun m!994461 () Bool)

(assert (=> b!1075230 m!994461))

(assert (=> b!1075233 m!994361))

(assert (=> b!1075233 m!994361))

(declare-fun m!994463 () Bool)

(assert (=> b!1075233 m!994463))

(assert (=> b!1075229 m!994389))

(assert (=> b!1075229 m!994385))

(assert (=> b!1075229 m!994391))

(assert (=> b!1075229 m!994361))

(declare-fun m!994465 () Bool)

(assert (=> b!1075229 m!994465))

(assert (=> b!1075229 m!994361))

(assert (=> b!1075229 m!994385))

(assert (=> b!1075229 m!994389))

(declare-fun m!994467 () Bool)

(assert (=> b!1075224 m!994467))

(assert (=> bm!45382 m!994467))

(assert (=> b!1075226 m!994361))

(assert (=> b!1075226 m!994361))

(assert (=> b!1075226 m!994371))

(assert (=> b!1075222 m!994389))

(assert (=> b!1075222 m!994385))

(assert (=> b!1075222 m!994391))

(declare-fun m!994469 () Bool)

(assert (=> b!1075222 m!994469))

(declare-fun m!994471 () Bool)

(assert (=> b!1075222 m!994471))

(assert (=> b!1075222 m!994361))

(declare-fun m!994473 () Bool)

(assert (=> b!1075222 m!994473))

(assert (=> b!1075222 m!994385))

(assert (=> b!1075222 m!994469))

(declare-fun m!994475 () Bool)

(assert (=> b!1075222 m!994475))

(assert (=> b!1075222 m!994389))

(declare-fun m!994477 () Bool)

(assert (=> b!1075223 m!994477))

(assert (=> b!1075228 m!994361))

(assert (=> b!1075228 m!994361))

(assert (=> b!1075228 m!994371))

(assert (=> b!1075032 d!129921))

(declare-fun b!1075240 () Bool)

(declare-fun e!614436 () Bool)

(assert (=> b!1075240 (= e!614436 tp_is_empty!25969)))

(declare-fun b!1075241 () Bool)

(declare-fun e!614437 () Bool)

(assert (=> b!1075241 (= e!614437 tp_is_empty!25969)))

(declare-fun mapIsEmpty!40678 () Bool)

(declare-fun mapRes!40678 () Bool)

(assert (=> mapIsEmpty!40678 mapRes!40678))

(declare-fun mapNonEmpty!40678 () Bool)

(declare-fun tp!77960 () Bool)

(assert (=> mapNonEmpty!40678 (= mapRes!40678 (and tp!77960 e!614436))))

(declare-fun mapValue!40678 () ValueCell!12281)

(declare-fun mapKey!40678 () (_ BitVec 32))

(declare-fun mapRest!40678 () (Array (_ BitVec 32) ValueCell!12281))

(assert (=> mapNonEmpty!40678 (= mapRest!40669 (store mapRest!40678 mapKey!40678 mapValue!40678))))

(declare-fun condMapEmpty!40678 () Bool)

(declare-fun mapDefault!40678 () ValueCell!12281)

(assert (=> mapNonEmpty!40669 (= condMapEmpty!40678 (= mapRest!40669 ((as const (Array (_ BitVec 32) ValueCell!12281)) mapDefault!40678)))))

(assert (=> mapNonEmpty!40669 (= tp!77945 (and e!614437 mapRes!40678))))

(assert (= (and mapNonEmpty!40669 condMapEmpty!40678) mapIsEmpty!40678))

(assert (= (and mapNonEmpty!40669 (not condMapEmpty!40678)) mapNonEmpty!40678))

(assert (= (and mapNonEmpty!40678 ((_ is ValueCellFull!12281) mapValue!40678)) b!1075240))

(assert (= (and mapNonEmpty!40669 ((_ is ValueCellFull!12281) mapDefault!40678)) b!1075241))

(declare-fun m!994479 () Bool)

(assert (=> mapNonEmpty!40678 m!994479))

(declare-fun b_lambda!16761 () Bool)

(assert (= b_lambda!16759 (or (and start!95202 b_free!22159) b_lambda!16761)))

(declare-fun b_lambda!16763 () Bool)

(assert (= b_lambda!16757 (or (and start!95202 b_free!22159) b_lambda!16763)))

(declare-fun b_lambda!16765 () Bool)

(assert (= b_lambda!16751 (or (and start!95202 b_free!22159) b_lambda!16765)))

(declare-fun b_lambda!16767 () Bool)

(assert (= b_lambda!16753 (or (and start!95202 b_free!22159) b_lambda!16767)))

(declare-fun b_lambda!16769 () Bool)

(assert (= b_lambda!16755 (or (and start!95202 b_free!22159) b_lambda!16769)))

(check-sat (not d!129921) (not b!1075175) (not bm!45381) (not b!1075164) (not b!1075178) (not b!1075211) (not b!1075229) (not mapNonEmpty!40678) (not b!1075228) (not b_lambda!16763) (not b!1075120) (not bm!45372) (not b!1075212) (not b_lambda!16765) (not d!129915) (not b!1075216) (not b!1075223) b_and!35045 (not bm!45373) (not b!1075214) tp_is_empty!25969 (not b!1075180) (not b!1075111) (not b!1075230) (not b!1075179) (not b!1075182) (not b!1075096) (not b!1075226) (not bm!45354) (not b!1075221) (not bm!45357) (not bm!45376) (not b_lambda!16761) (not d!129913) (not d!129919) (not b!1075233) (not b!1075094) (not b_next!22159) (not b_lambda!16769) (not bm!45378) (not b!1075107) (not b!1075170) (not bm!45382) (not b!1075218) (not b!1075163) (not b!1075118) (not b!1075217) (not d!129917) (not b!1075210) (not b!1075222) (not b!1075108) (not b_lambda!16767) (not b!1075224))
(check-sat b_and!35045 (not b_next!22159))
