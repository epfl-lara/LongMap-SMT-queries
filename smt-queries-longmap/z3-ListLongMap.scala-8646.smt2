; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105418 () Bool)

(assert start!105418)

(declare-fun b_free!26911 () Bool)

(declare-fun b_next!26911 () Bool)

(assert (=> start!105418 (= b_free!26911 (not b_next!26911))))

(declare-fun tp!94238 () Bool)

(declare-fun b_and!44727 () Bool)

(assert (=> start!105418 (= tp!94238 b_and!44727)))

(declare-fun mapIsEmpty!49495 () Bool)

(declare-fun mapRes!49495 () Bool)

(assert (=> mapIsEmpty!49495 mapRes!49495))

(declare-fun b!1254862 () Bool)

(declare-fun e!713010 () Bool)

(assert (=> b!1254862 (= e!713010 true)))

(declare-datatypes ((V!47783 0))(
  ( (V!47784 (val!15969 Int)) )
))
(declare-datatypes ((tuple2!20626 0))(
  ( (tuple2!20627 (_1!10324 (_ BitVec 64)) (_2!10324 V!47783)) )
))
(declare-datatypes ((List!27865 0))(
  ( (Nil!27862) (Cons!27861 (h!29079 tuple2!20626) (t!41338 List!27865)) )
))
(declare-datatypes ((ListLongMap!18507 0))(
  ( (ListLongMap!18508 (toList!9269 List!27865)) )
))
(declare-fun lt!566575 () ListLongMap!18507)

(declare-fun lt!566571 () ListLongMap!18507)

(declare-fun -!2011 (ListLongMap!18507 (_ BitVec 64)) ListLongMap!18507)

