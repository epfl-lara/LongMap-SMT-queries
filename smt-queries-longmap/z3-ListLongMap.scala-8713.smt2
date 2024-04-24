; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105952 () Bool)

(assert start!105952)

(declare-fun b_free!27313 () Bool)

(declare-fun b_next!27313 () Bool)

(assert (=> start!105952 (= b_free!27313 (not b_next!27313))))

(declare-fun tp!95465 () Bool)

(declare-fun b_and!45199 () Bool)

(assert (=> start!105952 (= tp!95465 b_and!45199)))

(declare-fun b!1260751 () Bool)

(declare-fun e!717337 () Bool)

(declare-fun e!717335 () Bool)

(declare-fun mapRes!50119 () Bool)

(assert (=> b!1260751 (= e!717337 (and e!717335 mapRes!50119))))

(declare-fun condMapEmpty!50119 () Bool)

(declare-datatypes ((V!48319 0))(
  ( (V!48320 (val!16170 Int)) )
))
(declare-datatypes ((ValueCell!15344 0))(
  ( (ValueCellFull!15344 (v!18868 V!48319)) (EmptyCell!15344) )
))
(declare-datatypes ((array!82101 0))(
  ( (array!82102 (arr!39601 (Array (_ BitVec 32) ValueCell!15344)) (size!40138 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82101)

(declare-fun mapDefault!50119 () ValueCell!15344)

(assert (=> b!1260751 (= condMapEmpty!50119 (= (arr!39601 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15344)) mapDefault!50119)))))

(declare-fun mapNonEmpty!50119 () Bool)

(declare-fun tp!95464 () Bool)

(declare-fun e!717339 () Bool)

(assert (=> mapNonEmpty!50119 (= mapRes!50119 (and tp!95464 e!717339))))

(declare-fun mapValue!50119 () ValueCell!15344)

(declare-fun mapKey!50119 () (_ BitVec 32))

(declare-fun mapRest!50119 () (Array (_ BitVec 32) ValueCell!15344))

(assert (=> mapNonEmpty!50119 (= (arr!39601 _values!914) (store mapRest!50119 mapKey!50119 mapValue!50119))))

(declare-fun b!1260752 () Bool)

(declare-fun res!839909 () Bool)

(declare-fun e!717340 () Bool)

(assert (=> b!1260752 (=> (not res!839909) (not e!717340))))

(declare-datatypes ((array!82103 0))(
  ( (array!82104 (arr!39602 (Array (_ BitVec 32) (_ BitVec 64))) (size!40139 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82103)

(declare-datatypes ((List!28151 0))(
  ( (Nil!28148) (Cons!28147 (h!29365 (_ BitVec 64)) (t!41638 List!28151)) )
))
(declare-fun arrayNoDuplicates!0 (array!82103 (_ BitVec 32) List!28151) Bool)

(assert (=> b!1260752 (= res!839909 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28148))))

(declare-fun mapIsEmpty!50119 () Bool)

(assert (=> mapIsEmpty!50119 mapRes!50119))

(declare-fun res!839907 () Bool)

(assert (=> start!105952 (=> (not res!839907) (not e!717340))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105952 (= res!839907 (validMask!0 mask!1466))))

(assert (=> start!105952 e!717340))

(assert (=> start!105952 true))

(assert (=> start!105952 tp!95465))

(declare-fun tp_is_empty!32215 () Bool)

(assert (=> start!105952 tp_is_empty!32215))

(declare-fun array_inv!30297 (array!82103) Bool)

(assert (=> start!105952 (array_inv!30297 _keys!1118)))

(declare-fun array_inv!30298 (array!82101) Bool)

(assert (=> start!105952 (and (array_inv!30298 _values!914) e!717337)))

(declare-fun b!1260753 () Bool)

(assert (=> b!1260753 (= e!717335 tp_is_empty!32215)))

(declare-fun b!1260754 () Bool)

(declare-fun e!717336 () Bool)

(assert (=> b!1260754 (= e!717336 true)))

(declare-datatypes ((tuple2!20924 0))(
  ( (tuple2!20925 (_1!10473 (_ BitVec 64)) (_2!10473 V!48319)) )
))
(declare-datatypes ((List!28152 0))(
  ( (Nil!28149) (Cons!28148 (h!29366 tuple2!20924) (t!41639 List!28152)) )
))
(declare-datatypes ((ListLongMap!18805 0))(
  ( (ListLongMap!18806 (toList!9418 List!28152)) )
))
(declare-fun lt!570563 () ListLongMap!18805)

(declare-fun lt!570566 () ListLongMap!18805)

(declare-fun -!2088 (ListLongMap!18805 (_ BitVec 64)) ListLongMap!18805)

(assert (=> b!1260754 (= lt!570563 (-!2088 lt!570566 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570562 () ListLongMap!18805)

(declare-fun lt!570567 () ListLongMap!18805)

(assert (=> b!1260754 (= (-!2088 lt!570562 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570567)))

(declare-datatypes ((Unit!41972 0))(
  ( (Unit!41973) )
))
(declare-fun lt!570565 () Unit!41972)

(declare-fun minValueBefore!43 () V!48319)

(declare-fun addThenRemoveForNewKeyIsSame!342 (ListLongMap!18805 (_ BitVec 64) V!48319) Unit!41972)

(assert (=> b!1260754 (= lt!570565 (addThenRemoveForNewKeyIsSame!342 lt!570567 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717338 () Bool)

(assert (=> b!1260754 e!717338))

(declare-fun res!839911 () Bool)

(assert (=> b!1260754 (=> (not res!839911) (not e!717338))))

(assert (=> b!1260754 (= res!839911 (= lt!570566 lt!570562))))

(declare-fun +!4258 (ListLongMap!18805 tuple2!20924) ListLongMap!18805)

(assert (=> b!1260754 (= lt!570562 (+!4258 lt!570567 (tuple2!20925 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570570 () ListLongMap!18805)

(declare-fun lt!570561 () tuple2!20924)

(assert (=> b!1260754 (= lt!570567 (+!4258 lt!570570 lt!570561))))

(declare-fun zeroValue!871 () V!48319)

(assert (=> b!1260754 (= lt!570561 (tuple2!20925 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48319)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lt!570568 () ListLongMap!18805)

(declare-fun getCurrentListMap!4600 (array!82103 array!82101 (_ BitVec 32) (_ BitVec 32) V!48319 V!48319 (_ BitVec 32) Int) ListLongMap!18805)

(assert (=> b!1260754 (= lt!570568 (getCurrentListMap!4600 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260754 (= lt!570566 (getCurrentListMap!4600 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260755 () Bool)

(declare-fun res!839910 () Bool)

(assert (=> b!1260755 (=> (not res!839910) (not e!717340))))

(assert (=> b!1260755 (= res!839910 (and (= (size!40138 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40139 _keys!1118) (size!40138 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260756 () Bool)

(declare-fun res!839908 () Bool)

(assert (=> b!1260756 (=> (not res!839908) (not e!717340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82103 (_ BitVec 32)) Bool)

(assert (=> b!1260756 (= res!839908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260757 () Bool)

(assert (=> b!1260757 (= e!717340 (not e!717336))))

(declare-fun res!839906 () Bool)

(assert (=> b!1260757 (=> res!839906 e!717336)))

(assert (=> b!1260757 (= res!839906 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!570564 () ListLongMap!18805)

(assert (=> b!1260757 (= lt!570570 lt!570564)))

(declare-fun lt!570569 () Unit!41972)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1142 (array!82103 array!82101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48319 V!48319 V!48319 V!48319 (_ BitVec 32) Int) Unit!41972)

(assert (=> b!1260757 (= lt!570569 (lemmaNoChangeToArrayThenSameMapNoExtras!1142 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5828 (array!82103 array!82101 (_ BitVec 32) (_ BitVec 32) V!48319 V!48319 (_ BitVec 32) Int) ListLongMap!18805)

(assert (=> b!1260757 (= lt!570564 (getCurrentListMapNoExtraKeys!5828 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260757 (= lt!570570 (getCurrentListMapNoExtraKeys!5828 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260758 () Bool)

(assert (=> b!1260758 (= e!717339 tp_is_empty!32215)))

(declare-fun b!1260759 () Bool)

(assert (=> b!1260759 (= e!717338 (= lt!570568 (+!4258 lt!570564 lt!570561)))))

(assert (= (and start!105952 res!839907) b!1260755))

(assert (= (and b!1260755 res!839910) b!1260756))

(assert (= (and b!1260756 res!839908) b!1260752))

(assert (= (and b!1260752 res!839909) b!1260757))

(assert (= (and b!1260757 (not res!839906)) b!1260754))

(assert (= (and b!1260754 res!839911) b!1260759))

(assert (= (and b!1260751 condMapEmpty!50119) mapIsEmpty!50119))

(assert (= (and b!1260751 (not condMapEmpty!50119)) mapNonEmpty!50119))

(get-info :version)

(assert (= (and mapNonEmpty!50119 ((_ is ValueCellFull!15344) mapValue!50119)) b!1260758))

(assert (= (and b!1260751 ((_ is ValueCellFull!15344) mapDefault!50119)) b!1260753))

(assert (= start!105952 b!1260751))

(declare-fun m!1161535 () Bool)

(assert (=> b!1260756 m!1161535))

(declare-fun m!1161537 () Bool)

(assert (=> b!1260757 m!1161537))

(declare-fun m!1161539 () Bool)

(assert (=> b!1260757 m!1161539))

(declare-fun m!1161541 () Bool)

(assert (=> b!1260757 m!1161541))

(declare-fun m!1161543 () Bool)

(assert (=> mapNonEmpty!50119 m!1161543))

(declare-fun m!1161545 () Bool)

(assert (=> b!1260759 m!1161545))

(declare-fun m!1161547 () Bool)

(assert (=> start!105952 m!1161547))

(declare-fun m!1161549 () Bool)

(assert (=> start!105952 m!1161549))

(declare-fun m!1161551 () Bool)

(assert (=> start!105952 m!1161551))

(declare-fun m!1161553 () Bool)

(assert (=> b!1260754 m!1161553))

(declare-fun m!1161555 () Bool)

(assert (=> b!1260754 m!1161555))

(declare-fun m!1161557 () Bool)

(assert (=> b!1260754 m!1161557))

(declare-fun m!1161559 () Bool)

(assert (=> b!1260754 m!1161559))

(declare-fun m!1161561 () Bool)

(assert (=> b!1260754 m!1161561))

(declare-fun m!1161563 () Bool)

(assert (=> b!1260754 m!1161563))

(declare-fun m!1161565 () Bool)

(assert (=> b!1260754 m!1161565))

(declare-fun m!1161567 () Bool)

(assert (=> b!1260752 m!1161567))

(check-sat (not b!1260754) (not b!1260757) (not b!1260756) (not b!1260759) (not start!105952) b_and!45199 tp_is_empty!32215 (not mapNonEmpty!50119) (not b_next!27313) (not b!1260752))
(check-sat b_and!45199 (not b_next!27313))
