; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94324 () Bool)

(assert start!94324)

(declare-fun b_free!21687 () Bool)

(declare-fun b_next!21687 () Bool)

(assert (=> start!94324 (= b_free!21687 (not b_next!21687))))

(declare-fun tp!76502 () Bool)

(declare-fun b_and!34459 () Bool)

(assert (=> start!94324 (= tp!76502 b_and!34459)))

(declare-fun b!1066686 () Bool)

(declare-fun e!608306 () Bool)

(declare-fun e!608304 () Bool)

(assert (=> b!1066686 (= e!608306 e!608304)))

(declare-fun res!711937 () Bool)

(assert (=> b!1066686 (=> res!711937 e!608304)))

(declare-datatypes ((V!39131 0))(
  ( (V!39132 (val!12799 Int)) )
))
(declare-datatypes ((tuple2!16236 0))(
  ( (tuple2!16237 (_1!8129 (_ BitVec 64)) (_2!8129 V!39131)) )
))
(declare-datatypes ((List!22798 0))(
  ( (Nil!22795) (Cons!22794 (h!24003 tuple2!16236) (t!32119 List!22798)) )
))
(declare-datatypes ((ListLongMap!14205 0))(
  ( (ListLongMap!14206 (toList!7118 List!22798)) )
))
(declare-fun lt!471040 () ListLongMap!14205)

(declare-fun lt!471044 () ListLongMap!14205)

(declare-fun -!627 (ListLongMap!14205 (_ BitVec 64)) ListLongMap!14205)

