; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94134 () Bool)

(assert start!94134)

(declare-fun b_free!21541 () Bool)

(declare-fun b_next!21541 () Bool)

(assert (=> start!94134 (= b_free!21541 (not b_next!21541))))

(declare-fun tp!76058 () Bool)

(declare-fun b_and!34265 () Bool)

(assert (=> start!94134 (= tp!76058 b_and!34265)))

(declare-fun b!1064435 () Bool)

(declare-fun e!606670 () Bool)

(declare-fun e!606672 () Bool)

(assert (=> b!1064435 (= e!606670 (not e!606672))))

(declare-fun res!710617 () Bool)

(assert (=> b!1064435 (=> res!710617 e!606672)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064435 (= res!710617 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!38937 0))(
  ( (V!38938 (val!12726 Int)) )
))
(declare-datatypes ((tuple2!16178 0))(
  ( (tuple2!16179 (_1!8100 (_ BitVec 64)) (_2!8100 V!38937)) )
))
(declare-datatypes ((List!22727 0))(
  ( (Nil!22724) (Cons!22723 (h!23932 tuple2!16178) (t!32035 List!22727)) )
))
(declare-datatypes ((ListLongMap!14147 0))(
  ( (ListLongMap!14148 (toList!7089 List!22727)) )
))
(declare-fun lt!469077 () ListLongMap!14147)

(declare-fun lt!469076 () ListLongMap!14147)

