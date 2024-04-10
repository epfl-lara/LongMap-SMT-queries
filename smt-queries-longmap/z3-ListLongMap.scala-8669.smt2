; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105392 () Bool)

(assert start!105392)

(declare-fun b_free!27051 () Bool)

(declare-fun b_next!27051 () Bool)

(assert (=> start!105392 (= b_free!27051 (not b_next!27051))))

(declare-fun tp!94666 () Bool)

(declare-fun b_and!44897 () Bool)

(assert (=> start!105392 (= tp!94666 b_and!44897)))

(declare-fun b!1255609 () Bool)

(declare-fun e!713635 () Bool)

(declare-fun e!713637 () Bool)

(declare-fun mapRes!49714 () Bool)

(assert (=> b!1255609 (= e!713635 (and e!713637 mapRes!49714))))

(declare-fun condMapEmpty!49714 () Bool)

(declare-datatypes ((V!47969 0))(
  ( (V!47970 (val!16039 Int)) )
))
(declare-datatypes ((ValueCell!15213 0))(
  ( (ValueCellFull!15213 (v!18739 V!47969)) (EmptyCell!15213) )
))
(declare-datatypes ((array!81550 0))(
  ( (array!81551 (arr!39334 (Array (_ BitVec 32) ValueCell!15213)) (size!39870 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81550)

(declare-fun mapDefault!49714 () ValueCell!15213)

(assert (=> b!1255609 (= condMapEmpty!49714 (= (arr!39334 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15213)) mapDefault!49714)))))

(declare-fun b!1255610 () Bool)

(declare-fun res!837064 () Bool)

(declare-fun e!713634 () Bool)

(assert (=> b!1255610 (=> (not res!837064) (not e!713634))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81552 0))(
  ( (array!81553 (arr!39335 (Array (_ BitVec 32) (_ BitVec 64))) (size!39871 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81552)

(assert (=> b!1255610 (= res!837064 (and (= (size!39870 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39871 _keys!1118) (size!39870 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255611 () Bool)

(declare-fun e!713636 () Bool)

(assert (=> b!1255611 (= e!713636 true)))

(declare-fun defaultEntry!922 () Int)

(declare-fun lt!567658 () Bool)

(declare-fun zeroValue!871 () V!47969)

(declare-fun minValueBefore!43 () V!47969)

(declare-datatypes ((tuple2!20712 0))(
  ( (tuple2!20713 (_1!10367 (_ BitVec 64)) (_2!10367 V!47969)) )
))
(declare-datatypes ((List!27933 0))(
  ( (Nil!27930) (Cons!27929 (h!29138 tuple2!20712) (t!41420 List!27933)) )
))
(declare-datatypes ((ListLongMap!18585 0))(
  ( (ListLongMap!18586 (toList!9308 List!27933)) )
))
(declare-fun contains!7528 (ListLongMap!18585 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4534 (array!81552 array!81550 (_ BitVec 32) (_ BitVec 32) V!47969 V!47969 (_ BitVec 32) Int) ListLongMap!18585)

(assert (=> b!1255611 (= lt!567658 (contains!7528 (getCurrentListMap!4534 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1255612 () Bool)

(declare-fun res!837067 () Bool)

(assert (=> b!1255612 (=> (not res!837067) (not e!713634))))

(declare-datatypes ((List!27934 0))(
  ( (Nil!27931) (Cons!27930 (h!29139 (_ BitVec 64)) (t!41421 List!27934)) )
))
(declare-fun arrayNoDuplicates!0 (array!81552 (_ BitVec 32) List!27934) Bool)

(assert (=> b!1255612 (= res!837067 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27931))))

(declare-fun b!1255613 () Bool)

(assert (=> b!1255613 (= e!713634 (not e!713636))))

(declare-fun res!837066 () Bool)

(assert (=> b!1255613 (=> res!837066 e!713636)))

(assert (=> b!1255613 (= res!837066 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!567659 () ListLongMap!18585)

(declare-fun lt!567661 () ListLongMap!18585)

(assert (=> b!1255613 (= lt!567659 lt!567661)))

(declare-datatypes ((Unit!41802 0))(
  ( (Unit!41803) )
))
(declare-fun lt!567660 () Unit!41802)

(declare-fun minValueAfter!43 () V!47969)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1057 (array!81552 array!81550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47969 V!47969 V!47969 V!47969 (_ BitVec 32) Int) Unit!41802)

(assert (=> b!1255613 (= lt!567660 (lemmaNoChangeToArrayThenSameMapNoExtras!1057 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5693 (array!81552 array!81550 (_ BitVec 32) (_ BitVec 32) V!47969 V!47969 (_ BitVec 32) Int) ListLongMap!18585)

(assert (=> b!1255613 (= lt!567661 (getCurrentListMapNoExtraKeys!5693 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255613 (= lt!567659 (getCurrentListMapNoExtraKeys!5693 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255614 () Bool)

(declare-fun tp_is_empty!31953 () Bool)

(assert (=> b!1255614 (= e!713637 tp_is_empty!31953)))

(declare-fun b!1255615 () Bool)

(declare-fun e!713638 () Bool)

(assert (=> b!1255615 (= e!713638 tp_is_empty!31953)))

(declare-fun res!837065 () Bool)

(assert (=> start!105392 (=> (not res!837065) (not e!713634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105392 (= res!837065 (validMask!0 mask!1466))))

(assert (=> start!105392 e!713634))

(assert (=> start!105392 true))

(assert (=> start!105392 tp!94666))

(assert (=> start!105392 tp_is_empty!31953))

(declare-fun array_inv!29971 (array!81552) Bool)

(assert (=> start!105392 (array_inv!29971 _keys!1118)))

(declare-fun array_inv!29972 (array!81550) Bool)

(assert (=> start!105392 (and (array_inv!29972 _values!914) e!713635)))

(declare-fun mapIsEmpty!49714 () Bool)

(assert (=> mapIsEmpty!49714 mapRes!49714))

(declare-fun b!1255616 () Bool)

(declare-fun res!837068 () Bool)

(assert (=> b!1255616 (=> (not res!837068) (not e!713634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81552 (_ BitVec 32)) Bool)

(assert (=> b!1255616 (= res!837068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49714 () Bool)

(declare-fun tp!94667 () Bool)

(assert (=> mapNonEmpty!49714 (= mapRes!49714 (and tp!94667 e!713638))))

(declare-fun mapValue!49714 () ValueCell!15213)

(declare-fun mapRest!49714 () (Array (_ BitVec 32) ValueCell!15213))

(declare-fun mapKey!49714 () (_ BitVec 32))

(assert (=> mapNonEmpty!49714 (= (arr!39334 _values!914) (store mapRest!49714 mapKey!49714 mapValue!49714))))

(assert (= (and start!105392 res!837065) b!1255610))

(assert (= (and b!1255610 res!837064) b!1255616))

(assert (= (and b!1255616 res!837068) b!1255612))

(assert (= (and b!1255612 res!837067) b!1255613))

(assert (= (and b!1255613 (not res!837066)) b!1255611))

(assert (= (and b!1255609 condMapEmpty!49714) mapIsEmpty!49714))

(assert (= (and b!1255609 (not condMapEmpty!49714)) mapNonEmpty!49714))

(get-info :version)

(assert (= (and mapNonEmpty!49714 ((_ is ValueCellFull!15213) mapValue!49714)) b!1255615))

(assert (= (and b!1255609 ((_ is ValueCellFull!15213) mapDefault!49714)) b!1255614))

(assert (= start!105392 b!1255609))

(declare-fun m!1156317 () Bool)

(assert (=> mapNonEmpty!49714 m!1156317))

(declare-fun m!1156319 () Bool)

(assert (=> b!1255613 m!1156319))

(declare-fun m!1156321 () Bool)

(assert (=> b!1255613 m!1156321))

(declare-fun m!1156323 () Bool)

(assert (=> b!1255613 m!1156323))

(declare-fun m!1156325 () Bool)

(assert (=> start!105392 m!1156325))

(declare-fun m!1156327 () Bool)

(assert (=> start!105392 m!1156327))

(declare-fun m!1156329 () Bool)

(assert (=> start!105392 m!1156329))

(declare-fun m!1156331 () Bool)

(assert (=> b!1255612 m!1156331))

(declare-fun m!1156333 () Bool)

(assert (=> b!1255616 m!1156333))

(declare-fun m!1156335 () Bool)

(assert (=> b!1255611 m!1156335))

(assert (=> b!1255611 m!1156335))

(declare-fun m!1156337 () Bool)

(assert (=> b!1255611 m!1156337))

(check-sat b_and!44897 (not start!105392) (not b!1255613) (not b!1255616) tp_is_empty!31953 (not b_next!27051) (not b!1255612) (not b!1255611) (not mapNonEmpty!49714))
(check-sat b_and!44897 (not b_next!27051))
