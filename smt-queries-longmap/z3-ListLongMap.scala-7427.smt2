; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94400 () Bool)

(assert start!94400)

(declare-fun b_free!21741 () Bool)

(declare-fun b_next!21741 () Bool)

(assert (=> start!94400 (= b_free!21741 (not b_next!21741))))

(declare-fun tp!76667 () Bool)

(declare-fun b_and!34525 () Bool)

(assert (=> start!94400 (= tp!76667 b_and!34525)))

(declare-fun b!1067436 () Bool)

(declare-fun res!712337 () Bool)

(declare-fun e!608829 () Bool)

(assert (=> b!1067436 (=> (not res!712337) (not e!608829))))

(declare-datatypes ((array!68083 0))(
  ( (array!68084 (arr!32742 (Array (_ BitVec 32) (_ BitVec 64))) (size!33278 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68083)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68083 (_ BitVec 32)) Bool)

(assert (=> b!1067436 (= res!712337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40018 () Bool)

(declare-fun mapRes!40018 () Bool)

(declare-fun tp!76666 () Bool)

(declare-fun e!608827 () Bool)

(assert (=> mapNonEmpty!40018 (= mapRes!40018 (and tp!76666 e!608827))))

(declare-fun mapKey!40018 () (_ BitVec 32))

(declare-datatypes ((V!39203 0))(
  ( (V!39204 (val!12826 Int)) )
))
(declare-datatypes ((ValueCell!12072 0))(
  ( (ValueCellFull!12072 (v!15440 V!39203)) (EmptyCell!12072) )
))
(declare-fun mapValue!40018 () ValueCell!12072)

(declare-datatypes ((array!68085 0))(
  ( (array!68086 (arr!32743 (Array (_ BitVec 32) ValueCell!12072)) (size!33279 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68085)

(declare-fun mapRest!40018 () (Array (_ BitVec 32) ValueCell!12072))

(assert (=> mapNonEmpty!40018 (= (arr!32743 _values!955) (store mapRest!40018 mapKey!40018 mapValue!40018))))

(declare-fun b!1067437 () Bool)

(declare-fun tp_is_empty!25551 () Bool)

(assert (=> b!1067437 (= e!608827 tp_is_empty!25551)))

(declare-fun b!1067438 () Bool)

(declare-fun res!712339 () Bool)

(assert (=> b!1067438 (=> (not res!712339) (not e!608829))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1067438 (= res!712339 (and (= (size!33279 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33278 _keys!1163) (size!33279 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40018 () Bool)

(assert (=> mapIsEmpty!40018 mapRes!40018))

(declare-fun b!1067439 () Bool)

(declare-fun res!712340 () Bool)

(assert (=> b!1067439 (=> (not res!712340) (not e!608829))))

(declare-datatypes ((List!22833 0))(
  ( (Nil!22830) (Cons!22829 (h!24038 (_ BitVec 64)) (t!32156 List!22833)) )
))
(declare-fun arrayNoDuplicates!0 (array!68083 (_ BitVec 32) List!22833) Bool)

(assert (=> b!1067439 (= res!712340 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22830))))

(declare-fun res!712338 () Bool)

(assert (=> start!94400 (=> (not res!712338) (not e!608829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94400 (= res!712338 (validMask!0 mask!1515))))

(assert (=> start!94400 e!608829))

(assert (=> start!94400 true))

(assert (=> start!94400 tp_is_empty!25551))

(declare-fun e!608828 () Bool)

(declare-fun array_inv!25346 (array!68085) Bool)

(assert (=> start!94400 (and (array_inv!25346 _values!955) e!608828)))

(assert (=> start!94400 tp!76667))

(declare-fun array_inv!25347 (array!68083) Bool)

(assert (=> start!94400 (array_inv!25347 _keys!1163)))

(declare-fun b!1067440 () Bool)

(declare-fun e!608826 () Bool)

(assert (=> b!1067440 (= e!608828 (and e!608826 mapRes!40018))))

(declare-fun condMapEmpty!40018 () Bool)

(declare-fun mapDefault!40018 () ValueCell!12072)

(assert (=> b!1067440 (= condMapEmpty!40018 (= (arr!32743 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12072)) mapDefault!40018)))))

(declare-fun b!1067441 () Bool)

(assert (=> b!1067441 (= e!608829 (not (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!33278 _keys!1163)))))))

(declare-datatypes ((tuple2!16274 0))(
  ( (tuple2!16275 (_1!8148 (_ BitVec 64)) (_2!8148 V!39203)) )
))
(declare-datatypes ((List!22834 0))(
  ( (Nil!22831) (Cons!22830 (h!24039 tuple2!16274) (t!32157 List!22834)) )
))
(declare-datatypes ((ListLongMap!14243 0))(
  ( (ListLongMap!14244 (toList!7137 List!22834)) )
))
(declare-fun lt!471445 () ListLongMap!14243)

(declare-fun lt!471447 () ListLongMap!14243)

(assert (=> b!1067441 (= lt!471445 lt!471447)))

(declare-fun minValue!907 () V!39203)

(declare-fun zeroValueBefore!47 () V!39203)

(declare-datatypes ((Unit!35071 0))(
  ( (Unit!35072) )
))
(declare-fun lt!471446 () Unit!35071)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39203)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!758 (array!68083 array!68085 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39203 V!39203 V!39203 V!39203 (_ BitVec 32) Int) Unit!35071)

(assert (=> b!1067441 (= lt!471446 (lemmaNoChangeToArrayThenSameMapNoExtras!758 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3721 (array!68083 array!68085 (_ BitVec 32) (_ BitVec 32) V!39203 V!39203 (_ BitVec 32) Int) ListLongMap!14243)

(assert (=> b!1067441 (= lt!471447 (getCurrentListMapNoExtraKeys!3721 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067441 (= lt!471445 (getCurrentListMapNoExtraKeys!3721 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067442 () Bool)

(assert (=> b!1067442 (= e!608826 tp_is_empty!25551)))

(assert (= (and start!94400 res!712338) b!1067438))

(assert (= (and b!1067438 res!712339) b!1067436))

(assert (= (and b!1067436 res!712337) b!1067439))

(assert (= (and b!1067439 res!712340) b!1067441))

(assert (= (and b!1067440 condMapEmpty!40018) mapIsEmpty!40018))

(assert (= (and b!1067440 (not condMapEmpty!40018)) mapNonEmpty!40018))

(get-info :version)

(assert (= (and mapNonEmpty!40018 ((_ is ValueCellFull!12072) mapValue!40018)) b!1067437))

(assert (= (and b!1067440 ((_ is ValueCellFull!12072) mapDefault!40018)) b!1067442))

(assert (= start!94400 b!1067440))

(declare-fun m!986097 () Bool)

(assert (=> start!94400 m!986097))

(declare-fun m!986099 () Bool)

(assert (=> start!94400 m!986099))

(declare-fun m!986101 () Bool)

(assert (=> start!94400 m!986101))

(declare-fun m!986103 () Bool)

(assert (=> mapNonEmpty!40018 m!986103))

(declare-fun m!986105 () Bool)

(assert (=> b!1067436 m!986105))

(declare-fun m!986107 () Bool)

(assert (=> b!1067439 m!986107))

(declare-fun m!986109 () Bool)

(assert (=> b!1067441 m!986109))

(declare-fun m!986111 () Bool)

(assert (=> b!1067441 m!986111))

(declare-fun m!986113 () Bool)

(assert (=> b!1067441 m!986113))

(check-sat tp_is_empty!25551 (not start!94400) (not b!1067439) (not b_next!21741) (not b!1067436) (not mapNonEmpty!40018) (not b!1067441) b_and!34525)
(check-sat b_and!34525 (not b_next!21741))
(get-model)

(declare-fun d!129111 () Bool)

(assert (=> d!129111 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94400 d!129111))

(declare-fun d!129113 () Bool)

(assert (=> d!129113 (= (array_inv!25346 _values!955) (bvsge (size!33279 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94400 d!129113))

(declare-fun d!129115 () Bool)

(assert (=> d!129115 (= (array_inv!25347 _keys!1163) (bvsge (size!33278 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94400 d!129115))

(declare-fun b!1067474 () Bool)

(declare-fun e!608855 () Bool)

(declare-fun e!608853 () Bool)

(assert (=> b!1067474 (= e!608855 e!608853)))

(declare-fun c!107482 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1067474 (= c!107482 (validKeyInArray!0 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067475 () Bool)

(declare-fun call!45091 () Bool)

(assert (=> b!1067475 (= e!608853 call!45091)))

(declare-fun bm!45088 () Bool)

(assert (=> bm!45088 (= call!45091 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107482 (Cons!22829 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000) Nil!22830) Nil!22830)))))

(declare-fun b!1067477 () Bool)

(declare-fun e!608856 () Bool)

(declare-fun contains!6274 (List!22833 (_ BitVec 64)) Bool)

(assert (=> b!1067477 (= e!608856 (contains!6274 Nil!22830 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067478 () Bool)

(assert (=> b!1067478 (= e!608853 call!45091)))

(declare-fun d!129117 () Bool)

(declare-fun res!712359 () Bool)

(declare-fun e!608854 () Bool)

(assert (=> d!129117 (=> res!712359 e!608854)))

(assert (=> d!129117 (= res!712359 (bvsge #b00000000000000000000000000000000 (size!33278 _keys!1163)))))

(assert (=> d!129117 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22830) e!608854)))

(declare-fun b!1067476 () Bool)

(assert (=> b!1067476 (= e!608854 e!608855)))

(declare-fun res!712361 () Bool)

(assert (=> b!1067476 (=> (not res!712361) (not e!608855))))

(assert (=> b!1067476 (= res!712361 (not e!608856))))

(declare-fun res!712360 () Bool)

(assert (=> b!1067476 (=> (not res!712360) (not e!608856))))

(assert (=> b!1067476 (= res!712360 (validKeyInArray!0 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129117 (not res!712359)) b!1067476))

(assert (= (and b!1067476 res!712360) b!1067477))

(assert (= (and b!1067476 res!712361) b!1067474))

(assert (= (and b!1067474 c!107482) b!1067478))

(assert (= (and b!1067474 (not c!107482)) b!1067475))

(assert (= (or b!1067478 b!1067475) bm!45088))

(declare-fun m!986133 () Bool)

(assert (=> b!1067474 m!986133))

(assert (=> b!1067474 m!986133))

(declare-fun m!986135 () Bool)

(assert (=> b!1067474 m!986135))

(assert (=> bm!45088 m!986133))

(declare-fun m!986137 () Bool)

(assert (=> bm!45088 m!986137))

(assert (=> b!1067477 m!986133))

(assert (=> b!1067477 m!986133))

(declare-fun m!986139 () Bool)

(assert (=> b!1067477 m!986139))

(assert (=> b!1067476 m!986133))

(assert (=> b!1067476 m!986133))

(assert (=> b!1067476 m!986135))

(assert (=> b!1067439 d!129117))

(declare-fun bm!45091 () Bool)

(declare-fun call!45094 () Bool)

(assert (=> bm!45091 (= call!45094 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1067487 () Bool)

(declare-fun e!608865 () Bool)

(assert (=> b!1067487 (= e!608865 call!45094)))

(declare-fun b!1067488 () Bool)

(declare-fun e!608864 () Bool)

(declare-fun e!608863 () Bool)

(assert (=> b!1067488 (= e!608864 e!608863)))

(declare-fun c!107485 () Bool)

(assert (=> b!1067488 (= c!107485 (validKeyInArray!0 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067490 () Bool)

(assert (=> b!1067490 (= e!608863 e!608865)))

(declare-fun lt!471465 () (_ BitVec 64))

(assert (=> b!1067490 (= lt!471465 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471463 () Unit!35071)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68083 (_ BitVec 64) (_ BitVec 32)) Unit!35071)

(assert (=> b!1067490 (= lt!471463 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!471465 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1067490 (arrayContainsKey!0 _keys!1163 lt!471465 #b00000000000000000000000000000000)))

(declare-fun lt!471464 () Unit!35071)

(assert (=> b!1067490 (= lt!471464 lt!471463)))

(declare-fun res!712366 () Bool)

(declare-datatypes ((SeekEntryResult!9878 0))(
  ( (MissingZero!9878 (index!41883 (_ BitVec 32))) (Found!9878 (index!41884 (_ BitVec 32))) (Intermediate!9878 (undefined!10690 Bool) (index!41885 (_ BitVec 32)) (x!95590 (_ BitVec 32))) (Undefined!9878) (MissingVacant!9878 (index!41886 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68083 (_ BitVec 32)) SeekEntryResult!9878)

(assert (=> b!1067490 (= res!712366 (= (seekEntryOrOpen!0 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9878 #b00000000000000000000000000000000)))))

(assert (=> b!1067490 (=> (not res!712366) (not e!608865))))

(declare-fun b!1067489 () Bool)

(assert (=> b!1067489 (= e!608863 call!45094)))

(declare-fun d!129119 () Bool)

(declare-fun res!712367 () Bool)

(assert (=> d!129119 (=> res!712367 e!608864)))

(assert (=> d!129119 (= res!712367 (bvsge #b00000000000000000000000000000000 (size!33278 _keys!1163)))))

(assert (=> d!129119 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!608864)))

(assert (= (and d!129119 (not res!712367)) b!1067488))

(assert (= (and b!1067488 c!107485) b!1067490))

(assert (= (and b!1067488 (not c!107485)) b!1067489))

(assert (= (and b!1067490 res!712366) b!1067487))

(assert (= (or b!1067487 b!1067489) bm!45091))

(declare-fun m!986141 () Bool)

(assert (=> bm!45091 m!986141))

(assert (=> b!1067488 m!986133))

(assert (=> b!1067488 m!986133))

(assert (=> b!1067488 m!986135))

(assert (=> b!1067490 m!986133))

(declare-fun m!986143 () Bool)

(assert (=> b!1067490 m!986143))

(declare-fun m!986145 () Bool)

(assert (=> b!1067490 m!986145))

(assert (=> b!1067490 m!986133))

(declare-fun m!986147 () Bool)

(assert (=> b!1067490 m!986147))

(assert (=> b!1067436 d!129119))

(declare-fun d!129121 () Bool)

(assert (=> d!129121 (= (getCurrentListMapNoExtraKeys!3721 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3721 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471468 () Unit!35071)

(declare-fun choose!1734 (array!68083 array!68085 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39203 V!39203 V!39203 V!39203 (_ BitVec 32) Int) Unit!35071)

(assert (=> d!129121 (= lt!471468 (choose!1734 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129121 (validMask!0 mask!1515)))

(assert (=> d!129121 (= (lemmaNoChangeToArrayThenSameMapNoExtras!758 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471468)))

(declare-fun bs!31422 () Bool)

(assert (= bs!31422 d!129121))

(assert (=> bs!31422 m!986113))

(assert (=> bs!31422 m!986111))

(declare-fun m!986149 () Bool)

(assert (=> bs!31422 m!986149))

(assert (=> bs!31422 m!986097))

(assert (=> b!1067441 d!129121))

(declare-fun b!1067515 () Bool)

(declare-fun e!608885 () Bool)

(declare-fun e!608883 () Bool)

(assert (=> b!1067515 (= e!608885 e!608883)))

(declare-fun c!107494 () Bool)

(assert (=> b!1067515 (= c!107494 (bvslt #b00000000000000000000000000000000 (size!33278 _keys!1163)))))

(declare-fun bm!45094 () Bool)

(declare-fun call!45097 () ListLongMap!14243)

(assert (=> bm!45094 (= call!45097 (getCurrentListMapNoExtraKeys!3721 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1067516 () Bool)

(declare-fun lt!471487 () ListLongMap!14243)

(declare-fun isEmpty!943 (ListLongMap!14243) Bool)

(assert (=> b!1067516 (= e!608883 (isEmpty!943 lt!471487))))

(declare-fun b!1067517 () Bool)

(declare-fun e!608880 () ListLongMap!14243)

(assert (=> b!1067517 (= e!608880 (ListLongMap!14244 Nil!22831))))

(declare-fun b!1067518 () Bool)

(declare-fun e!608882 () Bool)

(assert (=> b!1067518 (= e!608882 e!608885)))

(declare-fun c!107497 () Bool)

(declare-fun e!608884 () Bool)

(assert (=> b!1067518 (= c!107497 e!608884)))

(declare-fun res!712378 () Bool)

(assert (=> b!1067518 (=> (not res!712378) (not e!608884))))

(assert (=> b!1067518 (= res!712378 (bvslt #b00000000000000000000000000000000 (size!33278 _keys!1163)))))

(declare-fun b!1067520 () Bool)

(declare-fun e!608886 () Bool)

(assert (=> b!1067520 (= e!608885 e!608886)))

(assert (=> b!1067520 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33278 _keys!1163)))))

(declare-fun res!712379 () Bool)

(declare-fun contains!6275 (ListLongMap!14243 (_ BitVec 64)) Bool)

(assert (=> b!1067520 (= res!712379 (contains!6275 lt!471487 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1067520 (=> (not res!712379) (not e!608886))))

(declare-fun b!1067521 () Bool)

(assert (=> b!1067521 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33278 _keys!1163)))))

(assert (=> b!1067521 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33279 _values!955)))))

(declare-fun apply!925 (ListLongMap!14243 (_ BitVec 64)) V!39203)

(declare-fun get!17067 (ValueCell!12072 V!39203) V!39203)

(declare-fun dynLambda!2032 (Int (_ BitVec 64)) V!39203)

(assert (=> b!1067521 (= e!608886 (= (apply!925 lt!471487 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000)) (get!17067 (select (arr!32743 _values!955) #b00000000000000000000000000000000) (dynLambda!2032 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1067522 () Bool)

(declare-fun e!608881 () ListLongMap!14243)

(assert (=> b!1067522 (= e!608881 call!45097)))

(declare-fun b!1067523 () Bool)

(assert (=> b!1067523 (= e!608883 (= lt!471487 (getCurrentListMapNoExtraKeys!3721 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1067524 () Bool)

(assert (=> b!1067524 (= e!608880 e!608881)))

(declare-fun c!107496 () Bool)

(assert (=> b!1067524 (= c!107496 (validKeyInArray!0 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067525 () Bool)

(declare-fun lt!471486 () Unit!35071)

(declare-fun lt!471484 () Unit!35071)

(assert (=> b!1067525 (= lt!471486 lt!471484)))

(declare-fun lt!471489 () V!39203)

(declare-fun lt!471485 () (_ BitVec 64))

(declare-fun lt!471488 () (_ BitVec 64))

(declare-fun lt!471483 () ListLongMap!14243)

(declare-fun +!3160 (ListLongMap!14243 tuple2!16274) ListLongMap!14243)

(assert (=> b!1067525 (not (contains!6275 (+!3160 lt!471483 (tuple2!16275 lt!471488 lt!471489)) lt!471485))))

(declare-fun addStillNotContains!253 (ListLongMap!14243 (_ BitVec 64) V!39203 (_ BitVec 64)) Unit!35071)

(assert (=> b!1067525 (= lt!471484 (addStillNotContains!253 lt!471483 lt!471488 lt!471489 lt!471485))))

(assert (=> b!1067525 (= lt!471485 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1067525 (= lt!471489 (get!17067 (select (arr!32743 _values!955) #b00000000000000000000000000000000) (dynLambda!2032 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1067525 (= lt!471488 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1067525 (= lt!471483 call!45097)))

(assert (=> b!1067525 (= e!608881 (+!3160 call!45097 (tuple2!16275 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000) (get!17067 (select (arr!32743 _values!955) #b00000000000000000000000000000000) (dynLambda!2032 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1067526 () Bool)

(declare-fun res!712376 () Bool)

(assert (=> b!1067526 (=> (not res!712376) (not e!608882))))

(assert (=> b!1067526 (= res!712376 (not (contains!6275 lt!471487 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1067519 () Bool)

(assert (=> b!1067519 (= e!608884 (validKeyInArray!0 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1067519 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!129123 () Bool)

(assert (=> d!129123 e!608882))

(declare-fun res!712377 () Bool)

(assert (=> d!129123 (=> (not res!712377) (not e!608882))))

(assert (=> d!129123 (= res!712377 (not (contains!6275 lt!471487 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129123 (= lt!471487 e!608880)))

(declare-fun c!107495 () Bool)

(assert (=> d!129123 (= c!107495 (bvsge #b00000000000000000000000000000000 (size!33278 _keys!1163)))))

(assert (=> d!129123 (validMask!0 mask!1515)))

(assert (=> d!129123 (= (getCurrentListMapNoExtraKeys!3721 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471487)))

(assert (= (and d!129123 c!107495) b!1067517))

(assert (= (and d!129123 (not c!107495)) b!1067524))

(assert (= (and b!1067524 c!107496) b!1067525))

(assert (= (and b!1067524 (not c!107496)) b!1067522))

(assert (= (or b!1067525 b!1067522) bm!45094))

(assert (= (and d!129123 res!712377) b!1067526))

(assert (= (and b!1067526 res!712376) b!1067518))

(assert (= (and b!1067518 res!712378) b!1067519))

(assert (= (and b!1067518 c!107497) b!1067520))

(assert (= (and b!1067518 (not c!107497)) b!1067515))

(assert (= (and b!1067520 res!712379) b!1067521))

(assert (= (and b!1067515 c!107494) b!1067523))

(assert (= (and b!1067515 (not c!107494)) b!1067516))

(declare-fun b_lambda!16585 () Bool)

(assert (=> (not b_lambda!16585) (not b!1067521)))

(declare-fun t!32160 () Bool)

(declare-fun tb!7145 () Bool)

(assert (=> (and start!94400 (= defaultEntry!963 defaultEntry!963) t!32160) tb!7145))

(declare-fun result!14743 () Bool)

(assert (=> tb!7145 (= result!14743 tp_is_empty!25551)))

(assert (=> b!1067521 t!32160))

(declare-fun b_and!34529 () Bool)

(assert (= b_and!34525 (and (=> t!32160 result!14743) b_and!34529)))

(declare-fun b_lambda!16587 () Bool)

(assert (=> (not b_lambda!16587) (not b!1067525)))

(assert (=> b!1067525 t!32160))

(declare-fun b_and!34531 () Bool)

(assert (= b_and!34529 (and (=> t!32160 result!14743) b_and!34531)))

(assert (=> b!1067524 m!986133))

(assert (=> b!1067524 m!986133))

(assert (=> b!1067524 m!986135))

(declare-fun m!986151 () Bool)

(assert (=> bm!45094 m!986151))

(assert (=> b!1067519 m!986133))

(assert (=> b!1067519 m!986133))

(assert (=> b!1067519 m!986135))

(declare-fun m!986153 () Bool)

(assert (=> b!1067526 m!986153))

(declare-fun m!986155 () Bool)

(assert (=> d!129123 m!986155))

(assert (=> d!129123 m!986097))

(declare-fun m!986157 () Bool)

(assert (=> b!1067521 m!986157))

(declare-fun m!986159 () Bool)

(assert (=> b!1067521 m!986159))

(assert (=> b!1067521 m!986133))

(declare-fun m!986161 () Bool)

(assert (=> b!1067521 m!986161))

(assert (=> b!1067521 m!986133))

(assert (=> b!1067521 m!986157))

(assert (=> b!1067521 m!986159))

(declare-fun m!986163 () Bool)

(assert (=> b!1067521 m!986163))

(declare-fun m!986165 () Bool)

(assert (=> b!1067516 m!986165))

(assert (=> b!1067520 m!986133))

(assert (=> b!1067520 m!986133))

(declare-fun m!986167 () Bool)

(assert (=> b!1067520 m!986167))

(assert (=> b!1067523 m!986151))

(declare-fun m!986169 () Bool)

(assert (=> b!1067525 m!986169))

(declare-fun m!986171 () Bool)

(assert (=> b!1067525 m!986171))

(assert (=> b!1067525 m!986157))

(assert (=> b!1067525 m!986169))

(declare-fun m!986173 () Bool)

(assert (=> b!1067525 m!986173))

(declare-fun m!986175 () Bool)

(assert (=> b!1067525 m!986175))

(assert (=> b!1067525 m!986159))

(assert (=> b!1067525 m!986133))

(assert (=> b!1067525 m!986157))

(assert (=> b!1067525 m!986159))

(assert (=> b!1067525 m!986163))

(assert (=> b!1067441 d!129123))

(declare-fun b!1067529 () Bool)

(declare-fun e!608892 () Bool)

(declare-fun e!608890 () Bool)

(assert (=> b!1067529 (= e!608892 e!608890)))

(declare-fun c!107498 () Bool)

(assert (=> b!1067529 (= c!107498 (bvslt #b00000000000000000000000000000000 (size!33278 _keys!1163)))))

(declare-fun bm!45095 () Bool)

(declare-fun call!45098 () ListLongMap!14243)

(assert (=> bm!45095 (= call!45098 (getCurrentListMapNoExtraKeys!3721 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1067530 () Bool)

(declare-fun lt!471494 () ListLongMap!14243)

(assert (=> b!1067530 (= e!608890 (isEmpty!943 lt!471494))))

(declare-fun b!1067531 () Bool)

(declare-fun e!608887 () ListLongMap!14243)

(assert (=> b!1067531 (= e!608887 (ListLongMap!14244 Nil!22831))))

(declare-fun b!1067532 () Bool)

(declare-fun e!608889 () Bool)

(assert (=> b!1067532 (= e!608889 e!608892)))

(declare-fun c!107501 () Bool)

(declare-fun e!608891 () Bool)

(assert (=> b!1067532 (= c!107501 e!608891)))

(declare-fun res!712382 () Bool)

(assert (=> b!1067532 (=> (not res!712382) (not e!608891))))

(assert (=> b!1067532 (= res!712382 (bvslt #b00000000000000000000000000000000 (size!33278 _keys!1163)))))

(declare-fun b!1067534 () Bool)

(declare-fun e!608893 () Bool)

(assert (=> b!1067534 (= e!608892 e!608893)))

(assert (=> b!1067534 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33278 _keys!1163)))))

(declare-fun res!712383 () Bool)

(assert (=> b!1067534 (= res!712383 (contains!6275 lt!471494 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1067534 (=> (not res!712383) (not e!608893))))

(declare-fun b!1067535 () Bool)

(assert (=> b!1067535 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33278 _keys!1163)))))

(assert (=> b!1067535 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33279 _values!955)))))

(assert (=> b!1067535 (= e!608893 (= (apply!925 lt!471494 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000)) (get!17067 (select (arr!32743 _values!955) #b00000000000000000000000000000000) (dynLambda!2032 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1067536 () Bool)

(declare-fun e!608888 () ListLongMap!14243)

(assert (=> b!1067536 (= e!608888 call!45098)))

(declare-fun b!1067537 () Bool)

(assert (=> b!1067537 (= e!608890 (= lt!471494 (getCurrentListMapNoExtraKeys!3721 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1067538 () Bool)

(assert (=> b!1067538 (= e!608887 e!608888)))

(declare-fun c!107500 () Bool)

(assert (=> b!1067538 (= c!107500 (validKeyInArray!0 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067539 () Bool)

(declare-fun lt!471493 () Unit!35071)

(declare-fun lt!471491 () Unit!35071)

(assert (=> b!1067539 (= lt!471493 lt!471491)))

(declare-fun lt!471490 () ListLongMap!14243)

(declare-fun lt!471492 () (_ BitVec 64))

(declare-fun lt!471495 () (_ BitVec 64))

(declare-fun lt!471496 () V!39203)

(assert (=> b!1067539 (not (contains!6275 (+!3160 lt!471490 (tuple2!16275 lt!471495 lt!471496)) lt!471492))))

(assert (=> b!1067539 (= lt!471491 (addStillNotContains!253 lt!471490 lt!471495 lt!471496 lt!471492))))

(assert (=> b!1067539 (= lt!471492 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1067539 (= lt!471496 (get!17067 (select (arr!32743 _values!955) #b00000000000000000000000000000000) (dynLambda!2032 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1067539 (= lt!471495 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1067539 (= lt!471490 call!45098)))

(assert (=> b!1067539 (= e!608888 (+!3160 call!45098 (tuple2!16275 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000) (get!17067 (select (arr!32743 _values!955) #b00000000000000000000000000000000) (dynLambda!2032 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1067540 () Bool)

(declare-fun res!712380 () Bool)

(assert (=> b!1067540 (=> (not res!712380) (not e!608889))))

(assert (=> b!1067540 (= res!712380 (not (contains!6275 lt!471494 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1067533 () Bool)

(assert (=> b!1067533 (= e!608891 (validKeyInArray!0 (select (arr!32742 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1067533 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!129125 () Bool)

(assert (=> d!129125 e!608889))

(declare-fun res!712381 () Bool)

(assert (=> d!129125 (=> (not res!712381) (not e!608889))))

(assert (=> d!129125 (= res!712381 (not (contains!6275 lt!471494 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129125 (= lt!471494 e!608887)))

(declare-fun c!107499 () Bool)

(assert (=> d!129125 (= c!107499 (bvsge #b00000000000000000000000000000000 (size!33278 _keys!1163)))))

(assert (=> d!129125 (validMask!0 mask!1515)))

(assert (=> d!129125 (= (getCurrentListMapNoExtraKeys!3721 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471494)))

(assert (= (and d!129125 c!107499) b!1067531))

(assert (= (and d!129125 (not c!107499)) b!1067538))

(assert (= (and b!1067538 c!107500) b!1067539))

(assert (= (and b!1067538 (not c!107500)) b!1067536))

(assert (= (or b!1067539 b!1067536) bm!45095))

(assert (= (and d!129125 res!712381) b!1067540))

(assert (= (and b!1067540 res!712380) b!1067532))

(assert (= (and b!1067532 res!712382) b!1067533))

(assert (= (and b!1067532 c!107501) b!1067534))

(assert (= (and b!1067532 (not c!107501)) b!1067529))

(assert (= (and b!1067534 res!712383) b!1067535))

(assert (= (and b!1067529 c!107498) b!1067537))

(assert (= (and b!1067529 (not c!107498)) b!1067530))

(declare-fun b_lambda!16589 () Bool)

(assert (=> (not b_lambda!16589) (not b!1067535)))

(assert (=> b!1067535 t!32160))

(declare-fun b_and!34533 () Bool)

(assert (= b_and!34531 (and (=> t!32160 result!14743) b_and!34533)))

(declare-fun b_lambda!16591 () Bool)

(assert (=> (not b_lambda!16591) (not b!1067539)))

(assert (=> b!1067539 t!32160))

(declare-fun b_and!34535 () Bool)

(assert (= b_and!34533 (and (=> t!32160 result!14743) b_and!34535)))

(assert (=> b!1067538 m!986133))

(assert (=> b!1067538 m!986133))

(assert (=> b!1067538 m!986135))

(declare-fun m!986177 () Bool)

(assert (=> bm!45095 m!986177))

(assert (=> b!1067533 m!986133))

(assert (=> b!1067533 m!986133))

(assert (=> b!1067533 m!986135))

(declare-fun m!986179 () Bool)

(assert (=> b!1067540 m!986179))

(declare-fun m!986181 () Bool)

(assert (=> d!129125 m!986181))

(assert (=> d!129125 m!986097))

(assert (=> b!1067535 m!986157))

(assert (=> b!1067535 m!986159))

(assert (=> b!1067535 m!986133))

(declare-fun m!986183 () Bool)

(assert (=> b!1067535 m!986183))

(assert (=> b!1067535 m!986133))

(assert (=> b!1067535 m!986157))

(assert (=> b!1067535 m!986159))

(assert (=> b!1067535 m!986163))

(declare-fun m!986185 () Bool)

(assert (=> b!1067530 m!986185))

(assert (=> b!1067534 m!986133))

(assert (=> b!1067534 m!986133))

(declare-fun m!986187 () Bool)

(assert (=> b!1067534 m!986187))

(assert (=> b!1067537 m!986177))

(declare-fun m!986189 () Bool)

(assert (=> b!1067539 m!986189))

(declare-fun m!986191 () Bool)

(assert (=> b!1067539 m!986191))

(assert (=> b!1067539 m!986157))

(assert (=> b!1067539 m!986189))

(declare-fun m!986193 () Bool)

(assert (=> b!1067539 m!986193))

(declare-fun m!986195 () Bool)

(assert (=> b!1067539 m!986195))

(assert (=> b!1067539 m!986159))

(assert (=> b!1067539 m!986133))

(assert (=> b!1067539 m!986157))

(assert (=> b!1067539 m!986159))

(assert (=> b!1067539 m!986163))

(assert (=> b!1067441 d!129125))

(declare-fun mapIsEmpty!40024 () Bool)

(declare-fun mapRes!40024 () Bool)

(assert (=> mapIsEmpty!40024 mapRes!40024))

(declare-fun b!1067548 () Bool)

(declare-fun e!608899 () Bool)

(assert (=> b!1067548 (= e!608899 tp_is_empty!25551)))

(declare-fun condMapEmpty!40024 () Bool)

(declare-fun mapDefault!40024 () ValueCell!12072)

(assert (=> mapNonEmpty!40018 (= condMapEmpty!40024 (= mapRest!40018 ((as const (Array (_ BitVec 32) ValueCell!12072)) mapDefault!40024)))))

(assert (=> mapNonEmpty!40018 (= tp!76666 (and e!608899 mapRes!40024))))

(declare-fun mapNonEmpty!40024 () Bool)

(declare-fun tp!76676 () Bool)

(declare-fun e!608898 () Bool)

(assert (=> mapNonEmpty!40024 (= mapRes!40024 (and tp!76676 e!608898))))

(declare-fun mapKey!40024 () (_ BitVec 32))

(declare-fun mapRest!40024 () (Array (_ BitVec 32) ValueCell!12072))

(declare-fun mapValue!40024 () ValueCell!12072)

(assert (=> mapNonEmpty!40024 (= mapRest!40018 (store mapRest!40024 mapKey!40024 mapValue!40024))))

(declare-fun b!1067547 () Bool)

(assert (=> b!1067547 (= e!608898 tp_is_empty!25551)))

(assert (= (and mapNonEmpty!40018 condMapEmpty!40024) mapIsEmpty!40024))

(assert (= (and mapNonEmpty!40018 (not condMapEmpty!40024)) mapNonEmpty!40024))

(assert (= (and mapNonEmpty!40024 ((_ is ValueCellFull!12072) mapValue!40024)) b!1067547))

(assert (= (and mapNonEmpty!40018 ((_ is ValueCellFull!12072) mapDefault!40024)) b!1067548))

(declare-fun m!986197 () Bool)

(assert (=> mapNonEmpty!40024 m!986197))

(declare-fun b_lambda!16593 () Bool)

(assert (= b_lambda!16591 (or (and start!94400 b_free!21741) b_lambda!16593)))

(declare-fun b_lambda!16595 () Bool)

(assert (= b_lambda!16589 (or (and start!94400 b_free!21741) b_lambda!16595)))

(declare-fun b_lambda!16597 () Bool)

(assert (= b_lambda!16587 (or (and start!94400 b_free!21741) b_lambda!16597)))

(declare-fun b_lambda!16599 () Bool)

(assert (= b_lambda!16585 (or (and start!94400 b_free!21741) b_lambda!16599)))

(check-sat b_and!34535 (not b!1067523) (not d!129123) (not b!1067521) (not b_lambda!16593) (not b!1067474) (not b!1067525) (not b!1067535) (not b!1067538) (not d!129121) (not b!1067477) (not b!1067530) (not d!129125) tp_is_empty!25551 (not b!1067539) (not b!1067520) (not b!1067526) (not b!1067540) (not b!1067519) (not b_lambda!16597) (not b!1067490) (not b_lambda!16595) (not b_next!21741) (not b!1067537) (not mapNonEmpty!40024) (not b!1067488) (not b!1067476) (not bm!45094) (not b!1067533) (not bm!45088) (not b!1067516) (not bm!45095) (not b!1067524) (not b!1067534) (not bm!45091) (not b_lambda!16599))
(check-sat b_and!34535 (not b_next!21741))
