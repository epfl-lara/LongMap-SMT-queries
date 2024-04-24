; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94458 () Bool)

(assert start!94458)

(declare-fun b_free!21607 () Bool)

(declare-fun b_next!21607 () Bool)

(assert (=> start!94458 (= b_free!21607 (not b_next!21607))))

(declare-fun tp!76258 () Bool)

(declare-fun b_and!34377 () Bool)

(assert (=> start!94458 (= tp!76258 b_and!34377)))

(declare-fun b!1066864 () Bool)

(declare-fun res!711770 () Bool)

(declare-fun e!608314 () Bool)

(assert (=> b!1066864 (=> (not res!711770) (not e!608314))))

(declare-datatypes ((array!67869 0))(
  ( (array!67870 (arr!32631 (Array (_ BitVec 32) (_ BitVec 64))) (size!33168 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67869)

(declare-datatypes ((List!22727 0))(
  ( (Nil!22724) (Cons!22723 (h!23941 (_ BitVec 64)) (t!32038 List!22727)) )
))
(declare-fun arrayNoDuplicates!0 (array!67869 (_ BitVec 32) List!22727) Bool)

(assert (=> b!1066864 (= res!711770 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22724))))

(declare-fun b!1066865 () Bool)

(declare-fun res!711769 () Bool)

(assert (=> b!1066865 (=> (not res!711769) (not e!608314))))

(declare-datatypes ((V!39025 0))(
  ( (V!39026 (val!12759 Int)) )
))
(declare-datatypes ((ValueCell!12005 0))(
  ( (ValueCellFull!12005 (v!15367 V!39025)) (EmptyCell!12005) )
))
(declare-datatypes ((array!67871 0))(
  ( (array!67872 (arr!32632 (Array (_ BitVec 32) ValueCell!12005)) (size!33169 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67871)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066865 (= res!711769 (and (= (size!33169 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33168 _keys!1163) (size!33169 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066866 () Bool)

(declare-fun e!608318 () Bool)

(declare-fun tp_is_empty!25417 () Bool)

(assert (=> b!1066866 (= e!608318 tp_is_empty!25417)))

(declare-fun b!1066867 () Bool)

(declare-fun e!608317 () Bool)

(assert (=> b!1066867 (= e!608317 tp_is_empty!25417)))

(declare-fun mapIsEmpty!39811 () Bool)

(declare-fun mapRes!39811 () Bool)

(assert (=> mapIsEmpty!39811 mapRes!39811))

(declare-fun b!1066868 () Bool)

(declare-fun e!608313 () Bool)

(assert (=> b!1066868 (= e!608313 true)))

(declare-datatypes ((tuple2!16156 0))(
  ( (tuple2!16157 (_1!8089 (_ BitVec 64)) (_2!8089 V!39025)) )
))
(declare-datatypes ((List!22728 0))(
  ( (Nil!22725) (Cons!22724 (h!23942 tuple2!16156) (t!32039 List!22728)) )
))
(declare-datatypes ((ListLongMap!14133 0))(
  ( (ListLongMap!14134 (toList!7082 List!22728)) )
))
(declare-fun lt!470466 () ListLongMap!14133)

(declare-fun lt!470468 () ListLongMap!14133)

(declare-fun -!602 (ListLongMap!14133 (_ BitVec 64)) ListLongMap!14133)

(assert (=> b!1066868 (= lt!470466 (-!602 lt!470468 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470464 () ListLongMap!14133)

(declare-fun lt!470467 () ListLongMap!14133)

(assert (=> b!1066868 (= (-!602 lt!470464 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470467)))

(declare-datatypes ((Unit!34958 0))(
  ( (Unit!34959) )
))
(declare-fun lt!470462 () Unit!34958)

(declare-fun zeroValueBefore!47 () V!39025)

(declare-fun addThenRemoveForNewKeyIsSame!12 (ListLongMap!14133 (_ BitVec 64) V!39025) Unit!34958)

(assert (=> b!1066868 (= lt!470462 (addThenRemoveForNewKeyIsSame!12 lt!470467 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470463 () ListLongMap!14133)

(declare-fun lt!470461 () ListLongMap!14133)

(assert (=> b!1066868 (and (= lt!470468 lt!470464) (= lt!470461 lt!470463))))

(declare-fun +!3155 (ListLongMap!14133 tuple2!16156) ListLongMap!14133)

(assert (=> b!1066868 (= lt!470464 (+!3155 lt!470467 (tuple2!16157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39025)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39025)

(declare-fun getCurrentListMap!4036 (array!67869 array!67871 (_ BitVec 32) (_ BitVec 32) V!39025 V!39025 (_ BitVec 32) Int) ListLongMap!14133)

(assert (=> b!1066868 (= lt!470461 (getCurrentListMap!4036 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066868 (= lt!470468 (getCurrentListMap!4036 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066869 () Bool)

(declare-fun e!608316 () Bool)

(assert (=> b!1066869 (= e!608316 (and e!608318 mapRes!39811))))

(declare-fun condMapEmpty!39811 () Bool)

(declare-fun mapDefault!39811 () ValueCell!12005)

(assert (=> b!1066869 (= condMapEmpty!39811 (= (arr!32632 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12005)) mapDefault!39811)))))

(declare-fun b!1066870 () Bool)

(declare-fun res!711767 () Bool)

(assert (=> b!1066870 (=> (not res!711767) (not e!608314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67869 (_ BitVec 32)) Bool)

(assert (=> b!1066870 (= res!711767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39811 () Bool)

(declare-fun tp!76259 () Bool)

(assert (=> mapNonEmpty!39811 (= mapRes!39811 (and tp!76259 e!608317))))

(declare-fun mapValue!39811 () ValueCell!12005)

(declare-fun mapKey!39811 () (_ BitVec 32))

(declare-fun mapRest!39811 () (Array (_ BitVec 32) ValueCell!12005))

(assert (=> mapNonEmpty!39811 (= (arr!32632 _values!955) (store mapRest!39811 mapKey!39811 mapValue!39811))))

(declare-fun b!1066871 () Bool)

(assert (=> b!1066871 (= e!608314 (not e!608313))))

(declare-fun res!711768 () Bool)

(assert (=> b!1066871 (=> res!711768 e!608313)))

(assert (=> b!1066871 (= res!711768 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066871 (= lt!470467 lt!470463)))

(declare-fun lt!470465 () Unit!34958)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!711 (array!67869 array!67871 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39025 V!39025 V!39025 V!39025 (_ BitVec 32) Int) Unit!34958)

(assert (=> b!1066871 (= lt!470465 (lemmaNoChangeToArrayThenSameMapNoExtras!711 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3708 (array!67869 array!67871 (_ BitVec 32) (_ BitVec 32) V!39025 V!39025 (_ BitVec 32) Int) ListLongMap!14133)

(assert (=> b!1066871 (= lt!470463 (getCurrentListMapNoExtraKeys!3708 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066871 (= lt!470467 (getCurrentListMapNoExtraKeys!3708 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711771 () Bool)

(assert (=> start!94458 (=> (not res!711771) (not e!608314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94458 (= res!711771 (validMask!0 mask!1515))))

(assert (=> start!94458 e!608314))

(assert (=> start!94458 true))

(assert (=> start!94458 tp_is_empty!25417))

(declare-fun array_inv!25292 (array!67871) Bool)

(assert (=> start!94458 (and (array_inv!25292 _values!955) e!608316)))

(assert (=> start!94458 tp!76258))

(declare-fun array_inv!25293 (array!67869) Bool)

(assert (=> start!94458 (array_inv!25293 _keys!1163)))

(assert (= (and start!94458 res!711771) b!1066865))

(assert (= (and b!1066865 res!711769) b!1066870))

(assert (= (and b!1066870 res!711767) b!1066864))

(assert (= (and b!1066864 res!711770) b!1066871))

(assert (= (and b!1066871 (not res!711768)) b!1066868))

(assert (= (and b!1066869 condMapEmpty!39811) mapIsEmpty!39811))

(assert (= (and b!1066869 (not condMapEmpty!39811)) mapNonEmpty!39811))

(get-info :version)

(assert (= (and mapNonEmpty!39811 ((_ is ValueCellFull!12005) mapValue!39811)) b!1066867))

(assert (= (and b!1066869 ((_ is ValueCellFull!12005) mapDefault!39811)) b!1066866))

(assert (= start!94458 b!1066869))

(declare-fun m!985691 () Bool)

(assert (=> mapNonEmpty!39811 m!985691))

(declare-fun m!985693 () Bool)

(assert (=> b!1066868 m!985693))

(declare-fun m!985695 () Bool)

(assert (=> b!1066868 m!985695))

(declare-fun m!985697 () Bool)

(assert (=> b!1066868 m!985697))

(declare-fun m!985699 () Bool)

(assert (=> b!1066868 m!985699))

(declare-fun m!985701 () Bool)

(assert (=> b!1066868 m!985701))

(declare-fun m!985703 () Bool)

(assert (=> b!1066868 m!985703))

(declare-fun m!985705 () Bool)

(assert (=> b!1066864 m!985705))

(declare-fun m!985707 () Bool)

(assert (=> start!94458 m!985707))

(declare-fun m!985709 () Bool)

(assert (=> start!94458 m!985709))

(declare-fun m!985711 () Bool)

(assert (=> start!94458 m!985711))

(declare-fun m!985713 () Bool)

(assert (=> b!1066871 m!985713))

(declare-fun m!985715 () Bool)

(assert (=> b!1066871 m!985715))

(declare-fun m!985717 () Bool)

(assert (=> b!1066871 m!985717))

(declare-fun m!985719 () Bool)

(assert (=> b!1066870 m!985719))

(check-sat (not b!1066864) (not mapNonEmpty!39811) (not b!1066868) tp_is_empty!25417 (not start!94458) (not b!1066871) b_and!34377 (not b_next!21607) (not b!1066870))
(check-sat b_and!34377 (not b_next!21607))