(assert (=> b!1064435 (= lt!469077 lt!469076)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38937)

(declare-datatypes ((ValueCell!11972 0))(
  ( (ValueCellFull!11972 (v!15337 V!38937)) (EmptyCell!11972) )
))
(declare-datatypes ((array!67636 0))(
  ( (array!67637 (arr!32522 (Array (_ BitVec 32) ValueCell!11972)) (size!33060 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67636)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38937)

(declare-fun minValue!907 () V!38937)

(declare-datatypes ((Unit!34769 0))(
  ( (Unit!34770) )
))
(declare-fun lt!469074 () Unit!34769)

(declare-datatypes ((array!67638 0))(
  ( (array!67639 (arr!32523 (Array (_ BitVec 32) (_ BitVec 64))) (size!33061 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67638)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!689 (array!67638 array!67636 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38937 V!38937 V!38937 V!38937 (_ BitVec 32) Int) Unit!34769)

(assert (=> b!1064435 (= lt!469074 (lemmaNoChangeToArrayThenSameMapNoExtras!689 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3695 (array!67638 array!67636 (_ BitVec 32) (_ BitVec 32) V!38937 V!38937 (_ BitVec 32) Int) ListLongMap!14147)

(assert (=> b!1064435 (= lt!469076 (getCurrentListMapNoExtraKeys!3695 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064435 (= lt!469077 (getCurrentListMapNoExtraKeys!3695 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064436 () Bool)

(declare-fun res!710616 () Bool)

(assert (=> b!1064436 (=> (not res!710616) (not e!606670))))

(declare-datatypes ((List!22728 0))(
  ( (Nil!22725) (Cons!22724 (h!23933 (_ BitVec 64)) (t!32036 List!22728)) )
))
(declare-fun arrayNoDuplicates!0 (array!67638 (_ BitVec 32) List!22728) Bool)

(assert (=> b!1064436 (= res!710616 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22725))))

(declare-fun b!1064437 () Bool)

(declare-fun res!710614 () Bool)

(assert (=> b!1064437 (=> (not res!710614) (not e!606670))))

(assert (=> b!1064437 (= res!710614 (and (= (size!33060 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33061 _keys!1163) (size!33060 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064438 () Bool)

(declare-fun e!606669 () Bool)

(declare-fun tp_is_empty!25351 () Bool)

(assert (=> b!1064438 (= e!606669 tp_is_empty!25351)))

(declare-fun mapIsEmpty!39709 () Bool)

(declare-fun mapRes!39709 () Bool)

(assert (=> mapIsEmpty!39709 mapRes!39709))

(declare-fun b!1064439 () Bool)

(declare-fun res!710615 () Bool)

(assert (=> b!1064439 (=> (not res!710615) (not e!606670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67638 (_ BitVec 32)) Bool)

(assert (=> b!1064439 (= res!710615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064440 () Bool)

(declare-fun e!606668 () Bool)

(declare-fun e!606673 () Bool)

(assert (=> b!1064440 (= e!606668 (and e!606673 mapRes!39709))))

(declare-fun condMapEmpty!39709 () Bool)

(declare-fun mapDefault!39709 () ValueCell!11972)

(assert (=> b!1064440 (= condMapEmpty!39709 (= (arr!32522 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11972)) mapDefault!39709)))))

(declare-fun b!1064441 () Bool)

(assert (=> b!1064441 (= e!606673 tp_is_empty!25351)))

(declare-fun res!710618 () Bool)

(assert (=> start!94134 (=> (not res!710618) (not e!606670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94134 (= res!710618 (validMask!0 mask!1515))))

(assert (=> start!94134 e!606670))

(assert (=> start!94134 true))

(assert (=> start!94134 tp_is_empty!25351))

(declare-fun array_inv!25186 (array!67636) Bool)

(assert (=> start!94134 (and (array_inv!25186 _values!955) e!606668)))

(assert (=> start!94134 tp!76058))

(declare-fun array_inv!25187 (array!67638) Bool)

(assert (=> start!94134 (array_inv!25187 _keys!1163)))

(declare-fun mapNonEmpty!39709 () Bool)

(declare-fun tp!76057 () Bool)

(assert (=> mapNonEmpty!39709 (= mapRes!39709 (and tp!76057 e!606669))))

(declare-fun mapValue!39709 () ValueCell!11972)

(declare-fun mapRest!39709 () (Array (_ BitVec 32) ValueCell!11972))

(declare-fun mapKey!39709 () (_ BitVec 32))

(assert (=> mapNonEmpty!39709 (= (arr!32522 _values!955) (store mapRest!39709 mapKey!39709 mapValue!39709))))

(declare-fun b!1064442 () Bool)

(assert (=> b!1064442 (= e!606672 true)))

(declare-fun lt!469075 () ListLongMap!14147)

(declare-fun getCurrentListMap!3968 (array!67638 array!67636 (_ BitVec 32) (_ BitVec 32) V!38937 V!38937 (_ BitVec 32) Int) ListLongMap!14147)

(assert (=> b!1064442 (= lt!469075 (getCurrentListMap!3968 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94134 res!710618) b!1064437))

(assert (= (and b!1064437 res!710614) b!1064439))

(assert (= (and b!1064439 res!710615) b!1064436))

(assert (= (and b!1064436 res!710616) b!1064435))

(assert (= (and b!1064435 (not res!710617)) b!1064442))

(assert (= (and b!1064440 condMapEmpty!39709) mapIsEmpty!39709))

(assert (= (and b!1064440 (not condMapEmpty!39709)) mapNonEmpty!39709))

(get-info :version)

(assert (= (and mapNonEmpty!39709 ((_ is ValueCellFull!11972) mapValue!39709)) b!1064438))

(assert (= (and b!1064440 ((_ is ValueCellFull!11972) mapDefault!39709)) b!1064441))

(assert (= start!94134 b!1064440))

(declare-fun m!982483 () Bool)

(assert (=> b!1064435 m!982483))

(declare-fun m!982485 () Bool)

(assert (=> b!1064435 m!982485))

(declare-fun m!982487 () Bool)

(assert (=> b!1064435 m!982487))

(declare-fun m!982489 () Bool)

(assert (=> b!1064436 m!982489))

(declare-fun m!982491 () Bool)

(assert (=> mapNonEmpty!39709 m!982491))

(declare-fun m!982493 () Bool)

(assert (=> b!1064442 m!982493))

(declare-fun m!982495 () Bool)

(assert (=> start!94134 m!982495))

(declare-fun m!982497 () Bool)

(assert (=> start!94134 m!982497))

(declare-fun m!982499 () Bool)

(assert (=> start!94134 m!982499))

(declare-fun m!982501 () Bool)

(assert (=> b!1064439 m!982501))

(check-sat (not b!1064436) (not start!94134) (not b!1064435) b_and!34265 (not b_next!21541) (not b!1064442) tp_is_empty!25351 (not b!1064439) (not mapNonEmpty!39709))
(check-sat b_and!34265 (not b_next!21541))
