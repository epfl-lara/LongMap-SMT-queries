; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94142 () Bool)

(assert start!94142)

(declare-fun b_free!21543 () Bool)

(declare-fun b_next!21543 () Bool)

(assert (=> start!94142 (= b_free!21543 (not b_next!21543))))

(declare-fun tp!76064 () Bool)

(declare-fun b_and!34293 () Bool)

(assert (=> start!94142 (= tp!76064 b_and!34293)))

(declare-fun b!1064612 () Bool)

(declare-fun e!606780 () Bool)

(declare-fun e!606779 () Bool)

(declare-fun mapRes!39712 () Bool)

(assert (=> b!1064612 (= e!606780 (and e!606779 mapRes!39712))))

(declare-fun condMapEmpty!39712 () Bool)

(declare-datatypes ((V!38939 0))(
  ( (V!38940 (val!12727 Int)) )
))
(declare-datatypes ((ValueCell!11973 0))(
  ( (ValueCellFull!11973 (v!15339 V!38939)) (EmptyCell!11973) )
))
(declare-datatypes ((array!67695 0))(
  ( (array!67696 (arr!32551 (Array (_ BitVec 32) ValueCell!11973)) (size!33087 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67695)

(declare-fun mapDefault!39712 () ValueCell!11973)

(assert (=> b!1064612 (= condMapEmpty!39712 (= (arr!32551 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11973)) mapDefault!39712)))))

(declare-fun mapIsEmpty!39712 () Bool)

(assert (=> mapIsEmpty!39712 mapRes!39712))

(declare-fun b!1064614 () Bool)

(declare-fun tp_is_empty!25353 () Bool)

(assert (=> b!1064614 (= e!606779 tp_is_empty!25353)))

(declare-fun b!1064615 () Bool)

(declare-fun e!606781 () Bool)

(declare-fun e!606784 () Bool)

(assert (=> b!1064615 (= e!606781 (not e!606784))))

(declare-fun res!710701 () Bool)

(assert (=> b!1064615 (=> res!710701 e!606784)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064615 (= res!710701 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16120 0))(
  ( (tuple2!16121 (_1!8071 (_ BitVec 64)) (_2!8071 V!38939)) )
))
(declare-datatypes ((List!22692 0))(
  ( (Nil!22689) (Cons!22688 (h!23897 tuple2!16120) (t!32009 List!22692)) )
))
(declare-datatypes ((ListLongMap!14089 0))(
  ( (ListLongMap!14090 (toList!7060 List!22692)) )
))
(declare-fun lt!469286 () ListLongMap!14089)

(declare-fun lt!469289 () ListLongMap!14089)

(assert (=> b!1064615 (= lt!469286 lt!469289)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38939)

(declare-fun minValue!907 () V!38939)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38939)

(declare-datatypes ((Unit!34918 0))(
  ( (Unit!34919) )
))
(declare-fun lt!469288 () Unit!34918)

(declare-datatypes ((array!67697 0))(
  ( (array!67698 (arr!32552 (Array (_ BitVec 32) (_ BitVec 64))) (size!33088 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67697)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!688 (array!67697 array!67695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38939 V!38939 V!38939 V!38939 (_ BitVec 32) Int) Unit!34918)

(assert (=> b!1064615 (= lt!469288 (lemmaNoChangeToArrayThenSameMapNoExtras!688 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3651 (array!67697 array!67695 (_ BitVec 32) (_ BitVec 32) V!38939 V!38939 (_ BitVec 32) Int) ListLongMap!14089)

(assert (=> b!1064615 (= lt!469289 (getCurrentListMapNoExtraKeys!3651 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064615 (= lt!469286 (getCurrentListMapNoExtraKeys!3651 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064616 () Bool)

(declare-fun e!606783 () Bool)

(assert (=> b!1064616 (= e!606783 tp_is_empty!25353)))

(declare-fun res!710702 () Bool)

(assert (=> start!94142 (=> (not res!710702) (not e!606781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94142 (= res!710702 (validMask!0 mask!1515))))

(assert (=> start!94142 e!606781))

(assert (=> start!94142 true))

(assert (=> start!94142 tp_is_empty!25353))

(declare-fun array_inv!25206 (array!67695) Bool)

(assert (=> start!94142 (and (array_inv!25206 _values!955) e!606780)))

(assert (=> start!94142 tp!76064))

(declare-fun array_inv!25207 (array!67697) Bool)

(assert (=> start!94142 (array_inv!25207 _keys!1163)))

(declare-fun b!1064613 () Bool)

(declare-fun res!710700 () Bool)

(assert (=> b!1064613 (=> (not res!710700) (not e!606781))))

(declare-datatypes ((List!22693 0))(
  ( (Nil!22690) (Cons!22689 (h!23898 (_ BitVec 64)) (t!32010 List!22693)) )
))
(declare-fun arrayNoDuplicates!0 (array!67697 (_ BitVec 32) List!22693) Bool)

(assert (=> b!1064613 (= res!710700 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22690))))

(declare-fun mapNonEmpty!39712 () Bool)

(declare-fun tp!76063 () Bool)

(assert (=> mapNonEmpty!39712 (= mapRes!39712 (and tp!76063 e!606783))))

(declare-fun mapKey!39712 () (_ BitVec 32))

(declare-fun mapValue!39712 () ValueCell!11973)

(declare-fun mapRest!39712 () (Array (_ BitVec 32) ValueCell!11973))

(assert (=> mapNonEmpty!39712 (= (arr!32551 _values!955) (store mapRest!39712 mapKey!39712 mapValue!39712))))

(declare-fun b!1064617 () Bool)

(declare-fun res!710699 () Bool)

(assert (=> b!1064617 (=> (not res!710699) (not e!606781))))

(assert (=> b!1064617 (= res!710699 (and (= (size!33087 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33088 _keys!1163) (size!33087 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064618 () Bool)

(declare-fun res!710698 () Bool)

(assert (=> b!1064618 (=> (not res!710698) (not e!606781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67697 (_ BitVec 32)) Bool)

(assert (=> b!1064618 (= res!710698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064619 () Bool)

(assert (=> b!1064619 (= e!606784 true)))

(declare-fun lt!469287 () ListLongMap!14089)

(declare-fun getCurrentListMap!4020 (array!67697 array!67695 (_ BitVec 32) (_ BitVec 32) V!38939 V!38939 (_ BitVec 32) Int) ListLongMap!14089)

(assert (=> b!1064619 (= lt!469287 (getCurrentListMap!4020 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94142 res!710702) b!1064617))

(assert (= (and b!1064617 res!710699) b!1064618))

(assert (= (and b!1064618 res!710698) b!1064613))

(assert (= (and b!1064613 res!710700) b!1064615))

(assert (= (and b!1064615 (not res!710701)) b!1064619))

(assert (= (and b!1064612 condMapEmpty!39712) mapIsEmpty!39712))

(assert (= (and b!1064612 (not condMapEmpty!39712)) mapNonEmpty!39712))

(get-info :version)

(assert (= (and mapNonEmpty!39712 ((_ is ValueCellFull!11973) mapValue!39712)) b!1064616))

(assert (= (and b!1064612 ((_ is ValueCellFull!11973) mapDefault!39712)) b!1064614))

(assert (= start!94142 b!1064612))

(declare-fun m!983129 () Bool)

(assert (=> b!1064619 m!983129))

(declare-fun m!983131 () Bool)

(assert (=> b!1064615 m!983131))

(declare-fun m!983133 () Bool)

(assert (=> b!1064615 m!983133))

(declare-fun m!983135 () Bool)

(assert (=> b!1064615 m!983135))

(declare-fun m!983137 () Bool)

(assert (=> b!1064613 m!983137))

(declare-fun m!983139 () Bool)

(assert (=> start!94142 m!983139))

(declare-fun m!983141 () Bool)

(assert (=> start!94142 m!983141))

(declare-fun m!983143 () Bool)

(assert (=> start!94142 m!983143))

(declare-fun m!983145 () Bool)

(assert (=> mapNonEmpty!39712 m!983145))

(declare-fun m!983147 () Bool)

(assert (=> b!1064618 m!983147))

(check-sat (not b_next!21543) (not b!1064618) (not mapNonEmpty!39712) (not b!1064613) (not start!94142) (not b!1064619) tp_is_empty!25353 (not b!1064615) b_and!34293)
(check-sat b_and!34293 (not b_next!21543))
