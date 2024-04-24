; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95070 () Bool)

(assert start!95070)

(declare-fun b_free!22063 () Bool)

(declare-fun b_next!22063 () Bool)

(assert (=> start!95070 (= b_free!22063 (not b_next!22063))))

(declare-fun tp!77651 () Bool)

(declare-fun b_and!34915 () Bool)

(assert (=> start!95070 (= tp!77651 b_and!34915)))

(declare-fun b!1073674 () Bool)

(declare-fun e!613332 () Bool)

(declare-fun tp_is_empty!25873 () Bool)

(assert (=> b!1073674 (= e!613332 tp_is_empty!25873)))

(declare-datatypes ((V!39633 0))(
  ( (V!39634 (val!12987 Int)) )
))
(declare-datatypes ((tuple2!16512 0))(
  ( (tuple2!16513 (_1!8267 (_ BitVec 64)) (_2!8267 V!39633)) )
))
(declare-datatypes ((List!23070 0))(
  ( (Nil!23067) (Cons!23066 (h!24284 tuple2!16512) (t!32397 List!23070)) )
))
(declare-datatypes ((ListLongMap!14489 0))(
  ( (ListLongMap!14490 (toList!7260 List!23070)) )
))
(declare-fun lt!475789 () ListLongMap!14489)

(declare-fun lt!475788 () tuple2!16512)

(declare-fun lt!475786 () ListLongMap!14489)

(declare-fun e!613330 () Bool)

(declare-fun b!1073675 () Bool)

(declare-fun +!3223 (ListLongMap!14489 tuple2!16512) ListLongMap!14489)

(assert (=> b!1073675 (= e!613330 (= lt!475789 (+!3223 lt!475786 lt!475788)))))

(declare-fun b!1073676 () Bool)

(declare-fun res!715829 () Bool)

(declare-fun e!613328 () Bool)

(assert (=> b!1073676 (=> (not res!715829) (not e!613328))))

