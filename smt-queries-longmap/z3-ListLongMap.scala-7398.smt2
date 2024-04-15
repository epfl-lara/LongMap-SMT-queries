; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94158 () Bool)

(assert start!94158)

(declare-fun b_free!21565 () Bool)

(declare-fun b_next!21565 () Bool)

(assert (=> start!94158 (= b_free!21565 (not b_next!21565))))

(declare-fun tp!76129 () Bool)

(declare-fun b_and!34289 () Bool)

(assert (=> start!94158 (= tp!76129 b_and!34289)))

(declare-fun b!1064723 () Bool)

(declare-fun res!710794 () Bool)

(declare-fun e!606885 () Bool)

(assert (=> b!1064723 (=> (not res!710794) (not e!606885))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38969 0))(
  ( (V!38970 (val!12738 Int)) )
))
(declare-datatypes ((ValueCell!11984 0))(
  ( (ValueCellFull!11984 (v!15349 V!38969)) (EmptyCell!11984) )
))
(declare-datatypes ((array!67684 0))(
  ( (array!67685 (arr!32546 (Array (_ BitVec 32) ValueCell!11984)) (size!33084 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67684)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67686 0))(
  ( (array!67687 (arr!32547 (Array (_ BitVec 32) (_ BitVec 64))) (size!33085 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67686)

(assert (=> b!1064723 (= res!710794 (and (= (size!33084 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33085 _keys!1163) (size!33084 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!710796 () Bool)

(assert (=> start!94158 (=> (not res!710796) (not e!606885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94158 (= res!710796 (validMask!0 mask!1515))))

(assert (=> start!94158 e!606885))

(assert (=> start!94158 true))

(declare-fun tp_is_empty!25375 () Bool)

(assert (=> start!94158 tp_is_empty!25375))

(declare-fun e!606886 () Bool)

(declare-fun array_inv!25202 (array!67684) Bool)

(assert (=> start!94158 (and (array_inv!25202 _values!955) e!606886)))

(assert (=> start!94158 tp!76129))

(declare-fun array_inv!25203 (array!67686) Bool)

(assert (=> start!94158 (array_inv!25203 _keys!1163)))

(declare-fun mapNonEmpty!39745 () Bool)

(declare-fun mapRes!39745 () Bool)

(declare-fun tp!76130 () Bool)

(declare-fun e!606884 () Bool)

(assert (=> mapNonEmpty!39745 (= mapRes!39745 (and tp!76130 e!606884))))

(declare-fun mapKey!39745 () (_ BitVec 32))

(declare-fun mapValue!39745 () ValueCell!11984)

(declare-fun mapRest!39745 () (Array (_ BitVec 32) ValueCell!11984))

(assert (=> mapNonEmpty!39745 (= (arr!32546 _values!955) (store mapRest!39745 mapKey!39745 mapValue!39745))))

(declare-fun b!1064724 () Bool)

(declare-fun res!710797 () Bool)

(assert (=> b!1064724 (=> (not res!710797) (not e!606885))))

(declare-datatypes ((List!22746 0))(
  ( (Nil!22743) (Cons!22742 (h!23951 (_ BitVec 64)) (t!32054 List!22746)) )
))
(declare-fun arrayNoDuplicates!0 (array!67686 (_ BitVec 32) List!22746) Bool)

(assert (=> b!1064724 (= res!710797 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22743))))

(declare-fun b!1064725 () Bool)

(declare-fun e!606888 () Bool)

(assert (=> b!1064725 (= e!606886 (and e!606888 mapRes!39745))))

(declare-fun condMapEmpty!39745 () Bool)

(declare-fun mapDefault!39745 () ValueCell!11984)

(assert (=> b!1064725 (= condMapEmpty!39745 (= (arr!32546 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11984)) mapDefault!39745)))))

(declare-fun mapIsEmpty!39745 () Bool)

(assert (=> mapIsEmpty!39745 mapRes!39745))

(declare-fun b!1064726 () Bool)

(assert (=> b!1064726 (= e!606884 tp_is_empty!25375)))

(declare-fun b!1064727 () Bool)

(declare-fun e!606887 () Bool)

(assert (=> b!1064727 (= e!606887 true)))

(declare-fun zeroValueBefore!47 () V!38969)

(declare-datatypes ((tuple2!16196 0))(
  ( (tuple2!16197 (_1!8109 (_ BitVec 64)) (_2!8109 V!38969)) )
))
(declare-datatypes ((List!22747 0))(
  ( (Nil!22744) (Cons!22743 (h!23952 tuple2!16196) (t!32055 List!22747)) )
))
(declare-datatypes ((ListLongMap!14165 0))(
  ( (ListLongMap!14166 (toList!7098 List!22747)) )
))
(declare-fun lt!469218 () ListLongMap!14165)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38969)

(declare-fun getCurrentListMap!3976 (array!67686 array!67684 (_ BitVec 32) (_ BitVec 32) V!38969 V!38969 (_ BitVec 32) Int) ListLongMap!14165)

(assert (=> b!1064727 (= lt!469218 (getCurrentListMap!3976 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064728 () Bool)

(declare-fun res!710795 () Bool)

(assert (=> b!1064728 (=> (not res!710795) (not e!606885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67686 (_ BitVec 32)) Bool)

(assert (=> b!1064728 (= res!710795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064729 () Bool)

(assert (=> b!1064729 (= e!606888 tp_is_empty!25375)))

(declare-fun b!1064730 () Bool)

(assert (=> b!1064730 (= e!606885 (not e!606887))))

(declare-fun res!710798 () Bool)

(assert (=> b!1064730 (=> res!710798 e!606887)))

(assert (=> b!1064730 (= res!710798 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469220 () ListLongMap!14165)

(declare-fun lt!469221 () ListLongMap!14165)

(assert (=> b!1064730 (= lt!469220 lt!469221)))

(declare-datatypes ((Unit!34785 0))(
  ( (Unit!34786) )
))
(declare-fun lt!469219 () Unit!34785)

(declare-fun zeroValueAfter!47 () V!38969)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!697 (array!67686 array!67684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38969 V!38969 V!38969 V!38969 (_ BitVec 32) Int) Unit!34785)

(assert (=> b!1064730 (= lt!469219 (lemmaNoChangeToArrayThenSameMapNoExtras!697 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3703 (array!67686 array!67684 (_ BitVec 32) (_ BitVec 32) V!38969 V!38969 (_ BitVec 32) Int) ListLongMap!14165)

(assert (=> b!1064730 (= lt!469221 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064730 (= lt!469220 (getCurrentListMapNoExtraKeys!3703 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94158 res!710796) b!1064723))

(assert (= (and b!1064723 res!710794) b!1064728))

(assert (= (and b!1064728 res!710795) b!1064724))

(assert (= (and b!1064724 res!710797) b!1064730))

(assert (= (and b!1064730 (not res!710798)) b!1064727))

(assert (= (and b!1064725 condMapEmpty!39745) mapIsEmpty!39745))

(assert (= (and b!1064725 (not condMapEmpty!39745)) mapNonEmpty!39745))

(get-info :version)

(assert (= (and mapNonEmpty!39745 ((_ is ValueCellFull!11984) mapValue!39745)) b!1064726))

(assert (= (and b!1064725 ((_ is ValueCellFull!11984) mapDefault!39745)) b!1064729))

(assert (= start!94158 b!1064725))

(declare-fun m!982723 () Bool)

(assert (=> b!1064728 m!982723))

(declare-fun m!982725 () Bool)

(assert (=> b!1064724 m!982725))

(declare-fun m!982727 () Bool)

(assert (=> b!1064727 m!982727))

(declare-fun m!982729 () Bool)

(assert (=> mapNonEmpty!39745 m!982729))

(declare-fun m!982731 () Bool)

(assert (=> b!1064730 m!982731))

(declare-fun m!982733 () Bool)

(assert (=> b!1064730 m!982733))

(declare-fun m!982735 () Bool)

(assert (=> b!1064730 m!982735))

(declare-fun m!982737 () Bool)

(assert (=> start!94158 m!982737))

(declare-fun m!982739 () Bool)

(assert (=> start!94158 m!982739))

(declare-fun m!982741 () Bool)

(assert (=> start!94158 m!982741))

(check-sat (not b!1064727) (not b!1064728) b_and!34289 (not start!94158) (not b!1064724) (not b_next!21565) (not b!1064730) tp_is_empty!25375 (not mapNonEmpty!39745))
(check-sat b_and!34289 (not b_next!21565))
