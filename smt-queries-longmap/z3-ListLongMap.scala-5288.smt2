; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70920 () Bool)

(assert start!70920)

(declare-fun b_free!13137 () Bool)

(declare-fun b_next!13137 () Bool)

(assert (=> start!70920 (= b_free!13137 (not b_next!13137))))

(declare-fun tp!46162 () Bool)

(declare-fun b_and!22033 () Bool)

(assert (=> start!70920 (= tp!46162 b_and!22033)))

(declare-fun res!561653 () Bool)

(declare-fun e!458139 () Bool)

(assert (=> start!70920 (=> (not res!561653) (not e!458139))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70920 (= res!561653 (validMask!0 mask!1312))))

(assert (=> start!70920 e!458139))

(declare-fun tp_is_empty!14847 () Bool)

(assert (=> start!70920 tp_is_empty!14847))

(declare-datatypes ((array!45886 0))(
  ( (array!45887 (arr!21991 (Array (_ BitVec 32) (_ BitVec 64))) (size!22412 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45886)

(declare-fun array_inv!17553 (array!45886) Bool)

(assert (=> start!70920 (array_inv!17553 _keys!976)))

(assert (=> start!70920 true))

(declare-datatypes ((V!24797 0))(
  ( (V!24798 (val!7471 Int)) )
))
(declare-datatypes ((ValueCell!7008 0))(
  ( (ValueCellFull!7008 (v!9904 V!24797)) (EmptyCell!7008) )
))
(declare-datatypes ((array!45888 0))(
  ( (array!45889 (arr!21992 (Array (_ BitVec 32) ValueCell!7008)) (size!22413 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45888)

(declare-fun e!458142 () Bool)

(declare-fun array_inv!17554 (array!45888) Bool)

(assert (=> start!70920 (and (array_inv!17554 _values!788) e!458142)))

(assert (=> start!70920 tp!46162))

(declare-fun mapNonEmpty!23887 () Bool)

(declare-fun mapRes!23887 () Bool)

(declare-fun tp!46161 () Bool)

(declare-fun e!458143 () Bool)

(assert (=> mapNonEmpty!23887 (= mapRes!23887 (and tp!46161 e!458143))))

(declare-fun mapKey!23887 () (_ BitVec 32))

(declare-fun mapRest!23887 () (Array (_ BitVec 32) ValueCell!7008))

(declare-fun mapValue!23887 () ValueCell!7008)

(assert (=> mapNonEmpty!23887 (= (arr!21992 _values!788) (store mapRest!23887 mapKey!23887 mapValue!23887))))

(declare-fun b!823675 () Bool)

(declare-fun res!561654 () Bool)

(assert (=> b!823675 (=> (not res!561654) (not e!458139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45886 (_ BitVec 32)) Bool)

(assert (=> b!823675 (= res!561654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823676 () Bool)

(assert (=> b!823676 (= e!458143 tp_is_empty!14847)))

(declare-fun b!823677 () Bool)

(declare-fun e!458140 () Bool)

(assert (=> b!823677 (= e!458142 (and e!458140 mapRes!23887))))

(declare-fun condMapEmpty!23887 () Bool)

(declare-fun mapDefault!23887 () ValueCell!7008)

(assert (=> b!823677 (= condMapEmpty!23887 (= (arr!21992 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7008)) mapDefault!23887)))))

(declare-fun b!823678 () Bool)

(declare-fun res!561656 () Bool)

(assert (=> b!823678 (=> (not res!561656) (not e!458139))))

(declare-datatypes ((List!15692 0))(
  ( (Nil!15689) (Cons!15688 (h!16817 (_ BitVec 64)) (t!22033 List!15692)) )
))
(declare-fun arrayNoDuplicates!0 (array!45886 (_ BitVec 32) List!15692) Bool)

(assert (=> b!823678 (= res!561656 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15689))))

(declare-fun b!823679 () Bool)

(assert (=> b!823679 (= e!458140 tp_is_empty!14847)))

(declare-fun b!823680 () Bool)

(assert (=> b!823680 (= e!458139 (not true))))

(declare-datatypes ((tuple2!9880 0))(
  ( (tuple2!9881 (_1!4951 (_ BitVec 64)) (_2!4951 V!24797)) )
))
(declare-datatypes ((List!15693 0))(
  ( (Nil!15690) (Cons!15689 (h!16818 tuple2!9880) (t!22034 List!15693)) )
))
(declare-datatypes ((ListLongMap!8703 0))(
  ( (ListLongMap!8704 (toList!4367 List!15693)) )
))
(declare-fun lt!371485 () ListLongMap!8703)

(declare-fun lt!371483 () ListLongMap!8703)

(assert (=> b!823680 (= lt!371485 lt!371483)))

(declare-fun zeroValueBefore!34 () V!24797)

(declare-datatypes ((Unit!28202 0))(
  ( (Unit!28203) )
))
(declare-fun lt!371484 () Unit!28202)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24797)

(declare-fun minValue!754 () V!24797)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!492 (array!45886 array!45888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24797 V!24797 V!24797 V!24797 (_ BitVec 32) Int) Unit!28202)

(assert (=> b!823680 (= lt!371484 (lemmaNoChangeToArrayThenSameMapNoExtras!492 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2382 (array!45886 array!45888 (_ BitVec 32) (_ BitVec 32) V!24797 V!24797 (_ BitVec 32) Int) ListLongMap!8703)

(assert (=> b!823680 (= lt!371483 (getCurrentListMapNoExtraKeys!2382 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823680 (= lt!371485 (getCurrentListMapNoExtraKeys!2382 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823681 () Bool)

(declare-fun res!561655 () Bool)

(assert (=> b!823681 (=> (not res!561655) (not e!458139))))

(assert (=> b!823681 (= res!561655 (and (= (size!22413 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22412 _keys!976) (size!22413 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23887 () Bool)

(assert (=> mapIsEmpty!23887 mapRes!23887))

(assert (= (and start!70920 res!561653) b!823681))

(assert (= (and b!823681 res!561655) b!823675))

(assert (= (and b!823675 res!561654) b!823678))

(assert (= (and b!823678 res!561656) b!823680))

(assert (= (and b!823677 condMapEmpty!23887) mapIsEmpty!23887))

(assert (= (and b!823677 (not condMapEmpty!23887)) mapNonEmpty!23887))

(get-info :version)

(assert (= (and mapNonEmpty!23887 ((_ is ValueCellFull!7008) mapValue!23887)) b!823676))

(assert (= (and b!823677 ((_ is ValueCellFull!7008) mapDefault!23887)) b!823679))

(assert (= start!70920 b!823677))

(declare-fun m!765883 () Bool)

(assert (=> start!70920 m!765883))

(declare-fun m!765885 () Bool)

(assert (=> start!70920 m!765885))

(declare-fun m!765887 () Bool)

(assert (=> start!70920 m!765887))

(declare-fun m!765889 () Bool)

(assert (=> b!823675 m!765889))

(declare-fun m!765891 () Bool)

(assert (=> b!823680 m!765891))

(declare-fun m!765893 () Bool)

(assert (=> b!823680 m!765893))

(declare-fun m!765895 () Bool)

(assert (=> b!823680 m!765895))

(declare-fun m!765897 () Bool)

(assert (=> mapNonEmpty!23887 m!765897))

(declare-fun m!765899 () Bool)

(assert (=> b!823678 m!765899))

(check-sat (not b!823675) tp_is_empty!14847 (not mapNonEmpty!23887) (not b!823680) (not b!823678) (not b_next!13137) (not start!70920) b_and!22033)
(check-sat b_and!22033 (not b_next!13137))
