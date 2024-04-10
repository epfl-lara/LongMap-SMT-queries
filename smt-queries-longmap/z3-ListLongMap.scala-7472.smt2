; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94758 () Bool)

(assert start!94758)

(declare-fun b_free!22011 () Bool)

(declare-fun b_next!22011 () Bool)

(assert (=> start!94758 (= b_free!22011 (not b_next!22011))))

(declare-fun tp!77491 () Bool)

(declare-fun b_and!34841 () Bool)

(assert (=> start!94758 (= tp!77491 b_and!34841)))

(declare-fun b!1071453 () Bool)

(declare-fun res!714754 () Bool)

(declare-fun e!611809 () Bool)

(assert (=> b!1071453 (=> (not res!714754) (not e!611809))))

(declare-datatypes ((array!68615 0))(
  ( (array!68616 (arr!33003 (Array (_ BitVec 32) (_ BitVec 64))) (size!33539 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68615)

(declare-datatypes ((List!23038 0))(
  ( (Nil!23035) (Cons!23034 (h!24243 (_ BitVec 64)) (t!32371 List!23038)) )
))
(declare-fun arrayNoDuplicates!0 (array!68615 (_ BitVec 32) List!23038) Bool)

(assert (=> b!1071453 (= res!714754 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23035))))

(declare-fun b!1071454 () Bool)

(declare-fun e!611806 () Bool)

(declare-fun e!611805 () Bool)

(declare-fun mapRes!40438 () Bool)

(assert (=> b!1071454 (= e!611806 (and e!611805 mapRes!40438))))

(declare-fun condMapEmpty!40438 () Bool)

(declare-datatypes ((V!39563 0))(
  ( (V!39564 (val!12961 Int)) )
))
(declare-datatypes ((ValueCell!12207 0))(
  ( (ValueCellFull!12207 (v!15577 V!39563)) (EmptyCell!12207) )
))
(declare-datatypes ((array!68617 0))(
  ( (array!68618 (arr!33004 (Array (_ BitVec 32) ValueCell!12207)) (size!33540 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68617)

(declare-fun mapDefault!40438 () ValueCell!12207)

(assert (=> b!1071454 (= condMapEmpty!40438 (= (arr!33004 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12207)) mapDefault!40438)))))

(declare-fun b!1071455 () Bool)

(declare-fun e!611810 () Bool)

(assert (=> b!1071455 (= e!611810 true)))

(declare-datatypes ((tuple2!16498 0))(
  ( (tuple2!16499 (_1!8260 (_ BitVec 64)) (_2!8260 V!39563)) )
))
(declare-datatypes ((List!23039 0))(
  ( (Nil!23036) (Cons!23035 (h!24244 tuple2!16498) (t!32372 List!23039)) )
))
(declare-datatypes ((ListLongMap!14467 0))(
  ( (ListLongMap!14468 (toList!7249 List!23039)) )
))
(declare-fun lt!474109 () ListLongMap!14467)

(declare-fun lt!474104 () ListLongMap!14467)

(declare-fun -!682 (ListLongMap!14467 (_ BitVec 64)) ListLongMap!14467)

(assert (=> b!1071455 (= lt!474109 (-!682 lt!474104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474110 () ListLongMap!14467)

(declare-fun lt!474100 () ListLongMap!14467)

(assert (=> b!1071455 (= lt!474110 lt!474100)))

(declare-fun zeroValueBefore!47 () V!39563)

(declare-datatypes ((Unit!35294 0))(
  ( (Unit!35295) )
))
(declare-fun lt!474102 () Unit!35294)

(declare-fun minValue!907 () V!39563)

(declare-fun lt!474107 () ListLongMap!14467)

(declare-fun addCommutativeForDiffKeys!727 (ListLongMap!14467 (_ BitVec 64) V!39563 (_ BitVec 64) V!39563) Unit!35294)

(assert (=> b!1071455 (= lt!474102 (addCommutativeForDiffKeys!727 lt!474107 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474106 () ListLongMap!14467)

(assert (=> b!1071455 (= (-!682 lt!474100 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474106)))

(declare-fun lt!474099 () tuple2!16498)

(declare-fun +!3184 (ListLongMap!14467 tuple2!16498) ListLongMap!14467)

(assert (=> b!1071455 (= lt!474100 (+!3184 lt!474106 lt!474099))))

(declare-fun lt!474108 () Unit!35294)

(declare-fun addThenRemoveForNewKeyIsSame!52 (ListLongMap!14467 (_ BitVec 64) V!39563) Unit!35294)

(assert (=> b!1071455 (= lt!474108 (addThenRemoveForNewKeyIsSame!52 lt!474106 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474105 () tuple2!16498)

(assert (=> b!1071455 (= lt!474106 (+!3184 lt!474107 lt!474105))))

(declare-fun e!611808 () Bool)

(assert (=> b!1071455 e!611808))

(declare-fun res!714749 () Bool)

(assert (=> b!1071455 (=> (not res!714749) (not e!611808))))

(assert (=> b!1071455 (= res!714749 (= lt!474104 lt!474110))))

(assert (=> b!1071455 (= lt!474110 (+!3184 (+!3184 lt!474107 lt!474099) lt!474105))))

(assert (=> b!1071455 (= lt!474105 (tuple2!16499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071455 (= lt!474099 (tuple2!16499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun lt!474101 () ListLongMap!14467)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39563)

(declare-fun getCurrentListMap!4148 (array!68615 array!68617 (_ BitVec 32) (_ BitVec 32) V!39563 V!39563 (_ BitVec 32) Int) ListLongMap!14467)

(assert (=> b!1071455 (= lt!474101 (getCurrentListMap!4148 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071455 (= lt!474104 (getCurrentListMap!4148 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071456 () Bool)

(declare-fun lt!474098 () ListLongMap!14467)

(assert (=> b!1071456 (= e!611808 (= lt!474101 (+!3184 lt!474098 lt!474105)))))

(declare-fun mapIsEmpty!40438 () Bool)

(assert (=> mapIsEmpty!40438 mapRes!40438))

(declare-fun b!1071457 () Bool)

(declare-fun res!714750 () Bool)

(assert (=> b!1071457 (=> (not res!714750) (not e!611809))))

(assert (=> b!1071457 (= res!714750 (and (= (size!33540 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33539 _keys!1163) (size!33540 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!714753 () Bool)

(assert (=> start!94758 (=> (not res!714753) (not e!611809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94758 (= res!714753 (validMask!0 mask!1515))))

(assert (=> start!94758 e!611809))

(assert (=> start!94758 true))

(declare-fun tp_is_empty!25821 () Bool)

(assert (=> start!94758 tp_is_empty!25821))

(declare-fun array_inv!25520 (array!68617) Bool)

(assert (=> start!94758 (and (array_inv!25520 _values!955) e!611806)))

(assert (=> start!94758 tp!77491))

(declare-fun array_inv!25521 (array!68615) Bool)

(assert (=> start!94758 (array_inv!25521 _keys!1163)))

(declare-fun b!1071458 () Bool)

(assert (=> b!1071458 (= e!611809 (not e!611810))))

(declare-fun res!714752 () Bool)

(assert (=> b!1071458 (=> res!714752 e!611810)))

(assert (=> b!1071458 (= res!714752 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1071458 (= lt!474107 lt!474098)))

(declare-fun lt!474103 () Unit!35294)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!856 (array!68615 array!68617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39563 V!39563 V!39563 V!39563 (_ BitVec 32) Int) Unit!35294)

(assert (=> b!1071458 (= lt!474103 (lemmaNoChangeToArrayThenSameMapNoExtras!856 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3819 (array!68615 array!68617 (_ BitVec 32) (_ BitVec 32) V!39563 V!39563 (_ BitVec 32) Int) ListLongMap!14467)

(assert (=> b!1071458 (= lt!474098 (getCurrentListMapNoExtraKeys!3819 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071458 (= lt!474107 (getCurrentListMapNoExtraKeys!3819 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071459 () Bool)

(assert (=> b!1071459 (= e!611805 tp_is_empty!25821)))

(declare-fun mapNonEmpty!40438 () Bool)

(declare-fun tp!77492 () Bool)

(declare-fun e!611804 () Bool)

(assert (=> mapNonEmpty!40438 (= mapRes!40438 (and tp!77492 e!611804))))

(declare-fun mapValue!40438 () ValueCell!12207)

(declare-fun mapKey!40438 () (_ BitVec 32))

(declare-fun mapRest!40438 () (Array (_ BitVec 32) ValueCell!12207))

(assert (=> mapNonEmpty!40438 (= (arr!33004 _values!955) (store mapRest!40438 mapKey!40438 mapValue!40438))))

(declare-fun b!1071460 () Bool)

(declare-fun res!714751 () Bool)

(assert (=> b!1071460 (=> (not res!714751) (not e!611809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68615 (_ BitVec 32)) Bool)

(assert (=> b!1071460 (= res!714751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071461 () Bool)

(assert (=> b!1071461 (= e!611804 tp_is_empty!25821)))

(assert (= (and start!94758 res!714753) b!1071457))

(assert (= (and b!1071457 res!714750) b!1071460))

(assert (= (and b!1071460 res!714751) b!1071453))

(assert (= (and b!1071453 res!714754) b!1071458))

(assert (= (and b!1071458 (not res!714752)) b!1071455))

(assert (= (and b!1071455 res!714749) b!1071456))

(assert (= (and b!1071454 condMapEmpty!40438) mapIsEmpty!40438))

(assert (= (and b!1071454 (not condMapEmpty!40438)) mapNonEmpty!40438))

(get-info :version)

(assert (= (and mapNonEmpty!40438 ((_ is ValueCellFull!12207) mapValue!40438)) b!1071461))

(assert (= (and b!1071454 ((_ is ValueCellFull!12207) mapDefault!40438)) b!1071459))

(assert (= start!94758 b!1071454))

(declare-fun m!989969 () Bool)

(assert (=> b!1071458 m!989969))

(declare-fun m!989971 () Bool)

(assert (=> b!1071458 m!989971))

(declare-fun m!989973 () Bool)

(assert (=> b!1071458 m!989973))

(declare-fun m!989975 () Bool)

(assert (=> b!1071460 m!989975))

(declare-fun m!989977 () Bool)

(assert (=> b!1071455 m!989977))

(declare-fun m!989979 () Bool)

(assert (=> b!1071455 m!989979))

(declare-fun m!989981 () Bool)

(assert (=> b!1071455 m!989981))

(declare-fun m!989983 () Bool)

(assert (=> b!1071455 m!989983))

(assert (=> b!1071455 m!989979))

(declare-fun m!989985 () Bool)

(assert (=> b!1071455 m!989985))

(declare-fun m!989987 () Bool)

(assert (=> b!1071455 m!989987))

(declare-fun m!989989 () Bool)

(assert (=> b!1071455 m!989989))

(declare-fun m!989991 () Bool)

(assert (=> b!1071455 m!989991))

(declare-fun m!989993 () Bool)

(assert (=> b!1071455 m!989993))

(declare-fun m!989995 () Bool)

(assert (=> b!1071455 m!989995))

(declare-fun m!989997 () Bool)

(assert (=> mapNonEmpty!40438 m!989997))

(declare-fun m!989999 () Bool)

(assert (=> b!1071456 m!989999))

(declare-fun m!990001 () Bool)

(assert (=> b!1071453 m!990001))

(declare-fun m!990003 () Bool)

(assert (=> start!94758 m!990003))

(declare-fun m!990005 () Bool)

(assert (=> start!94758 m!990005))

(declare-fun m!990007 () Bool)

(assert (=> start!94758 m!990007))

(check-sat (not b!1071460) tp_is_empty!25821 (not mapNonEmpty!40438) (not b!1071456) (not b_next!22011) (not b!1071458) (not b!1071453) (not b!1071455) (not start!94758) b_and!34841)
(check-sat b_and!34841 (not b_next!22011))
