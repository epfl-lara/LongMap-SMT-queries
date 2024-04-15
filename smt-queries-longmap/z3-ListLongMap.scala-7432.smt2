; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94436 () Bool)

(assert start!94436)

(declare-fun b_free!21769 () Bool)

(declare-fun b_next!21769 () Bool)

(assert (=> start!94436 (= b_free!21769 (not b_next!21769))))

(declare-fun tp!76754 () Bool)

(declare-fun b_and!34535 () Bool)

(assert (=> start!94436 (= tp!76754 b_and!34535)))

(declare-fun b!1067729 () Bool)

(declare-fun e!609069 () Bool)

(assert (=> b!1067729 (= e!609069 true)))

(declare-datatypes ((V!39241 0))(
  ( (V!39242 (val!12840 Int)) )
))
(declare-datatypes ((tuple2!16356 0))(
  ( (tuple2!16357 (_1!8189 (_ BitVec 64)) (_2!8189 V!39241)) )
))
(declare-datatypes ((List!22896 0))(
  ( (Nil!22893) (Cons!22892 (h!24101 tuple2!16356) (t!32212 List!22896)) )
))
(declare-datatypes ((ListLongMap!14325 0))(
  ( (ListLongMap!14326 (toList!7178 List!22896)) )
))
(declare-fun lt!471478 () ListLongMap!14325)

(declare-fun -!625 (ListLongMap!14325 (_ BitVec 64)) ListLongMap!14325)