(assert (=> b!1254862 (= lt!566575 (-!2011 lt!566571 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566578 () ListLongMap!18507)

(declare-fun lt!566576 () ListLongMap!18507)

(assert (=> b!1254862 (= (-!2011 lt!566578 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566576)))

(declare-datatypes ((Unit!41675 0))(
  ( (Unit!41676) )
))
(declare-fun lt!566572 () Unit!41675)

(declare-fun minValueBefore!43 () V!47783)

(declare-fun addThenRemoveForNewKeyIsSame!301 (ListLongMap!18507 (_ BitVec 64) V!47783) Unit!41675)

(assert (=> b!1254862 (= lt!566572 (addThenRemoveForNewKeyIsSame!301 lt!566576 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566577 () ListLongMap!18507)

(declare-fun lt!566573 () ListLongMap!18507)

(assert (=> b!1254862 (and (= lt!566571 lt!566578) (= lt!566573 lt!566577))))

(declare-fun +!4207 (ListLongMap!18507 tuple2!20626) ListLongMap!18507)

(assert (=> b!1254862 (= lt!566578 (+!4207 lt!566576 (tuple2!20627 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47783)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47783)

(declare-datatypes ((array!81327 0))(
  ( (array!81328 (arr!39221 (Array (_ BitVec 32) (_ BitVec 64))) (size!39758 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81327)

(declare-datatypes ((ValueCell!15143 0))(
  ( (ValueCellFull!15143 (v!18663 V!47783)) (EmptyCell!15143) )
))
(declare-datatypes ((array!81329 0))(
  ( (array!81330 (arr!39222 (Array (_ BitVec 32) ValueCell!15143)) (size!39759 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81329)

(declare-fun getCurrentListMap!4504 (array!81327 array!81329 (_ BitVec 32) (_ BitVec 32) V!47783 V!47783 (_ BitVec 32) Int) ListLongMap!18507)

(assert (=> b!1254862 (= lt!566573 (getCurrentListMap!4504 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254862 (= lt!566571 (getCurrentListMap!4504 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254863 () Bool)

(declare-fun res!836421 () Bool)

(declare-fun e!713013 () Bool)

(assert (=> b!1254863 (=> (not res!836421) (not e!713013))))

(assert (=> b!1254863 (= res!836421 (and (= (size!39759 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39758 _keys!1118) (size!39759 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!836422 () Bool)

(assert (=> start!105418 (=> (not res!836422) (not e!713013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105418 (= res!836422 (validMask!0 mask!1466))))

(assert (=> start!105418 e!713013))

(assert (=> start!105418 true))

(assert (=> start!105418 tp!94238))

(declare-fun tp_is_empty!31813 () Bool)

(assert (=> start!105418 tp_is_empty!31813))

(declare-fun array_inv!30015 (array!81327) Bool)

(assert (=> start!105418 (array_inv!30015 _keys!1118)))

(declare-fun e!713011 () Bool)

(declare-fun array_inv!30016 (array!81329) Bool)

(assert (=> start!105418 (and (array_inv!30016 _values!914) e!713011)))

(declare-fun b!1254864 () Bool)

(declare-fun e!713012 () Bool)

(assert (=> b!1254864 (= e!713011 (and e!713012 mapRes!49495))))

(declare-fun condMapEmpty!49495 () Bool)

(declare-fun mapDefault!49495 () ValueCell!15143)

(assert (=> b!1254864 (= condMapEmpty!49495 (= (arr!39222 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15143)) mapDefault!49495)))))

(declare-fun b!1254865 () Bool)

(assert (=> b!1254865 (= e!713012 tp_is_empty!31813)))

(declare-fun b!1254866 () Bool)

(assert (=> b!1254866 (= e!713013 (not e!713010))))

(declare-fun res!836420 () Bool)

(assert (=> b!1254866 (=> res!836420 e!713010)))

(assert (=> b!1254866 (= res!836420 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254866 (= lt!566576 lt!566577)))

(declare-fun lt!566574 () Unit!41675)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1008 (array!81327 array!81329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47783 V!47783 V!47783 V!47783 (_ BitVec 32) Int) Unit!41675)

(assert (=> b!1254866 (= lt!566574 (lemmaNoChangeToArrayThenSameMapNoExtras!1008 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5694 (array!81327 array!81329 (_ BitVec 32) (_ BitVec 32) V!47783 V!47783 (_ BitVec 32) Int) ListLongMap!18507)

(assert (=> b!1254866 (= lt!566577 (getCurrentListMapNoExtraKeys!5694 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254866 (= lt!566576 (getCurrentListMapNoExtraKeys!5694 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254867 () Bool)

(declare-fun e!713009 () Bool)

(assert (=> b!1254867 (= e!713009 tp_is_empty!31813)))

(declare-fun mapNonEmpty!49495 () Bool)

(declare-fun tp!94237 () Bool)

(assert (=> mapNonEmpty!49495 (= mapRes!49495 (and tp!94237 e!713009))))

(declare-fun mapKey!49495 () (_ BitVec 32))

(declare-fun mapValue!49495 () ValueCell!15143)

(declare-fun mapRest!49495 () (Array (_ BitVec 32) ValueCell!15143))

(assert (=> mapNonEmpty!49495 (= (arr!39222 _values!914) (store mapRest!49495 mapKey!49495 mapValue!49495))))

(declare-fun b!1254868 () Bool)

(declare-fun res!836423 () Bool)

(assert (=> b!1254868 (=> (not res!836423) (not e!713013))))

(declare-datatypes ((List!27866 0))(
  ( (Nil!27863) (Cons!27862 (h!29080 (_ BitVec 64)) (t!41339 List!27866)) )
))
(declare-fun arrayNoDuplicates!0 (array!81327 (_ BitVec 32) List!27866) Bool)

(assert (=> b!1254868 (= res!836423 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27863))))

(declare-fun b!1254869 () Bool)

(declare-fun res!836424 () Bool)

(assert (=> b!1254869 (=> (not res!836424) (not e!713013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81327 (_ BitVec 32)) Bool)

(assert (=> b!1254869 (= res!836424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105418 res!836422) b!1254863))

(assert (= (and b!1254863 res!836421) b!1254869))

(assert (= (and b!1254869 res!836424) b!1254868))

(assert (= (and b!1254868 res!836423) b!1254866))

(assert (= (and b!1254866 (not res!836420)) b!1254862))

(assert (= (and b!1254864 condMapEmpty!49495) mapIsEmpty!49495))

(assert (= (and b!1254864 (not condMapEmpty!49495)) mapNonEmpty!49495))

(get-info :version)

(assert (= (and mapNonEmpty!49495 ((_ is ValueCellFull!15143) mapValue!49495)) b!1254867))

(assert (= (and b!1254864 ((_ is ValueCellFull!15143) mapDefault!49495)) b!1254865))

(assert (= start!105418 b!1254864))

(declare-fun m!1155727 () Bool)

(assert (=> b!1254862 m!1155727))

(declare-fun m!1155729 () Bool)

(assert (=> b!1254862 m!1155729))

(declare-fun m!1155731 () Bool)

(assert (=> b!1254862 m!1155731))

(declare-fun m!1155733 () Bool)

(assert (=> b!1254862 m!1155733))

(declare-fun m!1155735 () Bool)

(assert (=> b!1254862 m!1155735))

(declare-fun m!1155737 () Bool)

(assert (=> b!1254862 m!1155737))

(declare-fun m!1155739 () Bool)

(assert (=> b!1254868 m!1155739))

(declare-fun m!1155741 () Bool)

(assert (=> mapNonEmpty!49495 m!1155741))

(declare-fun m!1155743 () Bool)

(assert (=> start!105418 m!1155743))

(declare-fun m!1155745 () Bool)

(assert (=> start!105418 m!1155745))

(declare-fun m!1155747 () Bool)

(assert (=> start!105418 m!1155747))

(declare-fun m!1155749 () Bool)

(assert (=> b!1254869 m!1155749))

(declare-fun m!1155751 () Bool)

(assert (=> b!1254866 m!1155751))

(declare-fun m!1155753 () Bool)

(assert (=> b!1254866 m!1155753))

(declare-fun m!1155755 () Bool)

(assert (=> b!1254866 m!1155755))

(check-sat (not mapNonEmpty!49495) (not start!105418) tp_is_empty!31813 b_and!44727 (not b!1254868) (not b!1254862) (not b!1254866) (not b!1254869) (not b_next!26911))
(check-sat b_and!44727 (not b_next!26911))
