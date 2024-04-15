; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94060 () Bool)

(assert start!94060)

(declare-fun b_free!21481 () Bool)

(declare-fun b_next!21481 () Bool)

(assert (=> start!94060 (= b_free!21481 (not b_next!21481))))

(declare-fun tp!75875 () Bool)

(declare-fun b_and!34197 () Bool)

(assert (=> start!94060 (= tp!75875 b_and!34197)))

(declare-fun b!1063691 () Bool)

(declare-fun e!606135 () Bool)

(declare-fun tp_is_empty!25291 () Bool)

(assert (=> b!1063691 (= e!606135 tp_is_empty!25291)))

(declare-fun mapNonEmpty!39616 () Bool)

(declare-fun mapRes!39616 () Bool)

(declare-fun tp!75874 () Bool)

(declare-fun e!606134 () Bool)

(assert (=> mapNonEmpty!39616 (= mapRes!39616 (and tp!75874 e!606134))))

(declare-fun mapKey!39616 () (_ BitVec 32))

(declare-datatypes ((V!38857 0))(
  ( (V!38858 (val!12696 Int)) )
))
(declare-datatypes ((ValueCell!11942 0))(
  ( (ValueCellFull!11942 (v!15307 V!38857)) (EmptyCell!11942) )
))
(declare-fun mapValue!39616 () ValueCell!11942)

