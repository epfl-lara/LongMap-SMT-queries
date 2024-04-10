; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105248 () Bool)

(assert start!105248)

(declare-fun b_free!26943 () Bool)

(declare-fun b_next!26943 () Bool)

(assert (=> start!105248 (= b_free!26943 (not b_next!26943))))

(declare-fun tp!94337 () Bool)

(declare-fun b_and!44769 () Bool)

(assert (=> start!105248 (= tp!94337 b_and!44769)))

(declare-fun b!1254125 () Bool)

(declare-fun e!712571 () Bool)

(declare-fun tp_is_empty!31845 () Bool)

(assert (=> b!1254125 (= e!712571 tp_is_empty!31845)))

(declare-fun mapIsEmpty!49546 () Bool)

(declare-fun mapRes!49546 () Bool)

(assert (=> mapIsEmpty!49546 mapRes!49546))

(declare-fun b!1254126 () Bool)

(declare-fun res!836224 () Bool)

(declare-fun e!712573 () Bool)

(assert (=> b!1254126 (=> (not res!836224) (not e!712573))))

(declare-datatypes ((array!81348 0))(
  ( (array!81349 (arr!39235 (Array (_ BitVec 32) (_ BitVec 64))) (size!39771 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81348)

(declare-datatypes ((List!27863 0))(
  ( (Nil!27860) (Cons!27859 (h!29068 (_ BitVec 64)) (t!41346 List!27863)) )
))
(declare-fun arrayNoDuplicates!0 (array!81348 (_ BitVec 32) List!27863) Bool)

(assert (=> b!1254126 (= res!836224 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27860))))

(declare-fun res!836222 () Bool)

(assert (=> start!105248 (=> (not res!836222) (not e!712573))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105248 (= res!836222 (validMask!0 mask!1466))))

(assert (=> start!105248 e!712573))

(assert (=> start!105248 true))

(assert (=> start!105248 tp!94337))

(assert (=> start!105248 tp_is_empty!31845))

(declare-fun array_inv!29911 (array!81348) Bool)

(assert (=> start!105248 (array_inv!29911 _keys!1118)))

(declare-datatypes ((V!47825 0))(
  ( (V!47826 (val!15985 Int)) )
))
(declare-datatypes ((ValueCell!15159 0))(
  ( (ValueCellFull!15159 (v!18684 V!47825)) (EmptyCell!15159) )
))
(declare-datatypes ((array!81350 0))(
  ( (array!81351 (arr!39236 (Array (_ BitVec 32) ValueCell!15159)) (size!39772 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81350)

(declare-fun e!712569 () Bool)

(declare-fun array_inv!29912 (array!81350) Bool)

(assert (=> start!105248 (and (array_inv!29912 _values!914) e!712569)))

(declare-fun b!1254127 () Bool)

(declare-fun e!712570 () Bool)

(assert (=> b!1254127 (= e!712570 true)))

(declare-datatypes ((tuple2!20636 0))(
  ( (tuple2!20637 (_1!10329 (_ BitVec 64)) (_2!10329 V!47825)) )
))
(declare-datatypes ((List!27864 0))(
  ( (Nil!27861) (Cons!27860 (h!29069 tuple2!20636) (t!41347 List!27864)) )
))
(declare-datatypes ((ListLongMap!18509 0))(
  ( (ListLongMap!18510 (toList!9270 List!27864)) )
))
(declare-fun lt!566610 () ListLongMap!18509)

(declare-fun lt!566613 () ListLongMap!18509)

(declare-fun -!2043 (ListLongMap!18509 (_ BitVec 64)) ListLongMap!18509)

(assert (=> b!1254127 (= lt!566610 (-!2043 lt!566613 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566609 () ListLongMap!18509)

(declare-fun lt!566614 () ListLongMap!18509)

(assert (=> b!1254127 (= (-!2043 lt!566609 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566614)))

(declare-datatypes ((Unit!41724 0))(
  ( (Unit!41725) )
))
(declare-fun lt!566615 () Unit!41724)

(declare-fun minValueBefore!43 () V!47825)

(declare-fun addThenRemoveForNewKeyIsSame!313 (ListLongMap!18509 (_ BitVec 64) V!47825) Unit!41724)

(assert (=> b!1254127 (= lt!566615 (addThenRemoveForNewKeyIsSame!313 lt!566614 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566612 () ListLongMap!18509)

(declare-fun lt!566611 () ListLongMap!18509)

(assert (=> b!1254127 (and (= lt!566613 lt!566609) (= lt!566612 lt!566611))))

(declare-fun +!4166 (ListLongMap!18509 tuple2!20636) ListLongMap!18509)

(assert (=> b!1254127 (= lt!566609 (+!4166 lt!566614 (tuple2!20637 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47825)

(declare-fun minValueAfter!43 () V!47825)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMap!4514 (array!81348 array!81350 (_ BitVec 32) (_ BitVec 32) V!47825 V!47825 (_ BitVec 32) Int) ListLongMap!18509)

(assert (=> b!1254127 (= lt!566612 (getCurrentListMap!4514 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254127 (= lt!566613 (getCurrentListMap!4514 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254128 () Bool)

(declare-fun res!836223 () Bool)

(assert (=> b!1254128 (=> (not res!836223) (not e!712573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81348 (_ BitVec 32)) Bool)

(assert (=> b!1254128 (= res!836223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254129 () Bool)

(declare-fun e!712572 () Bool)

(assert (=> b!1254129 (= e!712572 tp_is_empty!31845)))

(declare-fun b!1254130 () Bool)

(assert (=> b!1254130 (= e!712569 (and e!712571 mapRes!49546))))

(declare-fun condMapEmpty!49546 () Bool)

(declare-fun mapDefault!49546 () ValueCell!15159)

(assert (=> b!1254130 (= condMapEmpty!49546 (= (arr!39236 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15159)) mapDefault!49546)))))

(declare-fun mapNonEmpty!49546 () Bool)

(declare-fun tp!94336 () Bool)

(assert (=> mapNonEmpty!49546 (= mapRes!49546 (and tp!94336 e!712572))))

(declare-fun mapRest!49546 () (Array (_ BitVec 32) ValueCell!15159))

(declare-fun mapKey!49546 () (_ BitVec 32))

(declare-fun mapValue!49546 () ValueCell!15159)

(assert (=> mapNonEmpty!49546 (= (arr!39236 _values!914) (store mapRest!49546 mapKey!49546 mapValue!49546))))

(declare-fun b!1254131 () Bool)

(assert (=> b!1254131 (= e!712573 (not e!712570))))

(declare-fun res!836225 () Bool)

(assert (=> b!1254131 (=> res!836225 e!712570)))

(assert (=> b!1254131 (= res!836225 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254131 (= lt!566614 lt!566611)))

(declare-fun lt!566616 () Unit!41724)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1022 (array!81348 array!81350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47825 V!47825 V!47825 V!47825 (_ BitVec 32) Int) Unit!41724)

(assert (=> b!1254131 (= lt!566616 (lemmaNoChangeToArrayThenSameMapNoExtras!1022 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5658 (array!81348 array!81350 (_ BitVec 32) (_ BitVec 32) V!47825 V!47825 (_ BitVec 32) Int) ListLongMap!18509)

(assert (=> b!1254131 (= lt!566611 (getCurrentListMapNoExtraKeys!5658 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254131 (= lt!566614 (getCurrentListMapNoExtraKeys!5658 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254132 () Bool)

(declare-fun res!836226 () Bool)

(assert (=> b!1254132 (=> (not res!836226) (not e!712573))))

(assert (=> b!1254132 (= res!836226 (and (= (size!39772 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39771 _keys!1118) (size!39772 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105248 res!836222) b!1254132))

(assert (= (and b!1254132 res!836226) b!1254128))

(assert (= (and b!1254128 res!836223) b!1254126))

(assert (= (and b!1254126 res!836224) b!1254131))

(assert (= (and b!1254131 (not res!836225)) b!1254127))

(assert (= (and b!1254130 condMapEmpty!49546) mapIsEmpty!49546))

(assert (= (and b!1254130 (not condMapEmpty!49546)) mapNonEmpty!49546))

(get-info :version)

(assert (= (and mapNonEmpty!49546 ((_ is ValueCellFull!15159) mapValue!49546)) b!1254129))

(assert (= (and b!1254130 ((_ is ValueCellFull!15159) mapDefault!49546)) b!1254125))

(assert (= start!105248 b!1254130))

(declare-fun m!1154779 () Bool)

(assert (=> start!105248 m!1154779))

(declare-fun m!1154781 () Bool)

(assert (=> start!105248 m!1154781))

(declare-fun m!1154783 () Bool)

(assert (=> start!105248 m!1154783))

(declare-fun m!1154785 () Bool)

(assert (=> b!1254131 m!1154785))

(declare-fun m!1154787 () Bool)

(assert (=> b!1254131 m!1154787))

(declare-fun m!1154789 () Bool)

(assert (=> b!1254131 m!1154789))

(declare-fun m!1154791 () Bool)

(assert (=> b!1254127 m!1154791))

(declare-fun m!1154793 () Bool)

(assert (=> b!1254127 m!1154793))

(declare-fun m!1154795 () Bool)

(assert (=> b!1254127 m!1154795))

(declare-fun m!1154797 () Bool)

(assert (=> b!1254127 m!1154797))

(declare-fun m!1154799 () Bool)

(assert (=> b!1254127 m!1154799))

(declare-fun m!1154801 () Bool)

(assert (=> b!1254127 m!1154801))

(declare-fun m!1154803 () Bool)

(assert (=> b!1254128 m!1154803))

(declare-fun m!1154805 () Bool)

(assert (=> b!1254126 m!1154805))

(declare-fun m!1154807 () Bool)

(assert (=> mapNonEmpty!49546 m!1154807))

(check-sat tp_is_empty!31845 (not mapNonEmpty!49546) (not b!1254126) (not b!1254128) (not b!1254131) (not start!105248) b_and!44769 (not b_next!26943) (not b!1254127))
(check-sat b_and!44769 (not b_next!26943))