(assert (=> b!1067729 (= (-!625 lt!471478 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471478)))

(declare-datatypes ((Unit!34946 0))(
  ( (Unit!34947) )
))
(declare-fun lt!471481 () Unit!34946)

(declare-fun removeNotPresentStillSame!42 (ListLongMap!14325 (_ BitVec 64)) Unit!34946)

(assert (=> b!1067729 (= lt!471481 (removeNotPresentStillSame!42 lt!471478 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067730 () Bool)

(declare-fun res!712536 () Bool)

(declare-fun e!609065 () Bool)

(assert (=> b!1067730 (=> (not res!712536) (not e!609065))))

(declare-datatypes ((array!68084 0))(
  ( (array!68085 (arr!32742 (Array (_ BitVec 32) (_ BitVec 64))) (size!33280 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68084)

(declare-datatypes ((List!22897 0))(
  ( (Nil!22894) (Cons!22893 (h!24102 (_ BitVec 64)) (t!32213 List!22897)) )
))
(declare-fun arrayNoDuplicates!0 (array!68084 (_ BitVec 32) List!22897) Bool)

(assert (=> b!1067730 (= res!712536 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22894))))

(declare-fun mapIsEmpty!40063 () Bool)

(declare-fun mapRes!40063 () Bool)

(assert (=> mapIsEmpty!40063 mapRes!40063))

(declare-fun b!1067731 () Bool)

(declare-fun res!712537 () Bool)

(assert (=> b!1067731 (=> (not res!712537) (not e!609065))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68084 (_ BitVec 32)) Bool)

(assert (=> b!1067731 (= res!712537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067732 () Bool)

(declare-fun res!712535 () Bool)

(assert (=> b!1067732 (=> (not res!712535) (not e!609065))))

(declare-datatypes ((ValueCell!12086 0))(
  ( (ValueCellFull!12086 (v!15453 V!39241)) (EmptyCell!12086) )
))
(declare-datatypes ((array!68086 0))(
  ( (array!68087 (arr!32743 (Array (_ BitVec 32) ValueCell!12086)) (size!33281 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68086)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067732 (= res!712535 (and (= (size!33281 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33280 _keys!1163) (size!33281 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067733 () Bool)

(declare-fun e!609064 () Bool)

(assert (=> b!1067733 (= e!609065 (not e!609064))))

(declare-fun res!712539 () Bool)

(assert (=> b!1067733 (=> res!712539 e!609064)))

(assert (=> b!1067733 (= res!712539 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471480 () ListLongMap!14325)

(declare-fun lt!471479 () ListLongMap!14325)

(assert (=> b!1067733 (= lt!471480 lt!471479)))

(declare-fun zeroValueBefore!47 () V!39241)

(declare-fun lt!471482 () Unit!34946)

(declare-fun minValue!907 () V!39241)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39241)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!767 (array!68084 array!68086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39241 V!39241 V!39241 V!39241 (_ BitVec 32) Int) Unit!34946)

(assert (=> b!1067733 (= lt!471482 (lemmaNoChangeToArrayThenSameMapNoExtras!767 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3773 (array!68084 array!68086 (_ BitVec 32) (_ BitVec 32) V!39241 V!39241 (_ BitVec 32) Int) ListLongMap!14325)

(assert (=> b!1067733 (= lt!471479 (getCurrentListMapNoExtraKeys!3773 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067733 (= lt!471480 (getCurrentListMapNoExtraKeys!3773 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067734 () Bool)

(declare-fun e!609067 () Bool)

(declare-fun e!609070 () Bool)

(assert (=> b!1067734 (= e!609067 (and e!609070 mapRes!40063))))

(declare-fun condMapEmpty!40063 () Bool)

(declare-fun mapDefault!40063 () ValueCell!12086)

(assert (=> b!1067734 (= condMapEmpty!40063 (= (arr!32743 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12086)) mapDefault!40063)))))

(declare-fun res!712534 () Bool)

(assert (=> start!94436 (=> (not res!712534) (not e!609065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94436 (= res!712534 (validMask!0 mask!1515))))

(assert (=> start!94436 e!609065))

(assert (=> start!94436 true))

(declare-fun tp_is_empty!25579 () Bool)

(assert (=> start!94436 tp_is_empty!25579))

(declare-fun array_inv!25344 (array!68086) Bool)

(assert (=> start!94436 (and (array_inv!25344 _values!955) e!609067)))

(assert (=> start!94436 tp!76754))

(declare-fun array_inv!25345 (array!68084) Bool)

(assert (=> start!94436 (array_inv!25345 _keys!1163)))

(declare-fun b!1067735 () Bool)

(declare-fun e!609068 () Bool)

(assert (=> b!1067735 (= e!609068 tp_is_empty!25579)))

(declare-fun b!1067736 () Bool)

(assert (=> b!1067736 (= e!609070 tp_is_empty!25579)))

(declare-fun b!1067737 () Bool)

(assert (=> b!1067737 (= e!609064 e!609069)))

(declare-fun res!712538 () Bool)

(assert (=> b!1067737 (=> res!712538 e!609069)))

(declare-fun contains!6254 (ListLongMap!14325 (_ BitVec 64)) Bool)

(assert (=> b!1067737 (= res!712538 (contains!6254 lt!471478 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4023 (array!68084 array!68086 (_ BitVec 32) (_ BitVec 32) V!39241 V!39241 (_ BitVec 32) Int) ListLongMap!14325)

(assert (=> b!1067737 (= lt!471478 (getCurrentListMap!4023 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40063 () Bool)

(declare-fun tp!76753 () Bool)

(assert (=> mapNonEmpty!40063 (= mapRes!40063 (and tp!76753 e!609068))))

(declare-fun mapKey!40063 () (_ BitVec 32))

(declare-fun mapRest!40063 () (Array (_ BitVec 32) ValueCell!12086))

(declare-fun mapValue!40063 () ValueCell!12086)

(assert (=> mapNonEmpty!40063 (= (arr!32743 _values!955) (store mapRest!40063 mapKey!40063 mapValue!40063))))

(assert (= (and start!94436 res!712534) b!1067732))

(assert (= (and b!1067732 res!712535) b!1067731))

(assert (= (and b!1067731 res!712537) b!1067730))

(assert (= (and b!1067730 res!712536) b!1067733))

(assert (= (and b!1067733 (not res!712539)) b!1067737))

(assert (= (and b!1067737 (not res!712538)) b!1067729))

(assert (= (and b!1067734 condMapEmpty!40063) mapIsEmpty!40063))

(assert (= (and b!1067734 (not condMapEmpty!40063)) mapNonEmpty!40063))

(get-info :version)

(assert (= (and mapNonEmpty!40063 ((_ is ValueCellFull!12086) mapValue!40063)) b!1067735))

(assert (= (and b!1067734 ((_ is ValueCellFull!12086) mapDefault!40063)) b!1067736))

(assert (= start!94436 b!1067734))

(declare-fun m!985873 () Bool)

(assert (=> b!1067733 m!985873))

(declare-fun m!985875 () Bool)

(assert (=> b!1067733 m!985875))

(declare-fun m!985877 () Bool)

(assert (=> b!1067733 m!985877))

(declare-fun m!985879 () Bool)

(assert (=> b!1067730 m!985879))

(declare-fun m!985881 () Bool)

(assert (=> start!94436 m!985881))

(declare-fun m!985883 () Bool)

(assert (=> start!94436 m!985883))

(declare-fun m!985885 () Bool)

(assert (=> start!94436 m!985885))

(declare-fun m!985887 () Bool)

(assert (=> mapNonEmpty!40063 m!985887))

(declare-fun m!985889 () Bool)

(assert (=> b!1067729 m!985889))

(declare-fun m!985891 () Bool)

(assert (=> b!1067729 m!985891))

(declare-fun m!985893 () Bool)

(assert (=> b!1067737 m!985893))

(declare-fun m!985895 () Bool)

(assert (=> b!1067737 m!985895))

(declare-fun m!985897 () Bool)

(assert (=> b!1067731 m!985897))

(check-sat (not b!1067737) tp_is_empty!25579 (not b_next!21769) (not start!94436) b_and!34535 (not b!1067731) (not mapNonEmpty!40063) (not b!1067729) (not b!1067730) (not b!1067733))
(check-sat b_and!34535 (not b_next!21769))
