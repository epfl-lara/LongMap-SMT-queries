; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94296 () Bool)

(assert start!94296)

(declare-fun b_free!21475 () Bool)

(declare-fun b_next!21475 () Bool)

(assert (=> start!94296 (= b_free!21475 (not b_next!21475))))

(declare-fun tp!75857 () Bool)

(declare-fun b_and!34227 () Bool)

(assert (=> start!94296 (= tp!75857 b_and!34227)))

(declare-fun b!1065108 () Bool)

(declare-fun e!607039 () Bool)

(assert (=> b!1065108 (= e!607039 (not true))))

(declare-datatypes ((V!38849 0))(
  ( (V!38850 (val!12693 Int)) )
))
(declare-datatypes ((tuple2!16062 0))(
  ( (tuple2!16063 (_1!8042 (_ BitVec 64)) (_2!8042 V!38849)) )
))
(declare-datatypes ((List!22635 0))(
  ( (Nil!22632) (Cons!22631 (h!23849 tuple2!16062) (t!31942 List!22635)) )
))
(declare-datatypes ((ListLongMap!14039 0))(
  ( (ListLongMap!14040 (toList!7035 List!22635)) )
))
(declare-fun lt!469423 () ListLongMap!14039)

(declare-fun lt!469425 () ListLongMap!14039)

(assert (=> b!1065108 (= lt!469423 lt!469425)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38849)

(declare-fun minValue!907 () V!38849)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((ValueCell!11939 0))(
  ( (ValueCellFull!11939 (v!15301 V!38849)) (EmptyCell!11939) )
))
(declare-datatypes ((array!67615 0))(
  ( (array!67616 (arr!32506 (Array (_ BitVec 32) ValueCell!11939)) (size!33043 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67615)

(declare-datatypes ((Unit!34873 0))(
  ( (Unit!34874) )
))
(declare-fun lt!469424 () Unit!34873)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38849)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67617 0))(
  ( (array!67618 (arr!32507 (Array (_ BitVec 32) (_ BitVec 64))) (size!33044 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67617)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!672 (array!67617 array!67615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38849 V!38849 V!38849 V!38849 (_ BitVec 32) Int) Unit!34873)

(assert (=> b!1065108 (= lt!469424 (lemmaNoChangeToArrayThenSameMapNoExtras!672 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3669 (array!67617 array!67615 (_ BitVec 32) (_ BitVec 32) V!38849 V!38849 (_ BitVec 32) Int) ListLongMap!14039)

(assert (=> b!1065108 (= lt!469425 (getCurrentListMapNoExtraKeys!3669 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065108 (= lt!469423 (getCurrentListMapNoExtraKeys!3669 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39607 () Bool)

(declare-fun mapRes!39607 () Bool)

(declare-fun tp!75856 () Bool)

(declare-fun e!607041 () Bool)

(assert (=> mapNonEmpty!39607 (= mapRes!39607 (and tp!75856 e!607041))))

(declare-fun mapKey!39607 () (_ BitVec 32))

(declare-fun mapValue!39607 () ValueCell!11939)

(declare-fun mapRest!39607 () (Array (_ BitVec 32) ValueCell!11939))

(assert (=> mapNonEmpty!39607 (= (arr!32506 _values!955) (store mapRest!39607 mapKey!39607 mapValue!39607))))

(declare-fun b!1065109 () Bool)

(declare-fun res!710752 () Bool)

(assert (=> b!1065109 (=> (not res!710752) (not e!607039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67617 (_ BitVec 32)) Bool)

(assert (=> b!1065109 (= res!710752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065110 () Bool)

(declare-fun res!710751 () Bool)

(assert (=> b!1065110 (=> (not res!710751) (not e!607039))))

(declare-datatypes ((List!22636 0))(
  ( (Nil!22633) (Cons!22632 (h!23850 (_ BitVec 64)) (t!31943 List!22636)) )
))
(declare-fun arrayNoDuplicates!0 (array!67617 (_ BitVec 32) List!22636) Bool)

(assert (=> b!1065110 (= res!710751 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22633))))

(declare-fun res!710749 () Bool)

(assert (=> start!94296 (=> (not res!710749) (not e!607039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94296 (= res!710749 (validMask!0 mask!1515))))

(assert (=> start!94296 e!607039))

(assert (=> start!94296 true))

(declare-fun tp_is_empty!25285 () Bool)

(assert (=> start!94296 tp_is_empty!25285))

(declare-fun e!607040 () Bool)

(declare-fun array_inv!25198 (array!67615) Bool)

(assert (=> start!94296 (and (array_inv!25198 _values!955) e!607040)))

(assert (=> start!94296 tp!75857))

(declare-fun array_inv!25199 (array!67617) Bool)

(assert (=> start!94296 (array_inv!25199 _keys!1163)))

(declare-fun mapIsEmpty!39607 () Bool)

(assert (=> mapIsEmpty!39607 mapRes!39607))

(declare-fun b!1065111 () Bool)

(assert (=> b!1065111 (= e!607041 tp_is_empty!25285)))

(declare-fun b!1065112 () Bool)

(declare-fun e!607037 () Bool)

(assert (=> b!1065112 (= e!607037 tp_is_empty!25285)))

(declare-fun b!1065113 () Bool)

(declare-fun res!710750 () Bool)

(assert (=> b!1065113 (=> (not res!710750) (not e!607039))))

(assert (=> b!1065113 (= res!710750 (and (= (size!33043 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33044 _keys!1163) (size!33043 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065114 () Bool)

(assert (=> b!1065114 (= e!607040 (and e!607037 mapRes!39607))))

(declare-fun condMapEmpty!39607 () Bool)

(declare-fun mapDefault!39607 () ValueCell!11939)

(assert (=> b!1065114 (= condMapEmpty!39607 (= (arr!32506 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11939)) mapDefault!39607)))))

(assert (= (and start!94296 res!710749) b!1065113))

(assert (= (and b!1065113 res!710750) b!1065109))

(assert (= (and b!1065109 res!710752) b!1065110))

(assert (= (and b!1065110 res!710751) b!1065108))

(assert (= (and b!1065114 condMapEmpty!39607) mapIsEmpty!39607))

(assert (= (and b!1065114 (not condMapEmpty!39607)) mapNonEmpty!39607))

(get-info :version)

(assert (= (and mapNonEmpty!39607 ((_ is ValueCellFull!11939) mapValue!39607)) b!1065111))

(assert (= (and b!1065114 ((_ is ValueCellFull!11939) mapDefault!39607)) b!1065112))

(assert (= start!94296 b!1065114))

(declare-fun m!984103 () Bool)

(assert (=> b!1065109 m!984103))

(declare-fun m!984105 () Bool)

(assert (=> mapNonEmpty!39607 m!984105))

(declare-fun m!984107 () Bool)

(assert (=> start!94296 m!984107))

(declare-fun m!984109 () Bool)

(assert (=> start!94296 m!984109))

(declare-fun m!984111 () Bool)

(assert (=> start!94296 m!984111))

(declare-fun m!984113 () Bool)

(assert (=> b!1065108 m!984113))

(declare-fun m!984115 () Bool)

(assert (=> b!1065108 m!984115))

(declare-fun m!984117 () Bool)

(assert (=> b!1065108 m!984117))

(declare-fun m!984119 () Bool)

(assert (=> b!1065110 m!984119))

(check-sat (not b!1065110) (not start!94296) (not mapNonEmpty!39607) (not b_next!21475) (not b!1065108) b_and!34227 tp_is_empty!25285 (not b!1065109))
(check-sat b_and!34227 (not b_next!21475))
