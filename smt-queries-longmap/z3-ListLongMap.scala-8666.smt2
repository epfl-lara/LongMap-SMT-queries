; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105582 () Bool)

(assert start!105582)

(declare-fun b_free!27031 () Bool)

(declare-fun b_next!27031 () Bool)

(assert (=> start!105582 (= b_free!27031 (not b_next!27031))))

(declare-fun tp!94604 () Bool)

(declare-fun b_and!44871 () Bool)

(assert (=> start!105582 (= tp!94604 b_and!44871)))

(declare-fun b!1256614 () Bool)

(declare-fun e!714271 () Bool)

(declare-fun e!714273 () Bool)

(declare-fun mapRes!49681 () Bool)

(assert (=> b!1256614 (= e!714271 (and e!714273 mapRes!49681))))

(declare-fun condMapEmpty!49681 () Bool)

(declare-datatypes ((V!47943 0))(
  ( (V!47944 (val!16029 Int)) )
))
(declare-datatypes ((ValueCell!15203 0))(
  ( (ValueCellFull!15203 (v!18725 V!47943)) (EmptyCell!15203) )
))
(declare-datatypes ((array!81559 0))(
  ( (array!81560 (arr!39335 (Array (_ BitVec 32) ValueCell!15203)) (size!39872 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81559)

(declare-fun mapDefault!49681 () ValueCell!15203)

(assert (=> b!1256614 (= condMapEmpty!49681 (= (arr!39335 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15203)) mapDefault!49681)))))

(declare-fun b!1256615 () Bool)

(declare-fun res!837431 () Bool)

(declare-fun e!714275 () Bool)

(assert (=> b!1256615 (=> (not res!837431) (not e!714275))))

(declare-datatypes ((array!81561 0))(
  ( (array!81562 (arr!39336 (Array (_ BitVec 32) (_ BitVec 64))) (size!39873 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81561)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81561 (_ BitVec 32)) Bool)

(assert (=> b!1256615 (= res!837431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256616 () Bool)

(declare-fun res!837429 () Bool)

(assert (=> b!1256616 (=> (not res!837429) (not e!714275))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1256616 (= res!837429 (and (= (size!39872 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39873 _keys!1118) (size!39872 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256617 () Bool)

(assert (=> b!1256617 (= e!714275 (not true))))

(declare-datatypes ((tuple2!20720 0))(
  ( (tuple2!20721 (_1!10371 (_ BitVec 64)) (_2!10371 V!47943)) )
))
(declare-datatypes ((List!27955 0))(
  ( (Nil!27952) (Cons!27951 (h!29169 tuple2!20720) (t!41432 List!27955)) )
))
(declare-datatypes ((ListLongMap!18601 0))(
  ( (ListLongMap!18602 (toList!9316 List!27955)) )
))
(declare-fun lt!568008 () ListLongMap!18601)

(declare-fun lt!568009 () ListLongMap!18601)

(assert (=> b!1256617 (= lt!568008 lt!568009)))

(declare-fun minValueAfter!43 () V!47943)

(declare-fun zeroValue!871 () V!47943)

(declare-fun minValueBefore!43 () V!47943)

(declare-datatypes ((Unit!41773 0))(
  ( (Unit!41774) )
))
(declare-fun lt!568007 () Unit!41773)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1052 (array!81561 array!81559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47943 V!47943 V!47943 V!47943 (_ BitVec 32) Int) Unit!41773)

(assert (=> b!1256617 (= lt!568007 (lemmaNoChangeToArrayThenSameMapNoExtras!1052 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5738 (array!81561 array!81559 (_ BitVec 32) (_ BitVec 32) V!47943 V!47943 (_ BitVec 32) Int) ListLongMap!18601)

(assert (=> b!1256617 (= lt!568009 (getCurrentListMapNoExtraKeys!5738 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256617 (= lt!568008 (getCurrentListMapNoExtraKeys!5738 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!837430 () Bool)

(assert (=> start!105582 (=> (not res!837430) (not e!714275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105582 (= res!837430 (validMask!0 mask!1466))))

(assert (=> start!105582 e!714275))

(assert (=> start!105582 true))

(assert (=> start!105582 tp!94604))

(declare-fun tp_is_empty!31933 () Bool)

(assert (=> start!105582 tp_is_empty!31933))

(declare-fun array_inv!30103 (array!81561) Bool)

(assert (=> start!105582 (array_inv!30103 _keys!1118)))

(declare-fun array_inv!30104 (array!81559) Bool)

(assert (=> start!105582 (and (array_inv!30104 _values!914) e!714271)))

(declare-fun b!1256618 () Bool)

(declare-fun e!714272 () Bool)

(assert (=> b!1256618 (= e!714272 tp_is_empty!31933)))

(declare-fun b!1256619 () Bool)

(assert (=> b!1256619 (= e!714273 tp_is_empty!31933)))

(declare-fun mapNonEmpty!49681 () Bool)

(declare-fun tp!94603 () Bool)

(assert (=> mapNonEmpty!49681 (= mapRes!49681 (and tp!94603 e!714272))))

(declare-fun mapValue!49681 () ValueCell!15203)

(declare-fun mapRest!49681 () (Array (_ BitVec 32) ValueCell!15203))

(declare-fun mapKey!49681 () (_ BitVec 32))

(assert (=> mapNonEmpty!49681 (= (arr!39335 _values!914) (store mapRest!49681 mapKey!49681 mapValue!49681))))

(declare-fun b!1256620 () Bool)

(declare-fun res!837428 () Bool)

(assert (=> b!1256620 (=> (not res!837428) (not e!714275))))

(declare-datatypes ((List!27956 0))(
  ( (Nil!27953) (Cons!27952 (h!29170 (_ BitVec 64)) (t!41433 List!27956)) )
))
(declare-fun arrayNoDuplicates!0 (array!81561 (_ BitVec 32) List!27956) Bool)

(assert (=> b!1256620 (= res!837428 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27953))))

(declare-fun mapIsEmpty!49681 () Bool)

(assert (=> mapIsEmpty!49681 mapRes!49681))

(assert (= (and start!105582 res!837430) b!1256616))

(assert (= (and b!1256616 res!837429) b!1256615))

(assert (= (and b!1256615 res!837431) b!1256620))

(assert (= (and b!1256620 res!837428) b!1256617))

(assert (= (and b!1256614 condMapEmpty!49681) mapIsEmpty!49681))

(assert (= (and b!1256614 (not condMapEmpty!49681)) mapNonEmpty!49681))

(get-info :version)

(assert (= (and mapNonEmpty!49681 ((_ is ValueCellFull!15203) mapValue!49681)) b!1256618))

(assert (= (and b!1256614 ((_ is ValueCellFull!15203) mapDefault!49681)) b!1256619))

(assert (= start!105582 b!1256614))

(declare-fun m!1157679 () Bool)

(assert (=> b!1256617 m!1157679))

(declare-fun m!1157681 () Bool)

(assert (=> b!1256617 m!1157681))

(declare-fun m!1157683 () Bool)

(assert (=> b!1256617 m!1157683))

(declare-fun m!1157685 () Bool)

(assert (=> start!105582 m!1157685))

(declare-fun m!1157687 () Bool)

(assert (=> start!105582 m!1157687))

(declare-fun m!1157689 () Bool)

(assert (=> start!105582 m!1157689))

(declare-fun m!1157691 () Bool)

(assert (=> b!1256620 m!1157691))

(declare-fun m!1157693 () Bool)

(assert (=> mapNonEmpty!49681 m!1157693))

(declare-fun m!1157695 () Bool)

(assert (=> b!1256615 m!1157695))

(check-sat (not b!1256617) (not mapNonEmpty!49681) (not b_next!27031) (not b!1256615) b_and!44871 (not b!1256620) tp_is_empty!31933 (not start!105582))
(check-sat b_and!44871 (not b_next!27031))
