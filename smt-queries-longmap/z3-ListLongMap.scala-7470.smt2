; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94746 () Bool)

(assert start!94746)

(declare-fun b_free!21999 () Bool)

(declare-fun b_next!21999 () Bool)

(assert (=> start!94746 (= b_free!21999 (not b_next!21999))))

(declare-fun tp!77455 () Bool)

(declare-fun b_and!34829 () Bool)

(assert (=> start!94746 (= tp!77455 b_and!34829)))

(declare-fun b!1071291 () Bool)

(declare-fun res!714643 () Bool)

(declare-fun e!611684 () Bool)

(assert (=> b!1071291 (=> (not res!714643) (not e!611684))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39547 0))(
  ( (V!39548 (val!12955 Int)) )
))
(declare-datatypes ((ValueCell!12201 0))(
  ( (ValueCellFull!12201 (v!15571 V!39547)) (EmptyCell!12201) )
))
(declare-datatypes ((array!68593 0))(
  ( (array!68594 (arr!32992 (Array (_ BitVec 32) ValueCell!12201)) (size!33528 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68593)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68595 0))(
  ( (array!68596 (arr!32993 (Array (_ BitVec 32) (_ BitVec 64))) (size!33529 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68595)

(assert (=> b!1071291 (= res!714643 (and (= (size!33528 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33529 _keys!1163) (size!33528 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40420 () Bool)

(declare-fun mapRes!40420 () Bool)

(assert (=> mapIsEmpty!40420 mapRes!40420))

(declare-fun b!1071292 () Bool)

(declare-fun e!611679 () Bool)

(declare-fun e!611680 () Bool)

(assert (=> b!1071292 (= e!611679 (and e!611680 mapRes!40420))))

(declare-fun condMapEmpty!40420 () Bool)

(declare-fun mapDefault!40420 () ValueCell!12201)

(assert (=> b!1071292 (= condMapEmpty!40420 (= (arr!32992 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12201)) mapDefault!40420)))))

(declare-fun mapNonEmpty!40420 () Bool)

(declare-fun tp!77456 () Bool)

(declare-fun e!611678 () Bool)

(assert (=> mapNonEmpty!40420 (= mapRes!40420 (and tp!77456 e!611678))))

(declare-fun mapRest!40420 () (Array (_ BitVec 32) ValueCell!12201))

(declare-fun mapKey!40420 () (_ BitVec 32))

(declare-fun mapValue!40420 () ValueCell!12201)

(assert (=> mapNonEmpty!40420 (= (arr!32992 _values!955) (store mapRest!40420 mapKey!40420 mapValue!40420))))

(declare-fun b!1071293 () Bool)

(declare-fun res!714642 () Bool)

(assert (=> b!1071293 (=> (not res!714642) (not e!611684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68595 (_ BitVec 32)) Bool)

(assert (=> b!1071293 (= res!714642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071294 () Bool)

(declare-fun e!611682 () Bool)

(assert (=> b!1071294 (= e!611684 (not e!611682))))

(declare-fun res!714641 () Bool)

(assert (=> b!1071294 (=> res!714641 e!611682)))

(assert (=> b!1071294 (= res!714641 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16488 0))(
  ( (tuple2!16489 (_1!8255 (_ BitVec 64)) (_2!8255 V!39547)) )
))
(declare-datatypes ((List!23029 0))(
  ( (Nil!23026) (Cons!23025 (h!24234 tuple2!16488) (t!32362 List!23029)) )
))
(declare-datatypes ((ListLongMap!14457 0))(
  ( (ListLongMap!14458 (toList!7244 List!23029)) )
))
(declare-fun lt!473865 () ListLongMap!14457)

(declare-fun lt!473873 () ListLongMap!14457)

(assert (=> b!1071294 (= lt!473865 lt!473873)))

(declare-fun zeroValueBefore!47 () V!39547)

(declare-datatypes ((Unit!35284 0))(
  ( (Unit!35285) )
))
(declare-fun lt!473870 () Unit!35284)

(declare-fun minValue!907 () V!39547)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39547)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!852 (array!68595 array!68593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39547 V!39547 V!39547 V!39547 (_ BitVec 32) Int) Unit!35284)

(assert (=> b!1071294 (= lt!473870 (lemmaNoChangeToArrayThenSameMapNoExtras!852 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3815 (array!68595 array!68593 (_ BitVec 32) (_ BitVec 32) V!39547 V!39547 (_ BitVec 32) Int) ListLongMap!14457)

(assert (=> b!1071294 (= lt!473873 (getCurrentListMapNoExtraKeys!3815 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071294 (= lt!473865 (getCurrentListMapNoExtraKeys!3815 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071295 () Bool)

(assert (=> b!1071295 (= e!611682 true)))

(declare-fun lt!473866 () ListLongMap!14457)

(declare-fun lt!473876 () ListLongMap!14457)

(declare-fun -!678 (ListLongMap!14457 (_ BitVec 64)) ListLongMap!14457)

(assert (=> b!1071295 (= lt!473866 (-!678 lt!473876 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473875 () ListLongMap!14457)

(declare-fun lt!473864 () ListLongMap!14457)

(assert (=> b!1071295 (= lt!473875 lt!473864)))

(declare-fun lt!473869 () Unit!35284)

(declare-fun addCommutativeForDiffKeys!723 (ListLongMap!14457 (_ BitVec 64) V!39547 (_ BitVec 64) V!39547) Unit!35284)

(assert (=> b!1071295 (= lt!473869 (addCommutativeForDiffKeys!723 lt!473865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473872 () ListLongMap!14457)

(assert (=> b!1071295 (= (-!678 lt!473864 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473872)))

(declare-fun lt!473871 () tuple2!16488)

(declare-fun +!3179 (ListLongMap!14457 tuple2!16488) ListLongMap!14457)

(assert (=> b!1071295 (= lt!473864 (+!3179 lt!473872 lt!473871))))

(declare-fun lt!473867 () Unit!35284)

(declare-fun addThenRemoveForNewKeyIsSame!48 (ListLongMap!14457 (_ BitVec 64) V!39547) Unit!35284)

(assert (=> b!1071295 (= lt!473867 (addThenRemoveForNewKeyIsSame!48 lt!473872 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473874 () tuple2!16488)

(assert (=> b!1071295 (= lt!473872 (+!3179 lt!473865 lt!473874))))

(declare-fun e!611683 () Bool)

(assert (=> b!1071295 e!611683))

(declare-fun res!714644 () Bool)

(assert (=> b!1071295 (=> (not res!714644) (not e!611683))))

(assert (=> b!1071295 (= res!714644 (= lt!473876 lt!473875))))

(assert (=> b!1071295 (= lt!473875 (+!3179 (+!3179 lt!473865 lt!473871) lt!473874))))

(assert (=> b!1071295 (= lt!473874 (tuple2!16489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071295 (= lt!473871 (tuple2!16489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473868 () ListLongMap!14457)

(declare-fun getCurrentListMap!4144 (array!68595 array!68593 (_ BitVec 32) (_ BitVec 32) V!39547 V!39547 (_ BitVec 32) Int) ListLongMap!14457)

(assert (=> b!1071295 (= lt!473868 (getCurrentListMap!4144 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071295 (= lt!473876 (getCurrentListMap!4144 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071296 () Bool)

(declare-fun res!714645 () Bool)

(assert (=> b!1071296 (=> (not res!714645) (not e!611684))))

(declare-datatypes ((List!23030 0))(
  ( (Nil!23027) (Cons!23026 (h!24235 (_ BitVec 64)) (t!32363 List!23030)) )
))
(declare-fun arrayNoDuplicates!0 (array!68595 (_ BitVec 32) List!23030) Bool)

(assert (=> b!1071296 (= res!714645 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23027))))

(declare-fun b!1071298 () Bool)

(declare-fun tp_is_empty!25809 () Bool)

(assert (=> b!1071298 (= e!611678 tp_is_empty!25809)))

(declare-fun b!1071299 () Bool)

(assert (=> b!1071299 (= e!611683 (= lt!473868 (+!3179 lt!473873 lt!473874)))))

(declare-fun b!1071297 () Bool)

(assert (=> b!1071297 (= e!611680 tp_is_empty!25809)))

(declare-fun res!714646 () Bool)

(assert (=> start!94746 (=> (not res!714646) (not e!611684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94746 (= res!714646 (validMask!0 mask!1515))))

(assert (=> start!94746 e!611684))

(assert (=> start!94746 true))

(assert (=> start!94746 tp_is_empty!25809))

(declare-fun array_inv!25514 (array!68593) Bool)

(assert (=> start!94746 (and (array_inv!25514 _values!955) e!611679)))

(assert (=> start!94746 tp!77455))

(declare-fun array_inv!25515 (array!68595) Bool)

(assert (=> start!94746 (array_inv!25515 _keys!1163)))

(assert (= (and start!94746 res!714646) b!1071291))

(assert (= (and b!1071291 res!714643) b!1071293))

(assert (= (and b!1071293 res!714642) b!1071296))

(assert (= (and b!1071296 res!714645) b!1071294))

(assert (= (and b!1071294 (not res!714641)) b!1071295))

(assert (= (and b!1071295 res!714644) b!1071299))

(assert (= (and b!1071292 condMapEmpty!40420) mapIsEmpty!40420))

(assert (= (and b!1071292 (not condMapEmpty!40420)) mapNonEmpty!40420))

(get-info :version)

(assert (= (and mapNonEmpty!40420 ((_ is ValueCellFull!12201) mapValue!40420)) b!1071298))

(assert (= (and b!1071292 ((_ is ValueCellFull!12201) mapDefault!40420)) b!1071297))

(assert (= start!94746 b!1071292))

(declare-fun m!989729 () Bool)

(assert (=> b!1071295 m!989729))

(declare-fun m!989731 () Bool)

(assert (=> b!1071295 m!989731))

(declare-fun m!989733 () Bool)

(assert (=> b!1071295 m!989733))

(declare-fun m!989735 () Bool)

(assert (=> b!1071295 m!989735))

(declare-fun m!989737 () Bool)

(assert (=> b!1071295 m!989737))

(declare-fun m!989739 () Bool)

(assert (=> b!1071295 m!989739))

(declare-fun m!989741 () Bool)

(assert (=> b!1071295 m!989741))

(assert (=> b!1071295 m!989731))

(declare-fun m!989743 () Bool)

(assert (=> b!1071295 m!989743))

(declare-fun m!989745 () Bool)

(assert (=> b!1071295 m!989745))

(declare-fun m!989747 () Bool)

(assert (=> b!1071295 m!989747))

(declare-fun m!989749 () Bool)

(assert (=> b!1071299 m!989749))

(declare-fun m!989751 () Bool)

(assert (=> b!1071296 m!989751))

(declare-fun m!989753 () Bool)

(assert (=> b!1071293 m!989753))

(declare-fun m!989755 () Bool)

(assert (=> start!94746 m!989755))

(declare-fun m!989757 () Bool)

(assert (=> start!94746 m!989757))

(declare-fun m!989759 () Bool)

(assert (=> start!94746 m!989759))

(declare-fun m!989761 () Bool)

(assert (=> b!1071294 m!989761))

(declare-fun m!989763 () Bool)

(assert (=> b!1071294 m!989763))

(declare-fun m!989765 () Bool)

(assert (=> b!1071294 m!989765))

(declare-fun m!989767 () Bool)

(assert (=> mapNonEmpty!40420 m!989767))

(check-sat (not b!1071295) tp_is_empty!25809 (not b!1071294) (not start!94746) (not b!1071299) (not b_next!21999) b_and!34829 (not b!1071293) (not b!1071296) (not mapNonEmpty!40420))
(check-sat b_and!34829 (not b_next!21999))