(declare-datatypes ((array!67522 0))(
  ( (array!67523 (arr!32466 (Array (_ BitVec 32) ValueCell!11942)) (size!33004 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67522)

(declare-fun mapRest!39616 () (Array (_ BitVec 32) ValueCell!11942))

(assert (=> mapNonEmpty!39616 (= (arr!32466 _values!955) (store mapRest!39616 mapKey!39616 mapValue!39616))))

(declare-fun b!1063692 () Bool)

(declare-fun res!710197 () Bool)

(declare-fun e!606137 () Bool)

(assert (=> b!1063692 (=> (not res!710197) (not e!606137))))

(declare-datatypes ((array!67524 0))(
  ( (array!67525 (arr!32467 (Array (_ BitVec 32) (_ BitVec 64))) (size!33005 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67524)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67524 (_ BitVec 32)) Bool)

(assert (=> b!1063692 (= res!710197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063693 () Bool)

(declare-fun e!606138 () Bool)

(assert (=> b!1063693 (= e!606138 (and e!606135 mapRes!39616))))

(declare-fun condMapEmpty!39616 () Bool)

(declare-fun mapDefault!39616 () ValueCell!11942)

(assert (=> b!1063693 (= condMapEmpty!39616 (= (arr!32466 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11942)) mapDefault!39616)))))

(declare-fun b!1063694 () Bool)

(declare-fun res!710196 () Bool)

(assert (=> b!1063694 (=> (not res!710196) (not e!606137))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063694 (= res!710196 (and (= (size!33004 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33005 _keys!1163) (size!33004 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063695 () Bool)

(declare-fun res!710194 () Bool)

(assert (=> b!1063695 (=> (not res!710194) (not e!606137))))

(declare-datatypes ((List!22687 0))(
  ( (Nil!22684) (Cons!22683 (h!23892 (_ BitVec 64)) (t!31993 List!22687)) )
))
(declare-fun arrayNoDuplicates!0 (array!67524 (_ BitVec 32) List!22687) Bool)

(assert (=> b!1063695 (= res!710194 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22684))))

(declare-fun b!1063696 () Bool)

(assert (=> b!1063696 (= e!606137 (not true))))

(declare-datatypes ((tuple2!16138 0))(
  ( (tuple2!16139 (_1!8080 (_ BitVec 64)) (_2!8080 V!38857)) )
))
(declare-datatypes ((List!22688 0))(
  ( (Nil!22685) (Cons!22684 (h!23893 tuple2!16138) (t!31994 List!22688)) )
))
(declare-datatypes ((ListLongMap!14107 0))(
  ( (ListLongMap!14108 (toList!7069 List!22688)) )
))
(declare-fun lt!468736 () ListLongMap!14107)

(declare-fun lt!468737 () ListLongMap!14107)

(assert (=> b!1063696 (= lt!468736 lt!468737)))

(declare-fun zeroValueBefore!47 () V!38857)

(declare-datatypes ((Unit!34729 0))(
  ( (Unit!34730) )
))
(declare-fun lt!468735 () Unit!34729)

(declare-fun minValue!907 () V!38857)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38857)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!669 (array!67524 array!67522 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38857 V!38857 V!38857 V!38857 (_ BitVec 32) Int) Unit!34729)

(assert (=> b!1063696 (= lt!468735 (lemmaNoChangeToArrayThenSameMapNoExtras!669 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3675 (array!67524 array!67522 (_ BitVec 32) (_ BitVec 32) V!38857 V!38857 (_ BitVec 32) Int) ListLongMap!14107)

(assert (=> b!1063696 (= lt!468737 (getCurrentListMapNoExtraKeys!3675 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063696 (= lt!468736 (getCurrentListMapNoExtraKeys!3675 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063697 () Bool)

(assert (=> b!1063697 (= e!606134 tp_is_empty!25291)))

(declare-fun res!710195 () Bool)

(assert (=> start!94060 (=> (not res!710195) (not e!606137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94060 (= res!710195 (validMask!0 mask!1515))))

(assert (=> start!94060 e!606137))

(assert (=> start!94060 true))

(assert (=> start!94060 tp_is_empty!25291))

(declare-fun array_inv!25152 (array!67522) Bool)

(assert (=> start!94060 (and (array_inv!25152 _values!955) e!606138)))

(assert (=> start!94060 tp!75875))

(declare-fun array_inv!25153 (array!67524) Bool)

(assert (=> start!94060 (array_inv!25153 _keys!1163)))

(declare-fun mapIsEmpty!39616 () Bool)

(assert (=> mapIsEmpty!39616 mapRes!39616))

(assert (= (and start!94060 res!710195) b!1063694))

(assert (= (and b!1063694 res!710196) b!1063692))

(assert (= (and b!1063692 res!710197) b!1063695))

(assert (= (and b!1063695 res!710194) b!1063696))

(assert (= (and b!1063693 condMapEmpty!39616) mapIsEmpty!39616))

(assert (= (and b!1063693 (not condMapEmpty!39616)) mapNonEmpty!39616))

(get-info :version)

(assert (= (and mapNonEmpty!39616 ((_ is ValueCellFull!11942) mapValue!39616)) b!1063697))

(assert (= (and b!1063693 ((_ is ValueCellFull!11942) mapDefault!39616)) b!1063691))

(assert (= start!94060 b!1063693))

(declare-fun m!981859 () Bool)

(assert (=> start!94060 m!981859))

(declare-fun m!981861 () Bool)

(assert (=> start!94060 m!981861))

(declare-fun m!981863 () Bool)

(assert (=> start!94060 m!981863))

(declare-fun m!981865 () Bool)

(assert (=> mapNonEmpty!39616 m!981865))

(declare-fun m!981867 () Bool)

(assert (=> b!1063696 m!981867))

(declare-fun m!981869 () Bool)

(assert (=> b!1063696 m!981869))

(declare-fun m!981871 () Bool)

(assert (=> b!1063696 m!981871))

(declare-fun m!981873 () Bool)

(assert (=> b!1063692 m!981873))

(declare-fun m!981875 () Bool)

(assert (=> b!1063695 m!981875))

(check-sat (not b!1063696) b_and!34197 (not start!94060) (not b!1063695) (not b!1063692) tp_is_empty!25291 (not b_next!21481) (not mapNonEmpty!39616))
(check-sat b_and!34197 (not b_next!21481))
