; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94840 () Bool)

(assert start!94840)

(declare-fun b_free!22075 () Bool)

(declare-fun b_next!22075 () Bool)

(assert (=> start!94840 (= b_free!22075 (not b_next!22075))))

(declare-fun tp!77686 () Bool)

(declare-fun b_and!34891 () Bool)

(assert (=> start!94840 (= tp!77686 b_and!34891)))

(declare-fun b!1072356 () Bool)

(declare-fun e!612509 () Bool)

(declare-fun e!612507 () Bool)

(declare-fun mapRes!40537 () Bool)

(assert (=> b!1072356 (= e!612509 (and e!612507 mapRes!40537))))

(declare-fun condMapEmpty!40537 () Bool)

(declare-datatypes ((V!39649 0))(
  ( (V!39650 (val!12993 Int)) )
))
(declare-datatypes ((ValueCell!12239 0))(
  ( (ValueCellFull!12239 (v!15609 V!39649)) (EmptyCell!12239) )
))
(declare-datatypes ((array!68678 0))(
  ( (array!68679 (arr!33034 (Array (_ BitVec 32) ValueCell!12239)) (size!33572 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68678)

(declare-fun mapDefault!40537 () ValueCell!12239)

(assert (=> b!1072356 (= condMapEmpty!40537 (= (arr!33034 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12239)) mapDefault!40537)))))

(declare-fun e!612508 () Bool)

(declare-datatypes ((tuple2!16604 0))(
  ( (tuple2!16605 (_1!8313 (_ BitVec 64)) (_2!8313 V!39649)) )
))
(declare-datatypes ((List!23127 0))(
  ( (Nil!23124) (Cons!23123 (h!24332 tuple2!16604) (t!32453 List!23127)) )
))
(declare-datatypes ((ListLongMap!14573 0))(
  ( (ListLongMap!14574 (toList!7302 List!23127)) )
))
(declare-fun lt!475313 () ListLongMap!14573)

(declare-fun b!1072357 () Bool)

(declare-fun lt!475305 () ListLongMap!14573)

(declare-fun lt!475308 () tuple2!16604)

(declare-fun +!3234 (ListLongMap!14573 tuple2!16604) ListLongMap!14573)

(assert (=> b!1072357 (= e!612508 (= lt!475313 (+!3234 lt!475305 lt!475308)))))

(declare-fun b!1072358 () Bool)

(declare-fun res!715350 () Bool)

(declare-fun e!612511 () Bool)

(assert (=> b!1072358 (=> (not res!715350) (not e!612511))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68680 0))(
  ( (array!68681 (arr!33035 (Array (_ BitVec 32) (_ BitVec 64))) (size!33573 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68680)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1072358 (= res!715350 (and (= (size!33572 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33573 _keys!1163) (size!33572 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072359 () Bool)

(declare-fun e!612506 () Bool)

(assert (=> b!1072359 (= e!612506 true)))

(declare-fun lt!475312 () ListLongMap!14573)

(declare-fun lt!475314 () ListLongMap!14573)

(declare-fun -!688 (ListLongMap!14573 (_ BitVec 64)) ListLongMap!14573)

(assert (=> b!1072359 (= lt!475312 (-!688 lt!475314 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475306 () ListLongMap!14573)

(declare-fun lt!475303 () ListLongMap!14573)

(assert (=> b!1072359 (= lt!475306 lt!475303)))

(declare-fun zeroValueBefore!47 () V!39649)

(declare-datatypes ((Unit!35179 0))(
  ( (Unit!35180) )
))
(declare-fun lt!475310 () Unit!35179)

(declare-fun lt!475304 () ListLongMap!14573)

(declare-fun minValue!907 () V!39649)

(declare-fun addCommutativeForDiffKeys!746 (ListLongMap!14573 (_ BitVec 64) V!39649 (_ BitVec 64) V!39649) Unit!35179)

(assert (=> b!1072359 (= lt!475310 (addCommutativeForDiffKeys!746 lt!475304 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475315 () ListLongMap!14573)

(assert (=> b!1072359 (= (-!688 lt!475303 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475315)))

(declare-fun lt!475307 () tuple2!16604)

(assert (=> b!1072359 (= lt!475303 (+!3234 lt!475315 lt!475307))))

(declare-fun lt!475309 () Unit!35179)

(declare-fun addThenRemoveForNewKeyIsSame!69 (ListLongMap!14573 (_ BitVec 64) V!39649) Unit!35179)

(assert (=> b!1072359 (= lt!475309 (addThenRemoveForNewKeyIsSame!69 lt!475315 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1072359 (= lt!475315 (+!3234 lt!475304 lt!475308))))

(assert (=> b!1072359 e!612508))

(declare-fun res!715347 () Bool)

(assert (=> b!1072359 (=> (not res!715347) (not e!612508))))

(assert (=> b!1072359 (= res!715347 (= lt!475314 lt!475306))))

(assert (=> b!1072359 (= lt!475306 (+!3234 (+!3234 lt!475304 lt!475307) lt!475308))))

(assert (=> b!1072359 (= lt!475308 (tuple2!16605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072359 (= lt!475307 (tuple2!16605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39649)

(declare-fun getCurrentListMap!4101 (array!68680 array!68678 (_ BitVec 32) (_ BitVec 32) V!39649 V!39649 (_ BitVec 32) Int) ListLongMap!14573)

(assert (=> b!1072359 (= lt!475313 (getCurrentListMap!4101 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072359 (= lt!475314 (getCurrentListMap!4101 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072360 () Bool)

(declare-fun res!715351 () Bool)

(assert (=> b!1072360 (=> (not res!715351) (not e!612511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68680 (_ BitVec 32)) Bool)

(assert (=> b!1072360 (= res!715351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40537 () Bool)

(assert (=> mapIsEmpty!40537 mapRes!40537))

(declare-fun b!1072361 () Bool)

(assert (=> b!1072361 (= e!612511 (not e!612506))))

(declare-fun res!715346 () Bool)

(assert (=> b!1072361 (=> res!715346 e!612506)))

(assert (=> b!1072361 (= res!715346 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1072361 (= lt!475304 lt!475305)))

(declare-fun lt!475311 () Unit!35179)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!876 (array!68680 array!68678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39649 V!39649 V!39649 V!39649 (_ BitVec 32) Int) Unit!35179)

(assert (=> b!1072361 (= lt!475311 (lemmaNoChangeToArrayThenSameMapNoExtras!876 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3882 (array!68680 array!68678 (_ BitVec 32) (_ BitVec 32) V!39649 V!39649 (_ BitVec 32) Int) ListLongMap!14573)

(assert (=> b!1072361 (= lt!475305 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072361 (= lt!475304 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072362 () Bool)

(declare-fun tp_is_empty!25885 () Bool)

(assert (=> b!1072362 (= e!612507 tp_is_empty!25885)))

(declare-fun b!1072363 () Bool)

(declare-fun e!612512 () Bool)

(assert (=> b!1072363 (= e!612512 tp_is_empty!25885)))

(declare-fun mapNonEmpty!40537 () Bool)

(declare-fun tp!77687 () Bool)

(assert (=> mapNonEmpty!40537 (= mapRes!40537 (and tp!77687 e!612512))))

(declare-fun mapValue!40537 () ValueCell!12239)

(declare-fun mapKey!40537 () (_ BitVec 32))

(declare-fun mapRest!40537 () (Array (_ BitVec 32) ValueCell!12239))

(assert (=> mapNonEmpty!40537 (= (arr!33034 _values!955) (store mapRest!40537 mapKey!40537 mapValue!40537))))

(declare-fun res!715348 () Bool)

(assert (=> start!94840 (=> (not res!715348) (not e!612511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94840 (= res!715348 (validMask!0 mask!1515))))

(assert (=> start!94840 e!612511))

(assert (=> start!94840 true))

(assert (=> start!94840 tp_is_empty!25885))

(declare-fun array_inv!25558 (array!68678) Bool)

(assert (=> start!94840 (and (array_inv!25558 _values!955) e!612509)))

(assert (=> start!94840 tp!77686))

(declare-fun array_inv!25559 (array!68680) Bool)

(assert (=> start!94840 (array_inv!25559 _keys!1163)))

(declare-fun b!1072364 () Bool)

(declare-fun res!715349 () Bool)

(assert (=> b!1072364 (=> (not res!715349) (not e!612511))))

(declare-datatypes ((List!23128 0))(
  ( (Nil!23125) (Cons!23124 (h!24333 (_ BitVec 64)) (t!32454 List!23128)) )
))
(declare-fun arrayNoDuplicates!0 (array!68680 (_ BitVec 32) List!23128) Bool)

(assert (=> b!1072364 (= res!715349 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23125))))

(assert (= (and start!94840 res!715348) b!1072358))

(assert (= (and b!1072358 res!715350) b!1072360))

(assert (= (and b!1072360 res!715351) b!1072364))

(assert (= (and b!1072364 res!715349) b!1072361))

(assert (= (and b!1072361 (not res!715346)) b!1072359))

(assert (= (and b!1072359 res!715347) b!1072357))

(assert (= (and b!1072356 condMapEmpty!40537) mapIsEmpty!40537))

(assert (= (and b!1072356 (not condMapEmpty!40537)) mapNonEmpty!40537))

(get-info :version)

(assert (= (and mapNonEmpty!40537 ((_ is ValueCellFull!12239) mapValue!40537)) b!1072363))

(assert (= (and b!1072356 ((_ is ValueCellFull!12239) mapDefault!40537)) b!1072362))

(assert (= start!94840 b!1072356))

(declare-fun m!990867 () Bool)

(assert (=> b!1072360 m!990867))

(declare-fun m!990869 () Bool)

(assert (=> start!94840 m!990869))

(declare-fun m!990871 () Bool)

(assert (=> start!94840 m!990871))

(declare-fun m!990873 () Bool)

(assert (=> start!94840 m!990873))

(declare-fun m!990875 () Bool)

(assert (=> mapNonEmpty!40537 m!990875))

(declare-fun m!990877 () Bool)

(assert (=> b!1072357 m!990877))

(declare-fun m!990879 () Bool)

(assert (=> b!1072361 m!990879))

(declare-fun m!990881 () Bool)

(assert (=> b!1072361 m!990881))

(declare-fun m!990883 () Bool)

(assert (=> b!1072361 m!990883))

(declare-fun m!990885 () Bool)

(assert (=> b!1072359 m!990885))

(declare-fun m!990887 () Bool)

(assert (=> b!1072359 m!990887))

(declare-fun m!990889 () Bool)

(assert (=> b!1072359 m!990889))

(declare-fun m!990891 () Bool)

(assert (=> b!1072359 m!990891))

(declare-fun m!990893 () Bool)

(assert (=> b!1072359 m!990893))

(assert (=> b!1072359 m!990887))

(declare-fun m!990895 () Bool)

(assert (=> b!1072359 m!990895))

(declare-fun m!990897 () Bool)

(assert (=> b!1072359 m!990897))

(declare-fun m!990899 () Bool)

(assert (=> b!1072359 m!990899))

(declare-fun m!990901 () Bool)

(assert (=> b!1072359 m!990901))

(declare-fun m!990903 () Bool)

(assert (=> b!1072359 m!990903))

(declare-fun m!990905 () Bool)

(assert (=> b!1072364 m!990905))

(check-sat (not start!94840) (not b!1072360) (not b!1072364) (not b_next!22075) tp_is_empty!25885 (not b!1072361) (not b!1072357) (not b!1072359) b_and!34891 (not mapNonEmpty!40537))
(check-sat b_and!34891 (not b_next!22075))
