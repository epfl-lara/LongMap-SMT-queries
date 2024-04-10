; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105114 () Bool)

(assert start!105114)

(declare-fun b_free!26847 () Bool)

(declare-fun b_next!26847 () Bool)

(assert (=> start!105114 (= b_free!26847 (not b_next!26847))))

(declare-fun tp!94042 () Bool)

(declare-fun b_and!44651 () Bool)

(assert (=> start!105114 (= tp!94042 b_and!44651)))

(declare-fun b!1252632 () Bool)

(declare-fun res!835353 () Bool)

(declare-fun e!711488 () Bool)

(assert (=> b!1252632 (=> (not res!835353) (not e!711488))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((array!81160 0))(
  ( (array!81161 (arr!39143 (Array (_ BitVec 32) (_ BitVec 64))) (size!39679 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81160)

(declare-datatypes ((V!47697 0))(
  ( (V!47698 (val!15937 Int)) )
))
(declare-datatypes ((ValueCell!15111 0))(
  ( (ValueCellFull!15111 (v!18635 V!47697)) (EmptyCell!15111) )
))
(declare-datatypes ((array!81162 0))(
  ( (array!81163 (arr!39144 (Array (_ BitVec 32) ValueCell!15111)) (size!39680 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81162)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1252632 (= res!835353 (and (= (size!39680 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39679 _keys!1118) (size!39680 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252633 () Bool)

(declare-fun e!711486 () Bool)

(assert (=> b!1252633 (= e!711488 (not e!711486))))

(declare-fun res!835357 () Bool)

(assert (=> b!1252633 (=> res!835357 e!711486)))

(assert (=> b!1252633 (= res!835357 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20558 0))(
  ( (tuple2!20559 (_1!10290 (_ BitVec 64)) (_2!10290 V!47697)) )
))
(declare-datatypes ((List!27792 0))(
  ( (Nil!27789) (Cons!27788 (h!28997 tuple2!20558) (t!41271 List!27792)) )
))
(declare-datatypes ((ListLongMap!18431 0))(
  ( (ListLongMap!18432 (toList!9231 List!27792)) )
))
(declare-fun lt!565428 () ListLongMap!18431)

(declare-fun lt!565430 () ListLongMap!18431)

(assert (=> b!1252633 (= lt!565428 lt!565430)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47697)

(declare-fun zeroValue!871 () V!47697)

(declare-fun minValueBefore!43 () V!47697)

(declare-datatypes ((Unit!41651 0))(
  ( (Unit!41652) )
))
(declare-fun lt!565429 () Unit!41651)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!991 (array!81160 array!81162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47697 V!47697 V!47697 V!47697 (_ BitVec 32) Int) Unit!41651)

(assert (=> b!1252633 (= lt!565429 (lemmaNoChangeToArrayThenSameMapNoExtras!991 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5627 (array!81160 array!81162 (_ BitVec 32) (_ BitVec 32) V!47697 V!47697 (_ BitVec 32) Int) ListLongMap!18431)

(assert (=> b!1252633 (= lt!565430 (getCurrentListMapNoExtraKeys!5627 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252633 (= lt!565428 (getCurrentListMapNoExtraKeys!5627 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!835355 () Bool)

(assert (=> start!105114 (=> (not res!835355) (not e!711488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105114 (= res!835355 (validMask!0 mask!1466))))

(assert (=> start!105114 e!711488))

(assert (=> start!105114 true))

(assert (=> start!105114 tp!94042))

(declare-fun tp_is_empty!31749 () Bool)

(assert (=> start!105114 tp_is_empty!31749))

(declare-fun array_inv!29853 (array!81160) Bool)

(assert (=> start!105114 (array_inv!29853 _keys!1118)))

(declare-fun e!711483 () Bool)

(declare-fun array_inv!29854 (array!81162) Bool)

(assert (=> start!105114 (and (array_inv!29854 _values!914) e!711483)))

(declare-fun b!1252634 () Bool)

(declare-fun res!835354 () Bool)

(assert (=> b!1252634 (=> (not res!835354) (not e!711488))))

(declare-datatypes ((List!27793 0))(
  ( (Nil!27790) (Cons!27789 (h!28998 (_ BitVec 64)) (t!41272 List!27793)) )
))
(declare-fun arrayNoDuplicates!0 (array!81160 (_ BitVec 32) List!27793) Bool)

(assert (=> b!1252634 (= res!835354 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27790))))

(declare-fun mapIsEmpty!49396 () Bool)

(declare-fun mapRes!49396 () Bool)

(assert (=> mapIsEmpty!49396 mapRes!49396))

(declare-fun b!1252635 () Bool)

(assert (=> b!1252635 (= e!711486 true)))

(declare-fun lt!565427 () ListLongMap!18431)

(declare-fun getCurrentListMap!4479 (array!81160 array!81162 (_ BitVec 32) (_ BitVec 32) V!47697 V!47697 (_ BitVec 32) Int) ListLongMap!18431)

(assert (=> b!1252635 (= lt!565427 (getCurrentListMap!4479 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252636 () Bool)

(declare-fun res!835356 () Bool)

(assert (=> b!1252636 (=> (not res!835356) (not e!711488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81160 (_ BitVec 32)) Bool)

(assert (=> b!1252636 (= res!835356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252637 () Bool)

(declare-fun e!711487 () Bool)

(assert (=> b!1252637 (= e!711487 tp_is_empty!31749)))

(declare-fun mapNonEmpty!49396 () Bool)

(declare-fun tp!94043 () Bool)

(declare-fun e!711484 () Bool)

(assert (=> mapNonEmpty!49396 (= mapRes!49396 (and tp!94043 e!711484))))

(declare-fun mapValue!49396 () ValueCell!15111)

(declare-fun mapKey!49396 () (_ BitVec 32))

(declare-fun mapRest!49396 () (Array (_ BitVec 32) ValueCell!15111))

(assert (=> mapNonEmpty!49396 (= (arr!39144 _values!914) (store mapRest!49396 mapKey!49396 mapValue!49396))))

(declare-fun b!1252638 () Bool)

(assert (=> b!1252638 (= e!711484 tp_is_empty!31749)))

(declare-fun b!1252639 () Bool)

(assert (=> b!1252639 (= e!711483 (and e!711487 mapRes!49396))))

(declare-fun condMapEmpty!49396 () Bool)

(declare-fun mapDefault!49396 () ValueCell!15111)

(assert (=> b!1252639 (= condMapEmpty!49396 (= (arr!39144 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15111)) mapDefault!49396)))))

(assert (= (and start!105114 res!835355) b!1252632))

(assert (= (and b!1252632 res!835353) b!1252636))

(assert (= (and b!1252636 res!835356) b!1252634))

(assert (= (and b!1252634 res!835354) b!1252633))

(assert (= (and b!1252633 (not res!835357)) b!1252635))

(assert (= (and b!1252639 condMapEmpty!49396) mapIsEmpty!49396))

(assert (= (and b!1252639 (not condMapEmpty!49396)) mapNonEmpty!49396))

(get-info :version)

(assert (= (and mapNonEmpty!49396 ((_ is ValueCellFull!15111) mapValue!49396)) b!1252638))

(assert (= (and b!1252639 ((_ is ValueCellFull!15111) mapDefault!49396)) b!1252637))

(assert (= start!105114 b!1252639))

(declare-fun m!1153225 () Bool)

(assert (=> b!1252633 m!1153225))

(declare-fun m!1153227 () Bool)

(assert (=> b!1252633 m!1153227))

(declare-fun m!1153229 () Bool)

(assert (=> b!1252633 m!1153229))

(declare-fun m!1153231 () Bool)

(assert (=> b!1252635 m!1153231))

(declare-fun m!1153233 () Bool)

(assert (=> mapNonEmpty!49396 m!1153233))

(declare-fun m!1153235 () Bool)

(assert (=> b!1252634 m!1153235))

(declare-fun m!1153237 () Bool)

(assert (=> start!105114 m!1153237))

(declare-fun m!1153239 () Bool)

(assert (=> start!105114 m!1153239))

(declare-fun m!1153241 () Bool)

(assert (=> start!105114 m!1153241))

(declare-fun m!1153243 () Bool)

(assert (=> b!1252636 m!1153243))

(check-sat (not b!1252633) b_and!44651 (not b_next!26847) (not b!1252634) (not mapNonEmpty!49396) (not start!105114) (not b!1252635) tp_is_empty!31749 (not b!1252636))
(check-sat b_and!44651 (not b_next!26847))