(declare-datatypes ((array!68757 0))(
  ( (array!68758 (arr!33067 (Array (_ BitVec 32) (_ BitVec 64))) (size!33604 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68757)

(declare-datatypes ((List!23071 0))(
  ( (Nil!23068) (Cons!23067 (h!24285 (_ BitVec 64)) (t!32398 List!23071)) )
))
(declare-fun arrayNoDuplicates!0 (array!68757 (_ BitVec 32) List!23071) Bool)

(assert (=> b!1073676 (= res!715829 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23068))))

(declare-fun res!715831 () Bool)

(assert (=> start!95070 (=> (not res!715831) (not e!613328))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95070 (= res!715831 (validMask!0 mask!1515))))

(assert (=> start!95070 e!613328))

(assert (=> start!95070 true))

(assert (=> start!95070 tp_is_empty!25873))

(declare-datatypes ((ValueCell!12233 0))(
  ( (ValueCellFull!12233 (v!15600 V!39633)) (EmptyCell!12233) )
))
(declare-datatypes ((array!68759 0))(
  ( (array!68760 (arr!33068 (Array (_ BitVec 32) ValueCell!12233)) (size!33605 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68759)

(declare-fun e!613333 () Bool)

(declare-fun array_inv!25596 (array!68759) Bool)

(assert (=> start!95070 (and (array_inv!25596 _values!955) e!613333)))

(assert (=> start!95070 tp!77651))

(declare-fun array_inv!25597 (array!68757) Bool)

(assert (=> start!95070 (array_inv!25597 _keys!1163)))

(declare-fun b!1073677 () Bool)

(declare-fun e!613331 () Bool)

(assert (=> b!1073677 (= e!613331 true)))

(declare-fun lt!475793 () ListLongMap!14489)

(declare-fun lt!475784 () ListLongMap!14489)

(declare-fun -!689 (ListLongMap!14489 (_ BitVec 64)) ListLongMap!14489)

(assert (=> b!1073677 (= lt!475793 (-!689 lt!475784 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475796 () ListLongMap!14489)

(declare-fun lt!475791 () ListLongMap!14489)

(assert (=> b!1073677 (= lt!475796 lt!475791)))

(declare-fun zeroValueBefore!47 () V!39633)

(declare-fun lt!475794 () ListLongMap!14489)

(declare-fun minValue!907 () V!39633)

(declare-datatypes ((Unit!35299 0))(
  ( (Unit!35300) )
))
(declare-fun lt!475792 () Unit!35299)

(declare-fun addCommutativeForDiffKeys!746 (ListLongMap!14489 (_ BitVec 64) V!39633 (_ BitVec 64) V!39633) Unit!35299)

(assert (=> b!1073677 (= lt!475792 (addCommutativeForDiffKeys!746 lt!475794 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475795 () ListLongMap!14489)

(assert (=> b!1073677 (= (-!689 lt!475791 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475795)))

(declare-fun lt!475790 () tuple2!16512)

(assert (=> b!1073677 (= lt!475791 (+!3223 lt!475795 lt!475790))))

(declare-fun lt!475787 () Unit!35299)

(declare-fun addThenRemoveForNewKeyIsSame!64 (ListLongMap!14489 (_ BitVec 64) V!39633) Unit!35299)

(assert (=> b!1073677 (= lt!475787 (addThenRemoveForNewKeyIsSame!64 lt!475795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1073677 (= lt!475795 (+!3223 lt!475794 lt!475788))))

(assert (=> b!1073677 e!613330))

(declare-fun res!715830 () Bool)

(assert (=> b!1073677 (=> (not res!715830) (not e!613330))))

(assert (=> b!1073677 (= res!715830 (= lt!475784 lt!475796))))

(assert (=> b!1073677 (= lt!475796 (+!3223 (+!3223 lt!475794 lt!475790) lt!475788))))

(assert (=> b!1073677 (= lt!475788 (tuple2!16513 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1073677 (= lt!475790 (tuple2!16513 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39633)

(declare-fun getCurrentListMap!4150 (array!68757 array!68759 (_ BitVec 32) (_ BitVec 32) V!39633 V!39633 (_ BitVec 32) Int) ListLongMap!14489)

(assert (=> b!1073677 (= lt!475789 (getCurrentListMap!4150 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073677 (= lt!475784 (getCurrentListMap!4150 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073678 () Bool)

(assert (=> b!1073678 (= e!613328 (not e!613331))))

(declare-fun res!715832 () Bool)

(assert (=> b!1073678 (=> res!715832 e!613331)))

(assert (=> b!1073678 (= res!715832 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1073678 (= lt!475794 lt!475786)))

(declare-fun lt!475785 () Unit!35299)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!864 (array!68757 array!68759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39633 V!39633 V!39633 V!39633 (_ BitVec 32) Int) Unit!35299)

(assert (=> b!1073678 (= lt!475785 (lemmaNoChangeToArrayThenSameMapNoExtras!864 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3861 (array!68757 array!68759 (_ BitVec 32) (_ BitVec 32) V!39633 V!39633 (_ BitVec 32) Int) ListLongMap!14489)

(assert (=> b!1073678 (= lt!475786 (getCurrentListMapNoExtraKeys!3861 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073678 (= lt!475794 (getCurrentListMapNoExtraKeys!3861 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073679 () Bool)

(declare-fun res!715834 () Bool)

(assert (=> b!1073679 (=> (not res!715834) (not e!613328))))

(assert (=> b!1073679 (= res!715834 (and (= (size!33605 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33604 _keys!1163) (size!33605 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073680 () Bool)

(declare-fun res!715833 () Bool)

(assert (=> b!1073680 (=> (not res!715833) (not e!613328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68757 (_ BitVec 32)) Bool)

(assert (=> b!1073680 (= res!715833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073681 () Bool)

(declare-fun e!613334 () Bool)

(assert (=> b!1073681 (= e!613334 tp_is_empty!25873)))

(declare-fun mapNonEmpty!40519 () Bool)

(declare-fun mapRes!40519 () Bool)

(declare-fun tp!77650 () Bool)

(assert (=> mapNonEmpty!40519 (= mapRes!40519 (and tp!77650 e!613334))))

(declare-fun mapValue!40519 () ValueCell!12233)

(declare-fun mapKey!40519 () (_ BitVec 32))

(declare-fun mapRest!40519 () (Array (_ BitVec 32) ValueCell!12233))

(assert (=> mapNonEmpty!40519 (= (arr!33068 _values!955) (store mapRest!40519 mapKey!40519 mapValue!40519))))

(declare-fun b!1073682 () Bool)

(assert (=> b!1073682 (= e!613333 (and e!613332 mapRes!40519))))

(declare-fun condMapEmpty!40519 () Bool)

(declare-fun mapDefault!40519 () ValueCell!12233)

(assert (=> b!1073682 (= condMapEmpty!40519 (= (arr!33068 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12233)) mapDefault!40519)))))

(declare-fun mapIsEmpty!40519 () Bool)

(assert (=> mapIsEmpty!40519 mapRes!40519))

(assert (= (and start!95070 res!715831) b!1073679))

(assert (= (and b!1073679 res!715834) b!1073680))

(assert (= (and b!1073680 res!715833) b!1073676))

(assert (= (and b!1073676 res!715829) b!1073678))

(assert (= (and b!1073678 (not res!715832)) b!1073677))

(assert (= (and b!1073677 res!715830) b!1073675))

(assert (= (and b!1073682 condMapEmpty!40519) mapIsEmpty!40519))

(assert (= (and b!1073682 (not condMapEmpty!40519)) mapNonEmpty!40519))

(get-info :version)

(assert (= (and mapNonEmpty!40519 ((_ is ValueCellFull!12233) mapValue!40519)) b!1073681))

(assert (= (and b!1073682 ((_ is ValueCellFull!12233) mapDefault!40519)) b!1073674))

(assert (= start!95070 b!1073682))

(declare-fun m!992925 () Bool)

(assert (=> b!1073680 m!992925))

(declare-fun m!992927 () Bool)

(assert (=> b!1073678 m!992927))

(declare-fun m!992929 () Bool)

(assert (=> b!1073678 m!992929))

(declare-fun m!992931 () Bool)

(assert (=> b!1073678 m!992931))

(declare-fun m!992933 () Bool)

(assert (=> b!1073675 m!992933))

(declare-fun m!992935 () Bool)

(assert (=> mapNonEmpty!40519 m!992935))

(declare-fun m!992937 () Bool)

(assert (=> b!1073677 m!992937))

(declare-fun m!992939 () Bool)

(assert (=> b!1073677 m!992939))

(declare-fun m!992941 () Bool)

(assert (=> b!1073677 m!992941))

(declare-fun m!992943 () Bool)

(assert (=> b!1073677 m!992943))

(declare-fun m!992945 () Bool)

(assert (=> b!1073677 m!992945))

(declare-fun m!992947 () Bool)

(assert (=> b!1073677 m!992947))

(declare-fun m!992949 () Bool)

(assert (=> b!1073677 m!992949))

(declare-fun m!992951 () Bool)

(assert (=> b!1073677 m!992951))

(declare-fun m!992953 () Bool)

(assert (=> b!1073677 m!992953))

(assert (=> b!1073677 m!992941))

(declare-fun m!992955 () Bool)

(assert (=> b!1073677 m!992955))

(declare-fun m!992957 () Bool)

(assert (=> b!1073676 m!992957))

(declare-fun m!992959 () Bool)

(assert (=> start!95070 m!992959))

(declare-fun m!992961 () Bool)

(assert (=> start!95070 m!992961))

(declare-fun m!992963 () Bool)

(assert (=> start!95070 m!992963))

(check-sat (not b!1073678) (not b_next!22063) (not mapNonEmpty!40519) (not b!1073677) (not b!1073676) (not b!1073675) (not start!95070) tp_is_empty!25873 b_and!34915 (not b!1073680))
(check-sat b_and!34915 (not b_next!22063))