(assert (=> b!1066686 (= res!711937 (not (= (-!627 lt!471040 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471044)))))

(declare-fun lt!471045 () ListLongMap!14205)

(declare-fun lt!471041 () ListLongMap!14205)

(assert (=> b!1066686 (= (-!627 lt!471045 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471041)))

(declare-datatypes ((Unit!35031 0))(
  ( (Unit!35032) )
))
(declare-fun lt!471043 () Unit!35031)

(declare-fun zeroValueBefore!47 () V!39131)

(declare-fun addThenRemoveForNewKeyIsSame!36 (ListLongMap!14205 (_ BitVec 64) V!39131) Unit!35031)

(assert (=> b!1066686 (= lt!471043 (addThenRemoveForNewKeyIsSame!36 lt!471041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!471042 () ListLongMap!14205)

(assert (=> b!1066686 (and (= lt!471040 lt!471045) (= lt!471044 lt!471042))))

(declare-fun +!3158 (ListLongMap!14205 tuple2!16236) ListLongMap!14205)

(assert (=> b!1066686 (= lt!471045 (+!3158 lt!471041 (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12045 0))(
  ( (ValueCellFull!12045 (v!15412 V!39131)) (EmptyCell!12045) )
))
(declare-datatypes ((array!67979 0))(
  ( (array!67980 (arr!32691 (Array (_ BitVec 32) ValueCell!12045)) (size!33227 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67979)

(declare-fun minValue!907 () V!39131)

(declare-datatypes ((array!67981 0))(
  ( (array!67982 (arr!32692 (Array (_ BitVec 32) (_ BitVec 64))) (size!33228 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67981)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39131)

(declare-fun getCurrentListMap!4071 (array!67981 array!67979 (_ BitVec 32) (_ BitVec 32) V!39131 V!39131 (_ BitVec 32) Int) ListLongMap!14205)

(assert (=> b!1066686 (= lt!471044 (getCurrentListMap!4071 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066686 (= lt!471040 (getCurrentListMap!4071 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066687 () Bool)

(declare-fun e!608307 () Bool)

(declare-fun tp_is_empty!25497 () Bool)

(assert (=> b!1066687 (= e!608307 tp_is_empty!25497)))

(declare-fun b!1066688 () Bool)

(declare-fun e!608305 () Bool)

(assert (=> b!1066688 (= e!608305 (not e!608306))))

(declare-fun res!711934 () Bool)

(assert (=> b!1066688 (=> res!711934 e!608306)))

(assert (=> b!1066688 (= res!711934 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066688 (= lt!471041 lt!471042)))

(declare-fun lt!471039 () Unit!35031)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!740 (array!67981 array!67979 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39131 V!39131 V!39131 V!39131 (_ BitVec 32) Int) Unit!35031)

(assert (=> b!1066688 (= lt!471039 (lemmaNoChangeToArrayThenSameMapNoExtras!740 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3703 (array!67981 array!67979 (_ BitVec 32) (_ BitVec 32) V!39131 V!39131 (_ BitVec 32) Int) ListLongMap!14205)

(assert (=> b!1066688 (= lt!471042 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066688 (= lt!471041 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39934 () Bool)

(declare-fun mapRes!39934 () Bool)

(declare-fun tp!76501 () Bool)

(assert (=> mapNonEmpty!39934 (= mapRes!39934 (and tp!76501 e!608307))))

(declare-fun mapValue!39934 () ValueCell!12045)

(declare-fun mapRest!39934 () (Array (_ BitVec 32) ValueCell!12045))

(declare-fun mapKey!39934 () (_ BitVec 32))

(assert (=> mapNonEmpty!39934 (= (arr!32691 _values!955) (store mapRest!39934 mapKey!39934 mapValue!39934))))

(declare-fun b!1066689 () Bool)

(declare-fun e!608303 () Bool)

(declare-fun e!608308 () Bool)

(assert (=> b!1066689 (= e!608303 (and e!608308 mapRes!39934))))

(declare-fun condMapEmpty!39934 () Bool)

(declare-fun mapDefault!39934 () ValueCell!12045)

(assert (=> b!1066689 (= condMapEmpty!39934 (= (arr!32691 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12045)) mapDefault!39934)))))

(declare-fun b!1066690 () Bool)

(declare-fun res!711936 () Bool)

(assert (=> b!1066690 (=> (not res!711936) (not e!608305))))

(assert (=> b!1066690 (= res!711936 (and (= (size!33227 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33228 _keys!1163) (size!33227 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066691 () Bool)

(declare-fun res!711932 () Bool)

(assert (=> b!1066691 (=> (not res!711932) (not e!608305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67981 (_ BitVec 32)) Bool)

(assert (=> b!1066691 (= res!711932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066692 () Bool)

(assert (=> b!1066692 (= e!608308 tp_is_empty!25497)))

(declare-fun res!711935 () Bool)

(assert (=> start!94324 (=> (not res!711935) (not e!608305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94324 (= res!711935 (validMask!0 mask!1515))))

(assert (=> start!94324 e!608305))

(assert (=> start!94324 true))

(assert (=> start!94324 tp_is_empty!25497))

(declare-fun array_inv!25310 (array!67979) Bool)

(assert (=> start!94324 (and (array_inv!25310 _values!955) e!608303)))

(assert (=> start!94324 tp!76502))

(declare-fun array_inv!25311 (array!67981) Bool)

(assert (=> start!94324 (array_inv!25311 _keys!1163)))

(declare-fun mapIsEmpty!39934 () Bool)

(assert (=> mapIsEmpty!39934 mapRes!39934))

(declare-fun b!1066693 () Bool)

(declare-fun res!711933 () Bool)

(assert (=> b!1066693 (=> (not res!711933) (not e!608305))))

(declare-datatypes ((List!22799 0))(
  ( (Nil!22796) (Cons!22795 (h!24004 (_ BitVec 64)) (t!32120 List!22799)) )
))
(declare-fun arrayNoDuplicates!0 (array!67981 (_ BitVec 32) List!22799) Bool)

(assert (=> b!1066693 (= res!711933 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22796))))

(declare-fun b!1066694 () Bool)

(assert (=> b!1066694 (= e!608304 (bvsle #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(assert (= (and start!94324 res!711935) b!1066690))

(assert (= (and b!1066690 res!711936) b!1066691))

(assert (= (and b!1066691 res!711932) b!1066693))

(assert (= (and b!1066693 res!711933) b!1066688))

(assert (= (and b!1066688 (not res!711934)) b!1066686))

(assert (= (and b!1066686 (not res!711937)) b!1066694))

(assert (= (and b!1066689 condMapEmpty!39934) mapIsEmpty!39934))

(assert (= (and b!1066689 (not condMapEmpty!39934)) mapNonEmpty!39934))

(get-info :version)

(assert (= (and mapNonEmpty!39934 ((_ is ValueCellFull!12045) mapValue!39934)) b!1066687))

(assert (= (and b!1066689 ((_ is ValueCellFull!12045) mapDefault!39934)) b!1066692))

(assert (= start!94324 b!1066689))

(declare-fun m!985403 () Bool)

(assert (=> b!1066693 m!985403))

(declare-fun m!985405 () Bool)

(assert (=> start!94324 m!985405))

(declare-fun m!985407 () Bool)

(assert (=> start!94324 m!985407))

(declare-fun m!985409 () Bool)

(assert (=> start!94324 m!985409))

(declare-fun m!985411 () Bool)

(assert (=> b!1066686 m!985411))

(declare-fun m!985413 () Bool)

(assert (=> b!1066686 m!985413))

(declare-fun m!985415 () Bool)

(assert (=> b!1066686 m!985415))

(declare-fun m!985417 () Bool)

(assert (=> b!1066686 m!985417))

(declare-fun m!985419 () Bool)

(assert (=> b!1066686 m!985419))

(declare-fun m!985421 () Bool)

(assert (=> b!1066686 m!985421))

(declare-fun m!985423 () Bool)

(assert (=> b!1066688 m!985423))

(declare-fun m!985425 () Bool)

(assert (=> b!1066688 m!985425))

(declare-fun m!985427 () Bool)

(assert (=> b!1066688 m!985427))

(declare-fun m!985429 () Bool)

(assert (=> mapNonEmpty!39934 m!985429))

(declare-fun m!985431 () Bool)

(assert (=> b!1066691 m!985431))

(check-sat tp_is_empty!25497 (not b_next!21687) (not start!94324) (not b!1066686) (not mapNonEmpty!39934) (not b!1066688) (not b!1066691) (not b!1066693) b_and!34459)
(check-sat b_and!34459 (not b_next!21687))
(get-model)

(declare-fun d!129065 () Bool)

(declare-fun res!711961 () Bool)

(declare-fun e!608336 () Bool)

(assert (=> d!129065 (=> res!711961 e!608336)))

(assert (=> d!129065 (= res!711961 (bvsge #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(assert (=> d!129065 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!608336)))

(declare-fun b!1066730 () Bool)

(declare-fun e!608338 () Bool)

(declare-fun call!45053 () Bool)

(assert (=> b!1066730 (= e!608338 call!45053)))

(declare-fun bm!45050 () Bool)

(assert (=> bm!45050 (= call!45053 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1066731 () Bool)

(declare-fun e!608337 () Bool)

(assert (=> b!1066731 (= e!608337 call!45053)))

(declare-fun b!1066732 () Bool)

(assert (=> b!1066732 (= e!608336 e!608338)))

(declare-fun c!107436 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1066732 (= c!107436 (validKeyInArray!0 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066733 () Bool)

(assert (=> b!1066733 (= e!608338 e!608337)))

(declare-fun lt!471073 () (_ BitVec 64))

(assert (=> b!1066733 (= lt!471073 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471074 () Unit!35031)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67981 (_ BitVec 64) (_ BitVec 32)) Unit!35031)

(assert (=> b!1066733 (= lt!471074 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!471073 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1066733 (arrayContainsKey!0 _keys!1163 lt!471073 #b00000000000000000000000000000000)))

(declare-fun lt!471075 () Unit!35031)

(assert (=> b!1066733 (= lt!471075 lt!471074)))

(declare-fun res!711960 () Bool)

(declare-datatypes ((SeekEntryResult!9877 0))(
  ( (MissingZero!9877 (index!41879 (_ BitVec 32))) (Found!9877 (index!41880 (_ BitVec 32))) (Intermediate!9877 (undefined!10689 Bool) (index!41881 (_ BitVec 32)) (x!95506 (_ BitVec 32))) (Undefined!9877) (MissingVacant!9877 (index!41882 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67981 (_ BitVec 32)) SeekEntryResult!9877)

(assert (=> b!1066733 (= res!711960 (= (seekEntryOrOpen!0 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9877 #b00000000000000000000000000000000)))))

(assert (=> b!1066733 (=> (not res!711960) (not e!608337))))

(assert (= (and d!129065 (not res!711961)) b!1066732))

(assert (= (and b!1066732 c!107436) b!1066733))

(assert (= (and b!1066732 (not c!107436)) b!1066730))

(assert (= (and b!1066733 res!711960) b!1066731))

(assert (= (or b!1066731 b!1066730) bm!45050))

(declare-fun m!985463 () Bool)

(assert (=> bm!45050 m!985463))

(declare-fun m!985465 () Bool)

(assert (=> b!1066732 m!985465))

(assert (=> b!1066732 m!985465))

(declare-fun m!985467 () Bool)

(assert (=> b!1066732 m!985467))

(assert (=> b!1066733 m!985465))

(declare-fun m!985469 () Bool)

(assert (=> b!1066733 m!985469))

(declare-fun m!985471 () Bool)

(assert (=> b!1066733 m!985471))

(assert (=> b!1066733 m!985465))

(declare-fun m!985473 () Bool)

(assert (=> b!1066733 m!985473))

(assert (=> b!1066691 d!129065))

(declare-fun d!129067 () Bool)

(declare-fun e!608341 () Bool)

(assert (=> d!129067 e!608341))

(declare-fun res!711966 () Bool)

(assert (=> d!129067 (=> (not res!711966) (not e!608341))))

(declare-fun lt!471084 () ListLongMap!14205)

(declare-fun contains!6271 (ListLongMap!14205 (_ BitVec 64)) Bool)

(assert (=> d!129067 (= res!711966 (contains!6271 lt!471084 (_1!8129 (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!471087 () List!22798)

(assert (=> d!129067 (= lt!471084 (ListLongMap!14206 lt!471087))))

(declare-fun lt!471086 () Unit!35031)

(declare-fun lt!471085 () Unit!35031)

(assert (=> d!129067 (= lt!471086 lt!471085)))

(declare-datatypes ((Option!651 0))(
  ( (Some!650 (v!15414 V!39131)) (None!649) )
))
(declare-fun getValueByKey!600 (List!22798 (_ BitVec 64)) Option!651)

(assert (=> d!129067 (= (getValueByKey!600 lt!471087 (_1!8129 (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!650 (_2!8129 (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!283 (List!22798 (_ BitVec 64) V!39131) Unit!35031)

(assert (=> d!129067 (= lt!471085 (lemmaContainsTupThenGetReturnValue!283 lt!471087 (_1!8129 (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8129 (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!376 (List!22798 (_ BitVec 64) V!39131) List!22798)

(assert (=> d!129067 (= lt!471087 (insertStrictlySorted!376 (toList!7118 lt!471041) (_1!8129 (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8129 (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129067 (= (+!3158 lt!471041 (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!471084)))

(declare-fun b!1066738 () Bool)

(declare-fun res!711967 () Bool)

(assert (=> b!1066738 (=> (not res!711967) (not e!608341))))

(assert (=> b!1066738 (= res!711967 (= (getValueByKey!600 (toList!7118 lt!471084) (_1!8129 (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!650 (_2!8129 (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1066739 () Bool)

(declare-fun contains!6272 (List!22798 tuple2!16236) Bool)

(assert (=> b!1066739 (= e!608341 (contains!6272 (toList!7118 lt!471084) (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129067 res!711966) b!1066738))

(assert (= (and b!1066738 res!711967) b!1066739))

(declare-fun m!985475 () Bool)

(assert (=> d!129067 m!985475))

(declare-fun m!985477 () Bool)

(assert (=> d!129067 m!985477))

(declare-fun m!985479 () Bool)

(assert (=> d!129067 m!985479))

(declare-fun m!985481 () Bool)

(assert (=> d!129067 m!985481))

(declare-fun m!985483 () Bool)

(assert (=> b!1066738 m!985483))

(declare-fun m!985485 () Bool)

(assert (=> b!1066739 m!985485))

(assert (=> b!1066686 d!129067))

(declare-fun d!129069 () Bool)

(declare-fun lt!471090 () ListLongMap!14205)

(assert (=> d!129069 (not (contains!6271 lt!471090 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!70 (List!22798 (_ BitVec 64)) List!22798)

(assert (=> d!129069 (= lt!471090 (ListLongMap!14206 (removeStrictlySorted!70 (toList!7118 lt!471040) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129069 (= (-!627 lt!471040 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471090)))

(declare-fun bs!31391 () Bool)

(assert (= bs!31391 d!129069))

(declare-fun m!985487 () Bool)

(assert (=> bs!31391 m!985487))

(declare-fun m!985489 () Bool)

(assert (=> bs!31391 m!985489))

(assert (=> b!1066686 d!129069))

(declare-fun d!129071 () Bool)

(assert (=> d!129071 (= (-!627 (+!3158 lt!471041 (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!471041)))

(declare-fun lt!471093 () Unit!35031)

(declare-fun choose!1732 (ListLongMap!14205 (_ BitVec 64) V!39131) Unit!35031)

(assert (=> d!129071 (= lt!471093 (choose!1732 lt!471041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> d!129071 (not (contains!6271 lt!471041 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129071 (= (addThenRemoveForNewKeyIsSame!36 lt!471041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) lt!471093)))

(declare-fun bs!31392 () Bool)

(assert (= bs!31392 d!129071))

(assert (=> bs!31392 m!985411))

(assert (=> bs!31392 m!985411))

(declare-fun m!985491 () Bool)

(assert (=> bs!31392 m!985491))

(declare-fun m!985493 () Bool)

(assert (=> bs!31392 m!985493))

(declare-fun m!985495 () Bool)

(assert (=> bs!31392 m!985495))

(assert (=> b!1066686 d!129071))

(declare-fun d!129073 () Bool)

(declare-fun lt!471094 () ListLongMap!14205)

(assert (=> d!129073 (not (contains!6271 lt!471094 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129073 (= lt!471094 (ListLongMap!14206 (removeStrictlySorted!70 (toList!7118 lt!471045) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129073 (= (-!627 lt!471045 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471094)))

(declare-fun bs!31393 () Bool)

(assert (= bs!31393 d!129073))

(declare-fun m!985497 () Bool)

(assert (=> bs!31393 m!985497))

(declare-fun m!985499 () Bool)

(assert (=> bs!31393 m!985499))

(assert (=> b!1066686 d!129073))

(declare-fun bm!45065 () Bool)

(declare-fun call!45073 () ListLongMap!14205)

(assert (=> bm!45065 (= call!45073 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066782 () Bool)

(declare-fun e!608378 () ListLongMap!14205)

(declare-fun call!45069 () ListLongMap!14205)

(assert (=> b!1066782 (= e!608378 call!45069)))

(declare-fun b!1066783 () Bool)

(declare-fun e!608380 () Bool)

(assert (=> b!1066783 (= e!608380 (validKeyInArray!0 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066784 () Bool)

(declare-fun e!608373 () Bool)

(declare-fun e!608372 () Bool)

(assert (=> b!1066784 (= e!608373 e!608372)))

(declare-fun res!711994 () Bool)

(declare-fun call!45071 () Bool)

(assert (=> b!1066784 (= res!711994 call!45071)))

(assert (=> b!1066784 (=> (not res!711994) (not e!608372))))

(declare-fun b!1066785 () Bool)

(declare-fun e!608379 () Bool)

(declare-fun e!608374 () Bool)

(assert (=> b!1066785 (= e!608379 e!608374)))

(declare-fun res!711990 () Bool)

(assert (=> b!1066785 (=> (not res!711990) (not e!608374))))

(declare-fun lt!471154 () ListLongMap!14205)

(assert (=> b!1066785 (= res!711990 (contains!6271 lt!471154 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066785 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(declare-fun bm!45066 () Bool)

(assert (=> bm!45066 (= call!45071 (contains!6271 lt!471154 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1066787 () Bool)

(declare-fun e!608375 () Unit!35031)

(declare-fun lt!471143 () Unit!35031)

(assert (=> b!1066787 (= e!608375 lt!471143)))

(declare-fun lt!471155 () ListLongMap!14205)

(assert (=> b!1066787 (= lt!471155 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471141 () (_ BitVec 64))

(assert (=> b!1066787 (= lt!471141 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471156 () (_ BitVec 64))

(assert (=> b!1066787 (= lt!471156 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471144 () Unit!35031)

(declare-fun addStillContains!640 (ListLongMap!14205 (_ BitVec 64) V!39131 (_ BitVec 64)) Unit!35031)

(assert (=> b!1066787 (= lt!471144 (addStillContains!640 lt!471155 lt!471141 zeroValueAfter!47 lt!471156))))

(assert (=> b!1066787 (contains!6271 (+!3158 lt!471155 (tuple2!16237 lt!471141 zeroValueAfter!47)) lt!471156)))

(declare-fun lt!471147 () Unit!35031)

(assert (=> b!1066787 (= lt!471147 lt!471144)))

(declare-fun lt!471159 () ListLongMap!14205)

(assert (=> b!1066787 (= lt!471159 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471146 () (_ BitVec 64))

(assert (=> b!1066787 (= lt!471146 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471150 () (_ BitVec 64))

(assert (=> b!1066787 (= lt!471150 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471160 () Unit!35031)

(declare-fun addApplyDifferent!500 (ListLongMap!14205 (_ BitVec 64) V!39131 (_ BitVec 64)) Unit!35031)

(assert (=> b!1066787 (= lt!471160 (addApplyDifferent!500 lt!471159 lt!471146 minValue!907 lt!471150))))

(declare-fun apply!924 (ListLongMap!14205 (_ BitVec 64)) V!39131)

(assert (=> b!1066787 (= (apply!924 (+!3158 lt!471159 (tuple2!16237 lt!471146 minValue!907)) lt!471150) (apply!924 lt!471159 lt!471150))))

(declare-fun lt!471139 () Unit!35031)

(assert (=> b!1066787 (= lt!471139 lt!471160)))

(declare-fun lt!471142 () ListLongMap!14205)

(assert (=> b!1066787 (= lt!471142 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471153 () (_ BitVec 64))

(assert (=> b!1066787 (= lt!471153 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471151 () (_ BitVec 64))

(assert (=> b!1066787 (= lt!471151 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471157 () Unit!35031)

(assert (=> b!1066787 (= lt!471157 (addApplyDifferent!500 lt!471142 lt!471153 zeroValueAfter!47 lt!471151))))

(assert (=> b!1066787 (= (apply!924 (+!3158 lt!471142 (tuple2!16237 lt!471153 zeroValueAfter!47)) lt!471151) (apply!924 lt!471142 lt!471151))))

(declare-fun lt!471149 () Unit!35031)

(assert (=> b!1066787 (= lt!471149 lt!471157)))

(declare-fun lt!471140 () ListLongMap!14205)

(assert (=> b!1066787 (= lt!471140 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471145 () (_ BitVec 64))

(assert (=> b!1066787 (= lt!471145 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471158 () (_ BitVec 64))

(assert (=> b!1066787 (= lt!471158 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1066787 (= lt!471143 (addApplyDifferent!500 lt!471140 lt!471145 minValue!907 lt!471158))))

(assert (=> b!1066787 (= (apply!924 (+!3158 lt!471140 (tuple2!16237 lt!471145 minValue!907)) lt!471158) (apply!924 lt!471140 lt!471158))))

(declare-fun bm!45067 () Bool)

(declare-fun call!45074 () ListLongMap!14205)

(assert (=> bm!45067 (= call!45069 call!45074)))

(declare-fun bm!45068 () Bool)

(declare-fun call!45072 () ListLongMap!14205)

(assert (=> bm!45068 (= call!45072 call!45073)))

(declare-fun b!1066788 () Bool)

(declare-fun res!711988 () Bool)

(declare-fun e!608376 () Bool)

(assert (=> b!1066788 (=> (not res!711988) (not e!608376))))

(declare-fun e!608369 () Bool)

(assert (=> b!1066788 (= res!711988 e!608369)))

(declare-fun c!107452 () Bool)

(assert (=> b!1066788 (= c!107452 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45069 () Bool)

(declare-fun call!45068 () ListLongMap!14205)

(assert (=> bm!45069 (= call!45068 call!45072)))

(declare-fun b!1066789 () Bool)

(declare-fun e!608377 () ListLongMap!14205)

(assert (=> b!1066789 (= e!608377 call!45068)))

(declare-fun b!1066790 () Bool)

(assert (=> b!1066790 (= e!608373 (not call!45071))))

(declare-fun b!1066791 () Bool)

(assert (=> b!1066791 (= e!608372 (= (apply!924 lt!471154 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1066792 () Bool)

(declare-fun call!45070 () Bool)

(assert (=> b!1066792 (= e!608369 (not call!45070))))

(declare-fun b!1066793 () Bool)

(declare-fun e!608370 () Bool)

(assert (=> b!1066793 (= e!608370 (validKeyInArray!0 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066794 () Bool)

(assert (=> b!1066794 (= e!608376 e!608373)))

(declare-fun c!107449 () Bool)

(assert (=> b!1066794 (= c!107449 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1066795 () Bool)

(assert (=> b!1066795 (= e!608377 call!45069)))

(declare-fun b!1066786 () Bool)

(declare-fun c!107450 () Bool)

(assert (=> b!1066786 (= c!107450 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066786 (= e!608378 e!608377)))

(declare-fun d!129075 () Bool)

(assert (=> d!129075 e!608376))

(declare-fun res!711989 () Bool)

(assert (=> d!129075 (=> (not res!711989) (not e!608376))))

(assert (=> d!129075 (= res!711989 (or (bvsge #b00000000000000000000000000000000 (size!33228 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))))

(declare-fun lt!471152 () ListLongMap!14205)

(assert (=> d!129075 (= lt!471154 lt!471152)))

(declare-fun lt!471148 () Unit!35031)

(assert (=> d!129075 (= lt!471148 e!608375)))

(declare-fun c!107451 () Bool)

(assert (=> d!129075 (= c!107451 e!608370)))

(declare-fun res!711991 () Bool)

(assert (=> d!129075 (=> (not res!711991) (not e!608370))))

(assert (=> d!129075 (= res!711991 (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(declare-fun e!608371 () ListLongMap!14205)

(assert (=> d!129075 (= lt!471152 e!608371)))

(declare-fun c!107454 () Bool)

(assert (=> d!129075 (= c!107454 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129075 (validMask!0 mask!1515)))

(assert (=> d!129075 (= (getCurrentListMap!4071 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471154)))

(declare-fun b!1066796 () Bool)

(assert (=> b!1066796 (= e!608371 (+!3158 call!45074 (tuple2!16237 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1066797 () Bool)

(declare-fun res!711992 () Bool)

(assert (=> b!1066797 (=> (not res!711992) (not e!608376))))

(assert (=> b!1066797 (= res!711992 e!608379)))

(declare-fun res!711993 () Bool)

(assert (=> b!1066797 (=> res!711993 e!608379)))

(assert (=> b!1066797 (= res!711993 (not e!608380))))

(declare-fun res!711987 () Bool)

(assert (=> b!1066797 (=> (not res!711987) (not e!608380))))

(assert (=> b!1066797 (= res!711987 (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(declare-fun b!1066798 () Bool)

(assert (=> b!1066798 (= e!608371 e!608378)))

(declare-fun c!107453 () Bool)

(assert (=> b!1066798 (= c!107453 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45070 () Bool)

(assert (=> bm!45070 (= call!45070 (contains!6271 lt!471154 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45071 () Bool)

(assert (=> bm!45071 (= call!45074 (+!3158 (ite c!107454 call!45073 (ite c!107453 call!45072 call!45068)) (ite (or c!107454 c!107453) (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16237 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1066799 () Bool)

(declare-fun get!17048 (ValueCell!12045 V!39131) V!39131)

(declare-fun dynLambda!2031 (Int (_ BitVec 64)) V!39131)

(assert (=> b!1066799 (= e!608374 (= (apply!924 lt!471154 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)) (get!17048 (select (arr!32691 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1066799 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33227 _values!955)))))

(assert (=> b!1066799 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(declare-fun b!1066800 () Bool)

(declare-fun e!608368 () Bool)

(assert (=> b!1066800 (= e!608368 (= (apply!924 lt!471154 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1066801 () Bool)

(assert (=> b!1066801 (= e!608369 e!608368)))

(declare-fun res!711986 () Bool)

(assert (=> b!1066801 (= res!711986 call!45070)))

(assert (=> b!1066801 (=> (not res!711986) (not e!608368))))

(declare-fun b!1066802 () Bool)

(declare-fun Unit!35035 () Unit!35031)

(assert (=> b!1066802 (= e!608375 Unit!35035)))

(assert (= (and d!129075 c!107454) b!1066796))

(assert (= (and d!129075 (not c!107454)) b!1066798))

(assert (= (and b!1066798 c!107453) b!1066782))

(assert (= (and b!1066798 (not c!107453)) b!1066786))

(assert (= (and b!1066786 c!107450) b!1066795))

(assert (= (and b!1066786 (not c!107450)) b!1066789))

(assert (= (or b!1066795 b!1066789) bm!45069))

(assert (= (or b!1066782 bm!45069) bm!45068))

(assert (= (or b!1066782 b!1066795) bm!45067))

(assert (= (or b!1066796 bm!45068) bm!45065))

(assert (= (or b!1066796 bm!45067) bm!45071))

(assert (= (and d!129075 res!711991) b!1066793))

(assert (= (and d!129075 c!107451) b!1066787))

(assert (= (and d!129075 (not c!107451)) b!1066802))

(assert (= (and d!129075 res!711989) b!1066797))

(assert (= (and b!1066797 res!711987) b!1066783))

(assert (= (and b!1066797 (not res!711993)) b!1066785))

(assert (= (and b!1066785 res!711990) b!1066799))

(assert (= (and b!1066797 res!711992) b!1066788))

(assert (= (and b!1066788 c!107452) b!1066801))

(assert (= (and b!1066788 (not c!107452)) b!1066792))

(assert (= (and b!1066801 res!711986) b!1066800))

(assert (= (or b!1066801 b!1066792) bm!45070))

(assert (= (and b!1066788 res!711988) b!1066794))

(assert (= (and b!1066794 c!107449) b!1066784))

(assert (= (and b!1066794 (not c!107449)) b!1066790))

(assert (= (and b!1066784 res!711994) b!1066791))

(assert (= (or b!1066784 b!1066790) bm!45066))

(declare-fun b_lambda!16561 () Bool)

(assert (=> (not b_lambda!16561) (not b!1066799)))

(declare-fun t!32124 () Bool)

(declare-fun tb!7143 () Bool)

(assert (=> (and start!94324 (= defaultEntry!963 defaultEntry!963) t!32124) tb!7143))

(declare-fun result!14737 () Bool)

(assert (=> tb!7143 (= result!14737 tp_is_empty!25497)))

(assert (=> b!1066799 t!32124))

(declare-fun b_and!34463 () Bool)

(assert (= b_and!34459 (and (=> t!32124 result!14737) b_and!34463)))

(declare-fun m!985501 () Bool)

(assert (=> bm!45070 m!985501))

(assert (=> b!1066793 m!985465))

(assert (=> b!1066793 m!985465))

(assert (=> b!1066793 m!985467))

(declare-fun m!985503 () Bool)

(assert (=> b!1066787 m!985503))

(declare-fun m!985505 () Bool)

(assert (=> b!1066787 m!985505))

(declare-fun m!985507 () Bool)

(assert (=> b!1066787 m!985507))

(declare-fun m!985509 () Bool)

(assert (=> b!1066787 m!985509))

(declare-fun m!985511 () Bool)

(assert (=> b!1066787 m!985511))

(assert (=> b!1066787 m!985509))

(declare-fun m!985513 () Bool)

(assert (=> b!1066787 m!985513))

(declare-fun m!985515 () Bool)

(assert (=> b!1066787 m!985515))

(declare-fun m!985517 () Bool)

(assert (=> b!1066787 m!985517))

(declare-fun m!985519 () Bool)

(assert (=> b!1066787 m!985519))

(declare-fun m!985521 () Bool)

(assert (=> b!1066787 m!985521))

(declare-fun m!985523 () Bool)

(assert (=> b!1066787 m!985523))

(assert (=> b!1066787 m!985523))

(declare-fun m!985525 () Bool)

(assert (=> b!1066787 m!985525))

(assert (=> b!1066787 m!985425))

(assert (=> b!1066787 m!985513))

(assert (=> b!1066787 m!985503))

(declare-fun m!985527 () Bool)

(assert (=> b!1066787 m!985527))

(assert (=> b!1066787 m!985465))

(declare-fun m!985529 () Bool)

(assert (=> b!1066787 m!985529))

(declare-fun m!985531 () Bool)

(assert (=> b!1066787 m!985531))

(assert (=> b!1066783 m!985465))

(assert (=> b!1066783 m!985465))

(assert (=> b!1066783 m!985467))

(declare-fun m!985533 () Bool)

(assert (=> bm!45071 m!985533))

(declare-fun m!985535 () Bool)

(assert (=> b!1066791 m!985535))

(declare-fun m!985537 () Bool)

(assert (=> b!1066800 m!985537))

(assert (=> bm!45065 m!985425))

(assert (=> b!1066785 m!985465))

(assert (=> b!1066785 m!985465))

(declare-fun m!985539 () Bool)

(assert (=> b!1066785 m!985539))

(declare-fun m!985541 () Bool)

(assert (=> b!1066796 m!985541))

(declare-fun m!985543 () Bool)

(assert (=> b!1066799 m!985543))

(assert (=> b!1066799 m!985465))

(assert (=> b!1066799 m!985465))

(declare-fun m!985545 () Bool)

(assert (=> b!1066799 m!985545))

(assert (=> b!1066799 m!985543))

(declare-fun m!985547 () Bool)

(assert (=> b!1066799 m!985547))

(declare-fun m!985549 () Bool)

(assert (=> b!1066799 m!985549))

(assert (=> b!1066799 m!985547))

(assert (=> d!129075 m!985405))

(declare-fun m!985551 () Bool)

(assert (=> bm!45066 m!985551))

(assert (=> b!1066686 d!129075))

(declare-fun call!45080 () ListLongMap!14205)

(declare-fun bm!45072 () Bool)

(assert (=> bm!45072 (= call!45080 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066805 () Bool)

(declare-fun e!608391 () ListLongMap!14205)

(declare-fun call!45076 () ListLongMap!14205)

(assert (=> b!1066805 (= e!608391 call!45076)))

(declare-fun b!1066806 () Bool)

(declare-fun e!608393 () Bool)

(assert (=> b!1066806 (= e!608393 (validKeyInArray!0 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066807 () Bool)

(declare-fun e!608386 () Bool)

(declare-fun e!608385 () Bool)

(assert (=> b!1066807 (= e!608386 e!608385)))

(declare-fun res!712003 () Bool)

(declare-fun call!45078 () Bool)

(assert (=> b!1066807 (= res!712003 call!45078)))

(assert (=> b!1066807 (=> (not res!712003) (not e!608385))))

(declare-fun b!1066808 () Bool)

(declare-fun e!608392 () Bool)

(declare-fun e!608387 () Bool)

(assert (=> b!1066808 (= e!608392 e!608387)))

(declare-fun res!711999 () Bool)

(assert (=> b!1066808 (=> (not res!711999) (not e!608387))))

(declare-fun lt!471176 () ListLongMap!14205)

(assert (=> b!1066808 (= res!711999 (contains!6271 lt!471176 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066808 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(declare-fun bm!45073 () Bool)

(assert (=> bm!45073 (= call!45078 (contains!6271 lt!471176 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1066810 () Bool)

(declare-fun e!608388 () Unit!35031)

(declare-fun lt!471165 () Unit!35031)

(assert (=> b!1066810 (= e!608388 lt!471165)))

(declare-fun lt!471177 () ListLongMap!14205)

(assert (=> b!1066810 (= lt!471177 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471163 () (_ BitVec 64))

(assert (=> b!1066810 (= lt!471163 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471178 () (_ BitVec 64))

(assert (=> b!1066810 (= lt!471178 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471166 () Unit!35031)

(assert (=> b!1066810 (= lt!471166 (addStillContains!640 lt!471177 lt!471163 zeroValueBefore!47 lt!471178))))

(assert (=> b!1066810 (contains!6271 (+!3158 lt!471177 (tuple2!16237 lt!471163 zeroValueBefore!47)) lt!471178)))

(declare-fun lt!471169 () Unit!35031)

(assert (=> b!1066810 (= lt!471169 lt!471166)))

(declare-fun lt!471181 () ListLongMap!14205)

(assert (=> b!1066810 (= lt!471181 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471168 () (_ BitVec 64))

(assert (=> b!1066810 (= lt!471168 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471172 () (_ BitVec 64))

(assert (=> b!1066810 (= lt!471172 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471182 () Unit!35031)

(assert (=> b!1066810 (= lt!471182 (addApplyDifferent!500 lt!471181 lt!471168 minValue!907 lt!471172))))

(assert (=> b!1066810 (= (apply!924 (+!3158 lt!471181 (tuple2!16237 lt!471168 minValue!907)) lt!471172) (apply!924 lt!471181 lt!471172))))

(declare-fun lt!471161 () Unit!35031)

(assert (=> b!1066810 (= lt!471161 lt!471182)))

(declare-fun lt!471164 () ListLongMap!14205)

(assert (=> b!1066810 (= lt!471164 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471175 () (_ BitVec 64))

(assert (=> b!1066810 (= lt!471175 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471173 () (_ BitVec 64))

(assert (=> b!1066810 (= lt!471173 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471179 () Unit!35031)

(assert (=> b!1066810 (= lt!471179 (addApplyDifferent!500 lt!471164 lt!471175 zeroValueBefore!47 lt!471173))))

(assert (=> b!1066810 (= (apply!924 (+!3158 lt!471164 (tuple2!16237 lt!471175 zeroValueBefore!47)) lt!471173) (apply!924 lt!471164 lt!471173))))

(declare-fun lt!471171 () Unit!35031)

(assert (=> b!1066810 (= lt!471171 lt!471179)))

(declare-fun lt!471162 () ListLongMap!14205)

(assert (=> b!1066810 (= lt!471162 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471167 () (_ BitVec 64))

(assert (=> b!1066810 (= lt!471167 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471180 () (_ BitVec 64))

(assert (=> b!1066810 (= lt!471180 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1066810 (= lt!471165 (addApplyDifferent!500 lt!471162 lt!471167 minValue!907 lt!471180))))

(assert (=> b!1066810 (= (apply!924 (+!3158 lt!471162 (tuple2!16237 lt!471167 minValue!907)) lt!471180) (apply!924 lt!471162 lt!471180))))

(declare-fun bm!45074 () Bool)

(declare-fun call!45081 () ListLongMap!14205)

(assert (=> bm!45074 (= call!45076 call!45081)))

(declare-fun bm!45075 () Bool)

(declare-fun call!45079 () ListLongMap!14205)

(assert (=> bm!45075 (= call!45079 call!45080)))

(declare-fun b!1066811 () Bool)

(declare-fun res!711997 () Bool)

(declare-fun e!608389 () Bool)

(assert (=> b!1066811 (=> (not res!711997) (not e!608389))))

(declare-fun e!608382 () Bool)

(assert (=> b!1066811 (= res!711997 e!608382)))

(declare-fun c!107458 () Bool)

(assert (=> b!1066811 (= c!107458 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45076 () Bool)

(declare-fun call!45075 () ListLongMap!14205)

(assert (=> bm!45076 (= call!45075 call!45079)))

(declare-fun b!1066812 () Bool)

(declare-fun e!608390 () ListLongMap!14205)

(assert (=> b!1066812 (= e!608390 call!45075)))

(declare-fun b!1066813 () Bool)

(assert (=> b!1066813 (= e!608386 (not call!45078))))

(declare-fun b!1066814 () Bool)

(assert (=> b!1066814 (= e!608385 (= (apply!924 lt!471176 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1066815 () Bool)

(declare-fun call!45077 () Bool)

(assert (=> b!1066815 (= e!608382 (not call!45077))))

(declare-fun b!1066816 () Bool)

(declare-fun e!608383 () Bool)

(assert (=> b!1066816 (= e!608383 (validKeyInArray!0 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066817 () Bool)

(assert (=> b!1066817 (= e!608389 e!608386)))

(declare-fun c!107455 () Bool)

(assert (=> b!1066817 (= c!107455 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1066818 () Bool)

(assert (=> b!1066818 (= e!608390 call!45076)))

(declare-fun b!1066809 () Bool)

(declare-fun c!107456 () Bool)

(assert (=> b!1066809 (= c!107456 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066809 (= e!608391 e!608390)))

(declare-fun d!129077 () Bool)

(assert (=> d!129077 e!608389))

(declare-fun res!711998 () Bool)

(assert (=> d!129077 (=> (not res!711998) (not e!608389))))

(assert (=> d!129077 (= res!711998 (or (bvsge #b00000000000000000000000000000000 (size!33228 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))))

(declare-fun lt!471174 () ListLongMap!14205)

(assert (=> d!129077 (= lt!471176 lt!471174)))

(declare-fun lt!471170 () Unit!35031)

(assert (=> d!129077 (= lt!471170 e!608388)))

(declare-fun c!107457 () Bool)

(assert (=> d!129077 (= c!107457 e!608383)))

(declare-fun res!712000 () Bool)

(assert (=> d!129077 (=> (not res!712000) (not e!608383))))

(assert (=> d!129077 (= res!712000 (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(declare-fun e!608384 () ListLongMap!14205)

(assert (=> d!129077 (= lt!471174 e!608384)))

(declare-fun c!107460 () Bool)

(assert (=> d!129077 (= c!107460 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129077 (validMask!0 mask!1515)))

(assert (=> d!129077 (= (getCurrentListMap!4071 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471176)))

(declare-fun b!1066819 () Bool)

(assert (=> b!1066819 (= e!608384 (+!3158 call!45081 (tuple2!16237 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1066820 () Bool)

(declare-fun res!712001 () Bool)

(assert (=> b!1066820 (=> (not res!712001) (not e!608389))))

(assert (=> b!1066820 (= res!712001 e!608392)))

(declare-fun res!712002 () Bool)

(assert (=> b!1066820 (=> res!712002 e!608392)))

(assert (=> b!1066820 (= res!712002 (not e!608393))))

(declare-fun res!711996 () Bool)

(assert (=> b!1066820 (=> (not res!711996) (not e!608393))))

(assert (=> b!1066820 (= res!711996 (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(declare-fun b!1066821 () Bool)

(assert (=> b!1066821 (= e!608384 e!608391)))

(declare-fun c!107459 () Bool)

(assert (=> b!1066821 (= c!107459 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45077 () Bool)

(assert (=> bm!45077 (= call!45077 (contains!6271 lt!471176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45078 () Bool)

(assert (=> bm!45078 (= call!45081 (+!3158 (ite c!107460 call!45080 (ite c!107459 call!45079 call!45075)) (ite (or c!107460 c!107459) (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16237 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1066822 () Bool)

(assert (=> b!1066822 (= e!608387 (= (apply!924 lt!471176 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)) (get!17048 (select (arr!32691 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1066822 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33227 _values!955)))))

(assert (=> b!1066822 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(declare-fun b!1066823 () Bool)

(declare-fun e!608381 () Bool)

(assert (=> b!1066823 (= e!608381 (= (apply!924 lt!471176 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1066824 () Bool)

(assert (=> b!1066824 (= e!608382 e!608381)))

(declare-fun res!711995 () Bool)

(assert (=> b!1066824 (= res!711995 call!45077)))

(assert (=> b!1066824 (=> (not res!711995) (not e!608381))))

(declare-fun b!1066825 () Bool)

(declare-fun Unit!35036 () Unit!35031)

(assert (=> b!1066825 (= e!608388 Unit!35036)))

(assert (= (and d!129077 c!107460) b!1066819))

(assert (= (and d!129077 (not c!107460)) b!1066821))

(assert (= (and b!1066821 c!107459) b!1066805))

(assert (= (and b!1066821 (not c!107459)) b!1066809))

(assert (= (and b!1066809 c!107456) b!1066818))

(assert (= (and b!1066809 (not c!107456)) b!1066812))

(assert (= (or b!1066818 b!1066812) bm!45076))

(assert (= (or b!1066805 bm!45076) bm!45075))

(assert (= (or b!1066805 b!1066818) bm!45074))

(assert (= (or b!1066819 bm!45075) bm!45072))

(assert (= (or b!1066819 bm!45074) bm!45078))

(assert (= (and d!129077 res!712000) b!1066816))

(assert (= (and d!129077 c!107457) b!1066810))

(assert (= (and d!129077 (not c!107457)) b!1066825))

(assert (= (and d!129077 res!711998) b!1066820))

(assert (= (and b!1066820 res!711996) b!1066806))

(assert (= (and b!1066820 (not res!712002)) b!1066808))

(assert (= (and b!1066808 res!711999) b!1066822))

(assert (= (and b!1066820 res!712001) b!1066811))

(assert (= (and b!1066811 c!107458) b!1066824))

(assert (= (and b!1066811 (not c!107458)) b!1066815))

(assert (= (and b!1066824 res!711995) b!1066823))

(assert (= (or b!1066824 b!1066815) bm!45077))

(assert (= (and b!1066811 res!711997) b!1066817))

(assert (= (and b!1066817 c!107455) b!1066807))

(assert (= (and b!1066817 (not c!107455)) b!1066813))

(assert (= (and b!1066807 res!712003) b!1066814))

(assert (= (or b!1066807 b!1066813) bm!45073))

(declare-fun b_lambda!16563 () Bool)

(assert (=> (not b_lambda!16563) (not b!1066822)))

(assert (=> b!1066822 t!32124))

(declare-fun b_and!34465 () Bool)

(assert (= b_and!34463 (and (=> t!32124 result!14737) b_and!34465)))

(declare-fun m!985553 () Bool)

(assert (=> bm!45077 m!985553))

(assert (=> b!1066816 m!985465))

(assert (=> b!1066816 m!985465))

(assert (=> b!1066816 m!985467))

(declare-fun m!985555 () Bool)

(assert (=> b!1066810 m!985555))

(declare-fun m!985557 () Bool)

(assert (=> b!1066810 m!985557))

(declare-fun m!985559 () Bool)

(assert (=> b!1066810 m!985559))

(declare-fun m!985561 () Bool)

(assert (=> b!1066810 m!985561))

(declare-fun m!985563 () Bool)

(assert (=> b!1066810 m!985563))

(assert (=> b!1066810 m!985561))

(declare-fun m!985565 () Bool)

(assert (=> b!1066810 m!985565))

(declare-fun m!985567 () Bool)

(assert (=> b!1066810 m!985567))

(declare-fun m!985569 () Bool)

(assert (=> b!1066810 m!985569))

(declare-fun m!985571 () Bool)

(assert (=> b!1066810 m!985571))

(declare-fun m!985573 () Bool)

(assert (=> b!1066810 m!985573))

(declare-fun m!985575 () Bool)

(assert (=> b!1066810 m!985575))

(assert (=> b!1066810 m!985575))

(declare-fun m!985577 () Bool)

(assert (=> b!1066810 m!985577))

(assert (=> b!1066810 m!985427))

(assert (=> b!1066810 m!985565))

(assert (=> b!1066810 m!985555))

(declare-fun m!985579 () Bool)

(assert (=> b!1066810 m!985579))

(assert (=> b!1066810 m!985465))

(declare-fun m!985581 () Bool)

(assert (=> b!1066810 m!985581))

(declare-fun m!985583 () Bool)

(assert (=> b!1066810 m!985583))

(assert (=> b!1066806 m!985465))

(assert (=> b!1066806 m!985465))

(assert (=> b!1066806 m!985467))

(declare-fun m!985585 () Bool)

(assert (=> bm!45078 m!985585))

(declare-fun m!985587 () Bool)

(assert (=> b!1066814 m!985587))

(declare-fun m!985589 () Bool)

(assert (=> b!1066823 m!985589))

(assert (=> bm!45072 m!985427))

(assert (=> b!1066808 m!985465))

(assert (=> b!1066808 m!985465))

(declare-fun m!985591 () Bool)

(assert (=> b!1066808 m!985591))

(declare-fun m!985593 () Bool)

(assert (=> b!1066819 m!985593))

(assert (=> b!1066822 m!985543))

(assert (=> b!1066822 m!985465))

(assert (=> b!1066822 m!985465))

(declare-fun m!985595 () Bool)

(assert (=> b!1066822 m!985595))

(assert (=> b!1066822 m!985543))

(assert (=> b!1066822 m!985547))

(assert (=> b!1066822 m!985549))

(assert (=> b!1066822 m!985547))

(assert (=> d!129077 m!985405))

(declare-fun m!985597 () Bool)

(assert (=> bm!45073 m!985597))

(assert (=> b!1066686 d!129077))

(declare-fun bm!45081 () Bool)

(declare-fun call!45084 () Bool)

(declare-fun c!107463 () Bool)

(assert (=> bm!45081 (= call!45084 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107463 (Cons!22795 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000) Nil!22796) Nil!22796)))))

(declare-fun b!1066836 () Bool)

(declare-fun e!608403 () Bool)

(declare-fun contains!6273 (List!22799 (_ BitVec 64)) Bool)

(assert (=> b!1066836 (= e!608403 (contains!6273 Nil!22796 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066837 () Bool)

(declare-fun e!608405 () Bool)

(declare-fun e!608402 () Bool)

(assert (=> b!1066837 (= e!608405 e!608402)))

(declare-fun res!712011 () Bool)

(assert (=> b!1066837 (=> (not res!712011) (not e!608402))))

(assert (=> b!1066837 (= res!712011 (not e!608403))))

(declare-fun res!712012 () Bool)

(assert (=> b!1066837 (=> (not res!712012) (not e!608403))))

(assert (=> b!1066837 (= res!712012 (validKeyInArray!0 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129079 () Bool)

(declare-fun res!712010 () Bool)

(assert (=> d!129079 (=> res!712010 e!608405)))

(assert (=> d!129079 (= res!712010 (bvsge #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(assert (=> d!129079 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22796) e!608405)))

(declare-fun b!1066838 () Bool)

(declare-fun e!608404 () Bool)

(assert (=> b!1066838 (= e!608404 call!45084)))

(declare-fun b!1066839 () Bool)

(assert (=> b!1066839 (= e!608402 e!608404)))

(assert (=> b!1066839 (= c!107463 (validKeyInArray!0 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066840 () Bool)

(assert (=> b!1066840 (= e!608404 call!45084)))

(assert (= (and d!129079 (not res!712010)) b!1066837))

(assert (= (and b!1066837 res!712012) b!1066836))

(assert (= (and b!1066837 res!712011) b!1066839))

(assert (= (and b!1066839 c!107463) b!1066838))

(assert (= (and b!1066839 (not c!107463)) b!1066840))

(assert (= (or b!1066838 b!1066840) bm!45081))

(assert (=> bm!45081 m!985465))

(declare-fun m!985599 () Bool)

(assert (=> bm!45081 m!985599))

(assert (=> b!1066836 m!985465))

(assert (=> b!1066836 m!985465))

(declare-fun m!985601 () Bool)

(assert (=> b!1066836 m!985601))

(assert (=> b!1066837 m!985465))

(assert (=> b!1066837 m!985465))

(assert (=> b!1066837 m!985467))

(assert (=> b!1066839 m!985465))

(assert (=> b!1066839 m!985465))

(assert (=> b!1066839 m!985467))

(assert (=> b!1066693 d!129079))

(declare-fun d!129081 () Bool)

(assert (=> d!129081 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94324 d!129081))

(declare-fun d!129083 () Bool)

(assert (=> d!129083 (= (array_inv!25310 _values!955) (bvsge (size!33227 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94324 d!129083))

(declare-fun d!129085 () Bool)

(assert (=> d!129085 (= (array_inv!25311 _keys!1163) (bvsge (size!33228 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94324 d!129085))

(declare-fun d!129087 () Bool)

(assert (=> d!129087 (= (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471185 () Unit!35031)

(declare-fun choose!1733 (array!67981 array!67979 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39131 V!39131 V!39131 V!39131 (_ BitVec 32) Int) Unit!35031)

(assert (=> d!129087 (= lt!471185 (choose!1733 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129087 (validMask!0 mask!1515)))

(assert (=> d!129087 (= (lemmaNoChangeToArrayThenSameMapNoExtras!740 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471185)))

(declare-fun bs!31394 () Bool)

(assert (= bs!31394 d!129087))

(assert (=> bs!31394 m!985427))

(assert (=> bs!31394 m!985425))

(declare-fun m!985603 () Bool)

(assert (=> bs!31394 m!985603))

(assert (=> bs!31394 m!985405))

(assert (=> b!1066688 d!129087))

(declare-fun b!1066865 () Bool)

(declare-fun e!608424 () Bool)

(declare-fun e!608420 () Bool)

(assert (=> b!1066865 (= e!608424 e!608420)))

(assert (=> b!1066865 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(declare-fun res!712023 () Bool)

(declare-fun lt!471202 () ListLongMap!14205)

(assert (=> b!1066865 (= res!712023 (contains!6271 lt!471202 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066865 (=> (not res!712023) (not e!608420))))

(declare-fun b!1066866 () Bool)

(declare-fun e!608423 () ListLongMap!14205)

(assert (=> b!1066866 (= e!608423 (ListLongMap!14206 Nil!22795))))

(declare-fun b!1066867 () Bool)

(declare-fun e!608422 () Bool)

(declare-fun isEmpty!942 (ListLongMap!14205) Bool)

(assert (=> b!1066867 (= e!608422 (isEmpty!942 lt!471202))))

(declare-fun b!1066868 () Bool)

(declare-fun e!608425 () Bool)

(assert (=> b!1066868 (= e!608425 (validKeyInArray!0 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066868 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!129089 () Bool)

(declare-fun e!608426 () Bool)

(assert (=> d!129089 e!608426))

(declare-fun res!712021 () Bool)

(assert (=> d!129089 (=> (not res!712021) (not e!608426))))

(assert (=> d!129089 (= res!712021 (not (contains!6271 lt!471202 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129089 (= lt!471202 e!608423)))

(declare-fun c!107475 () Bool)

(assert (=> d!129089 (= c!107475 (bvsge #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(assert (=> d!129089 (validMask!0 mask!1515)))

(assert (=> d!129089 (= (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471202)))

(declare-fun b!1066869 () Bool)

(assert (=> b!1066869 (= e!608422 (= lt!471202 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1066870 () Bool)

(assert (=> b!1066870 (= e!608424 e!608422)))

(declare-fun c!107474 () Bool)

(assert (=> b!1066870 (= c!107474 (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(declare-fun b!1066871 () Bool)

(declare-fun lt!471200 () Unit!35031)

(declare-fun lt!471206 () Unit!35031)

(assert (=> b!1066871 (= lt!471200 lt!471206)))

(declare-fun lt!471201 () (_ BitVec 64))

(declare-fun lt!471203 () (_ BitVec 64))

(declare-fun lt!471204 () V!39131)

(declare-fun lt!471205 () ListLongMap!14205)

(assert (=> b!1066871 (not (contains!6271 (+!3158 lt!471205 (tuple2!16237 lt!471203 lt!471204)) lt!471201))))

(declare-fun addStillNotContains!252 (ListLongMap!14205 (_ BitVec 64) V!39131 (_ BitVec 64)) Unit!35031)

(assert (=> b!1066871 (= lt!471206 (addStillNotContains!252 lt!471205 lt!471203 lt!471204 lt!471201))))

(assert (=> b!1066871 (= lt!471201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1066871 (= lt!471204 (get!17048 (select (arr!32691 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1066871 (= lt!471203 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45087 () ListLongMap!14205)

(assert (=> b!1066871 (= lt!471205 call!45087)))

(declare-fun e!608421 () ListLongMap!14205)

(assert (=> b!1066871 (= e!608421 (+!3158 call!45087 (tuple2!16237 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000) (get!17048 (select (arr!32691 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1066872 () Bool)

(assert (=> b!1066872 (= e!608426 e!608424)))

(declare-fun c!107472 () Bool)

(assert (=> b!1066872 (= c!107472 e!608425)))

(declare-fun res!712024 () Bool)

(assert (=> b!1066872 (=> (not res!712024) (not e!608425))))

(assert (=> b!1066872 (= res!712024 (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(declare-fun b!1066873 () Bool)

(assert (=> b!1066873 (= e!608423 e!608421)))

(declare-fun c!107473 () Bool)

(assert (=> b!1066873 (= c!107473 (validKeyInArray!0 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45084 () Bool)

(assert (=> bm!45084 (= call!45087 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1066874 () Bool)

(assert (=> b!1066874 (= e!608421 call!45087)))

(declare-fun b!1066875 () Bool)

(declare-fun res!712022 () Bool)

(assert (=> b!1066875 (=> (not res!712022) (not e!608426))))

(assert (=> b!1066875 (= res!712022 (not (contains!6271 lt!471202 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1066876 () Bool)

(assert (=> b!1066876 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(assert (=> b!1066876 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33227 _values!955)))))

(assert (=> b!1066876 (= e!608420 (= (apply!924 lt!471202 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)) (get!17048 (select (arr!32691 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!129089 c!107475) b!1066866))

(assert (= (and d!129089 (not c!107475)) b!1066873))

(assert (= (and b!1066873 c!107473) b!1066871))

(assert (= (and b!1066873 (not c!107473)) b!1066874))

(assert (= (or b!1066871 b!1066874) bm!45084))

(assert (= (and d!129089 res!712021) b!1066875))

(assert (= (and b!1066875 res!712022) b!1066872))

(assert (= (and b!1066872 res!712024) b!1066868))

(assert (= (and b!1066872 c!107472) b!1066865))

(assert (= (and b!1066872 (not c!107472)) b!1066870))

(assert (= (and b!1066865 res!712023) b!1066876))

(assert (= (and b!1066870 c!107474) b!1066869))

(assert (= (and b!1066870 (not c!107474)) b!1066867))

(declare-fun b_lambda!16565 () Bool)

(assert (=> (not b_lambda!16565) (not b!1066871)))

(assert (=> b!1066871 t!32124))

(declare-fun b_and!34467 () Bool)

(assert (= b_and!34465 (and (=> t!32124 result!14737) b_and!34467)))

(declare-fun b_lambda!16567 () Bool)

(assert (=> (not b_lambda!16567) (not b!1066876)))

(assert (=> b!1066876 t!32124))

(declare-fun b_and!34469 () Bool)

(assert (= b_and!34467 (and (=> t!32124 result!14737) b_and!34469)))

(declare-fun m!985605 () Bool)

(assert (=> b!1066867 m!985605))

(assert (=> b!1066865 m!985465))

(assert (=> b!1066865 m!985465))

(declare-fun m!985607 () Bool)

(assert (=> b!1066865 m!985607))

(assert (=> b!1066868 m!985465))

(assert (=> b!1066868 m!985465))

(assert (=> b!1066868 m!985467))

(assert (=> b!1066876 m!985543))

(assert (=> b!1066876 m!985465))

(assert (=> b!1066876 m!985465))

(declare-fun m!985609 () Bool)

(assert (=> b!1066876 m!985609))

(assert (=> b!1066876 m!985547))

(assert (=> b!1066876 m!985543))

(assert (=> b!1066876 m!985547))

(assert (=> b!1066876 m!985549))

(declare-fun m!985611 () Bool)

(assert (=> d!129089 m!985611))

(assert (=> d!129089 m!985405))

(declare-fun m!985613 () Bool)

(assert (=> b!1066869 m!985613))

(assert (=> b!1066871 m!985543))

(declare-fun m!985615 () Bool)

(assert (=> b!1066871 m!985615))

(assert (=> b!1066871 m!985465))

(declare-fun m!985617 () Bool)

(assert (=> b!1066871 m!985617))

(declare-fun m!985619 () Bool)

(assert (=> b!1066871 m!985619))

(assert (=> b!1066871 m!985617))

(declare-fun m!985621 () Bool)

(assert (=> b!1066871 m!985621))

(assert (=> b!1066871 m!985547))

(assert (=> b!1066871 m!985543))

(assert (=> b!1066871 m!985547))

(assert (=> b!1066871 m!985549))

(declare-fun m!985623 () Bool)

(assert (=> b!1066875 m!985623))

(assert (=> bm!45084 m!985613))

(assert (=> b!1066873 m!985465))

(assert (=> b!1066873 m!985465))

(assert (=> b!1066873 m!985467))

(assert (=> b!1066688 d!129089))

(declare-fun b!1066877 () Bool)

(declare-fun e!608431 () Bool)

(declare-fun e!608427 () Bool)

(assert (=> b!1066877 (= e!608431 e!608427)))

(assert (=> b!1066877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(declare-fun res!712027 () Bool)

(declare-fun lt!471209 () ListLongMap!14205)

(assert (=> b!1066877 (= res!712027 (contains!6271 lt!471209 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066877 (=> (not res!712027) (not e!608427))))

(declare-fun b!1066878 () Bool)

(declare-fun e!608430 () ListLongMap!14205)

(assert (=> b!1066878 (= e!608430 (ListLongMap!14206 Nil!22795))))

(declare-fun b!1066879 () Bool)

(declare-fun e!608429 () Bool)

(assert (=> b!1066879 (= e!608429 (isEmpty!942 lt!471209))))

(declare-fun b!1066880 () Bool)

(declare-fun e!608432 () Bool)

(assert (=> b!1066880 (= e!608432 (validKeyInArray!0 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066880 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!129091 () Bool)

(declare-fun e!608433 () Bool)

(assert (=> d!129091 e!608433))

(declare-fun res!712025 () Bool)

(assert (=> d!129091 (=> (not res!712025) (not e!608433))))

(assert (=> d!129091 (= res!712025 (not (contains!6271 lt!471209 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129091 (= lt!471209 e!608430)))

(declare-fun c!107479 () Bool)

(assert (=> d!129091 (= c!107479 (bvsge #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(assert (=> d!129091 (validMask!0 mask!1515)))

(assert (=> d!129091 (= (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471209)))

(declare-fun b!1066881 () Bool)

(assert (=> b!1066881 (= e!608429 (= lt!471209 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1066882 () Bool)

(assert (=> b!1066882 (= e!608431 e!608429)))

(declare-fun c!107478 () Bool)

(assert (=> b!1066882 (= c!107478 (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(declare-fun b!1066883 () Bool)

(declare-fun lt!471207 () Unit!35031)

(declare-fun lt!471213 () Unit!35031)

(assert (=> b!1066883 (= lt!471207 lt!471213)))

(declare-fun lt!471208 () (_ BitVec 64))

(declare-fun lt!471212 () ListLongMap!14205)

(declare-fun lt!471210 () (_ BitVec 64))

(declare-fun lt!471211 () V!39131)

(assert (=> b!1066883 (not (contains!6271 (+!3158 lt!471212 (tuple2!16237 lt!471210 lt!471211)) lt!471208))))

(assert (=> b!1066883 (= lt!471213 (addStillNotContains!252 lt!471212 lt!471210 lt!471211 lt!471208))))

(assert (=> b!1066883 (= lt!471208 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1066883 (= lt!471211 (get!17048 (select (arr!32691 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1066883 (= lt!471210 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45088 () ListLongMap!14205)

(assert (=> b!1066883 (= lt!471212 call!45088)))

(declare-fun e!608428 () ListLongMap!14205)

(assert (=> b!1066883 (= e!608428 (+!3158 call!45088 (tuple2!16237 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000) (get!17048 (select (arr!32691 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1066884 () Bool)

(assert (=> b!1066884 (= e!608433 e!608431)))

(declare-fun c!107476 () Bool)

(assert (=> b!1066884 (= c!107476 e!608432)))

(declare-fun res!712028 () Bool)

(assert (=> b!1066884 (=> (not res!712028) (not e!608432))))

(assert (=> b!1066884 (= res!712028 (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(declare-fun b!1066885 () Bool)

(assert (=> b!1066885 (= e!608430 e!608428)))

(declare-fun c!107477 () Bool)

(assert (=> b!1066885 (= c!107477 (validKeyInArray!0 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45085 () Bool)

(assert (=> bm!45085 (= call!45088 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1066886 () Bool)

(assert (=> b!1066886 (= e!608428 call!45088)))

(declare-fun b!1066887 () Bool)

(declare-fun res!712026 () Bool)

(assert (=> b!1066887 (=> (not res!712026) (not e!608433))))

(assert (=> b!1066887 (= res!712026 (not (contains!6271 lt!471209 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1066888 () Bool)

(assert (=> b!1066888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33228 _keys!1163)))))

(assert (=> b!1066888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33227 _values!955)))))

(assert (=> b!1066888 (= e!608427 (= (apply!924 lt!471209 (select (arr!32692 _keys!1163) #b00000000000000000000000000000000)) (get!17048 (select (arr!32691 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!129091 c!107479) b!1066878))

(assert (= (and d!129091 (not c!107479)) b!1066885))

(assert (= (and b!1066885 c!107477) b!1066883))

(assert (= (and b!1066885 (not c!107477)) b!1066886))

(assert (= (or b!1066883 b!1066886) bm!45085))

(assert (= (and d!129091 res!712025) b!1066887))

(assert (= (and b!1066887 res!712026) b!1066884))

(assert (= (and b!1066884 res!712028) b!1066880))

(assert (= (and b!1066884 c!107476) b!1066877))

(assert (= (and b!1066884 (not c!107476)) b!1066882))

(assert (= (and b!1066877 res!712027) b!1066888))

(assert (= (and b!1066882 c!107478) b!1066881))

(assert (= (and b!1066882 (not c!107478)) b!1066879))

(declare-fun b_lambda!16569 () Bool)

(assert (=> (not b_lambda!16569) (not b!1066883)))

(assert (=> b!1066883 t!32124))

(declare-fun b_and!34471 () Bool)

(assert (= b_and!34469 (and (=> t!32124 result!14737) b_and!34471)))

(declare-fun b_lambda!16571 () Bool)

(assert (=> (not b_lambda!16571) (not b!1066888)))

(assert (=> b!1066888 t!32124))

(declare-fun b_and!34473 () Bool)

(assert (= b_and!34471 (and (=> t!32124 result!14737) b_and!34473)))

(declare-fun m!985625 () Bool)

(assert (=> b!1066879 m!985625))

(assert (=> b!1066877 m!985465))

(assert (=> b!1066877 m!985465))

(declare-fun m!985627 () Bool)

(assert (=> b!1066877 m!985627))

(assert (=> b!1066880 m!985465))

(assert (=> b!1066880 m!985465))

(assert (=> b!1066880 m!985467))

(assert (=> b!1066888 m!985543))

(assert (=> b!1066888 m!985465))

(assert (=> b!1066888 m!985465))

(declare-fun m!985629 () Bool)

(assert (=> b!1066888 m!985629))

(assert (=> b!1066888 m!985547))

(assert (=> b!1066888 m!985543))

(assert (=> b!1066888 m!985547))

(assert (=> b!1066888 m!985549))

(declare-fun m!985631 () Bool)

(assert (=> d!129091 m!985631))

(assert (=> d!129091 m!985405))

(declare-fun m!985633 () Bool)

(assert (=> b!1066881 m!985633))

(assert (=> b!1066883 m!985543))

(declare-fun m!985635 () Bool)

(assert (=> b!1066883 m!985635))

(assert (=> b!1066883 m!985465))

(declare-fun m!985637 () Bool)

(assert (=> b!1066883 m!985637))

(declare-fun m!985639 () Bool)

(assert (=> b!1066883 m!985639))

(assert (=> b!1066883 m!985637))

(declare-fun m!985641 () Bool)

(assert (=> b!1066883 m!985641))

(assert (=> b!1066883 m!985547))

(assert (=> b!1066883 m!985543))

(assert (=> b!1066883 m!985547))

(assert (=> b!1066883 m!985549))

(declare-fun m!985643 () Bool)

(assert (=> b!1066887 m!985643))

(assert (=> bm!45085 m!985633))

(assert (=> b!1066885 m!985465))

(assert (=> b!1066885 m!985465))

(assert (=> b!1066885 m!985467))

(assert (=> b!1066688 d!129091))

(declare-fun condMapEmpty!39940 () Bool)

(declare-fun mapDefault!39940 () ValueCell!12045)

(assert (=> mapNonEmpty!39934 (= condMapEmpty!39940 (= mapRest!39934 ((as const (Array (_ BitVec 32) ValueCell!12045)) mapDefault!39940)))))

(declare-fun e!608438 () Bool)

(declare-fun mapRes!39940 () Bool)

(assert (=> mapNonEmpty!39934 (= tp!76501 (and e!608438 mapRes!39940))))

(declare-fun mapNonEmpty!39940 () Bool)

(declare-fun tp!76511 () Bool)

(declare-fun e!608439 () Bool)

(assert (=> mapNonEmpty!39940 (= mapRes!39940 (and tp!76511 e!608439))))

(declare-fun mapKey!39940 () (_ BitVec 32))

(declare-fun mapRest!39940 () (Array (_ BitVec 32) ValueCell!12045))

(declare-fun mapValue!39940 () ValueCell!12045)

(assert (=> mapNonEmpty!39940 (= mapRest!39934 (store mapRest!39940 mapKey!39940 mapValue!39940))))

(declare-fun mapIsEmpty!39940 () Bool)

(assert (=> mapIsEmpty!39940 mapRes!39940))

(declare-fun b!1066895 () Bool)

(assert (=> b!1066895 (= e!608439 tp_is_empty!25497)))

(declare-fun b!1066896 () Bool)

(assert (=> b!1066896 (= e!608438 tp_is_empty!25497)))

(assert (= (and mapNonEmpty!39934 condMapEmpty!39940) mapIsEmpty!39940))

(assert (= (and mapNonEmpty!39934 (not condMapEmpty!39940)) mapNonEmpty!39940))

(assert (= (and mapNonEmpty!39940 ((_ is ValueCellFull!12045) mapValue!39940)) b!1066895))

(assert (= (and mapNonEmpty!39934 ((_ is ValueCellFull!12045) mapDefault!39940)) b!1066896))

(declare-fun m!985645 () Bool)

(assert (=> mapNonEmpty!39940 m!985645))

(declare-fun b_lambda!16573 () Bool)

(assert (= b_lambda!16561 (or (and start!94324 b_free!21687) b_lambda!16573)))

(declare-fun b_lambda!16575 () Bool)

(assert (= b_lambda!16571 (or (and start!94324 b_free!21687) b_lambda!16575)))

(declare-fun b_lambda!16577 () Bool)

(assert (= b_lambda!16569 (or (and start!94324 b_free!21687) b_lambda!16577)))

(declare-fun b_lambda!16579 () Bool)

(assert (= b_lambda!16565 (or (and start!94324 b_free!21687) b_lambda!16579)))

(declare-fun b_lambda!16581 () Bool)

(assert (= b_lambda!16567 (or (and start!94324 b_free!21687) b_lambda!16581)))

(declare-fun b_lambda!16583 () Bool)

(assert (= b_lambda!16563 (or (and start!94324 b_free!21687) b_lambda!16583)))

(check-sat (not mapNonEmpty!39940) (not d!129073) (not b!1066791) tp_is_empty!25497 (not bm!45078) (not b!1066822) (not bm!45071) (not b!1066808) (not b!1066871) (not d!129071) (not b!1066881) (not b!1066816) (not b!1066732) (not bm!45065) (not b!1066819) (not b!1066880) (not bm!45084) (not b_lambda!16581) (not d!129069) (not d!129075) (not bm!45070) (not b!1066869) (not b_lambda!16577) (not d!129067) (not b!1066793) (not bm!45050) (not b_next!21687) (not b!1066875) (not b!1066783) (not d!129089) (not bm!45085) (not b_lambda!16583) (not bm!45073) (not bm!45072) b_and!34473 (not b!1066787) (not bm!45066) (not b!1066738) (not b!1066887) (not b!1066823) (not b!1066883) (not b!1066799) (not b!1066885) (not bm!45081) (not b!1066810) (not b!1066868) (not b!1066876) (not b!1066796) (not b_lambda!16575) (not b!1066879) (not bm!45077) (not d!129077) (not b!1066836) (not b!1066839) (not b!1066806) (not b!1066733) (not b_lambda!16573) (not b!1066867) (not b!1066873) (not b!1066800) (not b!1066865) (not b_lambda!16579) (not b!1066739) (not b!1066837) (not b!1066814) (not b!1066888) (not d!129087) (not b!1066877) (not d!129091) (not b!1066785))
(check-sat b_and!34473 (not b_next!21687))
