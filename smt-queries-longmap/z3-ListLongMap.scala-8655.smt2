; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105266 () Bool)

(assert start!105266)

(declare-fun b_free!26965 () Bool)

(declare-fun b_next!26965 () Bool)

(assert (=> start!105266 (= b_free!26965 (not b_next!26965))))

(declare-fun tp!94403 () Bool)

(declare-fun b_and!44773 () Bool)

(assert (=> start!105266 (= tp!94403 b_and!44773)))

(declare-fun b!1254307 () Bool)

(declare-fun e!712724 () Bool)

(declare-fun tp_is_empty!31867 () Bool)

(assert (=> b!1254307 (= e!712724 tp_is_empty!31867)))

(declare-fun b!1254308 () Bool)

(declare-fun res!836347 () Bool)

(declare-fun e!712727 () Bool)

(assert (=> b!1254308 (=> (not res!836347) (not e!712727))))

(declare-datatypes ((array!81315 0))(
  ( (array!81316 (arr!39219 (Array (_ BitVec 32) (_ BitVec 64))) (size!39757 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81315)

(declare-datatypes ((List!27948 0))(
  ( (Nil!27945) (Cons!27944 (h!29153 (_ BitVec 64)) (t!41422 List!27948)) )
))
(declare-fun arrayNoDuplicates!0 (array!81315 (_ BitVec 32) List!27948) Bool)

(assert (=> b!1254308 (= res!836347 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27945))))

(declare-fun b!1254309 () Bool)

(declare-fun res!836348 () Bool)

(assert (=> b!1254309 (=> (not res!836348) (not e!712727))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81315 (_ BitVec 32)) Bool)

(assert (=> b!1254309 (= res!836348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!836350 () Bool)

(assert (=> start!105266 (=> (not res!836350) (not e!712727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105266 (= res!836350 (validMask!0 mask!1466))))

(assert (=> start!105266 e!712727))

(assert (=> start!105266 true))

(assert (=> start!105266 tp!94403))

(assert (=> start!105266 tp_is_empty!31867))

(declare-fun array_inv!30025 (array!81315) Bool)

(assert (=> start!105266 (array_inv!30025 _keys!1118)))

(declare-datatypes ((V!47855 0))(
  ( (V!47856 (val!15996 Int)) )
))
(declare-datatypes ((ValueCell!15170 0))(
  ( (ValueCellFull!15170 (v!18694 V!47855)) (EmptyCell!15170) )
))
(declare-datatypes ((array!81317 0))(
  ( (array!81318 (arr!39220 (Array (_ BitVec 32) ValueCell!15170)) (size!39758 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81317)

(declare-fun e!712722 () Bool)

(declare-fun array_inv!30026 (array!81317) Bool)

(assert (=> start!105266 (and (array_inv!30026 _values!914) e!712722)))

(declare-fun mapIsEmpty!49579 () Bool)

(declare-fun mapRes!49579 () Bool)

(assert (=> mapIsEmpty!49579 mapRes!49579))

(declare-fun b!1254310 () Bool)

(declare-fun res!836349 () Bool)

(assert (=> b!1254310 (=> (not res!836349) (not e!712727))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1254310 (= res!836349 (and (= (size!39758 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39757 _keys!1118) (size!39758 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254311 () Bool)

(declare-fun e!712723 () Bool)

(assert (=> b!1254311 (= e!712723 true)))

(declare-datatypes ((tuple2!20738 0))(
  ( (tuple2!20739 (_1!10380 (_ BitVec 64)) (_2!10380 V!47855)) )
))
(declare-datatypes ((List!27949 0))(
  ( (Nil!27946) (Cons!27945 (h!29154 tuple2!20738) (t!41423 List!27949)) )
))
(declare-datatypes ((ListLongMap!18611 0))(
  ( (ListLongMap!18612 (toList!9321 List!27949)) )
))
(declare-fun lt!566696 () ListLongMap!18611)

(declare-fun lt!566699 () ListLongMap!18611)

(declare-fun -!2013 (ListLongMap!18611 (_ BitVec 64)) ListLongMap!18611)

(assert (=> b!1254311 (= lt!566696 (-!2013 lt!566699 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566700 () ListLongMap!18611)

(declare-fun lt!566701 () ListLongMap!18611)

(assert (=> b!1254311 (= (-!2013 lt!566700 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566701)))

(declare-datatypes ((Unit!41607 0))(
  ( (Unit!41608) )
))
(declare-fun lt!566697 () Unit!41607)

(declare-fun minValueBefore!43 () V!47855)

(declare-fun addThenRemoveForNewKeyIsSame!302 (ListLongMap!18611 (_ BitVec 64) V!47855) Unit!41607)

(assert (=> b!1254311 (= lt!566697 (addThenRemoveForNewKeyIsSame!302 lt!566701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566695 () ListLongMap!18611)

(declare-fun lt!566694 () ListLongMap!18611)

(assert (=> b!1254311 (and (= lt!566699 lt!566700) (= lt!566694 lt!566695))))

(declare-fun +!4216 (ListLongMap!18611 tuple2!20738) ListLongMap!18611)

(assert (=> b!1254311 (= lt!566700 (+!4216 lt!566701 (tuple2!20739 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47855)

(declare-fun zeroValue!871 () V!47855)

(declare-fun getCurrentListMap!4452 (array!81315 array!81317 (_ BitVec 32) (_ BitVec 32) V!47855 V!47855 (_ BitVec 32) Int) ListLongMap!18611)

(assert (=> b!1254311 (= lt!566694 (getCurrentListMap!4452 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254311 (= lt!566699 (getCurrentListMap!4452 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254312 () Bool)

(declare-fun e!712725 () Bool)

(assert (=> b!1254312 (= e!712725 tp_is_empty!31867)))

(declare-fun mapNonEmpty!49579 () Bool)

(declare-fun tp!94402 () Bool)

(assert (=> mapNonEmpty!49579 (= mapRes!49579 (and tp!94402 e!712725))))

(declare-fun mapKey!49579 () (_ BitVec 32))

(declare-fun mapRest!49579 () (Array (_ BitVec 32) ValueCell!15170))

(declare-fun mapValue!49579 () ValueCell!15170)

(assert (=> mapNonEmpty!49579 (= (arr!39220 _values!914) (store mapRest!49579 mapKey!49579 mapValue!49579))))

(declare-fun b!1254313 () Bool)

(assert (=> b!1254313 (= e!712722 (and e!712724 mapRes!49579))))

(declare-fun condMapEmpty!49579 () Bool)

(declare-fun mapDefault!49579 () ValueCell!15170)

(assert (=> b!1254313 (= condMapEmpty!49579 (= (arr!39220 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15170)) mapDefault!49579)))))

(declare-fun b!1254314 () Bool)

(assert (=> b!1254314 (= e!712727 (not e!712723))))

(declare-fun res!836351 () Bool)

(assert (=> b!1254314 (=> res!836351 e!712723)))

(assert (=> b!1254314 (= res!836351 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254314 (= lt!566701 lt!566695)))

(declare-fun lt!566698 () Unit!41607)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1040 (array!81315 array!81317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47855 V!47855 V!47855 V!47855 (_ BitVec 32) Int) Unit!41607)

(assert (=> b!1254314 (= lt!566698 (lemmaNoChangeToArrayThenSameMapNoExtras!1040 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5718 (array!81315 array!81317 (_ BitVec 32) (_ BitVec 32) V!47855 V!47855 (_ BitVec 32) Int) ListLongMap!18611)

(assert (=> b!1254314 (= lt!566695 (getCurrentListMapNoExtraKeys!5718 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254314 (= lt!566701 (getCurrentListMapNoExtraKeys!5718 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105266 res!836350) b!1254310))

(assert (= (and b!1254310 res!836349) b!1254309))

(assert (= (and b!1254309 res!836348) b!1254308))

(assert (= (and b!1254308 res!836347) b!1254314))

(assert (= (and b!1254314 (not res!836351)) b!1254311))

(assert (= (and b!1254313 condMapEmpty!49579) mapIsEmpty!49579))

(assert (= (and b!1254313 (not condMapEmpty!49579)) mapNonEmpty!49579))

(get-info :version)

(assert (= (and mapNonEmpty!49579 ((_ is ValueCellFull!15170) mapValue!49579)) b!1254312))

(assert (= (and b!1254313 ((_ is ValueCellFull!15170) mapDefault!49579)) b!1254307))

(assert (= start!105266 b!1254313))

(declare-fun m!1154589 () Bool)

(assert (=> b!1254314 m!1154589))

(declare-fun m!1154591 () Bool)

(assert (=> b!1254314 m!1154591))

(declare-fun m!1154593 () Bool)

(assert (=> b!1254314 m!1154593))

(declare-fun m!1154595 () Bool)

(assert (=> b!1254308 m!1154595))

(declare-fun m!1154597 () Bool)

(assert (=> mapNonEmpty!49579 m!1154597))

(declare-fun m!1154599 () Bool)

(assert (=> b!1254309 m!1154599))

(declare-fun m!1154601 () Bool)

(assert (=> start!105266 m!1154601))

(declare-fun m!1154603 () Bool)

(assert (=> start!105266 m!1154603))

(declare-fun m!1154605 () Bool)

(assert (=> start!105266 m!1154605))

(declare-fun m!1154607 () Bool)

(assert (=> b!1254311 m!1154607))

(declare-fun m!1154609 () Bool)

(assert (=> b!1254311 m!1154609))

(declare-fun m!1154611 () Bool)

(assert (=> b!1254311 m!1154611))

(declare-fun m!1154613 () Bool)

(assert (=> b!1254311 m!1154613))

(declare-fun m!1154615 () Bool)

(assert (=> b!1254311 m!1154615))

(declare-fun m!1154617 () Bool)

(assert (=> b!1254311 m!1154617))

(check-sat (not b!1254309) (not b_next!26965) b_and!44773 (not b!1254314) tp_is_empty!31867 (not b!1254308) (not start!105266) (not mapNonEmpty!49579) (not b!1254311))
(check-sat b_and!44773 (not b_next!26965))
