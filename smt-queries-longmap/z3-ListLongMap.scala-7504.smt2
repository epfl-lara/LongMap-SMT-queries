; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95340 () Bool)

(assert start!95340)

(declare-fun b_free!22201 () Bool)

(declare-fun b_next!22201 () Bool)

(assert (=> start!95340 (= b_free!22201 (not b_next!22201))))

(declare-fun tp!78086 () Bool)

(declare-fun b_and!35131 () Bool)

(assert (=> start!95340 (= tp!78086 b_and!35131)))

(declare-fun mapIsEmpty!40747 () Bool)

(declare-fun mapRes!40747 () Bool)

(assert (=> mapIsEmpty!40747 mapRes!40747))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39817 0))(
  ( (V!39818 (val!13056 Int)) )
))
(declare-fun zeroValueBefore!47 () V!39817)

(declare-fun b!1076438 () Bool)

(declare-fun e!615264 () Bool)

(declare-datatypes ((ValueCell!12302 0))(
  ( (ValueCellFull!12302 (v!15675 V!39817)) (EmptyCell!12302) )
))
(declare-datatypes ((array!69033 0))(
  ( (array!69034 (arr!33198 (Array (_ BitVec 32) ValueCell!12302)) (size!33735 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69033)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39817)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!69035 0))(
  ( (array!69036 (arr!33199 (Array (_ BitVec 32) (_ BitVec 64))) (size!33736 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69035)

(declare-datatypes ((tuple2!16622 0))(
  ( (tuple2!16623 (_1!8322 (_ BitVec 64)) (_2!8322 V!39817)) )
))
(declare-datatypes ((List!23173 0))(
  ( (Nil!23170) (Cons!23169 (h!24387 tuple2!16622) (t!32514 List!23173)) )
))
(declare-datatypes ((ListLongMap!14599 0))(
  ( (ListLongMap!14600 (toList!7315 List!23173)) )
))
(declare-fun contains!6368 (ListLongMap!14599 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4172 (array!69035 array!69033 (_ BitVec 32) (_ BitVec 32) V!39817 V!39817 (_ BitVec 32) Int) ListLongMap!14599)

(assert (=> b!1076438 (= e!615264 (not (contains!6368 (getCurrentListMap!4172 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1076439 () Bool)

(declare-fun e!615260 () Bool)

(declare-fun tp_is_empty!26011 () Bool)

(assert (=> b!1076439 (= e!615260 tp_is_empty!26011)))

(declare-fun b!1076440 () Bool)

(declare-fun res!717302 () Bool)

(declare-fun e!615262 () Bool)

(assert (=> b!1076440 (=> (not res!717302) (not e!615262))))

(declare-datatypes ((List!23174 0))(
  ( (Nil!23171) (Cons!23170 (h!24388 (_ BitVec 64)) (t!32515 List!23174)) )
))
(declare-fun arrayNoDuplicates!0 (array!69035 (_ BitVec 32) List!23174) Bool)

(assert (=> b!1076440 (= res!717302 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23171))))

(declare-fun mapNonEmpty!40747 () Bool)

(declare-fun tp!78085 () Bool)

(assert (=> mapNonEmpty!40747 (= mapRes!40747 (and tp!78085 e!615260))))

(declare-fun mapRest!40747 () (Array (_ BitVec 32) ValueCell!12302))

(declare-fun mapKey!40747 () (_ BitVec 32))

(declare-fun mapValue!40747 () ValueCell!12302)

(assert (=> mapNonEmpty!40747 (= (arr!33198 _values!955) (store mapRest!40747 mapKey!40747 mapValue!40747))))

(declare-fun res!717304 () Bool)

(assert (=> start!95340 (=> (not res!717304) (not e!615262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95340 (= res!717304 (validMask!0 mask!1515))))

(assert (=> start!95340 e!615262))

(assert (=> start!95340 true))

(assert (=> start!95340 tp_is_empty!26011))

(declare-fun e!615263 () Bool)

(declare-fun array_inv!25692 (array!69033) Bool)

(assert (=> start!95340 (and (array_inv!25692 _values!955) e!615263)))

(assert (=> start!95340 tp!78086))

(declare-fun array_inv!25693 (array!69035) Bool)

(assert (=> start!95340 (array_inv!25693 _keys!1163)))

(declare-fun b!1076441 () Bool)

(declare-fun e!615261 () Bool)

(assert (=> b!1076441 (= e!615261 tp_is_empty!26011)))

(declare-fun b!1076442 () Bool)

(assert (=> b!1076442 (= e!615262 (not e!615264))))

(declare-fun res!717303 () Bool)

(assert (=> b!1076442 (=> res!717303 e!615264)))

(assert (=> b!1076442 (= res!717303 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!477672 () ListLongMap!14599)

(declare-fun lt!477671 () ListLongMap!14599)

(assert (=> b!1076442 (= lt!477672 lt!477671)))

(declare-datatypes ((Unit!35373 0))(
  ( (Unit!35374) )
))
(declare-fun lt!477673 () Unit!35373)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39817)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!889 (array!69035 array!69033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39817 V!39817 V!39817 V!39817 (_ BitVec 32) Int) Unit!35373)

(assert (=> b!1076442 (= lt!477673 (lemmaNoChangeToArrayThenSameMapNoExtras!889 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3909 (array!69035 array!69033 (_ BitVec 32) (_ BitVec 32) V!39817 V!39817 (_ BitVec 32) Int) ListLongMap!14599)

(assert (=> b!1076442 (= lt!477671 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076442 (= lt!477672 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076443 () Bool)

(assert (=> b!1076443 (= e!615263 (and e!615261 mapRes!40747))))

(declare-fun condMapEmpty!40747 () Bool)

(declare-fun mapDefault!40747 () ValueCell!12302)

(assert (=> b!1076443 (= condMapEmpty!40747 (= (arr!33198 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12302)) mapDefault!40747)))))

(declare-fun b!1076444 () Bool)

(declare-fun res!717301 () Bool)

(assert (=> b!1076444 (=> (not res!717301) (not e!615262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69035 (_ BitVec 32)) Bool)

(assert (=> b!1076444 (= res!717301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1076445 () Bool)

(declare-fun res!717300 () Bool)

(assert (=> b!1076445 (=> (not res!717300) (not e!615262))))

(assert (=> b!1076445 (= res!717300 (and (= (size!33735 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33736 _keys!1163) (size!33735 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!95340 res!717304) b!1076445))

(assert (= (and b!1076445 res!717300) b!1076444))

(assert (= (and b!1076444 res!717301) b!1076440))

(assert (= (and b!1076440 res!717302) b!1076442))

(assert (= (and b!1076442 (not res!717303)) b!1076438))

(assert (= (and b!1076443 condMapEmpty!40747) mapIsEmpty!40747))

(assert (= (and b!1076443 (not condMapEmpty!40747)) mapNonEmpty!40747))

(get-info :version)

(assert (= (and mapNonEmpty!40747 ((_ is ValueCellFull!12302) mapValue!40747)) b!1076439))

(assert (= (and b!1076443 ((_ is ValueCellFull!12302) mapDefault!40747)) b!1076441))

(assert (= start!95340 b!1076443))

(declare-fun m!995657 () Bool)

(assert (=> mapNonEmpty!40747 m!995657))

(declare-fun m!995659 () Bool)

(assert (=> b!1076438 m!995659))

(assert (=> b!1076438 m!995659))

(declare-fun m!995661 () Bool)

(assert (=> b!1076438 m!995661))

(declare-fun m!995663 () Bool)

(assert (=> b!1076442 m!995663))

(declare-fun m!995665 () Bool)

(assert (=> b!1076442 m!995665))

(declare-fun m!995667 () Bool)

(assert (=> b!1076442 m!995667))

(declare-fun m!995669 () Bool)

(assert (=> b!1076444 m!995669))

(declare-fun m!995671 () Bool)

(assert (=> start!95340 m!995671))

(declare-fun m!995673 () Bool)

(assert (=> start!95340 m!995673))

(declare-fun m!995675 () Bool)

(assert (=> start!95340 m!995675))

(declare-fun m!995677 () Bool)

(assert (=> b!1076440 m!995677))

(check-sat b_and!35131 tp_is_empty!26011 (not b!1076442) (not mapNonEmpty!40747) (not b!1076438) (not b_next!22201) (not b!1076440) (not b!1076444) (not start!95340))
(check-sat b_and!35131 (not b_next!22201))
(get-model)

(declare-fun d!130031 () Bool)

(assert (=> d!130031 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95340 d!130031))

(declare-fun d!130033 () Bool)

(assert (=> d!130033 (= (array_inv!25692 _values!955) (bvsge (size!33735 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95340 d!130033))

(declare-fun d!130035 () Bool)

(assert (=> d!130035 (= (array_inv!25693 _keys!1163) (bvsge (size!33736 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95340 d!130035))

(declare-fun b!1076502 () Bool)

(declare-fun e!615307 () Bool)

(declare-fun e!615309 () Bool)

(assert (=> b!1076502 (= e!615307 e!615309)))

(declare-fun lt!477698 () (_ BitVec 64))

(assert (=> b!1076502 (= lt!477698 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477700 () Unit!35373)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69035 (_ BitVec 64) (_ BitVec 32)) Unit!35373)

(assert (=> b!1076502 (= lt!477700 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!477698 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1076502 (arrayContainsKey!0 _keys!1163 lt!477698 #b00000000000000000000000000000000)))

(declare-fun lt!477699 () Unit!35373)

(assert (=> b!1076502 (= lt!477699 lt!477700)))

(declare-fun res!717339 () Bool)

(declare-datatypes ((SeekEntryResult!9847 0))(
  ( (MissingZero!9847 (index!41759 (_ BitVec 32))) (Found!9847 (index!41760 (_ BitVec 32))) (Intermediate!9847 (undefined!10659 Bool) (index!41761 (_ BitVec 32)) (x!96340 (_ BitVec 32))) (Undefined!9847) (MissingVacant!9847 (index!41762 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69035 (_ BitVec 32)) SeekEntryResult!9847)

(assert (=> b!1076502 (= res!717339 (= (seekEntryOrOpen!0 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9847 #b00000000000000000000000000000000)))))

(assert (=> b!1076502 (=> (not res!717339) (not e!615309))))

(declare-fun b!1076503 () Bool)

(declare-fun e!615308 () Bool)

(assert (=> b!1076503 (= e!615308 e!615307)))

(declare-fun c!108409 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1076503 (= c!108409 (validKeyInArray!0 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45537 () Bool)

(declare-fun call!45540 () Bool)

(assert (=> bm!45537 (= call!45540 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1076505 () Bool)

(assert (=> b!1076505 (= e!615307 call!45540)))

(declare-fun b!1076504 () Bool)

(assert (=> b!1076504 (= e!615309 call!45540)))

(declare-fun d!130037 () Bool)

(declare-fun res!717340 () Bool)

(assert (=> d!130037 (=> res!717340 e!615308)))

(assert (=> d!130037 (= res!717340 (bvsge #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(assert (=> d!130037 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!615308)))

(assert (= (and d!130037 (not res!717340)) b!1076503))

(assert (= (and b!1076503 c!108409) b!1076502))

(assert (= (and b!1076503 (not c!108409)) b!1076505))

(assert (= (and b!1076502 res!717339) b!1076504))

(assert (= (or b!1076504 b!1076505) bm!45537))

(declare-fun m!995723 () Bool)

(assert (=> b!1076502 m!995723))

(declare-fun m!995725 () Bool)

(assert (=> b!1076502 m!995725))

(declare-fun m!995727 () Bool)

(assert (=> b!1076502 m!995727))

(assert (=> b!1076502 m!995723))

(declare-fun m!995729 () Bool)

(assert (=> b!1076502 m!995729))

(assert (=> b!1076503 m!995723))

(assert (=> b!1076503 m!995723))

(declare-fun m!995731 () Bool)

(assert (=> b!1076503 m!995731))

(declare-fun m!995733 () Bool)

(assert (=> bm!45537 m!995733))

(assert (=> b!1076444 d!130037))

(declare-fun d!130039 () Bool)

(declare-fun res!717348 () Bool)

(declare-fun e!615321 () Bool)

(assert (=> d!130039 (=> res!717348 e!615321)))

(assert (=> d!130039 (= res!717348 (bvsge #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(assert (=> d!130039 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23171) e!615321)))

(declare-fun b!1076516 () Bool)

(declare-fun e!615318 () Bool)

(declare-fun contains!6370 (List!23174 (_ BitVec 64)) Bool)

(assert (=> b!1076516 (= e!615318 (contains!6370 Nil!23171 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076517 () Bool)

(declare-fun e!615319 () Bool)

(assert (=> b!1076517 (= e!615321 e!615319)))

(declare-fun res!717347 () Bool)

(assert (=> b!1076517 (=> (not res!717347) (not e!615319))))

(assert (=> b!1076517 (= res!717347 (not e!615318))))

(declare-fun res!717349 () Bool)

(assert (=> b!1076517 (=> (not res!717349) (not e!615318))))

(assert (=> b!1076517 (= res!717349 (validKeyInArray!0 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076518 () Bool)

(declare-fun e!615320 () Bool)

(declare-fun call!45543 () Bool)

(assert (=> b!1076518 (= e!615320 call!45543)))

(declare-fun bm!45540 () Bool)

(declare-fun c!108412 () Bool)

(assert (=> bm!45540 (= call!45543 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108412 (Cons!23170 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000) Nil!23171) Nil!23171)))))

(declare-fun b!1076519 () Bool)

(assert (=> b!1076519 (= e!615319 e!615320)))

(assert (=> b!1076519 (= c!108412 (validKeyInArray!0 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076520 () Bool)

(assert (=> b!1076520 (= e!615320 call!45543)))

(assert (= (and d!130039 (not res!717348)) b!1076517))

(assert (= (and b!1076517 res!717349) b!1076516))

(assert (= (and b!1076517 res!717347) b!1076519))

(assert (= (and b!1076519 c!108412) b!1076518))

(assert (= (and b!1076519 (not c!108412)) b!1076520))

(assert (= (or b!1076518 b!1076520) bm!45540))

(assert (=> b!1076516 m!995723))

(assert (=> b!1076516 m!995723))

(declare-fun m!995735 () Bool)

(assert (=> b!1076516 m!995735))

(assert (=> b!1076517 m!995723))

(assert (=> b!1076517 m!995723))

(assert (=> b!1076517 m!995731))

(assert (=> bm!45540 m!995723))

(declare-fun m!995737 () Bool)

(assert (=> bm!45540 m!995737))

(assert (=> b!1076519 m!995723))

(assert (=> b!1076519 m!995723))

(assert (=> b!1076519 m!995731))

(assert (=> b!1076440 d!130039))

(declare-fun d!130041 () Bool)

(assert (=> d!130041 (= (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477703 () Unit!35373)

(declare-fun choose!1757 (array!69035 array!69033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39817 V!39817 V!39817 V!39817 (_ BitVec 32) Int) Unit!35373)

(assert (=> d!130041 (= lt!477703 (choose!1757 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!130041 (validMask!0 mask!1515)))

(assert (=> d!130041 (= (lemmaNoChangeToArrayThenSameMapNoExtras!889 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477703)))

(declare-fun bs!31699 () Bool)

(assert (= bs!31699 d!130041))

(assert (=> bs!31699 m!995667))

(assert (=> bs!31699 m!995665))

(declare-fun m!995739 () Bool)

(assert (=> bs!31699 m!995739))

(assert (=> bs!31699 m!995671))

(assert (=> b!1076442 d!130041))

(declare-fun b!1076545 () Bool)

(assert (=> b!1076545 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(assert (=> b!1076545 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33735 _values!955)))))

(declare-fun lt!477721 () ListLongMap!14599)

(declare-fun e!615342 () Bool)

(declare-fun apply!947 (ListLongMap!14599 (_ BitVec 64)) V!39817)

(declare-fun get!17263 (ValueCell!12302 V!39817) V!39817)

(declare-fun dynLambda!2062 (Int (_ BitVec 64)) V!39817)

(assert (=> b!1076545 (= e!615342 (= (apply!947 lt!477721 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)) (get!17263 (select (arr!33198 _values!955) #b00000000000000000000000000000000) (dynLambda!2062 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1076546 () Bool)

(declare-fun e!615340 () Bool)

(assert (=> b!1076546 (= e!615340 (validKeyInArray!0 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076546 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1076547 () Bool)

(declare-fun e!615336 () Bool)

(assert (=> b!1076547 (= e!615336 e!615342)))

(assert (=> b!1076547 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(declare-fun res!717358 () Bool)

(assert (=> b!1076547 (= res!717358 (contains!6368 lt!477721 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076547 (=> (not res!717358) (not e!615342))))

(declare-fun b!1076548 () Bool)

(declare-fun e!615339 () ListLongMap!14599)

(declare-fun e!615338 () ListLongMap!14599)

(assert (=> b!1076548 (= e!615339 e!615338)))

(declare-fun c!108424 () Bool)

(assert (=> b!1076548 (= c!108424 (validKeyInArray!0 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076549 () Bool)

(declare-fun e!615341 () Bool)

(declare-fun isEmpty!960 (ListLongMap!14599) Bool)

(assert (=> b!1076549 (= e!615341 (isEmpty!960 lt!477721))))

(declare-fun b!1076550 () Bool)

(assert (=> b!1076550 (= e!615339 (ListLongMap!14600 Nil!23170))))

(declare-fun b!1076551 () Bool)

(declare-fun e!615337 () Bool)

(assert (=> b!1076551 (= e!615337 e!615336)))

(declare-fun c!108422 () Bool)

(assert (=> b!1076551 (= c!108422 e!615340)))

(declare-fun res!717361 () Bool)

(assert (=> b!1076551 (=> (not res!717361) (not e!615340))))

(assert (=> b!1076551 (= res!717361 (bvslt #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(declare-fun d!130043 () Bool)

(assert (=> d!130043 e!615337))

(declare-fun res!717360 () Bool)

(assert (=> d!130043 (=> (not res!717360) (not e!615337))))

(assert (=> d!130043 (= res!717360 (not (contains!6368 lt!477721 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130043 (= lt!477721 e!615339)))

(declare-fun c!108421 () Bool)

(assert (=> d!130043 (= c!108421 (bvsge #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(assert (=> d!130043 (validMask!0 mask!1515)))

(assert (=> d!130043 (= (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477721)))

(declare-fun bm!45543 () Bool)

(declare-fun call!45546 () ListLongMap!14599)

(assert (=> bm!45543 (= call!45546 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1076552 () Bool)

(assert (=> b!1076552 (= e!615341 (= lt!477721 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1076553 () Bool)

(declare-fun lt!477718 () Unit!35373)

(declare-fun lt!477723 () Unit!35373)

(assert (=> b!1076553 (= lt!477718 lt!477723)))

(declare-fun lt!477722 () ListLongMap!14599)

(declare-fun lt!477720 () (_ BitVec 64))

(declare-fun lt!477724 () V!39817)

(declare-fun lt!477719 () (_ BitVec 64))

(declare-fun +!3245 (ListLongMap!14599 tuple2!16622) ListLongMap!14599)

(assert (=> b!1076553 (not (contains!6368 (+!3245 lt!477722 (tuple2!16623 lt!477719 lt!477724)) lt!477720))))

(declare-fun addStillNotContains!268 (ListLongMap!14599 (_ BitVec 64) V!39817 (_ BitVec 64)) Unit!35373)

(assert (=> b!1076553 (= lt!477723 (addStillNotContains!268 lt!477722 lt!477719 lt!477724 lt!477720))))

(assert (=> b!1076553 (= lt!477720 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1076553 (= lt!477724 (get!17263 (select (arr!33198 _values!955) #b00000000000000000000000000000000) (dynLambda!2062 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1076553 (= lt!477719 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076553 (= lt!477722 call!45546)))

(assert (=> b!1076553 (= e!615338 (+!3245 call!45546 (tuple2!16623 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000) (get!17263 (select (arr!33198 _values!955) #b00000000000000000000000000000000) (dynLambda!2062 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1076554 () Bool)

(declare-fun res!717359 () Bool)

(assert (=> b!1076554 (=> (not res!717359) (not e!615337))))

(assert (=> b!1076554 (= res!717359 (not (contains!6368 lt!477721 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1076555 () Bool)

(assert (=> b!1076555 (= e!615338 call!45546)))

(declare-fun b!1076556 () Bool)

(assert (=> b!1076556 (= e!615336 e!615341)))

(declare-fun c!108423 () Bool)

(assert (=> b!1076556 (= c!108423 (bvslt #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(assert (= (and d!130043 c!108421) b!1076550))

(assert (= (and d!130043 (not c!108421)) b!1076548))

(assert (= (and b!1076548 c!108424) b!1076553))

(assert (= (and b!1076548 (not c!108424)) b!1076555))

(assert (= (or b!1076553 b!1076555) bm!45543))

(assert (= (and d!130043 res!717360) b!1076554))

(assert (= (and b!1076554 res!717359) b!1076551))

(assert (= (and b!1076551 res!717361) b!1076546))

(assert (= (and b!1076551 c!108422) b!1076547))

(assert (= (and b!1076551 (not c!108422)) b!1076556))

(assert (= (and b!1076547 res!717358) b!1076545))

(assert (= (and b!1076556 c!108423) b!1076552))

(assert (= (and b!1076556 (not c!108423)) b!1076549))

(declare-fun b_lambda!16867 () Bool)

(assert (=> (not b_lambda!16867) (not b!1076545)))

(declare-fun t!32519 () Bool)

(declare-fun tb!7163 () Bool)

(assert (=> (and start!95340 (= defaultEntry!963 defaultEntry!963) t!32519) tb!7163))

(declare-fun result!14813 () Bool)

(assert (=> tb!7163 (= result!14813 tp_is_empty!26011)))

(assert (=> b!1076545 t!32519))

(declare-fun b_and!35137 () Bool)

(assert (= b_and!35131 (and (=> t!32519 result!14813) b_and!35137)))

(declare-fun b_lambda!16869 () Bool)

(assert (=> (not b_lambda!16869) (not b!1076553)))

(assert (=> b!1076553 t!32519))

(declare-fun b_and!35139 () Bool)

(assert (= b_and!35137 (and (=> t!32519 result!14813) b_and!35139)))

(assert (=> b!1076546 m!995723))

(assert (=> b!1076546 m!995723))

(assert (=> b!1076546 m!995731))

(declare-fun m!995741 () Bool)

(assert (=> b!1076554 m!995741))

(declare-fun m!995743 () Bool)

(assert (=> b!1076545 m!995743))

(declare-fun m!995745 () Bool)

(assert (=> b!1076545 m!995745))

(declare-fun m!995747 () Bool)

(assert (=> b!1076545 m!995747))

(assert (=> b!1076545 m!995745))

(assert (=> b!1076545 m!995723))

(declare-fun m!995749 () Bool)

(assert (=> b!1076545 m!995749))

(assert (=> b!1076545 m!995723))

(assert (=> b!1076545 m!995743))

(declare-fun m!995751 () Bool)

(assert (=> b!1076549 m!995751))

(declare-fun m!995753 () Bool)

(assert (=> d!130043 m!995753))

(assert (=> d!130043 m!995671))

(assert (=> b!1076548 m!995723))

(assert (=> b!1076548 m!995723))

(assert (=> b!1076548 m!995731))

(declare-fun m!995755 () Bool)

(assert (=> b!1076553 m!995755))

(assert (=> b!1076553 m!995743))

(assert (=> b!1076553 m!995745))

(assert (=> b!1076553 m!995747))

(assert (=> b!1076553 m!995723))

(assert (=> b!1076553 m!995743))

(assert (=> b!1076553 m!995745))

(declare-fun m!995757 () Bool)

(assert (=> b!1076553 m!995757))

(assert (=> b!1076553 m!995757))

(declare-fun m!995759 () Bool)

(assert (=> b!1076553 m!995759))

(declare-fun m!995761 () Bool)

(assert (=> b!1076553 m!995761))

(assert (=> b!1076547 m!995723))

(assert (=> b!1076547 m!995723))

(declare-fun m!995763 () Bool)

(assert (=> b!1076547 m!995763))

(declare-fun m!995765 () Bool)

(assert (=> b!1076552 m!995765))

(assert (=> bm!45543 m!995765))

(assert (=> b!1076442 d!130043))

(declare-fun b!1076559 () Bool)

(assert (=> b!1076559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(assert (=> b!1076559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33735 _values!955)))))

(declare-fun lt!477728 () ListLongMap!14599)

(declare-fun e!615349 () Bool)

(assert (=> b!1076559 (= e!615349 (= (apply!947 lt!477728 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)) (get!17263 (select (arr!33198 _values!955) #b00000000000000000000000000000000) (dynLambda!2062 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1076560 () Bool)

(declare-fun e!615347 () Bool)

(assert (=> b!1076560 (= e!615347 (validKeyInArray!0 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076560 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1076561 () Bool)

(declare-fun e!615343 () Bool)

(assert (=> b!1076561 (= e!615343 e!615349)))

(assert (=> b!1076561 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(declare-fun res!717362 () Bool)

(assert (=> b!1076561 (= res!717362 (contains!6368 lt!477728 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076561 (=> (not res!717362) (not e!615349))))

(declare-fun b!1076562 () Bool)

(declare-fun e!615346 () ListLongMap!14599)

(declare-fun e!615345 () ListLongMap!14599)

(assert (=> b!1076562 (= e!615346 e!615345)))

(declare-fun c!108428 () Bool)

(assert (=> b!1076562 (= c!108428 (validKeyInArray!0 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076563 () Bool)

(declare-fun e!615348 () Bool)

(assert (=> b!1076563 (= e!615348 (isEmpty!960 lt!477728))))

(declare-fun b!1076564 () Bool)

(assert (=> b!1076564 (= e!615346 (ListLongMap!14600 Nil!23170))))

(declare-fun b!1076565 () Bool)

(declare-fun e!615344 () Bool)

(assert (=> b!1076565 (= e!615344 e!615343)))

(declare-fun c!108426 () Bool)

(assert (=> b!1076565 (= c!108426 e!615347)))

(declare-fun res!717365 () Bool)

(assert (=> b!1076565 (=> (not res!717365) (not e!615347))))

(assert (=> b!1076565 (= res!717365 (bvslt #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(declare-fun d!130045 () Bool)

(assert (=> d!130045 e!615344))

(declare-fun res!717364 () Bool)

(assert (=> d!130045 (=> (not res!717364) (not e!615344))))

(assert (=> d!130045 (= res!717364 (not (contains!6368 lt!477728 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130045 (= lt!477728 e!615346)))

(declare-fun c!108425 () Bool)

(assert (=> d!130045 (= c!108425 (bvsge #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(assert (=> d!130045 (validMask!0 mask!1515)))

(assert (=> d!130045 (= (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477728)))

(declare-fun call!45547 () ListLongMap!14599)

(declare-fun bm!45544 () Bool)

(assert (=> bm!45544 (= call!45547 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1076566 () Bool)

(assert (=> b!1076566 (= e!615348 (= lt!477728 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1076567 () Bool)

(declare-fun lt!477725 () Unit!35373)

(declare-fun lt!477730 () Unit!35373)

(assert (=> b!1076567 (= lt!477725 lt!477730)))

(declare-fun lt!477727 () (_ BitVec 64))

(declare-fun lt!477731 () V!39817)

(declare-fun lt!477726 () (_ BitVec 64))

(declare-fun lt!477729 () ListLongMap!14599)

(assert (=> b!1076567 (not (contains!6368 (+!3245 lt!477729 (tuple2!16623 lt!477726 lt!477731)) lt!477727))))

(assert (=> b!1076567 (= lt!477730 (addStillNotContains!268 lt!477729 lt!477726 lt!477731 lt!477727))))

(assert (=> b!1076567 (= lt!477727 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1076567 (= lt!477731 (get!17263 (select (arr!33198 _values!955) #b00000000000000000000000000000000) (dynLambda!2062 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1076567 (= lt!477726 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076567 (= lt!477729 call!45547)))

(assert (=> b!1076567 (= e!615345 (+!3245 call!45547 (tuple2!16623 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000) (get!17263 (select (arr!33198 _values!955) #b00000000000000000000000000000000) (dynLambda!2062 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1076568 () Bool)

(declare-fun res!717363 () Bool)

(assert (=> b!1076568 (=> (not res!717363) (not e!615344))))

(assert (=> b!1076568 (= res!717363 (not (contains!6368 lt!477728 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1076569 () Bool)

(assert (=> b!1076569 (= e!615345 call!45547)))

(declare-fun b!1076570 () Bool)

(assert (=> b!1076570 (= e!615343 e!615348)))

(declare-fun c!108427 () Bool)

(assert (=> b!1076570 (= c!108427 (bvslt #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(assert (= (and d!130045 c!108425) b!1076564))

(assert (= (and d!130045 (not c!108425)) b!1076562))

(assert (= (and b!1076562 c!108428) b!1076567))

(assert (= (and b!1076562 (not c!108428)) b!1076569))

(assert (= (or b!1076567 b!1076569) bm!45544))

(assert (= (and d!130045 res!717364) b!1076568))

(assert (= (and b!1076568 res!717363) b!1076565))

(assert (= (and b!1076565 res!717365) b!1076560))

(assert (= (and b!1076565 c!108426) b!1076561))

(assert (= (and b!1076565 (not c!108426)) b!1076570))

(assert (= (and b!1076561 res!717362) b!1076559))

(assert (= (and b!1076570 c!108427) b!1076566))

(assert (= (and b!1076570 (not c!108427)) b!1076563))

(declare-fun b_lambda!16871 () Bool)

(assert (=> (not b_lambda!16871) (not b!1076559)))

(assert (=> b!1076559 t!32519))

(declare-fun b_and!35141 () Bool)

(assert (= b_and!35139 (and (=> t!32519 result!14813) b_and!35141)))

(declare-fun b_lambda!16873 () Bool)

(assert (=> (not b_lambda!16873) (not b!1076567)))

(assert (=> b!1076567 t!32519))

(declare-fun b_and!35143 () Bool)

(assert (= b_and!35141 (and (=> t!32519 result!14813) b_and!35143)))

(assert (=> b!1076560 m!995723))

(assert (=> b!1076560 m!995723))

(assert (=> b!1076560 m!995731))

(declare-fun m!995767 () Bool)

(assert (=> b!1076568 m!995767))

(assert (=> b!1076559 m!995743))

(assert (=> b!1076559 m!995745))

(assert (=> b!1076559 m!995747))

(assert (=> b!1076559 m!995745))

(assert (=> b!1076559 m!995723))

(declare-fun m!995769 () Bool)

(assert (=> b!1076559 m!995769))

(assert (=> b!1076559 m!995723))

(assert (=> b!1076559 m!995743))

(declare-fun m!995771 () Bool)

(assert (=> b!1076563 m!995771))

(declare-fun m!995773 () Bool)

(assert (=> d!130045 m!995773))

(assert (=> d!130045 m!995671))

(assert (=> b!1076562 m!995723))

(assert (=> b!1076562 m!995723))

(assert (=> b!1076562 m!995731))

(declare-fun m!995775 () Bool)

(assert (=> b!1076567 m!995775))

(assert (=> b!1076567 m!995743))

(assert (=> b!1076567 m!995745))

(assert (=> b!1076567 m!995747))

(assert (=> b!1076567 m!995723))

(assert (=> b!1076567 m!995743))

(assert (=> b!1076567 m!995745))

(declare-fun m!995777 () Bool)

(assert (=> b!1076567 m!995777))

(assert (=> b!1076567 m!995777))

(declare-fun m!995779 () Bool)

(assert (=> b!1076567 m!995779))

(declare-fun m!995781 () Bool)

(assert (=> b!1076567 m!995781))

(assert (=> b!1076561 m!995723))

(assert (=> b!1076561 m!995723))

(declare-fun m!995783 () Bool)

(assert (=> b!1076561 m!995783))

(declare-fun m!995785 () Bool)

(assert (=> b!1076566 m!995785))

(assert (=> bm!45544 m!995785))

(assert (=> b!1076442 d!130045))

(declare-fun d!130047 () Bool)

(declare-fun e!615354 () Bool)

(assert (=> d!130047 e!615354))

(declare-fun res!717368 () Bool)

(assert (=> d!130047 (=> res!717368 e!615354)))

(declare-fun lt!477742 () Bool)

(assert (=> d!130047 (= res!717368 (not lt!477742))))

(declare-fun lt!477743 () Bool)

(assert (=> d!130047 (= lt!477742 lt!477743)))

(declare-fun lt!477740 () Unit!35373)

(declare-fun e!615355 () Unit!35373)

(assert (=> d!130047 (= lt!477740 e!615355)))

(declare-fun c!108431 () Bool)

(assert (=> d!130047 (= c!108431 lt!477743)))

(declare-fun containsKey!581 (List!23173 (_ BitVec 64)) Bool)

(assert (=> d!130047 (= lt!477743 (containsKey!581 (toList!7315 (getCurrentListMap!4172 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!130047 (= (contains!6368 (getCurrentListMap!4172 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000) lt!477742)))

(declare-fun b!1076577 () Bool)

(declare-fun lt!477741 () Unit!35373)

(assert (=> b!1076577 (= e!615355 lt!477741)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!412 (List!23173 (_ BitVec 64)) Unit!35373)

(assert (=> b!1076577 (= lt!477741 (lemmaContainsKeyImpliesGetValueByKeyDefined!412 (toList!7315 (getCurrentListMap!4172 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!657 0))(
  ( (Some!656 (v!15678 V!39817)) (None!655) )
))
(declare-fun isDefined!450 (Option!657) Bool)

(declare-fun getValueByKey!606 (List!23173 (_ BitVec 64)) Option!657)

(assert (=> b!1076577 (isDefined!450 (getValueByKey!606 (toList!7315 (getCurrentListMap!4172 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076578 () Bool)

(declare-fun Unit!35375 () Unit!35373)

(assert (=> b!1076578 (= e!615355 Unit!35375)))

(declare-fun b!1076579 () Bool)

(assert (=> b!1076579 (= e!615354 (isDefined!450 (getValueByKey!606 (toList!7315 (getCurrentListMap!4172 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!130047 c!108431) b!1076577))

(assert (= (and d!130047 (not c!108431)) b!1076578))

(assert (= (and d!130047 (not res!717368)) b!1076579))

(declare-fun m!995787 () Bool)

(assert (=> d!130047 m!995787))

(declare-fun m!995789 () Bool)

(assert (=> b!1076577 m!995789))

(declare-fun m!995791 () Bool)

(assert (=> b!1076577 m!995791))

(assert (=> b!1076577 m!995791))

(declare-fun m!995793 () Bool)

(assert (=> b!1076577 m!995793))

(assert (=> b!1076579 m!995791))

(assert (=> b!1076579 m!995791))

(assert (=> b!1076579 m!995793))

(assert (=> b!1076438 d!130047))

(declare-fun bm!45559 () Bool)

(declare-fun call!45562 () Bool)

(declare-fun lt!477793 () ListLongMap!14599)

(assert (=> bm!45559 (= call!45562 (contains!6368 lt!477793 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45560 () Bool)

(declare-fun call!45565 () ListLongMap!14599)

(declare-fun call!45564 () ListLongMap!14599)

(assert (=> bm!45560 (= call!45565 call!45564)))

(declare-fun b!1076622 () Bool)

(declare-fun res!717394 () Bool)

(declare-fun e!615390 () Bool)

(assert (=> b!1076622 (=> (not res!717394) (not e!615390))))

(declare-fun e!615382 () Bool)

(assert (=> b!1076622 (= res!717394 e!615382)))

(declare-fun res!717393 () Bool)

(assert (=> b!1076622 (=> res!717393 e!615382)))

(declare-fun e!615388 () Bool)

(assert (=> b!1076622 (= res!717393 (not e!615388))))

(declare-fun res!717388 () Bool)

(assert (=> b!1076622 (=> (not res!717388) (not e!615388))))

(assert (=> b!1076622 (= res!717388 (bvslt #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(declare-fun b!1076623 () Bool)

(declare-fun e!615389 () Unit!35373)

(declare-fun lt!477792 () Unit!35373)

(assert (=> b!1076623 (= e!615389 lt!477792)))

(declare-fun lt!477799 () ListLongMap!14599)

(assert (=> b!1076623 (= lt!477799 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477809 () (_ BitVec 64))

(assert (=> b!1076623 (= lt!477809 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477790 () (_ BitVec 64))

(assert (=> b!1076623 (= lt!477790 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477794 () Unit!35373)

(declare-fun addStillContains!651 (ListLongMap!14599 (_ BitVec 64) V!39817 (_ BitVec 64)) Unit!35373)

(assert (=> b!1076623 (= lt!477794 (addStillContains!651 lt!477799 lt!477809 zeroValueBefore!47 lt!477790))))

(assert (=> b!1076623 (contains!6368 (+!3245 lt!477799 (tuple2!16623 lt!477809 zeroValueBefore!47)) lt!477790)))

(declare-fun lt!477795 () Unit!35373)

(assert (=> b!1076623 (= lt!477795 lt!477794)))

(declare-fun lt!477798 () ListLongMap!14599)

(assert (=> b!1076623 (= lt!477798 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477789 () (_ BitVec 64))

(assert (=> b!1076623 (= lt!477789 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477807 () (_ BitVec 64))

(assert (=> b!1076623 (= lt!477807 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477805 () Unit!35373)

(declare-fun addApplyDifferent!507 (ListLongMap!14599 (_ BitVec 64) V!39817 (_ BitVec 64)) Unit!35373)

(assert (=> b!1076623 (= lt!477805 (addApplyDifferent!507 lt!477798 lt!477789 minValue!907 lt!477807))))

(assert (=> b!1076623 (= (apply!947 (+!3245 lt!477798 (tuple2!16623 lt!477789 minValue!907)) lt!477807) (apply!947 lt!477798 lt!477807))))

(declare-fun lt!477796 () Unit!35373)

(assert (=> b!1076623 (= lt!477796 lt!477805)))

(declare-fun lt!477808 () ListLongMap!14599)

(assert (=> b!1076623 (= lt!477808 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477791 () (_ BitVec 64))

(assert (=> b!1076623 (= lt!477791 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477797 () (_ BitVec 64))

(assert (=> b!1076623 (= lt!477797 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477806 () Unit!35373)

(assert (=> b!1076623 (= lt!477806 (addApplyDifferent!507 lt!477808 lt!477791 zeroValueBefore!47 lt!477797))))

(assert (=> b!1076623 (= (apply!947 (+!3245 lt!477808 (tuple2!16623 lt!477791 zeroValueBefore!47)) lt!477797) (apply!947 lt!477808 lt!477797))))

(declare-fun lt!477788 () Unit!35373)

(assert (=> b!1076623 (= lt!477788 lt!477806)))

(declare-fun lt!477803 () ListLongMap!14599)

(assert (=> b!1076623 (= lt!477803 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477800 () (_ BitVec 64))

(assert (=> b!1076623 (= lt!477800 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477801 () (_ BitVec 64))

(assert (=> b!1076623 (= lt!477801 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076623 (= lt!477792 (addApplyDifferent!507 lt!477803 lt!477800 minValue!907 lt!477801))))

(assert (=> b!1076623 (= (apply!947 (+!3245 lt!477803 (tuple2!16623 lt!477800 minValue!907)) lt!477801) (apply!947 lt!477803 lt!477801))))

(declare-fun d!130049 () Bool)

(assert (=> d!130049 e!615390))

(declare-fun res!717390 () Bool)

(assert (=> d!130049 (=> (not res!717390) (not e!615390))))

(assert (=> d!130049 (= res!717390 (or (bvsge #b00000000000000000000000000000000 (size!33736 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33736 _keys!1163)))))))

(declare-fun lt!477804 () ListLongMap!14599)

(assert (=> d!130049 (= lt!477793 lt!477804)))

(declare-fun lt!477802 () Unit!35373)

(assert (=> d!130049 (= lt!477802 e!615389)))

(declare-fun c!108445 () Bool)

(declare-fun e!615393 () Bool)

(assert (=> d!130049 (= c!108445 e!615393)))

(declare-fun res!717389 () Bool)

(assert (=> d!130049 (=> (not res!717389) (not e!615393))))

(assert (=> d!130049 (= res!717389 (bvslt #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(declare-fun e!615383 () ListLongMap!14599)

(assert (=> d!130049 (= lt!477804 e!615383)))

(declare-fun c!108449 () Bool)

(assert (=> d!130049 (= c!108449 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130049 (validMask!0 mask!1515)))

(assert (=> d!130049 (= (getCurrentListMap!4172 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477793)))

(declare-fun b!1076624 () Bool)

(assert (=> b!1076624 (= e!615383 (+!3245 call!45564 (tuple2!16623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1076625 () Bool)

(assert (=> b!1076625 (= e!615393 (validKeyInArray!0 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076626 () Bool)

(assert (=> b!1076626 (= e!615388 (validKeyInArray!0 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076627 () Bool)

(declare-fun e!615386 () Bool)

(declare-fun e!615394 () Bool)

(assert (=> b!1076627 (= e!615386 e!615394)))

(declare-fun res!717395 () Bool)

(declare-fun call!45568 () Bool)

(assert (=> b!1076627 (= res!717395 call!45568)))

(assert (=> b!1076627 (=> (not res!717395) (not e!615394))))

(declare-fun e!615391 () Bool)

(declare-fun b!1076628 () Bool)

(assert (=> b!1076628 (= e!615391 (= (apply!947 lt!477793 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)) (get!17263 (select (arr!33198 _values!955) #b00000000000000000000000000000000) (dynLambda!2062 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1076628 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33735 _values!955)))))

(assert (=> b!1076628 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(declare-fun b!1076629 () Bool)

(declare-fun Unit!35376 () Unit!35373)

(assert (=> b!1076629 (= e!615389 Unit!35376)))

(declare-fun b!1076630 () Bool)

(declare-fun e!615392 () ListLongMap!14599)

(assert (=> b!1076630 (= e!615392 call!45565)))

(declare-fun bm!45561 () Bool)

(declare-fun call!45566 () ListLongMap!14599)

(declare-fun call!45567 () ListLongMap!14599)

(assert (=> bm!45561 (= call!45566 call!45567)))

(declare-fun bm!45562 () Bool)

(declare-fun call!45563 () ListLongMap!14599)

(assert (=> bm!45562 (= call!45563 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076631 () Bool)

(assert (=> b!1076631 (= e!615394 (= (apply!947 lt!477793 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1076632 () Bool)

(declare-fun res!717392 () Bool)

(assert (=> b!1076632 (=> (not res!717392) (not e!615390))))

(declare-fun e!615385 () Bool)

(assert (=> b!1076632 (= res!717392 e!615385)))

(declare-fun c!108446 () Bool)

(assert (=> b!1076632 (= c!108446 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45563 () Bool)

(assert (=> bm!45563 (= call!45567 call!45563)))

(declare-fun b!1076633 () Bool)

(declare-fun e!615387 () Bool)

(assert (=> b!1076633 (= e!615385 e!615387)))

(declare-fun res!717387 () Bool)

(assert (=> b!1076633 (= res!717387 call!45562)))

(assert (=> b!1076633 (=> (not res!717387) (not e!615387))))

(declare-fun b!1076634 () Bool)

(declare-fun c!108448 () Bool)

(assert (=> b!1076634 (= c!108448 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!615384 () ListLongMap!14599)

(assert (=> b!1076634 (= e!615392 e!615384)))

(declare-fun b!1076635 () Bool)

(assert (=> b!1076635 (= e!615387 (= (apply!947 lt!477793 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1076636 () Bool)

(assert (=> b!1076636 (= e!615390 e!615386)))

(declare-fun c!108444 () Bool)

(assert (=> b!1076636 (= c!108444 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1076637 () Bool)

(assert (=> b!1076637 (= e!615384 call!45566)))

(declare-fun b!1076638 () Bool)

(assert (=> b!1076638 (= e!615382 e!615391)))

(declare-fun res!717391 () Bool)

(assert (=> b!1076638 (=> (not res!717391) (not e!615391))))

(assert (=> b!1076638 (= res!717391 (contains!6368 lt!477793 (select (arr!33199 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076638 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33736 _keys!1163)))))

(declare-fun b!1076639 () Bool)

(assert (=> b!1076639 (= e!615385 (not call!45562))))

(declare-fun bm!45564 () Bool)

(declare-fun c!108447 () Bool)

(assert (=> bm!45564 (= call!45564 (+!3245 (ite c!108449 call!45563 (ite c!108447 call!45567 call!45566)) (ite (or c!108449 c!108447) (tuple2!16623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1076640 () Bool)

(assert (=> b!1076640 (= e!615386 (not call!45568))))

(declare-fun b!1076641 () Bool)

(assert (=> b!1076641 (= e!615384 call!45565)))

(declare-fun bm!45565 () Bool)

(assert (=> bm!45565 (= call!45568 (contains!6368 lt!477793 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076642 () Bool)

(assert (=> b!1076642 (= e!615383 e!615392)))

(assert (=> b!1076642 (= c!108447 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!130049 c!108449) b!1076624))

(assert (= (and d!130049 (not c!108449)) b!1076642))

(assert (= (and b!1076642 c!108447) b!1076630))

(assert (= (and b!1076642 (not c!108447)) b!1076634))

(assert (= (and b!1076634 c!108448) b!1076641))

(assert (= (and b!1076634 (not c!108448)) b!1076637))

(assert (= (or b!1076641 b!1076637) bm!45561))

(assert (= (or b!1076630 bm!45561) bm!45563))

(assert (= (or b!1076630 b!1076641) bm!45560))

(assert (= (or b!1076624 bm!45563) bm!45562))

(assert (= (or b!1076624 bm!45560) bm!45564))

(assert (= (and d!130049 res!717389) b!1076625))

(assert (= (and d!130049 c!108445) b!1076623))

(assert (= (and d!130049 (not c!108445)) b!1076629))

(assert (= (and d!130049 res!717390) b!1076622))

(assert (= (and b!1076622 res!717388) b!1076626))

(assert (= (and b!1076622 (not res!717393)) b!1076638))

(assert (= (and b!1076638 res!717391) b!1076628))

(assert (= (and b!1076622 res!717394) b!1076632))

(assert (= (and b!1076632 c!108446) b!1076633))

(assert (= (and b!1076632 (not c!108446)) b!1076639))

(assert (= (and b!1076633 res!717387) b!1076635))

(assert (= (or b!1076633 b!1076639) bm!45559))

(assert (= (and b!1076632 res!717392) b!1076636))

(assert (= (and b!1076636 c!108444) b!1076627))

(assert (= (and b!1076636 (not c!108444)) b!1076640))

(assert (= (and b!1076627 res!717395) b!1076631))

(assert (= (or b!1076627 b!1076640) bm!45565))

(declare-fun b_lambda!16875 () Bool)

(assert (=> (not b_lambda!16875) (not b!1076628)))

(assert (=> b!1076628 t!32519))

(declare-fun b_and!35145 () Bool)

(assert (= b_and!35143 (and (=> t!32519 result!14813) b_and!35145)))

(assert (=> bm!45562 m!995667))

(declare-fun m!995795 () Bool)

(assert (=> bm!45565 m!995795))

(declare-fun m!995797 () Bool)

(assert (=> b!1076624 m!995797))

(assert (=> d!130049 m!995671))

(assert (=> b!1076638 m!995723))

(assert (=> b!1076638 m!995723))

(declare-fun m!995799 () Bool)

(assert (=> b!1076638 m!995799))

(declare-fun m!995801 () Bool)

(assert (=> b!1076623 m!995801))

(declare-fun m!995803 () Bool)

(assert (=> b!1076623 m!995803))

(declare-fun m!995805 () Bool)

(assert (=> b!1076623 m!995805))

(declare-fun m!995807 () Bool)

(assert (=> b!1076623 m!995807))

(declare-fun m!995809 () Bool)

(assert (=> b!1076623 m!995809))

(declare-fun m!995811 () Bool)

(assert (=> b!1076623 m!995811))

(declare-fun m!995813 () Bool)

(assert (=> b!1076623 m!995813))

(declare-fun m!995815 () Bool)

(assert (=> b!1076623 m!995815))

(assert (=> b!1076623 m!995807))

(declare-fun m!995817 () Bool)

(assert (=> b!1076623 m!995817))

(declare-fun m!995819 () Bool)

(assert (=> b!1076623 m!995819))

(declare-fun m!995821 () Bool)

(assert (=> b!1076623 m!995821))

(assert (=> b!1076623 m!995803))

(declare-fun m!995823 () Bool)

(assert (=> b!1076623 m!995823))

(declare-fun m!995825 () Bool)

(assert (=> b!1076623 m!995825))

(assert (=> b!1076623 m!995817))

(declare-fun m!995827 () Bool)

(assert (=> b!1076623 m!995827))

(assert (=> b!1076623 m!995723))

(assert (=> b!1076623 m!995823))

(declare-fun m!995829 () Bool)

(assert (=> b!1076623 m!995829))

(assert (=> b!1076623 m!995667))

(declare-fun m!995831 () Bool)

(assert (=> b!1076631 m!995831))

(assert (=> b!1076626 m!995723))

(assert (=> b!1076626 m!995723))

(assert (=> b!1076626 m!995731))

(declare-fun m!995833 () Bool)

(assert (=> b!1076635 m!995833))

(declare-fun m!995835 () Bool)

(assert (=> bm!45559 m!995835))

(assert (=> b!1076625 m!995723))

(assert (=> b!1076625 m!995723))

(assert (=> b!1076625 m!995731))

(assert (=> b!1076628 m!995723))

(declare-fun m!995837 () Bool)

(assert (=> b!1076628 m!995837))

(assert (=> b!1076628 m!995745))

(assert (=> b!1076628 m!995743))

(assert (=> b!1076628 m!995743))

(assert (=> b!1076628 m!995745))

(assert (=> b!1076628 m!995747))

(assert (=> b!1076628 m!995723))

(declare-fun m!995839 () Bool)

(assert (=> bm!45564 m!995839))

(assert (=> b!1076438 d!130049))

(declare-fun b!1076649 () Bool)

(declare-fun e!615400 () Bool)

(assert (=> b!1076649 (= e!615400 tp_is_empty!26011)))

(declare-fun mapIsEmpty!40756 () Bool)

(declare-fun mapRes!40756 () Bool)

(assert (=> mapIsEmpty!40756 mapRes!40756))

(declare-fun condMapEmpty!40756 () Bool)

(declare-fun mapDefault!40756 () ValueCell!12302)

(assert (=> mapNonEmpty!40747 (= condMapEmpty!40756 (= mapRest!40747 ((as const (Array (_ BitVec 32) ValueCell!12302)) mapDefault!40756)))))

(declare-fun e!615399 () Bool)

(assert (=> mapNonEmpty!40747 (= tp!78085 (and e!615399 mapRes!40756))))

(declare-fun b!1076650 () Bool)

(assert (=> b!1076650 (= e!615399 tp_is_empty!26011)))

(declare-fun mapNonEmpty!40756 () Bool)

(declare-fun tp!78101 () Bool)

(assert (=> mapNonEmpty!40756 (= mapRes!40756 (and tp!78101 e!615400))))

(declare-fun mapKey!40756 () (_ BitVec 32))

(declare-fun mapValue!40756 () ValueCell!12302)

(declare-fun mapRest!40756 () (Array (_ BitVec 32) ValueCell!12302))

(assert (=> mapNonEmpty!40756 (= mapRest!40747 (store mapRest!40756 mapKey!40756 mapValue!40756))))

(assert (= (and mapNonEmpty!40747 condMapEmpty!40756) mapIsEmpty!40756))

(assert (= (and mapNonEmpty!40747 (not condMapEmpty!40756)) mapNonEmpty!40756))

(assert (= (and mapNonEmpty!40756 ((_ is ValueCellFull!12302) mapValue!40756)) b!1076649))

(assert (= (and mapNonEmpty!40747 ((_ is ValueCellFull!12302) mapDefault!40756)) b!1076650))

(declare-fun m!995841 () Bool)

(assert (=> mapNonEmpty!40756 m!995841))

(declare-fun b_lambda!16877 () Bool)

(assert (= b_lambda!16869 (or (and start!95340 b_free!22201) b_lambda!16877)))

(declare-fun b_lambda!16879 () Bool)

(assert (= b_lambda!16875 (or (and start!95340 b_free!22201) b_lambda!16879)))

(declare-fun b_lambda!16881 () Bool)

(assert (= b_lambda!16873 (or (and start!95340 b_free!22201) b_lambda!16881)))

(declare-fun b_lambda!16883 () Bool)

(assert (= b_lambda!16871 (or (and start!95340 b_free!22201) b_lambda!16883)))

(declare-fun b_lambda!16885 () Bool)

(assert (= b_lambda!16867 (or (and start!95340 b_free!22201) b_lambda!16885)))

(check-sat (not b!1076561) (not mapNonEmpty!40756) (not b_lambda!16881) (not b!1076567) (not b!1076546) (not d!130049) (not b!1076552) (not b!1076638) (not b_lambda!16885) (not b!1076577) (not bm!45559) (not b!1076626) (not bm!45544) b_and!35145 (not b_lambda!16883) (not b!1076579) (not d!130047) (not bm!45543) (not b_next!22201) (not bm!45537) (not b!1076568) (not b!1076562) (not d!130043) (not b!1076559) (not bm!45565) (not b_lambda!16877) (not d!130045) (not b!1076545) (not b!1076628) (not b!1076519) (not b!1076563) (not b!1076549) (not b!1076624) (not b!1076517) (not b!1076547) (not b!1076623) tp_is_empty!26011 (not b!1076502) (not d!130041) (not b!1076566) (not b!1076548) (not b!1076553) (not b!1076503) (not bm!45564) (not b!1076554) (not b_lambda!16879) (not bm!45562) (not b!1076560) (not b!1076625) (not bm!45540) (not b!1076631) (not b!1076516) (not b!1076635))
(check-sat b_and!35145 (not b_next!22201))
