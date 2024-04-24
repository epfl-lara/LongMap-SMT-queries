; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94302 () Bool)

(assert start!94302)

(declare-fun b_free!21481 () Bool)

(declare-fun b_next!21481 () Bool)

(assert (=> start!94302 (= b_free!21481 (not b_next!21481))))

(declare-fun tp!75874 () Bool)

(declare-fun b_and!34233 () Bool)

(assert (=> start!94302 (= tp!75874 b_and!34233)))

(declare-fun b!1065171 () Bool)

(declare-fun res!710788 () Bool)

(declare-fun e!607086 () Bool)

(assert (=> b!1065171 (=> (not res!710788) (not e!607086))))

(declare-datatypes ((array!67627 0))(
  ( (array!67628 (arr!32512 (Array (_ BitVec 32) (_ BitVec 64))) (size!33049 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67627)

(declare-datatypes ((List!22639 0))(
  ( (Nil!22636) (Cons!22635 (h!23853 (_ BitVec 64)) (t!31946 List!22639)) )
))
(declare-fun arrayNoDuplicates!0 (array!67627 (_ BitVec 32) List!22639) Bool)

(assert (=> b!1065171 (= res!710788 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22636))))

(declare-fun b!1065172 () Bool)

(declare-fun e!607085 () Bool)

(declare-fun e!607082 () Bool)

(declare-fun mapRes!39616 () Bool)

(assert (=> b!1065172 (= e!607085 (and e!607082 mapRes!39616))))

(declare-fun condMapEmpty!39616 () Bool)

(declare-datatypes ((V!38857 0))(
  ( (V!38858 (val!12696 Int)) )
))
(declare-datatypes ((ValueCell!11942 0))(
  ( (ValueCellFull!11942 (v!15304 V!38857)) (EmptyCell!11942) )
))
(declare-datatypes ((array!67629 0))(
  ( (array!67630 (arr!32513 (Array (_ BitVec 32) ValueCell!11942)) (size!33050 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67629)

(declare-fun mapDefault!39616 () ValueCell!11942)

(assert (=> b!1065172 (= condMapEmpty!39616 (= (arr!32513 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11942)) mapDefault!39616)))))

(declare-fun b!1065173 () Bool)

(declare-fun tp_is_empty!25291 () Bool)

(assert (=> b!1065173 (= e!607082 tp_is_empty!25291)))

(declare-fun b!1065174 () Bool)

(declare-fun e!607084 () Bool)

(assert (=> b!1065174 (= e!607084 tp_is_empty!25291)))

(declare-fun b!1065175 () Bool)

(declare-fun res!710787 () Bool)

(assert (=> b!1065175 (=> (not res!710787) (not e!607086))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065175 (= res!710787 (and (= (size!33050 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33049 _keys!1163) (size!33050 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065176 () Bool)

(declare-fun res!710785 () Bool)

(assert (=> b!1065176 (=> (not res!710785) (not e!607086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67627 (_ BitVec 32)) Bool)

(assert (=> b!1065176 (= res!710785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39616 () Bool)

(declare-fun tp!75875 () Bool)

(assert (=> mapNonEmpty!39616 (= mapRes!39616 (and tp!75875 e!607084))))

(declare-fun mapKey!39616 () (_ BitVec 32))

(declare-fun mapValue!39616 () ValueCell!11942)

(declare-fun mapRest!39616 () (Array (_ BitVec 32) ValueCell!11942))

(assert (=> mapNonEmpty!39616 (= (arr!32513 _values!955) (store mapRest!39616 mapKey!39616 mapValue!39616))))

(declare-fun b!1065177 () Bool)

(assert (=> b!1065177 (= e!607086 (not true))))

(declare-datatypes ((tuple2!16066 0))(
  ( (tuple2!16067 (_1!8044 (_ BitVec 64)) (_2!8044 V!38857)) )
))
(declare-datatypes ((List!22640 0))(
  ( (Nil!22637) (Cons!22636 (h!23854 tuple2!16066) (t!31947 List!22640)) )
))
(declare-datatypes ((ListLongMap!14043 0))(
  ( (ListLongMap!14044 (toList!7037 List!22640)) )
))
(declare-fun lt!469452 () ListLongMap!14043)

(declare-fun lt!469451 () ListLongMap!14043)

(assert (=> b!1065177 (= lt!469452 lt!469451)))

(declare-fun zeroValueBefore!47 () V!38857)

(declare-datatypes ((Unit!34877 0))(
  ( (Unit!34878) )
))
(declare-fun lt!469450 () Unit!34877)

(declare-fun minValue!907 () V!38857)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38857)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!674 (array!67627 array!67629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38857 V!38857 V!38857 V!38857 (_ BitVec 32) Int) Unit!34877)

(assert (=> b!1065177 (= lt!469450 (lemmaNoChangeToArrayThenSameMapNoExtras!674 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3671 (array!67627 array!67629 (_ BitVec 32) (_ BitVec 32) V!38857 V!38857 (_ BitVec 32) Int) ListLongMap!14043)

(assert (=> b!1065177 (= lt!469451 (getCurrentListMapNoExtraKeys!3671 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065177 (= lt!469452 (getCurrentListMapNoExtraKeys!3671 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39616 () Bool)

(assert (=> mapIsEmpty!39616 mapRes!39616))

(declare-fun res!710786 () Bool)

(assert (=> start!94302 (=> (not res!710786) (not e!607086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94302 (= res!710786 (validMask!0 mask!1515))))

(assert (=> start!94302 e!607086))

(assert (=> start!94302 true))

(assert (=> start!94302 tp_is_empty!25291))

(declare-fun array_inv!25200 (array!67629) Bool)

(assert (=> start!94302 (and (array_inv!25200 _values!955) e!607085)))

(assert (=> start!94302 tp!75874))

(declare-fun array_inv!25201 (array!67627) Bool)

(assert (=> start!94302 (array_inv!25201 _keys!1163)))

(assert (= (and start!94302 res!710786) b!1065175))

(assert (= (and b!1065175 res!710787) b!1065176))

(assert (= (and b!1065176 res!710785) b!1065171))

(assert (= (and b!1065171 res!710788) b!1065177))

(assert (= (and b!1065172 condMapEmpty!39616) mapIsEmpty!39616))

(assert (= (and b!1065172 (not condMapEmpty!39616)) mapNonEmpty!39616))

(get-info :version)

(assert (= (and mapNonEmpty!39616 ((_ is ValueCellFull!11942) mapValue!39616)) b!1065174))

(assert (= (and b!1065172 ((_ is ValueCellFull!11942) mapDefault!39616)) b!1065173))

(assert (= start!94302 b!1065172))

(declare-fun m!984157 () Bool)

(assert (=> start!94302 m!984157))

(declare-fun m!984159 () Bool)

(assert (=> start!94302 m!984159))

(declare-fun m!984161 () Bool)

(assert (=> start!94302 m!984161))

(declare-fun m!984163 () Bool)

(assert (=> b!1065171 m!984163))

(declare-fun m!984165 () Bool)

(assert (=> b!1065177 m!984165))

(declare-fun m!984167 () Bool)

(assert (=> b!1065177 m!984167))

(declare-fun m!984169 () Bool)

(assert (=> b!1065177 m!984169))

(declare-fun m!984171 () Bool)

(assert (=> b!1065176 m!984171))

(declare-fun m!984173 () Bool)

(assert (=> mapNonEmpty!39616 m!984173))

(check-sat (not b!1065177) tp_is_empty!25291 (not b!1065171) (not start!94302) (not mapNonEmpty!39616) (not b!1065176) (not b_next!21481) b_and!34233)
(check-sat b_and!34233 (not b_next!21481))
