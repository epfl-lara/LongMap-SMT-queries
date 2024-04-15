; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94768 () Bool)

(assert start!94768)

(declare-fun b_free!22027 () Bool)

(declare-fun b_next!22027 () Bool)

(assert (=> start!94768 (= b_free!22027 (not b_next!22027))))

(declare-fun tp!77539 () Bool)

(declare-fun b_and!34831 () Bool)

(assert (=> start!94768 (= tp!77539 b_and!34831)))

(declare-fun res!714832 () Bool)

(declare-fun e!611888 () Bool)

(assert (=> start!94768 (=> (not res!714832) (not e!611888))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94768 (= res!714832 (validMask!0 mask!1515))))

(assert (=> start!94768 e!611888))

(assert (=> start!94768 true))

(declare-fun tp_is_empty!25837 () Bool)

(assert (=> start!94768 tp_is_empty!25837))

(declare-datatypes ((V!39585 0))(
  ( (V!39586 (val!12969 Int)) )
))
(declare-datatypes ((ValueCell!12215 0))(
  ( (ValueCellFull!12215 (v!15584 V!39585)) (EmptyCell!12215) )
))
(declare-datatypes ((array!68582 0))(
  ( (array!68583 (arr!32987 (Array (_ BitVec 32) ValueCell!12215)) (size!33525 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68582)

(declare-fun e!611885 () Bool)

(declare-fun array_inv!25520 (array!68582) Bool)

(assert (=> start!94768 (and (array_inv!25520 _values!955) e!611885)))

(assert (=> start!94768 tp!77539))

(declare-datatypes ((array!68584 0))(
  ( (array!68585 (arr!32988 (Array (_ BitVec 32) (_ BitVec 64))) (size!33526 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68584)

(declare-fun array_inv!25521 (array!68584) Bool)

(assert (=> start!94768 (array_inv!25521 _keys!1163)))

(declare-datatypes ((tuple2!16558 0))(
  ( (tuple2!16559 (_1!8290 (_ BitVec 64)) (_2!8290 V!39585)) )
))
(declare-datatypes ((List!23084 0))(
  ( (Nil!23081) (Cons!23080 (h!24289 tuple2!16558) (t!32408 List!23084)) )
))
(declare-datatypes ((ListLongMap!14527 0))(
  ( (ListLongMap!14528 (toList!7279 List!23084)) )
))
(declare-fun lt!474210 () ListLongMap!14527)

(declare-fun lt!474211 () ListLongMap!14527)

(declare-fun lt!474209 () tuple2!16558)

(declare-fun e!611883 () Bool)

(declare-fun b!1071518 () Bool)

(declare-fun +!3213 (ListLongMap!14527 tuple2!16558) ListLongMap!14527)

(assert (=> b!1071518 (= e!611883 (= lt!474210 (+!3213 lt!474211 lt!474209)))))

(declare-fun b!1071519 () Bool)

(declare-fun e!611886 () Bool)

(declare-fun e!611884 () Bool)

(assert (=> b!1071519 (= e!611886 e!611884)))

(declare-fun res!714828 () Bool)

(assert (=> b!1071519 (=> res!714828 e!611884)))

(declare-fun lt!474212 () ListLongMap!14527)

(declare-fun -!673 (ListLongMap!14527 (_ BitVec 64)) ListLongMap!14527)

(assert (=> b!1071519 (= res!714828 (not (= (-!673 lt!474212 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474210)))))

(declare-fun lt!474214 () ListLongMap!14527)

(declare-fun lt!474217 () ListLongMap!14527)

(assert (=> b!1071519 (= lt!474214 lt!474217)))

(declare-fun zeroValueBefore!47 () V!39585)

(declare-datatypes ((Unit!35137 0))(
  ( (Unit!35138) )
))
(declare-fun lt!474208 () Unit!35137)

(declare-fun minValue!907 () V!39585)

(declare-fun lt!474218 () ListLongMap!14527)

(declare-fun addCommutativeForDiffKeys!731 (ListLongMap!14527 (_ BitVec 64) V!39585 (_ BitVec 64) V!39585) Unit!35137)

(assert (=> b!1071519 (= lt!474208 (addCommutativeForDiffKeys!731 lt!474218 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474216 () ListLongMap!14527)

(assert (=> b!1071519 (= (-!673 lt!474217 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474216)))

(declare-fun lt!474213 () tuple2!16558)

(assert (=> b!1071519 (= lt!474217 (+!3213 lt!474216 lt!474213))))

(declare-fun lt!474219 () Unit!35137)

(declare-fun addThenRemoveForNewKeyIsSame!54 (ListLongMap!14527 (_ BitVec 64) V!39585) Unit!35137)

(assert (=> b!1071519 (= lt!474219 (addThenRemoveForNewKeyIsSame!54 lt!474216 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1071519 (= lt!474216 (+!3213 lt!474218 lt!474209))))

(assert (=> b!1071519 e!611883))

(declare-fun res!714827 () Bool)

(assert (=> b!1071519 (=> (not res!714827) (not e!611883))))

(assert (=> b!1071519 (= res!714827 (= lt!474212 lt!474214))))

(assert (=> b!1071519 (= lt!474214 (+!3213 (+!3213 lt!474218 lt!474213) lt!474209))))

(assert (=> b!1071519 (= lt!474209 (tuple2!16559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071519 (= lt!474213 (tuple2!16559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39585)

(declare-fun getCurrentListMap!4086 (array!68584 array!68582 (_ BitVec 32) (_ BitVec 32) V!39585 V!39585 (_ BitVec 32) Int) ListLongMap!14527)

(assert (=> b!1071519 (= lt!474210 (getCurrentListMap!4086 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071519 (= lt!474212 (getCurrentListMap!4086 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40462 () Bool)

(declare-fun mapRes!40462 () Bool)

(assert (=> mapIsEmpty!40462 mapRes!40462))

(declare-fun b!1071520 () Bool)

(declare-fun e!611882 () Bool)

(assert (=> b!1071520 (= e!611882 tp_is_empty!25837)))

(declare-fun b!1071521 () Bool)

(assert (=> b!1071521 (= e!611888 (not e!611886))))

(declare-fun res!714831 () Bool)

(assert (=> b!1071521 (=> res!714831 e!611886)))

(assert (=> b!1071521 (= res!714831 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1071521 (= lt!474218 lt!474211)))

(declare-fun lt!474215 () Unit!35137)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!857 (array!68584 array!68582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39585 V!39585 V!39585 V!39585 (_ BitVec 32) Int) Unit!35137)

(assert (=> b!1071521 (= lt!474215 (lemmaNoChangeToArrayThenSameMapNoExtras!857 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3863 (array!68584 array!68582 (_ BitVec 32) (_ BitVec 32) V!39585 V!39585 (_ BitVec 32) Int) ListLongMap!14527)

(assert (=> b!1071521 (= lt!474211 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071521 (= lt!474218 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071522 () Bool)

(assert (=> b!1071522 (= e!611884 (bvsle #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(declare-fun b!1071523 () Bool)

(declare-fun e!611881 () Bool)

(assert (=> b!1071523 (= e!611885 (and e!611881 mapRes!40462))))

(declare-fun condMapEmpty!40462 () Bool)

(declare-fun mapDefault!40462 () ValueCell!12215)

(assert (=> b!1071523 (= condMapEmpty!40462 (= (arr!32987 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12215)) mapDefault!40462)))))

(declare-fun b!1071524 () Bool)

(declare-fun res!714829 () Bool)

(assert (=> b!1071524 (=> (not res!714829) (not e!611888))))

(assert (=> b!1071524 (= res!714829 (and (= (size!33525 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33526 _keys!1163) (size!33525 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071525 () Bool)

(declare-fun res!714826 () Bool)

(assert (=> b!1071525 (=> (not res!714826) (not e!611888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68584 (_ BitVec 32)) Bool)

(assert (=> b!1071525 (= res!714826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40462 () Bool)

(declare-fun tp!77540 () Bool)

(assert (=> mapNonEmpty!40462 (= mapRes!40462 (and tp!77540 e!611882))))

(declare-fun mapRest!40462 () (Array (_ BitVec 32) ValueCell!12215))

(declare-fun mapKey!40462 () (_ BitVec 32))

(declare-fun mapValue!40462 () ValueCell!12215)

(assert (=> mapNonEmpty!40462 (= (arr!32987 _values!955) (store mapRest!40462 mapKey!40462 mapValue!40462))))

(declare-fun b!1071526 () Bool)

(assert (=> b!1071526 (= e!611881 tp_is_empty!25837)))

(declare-fun b!1071527 () Bool)

(declare-fun res!714830 () Bool)

(assert (=> b!1071527 (=> (not res!714830) (not e!611888))))

(declare-datatypes ((List!23085 0))(
  ( (Nil!23082) (Cons!23081 (h!24290 (_ BitVec 64)) (t!32409 List!23085)) )
))
(declare-fun arrayNoDuplicates!0 (array!68584 (_ BitVec 32) List!23085) Bool)

(assert (=> b!1071527 (= res!714830 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23082))))

(assert (= (and start!94768 res!714832) b!1071524))

(assert (= (and b!1071524 res!714829) b!1071525))

(assert (= (and b!1071525 res!714826) b!1071527))

(assert (= (and b!1071527 res!714830) b!1071521))

(assert (= (and b!1071521 (not res!714831)) b!1071519))

(assert (= (and b!1071519 res!714827) b!1071518))

(assert (= (and b!1071519 (not res!714828)) b!1071522))

(assert (= (and b!1071523 condMapEmpty!40462) mapIsEmpty!40462))

(assert (= (and b!1071523 (not condMapEmpty!40462)) mapNonEmpty!40462))

(get-info :version)

(assert (= (and mapNonEmpty!40462 ((_ is ValueCellFull!12215) mapValue!40462)) b!1071520))

(assert (= (and b!1071523 ((_ is ValueCellFull!12215) mapDefault!40462)) b!1071526))

(assert (= start!94768 b!1071523))

(declare-fun m!989663 () Bool)

(assert (=> b!1071519 m!989663))

(declare-fun m!989665 () Bool)

(assert (=> b!1071519 m!989665))

(declare-fun m!989667 () Bool)

(assert (=> b!1071519 m!989667))

(declare-fun m!989669 () Bool)

(assert (=> b!1071519 m!989669))

(declare-fun m!989671 () Bool)

(assert (=> b!1071519 m!989671))

(declare-fun m!989673 () Bool)

(assert (=> b!1071519 m!989673))

(declare-fun m!989675 () Bool)

(assert (=> b!1071519 m!989675))

(declare-fun m!989677 () Bool)

(assert (=> b!1071519 m!989677))

(assert (=> b!1071519 m!989663))

(declare-fun m!989679 () Bool)

(assert (=> b!1071519 m!989679))

(declare-fun m!989681 () Bool)

(assert (=> b!1071519 m!989681))

(declare-fun m!989683 () Bool)

(assert (=> b!1071521 m!989683))

(declare-fun m!989685 () Bool)

(assert (=> b!1071521 m!989685))

(declare-fun m!989687 () Bool)

(assert (=> b!1071521 m!989687))

(declare-fun m!989689 () Bool)

(assert (=> start!94768 m!989689))

(declare-fun m!989691 () Bool)

(assert (=> start!94768 m!989691))

(declare-fun m!989693 () Bool)

(assert (=> start!94768 m!989693))

(declare-fun m!989695 () Bool)

(assert (=> b!1071527 m!989695))

(declare-fun m!989697 () Bool)

(assert (=> mapNonEmpty!40462 m!989697))

(declare-fun m!989699 () Bool)

(assert (=> b!1071518 m!989699))

(declare-fun m!989701 () Bool)

(assert (=> b!1071525 m!989701))

(check-sat (not start!94768) (not b!1071518) (not b!1071525) (not mapNonEmpty!40462) tp_is_empty!25837 (not b!1071527) (not b!1071521) b_and!34831 (not b_next!22027) (not b!1071519))
(check-sat b_and!34831 (not b_next!22027))
(get-model)

(declare-fun bm!45178 () Bool)

(declare-fun call!45181 () Bool)

(declare-fun c!107613 () Bool)

(assert (=> bm!45178 (= call!45181 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107613 (Cons!23081 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000) Nil!23082) Nil!23082)))))

(declare-fun b!1071598 () Bool)

(declare-fun e!611945 () Bool)

(declare-fun e!611946 () Bool)

(assert (=> b!1071598 (= e!611945 e!611946)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1071598 (= c!107613 (validKeyInArray!0 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071599 () Bool)

(assert (=> b!1071599 (= e!611946 call!45181)))

(declare-fun b!1071600 () Bool)

(declare-fun e!611948 () Bool)

(assert (=> b!1071600 (= e!611948 e!611945)))

(declare-fun res!714883 () Bool)

(assert (=> b!1071600 (=> (not res!714883) (not e!611945))))

(declare-fun e!611947 () Bool)

(assert (=> b!1071600 (= res!714883 (not e!611947))))

(declare-fun res!714881 () Bool)

(assert (=> b!1071600 (=> (not res!714881) (not e!611947))))

(assert (=> b!1071600 (= res!714881 (validKeyInArray!0 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071601 () Bool)

(declare-fun contains!6290 (List!23085 (_ BitVec 64)) Bool)

(assert (=> b!1071601 (= e!611947 (contains!6290 Nil!23082 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071602 () Bool)

(assert (=> b!1071602 (= e!611946 call!45181)))

(declare-fun d!129149 () Bool)

(declare-fun res!714882 () Bool)

(assert (=> d!129149 (=> res!714882 e!611948)))

(assert (=> d!129149 (= res!714882 (bvsge #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(assert (=> d!129149 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23082) e!611948)))

(assert (= (and d!129149 (not res!714882)) b!1071600))

(assert (= (and b!1071600 res!714881) b!1071601))

(assert (= (and b!1071600 res!714883) b!1071598))

(assert (= (and b!1071598 c!107613) b!1071599))

(assert (= (and b!1071598 (not c!107613)) b!1071602))

(assert (= (or b!1071599 b!1071602) bm!45178))

(declare-fun m!989783 () Bool)

(assert (=> bm!45178 m!989783))

(declare-fun m!989785 () Bool)

(assert (=> bm!45178 m!989785))

(assert (=> b!1071598 m!989783))

(assert (=> b!1071598 m!989783))

(declare-fun m!989787 () Bool)

(assert (=> b!1071598 m!989787))

(assert (=> b!1071600 m!989783))

(assert (=> b!1071600 m!989783))

(assert (=> b!1071600 m!989787))

(assert (=> b!1071601 m!989783))

(assert (=> b!1071601 m!989783))

(declare-fun m!989789 () Bool)

(assert (=> b!1071601 m!989789))

(assert (=> b!1071527 d!129149))

(declare-fun d!129151 () Bool)

(declare-fun e!611951 () Bool)

(assert (=> d!129151 e!611951))

(declare-fun res!714889 () Bool)

(assert (=> d!129151 (=> (not res!714889) (not e!611951))))

(declare-fun lt!474300 () ListLongMap!14527)

(declare-fun contains!6291 (ListLongMap!14527 (_ BitVec 64)) Bool)

(assert (=> d!129151 (= res!714889 (contains!6291 lt!474300 (_1!8290 lt!474209)))))

(declare-fun lt!474301 () List!23084)

(assert (=> d!129151 (= lt!474300 (ListLongMap!14528 lt!474301))))

(declare-fun lt!474303 () Unit!35137)

(declare-fun lt!474302 () Unit!35137)

(assert (=> d!129151 (= lt!474303 lt!474302)))

(declare-datatypes ((Option!656 0))(
  ( (Some!655 (v!15587 V!39585)) (None!654) )
))
(declare-fun getValueByKey!605 (List!23084 (_ BitVec 64)) Option!656)

(assert (=> d!129151 (= (getValueByKey!605 lt!474301 (_1!8290 lt!474209)) (Some!655 (_2!8290 lt!474209)))))

(declare-fun lemmaContainsTupThenGetReturnValue!285 (List!23084 (_ BitVec 64) V!39585) Unit!35137)

(assert (=> d!129151 (= lt!474302 (lemmaContainsTupThenGetReturnValue!285 lt!474301 (_1!8290 lt!474209) (_2!8290 lt!474209)))))

(declare-fun insertStrictlySorted!378 (List!23084 (_ BitVec 64) V!39585) List!23084)

(assert (=> d!129151 (= lt!474301 (insertStrictlySorted!378 (toList!7279 lt!474211) (_1!8290 lt!474209) (_2!8290 lt!474209)))))

(assert (=> d!129151 (= (+!3213 lt!474211 lt!474209) lt!474300)))

(declare-fun b!1071607 () Bool)

(declare-fun res!714888 () Bool)

(assert (=> b!1071607 (=> (not res!714888) (not e!611951))))

(assert (=> b!1071607 (= res!714888 (= (getValueByKey!605 (toList!7279 lt!474300) (_1!8290 lt!474209)) (Some!655 (_2!8290 lt!474209))))))

(declare-fun b!1071608 () Bool)

(declare-fun contains!6292 (List!23084 tuple2!16558) Bool)

(assert (=> b!1071608 (= e!611951 (contains!6292 (toList!7279 lt!474300) lt!474209))))

(assert (= (and d!129151 res!714889) b!1071607))

(assert (= (and b!1071607 res!714888) b!1071608))

(declare-fun m!989791 () Bool)

(assert (=> d!129151 m!989791))

(declare-fun m!989793 () Bool)

(assert (=> d!129151 m!989793))

(declare-fun m!989795 () Bool)

(assert (=> d!129151 m!989795))

(declare-fun m!989797 () Bool)

(assert (=> d!129151 m!989797))

(declare-fun m!989799 () Bool)

(assert (=> b!1071607 m!989799))

(declare-fun m!989801 () Bool)

(assert (=> b!1071608 m!989801))

(assert (=> b!1071518 d!129151))

(declare-fun d!129153 () Bool)

(declare-fun e!611952 () Bool)

(assert (=> d!129153 e!611952))

(declare-fun res!714891 () Bool)

(assert (=> d!129153 (=> (not res!714891) (not e!611952))))

(declare-fun lt!474304 () ListLongMap!14527)

(assert (=> d!129153 (= res!714891 (contains!6291 lt!474304 (_1!8290 lt!474213)))))

(declare-fun lt!474305 () List!23084)

(assert (=> d!129153 (= lt!474304 (ListLongMap!14528 lt!474305))))

(declare-fun lt!474307 () Unit!35137)

(declare-fun lt!474306 () Unit!35137)

(assert (=> d!129153 (= lt!474307 lt!474306)))

(assert (=> d!129153 (= (getValueByKey!605 lt!474305 (_1!8290 lt!474213)) (Some!655 (_2!8290 lt!474213)))))

(assert (=> d!129153 (= lt!474306 (lemmaContainsTupThenGetReturnValue!285 lt!474305 (_1!8290 lt!474213) (_2!8290 lt!474213)))))

(assert (=> d!129153 (= lt!474305 (insertStrictlySorted!378 (toList!7279 lt!474218) (_1!8290 lt!474213) (_2!8290 lt!474213)))))

(assert (=> d!129153 (= (+!3213 lt!474218 lt!474213) lt!474304)))

(declare-fun b!1071609 () Bool)

(declare-fun res!714890 () Bool)

(assert (=> b!1071609 (=> (not res!714890) (not e!611952))))

(assert (=> b!1071609 (= res!714890 (= (getValueByKey!605 (toList!7279 lt!474304) (_1!8290 lt!474213)) (Some!655 (_2!8290 lt!474213))))))

(declare-fun b!1071610 () Bool)

(assert (=> b!1071610 (= e!611952 (contains!6292 (toList!7279 lt!474304) lt!474213))))

(assert (= (and d!129153 res!714891) b!1071609))

(assert (= (and b!1071609 res!714890) b!1071610))

(declare-fun m!989803 () Bool)

(assert (=> d!129153 m!989803))

(declare-fun m!989805 () Bool)

(assert (=> d!129153 m!989805))

(declare-fun m!989807 () Bool)

(assert (=> d!129153 m!989807))

(declare-fun m!989809 () Bool)

(assert (=> d!129153 m!989809))

(declare-fun m!989811 () Bool)

(assert (=> b!1071609 m!989811))

(declare-fun m!989813 () Bool)

(assert (=> b!1071610 m!989813))

(assert (=> b!1071519 d!129153))

(declare-fun b!1071653 () Bool)

(declare-fun e!611990 () Bool)

(declare-fun call!45200 () Bool)

(assert (=> b!1071653 (= e!611990 (not call!45200))))

(declare-fun b!1071654 () Bool)

(declare-fun res!714917 () Bool)

(declare-fun e!611988 () Bool)

(assert (=> b!1071654 (=> (not res!714917) (not e!611988))))

(declare-fun e!611980 () Bool)

(assert (=> b!1071654 (= res!714917 e!611980)))

(declare-fun res!714910 () Bool)

(assert (=> b!1071654 (=> res!714910 e!611980)))

(declare-fun e!611981 () Bool)

(assert (=> b!1071654 (= res!714910 (not e!611981))))

(declare-fun res!714915 () Bool)

(assert (=> b!1071654 (=> (not res!714915) (not e!611981))))

(assert (=> b!1071654 (= res!714915 (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(declare-fun b!1071655 () Bool)

(declare-fun e!611991 () Bool)

(declare-fun call!45201 () Bool)

(assert (=> b!1071655 (= e!611991 (not call!45201))))

(declare-fun b!1071656 () Bool)

(declare-fun e!611987 () ListLongMap!14527)

(declare-fun e!611984 () ListLongMap!14527)

(assert (=> b!1071656 (= e!611987 e!611984)))

(declare-fun c!107631 () Bool)

(assert (=> b!1071656 (= c!107631 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!45196 () ListLongMap!14527)

(declare-fun bm!45193 () Bool)

(assert (=> bm!45193 (= call!45196 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071658 () Bool)

(declare-fun e!611985 () Bool)

(assert (=> b!1071658 (= e!611985 (validKeyInArray!0 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071659 () Bool)

(declare-fun e!611986 () Unit!35137)

(declare-fun lt!474367 () Unit!35137)

(assert (=> b!1071659 (= e!611986 lt!474367)))

(declare-fun lt!474355 () ListLongMap!14527)

(assert (=> b!1071659 (= lt!474355 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474365 () (_ BitVec 64))

(assert (=> b!1071659 (= lt!474365 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474361 () (_ BitVec 64))

(assert (=> b!1071659 (= lt!474361 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!474370 () Unit!35137)

(declare-fun addStillContains!637 (ListLongMap!14527 (_ BitVec 64) V!39585 (_ BitVec 64)) Unit!35137)

(assert (=> b!1071659 (= lt!474370 (addStillContains!637 lt!474355 lt!474365 zeroValueBefore!47 lt!474361))))

(assert (=> b!1071659 (contains!6291 (+!3213 lt!474355 (tuple2!16559 lt!474365 zeroValueBefore!47)) lt!474361)))

(declare-fun lt!474373 () Unit!35137)

(assert (=> b!1071659 (= lt!474373 lt!474370)))

(declare-fun lt!474371 () ListLongMap!14527)

(assert (=> b!1071659 (= lt!474371 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474359 () (_ BitVec 64))

(assert (=> b!1071659 (= lt!474359 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474369 () (_ BitVec 64))

(assert (=> b!1071659 (= lt!474369 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!474354 () Unit!35137)

(declare-fun addApplyDifferent!493 (ListLongMap!14527 (_ BitVec 64) V!39585 (_ BitVec 64)) Unit!35137)

(assert (=> b!1071659 (= lt!474354 (addApplyDifferent!493 lt!474371 lt!474359 minValue!907 lt!474369))))

(declare-fun apply!923 (ListLongMap!14527 (_ BitVec 64)) V!39585)

(assert (=> b!1071659 (= (apply!923 (+!3213 lt!474371 (tuple2!16559 lt!474359 minValue!907)) lt!474369) (apply!923 lt!474371 lt!474369))))

(declare-fun lt!474366 () Unit!35137)

(assert (=> b!1071659 (= lt!474366 lt!474354)))

(declare-fun lt!474352 () ListLongMap!14527)

(assert (=> b!1071659 (= lt!474352 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474372 () (_ BitVec 64))

(assert (=> b!1071659 (= lt!474372 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474358 () (_ BitVec 64))

(assert (=> b!1071659 (= lt!474358 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!474368 () Unit!35137)

(assert (=> b!1071659 (= lt!474368 (addApplyDifferent!493 lt!474352 lt!474372 zeroValueBefore!47 lt!474358))))

(assert (=> b!1071659 (= (apply!923 (+!3213 lt!474352 (tuple2!16559 lt!474372 zeroValueBefore!47)) lt!474358) (apply!923 lt!474352 lt!474358))))

(declare-fun lt!474364 () Unit!35137)

(assert (=> b!1071659 (= lt!474364 lt!474368)))

(declare-fun lt!474360 () ListLongMap!14527)

(assert (=> b!1071659 (= lt!474360 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474362 () (_ BitVec 64))

(assert (=> b!1071659 (= lt!474362 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474363 () (_ BitVec 64))

(assert (=> b!1071659 (= lt!474363 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1071659 (= lt!474367 (addApplyDifferent!493 lt!474360 lt!474362 minValue!907 lt!474363))))

(assert (=> b!1071659 (= (apply!923 (+!3213 lt!474360 (tuple2!16559 lt!474362 minValue!907)) lt!474363) (apply!923 lt!474360 lt!474363))))

(declare-fun bm!45194 () Bool)

(declare-fun call!45199 () ListLongMap!14527)

(declare-fun call!45197 () ListLongMap!14527)

(assert (=> bm!45194 (= call!45199 call!45197)))

(declare-fun b!1071660 () Bool)

(declare-fun e!611979 () Bool)

(declare-fun lt!474356 () ListLongMap!14527)

(assert (=> b!1071660 (= e!611979 (= (apply!923 lt!474356 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1071661 () Bool)

(assert (=> b!1071661 (= e!611987 (+!3213 call!45197 (tuple2!16559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1071662 () Bool)

(declare-fun e!611983 () Bool)

(assert (=> b!1071662 (= e!611980 e!611983)))

(declare-fun res!714911 () Bool)

(assert (=> b!1071662 (=> (not res!714911) (not e!611983))))

(assert (=> b!1071662 (= res!714911 (contains!6291 lt!474356 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071662 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(declare-fun b!1071663 () Bool)

(declare-fun e!611989 () Bool)

(assert (=> b!1071663 (= e!611990 e!611989)))

(declare-fun res!714914 () Bool)

(assert (=> b!1071663 (= res!714914 call!45200)))

(assert (=> b!1071663 (=> (not res!714914) (not e!611989))))

(declare-fun b!1071657 () Bool)

(declare-fun Unit!35143 () Unit!35137)

(assert (=> b!1071657 (= e!611986 Unit!35143)))

(declare-fun d!129155 () Bool)

(assert (=> d!129155 e!611988))

(declare-fun res!714912 () Bool)

(assert (=> d!129155 (=> (not res!714912) (not e!611988))))

(assert (=> d!129155 (= res!714912 (or (bvsge #b00000000000000000000000000000000 (size!33526 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))))

(declare-fun lt!474353 () ListLongMap!14527)

(assert (=> d!129155 (= lt!474356 lt!474353)))

(declare-fun lt!474357 () Unit!35137)

(assert (=> d!129155 (= lt!474357 e!611986)))

(declare-fun c!107628 () Bool)

(assert (=> d!129155 (= c!107628 e!611985)))

(declare-fun res!714913 () Bool)

(assert (=> d!129155 (=> (not res!714913) (not e!611985))))

(assert (=> d!129155 (= res!714913 (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(assert (=> d!129155 (= lt!474353 e!611987)))

(declare-fun c!107626 () Bool)

(assert (=> d!129155 (= c!107626 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129155 (validMask!0 mask!1515)))

(assert (=> d!129155 (= (getCurrentListMap!4086 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!474356)))

(declare-fun bm!45195 () Bool)

(assert (=> bm!45195 (= call!45201 (contains!6291 lt!474356 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1071664 () Bool)

(declare-fun e!611982 () ListLongMap!14527)

(declare-fun call!45202 () ListLongMap!14527)

(assert (=> b!1071664 (= e!611982 call!45202)))

(declare-fun bm!45196 () Bool)

(declare-fun call!45198 () ListLongMap!14527)

(assert (=> bm!45196 (= call!45198 call!45196)))

(declare-fun b!1071665 () Bool)

(assert (=> b!1071665 (= e!611988 e!611991)))

(declare-fun c!107627 () Bool)

(assert (=> b!1071665 (= c!107627 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1071666 () Bool)

(assert (=> b!1071666 (= e!611984 call!45199)))

(declare-fun b!1071667 () Bool)

(assert (=> b!1071667 (= e!611991 e!611979)))

(declare-fun res!714916 () Bool)

(assert (=> b!1071667 (= res!714916 call!45201)))

(assert (=> b!1071667 (=> (not res!714916) (not e!611979))))

(declare-fun b!1071668 () Bool)

(assert (=> b!1071668 (= e!611981 (validKeyInArray!0 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45197 () Bool)

(assert (=> bm!45197 (= call!45200 (contains!6291 lt!474356 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1071669 () Bool)

(assert (=> b!1071669 (= e!611989 (= (apply!923 lt!474356 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1071670 () Bool)

(declare-fun res!714918 () Bool)

(assert (=> b!1071670 (=> (not res!714918) (not e!611988))))

(assert (=> b!1071670 (= res!714918 e!611990)))

(declare-fun c!107630 () Bool)

(assert (=> b!1071670 (= c!107630 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45198 () Bool)

(assert (=> bm!45198 (= call!45197 (+!3213 (ite c!107626 call!45196 (ite c!107631 call!45198 call!45202)) (ite (or c!107626 c!107631) (tuple2!16559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1071671 () Bool)

(assert (=> b!1071671 (= e!611982 call!45199)))

(declare-fun bm!45199 () Bool)

(assert (=> bm!45199 (= call!45202 call!45198)))

(declare-fun b!1071672 () Bool)

(declare-fun c!107629 () Bool)

(assert (=> b!1071672 (= c!107629 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1071672 (= e!611984 e!611982)))

(declare-fun b!1071673 () Bool)

(declare-fun get!17163 (ValueCell!12215 V!39585) V!39585)

(declare-fun dynLambda!2022 (Int (_ BitVec 64)) V!39585)

(assert (=> b!1071673 (= e!611983 (= (apply!923 lt!474356 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)) (get!17163 (select (arr!32987 _values!955) #b00000000000000000000000000000000) (dynLambda!2022 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1071673 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33525 _values!955)))))

(assert (=> b!1071673 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(assert (= (and d!129155 c!107626) b!1071661))

(assert (= (and d!129155 (not c!107626)) b!1071656))

(assert (= (and b!1071656 c!107631) b!1071666))

(assert (= (and b!1071656 (not c!107631)) b!1071672))

(assert (= (and b!1071672 c!107629) b!1071671))

(assert (= (and b!1071672 (not c!107629)) b!1071664))

(assert (= (or b!1071671 b!1071664) bm!45199))

(assert (= (or b!1071666 bm!45199) bm!45196))

(assert (= (or b!1071666 b!1071671) bm!45194))

(assert (= (or b!1071661 bm!45196) bm!45193))

(assert (= (or b!1071661 bm!45194) bm!45198))

(assert (= (and d!129155 res!714913) b!1071658))

(assert (= (and d!129155 c!107628) b!1071659))

(assert (= (and d!129155 (not c!107628)) b!1071657))

(assert (= (and d!129155 res!714912) b!1071654))

(assert (= (and b!1071654 res!714915) b!1071668))

(assert (= (and b!1071654 (not res!714910)) b!1071662))

(assert (= (and b!1071662 res!714911) b!1071673))

(assert (= (and b!1071654 res!714917) b!1071670))

(assert (= (and b!1071670 c!107630) b!1071663))

(assert (= (and b!1071670 (not c!107630)) b!1071653))

(assert (= (and b!1071663 res!714914) b!1071669))

(assert (= (or b!1071663 b!1071653) bm!45197))

(assert (= (and b!1071670 res!714918) b!1071665))

(assert (= (and b!1071665 c!107627) b!1071667))

(assert (= (and b!1071665 (not c!107627)) b!1071655))

(assert (= (and b!1071667 res!714916) b!1071660))

(assert (= (or b!1071667 b!1071655) bm!45195))

(declare-fun b_lambda!16655 () Bool)

(assert (=> (not b_lambda!16655) (not b!1071673)))

(declare-fun t!32415 () Bool)

(declare-fun tb!7147 () Bool)

(assert (=> (and start!94768 (= defaultEntry!963 defaultEntry!963) t!32415) tb!7147))

(declare-fun result!14765 () Bool)

(assert (=> tb!7147 (= result!14765 tp_is_empty!25837)))

(assert (=> b!1071673 t!32415))

(declare-fun b_and!34837 () Bool)

(assert (= b_and!34831 (and (=> t!32415 result!14765) b_and!34837)))

(assert (=> b!1071658 m!989783))

(assert (=> b!1071658 m!989783))

(assert (=> b!1071658 m!989787))

(declare-fun m!989815 () Bool)

(assert (=> b!1071673 m!989815))

(declare-fun m!989817 () Bool)

(assert (=> b!1071673 m!989817))

(assert (=> b!1071673 m!989783))

(declare-fun m!989819 () Bool)

(assert (=> b!1071673 m!989819))

(assert (=> b!1071673 m!989817))

(assert (=> b!1071673 m!989815))

(declare-fun m!989821 () Bool)

(assert (=> b!1071673 m!989821))

(assert (=> b!1071673 m!989783))

(assert (=> bm!45193 m!989687))

(declare-fun m!989823 () Bool)

(assert (=> b!1071661 m!989823))

(declare-fun m!989825 () Bool)

(assert (=> b!1071659 m!989825))

(declare-fun m!989827 () Bool)

(assert (=> b!1071659 m!989827))

(declare-fun m!989829 () Bool)

(assert (=> b!1071659 m!989829))

(declare-fun m!989831 () Bool)

(assert (=> b!1071659 m!989831))

(assert (=> b!1071659 m!989829))

(declare-fun m!989833 () Bool)

(assert (=> b!1071659 m!989833))

(declare-fun m!989835 () Bool)

(assert (=> b!1071659 m!989835))

(assert (=> b!1071659 m!989687))

(declare-fun m!989837 () Bool)

(assert (=> b!1071659 m!989837))

(declare-fun m!989839 () Bool)

(assert (=> b!1071659 m!989839))

(declare-fun m!989841 () Bool)

(assert (=> b!1071659 m!989841))

(assert (=> b!1071659 m!989827))

(declare-fun m!989843 () Bool)

(assert (=> b!1071659 m!989843))

(assert (=> b!1071659 m!989837))

(declare-fun m!989845 () Bool)

(assert (=> b!1071659 m!989845))

(assert (=> b!1071659 m!989783))

(assert (=> b!1071659 m!989831))

(declare-fun m!989847 () Bool)

(assert (=> b!1071659 m!989847))

(declare-fun m!989849 () Bool)

(assert (=> b!1071659 m!989849))

(declare-fun m!989851 () Bool)

(assert (=> b!1071659 m!989851))

(declare-fun m!989853 () Bool)

(assert (=> b!1071659 m!989853))

(declare-fun m!989855 () Bool)

(assert (=> bm!45195 m!989855))

(declare-fun m!989857 () Bool)

(assert (=> b!1071669 m!989857))

(assert (=> b!1071668 m!989783))

(assert (=> b!1071668 m!989783))

(assert (=> b!1071668 m!989787))

(assert (=> b!1071662 m!989783))

(assert (=> b!1071662 m!989783))

(declare-fun m!989859 () Bool)

(assert (=> b!1071662 m!989859))

(assert (=> d!129155 m!989689))

(declare-fun m!989861 () Bool)

(assert (=> b!1071660 m!989861))

(declare-fun m!989863 () Bool)

(assert (=> bm!45198 m!989863))

(declare-fun m!989865 () Bool)

(assert (=> bm!45197 m!989865))

(assert (=> b!1071519 d!129155))

(declare-fun d!129157 () Bool)

(assert (=> d!129157 (= (-!673 (+!3213 lt!474216 (tuple2!16559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!474216)))

(declare-fun lt!474376 () Unit!35137)

(declare-fun choose!1748 (ListLongMap!14527 (_ BitVec 64) V!39585) Unit!35137)

(assert (=> d!129157 (= lt!474376 (choose!1748 lt!474216 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> d!129157 (not (contains!6291 lt!474216 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129157 (= (addThenRemoveForNewKeyIsSame!54 lt!474216 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) lt!474376)))

(declare-fun bs!31546 () Bool)

(assert (= bs!31546 d!129157))

(declare-fun m!989867 () Bool)

(assert (=> bs!31546 m!989867))

(assert (=> bs!31546 m!989867))

(declare-fun m!989869 () Bool)

(assert (=> bs!31546 m!989869))

(declare-fun m!989871 () Bool)

(assert (=> bs!31546 m!989871))

(declare-fun m!989873 () Bool)

(assert (=> bs!31546 m!989873))

(assert (=> b!1071519 d!129157))

(declare-fun d!129159 () Bool)

(assert (=> d!129159 (= (+!3213 (+!3213 lt!474218 (tuple2!16559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (+!3213 (+!3213 lt!474218 (tuple2!16559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (tuple2!16559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun lt!474379 () Unit!35137)

(declare-fun choose!1749 (ListLongMap!14527 (_ BitVec 64) V!39585 (_ BitVec 64) V!39585) Unit!35137)

(assert (=> d!129159 (= lt!474379 (choose!1749 lt!474218 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> d!129159 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129159 (= (addCommutativeForDiffKeys!731 lt!474218 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907) lt!474379)))

(declare-fun bs!31547 () Bool)

(assert (= bs!31547 d!129159))

(declare-fun m!989875 () Bool)

(assert (=> bs!31547 m!989875))

(declare-fun m!989877 () Bool)

(assert (=> bs!31547 m!989877))

(declare-fun m!989879 () Bool)

(assert (=> bs!31547 m!989879))

(declare-fun m!989881 () Bool)

(assert (=> bs!31547 m!989881))

(assert (=> bs!31547 m!989881))

(declare-fun m!989883 () Bool)

(assert (=> bs!31547 m!989883))

(assert (=> bs!31547 m!989875))

(assert (=> b!1071519 d!129159))

(declare-fun d!129161 () Bool)

(declare-fun e!611992 () Bool)

(assert (=> d!129161 e!611992))

(declare-fun res!714920 () Bool)

(assert (=> d!129161 (=> (not res!714920) (not e!611992))))

(declare-fun lt!474380 () ListLongMap!14527)

(assert (=> d!129161 (= res!714920 (contains!6291 lt!474380 (_1!8290 lt!474209)))))

(declare-fun lt!474381 () List!23084)

(assert (=> d!129161 (= lt!474380 (ListLongMap!14528 lt!474381))))

(declare-fun lt!474383 () Unit!35137)

(declare-fun lt!474382 () Unit!35137)

(assert (=> d!129161 (= lt!474383 lt!474382)))

(assert (=> d!129161 (= (getValueByKey!605 lt!474381 (_1!8290 lt!474209)) (Some!655 (_2!8290 lt!474209)))))

(assert (=> d!129161 (= lt!474382 (lemmaContainsTupThenGetReturnValue!285 lt!474381 (_1!8290 lt!474209) (_2!8290 lt!474209)))))

(assert (=> d!129161 (= lt!474381 (insertStrictlySorted!378 (toList!7279 (+!3213 lt!474218 lt!474213)) (_1!8290 lt!474209) (_2!8290 lt!474209)))))

(assert (=> d!129161 (= (+!3213 (+!3213 lt!474218 lt!474213) lt!474209) lt!474380)))

(declare-fun b!1071676 () Bool)

(declare-fun res!714919 () Bool)

(assert (=> b!1071676 (=> (not res!714919) (not e!611992))))

(assert (=> b!1071676 (= res!714919 (= (getValueByKey!605 (toList!7279 lt!474380) (_1!8290 lt!474209)) (Some!655 (_2!8290 lt!474209))))))

(declare-fun b!1071677 () Bool)

(assert (=> b!1071677 (= e!611992 (contains!6292 (toList!7279 lt!474380) lt!474209))))

(assert (= (and d!129161 res!714920) b!1071676))

(assert (= (and b!1071676 res!714919) b!1071677))

(declare-fun m!989885 () Bool)

(assert (=> d!129161 m!989885))

(declare-fun m!989887 () Bool)

(assert (=> d!129161 m!989887))

(declare-fun m!989889 () Bool)

(assert (=> d!129161 m!989889))

(declare-fun m!989891 () Bool)

(assert (=> d!129161 m!989891))

(declare-fun m!989893 () Bool)

(assert (=> b!1071676 m!989893))

(declare-fun m!989895 () Bool)

(assert (=> b!1071677 m!989895))

(assert (=> b!1071519 d!129161))

(declare-fun d!129163 () Bool)

(declare-fun e!611993 () Bool)

(assert (=> d!129163 e!611993))

(declare-fun res!714922 () Bool)

(assert (=> d!129163 (=> (not res!714922) (not e!611993))))

(declare-fun lt!474384 () ListLongMap!14527)

(assert (=> d!129163 (= res!714922 (contains!6291 lt!474384 (_1!8290 lt!474213)))))

(declare-fun lt!474385 () List!23084)

(assert (=> d!129163 (= lt!474384 (ListLongMap!14528 lt!474385))))

(declare-fun lt!474387 () Unit!35137)

(declare-fun lt!474386 () Unit!35137)

(assert (=> d!129163 (= lt!474387 lt!474386)))

(assert (=> d!129163 (= (getValueByKey!605 lt!474385 (_1!8290 lt!474213)) (Some!655 (_2!8290 lt!474213)))))

(assert (=> d!129163 (= lt!474386 (lemmaContainsTupThenGetReturnValue!285 lt!474385 (_1!8290 lt!474213) (_2!8290 lt!474213)))))

(assert (=> d!129163 (= lt!474385 (insertStrictlySorted!378 (toList!7279 lt!474216) (_1!8290 lt!474213) (_2!8290 lt!474213)))))

(assert (=> d!129163 (= (+!3213 lt!474216 lt!474213) lt!474384)))

(declare-fun b!1071678 () Bool)

(declare-fun res!714921 () Bool)

(assert (=> b!1071678 (=> (not res!714921) (not e!611993))))

(assert (=> b!1071678 (= res!714921 (= (getValueByKey!605 (toList!7279 lt!474384) (_1!8290 lt!474213)) (Some!655 (_2!8290 lt!474213))))))

(declare-fun b!1071679 () Bool)

(assert (=> b!1071679 (= e!611993 (contains!6292 (toList!7279 lt!474384) lt!474213))))

(assert (= (and d!129163 res!714922) b!1071678))

(assert (= (and b!1071678 res!714921) b!1071679))

(declare-fun m!989897 () Bool)

(assert (=> d!129163 m!989897))

(declare-fun m!989899 () Bool)

(assert (=> d!129163 m!989899))

(declare-fun m!989901 () Bool)

(assert (=> d!129163 m!989901))

(declare-fun m!989903 () Bool)

(assert (=> d!129163 m!989903))

(declare-fun m!989905 () Bool)

(assert (=> b!1071678 m!989905))

(declare-fun m!989907 () Bool)

(assert (=> b!1071679 m!989907))

(assert (=> b!1071519 d!129163))

(declare-fun b!1071680 () Bool)

(declare-fun e!612005 () Bool)

(declare-fun call!45207 () Bool)

(assert (=> b!1071680 (= e!612005 (not call!45207))))

(declare-fun b!1071681 () Bool)

(declare-fun res!714930 () Bool)

(declare-fun e!612003 () Bool)

(assert (=> b!1071681 (=> (not res!714930) (not e!612003))))

(declare-fun e!611995 () Bool)

(assert (=> b!1071681 (= res!714930 e!611995)))

(declare-fun res!714923 () Bool)

(assert (=> b!1071681 (=> res!714923 e!611995)))

(declare-fun e!611996 () Bool)

(assert (=> b!1071681 (= res!714923 (not e!611996))))

(declare-fun res!714928 () Bool)

(assert (=> b!1071681 (=> (not res!714928) (not e!611996))))

(assert (=> b!1071681 (= res!714928 (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(declare-fun b!1071682 () Bool)

(declare-fun e!612006 () Bool)

(declare-fun call!45208 () Bool)

(assert (=> b!1071682 (= e!612006 (not call!45208))))

(declare-fun b!1071683 () Bool)

(declare-fun e!612002 () ListLongMap!14527)

(declare-fun e!611999 () ListLongMap!14527)

(assert (=> b!1071683 (= e!612002 e!611999)))

(declare-fun c!107637 () Bool)

(assert (=> b!1071683 (= c!107637 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45200 () Bool)

(declare-fun call!45203 () ListLongMap!14527)

(assert (=> bm!45200 (= call!45203 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071685 () Bool)

(declare-fun e!612000 () Bool)

(assert (=> b!1071685 (= e!612000 (validKeyInArray!0 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071686 () Bool)

(declare-fun e!612001 () Unit!35137)

(declare-fun lt!474403 () Unit!35137)

(assert (=> b!1071686 (= e!612001 lt!474403)))

(declare-fun lt!474391 () ListLongMap!14527)

(assert (=> b!1071686 (= lt!474391 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474401 () (_ BitVec 64))

(assert (=> b!1071686 (= lt!474401 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474397 () (_ BitVec 64))

(assert (=> b!1071686 (= lt!474397 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!474406 () Unit!35137)

(assert (=> b!1071686 (= lt!474406 (addStillContains!637 lt!474391 lt!474401 zeroValueAfter!47 lt!474397))))

(assert (=> b!1071686 (contains!6291 (+!3213 lt!474391 (tuple2!16559 lt!474401 zeroValueAfter!47)) lt!474397)))

(declare-fun lt!474409 () Unit!35137)

(assert (=> b!1071686 (= lt!474409 lt!474406)))

(declare-fun lt!474407 () ListLongMap!14527)

(assert (=> b!1071686 (= lt!474407 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474395 () (_ BitVec 64))

(assert (=> b!1071686 (= lt!474395 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474405 () (_ BitVec 64))

(assert (=> b!1071686 (= lt!474405 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!474390 () Unit!35137)

(assert (=> b!1071686 (= lt!474390 (addApplyDifferent!493 lt!474407 lt!474395 minValue!907 lt!474405))))

(assert (=> b!1071686 (= (apply!923 (+!3213 lt!474407 (tuple2!16559 lt!474395 minValue!907)) lt!474405) (apply!923 lt!474407 lt!474405))))

(declare-fun lt!474402 () Unit!35137)

(assert (=> b!1071686 (= lt!474402 lt!474390)))

(declare-fun lt!474388 () ListLongMap!14527)

(assert (=> b!1071686 (= lt!474388 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474408 () (_ BitVec 64))

(assert (=> b!1071686 (= lt!474408 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474394 () (_ BitVec 64))

(assert (=> b!1071686 (= lt!474394 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!474404 () Unit!35137)

(assert (=> b!1071686 (= lt!474404 (addApplyDifferent!493 lt!474388 lt!474408 zeroValueAfter!47 lt!474394))))

(assert (=> b!1071686 (= (apply!923 (+!3213 lt!474388 (tuple2!16559 lt!474408 zeroValueAfter!47)) lt!474394) (apply!923 lt!474388 lt!474394))))

(declare-fun lt!474400 () Unit!35137)

(assert (=> b!1071686 (= lt!474400 lt!474404)))

(declare-fun lt!474396 () ListLongMap!14527)

(assert (=> b!1071686 (= lt!474396 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474398 () (_ BitVec 64))

(assert (=> b!1071686 (= lt!474398 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474399 () (_ BitVec 64))

(assert (=> b!1071686 (= lt!474399 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1071686 (= lt!474403 (addApplyDifferent!493 lt!474396 lt!474398 minValue!907 lt!474399))))

(assert (=> b!1071686 (= (apply!923 (+!3213 lt!474396 (tuple2!16559 lt!474398 minValue!907)) lt!474399) (apply!923 lt!474396 lt!474399))))

(declare-fun bm!45201 () Bool)

(declare-fun call!45206 () ListLongMap!14527)

(declare-fun call!45204 () ListLongMap!14527)

(assert (=> bm!45201 (= call!45206 call!45204)))

(declare-fun b!1071687 () Bool)

(declare-fun e!611994 () Bool)

(declare-fun lt!474392 () ListLongMap!14527)

(assert (=> b!1071687 (= e!611994 (= (apply!923 lt!474392 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1071688 () Bool)

(assert (=> b!1071688 (= e!612002 (+!3213 call!45204 (tuple2!16559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1071689 () Bool)

(declare-fun e!611998 () Bool)

(assert (=> b!1071689 (= e!611995 e!611998)))

(declare-fun res!714924 () Bool)

(assert (=> b!1071689 (=> (not res!714924) (not e!611998))))

(assert (=> b!1071689 (= res!714924 (contains!6291 lt!474392 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071689 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(declare-fun b!1071690 () Bool)

(declare-fun e!612004 () Bool)

(assert (=> b!1071690 (= e!612005 e!612004)))

(declare-fun res!714927 () Bool)

(assert (=> b!1071690 (= res!714927 call!45207)))

(assert (=> b!1071690 (=> (not res!714927) (not e!612004))))

(declare-fun b!1071684 () Bool)

(declare-fun Unit!35144 () Unit!35137)

(assert (=> b!1071684 (= e!612001 Unit!35144)))

(declare-fun d!129165 () Bool)

(assert (=> d!129165 e!612003))

(declare-fun res!714925 () Bool)

(assert (=> d!129165 (=> (not res!714925) (not e!612003))))

(assert (=> d!129165 (= res!714925 (or (bvsge #b00000000000000000000000000000000 (size!33526 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))))

(declare-fun lt!474389 () ListLongMap!14527)

(assert (=> d!129165 (= lt!474392 lt!474389)))

(declare-fun lt!474393 () Unit!35137)

(assert (=> d!129165 (= lt!474393 e!612001)))

(declare-fun c!107634 () Bool)

(assert (=> d!129165 (= c!107634 e!612000)))

(declare-fun res!714926 () Bool)

(assert (=> d!129165 (=> (not res!714926) (not e!612000))))

(assert (=> d!129165 (= res!714926 (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(assert (=> d!129165 (= lt!474389 e!612002)))

(declare-fun c!107632 () Bool)

(assert (=> d!129165 (= c!107632 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129165 (validMask!0 mask!1515)))

(assert (=> d!129165 (= (getCurrentListMap!4086 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!474392)))

(declare-fun bm!45202 () Bool)

(assert (=> bm!45202 (= call!45208 (contains!6291 lt!474392 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1071691 () Bool)

(declare-fun e!611997 () ListLongMap!14527)

(declare-fun call!45209 () ListLongMap!14527)

(assert (=> b!1071691 (= e!611997 call!45209)))

(declare-fun bm!45203 () Bool)

(declare-fun call!45205 () ListLongMap!14527)

(assert (=> bm!45203 (= call!45205 call!45203)))

(declare-fun b!1071692 () Bool)

(assert (=> b!1071692 (= e!612003 e!612006)))

(declare-fun c!107633 () Bool)

(assert (=> b!1071692 (= c!107633 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1071693 () Bool)

(assert (=> b!1071693 (= e!611999 call!45206)))

(declare-fun b!1071694 () Bool)

(assert (=> b!1071694 (= e!612006 e!611994)))

(declare-fun res!714929 () Bool)

(assert (=> b!1071694 (= res!714929 call!45208)))

(assert (=> b!1071694 (=> (not res!714929) (not e!611994))))

(declare-fun b!1071695 () Bool)

(assert (=> b!1071695 (= e!611996 (validKeyInArray!0 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45204 () Bool)

(assert (=> bm!45204 (= call!45207 (contains!6291 lt!474392 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1071696 () Bool)

(assert (=> b!1071696 (= e!612004 (= (apply!923 lt!474392 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1071697 () Bool)

(declare-fun res!714931 () Bool)

(assert (=> b!1071697 (=> (not res!714931) (not e!612003))))

(assert (=> b!1071697 (= res!714931 e!612005)))

(declare-fun c!107636 () Bool)

(assert (=> b!1071697 (= c!107636 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45205 () Bool)

(assert (=> bm!45205 (= call!45204 (+!3213 (ite c!107632 call!45203 (ite c!107637 call!45205 call!45209)) (ite (or c!107632 c!107637) (tuple2!16559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1071698 () Bool)

(assert (=> b!1071698 (= e!611997 call!45206)))

(declare-fun bm!45206 () Bool)

(assert (=> bm!45206 (= call!45209 call!45205)))

(declare-fun b!1071699 () Bool)

(declare-fun c!107635 () Bool)

(assert (=> b!1071699 (= c!107635 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1071699 (= e!611999 e!611997)))

(declare-fun b!1071700 () Bool)

(assert (=> b!1071700 (= e!611998 (= (apply!923 lt!474392 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)) (get!17163 (select (arr!32987 _values!955) #b00000000000000000000000000000000) (dynLambda!2022 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1071700 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33525 _values!955)))))

(assert (=> b!1071700 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(assert (= (and d!129165 c!107632) b!1071688))

(assert (= (and d!129165 (not c!107632)) b!1071683))

(assert (= (and b!1071683 c!107637) b!1071693))

(assert (= (and b!1071683 (not c!107637)) b!1071699))

(assert (= (and b!1071699 c!107635) b!1071698))

(assert (= (and b!1071699 (not c!107635)) b!1071691))

(assert (= (or b!1071698 b!1071691) bm!45206))

(assert (= (or b!1071693 bm!45206) bm!45203))

(assert (= (or b!1071693 b!1071698) bm!45201))

(assert (= (or b!1071688 bm!45203) bm!45200))

(assert (= (or b!1071688 bm!45201) bm!45205))

(assert (= (and d!129165 res!714926) b!1071685))

(assert (= (and d!129165 c!107634) b!1071686))

(assert (= (and d!129165 (not c!107634)) b!1071684))

(assert (= (and d!129165 res!714925) b!1071681))

(assert (= (and b!1071681 res!714928) b!1071695))

(assert (= (and b!1071681 (not res!714923)) b!1071689))

(assert (= (and b!1071689 res!714924) b!1071700))

(assert (= (and b!1071681 res!714930) b!1071697))

(assert (= (and b!1071697 c!107636) b!1071690))

(assert (= (and b!1071697 (not c!107636)) b!1071680))

(assert (= (and b!1071690 res!714927) b!1071696))

(assert (= (or b!1071690 b!1071680) bm!45204))

(assert (= (and b!1071697 res!714931) b!1071692))

(assert (= (and b!1071692 c!107633) b!1071694))

(assert (= (and b!1071692 (not c!107633)) b!1071682))

(assert (= (and b!1071694 res!714929) b!1071687))

(assert (= (or b!1071694 b!1071682) bm!45202))

(declare-fun b_lambda!16657 () Bool)

(assert (=> (not b_lambda!16657) (not b!1071700)))

(assert (=> b!1071700 t!32415))

(declare-fun b_and!34839 () Bool)

(assert (= b_and!34837 (and (=> t!32415 result!14765) b_and!34839)))

(assert (=> b!1071685 m!989783))

(assert (=> b!1071685 m!989783))

(assert (=> b!1071685 m!989787))

(assert (=> b!1071700 m!989815))

(assert (=> b!1071700 m!989817))

(assert (=> b!1071700 m!989783))

(declare-fun m!989909 () Bool)

(assert (=> b!1071700 m!989909))

(assert (=> b!1071700 m!989817))

(assert (=> b!1071700 m!989815))

(assert (=> b!1071700 m!989821))

(assert (=> b!1071700 m!989783))

(assert (=> bm!45200 m!989685))

(declare-fun m!989911 () Bool)

(assert (=> b!1071688 m!989911))

(declare-fun m!989913 () Bool)

(assert (=> b!1071686 m!989913))

(declare-fun m!989915 () Bool)

(assert (=> b!1071686 m!989915))

(declare-fun m!989917 () Bool)

(assert (=> b!1071686 m!989917))

(declare-fun m!989919 () Bool)

(assert (=> b!1071686 m!989919))

(assert (=> b!1071686 m!989917))

(declare-fun m!989921 () Bool)

(assert (=> b!1071686 m!989921))

(declare-fun m!989923 () Bool)

(assert (=> b!1071686 m!989923))

(assert (=> b!1071686 m!989685))

(declare-fun m!989925 () Bool)

(assert (=> b!1071686 m!989925))

(declare-fun m!989927 () Bool)

(assert (=> b!1071686 m!989927))

(declare-fun m!989929 () Bool)

(assert (=> b!1071686 m!989929))

(assert (=> b!1071686 m!989915))

(declare-fun m!989931 () Bool)

(assert (=> b!1071686 m!989931))

(assert (=> b!1071686 m!989925))

(declare-fun m!989933 () Bool)

(assert (=> b!1071686 m!989933))

(assert (=> b!1071686 m!989783))

(assert (=> b!1071686 m!989919))

(declare-fun m!989935 () Bool)

(assert (=> b!1071686 m!989935))

(declare-fun m!989937 () Bool)

(assert (=> b!1071686 m!989937))

(declare-fun m!989939 () Bool)

(assert (=> b!1071686 m!989939))

(declare-fun m!989941 () Bool)

(assert (=> b!1071686 m!989941))

(declare-fun m!989943 () Bool)

(assert (=> bm!45202 m!989943))

(declare-fun m!989945 () Bool)

(assert (=> b!1071696 m!989945))

(assert (=> b!1071695 m!989783))

(assert (=> b!1071695 m!989783))

(assert (=> b!1071695 m!989787))

(assert (=> b!1071689 m!989783))

(assert (=> b!1071689 m!989783))

(declare-fun m!989947 () Bool)

(assert (=> b!1071689 m!989947))

(assert (=> d!129165 m!989689))

(declare-fun m!989949 () Bool)

(assert (=> b!1071687 m!989949))

(declare-fun m!989951 () Bool)

(assert (=> bm!45205 m!989951))

(declare-fun m!989953 () Bool)

(assert (=> bm!45204 m!989953))

(assert (=> b!1071519 d!129165))

(declare-fun d!129167 () Bool)

(declare-fun lt!474412 () ListLongMap!14527)

(assert (=> d!129167 (not (contains!6291 lt!474412 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!73 (List!23084 (_ BitVec 64)) List!23084)

(assert (=> d!129167 (= lt!474412 (ListLongMap!14528 (removeStrictlySorted!73 (toList!7279 lt!474212) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129167 (= (-!673 lt!474212 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474412)))

(declare-fun bs!31548 () Bool)

(assert (= bs!31548 d!129167))

(declare-fun m!989955 () Bool)

(assert (=> bs!31548 m!989955))

(declare-fun m!989957 () Bool)

(assert (=> bs!31548 m!989957))

(assert (=> b!1071519 d!129167))

(declare-fun d!129169 () Bool)

(declare-fun e!612007 () Bool)

(assert (=> d!129169 e!612007))

(declare-fun res!714933 () Bool)

(assert (=> d!129169 (=> (not res!714933) (not e!612007))))

(declare-fun lt!474413 () ListLongMap!14527)

(assert (=> d!129169 (= res!714933 (contains!6291 lt!474413 (_1!8290 lt!474209)))))

(declare-fun lt!474414 () List!23084)

(assert (=> d!129169 (= lt!474413 (ListLongMap!14528 lt!474414))))

(declare-fun lt!474416 () Unit!35137)

(declare-fun lt!474415 () Unit!35137)

(assert (=> d!129169 (= lt!474416 lt!474415)))

(assert (=> d!129169 (= (getValueByKey!605 lt!474414 (_1!8290 lt!474209)) (Some!655 (_2!8290 lt!474209)))))

(assert (=> d!129169 (= lt!474415 (lemmaContainsTupThenGetReturnValue!285 lt!474414 (_1!8290 lt!474209) (_2!8290 lt!474209)))))

(assert (=> d!129169 (= lt!474414 (insertStrictlySorted!378 (toList!7279 lt!474218) (_1!8290 lt!474209) (_2!8290 lt!474209)))))

(assert (=> d!129169 (= (+!3213 lt!474218 lt!474209) lt!474413)))

(declare-fun b!1071701 () Bool)

(declare-fun res!714932 () Bool)

(assert (=> b!1071701 (=> (not res!714932) (not e!612007))))

(assert (=> b!1071701 (= res!714932 (= (getValueByKey!605 (toList!7279 lt!474413) (_1!8290 lt!474209)) (Some!655 (_2!8290 lt!474209))))))

(declare-fun b!1071702 () Bool)

(assert (=> b!1071702 (= e!612007 (contains!6292 (toList!7279 lt!474413) lt!474209))))

(assert (= (and d!129169 res!714933) b!1071701))

(assert (= (and b!1071701 res!714932) b!1071702))

(declare-fun m!989959 () Bool)

(assert (=> d!129169 m!989959))

(declare-fun m!989961 () Bool)

(assert (=> d!129169 m!989961))

(declare-fun m!989963 () Bool)

(assert (=> d!129169 m!989963))

(declare-fun m!989965 () Bool)

(assert (=> d!129169 m!989965))

(declare-fun m!989967 () Bool)

(assert (=> b!1071701 m!989967))

(declare-fun m!989969 () Bool)

(assert (=> b!1071702 m!989969))

(assert (=> b!1071519 d!129169))

(declare-fun d!129171 () Bool)

(declare-fun lt!474417 () ListLongMap!14527)

(assert (=> d!129171 (not (contains!6291 lt!474417 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129171 (= lt!474417 (ListLongMap!14528 (removeStrictlySorted!73 (toList!7279 lt!474217) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129171 (= (-!673 lt!474217 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474417)))

(declare-fun bs!31549 () Bool)

(assert (= bs!31549 d!129171))

(declare-fun m!989971 () Bool)

(assert (=> bs!31549 m!989971))

(declare-fun m!989973 () Bool)

(assert (=> bs!31549 m!989973))

(assert (=> b!1071519 d!129171))

(declare-fun d!129173 () Bool)

(assert (=> d!129173 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94768 d!129173))

(declare-fun d!129175 () Bool)

(assert (=> d!129175 (= (array_inv!25520 _values!955) (bvsge (size!33525 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94768 d!129175))

(declare-fun d!129177 () Bool)

(assert (=> d!129177 (= (array_inv!25521 _keys!1163) (bvsge (size!33526 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94768 d!129177))

(declare-fun b!1071711 () Bool)

(declare-fun e!612014 () Bool)

(declare-fun e!612016 () Bool)

(assert (=> b!1071711 (= e!612014 e!612016)))

(declare-fun lt!474424 () (_ BitVec 64))

(assert (=> b!1071711 (= lt!474424 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!474425 () Unit!35137)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68584 (_ BitVec 64) (_ BitVec 32)) Unit!35137)

(assert (=> b!1071711 (= lt!474425 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!474424 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1071711 (arrayContainsKey!0 _keys!1163 lt!474424 #b00000000000000000000000000000000)))

(declare-fun lt!474426 () Unit!35137)

(assert (=> b!1071711 (= lt!474426 lt!474425)))

(declare-fun res!714938 () Bool)

(declare-datatypes ((SeekEntryResult!9882 0))(
  ( (MissingZero!9882 (index!41899 (_ BitVec 32))) (Found!9882 (index!41900 (_ BitVec 32))) (Intermediate!9882 (undefined!10694 Bool) (index!41901 (_ BitVec 32)) (x!96030 (_ BitVec 32))) (Undefined!9882) (MissingVacant!9882 (index!41902 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68584 (_ BitVec 32)) SeekEntryResult!9882)

(assert (=> b!1071711 (= res!714938 (= (seekEntryOrOpen!0 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9882 #b00000000000000000000000000000000)))))

(assert (=> b!1071711 (=> (not res!714938) (not e!612016))))

(declare-fun bm!45209 () Bool)

(declare-fun call!45212 () Bool)

(assert (=> bm!45209 (= call!45212 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1071712 () Bool)

(assert (=> b!1071712 (= e!612016 call!45212)))

(declare-fun b!1071713 () Bool)

(assert (=> b!1071713 (= e!612014 call!45212)))

(declare-fun b!1071714 () Bool)

(declare-fun e!612015 () Bool)

(assert (=> b!1071714 (= e!612015 e!612014)))

(declare-fun c!107640 () Bool)

(assert (=> b!1071714 (= c!107640 (validKeyInArray!0 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129179 () Bool)

(declare-fun res!714939 () Bool)

(assert (=> d!129179 (=> res!714939 e!612015)))

(assert (=> d!129179 (= res!714939 (bvsge #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(assert (=> d!129179 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!612015)))

(assert (= (and d!129179 (not res!714939)) b!1071714))

(assert (= (and b!1071714 c!107640) b!1071711))

(assert (= (and b!1071714 (not c!107640)) b!1071713))

(assert (= (and b!1071711 res!714938) b!1071712))

(assert (= (or b!1071712 b!1071713) bm!45209))

(assert (=> b!1071711 m!989783))

(declare-fun m!989975 () Bool)

(assert (=> b!1071711 m!989975))

(declare-fun m!989977 () Bool)

(assert (=> b!1071711 m!989977))

(assert (=> b!1071711 m!989783))

(declare-fun m!989979 () Bool)

(assert (=> b!1071711 m!989979))

(declare-fun m!989981 () Bool)

(assert (=> bm!45209 m!989981))

(assert (=> b!1071714 m!989783))

(assert (=> b!1071714 m!989783))

(assert (=> b!1071714 m!989787))

(assert (=> b!1071525 d!129179))

(declare-fun d!129181 () Bool)

(assert (=> d!129181 (= (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474429 () Unit!35137)

(declare-fun choose!1750 (array!68584 array!68582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39585 V!39585 V!39585 V!39585 (_ BitVec 32) Int) Unit!35137)

(assert (=> d!129181 (= lt!474429 (choose!1750 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129181 (validMask!0 mask!1515)))

(assert (=> d!129181 (= (lemmaNoChangeToArrayThenSameMapNoExtras!857 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!474429)))

(declare-fun bs!31550 () Bool)

(assert (= bs!31550 d!129181))

(assert (=> bs!31550 m!989687))

(assert (=> bs!31550 m!989685))

(declare-fun m!989983 () Bool)

(assert (=> bs!31550 m!989983))

(assert (=> bs!31550 m!989689))

(assert (=> b!1071521 d!129181))

(declare-fun call!45215 () ListLongMap!14527)

(declare-fun bm!45212 () Bool)

(assert (=> bm!45212 (= call!45215 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1071739 () Bool)

(declare-fun e!612035 () Bool)

(declare-fun lt!474445 () ListLongMap!14527)

(declare-fun isEmpty!953 (ListLongMap!14527) Bool)

(assert (=> b!1071739 (= e!612035 (isEmpty!953 lt!474445))))

(declare-fun b!1071740 () Bool)

(declare-fun res!714950 () Bool)

(declare-fun e!612031 () Bool)

(assert (=> b!1071740 (=> (not res!714950) (not e!612031))))

(assert (=> b!1071740 (= res!714950 (not (contains!6291 lt!474445 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129183 () Bool)

(assert (=> d!129183 e!612031))

(declare-fun res!714949 () Bool)

(assert (=> d!129183 (=> (not res!714949) (not e!612031))))

(assert (=> d!129183 (= res!714949 (not (contains!6291 lt!474445 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!612037 () ListLongMap!14527)

(assert (=> d!129183 (= lt!474445 e!612037)))

(declare-fun c!107652 () Bool)

(assert (=> d!129183 (= c!107652 (bvsge #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(assert (=> d!129183 (validMask!0 mask!1515)))

(assert (=> d!129183 (= (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!474445)))

(declare-fun b!1071741 () Bool)

(declare-fun e!612033 () Bool)

(declare-fun e!612034 () Bool)

(assert (=> b!1071741 (= e!612033 e!612034)))

(assert (=> b!1071741 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(declare-fun res!714951 () Bool)

(assert (=> b!1071741 (= res!714951 (contains!6291 lt!474445 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071741 (=> (not res!714951) (not e!612034))))

(declare-fun b!1071742 () Bool)

(declare-fun lt!474450 () Unit!35137)

(declare-fun lt!474446 () Unit!35137)

(assert (=> b!1071742 (= lt!474450 lt!474446)))

(declare-fun lt!474447 () (_ BitVec 64))

(declare-fun lt!474449 () ListLongMap!14527)

(declare-fun lt!474444 () (_ BitVec 64))

(declare-fun lt!474448 () V!39585)

(assert (=> b!1071742 (not (contains!6291 (+!3213 lt!474449 (tuple2!16559 lt!474447 lt!474448)) lt!474444))))

(declare-fun addStillNotContains!259 (ListLongMap!14527 (_ BitVec 64) V!39585 (_ BitVec 64)) Unit!35137)

(assert (=> b!1071742 (= lt!474446 (addStillNotContains!259 lt!474449 lt!474447 lt!474448 lt!474444))))

(assert (=> b!1071742 (= lt!474444 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1071742 (= lt!474448 (get!17163 (select (arr!32987 _values!955) #b00000000000000000000000000000000) (dynLambda!2022 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1071742 (= lt!474447 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1071742 (= lt!474449 call!45215)))

(declare-fun e!612036 () ListLongMap!14527)

(assert (=> b!1071742 (= e!612036 (+!3213 call!45215 (tuple2!16559 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000) (get!17163 (select (arr!32987 _values!955) #b00000000000000000000000000000000) (dynLambda!2022 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1071743 () Bool)

(assert (=> b!1071743 (= e!612037 e!612036)))

(declare-fun c!107651 () Bool)

(assert (=> b!1071743 (= c!107651 (validKeyInArray!0 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071744 () Bool)

(assert (=> b!1071744 (= e!612037 (ListLongMap!14528 Nil!23081))))

(declare-fun b!1071745 () Bool)

(assert (=> b!1071745 (= e!612031 e!612033)))

(declare-fun c!107649 () Bool)

(declare-fun e!612032 () Bool)

(assert (=> b!1071745 (= c!107649 e!612032)))

(declare-fun res!714948 () Bool)

(assert (=> b!1071745 (=> (not res!714948) (not e!612032))))

(assert (=> b!1071745 (= res!714948 (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(declare-fun b!1071746 () Bool)

(assert (=> b!1071746 (= e!612035 (= lt!474445 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1071747 () Bool)

(assert (=> b!1071747 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(assert (=> b!1071747 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33525 _values!955)))))

(assert (=> b!1071747 (= e!612034 (= (apply!923 lt!474445 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)) (get!17163 (select (arr!32987 _values!955) #b00000000000000000000000000000000) (dynLambda!2022 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1071748 () Bool)

(assert (=> b!1071748 (= e!612036 call!45215)))

(declare-fun b!1071749 () Bool)

(assert (=> b!1071749 (= e!612033 e!612035)))

(declare-fun c!107650 () Bool)

(assert (=> b!1071749 (= c!107650 (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(declare-fun b!1071750 () Bool)

(assert (=> b!1071750 (= e!612032 (validKeyInArray!0 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071750 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!129183 c!107652) b!1071744))

(assert (= (and d!129183 (not c!107652)) b!1071743))

(assert (= (and b!1071743 c!107651) b!1071742))

(assert (= (and b!1071743 (not c!107651)) b!1071748))

(assert (= (or b!1071742 b!1071748) bm!45212))

(assert (= (and d!129183 res!714949) b!1071740))

(assert (= (and b!1071740 res!714950) b!1071745))

(assert (= (and b!1071745 res!714948) b!1071750))

(assert (= (and b!1071745 c!107649) b!1071741))

(assert (= (and b!1071745 (not c!107649)) b!1071749))

(assert (= (and b!1071741 res!714951) b!1071747))

(assert (= (and b!1071749 c!107650) b!1071746))

(assert (= (and b!1071749 (not c!107650)) b!1071739))

(declare-fun b_lambda!16659 () Bool)

(assert (=> (not b_lambda!16659) (not b!1071742)))

(assert (=> b!1071742 t!32415))

(declare-fun b_and!34841 () Bool)

(assert (= b_and!34839 (and (=> t!32415 result!14765) b_and!34841)))

(declare-fun b_lambda!16661 () Bool)

(assert (=> (not b_lambda!16661) (not b!1071747)))

(assert (=> b!1071747 t!32415))

(declare-fun b_and!34843 () Bool)

(assert (= b_and!34841 (and (=> t!32415 result!14765) b_and!34843)))

(declare-fun m!989985 () Bool)

(assert (=> b!1071739 m!989985))

(declare-fun m!989987 () Bool)

(assert (=> b!1071742 m!989987))

(declare-fun m!989989 () Bool)

(assert (=> b!1071742 m!989989))

(declare-fun m!989991 () Bool)

(assert (=> b!1071742 m!989991))

(declare-fun m!989993 () Bool)

(assert (=> b!1071742 m!989993))

(assert (=> b!1071742 m!989817))

(assert (=> b!1071742 m!989815))

(assert (=> b!1071742 m!989821))

(assert (=> b!1071742 m!989783))

(assert (=> b!1071742 m!989817))

(assert (=> b!1071742 m!989815))

(assert (=> b!1071742 m!989989))

(declare-fun m!989995 () Bool)

(assert (=> d!129183 m!989995))

(assert (=> d!129183 m!989689))

(assert (=> b!1071747 m!989783))

(declare-fun m!989997 () Bool)

(assert (=> b!1071747 m!989997))

(assert (=> b!1071747 m!989817))

(assert (=> b!1071747 m!989815))

(assert (=> b!1071747 m!989821))

(assert (=> b!1071747 m!989783))

(assert (=> b!1071747 m!989817))

(assert (=> b!1071747 m!989815))

(assert (=> b!1071743 m!989783))

(assert (=> b!1071743 m!989783))

(assert (=> b!1071743 m!989787))

(declare-fun m!989999 () Bool)

(assert (=> bm!45212 m!989999))

(assert (=> b!1071750 m!989783))

(assert (=> b!1071750 m!989783))

(assert (=> b!1071750 m!989787))

(declare-fun m!990001 () Bool)

(assert (=> b!1071740 m!990001))

(assert (=> b!1071746 m!989999))

(assert (=> b!1071741 m!989783))

(assert (=> b!1071741 m!989783))

(declare-fun m!990003 () Bool)

(assert (=> b!1071741 m!990003))

(assert (=> b!1071521 d!129183))

(declare-fun bm!45213 () Bool)

(declare-fun call!45216 () ListLongMap!14527)

(assert (=> bm!45213 (= call!45216 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1071751 () Bool)

(declare-fun e!612042 () Bool)

(declare-fun lt!474452 () ListLongMap!14527)

(assert (=> b!1071751 (= e!612042 (isEmpty!953 lt!474452))))

(declare-fun b!1071752 () Bool)

(declare-fun res!714954 () Bool)

(declare-fun e!612038 () Bool)

(assert (=> b!1071752 (=> (not res!714954) (not e!612038))))

(assert (=> b!1071752 (= res!714954 (not (contains!6291 lt!474452 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129185 () Bool)

(assert (=> d!129185 e!612038))

(declare-fun res!714953 () Bool)

(assert (=> d!129185 (=> (not res!714953) (not e!612038))))

(assert (=> d!129185 (= res!714953 (not (contains!6291 lt!474452 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!612044 () ListLongMap!14527)

(assert (=> d!129185 (= lt!474452 e!612044)))

(declare-fun c!107656 () Bool)

(assert (=> d!129185 (= c!107656 (bvsge #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(assert (=> d!129185 (validMask!0 mask!1515)))

(assert (=> d!129185 (= (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!474452)))

(declare-fun b!1071753 () Bool)

(declare-fun e!612040 () Bool)

(declare-fun e!612041 () Bool)

(assert (=> b!1071753 (= e!612040 e!612041)))

(assert (=> b!1071753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(declare-fun res!714955 () Bool)

(assert (=> b!1071753 (= res!714955 (contains!6291 lt!474452 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071753 (=> (not res!714955) (not e!612041))))

(declare-fun b!1071754 () Bool)

(declare-fun lt!474457 () Unit!35137)

(declare-fun lt!474453 () Unit!35137)

(assert (=> b!1071754 (= lt!474457 lt!474453)))

(declare-fun lt!474455 () V!39585)

(declare-fun lt!474451 () (_ BitVec 64))

(declare-fun lt!474454 () (_ BitVec 64))

(declare-fun lt!474456 () ListLongMap!14527)

(assert (=> b!1071754 (not (contains!6291 (+!3213 lt!474456 (tuple2!16559 lt!474454 lt!474455)) lt!474451))))

(assert (=> b!1071754 (= lt!474453 (addStillNotContains!259 lt!474456 lt!474454 lt!474455 lt!474451))))

(assert (=> b!1071754 (= lt!474451 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1071754 (= lt!474455 (get!17163 (select (arr!32987 _values!955) #b00000000000000000000000000000000) (dynLambda!2022 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1071754 (= lt!474454 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1071754 (= lt!474456 call!45216)))

(declare-fun e!612043 () ListLongMap!14527)

(assert (=> b!1071754 (= e!612043 (+!3213 call!45216 (tuple2!16559 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000) (get!17163 (select (arr!32987 _values!955) #b00000000000000000000000000000000) (dynLambda!2022 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1071755 () Bool)

(assert (=> b!1071755 (= e!612044 e!612043)))

(declare-fun c!107655 () Bool)

(assert (=> b!1071755 (= c!107655 (validKeyInArray!0 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071756 () Bool)

(assert (=> b!1071756 (= e!612044 (ListLongMap!14528 Nil!23081))))

(declare-fun b!1071757 () Bool)

(assert (=> b!1071757 (= e!612038 e!612040)))

(declare-fun c!107653 () Bool)

(declare-fun e!612039 () Bool)

(assert (=> b!1071757 (= c!107653 e!612039)))

(declare-fun res!714952 () Bool)

(assert (=> b!1071757 (=> (not res!714952) (not e!612039))))

(assert (=> b!1071757 (= res!714952 (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(declare-fun b!1071758 () Bool)

(assert (=> b!1071758 (= e!612042 (= lt!474452 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1071759 () Bool)

(assert (=> b!1071759 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(assert (=> b!1071759 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33525 _values!955)))))

(assert (=> b!1071759 (= e!612041 (= (apply!923 lt!474452 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)) (get!17163 (select (arr!32987 _values!955) #b00000000000000000000000000000000) (dynLambda!2022 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1071760 () Bool)

(assert (=> b!1071760 (= e!612043 call!45216)))

(declare-fun b!1071761 () Bool)

(assert (=> b!1071761 (= e!612040 e!612042)))

(declare-fun c!107654 () Bool)

(assert (=> b!1071761 (= c!107654 (bvslt #b00000000000000000000000000000000 (size!33526 _keys!1163)))))

(declare-fun b!1071762 () Bool)

(assert (=> b!1071762 (= e!612039 (validKeyInArray!0 (select (arr!32988 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071762 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!129185 c!107656) b!1071756))

(assert (= (and d!129185 (not c!107656)) b!1071755))

(assert (= (and b!1071755 c!107655) b!1071754))

(assert (= (and b!1071755 (not c!107655)) b!1071760))

(assert (= (or b!1071754 b!1071760) bm!45213))

(assert (= (and d!129185 res!714953) b!1071752))

(assert (= (and b!1071752 res!714954) b!1071757))

(assert (= (and b!1071757 res!714952) b!1071762))

(assert (= (and b!1071757 c!107653) b!1071753))

(assert (= (and b!1071757 (not c!107653)) b!1071761))

(assert (= (and b!1071753 res!714955) b!1071759))

(assert (= (and b!1071761 c!107654) b!1071758))

(assert (= (and b!1071761 (not c!107654)) b!1071751))

(declare-fun b_lambda!16663 () Bool)

(assert (=> (not b_lambda!16663) (not b!1071754)))

(assert (=> b!1071754 t!32415))

(declare-fun b_and!34845 () Bool)

(assert (= b_and!34843 (and (=> t!32415 result!14765) b_and!34845)))

(declare-fun b_lambda!16665 () Bool)

(assert (=> (not b_lambda!16665) (not b!1071759)))

(assert (=> b!1071759 t!32415))

(declare-fun b_and!34847 () Bool)

(assert (= b_and!34845 (and (=> t!32415 result!14765) b_and!34847)))

(declare-fun m!990005 () Bool)

(assert (=> b!1071751 m!990005))

(declare-fun m!990007 () Bool)

(assert (=> b!1071754 m!990007))

(declare-fun m!990009 () Bool)

(assert (=> b!1071754 m!990009))

(declare-fun m!990011 () Bool)

(assert (=> b!1071754 m!990011))

(declare-fun m!990013 () Bool)

(assert (=> b!1071754 m!990013))

(assert (=> b!1071754 m!989817))

(assert (=> b!1071754 m!989815))

(assert (=> b!1071754 m!989821))

(assert (=> b!1071754 m!989783))

(assert (=> b!1071754 m!989817))

(assert (=> b!1071754 m!989815))

(assert (=> b!1071754 m!990009))

(declare-fun m!990015 () Bool)

(assert (=> d!129185 m!990015))

(assert (=> d!129185 m!989689))

(assert (=> b!1071759 m!989783))

(declare-fun m!990017 () Bool)

(assert (=> b!1071759 m!990017))

(assert (=> b!1071759 m!989817))

(assert (=> b!1071759 m!989815))

(assert (=> b!1071759 m!989821))

(assert (=> b!1071759 m!989783))

(assert (=> b!1071759 m!989817))

(assert (=> b!1071759 m!989815))

(assert (=> b!1071755 m!989783))

(assert (=> b!1071755 m!989783))

(assert (=> b!1071755 m!989787))

(declare-fun m!990019 () Bool)

(assert (=> bm!45213 m!990019))

(assert (=> b!1071762 m!989783))

(assert (=> b!1071762 m!989783))

(assert (=> b!1071762 m!989787))

(declare-fun m!990021 () Bool)

(assert (=> b!1071752 m!990021))

(assert (=> b!1071758 m!990019))

(assert (=> b!1071753 m!989783))

(assert (=> b!1071753 m!989783))

(declare-fun m!990023 () Bool)

(assert (=> b!1071753 m!990023))

(assert (=> b!1071521 d!129185))

(declare-fun b!1071770 () Bool)

(declare-fun e!612049 () Bool)

(assert (=> b!1071770 (= e!612049 tp_is_empty!25837)))

(declare-fun mapIsEmpty!40471 () Bool)

(declare-fun mapRes!40471 () Bool)

(assert (=> mapIsEmpty!40471 mapRes!40471))

(declare-fun mapNonEmpty!40471 () Bool)

(declare-fun tp!77555 () Bool)

(declare-fun e!612050 () Bool)

(assert (=> mapNonEmpty!40471 (= mapRes!40471 (and tp!77555 e!612050))))

(declare-fun mapKey!40471 () (_ BitVec 32))

(declare-fun mapRest!40471 () (Array (_ BitVec 32) ValueCell!12215))

(declare-fun mapValue!40471 () ValueCell!12215)

(assert (=> mapNonEmpty!40471 (= mapRest!40462 (store mapRest!40471 mapKey!40471 mapValue!40471))))

(declare-fun condMapEmpty!40471 () Bool)

(declare-fun mapDefault!40471 () ValueCell!12215)

(assert (=> mapNonEmpty!40462 (= condMapEmpty!40471 (= mapRest!40462 ((as const (Array (_ BitVec 32) ValueCell!12215)) mapDefault!40471)))))

(assert (=> mapNonEmpty!40462 (= tp!77540 (and e!612049 mapRes!40471))))

(declare-fun b!1071769 () Bool)

(assert (=> b!1071769 (= e!612050 tp_is_empty!25837)))

(assert (= (and mapNonEmpty!40462 condMapEmpty!40471) mapIsEmpty!40471))

(assert (= (and mapNonEmpty!40462 (not condMapEmpty!40471)) mapNonEmpty!40471))

(assert (= (and mapNonEmpty!40471 ((_ is ValueCellFull!12215) mapValue!40471)) b!1071769))

(assert (= (and mapNonEmpty!40462 ((_ is ValueCellFull!12215) mapDefault!40471)) b!1071770))

(declare-fun m!990025 () Bool)

(assert (=> mapNonEmpty!40471 m!990025))

(declare-fun b_lambda!16667 () Bool)

(assert (= b_lambda!16659 (or (and start!94768 b_free!22027) b_lambda!16667)))

(declare-fun b_lambda!16669 () Bool)

(assert (= b_lambda!16663 (or (and start!94768 b_free!22027) b_lambda!16669)))

(declare-fun b_lambda!16671 () Bool)

(assert (= b_lambda!16665 (or (and start!94768 b_free!22027) b_lambda!16671)))

(declare-fun b_lambda!16673 () Bool)

(assert (= b_lambda!16657 (or (and start!94768 b_free!22027) b_lambda!16673)))

(declare-fun b_lambda!16675 () Bool)

(assert (= b_lambda!16661 (or (and start!94768 b_free!22027) b_lambda!16675)))

(declare-fun b_lambda!16677 () Bool)

(assert (= b_lambda!16655 (or (and start!94768 b_free!22027) b_lambda!16677)))

(check-sat (not b!1071700) (not b_lambda!16673) (not b!1071679) (not b!1071685) (not mapNonEmpty!40471) (not b_lambda!16671) (not d!129161) (not b!1071711) (not b!1071695) (not b!1071754) (not b!1071751) (not b!1071746) (not bm!45198) (not b!1071669) (not b!1071598) (not d!129153) (not b!1071747) (not b!1071677) (not bm!45205) (not b_lambda!16669) (not b!1071662) (not b_lambda!16675) (not b!1071742) (not b_lambda!16667) (not b!1071714) (not b!1071673) (not d!129185) (not b!1071608) (not d!129183) (not bm!45193) (not b!1071661) (not d!129151) (not d!129157) (not b!1071758) tp_is_empty!25837 (not b!1071610) (not b!1071687) (not b!1071686) (not bm!45204) (not bm!45200) (not b!1071740) (not b!1071658) (not d!129171) (not d!129181) (not b!1071752) (not b!1071750) (not bm!45197) (not b_lambda!16677) (not bm!45209) (not b!1071609) (not b!1071668) (not b!1071701) (not d!129169) (not bm!45202) (not b!1071688) (not bm!45213) (not b!1071743) b_and!34847 (not b!1071702) (not b!1071689) (not d!129159) (not b!1071607) (not b!1071753) (not d!129165) (not b!1071759) (not b!1071696) (not b_next!22027) (not b!1071739) (not b!1071741) (not b!1071660) (not d!129163) (not b!1071600) (not bm!45195) (not bm!45178) (not b!1071601) (not b!1071755) (not bm!45212) (not b!1071659) (not b!1071676) (not b!1071678) (not d!129167) (not b!1071762) (not d!129155))
(check-sat b_and!34847 (not b_next!22027))
