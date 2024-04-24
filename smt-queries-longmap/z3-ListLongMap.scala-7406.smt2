; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94464 () Bool)

(assert start!94464)

(declare-fun b_free!21613 () Bool)

(declare-fun b_next!21613 () Bool)

(assert (=> start!94464 (= b_free!21613 (not b_next!21613))))

(declare-fun tp!76277 () Bool)

(declare-fun b_and!34383 () Bool)

(assert (=> start!94464 (= tp!76277 b_and!34383)))

(declare-fun b!1066936 () Bool)

(declare-fun res!711814 () Bool)

(declare-fun e!608372 () Bool)

(assert (=> b!1066936 (=> (not res!711814) (not e!608372))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39033 0))(
  ( (V!39034 (val!12762 Int)) )
))
(declare-datatypes ((ValueCell!12008 0))(
  ( (ValueCellFull!12008 (v!15370 V!39033)) (EmptyCell!12008) )
))
(declare-datatypes ((array!67881 0))(
  ( (array!67882 (arr!32637 (Array (_ BitVec 32) ValueCell!12008)) (size!33174 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67881)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67883 0))(
  ( (array!67884 (arr!32638 (Array (_ BitVec 32) (_ BitVec 64))) (size!33175 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67883)

(assert (=> b!1066936 (= res!711814 (and (= (size!33174 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33175 _keys!1163) (size!33174 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066937 () Bool)

(declare-fun e!608370 () Bool)

(declare-fun e!608369 () Bool)

(declare-fun mapRes!39820 () Bool)

(assert (=> b!1066937 (= e!608370 (and e!608369 mapRes!39820))))

(declare-fun condMapEmpty!39820 () Bool)

(declare-fun mapDefault!39820 () ValueCell!12008)

(assert (=> b!1066937 (= condMapEmpty!39820 (= (arr!32637 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12008)) mapDefault!39820)))))

(declare-fun b!1066938 () Bool)

(declare-fun e!608371 () Bool)

(assert (=> b!1066938 (= e!608371 true)))

(declare-datatypes ((tuple2!16162 0))(
  ( (tuple2!16163 (_1!8092 (_ BitVec 64)) (_2!8092 V!39033)) )
))
(declare-datatypes ((List!22732 0))(
  ( (Nil!22729) (Cons!22728 (h!23946 tuple2!16162) (t!32043 List!22732)) )
))
(declare-datatypes ((ListLongMap!14139 0))(
  ( (ListLongMap!14140 (toList!7085 List!22732)) )
))
(declare-fun lt!470536 () ListLongMap!14139)

(declare-fun lt!470535 () ListLongMap!14139)

(declare-fun -!605 (ListLongMap!14139 (_ BitVec 64)) ListLongMap!14139)

(assert (=> b!1066938 (= lt!470536 (-!605 lt!470535 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470534 () ListLongMap!14139)

(declare-fun lt!470533 () ListLongMap!14139)

(assert (=> b!1066938 (= (-!605 lt!470534 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470533)))

(declare-datatypes ((Unit!34964 0))(
  ( (Unit!34965) )
))
(declare-fun lt!470538 () Unit!34964)

(declare-fun zeroValueBefore!47 () V!39033)

(declare-fun addThenRemoveForNewKeyIsSame!15 (ListLongMap!14139 (_ BitVec 64) V!39033) Unit!34964)

(assert (=> b!1066938 (= lt!470538 (addThenRemoveForNewKeyIsSame!15 lt!470533 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470540 () ListLongMap!14139)

(declare-fun lt!470537 () ListLongMap!14139)

(assert (=> b!1066938 (and (= lt!470535 lt!470534) (= lt!470537 lt!470540))))

(declare-fun +!3158 (ListLongMap!14139 tuple2!16162) ListLongMap!14139)

(assert (=> b!1066938 (= lt!470534 (+!3158 lt!470533 (tuple2!16163 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39033)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39033)

(declare-fun getCurrentListMap!4039 (array!67883 array!67881 (_ BitVec 32) (_ BitVec 32) V!39033 V!39033 (_ BitVec 32) Int) ListLongMap!14139)

(assert (=> b!1066938 (= lt!470537 (getCurrentListMap!4039 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066938 (= lt!470535 (getCurrentListMap!4039 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066939 () Bool)

(assert (=> b!1066939 (= e!608372 (not e!608371))))

(declare-fun res!711812 () Bool)

(assert (=> b!1066939 (=> res!711812 e!608371)))

(assert (=> b!1066939 (= res!711812 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066939 (= lt!470533 lt!470540)))

(declare-fun lt!470539 () Unit!34964)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!712 (array!67883 array!67881 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39033 V!39033 V!39033 V!39033 (_ BitVec 32) Int) Unit!34964)

(assert (=> b!1066939 (= lt!470539 (lemmaNoChangeToArrayThenSameMapNoExtras!712 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3709 (array!67883 array!67881 (_ BitVec 32) (_ BitVec 32) V!39033 V!39033 (_ BitVec 32) Int) ListLongMap!14139)

(assert (=> b!1066939 (= lt!470540 (getCurrentListMapNoExtraKeys!3709 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066939 (= lt!470533 (getCurrentListMapNoExtraKeys!3709 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39820 () Bool)

(declare-fun tp!76276 () Bool)

(declare-fun e!608368 () Bool)

(assert (=> mapNonEmpty!39820 (= mapRes!39820 (and tp!76276 e!608368))))

(declare-fun mapRest!39820 () (Array (_ BitVec 32) ValueCell!12008))

(declare-fun mapKey!39820 () (_ BitVec 32))

(declare-fun mapValue!39820 () ValueCell!12008)

(assert (=> mapNonEmpty!39820 (= (arr!32637 _values!955) (store mapRest!39820 mapKey!39820 mapValue!39820))))

(declare-fun b!1066940 () Bool)

(declare-fun tp_is_empty!25423 () Bool)

(assert (=> b!1066940 (= e!608369 tp_is_empty!25423)))

(declare-fun mapIsEmpty!39820 () Bool)

(assert (=> mapIsEmpty!39820 mapRes!39820))

(declare-fun b!1066942 () Bool)

(declare-fun res!711815 () Bool)

(assert (=> b!1066942 (=> (not res!711815) (not e!608372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67883 (_ BitVec 32)) Bool)

(assert (=> b!1066942 (= res!711815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066943 () Bool)

(declare-fun res!711816 () Bool)

(assert (=> b!1066943 (=> (not res!711816) (not e!608372))))

(declare-datatypes ((List!22733 0))(
  ( (Nil!22730) (Cons!22729 (h!23947 (_ BitVec 64)) (t!32044 List!22733)) )
))
(declare-fun arrayNoDuplicates!0 (array!67883 (_ BitVec 32) List!22733) Bool)

(assert (=> b!1066943 (= res!711816 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22730))))

(declare-fun res!711813 () Bool)

(assert (=> start!94464 (=> (not res!711813) (not e!608372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94464 (= res!711813 (validMask!0 mask!1515))))

(assert (=> start!94464 e!608372))

(assert (=> start!94464 true))

(assert (=> start!94464 tp_is_empty!25423))

(declare-fun array_inv!25296 (array!67881) Bool)

(assert (=> start!94464 (and (array_inv!25296 _values!955) e!608370)))

(assert (=> start!94464 tp!76277))

(declare-fun array_inv!25297 (array!67883) Bool)

(assert (=> start!94464 (array_inv!25297 _keys!1163)))

(declare-fun b!1066941 () Bool)

(assert (=> b!1066941 (= e!608368 tp_is_empty!25423)))

(assert (= (and start!94464 res!711813) b!1066936))

(assert (= (and b!1066936 res!711814) b!1066942))

(assert (= (and b!1066942 res!711815) b!1066943))

(assert (= (and b!1066943 res!711816) b!1066939))

(assert (= (and b!1066939 (not res!711812)) b!1066938))

(assert (= (and b!1066937 condMapEmpty!39820) mapIsEmpty!39820))

(assert (= (and b!1066937 (not condMapEmpty!39820)) mapNonEmpty!39820))

(get-info :version)

(assert (= (and mapNonEmpty!39820 ((_ is ValueCellFull!12008) mapValue!39820)) b!1066941))

(assert (= (and b!1066937 ((_ is ValueCellFull!12008) mapDefault!39820)) b!1066940))

(assert (= start!94464 b!1066937))

(declare-fun m!985781 () Bool)

(assert (=> b!1066938 m!985781))

(declare-fun m!985783 () Bool)

(assert (=> b!1066938 m!985783))

(declare-fun m!985785 () Bool)

(assert (=> b!1066938 m!985785))

(declare-fun m!985787 () Bool)

(assert (=> b!1066938 m!985787))

(declare-fun m!985789 () Bool)

(assert (=> b!1066938 m!985789))

(declare-fun m!985791 () Bool)

(assert (=> b!1066938 m!985791))

(declare-fun m!985793 () Bool)

(assert (=> start!94464 m!985793))

(declare-fun m!985795 () Bool)

(assert (=> start!94464 m!985795))

(declare-fun m!985797 () Bool)

(assert (=> start!94464 m!985797))

(declare-fun m!985799 () Bool)

(assert (=> b!1066942 m!985799))

(declare-fun m!985801 () Bool)

(assert (=> mapNonEmpty!39820 m!985801))

(declare-fun m!985803 () Bool)

(assert (=> b!1066939 m!985803))

(declare-fun m!985805 () Bool)

(assert (=> b!1066939 m!985805))

(declare-fun m!985807 () Bool)

(assert (=> b!1066939 m!985807))

(declare-fun m!985809 () Bool)

(assert (=> b!1066943 m!985809))

(check-sat (not b!1066943) (not b!1066938) b_and!34383 (not start!94464) tp_is_empty!25423 (not mapNonEmpty!39820) (not b_next!21613) (not b!1066939) (not b!1066942))
(check-sat b_and!34383 (not b_next!21613))
