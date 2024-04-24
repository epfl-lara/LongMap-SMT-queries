; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94754 () Bool)

(assert start!94754)

(declare-fun b_free!21823 () Bool)

(declare-fun b_next!21823 () Bool)

(assert (=> start!94754 (= b_free!21823 (not b_next!21823))))

(declare-fun tp!76919 () Bool)

(declare-fun b_and!34635 () Bool)

(assert (=> start!94754 (= tp!76919 b_and!34635)))

(declare-fun b!1070095 () Bool)

(declare-fun e!610684 () Bool)

(declare-fun tp_is_empty!25633 () Bool)

(assert (=> b!1070095 (= e!610684 tp_is_empty!25633)))

(declare-fun b!1070096 () Bool)

(declare-fun res!713674 () Bool)

(declare-fun e!610680 () Bool)

(assert (=> b!1070096 (=> (not res!713674) (not e!610680))))

(declare-datatypes ((array!68289 0))(
  ( (array!68290 (arr!32837 (Array (_ BitVec 32) (_ BitVec 64))) (size!33374 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68289)

(declare-datatypes ((List!22890 0))(
  ( (Nil!22887) (Cons!22886 (h!24104 (_ BitVec 64)) (t!32209 List!22890)) )
))
(declare-fun arrayNoDuplicates!0 (array!68289 (_ BitVec 32) List!22890) Bool)

(assert (=> b!1070096 (= res!713674 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22887))))

(declare-fun res!713672 () Bool)

(assert (=> start!94754 (=> (not res!713672) (not e!610680))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94754 (= res!713672 (validMask!0 mask!1515))))

(assert (=> start!94754 e!610680))

(assert (=> start!94754 true))

(assert (=> start!94754 tp_is_empty!25633))

(declare-datatypes ((V!39313 0))(
  ( (V!39314 (val!12867 Int)) )
))
(declare-datatypes ((ValueCell!12113 0))(
  ( (ValueCellFull!12113 (v!15478 V!39313)) (EmptyCell!12113) )
))
(declare-datatypes ((array!68291 0))(
  ( (array!68292 (arr!32838 (Array (_ BitVec 32) ValueCell!12113)) (size!33375 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68291)

(declare-fun e!610682 () Bool)

(declare-fun array_inv!25436 (array!68291) Bool)

(assert (=> start!94754 (and (array_inv!25436 _values!955) e!610682)))

(assert (=> start!94754 tp!76919))

(declare-fun array_inv!25437 (array!68289) Bool)

(assert (=> start!94754 (array_inv!25437 _keys!1163)))

(declare-fun b!1070097 () Bool)

(declare-fun e!610683 () Bool)

(declare-fun mapRes!40147 () Bool)

(assert (=> b!1070097 (= e!610682 (and e!610683 mapRes!40147))))

(declare-fun condMapEmpty!40147 () Bool)

(declare-fun mapDefault!40147 () ValueCell!12113)

(assert (=> b!1070097 (= condMapEmpty!40147 (= (arr!32838 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12113)) mapDefault!40147)))))

(declare-fun b!1070098 () Bool)

(declare-fun e!610685 () Bool)

(declare-fun e!610681 () Bool)

(assert (=> b!1070098 (= e!610685 e!610681)))

(declare-fun res!713677 () Bool)

(assert (=> b!1070098 (=> res!713677 e!610681)))

(declare-datatypes ((tuple2!16322 0))(
  ( (tuple2!16323 (_1!8172 (_ BitVec 64)) (_2!8172 V!39313)) )
))
(declare-datatypes ((List!22891 0))(
  ( (Nil!22888) (Cons!22887 (h!24105 tuple2!16322) (t!32210 List!22891)) )
))
(declare-datatypes ((ListLongMap!14299 0))(
  ( (ListLongMap!14300 (toList!7165 List!22891)) )
))
(declare-fun lt!472725 () ListLongMap!14299)

(declare-fun contains!6326 (ListLongMap!14299 (_ BitVec 64)) Bool)

(assert (=> b!1070098 (= res!713677 (contains!6326 lt!472725 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39313)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39313)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4088 (array!68289 array!68291 (_ BitVec 32) (_ BitVec 32) V!39313 V!39313 (_ BitVec 32) Int) ListLongMap!14299)

(assert (=> b!1070098 (= lt!472725 (getCurrentListMap!4088 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40147 () Bool)

(assert (=> mapIsEmpty!40147 mapRes!40147))

(declare-fun b!1070099 () Bool)

(assert (=> b!1070099 (= e!610681 true)))

(declare-fun -!649 (ListLongMap!14299 (_ BitVec 64)) ListLongMap!14299)

(assert (=> b!1070099 (= (-!649 lt!472725 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472725)))

(declare-datatypes ((Unit!35124 0))(
  ( (Unit!35125) )
))
(declare-fun lt!472722 () Unit!35124)

(declare-fun removeNotPresentStillSame!66 (ListLongMap!14299 (_ BitVec 64)) Unit!35124)

(assert (=> b!1070099 (= lt!472722 (removeNotPresentStillSame!66 lt!472725 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1070100 () Bool)

(assert (=> b!1070100 (= e!610683 tp_is_empty!25633)))

(declare-fun mapNonEmpty!40147 () Bool)

(declare-fun tp!76918 () Bool)

(assert (=> mapNonEmpty!40147 (= mapRes!40147 (and tp!76918 e!610684))))

(declare-fun mapKey!40147 () (_ BitVec 32))

(declare-fun mapRest!40147 () (Array (_ BitVec 32) ValueCell!12113))

(declare-fun mapValue!40147 () ValueCell!12113)

(assert (=> mapNonEmpty!40147 (= (arr!32838 _values!955) (store mapRest!40147 mapKey!40147 mapValue!40147))))

(declare-fun b!1070101 () Bool)

(declare-fun res!713675 () Bool)

(assert (=> b!1070101 (=> (not res!713675) (not e!610680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68289 (_ BitVec 32)) Bool)

(assert (=> b!1070101 (= res!713675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070102 () Bool)

(declare-fun res!713673 () Bool)

(assert (=> b!1070102 (=> (not res!713673) (not e!610680))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1070102 (= res!713673 (and (= (size!33375 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33374 _keys!1163) (size!33375 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070103 () Bool)

(assert (=> b!1070103 (= e!610680 (not e!610685))))

(declare-fun res!713676 () Bool)

(assert (=> b!1070103 (=> res!713676 e!610685)))

(assert (=> b!1070103 (= res!713676 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472726 () ListLongMap!14299)

(declare-fun lt!472723 () ListLongMap!14299)

(assert (=> b!1070103 (= lt!472726 lt!472723)))

(declare-fun lt!472724 () Unit!35124)

(declare-fun zeroValueAfter!47 () V!39313)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!782 (array!68289 array!68291 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39313 V!39313 V!39313 V!39313 (_ BitVec 32) Int) Unit!35124)

(assert (=> b!1070103 (= lt!472724 (lemmaNoChangeToArrayThenSameMapNoExtras!782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3779 (array!68289 array!68291 (_ BitVec 32) (_ BitVec 32) V!39313 V!39313 (_ BitVec 32) Int) ListLongMap!14299)

(assert (=> b!1070103 (= lt!472723 (getCurrentListMapNoExtraKeys!3779 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070103 (= lt!472726 (getCurrentListMapNoExtraKeys!3779 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94754 res!713672) b!1070102))

(assert (= (and b!1070102 res!713673) b!1070101))

(assert (= (and b!1070101 res!713675) b!1070096))

(assert (= (and b!1070096 res!713674) b!1070103))

(assert (= (and b!1070103 (not res!713676)) b!1070098))

(assert (= (and b!1070098 (not res!713677)) b!1070099))

(assert (= (and b!1070097 condMapEmpty!40147) mapIsEmpty!40147))

(assert (= (and b!1070097 (not condMapEmpty!40147)) mapNonEmpty!40147))

(get-info :version)

(assert (= (and mapNonEmpty!40147 ((_ is ValueCellFull!12113) mapValue!40147)) b!1070095))

(assert (= (and b!1070097 ((_ is ValueCellFull!12113) mapDefault!40147)) b!1070100))

(assert (= start!94754 b!1070097))

(declare-fun m!988999 () Bool)

(assert (=> mapNonEmpty!40147 m!988999))

(declare-fun m!989001 () Bool)

(assert (=> b!1070098 m!989001))

(declare-fun m!989003 () Bool)

(assert (=> b!1070098 m!989003))

(declare-fun m!989005 () Bool)

(assert (=> b!1070101 m!989005))

(declare-fun m!989007 () Bool)

(assert (=> start!94754 m!989007))

(declare-fun m!989009 () Bool)

(assert (=> start!94754 m!989009))

(declare-fun m!989011 () Bool)

(assert (=> start!94754 m!989011))

(declare-fun m!989013 () Bool)

(assert (=> b!1070103 m!989013))

(declare-fun m!989015 () Bool)

(assert (=> b!1070103 m!989015))

(declare-fun m!989017 () Bool)

(assert (=> b!1070103 m!989017))

(declare-fun m!989019 () Bool)

(assert (=> b!1070099 m!989019))

(declare-fun m!989021 () Bool)

(assert (=> b!1070099 m!989021))

(declare-fun m!989023 () Bool)

(assert (=> b!1070096 m!989023))

(check-sat (not b!1070098) (not b!1070103) (not mapNonEmpty!40147) (not b_next!21823) b_and!34635 (not b!1070099) (not start!94754) (not b!1070101) (not b!1070096) tp_is_empty!25633)
(check-sat b_and!34635 (not b_next!21823))
