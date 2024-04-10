; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95106 () Bool)

(assert start!95106)

(declare-fun b_free!22203 () Bool)

(declare-fun b_next!22203 () Bool)

(assert (=> start!95106 (= b_free!22203 (not b_next!22203))))

(declare-fun tp!78091 () Bool)

(declare-fun b_and!35123 () Bool)

(assert (=> start!95106 (= tp!78091 b_and!35123)))

(declare-fun b!1075135 () Bool)

(declare-fun e!614425 () Bool)

(declare-fun tp_is_empty!26013 () Bool)

(assert (=> b!1075135 (= e!614425 tp_is_empty!26013)))

(declare-fun b!1075136 () Bool)

(declare-fun res!716794 () Bool)

(declare-fun e!614426 () Bool)

(assert (=> b!1075136 (=> (not res!716794) (not e!614426))))

(declare-datatypes ((array!68993 0))(
  ( (array!68994 (arr!33184 (Array (_ BitVec 32) (_ BitVec 64))) (size!33720 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68993)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68993 (_ BitVec 32)) Bool)

(assert (=> b!1075136 (= res!716794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!716796 () Bool)

(assert (=> start!95106 (=> (not res!716796) (not e!614426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95106 (= res!716796 (validMask!0 mask!1515))))

(assert (=> start!95106 e!614426))

(assert (=> start!95106 true))

(assert (=> start!95106 tp_is_empty!26013))

(declare-datatypes ((V!39819 0))(
  ( (V!39820 (val!13057 Int)) )
))
(declare-datatypes ((ValueCell!12303 0))(
  ( (ValueCellFull!12303 (v!15680 V!39819)) (EmptyCell!12303) )
))
(declare-datatypes ((array!68995 0))(
  ( (array!68996 (arr!33185 (Array (_ BitVec 32) ValueCell!12303)) (size!33721 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68995)

(declare-fun e!614423 () Bool)

(declare-fun array_inv!25644 (array!68995) Bool)

(assert (=> start!95106 (and (array_inv!25644 _values!955) e!614423)))

(assert (=> start!95106 tp!78091))

(declare-fun array_inv!25645 (array!68993) Bool)

(assert (=> start!95106 (array_inv!25645 _keys!1163)))

(declare-fun zeroValueBefore!47 () V!39819)

(declare-fun b!1075137 () Bool)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39819)

(declare-fun e!614424 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((tuple2!16636 0))(
  ( (tuple2!16637 (_1!8329 (_ BitVec 64)) (_2!8329 V!39819)) )
))
(declare-datatypes ((List!23171 0))(
  ( (Nil!23168) (Cons!23167 (h!24376 tuple2!16636) (t!32520 List!23171)) )
))
(declare-datatypes ((ListLongMap!14605 0))(
  ( (ListLongMap!14606 (toList!7318 List!23171)) )
))
(declare-fun contains!6345 (ListLongMap!14605 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4187 (array!68993 array!68995 (_ BitVec 32) (_ BitVec 32) V!39819 V!39819 (_ BitVec 32) Int) ListLongMap!14605)

(assert (=> b!1075137 (= e!614424 (not (contains!6345 (getCurrentListMap!4187 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075138 () Bool)

(declare-fun e!614427 () Bool)

(assert (=> b!1075138 (= e!614427 tp_is_empty!26013)))

(declare-fun b!1075139 () Bool)

(assert (=> b!1075139 (= e!614426 (not e!614424))))

(declare-fun res!716793 () Bool)

(assert (=> b!1075139 (=> res!716793 e!614424)))

(assert (=> b!1075139 (= res!716793 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!477166 () ListLongMap!14605)

(declare-fun lt!477165 () ListLongMap!14605)

(assert (=> b!1075139 (= lt!477166 lt!477165)))

(declare-datatypes ((Unit!35402 0))(
  ( (Unit!35403) )
))
(declare-fun lt!477167 () Unit!35402)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39819)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!896 (array!68993 array!68995 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39819 V!39819 V!39819 V!39819 (_ BitVec 32) Int) Unit!35402)

(assert (=> b!1075139 (= lt!477167 (lemmaNoChangeToArrayThenSameMapNoExtras!896 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3880 (array!68993 array!68995 (_ BitVec 32) (_ BitVec 32) V!39819 V!39819 (_ BitVec 32) Int) ListLongMap!14605)

(assert (=> b!1075139 (= lt!477165 (getCurrentListMapNoExtraKeys!3880 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075139 (= lt!477166 (getCurrentListMapNoExtraKeys!3880 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40750 () Bool)

(declare-fun mapRes!40750 () Bool)

(declare-fun tp!78092 () Bool)

(assert (=> mapNonEmpty!40750 (= mapRes!40750 (and tp!78092 e!614425))))

(declare-fun mapRest!40750 () (Array (_ BitVec 32) ValueCell!12303))

(declare-fun mapKey!40750 () (_ BitVec 32))

(declare-fun mapValue!40750 () ValueCell!12303)

(assert (=> mapNonEmpty!40750 (= (arr!33185 _values!955) (store mapRest!40750 mapKey!40750 mapValue!40750))))

(declare-fun b!1075140 () Bool)

(declare-fun res!716797 () Bool)

(assert (=> b!1075140 (=> (not res!716797) (not e!614426))))

(assert (=> b!1075140 (= res!716797 (and (= (size!33721 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33720 _keys!1163) (size!33721 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075141 () Bool)

(assert (=> b!1075141 (= e!614423 (and e!614427 mapRes!40750))))

(declare-fun condMapEmpty!40750 () Bool)

(declare-fun mapDefault!40750 () ValueCell!12303)

(assert (=> b!1075141 (= condMapEmpty!40750 (= (arr!33185 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12303)) mapDefault!40750)))))

(declare-fun mapIsEmpty!40750 () Bool)

(assert (=> mapIsEmpty!40750 mapRes!40750))

(declare-fun b!1075142 () Bool)

(declare-fun res!716795 () Bool)

(assert (=> b!1075142 (=> (not res!716795) (not e!614426))))

(declare-datatypes ((List!23172 0))(
  ( (Nil!23169) (Cons!23168 (h!24377 (_ BitVec 64)) (t!32521 List!23172)) )
))
(declare-fun arrayNoDuplicates!0 (array!68993 (_ BitVec 32) List!23172) Bool)

(assert (=> b!1075142 (= res!716795 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23169))))

(assert (= (and start!95106 res!716796) b!1075140))

(assert (= (and b!1075140 res!716797) b!1075136))

(assert (= (and b!1075136 res!716794) b!1075142))

(assert (= (and b!1075142 res!716795) b!1075139))

(assert (= (and b!1075139 (not res!716793)) b!1075137))

(assert (= (and b!1075141 condMapEmpty!40750) mapIsEmpty!40750))

(assert (= (and b!1075141 (not condMapEmpty!40750)) mapNonEmpty!40750))

(get-info :version)

(assert (= (and mapNonEmpty!40750 ((_ is ValueCellFull!12303) mapValue!40750)) b!1075135))

(assert (= (and b!1075141 ((_ is ValueCellFull!12303) mapDefault!40750)) b!1075138))

(assert (= start!95106 b!1075141))

(declare-fun m!994007 () Bool)

(assert (=> b!1075136 m!994007))

(declare-fun m!994009 () Bool)

(assert (=> start!95106 m!994009))

(declare-fun m!994011 () Bool)

(assert (=> start!95106 m!994011))

(declare-fun m!994013 () Bool)

(assert (=> start!95106 m!994013))

(declare-fun m!994015 () Bool)

(assert (=> b!1075139 m!994015))

(declare-fun m!994017 () Bool)

(assert (=> b!1075139 m!994017))

(declare-fun m!994019 () Bool)

(assert (=> b!1075139 m!994019))

(declare-fun m!994021 () Bool)

(assert (=> b!1075137 m!994021))

(assert (=> b!1075137 m!994021))

(declare-fun m!994023 () Bool)

(assert (=> b!1075137 m!994023))

(declare-fun m!994025 () Bool)

(assert (=> mapNonEmpty!40750 m!994025))

(declare-fun m!994027 () Bool)

(assert (=> b!1075142 m!994027))

(check-sat (not b!1075137) (not b!1075142) (not b!1075139) (not start!95106) (not b!1075136) (not b_next!22203) (not mapNonEmpty!40750) tp_is_empty!26013 b_and!35123)
(check-sat b_and!35123 (not b_next!22203))
(get-model)

(declare-fun d!129567 () Bool)

(assert (=> d!129567 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95106 d!129567))

(declare-fun d!129569 () Bool)

(assert (=> d!129569 (= (array_inv!25644 _values!955) (bvsge (size!33721 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95106 d!129569))

(declare-fun d!129571 () Bool)

(assert (=> d!129571 (= (array_inv!25645 _keys!1163) (bvsge (size!33720 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95106 d!129571))

(declare-fun d!129573 () Bool)

(declare-fun e!614451 () Bool)

(assert (=> d!129573 e!614451))

(declare-fun res!716815 () Bool)

(assert (=> d!129573 (=> res!716815 e!614451)))

(declare-fun lt!477185 () Bool)

(assert (=> d!129573 (= res!716815 (not lt!477185))))

(declare-fun lt!477188 () Bool)

(assert (=> d!129573 (= lt!477185 lt!477188)))

(declare-fun lt!477187 () Unit!35402)

(declare-fun e!614450 () Unit!35402)

(assert (=> d!129573 (= lt!477187 e!614450)))

(declare-fun c!107999 () Bool)

(assert (=> d!129573 (= c!107999 lt!477188)))

(declare-fun containsKey!579 (List!23171 (_ BitVec 64)) Bool)

(assert (=> d!129573 (= lt!477188 (containsKey!579 (toList!7318 (getCurrentListMap!4187 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129573 (= (contains!6345 (getCurrentListMap!4187 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000) lt!477185)))

(declare-fun b!1075173 () Bool)

(declare-fun lt!477186 () Unit!35402)

(assert (=> b!1075173 (= e!614450 lt!477186)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!412 (List!23171 (_ BitVec 64)) Unit!35402)

(assert (=> b!1075173 (= lt!477186 (lemmaContainsKeyImpliesGetValueByKeyDefined!412 (toList!7318 (getCurrentListMap!4187 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!661 0))(
  ( (Some!660 (v!15682 V!39819)) (None!659) )
))
(declare-fun isDefined!451 (Option!661) Bool)

(declare-fun getValueByKey!610 (List!23171 (_ BitVec 64)) Option!661)

(assert (=> b!1075173 (isDefined!451 (getValueByKey!610 (toList!7318 (getCurrentListMap!4187 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075174 () Bool)

(declare-fun Unit!35404 () Unit!35402)

(assert (=> b!1075174 (= e!614450 Unit!35404)))

(declare-fun b!1075175 () Bool)

(assert (=> b!1075175 (= e!614451 (isDefined!451 (getValueByKey!610 (toList!7318 (getCurrentListMap!4187 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129573 c!107999) b!1075173))

(assert (= (and d!129573 (not c!107999)) b!1075174))

(assert (= (and d!129573 (not res!716815)) b!1075175))

(declare-fun m!994051 () Bool)

(assert (=> d!129573 m!994051))

(declare-fun m!994053 () Bool)

(assert (=> b!1075173 m!994053))

(declare-fun m!994055 () Bool)

(assert (=> b!1075173 m!994055))

(assert (=> b!1075173 m!994055))

(declare-fun m!994057 () Bool)

(assert (=> b!1075173 m!994057))

(assert (=> b!1075175 m!994055))

(assert (=> b!1075175 m!994055))

(assert (=> b!1075175 m!994057))

(assert (=> b!1075137 d!129573))

(declare-fun bm!45482 () Bool)

(declare-fun call!45488 () ListLongMap!14605)

(declare-fun call!45487 () ListLongMap!14605)

(assert (=> bm!45482 (= call!45488 call!45487)))

(declare-fun b!1075218 () Bool)

(declare-fun e!614480 () Unit!35402)

(declare-fun Unit!35405 () Unit!35402)

(assert (=> b!1075218 (= e!614480 Unit!35405)))

(declare-fun bm!45483 () Bool)

(declare-fun call!45490 () ListLongMap!14605)

(assert (=> bm!45483 (= call!45490 call!45488)))

(declare-fun b!1075219 () Bool)

(declare-fun e!614478 () Bool)

(declare-fun lt!477237 () ListLongMap!14605)

(declare-fun apply!938 (ListLongMap!14605 (_ BitVec 64)) V!39819)

(assert (=> b!1075219 (= e!614478 (= (apply!938 lt!477237 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1075220 () Bool)

(declare-fun e!614482 () Bool)

(declare-fun e!614479 () Bool)

(assert (=> b!1075220 (= e!614482 e!614479)))

(declare-fun res!716837 () Bool)

(assert (=> b!1075220 (=> (not res!716837) (not e!614479))))

(assert (=> b!1075220 (= res!716837 (contains!6345 lt!477237 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075220 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(declare-fun bm!45484 () Bool)

(declare-fun call!45486 () ListLongMap!14605)

(declare-fun call!45489 () ListLongMap!14605)

(assert (=> bm!45484 (= call!45486 call!45489)))

(declare-fun bm!45485 () Bool)

(assert (=> bm!45485 (= call!45487 (getCurrentListMapNoExtraKeys!3880 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun bm!45486 () Bool)

(declare-fun call!45485 () Bool)

(assert (=> bm!45486 (= call!45485 (contains!6345 lt!477237 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075221 () Bool)

(declare-fun res!716840 () Bool)

(declare-fun e!614483 () Bool)

(assert (=> b!1075221 (=> (not res!716840) (not e!614483))))

(assert (=> b!1075221 (= res!716840 e!614482)))

(declare-fun res!716834 () Bool)

(assert (=> b!1075221 (=> res!716834 e!614482)))

(declare-fun e!614489 () Bool)

(assert (=> b!1075221 (= res!716834 (not e!614489))))

(declare-fun res!716839 () Bool)

(assert (=> b!1075221 (=> (not res!716839) (not e!614489))))

(assert (=> b!1075221 (= res!716839 (bvslt #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(declare-fun b!1075222 () Bool)

(declare-fun e!614486 () ListLongMap!14605)

(declare-fun e!614484 () ListLongMap!14605)

(assert (=> b!1075222 (= e!614486 e!614484)))

(declare-fun c!108016 () Bool)

(assert (=> b!1075222 (= c!108016 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!129575 () Bool)

(assert (=> d!129575 e!614483))

(declare-fun res!716842 () Bool)

(assert (=> d!129575 (=> (not res!716842) (not e!614483))))

(assert (=> d!129575 (= res!716842 (or (bvsge #b00000000000000000000000000000000 (size!33720 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33720 _keys!1163)))))))

(declare-fun lt!477236 () ListLongMap!14605)

(assert (=> d!129575 (= lt!477237 lt!477236)))

(declare-fun lt!477245 () Unit!35402)

(assert (=> d!129575 (= lt!477245 e!614480)))

(declare-fun c!108017 () Bool)

(declare-fun e!614490 () Bool)

(assert (=> d!129575 (= c!108017 e!614490)))

(declare-fun res!716841 () Bool)

(assert (=> d!129575 (=> (not res!716841) (not e!614490))))

(assert (=> d!129575 (= res!716841 (bvslt #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(assert (=> d!129575 (= lt!477236 e!614486)))

(declare-fun c!108014 () Bool)

(assert (=> d!129575 (= c!108014 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129575 (validMask!0 mask!1515)))

(assert (=> d!129575 (= (getCurrentListMap!4187 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477237)))

(declare-fun b!1075223 () Bool)

(declare-fun e!614488 () ListLongMap!14605)

(assert (=> b!1075223 (= e!614488 call!45486)))

(declare-fun b!1075224 () Bool)

(assert (=> b!1075224 (= e!614488 call!45490)))

(declare-fun b!1075225 () Bool)

(assert (=> b!1075225 (= e!614484 call!45486)))

(declare-fun b!1075226 () Bool)

(declare-fun +!3225 (ListLongMap!14605 tuple2!16636) ListLongMap!14605)

(assert (=> b!1075226 (= e!614486 (+!3225 call!45489 (tuple2!16637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1075227 () Bool)

(declare-fun e!614487 () Bool)

(assert (=> b!1075227 (= e!614487 e!614478)))

(declare-fun res!716838 () Bool)

(assert (=> b!1075227 (= res!716838 call!45485)))

(assert (=> b!1075227 (=> (not res!716838) (not e!614478))))

(declare-fun b!1075228 () Bool)

(declare-fun get!17234 (ValueCell!12303 V!39819) V!39819)

(declare-fun dynLambda!2045 (Int (_ BitVec 64)) V!39819)

(assert (=> b!1075228 (= e!614479 (= (apply!938 lt!477237 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)) (get!17234 (select (arr!33185 _values!955) #b00000000000000000000000000000000) (dynLambda!2045 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075228 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33721 _values!955)))))

(assert (=> b!1075228 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(declare-fun b!1075229 () Bool)

(declare-fun lt!477242 () Unit!35402)

(assert (=> b!1075229 (= e!614480 lt!477242)))

(declare-fun lt!477253 () ListLongMap!14605)

(assert (=> b!1075229 (= lt!477253 (getCurrentListMapNoExtraKeys!3880 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477249 () (_ BitVec 64))

(assert (=> b!1075229 (= lt!477249 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477233 () (_ BitVec 64))

(assert (=> b!1075229 (= lt!477233 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477240 () Unit!35402)

(declare-fun addStillContains!651 (ListLongMap!14605 (_ BitVec 64) V!39819 (_ BitVec 64)) Unit!35402)

(assert (=> b!1075229 (= lt!477240 (addStillContains!651 lt!477253 lt!477249 zeroValueBefore!47 lt!477233))))

(assert (=> b!1075229 (contains!6345 (+!3225 lt!477253 (tuple2!16637 lt!477249 zeroValueBefore!47)) lt!477233)))

(declare-fun lt!477254 () Unit!35402)

(assert (=> b!1075229 (= lt!477254 lt!477240)))

(declare-fun lt!477241 () ListLongMap!14605)

(assert (=> b!1075229 (= lt!477241 (getCurrentListMapNoExtraKeys!3880 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477235 () (_ BitVec 64))

(assert (=> b!1075229 (= lt!477235 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477252 () (_ BitVec 64))

(assert (=> b!1075229 (= lt!477252 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477238 () Unit!35402)

(declare-fun addApplyDifferent!511 (ListLongMap!14605 (_ BitVec 64) V!39819 (_ BitVec 64)) Unit!35402)

(assert (=> b!1075229 (= lt!477238 (addApplyDifferent!511 lt!477241 lt!477235 minValue!907 lt!477252))))

(assert (=> b!1075229 (= (apply!938 (+!3225 lt!477241 (tuple2!16637 lt!477235 minValue!907)) lt!477252) (apply!938 lt!477241 lt!477252))))

(declare-fun lt!477234 () Unit!35402)

(assert (=> b!1075229 (= lt!477234 lt!477238)))

(declare-fun lt!477243 () ListLongMap!14605)

(assert (=> b!1075229 (= lt!477243 (getCurrentListMapNoExtraKeys!3880 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477246 () (_ BitVec 64))

(assert (=> b!1075229 (= lt!477246 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477244 () (_ BitVec 64))

(assert (=> b!1075229 (= lt!477244 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477248 () Unit!35402)

(assert (=> b!1075229 (= lt!477248 (addApplyDifferent!511 lt!477243 lt!477246 zeroValueBefore!47 lt!477244))))

(assert (=> b!1075229 (= (apply!938 (+!3225 lt!477243 (tuple2!16637 lt!477246 zeroValueBefore!47)) lt!477244) (apply!938 lt!477243 lt!477244))))

(declare-fun lt!477251 () Unit!35402)

(assert (=> b!1075229 (= lt!477251 lt!477248)))

(declare-fun lt!477247 () ListLongMap!14605)

(assert (=> b!1075229 (= lt!477247 (getCurrentListMapNoExtraKeys!3880 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477239 () (_ BitVec 64))

(assert (=> b!1075229 (= lt!477239 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477250 () (_ BitVec 64))

(assert (=> b!1075229 (= lt!477250 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075229 (= lt!477242 (addApplyDifferent!511 lt!477247 lt!477239 minValue!907 lt!477250))))

(assert (=> b!1075229 (= (apply!938 (+!3225 lt!477247 (tuple2!16637 lt!477239 minValue!907)) lt!477250) (apply!938 lt!477247 lt!477250))))

(declare-fun b!1075230 () Bool)

(assert (=> b!1075230 (= e!614487 (not call!45485))))

(declare-fun b!1075231 () Bool)

(declare-fun e!614481 () Bool)

(assert (=> b!1075231 (= e!614483 e!614481)))

(declare-fun c!108013 () Bool)

(assert (=> b!1075231 (= c!108013 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075232 () Bool)

(declare-fun call!45491 () Bool)

(assert (=> b!1075232 (= e!614481 (not call!45491))))

(declare-fun b!1075233 () Bool)

(declare-fun res!716836 () Bool)

(assert (=> b!1075233 (=> (not res!716836) (not e!614483))))

(assert (=> b!1075233 (= res!716836 e!614487)))

(declare-fun c!108015 () Bool)

(assert (=> b!1075233 (= c!108015 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075234 () Bool)

(declare-fun c!108012 () Bool)

(assert (=> b!1075234 (= c!108012 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1075234 (= e!614484 e!614488)))

(declare-fun b!1075235 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1075235 (= e!614490 (validKeyInArray!0 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075236 () Bool)

(declare-fun e!614485 () Bool)

(assert (=> b!1075236 (= e!614485 (= (apply!938 lt!477237 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45487 () Bool)

(assert (=> bm!45487 (= call!45491 (contains!6345 lt!477237 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45488 () Bool)

(assert (=> bm!45488 (= call!45489 (+!3225 (ite c!108014 call!45487 (ite c!108016 call!45488 call!45490)) (ite (or c!108014 c!108016) (tuple2!16637 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075237 () Bool)

(assert (=> b!1075237 (= e!614481 e!614485)))

(declare-fun res!716835 () Bool)

(assert (=> b!1075237 (= res!716835 call!45491)))

(assert (=> b!1075237 (=> (not res!716835) (not e!614485))))

(declare-fun b!1075238 () Bool)

(assert (=> b!1075238 (= e!614489 (validKeyInArray!0 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129575 c!108014) b!1075226))

(assert (= (and d!129575 (not c!108014)) b!1075222))

(assert (= (and b!1075222 c!108016) b!1075225))

(assert (= (and b!1075222 (not c!108016)) b!1075234))

(assert (= (and b!1075234 c!108012) b!1075223))

(assert (= (and b!1075234 (not c!108012)) b!1075224))

(assert (= (or b!1075223 b!1075224) bm!45483))

(assert (= (or b!1075225 bm!45483) bm!45482))

(assert (= (or b!1075225 b!1075223) bm!45484))

(assert (= (or b!1075226 bm!45482) bm!45485))

(assert (= (or b!1075226 bm!45484) bm!45488))

(assert (= (and d!129575 res!716841) b!1075235))

(assert (= (and d!129575 c!108017) b!1075229))

(assert (= (and d!129575 (not c!108017)) b!1075218))

(assert (= (and d!129575 res!716842) b!1075221))

(assert (= (and b!1075221 res!716839) b!1075238))

(assert (= (and b!1075221 (not res!716834)) b!1075220))

(assert (= (and b!1075220 res!716837) b!1075228))

(assert (= (and b!1075221 res!716840) b!1075233))

(assert (= (and b!1075233 c!108015) b!1075227))

(assert (= (and b!1075233 (not c!108015)) b!1075230))

(assert (= (and b!1075227 res!716838) b!1075219))

(assert (= (or b!1075227 b!1075230) bm!45486))

(assert (= (and b!1075233 res!716836) b!1075231))

(assert (= (and b!1075231 c!108013) b!1075237))

(assert (= (and b!1075231 (not c!108013)) b!1075232))

(assert (= (and b!1075237 res!716835) b!1075236))

(assert (= (or b!1075237 b!1075232) bm!45487))

(declare-fun b_lambda!16857 () Bool)

(assert (=> (not b_lambda!16857) (not b!1075228)))

(declare-fun t!32524 () Bool)

(declare-fun tb!7171 () Bool)

(assert (=> (and start!95106 (= defaultEntry!963 defaultEntry!963) t!32524) tb!7171))

(declare-fun result!14821 () Bool)

(assert (=> tb!7171 (= result!14821 tp_is_empty!26013)))

(assert (=> b!1075228 t!32524))

(declare-fun b_and!35127 () Bool)

(assert (= b_and!35123 (and (=> t!32524 result!14821) b_and!35127)))

(declare-fun m!994059 () Bool)

(assert (=> b!1075236 m!994059))

(declare-fun m!994061 () Bool)

(assert (=> bm!45486 m!994061))

(declare-fun m!994063 () Bool)

(assert (=> bm!45488 m!994063))

(assert (=> bm!45485 m!994019))

(declare-fun m!994065 () Bool)

(assert (=> b!1075226 m!994065))

(declare-fun m!994067 () Bool)

(assert (=> b!1075228 m!994067))

(assert (=> b!1075228 m!994067))

(declare-fun m!994069 () Bool)

(assert (=> b!1075228 m!994069))

(declare-fun m!994071 () Bool)

(assert (=> b!1075228 m!994071))

(declare-fun m!994073 () Bool)

(assert (=> b!1075228 m!994073))

(declare-fun m!994075 () Bool)

(assert (=> b!1075228 m!994075))

(assert (=> b!1075228 m!994073))

(assert (=> b!1075228 m!994071))

(declare-fun m!994077 () Bool)

(assert (=> b!1075219 m!994077))

(assert (=> d!129575 m!994009))

(declare-fun m!994079 () Bool)

(assert (=> b!1075229 m!994079))

(declare-fun m!994081 () Bool)

(assert (=> b!1075229 m!994081))

(declare-fun m!994083 () Bool)

(assert (=> b!1075229 m!994083))

(declare-fun m!994085 () Bool)

(assert (=> b!1075229 m!994085))

(declare-fun m!994087 () Bool)

(assert (=> b!1075229 m!994087))

(declare-fun m!994089 () Bool)

(assert (=> b!1075229 m!994089))

(declare-fun m!994091 () Bool)

(assert (=> b!1075229 m!994091))

(declare-fun m!994093 () Bool)

(assert (=> b!1075229 m!994093))

(declare-fun m!994095 () Bool)

(assert (=> b!1075229 m!994095))

(assert (=> b!1075229 m!994079))

(assert (=> b!1075229 m!994019))

(declare-fun m!994097 () Bool)

(assert (=> b!1075229 m!994097))

(assert (=> b!1075229 m!994067))

(declare-fun m!994099 () Bool)

(assert (=> b!1075229 m!994099))

(assert (=> b!1075229 m!994097))

(declare-fun m!994101 () Bool)

(assert (=> b!1075229 m!994101))

(declare-fun m!994103 () Bool)

(assert (=> b!1075229 m!994103))

(assert (=> b!1075229 m!994085))

(declare-fun m!994105 () Bool)

(assert (=> b!1075229 m!994105))

(assert (=> b!1075229 m!994089))

(declare-fun m!994107 () Bool)

(assert (=> b!1075229 m!994107))

(assert (=> b!1075220 m!994067))

(assert (=> b!1075220 m!994067))

(declare-fun m!994109 () Bool)

(assert (=> b!1075220 m!994109))

(declare-fun m!994111 () Bool)

(assert (=> bm!45487 m!994111))

(assert (=> b!1075238 m!994067))

(assert (=> b!1075238 m!994067))

(declare-fun m!994113 () Bool)

(assert (=> b!1075238 m!994113))

(assert (=> b!1075235 m!994067))

(assert (=> b!1075235 m!994067))

(assert (=> b!1075235 m!994113))

(assert (=> b!1075137 d!129575))

(declare-fun b!1075249 () Bool)

(declare-fun e!614498 () Bool)

(declare-fun call!45494 () Bool)

(assert (=> b!1075249 (= e!614498 call!45494)))

(declare-fun b!1075250 () Bool)

(declare-fun e!614499 () Bool)

(assert (=> b!1075250 (= e!614499 e!614498)))

(declare-fun c!108020 () Bool)

(assert (=> b!1075250 (= c!108020 (validKeyInArray!0 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129577 () Bool)

(declare-fun res!716848 () Bool)

(assert (=> d!129577 (=> res!716848 e!614499)))

(assert (=> d!129577 (= res!716848 (bvsge #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(assert (=> d!129577 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614499)))

(declare-fun b!1075251 () Bool)

(declare-fun e!614497 () Bool)

(assert (=> b!1075251 (= e!614497 call!45494)))

(declare-fun b!1075252 () Bool)

(assert (=> b!1075252 (= e!614498 e!614497)))

(declare-fun lt!477263 () (_ BitVec 64))

(assert (=> b!1075252 (= lt!477263 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477261 () Unit!35402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68993 (_ BitVec 64) (_ BitVec 32)) Unit!35402)

(assert (=> b!1075252 (= lt!477261 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!477263 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1075252 (arrayContainsKey!0 _keys!1163 lt!477263 #b00000000000000000000000000000000)))

(declare-fun lt!477262 () Unit!35402)

(assert (=> b!1075252 (= lt!477262 lt!477261)))

(declare-fun res!716847 () Bool)

(declare-datatypes ((SeekEntryResult!9891 0))(
  ( (MissingZero!9891 (index!41935 (_ BitVec 32))) (Found!9891 (index!41936 (_ BitVec 32))) (Intermediate!9891 (undefined!10703 Bool) (index!41937 (_ BitVec 32)) (x!96362 (_ BitVec 32))) (Undefined!9891) (MissingVacant!9891 (index!41938 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68993 (_ BitVec 32)) SeekEntryResult!9891)

(assert (=> b!1075252 (= res!716847 (= (seekEntryOrOpen!0 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9891 #b00000000000000000000000000000000)))))

(assert (=> b!1075252 (=> (not res!716847) (not e!614497))))

(declare-fun bm!45491 () Bool)

(assert (=> bm!45491 (= call!45494 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!129577 (not res!716848)) b!1075250))

(assert (= (and b!1075250 c!108020) b!1075252))

(assert (= (and b!1075250 (not c!108020)) b!1075249))

(assert (= (and b!1075252 res!716847) b!1075251))

(assert (= (or b!1075251 b!1075249) bm!45491))

(assert (=> b!1075250 m!994067))

(assert (=> b!1075250 m!994067))

(assert (=> b!1075250 m!994113))

(assert (=> b!1075252 m!994067))

(declare-fun m!994115 () Bool)

(assert (=> b!1075252 m!994115))

(declare-fun m!994117 () Bool)

(assert (=> b!1075252 m!994117))

(assert (=> b!1075252 m!994067))

(declare-fun m!994119 () Bool)

(assert (=> b!1075252 m!994119))

(declare-fun m!994121 () Bool)

(assert (=> bm!45491 m!994121))

(assert (=> b!1075136 d!129577))

(declare-fun bm!45494 () Bool)

(declare-fun call!45497 () Bool)

(declare-fun c!108023 () Bool)

(assert (=> bm!45494 (= call!45497 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108023 (Cons!23168 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000) Nil!23169) Nil!23169)))))

(declare-fun b!1075263 () Bool)

(declare-fun e!614509 () Bool)

(assert (=> b!1075263 (= e!614509 call!45497)))

(declare-fun d!129579 () Bool)

(declare-fun res!716856 () Bool)

(declare-fun e!614508 () Bool)

(assert (=> d!129579 (=> res!716856 e!614508)))

(assert (=> d!129579 (= res!716856 (bvsge #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(assert (=> d!129579 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23169) e!614508)))

(declare-fun b!1075264 () Bool)

(declare-fun e!614511 () Bool)

(assert (=> b!1075264 (= e!614508 e!614511)))

(declare-fun res!716857 () Bool)

(assert (=> b!1075264 (=> (not res!716857) (not e!614511))))

(declare-fun e!614510 () Bool)

(assert (=> b!1075264 (= res!716857 (not e!614510))))

(declare-fun res!716855 () Bool)

(assert (=> b!1075264 (=> (not res!716855) (not e!614510))))

(assert (=> b!1075264 (= res!716855 (validKeyInArray!0 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075265 () Bool)

(assert (=> b!1075265 (= e!614511 e!614509)))

(assert (=> b!1075265 (= c!108023 (validKeyInArray!0 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075266 () Bool)

(assert (=> b!1075266 (= e!614509 call!45497)))

(declare-fun b!1075267 () Bool)

(declare-fun contains!6346 (List!23172 (_ BitVec 64)) Bool)

(assert (=> b!1075267 (= e!614510 (contains!6346 Nil!23169 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129579 (not res!716856)) b!1075264))

(assert (= (and b!1075264 res!716855) b!1075267))

(assert (= (and b!1075264 res!716857) b!1075265))

(assert (= (and b!1075265 c!108023) b!1075263))

(assert (= (and b!1075265 (not c!108023)) b!1075266))

(assert (= (or b!1075263 b!1075266) bm!45494))

(assert (=> bm!45494 m!994067))

(declare-fun m!994123 () Bool)

(assert (=> bm!45494 m!994123))

(assert (=> b!1075264 m!994067))

(assert (=> b!1075264 m!994067))

(assert (=> b!1075264 m!994113))

(assert (=> b!1075265 m!994067))

(assert (=> b!1075265 m!994067))

(assert (=> b!1075265 m!994113))

(assert (=> b!1075267 m!994067))

(assert (=> b!1075267 m!994067))

(declare-fun m!994125 () Bool)

(assert (=> b!1075267 m!994125))

(assert (=> b!1075142 d!129579))

(declare-fun d!129581 () Bool)

(assert (=> d!129581 (= (getCurrentListMapNoExtraKeys!3880 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3880 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477266 () Unit!35402)

(declare-fun choose!1753 (array!68993 array!68995 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39819 V!39819 V!39819 V!39819 (_ BitVec 32) Int) Unit!35402)

(assert (=> d!129581 (= lt!477266 (choose!1753 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129581 (validMask!0 mask!1515)))

(assert (=> d!129581 (= (lemmaNoChangeToArrayThenSameMapNoExtras!896 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477266)))

(declare-fun bs!31679 () Bool)

(assert (= bs!31679 d!129581))

(assert (=> bs!31679 m!994019))

(assert (=> bs!31679 m!994017))

(declare-fun m!994127 () Bool)

(assert (=> bs!31679 m!994127))

(assert (=> bs!31679 m!994009))

(assert (=> b!1075139 d!129581))

(declare-fun b!1075292 () Bool)

(declare-fun lt!477284 () ListLongMap!14605)

(declare-fun e!614532 () Bool)

(assert (=> b!1075292 (= e!614532 (= lt!477284 (getCurrentListMapNoExtraKeys!3880 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun d!129583 () Bool)

(declare-fun e!614531 () Bool)

(assert (=> d!129583 e!614531))

(declare-fun res!716867 () Bool)

(assert (=> d!129583 (=> (not res!716867) (not e!614531))))

(assert (=> d!129583 (= res!716867 (not (contains!6345 lt!477284 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!614530 () ListLongMap!14605)

(assert (=> d!129583 (= lt!477284 e!614530)))

(declare-fun c!108035 () Bool)

(assert (=> d!129583 (= c!108035 (bvsge #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(assert (=> d!129583 (validMask!0 mask!1515)))

(assert (=> d!129583 (= (getCurrentListMapNoExtraKeys!3880 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477284)))

(declare-fun b!1075293 () Bool)

(assert (=> b!1075293 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(assert (=> b!1075293 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33721 _values!955)))))

(declare-fun e!614528 () Bool)

(assert (=> b!1075293 (= e!614528 (= (apply!938 lt!477284 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)) (get!17234 (select (arr!33185 _values!955) #b00000000000000000000000000000000) (dynLambda!2045 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075294 () Bool)

(declare-fun e!614527 () Bool)

(assert (=> b!1075294 (= e!614527 e!614528)))

(assert (=> b!1075294 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(declare-fun res!716866 () Bool)

(assert (=> b!1075294 (= res!716866 (contains!6345 lt!477284 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075294 (=> (not res!716866) (not e!614528))))

(declare-fun b!1075295 () Bool)

(declare-fun e!614526 () ListLongMap!14605)

(assert (=> b!1075295 (= e!614530 e!614526)))

(declare-fun c!108033 () Bool)

(assert (=> b!1075295 (= c!108033 (validKeyInArray!0 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45497 () Bool)

(declare-fun call!45500 () ListLongMap!14605)

(assert (=> bm!45497 (= call!45500 (getCurrentListMapNoExtraKeys!3880 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075296 () Bool)

(declare-fun e!614529 () Bool)

(assert (=> b!1075296 (= e!614529 (validKeyInArray!0 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075296 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075297 () Bool)

(declare-fun isEmpty!956 (ListLongMap!14605) Bool)

(assert (=> b!1075297 (= e!614532 (isEmpty!956 lt!477284))))

(declare-fun b!1075298 () Bool)

(declare-fun lt!477286 () Unit!35402)

(declare-fun lt!477281 () Unit!35402)

(assert (=> b!1075298 (= lt!477286 lt!477281)))

(declare-fun lt!477287 () ListLongMap!14605)

(declare-fun lt!477283 () (_ BitVec 64))

(declare-fun lt!477285 () V!39819)

(declare-fun lt!477282 () (_ BitVec 64))

(assert (=> b!1075298 (not (contains!6345 (+!3225 lt!477287 (tuple2!16637 lt!477283 lt!477285)) lt!477282))))

(declare-fun addStillNotContains!266 (ListLongMap!14605 (_ BitVec 64) V!39819 (_ BitVec 64)) Unit!35402)

(assert (=> b!1075298 (= lt!477281 (addStillNotContains!266 lt!477287 lt!477283 lt!477285 lt!477282))))

(assert (=> b!1075298 (= lt!477282 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075298 (= lt!477285 (get!17234 (select (arr!33185 _values!955) #b00000000000000000000000000000000) (dynLambda!2045 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075298 (= lt!477283 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075298 (= lt!477287 call!45500)))

(assert (=> b!1075298 (= e!614526 (+!3225 call!45500 (tuple2!16637 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000) (get!17234 (select (arr!33185 _values!955) #b00000000000000000000000000000000) (dynLambda!2045 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075299 () Bool)

(assert (=> b!1075299 (= e!614531 e!614527)))

(declare-fun c!108032 () Bool)

(assert (=> b!1075299 (= c!108032 e!614529)))

(declare-fun res!716869 () Bool)

(assert (=> b!1075299 (=> (not res!716869) (not e!614529))))

(assert (=> b!1075299 (= res!716869 (bvslt #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(declare-fun b!1075300 () Bool)

(assert (=> b!1075300 (= e!614526 call!45500)))

(declare-fun b!1075301 () Bool)

(assert (=> b!1075301 (= e!614530 (ListLongMap!14606 Nil!23168))))

(declare-fun b!1075302 () Bool)

(assert (=> b!1075302 (= e!614527 e!614532)))

(declare-fun c!108034 () Bool)

(assert (=> b!1075302 (= c!108034 (bvslt #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(declare-fun b!1075303 () Bool)

(declare-fun res!716868 () Bool)

(assert (=> b!1075303 (=> (not res!716868) (not e!614531))))

(assert (=> b!1075303 (= res!716868 (not (contains!6345 lt!477284 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129583 c!108035) b!1075301))

(assert (= (and d!129583 (not c!108035)) b!1075295))

(assert (= (and b!1075295 c!108033) b!1075298))

(assert (= (and b!1075295 (not c!108033)) b!1075300))

(assert (= (or b!1075298 b!1075300) bm!45497))

(assert (= (and d!129583 res!716867) b!1075303))

(assert (= (and b!1075303 res!716868) b!1075299))

(assert (= (and b!1075299 res!716869) b!1075296))

(assert (= (and b!1075299 c!108032) b!1075294))

(assert (= (and b!1075299 (not c!108032)) b!1075302))

(assert (= (and b!1075294 res!716866) b!1075293))

(assert (= (and b!1075302 c!108034) b!1075292))

(assert (= (and b!1075302 (not c!108034)) b!1075297))

(declare-fun b_lambda!16859 () Bool)

(assert (=> (not b_lambda!16859) (not b!1075293)))

(assert (=> b!1075293 t!32524))

(declare-fun b_and!35129 () Bool)

(assert (= b_and!35127 (and (=> t!32524 result!14821) b_and!35129)))

(declare-fun b_lambda!16861 () Bool)

(assert (=> (not b_lambda!16861) (not b!1075298)))

(assert (=> b!1075298 t!32524))

(declare-fun b_and!35131 () Bool)

(assert (= b_and!35129 (and (=> t!32524 result!14821) b_and!35131)))

(declare-fun m!994129 () Bool)

(assert (=> b!1075303 m!994129))

(declare-fun m!994131 () Bool)

(assert (=> d!129583 m!994131))

(assert (=> d!129583 m!994009))

(declare-fun m!994133 () Bool)

(assert (=> bm!45497 m!994133))

(assert (=> b!1075293 m!994071))

(assert (=> b!1075293 m!994067))

(declare-fun m!994135 () Bool)

(assert (=> b!1075293 m!994135))

(assert (=> b!1075293 m!994073))

(assert (=> b!1075293 m!994067))

(assert (=> b!1075293 m!994071))

(assert (=> b!1075293 m!994073))

(assert (=> b!1075293 m!994075))

(assert (=> b!1075294 m!994067))

(assert (=> b!1075294 m!994067))

(declare-fun m!994137 () Bool)

(assert (=> b!1075294 m!994137))

(assert (=> b!1075292 m!994133))

(assert (=> b!1075295 m!994067))

(assert (=> b!1075295 m!994067))

(assert (=> b!1075295 m!994113))

(declare-fun m!994139 () Bool)

(assert (=> b!1075298 m!994139))

(declare-fun m!994141 () Bool)

(assert (=> b!1075298 m!994141))

(assert (=> b!1075298 m!994071))

(assert (=> b!1075298 m!994073))

(assert (=> b!1075298 m!994067))

(assert (=> b!1075298 m!994141))

(declare-fun m!994143 () Bool)

(assert (=> b!1075298 m!994143))

(declare-fun m!994145 () Bool)

(assert (=> b!1075298 m!994145))

(assert (=> b!1075298 m!994071))

(assert (=> b!1075298 m!994073))

(assert (=> b!1075298 m!994075))

(declare-fun m!994147 () Bool)

(assert (=> b!1075297 m!994147))

(assert (=> b!1075296 m!994067))

(assert (=> b!1075296 m!994067))

(assert (=> b!1075296 m!994113))

(assert (=> b!1075139 d!129583))

(declare-fun e!614539 () Bool)

(declare-fun b!1075304 () Bool)

(declare-fun lt!477291 () ListLongMap!14605)

(assert (=> b!1075304 (= e!614539 (= lt!477291 (getCurrentListMapNoExtraKeys!3880 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun d!129585 () Bool)

(declare-fun e!614538 () Bool)

(assert (=> d!129585 e!614538))

(declare-fun res!716871 () Bool)

(assert (=> d!129585 (=> (not res!716871) (not e!614538))))

(assert (=> d!129585 (= res!716871 (not (contains!6345 lt!477291 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!614537 () ListLongMap!14605)

(assert (=> d!129585 (= lt!477291 e!614537)))

(declare-fun c!108039 () Bool)

(assert (=> d!129585 (= c!108039 (bvsge #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(assert (=> d!129585 (validMask!0 mask!1515)))

(assert (=> d!129585 (= (getCurrentListMapNoExtraKeys!3880 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477291)))

(declare-fun b!1075305 () Bool)

(assert (=> b!1075305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(assert (=> b!1075305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33721 _values!955)))))

(declare-fun e!614535 () Bool)

(assert (=> b!1075305 (= e!614535 (= (apply!938 lt!477291 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)) (get!17234 (select (arr!33185 _values!955) #b00000000000000000000000000000000) (dynLambda!2045 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075306 () Bool)

(declare-fun e!614534 () Bool)

(assert (=> b!1075306 (= e!614534 e!614535)))

(assert (=> b!1075306 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(declare-fun res!716870 () Bool)

(assert (=> b!1075306 (= res!716870 (contains!6345 lt!477291 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075306 (=> (not res!716870) (not e!614535))))

(declare-fun b!1075307 () Bool)

(declare-fun e!614533 () ListLongMap!14605)

(assert (=> b!1075307 (= e!614537 e!614533)))

(declare-fun c!108037 () Bool)

(assert (=> b!1075307 (= c!108037 (validKeyInArray!0 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45498 () Bool)

(declare-fun call!45501 () ListLongMap!14605)

(assert (=> bm!45498 (= call!45501 (getCurrentListMapNoExtraKeys!3880 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075308 () Bool)

(declare-fun e!614536 () Bool)

(assert (=> b!1075308 (= e!614536 (validKeyInArray!0 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075308 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075309 () Bool)

(assert (=> b!1075309 (= e!614539 (isEmpty!956 lt!477291))))

(declare-fun b!1075310 () Bool)

(declare-fun lt!477293 () Unit!35402)

(declare-fun lt!477288 () Unit!35402)

(assert (=> b!1075310 (= lt!477293 lt!477288)))

(declare-fun lt!477289 () (_ BitVec 64))

(declare-fun lt!477294 () ListLongMap!14605)

(declare-fun lt!477292 () V!39819)

(declare-fun lt!477290 () (_ BitVec 64))

(assert (=> b!1075310 (not (contains!6345 (+!3225 lt!477294 (tuple2!16637 lt!477290 lt!477292)) lt!477289))))

(assert (=> b!1075310 (= lt!477288 (addStillNotContains!266 lt!477294 lt!477290 lt!477292 lt!477289))))

(assert (=> b!1075310 (= lt!477289 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075310 (= lt!477292 (get!17234 (select (arr!33185 _values!955) #b00000000000000000000000000000000) (dynLambda!2045 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075310 (= lt!477290 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075310 (= lt!477294 call!45501)))

(assert (=> b!1075310 (= e!614533 (+!3225 call!45501 (tuple2!16637 (select (arr!33184 _keys!1163) #b00000000000000000000000000000000) (get!17234 (select (arr!33185 _values!955) #b00000000000000000000000000000000) (dynLambda!2045 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075311 () Bool)

(assert (=> b!1075311 (= e!614538 e!614534)))

(declare-fun c!108036 () Bool)

(assert (=> b!1075311 (= c!108036 e!614536)))

(declare-fun res!716873 () Bool)

(assert (=> b!1075311 (=> (not res!716873) (not e!614536))))

(assert (=> b!1075311 (= res!716873 (bvslt #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(declare-fun b!1075312 () Bool)

(assert (=> b!1075312 (= e!614533 call!45501)))

(declare-fun b!1075313 () Bool)

(assert (=> b!1075313 (= e!614537 (ListLongMap!14606 Nil!23168))))

(declare-fun b!1075314 () Bool)

(assert (=> b!1075314 (= e!614534 e!614539)))

(declare-fun c!108038 () Bool)

(assert (=> b!1075314 (= c!108038 (bvslt #b00000000000000000000000000000000 (size!33720 _keys!1163)))))

(declare-fun b!1075315 () Bool)

(declare-fun res!716872 () Bool)

(assert (=> b!1075315 (=> (not res!716872) (not e!614538))))

(assert (=> b!1075315 (= res!716872 (not (contains!6345 lt!477291 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129585 c!108039) b!1075313))

(assert (= (and d!129585 (not c!108039)) b!1075307))

(assert (= (and b!1075307 c!108037) b!1075310))

(assert (= (and b!1075307 (not c!108037)) b!1075312))

(assert (= (or b!1075310 b!1075312) bm!45498))

(assert (= (and d!129585 res!716871) b!1075315))

(assert (= (and b!1075315 res!716872) b!1075311))

(assert (= (and b!1075311 res!716873) b!1075308))

(assert (= (and b!1075311 c!108036) b!1075306))

(assert (= (and b!1075311 (not c!108036)) b!1075314))

(assert (= (and b!1075306 res!716870) b!1075305))

(assert (= (and b!1075314 c!108038) b!1075304))

(assert (= (and b!1075314 (not c!108038)) b!1075309))

(declare-fun b_lambda!16863 () Bool)

(assert (=> (not b_lambda!16863) (not b!1075305)))

(assert (=> b!1075305 t!32524))

(declare-fun b_and!35133 () Bool)

(assert (= b_and!35131 (and (=> t!32524 result!14821) b_and!35133)))

(declare-fun b_lambda!16865 () Bool)

(assert (=> (not b_lambda!16865) (not b!1075310)))

(assert (=> b!1075310 t!32524))

(declare-fun b_and!35135 () Bool)

(assert (= b_and!35133 (and (=> t!32524 result!14821) b_and!35135)))

(declare-fun m!994149 () Bool)

(assert (=> b!1075315 m!994149))

(declare-fun m!994151 () Bool)

(assert (=> d!129585 m!994151))

(assert (=> d!129585 m!994009))

(declare-fun m!994153 () Bool)

(assert (=> bm!45498 m!994153))

(assert (=> b!1075305 m!994071))

(assert (=> b!1075305 m!994067))

(declare-fun m!994155 () Bool)

(assert (=> b!1075305 m!994155))

(assert (=> b!1075305 m!994073))

(assert (=> b!1075305 m!994067))

(assert (=> b!1075305 m!994071))

(assert (=> b!1075305 m!994073))

(assert (=> b!1075305 m!994075))

(assert (=> b!1075306 m!994067))

(assert (=> b!1075306 m!994067))

(declare-fun m!994157 () Bool)

(assert (=> b!1075306 m!994157))

(assert (=> b!1075304 m!994153))

(assert (=> b!1075307 m!994067))

(assert (=> b!1075307 m!994067))

(assert (=> b!1075307 m!994113))

(declare-fun m!994159 () Bool)

(assert (=> b!1075310 m!994159))

(declare-fun m!994161 () Bool)

(assert (=> b!1075310 m!994161))

(assert (=> b!1075310 m!994071))

(assert (=> b!1075310 m!994073))

(assert (=> b!1075310 m!994067))

(assert (=> b!1075310 m!994161))

(declare-fun m!994163 () Bool)

(assert (=> b!1075310 m!994163))

(declare-fun m!994165 () Bool)

(assert (=> b!1075310 m!994165))

(assert (=> b!1075310 m!994071))

(assert (=> b!1075310 m!994073))

(assert (=> b!1075310 m!994075))

(declare-fun m!994167 () Bool)

(assert (=> b!1075309 m!994167))

(assert (=> b!1075308 m!994067))

(assert (=> b!1075308 m!994067))

(assert (=> b!1075308 m!994113))

(assert (=> b!1075139 d!129585))

(declare-fun condMapEmpty!40756 () Bool)

(declare-fun mapDefault!40756 () ValueCell!12303)

(assert (=> mapNonEmpty!40750 (= condMapEmpty!40756 (= mapRest!40750 ((as const (Array (_ BitVec 32) ValueCell!12303)) mapDefault!40756)))))

(declare-fun e!614544 () Bool)

(declare-fun mapRes!40756 () Bool)

(assert (=> mapNonEmpty!40750 (= tp!78092 (and e!614544 mapRes!40756))))

(declare-fun mapIsEmpty!40756 () Bool)

(assert (=> mapIsEmpty!40756 mapRes!40756))

(declare-fun b!1075322 () Bool)

(declare-fun e!614545 () Bool)

(assert (=> b!1075322 (= e!614545 tp_is_empty!26013)))

(declare-fun b!1075323 () Bool)

(assert (=> b!1075323 (= e!614544 tp_is_empty!26013)))

(declare-fun mapNonEmpty!40756 () Bool)

(declare-fun tp!78101 () Bool)

(assert (=> mapNonEmpty!40756 (= mapRes!40756 (and tp!78101 e!614545))))

(declare-fun mapRest!40756 () (Array (_ BitVec 32) ValueCell!12303))

(declare-fun mapValue!40756 () ValueCell!12303)

(declare-fun mapKey!40756 () (_ BitVec 32))

(assert (=> mapNonEmpty!40756 (= mapRest!40750 (store mapRest!40756 mapKey!40756 mapValue!40756))))

(assert (= (and mapNonEmpty!40750 condMapEmpty!40756) mapIsEmpty!40756))

(assert (= (and mapNonEmpty!40750 (not condMapEmpty!40756)) mapNonEmpty!40756))

(assert (= (and mapNonEmpty!40756 ((_ is ValueCellFull!12303) mapValue!40756)) b!1075322))

(assert (= (and mapNonEmpty!40750 ((_ is ValueCellFull!12303) mapDefault!40756)) b!1075323))

(declare-fun m!994169 () Bool)

(assert (=> mapNonEmpty!40756 m!994169))

(declare-fun b_lambda!16867 () Bool)

(assert (= b_lambda!16859 (or (and start!95106 b_free!22203) b_lambda!16867)))

(declare-fun b_lambda!16869 () Bool)

(assert (= b_lambda!16865 (or (and start!95106 b_free!22203) b_lambda!16869)))

(declare-fun b_lambda!16871 () Bool)

(assert (= b_lambda!16863 (or (and start!95106 b_free!22203) b_lambda!16871)))

(declare-fun b_lambda!16873 () Bool)

(assert (= b_lambda!16861 (or (and start!95106 b_free!22203) b_lambda!16873)))

(declare-fun b_lambda!16875 () Bool)

(assert (= b_lambda!16857 (or (and start!95106 b_free!22203) b_lambda!16875)))

(check-sat (not b!1075293) (not bm!45497) (not bm!45488) (not b_lambda!16867) (not b!1075236) (not b!1075238) (not b!1075295) (not b!1075265) (not b!1075229) (not b_lambda!16875) tp_is_empty!26013 (not b!1075296) (not d!129585) (not b_lambda!16869) (not d!129583) (not bm!45487) (not b!1075315) (not b!1075228) (not b!1075305) (not b!1075250) (not b!1075235) (not b!1075304) (not b!1075308) (not b!1075292) (not bm!45491) (not b!1075264) (not bm!45498) (not d!129573) (not b!1075219) b_and!35135 (not bm!45486) (not b!1075220) (not b!1075310) (not d!129581) (not bm!45494) (not b!1075309) (not b!1075175) (not b!1075252) (not b!1075307) (not b!1075298) (not b!1075306) (not b_lambda!16871) (not b!1075267) (not b!1075173) (not b!1075226) (not b_next!22203) (not b!1075303) (not b!1075297) (not bm!45485) (not d!129575) (not b!1075294) (not b_lambda!16873) (not mapNonEmpty!40756))
(check-sat b_and!35135 (not b_next!22203))
